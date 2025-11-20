select *
from {{ ref('docs_for_rag') }}
where document_text is null
   or length(document_text) = 0
