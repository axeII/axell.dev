---
date: 2025-9-14T10:30:00Z
description: "How I debugged suspicious Plex connections using Grafana, Tautulli, and Cloudflare Tunnel after the recent security incident"
draft: false
slug: "plex-incident-debugging-infrastructure"
tags: ["home-lab", "plex", "security", "cloudflare", "grafana", "tautulli"]
title: "Debugging Suspicious Plex Connections: A Deep Dive Into My Self-Hosted Infrastructure"
showHero: false
---

Last week, Plex announced a security [incident](https://forums.plex.tv/t/important-notice-of-security-incident/930523) where their user database was compromised, forcing everyone to log out — including server connections. As someone who self-hosts a Plex instance that’s publicly reachable (no VPN in front), this grabbed my attention. Beyond the Reddit threads and confusion, it was a good oportunity to audit my infrastructure. In this post, I’ll walk through how I autdit my Plex server and chased down some weird connections to my Plex server using Grafana, Tautulli, and Cloudflare Tunnel.

## The Wake-Up Call

The Plex incident was a reminder that even well‑secured services can get hit. After the email landed, I did a quick audit: review recent activity, confirm configs, and look for anything odd on the network. When you self‑host, you own both the security and the monitoring. Here’s how I approached it:

## The Investigation Begins

My first instinct was to check my monitoring stack to see if there had been any unusual activity on my Plex server. This is exactly why having proper observability in a homelab matters — during incidents, you need answers quickly. Without logs and monitoring, you’re flying blind. Before we continue here is a  quick overview of my setup:

### Core Components

- **Plex Media Server**: Running in Docker containers on Kubernetes
- **Cloudflare Tunnel**: Eliminates the need for port forwarding
- **Grafana**: Log aggregation and monitoring dashboards
- **Tautulli**: Plex-specific monitoring and analytics

### Security Measures

- **No Open Ports**: Everything routes through Cloudflare Tunnel
- **Country Whitelisting**: Cloudflare rules limit access to specific countries
- **Container Isolation**: Plex runs rootless in isolated containers
- **Regular Monitoring**: Automated alerts for unusual activity patterns

### Step 1: Grafana logs

I started with my Grafana dashboard, which aggregates logs from all services running on Kubernetes — including Plex. Almost immediately, something looked off: connections were happening regularly between ~3–9 AM. That’s a unlike play time for my friends or family to use my Plex instance.

> Worth noting: there’s a known Cloudflare Tunnel isue where some connections aren’t closed properly (see: https://github.com/cloudflare/cloudflared/issues/1300), but the pattern here was too consistent to ignore.

The timing was the first red flag. The connections also had a repeatable signature — it almost looked like someone was probing the instance.

![grafana logs](https://img.axell.dev/plex%3Agrafana.webp "Grafana logs showing suspicious connections")

### Step 2: Tautulli check

To verify my suspicions, I checked Tautulli — a great tool for Plex user activity, play stats, and connection details. Tautulli confirmed it: during those ~3–9 AM windows, there were no active users on my server.

That ruled out legitimate activity. The question became: what (or who) was making these connections?

### Step 3: Cloudflare Tunnel

Since I use Cloudflare Tunnel to expose my Plex server without opening ports on my router (a security best practice I highly recommend), my next step was to examine the tunnel logs. Cloudflare Tunnel is fantastic because it creates a secure outbound connection from my network to Cloudflare's edge, eliminating the need for port forwarding.

In the Cloudflare dashboard, I could see traffic patterns that looked the same as the suspicious connections I'd found in Grafana. Importantly, all the IP addresses were from Cloudflare's infrastructure, which was expected since all traffic routes through their network first.

#### The Cloudflare Admin Panel Deep Dive

This is where it got interesting. Digging deeper into the Cloudflare admin panel helped narrow down the source. The repeated IP in my logs pointed me toward something I’d completely forgotten about.

![cloudflare1](https://img.axell.dev/plex%3Acloudlfare1.webp "Cloudflare dashboard showing traffic patterns")

#### The Culprit Revealed

After a longer-than-I’d-like investigation, I finally found the source: my friend’s Plex server.

Years ago, we connected our Plex servers for fun — probably to share libraries or test something — and then completely forgot about it. The connection kept humming along in the background.

![cloudflare2](https://img.axell.dev/plex%3Acloudlfare2.webp "The Suspicious IP address which was my friend's home ip in the end")

My friend’s server was periodically reaching out to mine, likely for status checks or library updates. Not malicious — just unexpected — and it explained the ~3–9 AM pattern (likely maintenance windows on his side).

## Lessons Learned

This incident taught me a few useful lessons about infrastructure and security:

- Regular Auditing is Essential
- Documentation Matters
- Monitoring Pays Off

Good monitoring (Grafana stack + Tautulli) made this fast and boring — which is exactly what you want. Without it, I might never have noticed the pattern.

Even simple, harmless configs can age into problems. What started as a fun experiment turned into a forgotten connection that looked suspicious during a review. If we’d documented the server‑to‑server connection, this would have been a 2‑minute check. Write down changes — even the “temporary” ones.

---

## Self‑Hosting: What I Actually Recommend
If you run Plex (or anything similar) at home, here’s what’s worked well for me:

- Use Cloudflare Tunnel instead of open ports. It’s free, removes the need for port forwarding, and gives you helpful logs and analytics.
- Watch your stuff. Grafana (for logs/dashboards), Tautulli (Plex activity), and simple uptime checks cover 95% of what you’ll need.
- Narrow the attack area. Country allowlists or access rules in Cloudflare cut down noise and opportunistic scans.
- Run in containers, ideally rootless. It’s easier to maintain and limits damage if something goes wrong.
- Do a quick audit every ~6 months. Look for shared servers you forgot about, skim access logs for weird patterns, apply updates, and note any changes you make.

---

## Conclusion
The Plex incident was a good reminder to audit my setup. The “suspicious” connections turned out to be harmless — a long‑forgotten server share — but the investigation proved the value of visibility.

Being able to trace connections end‑to‑end (Grafana logs → Cloudflare analytics) made it easy to gain confidence in the setup. If you self‑host, invest a little in observability and you’ll sleep better.

One last check I like to ask: “If this service gets compromised, what access would an attacker gain, and to what data?” Design so the answer is “as little as possible.”

Stay vigilant, keep monitoring, and don’t forget to document those late-night experiments - your future self will thank you during the next security audit! Hence why I wrote this blog post, so I can remember what I did in the future.
