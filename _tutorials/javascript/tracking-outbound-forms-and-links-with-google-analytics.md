---
title: Tracking Outbound Forms and Links with Google Analytics
---
In this tutorial, we will be taking a look at how we can track outbound links
with Google Analytics.

The default Google Analytics tracking snippet only tracks when page views by sending a page view event which is good data to have but there are times when we need more information about certain events, for example the number of times outbound links are clicked or the number of form submissions made on a certain page.

## Automatic Tracking

The best way to do this is with plugins, Google Analytics actually has built-in support for plugins which can be used to extend its capabilities.

These plugins can be written by anyone but Google does provide a few themselves, one of these is called *autotrack* which does everything we need in this case saving us from having to maintain this code.

The autotrack plugin is actually a collection of plugins which deal with automatic and declarative event tracking, two of these are "outboundFormTracker" and "outboundLinkTracker" which deal with automatic form and link tracking respectivly.

To enable the autotrack plugin we need to push a `require` call onto the tracker queue with the plugin name and load the script that contains the plugin.

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

Autotrack is *currently* not hosted by Google themselves, but is available via various content delivery networks including [cdnjs.com](https://cdnjs.com/libraries/autotrack).

The source code and releases for the Google Analytics Autotrack plugin are available via [Google Analytics on GitHub](https://github.com/googleanalytics/autotrack).

## Conclusion

The Google Analytics Autotrack plugin provides a really easy and clean way to enable many common cases of event tracking, it has more functionality than what is covered here so make sure to [check out the documentation](https://github.com/googleanalytics/autotrack) for more advanced usage.