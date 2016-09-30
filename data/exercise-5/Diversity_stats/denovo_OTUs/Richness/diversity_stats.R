## Richness stats and figures for metabarcoding data 	##
## Christoph Hahn September 2016			##

library(vegan)
library(picante)

setwd('/media/chrishah/STORAGE/Dropbox/Github/egrep_devel/R_analyses/ANALYSES_NEW/denovo_OTUs/Richness/')

table <- read.csv('../COI-trim30min100-merge-c3-id97-OTU-denovo.for-R.csv',row.names = 1)
metadata <- read.csv('../metadata.csv',row.names = 1, header = T)

pdf('Number_OTUs_per_sample.pdf')
barchart(specnumber(table), xlab='# of OTUs')
dev.off()

pdf('boxplot_by_tree_sp_OTU_richness.pdf', width = 10)
boxplot(specnumber(table) ~ metadata$Species, ylab='# of OTUs')
dev.off()

pdf('boxplot_by_forest_OTU_richness.pdf')
boxplot(specnumber(table) ~ metadata$Forest, ylab='# of OTUs')
dev.off()

pdf('boxplot_by_tree_sp_OTUs_shannon.pdf', width = 10)
boxplot(diversity(table, "shannon") ~ metadata$Species, ylab='Shannon-weaver')
dev.off()
pdf('boxplot_by_tree_sp_OTUs_simpson.pdf', width = 10)
boxplot(diversity(table,"simpson") ~ metadata$Species, ylab='Simpson')
dev.off()
pdf('boxplot_by_tree_sp_OTUs_invsimpson.pdf', width = 10)
boxplot(diversity(table,"invsimpson") ~ metadata$Species, ylab='inverse Simpson')
dev.off()

#ASH
ASH <- table[grepl("ASH", row.names(table)),]
OAK <- table[grepl("OAK", row.names(table)),]
HAZ <- table[grepl("HAZ", row.names(table)),]
BET <- table[grepl("BET", row.names(table)),]
BEE <- table[grepl("BEE", row.names(table)),]

#test OAK vs ASH species richness
pdf('boxplot_Ash_vs_Oak_OTU_richness.pdf')
boxplot(specnumber(ASH),specnumber(OAK), names = c('Ash','Oak'), ylab = '# of OTUs')
dev.off()

hist(specnumber(ASH), breaks=10)
hist(specnumber(OAK), breaks=10)

#if the data were normally distributed we would be ok to use
t.test(specnumber(ASH),specnumber(OAK))

#Welch Two Sample t-test
#
#data:  specnumber(ASH) and specnumber(OAK)
#t = -1.5652, df = 13.53, p-value = 0.1406
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
#  -115.04476   18.15587
#sample estimates:
#  mean of x mean of y 
#80.44444 128.88889 

#here is a non-parametric test if not normally distributed
wilcox.test(specnumber(ASH),specnumber(OAK))

#Wilcoxon rank sum test
#
#data:  specnumber(ASH) and specnumber(OAK)
#W = 28, p-value = 0.2973
#alternative hypothesis: true location shift is not equal to 0
