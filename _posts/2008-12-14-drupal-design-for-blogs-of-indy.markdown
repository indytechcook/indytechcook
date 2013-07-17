---
layout: post
title: Drupal Design for Blogs of Indy
categories:
- All Things Tech
- Web Design
- Blogs of Indy
tags:
- Blogs of Indy
- Web Design
- drupal

---
I've spent most of my free time this week working on syndication site, which now has a name: "Blogs of Indy"

I have decided which modules I am going to use.
<h3>Modules</h3>
<ul>
	<li>CCK
<ul>
	<li>Content</li>
	<li>Email</li>
	<li>Embedded Media Library
<ul>
	<li>Image</li>
	<li>Audio</li>
</ul>
</li>
	<li>Link</li>
	<li>User Reference</li>
</ul>
</li>
	<li>Core
<ul>
	<li>Menu</li>
	<li>Path</li>
	<li>Taxonomy</li>
</ul>
</li>
	<li>Date/Time
<ul>
	<li>Date</li>
	<li>Date API</li>
	<li>Date Timezone</li>
</ul>
</li>
	<li><a href="http://drupal.org/project/feedapi" target="_blank">FeedAPI</a>
<ul>
	<li>FeedAPI Node</li>
	<li>Simple Pie Parser</li>
	<li>FeedAPI Inherit</li>
	<li>FeedAPI mapper</li>
</ul>
</li>
	<li>Image</li>
	<li><a href="http://drupal.org/project/messaging" target="_blank">Messaging</a>
<ul>
	<li>Messaging PHPMaker</li>
	<li>Simple Mail</li>
</ul>
</li>
	<li><a href="http://drupal.org/project/notifications" target="_blank">Notifications</a>
<ul>
	<li>Content Notifications</li>
	<li>FeedAPI subscriptions</li>
	<li>Notification autosubscribe</li>
	<li>Notification UI</li>
	<li>Notification Taxonomy</li>
</ul>
</li>
	<li>PathAuto</li>
	<li>WebForms</li>
	<li>Views</li>
</ul>
<h3>Taxonomy Vocabulary Terms</h3>
<ul>
	<li><span style="text-decoration: underline;">Tags</span>:&nbsp; Added from the Feeds.</li>
	<li><span style="text-decoration: underline;">Categories</span>:&nbsp; Every feed is assigned atlesst one category.&nbsp; The categories also drive the navigation links on top of the page.</li>
</ul>
<h3>Processing of Feeds</h3>
The addition and updates of the reeds are being handeled by FeedAPI.&nbsp; I choose FeedAPI due to the flexibility.&nbsp; I am also able to add custom code for advanced functionality as my needs mature.

FeedAPI uses a content type call "Feeds."&nbsp; The content type settings store how the feeds are processed.&nbsp; The nodes themselves hold the URL along with other node level options.&nbsp; I created a content type call "Posts."&nbsp; When the feeds are added, the posts are created as "Post" nodes using the FeedAPI Node module.

I have choosen to use Simple Pie over Common Syndicate Parser (CSP), which is built into PHP5, to process the inbound feeds.&nbsp; I used Simple Pie because it mapped the feeds XML elements clearer then CSP.&nbsp; This is important when using the FeedAPI Element Mapper to map the XML element from the feed to CCK and taximony fields on the "Feed Items" nodes.&nbsp; I am storing the tags (as Taxonomy), aurthor name and email (CCK).
<h3>Subscribing to Categories and Feeds</h3>
The Messaging and Notifications modules work together to handle the user level subscription and emailing updates.&nbsp; These are two key features that were the most difficult to find.&nbsp; Notification has the ability to subscribe to Taxonomy, Content Types and Feeds.&nbsp; I configured the Category Vocabulary and the Feeds for Notifications.&nbsp; The user has the ability to select multiple feeds and cageogires to recive daily updates via email.
<h3>Next Steps...</h3>
Now I am working on a block to allow the usres to add subscriptions and request new feeds to be added.&nbsp; I want to control what feeds are on the site for quality control reasons.

Then I will add the email templete for the Messaging module.

The final step is theming.&nbsp; I'm looking for a clean, most likely a modification of the Acquia theme by <a href="http://www.topnotchthemes.com/" target="_blank">Top Notch Themes.</a>
