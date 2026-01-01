#!/usr/bin/env nextflow

include {FASTQC} from './modules/fastqc'
include {PARSE_GTF} from './modules/parse_gtf'
include {STAR_INDEX} from './modules/star_index'
include {STAR_ALIGN} from './modules/star_align'
include {MULTIQC} from './modules/multiqc'
include {VERSE} from './modules/verse'
include {CONCAT} from './modules/concat'

workflow {

    // Create a channel from the paired FASTQ files
    Channel.fromFilePairs(params.reads).set { align_ch }
    Channel.fromFilePairs(params.reads).transpose().set{ fastqc_ch }

    FASTQC(fastqc_ch)
    PARSE_GTF(params.gtf)
    STAR_INDEX(params.gtf, params.genome)
    STAR_ALIGN(align_ch, STAR_INDEX.out.index)

    FASTQC.out.zip.map { it[1] }.collect()
    | set { fastqc_out }

    STAR_ALIGN.out.log.collect()
    | set { star_log_out }

    fastqc_out.mix(star_log_out).flatten().collect()
    | set { multiqc_ch }

    MULTIQC(multiqc_ch)

    VERSE(STAR_ALIGN.out.bam, params.gtf)

    VERSE.out.counts.map { it[1] }.collect()
    | set { verse_files_ch }

    CONCAT(verse_files_ch)

}
