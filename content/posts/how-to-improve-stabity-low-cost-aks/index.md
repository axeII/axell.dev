---
title: How I helped company to improve stability of low-cost AKS clusters
draft: false
date: 2025-12-07
tags: [Kubernetes, AKS, Stability, DevOps]

# showHero: false
---

# Introduction
In my company we run our product on Azure Kubernetes Service (AKS) clusters. We use for non production environments spot machines for nodes. What that means is that those nodes can be evicted at any time when Azure needs the capacity back. But as trade-off for that we pay much less for those nodes. Sometimes even up to 80% less of original price.

After recent months of running our product on those low-cost AKS clusters, we started to experience stability issues. It was getting much worse and we had to solve this problem.

I was given task - improve the stability of the cluster but keep the cost low.

Sounds challenging, right?

Let's dive in.


## Chapter 1: Identifying the stability problem

## Chapter 2: Finding solution

## Chapter 3: Tains and tolerations

## Chapter 4: Applying the changes and monitoring results

## Conclusion
