library(readr)
library(stringr)
Sys.setlocale('LC_ALL', 'Ukrainian')

regex <- "<article.*?pdf/(.*?)\".*?declaration/(.*?)\"> (.*?)<.*?<span>(.*?)<.*?</article>"
files <-  list.files("data")
allpersons <- data.frame(pdf=character(),
                         id=character(), 
                         name=character(), 
                         pos=character(),
                      stringsAsFactors=FALSE) 


for(file in files){
  mystring <- read_file(paste("data", file, sep = "//"))
  Encoding(mystring) <- "UTF-8"
  persons <-  str_match_all(mystring, regex)[[1]]
  persons <- persons[,-1]
  
  persons <- as.data.frame(persons)
  colnames(persons) <- c("pdf", "id", "name", "pos")
  for(colname in colnames(persons))
  {
    if(is.character(persons[[colname]]))
      Encoding(persons[[colname]]) <- "UTF-8"
  }
  allpersons <- rbind(allpersons, persons)
}

allpersons <- unique(allpersons)

write.csv(allpersons, file = "allpersons_03.11.16.csv")

allpersons_old <- read.csv("allpersons_31.10.16.csv")
allpersons_old <- allpersons_old[,-1]

allpersons_new <- rbind(allpersons, allpersons_old)
allpersons_new <- unique(allpersons_new)
write.csv(allpersons_new, file = "allpersons.csv")