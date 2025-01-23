---
author: kerthcet
title: Recap 2024
subtitle: ""
date: 2024-12-31
description: ""
categories:
  - Life
tags:
  - 2024
  - recap
---

On January 1st, 2024, I outlined three goals for the coming year,
and I would like to response to this first:

- Concentrate on AI, still continue with Kubernetes.
- Be fluent in English.
- Less social media, more books.

For Goal 1, I do believe I have some progress. To begin with, I want to highlight
the contributions I've made to [LWS](https://github.com/kubernetes-sigs/lws).

The parameter number of large language models is constantly increasing, e.g. the Llama 3.1 405B, requires 810 GB VRAM (FP16) for loading model weights only, excluding the cuda, python libraries, or kv cache size, which tells the fact that model may not fit in a single node, but requires to be split into different nodes. For example, if we use H100 80 GB, we need two nodes with 8 GPUs each.

Also there're other cases like leveraging model parallelism for distributed model inference to improve throughput, all these stuff requires a new deploy model which is cross-node. This is the primary problem lws aims to address. Also want to shoutout to the initial efforts from [@ahg-g](https://github.com/ahg-g) and [@liurupeng](https://github.com/liurupeng), in the long-term, we hope to make lws a standard workload for multi-node deployment.

Next, I'd like to mention the long vision work we're doing right now, the [InftyAI](https://github.com/InftyAI) org. The initial thought is quite straightforward, we want to build SOTA infrastructure for GenAI from training to fine-tuning to serving. And serving is obviously a good entrypoint because of the tremendous potential, and training is becoming something that only a few companies engage in, so we started the journey with the [llmaz](https://github.com/InftyAI/llmaz) project, a LLM inference platform running on Kubernetes. People may ask question like the community already has several similar projects like [Kserve](https://github.com/kserve/kserve), [RayServe](https://github.com/ray-project/kuberay), [Kaito](https://github.com/kaito-project/kaito) or [NIM](https://github.com/NVIDIA/k8s-nim-operator), why do you want to create another one? In general, all these projects are excellent in their own ways, I don't want to fall into the debates about which one is better or worse. But when we look back to the day we decided to create this project in November 2023, we didn't know Kaito yet which I got known in the KubeCon Paris later, and NIM hasn't been created, I also have no idea whether Kserve supports Huggingface runtime or not at that time which originally was designed for serving predictive models, RayServe works at another level depends on the ray core, which makes it a bit more complex I think, we have components like raylet, GCS, scheduler, churning with the Kubernetes orchestrate system itself. But we learned about the [vllm](https://github.com/vllm-project/vllm), [TGI](https://github.com/huggingface/text-generation-inference) and [LLMDeploy](https://github.com/InternLM/lmdeploy), and we realized that LLM inference is really complex which requires an independent engine to handle all the stuff, but they share the same requirements running on cloud, such as orchestration and scaling, which I've been working for years, so I think it's an opportunity to build an unified inference platform which should be easy to use, and closely integrated with these inference engines.

Today, llmaz is still a relatively young project, containing some basic features at the moment, but Rome wasn't built in a day, I believe it will be popular at some time, and appreciate all the contributors so far, hope to meet them offline one day.

But I admit that we've taken some detours, we first build a python library [llmlite](https://github.com/InftyAI/llmlite) to integrate with these inference engines, working as a wrapper and hope to serve the library directly in llmaz, but sooner we found it's not that expandable what if people has their own engine, also hard to maintain considering the complexities of inference and the crazy code iteration rate, so we gave up timely. Also we met the big problem to distribute models, we developed [manta](https://github.com/InftyAI/Manta) to help us preheat the model but the integration with llmaz is really complex, the workflow generally looks like:

1. llmaz will create an inference service first
2. inference service will create the real workload (Pod here)
3. once Pod is scheduled, llmaz will create the preheat service to load the model in advance
4. Pod is blocked from running until the preheat completes
5. finally model is ready and the serving workload starts

It's a dependency nightmare, so we're now reframing manta to be a fuse system, so that we can hijack the file access to load the models. Still under active developing now, and we use rust instead as a more memory safe language and no GC. We used to talk with the dragonfly maintainer, they rewrite their agents from golang to rust as well because of the goroutine leakage problem.

However, time is limited, right, since I put a lot of energies in InftyAI, I have less time with others, here I mainly refer to the Kubernetes community, I confess I'm less active now, also stepped down the role of approver from Kueue [#3739](https://github.com/kubernetes-sigs/kueue/pull/3739), but I'm still working on these projects because they're the building blocks of our AI platform.

For Goal 2, the answer is yes and no. Yes is because I believe I'm more fluent in speaking English now but No because I still need to expand my vocabulary and listening skills, there's no shortcut but practice. That's also the reason why I'm trying to write posts with English. And I do think traveling helps me a lot.

For Goal 3, I should have done better, the short video platform knows me better than I do. But I still have three books I think worth to read, at least to me, take it away if you like:

- <<Deep Work>> written by Cal Newport which offers practical advice on how to eliminate distractions and improve concentration.
- <<The Most Important Thing Illuminated>> written by Howard Marks and Paul Johnson, it's a collection of Howard's memos to his clients which distill his investment philosophy.
- <<Embedded Power>> written by Xiaohuan Lan about the relationship between the Chinese government and economic development.

Looking forward to the new year, I think I will keep learning and working on LLM inference, besides the cloud, I will take more time with the inference engines, vllm, sglang particularly. Also, the fragmentation of AI software stack is becoming more and more serious, different chips, various accelerators, which is beginning to hinder the development of hardwares, so I think the AI compilers will play an important role here. I highly recommend you to watch the video [The Golden Age of Compilers](https://www.youtube.com/watch?v=4HgShra-KnY&list=PLpdLHovdUOmbj3IMl20Xzr_QFh7Wcic1p&index=13) from Chris Lattner, the creator of LLVM. And I do have great interest with the [Mojo](https://github.com/modularml/mojo) AI language, which is also created by Chris, help to address the complexities of building AI applications, which is usually consist of a python binding, a c++ runtime, and cuda code to drive the hardwares. But the license is another concern I'm worried about.

Finally, I'll make three goals as usual for the next year:

- Growing the InftyAI community, llmaz and manta become sandbox projects
- Become an active contributor to inference engines
- Learn LLVM & MLIR

And happy new year! 🎉
