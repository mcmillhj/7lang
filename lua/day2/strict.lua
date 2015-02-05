#!/usr/local/env lua

local _private = {}

function strict_read(table, key)
   if _private[key] then
      return _private[key]
   else
      error('Invalid key: ' .. key)
   end
end

function strict_write(table, key, value)
   if _private[key] and value ~= nil then
      error('Duplicate key: ' .. key)
   else
      _private[key] = value
   end
end

local mt = {
   __index    = strict_read,
   __newindex = strict_write
}

t = {}
setmetatable(t, mt)

-- set a key
t.k = 1
t.k = nil
