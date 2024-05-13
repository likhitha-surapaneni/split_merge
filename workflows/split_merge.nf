/* 
 * Workflow to read a file, write to separate files and then rewrite to a single file
 *
 * This workflow relies on Nextflow (see https://www.nextflow.io/tags/workflow.html)
 *
 */

nextflow.enable.dsl=2

 // params default
params.cpus = 1
params.input_file = null
params.output_dir = "outdir"
params.output_prefix = ""
params.help = false

// module imports
include { splitText } from '../nf_modules/split_text.nf'
include { mergeText } from '../nf_modules/merge_text.nf'

if (params.help) {
  log.info """
    Pipeline to run spli-merge text
    -------------------
    Usage:
    nextflow run workflows/split_merge.nf --input_file <path-to-txt-file> 

    Options:
    --input_file TXT                 Text file

    """
  exit 1
}

workflow {
  main:
    input_text_channel = Channel
                        .fromPath(params.input_file)
                        .splitText() { it.strip() }
    splitText(input_text_channel)
    mergeText(splitText.out.collect())
    
    
}
