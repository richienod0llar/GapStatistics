#load the dataset
df2 <- USArrests
#take out nulll values
df2 <- na.omit(df2)
#scale/standardize the data
df2 <- scale(df2)

#calculate the distance 
distance2 <- get_dist(df2)
fviz_dist(distance2, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))


#computing Gap Statistic 
set.seed(200)
gap_stat <- clusGap(df2, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)

#printing the result
print(gap_stat, method = "firstmax")
#plotting the gap statistic
fviz_gap_stat(gap_stat)

#extract the results 
set.seed(200)
final <- kmeans(df2, 4, nstart = 25)
print(final)

#visualize the final result
fviz_cluster(final, data = df2)


#for comparison I have here Silhouette and Elbow methods to find clusters
#using average Silhouette method 
# function to compute average silhouette for k clusters
avg_sil <- function(k) {
  km.res <- kmeans(df, centers = k, nstart = 25)
  ss <- silhouette(km.res$cluster, dist(df))
  mean(ss[, 3])
}

# Compute and plot wss for k = 2 to k = 15
k.values <- 2:15

# extract avg silhouette for 2-15 clusters
avg_sil_values <- map_dbl(k.values, avg_sil)

plot(k.values, avg_sil_values,
     type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of clusters K",
     ylab = "Average Silhouettes")

#plot the result of Silhouette analysis
fviz_nbclust(df, kmeans, method = "silhouette")



#Elbow method for cluster analysis 
set.seed(123)

# function to compute total within-cluster sum of square 
wss <- function(k) {
  kmeans(df, k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = 1 to k = 15
k.values <- 1:15

# extract wss for 2-15 clusters
wss_values <- map_dbl(k.values, wss)

plot(k.values, wss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

#using the fviz_nbcluster function for wrapped up version 
set.seed(123)

fviz_nbclust(df, kmeans, method = "wss")




