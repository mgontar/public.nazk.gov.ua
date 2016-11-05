#Find missing id's
files <- list.files(paste(path.expand('~'), "..", "Downloads", "declarations", "json", sep = "/"))

downloaded_ids <- gsub(".json", "", files)

allpersons <- read.csv("allpersons.csv")

all_ids <- allpersons$id

todopersons <- allpersons[which(!allpersons$id %in% downloaded_ids),]

todopersons$urlhtmlp <- paste("https://public.nazk.gov.ua/declaration/", todopersons$id, sep="")
todopersons$urlpdfp <- paste("https://public.nazk.gov.ua/storage/documents/pdf/", todopersons$pdf, sep="")
todopersons$urljsonp <- paste("https://public-api.nazk.gov.ua/v1/declaration/", todopersons$id, sep="")

write.table(todopersons$urlhtmlp, file = "todo_html_url_list.txt", col.names = F, row.names = F, quote = F)
write.table(todopersons$urlpdfp, file = "todo_pdf_url_list.txt", col.names = F, row.names = F, quote = F)
write.table(todopersons$urljsonp, file = "todo_json_url_list.txt", col.names = F, row.names = F, quote = F)