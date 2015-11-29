library(httr)
library(XML)
getPlz <- function(){
    #old <- getwd()
    #setwd("./plz")
    
    if (!file.exists("plz.csv")) {
        url <- "http://www.fa-technik.adfc.de/code/opengeodb/plz.tab"
        download.file(url, "plz.csv")
    }
    plz <- read.csv("plz.csv", sep="\\t")
    
    #agListe <- sapply(plz$plz[1:5], scrapePlz)
    
    #agListe
    
    #setwd(old)
}

scrapePlz <- function(plz) {
    url <- paste0("http://www.justiz.de/OrtsGerichtsverzeichnis/index.php?plz=", plz, "&ort=&suchen=+Absenden+&gerausw=ALL&plz1=&ort1=&landausw=ALL&MD=", sep="")
    s <- GET(url)
    p <- htmlTreeParse(s, useInternalNodes = T)
    xpathSApply(m, "//td[@headers='adbgericht']", xmlValue)
}
