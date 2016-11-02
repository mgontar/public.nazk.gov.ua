Sys.setlocale('LC_ALL', 'Ukrainian')
allpersons <- read.csv("allpersons.csv")

allpersons$urlhtmlp <- paste("https://public.nazk.gov.ua/declaration/", allpersons$id, sep="")
allpersons$urlpdfp <- paste("https://public.nazk.gov.ua/storage/documents/pdf/", allpersons$pdf, sep="")
allpersons$urljsonp <- paste("https://public-api.nazk.gov.ua/v1/declaration/", allpersons$id, sep="")
trformat <- "<tr><td class='tdname'>%s</td><td class='tdpos'>%s</td><td class='tdurlhtml'><a href='%s'>html</a></td><td class='tdurlpdf'><a href='%s'>pdf</a></td><td class='tdurljson'><a href='%s'>json</a></td></tr>"
allpersons$html <- sprintf(trformat, allpersons$name, allpersons$pos, allpersons$urlhtmlp, allpersons$urlpdfp, allpersons$urljsonp)

write.table(allpersons$urlhtmlp, file = "html_url_list.txt", col.names = F, row.names = F, quote = F)
write.table(allpersons$urlpdfp, file = "pdf_url_list.txt", col.names = F, row.names = F, quote = F)
write.table(allpersons$urljsonp, file = "json_url_list.txt", col.names = F, row.names = F, quote = F)

htmltable <- allpersons$html

htmltablefull <- c("<html><head><link rel='stylesheet' type='text/css' href='style.css'></head><body><h1 style='text-align:center'>Список декларацій станом на 31.10.16 12:00 (119717)</h1><table><tr><th>Ім'я</th><th>Посада</th><th colspan='3'>Декларація</th></tr>", htmltable, "</table></body></html>")

write.table(htmltablefull, file = "alltable.html", col.names = F, row.names = F, quote = F)