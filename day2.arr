use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
string-to-upper("hello cs2000")
overlay(rectangle(30, 60, "solid", "orange"),
  ellipse(60, 30, "solid", "purple"))
above-align("center",
  square(30, "solid", "green"), square(50, "solid", "purple"))