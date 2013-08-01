---
layout: post
excerpt:
title: New Version of Feedapi Taxonomy Compare
categories:
- All Things Tech
- Web Design
tags:
- Web Design
- drupal
- Blogs of Indy
- FeedAPI Taxonomy Compare
---
<p style="text-align: left;">I release a new version of my Drupal&nbsp; <a href="http://drupal.org/project/feedapi_taxonomy_compare" target="_blank">FeedAPI Taxonomy Compar</a>e Module.&nbsp; I found a bug in how the new term was being related to the node.&nbsp; I was using taxonomy_node_save function from taxonomy.module.&nbsp; One of the first lines of code in that function is "taxonomy_node_delete_revision($node);" which removes all terms from the node.&nbsp; Well I was including the current terms in what I was sending this function.&nbsp; Only the new term.&nbsp; So the end result was that all of the terms were removed except for the term that was found.&nbsp; This didn't effect nodes that didn't have existing terms.</p>
<p style="text-align: left;">I also added the ability to match on Synonyms.&nbsp; So if the tag matched a synonym of a category, then the node is attached to the category term.&nbsp; This is useful because now you can have more control over what categories you have.&nbsp; You no longer have to find a place for each term you want to match on.&nbsp; There is a new setting in admin/settings/feedapi_taxonomy_compare to turn on this functionality.</p>
<p style="text-align: left;"><a href="http://drupal.org/project/feedapi_taxonomy_compare" target="_blank">Download</a> the latest version and let me know.</p>
