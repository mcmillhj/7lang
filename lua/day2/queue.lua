#!/usr/bin/env lua

Queue = { _q = {} } 

function Queue:new()
   local obj = {
      _q = self._q
   }

   setmetatable(obj, self)
   self.__index = self
   
   return obj
end

function Queue:add(item)
   self._q[#self._q + 1] = item
end

function Queue:remove()
   if self:is_empty() then
      return nil
   end

   return table.remove(self._q, 1)
end

function Queue:is_empty()
   return #self._q == 0
end

local q = Queue:new()
for v in pairs({ 1, 2, 3, 4, 5, 6 }) do
   q:add(v)
end

while not q:is_empty() do
   print( q:remove() )
end
