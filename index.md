---
layout: default
title: Home
---

This translation project is hosted on [GitHub](https://github.com/jonsterling/math-translations), and I welcome other contributors --- especially those with a better command of the French language.

## The translations

{% for lecture in site.lectures %}
  <a href="{{ lecture.url | relative_url }}">{{lecture.title}}</a>
  (by {% for author in lecture.author %}
      <span itemprop="author" itemscope itemtype="http://schema.org/Person">
      <span class="p-author h-card" itemprop="name">{{ author }}</span></span>
      {%- if forloop.last == false %}, {% endif -%}
    {% endfor %})
{% endfor %}
