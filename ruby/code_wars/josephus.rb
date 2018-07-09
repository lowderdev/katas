# Take a list of items, and move each kth item into an array and return.
# josephus([1, 2, 3, 4], 2) == [2, 4, 3, 1]

def josephus(items, k)
  result = []
  items.length.times do
    items.rotate!(k - 1)
    result << items.shift
  end
  result
end
