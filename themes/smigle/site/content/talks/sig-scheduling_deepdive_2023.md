---
author: kerthcet
title: KubeCon Amsterdam - SIG-Scheduling Deep Dive
subtitle: ""
date: 2023-04-19
description: ""
categories:
  - Work
tags:
  - 2023
  - kubernetes
  - kubecon
  - batch
  - ai
  - opensource
  - talk
  - netherlands
  - amsterdam
---


[[Slides](/slides/2023/kubecon-eu/sig-scheduling_deepdive.pdf)] [[Project](https://github.com/kubernetes/kubernetes)]

In this talk, Aldo and Kante will present the latest enhancements that SIG Scheduling recently promoted in Kubernetes, and the opportunities under discussion, to better support both services and batch type workloads in Kubernetes. We will discuss the recent improvements to scheduler performance that are allowing it to reach new scheduling throughput highs, better support for rolling updates in deployments while maintaining high availability, the new spec. SchedulingGates knob and how it allows external integrators, like dynamic quota managers, to control when pods should be considered for scheduling. We will also discuss the recent developments in sponsored projects, such as Kueue, scheduling plugins and the descheduler.

Presented together with [@alculquicondor](https://github.com/alculquicondor) from Google.

{{< figure src="/images/talks/kubeconeu_scheduler_2023.jpg" alt="session" class="center" >}}