---
title: 'Excel to Drupal:  Tracking Training Sessions'
date: 2009-06-16 00:00:00 -04:00
categories:
- All Things Tech
- Web Design
tags:
- drupal
- workflow automation
- process
layout: post
excerpt: Moving to Drupal from Excel is fun!
---

<p style="text-align: left;">I've been working in corporate America for 10 years.&nbsp; In this time I have seen business of all shapes and size run off of Excel spreadsheets.&nbsp; Don't be me wrong, I use Excel as much as the next guy, but when your entire workflow process is focused around updating and tracking information an Excel spreadsheet then you better take a step back and look at what you are doing.</p>
<p style="text-align: left;">In this post, I'm going to walk through a small project I took on at work to move a department off of Excel to Drupal.&nbsp; This particular case was a little different then other workflow process automation project I take on as the department came to me looking for an easier way to track information.</p>

<h4 style="text-align: left;">Original State:</h4>
<p style="text-align: left;">The Lab Point of Care (POC) department was tracking training session on an excel spreadsheet.&nbsp; POC is a distributed department with 4 different offices.&nbsp; 2 of the offices shared a spreadsheet and the other two and an identically formatted spreadsheet with information with their location.&nbsp;&nbsp; The spreadsheet was formatted with each person having it's own row, and each training session that the person took in a separate column.&nbsp; All of the spreadsheets are stored on a network share.</p>

<h4 style="text-align: left;">Issues with original state:</h4>
<ul>
	<li style="text-align: left;">The same person could take the same class at multiple locations.&nbsp; They were only required to take the class at one location.&nbsp; Since the spreadsheets are not synced, one office would have to open another office's spreadsheet to verify that the person has taken the class.</li>
	<li style="text-align: left;">One of the spreadsheets had over 15 thousand rows.&nbsp; It was slow to load off of the network share.&nbsp; Due to the size of the spreadsheet, the users would copy the spreadsheet locally and be working off of old data.</li>
	<li style="text-align: left;">Several users would attempt to update the spreadsheet at the same time.&nbsp; This would cause file corruption issues and loss of data.</li>
</ul>
<h4 style="text-align: left;">Requirements:</h4>
<ul>
	<li style="text-align: left;">Easy to search by employee ID or name.</li>
	<li style="text-align: left;">Ability to quickly add new training session.
<ul>
	<li style="text-align: left;">One session for a day.</li>
	<li style="text-align: left;">Multiple sessions for single day.</li>
</ul>
</li>
	<li style="text-align: left;">Person Data:
<ul>
	<li style="text-align: left;">Employee ID (Unique)</li>
	<li style="text-align: left;">Name</li>
	<li style="text-align: left;">Location (multiple)</li>
	<li style="text-align: left;">Position</li>
</ul>
</li>
	<li style="text-align: left;">Training Session Data:
<ul>
	<li style="text-align: left;">Training Session Type</li>
	<li style="text-align: left;">Certification Length</li>
	<li style="text-align: left;">Date</li>
</ul>
</li>
	<li style="text-align: left;">Reports for training session by multiple criteria.</li>
	<li style="text-align: left;">Ability to export reports to excel/pdf.</li>
	<li style="text-align: left;">Upload the current spreadsheets to pre-populate the data.</li>
</ul>
<h4 style="text-align: left;">Plan of Attack:</h4>
<p style="text-align: left;">My main goal was to keep the application was simple as possible.&nbsp; Most of the application focuses around the Training Sessions screen.&nbsp; This is the screen where they look up, add/edit training sessions.&nbsp; Being that this project had very limited time associated to it, I needed to use as many prebuild Drupal modules as possible.&nbsp; The core of the application is focused around CCK and views.&nbsp; I used CCK to create the widgets for the forms.&nbsp; Ajax, Editable and quicktabs were used to help improve UI.&nbsp; Custom forms (using Form API) combined the views and content type forms on a single page.&nbsp; The Acquia Marrina Theme from Top Notch Themes (http://www.topnotchthemes.com)</p>

<h4 style="text-align: left;">Content Types:</h4>
<ul>
	<li style="text-align: left;">Person:&nbsp; Each person has a person node.</li>
	<li style="text-align: left;">training session:&nbsp; Each training session is attached to a person.</li>
</ul>
<h4 style="text-align: left;">Main Modules</h4>
<ul>
	<li style="text-align: left;">Ajax:&nbsp; Used for UI imporovments.&nbsp; Gives the ability to add AJAX (<a href="http://drupal.org/project/ajax" target="_blank">http://drupal.org/project/ajax</a>) to any form very easily.</li>
	<li style="text-align: left;">CCK
<ul>
	<li style="text-align: left;">Content Taxonomy</li>
	<li style="text-align: left;">Mulitselect (<a href="http://drupal.org/project/multiselect" target="_blank">http://drupal.org/project/multiselect</a>):&nbsp; Improved UI for Content Taxonomy when using multiple terms.</li>
</ul>
</li>
	<li style="text-align: left;">Form block (<a href="http://drupal.org/project/formblock" target="_blank">http://drupal.org/project/formblock</a>):&nbsp; Easily expose a node form to a block.&nbsp; This was used in combination with Quick Tabs</li>
	<li style="text-align: left;">Quick Tabs (<a href="http://drupal.org/project/quicktabs" target="_blank">http://drupal.org/project/quicktabs</a>):&nbsp; Allow for improvements to the UI.</li>
	<li style="text-align: left;">Views</li>
	<li style="text-align: left;">Custom Code</li>
</ul>
<h4 style="text-align: left;">Primary Pages</h4>
<ul>
	<li>
<p style="text-align: left;"><span style="text-decoration: underline;">Training Tracking Page (Home Page)</span>:&nbsp; Upon first loading the web app, you are giving a page with simple search box (see screen shot).&nbsp; The user has the option to either type in a few letters of the name or the Employee ID.&nbsp; The search box is an auto-complete drop down built as a custom form. &nbsp; &nbsp; Once a person is selected the user presses "search" and it brings up the details for the employee (see screenshot).&nbsp; At the top of the page the user has the option to either search for another employee or edit the current one.&nbsp; Under that there is some basic information about the employee.&nbsp; These fields are pulled from related taxonomy terms.&nbsp; Quicktabs were used to allow all of the screen to be on the same page.&nbsp; The first tab is the current sessions and the second tab gives the user the ability to quickly add a new session.&nbsp; The Ajax module was used to save the info to the database without refreshing the entire page.&nbsp; This give the user the ability to add training sessions quicker.</p>
</li>
	<li style="text-align: left;"><span style="text-decoration: underline;">Add/Edit Person Screen</span>:&nbsp; This is just the add/edit form for person content type.&nbsp; CCK was used to give the necessary appearance.</li>
	<li style="text-align: left;"><span style="text-decoration: underline;">Reports:</span> Views were made with a good amount exposed filters, giving the user the ability to find any necessary information.</li>
	<li style="text-align: left;"><span style="text-decoration: underline;">List Management</span>:&nbsp; The location, position, training session type and certification length are all vocabularies.&nbsp; The site administrators manage the lists via the core taxonomy forms.</li>
</ul>
<h4 style="text-align: left;">Importing the Old Data</h4>
<p style="text-align: left;">This was the most challenging part of the project.&nbsp; It required the most custom coding.&nbsp; The spreadsheets had to be formatted in a way where they could be easily turned in to a csv file.&nbsp; Once the spreadsheet was in the correct format, the parsecsv-for-php (<a href="http://code.google.com/p/parsecsv-for-php/" target="_blank">http://code.google.com/p/parsecsv-for-php/</a>) library was used.&nbsp; This allows me to easily parse the csv file and place the csv fields in the correct content types.&nbsp; A little error and duplicate checking and I had myself a nice template to use for future data imports.</p>

<h4 style="text-align: left;">Conclusion</h4>
<p style="text-align: left;">The web application has been live for about a month and I've already heard how much it has improved their workflow.&nbsp; The amount of effort that was needed to evaluate the workflow process and create the application was well worth the benefit.&nbsp; This was the first Drupal application for this company and we are already working on a few others.</p>
<p style="text-align: left;"><a class="tt-flickr tt-flickr-Thumbnail" title="traing traking page 1" href="http://techcook.net/pictures/photo/3634426842/traing-traking-page-1.html"><img class="alignnone" src="http://farm4.static.flickr.com/3552/3634426842_ec67eaf9d9_t.jpg" alt="traing traking page 1" width="100" height="40" /></a> <a class="tt-flickr tt-flickr-Thumbnail" title="Training tracking page 3" href="http://techcook.net/pictures/photo/3633612347/training-tracking-page-3.html"><img class="alignnone" src="http://farm4.static.flickr.com/3405/3633612347_e2684c1b28_t.jpg" alt="Training tracking page 3" width="100" height="35" /></a> <a class="tt-flickr tt-flickr-Thumbnail" title="Training tracking page 2" href="http://techcook.net/pictures/photo/3633612335/training-tracking-page-2.html"><img class="alignnone" src="http://farm4.static.flickr.com/3637/3633612335_1af012b289_t.jpg" alt="Training tracking page 2" width="100" height="67" /></a></p>
<p style="text-align: left;"></p>
