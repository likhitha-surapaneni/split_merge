#!/usr/bin/env nextflow

/* 
 * Script to merge multiple text files into single text file
*/

nextflow.enable.dsl=2

process mergeTxt {
  /*
  Merge multiple text files into single text file

  Returns
  -------
  Merge text file
  */
  
  cpus params.cpus
  publishDir params.output_dir

  input:
    path(split_text_files)

  output:
    path("*merged.txt")

  script:
  """
  cat ${split_text_files} > name_merged.txt
  """

}
