
-- Bottling of Meat MOD

-- 2022-01-04 Version 2.03

Events.OnGameStart.Add( function ()

	print ("***** Bottling of Meat MOD *****");
	print ("It was added to the game system!");

end)

function BottlingCannedFood_OnCooked(BottlingCannedFood)

	local aged = BottlingCannedFood:getAge() / BottlingCannedFood:getOffAgeMax();

	BottlingCannedFood:setOffAgeMax(1825);
	BottlingCannedFood:setOffAge(1095);
	BottlingCannedFood:setAge(BottlingCannedFood:getOffAgeMax() * aged);

end
