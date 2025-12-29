---
author: kerthcet
title: KubeCon HongKong - New Pattern for Sailing Multi-Host LLM Inference
subtitle: ""
date: 2025-06-10
description: ""
categories:
  - Work
tags:
  - 2025
  - kubecon
  - inference
  - opensource
  - keynote
  - talk
  - hongkong
---

[[Slides](/slides/2025/kubecon-china/new_pattern_for_sailing_multi-host_llm_inference.pdf)] [[Project](https://github.com/kubernetes-sigs/lws)]

Inference workloads are becoming increasingly prevalent and vital in Cloud Native world. However, it's not easy, one of the biggest challenges is large foundation model can not fit into a single node, like llama 3.1-405B or DeepSeek R1, which brings out the distributed inference with model parallelism, again, make serving inference workloads more complicated.

LeaderWorkerSet, aka. LWS, is a dedicated multi-host inference project aims to solve this problem, it's a project under the guidance of Kubernetes SIG-Apps and Serving Working Group. It offers a couple of features like dual-template for different types of Pods, fine-gained rolling update strategies, topology managements and all-or-nothing failure handlings.

In this session, we'll introduce the capacities of lws and showcase the practice from our adopters like nvidia, google, and we'll demonstrate the integration with the most popular inference engines, such as vLLM, SGLang.

{{< figure src="/images/talks/kubeconch_lws.jpg" alt="session" class="center" >}}
