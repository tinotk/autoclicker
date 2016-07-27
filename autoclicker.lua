--Auto Clicker v1.1
--by tinotk
--Link to Original thread: http://ankulua.boards.net/thread/115/auto-clicker

setImmersiveMode(true)

clicks = {}

dialogInit()
--list = {"1","2","3","4","5"}
--addSpinnerIndex("clicknum", list, "1")
--addSpinner("clicknum",list,"1")
addEditNumber("clicknum",5)
dialogShow("How many click location?")

dialogInit()
clicknum=tonumber(clicknum)
for i = 1, clicknum do
	addTextView("Click#"..i.."    ")
	addTextView("X:")
	addEditNumber("xcord"..i,0)
	addTextView("Y:")
	addEditNumber("ycord"..i,0)
	addTextView("Wait:")
	addEditNumber("wait"..i,1)
	addCheckBox("continuous"..i,"Continuous ",false)
	addCheckBox("rand"..i,"Randomize",false)
	newRow()
end
addTextView("Random Offset:")
addEditNumber("offset",0)
dialogShow("Click settings")

for i=1,clicknum do
	clicks[i] = {location = Location(_G["xcord"..i], _G["ycord"..i]), wait=_G["wait"..i], rpt=_G["continuous"..i], rand=_G["rand"..i]}
end

while true do
	for i=1,#clicks do
		if(clicks[i].rand) then
			math.randomseed(os.time())
			math.random() ; math.random()
			--randomOffset = math.random(-math.floor(offset/2),offset-math.floor(offset/2))
			--randomOffset2 = math.random(-math.floor(offset/2),offset-math.floor(offset/2))
			randomOffset = math.random(-offset,offset)
			randomOffset2 = math.random(-offset,offset)
			loc = Location(clicks[i].location:getX()+randomOffset,clicks[i].location:getY()+randomOffset2)
		else
			loc = clicks[i].location
		end
		print("Click "..i.."  ".."of "..#clicks)
		if(clicks[i].rpt) then
			print("Continuous click at:")
			print(loc)
			continueClick(loc,100)
		else
			print("Single click at:")
			print(loc)
			click(loc)
		end
		wait(clicks[i].wait)
	end
end
