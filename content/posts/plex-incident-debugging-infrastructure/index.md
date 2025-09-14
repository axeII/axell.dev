---
date: 2024-12-19T10:30:00Z
description: "How I debugged suspicious Plex connections using Grafana, Tautulli, and Cloudflare Tunnel after the recent security incident"
draft: false
slug: "plex-incident-debugging-infrastructure"
tags: ["home-lab", "plex", "security", "cloudflare", "grafana", "tautulli"]
title: "Debugging Suspicious Plex Connections: A Deep Dive Into My Self-Hosted Infrastructure"
showHero: false
---

Last week, Plex announced a security [incident](https://forums.plex.tv/t/important-notice-of-security-incident/930523) (please visit the link for more info) where their user database was compromised, forcing all users to log out of their sessions - including server connections. As someone who self-hosts a Plex instance, this immediately caught my attention as my instance is publicly available and not behind a VPN. While the incident caused some issues for users (as widely discussed on Reddit), it served as a perfect reminder to audit my own infrastructure and ensure everything was secure. So in this blog post together we'll walk through how I debugged some suspicious connections to my Plex server using Grafana, Tautulli, and Cloudflare Tunnel.

## The Wake-Up Call

The Plex incident was a stark reminder that even established services can be compromised. When I received the email with the instructions, I knew it was time to thoroughly check my own setup. Check any activity and do security audit if everything is correctly configured and no suspicious activity on the network can be found. As a self-hoster, you are responsible for your own security and monitoring. Let's dive into it:


## The Investigation Begins

My first instinct was to check my monitoring stack to see if there had been any unusual activity on my Plex server. This is exactly why having proper observability in your homelab is crucial - incidents like these require immediate investigation. Without logs and monitoring, you are flying blind. Quick overview of my setup:

### Core Components

- **Plex Media Server**: Running in Docker containers on Kubernetes
- **Cloudflare Tunnel**: Eliminates the need for port forwarding
- **Grafana**: Log aggregation and monitoring dashboards
- **Tautulli**: Plex-specific monitoring and analytics

### Security Measures

- **No Open Ports**: Everything routes through Cloudflare Tunnel
- **Country Whitelisting**: Cloudflare rules limit access to specific countries
- **Container Isolation**: Plex runs in isolated containers rootless
- **Regular Monitoring**: Automated alerts for unusual activity patterns

### Step 1: Grafana Logs Analysis

I started by checking my Grafana dashboard, which aggregates logs from all my services. Almost immediately, I noticed something odd: there were strange connections happening consistently around ~3-9 AM. These connections stood out because they occurred during hours when I knew no one in my household was using Plex. Btw when I studied the issue more, I found that this is know bug on cloudflare side that some connection are not closed properly please see this github issue for more info: https://github.com/cloudflare/cloudflared/issues/1300. 

Anyway the patterns were regular and predictable, which made them even more suspicious. Legitimate user traffic tends to be sporadic and varies based on viewing habits, but these connections had an almost mechanical consistency to them.

![grafana logs](https://img.axell.dev/plex%3Agrafana.webp "Grafana logs showing suspicious connections")

To verify my suspicions, I checked Tautulli - an excellent monitoring tool for Plex servers that tracks user activity, play statistics, and connection details. Tautulli confirmed what I suspected: during those ~3-9 AM time windows, there were no active users consuming media on my server.

This ruled out legitimate user activity and confirmed that something else was making these connections. The question now was: what or who is doing these connections?

### Step 3: Cloudflare Tunnel Investigation

Since I use Cloudflare Tunnel to expose my Plex server without opening ports on my router (a security best practice I highly recommend), my next step was to examine the tunnel logs. Cloudflare Tunnel is fantastic because it creates a secure outbound connection from my network to Cloudflare's edge, eliminating the need for port forwarding.

In the Cloudflare dashboard, I could see traffic patterns that correlated with the suspicious connections I'd found in Grafana. Importantly, all the IP addresses were from Cloudflare's infrastructure, which was expected since all traffic routes through their network first.

#### The Cloudflare Admin Panel Deep Dive

This is where things got interesting. Digging deeper into the Cloudflare admin panel, I was able to trace the source of these mysterious connections. The IP address that kept appearing in my logs led me to discover something I'd completely forgotten about.

![cloudflare1](https://img.axell.dev/plex%3Acloudlfare1.webp "Cloudflare dashboard showing traffic patterns")

#### The Culprit Revealed

After correlating the IP addresses and doing some detective work, I discovered the source of the mysterious connections: my friend's Plex server.

It turns out that several years ago, we had connected our Plex servers together for fun - probably to share libraries or test some features. This is a legitimate Plex feature that allows server owners to share content with each other. However, we had both completely forgotten about this connection, and it had been quietly running in the background ever since.

![cloudflare2](https://img.axell.dev/plex%3Acloudlfare2.webp "The Suspicious IP address which was my friend's home ip in the end")

My friend's server was periodically reaching out to mine, likely for status checks or library updates. While this wasn't malicious, it was definitely unexpected and explained the regular ~3-9 AM connection patterns (probably when his server was doing maintenance tasks).

## Lessons Learned

This incident taught me several valuable lessons about infrastructure management and security:

### 1. Regular Auditing is Essential

Even seemingly innocent configurations can become security concerns over time. What started as a fun experiment years ago became a forgotten connection that looked suspicious during a security review.

### 2. Documentation Matters

If we had properly documented our server connection experiment, this investigation would have been much shorter. Always document your infrastructure changes, no matter how small or temporary they seem.

### 3. Monitoring Pays Off

Having comprehensive monitoring (Grafana + Tautulli) made it possible to quickly identify and investigate the suspicious activity. Without these tools, I might never have noticed the pattern.

---

## Recommendations for Self-Hosters
Based on this experience, here are my recommendations for anyone running their own Plex instance or similar self-hosted services:

### 1. Use Cloudflare Tunnel

Instead of opening ports on your router, use Cloudflare Tunnel to securely expose your services. It's free, secure, and provides excellent logging and analytics.

### 2. Implement Proper Monitoring

Set up monitoring tools like:

- **Grafana stack** for log aggregation and dashboards
- **Tautulli** for Plex-specific monitoring
- **Uptime monitoring** to ensure services are accessible

### 3. Geographic Restrictions

Use Cloudflare's security features to whitelist only the countries where you expect legitimate traffic. This significantly reduces your attack surface.

### 4. Container Deployment

Run Plex in Docker containers or Kubernetes for better isolation and easier management. This also makes updates and rollbacks much simpler. Ideally run them as rootless.

### 5. Regular Security Audits

I think it can be heatly to schedule regular reviews of your infrastructure, at least every 6 months. And run these checks:

- Check active connections and shared servers
- Review access logs for unusual patterns
- Update and patch all components regularly
- Document all configuration changes

---

## Conclusion
While the Plex security incident was concerning, it served as an excellent reminder to audit my own infrastructure. The "suspicious" connections turned out to be harmless - just a forgotten server connection from years past. However, the investigation process demonstrated the value of having proper monitoring and security tools in place.

The ability to quickly trace connections through my entire stack - from Grafana logs to Cloudflare analytics - gave me confidence that my infrastructure is both secure and observable. For anyone self-hosting Plex or similar services, I can't emphasize enough how important it is to have this kind of visibility into your systems.

Self-hosting gives you control and privacy, but it also comes with responsibility. Incidents like these remind us that we need to be proactive about security and monitoring. With the right tools and practices, you can have both the benefits of self-hosting and the peace of mind that comes with knowing your infrastructure is secure and well-monitored.

You may think you are safe but I recommend to asking your self that: _"If this service get's compromised, then what kind of permission will the attacker get and what kind of data will they get access to"_? 

Stay vigilant, keep monitoring, and don't forget to document those late-night experiments - your future self will thank you during the next security audit! Hence why I wrote this blog post, so I can remember what I did in the future.
