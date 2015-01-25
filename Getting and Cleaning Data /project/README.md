Getting and Cleaning Data Project
=================================
# Goal / 目的
本课程的目的是证明您收集、运用以及整理数据集的能力。目标是准备可以用于后续分析的整洁数据。您的同学会以一系列有关项目的判断题来为您评分。您需要提交：1)如下所述的整洁的数据集；2)带有您执行分析脚本的Github知识库链接；3)说明变量、数据的编码本和您为清理名为CodeBook.md的数据所执行的所有转换或工作。在您的脚本回购中，还应包含一个README.md。此回购解释所有脚本的工作方式以及连接方式。

# Requirement / 具体要求
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Steps / 实现步骤
1. Read all the files that are needed in the following steps
2. Column bing y_test and subject_test to the varible 'A' and add column names 'Activity' and 'Subject'
3. Column bing y_train and subject_train to the varible 'B' and add column names 'Activity' and 'Subject'
4. merge 'A' and 'B' to 'C'
5. Merge X_train and X_test data to 'D'
6. Eliminate columns from 'D' which do not have "mean()" or "std()" in the column names to 'E'
7. Column bind 'C' and 'E' to 'F'
8. Take mean of observations per activity per subject to 'result'
9. Replace activity numbers with Activity names from activity_lables data
10. Appropriately labels the data set with descriptive variable names
11. Use write.table to get a tidy data set from 'result'
