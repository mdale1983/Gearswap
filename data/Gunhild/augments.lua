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
    Lugh = {}
	Alau = {}
	Nant = {}
----------------------
--  Scholar Capes   --
----------------------
	Lugh.FC = { 
		name="Lugh's Cape", 
		augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+4','"Fast Cast"+10'}
	}
-------------------------
--  White Mage Capes   --
-------------------------
    Alau.FC = {
	
	}
--------------------------
--  Geomancer Capes     --
--------------------------
	Nant.FC = {
		name="Nantosuelta's Cape", 
		augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10'}
	}
	Nant.Pet = {
		name="Nantosuelta's Cape", 
		augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%'}
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
    Merl.Feet.Burst = {
		name="Merlinic Crackows", 
		augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+6%','INT+4'}
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
--                        Augmented Escha Gear                          --
--------------------------------------------------------------------------
	Telc = {}
	Telc.Head = {}
	Telc.Body = {}
	Telc.Hands = {}
	Telc.Legs = {}
	Telc.Feet = {}
	---------------
    --   Head    --
    ---------------
    Telc.Head.Regen = {
		name="Telchine Cap", 
		augments={'"Cure" potency +6%','"Regen" potency+3'}
	}
	Telc.Head.Dur = { 
		name="Telchine Cap", 
		augments={'Enh. Mag. eff. dur. +10'}
	}
    --------------
    --  Body    --
    --------------
    Telc.Body.Regen = {
		name="Telchine Chas.", 
		augments={'"Regen" potency+3'}
	}
	Telc.Body.Dur = {
		name="Telchine Chas.", 
		augments={'Enh. Mag. eff. dur. +8'}
	}
    --------------
    --  Hand    --
    --------------
	Telc.Hands.Regen = { 
		name="Telchine Gloves", 
		augments={'"Cure" potency +2%','"Regen" potency+3'}
	}
	Telc.Hands.Dur = { 
		name="Telchine Gloves", 
		augments={'"Cure" potency +6%','Enh. Mag. eff. dur. +10'}
	}
	--------------
    --  Legs    --
    --------------
	Telc.Legs.Dur = { 
		name="Telchine Braconi", 
		augments={'"Cure" potency +4%','Enh. Mag. eff. dur. +9'}
	}
	Telc.Legs.Regen = {
		name="Telchine Braconi", 
		augments={'Pet: "Regen"+3','"Regen" potency+3'}
	}
	--------------
    --  Feet    --
    --------------
	Telc.Feet.Dur = {
		name="Telchine Pigaches", 
		augments={'Enh. Mag. eff. dur. +9'}
	}
	Telc.Feet.Regen = {
		name="Telchine Pigaches", 
		augments={'Pet: "Regen"+3','"Regen" potency+3'}
	}