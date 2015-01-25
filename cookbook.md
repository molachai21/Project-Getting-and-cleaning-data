Introduction
==========================================
1.	The first step is loading the data into variables. Tthe data is merged using the rbind() function.
2.	Next, the measurements of mean and standard deviation are extracted using the grep() function. And subletting with the existing variable datasets. The column names are renamed to make it easier to read the data.
3.	Next, the column names are matched to the variables
4.	Then add in appropriate column names and then combine the datasets together into 1 variable all_data. 
5.	Lastly, take the averages of the new dataset and produce and output file of the new transformed data. 


Variables
==========================================
subject_train -	subject_train.txt dataset
y_test	- y_test.txt dataset
x_test	- x_test.txt dataset
subject_test - subject_test.txt dataset
x_data - merged x_train and x_test datasets together
y_data	- merged y_train and y_test datasets together
subject_data - merged subject_train and subject_test datasets together
mean_stddev_features - found all instances of mean and stardard deviates in the features dataset
activities	- activities.txt file dataset
features - features.txt file dataset
all_data - merged all x_data, y_data and subject_data together
averages_all_data - found the averages of the all_data dataset
