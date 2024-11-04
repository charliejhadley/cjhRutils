library("tidyverse")
library("tidygraph")
library("rnaturalearthdata")
library("sf")
library("ggraph")

data_rnat_countries <- countries110 %>%
  st_as_sf() %>%
  select(iso_a2 = iso_a2_eh, iso_a3, name, name_long, name_en, region_wb, continent) %>%
  st_drop_geometry() %>%
  as_tibble()

data_country_borders <- read_csv("https://raw.githubusercontent.com/geodatasource/country-borders/refs/heads/master/GEODATASOURCE-COUNTRY-BORDERS.CSV")

nodes_countries <- data_country_borders %>%
  select(iso_a2 = country_code) %>%
  unique() %>%
  inner_join(data_rnat_countries) %>%
  mutate(id = row_number(), .before = 1)
  # mutate(region_wb = fct_expand(region_wb, "Cross Region"))

vec_region_order <- c("Cross Region", "East Asia & Pacific", "Europe & Central Asia",
                      "Latin America & Caribbean", "Middle East & North Africa", "North America",
                      "South Asia", "Sub-Saharan Africa")

codes_to_ids <- nodes_countries %>%
  select(iso_a2, id) %>%
  deframe()


edges_countries <- data_country_borders %>%
  filter(country_code %in% nodes_countries$iso_a2,
         country_border_code %in% nodes_countries$iso_a2) %>%
  reframe(from = country_code,
          to = country_border_code) %>%
  left_join(reframe(nodes_countries, iso_a2, from_region = as.character(region_wb)),
            by = c("from" = "iso_a2")) %>%
  left_join(reframe(nodes_countries, iso_a2, to_region = as.character(region_wb)),
            by = c("to" = "iso_a2")) %>%
  reframe(from = codes_to_ids[from],
          to = codes_to_ids[to],
          border_region = ifelse(from_region == to_region,
                                 from_region,
                                 "Cross Region")
  )

ggraph_bordering_countries <- tbl_graph(nodes_countries,
          edges_countries)

usethis::use_data(ggraph_bordering_countries, overwrite = TRUE)
