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
    Niht = {}
    Ankou = {}
    Rosmerta = {}
	Nant = {}
	Smert = {}
	Rudianos ={}
	Suc = {}
	Ghost = {}
	Rudian = {}
	Ogma = {}
	Cam = {}
	Bele = {}
	Cich = {}
	Tara = {}
	Tara = {}
	Andar = {}
	Brig = {}
	Segmo = {}
--------------------
--  Ninja Capes   --
--------------------
	Andar.TP = {
		name="Andartia's Mantle", 
		augments={'DEX+20','Accuracy+20 Attack+20'}
	}
--------------------
--  Ninja Capes   --
--------------------
	Segmo.ACC = { 
		name="Segomo's Mantle", 
		augments={'STR+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Phys. dmg. taken-10%'}
	}
--------------------
--  Ninja Capes   --
--------------------
	Brig.ACC = { 
		name="Brigantia's Mantle", 
		augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}
	}
----------------------
--  Warrior Capes   --
----------------------
	Cich.TP = { 
		name="Cichol's Mantle", 
		augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%'}
	}
	Cich.WS = {
		name="Cichol's Mantle", 
		augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}
	}
	Cich.VitWS = {
		name="Cichol's Mantle", 
		augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%'}
	}
----------------------
--  Warrior Capes   --
----------------------
	Suc.TP = { 
		name="Sucellos's Cape", 
		augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Damage taken-5%'}
	}
	Suc.WS = {
		name="Sucellos's Cape", 
		augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Accuracy+10.///'}
	}
	Suc.Macc = {
		name="Sucellos's Cape", 
		augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20'}
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
--  Rune Fencer Capes   --
--------------------------
	Ogma.TP = {
		name="Ogma's cape", 
		augments={'HP+60','Accuracy+20 Attack+20','HP+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}
	}
	Ogma.FC = {
		name="Ogma's cape", 
		augments={'HP+21','Eva.+1 /Mag. Eva.+1','"Fast Cast"+10'}
	}
	Ogma.ENM = {
		name="Ogma's cape", 
		augments={'HP+60','Eva.+20/Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%'}
	}
	Ogma.WS = {
		name="Ogma's cape", 
		augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}
	}
--------------------------
--  Dark Knight Capes   --
--------------------------
    Niht.DarkMagic = {
        name="Niht Mantle", 
        augments={'Attack+12','Dark magic skill +10', '"Drain" and "Aspir" potency +15', 'Weapon skill damage +3%'
    }}
    Ankou.TP = {
        name="Ankou's mantle",
        augments ={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}
    }
    Ankou.StrWS = {
        name="Ankou's mantle",
        augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%'}
    }
    Ankou.VitWS = {
        name="Ankou's mantle",
        augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%'}
    }
    Ankou.FC = {
        name="Ankou's mantle",
        augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10'}
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
--
--
--
	Nant.FC = {
		name="Nantosuelta's Cape", 
		augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10'}
	}
--
--
--
	Tara.FC = {
		name="Taranus's Cape", 
		augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10'}
	}
	Tara.MAB = {
		name="Taranus's Cape", 
		augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}
	}
--
--
--
	Smert.TP = {
		name="Smertrios's Mantle", 
		augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+3','"Dbl.Atk."+10','Phys. dmg. taken-8%'}
	}
	Smert.WS = {
		name="Smertrios's Mantle", 
		augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%'}
	}
--
--	Corsair Capes
--
	Cam.TP = { 
		name="Camulus's Mantle", 
		augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}
	}
	Cam.RA = { 
		name="Camulus's Mantle", 
		augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+4','Weapon skill damage +10%'}
	}
	Cam.MAB = { 
		name="Camulus's Mantle", 
		augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%'}
	}
--
--	Ranger Capes 
--
	Bele.RA = {
		name="Belenus's Cape", 
		augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10'}
	}
	Bele.MAB = {
		name="Belenus's Cape", 
		augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%'}
	}
	Bele.MagicEva = {
		name="Belenus's Cape", 
		augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+9','"Snapshot"+10','Phys. dmg. taken-10%'}
	}
	Bele.WS = {
		name="Belenus's Cape", 
		augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%'}
	}
----------------------------------------------------------------------
--                          Augmented Valor                         --
--                      WAR/PLD/DRK/SAM/DRG/BST                     --
----------------------------------------------------------------------
    Valor = {}
    Valor.Head ={}
    Valor.Body = {}
    Valor.Hands = {}
    Valor.Legs = {}
    Valor.Feet = {} 
    ------------------
    --  Valor Head  --
    ------------------
    Valor.Head.TP = {
        name="Valorous Mask", 
        augments={'Accuracy+17 Attack+17','"Store TP"+3','Accuracy+15'}
    }
    Valor.Head.WS = {
        name="Valorous Mask", 
        augments={'Accuracy+21','Weapon skill damage +3%','STR+10','Attack+12'}  
    }
    ------------------
    --  Valor Body  --
    ------------------
    Valor.Body.TP = {
        name="Valorous mail",
       -- augments = {'Accuracy+25 Attack+25','"Dbl.Atk."+3','VIT+1','Accuracy+2','Attack+11'}
	    augments = {'Accuracy+25','"Dbl.Atk."+2','DEX+10','Attack+12'}
    }
    ------------------
    --  Valor Hand  --
    ------------------
    Valor.Hands.TP = {
        name="Valorous mitts", 
        augments={'Accuracy+24 Attack+24','DEX+14','Accuracy+13'}
    }
    Valor.Hands.WS = {
        name="Valorous mitts",
        augments={'Attack+23','Weapon skill damage +3%','STR+13','Accuracy+10'}
    }
	Valor.Hands.MAB = { 
		name="Valorous Mitts", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +3%'}
	}
    ------------------
    --  Valor Legs  --
    ------------------
    Valor.Legs.TP = {
        name="Valor. Hose",
        augments={'Accuracy+28','"Dbl.Atk."+2','DEX+9','Attack+3'}
    }
    Valor.Legs.WS = {
        name="Valor. Hose", 
        augments={'Accuracy+13 Attack+13','Weapon skill damage +4%'}
    }
    Valor.Legs.DA = { 
    --For Aftermath Set--
        name="Valor. Hose",
        augments={'Accuracy+29','"Dbl.Atk."+5','VIT+5'}
    }
    ------------------
    --  Valor Feet  --
    ------------------
    Valor.Feet.TP = {
        name="Valorous Greaves", 
        augments={'Accuracy+21 Attack+21','"Store TP"+3','DEX+7','Accuracy+14'}
    }
	Valor.Feet.WSD = {
        name="Valorous Greaves", 
        augments={'Accuracy+13','Weapon skill damage +4%','STR+8','Attack+8'}
    }
----------------------------------------------------------------------
--                          Augmented Odyss.                        --
--                            WAR/PLD/DRK                           --
----------------------------------------------------------------------
    Odyssean = {}
	Odyssean.Helm = {}
    Odyssean.Body = {}
    Odyssean.Hands = {}
    Odyssean.Legs = {}
    Odyssean.Feet = {}
    ------------------
    --  Odyss. Head --
    ------------------
    Odyssean.Helm.VitWS = {
		name="Odyssean Helm", 
		augments={'Attack+23','Weapon skill damage +3%','VIT+6'}
	}
    ------------------
    --  Odyss. Body --
    ------------------
    Odyssean.Body.FC = {
        name="Odyssean chestplate",
        augments={'Accuracy+10','"Fast Cast"+6','Attack+12'}
    }
    Odyssean.Body.WS = {
        name="Odyssean chestplate",
        augments={'Accuracy+30','Weapon skill damage +4%','DEX+5','Attack+12'}
    }
    ------------------
    --  Odyss. Hand --
    ------------------
    Odyssean.Hands.FC = {
        name="Odyssean gauntlets",
        augments={'VIT+7', 'Accuracy+12', 'Attack+12', '"Fast Cast"+5'}
    }
    Odyssean.Hands.WS = {
        name="Odyssean gauntlets",
        augments={'Accuracy+24','Weapon skill damage +2%','STR+12','Attack+13'} 
    }
	Odyssean.Hands.VitWS = {
		name="Odyssean gauntlets",
        augments={'Attack+27','Weapon skill damage +5%','VIT+10','Accuracy+9'} 
	}
    ------------------
    --  Odyss. Legs --
    ------------------
    Odyssean.Legs.TP = {
        name="Odyssean Cuisses", 
        augments={'Accuracy+25 Attack+25','"Store TP"+3','Accuracy+10'}
    }
	Odyssean.Legs.StrWS = {
        name="Odyssean Cuisses", 
        augments={'Accuracy+19 Attack+19','Weapon skill damage +3%','STR+7','Attack+2'}
    }
	Odyssean.Legs.VitWS = {
		name="Odyssean Cuisses", 
		augments={'Accuracy+17 Attack+17','Weapon skill damage +5%','Accuracy+9','Attack+10'}
	}
	Odyssean.Legs.Enm = {
		name="Odyssean Cuisses", 
		augments={'Attack+10','Enmity+7','VIT+9'}
	}
	Odyssean.Legs.PDT = {
		name="Odyssean Cuisses", 
		augments={'Accuracy+23','Phys. dmg. taken -4%','VIT+9','Attack+4'}
	}
    ------------------
    --  Odyss. Feet --
    ------------------
    Odyssean.Feet.FC = {
        name="Odyssean Greaves", 
		augments={'"Fast Cast"+4','Mag. Acc.+15'}
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
	Herc.Head.FC = {
        name="Herculean Helm", 
        augments={'Accuracy+15 Attack+15','"Fast Cast"+3','Mag. Acc.+10 "Mag.Atk.Bns."+10'}
    }
	Herc.Head.RWS = {
        name="Herculean Helm", 
        augments={'Rng.Acc.+19 Rng.Atk.+19','Weapon skill damage +4%','AGI+5','Rng.Acc.+15'}
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
        augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic dmg. taken -1%','Mag. Acc.+10','"Mag.Atk.Bns."+12'}
    }
	Herc.Hands.WS = { 
        name="Herculean Gloves", 
        augments={'Accuracy+17 Attack+17','"Triple Atk."+3','STR+3','Accuracy+10','Attack+11'}
    }
	Herc.Hands.StrWS = { 
        name="Herculean Gloves", 
        augments={'Accuracy+24','Weapon skill damage +4%','STR+7','Attack+12'}
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
        augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Weapon skill damage +2%','Mag. Acc.+9','"Mag.Atk.Bns."+11'}
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
        augments={'Rng.Acc.+26','Weapon skill damage +4%','Rng.Atk.+10'}
    }
    ------------------
    --  Herc Feet   --
    ------------------
    Herc.Feet.TP = { 
        name="Herculean Boots", 
        augments={'Accuracy+21 Attack+21','Crit.hit rate+1','STR+4','Accuracy+15','Attack+9'}
    }
	Herc.Feet.RWS = { 
        name="Herculean Boots", 
        augments={'Rng.Acc.+25','Weapon skill damage +4%','Rng.Atk.+14'}
    }
	Herc.Feet.PDT = { 
        name="Herculean Boots", 
        augments={'Accuracy+7','Phys. dmg. taken -3%','DEX+8'}
    }
	Herc.Feet.WS = { 
        name="Herculean Boots", 
        augments={'Accuracy+23 Attack+23','"Triple Atk."+3','STR+10','Accuracy+10'}
    }
	Herc.Feet.MAB = { 
		name="Herculean Boots", 
		augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','Mag. Acc.+14','"Mag.Atk.Bns."+13'}
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
	Merl.Hands.FC={
		name="Merlinic Dastanas", 
		augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','"Fast Cast"+4'}
	}
    ------------------
    --  Merl. Legs  --
    ------------------
    Merl.Legs.Burst = {
		name="Merlinic Shalwar", 
		augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+9%','MND+7','Mag. Acc.+10','"Mag.Atk.Bns."+5'}
	}
    ------------------
    --  Merl. Feet  --
    ------------------
    Merl.Feet.Burst = {
		name="Merlinic Crackows", 
		augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+8%','INT+8','Mag. Acc.+12'}
	} 
 Chir = {}
    Chir.Head = {}
    Chir.Body = {}
    Chir.Hands = {}
    Chir.Legs = {}
    Chir.Feet = {}
    ------------------
    --  Chir. Head  --
    ------------------
    Chir.Head.Acc = {
		name="Chironic Hat", 
		augments={'Accuracy+19 Attack+19','"Dbl.Atk."+2','CHR+6','Accuracy+13','Attack+13'}
	}
    ------------------
    --  Chir. Body  --
    ------------------
     
    ------------------
    --  Chir. Hand  --
    ------------------
     
    ------------------
    --  Chir. Legs  --
    ------------------
    Chir.Legs.MAC = {
		name="Chironic Hose", 
		augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Spell interruption rate down -2%','MND+15','Mag. Acc.+6','"Mag.Atk.Bns."+4',}
	}
    ------------------
    --  Chir. Feet  --
    ------------------
	Chir.Feet.MAB = { 
        name="Chironic Slippers", 
		augments={'Rng.Atk.+8','"Blood Boon"+3','"Treasure Hunter"+2','Mag. Acc.+13 "Mag.Atk.Bns."+13'}
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
    Taeon.Head.WS = {
		name="Taeon Chapeau", 
		augments={'Accuracy+17 Attack+17','"Triple Atk."+2','Weapon skill damage +3%'}
	}
	Taeon.Head.Crit = {
		name="Taeon Chapeau", 
		augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%'}
	}
	Taeon.Head.SS = {
		name="Taeon Chapeau", 
		augments={'"Snapshot"+5','"Snapshot"+5'}
	}
    --------------
    --  Body    --
    --------------
	Taeon.Body.FC = {
		name="Taeon Tabard", 
		augments={'Accuracy+24','"Fast Cast"+5','Phalanx +3'}
	}
	Taeon.Body.WS = { 
		name="Taeon Tabard", 
		augments={'Attack+23','Weapon Skill Acc.+18','Weapon skill damage +3%'}
	}
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
--------------------------------------------------------------------------
--                        Augmented Adoulin Gear                        --
--------------------------------------------------------------------------
	Leyline = {}
	Leyline.FC = {
		name="Leyline Gloves", 
		augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2'}
	}