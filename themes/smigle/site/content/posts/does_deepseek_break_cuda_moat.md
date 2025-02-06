---
author: kerthcet
title: Does DeepSeek break CUDA moat?
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

To answer this question, we should first to understand what PTX is and why DeepSeek team chooses to use it.

*Frankly, I'm not a CUDA expert, but I searched a lot about the related information and discussions, also asked the LLM then wrote this post down to share my thoughts, correct me if I'm wrong.*

## What PTX Is

PTX is short for *Parallel Thread Execution*, a low-level parallel thread execution virtual machine and instruction set architecture (ISA), PTX exposes the GPU as a data-parallel computing device. You can refer to the [index.html](https://docs.nvidia.com/cuda/parallel-thread-execution/index.html#) for more details. **Generally, it works as an IR (intermediate representation) between higher-level GPU programming languages, like CUDA and the low-level machine code, SASS (Streaming Assembler)**, which is the actual instruction set that runs on the GPU.

With PTX, you can achieve fine-gained control over low-level optimizations than CUDA to squeeze out the last bit of performance. However, it's not easy. And PTX is necessary to keep forward compatibility between different GPU generations, for example, a PTX file generated for Volta could be recompiled for Ampere without changing the CUDA source code.

For short, PTX is still part of the CUDA system.

## Why DeepSeek Wants to Use PTX

DeepSeek-V3 is trained with 2048 Nvidia H800 GPUs because of the chip lock. Compared to H100, which is the common chip used for training in industry, H800 has similar computing power but lower NVLink bandwidth and HBM bandwidth, which will impact the GPU communication a lot. I think this is the reason why DeepSeek team wants to use PTX directly. From the report, they allocated 20 SMs out of 132 ones for server-to-server communication to achieve better performance, which can't be achieved by CUDA.

## Does DeepSeek Break CUDA Moat?

From the PTX point of view, it's not, because PTX is still part of the CUDA system. But the DeepSeek team proves that the higher-level optimization is not enough, and they showcased their capabilities to manipulate the hardware directly, which is a great entrypoint for other chip providers to seek for cooperations, algos and softwares can impact the development of hardwares as well. And I think PTX optimization could be a trend if the performance improvement is significant, which hasn't been revealed in the report.

After all, the DeepSeek team do have great infrastructure engineers to make this happen.
