<h1>Coursera - Getting and Cleaning Data</h1>  


**Title**| CodeBook
----------|----------
**Author**| Sandesh G
**Date**  | July 6, 2017


**Description:**
> This document contains details about the process used to obtain `AverageDataset.txt`
> starting from the .zip file provided.


**Input data :**
> Dataset for this project is procured from UCI Archive : 
   [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
> </br>Link to Dataset : [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

</br>
As mentioned http link was provided for Input which returned .zip file to download.
</br>The file was downloaded and unzipped in the Working Directory.</br>

**Procedure:**
</br> 
**Objective 1:** *Merges the training and the test sets to create one data set.*</br>
>     Before Training and Testing could be merged it was found that training and testing
>     data itself were broken in parts and must be joined properly before anything.
1. Both Training and Testing Data were split into X(Features), Y(Labels), SubjectID
2. All the data are joined to form 2 datasets at the end of it.
3. The two datasets are Training and Testing dataset with X,Y and Subject appended.
4. This data is now ready to be joined one above the other to get one dataset that</br> 
   contains both training and testing datasets.
</br>
</br>

**Objective 2:** *Extracts only the measurements on the mean and standard deviation for each measurement.*</br>


