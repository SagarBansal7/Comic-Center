# Comic-Center
## Graduate Course: Intermediate Statistical Modeling for Business
This was an individual project from a course on Cluster Analysis (an unsupervised machine learning technique for statistical modeling). Below is the prompt from the client:

>My name is Stuart Bloom and I run a hobby shop in Pasadena California called Comic Center; we generally sell comics, but we also sell other hobby items as well as some video games. Recently a chain hobby shop opened up in town, so I have been looking for ways to improve my business. My friend and regular customer Leonard suggested I try to collect data on my customers to better understand their spending habits. So, I added a survey to my receipts to learn more about my customers. 
>
>The survey asked customers:
1. “How many minutes did you spend in the store (approximately)?" (timeInStore),
2. “How old are you in years?" (age), and
3. “How Many times have you come to Comic Center in the last month?"(numVisits)
>
>From the receipt, I also recorded:
1. How much they spent in dollars in total (purchaseAmount)
2. How many Items they bought (numItems)
3. How much they spent on comic books in dollars (comicBookAmount)
?
>I am really interested in getting a better understanding of who my customers are; I know that many of my regulars are stereotypical "nerds" who are really into comic books, but I want to know more about the other customers I have. Currently my store primarily focuses on comic books, so it would be helpful to know how much different kinds of customers spend on comic books. The survey responses I have gotten so far are included in the data set I've attached; are you able to help me make sense of this data?

### Analysis Summary

#### 1) Understanding the Customer Behaviour:

After doing initial exploration, I found that the average total amount spent by a customer is roughly 25.94 dollars which is almost eight times the average amount of roughly 3.37 dollars spent by a customer on comic books (see Table 1 and 3 in Appendix). The mean amount of time spent in-store and mean number of items purchased by a customer were found to be 24.53 minutes and 3 items, approximately (see Table 2 and 5 in Appendix). From Table 4 and 6 in Appendix, it was found that most of the customers were 18 years old and only made a single visit over the last month. In addition, I can observe the distributions of all the recorded variables in Figure 1 to 6 in the Appendix.

Based on the statistical analysis in Appendix, I labelled different groups of customers. The first cluster represents older customers who are primarily interested in saving their time and buying only what they need. Hence, they visit the store occasionally, spend least amount of time in store and buy least number of items. The second cluster represents younger customers who are primarily interested in browsing the products, buying latest and cheap items. Hence, they spend most amount of time in store, visit the store very often and buy maximum number of items in least amount of total purchase. The third cluster represents younger customers who are primarily interested in buying from their list to save some time but also open to browse a thing or two. Hence, they spend decent amount of time in store, buy decent number of items, make decent number of visits and spend decent total purchase amount. 

After labeling different customer groups, I went forward with discovering their interest in spending on comic books using comicBookAmount variable (see Table 7 and 9 in Appendix). I saw that customers in cluster 1 are generally not interested in comic books at all as they spent zero dollars on buying comic books (“non-readers” in terms of comic books). This made sense as usually older people are more inclined towards reading novels and other serious literature. Also, finding the right comic may take some time and these customers are focusing on saving their time in store. In contrast, customers in cluster 2 seem to be really interested in comic books as they spent maximum average amount on comic books among all other cluster (“nerds” in terms of comic books). This is reasonable as usually younger people are more inclined towards comic books as a source of entertainment. Also, usually comic book companies release new comic books very frequently. This could be a reason that customer in this cluster made high number of visits to get the latest comic books and spent high amount of time in store to browse from all the options.

The last cluster had customers who were somewhat interested in comic books as they spent some amount on comic books (“hobby readers” in terms of comic books). This also made sense as some of the younger people are only interested in reading comic books in part of their pass time and spend rest of their pass time in other fun activities. Hence, they spend more amount of time in store and made a greater number of visits compared to customers in cluster 1 (least interested). I also performed a statistical test to confirm that these customer groups are reasonable (details can be found in the Appendix).
 
As per these spending habits, the client should specifically target customers represented by cluster 2 and 3 to increase his comic books sales. He should work on maintaining customers in cluster 2. He can further try to understand and advertise those types of comic books that customers in cluster 3 may find interesting and are inclined to buy, which will increase the amount they spend on comic books. He can also investigate whether customers in cluster 3 are more inclined to come on particular days of a week or month since they make somewhat low number of visits and then initiate discounts/offers on comic books on those days. For customers in cluster 1, he can give them free comic books on their visit to see if their spending habits towards comic books change after a few weeks.

#### 2) Limitations of the Analysis:

The client should be aware of some reservations before making any decision based on the analysis. First, these customer groups and their spending habits are specific to the data he provided. There may a possibility of other customer groups who did not visit the store last month when he collected the data. Second, it is not clear whether the dataset has all the customers who visited the store last month or only a subset of them. If it only represents a subset of them, the client should consider collecting more data for future analysis. Third, some of the variables in the dataset such as Time spent in store and Number of visits are subjective and their values can be inaccurate for few or many customers as they were dependent on the wisdom of customers. Customers might not have known the exact time spent in store or the exact number of visits they made in the last month while filling out the survey.

### Statistical Analysis

I used Agglomerative Hierarchical clustering technique with Average linkage Criterion to identify relationships between different customers and understand their purchase behavior. Based on the domain knowledge, I decided to perform cluster analysis using all the variables except comiBookAmount i.e., timeInStore, purchaseAmount, Age, numItems and numVisits variables. I kept comicBookAmount variable to validate the final clusters later on. After running the cluster analysis using SAS 9.4 version, I observed the resulting dendrogram to examine jumps (see Figure 7). I noticed two clear jumps from 3 to 2 clusters and 2 to 1 cluster and identified two candidate cluster configurations that were the beginning of those jumps. The candidate configurations had three clusters in one and two clusters in the other configuration. 

As shown in Table 7 and 8, I ran the MEANS procedure that gave the mean, standard deviation, minimum and maximum value of all variables in each cluster for both cluster configurations. I then tried to comprehend different clusters in each of the cluster configurations and found that configuration with three clusters made more sense practically. The cluster configuration with two clusters had wide range of values for each variable in the second cluster. Moreover, the lowest and highest values for each of numVisits and numItems variables in second cluster was exactly the same as the smallest and largest values for each of numVisits and numItems variables in the whole dataset. Hence, I was not satisfied enough to use this configuration as the final configuration.

In the configuration with three clusters, the first cluster has customers with minimum average amount of time spent in store, average number of items purchased and average number of visits but maximum average total purchase amount and average age, among all three clusters. The second cluster has customers with lowest mean total purchase amount but highest mean amount of time spent in store, mean number of items purchased and mean number of visits, among all clusters. The mean age of customers in this cluster is around 17 years that is almost like the mean age of customers in the third cluster. The third cluster has average amount of time spent in store, average total purchase amount, and average number of items purchased around 20.78 minutes, 24.68 dollars and 3 items, respectively. These values lie somewhat in between the corresponding average values of cluster 1 and cluster 2. The average number of visits for cluster 3 is around 1 that is similar to the average number of visits in cluster 1. Hence, I used this configuration as the final configuration for further validation.  

To validate the final clusters statistically, I used comicBookAmount variable because client wanted to know spending behavior of each group on comic books. As seen in Table 9, I performed ANOVA test to confirm that the means of comicBookAmount are statistically different for the three different clusters at 5% significance level. The p-value (0.0010) came out to be less than 0.05. Hence, I reject the null hypothesis i.e., the test confirms that the mean values of comicBookAmount are statistically different for the three clusters at 5% significance level and the clusters are reasonable.

### Appendix

#### Figure 1:  Histogram – Comic Book Amount ($)
![Figure 1](https://user-images.githubusercontent.com/37155988/93725963-5bef8c00-fb81-11ea-9a5e-70d6ea18e719.png)

#### Figure 2:  Histogram – Time Spent in Store (min)
![Figure 2](https://user-images.githubusercontent.com/37155988/93725964-5c882280-fb81-11ea-8f00-58d9b7fbb497.png)

#### Figure 3:  Histogram – Total Purchase (dollars)
![Figure 3](https://user-images.githubusercontent.com/37155988/93725965-5c882280-fb81-11ea-9bb2-8d0a4f8115af.png)

#### Figure 4:  Histogram – Age (years)
![Figure 4](https://user-images.githubusercontent.com/37155988/93725966-5c882280-fb81-11ea-84e9-aea4ac2a3bbe.png)

#### Figure 5:  Histogram – Number of Items
![Figure 5](https://user-images.githubusercontent.com/37155988/93725967-5c882280-fb81-11ea-8826-689016b435ab.png)

#### Figure 6:  Histogram – Number of Visits
![Figure 6](https://user-images.githubusercontent.com/37155988/93725968-5c882280-fb81-11ea-8b4d-025d6de9684e.png)

#### Figure 7: Dendrogram – Cluster Analysis
![Figure 7](https://user-images.githubusercontent.com/37155988/93725969-5d20b900-fb81-11ea-84d8-b2375a901fec.png)

#### Table 1: Numerical Summary of Comic Book Amount ($)
![Table 1](https://user-images.githubusercontent.com/37155988/93725970-5d20b900-fb81-11ea-9403-1f39397aef3a.png)

#### Table 2: Numerical Summary of Time Spent in Store (min)
![Table 2](https://user-images.githubusercontent.com/37155988/93725971-5d20b900-fb81-11ea-914e-0a4eabfe7b01.png)

#### Table 3: Numerical Summary of Total Purchase (dollars)
![Table 3](https://user-images.githubusercontent.com/37155988/93725972-5d20b900-fb81-11ea-8665-16faa241c502.png)

#### Table 4: Numerical Summary of Age (years)
![Table 4](https://user-images.githubusercontent.com/37155988/93725973-5d20b900-fb81-11ea-83c3-a3f78d8853f2.png)

#### Table 5: Numerical Summary of Number of Items
![Table 5](https://user-images.githubusercontent.com/37155988/93725974-5d20b900-fb81-11ea-95a7-c946f9b63a0b.png)

#### Table 6: Numerical Summary of Number of Visits
![Table 6](https://user-images.githubusercontent.com/37155988/93725975-5db94f80-fb81-11ea-97eb-8305fb4c5497.png)

#### Table 7: The MEANS Procedure for Configuration with Three Clusters
![Table 7](https://user-images.githubusercontent.com/37155988/93725976-5db94f80-fb81-11ea-8de4-c1b01ff6f784.png)

#### Table 8: The MEANS Procedure for Configuration with Two Clusters
![Table 8](https://user-images.githubusercontent.com/37155988/93725977-5db94f80-fb81-11ea-8c7b-bf448113510a.png)

#### Table 9: The ANOVA Procedure using Comic Book Amount
![Table 9](https://user-images.githubusercontent.com/37155988/93725978-5db94f80-fb81-11ea-9e5b-7f41be55847f.png)
