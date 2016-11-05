# public.nazk.gov.ua
Working with public.nazk.gov.ua data  

## Repo structure

iMacros-scripts - browser automation scripts in [iMacros](http://imacros.net/) for crawling declaration list from [public.nazk.gov.ua website](https://public.nazk.gov.ua/search)  

R-scripts - scripts in R language for parsing crawled web content \(parse.R\), formatting and storing data in html, csv, url-list formats \(format.R\)  

data - formatted data in html, csv, url-list formats  

## NAZK declarations list aggregation using crawl/scrape/parse method

### Requirements
1. Firefox \(or another browser with iMacros support\)  
2. iMacros browser plugin. Firefox extension](https://addons.mozilla.org/uk/firefox/addon/imacros-for-firefox/)  
3. [R language environment](https://www.r-project.org/)  

### Steps to reproduce

#### Crawl/scrape stage
1. In iMacros browser extension settings, in Paths tab, set working dirs - Folder Macros to iMacros-scripts path, Folder Downloads - to root dir of repo  
2. In browser, open URL https://public.nazk.gov.ua/search  
3. At the bottom of web page, in paging control, click "\>" \(go to the last page\), remember total page count \(ex 3500\), and go back to the first page \(click "\<"\)  
4. Open iMacros browser extension and select script iMacros-scripts\SavePageNext.iim  
5. In iMacros Play tab set Repeat Macro Max: value, much larger than total page count \(ex 4000\) and click "Play \(Loop\)"  
6. Enjoy your coffee|tea until iMacros gets to the last page \(it may take a while, ex 3500 pages are saved in 2-3 hours\)  

#### Parse stage
7. Go to iMacros working dir and rename all crawled \*.csv into \*.txt  
8. In repo root and copy them to new empty dir "scraped-data"  
8. Open R environment  
9. Set R session working dir to repo root dir  
10. Run R script R-scripts\parse.R  
11. After script execution you'll have all declaration list in allpersons.csv file of repo root dir  
