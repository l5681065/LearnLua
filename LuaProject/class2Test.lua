require "class2_people"

local people = People.New("YOYO",18)
people:Say();

local men = Men.New("YOYO1",18)
men:Say()
men:Smoke()

print(getClassName(people))

print(getClassName(men))