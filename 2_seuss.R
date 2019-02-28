#===============================================================================
# PROGRAMMING WORKSHOP - DAY 2: R
#===============================================================================
# LOADING DATA FROM FILES
# ** reading lines of text
# ** Reading words into a vector
# ** Saving a text vector in a file
# ** Counting elements in a vector
# ** Plotting a word cloud
# ** Exercise
#===============================================================================

#-------------------------------------------------------------------------------
# Set working directory
#-------------------------------------------------------------------------------
setwd("~/Dropbox/SGUL_Teaching/SGUL_Workshops/2017_Programming_Workshop")

#-------------------------------------------------------------------------------
# Reading data from files: reading lines of text
# ( not used much really)
#-------------------------------------------------------------------------------
# You can select a file programmatically [e.g. by copying from the console after
# list.files() ]
my.file <- "green_eggs_and_ham.txt"
# Or you can choose a file interactively with file.choose() :
my.file <- file.choose(new=FALSE)
txt <-readLines(con=my.file, n=10)
txt
cat(txt, sep="\n")

#-------------------------------------------------------------------------------
# Reading words into a vector:
#-------------------------------------------------------------------------------
txt <- scan(file="green_eggs_and_ham.txt", what=character())
txt
class(txt)
length(txt) # 778
unique(txt)
sort(txt)

# Functions can be called inside other functions - "nesting":
length(unique(txt)) # 73

# Unix/Linux-like pipes have become more popular -
# the '%>%' command sends the result of one command on to the next
if (!require(magrittr)) install.packages("magrittr"); library(magrittr)
txt %>% unique
txt %>% unique %>% sort
txt %>% toupper %>% unique %>% sort
txt %>% toupper %>% unique %>% length # 53
txt.up <- txt %>% toupper
print(txt.up)
txt.lo <- txt %>% tolower
print(txt.lo)

#-------------------------------------------------------------------------------
# Saving a text vector in a file:
#-------------------------------------------------------------------------------
cat(txt, sep="\n", file="newfile.txt")

#-------------------------------------------------------------------------------
# Counting elements in a vector:
#-------------------------------------------------------------------------------
# The 'table' function counts how often each element occurs in a vector (a list):
# 'as.data.frame' generates an R data.frame, which looks like a table in Excel:
df <- txt %>% toupper %>% table %>% as.data.frame %>% magrittr::set_colnames(c("word", "count")) %>% dplyr::arrange(-count)
df
# nicer way to look at data frames:
View(df)
barplot(table(txt.lo), horiz=TRUE, las=1)

#-------------------------------------------------------------------------------
# Plotting a word cloud:
#-------------------------------------------------------------------------------
if (!require(devtools)) install.packages("devtools")
if (!require(wordcloud2)) install_github("lchiffon/wordcloud2")
wordcloud2(data = df)
wordcloud2(df, minRotation = -pi/6, maxRotation = -pi/6, minSize = 10, rotateRatio = 1)

#-------------------------------------------------------------------------------
# Save wordcloud as PDF (not part of workshop) (added 2017-11-02):
#-------------------------------------------------------------------------------
# save it in html
library("htmlwidgets")
my_cloud <- wordcloud2(data = df)
my_cloud
htmlwidgets::saveWidget(my_cloud,"tmp.html",selfcontained = F)

# and in pdf
# install.packages("webshot")
library(webshot)
# webshot::install_phantomjs()
webshot::webshot("tmp.html","green_eggs.pdf", delay =5, vwidth = 480, vheight=480)

#-------------------------------------------------------------------------------
# ********************************  EXERCISE!!  ********************************
#-------------------------------------------------------------------------------
# Create a text file with 'file.edit' and analyze your own poem or other text:
file.edit("my_poem.txt")
