--Body Parts List --> Foot_L, Foot_R, ForeArm_L, ForeArm_R, Groin, Hand_L, Hand_R, Head, LowerLeg_L, LowerLeg_R, MAX, Neck, Torso_Lower, Torso_Upper, UpperArm_L, UpperArm_R, UpperLeg_L, UpperLeg_R 
--Available Res Types list --> ScratchRes|DeepWoundRes|BurnRes|BulletRes|FractureRes|GlassRes|BiteRes

if(ItemValueTable == nil) then ItemValueTable = {}; end
ItemValueTable["Armor.MShield"] = 10.00;
if(GlobalArmor == nil) then GlobalArmor = {} end

-- Helmets	
	local WorkingArmor;

	WorkingArmor = "MShield";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 100, LowerLeg_L = 100};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 100, LowerLeg_L = 100};	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 100, LowerLeg_L = 100};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 100, ForeArm_L = 100, UpperArm_L = 100, Torso_Upper = 100, Torso_Lower = 100, Groin = 100, UpperLeg_L = 100, LowerLeg_L = 100};			
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Shield";
	
	WorkingArmor = "ClericNeck";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 60};			
		GlobalArmor[WorkingArmor]["Durability"] = 50;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "Hat_Altyn";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Head = 60};			
		GlobalArmor[WorkingArmor]["Durability"] = 50;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "Hat_Altynopen";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Head = 60};			
		GlobalArmor[WorkingArmor]["Durability"] = 50;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "Hat_Tknight";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 90;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "Hat_Tknightopen";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 90;
		GlobalArmor[WorkingArmor]["Location"] = "Head";

	WorkingArmor = "Hat_WitchyHat";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 50};	
		GlobalArmor[WorkingArmor]["BurnRes"] = {Head = 100};		
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
-- Gloves

	WorkingArmor = "Gloves_Rogue";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 60, Hand_R = 60} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 60, Hand_R = 60} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 60, Hand_R = 60} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 60, Hand_R = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 60, Hand_R = 60};	
		GlobalArmor[WorkingArmor]["BurnRes"] = {Hand_L = 60, Hand_R = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 50;		
		GlobalArmor[WorkingArmor]["Location"] = "Hands";		

	WorkingArmor = "Gloves_TKnight";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 90, Hand_R = 90} ;	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 90, Hand_R = 90} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 90, Hand_R = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 90, Hand_R = 90};	
		GlobalArmor[WorkingArmor]["Durability"] = 80;		
		GlobalArmor[WorkingArmor]["Location"] = "Hands";		
		
-- Arm Armor

	WorkingArmor = "RogueArms";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 60, UpperArm_R = 60, ForeArm_L = 60, ForeArm_R = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 60, UpperArm_R = 60, ForeArm_L = 60, ForeArm_R = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 60, UpperArm_R = 60, ForeArm_L = 60, ForeArm_R = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 60, UpperArm_R = 60, ForeArm_L = 60, ForeArm_R = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {UpperArm_L = 60, UpperArm_R = 60, ForeArm_L = 60, ForeArm_R = 60};			
		GlobalArmor[WorkingArmor]["BurnRes"] = {UpperArm_L = 80, UpperArm_R = 80, ForeArm_L = 80, ForeArm_R = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 50;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";	

	WorkingArmor = "KnightArms";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 90, UpperArm_R = 90, ForeArm_L = 90, ForeArm_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 90, UpperArm_R = 90, ForeArm_L = 90, ForeArm_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 90, UpperArm_R = 90, ForeArm_L = 90, ForeArm_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 90, UpperArm_R = 90, ForeArm_L = 90, ForeArm_R = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {UpperArm_L = 90, UpperArm_R = 90, ForeArm_L = 90, ForeArm_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 90;	
		GlobalArmor[WorkingArmor]["Location"] = "Arms";	
		
-- Torso Armor

	WorkingArmor = "aresbody";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Torso_Upper = 100, Torso_Lower = 100, UpperArm_L = 100, UpperArm_R = 100, ForeArm_L = 100, ForeArm_R = 100, Hand_L = 100, Hand_R = 100, Groin = 100, Torso_Lower = 100, UpperLeg_L = 100, UpperLeg_R = 100, LowerLeg_L = 100, LowerLeg_R = 100, Foot_L = 100, Foot_R = 100};	
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Torso_Upper = 100, Torso_Lower = 100, UpperArm_L = 100, UpperArm_R = 100, ForeArm_L = 100, ForeArm_R = 100, Hand_L = 100, Hand_R = 100, Groin = 100, Torso_Lower = 100, UpperLeg_L = 100, UpperLeg_R = 100, LowerLeg_L = 100, LowerLeg_R = 100, Foot_L = 100, Foot_R = 100};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Torso_Upper = 100, Torso_Lower = 100, UpperArm_L = 100, UpperArm_R = 100, ForeArm_L = 100, ForeArm_R = 100, Hand_L = 100, Hand_R = 100, Groin = 100, Torso_Lower = 100, UpperLeg_L = 100, UpperLeg_R = 100, LowerLeg_L = 100, LowerLeg_R = 100, Foot_L = 100, Foot_R = 100};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Torso_Upper = 100, Torso_Lower = 100, UpperArm_L = 100, UpperArm_R = 100, ForeArm_L = 100, ForeArm_R = 100, Hand_L = 100, Hand_R = 100, Groin = 100, Torso_Lower = 100, UpperLeg_L = 100, UpperLeg_R = 100, LowerLeg_L = 100, LowerLeg_R = 100, Foot_L = 100, Foot_R = 100};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Torso_Upper = 100, Torso_Lower = 100, UpperArm_L = 100, UpperArm_R = 100, ForeArm_L = 100, ForeArm_R = 100, Hand_L = 100, Hand_R = 100, Groin = 100, Torso_Lower = 100, UpperLeg_L = 100, UpperLeg_R = 100, LowerLeg_L = 100, LowerLeg_R = 100, Foot_L = 100, Foot_R = 100};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Torso_Upper = 100, Torso_Lower = 100, UpperArm_L = 100, UpperArm_R = 100, ForeArm_L = 100, ForeArm_R = 100, Hand_L = 100, Hand_R = 100, Groin = 100, Torso_Lower = 100, UpperLeg_L = 100, UpperLeg_R = 100, LowerLeg_L = 100, LowerLeg_R = 100, Foot_L = 100, Foot_R = 100};	
		GlobalArmor[WorkingArmor]["FractureRes"] = {Torso_Upper = 100, Torso_Lower = 100, UpperArm_L = 100, UpperArm_R = 100, ForeArm_L = 100, ForeArm_R = 100, Hand_L = 100, Hand_R = 100, Groin = 100, Torso_Lower = 100, UpperLeg_L = 100, UpperLeg_R = 100, LowerLeg_L = 100, LowerLeg_R = 100, Foot_L = 100, Foot_R = 100};		
		GlobalArmor[WorkingArmor]["Durability"] = 500;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "Vest_WitchyCarrier";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 40, Torso_Upper = 40};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 40, Torso_Upper = 40};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 40, Torso_Upper = 40};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 40, Torso_Upper = 40};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 40, Torso_Upper = 40};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Body";	

	WorkingArmor = "Vest_RogueVest";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 60, Torso_Upper = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 60, Torso_Upper = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 60, Torso_Upper = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 60, Torso_Upper = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 60, Torso_Upper = 60};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 60;
		GlobalArmor[WorkingArmor]["Location"] = "Body";	

	WorkingArmor = "Vest_Tknight";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90, Torso_Upper = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Body";	

	WorkingArmor = "Vest_HECU";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 70, Torso_Upper = 70};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 70, Torso_Upper = 70};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 70, Torso_Upper = 70};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 70, Torso_Upper = 70};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 70, Torso_Upper = 70};			
		GlobalArmor[WorkingArmor]["Durability"] = 60;
		GlobalArmor[WorkingArmor]["Location"] = "Body";	

-- Leg Armor

	WorkingArmor = "ClericPants";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 50, Torso_Lower = 50, UpperLeg_L = 50, UpperLeg_R = 50};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 50, Torso_Lower = 50, UpperLeg_L = 50, UpperLeg_R = 50};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 50, Torso_Lower = 50, UpperLeg_L = 50, UpperLeg_R = 50};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Groin = 50, Torso_Lower = 50, UpperLeg_L = 50, UpperLeg_R = 50};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 50, Torso_Lower = 50, UpperLeg_L = 50, UpperLeg_R = 50};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 60;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";

	WorkingArmor = "RogueGreaves";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 60, Torso_Lower = 60, UpperLeg_L = 60, UpperLeg_R = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 60, Torso_Lower = 60, UpperLeg_L = 60, UpperLeg_R = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 60, Torso_Lower = 60, UpperLeg_L = 60, UpperLeg_R = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Groin = 60, Torso_Lower = 60, UpperLeg_L = 50, UpperLeg_R = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 60, Torso_Lower = 60, UpperLeg_L = 60, UpperLeg_R = 60};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 60;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";

	WorkingArmor = "KnightGreaves";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 50, UpperLeg_R = 50};			
		GlobalArmor[WorkingArmor]["Durability"] = 90;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";

	WorkingArmor = "WitchySocks";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 100, UpperLeg_R = 100};			
		GlobalArmor[WorkingArmor]["Durability"] = 30;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";
		
-- Boots

	WorkingArmor = "Shoes_Rogue";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 60, Foot_R = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 60, Foot_R = 60};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 60, Foot_R = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Foot_L = 60, Foot_R = 60};	
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 60, Foot_R = 60};		
		GlobalArmor[WorkingArmor]["Durability"] = 60;
		GlobalArmor[WorkingArmor]["Location"] = "Feet";

	WorkingArmor = "Shoes_TKnight";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 90, Foot_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Feet";
		

