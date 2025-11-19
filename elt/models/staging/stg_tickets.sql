with source as (

    select *
    from {{ ref('raw_tickets') }}

),

cleaned as (

    select
        {{ clean_text("ticket_id") }}                       as ticket_id,
        {{ to_number("linked_doc_id") }}                    as linked_doc_id,
        upper(trim(priority))                               as priority,
        trim(department)                                    as department,
        {{ clean_text("resolution_summary") }}              as resolution_summary

    from source

)

select *
from cleaned
