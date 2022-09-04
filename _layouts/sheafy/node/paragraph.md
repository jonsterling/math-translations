
<section id="{{ page.slug }}">

{::nomarkdown}

<header class="inline">
  <a class="slug" href="{{ page.url | relative_url }}">[{{ page.slug }}]</a>
</header>

{:/}

{{ content }}

</section>

{% include macro-loader.html page=page %}
