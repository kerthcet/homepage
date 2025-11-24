---
author: kerthcet
title: KubeCon China HongKong (Keynote)
subtitle: ""
date: 2025-06-09
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
---

### Keynote: Building a Large Model Inference Platform for Heterogeneous Chinese Chips Based on VLLM

[[Slides](https://github.com/kerthcet/Slides/blob/main/year2025/kubecon-china/KubeconHK-llmaz-ppt.pptx.pdf)]

With the growing demand for heterogeneous computing power, Chinese users are gradually adopting domestic GPUs, especially for inference. vLLM, the most popular open-source inference project, has drawn widespread attention but does not support domestic chips.Chinese inference engines are still developing in functionality, performance, and ecosystem. In this session, we’ll introduce how to adapt vLLM to support domestic GPUs,enabling acceleration features like PageAttention, Continuous Batching, and Chunked Prefill. We’ll also cover performance bottleneck analysis and chip operator development to maximize hardware potential.
Additionally, Kubernetes has become the standard for container orchestration and is the preferred platform for inference services. We’ll show how to deploy the adapted vLLM engine on Kubernetes using the open-source llmaz project with a few lines of code, and explore how llmaz handles heterogeneous GPU scheduling and our practices for monitoring and elastic scaling.

{{< figure src="/images/talks/kubeconch_llmaz.jpg" alt="session" class="center" >}}

### Session: New Pattern for Sailing Multi-Host LLM Inference

[[Slides](https://github.com/kerthcet/Slides/blob/main/year2025/kubecon-china/KubeconHK-lws.pdf)]

Inference workloads are becoming increasingly prevalent and vital in Cloud Native world. However, it's not easy, one of the biggest challenges is large foundation model can not fit into a single node, like llama 3.1-405B or DeepSeek R1, which brings out the distributed inference with model parallelism, again, make serving inference workloads more complicated.

LeaderWorkerSet, aka. LWS, is a dedicated multi-host inference project aims to solve this problem, it's a project under the guidance of Kubernetes SIG-Apps and Serving Working Group. It offers a couple of features like dual-template for different types of Pods, fine-gained rolling update strategies, topology managements and all-or-nothing failure handlings.

In this session, we'll introduce the capacities of lws and showcase the practice from our adopters like nvidia, google, and we'll demonstrate the integration with the most popular inference engines, such as vLLM, SGLang.

{{< figure src="/images/talks/kubeconch_lws.jpg" alt="session" class="center" >}}
