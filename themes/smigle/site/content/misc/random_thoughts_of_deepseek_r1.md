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

DeepSeek v3 definitely changes the game, with 1/10 cost of Llama3 405B but better performance, which pushes the boundary of the scaling law.  And I fully agree with LeCun's opinion: "Open source models are surpassing proprietary ones", which is a great news for the open source community. And I do believe **the future of AI is open source**.

According to DeepSeek v3 [technical report](https://www.alphaxiv.org/pdf/2412.19437), I do noticed that they did a lot of optimizations of the infrastructure, like the DualPipe to reduce the computation buble which helps to improve the GPU utilization, a lot of communication optimizations to reduce the overhead across nodes, also fine-gained algos to reduce the memory footprint of KV cache, which is really impressive and a wise decision because of the chip locking. However, DeepSeek v3 is trained with 2048 H800 Nvidia GPUs, I have no idea how efficient these optimizations are in a bigger cluster like with ten thousands of GPUs, and the stability is really a big concern.

Lastly, I have to confess that I'm shocked by the innovation of the Hangzhou City, DeepSeek, Unitree Robotics, Deep Robotics, Game Science, Qwen Team and more, just like the Chinese Silicon Valley. I live in Shanghai, also a vibrant city, but maybe the cost of living and housing here is too much for young people, making Shanghai less attractive, I don't know.
