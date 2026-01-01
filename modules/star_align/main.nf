#!/usr/bin/bash nextflow

process STAR_ALIGN {

    label 'process_high'
    container 'ghcr.io/bf528/star:latest'
    publishDir "${params.outdir}/star_align", mode: "copy"

    input:
    tuple val(name), path(reads)
    path(genome_index)

    output:
    tuple val(name), path("${name}Aligned.sortedByCoord.out.bam"), emit: bam
    path("${name}Log.final.out"), emit: log
    path("${name}ReadsPerGene.out.tab"), emit: counts 

    script:
    """
    STAR --runThreadN $task.cpus --genomeDir $genome_index --readFilesIn $reads --readFilesCommand zcat --outFileNamePrefix $name --outSAMtype BAM SortedByCoordinate --quantMode GeneCounts --outSAMattrRGline ID:$name SM:$name
    """
}
