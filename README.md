run.analysis.R process:

1. Lines 1 and 2 sets the directories where the needed files are located.
2. Lines 4 and 5 loads the R packages dplyr and tidyr.
3. Lines 7 to 14 reads and combines the tests and training datasets of the UCI HAR dataset.
4. Lines 16 to 17 creates a new column with labels train or test.
5. Line 19 to 21 merges the train and test files.
6. Lines 23 to 25 assigns column names to each merged dataset from the previous lines.
7. Lines 27 to 29 binds all of the files into a single dataset.
8. Lines 31 and 32 makes column names unique from each other.
9. Lines 34 to 38 gathers the mean or standard deviation from the dataset.
10. Lines 40 to 44 creates a new dataset that contains the averages of each variable, activity, and subject in the dataset.
11. Line 46 exports a text file named tidy_data containing the dataset calculated in the previous lines.
