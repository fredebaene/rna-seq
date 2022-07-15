process CreateIndex {

    cpus 4
    container "combinelab/salmon:1.9.0"
    publishDir path: "${params.refDir}", mode: "copy"

    input:
    path(transcriptomeFile)

    output:
    path("index"), emit: ch_index_files

    script:
    """
    salmon index --threads ${task.cpus} -t ${transcriptomeFile} -i index
    """

}