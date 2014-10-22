GettingAndCleaningData
=======================

GettingAndCleaningData

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

How to use run_analysis.R R script
1. download and extract getdata-projectfiles-UCI HAR Dataset.zip to your R working directory
2. download run_analysis.R
3. execute run_analysis.R
when run_analysis.R script is ready then you will find tidy_data.txt from same directory where your data it is

About run_analysis.R
Reads extract data from your R working directory modify it and create tidy_data.txt by following steps

1.load needed library
2.Reading features and cleaning it
3.Reading activity labels and namig varables more descriptive
4.Reading data labels from test and train sets and merge those
5.Removing unnescesary data in order to keep memory usage low
6.Reading test and train datasets and merge those)
7.Removing unnescesary data in order to keep memory usage low
8.Change merged datasets dataformat in order to get most efective next steps
9.Merge labels and data
10.Merge activity labels and data
11.Removing unnescesary data in order to keep memory usage low
12.Set features on the dataset lables
13.Taking subset for all variables which include mean or std
14.Creating tidy data 
15.Writing tidy data on to file

More detailled you will find from commented run_analysis.R source code
