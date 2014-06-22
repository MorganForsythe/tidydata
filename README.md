tidydata
========

Getting and cleaning data cousera project

Getting and cleaning data cousera project



Steps taken in my Run_analysis.R file:

First, I read the X_test, Y_test, subject_test, X_train,Y_train,subject_train into R. I merged the training and test data to create one data set for test and one for train using cbind. 
I then merged the two resulting tables together using the rbind function.


Next I read in the features text file and renamed the columns  in the combined dataset with these names. I did this using the colnames function.


Next I extracted only the standard deviation and mean measurements and assigned them into a separate table called alldata3. 
I assumed this only included data with std() or mean() in the column name and so I excluded meanfreq() from this list. 


I kept the column names named as they are because they are descriptive enough and more information can be found in the codebook for what each means.


I used the aggregate function to create an independent tidy data set called meansalldata3 with the average of each variable for each activity and each subject. 


Lastly, I created a codebook for these variables which is also attached in this Repo.