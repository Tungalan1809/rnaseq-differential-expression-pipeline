#!/usr/bin/bash nextflow

process STAR_INDEX {

    label 'process_high'
    container 'ghcr.io/bf528/star:latest'
    publishDir params.outdir, mode: "copy"

    input:
    path gtf
    path fasta

    output:
    path("index"), emit: index

    script:
    """
    mkdir index
    STAR --runThreadN $task.cpus --runMode genomeGenerate --genomeDir index --genomeFastaFiles $fasta --sjdbGTFfile $gtf --sjdbOverhang 100
    """

    stub:
    """
    mkdir star
    """

}