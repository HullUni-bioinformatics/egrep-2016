## Richness stats and figures for metabarcoding data 	##
## Christoph Hahn September 2016			##

library(vegan)
library(picante)

setwd('/media/chrishah/STORAGE/Dropbox/Github/egrep_devel/R_analyses/ANALYSES_NEW/family_only.kraken/Richness/')

table <- read.csv('../COI-trim30min100-merge-c3-id97-by-taxonomy-readcounts.kraken.family.for-R.csv',row.names = 1)
metadata <- read.csv('../metadata.csv',row.names = 1, header = T)

pdf('Number_families_per_sample.pdf')
barchart(specnumber(table), xlab='# of families')
dev.off()

pdf('boxplot_by_tree_sp_family_richness.pdf', width = 10)
boxplot(specnumber(table) ~ metadata$Species, ylab='# of families')
dev.off()

pdf('boxplot_by_forest_family_richness.pdf')
boxplot(specnumber(table) ~ metadata$Forest, ylab='# of families')
dev.off()

pdf('boxplot_by_tree_sp_family_shannon.pdf', width = 10)
boxplot(diversity(table, "shannon") ~ metadata$Species, ylab='Shannon-weaver')
dev.off()
pdf('boxplot_by_tree_sp_family_simpson.pdf', width = 10)
boxplot(diversity(table,"simpson") ~ metadata$Species, ylab='Simpson')
dev.off()
pdf('boxplot_by_tree_sp_family_invsimpson.pdf', width = 10)
boxplot(diversity(table,"invsimpson") ~ metadata$Species, ylab='inverse Simpson')
dev.off()

#ASH
ASH <- table[grepl("ASH", row.names(table)),]
OAK <- table[grepl("OAK", row.names(table)),]
HAZ <- table[grepl("HAZ", row.names(table)),]
BET <- table[grepl("BET", row.names(table)),]
BEE <- table[grepl("BEE", row.names(table)),]

#test OAK vs ASH species richness
pdf('boxplot_Ash_vs_Oak_family_richness.pdf')
boxplot(specnumber(ASH),specnumber(OAK), names = c('Ash','Oak'), ylab = '# of families')
dev.off()

hist(specnumber(ASH), breaks=10)
hist(specnumber(OAK), breaks=10)

#if the data were normally distributed we would be ok to use
t.test(specnumber(ASH),specnumber(OAK))

#Welch Two Sample t-test

#data:  specnumber(ASH) and specnumber(OAK)
#t = -1.8816, df = 15.898, p-value = 0.07832
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
#  -16.0722599   0.9611488
#sample estimates:
#  mean of x mean of y 
#14.33333  21.88889 

#here is a non-parametric test if not normally distributed
wilcox.test(specnumber(ASH),specnumber(OAK))

#Wilcoxon rank sum test with continuity correction

#data:  specnumber(ASH) and specnumber(OAK)
#W = 21.5, p-value = 0.102
#alternative hypothesis: true location shift is not equal to 0

