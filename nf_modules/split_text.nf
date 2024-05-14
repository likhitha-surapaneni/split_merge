#!/usr/bin/env nextflow

/* 
 * Script to split a text file into multiple text files
*/

nextflow.enable.dsl=2

process splitTxt {
  /*
  Split text file into multiple text files

  Returns
  -------
  Tuple of split text files
  */
  
  cpus params.cpus

  input:
    val name

  output:
    path("*.txt")

  script:
  """
  echo "EMBL ${name}" > name_${name}.txt
  """

}
