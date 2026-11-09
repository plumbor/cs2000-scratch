use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data BST:
  | empty-leaf
  | node(key :: Number, val :: String, left :: BST, right :: BST)
end


BST0 = empty-leaf
BST1 = node(1, "hello", BST0, BST0)
BST2 = node(5, "bye", BST1, BST0)
BST3 = node(6, "bye", BST2, node(10, "cs2000", BST0, BST0))