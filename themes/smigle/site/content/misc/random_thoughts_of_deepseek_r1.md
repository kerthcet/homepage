---
author: kerthcet
title: Random Thoughts of DeepSeek
subtitle: ""
date: 2025-01-28
description: ""
categories:
tags:
  - 2025
  - ai
---

A month ago, Ilya Sutskever, the ex co-founder and chief scientist at OpenAI, gave a [talk](https://www.youtube.com/watch?v=1yvBqasHLZs&t) at the NeurIPS 2024 and announced that: **PreTraining is Over**. He reveals the fact that the available data of internet for training large language models is exhausted, which somehow challenges the [scaling law](https://arxiv.org/pdf/2001.08361) (for short, the performance and accuracy of AI model improves as a function of increasing the scale in *model size*, *dataset size* and *compute power*).

DeepSeek v3 definitely changes the game, with 1/10 cost of Llama3 405B but better performance, which pushes the boundary of the scaling law. To achieve this, the DeepSeep team did a lot of innovations.
First of all, DeepSeek v3 is a MoE model, this is not a secret, compared to dense model, it reduces the computation cost a lot but still keeps the model capacity with a large model size, 671B specifically. What DeepSeek team introduced additionally is the **auxiliary-loss-free** loadbalancing algo, compared to *auxiliary-loss-based*, which leads to expert load unfairly, it improves the distributed training efficiency and stability a lot. The second one is the **MLA** (multi-head latent attention), a new attention mechanism which reduces the vRAM requirements a lot. The third one is the **fine-gained FP8 mixed-precision training**, which reduces the computation cost and vRAM requirements both, 2x faster than FP16 at most.

They also optimized the network communications, like the DualPipe to reduce the computation buble which helps to improve the GPU utilization. They even bypassed the CUDA and employed PTX instructions to accelerate the communication. They just rebuilt the infrastructure from scratch.

After all, they did a lot of infrastructure optimizations, which is really impressive. But I have no idea how complex it would be and how much work left to apply with other GPU types, like A100 (from the [technical report](https://www.alphaxiv.org/pdf/2412.19437), v3 model is trained with 2048 Nvidia H800 GPUs), maybe they don't have the trouble because of the chip blockade. Or with other chips, like AMD or Ascend. Meanwhile, how stable the system would be in a 10K GPU cluster, which is a default setup for leading AI companies, I think the scaling saw still works here. These're the two main concerns I have.

And I fully agree with LeCun's opinion: "Open source models are surpassing proprietary ones", which is a great news for the open source community and AI startups, but fatal to the proprietary companies, like OpenAI. Moreover, because DeepSeek team is bypassing the CUDA, which is the moat of Nvidia, I think it also puts some pressure on them, AMD and Huawei are cooperating with DeepSeek now.

But I don't think DeepSeek is far ahead of other companies technically, most of the innovations are already published in earlier papers, but DeepSeek team did a great job to combine them together and make it happen in production. They found the **balance between technical innovation and engineering**, which is also very important for long-term AI development. This is also how open source works, **Sharing, Learning, and Growing**. DeepSeek is a win for the open source community and I do believe **the future of AI is open source**.

Lastly, I have to confess that I'm shocked by the innovation of the Hangzhou City, DeepSeek, Unitree Robotics, Deep Robotics, Game Science, Qwen Team and more, just like the Chinese Silicon Valley. 2 years ago in 2023, I was asked about whether I'm interested to join the HighFlyer Quant who incubated the DeepSeek later, of course I need to pass the interview first, but this is not the key point, I said no solidly, because I live in Shanghai at that moment, and I thought Shanghai is more promising and has more innovations, but I think I was wrong, Hangzhou is also a vibrant and modern city, full of opportunities and challenges. I'm open to Hangzhou now. BTW, the cost of living and housing in Shanghai is too much for young people, I think this is also one of the reasons why people leave Shanghai.
