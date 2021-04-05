include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = { --[[	50% PDT | 27% MDT | 547 MagicEva	]]
	    ammo={ name="Staunch Tathlum", priority=1},
        head={ name="Futhark bandeau +2", priority=6},
		body={ name="Futhark coat +3", priority=15},
		hands={ name="Turms mittens +1", priority=7},
		legs={ name="Erilaz leg guards +1", priority=9},
		feet={ name="Turms leggings +1", priority=8},
		neck={ name="Futhark torque +1", priority=5},
		ear1={ name="Odnowa earring", priority=13},
		ear2={ name="Odnowa Earring +1", priority=14},
		ring1={ name="Moonbeam Ring", priority=12},
		ring2={ name="Moonbeam Ring", priority=11}, 
		waist={ name="Flume Belt", priority=1},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20/Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%'}, priority=10},
	}
	sets.idle.MagicEva = set_combine(sets.idle, { --[[	45% PDT | 27% MDT | 593 MagicEva	]]
		ammo={ name="Staunch Tathlum", priority=1},
        head={ name="Turms cap +1", priority=11},
		body={ name="Futhark coat +3", priority=15},
		hands={ name="Turms mittens +1", priority=7},
		legs={ name="Erilaz leg guards +1", priority=9},
		feet={ name="Turms leggings +1", priority=8},
		ear1={ name="Odnowa earring", priority=13},
		ear2={ name="Odnowa Earring +1", priority=14},
		ring1={ name="Moonbeam Ring", priority=12},
		ring2={ name="Moonbeam Ring", priority=11}, 
		waist={ name="Flume Belt", priority=1},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20/Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%'}, priority=10},
	})
	sets.idle.BuffDuration = set_combine(sets.idle, {
		head={ name="Erilaz Galea +1", priority=1},
		ring2={ name="Moonbeam Ring", priority=11}, 
		legs={ name="Futhark trousers +1", priority=1},
	})
	sets.Kiting = { 
		legs={ name="Carmine cuisses +1", priority=1},
	}
	sets.Kiting.night = { 
		legs={ name="Carmine cuisses +1", priority=1},
	}
------------------
--	Weapon Sets	--
------------------
	sets.weapons.Lionheart = { 
		main="Lionheart",
		sub="Utu Grip"
	}
	sets.weapons.Aettir = { 
		main="Aettir",
		sub="Mensch strap +1"
	}
	sets.weapons.Epeolatry = { 
		main="Epeolatry",
		sub="Utu Grip"
	}
--------------------------
-- 	Enmity Gear-set 	--
--------------------------
	sets.Enmity = {
		head={ name="Halitus helm", priority=12},
		body={ name="Emet harness +1", priority=9},
		hands={ name="Kurys gloves", priority=6},
		legs={ name="Erilaz leg guards +1", priority=11},
		feet={ name="Erilaz greaves +1", priority=5},
		ammo={ name="Sapience orb", priority=1},
		neck={ name="Moonlight necklace", priority=1},
		ear1={ name="Cryptic earring", priority=8},
		ear2={ name="Odnowa Earring +1", priority=15},
		ring1={ name="Moonbeam Ring", priority=14},
		ring2={ name="Eihwaz ring", priority=10},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20/Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%'}, priority=12},
		waist={ name="Kasiri belt", priority=7},
	}
------------------------------
--	Spell Interuption Down	--
------------------------------
	--[[sets.SIR = {
		ammo={ name="Impatiens", priority=1}, 			--10%
		hands={ name="Taeon gloves", priority=1},		--10%
		legs={ name="Carmine cuisses +1", priority=1},	--20%
		feet={ name="Taeon boots", priority=1},			--09%
		ear2={ name="Halasz earring", priority=1},		--05%
		ring1={ name="Evanescence ring", priority=1},	--05%
		waist={ name="Oneiros belt", priority=1},		--08%
	}]]
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
	sets.precast.JA['Lunge'] = set_combine(sets.Enmity, {
		head={ name="Herculean Helm",augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Weapon skill damage +3%','STR+6','"Mag.Atk.Bns."+7'}, priority=1},
		body={ name="Samnuha coat", priority=1},
		hands={ name="Herculean Gloves",augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic dmg. taken -1%','Mag. Acc.+10','"Mag.Atk.Bns."+12'}, priority=1},
		legs={ name="Herculean Trousers",augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Weapon skill damage +2%','Mag. Acc.+9','"Mag.Atk.Bns."+11'}, priority=1},
		feet={ name="Adhemar gamashes", priority=1},
		ammo={ name="Seething bomblet", priority=1},
		neck={ name="Sanctity necklace", priority=1},
		ring1={ name="Acumen ring", priority=1},
		ring2={ name="Moonbeam Ring", priority=11}, 
		ear1={ name="Hecate's earring", priority=1},
		ear2={ name="Friomisi earring", priority=1},
		back={ name="Evasionist's cape", priority=1},
		waist={ name="Eschan stone", priority=1},
	})
	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {
		body={ name="Runeist coat +1", priority=15},
		legs={ name="Futhark trousers +1", priority=14},
		back={ name="Ogma's cape",augments={'HP+60','Accuracy+20 Attack+20','HP+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}, priority=13},
	})
	sets.precast.JA['Valiance'] = set_combine(sets.Enmity, {
		body={ name="Runeist coat +1", priority=15},
		legs={ name="Futhark trousers +1", priority=14},
		back={ name="Ogma's cape",augments={'HP+60','Accuracy+20 Attack+20','HP+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}, priority=13},
	})
	sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {
		head={ name="Futhark bandeau +2", priority=15},
	})
	sets.precast.JA['Gambit'] = set_combine(sets.Enmity, {
		hands={ name="Runeist mitons +1", priority=1},
	})
	sets.precast.JA['Rayke'] = set_combine(sets.Enmity, {
		feet={ name="Futhark boots", priority=1},
	})
	sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {
		feet={ name="Runeist bottes +1", priority=1},
	})
	sets.precast.JA['Embolden'] = set_combine(sets.Enmity, {
		back={ name="Evasionist's cape", priority=1},
		
	})
	sets.precast.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {
		head={ name="Erilaz Galea +1", priority=1},
		legs={ name="Runeist trousers +1", priority=1},
		neck={ name="Incanter's torque", priority=1},
		
	})
	sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
		body={ name="Futhark coat +3", priority=15},
	})
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {
		body={ name="Futhark coat +3", priority=15},
	})
	sets.precast.JA['Swordplay'] =set_combine(sets.Enmity, {
		hands={ name="Futhark mitons", priority=1},
	})
	sets.precast.JA['One For All'] = sets.Enmity
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity, { })
	sets.precast.JA['Ignis'] = sets.Enmity
	sets.precast.JA['Gelus'] = sets.Enmity
	sets.precast.JA['Flabra'] = sets.Enmity
	sets.precast.JA['Tellus'] = sets.Enmity
	sets.precast.JA['Sulpor'] = sets.Enmity
	sets.precast.JA['Unda'] = sets.Enmity
	sets.precast.JA['Lux'] = sets.Enmity
	sets.precast.JA['Tenebrae'] = sets.Enmity
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
	sets.precast.FC = { --67% Fast Cast
		ammo={ name="Sapience orb", priority=1},
		head={ name="Runeist's bandeau +2", priority=14},
		body={ name="Taeon tabard", priority=12},
		hands={ name="Leyline gloves", priority=9},
		legs={ name="Ayanmo cosciales +2", priority=10},
		feet={ name="Carmine greaves +1", priority=13},
		neck={ name="Voltsurge torque", priority=1},
		ring1={ name="Weatherspoon ring", priority=1},
		back={ name="Moonbeam cape", priority=15},
		waist={ name="Oneiros belt", priority=11},
	}
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		hands={ name="Runeist mitons", priority=1},
		legs={ name="Futhark trousers +1", priority=1},
		waist={ name="Siegel sash", priority=1},
	})
	sets.precast.Foil = sets.precast.FC
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
	sets.midcast.EnhancingDuration = set_combine(sets.idle, {
		head={ name="Erilaz Galea +1", priority=1},
		body={ name="Futhark coat +3", priority=14},
		hands={ name="Runeist Mitons +1", priority=1},
		legs={ name="Futhark trousers +1", priority=1},
		feet={ name="Erilaz greaves +1", priority=1},
		neck={ name="Incanter's Torque", priority=1},
		back={ name="Moonbeam cape", priority=15},
	})
	sets.midcast['Enhancing Magic'] = {
		ammo={ name="Impatiens", priority=1}, 			--10%
		head={ name="Carmine mask +1", priority=1},
		body={ name="Futhark coat +3", priority=15},
		hands={ name="Runeist mitons", priority=1},
		legs={ name="Futhark trousers +1", priority=1},
		feet={ name="Taeon.feet.Phalanx", priority=1},
		waist={ name="Siegel sash", priority=1},
		neck={ name="Incanter's torque", priority=1},
		ear1={ name="Odnowa earring", priority=13},
		ear2={ name="Odnowa Earring +1", priority=14},		--05%
		ring1={ name="Moonbeam Ring", priority=12},
		ring2={ name="Moonbeam Ring", priority=11},
		back={ name="Merciful cape", priority=1},
	}
	sets.midcast['Temper'] = set_combine(sets.midcast['Enhancing Magic'], {
        head={ name="Carmine Mask +1", priority=1},
        body={ name="Futhark coat +3", priority=15},
        hands={ name="Runeist Mitons +1", priority=1},
        legs={ name="Carmine Cuisses +1", priority=1},
		ear1={ name="Andoaa earring", priority=1},
		ammo={ name="Staunch tathlum", priority=1},
		waist={ name="Oneiros belt", priority=1},
		
    })
	sets.midcast['Cocoon'] = set_combine(sets.SIR, {
		head={ name="Futhark bandeau +2", priority=6},
		body={ name="Futhark coat +3", priority=15},
		ring1={ name="Moonbeam Ring", priority=12}, 
		ring2={ name="Moonbeam Ring", priority=11}, 
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20/Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%'}, priority=1},
		neck={ name="Futhark torque +1", priority=1},
	})
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		head={ name="Futhark bandeau +2", priority=9},
		body={ name="Taeon tabard", priority=8},
		hands={ name="Taeon gloves", priority=6},
		legs={ name="Taeon tights", priority=7},
		feet={ name="Taeon boots", priority=5},
		ring1={ name="Moonbeam Ring", priority=12},
		ring2={ name="Moonbeam Ring", priority=11},
		ear1={ name="Odnowa earring", priority=13},
		ear2={ name="Odnowa Earring +1", priority=14},
		back={ name="Moonbeam cape", priority=15},
		waist={ name="Oneiros belt",  priority=10},
	})
	sets.midcast.Regen = set_combine(sets.SIR, {
		head={ name="Runeist bandeau +2", priority=15},
	})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head={ name="Erilaz Galea +1", priority=15},
		waist={ name="Gishdubar sash",  priority=1},
	})
	sets.midcast.Flash = sets.Enmity
	sets.midcast.Foil = sets.Enmity
	sets.midcast.Stun = sets.Enmity
	sets.midcast['Soporific'] = sets.Enmity
	sets.midcast['Sheep Song'] = sets.Enmity
	sets.midcast['Soporific'] = sets.Enmity
	sets.midcast['Blank Gaze'] = sets.Enmity
    sets.midcast['Geist Wall'] = sets.Enmity
    sets.midcast['Jettatura'] = sets.Enmity
	sets.midcast['Wild Carrot'] = set_combine(sets.SIR, { 
		head={ name="Futhark bandeau +2", priority=6},
		body={ name="Futhark coat +3", priority=15}, 
		ring1={ name="Moonbeam Ring", priority=12},
		ring2={ name="Kunaji ring", priority=1},
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20/Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%'},  priority=1},
	})
	sets.midcast['Pollen'] = sets.midcast['Wild Carrot']
--------------------------
-- 	engaged gear=sets 	--
--------------------------
	sets.engaged = {
		ammo={ name="Ginsen", priority=1},
		head={ name="Adhemar bonnet +1", priority=1},
		body={ name="Adhemar jacket +1", priority=1},
		hands={ name="Herc.hands.WS",  priority=1},
		legs={ name="Samnuha tights", priority=1},
		feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+3','STR+10','Accuracy+10'},  priority=1},
		neck={ name="Lissome necklace", priority=1},
		ear1={ name="Telos earring", priority=1},
		ear2={ name="Cessance Earring", priority=1},
		ring1={ name="Chirich Ring +1", priority=1},
		ring2={ name="Chirich Ring +1", priority=1},
		back={ name="Ogma's cape",augments={'HP+60','Accuracy+20 Attack+20','HP+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}, priority=1},
		waist={ name="Ioskeha belt +1", priority=1},
	}
	sets.engaged.TankHyb = set_combine(sets.engaged.PDT, { --[[ 45% PDT | 27% MDT | 593 MagicEva	]]
		ammo={ name="Staunch tathlum", priority=1},
		head={ name="Turms cap +1", priority=1},
		neck={ name="Futhark torque +1", priority=5},
		ear1={ name="Odnowa earring", priority=13},
		ear2={ name="Odnowa Earring +1", priority=14},
		body={ name="Futhark coat +3", priority=15},
		hands={ name="Turms mittens +1", priority=7},
		ring1={ name="Moonbeam Ring", priority=12},
		ring2={ name="Moonbeam Ring", priority=11},
		back={ name="Ogma's cape",augments={'HP+60','Accuracy+20 Attack+20','HP+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}, priority=1},
		waist={ name="Flume belt", priority=1},
		legs={ name="Erilaz leg guards +1", priority=9},
		feet={ name="Turms leggings +1",  priority=1},
	})
------------------------------
-- 	Weaponskill Gear-Sets 	--
------------------------------
	sets.precast.WS['Dimidiation'] = {
		head={ name="Lustratio cap +1", priority=1},
		body={ name="Adhemar jacket +1", priority=1},
		hands={ name="Meg. gloves +2", priority=1},
		legs={ name="Meghanada chausses +2", priority=1},
		feet={ name="Lustratio leggings +1", priority=1},
		ammo={ name="Knobkierrie", priority=1},
		neck={ name="Fotia gorget", priority=1},
		ring1={ name="Regal ring", priority=1},
		ring2={ name="Karieyh ring", priority=1},
		ear1={ name="Ishvara earring", priority=1},
		ear2={ name="Brutal earring", priority=1},
		back={ name="Ogma's cape",augments={'HP+60','Accuracy+20 Attack+20','HP+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}, priority=1},
		waist={ name="Fotia belt", priority=1},
	}
	sets.precast.WS['Resolution'] = {
		head={ name="Adhemar bonnet +1", priority=1},
		body={ name="Adhemar Jacket +1", priority=1},
		hands={ name="Adhemar wristbands +1", priority=1},
		legs={ name="Samnuha tights", priority=1},
		feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+3','STR+10','Accuracy+10'}, priority=1},
		ammo={ name="Knobkierrie", priority=1},
		neck={ name="Anu torque", priority=1}, 
		ring1={ name="Regal ring", priority=1},
		ring2={ name="Niqmaddu ring", priority=1},
		ear1={ name="Brutal earring", priority=1},
		ear2={ name="Cessance earring", priority=1},
		back={ name="Ogma's cape",augments={'HP+60','Accuracy+20 Attack+20','HP+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}, priority=1},
		waist={ name="Fotia belt", priority=1},
	}
----------------------
-- 	Misc Gear-sets 	--
----------------------
	sets.Reive = {
		neck={ name="Ygna's resolve +1", priority=1},
	}
	sets.buff.Doom = {
		ring1={ name="Purity Ring", priority=1},
		ring2={ name="Saida Ring", priority=1},
		waist={ name="Gishdubar sash", priority=1},
	}
	sets.Asleep = set_combine(sets.engaged.PDT, {
		head={ name="Frenzy Sallet", priority=1},
	})
	sets.DT = sets.idle.PDT
	sets.CapacityMantle = {
		back={ name="Mecisto. Mantle", priority=1},
	}
	sets.Reive = {
		neck={ name="Ygna's resolve +1", priority=1},
	}
	sets.Protect = { 
	
	}
	sets.latent_refresh = {
		
	}
	sets.refresh = { 
	
	}
	sets.regen = { 
	
	}