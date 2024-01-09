arr = []

a = 0
b = 1

while a < 100
  arr<<a
  a, b = b, a + b
end

print arr
