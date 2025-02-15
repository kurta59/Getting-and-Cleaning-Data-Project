---
title: "CodeBook"
author: "Kurt C Anderson"
date: "September 7, 2017"
output: html_document
---

# Getting and Cleaning Data Course Project

## Assignment Introduction

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Project Requirements

You should create one R script called run_analysis.R that does the following.

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## About run_analysis.R script
File with R code "run_analysis.R" performs the following 5 Parts per the above Requirements:   
1. Merging the training and the test sets to create one data set.   
   1. Reading files    
      * Read training data into tables   
      * Read test data into tables   
      * Read feature as vector   
      * Read activity labels   
   1. Assigning column names   
   1. Merging all data in one set   
1. Extract only the measurements on the mean and standard deviation for each measurement   
   1. Read column names  
   1. Create vector for defining ID, mean and standard deviation   
   1. Making nessesary subset from All   
1. Use descriptive activity names to name the activities in the data set   
1. Label the data set with descriptive variable names   
1. Creating a second, independent tidy data set with the average of each variable for each activity and each subject   
   1. Making second tidy data set   
   1. Writing second tidy data set in txt file   

## Variables 
Vars: to read data into tables and to merge tables into one data set 
`x_train` `y_train` `subject_train` `x_test` `y_test` `subject_test` `mrg_train` `mrg_test` `setAll`

Vars to set column names, extract mean and std dev, create subset
`colNames` `mean_and_std` `subsetMeanAndStd`

Vars to table with subsetMeanAndStd with activity labels 
`subsetActivityNames`

Vars table wih final tidy data set, ready for output
`secTidySet`
