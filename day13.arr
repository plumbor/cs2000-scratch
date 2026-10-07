use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import math as M
import statistics as S
include csv


cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

drinks = get-column(cafe-data, "drinks-sold")
M.sum(drinks)

drinks2 = get-column(cafe-data, "day")
M.min(drinks2)

quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end


scores1 = get-column(quiz-scores, "quiz1")
S.mean(scores1)

scores2 = get-column(quiz-scores, "quiz2")
S.mean(scores2)

scores3 = get-column(quiz-scores, "quiz3")
S.mean(scores3)


# problem 5
earnings-data = load-table:
  name,
  department-name,
  title,
  regular,
  retro,
  other,
  overtime,
  injured,
  detail,
  quinn-education,
  total-gross,
  postal
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end

