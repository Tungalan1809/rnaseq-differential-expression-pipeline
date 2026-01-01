workflow {

    Channel.fromFilePairs(params.reads).view()

}