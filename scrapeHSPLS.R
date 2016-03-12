library(rvest)
serials <- read_html("http://librarieshawaii.org/serials/tabs/all.html")

url <- serials %>% 
  html_nodes(".itemAll .chicklet a") %>%
  html_attr("href")

name <- serials %>% 
  html_nodes(".itemAll .desc p") %>%
  html_text() %>%
  trimws()

des <- serials %>% 
  html_nodes(".itemAll .desc .tips") %>%
  html_attr("title") %>%
  trimws()

df = data.frame(name, url, des)
write.table(df, file='db.csv', sep=",")
