---
# Common-Defined params
title: "Efficient Development Checklist"
date: "2006-06-03"
#description: "Example article description"
categories:
  - "Software Engineering"
#  - "Category 2"
tags:
  - "lang-en"
  - "software-engineerin"
#menu: main # Optional, add page to a menu. Options: main, side, footer

# Theme-Defined params
#thumbnail: "img/placeholder.jpg" # Thumbnail image
#lead: "Example lead - highlighted near the title" # Lead text
#comments: false # Enable Disqus comments for specific page
#authorbox: true # Enable authorbox for specific page
#pager: true # Enable pager navigation (prev/next) for specific page
toc: false # Enable Table of Contents for specific page
#mathjax: true # Enable MathJax for specific page
sidebar: "right" # Enable sidebar (on the right side) per page
#widgets: # Enable sidebar widgets in given order per page
#  - "search"
#  - "recent"
#  - "taglist"
---


From a discussion with a few colleagues, I was assured of the
impression, that while, allmost everybody in software developments
knows three things: a) the process (what process?) in most
organisations is broken and b) everybody has heard that other, larger
better organisations use modern methods (”Oh, that, yes I read about
<fortune 500 company> is doin’ it.”) and nobody is using it
themselfs, for various reasons. Myself included.

There are a number of small things that you can introduce piece by
piece into your development process and see if they work. No need to
proclaim to follow the latest agile programming fad. Just do a few
little things at a time. Don’t bother upper management with it. Just
reach your goals and collect the pay rise at the end of the year.</p>

I am sure that some of the points below are obvious to you and you
say “we have been doing this for many years now”. Good for you. Now go
on an tackle the next one. Check how many you are consistently
doing. In every project. For single every and any development object,
be it documentation or code. This is a checklist for me as it is for
you. So come back occasionaly and check if you are still doing all you
can.

## Version Control

Use a Version Control System (vcs). Be it something simple and free
like CVS or better Subversion or a complex commercial system like
VisualSourceSafe, Continuous, just have every scrap of code or
documentation be controlled by a version control system. And check in
early and often. And not just source code. Tracking the changes of
documentation is probably even more important.

### Preparations: ###

Set up a repository. Will take from 5 Minutes to 8 Hours, depending on product
and project. Install proper clients for your OS and IDE. 

### Ongoing effort: ###

Less time than the effort to copy your local copy to a shared folder
on a network drive. Usually <5 seconds per check-in  

### Links: ###

* [Concurrent Version System](http://www.nongnu.org/cvs/(CVS)
* [Subversion](http://subversion.tigris.org/)
* [Perforce](http://www.perforce.com/) (proprietory)

### Further reading: ###

## Test first ##

No, don’t say “we don’t do Extreme Programming here” yet. This has
only very little to do with XP and a lot with writing code for tasks
that you really understood and will be able to check that you
understood correctly three month later. The actual application code
will document how you meant to solve the problem, but the test code
shows what you thought the problem to be. It documents your
assumptions.

### Preparations: ###

### Ongoing effort: ###

Write a test *before* the implementation. You will have to, later on,
anyway.

### Links: ###

* [JUnit](href="http://www.junit.org/) Unit Testing for Java

### Further reading: ###

## Automated Build ##

No, clicking on “Build Project” in Eclipse is not an automated build.

The usual tools are `make` for the C/C++, mainly Unix/Linux
world, `ant` for java. For the .Net world there exists a
`nant` that I have not used yet.

But if you like for instance `ant`, it is not only for Java, just
happens to be written in Java. It can help you automate, and thereby
document each and every step you make to build, package and deploy
your code.

### Preparations: ###

Learn the configuration language of your choosen tool. Modern ones
ususally use XML files, so all you have to do is read up on the
workings of the tags.

### Ongoing effort:

Maintaining the build file is easier than writing documentation on how
the project needs to be build or continously educating your co-workers
on how the project is to be build.

### Links: ###

* [Ant](http://ant.apache.org/): Automated Build not only for Java

### Further reading: ###

## Automated Test ##

Not just Unit tests. Every test is worthy to be run automatically.

### Preparations: ###

### Ongoing effort: ###

### Links: ###
### Further reading: ###

## Continous Integration ###

Now that your build and your tests run automatically, why not do them
every time somebody changes anything in the whole of the project.

### Preparations: ###

### Ongoing effort: ###

### Links: ###

### Further reading: ###

* [Continuous Integration]("http://www.martinfowler.com/articles/continuousIntegration.html)
  Article by Martin Fowler.

## Bug Tracking ## 

Even if there is no seperate support or customer care department, you
should write everything the customer tells you that he is not
satisfied with into a bug tracking database. If it is not in the
Tracker it did not happen. If you use one, it is easy to prove to
management as well as the customer what you are actually doing. It
also helps collect information about a bug from different source. And
if a bug is occouring seldomly you will not suffer from a split brain
problem where one developer does not learn of what was reported to
another depeveloper.

### Preparations: ###

### Ongoing effort: ###

### Links: ###

### Further reading: ###

## Test First Debugging ##

Write a test that reproduces the problem. Add test to automtic
tests. Now fix the actual problem. You win two things. You document
exactly what acctually caused the problem. And you also can be sure
that future changes to your code do not make your code susceptible to
that particular problem. You can be sure that bugs stay fixed.

### Preparations: ###

### Ongoing effort: ###

### Links: ###

### Further reading: ###

## Delta Debugging ##

If you have a large set of input data that will cause a programm to
misbehave, your first need to trim away the fat and find out what the
relevant elements of the data for making the bug appear are. This will
help you greatly not only to write a test for the previous point in
this list, it will also help you finding out what is causing the
problem and fixing it.

Now you could sprinkle your liberally with `printf()/println()`
statements and then wade through mountains of logs, or you could have
the computer do the work for you. That is called Delta Debugging.

The computer will just remove lines of code from your program and
check if the code still compiles and if it does if it still creates
the error. Now this process may be optimized by telling the computer
what constitutes a valid programm, and how to efficiently reduce
functionality from a programm, but in essence that is all to it to
Delta Debugging.
 
It is a whole lot of work to try out all these only slightly differing
programms. But then that is what computers are very good at: trying
things to see if they work, over and over again.

### Preparations: ###

### Ongoing effort: ###

### Links: ###

### Further reading: ###
