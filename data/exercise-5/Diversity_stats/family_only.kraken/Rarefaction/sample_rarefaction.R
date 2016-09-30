
#sample rarefaction
#Christoph Hahn September 2016

library(rich)

setwd('/media/chrishah/STORAGE/Dropbox/Github/egrep_devel/R_analyses/ANALYSES_NEW/family_only.kraken/Rarefaction/')
table <- read.csv('../COI-trim30min100-merge-c3-id97-by-taxonomy-readcounts.kraken.family.for-R.csv',row.names = 1)
metadata <- read.csv('../metadata.csv',row.names = 1, header = T)

ASH <- table[grepl("ASH", row.names(table)),]
OAK <- table[grepl("OAK", row.names(table)),]
BEE <- table[grepl("BEE", row.names(table)),]
BET <- table[grepl("BET", row.names(table)),]
HAZ <- table[grepl("HAZ", row.names(table)),]


pdf(file="per_sample_rarefaction_by_tree_sp_family.pdf")
colors <- rainbow(5)
rar <- rarc(OAK, nrandom=100)
plot(rar$out[,6],rar$out[,1], col=colors[1], type = 'b', pch=18, ylim = range(c(rar$out[,1],rar$out[,1])), xlab='Number of samples', ylab = 'family richness')
#plot(rar$out[,6],rar$out[,1], col='blue', type = 'b', ylim = range(c(rar$out[,2],rar$out[,3])))
#points(rar$out[,6],rar$out[,2], col='blue', type = 'l', lty=2, lwd=0.5)
#points(rar$out[,6],rar$out[,3], col='blue', type = 'l',lty=2, lwd=0.5)

legend_y=max(rar$out[,1])
legend_x=min(rar$out[,6])

rar <- rarc(ASH, nrandom=100)
points(rar$out[,6],rar$out[,1], col=colors[2], type = 'b', pch=19)
#points(rar$out[,6],rar$out[,2], col='red', type = 'l', lty=2, lwd=0.5)
#points(rar$out[,6],rar$out[,3], col='red', type = 'l',lty=2, lwd=0.5)

rar <- rarc(BET, nrandom=100)
points(rar$out[,6],rar$out[,1], col=colors[3], type = 'b',pch=20)
#points(rar$out[,6],rar$out[,2], col='darkgreen', type = 'l', lty=2, lwd=0.5)
#points(rar$out[,6],rar$out[,3], col='darkgreen', type = 'l',lty=2, lwd=0.5)

rar <- rarc(BEE, nrandom=100)
points(rar$out[,6],rar$out[,1], col=colors[4], type = 'b', pch=21)
#points(rar$out[,6],rar$out[,2], col='brown', type = 'l', lty=2, lwd=0.5)
#points(rar$out[,6],rar$out[,3], col='brown', type = 'l',lty=2, lwd=0.5)

rar <- rarc(HAZ, nrandom=100)
points(rar$out[,6],rar$out[,1], col=colors[5], type = 'b', pch=22)
#points(rar$out[,6],rar$out[,2], col='orange', type = 'l', lty=2, lwd=0.5)
#points(rar$out[,6],rar$out[,3], col='orange', type = 'l',lty=2, lwd=0.5)

legend(legend_x,legend_y, legend=c('OAK','ASH','BET','BEE','HAZ'), pch=c(18,19,20,21,22), col=colors)

dev.off()

####################

#across all samples
pdf(file="per_sample_rarefaction_all_families.pdf")
rar <- rarc(table, nrandom=100)
plot(rar$out[,6],rar$out[,1], col='darkgreen', 
     type = 'l', ylim = range(c(rar$out[,2],rar$out[,3])), 
     xlab='Number of samples', ylab = 'family richness', lwd=1)
points(rar$out[,6],rar$out[,1], col='darkgreen',pch=20, cex = 1)
points(rar$out[,6],rar$out[,2], col='darkgreen', type = 'l', lty=2, lwd=0.5)
points(rar$out[,6],rar$out[,3], col='darkgreen', type = 'l',lty=2, lwd=0.5)
dev.off()
