---
url: "/posts/how-to-improve-stabity-low-cost-aks/"
title: How I helped company to improve stability of low-cost AKS clusters
draft: true
date: 2025-12-07
tags: [Kubernetes, AKS, Stability, DevOps]

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

The most important part as in develping software is to test and monottor new changes.

In k8s world is the same. What can look good in theory, can fail in practice. For that reason I before actually appling it to the clusters and did several series of tests to to make sure this will work.

## Conclusion
