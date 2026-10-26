use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# Design a function add-bad-year-column that, given a table with columns for year, costs, and revenues, adds a new column called "bad-year" that contains true if the costs exceed revenues for that year, and false otherwise.

fun add-bad-year-column(t :: Table) -> Table:
  doc: "determines if a year was bad based on profit"
  fun is-bad(r :: Row) -> Boolean:
    get-column(r, "costs") > get-column(r, "revenues")
  end
  build-column(t, "bad-year", is-bad)
where:
  table1 = table: year,costs, revenues
    row: 2000, 5, 10
    row: 2000, 10, 5
    row: 2000, 3, 6
  end
  table1 = table: year,costs, revenues
    row:
  end
end


# Design a function find-drought-risks that takes a table with "region", "rainfall-2023" and "rainfall-2024" columns and returns a new table containing only those regions where rainfall amounts decreased from 2023 to 2024.

fun find-drought-risks(t :: Table) -> Table:
  doc: "creates new table including only regions where rainfall amounts decreased from 2023 to 2024"
  fun is-risk(r :: Row) -> Boolean:
    (get-column(r, "rainfall-2023") - get-column(r, "rainfall-2024")) > 0
  end
  filter-with(t, is-risk)
end