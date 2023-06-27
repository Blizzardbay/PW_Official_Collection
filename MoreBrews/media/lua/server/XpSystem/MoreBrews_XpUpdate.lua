MoreBrewsxpUpdate = {};

-- If you start with brewer trait it stays no matter the level. If you don't you gain it at level 6
MoreBrewsxpUpdate.levelPerk = function(owner, perk, level)
	if perk == Perks.Brewing then
		if not owner:HasTrait("Brewer") then
			owner:getTraits():remove("Brewer");
        	if level >= 6 and level <= 10 then
            owner:getTraits():add("Brewer");
       		end
		else
			return owner:HasTrait("Brewer");
		end
	end
end

-- get xp when you craft something
MoreBrewsxpUpdate.onMakeItem = function(item, resultItem, recipe)
	--if instanceof(resultItem, "Clean Pot") then
		--getPlayer():getXp():AddXP(Perks.Brewing, 3);
	--end
	if Item:getType():contains("Beer") then
		getPlayer():getXp():AddXP(Perks.Brewing, 5);
	end
end

-- Add Brewing Skill books to the game
function addSkillBooks()

	SkillBook["Brewing"] = {};
	SkillBook["Brewing"].perk = Perks.Brewing;
	SkillBook["Brewing"].maxMultiplier1 = 3;
	SkillBook["Brewing"].maxMultiplier2 = 5;
	SkillBook["Brewing"].maxMultiplier3 = 8;
	SkillBook["Brewing"].maxMultiplier4 = 12;
	SkillBook["Brewing"].maxMultiplier5 = 16;
end

Events.LevelPerk.Add(MoreBrewsxpUpdate.levelPerk);
Events.OnMakeItem.Add(MoreBrewsxpUpdate.onMakeItem);
Events.OnGameStart.Add(addSkillBooks);