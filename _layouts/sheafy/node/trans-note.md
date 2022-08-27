<section id="{{ page.slug }}" class="trans-note">

{::nomarkdown}

<header class="inline">
  <a class="slug" href="{{ page.url | relative_url }}">[{{ page.slug }}]</a>
  {{page | display_title_parenthetical -}}.
</header>

{:/}

{{ content }}

</section>

{% include macro-loader.html page=page %}
