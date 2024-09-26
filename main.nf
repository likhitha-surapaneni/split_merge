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
 * Main file that calls the workflows
 */
include { validateParameters; paramsSummaryLog} from 'plugin/nf-schema'
include { split_merge } from './workflows/split_merge'


// Print help message, supply typical command line usage for the pipeline
if (params.help) {
    log.info """
        Pipeline to run split-merge text
        -------------------
        Usage:
        nextflow run main.nf --input_file <path-to-txt-file> 

        Options:
        --input_file TXT                 Text file

        """
    exit 1
}

// Validate input parameters
validateParameters()

// Print summary of supplied parameters
log.info paramsSummaryLog(workflow)

workflow {
  split_merge()
}