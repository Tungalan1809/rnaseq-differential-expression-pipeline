#!/usr/bin/bash nextflow

process MULTIQC {

    label 'process_low'
    container 'ghcr.io/bf528/multiqc:latest'
    publishDir 'results/', mode: 'copy'

    input:
    path ("*")

    output:
    path("multiqc_report.html")

    script:
    """
    multiqc . -f
    """
    
}
