---
layout: post
excerpt:
title: Upcomming plans for Blogs of Indy
categories:
- All Things Tech
- Web Design
- Blogs of Indy
tags:
- Web Design
- drupal
- Blogs of Indy
---
I haven't posted an update for <a href="http://blogsofindy.com" target="_blank">Blogs of Indy</a> in a while. I wanted everyone to know that I've been hard at work on coding and haven't had a change to blog out it.; Here are some upcoming plans.</p>
<a href="http://techcook.net/2009/01/new-version-of-feedapi-taxonomy-compare/" target="_blank">FeedAPI Taxonomy Compare Updates.</a> This module is a key piece to the functionality. I spent several hours fixing bugs and adding functionality. Being able to match on synonym will help me keep my menus clean.</p>

<h3>Blogs of Indy Custom Module</h3>
I added a few tabs to the profile page. One tab is a list of all the blogs for that user.; It is basically a copy of the FeedAPI admin page just filter for the user. I filtered it based upon the user argument in the URL. Here is the code for the hook_menu.</p>

<pre class="prettyprint linenums"><code class="language-php">
$items['user/%user/feeds'] = array(
  'type' => MENU_LOCAL_TASK,
  'title' => 'Blogs', //Going to be a variable on the main setting page
  'page callback' => 'blogsofindy_feedapi_admin_overview',
  'access callback' => TRUE, //security is built into the function since this displays on the user profile page
  'page arguments' => array(1), //pass the account
  'file' => 'blogsofindy.feed.user.page.inc'
);

$items['user/%user/feeds/overview'] = array(
  'type' => MENU_DEFAULT_LOCAL_TASK,
  'title' => 'Overview',
  'weight' => -10,
);
</code></pre>

<strong>Here is the page callback code.</strong>

<pre class="prettyprint linenums"><code class="language-php">
function blogsofindy_feedapi_admin_overview($account = NULL) {
  $header = array(
    t('Title'),
    t('Last refresh'),
    t('New items added per update'),
    t('Update rate'),
    t('Number of items'),
    t('Processing time'),
    t('Commands'),
  );
  
  $rows = array();
  
  //check to see if account variable was passed.
  //if so then only bring back the nid where the nid is the author
  if (!isset($account)) {
    $result = pager_query("SELECT nid from {feedapi} ORDER BY checked DESC", 50, 0, "SELECT count(*) FROM {feedapi}");
  }
  else {
    $sql = sprintf("SELECT feedapi.nid AS nid FROM {feedapi} INNER JOIN {node} ON {feedapi}.nid = {node}.nid WHERE ({node}.uid = %d) ORDER BY {feedapi}.checked DESC", $account->uid);
    $sql_count = sprintf("SELECT count(*) FROM {feedapi} INNER JOIN {node} ON {feedapi}.nid = {node}.nid WHERE ({node}.uid = %d)", $account->uid);
    $result = pager_query($sql, 50, 0, $sql_count);
  }

  while ($nid = db_fetch_array($result)) {
    $nid = $nid['nid'];
    $node = node_load($nid);
    if (is_object($node)) {
      $commands = array(
        l(t('Delete'), 'node/'. $node->nid .'/delete', array('query' => 'destination=' . <em>$_REQUEST[q]</em>)),
        l(t('Remove items'), 'node/'. $node->nid .'/purge', array('query' => 'destination=' . <em>$_REQUEST[q]</em>)),
        l(t('Refresh'), 'node/'. $node->nid .'/refresh', array('query' => 'destination=' . <em>$_REQUEST[q]</em>)),
        l(t('Edit'), 'node/'. $node->nid .'/edit', array('query' => 'destination=' . <em>$_REQUEST[q]</em>)),
      );

      // Fetch statistics for this feed
      foreach (array('download_num', 'new',; 'process_time', 'update_times') as $type) {
        $node->feed->statistics[$type] = _feedapi_get_stat($node->nid, $type, TRUE);
      }

      if (count($node->feed->statistics['download_num']) != 0 
        && count($node->feed->statistics['new']) != 0 
        && count($node->feed->statistics['process_time']) != 0) {
        
          $update_rate = _feedapi_update_rate($node->feed->statistics['update_times']);
          $rows[] = array(
            l($node->title, "node/$node->nid"),
            $node->feed->checked == 0 ? t('Never') : t('%time ago', array('%time' => format_interval(time() - $node->feed->checked))),
            round(array_sum($node->feed->statistics['new']) / count($node->feed->statistics['new']), 2),
            is_numeric($update_rate) ? format_interval($update_rate) : $update_rate,
            round((array_sum($node->feed->statistics['download_num']) / count($node->feed->statistics['download_num'])), 2),
            round((array_sum($node->feed->statistics['process_time']) / count($node->feed->statistics['process_time'])), 2) .' '. t('ms'),
            theme('item_list', $commands),
          );
      }
      else {
        $rows[] = array(
          l($node->title, "node/$node->nid"),
          $node->feed->checked == 0 ? t('Never') : t('%time ago', array('%time' => format_interval(time() - $node->feed->checked))),
          '', '', t('No enough data for statistics'), '',
          theme('item_list', $commands),
        );
      }
    }
  }
  
  $output = format_plural(round(FEEDAPI_CRON_STAT_LIFETIME / (24*3600)), "Average over the last day.",
    "Averages over the last @count days."
  );
  
  $output .= theme('table', $header, $rows);
  $output .= theme('pager', 0, 50);
  return $output;
  
}
</code></pre>

Pretty simple really.  It's a copy of the admin display from FeedAPI. <em>What I changed is in Italics.</em> Right after I did this, FeedAPI introduced a view based approach to the page.; I have yet to change my code to use a view, though probably a good idea.</p>

<h3>Blog Tag Management</h3>
As some of you remember, I mentioned that there needs to be an easy way for the blog owners to manage the incoming terms that need to be associated to the categories. I choose to do this by adding a tab to the profile page.</p>



<pre class="prettyprint linenums"><code class="language-php">
$items['user/%user/feeds/terms'] = array(
  'type' => MENU_LOCAL_TASK,
  'title' => 'Terms',
  'page callback' => drupal_get_form,
  'access callback' => TRUE,
  'page arguments' => array('blogsofindy_terms_form', 1),
  'file' => 'blogsofindy.feed.user.page.inc'
);

$items['admin/settings/blogsofindy'] = array(
  'type' => MENU_NORMAL_ITEM,
  'title' => 'Blogs of Indy',
  'description' => 'Change the settings for Blogs of Indy Custom Module',
  'page callback'; => 'drupal_get_form',
  'page arguments' => array('blogsofindy_admin_settings'),
  'access callback' => TRUE,
  'file' => 'blogsofindy_admin.pages.inc',
);
</code></pre>

I have complete the first version of the code for displaying the form but I am not ready to share the validation or submit code. I had to come up with how I wanted to manage the terms. This is when I added the synonym functionality to FeedAPI Taxonomy Compare.; The idea is that incoming feed's tag will match the synonym and attach itself to the category term.; So this form will give the users a list of the tags that their blogs are associated to so they can either "link" them to a category by making them a synonym or add the tag as a category.; Either way, the posts nodes will be related to a category term and unrelated from a tag term. I'm struggling with giving the user so much power to add categories (and in turn menu items) so easily. Though it would give them a sense of ownership which is what I am looking for.</p>
Either way, here is the code for the form.</p>


<pre class="prettyprint linenums"><code class="language-php">
function blogsofindy_terms_form($form_state, $account) {
  //build SQL statment for tag options
  $sql = sprintf("SELECT DISTINCT td.tid AS tid, td.name AS term_name
    FROM {node} n
    inner join {term_node} tn on n.vid = tn.vid
    inner join {term_data} td on tn.tid = td.tid
    WHERE n.uid =; %d AND n.type =; '%s' AND td.vid = %d
    ORDER BY td.name", $account->uid, 'feed_item', variable_get('blogsofindy_tags', array('0')));

  $result = db_query(db_rewrite_sql($sql));
  $tags = array();

  $categories = array();
  $tree = taxonomy_get_tree(variable_get('blogsofindy_category', array('0')));
  foreach ($tree as $key => $term) {
    $categories[$term->tid] = _blogsofindy_terms_format($term->name, $term->depth);
  }
  if (!empty($result)) {
    while ($data = db_fetch_object($result)) {
      $tags[$data->tid] = t($data->term_name);
    }

    $form['tags'] = array(
      '#type' => 'select',
      '#title' => t('List of Tags'),
      '#options' => $tags,
    );

    $form['categories'] = array(
      '#type' => 'select',
      '#title' => t('Category'),
      '#options' => $categories,
    );

    $form['merge'] = array(
      '#type' => 'select',
      '#title' => 'Action',
      '#options'; => array(
        '1' => t('Move posts and all future posts to new Term'),
        '2' => t('Move Term from Tags to selected Category')
      ),
      '#default_valule' => '1',
      '#description' => t('Moving the Term from Tags to the selected Cateogry will change the parent and vocabulary for the selected Term'),
    );

    $form['submit'] = array(
      '#type' => 'submit',
      '#value' => t('Move'),
    );
  }

  return $form;
}
</code></pre>

Using a helper function to display the categories in a hierarchy display

<pre class="prettyprint linenums"><code class="language-php">
/**
 * helper function to great the options for the cateogires in a tree format.
 * @param string $term
 * @param int $depth
 * @return string
 */
function _blogsofindy_terms_format($term, $depth) {
  $output = $term;
  if ($depth > 0) {
    for ($i=1; $i <= $depth; $i++) {
      $output = '-' . $output;
    }
  }

  return $output;
}

</code></pre>

I also added a admin settings page to select which vocabularies to use in the "Tags" and "Category" drop downs on the form.

<pre class="prettyprint linenums"><code class="language-php">
function blogsofindy_admin_settings() {
  //get list of vocabularies
  foreach (taxonomy_get_vocabularies() as $voc) {
    $options[$voc->vid] = $voc->name;
  }

  $form['blogsofindy_tags'] = array(
    '#type' => 'select',
    '#title' => t('Tags Vocabulary'),
    '#options' => $options,
    '#default_value' => variable_get('blogsofindy_tags', array('0')),
  );

  $form['blogsofindy_category'] = array(
    '#type' => 'select',
    '#title' => t('Category Vocabulary'),
    '#options' => $options,
    '#default_value' => variable_get('blogsofindy_category', array('0')),
  );

  return system_settings_form($form);
}
</code></pre>

<h3>Left to do before initial release</h3>

After I finish the code for managing the terms I have to put in place my ideas from my post <a href="http://techcook.net/2009/01/more-features-for-the-blogger/" target="_blank">More Features for the Blogger</a>. I also like <a href="http://blog.to.it/" target="_blank">Blog.to.it</a>'s idea of integrating twitter. This would give more attention to the arthur.; Then comes the decision about where to display what. I want to be sure to reconize the blogger but don't want to make the page to busy. Then comes theming which I haven't even begun to learn yet.;; There you go, more to come :)</p>
