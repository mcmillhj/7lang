scheduler = require 'scheduler'

-- punch every second
function punch()
   for i = 1, 10 do
      scheduler.wait(1.0)
      print('punch ' .. i)
   end
end

-- block once every two seconds
function block()
   for i = 1,5 do
      scheduler.wait(2.0)
      print('block ' .. i)
   end
end

-- schedule both of these coroutines to run
scheduler.schedule(os.clock(), coroutine.create(punch))
scheduler.schedule(os.clock(), coroutine.create(block))

-- start running coroutines
scheduler.run()
