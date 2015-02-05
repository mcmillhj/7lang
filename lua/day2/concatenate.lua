#!/usr/bin/env lua

function concatenate(a1, a2)
   for _, v in ipairs(a2) do
      a1[#a1 + 1] = v
   end
   a2 = nil -- free unused elements after copy

   return a1
end

local a1 = { 1, 2, 3 }
local a2 = { "a", "b", "c" }

print('a1')
print('-------');
for i, v in ipairs(a1) do
   print(i .. ': ' .. v)
end
print()

print('a2')
print('-------');
for i, v in ipairs(a2) do
   print(i .. ': ' .. v)
end
print()

print('a1 + a2')
function newindex (t, k, v)
   rawset(t,k,v)
   if type(v) == "table" then
      setmetatable(
         t[k],
         { __add = concatenate }
      )
   end
end
setmetatable(_G, { __newindex=newindex})

t = { 1,2,3 }
x = { "a","b","c" }
local y = t + x

for i,v in ipairs(y) do
   print(i .. ': ' .. v)
end
