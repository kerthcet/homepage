---
author: kerthcet
title: KubeCon Amsterdam - Building a Batch System for the Cloud with Kueue
subtitle: ""
date: 2023-04-18
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

[[Slides](/slides/2023/kubecon-eu/building_a_batch_system_for_the_cloud_with_kueue.pdf)] [[Project](https://github.com/kubernetes-sigs/kueue)]

Batch, HPC and AI/ML clusters that serve multiple teams and researchers generally face the challenge of resource constraints. Cluster administrators want to control usage and maximize the utilization of resources. Kueue is a could-native job scheduler that works in combination with the default Kubernetes scheduler, the job controller and the cluster-autoscaler to provide a full batch system. Kueue implements job queueing, deciding when jobs should wait and when they should start, based on quotas and a hierarchy for sharing resources fairly among teams. Kueue works well in the cloud, where resources are heterogeneous, fungible and can be scaled up and down to save cost. In this talk, you will learn the key concepts of Kueue and how you can model your teams and resources to make your Kubernetes cluster a batch system.

Presented together with [@alculquicondor](https://github.com/alculquicondor) from Google.

{{< figure src="/images/talks/kubeconeu_kueue_2023.jpg" alt="session" class="center" >}}
