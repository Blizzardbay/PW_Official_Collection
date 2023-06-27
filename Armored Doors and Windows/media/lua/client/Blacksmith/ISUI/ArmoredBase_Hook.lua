ArmoredBaseHook = function(player, context, worldobjects, test)
	print("Base Armor?")
	ArmoredBase.doBuildMenu(player, context, worldobjects, test)
end

Events.OnFillWorldObjectContextMenu.Add(ArmoredBaseHook);