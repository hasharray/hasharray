---
title: Adding Google Analytics to a Jekyll Website
---

In this tutorial we will be taking a look at how we can add Google Analytics
tracking to a Jekyll based website.

Google Analytics provides an easy to use analytics solution for any website,
and while it's not that complex to setup there are certain Jekyll centric
things we can do in order to make the tracking better, we can also disable it
during local development.

## Configuring the Tracking ID

We need to store our tracking id, putting it in the site's `_config.yml` file
is a good place to do so.

```yaml
google_tracking_id: UA-XXXXX-Y
```

## Including the Google Analytics Script

We'll put the actual Analytics script inside the `_include` folder, and name
the file `google_analytics.html`.

The contents of this file will be the following.

{% raw %}
```liquid
<script type="text/javascript">
  window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;

  ga('create', '{{ site.google_tracking_id }}', 'auto');
  ga('send', 'pageview');
</script>
<script async src='https://www.google-analytics.com/analytics.js'></script>
```
{% endraw %}

We can then include this in our main layout.

{% raw %}
```liquid
<body>
{% if site.google_tracking_id %}
  {% include google_analytics.html %}
{% endif %}
</body>
```
{% endraw %}

## Disabling Analytics During Development

While it is possible to filter out IP addresses within Google Analytics itself,
it can be more practical to just disable the tracking script during local
development.

To do this, we can just check if the `site.environment` variable is set to
development or not.

{% raw %}
```liquid
{% if site.google_tracking_id and site.environment != 'development' %}
  {% include google_analytics.html %}
{% endif %}
```
{% endraw %}

## Conclusion

With just a few simple steps we can fit Google Analytics quite naturally into
an existing Jekyll website while having it disabled during local development.

From here, more tracking can be added as needed like outbound links, scroll
depth etc but as a general case page views is quite sufficient.
