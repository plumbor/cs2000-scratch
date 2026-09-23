use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv

recipes = load-table: 
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

sub-regional = load-table: 
  itl22cd,
  itl22nm,
  year,
  acd_year,
  school_stage,
  nc_year,
  nc_year_number,
  mean_projection,
  upper_pi,
  lower_pi
  source: csv-table-url("https://data.london.gov.uk/download/e66jz/509c1efe-80ac-439c-8f0f-3287155f9528/reception_year_11_projections_2025_2034.csv", default-options)
end

# rows
table-length(sub-regional)

#
get-row(sub-regional, 12)