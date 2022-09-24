require 'tluvit-pretty-print'
local Object = require 'tluvit-core'.Object

local Test = Object:extend()

function Test:setupStorage(...: any)
  if not self.storage then
    self.storage = {}
  else return end

  for _,content in pairs({...}) do
    if content then
      table.insert(self.storage,content)
    end
  end
end

function Test:printStorageContents()
  for _,content in pairs(self.storage) do
    p(tostring(content))
  end
end

Test:setupStorage('Hi','Hello',true,false,123,321,nil,'Last 2 is nil!')
Test:printStorageContents()
