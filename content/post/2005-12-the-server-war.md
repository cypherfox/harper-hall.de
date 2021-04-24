---
# Common-Defined params
title: "The Server War"
date: "2005-12-02"
#description: "Example article description"
categories:
  - "IT Business"
tags:
  - "lang-en"
#menu: main # Optional, add page to a menu. Options: main, side, footer

# Theme-Defined params
#thumbnail: "img/placeholder.jpg" # Thumbnail image
#lead: "Example lead - highlighted near the title" # Lead text
comments: false # Enable Disqus comments for specific page
authorbox: true # Enable authorbox for specific page
pager: true # Enable pager navigation (prev/next) for specific page
#toc: true # Enable Table of Contents for specific page
mathjax: true # Enable MathJax for specific page
sidebar: "right" # Enable sidebar (on the right side) per page
widgets: # Enable sidebar widgets in given order per page
  - "search"
  - "recent"
  - "taglist"
---


For the last few years Microsoft Server Software and Linux Products have not realy been competing very much. Both sides where too busy gobbling up the large chunks of market real-estate that where left dormant by makers of large scale servers, who where unable to offer efficient and easy to use entry-level servers. Also the market for those entry class servers was growing and this class of servers was continuosly moving onto higher and higher ground as the performance parameters of off-the-shelf PCs grew in leaps and bounds.

Sure, marketing pot-shots would be issued by both sides, Microsoft doing what Microsoft does best: Marketing. And the incumbent Linux companies where positioning themselves in the market and the buyers mindshare. But it was largely a question of customer preferences: If you came from a former UNIX shop, you got Linux, because you could find yourself around the system very easily. Or you moved up from a simple file-and-print server for the workgroup, and had allways been using Microsoft Windows and simply continue to do so. In the worst case, somebody in the organisation got the notion into his head that one Operationg System is suited for every purpose. And since that Laptop on his mahagony executive desk is running Windows, so the servers should run Windows too.

But that situation is about to change. While Linux Desktops are a glorious vision for some and may be used productively by those that prefer to do so (I have not used MS Windows on my office destop for allmost 8 years now and have not used or owned a copy of MS Windows privately since 1995), it simply is not the deployed standard in normal offices and will not be for some years to come (if ever). But where non-Windows Operating system could become a reality very quickly is the myriad of devices that have computing power larger than the PC that I run Windows last on, have similar storage capabilities and significantly more communication capabilities: phones, PDAs, Fridges, Point-of-Sale-Systems (formerly known as cash registers). They all need a large server-fabric backend and the user seldomly changes the software that runs on them. Thus as long as it works, the user will accept whatever application and operating system package the vendor of the device loads onto them.

So we come back to the preference fo the developer of the whole package. If he or she preferes a non-Windows development environment and is able to produce cool looking applications and devices quickly an cheaply it will be used. If he or she sides with the Redmond-universe, the software will be written on a machine running Windows, the device will run Windows and the server backend will run Windows too.

And here is where similarity between the realms will end: since Microsoft will have to protect its Monopoly they will work very hard not be interoperable with anything but other Microsoft products (Side note:Dear Mr. Microsoft Laywer, in case you are considering suing me, please note that I write and publish this article in the European Union, where the organisation charged with monopoly control has not bowed to the lobying of your employer and convicted you of anti-competive behavior. As long as that stand I feel correct to label your employer as a monopoly. But then IANAL). But the benefit for the developer that uses MS Windows is that the tools for all platforms and devices he has to work on have the same behavior and often the same tool is able to produce the complete chain of components that allow the end-users (Windows) office PC to work with the Windows PDA and the Windows Server. This surely makes work for the developer fast and efficient. Probably efficient enough to offset the per-unit cost that any Windows device would acrue. The last point probably holds true in times of ever shortening time-to-market intervals, as continous development of new devices or variants will increase the percentage of development cost in the per-unit overhead of the eventual end-customer price.

**So, the path to not have Microsoft win the next engagement for digital world domination seems clear: non-MS Servers. And the path to non-MS Servers seems clear as well: server-tools, integration-tools and tool-integration. Oh, yes and they have to be simple to start working with.**

The [magic-cauldron](http://www.catb.org/%7Eesr/writings/cathedral-bazaar/magic-cauldron/) of Open Source makes reducing some of the costs possible, but not the price for development work. So, whichever Plattform will allow for the most efficient development work, will get choosen.

So you may ask why I titles this piece ‘Server War’? Because the first incarnation of just about any new service that you have seen in the last few years was a website. Blogs, IMs (OK, the IM client was there, but you went to the IMs website to set up your peers and nickname and whatnot), and more. So, writing a web **application** and writing it simply and **quickly** will determine which server will get used.

And unfortunately, currently that means Windows. Because there is no open source tool for designing simple websites without a steep learning curve. And while IDEs like [Eclipse](http://eclipse.org/) offer many features that make handling large projects easier, they do little for small, quick projects.

So, as this blog is called “Sage’s Musing” and not “Sage’s Rant” I will offer some ideas about what is lacking in Eclipse that should be there to make small web-applications quicker to make:

* A much richer Java library that is part of the language standard. It should include standard implementation of all kinds of protocols (RFC1 through 4000). This is not Eclipse specific.
* A Wizard that will set up a complete JSP-Struts application, including JSPs for header, footer, sidebar; the nessecary XML files, etc. And guide the user immediately showing it in his web-browser.
* A tool that allows the visual editing of JSP-to-JSP transitions, similar to a story board, with a graph where the nodes are the pages and the edges are the transistions. It should generate the nessecary code, so that only the actual functionality would have to be implemented by hand
* A simple, standard, shipped with eclipse database management plugin, that allows creating databases, tables and relations. More complex ones with database clustering, complex index handling, triggers, etc, etc. could and should be sold as an supported product to those that need it.
* (more to come later) 

Why do I only cover Eclipse? Because it is suitably language agnostic (yes, it is written in Java, but then it has to be written in some language, doesn’t it?) and it is furthest along the path that envision for non-Windows plattforms to have a chance in surviving. But it still has to go a long way in supporting the developer that has not yet mastered a given technology.

But am I not comparing different things here, since only the enterprise variant of the MS Visual Studio supports all the wizards and generators that make work so efficient and that tool costs a lot of money, while eclipse is free? Not really. For Students getting Visual Studio is easy thanks to the MSDN-AA or only slightly reduced student versions. And everbody else can simply pirate the software. And I hold it very doubtfull that Microsoft will go after individuals that use a pirated versiosn of Visual Studio (as opposed to those that try to sell pirated copies), since more software developed with VS means more software that will run only on Microsoft operating system products. So MS VS is effectively free (as in beer) while Eclipse is free (in beer and in speech)

So, the next campaign for world domination will be won by whatever side has the best tools to develop simple web-apps quickly. Unfortunately, currently this Windows. Thus the servers would continue with Microsofts well documented lock-in policy of embrace and extend, making them incompatible to anything but Microsoft components. And any inroads that alternative operating systems have made in the last five years may quickly be wasted away again.
