---
author: kerthcet
title: KubeCon China HongKong
subtitle: ""
date: 2024-08-23
description: ""
categories:
  - Work
tags:
  - 2024
  - kubernetes
  - kubecon
  - scheduling
  - opensource
  - talk
  - hongkong
---

### Panel: Fragmentation of the Scheduling in Kubernetes and Challenges for AI/ML workloads

[[Slides](/slides/2024/kubecon-china/panel_fragmentation_of_the_scheduling_in_kubernetes_and_challenges_for_ai_ml_workloads.pptx.pdf)]

Scheduler is one of the most frequently customized components in Kubernetes, owing to its expandability. However, too many schedulers lead to decision paralysis among users, which has been discussed extensively in the past KubeCons. To help mitigate the confusion of users, four maintainers from various community (Godel-Scheduler, Koordinator, Kubernetes SIG-Scheduling and Volcano) are invited to profile the background and usecases behind these projects.

Also the panel will discuss the gap between upstream Kubernetes and downstream projects and try to abstract the common patterns or functionalities which can be pushed to the upstream to avoid reimplementing the wheel, and what should still be defined loosely to preserve the expandability.

Moreover, with the rise of AI, scheduling AI workloads in Kubernetes poses a significant challenge, the panel will discuss where we're right now and where we're head for, as well as the opportunities of cooperations.

{{< figure src="/images/talks/kubeconhk_panel_2024.jpg" alt="session" class="center" >}}
