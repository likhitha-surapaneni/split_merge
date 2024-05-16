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
  // label "default"
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
