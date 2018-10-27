# Code Book 
For the run_analysis output file see har.txt

## Variable "activity"
Variable "activity" is one of two categorical variables in the dataset, and is what the time and frequency variables are measured against. This variable will be one of the following 6 activity types:
- LAYING
- SITTING
- STANDING
- WALKING
- WALKING_DOWNSTAIRS
- WALKING_UPSTAIRS

This variable is the first column of the dataset.

## Variable "subject_id"
Variable "subject_id" is the second categorical variable and indicates which study subject performed the aforementioned activity. This variable will be a number between 1 and 30 inclusive, and represents the subjects in the study.

## Variables fBody... or tBody... or tGravity...
Variables cols[3:68] are a combination of time and frequency measurements, 66 in total, for each activity performed by each subject. These 66 variables represent a subset of those collected for the study, filtered to just measurements of type mean or standard deviation. The "t" stands for time and the "f" stands for frequency.