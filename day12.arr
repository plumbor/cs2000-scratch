use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end


#string-to-number :: (s :: String) -> Option<Number>

# cleaning the temperature column from string to number
# string-to-number-unsafe TAKES a STRING


fun clean-temp(v) -> Number:
  doc: "could take a number or a string and give back a number"
  if is-string(v):
    string-to-number-unsafe(v)
  else:
    v
  end
where:
  clean-temp(44) is 44
  clean-temp("45") is 45
end


weather-clean = transform-column(weather-data, "temperature", clean-temp)

# define cold/mild/hot ranges based on temperature

# build new column for strings based on the temperature

#create the bar chart

fun temp-to-text(r :: Row) -> String:
  doc: "creates a text descriptor based on temperature"
  if get-column(r, "temperature") < 50:
    "cold"
  else if get-column(r, "temperature") > 70:
    "hot"
  else:
    "mild"
  end
where:
  temp-to-text(get-row(weather-clean,0)) is "mild"
  temp-to-text(get-row(weather-clean,4)) is "hot"
  temp-to-text(get-row(weather-clean,2)) is "cold"
end


build-column(weather-clean, "temp-str", temp-to-text)