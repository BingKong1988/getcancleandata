# Getting and Cleaning Data

### **Course Project**

## Introduction
This repository contains the work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. 

## The Data Source
The features (561 of them) are unlabeled and can be found in the x_test.txt. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file.

## About the Script and Result Dataset

I created a script called run_analysis.R which will merge the test and training sets together. Prerequisites for this script:

1. the UCI HAR Dataset must be extracted and..
2. the UCI HAR Dataset must be availble in the directory called "UCI HAR Dataset" the same as working dirctory
3. the "dplyr" package must be pre-installed

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.
Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.