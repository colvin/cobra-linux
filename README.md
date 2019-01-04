# ccl

Colvin's Container Linux

## Rationale

While I'm personally an avid \*BSD user, using the Linux platform and the GNU
environment is often a constraint. Yet each Linux distribution I try to invest
in leaves me dissatisfied and pining for the clean, structured, no-nonsense
approach of the BSD systems. [Alpine](https://alpinelinux.org/) is probably the
closest approximation, but the extreme minimalism of the system, the use of the
non-standard musl C library, and the core tooling being provided by busybox is
a bit of a deal-breaker. [Arch Linux](https://alpinelinux.org) is my preferred
Linux for a desktop system, but doesn't translate well when deploying systems
for stable production workloads.

While I've built plenty of software and have been managing my
[FreeBSD](https://www.freebsd.org/) systems using a source-based approach for
years, I haven't done much of that in the GNU/Linux environment and I haven't
done much with compiler toolchains. While running through the [Linux From
Scratch](http://www.linuxfromscratch.org/) project, it occurred to me that
maybe I can try to build my own distribution that satisfies my needs.

One of the primary reasons for the Linux environment constraint is the
[Docker](https://www.docker.com/) platform. FreeBSD offers a great container
infrastructure through Jails, but lacks the degree of tooling that Docker
brings to the table. Yet, it seems that there are no Linux distributions
optimized for use as a container image natively (yet). Most distributions are
still tailored for bare-metal (or hardware virtualization) use, or (like
Alpine) require an extensive image building process to bring in all of the
necessary tooling to provide a rich platform for deploying, managing, and
running applications in a container.

## Goals

The primary goal of the project is honestly just for me to learn more about the
construction of the GNU/Linux ecosystem, and how to better construct build
infrastructures.

Other goals of the project:
- Optimized for container images
- Small, without obsessing over minimalism
- Batteries included, with a tightly curated set of core utilities
- No clutter, no mess.

## Approach

To start, the approach is to simply create build automation around the LFS
system. Once that is operational, I will begin to explore modifications to the
system to tailor it towards my preferences and the goals of the project.
