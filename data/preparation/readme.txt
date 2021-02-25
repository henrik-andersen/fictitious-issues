# Documentation for preparing dataset for Fictitious Issues paper 
# Henrik Andersen
# 14.09.2020

The original data is rdata_Deutschland2019_2019-09-10_10-31.csv. This is the dataset downloaded from the SoSci server on 10 September 2019. 

The file import_Deutschland2019_2019-09-10_10-31.R takes that .csv file and turns it into a slightly cleaned up file sdData_v01.csv. 

The file sdData_v01.csv is not very useful. Much recoding and data preparation needed to be done in order to work with it. The file data-prep-speed-accuracy.R 
takes the .csv and performs a great deal of transformations, recodes, merges etc. Mainly, it produces two 'main' files which are saved under the parent 
folder /data. 

Those two files are: dfl.Rda and dfw.Rda. Both are R dataframe objects. dfl.Rda is the long-format data after the transformations etc. were done in the 
preparation file. dfw.Rda is the wide-format data. Most of the work (ggplots, multilevel regression models) take the long-format data, so it is the 
most important. 

There are several other files in the ./preparation folder. These hold something like 'raw' compartmentalized versions of some (actually hopefully all, but 
things could change at a later date) of the operations needed for the .Rmd article file. The goal of these files (also some in the /analysis folder) is to 
potentially be able to take the R code out of the .Rmd file and just use source() to run them externally. That cleans things up and makes it so there is no
overlap with different files doing the same thing that also takes place inside the .Rmd file. 

- response-latency-treatment.R: Takes the raw response latencies for the FI items and cleans them up. E.g., eliminates obvious data errors (response 
				latencies < 0 seconds), makes a new column without massive outliers and another for the log transformed response latencies. 
				It also produces the cluster means for each of the response latency columns.
- recodes-for-models.R:		Transforms some of the predictors (mean centering, reversing the scale, etc.)
