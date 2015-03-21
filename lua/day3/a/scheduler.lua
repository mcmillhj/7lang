#!/usr/bin/env lua

-- pending actions and the time at which they should run
local pending = {}

-- given an array of actions with associated times
-- sorts that array by time from least to greatest
local function sort_by_time(array)
   table.sort(array, function(a, b) return a.time < b.time end)
end

-- removes the first element in an array
local function remove_first(array)
   local result = array[1]
   array[1] = array[#array]
   array[#array] = nil
   return result
end

-- schedule an action to run at a given time
local function schedule(time, action)
   pending[#pending + 1] = {
      time   = time,
      action = action
   }

   -- sort actions by time
   sort_by_time(pending)
end

-- return control to the scheduler, which will re-schedule this action
-- for current_time + 'seconds'
local function wait(seconds)
   coroutine.yield(seconds)
end

-- run any actions that need to be run
local function run()
   while #pending > 0 do
      -- busy-wait until action can be run
      while os.clock() < pending[1].time do end 

      -- remove item that is ready to run
      local item = remove_first(pending)
      -- execute action and get seconds to reschedule at
      local _, seconds = coroutine.resume(item.action)

      -- reschedule action if needed
      if seconds then
         later = os.clock() + seconds
         schedule(later, item.action)
      end
   end
end

-- public API to return when called by require
return {
   schedule = schedule,
   run      = run,
   wait     = wait
}
