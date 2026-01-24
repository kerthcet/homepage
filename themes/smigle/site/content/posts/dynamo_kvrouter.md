---
author: kerthcet
title: Dynamo KVRouter
subtitle: ""
date: 2026-01-18
description: ""
categories:
  - Work
tags:
  - 2026
  - dynamo
  - ai
  - inference
---

[Dynamo](https://github.com/ai-dynamo/dynamo) is a high-throughput, low-latency inference framework in a distributed setup. Recently, I'm working on optimizing the Dynamo system, copiloted by our own product, the Hive, an evoluationary AI agent. Router is one of the key components in dynamo, especially like the KV-aware router, which seems like a good starting point to work on after talking with the Dynamo team.

### What is KV Router

The Dynamo KV Router routes requests by evaluating their computational costs across different workers. It considers both decoding costs (from active blocks) and prefill costs (from newly computed blocks). Here's the architecture diagram from dynamo website:

{{< figure src="/images/posts/kv-router.png" alt="stats" class="center-width-70-percent" >}}


### How KV Router Starts

There're several ways to launch the dynamo, either from the frontend or launch a single binary that contains both frontend and backend. Here we assume that dynamo is launched from the frontend. There're also several kinds of servers dynamo support, it could be a http server, a grpc server or others. Here we use the http server as an example.

{{< figure src="/images/posts/kv-aware-workflow.png" alt="stats" class="center-width-70-percent" >}}

The frontend is written in python. We know dynamo is mostly written in rust, but it has python bindings since python is more popular for AI users. So, if you're developing with dynamo, you may need to compile the rust code into a python package first, then  pip install from it. The command looks like below:

```bash
uv venv dynamo
source dynamo/bin/activate
cd lib/bindings/python
maturin develop --release --strip
cd $DYNAMO_HOME
uv pip install -e .
```

There're three different engines in dynamo, the `Echo` engine for testing purpose, the `Dynamic` engine for production usage, the `Mocker` engine for mocking the model behavior for benchmarking.


Then we need to build the processing pipeline, basically how to handle the requests, dynamo has a module called `ModelWatcher` to dynamically build the pipeline based on the model registrations. Different models may have different pipelines, for example, if model input is token and model type is chat, we need to have a tokenizer as the processing step before feeding into the model. But if model input is text, tokenizer is no longer needed in dynamo. Also, the dynamic is important for a distributed setup environment, that's why we need the list-and-watch mechanism.

The modelWatcher will build the routers based on the route type. In dynamo, there're several different routers, the  `PushRouter`, `KVPushRouter` and the `PrefillRouter`. Basically, this is a multi-tier routing system. The PushRouter is the basic one supports random, round-robin and direct routing. The KVPushRouter is on top of PushRouter which helps to route based on the kv-cache events. The PrefillRouter supports either basic PushRouter or KVPushRouter for prefill-decode disaggregated serving.

To discover the available workers, kvrouter will start a new watcher to monitor the worker status. And the frontend starts a http server to watch requests.

### How KV Router Works

Once a new request comes in, it will eventually call the `generate()` function in the KVPushRouter based on the prebuilt pipeline. There's a KVRouter inside the KVPushRouter, the name is really confusing here, but it only helps to find the best worker, not route the request. In the `select_worker` function, we'll loop the workers and calculate the logit for each worker based on the following formula:

{{< math >}}
logit = kvOverlapScoreWeight × potentialPrefillBlocks + potentialActiveBlocks
{{< /math >}}

Also introduce a temperature parameter to adjust the worker selection distribution. Finally, we use a softmax function to select the worker based on the calculated logits.

Once the worker is selected, the request will be forwarded to the worker via different communication protocols, it could be a HTTP, TCP or NATs. The worker will process the request and return the response back to the frontend.

### Optimization Work

One problem for the cost function is we need to adjust the weights for different cases, that's why I need the Hive to help me find better algorithms.

Some interesting ideas the Hive came up with:

- Reward the cache hit to build a concentrated kv-cache tree
- Penalize the overloaded workers to avoid bottleneck
- Adaptive weight for cost function based on the request patterns and historical data

Hopefully I can share more details about it in the future.
