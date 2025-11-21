# Semantic RAG Pipeline (dbt + DuckDB + Chroma + Jupyter)

This project implements a compact semantic RAG workflow using:

- **dbt** for modelling  
- **DuckDB** as the local warehouse  
- **Python + Gemini** for chunking + embeddings  
- **Chroma** as the vector store  
- **Jupyter** for running python code interactively

Everything runs inside Docker for reproducibility.

---

## 🚀 Quick Start

### Prerequisites

This project uses Docker to ensure a fully reproducible environment across machines.\
To run the pipeline as delivered, you’ll need Docker installed.\
If Docker is not available, I can provide a lightweight Python virtualenv version on request. \
A Gemini API Key is Additionally required for embedding the rag chunks.


### Steps

### 1. Set API Key

Enter your Gemini API key in the setup.sh file.

### 2. Build and Run

Run `sh setup.sh` from terminal, this will:

- Run the ELT pipeline creating the docs_for_rag table in a local DuckDB instance.
- Spin up a jupyter notebook server for vectorization wich access to the DuckDB instance created in step above.

### 3. Access Jupyter

Access the Jupyter notebook at http://localhost:8888

### 4. Run Vectorization

In Jupyter, open notebooks/Vectorization.ipynb and select:\
Kernel → Restart Kernel and Run All Cells


### 5. Experiment

Use the search function at the bottom of the notebook to experiment with semantic search on the dataset.


### Discussion: Why a Jupyter Notebook for Vectorisation?

The vectorisation stage of this project is implemented in a Jupyter notebook by design.  
At this point the goal is experimentation, not product-ready code.

A notebook is the natural environment for this kind of exploratory workflow. It allows rapid iteration and visual exploration of data for testing.

The notebook includes:

- examination of sample rows,
- roll-ups comparing table counts vs vector counts,
- and simple semantic search probes to confirm retrieval behaves intuitively.

In a production setting this workflow would change substantially, involving ci/cd, tests and mocks, and I look forward to dicussing on the call.

But for this assignment, where the goal is to produce an MVP, validate the approach, and demonstrate a working semantic indexing pipeline, a Jupyter notebook strikes the right balance between clarity, flexibility, and speed.
