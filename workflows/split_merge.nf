
// See the NOTICE file distributed with this work for additional information
// regarding copyright ownership.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
include { splitTxt } from '../nf_modules/split_text.nf'
include { mergeTxt } from '../nf_modules/merge_text.nf'

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
    splitTxt(input_text_channel)
    mergeTxt(splitTxt.out.collect())
    
}
