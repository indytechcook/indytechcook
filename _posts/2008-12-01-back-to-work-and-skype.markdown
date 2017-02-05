---
title: Back to Work and Skype
date: 2008-12-01 00:00:00 -05:00
categories:
- All Things Tech
- Home Projects
- Home Phone Setup
tags:
- Life
- Skype
- All Things Tech
- Network
- Phone
- Home
- XLink
- Home Customizations
layout: post
excerpt: 
---

It's back to wrok after a long weekend.&nbsp; These are the worst.&nbsp; I seem to be extremely busy today.&nbsp; My mind is extremely sharp.

So my wife is going out of town tomorrow which means I get to spend all evening on the computer with no distractions!&nbsp; I plan to setup my new toy, a <a href="http://www.home-electronics.net/ge/pc/viewPrd.asp?idcategory=13&amp;idproduct=17" target="_blank">GE Skype Phone</a> in tangant with a <a href="http://www.xlinkgateway.com/" target="_blank">Xlink Adapter</a>.&nbsp; This setup will allow me to drop my current VOIP line and use SKype and our cell phones to ring on every phone.

How will this work you ask?&nbsp; Well, it's simple.&nbsp; Kind of.

Here is a basic drawing of how my network (phone and LAN are setup).&nbsp; The Skype adapter sits between the internet and POTS (<span style="text-decoration: underline;"><strong>P</strong></span>lain <strong><span style="text-decoration: underline;">O</span></strong>ld <strong><span style="text-decoration: underline;">T</span></strong>elephone <span style="text-decoration: underline;"><strong>S</strong></span>ystem).&nbsp; It listens for a call for a Skpe call and sends it to the wireless phones that are attached linked to the adapter.&nbsp; The Xlink sits between the cell phones and POTS.&nbsp; When someone calls our cell phones will will ring to every phone in the house.

Here is a basic drawing of my network:&nbsp; <a href="http://techcook.net/wp-content/uploads/2008/12/network.pdf">network</a>

<strong>Outbound Call Flow</strong>:&nbsp; You can select to use the Skype Number or POTS.&nbsp; I have the default set to Skype.&nbsp; There are some rules though. If the Skype adapter does not have a connection to the Skype service then it uses the POTS to call out.&nbsp; If you are dialing "911" then it uses POTS (Skype does not have a 911 Service).&nbsp; Here is a basic drawing: <a href="http://techcook.net/wp-content/uploads/2008/12/20081201164030.pdf">Skype Call Out: </a>

<strong>Inbound call to Skype</strong>:&nbsp; If someone calls you via Skype or uses your SkypeIn number then the Adapter rings to all of the wireless phones that are associated to it.&nbsp; Drawing:&nbsp; <a href="http://techcook.net/wp-content/uploads/2008/12/skype-in.pdf">Skype In Call Flow</a>

<strong>Inbound call to Cell:</strong> The call will be sent to XLink via BlueTooth and sent over the POTS network.&nbsp; It will then ring on every phone in the house, including the Skype Wireless phones.&nbsp; Drawing:<a href="http://techcook.net/wp-content/uploads/2008/12/cell-in.pdf">Cell in bound Call Flow</a>

So why would I go through all of this trouble?&nbsp; Money.&nbsp; I ditch the land line.&nbsp; Skype outbound service is $2.95/month.&nbsp; This allows unlimited calls to US and Canada.&nbsp; If you want to receive all calls on your cell phone and make all outgoing calls via Skype this is all you need.&nbsp; If you would like to have the setup I have then you also need a Skype number.&nbsp; This allows people from a land line to dial a number and it connects to your Skype account.&nbsp; This is $30/year upfront.&nbsp; So your phone bill goes down to $5.45 a month for your home phone, then just add in your cell cost.&nbsp; AMAZING!&nbsp; There is a down side.&nbsp; The hardware is not cheap.&nbsp; Total equipment cost for the XLink, GE Skype Phone with 3 wireless phone extensions (One per floor) was around $350.

So let's say you have Comcast home phone service for $30/month.&nbsp; It would take just over a year for you to recoup the cost of the equipment.&nbsp; You can of course cut costs by getting a cheaper Skype Phone adapter, using ebay, not using XLink or using fewer phone extensions (good idea if you have a smaller house).

I will add a new post with my results and let you know what I think.
