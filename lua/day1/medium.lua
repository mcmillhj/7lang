#!/usr/local/bin/lua

function for_loop(a, b, f)
   while a <= b do
      f(a)
      a = a + 1
   end
end

print_number = function(n) print(n) end
double_and_print = function(n) print_number(n * n) end
print('printing numbers from 1 to 5...')
for_loop(1, 5, print_number)
print()
print('print squares from 1 to 5...')
for_loop(1, 5, double_and_print)
