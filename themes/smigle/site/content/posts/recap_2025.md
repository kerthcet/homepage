---
author: kerthcet
title: Recap 2025
subtitle: ""
date: 2025-12-30
description: ""
categories:
  - Life
tags:
  - 2025
  - recap
---


### Review the Goals of 2025

Looking back 2025, I set three goals (all about the work) at the beginning of the year, it turns out that the results are not that satisfying:

- Growing the InftyAI community, llmaz and manta become sandbox projects
- Become an active contributor to inference engines
- Learn LLVM & MLIR

[Manta](https://github.com/InftyAI/Manta) is archived because other projects came out like [3FS](https://github.com/deepseek-ai/3FS) from DeepSeek and [Mooncake](https://kvcache-ai.github.io/Mooncake/design/p2p-store.html) from Kimi, there projects are more mature and active developed. Honestly, I wouldn't develop Manta if these projects existed at that time.

 [llmaz](https://github.com/InftyAI/llmaz) is seeking for new direction because too many competitors emerged in the LLM serving space, like AIBrix, dynamo, llm-d and so on. Without significant support, it's very hard to compete with them, and I don't want to reimplement the wheel. So I'm thinking about making llmaz more domain-specific, let's see how it goes.

However, the decisions to start these projects at that time are proven to be correct, and the LLM serving space is really heating up.

For the second goal, I contributed several PRs to vLLM and started to work on dynamo in the past few weeks but it's true that I'm not an active contributor as I expected in the past year. Also spent few time to learn LLVM & MLIR, just read some blogs.

So generally, if anchored on the goals set at the beginning of the year, it's not that productive as I expected. One of the reasons is that I joined a new startup in the middle of the year, will talk about it later.


### 2025 Highlights

#### New Job

The big turning point should be July, I joined a new startup, focus on building AI agents, an evolutionary system for discovery. Start to shift my focus from cloud to AI, because I really think AI is a large opportunity, and I want to be part of it. My work is still about infrastructure, but more close to MLSys.

Also I'm in charge of building the SaaS platform for our product from scratch, that's why I don't have enough time to work on inference in the past year. But I think it will change in 2026 since AI inference is an important area for us.

#### New Life

With the new job, I moved to Cambridge, UK, it's a more academic-oriented city, not as modern as London, but I enjoy the peaceful life here. Also it's not far from London, just 1 hour by train. I like walking to the office everyday, walking makes me thinking. But not the food, I have to cook by myself most of the time. Missing the Chinese food every single day.

#### Open Source

Although I spent most of the time with the new job, I still worked out some open source projects that we used internally (and still working on), like:

- [AlphaTrion](https://github.com/InftyAI/alphatrion), for AI observability and monitoring for LLM-based applications.
- [AMRS](https://github.com/InftyAI/amrs), for adaptive model routing among an ensemble of LLMs.

Also I founded the [modelspec.ai](https://modelspec.ai), which aims to be a model hub and benchmarking platform for ai models (still under development). Although they're multiple similar platforms out there, like Huggingface, OpenRouter, DeepInfra, ModelScope and so on, but it's counterintuitive to pick a model before asking questions, also if you take a look of the models from OpenAI, the version variants are really messy. However, what user really needs is just an auto-completion system based on the questions, cheaper and smarter. Also saw some progress in the community like [semantic-router](https://github.com/vllm-project/semantic-router) and [LLM Router](https://github.com/ulab-uiuc/LLMRouter), which is interesting.

In the future, modelspec.ai will build on top of the AMRS library to provide adaptive model routing capability.

Anyway, I have a lot of ideas in my mind, like native AI-terminal (actually I have played with this at the beginning of 2025, earlier than X-CLIs), AIOS and so on, just don't have enough time. In 2026, I will continue working on InftyAI to bring more promising projects and grow the community.


#### Travel

I visited several countries and cities in 2025, Thailand -> UK -> Hong Kong -> Guilin.

It's my first time to the UK, visited London, Cambridge, Manchester, Liverpool, and Edinburgh. Really enjoy the trip and the scenery there. Also watched two matches on-site, Arsenal and Chelsea, can't be better as a football fan.


### Random Thoughts

2025 is the year of AI agents and RL. All kinds of agents emerged, code agents, general purpose agents, open-ended agents for discovery and so on.

MCPs, skills, tools are becoming the new norm for building AI applications. However, it's still unclear to me about the boundaries between agents and LLMs. If we agree LLM is the brain, they should be able to plan and orchestrate the tasks by themselves, what they need is just the tool use capabilities and guardrails to constraint the behaviors. Then, agents will behave more like an execution system while LLMs are the planners.

That's also where agentic RL shines. With agentic RL, LLM is no longer a reactive entity but more like a pro-active system by learning from the environment. In 2025, so many RL frameworks opensourced, like slime, areal, verl, rllm. And one interesting thing here is Ray seems to be the only option as the orchestration runtime, it's a good time to be a Ray engineer now, just like Kubernetes engineers. (One fact about working on open standard projects is that you can accumulate your experience and apply in different companies rather than learning from scratch every time when you switch jobs.)

Moreover, AI for discovery is becoming more and more popular, like the [AlphaEvolve](https://deepmind.google/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/) announced by DeepMind, also we saw several new startups there, not only [hiverge.ai](https://hiverge.ai), also like [PeriodicLab](https://periodic.com/) and earlier ones like [sakana.ai](https://sakana.ai).

Another interesting area is about building AI infrastructure with AI, we saw companies like [standardkernel](https://standardkernel.com) founded this year and I believe more will emerge in the next few years. I'm also very interested with this domain.

### Stats

#### Coding

{{< figure src="/images/posts/code_stats_2025.png" alt="stats" class="center-width-70-percent" >}}

#### Sports

{{< figure src="/images/posts/sports_2025.jpg" alt="stats" class="center-width-70-percent" >}}

### Goals for 2026

The word of my 2025 is **Uncertainty**. New job, new city, and new AI technologies every month or even every week. What you can do is to embrace the uncertainty and seek the certainty within.


For the new year, too many things to do, set three goals about work here as usual and check back at the end of 2026:

- Take deep dive into AI inference systems, working on performance optimizations.
- Explore autonomous GPU kernel generation.
- Start to learn and optimize the Ray project for agentic RL.

Also set three personal goals:

- Follow the daily schedule strictly.
- Do more exercises.
- Write more technical posts and publish at least two papers.
