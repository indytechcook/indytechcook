---
layout: post
title: Blogs of Indy Update
categories:
- All Things Tech
- Web Design
- Blogs of Indy
tags:
- websites
- Web Design
- drupal
- Blogs of Indy
---
<p style="text-align: left;">I have made alot of progress since my last posting about Blogs of Indy.&nbsp; I have completed another module.&nbsp; This time I am going to release it to the general public.&nbsp; I'm currently waiting on my drupal cvs account approval.</p>

<h3 style="text-align: left;">New Module:</h3>
<p style="text-align: left;"><a href="http://techcook.s3.amazonaws.com/feedapi_taxonomy_compare.zip"><span style="text-decoration: underline;">FeedAPI Taxonomy Compare</span>.</a> You can get a detailed info from the readme file and the project page (when it comes up) but here is the basic idea.</p>
<p style="text-align: left;">This module is meant to work with FeedAPI, FeedAPI Node and Feed Element Mapper to give more control over what happens with incoming taxonomy terms.</p>

<p style="text-align: left;">Example Use.
Vocabulary of 'Categories' feeds the a piece of the primary links using taxonomy_menu.&nbsp; When a feed-item comes in the options->tags element is mapped to the 'Tags' vocabularies using Feed Element Mapper.&nbsp; If the term is found then I remove it from the association from the 'Tags' vocabulary and add the association to the 'Categories' vocabulary.&nbsp; Now the new items are automatically in the correct place for views.
<p style="text-align: left;">The feed owner (or other person) would then come match the new tags to an existing category.&nbsp; If they wish to add a new category then they fill out a request form and the site administrator can create the term and move the nodes accordingly.</p>

<p style="text-align: left;">Suggested Workflow
1. Feed is refreshed
2. New node is created using the taxonomy setting from Feed Element Mapper.&nbsp; If using FeedAPI Node Inherit, this is applied here also.
3. All mapped and inherited terms are run through this module.
4. Matched terms are added to more defined categories.
5. Unmachted terms are placed in a general vocabulary where the feed administrator can add them to specific categories later.
<h3 style="text-align: left;">Other accomplishment</h3>
<ul style="text-align: left;">
	<li>Messaging and Notifications now send out emails.</li>
	<li>Fixed cron timeout.&nbsp; Issue was incompatibility with the Notifications plugin for FeedAPI.</li>
	<li>Put together Incoming feed workflow.</li>
</ul>
<h3 style="text-align: left;">Still To Do</h3>
<ul style="text-align: left;">
	<li>Rewrite Subscription Block module.</li>
	<li>Customize Notification UI</li>
	<li>Create an UI for feed owners to administer the term-node relationship and move terms between vocabularies.&nbsp; This will be a modification of Taxonomy Manager.</li>
	<li>Notification Workflow.</li>
</ul>
