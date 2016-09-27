## Exercise 3 - UK tree arthropods metabarcoding ##

In this exercise we will use [metaBEAT](https://github.com/HullUni-bioinformatics/metaBEAT), a tool tailored towards reproducible and efficient analyses of metabarcoding data that we have developed in-house. It is still under active development and will likely be extended further in the future. The pipeline is available in a Docker [container](https://registry.hub.docker.com/u/chrishah/metabeat/) with all necessary dependencies. The Docker image is building on [ReproPhylo](https://registry.hub.docker.com/u/szitenberg/reprophylo/).

The data we will be analyzing are COI sequences amplified from 'arthropod soup' collected off UK trees at three different locations.

The metaBEAT is designed as a wrapper around a complete analysis from raw data, performing (optionally) de-multiplexing, quality filtering, clustering along the way, to OTU tables in biom format. It currently supports BLAST-, Kraken- and phylogenetic placement (pplacer) based taxonomic assignment. The plan is to include further approaches in the future and to allow for efficient and standardized comparative assessments of all approaches.

We will use the metaBEAT pipeline to process the data, from raw Illumina reads, via quality trimming, read merging, and clustering, to a denovo OTU table. We provided the notebook `read_processing_metaBEAT.ipynb` that will guide you through the process. Start a new notebook and try to follow the steps outlined there.

Back to Google [doc](https://docs.google.com/document/d/17-PcEZYIseTumXi2I0vIKAvMFRDBUqWFd96QueNyJxs/edit#heading=h.cil8adtwrb2s).
