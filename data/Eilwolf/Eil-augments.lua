----------------------------------
--      Augmented Gear          --
----------------------------------  
    --[[
        When adding in Augmented gear follow 
        these simple guidelines
        gearNameSimple = {}
        gear.name = {
            name="item_name",
            augments={'augment1', 'augment2', 'augment3'}
        }
         
        and when adding gear to sets add in as 
        gear.name,
        this way GearSwap knows what item to put in there
         
        1 Dexterity is .75 accuracy
        1 Strength is .75 Attack
    ]]
----------------------------------------------------------------------
--                          Augmented Capes                         --
----------------------------------------------------------------------
	Nant = {}
	Cam = {}
----------------------
--	Geomancer Capes	--
----------------------
	Nant.FC = {
		name="Nantosuelta's Cape", 
		augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10'}
	}
	Nant.Pet = {
		name="Nantosuelta's Cape", 
		augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Phys. dmg. taken-6%'}
	}
	Nant.Macc = {
		name="Nantosuelta's Cape", 
		augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10'}
	}
----------------------
--	Corsair Capes	--
----------------------
	Cam.TP = { 
		name="Camulus's Mantle", 
		augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}
	}
	Cam.RA = { 
		name="Camulus's Mantle", 
		augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%'}
	}
	Cam.WS = { 
		name="Camulus's Mantle", 
		augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +6%'}
	}
----------------------------------------------------------------------
--                          Augmented Herc                          --
--              MNK/THF/RNG/NIN/BLU/COR/PUP/DNC/RUN                 --
----------------------------------------------------------------------
    Herc = {}
    Herc.Head = {}
    Herc.Body = {}
    Herc.Hands = {}
    Herc.Legs = {}
    Herc.Feet = {}
    ------------------
    --  Herc Head   --
    ------------------
    Herc.Head.MAB = {
        name="Herculean Helm", 
        augments={'"Mag.Atk.Bns."+16','Weapon skill damage +3%','AGI+7','Rng.Atk.+2'}
    }
	Herc.Head.RWS = {
        name="Herculean Helm", 
        augments={'Rng.Atk.+30','Weapon skill damage +3%','Rng.Acc.+3'}
    }
    ------------------
    --  Herc Body   --
    ------------------
    Herc.Body.TP = {
         name="Herculean Vest", 
         augments={'"Store TP"+1','DEX+6','Accuracy+9'}
    }
	Herc.Body.RWS = {
         name="Herculean Vest", 
         augments={'Rng.Atk.+26','Weapon skill damage +4%','Rng.Acc.+15'}	
	}
    ------------------
    --  Herc Hand   --
    ------------------
    Herc.Hands.PDT = {
        name="Herculean Gloves", 
        augments={'Accuracy+30','Phys. dmg. taken -3%','STR+1'}
    }
    Herc.Hands.TP = { 
        name="Herculean Gloves", 
        augments={'Accuracy+27','"Counter"+1','DEX+10','Attack+9'}
    }
	Herc.Hands.MAB = { 
        name="Herculean Gloves", 
        augments={'"Mag.Atk.Bns."+20','Weapon skill damage +4%','Mag. Acc.+15'}
    }
	Herc.Hands.WS = { 
        name="Herculean Gloves", 
        augments={'Accuracy+17 Attack+17','"Triple Atk."+3','STR+3','Accuracy+10','Attack+11'}
    }
	Herc.Hands.StrWS = { 
        name="Herculean Gloves", 
        augments={'Accuracy+29','Weapon skill damage +4%','STR+3','Attack+14'}
    }
    ------------------
    --  Herc Legs   --
    ------------------
    Herc.Legs.TP = {
        name="Herculean Trousers", 
        augments={'Accuracy+20 Attack+20','"Triple Atk."+1','VIT+2','Accuracy+7','Attack+8'}
    }
	Herc.Legs.MAB = {
        name="Herculean Trousers", 
        augments={'"Mag.Atk.Bns."+20','Weapon skill damage +3%','Rng.Atk.+11'}
    }
	Herc.Legs.WS = {
        name="Herculean Trousers", 
        augments={'Accuracy+24 Attack+24','"Triple Atk."+3','STR+1','Accuracy+9','Attack+6'}
    }
	Herc.Legs.StrWS = {
        name="Herculean Trousers", 
        augments={'Attack+29','Weapon skill damage +3%','DEX+1','Accuracy+13'}
    }
	Herc.Legs.RWS = {
        name="Herculean Trousers", 
        augments={'Rng.Acc.+20','Weapon skill damage +3%','AGI+8','Rng.Atk.+10'}
    }
    ------------------
    --  Herc Feet   --
    ------------------
    Herc.Feet.TP = { 
        name="Herculean Boots", 
        augments={'Accuracy+19','"Triple Atk."+2','STR+5','Attack+15'}
    }
	Herc.Feet.RWS = { 
        name="Herculean Boots", 
        augments={'Weapon skill damage +4%','Rng.Acc.+4','Rng.Atk.+13'}
    }
	Herc.Feet.PDT = { 
        name="Herculean Boots", 
        augments={'Accuracy+18','Damage taken-2%','Attack+9'}
    }
	Herc.Feet.WS = { 
        name="Herculean Boots", 
        augments={'Attack+26','Weapon skill damage +4%','Accuracy+15'}
    }
----------------------------------------------------------------------
--                          Augmented Merl.                         --
--
----------------------------------------------------------------------
	Merl = {}
    Merl.Head = {}
    Merl.Body = {}
    Merl.Hands = {}
    Merl.Legs = {}
    Merl.Feet = {}
    ------------------
    --  Merl. Head  --
    ------------------
     
    ------------------
    --  Merl. Body  --
    ------------------
     
    ------------------
    --  Merl. Hand  --
    ------------------
	Merl.Hands.Pet={
		name="Merlinic Dastanas", 
		augments={'Pet: "Mag.Atk.Bns."+28','Blood Pact Dmg.+10'}
	}
    ------------------
    --  Merl. Legs  --
    ------------------
     
    ------------------
    --  Merl. Feet  --
    ------------------
    Merl.Feet.ConMP = {
		name="Merlinic Crackows", 
		augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Conserve MP"+6','"Mag.Atk.Bns."+2'}
	}
-------------------------------------------------------------------------
--                        Augmented Misc Gear                          --
-------------------------------------------------------------------------
	Telc = {}
	Telc.Head = {}
	Telc.Body = {}
	Telc.Legs = {}
	Telc.Feet = {}
	---------------
    --   Head    --
    ---------------
	Telc.Head.EncDur = {
		name="Telchine Cap", 
		augments={'Accuracy+15','Enmity-3','Enh. Mag. eff. dur. +8'}
	}
    --------------
    --  Body    --
    --------------
	Telc.Body.Pet = { 
		name="Telchine Chas.", 
		augments={'Evasion+20','Pet: "Regen"+2','Pet: Damage taken -3%'}	
	}
    --------------
    --  Hand    --
    --------------
	
	--------------
    --  Legs    --
    --------------
	Telc.Legs.Pet = {
		name="Telchine Braconi", 
		augments={'Mag. Evasion+18','Pet: "Regen"+3','Pet: Damage taken -1%'}
	}
	--------------
    --  Feet    --
    --------------
	Telc.Feet.Pet = {
		name="Telchine Pigaches", 
		augments={'Mag. Evasion+16','Pet: "Regen"+1','Pet: Damage taken -3%'}
	}
