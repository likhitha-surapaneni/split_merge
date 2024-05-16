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
    // label "default"

    input:
        val name

    output:
        path("*.txt")

    script:
    """
    echo "EMBL ${name}" > name_${name}.txt
    """
}
