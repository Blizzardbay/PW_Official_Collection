MoreBrewsWinexpUpdate = {};

-- If you start with Vintner trait it stays no matter the level. If you don't you gain it at level 6
MoreBrewsWinexpUpdate.levelPerk = function(owner, perk, level)
	if perk == Perks.WineMaking then
		if not owner:HasTrait("Vintner") then
			owner:getTraits():remove("Vintner");
        	if level >= 6 and level <= 10 then
            owner:getTraits():add("Vintner");
       		end
		else
			return owner:HasTrait("Vintner");
		end
	end
end

-- get xp when you craft something
MoreBrewsWinexpUpdate.onMakeItem = function(item, resultItem, recipe)
	--if instanceof(resultItem, "Clean Pot") then
		--getPlayer():getXp():AddXP(Perks.WineMaking, 3);
	--end
	if Item:getType():contains("Wine") then
		getPlayer():getXp():AddXP(Perks.WineMaking, 5);
	end
end

-- Add Wine Making Skill books to the game if not using the MoreBrews beer branch
function addSkillBooks()

	SkillBook["WineMaking"] = {};
	SkillBook["WineMaking"].perk = Perks.WineMaking;
	SkillBook["WineMaking"].maxMultiplier1 = 3;
	SkillBook["WineMaking"].maxMultiplier2 = 5;
	SkillBook["WineMaking"].maxMultiplier3 = 8;
	SkillBook["WineMaking"].maxMultiplier4 = 12;
	SkillBook["WineMaking"].maxMultiplier5 = 16;
end

Events.LevelPerk.Add(MoreBrewsWinexpUpdate.levelPerk);
Events.OnMakeItem.Add(MoreBrewsWinexpUpdate.onMakeItem);
Events.OnGameStart.Add(addSkillBooks);