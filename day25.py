#level beginner




# lists
fruits = ["apple", "pear", "banana", "blueberry"]


# access a value in the list
fruits[3] #blueberry


# filtering - filters elements
# only want fruits that are 5 letters or less

list(filter(lambda fruit: len(fruit) <= 5, fruits))


#map - changes elements
#convert all fruits to upper case:
list(map(lambda fruit: fruit.upper(), fruits))


# data Fruit:
#   | fruit(name :: String, expiry :: String)
# end

@dataclass # in python, we call this "@" a decorator
class Fruit:
    name : str
    expiry: str

p = Fruit("pear", "Nov 19 2026")


nums = [1,2,3,4,5,6,7,8,9,10]
list(map(lambda num: num*num, nums))
list(filter(lambda num: num%2 == 0, nums))

words = ["hello", "world", "python"]

list(map(lambda w: len(w), words))
