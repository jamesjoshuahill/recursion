def palindrome?(array)
  return false if array.empty?
  return true if array.length == 1
  return array.first == array.last if array.length == 2
  array.first == array.last ? palindrome?(array[1..-2]) : false
end