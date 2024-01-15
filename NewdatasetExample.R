library(data.table)
#create a data set 
df3 <- data.table(properties = c(1,2,3,4,5,6,7,8),
                 latitude = c(-24.779225, -24.789635, -24.763461, -24.794394, -24.747102,-24.781307,-24.761081,-24.761084),
                 longitude = c(-49.934816, -49.922324, -49.911616, -49.906262, -49.890796,-49.8875254,-49.8875254,-49.922244),
                 waste = c(526, 350, 526, 469, 285, 433, 456,825))

#scale/standardize the data
df3 <- scale(df3)

# perform clustering
set.seed(200)
hcluster = clusGap(df3, FUN = kmeans, nstart = 25, K.max = 7, B = 500)

#printing the result
print(hcluster, method = "firstmax")
#plotting the gap statistic
fviz_gap_stat(hcluster)
