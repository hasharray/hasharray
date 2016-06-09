---
layout: tutorial 
title: Tracking Outbound Forms and Links with Google Analytics
---

In this tutorial, we will be taking a look at how we can track outbound links
with Google Analytics.

The default Google Analytics tracking snippet only tracks when a page is first
loaded by sending a page view event which is good data to have but there are
times when we need more information about certain events, for example the
number of times outbound affiliate links are clicked.

## Automatic Tracking

Google Analytics actually supports plugins which can be used to extend its
capabilities. These plugins can be written by anyone but Google does provide
a few themselves and and one of these is called "autotrack" which does
everything we need.

The autotrack plugin is actually a collection of plugins which deal with automatic and
declarative event tracking, two of these are "outboundFormTracker" and
"outboundLinkTracker" which deal with automatic form and link tracking
respectivly.

To enable the "autotrack" plugin we just need to push a `require` onto the
tracker stack with the plugin name.

```html
<script type="text/javascript">
  window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;

  ga('create', 'UA-XXXXX-Y', 'auto');
  ga('require', 'autotrack');
  ga('send', 'pageview');
</script>

<script async src='https://www.google-analytics.com/analytics.js'></script>
<script async src='path/to/autotrack.js'></script>
```

## Conclusion

The "autotrack" plugin provides a really easy and clean way to enable many
common cases of event tracking, it has more functionality than what is covered
here so make sure to [check out the
documentation](https://github.com/googleanalytics/autotrack) for more advanced
usage.
