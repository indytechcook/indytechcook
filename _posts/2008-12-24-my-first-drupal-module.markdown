---
layout: post
excerpt:
title: My first Drupal Module
categories:
- All Things Tech
- Web Design
- Blogs of Indy
tags:
- websites
- Web Design
- Blogs of Indy
---
<p style="text-align: left;">I did it.&nbsp; A huge milestone in my Drupal development life.&nbsp; I completed my first custom module.&nbsp; While at this point it would only work on my site (I hard coded the name of content types and some other variables from the notification module) but it works. I have attached it but know that you can't just add it to your site.&nbsp; At minimum you might have to change the name of the feed-item content type on line 85.</p>
<p style="text-align: left;"><a class="s3-link" href="http://techcook.s3.amazonaws.com/notification_block.zip">notification_block.zip</a></p>
<p style="text-align: left;"><span style="text-decoration: underline;">What it does</span>:&nbsp; Add a block with a drop down.&nbsp; The drop down contains the name of the Feed and all taxonomy terms for that node.&nbsp; If the node type is the feed item (Post) then it pulls the parent feed and puts it in the list.</p>
<p style="text-align: left;">I'm using this basic setup as an interface for the users to add subscriptions.&nbsp;&nbsp; Please comment on the idea.</p>
<p style="text-align: left;">Now I basically have to rewrite the entire thing and pull the feedapi and notification options and type from the modules functions before I can release this. I'll probably end up adding in some jscript effects to make it pop.</p>
<p style="text-align: left;">I had dream last night (yes, I dream in Drupal) about how to create more meaningful categories for people to subscribe to.&nbsp; The idea of synonyms came to mind.&nbsp; So instead of (or maybe along with) assigning the categories to the feeds, the tags from the blogs will be attached to a category.&nbsp; The problem is that this will require intervention from the user, either myself or the blog owner, and are they going to want to spend the time?&nbsp; I'm doing my best to make this "not another site I have to do to".&nbsp; Thoughts?</p>
<p style="text-align: left;">Still To DO:</p>

<ul style="text-align: left;">
	<li>Rewrite Subscription Block module</li>
	<li>Decide on Control level for users</li>
	<li>Continue working on theme</li>
	<li>Customize Notification UI</li>
	<li>How to catorigize posts meaninfully</li>
</ul>
