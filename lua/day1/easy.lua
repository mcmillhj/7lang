#!/usr/bin/env lua

-- ends_in_3
-- returns true or false depending on whether 'num' ends in 3
-- does no error checking
function ends_in_3(num)
   return (num % 10) == 3
end

print('ends_in_3() tests')
print('33 ends in 3: ', ends_in_3(33))
print('45 ends in 3: ', ends_in_3(45))
print(' 3 ends in 3: ', ends_in_3(3))
print(' 0 ends in 3: ', ends_in_3(0))
print()

-- is_prime
-- returns true or false depending on whether or not 'num' is prime
-- does no error checking
function is_prime(num)
   if num == 2 then
      return true
   end
  
   if num % 2 == 0 then
      return false
   end
   
   for i = 2, math.sqrt(num) do
      if num % i == 0 then
         return false
      end
   end

   return true
end

print('is_prime() tests')
print(' 2 is prime: ', is_prime(2))
print('11 is prime: ', is_prime(11))
print('12 is prime: ', is_prime(12))
print(' 4 is prime: ', is_prime(4))
print()

function first_n_primes_ending_in_3(n)
   local prime_count = 0
   local current_prime = 3
   while prime_count ~= n do
      if ends_in_3(current_prime) and is_prime(current_prime) then
         print(prime_count .. ': ', current_prime)
         prime_count = prime_count + 1
      end
      current_prime = current_prime + 2
   end
end

print('First 11 primes that end in 3: ')
first_n_primes_ending_in_3(11)
