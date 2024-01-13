# GapStatistics
Using Gap Statistics to find the optimal number of clusters in a dataset

I was working on a Seminar Project with this topic and made a few examples myself on RStudio to explain it properly. I also made a Powerpoint Presentation and my own research paper on the topic which will also be uploaded soon here. 
You will find here the following three examples : 
1. NewDatasetExample - this is a dataset i created myself with latitude and logitude data and a third coloumn with waste. This has no optimal clusters because the gap is negative and keeps on decreasing. So this dataset has no clusters.
2. USArrestsExample - this is a pre-loaded dataset in RStudio which is widely used in cluster analysis projects. In this example I calculated the distance and also created a distance matrix. Then we calculate the gap statistics and plot the results and find the optimal number of clusters. I also analysed the data with Silhouette method and elbow method for comparison.
3. RockExample - another pre-loaded dataset in RStudio. I calculated the distance and plotted the distance matrix just like the previous example. Here I just have the gap statistics calculated to explain once again the method more throughly.
4. ISLR NCI60 - this is the original dataset used in the paper "Estimating the number of clusters in a data set via gap statistics : Robert Tibshirani, Guenther Walther and Trevor Hastie - Stanford University, USA". Here I have just plotted the hierarchical clustering using average linkange and eucledian distance, just to explain another approach for cluster analysis other than K-Means.
