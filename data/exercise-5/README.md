## Exercise 5 - Taxonomic assignment and comparison of approaches ##

In the course of the exercise in this directory (see [notebook](https://github.com/HullUni-bioinformatics/egrep-2016/blob/master/data/exercise-5/results_backup/Taxonomic_assignment.ipynb)) we will attempt to assign taxonomic identity to the set of denovo OTUs obtained from the 39 tree invertebrate metabarcoding samples that we have produced in [exercise-3](https://github.com/HullUni-bioinformatics/egrep-2016/tree/master/data/exercise-3).

We will again be using our custom pipeline metaBEAT to make our lives easier and to facilitate reproducibility. 

Taxonomic assignment will be performed using two different approaches:
 - BLAST based LCA
 - [Kraken](http://ccb.jhu.edu/software/kraken/MANUAL.html) (k-mer based sequence classification)

We will be using a custom reference database (details can be found [here](https://github.com/HullUni-bioinformatics/egrep-2016/blob/master/data/reference-dbs/supplementary_material/download_reference_data.ipynb).

Most of the input data you will need for the analysis you have already produced in exercise 3. The rest you can find in the directory `input_data`.

We have prepared a [notebook](https://github.com/HullUni-bioinformatics/egrep-2016/blob/master/data/exercise-5/results_backup/Taxonomic_assignment.ipynb) that will guide you through the process.

[Back](https://docs.google.com/document/d/17-PcEZYIseTumXi2I0vIKAvMFRDBUqWFd96QueNyJxs/edit#heading=h.wgy7cwfmxgon) to the course manual.
