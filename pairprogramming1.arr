use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun needs-water(days :: Number) -> Boolean:
  doc: "returns true or false depending if the plant needs water"
  if days >= 3:
    true
  else:
    false
  end
where:
  needs-water(3) is true
  needs-water(5) is true
  needs-water(2) is false
end

fun pot() -> Image:
  doc: "creates an image of an orange pot"
  point-polygon(
    [list: point(0, 0), point(100, 0), point(80, -60), point(20, -60)],
    "solid", "orange")
end

fun plant(stage :: String) -> Image:
  doc: "returns an image of the plant depending on the stage"
  if stage == "sprout":
    circle(40, "solid", "green")
  else if stage == "young":
    triangle(50, "solid", "green")
  else:
    overlay-align("center", "top",
      circle(20, "solid", "green"), triangle(60, "solid", "green"))
  end
end

fun plant-display(stage :: String, days :: Number) -> Image:
  doc: "displays image of the plant and if it needs to be watered"
  if needs-water(days):
    above(circle(10,"solid","blue"),above(plant(stage),
        pot()))
  else:
    above(plant(stage),
        pot())
  end
end

fun named-plant(stage :: String, days :: Number, name :: String) -> Image:
  doc: "displays image of the plant, if it needs water, and the name of it"
  above(plant-display(stage,days), text(name, 20, "white"))
end
