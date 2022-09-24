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
  if #self.storage < 1 then
    p 'The storage is empty...'
  end

  for _,content in pairs(self.storage) do
    p(tostring(content))
  end
end

function Test:removeStorageContent(index: number)
  self.storage[index] = nil
end

function Test:removeAllStorageContents()
  for i = 1,#self.storage do
    self:removeStorageContent(i)
  end
end

Test:setupStorage('Hi','Hello',true,false,123,321,nil,'Last 2 is nil!')
Test:printStorageContents()
Test:removeAllStorageContents()
Test:printStorageContents()
