require "CenterData.DefineClass"

People = class2("People")
function People:ctor(name,age)
    self.mName = name
    self.mAge = age
end

function People:Say()
    print(string.format("People mName:%s,mAge:%s",self.mName,self.mAge))
end


Men =  class2("Men",People)

function Men:ctor(name,age)
    People.ctor(self,name,age)
    self.mSex = 1
end

function Men:Say()
    print(string.format("Man mName:%s,mAge:%s",self.mName,self.mAge,self.mSex))
end

function Men:Smoke()
    print(string.format("%s smoking",self.mName))
end