{% macro iff(condition, true_expr, false_expr) %}
    -- Snowflake IFF(cond, a, b) → CASE for DuckDB
    case
        when {{ condition }} then {{ true_expr }}
        else {{ false_expr }}
    end
{% endmacro %}


{% macro nvl(a, b) %}
    coalesce({{ a }}, {{ b }})
{% endmacro %}


{% macro to_date(expr) %}
    cast({{ expr }} as date)
{% endmacro %}


{% macro to_timestamp(expr) %}
    cast({{ expr }} as timestamp)
{% endmacro %}


{% macro to_number(expr) %}
    cast({{ expr }} as integer)
{% endmacro %}


{% macro to_varchar(expr) %}
    cast({{ expr }} as varchar)
{% endmacro %}


{% macro regexp_replace_sf(expr, pattern, replacement) %}
    -- Snowflake REGEXP_REPLACE(expr, '\\s+', ' ') → DuckDB regexp_replace(expr, '\s+', ' ')
    -- Expect pattern in Snowflake form (double-escaped), but DuckDB uses single escapes
    regexp_replace({{ expr }}, {{ pattern }}, {{ replacement }})
{% endmacro %}

