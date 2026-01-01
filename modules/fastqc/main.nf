#!/usr/bin/bash nextflow

process FASTQC {
    label 'process_low'
    container 'ghcr.io/bf528/fastqc:latest'
    publishDir "${params.outdir}/fastqc", mode: "copy"

    input:
    tuple val(sample), path(fastq)

    output:
    tuple val(sample), path("*.html"), emit: html
    tuple val(sample), path("*.zip"), emit: zip

    script:
    """
    fastqc $fastq
    """
}