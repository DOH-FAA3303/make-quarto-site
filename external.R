library(jsonlite)
library(dplyr)
library(purrr)

## ---- try
drug_json<- jsonlite::read_json("drug-enforcement-0001-of-0001.json")

## ---- stop

drug_df <- purrr::map_dfr(drug_json$results, unlist)
glimpse(drug_df)

drug_df %>%
  select(status, city, classification, contains("substance_name")) %>%
  head()
