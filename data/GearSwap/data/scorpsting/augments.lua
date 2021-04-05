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
    Rosmerta = {}	--BLU
	Rudian ={}	--PLD
	Cam = {}		--COR
	Segmo = {}		--MNK
--------------------
--  Ninja Capes   --
--------------------
	Segmo.ACC = { 
		name="Segomo's Mantle", 
		augments={'STR+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Phys. dmg. taken-10%'}
	}
----------------------
--  Paladin Capes   --
----------------------
	Rudian.FC = {
		name="Rudianos's Mantle", 
		augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%'}
	}
	Rudian.Enm = {
		name="Rudianos's Mantle", 
		augments={'HP+60','Accuracy+20 Attack+20','Enmity+10','Phys. dmg. taken-10%'}
	}
	Rudian.DA = {
		name="Rudianos's Mantle", 
		augments={'HP+60','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%'}
	}
	Rudian.Str = {
		name="Rudianos's Mantle", 
		augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%'}
	}
--------------------------
--  Blue Mage Capes     --
--------------------------
    Rosmerta.TP = {
        name="Rosmerta's Cape", 
        augments={'DEX+17','Accuracy+20 Attack+20','DEX+3','"Dual Wield"+10'}
    }
	Rosmerta.MAB = {
        name="Rosmerta's Cape", 
        augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}
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
		augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Magic Damage +1','"Mag.Atk.Bns."+10','Damage taken-5%'}
	}
	Cam.MAB = { 
		name="Camulus's Mantle", 
		augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%'}
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
        augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Weapon skill damage +3%','STR+6','"Mag.Atk.Bns."+7'}
    }
    ------------------
    --  Herc Body   --
    ------------------
	Herc.Body.WS = {
         name="Herculean Vest", 
         augments={'Weapon skill damage +4%','"Dbl.Atk."+2','Accuracy+3 Attack+3','Mag. Acc.+12 "Mag.Atk.Bns."+12'}	
	}
    ------------------
    --  Herc Hand   --
    ------------------
	Herc.Hands.MAB = { 
        name="Herculean Gloves", 
        augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic dmg. taken -1%','Mag. Acc.+10','"Mag.Atk.Bns."+12'}
    }
    ------------------
    --  Herc Legs   --
    ------------------
	Herc.Legs.MAB = {
        name="Herculean Trousers", 
        augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','MND+9','Mag. Acc.+14','"Mag.Atk.Bns."+15'}
    }
    ------------------
    --  Herc Feet   --
    ------------------
	Herc.Feet.WS = { 
        name="Herculean Boots", 
        augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','Accuracy+5','Attack+14'}
    }
--------------------------------------------------------------------------
--                        Augmented Adoulin Gear                        --
--------------------------------------------------------------------------
	Taeon={}
	Taeon.Head = {}
	Taeon.Body = {}
	Taeon.Hands = {}
	Taeon.Legs = {}
	Taeon.Feet = {}
	---------------
    --   Head    --
    ---------------
	Taeon.Head.SS = {
		name="Taeon Chapeau", 
		augments={'"Snapshot"+5','"Snapshot"+5'}
	}
    --------------
    --  Body    --
    --------------
	
    --------------
    --  Hand    --
    --------------

	--------------
    --  Legs    --
    --------------
	
	--------------
    --  Feet    --
    --------------
	Taeon.Feet.WS = {
		name="Taeon Boots", 
		augments={'Accuracy+15 Attack+15','"Triple Atk."+2','Weapon skill damage +3%'}
	}