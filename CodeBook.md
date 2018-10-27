# Code Book 
For the run_analysis output file see har.txt

## Variable "activity"
This variable will be one of the following 6 activity types:
- LAYING
- SITTING
- STANDING
- WALKING
- WALKING_DOWNSTAIRS
- WALKING_UPSTAIRS

This variable is the first column of the dataset.

## Variable "subject_id"
This variable will be a number between 1 and 30 inclusive, and represents the subjects in the study.

## Variables fBody... or tBody... or tGravity...
These 66 time and frequency variables represent a subset of those collected for the study, filtered to just measurements of type mean or standard deviation. The "t" stands for time and the "f" stands for frequency.