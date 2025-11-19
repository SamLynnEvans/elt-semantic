with source as (
    select *
    from {{ ref('raw_documents') }}
),

cleaned as (
    select
        {{ to_number("doc_id") }}                                   as doc_id,
        title,
        {{ to_date("last_modified::string") }}                       as last_modified,
        {{ clean_text("raw_text") }}       as cleaned_text
    from source

)

select *
from cleaned
