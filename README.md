
# Análisis de las letras de Taylor Swift: *folklore*

![folklore](images/taylor_swift_wide.png)

Usando las instrucciones de Ariane Aumaitre en su
[blog](https://arianeaumaitre.com/2019/09/15/tutorial-text-analysis-and-data-visualization-with-taylor-swift-songs/)
hice un pequeño análisis de las letras de las canciones del album
folklore de Taylor Swift. Lamentablemente, no pude usar el paquete
`genius`, así que descargué una por una las letras del album usando el
paquete `geniusr`. Para usar este último paquete, es necesario crear una
cuenta en [genius](https://genius.com).

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.5     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.1.4     ✔ stringr 1.4.0
    ## ✔ readr   2.0.2     ✔ forcats 0.5.1

    ## Warning: package 'tibble' was built under R version 4.1.2

    ## Warning: package 'dplyr' was built under R version 4.1.2

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(tayloRswift)
library(tidytext)
library(extrafont)
```

    ## Registering fonts with R

``` r
folklore <- read_rds("folklore.rds")
```

``` r
# Token 
folklore_tokens <- folklore %>% 
  unnest_tokens(word, line)
```

``` r
folklore_tokens
```

    ## # A tibble: 4,915 × 6
    ##    section_name section_artist song_name artist_name  song_id word        
    ##    <chr>        <chr>          <chr>     <chr>        <chr>   <chr>       
    ##  1 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 vintage     
    ##  2 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 tee         
    ##  3 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 brand       
    ##  4 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 new         
    ##  5 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 phone       
    ##  6 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 high        
    ##  7 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 heels       
    ##  8 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 on          
    ##  9 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 cobblestones
    ## 10 Verse 1      Taylor Swift   ​cardigan  Taylor Swift 5793984 when        
    ## # … with 4,905 more rows

``` r
folklore_tokens %>% 
  count(word, sort = T)
```

    ## # A tibble: 1,019 × 2
    ##    word      n
    ##    <chr> <int>
    ##  1 you     243
    ##  2 i       235
    ##  3 the     178
    ##  4 and     122
    ##  5 me       97
    ##  6 a        92
    ##  7 to       90
    ##  8 in       85
    ##  9 my       85
    ## 10 your     64
    ## # … with 1,009 more rows

``` r
tidy_folklore <- folklore_tokens %>%
  anti_join(stop_words) %>% 
  filter(!word %in% c("ooh","ah"))
```

    ## Joining, by = "word"

``` r
tidy_folklore %>%
  count(word, sort = TRUE)
```

    ## # A tibble: 735 × 2
    ##    word       n
    ##    <chr>  <int>
    ##  1 time      38
    ##  2 love      13
    ##  3 mad       13
    ##  4 call      11
    ##  5 hope      11
    ##  6 woman     11
    ##  7 mine      10
    ##  8 heart      9
    ##  9 pulled     9
    ## 10 signs      9
    ## # … with 725 more rows
