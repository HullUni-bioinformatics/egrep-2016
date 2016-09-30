## Richness stats and figures for metabarcoding data 	##
## Christoph Hahn September 2016			##

library(vegan)
library(picante)

setwd('/media/chrishah/STORAGE/Dropbox/Github/egrep_devel/R_analyses/ANALYSES/')

table <- read.csv('good_for_R.csv',row.names = 1)
metadata <- read.csv('metadata.csv',row.names = 1, header = T)

pdf('FIGURES/Number_OTUs_per_sample.pdf')
barchart(specnumber(table), xlab='# of OTUs')
dev.off()

pdf('FIGURES/boxplot_by_tree_sp_richness.pdf', width = 10)
boxplot(specnumber(table) ~ metadata$Species, ylab='# of OTUs')
dev.off()

pdf('FIGURES/boxplot_by_forest_richness.pdf')
boxplot(specnumber(table) ~ metadata$Forest, ylab='# of OTUs')
dev.off()

pdf('FIGURES/boxplot_by_tree_sp_shannon.pdf', width = 10)
boxplot(diversity(table, "shannon") ~ metadata$Species, ylab='Shannon-weaver')
dev.off()
pdf('FIGURES/boxplot_by_tree_sp_simpson.pdf', width = 10)
boxplot(diversity(table,"simpson") ~ metadata$Species, ylab='Simpson')
dev.off()
pdf('FIGURES/boxplot_by_tree_sp_invsimpson.pdf', width = 10)
boxplot(diversity(table,"invsimpson") ~ metadata$Species, ylab='inverse Simpson')
dev.off()

#ASH
ASH <- table[grepl("ASH", row.names(table)),]
OAK <- table[grepl("OAK", row.names(table)),]
HAZ <- table[grepl("HAZ", row.names(table)),]
BET <- table[grepl("BET", row.names(table)),]
BEE <- table[grepl("BEE", row.names(table)),]

#test OAK vs ASH species richness
boxplot(specnumber(ASH),specnumber(OAK))
t.test(specnumber(ASH),specnumber(OAK))
wilcox.test(specnumber(ASH),specnumber(OAK))

hist(specnumber(ASH), breaks=10)
hist(specnumber(OAK), breaks=10)

