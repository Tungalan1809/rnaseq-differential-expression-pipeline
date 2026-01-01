#!/usr/bin/bash nextflow

process PARSE_GTF {

    label 'process_low'
    container 'ghcr.io/bf528/pandas:latest'
    publishDir "${params.outdir}/parse_gtf", mode: "copy"

    input:
    path(gtf_ch)

    output:
    path("gene_id_2_gene_name.tsv")

    script:
    """
    parse_gtf.py -i $gtf_ch -o gene_id_2_gene_name.tsv
    """

    stub:
    """
    touch id2name.txt
    """
    
}