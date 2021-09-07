---
title: "The Three Holy Grails of DevOps"
date: 2021-05-31
thumbnail: "img/placeholder.png"
tags:
  - "dev-ops"
categories:
  - "Software Engineering"
menu: main
---

Establishing DevOps is a change in culture. It is all about trust,
personal empowerment and cooperating on a larger goal. 

There is neither such a thing as a DevOps-Engineer nor a DevOps team
(and neither is there a Full-Stack Developer, but that is a story for
another day). 

# What do I mean with Holy Grail?

The Holy Grail I am refering to is not so much the drinking vessel
of the son of a middle class craftsman (He could afford to marry out of
town). 

But is more about an idealised goal, as described by Arthurian lore
and Parsifal and other works of the medieval troubadours. Theis goal
is distinquished by the fact that it cannot be reached by mere
mortals. Attaining them requires you to transform yourself, in order
to fulfil the stated ideal of deed, word and thought. But the search
may also transform you to become something you did not set out to
be. And therein lies the impossibility of obtaining the Grail: only a
saint can even touch it, not mere mortals like you and me. 

But the ideals, which the grail represents, are still worthwhile to
strive for, as they help humans to live better lives. Not despite the
fact that we will not reach them, but because of it. 

# Grail 1: Deploying to production does not require any human interaction.

The idea of test-automation, Constant Integration (CI) and Constant
Deployment (CD) have been around for a number of years. They have
been published wideley, e.g. "[Continous Delivery](https://www.amazon.com/-/de/dp/0321601912)" by Humble and
Farley. In the "[DevOps Handbook](https://www.amazon.com/-/de/dp/1942788002)" by Kim
et.al. Section III even focuses on the benefits for organisations to
untertake this transformation.

But very few organistions carry this through to the logical end: after
a developer has written a piece of code, nobody (especially not the
developer) should not have any manual interaction with
it. Unless the code is deemed unfit for production. In that the
pipeline informs the developer proactively that deploying the code
failed. No regular polling of websites for any updates. No news is
good news.

- the problem of facing the fear: do we trust the code to run it in
  production. Too often this is not resolved with more tests, but
  rather deployments are post-poned to regular intervals. This only
  increases the pain.

## Corollary 1.1: Each and every commit is a potential deployment to production.

**Goal: The developer will change the state of the system exclusively by
pushing code and data to the a Version Control System.** (VCS, e.g. git)

This is an element of the most central core of DevOps and GitOps:
absolutely all changes to the system occour via commiting source code
to a VCS. All other steps are automated away.

But despite being this vital, it seems to be the most difficult to
actually achieve. Even in a unlikely situation, where there are no
restrictions on time or resources this may goal may be hard to attain
for a number of reasons.

The biggest issue the need to utterly trust each developer with the
well-being of the whole organisation. As the complete state of the
production can be changed with a simple commit, this not likely to
receive a positive reaction from upper management, investors or even
the customers. Beyond organistional rules, there may also be
regulatory obligations that require at least a 4-eye policy.

But at least this should be in the form of a protection against
unintendet mishaps. Humans make mistakes and it is only sensible to
provide some guardrails to protect against that. 

Fortunately this need can easily be turned into a strength by
establishing a strong **Review Process**. While this does introduce a
futher manual step, it has beneficial side effects of not only
fullfilling the 4-eye principle, but also provides a way for junior
developers to learn and discuss code and architectures by being
required to review code of others as well as the more experienced team
members.

Futher obstacles commonly given as a reason why this goal cannot be
reached can be found in the corollaries below.

If you want to find out how close you are to achieving the goal,
simply document any manual steps a developer has to perform before
changes are deployed to production.
  
## Corallary 1.2: All resources are available via APIs.

**Goal: aquiring all resources can be achived via APIs.**

Many seemingly fully automated CI/CD pipelines rely on a costly
initial setup to aquire all resources potentially needed to full-fill
any later goals. This process often is not fully automated, but rather
requires manual sign-offs of superiors and lengthy budget planing.

This has multiple drawbacks:

* Resources may not be available when development starts or pivots, as
  they are procured in large blocks and may require a lot of
  organisational overhead to procure 

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

Also resources should be taken away when not in use, or after a
certain time, unless the request has been renewed. This is especially
usefull in development contexts, as recreating a working software
stack from scratch is part of the experience from the start of any project.


- more of an organisational problem than a technical one, as single
  employees might acrue very high resource costs.
  
- hard to control, as requests are automated, and errors at the end of
  the lifecycle of resources may not be caught and thus resources not
  be released and thus add to the resource costs. Here, a control-loop
  approach serves well again, to ensure that nothing is requested (or
  not released) that is not used either.

## Corollary 1.3: A new working configuration is derived automatically

**Goal: The latest possible configuration of components for deployment
to production is derived automatically.**

One point of contentions I have experienced in the past is the need to
manually define deployment configurations from multiple versions of
components. E.g. Update


# Grail 2: No Human comes in contact with any secrets used in production

## Corollary 2.1: Expect your code to be published to Github any day now.

**Goal: The code base shall be created as such that publishing all
source code publicly will neither risk the confidentiality of customer
data nor threaten availability for the services rendered.**

It may be a decision that your organisation will never make. This can
be due to financial reasons. The source code you write represents a
substantial investment, from which the company seeks to generate
revenue and fend of competitors. Or there can be strategic reasons, as
management simply sees no benefit from open-sourcing the code. Bizarre
liability laws may actively create a barrier to make one code publicly
available. 

But in the presence of source code being stolen and attacks by state
actors, the code may become public without your or your organisations
blessing. Let the lawyers go after anybody who tries to set up a clone
of your service using your software. At least you will not have to
scramble to secure your customer data. 

- all source code should be visible for all members of the
  organisation. No silos with secret code drops.
  
- The Grail can only be reached when even all configuration can be
  made public and still not endanger the integrity of customer data or
  service availability.


## Corollary 2.2: Credentials are not shared.

Target: No human shall need to handle (CRU) any credentials except
their own, personal ones. Neither as proxy for other people or
machines. Nor to setup or bootstrap any process. If a machine needs
credentials, it needs create their own and a secure key exchange must
distribute them.

- use secure key exchanges

- do not use clear text password exchanges to anybody. That's whats
  mTLS is for.
  
  
A corollary of this Grail is the aim to a) encrypt all customer data
in transit as well as at-rest and that no developer should ever get
access to them, unless explicitly created through a function of the
software written for the service. No more quick unpack by a
super-user.

# Grail 3: No Human has Privileged Access to Production Systems.

- especially hard for initial system setup, often creating hen-and-egg
  problems. But the creation of self-service platforms can minimize
  this to a few central systems. These can be set up and maintained
  with maximum oversight, and all other components can derive their
  permissions from here.

## Corollary 3.1: System Management through unprivileged programs

Target: All changes to the configuration of any production system
shall be achieved through the setting of configuration to be picked up
by the system, or software written to manipulate the state of the
system.


- Do GitOps most of the time. When this is not sufficient, write a
  script that will do the clean-up for you.
  
- Any changes to the system can only be picked up by the system
  itself. Changes are made available through GitOps. Us pull based
  machnism to introduce change to the system.
  
- No more "I just run these two dozen commands from my shell
  history". This is neither reproducible, nor auditable.


# Further Observations

- Test as much as is comfortable local to the users. Theses tests
  should finish before the attention span of the dev ends (<90
  seconds).  

- Establish metric: broken builds per commit. This is not for
  managers! there are so many ways to fudge this metric if you want to, to
  make it worthless as a measurement of dev productivity. But it can
  be an indicator of the efficiency of the QA pipeline!. As we trust
  the dev to work as thoroughly as they can, failing later pipelines
  *may* indicate that the dev was let down by not being able to work
  certain parts of the CI pipeline or the QA system. 

