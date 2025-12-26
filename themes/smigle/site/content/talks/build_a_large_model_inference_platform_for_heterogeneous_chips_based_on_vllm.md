---
author: kerthcet
title: Build a Large Model Inference Platform for Heterogeneous Chips Based on vLLM (Keynote)
subtitle: ""
date: 2025-06-11
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

[[Slides](/slides/2025/kubecon-china/build_a_large_model_inference_platform_for_heterogeneous_chips_based_on_vllm.pptx.pdf)]

With the growing demand for heterogeneous computing power, Chinese users are gradually adopting domestic GPUs, especially for inference. vLLM, the most popular open-source inference project, has drawn widespread attention but does not support domestic chips.Chinese inference engines are still developing in functionality, performance, and ecosystem. In this session, we’ll introduce how to adapt vLLM to support domestic GPUs,enabling acceleration features like PageAttention, Continuous Batching, and Chunked Prefill. We’ll also cover performance bottleneck analysis and chip operator development to maximize hardware potential.
Additionally, Kubernetes has become the standard for container orchestration and is the preferred platform for inference services. We’ll show how to deploy the adapted vLLM engine on Kubernetes using the open-source llmaz project with a few lines of code, and explore how llmaz handles heterogeneous GPU scheduling and our practices for monitoring and elastic scaling.

{{< figure src="/images/talks/kubeconch_llmaz.jpg" alt="session" class="center" >}}
