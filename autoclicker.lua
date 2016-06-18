--Auto Clicker v1.0
--by tinotk

setImmersiveMode(true)

clicks = {}
dialogInit()
list = {"1","2","3","4","5"}
addSpinnerIndex("clicknum", list, "1")
dialogShow("How many click location?")

dialogInit()
for i = 1, clicknum do
	addTextView("Click#"..i.."    ")
	addTextView("X:")
	addEditNumber("xcord"..i,0)
	addTextView("Y:")
	addEditNumber("ycord"..i,0)
	addTextView("Wait:")
	addEditNumber("wait"..i,1)
	addCheckBox("continuous"..i,"Continuous?",false)
	newRow()
end
dialogShow("Click settings")

if(1 <= clicknum) then
	clicks[1] = {location = Location(xcord1, ycord1), wait=wait1, rpt=continuous1}
end
if(2 <= clicknum) then
	clicks[2] = {location = Location(xcord2, ycord2), wait=wait2, rpt=continuous2}
end
if(3 <= clicknum) then
	clicks[3] = {location = Location(xcord3, ycord3), wait=wait3, rpt=continuous3}
end
if(4 <= clicknum) then	
	clicks[4] = {location = Location(xcord4, ycord4), wait=wait4, rpt=continuous4}
end
if(5 <= clicknum) then
	clicks[5] = {location = Location(xcord5, ycord5), wait=wait5, rpt=continuous5}
end

while true do
	for i=1,#clicks do
		print("Click "..i.."  ".."of "..#clicks)
		if(clicks[i].rpt) then
			print("Continuous click at:")
			print(clicks[i].location)
			continueClick(clicks[i].location,100)
		else
			print("Single click at:")
			print(clicks[i].location)
			click(clicks[i].location)
		end
		wait(clicks[i].wait)
	end
end