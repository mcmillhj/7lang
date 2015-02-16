#!/usr/bin/env lua

function retry(count, body)
   local tries = 1
   while tries ~= count do
      local _,result = coroutine.resume(coroutine.create(body))

      if type(result) ~= "string" then
         break
      end

      tries = tries + 1
   end

   if tries == count then
      error("Failed after " .. count .. " tries; dying...")
      return
   end
   print "success!"
end

retry(
   5,
   function()
      local rand = math.random()
      if rand > 0.2 then
         coroutine.yield("Something bad happened")
      end
   end
)
