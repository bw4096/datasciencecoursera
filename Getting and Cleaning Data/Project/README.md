# Getting and Cleaning Data

## Introduction
The objective of this project is to demonstrate collecting, working with and 
cleaning a wearable computing dataset. 

## Files
* run_analysis.R - The primary script to tidy the dataset. This can be run using the
source("run_analysis.R") command in RStudio.

   The script performs the following actions:
  * Loads relevant packages
  * Downloads source data and extracts files to a data folder in the working directory (if data files have not been manually saved and extracted)
  * Performs required merging and transformations to tidy the dataset
  
* CodeBook.md - Contains a detailed description of the variables, the data, and transformations/work performed on the data by the run_analysis.R script

* newMeanStd.txt - Final tidy dataset produced by the run_analysis.R script

## Prerequisites
The script requires the following packages to be installed:
* plyr
* dplyr

An optional prerequisite is that the working directory should contain the folder
"UCI HAR Dataset" containing the downloaded and unzipped data. The script will 
download and extract the data to a "UCI HAR Dataset" folder in the  
working directory if this is not the case.

To download the data manually:

1. Download the following file:
  * https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the file directly to the working directory. A folder called "UCI HAR Dataset" should now exist in your working directory.