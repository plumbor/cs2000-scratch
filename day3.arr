use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
# using defintions
green-sq = square(40,"solid","green")

# without defintions
rect-2x = above(green-sq, green-sq)


side-length = 40 #cannot be redefined in pyret
color = "red"

orange-tri = triangle(side-length,"solid","orange")


# shadowing is NOT allowed as square is a built in function
ex2-sq = square(side-length, "solid", color)

yellow-circle = circle(40,"solid","yellow")

#overlay only takes 2 things

beside(yellow-circle,yellow-circle)


#target logo: above(icon, target-text)

#overlay(overlay()) concentric overlay-ception
c1 = circle(100,"outline","red")
overlay(c1,c1)

#do hw-1