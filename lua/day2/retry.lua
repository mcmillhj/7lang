#!/usr/bin/env lua

function retry(count, body)
   local tries = 1
   while tries ~= count do
      print("TRY# " .. tries)
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
      if math.random() < 0.5 then
         coroutine.yield("ERROR")
      end
   end
)
