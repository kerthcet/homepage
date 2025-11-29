---
author: kerthcet
title: KubeCon Europe London
subtitle: ""
date: 2025-04-02
description: ""
categories:
  - Work
tags:
  - 2025
  - kubernetes
  - kubecon
  - opensource
  - inference
  - talk
  - england
  - london
---

### Session: Sailing Multi-Host Inference with LWS

[[Slides](https://github.com/kerthcet/Slides/blob/main/year2025/kubecon-eu/KubeConEU25%20LWS.pptx.pdf)]

Inference workloads are becoming increasingly prevalent and vital in Cloud Native world. However, it's not easy, one of the biggest challenges is large foundation model can not fit into a single node, which brings out the distributed inference with model parallelism, again, make serving inference workloads more complicated.

LeaderWorkerSet, aka. LWS, is a dedicated multi-host inference project aims to solve this problem, it's a project under the guidance of Kubernetes SIG-Apps and Serving Working Group. It offers a couple of features like dual-template for different types of Pods, fine-gained rolling update strategies, topology managements and all-or-nothing failure handlings.

What's more, vLLM, an inference engine, renowned for its performance and easy-to-use, has gained widespread popularity. In this presentation, we'll show you how to use LWS to deploy distributed inference with vLLM on Kubernetes.

{{< figure src="/images/talks/kubeconeu_2025.jpg" alt="session" class="center" >}}
