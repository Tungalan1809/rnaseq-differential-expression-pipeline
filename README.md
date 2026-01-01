# RNA‑seq Differential Expression Analysis Pipeline

This repository contains a complete **RNA‑seq differential expression analysis pipeline** developed as part of the BF528 Genomic Data Analysis coursework at Boston University. The workflow performs quality control, alignment, gene quantification, differential expression, and pathway analysis on human RNA‑seq samples.

---

## **Project Overview**

The goal of this project is to implement a reproducible and scalable RNA‑seq pipeline using **Nextflow** and modern bioinformatics tools to go from raw sequencing reads to biologically meaningful insights, including enrichment of signaling pathways and transcriptional programs.

This project follows the BF528 course guidelines for RNA‑seq and is based on the BF528 project 2 specification. :contentReference[oaicite:0]{index=0}

---

## **Pipeline Summary**

The analysis performs the following major steps:

1. **Quality Control**
   - Evaluate raw read quality using tools like **FastQC**
   - Aggregate QC reports for overview

2. **Alignment**
   - Map reads to the reference human genome using **STAR**

3. **Read Quantification**
   - Quantify gene‑level expression using **VERSE**

4. **Differential Expression**
   - Compare sample groups to identify differentially expressed genes

5. **Pathway Enrichment**
   - Conduct Gene Set Enrichment Analysis (GSEA/fgsea) to interpret biological signal

---

## **Tools & Technologies**

This pipeline uses open‑source tools widely adopted in computational biology, including:

| Component | Tool |
|-----------|------|
| Workflow management | Nextflow |
| Quality control | FastQC, MultiQC |
| Alignment | STAR |
| Gene counting | VERSE |
| Differential expression | DESeq2 (in R) |
| Pathway analysis | fgsea (R package) |
| Scripting | Python (`bin/`) |
| Version control | Git, GitHub |

---

## **Repository Structure**

├── bin/ # Python scripts for data handling
├── modules/ # Nextflow modules for pipeline steps
├── main.nf # Nextflow pipeline configuration
├── nextflow.config # Pipeline parameters and settings
├── sample_sheet.csv # Example sample metadata
├── project2_analysis.Rmd # R analysis and visualization
└── README.md # Project overview (this file)

## **Results & Interpretation**

The pipeline produces:
Gene‑level count matrices
Differential expression results
Enrichment summaries of key pathways (e.g., immune, metabolic, stress response)
Visualizations in R (volcano plots, PCA, etc.)

**Use Case**

This pipeline can be adapted to:
Differential expression studies (case vs. control)
Time‑course experiments
Replication studies using public datasets

## **License**

This project is part of academic coursework and intended for educational and non‑commercial use.