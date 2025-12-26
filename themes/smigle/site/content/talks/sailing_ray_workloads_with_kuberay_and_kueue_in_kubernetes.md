---
author: kerthcet
title: Sailing Ray workloads with KubeRay and Kueue in Kubernetes
subtitle: ""
date: 2023-09-27
description: ""
categories:
  - Work
tags:
  - 2023
  - kubernetes
  - kubecon
  - batch
  - ai
  - scheduling
  - ray
  - opensource
  - talk
  - shanghai
---

[[Slides](/slides/2023/kubecon-china/sailing_ray_workloads_with_kuberay_and_kueue_in_kubernetes.pdf)]

Compute demands for machine learning are growing rapidly nowadays. Ray, a unified computing framework, allows ML engineers to scale their workloads effortlessly without building complex computing infrastructures.

On the other hand, Kubernetes, a popular open-source container orchestration platform, can help to manage a wide range of workloads at ease with KubeRay, an operator for Ray workloads.

At ByteDance, thousands of jobs are submitted to the Ray cluster created by KubeRay daily. With the capability to debug programs on long-running clusters and launch regular jobs through Ray Job custom resources, users benefit from a streamlined workflow.

Meanwhile, efficiently managing concurrent Ray jobs poses challenges such as job starvation and resource allocation.  Kueue, a Kubernetes native job queueing system offering capacities like resource management, multi-tenant support, and resource fair-sharing perfectly addresses the Ray job challenges in Kubernetes.

Presented together with [@Basasuya](https://github.com/Basasuya) from ByteDance.

{{< figure src="/images/talks/kubeconch_ray_2023.jpg" alt="session" class="center" >}}
