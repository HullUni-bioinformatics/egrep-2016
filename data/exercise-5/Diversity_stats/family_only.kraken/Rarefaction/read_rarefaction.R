#read rarefaction
#Christoph Hahn September 2016

library(vegan)
library(picante)

setwd('/media/chrishah/STORAGE/Dropbox/Github/egrep_devel/R_analyses/ANALYSES_NEW/family_only.kraken/Rarefaction/')

#source custom function modified from http://www.jennajacobs.org/R/rarefaction.txt
source("rarefaction_function.R")

table <- read.csv('../COI-trim30min100-merge-c3-id97-by-taxonomy-readcounts.kraken.family.for-R.csv',row.names = 1)
metadata <- read.csv('../metadata.csv',row.names = 1, header = T)

#ASH
ASH <- table[grepl("ASH", row.names(table)),]

pdf(file="read_rarefaction_Color_by_sample_ASH.pdf")
rarefaction(ASH, subsample=1000, color=T)
dev.off()

#OAK
OAK <- table[grepl("OAK", row.names(table)),]

pdf(file="read_rarefaction_Color_by_sample_OAK.pdf")
rarefaction(OAK, subsample=1000, color=T)
dev.off()

#HAZEL
HAZ <- table[grepl("HAZ", row.names(table)),]

pdf(file="read_rarefaction_Color_by_sample_HAZ.pdf")
rarefaction(HAZ, subsample=1000, color=T)
dev.off()

#BET
BET <- table[grepl("BET", row.names(table)),]

pdf(file="read_rarefaction_Color_by_sample_BET.pdf")
rarefaction(BET, subsample=1000, color=T)
dev.off()

#BEE
BEE <- table[grepl("BEE", row.names(table)),]

pdf(file="read_rarefaction_Color_by_sample_BEE.pdf")
rarefaction(BEE, subsample=1000, color=T)
dev.off()


