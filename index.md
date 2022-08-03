---
layout: home
title: Home
---

This is a hypertext English translation of Bénabou's famous report *Problémes dans le topos*. Errors in translation belong to me alone; I have also taken some liberties to ensure readability.

{% for lecture in site.lectures %}
  <a href="{{ lecture.url | relative_url }}">{{lecture.title}}</a>
{% endfor %}
