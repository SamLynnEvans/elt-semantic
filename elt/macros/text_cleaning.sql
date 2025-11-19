{% macro clean_text(expr) %}
    -- Step 1: Replace any newline or carriage-return characters
    --         with a single space. This flattens multi-line text
    --         for warehouse-friendly storage without altering meaning.
    -- Step 2: Remove non-printable ASCII control characters
    --         (common in PDF-extracted or OCR-generated text).
    -- Step 3: Collapse any type of repeated whitespace
    --         (tabs, multiple spaces, mixed whitespace)
    --         into a single space.
    {{
        regexp_replace_sf(
            regexp_replace_sf(
                regexp_replace_sf(
                    (expr),
                    "'[\\r\\n]+'",
                    "' '"
                ),
                "'[\\x00-\\x1F]'",
                "''"
            ),
            "'\\\\s+'",
            "' '"
        )
    }}
{% endmacro %}
