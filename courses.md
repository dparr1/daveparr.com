---
layout: page
title: Courses
permalink: /courses/
comments: false
---

I teach in the Department of Geography and the Environment at the University of North Carolina at Chapel Hill. Each course has its own page.

{% for course in site.data.courses %}
### [{{ course.title }}]({{ course.url | relative_url }})

{{ course.summary }}
{% endfor %}
