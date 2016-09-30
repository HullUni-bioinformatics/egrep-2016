###########################################################################
############# Script for NMDS plots of metabarcoding data #################
###########################################################################

#Based on Yi et. al. 2013 (http://onlinelibrary.wiley.com/doi/10.1111/ele.12162/full)
#Script by James Kitson September 2015
#modified by Christoph Hahn September 2016

library(vegan)
library(picante)

setwd('/media/chrishah/STORAGE/Dropbox/Github/egrep_devel/R_analyses/ANALYSES/')

coms<-as.data.frame(read.csv("good_for_R.csv"))

### make column 1 the row names
rownames(coms)<-coms[,1]

### drop the sample column
coms.trim<-coms[,2:ncol(coms)]

### make the data presence/absense
coms.trimB=decostand(table, method = "log", logbase = Inf) # convert to presence/absence

# make a bunch of treatment variables
samples<-as.character(coms[,1])
tree<-substr(samples, start = 5, stop = 7)
forest<-substr(samples, start = 1, stop = 2)

samps.meta<-as.data.frame(cbind(samples,tree,forest))

########## Mantel and Procrustes comparisons with Heath sites ##########
coms.trimB.jdis <- vegdist(coms.trimB,method="jaccard",binary=TRUE)  # binary for presence/absence
coms.trim.qjdis <- vegdist(coms.trim,method="jaccard")  # quantitative
mantel(coms.trim.qjdis,coms.trimB.jdis)  # highly significantly correlated p = 0.001 (quantitative vs binary)

# Using the dissimilarity matrices made previously for NMDS (binary jaccard)
coms.trim.qjmds <- metaMDS(coms.trim.qjdis, wascores=FALSE, autotransform=FALSE,noshare=FALSE)
coms.trim.qjmds <- metaMDS(coms.trim.qjdis, wascores=FALSE, autotransform=FALSE,noshare=FALSE, previous = coms.trim.qjmds)

pdf('FIGURES/NMDS_trees_OTUs.pdf')
#plot(coms.trim.qjmds,display="sites") 
fig <- ordiplot(coms.trim.qjmds, type='n')
points(fig, "sites", col=c("#33A02C"), select = samps.meta$tree == 'HAZ', pch=18, cex=1.5)
points(fig, "sites", col=c("#A6CEE3"), select = samps.meta$tree == 'ASH', pch=19, cex=1.5)
points(fig, "sites", col=c("#1F78B4"), select = samps.meta$tree == 'BEE', pch=20, cex=1.5)
points(fig, "sites", col=c("#B2DF8A"), select = samps.meta$tree == 'BET', pch=21, cex=1.5)
points(fig, "sites", col=c("#FB9A99"), select = samps.meta$tree == 'OAK', pch=22, cex=1.5)

with(samps.meta,ordiellipse(coms.trim.qjmds, tree ,cex=.5, draw="polygon",
                            col=c("#33A02C"),alpha=180,
                            kind="se",conf=0.95,label=FALSE, 
                            show.groups=(c("HAZ"))))
with(samps.meta,ordiellipse(coms.trim.qjmds, tree ,cex=.5, draw="polygon",
                            col=c("#A6CEE3"),alpha=180,
                            kind="se",conf=0.95,label=FALSE, 
                            show.groups=(c("ASH"))))
with(samps.meta,ordiellipse(coms.trim.qjmds, tree ,cex=.5, draw="polygon",
                            col=c("#1F78B4"),alpha=180,
                            kind="se",conf=0.95,label=FALSE, 
                            show.groups=(c("BEE"))))
with(samps.meta,ordiellipse(coms.trim.qjmds, tree ,cex=.5, draw="polygon",
                            col=c("#B2DF8A"),alpha=180,
                            kind="se",conf=0.95,label=FALSE, 
                            show.groups=(c("BET"))))
with(samps.meta,ordiellipse(coms.trim.qjmds, tree ,cex=.5, draw="polygon",
                            col=c("#FB9A99"),alpha=180,
                            kind="se",conf=0.95,label=FALSE, 
                            show.groups=(c("OAK"))))
legend("topright", legend=c("Hazel", "Ash", "Beech", "Birch", "Oak"), pch = c(18,19,20,21,22),
       col= c("#33A02C","#A6CEE3","#1F78B4","#B2DF8A","#FB9A99"), pt.cex = 1.5)
dev.off()

pdf('FIGURES/NMDS_forest_OTUs.pdf')
#plot(coms.trim.qjmds,display="sites") 
fig <- ordiplot(coms.trim.qjmds, type='n')
points(fig, "sites", col=c("#33A02C"), select = samps.meta$forest == 'AH', pch=20, cex=1.5)
points(fig, "sites", col=c("#1F78B4"), select = samps.meta$forest == 'TH', pch=21, cex=1.5)
points(fig, "sites", col=c("#FB9A99"), select = samps.meta$forest == 'BW', pch=22, cex=1.5)
with(samps.meta,ordiellipse(coms.trim.qjmds, forest ,cex=.5, draw="polygon",
                            col=c("#33A02C"),alpha=180,
                            kind="se",conf=0.95,label=FALSE, 
                            show.groups=(c("AH"))))
with(samps.meta,ordiellipse(coms.trim.qjmds, forest ,cex=.5, draw="polygon",
                            col=c("#1F78B4"),alpha=180,
                            kind="se",conf=0.95,label=FALSE, 
                            show.groups=(c("TH"))))
with(samps.meta,ordiellipse(coms.trim.qjmds, forest ,cex=.5, draw="polygon",
                            col=c("#FB9A99"),alpha=180,
                            kind="se",conf=0.95,label=FALSE, 
                            show.groups=(c("BW"))))
legend("topright", legend=c("Alice Holt","Thetford","Bishop's Wood"), pch = c(18,19,20), pt.cex = 1.5,
       col = c("#33A02C","#1F78B4","#FB9A99"))

dev.off()
