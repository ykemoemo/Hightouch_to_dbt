{% macro diff(SENT_DATE) %}
    date_diff(SENT_DATE, {{now()}}, DAY)
{% endmacro %}