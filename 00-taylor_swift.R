library(rvest)
library(xml2)
library(tidyverse)
library(geniusr)

search_song("cardigan")
cardigan <- get_lyrics_id("5793984")

search_song("the 1")
the1 <- get_lyrics_id("5794073")

search_song("the last great american dynasty")
american_dynasty <- get_lyrics_id("5793985")

search_song("exile")
exile <- get_lyrics_id("5793983")

search_song("my tears ricochet")
ricochet <- get_lyrics_id("5793982")

search_song("mirrorball")
mirrorball <- get_lyrics_id("5793981")

search_song("seven")
seven <- get_lyrics_id("5793979")

search_song("august")
august <- get_lyrics_id("5793977")

search_song("this is me trying")
me_trying <- get_lyrics_id("5793975")

search_song("illicit affairs")
illicit_affairs <- get_lyrics_id("5793974")

search_song("invisible string")
invisible_string <- get_lyrics_id("5793972")

search_song("mad woman")
mad_woman <- get_lyrics_id("5793964")

search_song("epiphany")
epiphany <- get_lyrics_id("5793963")

search_song("betty")
betty <- get_lyrics_id("5793962")

search_song("peace")
peace <- get_lyrics_id("5793961")

search_song("hoax")
hoax <- get_lyrics_id("5793957")

folklore <- rbind(cardigan, the1, american_dynasty, exile, ricochet, mirrorball, seven, august,
                  me_trying, illicit_affairs, invisible_string, mad_woman, epiphany, betty, peace, hoax)

write_rds(folklore, "folklore.rds")

