with docs as (

    select *
    from {{ ref('stg_documents') }}

),

tickets as (

    select *
    from {{ ref('stg_tickets') }}

),

joined as (

    select
        d.doc_id,
        d.title as document_title,
        d.last_modified,
        d.cleaned_text as document_text,

        t.ticket_id,
        t.priority,
        t.department,
        t.resolution_summary,

        (
            'Policy "' || {{ to_varchar("d.title") }} || '" (' ||
            {{ to_varchar("d.doc_id") }} || ') states: ' ||
            d.cleaned_text ||
            ' Related ticket ' || {{ to_varchar("t.ticket_id") }} ||
            ' (' || {{ to_varchar("t.priority") }} || ', ' ||
            {{ to_varchar("t.department") }} ||
            ') was resolved as: ' ||
            {{ nvl("t.resolution_summary", "'No resolution provided'") }}
        ) as rag_chunk

    from docs d
    left join tickets t
      on d.doc_id = t.linked_doc_id

)

select *
from joined
