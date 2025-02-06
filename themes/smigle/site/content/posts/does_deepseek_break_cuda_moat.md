---
author: kerthcet
title: Does DeepSeek Break CUDA Moat?
subtitle: ""
date: 2025-02-06
description: ""
categories:
  - Work
tags:
  - 2025
  - deepseek
  - ai
---

Due to DeepSeek-V3 [technical report](https://www.alphaxiv.org/pdf/2412.19437), it says:

```md
In addition, both dispatching and combining kernels overlap with the computation stream,
so we also consider their impact on other SM computation kernels.
Specifically, we employ customized PTX (Parallel Thread Execution) instructions and
auto-tune the communication chunk size, which significantly reduces the use of the
L2 cache and the interference to other SMs.
```

then people are saying like **DeepSeek is breaking the Nvidia core moat - CUDA** by employing the PTX directly, but is that true?

To answer this question, we should first to understand what PTX is and why DeepSeek team chooses to employ it.

*Frankly, I'm not a CUDA expert, but I searched related information and discussions, then wrote this post down to share my thoughts, correct me if I'm wrong.*

## What PTX Is

PTX is short for *Parallel Thread Execution*, a low-level parallel thread execution virtual machine and instruction set architecture (ISA), PTX exposes the GPU as a data-parallel computing device. You can refer to the [index.html](https://docs.nvidia.com/cuda/parallel-thread-execution/index.html#) for more details. **Generally, it works as an IR (intermediate representation) between higher-level GPU programming languages, like CUDA and the low-level machine code, SASS (Streaming Assembler)**, which is the actual instruction set that runs on the GPU.

With PTX, you can achieve fine-gained control over low-level behaviors than CUDA, like the register and shared memory usage, instruction execution order. However, it's not easy. And PTX is a necessary abstraction to keep forward compatibility between different GPU generations, for example, a PTX file generated for Volta could be recompiled for Ampere without changing the CUDA source code.

For short, PTX is still part of the CUDA system.

## Why DeepSeek Wants to Use PTX

From the report, DeepSeek-V3 introduced the DualPipe to efficient overlap the forward and backward computation and communication, reduce the pipeline bubbles significantly. However, to ensure this, they need low-level direct hardware control, like dynamic adjusting wraps by actual workloads, auto-tune the communication chunk size to reduce the L2 cache, preventing the interference to other computation SMs. CUDA doesn't provide such low-level control, PTX does.

Also, some people guessed that PTX adoption is mostly because of the H800 hardware limitation, as we known, compared to H100, H800 has similar computing power but lower NVLink bandwidth and HBM bandwidth, which will impact the GPU communication a lot. PTX could squeeze out the performance by optimizing the communication. However, even with H100, I guess the optimization is still unavailable.

## Does DeepSeek Break CUDA Moat?

From the PTX point of view, it's not, because PTX is still part of the CUDA system. But from another side, the DeepSeek team proves that the higher-level optimization is not enough, is this an opportunity left for other chip vendors? And in the long-term, algos and softwares can impact the development of hardwares as well, which may shrink the gap between CUDA and other AI stacks.

After all, I think PTX optimization could be a trend if the performance improvement is significant, and the DeepSeek team do have great infrastructure engineers to make this happen.

## Reference
- https://www.alphaxiv.org/pdf/2412.19437
- https://www.tomshardware.com/tech-industry/artificial-intelligence/deepseeks-ai-breakthrough-bypasses-industry-standard-cuda-uses-assembly-like-ptx-programming-instead
- https://x.com/IanCutress/status/1884374138787357068