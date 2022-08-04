---
layout: home
title: Home
---

This is a hypertext English translation of Bénabou's famous report *Problèmes
dans les topos*. Errors in translation belong to me alone.


## Conventions

I have taken some liberties to ensure readability.

Node numberings of the form **1.2.3** are guaranteed to be the same as in the
source text; in places, I have introduced more granular node subdivisions than
Bénabou; for instance, a subnode of **1.2.3** introduced in translation could
be numbered **1.2.3·a**.

I have added titles to many sections in order to facilitate a useful table of
contents.

## Contributing

The translation project is hosted on [GitHub](https://github.com/jonsterling/problemes-dans-les-topos), and I welcome other contributors --- especially those with a better command of the French language. The original French manuscript of Bénabou can be accessed [here](assets/benabou.pdf).

## The translation

{% for lecture in site.lectures %}
  <a href="{{ lecture.url | relative_url }}">{{lecture.title}}</a>
{% endfor %}
