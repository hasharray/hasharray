---
title: Inlining Critical Above the Fold Styles in Jekyll
---

In this tutorial we will be taking a look at how we can inline critical
stylesheet rules that style content that appears above the fold in a Jekyll
based website.

The problem we are trying to solve with this is that the browser cannot start
rendering anything before all our external stylesheets have been loaded. Even
if the entire document is loaded, while the stylesheets are still loading
nothing will be displayed to the user.

The idea with inlining styles for content that appears above the fold is that
the browser will already have all the necessary information to start rendering
immediately once it see's the body tag without having to wait for any
additional resources to load. This reduces the perceived load time for the user
as they can start reading the top of the page rather much sooner in the loading
process rather than staring at a white page.

## Inlining CSS with `include`

With Jekyll, We can inline entire files with the `include` tag as long as they
are within the `_includes` directory, which means for plain CSS stylesheets we
can inline them by adding a `<style>` tag containing the relevant includes to
the document's `<head>` section.

```liquid
<style type="text/css">
  {% include 'base.css' %}
  {% include 'masthead.css' %}
</style>
```

## Inlining SCSS with `include`

With SCSS the process is nearly the same, the difference is that we need to
pass the content through the `scssify` filter.

We can do this by capturing the relevant includes in a variable before passing
it to the filter.

```liquid
<style type="text/css">
  {% capture style %}
  	{% include 'base.scss' %}
  	{% include 'masthead.scss' %}
  {% endcapture %}

  {{ style | scssify }}
</style>
```


## Inlining SASS with `include`

The SASS version is essentially identical to the SCSS version above, with the
exception that we need to filter the style content through `sassify` instead of
`scssify`

We can also replace our `include` statements with SASS `import` statements,
which will inline the styles found in the `_sass` directory instead of the
`_includes` directory.

```liquid
<style type="text/css">
  {% capture style %}
    @import 'base';
    @import 'masthead';
  {% endcapture %}

  {{ style | sassify }}
</style>
```

## Loading Stylesheets

As long as our stylesheets fit within [the 14kb that Google
recommends](https://developers.google.com/speed/docs/insights/mobile), we can just inline all of our styles and we won't have to do
anything else, but that is not always the case.

We might have fonts and other non critical styles that we still need to load.
We can load these additional styles by adding them near the closing `</body>`
tag of the document.

```liquid
<body>
  <link rel="stylesheet" type="text/css" src="{{ "/icons.css" | prepend: site.baseurl }}"/>
  <link rel="stylesheet" type="text/css" src="{{ "/icons.css" | prepend: site.baseurl }}"/>
</body>
```

## Conclusion

Inlining styles can be a very straight forward and simple way to optimise the
time it takes to load a page, especially the perceived loading time by just
a few steps.

- Defer loading of none critical stylesheets.
- Inline critical stylesheets in the `<head>` section of a document.
- Check with [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) to ensure that a page passes the critical stylesheets rule.
