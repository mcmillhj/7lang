#!/usr/local/bin/lua

function reduce(max, init, f)
   local acc = init
   for i = 1, max do
      acc = f(acc, i)
   end

   return acc
end

function add(a,b)  return a + b end
function mult(a,b) return a * b end 
print('reduce(5, 0, add)  = ' .. reduce(5, 0, add))
print('reduce(5, 1, mult) = ' .. reduce(5, 1, mult))
print()

function factorial(n)
   return reduce(n, 1, mult)
end

print('factorials from 1 to 10')
for i = 1, 10 do
   print('factorial(' .. i .. ') = ' .. factorial(i))
end

