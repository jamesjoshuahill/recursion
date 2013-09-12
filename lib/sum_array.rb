def sum(array)
  return 0 if array.empty?
  return array.first if array.count == 1
  array.shift + sum(array)
end