{% macro calculate_revenue(price_column, quantity_column) %}
    coalesce({{ price_column }}, 0) * coalesce({{ quantity_column }}, 0)
{% endmacro %}