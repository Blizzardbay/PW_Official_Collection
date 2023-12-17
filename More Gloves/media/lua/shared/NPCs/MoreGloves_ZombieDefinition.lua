require 'NPCs/ZombiesZoneDefinition'

--ConstructionWorker
table.insert(ZombiesZoneDefinition.Default,{name = "MG_Construction Worker", chance = 0.5});
table.insert(ZombiesZoneDefinition.ConstructionSite,{name = "MG_ConstructionWorker", chance = 20});
table.insert(ZombiesZoneDefinition.Factory,{name = "MG_ConstructionWorker", chance = 20});

--Carpenter
table.insert(ZombiesZoneDefinition.Default,{name = "MG_Carpenter", chance = 0.5});
table.insert(ZombiesZoneDefinition.ConstructionSite,{name = "MG_Carpenter", chance = 20});
table.insert(ZombiesZoneDefinition.Factory,{name = "MG_Carpenter", chance = 20});

--Electrician
table.insert(ZombiesZoneDefinition.Default,{name = "MG_Electrician", chance = 0.5});
table.insert(ZombiesZoneDefinition.ConstructionSite,{name = "MG_Electrician", chance = 20});

--Metalworker
table.insert(ZombiesZoneDefinition.CarRepair,{name = "MG_Metalworker", chance = 0.5});

--Biker
table.insert(ZombiesZoneDefinition.Default,{name = "MG_Biker", chance = 0.5});
table.insert(ZombiesZoneDefinition.Bar,{name = "MG_Biker", chance = 20});
table.insert(ZombiesZoneDefinition.StreetPoor,{name = "MG_Biker", chance = 15});

--Weightlifter
table.insert(ZombiesZoneDefinition.Default,{name = "MG_Weightlifter", chance = 0.5});
table.insert(ZombiesZoneDefinition.Athletic,{name = "MG_Weightlifter", chance = 20});
table.insert(ZombiesZoneDefinition.StreetSports,{name = "MG_Weightlifter", chance = 20});

--Kickboxer
table.insert(ZombiesZoneDefinition.Default,{name = "MG_Kickboxer", chance = 0.5});
table.insert(ZombiesZoneDefinition.Athletic,{name = "MG_Kickboxer", chance = 10});
table.insert(ZombiesZoneDefinition.StreetSports,{name = "Kickboxer", chance = 10});
table.insert(ZombiesZoneDefinition.Boxing,{name = "MG_Kickboxer", chance = 10});

--Firefighter
table.insert(ZombiesZoneDefinition.FireDept,{name = "MG_Firefighter", chance = 20});

--Gardener
table.insert(ZombiesZoneDefinition.Farm,{name = "MG_Gardener", chance = 20});

--HECU Trooper
table.insert(ZombiesZoneDefinition.Army,{name = "MG_HECU Trooper", chance = 2.5});
table.insert(ZombiesZoneDefinition.SecretBase,{name = "MG_HECU Trooper", chance = 2.5});
table.insert(ZombiesZoneDefinition.Doctor,{name = "MG_HECU Trooper", chance = 0.5});
table.insert(ZombiesZoneDefinition.Spiffo,{name = "MG_HECU Trooper", chance = 0.1});

--HECU Balaclava
table.insert(ZombiesZoneDefinition.Army,{name = "MG_HECU Balaclava", chance = 2.5});
table.insert(ZombiesZoneDefinition.SecretBase,{name = "MG_HECU Balaclava", chance = 2.5});
table.insert(ZombiesZoneDefinition.Doctor,{name = "MG_HECU Balaclava", chance = 1.5});
table.insert(ZombiesZoneDefinition.Spiffo,{name = "MG_HECU Balaclava", chance = 0.1});

--HECU Captain
table.insert(ZombiesZoneDefinition.Army,{name = "MG_HECU Captain", chance = 2.5});
table.insert(ZombiesZoneDefinition.SecretBase,{name = "MG_HECU Captain", chance = 2.5});
table.insert(ZombiesZoneDefinition.Doctor,{name = "MG_HECU Captain", chance = 1.5});
table.insert(ZombiesZoneDefinition.Spiffo,{name = "MG_HECU Captain", chance = 0.1});

--Goth Girl
table.insert(ZombiesZoneDefinition.Default,{name = "MG_Goth Girl", chance = 0.2});
