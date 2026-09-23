use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


#function

# :: String ensures that only a string is allowed as the imput

fun greeting(name :: String):
  # doc string
  doc: "Returns a message greeting the person"
  "Welcome " + name
  end

#above(rectangle(80,40,"solid","light-green"),above(rectangle(80,40,"solid","pink"),rectangle(80,40,"solid","red")))

fun cake(c1 :: String, c2 :: String) -> Image:
  #colors count as Strings
  doc: "creates a cake w two layers"
  cake1 = rectangle(80,40,"solid","pink")
  cake2 = rectangle(80,40,"solid","light-green")
  above(cake1,cake2)
  #blocks must end with an expression
end

#cost for 4 t shirts with go team
# 4 * (5 + (0.10 * 8)
# cost for 7 t shirts with hello world
# 7 * (5 + (0.10 * 10)
sleeve-1 = rotate(40,rectangle(40,30,"solid","red"))