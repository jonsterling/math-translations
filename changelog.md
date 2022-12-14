---
layout: page
title: Recent changes
limit: 50
---

<style>

  details > summary {
    margin-bottom: 15px;
    padding-inline-start: 1ch;
  }

  details[open] > summary {
    display: none;
  }

  summary { list-style: none; }
  summary::-webkit-details-marker { display: none; }

  details summary::before {
    position: absolute;
    transform: translateX(-100%);
    padding-right: 1ch;
    content: '⧆';
    color: hsl(0, 0%, 40%);
  }

  summary {
    cursor: pointer;
    padding-inline-start: 1ch;
  }

  li.diff-A, li.diff-M, li.diff-D {
    padding-inline-start: 1ch;
  }
  li.diff-A { list-style-type: '⊞'; }
  li.diff-M { list-style-type: '⊡'; } /* ⧇ */
  li.diff-D { list-style-type: '⊟'; }
  li.diff-A::marker { color: hsl(120, 100%, 40%); }
  li.diff-M::marker { color: hsl(240, 100%, 40%); }
  li.diff-D::marker { color: hsl(  0, 100%, 40%); }

  ul {
    padding: 0;
    margin-top: 0;
    margin-left: 0;
  }

  .author {
    float: right;
    font-style: italic;
  }

</style>

{% if page.commits.size > page.limit %}
These are the last {{ page.limit }} of the {{ page.commits.size }} commits involving nodes.
{% endif %}

<dl>

{% for commit in page.commits limit: page.limit %}

<dt>

<strong>{{ commit.timestamp | date_to_string }}</strong>

<a href="https://github.com/jonsterling/math/commit/{{ commit.hash }}">
  <code>{{ commit.hash | truncate: 7, "" }}</code>
</a>

{{ commit.subject }}

{% unless commit.author.hide -%}
  <span class="author">by
    {% if commit.author.link -%}
      <a href="{{ commit.author.link }}">{{ commit.author.name }}</a>
    {%- else -%}
      {{ commit.author.name }}
    {%- endif -%}
  </span>
{%- endunless %}

</dt>

<dd>

{% capture commit_list %}

<ul>
  {% for diff in commit.diffs %}
  <li class="diff-{{ diff.status }}">

    {% if diff.node %}
      <a href="{{diff.node.url | relative_url}}">
        {{diff.node | display_title}}
        {% if diff.node.collection == "nodes" %}
          <span class="slug">[{{diff.node.slug}}]</span>
        {% endif %}
      </a>
    {% else %}
      <del>{{ diff.path | split: "/" | last | remove: ".md" }}</del>
    {% endif%}

  </li>
  {% endfor %}
</ul>

{% endcapture %}

<details {% if commit.diffs.size < 7 %}open{% endif %}>
  <summary markdown='span'>Click to (un)fold the list of all {{ commit.diffs.size }} affected nodes.</summary>
  {{ commit_list }}
</details>

</dd>

{% endfor %}

</dl>
