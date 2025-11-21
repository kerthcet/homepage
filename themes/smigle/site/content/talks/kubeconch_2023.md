---
author: kerthcet
title: KubeCon China Shanghai
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
---

### Session: Sailing Ray workloads with KubeRay and Kueue in Kubernetes

Compute demands for machine learning are growing rapidly nowadays. Ray, a unified computing framework, allows ML engineers to scale their workloads effortlessly without building complex computing infrastructures.

On the other hand, Kubernetes, a popular open-source container orchestration platform, can help to manage a wide range of workloads at ease with KubeRay, an operator for Ray workloads.

At ByteDance, thousands of jobs are submitted to the Ray cluster created by KubeRay daily. With the capability to debug programs on long-running clusters and launch regular jobs through Ray Job custom resources, users benefit from a streamlined workflow.

Meanwhile, efficiently managing concurrent Ray jobs poses challenges such as job starvation and resource allocation.  Kueue, a Kubernetes native job queueing system offering capacities like resource management, multi-tenant support, and resource fair-sharing perfectly addresses the Ray job challenges in Kubernetes.

Presented together with [@Basasuya](https://github.com/Basasuya) from ByteDance. ([Slides](https://github.com/kerthcet/Slides/blob/main/year2023/kubecon-china/kueue/Ray%20%26%20Kueue%20KubeCon-2023%20China%20.pdf))

{{< figure src="/images/talks/kubeconch_ray_2023.jpg" alt="session" class="center" >}}

### Session: SIG-Scheduling Intro & Deep Dive

Kube-scheduler is a critical component to Kubernetes, responsible for placing the pod to the most suitable node. But how it works, can we customize it for advanced usage, what’s the best practice in large clusters. To answer these progressive questions, we’ll divide this session into two parts. If you’re a newbie to kube-scheduler, you may interest with the Intro part, if you’re a senior one, you can join our Deep Dive.

What’s more, we’ll share with you some ongoing works within the SIG, including the latest progress with the sub-projects.

Presented together with [@denkensk](https://github.com/denkensk) from Shopee. ([Slides](https://github.com/kerthcet/Slides/blob/main/year2023/kubecon-china/sig-scheduling_intro_deep_dive.pdf))

{{< figure src="/images/talks/kubeconch_scheduler_2023.jpg" alt="session" class="center" >}}
