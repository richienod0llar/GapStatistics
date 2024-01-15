#installing and loading the package ISLR containing the dataset NCI60
install.packages("ISLR")
library(ISLR)
#creating the dataset
nci.labs=NCI60$labs
nci.data=NCI60$data
#checking the data
dim(nci.data)
nci.labs[1:4]
table(nci.labs)

#scaling the data
sd.data=scale(nci.data)

#performing hierarchical clustering using average linkage and eucledian distance 
library(cluster)
library(factoextra)
par(mfrow=c(1,3))
data.dist=dist(sd.data)
plot(hclust(data.dist , method ="average"), labels=nci.labs , main="Average Linkage ", xlab="", sub="",ylab="")
