require('NPCs/MainCreationMethods');
AV_AcceptItemFunction = AV_AcceptItemFunction or {}

function AV_AcceptItemFunction.Bra(container, item)
	return (item:getWeight() <= 0.5)
end