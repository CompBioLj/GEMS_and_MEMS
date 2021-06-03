##################### Jaccard index

library(jaccard)
library(data.table)
library(dplyr)

data = read.csv("...path ... \\rxnMatrix_iMAT.csv", head = TRUE, sep=";")
dim(data)
data[1:5,]
colnames(data)

dlfnc = data[,2:37]
colnames(dlfnc)

# jacard index
nc = ncol(dlfnc)
jacard=c()
jacPvalue=c()
mod1=c()
mod2=c()
for(i in 1 : nc){
  for(j in 1 : nc){
   x = as.vector(dlfnc[,i])
   y = as.vector(dlfnc[,j])
   jacInd = jaccard(x,y)
   cnam1 = colnames(dlfnc[i])
   cnam1x = gsub("imat_", "", cnam1)
   mod1= c(mod1, cnam1x)

   cnam2 = colnames(dlfnc[j])
   cnam2x = gsub("imat_", "", cnam2)
   mod2= c(mod2, cnam2x)
   jacard = c(jacard,jacInd)
  }
}

lfncJacard = data.frame(mod1,mod2,jacard)
head(lfncJacard)
dim(lfncJacard)
write.csv(lfncJacard, "jaccard_iMAT.csv")


################## heatmap
library(ggplot2)
require(gplots)
require(RColorBrewer)

lfncNamesAll = c("X005","X304","X101","X008",
                  "X109","X510","X401","X207",
                  "X505","X614","X701","X406",
                  "X041","X128","X039","X036",
                  "X534","X231","X428","X335",
                  "X632","X426","X711","X535",
                  "X023","X121","X122","X311",
                  "X114","X420","X615","X518",
                  "X513","X524","X706","X624")

# convert to matrix
# get names for row and columns
nameVals = sort(unique(unlist(lfncJacard[1:2])))
# construct 0 matrix of correct dimensions with row and column names
myMat <- matrix(0, length(nameVals), length(nameVals), dimnames = list(nameVals, nameVals))
# fill in the matrix with matrix indexing on row and column names
myMat[as.matrix(lfncJacard[c("mod1", "mod2")])] <- lfncJacard[["jacard"]] 
myMatJicard = myMat
myMatJicard[1:5, 1:5] 

# rearrange column names to suite colors defined 
library(graph4lg)
lfncNames2 = gsub("imat_", "", lfncNamesAll)
myMatJicard2 = reorder_mat(myMatJicard, lfncNamesAll)
myMatJicard2[1:5, 1:5]
lfncNamesAll
colnames(myMatJicard2)

cols = c(rep("Blue", 12), rep("Red", 12), rep("Black", 12)) ## by diet alone in heatmap.2

# heatmap final 
my_palette <- colorRampPalette(c("red", "yellow", "green"))(n = 299)
heatmap.2(myMatJicard2, trace="none", col = my_palette,cexRow = 0.7,keysize = 1.2,
    dendrogram = c("column"),Rowv = TRUE, 
    densadj = 0.25, key.ytickfun = NULL,cexCol = 0.7, margins = c(5, 5),key.title = NULL,
    key.xlab = NULL,key.ylab = NULL, density.info=c("none"), colCol = cols, colRow = cols)

#by diet
colGroup = c("Blue", "Red", "Black")
groupsx = c("LFnC", "HFnC","HFC")
legend(-0.001,5.6, groupsx, col=colGroup, pch=15, ncol = 1, cex=0.5)









