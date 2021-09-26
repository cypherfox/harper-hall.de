---
title: "The Three Holy Grails of DevOps"
#date: 2021-09-12
#thumbnail: "img/placeholder.png"
tags:
  - "dev-ops"
categories:
  - "Software Engineering"
#menu: main
draft: true
---

Establishing DevOps is a change in culture. It is all about trust,
personal empowerment and cooperating on a larger goal. 

There is neither such a thing as a DevOps-Engineer nor a DevOps team
(and neither is there a Full-Stack Developer, but that is a story for
another day). 

But there are technical and organizational steps that help to improve
the effectiveness of your organization and the quality of the services
you provide. Yet, this is still an cultural change and likely to require you to change your organization in order to achieve them. 

I propose three overarching goals that should guide your design and break them down into a number of individual approaches for more specific design choices. I hope to get around to writing individual postings on how to actually implement these corollaries in the future, but this may take some time. Please do not hold your breath.

## What do I mean with Holy Grail?

The Holy Grail I am referring to is not so much the drinking vessel
of the son of a middle class craftsman (He could afford to marry out of
town). 

Rather it is more about an idealized goal, as described by Arthurian lore
and Parsifal and other works of the medieval troubadours. This goal
is distinguished by the fact that it cannot be reached by mere
mortals. Attaining them requires you to transform yourself, in order
to fulfil the stated ideal of deed, word and thought. But the search
may also transform you to become something you did not set out to
be. And therein lies the impossibility of obtaining the Grail: only a
saint can even touch it, not mere mortals like you and me. 

But the ideals, which the grail represents, are still worthwhile to
strive for, as they help humans to live better lives. Not despite the
fact that we will not reach them, but because of it. 

## The First Holy Grail: Deploying to production does not require any human interaction.

The idea of test-automation, Constant Integration (CI) and Constant
Deployment (CD) have been around for a number of years. They have
been published widely, e.g. "[Continuous Delivery](https://www.amazon.com/-/de/dp/0321601912)" by Humble and
Farley. In the "[DevOps Handbook](https://www.amazon.com/-/de/dp/1942788002)" by Kim
et.al. Section III even focuses on the benefits for organizations to
undertake this transformation. 

But very few organizations carry this through to the logical end: after
a developer has written a piece of code, nobody (especially not the
developer) should need to have any manual interaction with
it. 

Unless the code is deemed unfit for production and needs further work. 
In which case the pipeline informs the developer proactively that
deploying the code failed. There must be no constant polling of
websites for any updates. No news is good news. 

I believe that facing the fear is the hardest problem: do we trust the
code to run it in production? Too often this is not resolved with more
tests, but rather deployments are postponed to regular
intervals. This will only increase the pain when the massive change is
deployed eventually. 

In order to check your progress towards this Grail, I would suggest the following metric: broken builds per commit. It counts the commits that did not successfully deploy to production, divided by the number of commits made. If it consistently hits zero, then you have reached the Grail. 

This metric is not for managers! There are so many ways to fudge this metric if you want to, to make it worthless as a measurement of dev productivity. But it can be an indicator of the efficiency of the QA pipeline!. As we trust the dev to work as thoroughly as they can, failing later pipelines *may* indicate that the dev was let down by not being able to work certain parts of the CI pipeline or the QA system. And both should be maintained by the developers themselves, they need put more effort into improving it.


### Corollary 1.1: Each and every commit is a potential deployment to production.

**Goal: The developer will change the state of the system exclusively by
pushing code and data to the a Version Control System.** (VCS, e.g. git)

This is an element of the most central core of DevOps and GitOps:
absolutely all changes to the system occur via committing source code
to a VCS. All other steps are automated away.

But despite being this vital, it seems to be the most difficult to
actually achieve. Even in a unlikely situation, where there are no
restrictions on time or resources this may goal may be hard to attain
for a number of reasons.

The biggest issue the need to utterly trust each developer with the
well-being of the whole organization. As the complete state of the
production can be changed with a simple commit, proposing to implement may create only a lukewarm reaction from upper management, investors or even
the customers. Beyond organizational rules, there may also be
regulatory obligations that require at least a 4-eye policy.

Maybe providing some form of guardrails against unintended mishaps is not a bad idea. Humans make mistakes.  Fortunately this need can easily be turned into a strength by establishing a strong **Review Process**. This does introduce a further manual step but not only
fulfills any need for application of the 4-eye principle, but also provides
a way for junior developers to learn and discuss code and architectures by
being required to review code of others as well as the more experienced team
members.

If you want to find out how close you are to achieving the goal,
simply document any manual steps a developer has to perform before
changes are deployed to production.
  
### Corollary 1.2: All resources are available via APIs.

**Goal: acquiring all resources needed for work can be achieved via
APIs. These APIs should be wrapped in ready made Web UIs oder CLI
command tools. The latter can again in turn be used for automation scripts.**

Many seemingly fully automated CI/CD pipelines rely on a costly
initial setup to acquire all resources potentially needed to full-fill
any later goals. This process often is not fully automated, but rather
requires manual sign-offs of superiors and lengthy budget planing.

This has multiple drawbacks:

* Resources may not be available when development starts or pivots, as
  they are procured in large blocks and may require a lot of
  organizational overhead to attain

* Scaling the resources used at every level is not part of the overall
  development process. Therefore it is often considered to be in the same
  segment as security or documentation ("we can do that later")
  
* Resources have to released manually when they are not used and many users
  are unwilling to do so, especially when a lengthy and painful
  process was required to gain the resources in the first place.

A better approach is to make every and all resources available through
an API. This does not only includes CPU and Memory for
computation. But also network IDs (i.e. IP addresses), access to or
from the internet at large, DNS entries. As a logical progression,
granting access to resources or the right to request further resources
should be made available via an API, in order to create any needed
delegation scenario.

Additionally, resources should be reclaimed automatically when not in use, or after a certain time, unless the request has been renewed. This is
especially useful in development contexts, as recreating a working
software stack from scratch becomes part of the daily experience from
the start of any project. 
  
Technically reaching this goal is simple when you only consume
resources from the public cloud, as that it is the only method to
procure resources from the cloud providers like AWS, Microsoft Azure
or Google GCS. But even for a private cloud this is not really
challenging. Either by spending money for Enterprise solutions like
[Red Hats
OpenShift](https://www.redhat.com/en/technologies/cloud-computing/openshift)
or [SuSE Rancher](https://rancher.com/), alternatively through
open-source solutions like [Open Nebula](https://opennebula.io/) for
virtual machines or the [Metal Stack](https://metal-stack.io/) for
Kubernetes based container solutions.

### Corollary 1.3: Any approval processes for resources must be abstracted away.

**Goal: requesting any resources does not require a manual step**

Where many organizations squander the capabilities offered by an API
driven procurement of resources is the process required of users to
gain access to these resources. This can often be traced back to a lack of
trust within the organization. Developers are not trusted enough to
act within the interest of the organization and sparingly use the
available resources. One common result is time wasted on the discussion
whether a certain resource is needed, when and how much of it.

The result of a painful approval process is usually some amount of
hoarding resources. When it was painful to get access to a resource,
it is only human to be reluctant to give it up, as potential future
use would the pain to be endured again. This is usually compounded by
the perception that an increase of the amount of resources does not
reflect in an analogue increase of effort. Thus it makes sense for the
user to *always* overestimate the amount of resources needed, lest she
will have to repeat the process for requesting more resources.

From a business and cost control point of view it may makes a lot of sense
to require a human to request any resources at least once. This could
happen through a needed permission being delegated to a CI/CD
pipeline. Or through a one-time interaction of a human with the API,
regardless of a CLI command or a web UI being used. 

But the request should not require the human to enter any information
other than the resource type and scope required (e.g. how may vCPUs,
how much GB of RAM). Ideally this request is also not made implicit in some ordering portal, but rather explicit when the resource is actually used.

Why ask for a reason or explanation. This shows a lack of trust. Why
have a human run around and collect signatures on a piece of paper?
A computer can contact and inform any required reviewers much faster,
and thus cheaper. The initial user has already stated his or her
needs. If the organization does not trust that user with a few spare
cycles, how should it trust them with the cost of developing
software. 

Whether the decision to grant or deny the resources is a simple or complex one, it should all be automated, requesting input from other parties when
needed. Any final decision should be presented proactively to the
requester. And making completely transparent why the decision has been
reached. 

Hide complex business rules for releasing resources to individual
behind a higher level platform that encapsulates both the approval
processes and technical details of making the resources available.

### Corollary 1.4: A new working configuration is derived automatically

**Goal: The Component Version Vector (CVV) for a working combination of components is derived automatically.**

One point of contentions I have experienced in the past is the need to
manually define deployment configurations from multiple versions of
components. E.g. Update of component X may require the component Y, which may nor may not collide with the dependency requirements of component Z.
As this is hard to do, most will start to talk about DLL-Hell of incompatible component versions and shirk at updating the versions of the overall set.

Solutions for statically defining component vectors have around for many years with tools like Maven or Ivy for Java, Helm charts in the cloud-native realm. A human needs to figure out the working combination and write that down.

One step further are the dependency management systems of Ruby, Elixir or Golang, as the allow defining ranges of semantic version that are expected to work together, and leave it up to a specialized solver for figuring out a working CVV.

But in the case of loosely coupled services deployed across the cloud, there has not yet been a widely adopted solution.

## Grail 2: No Human comes in contact with any secrets used in production

Providing services with software components used to be split into at least two parts: developing and operating the software. In that context the developer never comes into contact with any of the data of the customers, as actually running it in production is the responsibility of somebody else. With the change to DevOps mantra of "you write it, your run it", this has changed, as everybody within the organization may need to access the production environment in some form or other.

But the DevOps paradigm shift should not mean that everybody can freely read the customer data, or maybe even write to it. And I take the customer data to include the customer credentials as well as the actual production data provided by the customers or its customers in turn. Customer credentials may either be used to authenticate between components internally or to external services, e.g. other cloud service providers.

## Corollary 2.1: Expect your code to be published to GitHub any day now.

**Goal: The code base shall be created as such that publishing all source code publicly will neither risk the confidentiality of customer data nor threaten availability for the services rendered.**

This is a decision that your organization will likely never make. This can
be due to financial reasons. The source code you write represents a
substantial investment, from which the company seeks to generate
revenue and fend of competitors. Or there can be strategic reasons, as
management simply sees no benefit from open-sourcing the code. Bizarre
liability laws may actively create a barrier to make one code publicly
available. 

But in the presence of source code being stolen and attacks by state
actors, the code may become public without your or your organizations
blessing. Let the lawyers go after anybody who tries to set up a clone
of your service using your software. At least you will not have to
scramble to secure your customer data. 

It is a good indication that you on track on achieving this goal, when all source code should is visible for all members of the organization. No silos with secret code drops. No devs-only version control systems. 
  
This goal can only be reached when even all configuration can be made public and still not endanger the integrity of customer data or service availability. This may seem strange at first but by following the next corollary may actually be achieved.

### Corollary 2.2: Credentials are not shared.

**Goal: No human shall need to handle (CRU) any credentials except
their personal ones. Neither as proxy for other people or
machines. Nor to setup or bootstrap any process. If a machine needs
credentials, it needs to create its own and a secure key exchange must
distribute them.**

If a human creates a secret and then shares it with a computer, it creates the same problem as if the human would create credentials for other humans. This is generally accepted as bad practice. But while it is common for humans to receive an initial password that needs to be changed as soon as possible, the same is often not true for machine credentials.

The same is true when humans are authenticating to machines. While Identity and Account Management (IAM) systems are the accepted practice, all too often users are expected to enter their passwords in multiple login dialogs in clear text, again sharing the information with more machines. Do not use clear text password exchanges to anybody or anything. That's whats mTLS and ssh are for.
  
## Grail 3: No Human has Privileged Access to Production Systems.

Most software stacks today establish the role of some form of admin user, that has the power to change any aspect of the system state, read any credential or data within the application. This poses two fundamental problems: 

First there has to be a person that is trusted enough to be granted such sweeping powers. This may be valid for a installation and setup scenario and thus be limited to a single person per trust domain and this a separation of concerns over the full set of domains within an organization. There may even be a 4-eye principle be applied during a time-boxed installation time. But this requires more and more effort for long term service delivery. What happens when an admin leaves the organization? Are there enough people available 24/7 that can provide 4-eye operation? While this may be possible for large, especially critical infrastructure operations, it quickly becomes unwieldy and expensive.

Secondly it creates a target for attackers. This may either be electronic, by making the credentials of such an individual especially valuable for attackers. But I may also be social or even physical, by coercing the holder of such credentials to act for the attacker. I the overall system is designed in such a manner that change is a normal process, in which unexpected changes will raise a number of alarms and e.g. do not pass checks and reviews, the utility of threatening the well-being of a member of the organization or their family is greatly reduced.

In reality there may be special circumstances, in which privileged operations have to be performed. But these should either follow the same guidelines as the initial installation or use special break-glass procedure that are obvious to many when used and the contained credentials are not available to any human unless the glass is actually broken. After which the credentials are rotated and the procedure is reset.

### Corollary 3.1: System Management through unprivileged programs

**Goal: All changes to the configuration of any production system is achieved through configuration automatically picked up by the system, or software written to manipulate the state of the system.**

This is an extension to GitOps, which will serve almost all needs once a sufficiently trusted distribution and deployment system is in place.  For unexpected corner cases, one-time scripts can be used. There must be no more "I just run these two dozen commands from my shell history". This is neither reproducible, nor auditable.

As the configuration and state change scripts are not only configuration-as-code, but possibly code-as-code, they can pass through the already established review and testing process. Making changes to the system should be normal daily business.

The changes should be picked up in a pull-based manner. The target system should be able to discover that a requested change is available and apply it once.
  
### Corollary 3.2: Only one account per human allowed

**Goal: as there is no privileged operation any more, there is not need for administrative accounts. The must only be one account per human**

This is an aim that aims both at reducing the complexity of
maintaining credentials for the users and granted permissions based on
these credentials for management.

Especially in regulated environments a regular report about the granted
permissions and their review has to be prepared. This is made a lot
easier if only a single account is managed by the organization for
each human interacting with the system, regardless of their role in
the organization or even those external to it.

At the same time, a smaller number of credentials does improve the
likelihood of stronger password being used. When a single password for
a shared account, or even better a Single Sign On (SSO) system is
used, it is easy for users to remember even fairly complex password
without the need to write them down. 

This single account then can easily be combined with multi-factor
authentication, which improves security even further.

### Corollary 3.3: No human access to customer data

**Goal: there is no clear text access to customer data, either while the system is operating nor while it is stopped.**

Implementing this would be straight forward: encrypt all data in transit or at rest. There must be no more quick unpack by a
super-user. And as the required keys and credentials are not shared with human users (as per 2.2), there is not even the possibility of a data leak. Unless a suitable exfiltration function was built into the system. Which should be made impossible through the code review discussed in 1.1 as well as the fact that all other devs could see it, due to 2.1.

Unfortunately does this approach create a string of hen-and-egg scenarios that have to be worked through carefully. But even worse is the fact that a lot of software stacks do not offer the features to support this. And as few customers are willing to pay for these security features, the companies and projects offering them are unwilling to invest the effort to implement them.

