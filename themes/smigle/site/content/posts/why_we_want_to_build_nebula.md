---
author: kerthcet
title: Why We Want to Build Nebula
subtitle: ""
date: 2026-10-12
description: ""
categories:
  - Work
  - OpenSource
tags:
  - 2026
  - GPU
  - NeoCloud
---

At [hiverge.ai](https://hiverge.ai), we're building `Hive`, a distributed platform where large numbers of self-improving evolutionary agents for algorithm discovery and optimization. We mainly focus on three domains:

* **Planning and logistics**, like long-horizon planning, supply chain management and others.
* **Performance engineering**, like model training acceleration, GPU kernel optimization, Kubernetes scheduling and others.
* **Scientific discovery**, like discovering new algorithms for quantum chemistry, new quantum algorithms for combinatorial optimization.

Hive has been trusted by leading labs and companies like Quantinuum, NVIDIA and AWS, with more undisclosed customers.

## The Big Problem We Faced

To make Hive scalable and robust, we chose Kubernetes as our orchestration engine and AWS as the cloud underneath our SaaS platform. That works well most of the time. It stops working well when customers want to optimize ML workloads, or more recently LLM workloads, because those need a lot of GPUs. Four problems kept coming up:

* **Capacity.** AWS doesn't always have enough GPUs, especially like A100s and H100s, so we have to reserve them in advance. However, reservation doesn't work quite well for us because our demand for GPUs is highly dynamic and unpredictable. Also the GPU type requirements vary depending on the workload, making it even harder to plan ahead. A typical use case for our customers is running low-end GPUs like L4 for prototyping and then switching to high-end GPUs like A100 or H100 for experiments.
* **Hardware variety.** AWS doesn't offer AMD GPUs, and some customers specifically want to optimize inference on AMD.
* **Multi-node workloads.** Running something like Kimi K3 across multi-node isn't easy on AWS out of the box.
* **Cost.** GPUs on AWS are expensive, and reserving them costs even more.

This became the main thing holding back growth with our customers.

## Why not an existing tool?

We looked at what the community had built first. [SkyPilot](https://github.com/skypilot-org/skypilot), from UC Berkeley's Sky Computing Lab, is popular and comes close to what we wanted. Two things got in the way:

1. **No Modal support.** We wanted Modal first because it has everything we need: configurable egress policies and flexible CPU/memory allocation. SkyPilot didn't support Modal at the time.
2. **CLI-first design.** SkyPilot is mainly a CLI tool, while our platform is tightly coupled with Kubernetes, making the integration non-trivial. For example, the cost tracking and logging would require significant additional work.

BTW, we had some private communication with the SkyPilot team, and really appreciated their insights.

## Our Solution

So we built our own GPU provisioning project: **[Nebula](https://github.com/inftyai/nebula)**. It's based on two principles:

* **Kubernetes-native.** You run GPU workloads through a Kubernetes API, the same way you run everything else.
* **Provider-agnostic.** NeoClouds like Modal and RunPod, hyperscalers like AWS, and your own self-hosted infrastructure all sit behind one interface.

Last week we released the first version. Besides following those two principles, it ships with:

* Cost tracking out of the box
* Egress policy support
* An `Ordered` placement policy
* Region support
* And more

Nebula is already running in production on our platform, and customers are happy with how smoothly they can now get GPUs.

## What's next

Some of what we're working on for upcoming releases:

* More providers, starting with RunPod
* Integration with Kubernetes multi-cluster setups
* Fair sharing of resources to avoid head-of-line (HOL) blocking
* A `Cheapest` placement policy to reduce overall GPU spend

## Join us

If you work on GPU provisioning, or your company has the same problems we did, give [Nebula](https://github.com/inftyai/nebula) a try. We're also looking for contributors and maintainers, so come join us.
