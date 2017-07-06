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

1. Extracting all the columns from the dataset out of Objective 1 which contains `mean` and `std` in them
2. Column names also contained punctuations that cluttered the names and was cleaned using gsub() function
</br>
</br>

**Objective 3:** *Uses descriptive activity names to name the activities in the data set*

1. ActivityID is matched between the output from Objective 3 and the activity table(supplied in the zip file) and 
   ActivityLabel replaces the ID in the data.frame
</br>
</br>

**Objective 4:** *Appropriately labels the data set with descriptive variable names.*

1. Column names are corrected to match the value they hold
</br>
</br>

**Objective 5:** *From the data set in Objective/Step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.*

1. Average dataset for all the columns grouped by Subject and Activity
2. Dataset from Objective 4 is melted by retaining Subject and Activity
3. Average is calculated by using dplyr group_by on Subject,Activity and Measurement(Names of all the columns that were melted)
   and summarise is used to calculate mean.
   
   
**Variables:**
</br>
</br>
**Variables of Average Dataset:**</br> 
  "Subject"</br>                      "tBodyAccMeanX"          </br>      "tBodyAccMeanY"               </br>
 "tBodyAccMeanZ"        </br>        "tBodyAccStdX"            </br>     "tBodyAccStdY"                </br>
 "tBodyAccStdZ"              </br>   "tGravityAccMeanX"      </br>       "tGravityAccMeanY"            </br>
 "tGravityAccMeanZ"     </br>        "tGravityAccStdX"         </br>     "tGravityAccStdY"             </br>
"tGravityAccStdZ"           </br>   "tBodyAccJerkMeanX"       </br>     "tBodyAccJerkMeanY"           </br>
"tBodyAccJerkMeanZ"   </br>         "tBodyAccJerkStdX"        </br>     "tBodyAccJerkStdY"            </br>
 "tBodyAccJerkStdZ"         </br>    "tBodyGyroMeanX"          </br>     "tBodyGyroMeanY"              </br>
 "tBodyGyroMeanZ"           </br>    "tBodyGyroStdX"            </br>    "tBodyGyroStdY"               </br>
 "tBodyGyroStdZ"         </br>       "tBodyGyroJerkMeanX"      </br>     "tBodyGyroJerkMeanY"          </br>
 "tBodyGyroJerkMeanZ"    </br>       "tBodyGyroJerkStdX"       </br>     "tBodyGyroJerkStdY"           </br>
 "tBodyGyroJerkStdZ"      </br>      "tBodyAccMagMean"         </br>     "tBodyAccMagStd"              </br>
"tGravityAccMagMean"     </br>      "tGravityAccMagStd"        </br>    "tBodyAccJerkMagMean"         </br>
 "tBodyAccJerkMagStd"      </br>     "tBodyGyroMagMean"         </br>    "tBodyGyroMagStd"             </br>
 "tBodyGyroJerkMagMean"    </br>     "tBodyGyroJerkMagStd"       </br>   "fBodyAccMeanX"               </br>
 "fBodyAccMeanY"           </br>     "fBodyAccMeanZ"           </br>     "fBodyAccStdX"                </br>
 "fBodyAccStdY"            </br>     "fBodyAccStdZ"           </br>      "fBodyAccMeanFreqX"           </br>
 "fBodyAccMeanFreqY"      </br>      "fBodyAccMeanFreqZ"      </br>      "fBodyAccJerkMeanX"           </br>
 "fBodyAccJerkMeanY"       </br>     "fBodyAccJerkMeanZ"      </br>      "fBodyAccJerkStdX"            </br>
 "fBodyAccJerkStdY"        </br>     "fBodyAccJerkStdZ"       </br>      "fBodyAccJerkMeanFreqX"       </br>
 "fBodyAccJerkMeanFreqY"  </br>      "fBodyAccJerkMeanFreqZ"   </br>      "fBodyGyroMeanX"              </br>
 "fBodyGyroMeanY"         </br>      "fBodyGyroMeanZ"           </br>     "fBodyGyroStdX"               </br>
 "fBodyGyroStdY"          </br>      "fBodyGyroStdZ"           </br>      "fBodyGyroMeanFreqX"          </br>
 "fBodyGyroMeanFreqY"    </br>       "fBodyGyroMeanFreqZ"       </br>     "fBodyAccMagMean"             </br>
 "fBodyAccMagStd"         </br>      "fBodyAccMagMeanFreq"     </br>      "fBodyBodyAccJerkMagMean"     </br>
"fBodyBodyAccJerkMagStd"  </br>     "fBodyBodyAccJerkMagMeanFreq"</br>   "fBodyBodyGyroMagMean"        </br>
 "fBodyBodyGyroMagStd"    </br>      "fBodyBodyGyroMagMeanFreq"   </br>   "fBodyBodyGyroJerkMagMean"    </br>
 "fBodyBodyGyroJerkMagStd" </br>     "fBodyBodyGyroJerkMagMeanFreq" </br> "ActivityLabel"  </br>

