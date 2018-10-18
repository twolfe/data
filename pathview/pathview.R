library("pathview", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.4")
setwd("/data/phdData/orchis/counts/de.featureCounts/pathview/")
SP.KEGG <- read.table("/data/phdData/orchis/counts/de.featureCounts/pathview/KO.genes.txt")
#SP.KEGG <- read.table("/data/phdData/orchis/counts/de.featureCounts/pathview/Kegg.KO.genes.txt")
SP.KEGG <- SP.KEGG[order(SP.KEGG$V1),]
results <- read.table("/data/phdData/orchis/counts/de.featureCounts/both.de.results.txt", header = T)
results <- (results[rownames(results) %in% SP.KEGG$V1,c(1,2)])
results <- results[order(rownames(results)),]
dat <- data.frame(SP.KEGG$V2, results$logFC)
dat <- dat[order(dat$SP.KEGG.V2),]
dat <- dat[!duplicated(dat$SP.KEGG.V2),]
rownames(dat) <- dat$SP.KEGG.V2
dat$SP.KEGG.V2 <- NULL
pathview(gene.data = dat, species = "ko", pathway.id = "03008", gene.idtype = "KEGG", kegg.native = T, 
         same.layer=T, cex=0.0005, res=7000, low = "red", mid = "white", high = "blue")
