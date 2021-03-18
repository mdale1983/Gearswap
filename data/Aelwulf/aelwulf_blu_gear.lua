include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
	sets.idle = {
	    ammo="Staunch tathlum",
        head="Ayanmo zucchetto +1",
		neck="Loricate torque +1",
		ear1="Etiolation Earring",
		ear2="Hearty earring",
		body="Ayanmo corazza +2",
		hands="Malignance gloves",
		ring1="Warden's ring",
		ring2="Defending Ring",
        back="Solemnity cape",
		waist="Flume Belt",
		legs="Carmine Cuisses +1",
		feet=""
	}
	sets.MagicEva = set_combine(sets.idle, {
		head="Rabid visor",
		body="Emet harness +1",
		ring1="Gelatinous ring +1",
	})
	sets.weapons = {
		main="Vampirism",
		sub="Vampirism",
	}
	sets.Kiting = { 
		legs="Carmine cuisses"
	}
----------------------------------
--      Job Ability sets        --
----------------------------------
	sets.precast.JA['Burst Affinity'] = {feet="Mavi Basmak +1"}
    sets.precast.JA['Chain Affinity'] = {
		head="Mavi Kavuk +2", 
		feet="Assim. Charuqs +1"
	}
    sets.precast.JA['Convergence'] = {
		head="Luhlaza Keffiyeh"
	}
    sets.precast.JA['Diffusion'] = {feet="Luhlaza Charuqs"}
    sets.precast.JA['Enchainment'] = {body="Luhlaza Jubbah"}
    sets.precast.JA['Efflux'] = {legs="Mavi Tayt +1"}
    sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands +2"}
----------------------------------
--	Learning Blue Mage Spells	--
----------------------------------
    sets.Learning = set_combine(sets.engaged.DW, {
		head="Luhlaza Keffiyeh",
		ammo="Mavi Tathlum",
		body="Assimilator's Jubbah +1",
		hands="Assimilator's Bazubands +1",
		back="Cornflower cape",
		legs="Mavi Tayt +2",
		feet="Luhlaza charuqs"
	})
	sets.Learning.DW = set_combine(sets.engaged.DW, {
		head="Luhlaza Keffiyeh",
		ammo="Mavi Tathlum",
		body="Assimilator's Jubbah +1",
		hands="Assim. Bazu. +1",
		back="Cornflower cape",
		legs="Mavi Tayt +2",
		feet="Luhlaza charuqs"
	})
--------------------------------------
--      Casting Gear sets           --
--------------------------------------
    sets.precast.FC = set_combine(sets.precast.MagicAccuracy, {
		head="Carmine mask +1",
		body="Taeon tabard",
		hands="Leyline gloves",
		legs="Ayanmo cosciales +2",
		feet="Carmine greaves +1",
		ammo="Impatiens",
		neck="Voltsurge torque",
		ear1="Etiolation earring",
		ear2="Loquacious earring",
		ring1="Evanescence ring",
		ring2="Kishar ring",
		waist="Ioskeha belt"
	})
	------------------
	-- Midcast Sets	--
	------------------
    sets.midcast.FastRecast = {
        head="Carmine Mask",
		ear2="Loquacious Earring",
        body="Taeon tabard",
		hands="Mavi Bazubands +1",
		ring1="Prolix Ring",
        back="Swith Cape +1",
		waist="Hurch'lan Sash",
		legs="Enif Cosciales",
		feet="Carmine greaves"
	}
	sets.midcast['Blue Magic'] = {}
	sets.midcast['Stoneskin'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		body="Haruspex coat"
	})
	sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
	------------------------------
	-- Blue Magic Midcast Sets	--
	------------------------------
	sets.midcast['Blue Magic'].Physical = {
		ammo="Mavi Tathlum",
        head="Whirlpool Mask",
		neck="Ej Necklace",
		ear1="Heartseeker Earring",
		ear2="Steelflash Earring",
        body="Vanir Cotehardie",
		hands="Buremte Gloves",
		ring1="Rajas Ring",
		ring2="Spiral Ring",
        back="Zaffre Cape",
		waist="Caudata Belt",
		legs="Nahtirah Trousers",
		feet="Qaaxo Leggings"
	}
	sets.midcast['Blue Magic'].PhysicalAcc = {
		ammo="Jukukik Feather",
        head="Whirlpool Mask",
		neck="Ej Necklace",
		ear1="Heartseeker Earring",
		ear2="Steelflash Earring",
        body="Luhlaza Jubbah",
		hands="Buremte Gloves",
		ring1="Rajas Ring",
		ring2="Patricius Ring",
        back="Letalis Mantle",
		waist="Hurch'lan Sash",
		legs="Manibozho Brais",
		feet="Qaaxo Leggings"
	}
	----------------------------------------------------------
	--			Blue Maigc Physical Spells Gearsets			--
	--	'Battle Dance','Bloodrake','Death Scissors',		--
	--	'Dimensional Death','Empty Thrash','Quadrastrike',	--
	--	'Sinker Drill','Spinal Cleave','Uppercut',			--
	--	'Vertical Cleave'									--
	----------------------------------------------------------
	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,{
		ammo="Mantoptera eye",
		head="Despair helm",
		body="Rawhide vest",
		hands="Qaaxo mitaines",
		ear1="Flame earring",
		legs="Telchine braconi",
		feet="Carmine greaves",
		wasit="Chuq'aba belt",
	})
	------------------------------------------------------------------
	--			Blue Magic Physical Dexterity Gearsets				--
	--	'Amorphic Spikes','Asuran Claws','Barbed Crescent',			--
	--	'Claw Cyclone','Disseverment','Foot Kick','Frenetic Rip',	--
	--	'Goblin Rush','Hysteric Barrage','Paralyzing Triad',		--
	--	'Seedspray','Sickle Slash','Smite of Rage',					--
	--	'Terror Touch','Thrashing Assault','Vanity Dive'			--
	------------------------------------------------------------------
	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,{
		head="Despair helm",
		body="Rawhide vest",
		hands="Qaaxo mitaines",
		ear1="Flame earring",
		legs="Telchine braconi",
		feet="Carmine greaves",
		wasit="Grunfeld rope",
	})
	----------------------------------------------------------
	--			Blue Mage Physical Vitality Gearsets		--
	--	'Body Slam','Cannonball','Delta Thrust',			--
	--	'Glutinous Dart', 'Grand Slam','Power Attack',		--
	--	'Quad. Continuum', 'Sprout Smack','Sub-zero Smash'	--
	----------------------------------------------------------
    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
        {
		body="Vanir Cotehardie",
		hands="Assimilator's Bazubands +1",
		back="Iximulew Cape"})
	------------------------------------------------------
	--		Blue Mage Physical Agility Gearsets			--
	--	'Benthic Typhoon','Feather Storm','Helldive',	--
	--	'Hydro Shot','Jet Stream','Pinecone Bomb',		--
	--	'Spiral Spin','Wild Oats'						--
	------------------------------------------------------
    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,{
		body="Vanir Cotehardie",
		hands="Iuitl Wristbands",
		ring2="Stormsoul Ring",
        waist="Chaac Belt",
		feet="Iuitl Gaiters +1"
	})
	--------------------------------------------------
	--		Blue Mage Physical INT Gearsets			--
	--------------------------------------------------
    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,{
		ear1="Psystorm Earring",
		body="Vanir Cotehardie",
		hands="Assimilator's Bazubands +1",
        ring2="Icesoul Ring",
		back="Toro Cape",
		feet="Hagondes Sabots"
	})
	------------------------------------------------------
	--		Blue Mage Physical Mind Gearsets			--
	------------------------------------------------------
	 sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,{
		ear1="Lifestorm Earring",
		body="Vanir Cotehardie",
		hands="Assimilator's Bazubands +1",
        ring2="Aquasoul Ring",
		back="Refraction Cape"
	})
	--------------------------------------------------
	--		Blue Mage Physical CHR Gearsets			--
	--------------------------------------------------
    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,    {
		body="Vanir Cotehardie",
		hands="Assimilator's Bazubands +1",
		back="Refraction Cape",
        waist="Chaac Belt"
	})
	--------------------------------------------------
	--		Blue Mage Physical HP Gearsets			--
	--------------------------------------------------
    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)
	------------------------------------------------------
	--	Blue Magic Magicl Gearsets	   					--
	--	'Blastbomb','Blazing Bound','Bomb Toss',		--
	--	'Cursed Sphere', 'Dark Orb','Death Ray',		--	
	--	'Diffusion Ray','Droning Whirlwind', 			--
	--	'Embalming Earth','Firespit','Foul Waters',		--
	--	'Ice Break', 'Leafstorm','Maelstrom',			--
	--	'Rail Cannon','Regurgitation', 					--
	--	'Rending Deluge','Retinal Glare',				--
	--	'Tem. Upheaval', 'Water Bomb','Spectral Floe',	--
	-- 	'Tenebral Crush','Entomb', 'Subduction',		--
	-- 	'Anvil Lightning', 'Blinding Fulgor', 			--
	--  'Searing Tempest', 'Scouring Spate'				--
	------------------------------------------------------
    sets.midcast['Blue Magic'].Magical = {
		ammo="Ghastly tathlum +1",			
		neck="Sanctity necklace",	
		ear1="Friomisi earring", 	
		ear2="Hecate's Earring",
		head="Jhakri coronal +1",
        body="Jhakri robe +1", 		
		hands="Amalric gages", 		
		ring1="Acumen Ring", 		
		ring2="Strendu Ring", 	
		waist="Eschan stone", 	
		legs="Jhakri slops +1",		
		feet="Jhakri pigaches +1"	
	}
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
        {
		body="Vanir Cotehardie",
		ring1="Sangoma Ring",
		legs="Iuitl Tights",
		feet="Mavi Basmak +2"
	})
	------------------------------------------
	--	***** Magical Mind Spells *****		--
	--	'Acrid Stream','Evryone. Grudge',	--
	--	'Magic Hammer','Mind Blast'			--
	------------------------------------------
    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
        {ring1="Aquasoul Ring"})

    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical)

    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
        {ring1="Spiral Ring"})
	------------------------------------------
	--	 ***** Magical Dex Spells *****		--
	--	'Charged Whisker','Gates of Hades'	--
	------------------------------------------
    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical)
	----------------------------------------------------------------------
	-- 			***** Magical Accuracy Spells *****						--
	--	'1000 Needles','Absolute Terror','Actinic Burst',				--
	--	'Auroral Drape','Awful Eye','Blank Gaze',						--
	--	'Blistering Roar','Blood Drain','Blood Saber',					--
	--	'Chaotic Eye','Cimicine Discharge','Cold Wave',					--
	--	'Corrosive Ooze','Demoralizing Roar','Digest','Dream Flower',	--
	--	'Enervation','Feather Tickle','Filamented Hold',				--
	--	'Frightful Roar','Geist Wall','Hecatomb Wave',					--
	--	'Infrasonics','Jettatura','Light of Penance','Lowing',			--
	--	'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis',				--
	--	'Reaving Wind','Sandspin','Sandspray',							--
	--	'Sheep Song','Soporific','Sound Blast','Stinking Gas',			--
    --   'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'		--
	----------------------------------------------------------------------
    sets.midcast['Blue Magic'].MagicAccuracy = {
		ammo="Mavi Tathlum",
        head="Ayanmo zucchetto +1",
		neck="Sanctity necklace",
		ear1="Gwati Earring",
		ear2="Psystorm Earring",
        body="Ayanmo corazza +1",
		hands="Ayanmo manopolas +1",
		ring2="Strendu ring",
		waist="Yamabuki-no-obi",
        back="Cornflower cape",
		legs="Ayanmo cosciales +1",
		feet="Ayanmo gambieras +1"
	}
    -- Breath Spells --
    --[[ 
		'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct','Thunder Breath','Vapor Spray',
		'Wind Breath'
	]]
    sets.midcast['Blue Magic'].Breath = {
		ammo="Mavi Tathlum",
        head="Luhlaza Keffiyeh",
		neck="Ej Necklace",
		ear1="Lifestorm Earring",
		ear2="Psystorm Earring",
        body="Vanir Cotehardie",
		hands="Assimilator's Bazubands +1",
		ring1="K'ayres Ring",
		ring2="Beeline Ring",
        back="Refraction Cape",
		legs="Enif Cosciales",
		feet="Iuitl Gaiters +1"
		}

    ------------------------------------------------------------------
    --					Other Types of Spells						--
	--	'Blitzstrahl','Frypan','Head Butt','Sudden Lunge',			--
	--	'Tail slap','Temporal Shift','Thunderbolt','Whirl of Rage'	--
	------------------------------------------------------------------
    sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,
        {waist="Chaac Belt"})
        
    sets.midcast['Blue Magic']['White Wind'] = {
        head="Whirlpool Mask",
		neck="Lavalier +1",
		ear1="Bloodgem Earring",
		ear2="Loquacious Earring",
        body="Vanir Cotehardie",
		hands="Buremte Gloves",
		ring1="K'ayres Ring",
		ring2="Meridian Ring",
        back="Fravashi Mantle",
		waist="Hurch'lan Sash",
		legs="Enif Cosciales",
		feet="Hagondes Sabots"
	}
	----------------------------------------------------------
	--				Blue Mage Healing Gearsets				--
	--	'Healing Breeze','Magic Fruit','Plenilune Embrace',	--
	--	'Pollen', 'Restoral','White Wind','Wild Carrot'		--
	----------------------------------------------------------
    sets.midcast['Blue Magic'].Healing = {
        head="Uk'uxkaj Cap",
		ear1="Lifestorm Earring",
		ear2="Loquacious Earring",
        body="Vanir Cotehardie",
		hands="Telchine gloves",
		ring1="Etana Ring",
		ring2="Gelatinous ring +1",
        back="Solemnity cape",
		legs="Hagondes Pants",
		feet="Hagondes Sabots",
		waist="Gishdubar sash"
	}
	----------------------------------------------------------
	--				Blue Skill Based Buff					--
	--	'Barrier Tusk','Diamondhide','Magic Barrier',		--
	--	'Metallic Body','Plasma Charge','Pyric Bulwark',	--
	--	'Reactor Cool',										--
	----------------------------------------------------------
    sets.midcast['Blue Magic'].SkillBasedBuff = {	
		ammo="Mavi Tathlum",		
		head="Luhlaza Keffiyeh", 	
		body="Assim. Jubbah +1",	
		legs="Mavi tayt +2",		
		feet="Luhlaza charuqs",
		ring1="Etana Ring",		
		back="Cornflower cape"		
	}
    sets.midcast['Blue Magic'].Buff = {
		waist="Gishdubar Sash"
	}
	sets.midcast['Enhancing Magic'] = {
		main="Pukulatmuj +1",
		sub="Pukulatmuj",
		ammo="Impatiens", 			--10%
		head="Carmine mask +1",
		body="Futhark coat +3",
		hands="Runeist mitons",
		legs="Futhark trousers +1",
		waist="Siegel sash",
		neck="Incanter's torque",
		ear1="Etiolation earring",
		ear2="Halasz earring",		--05%
		ring1="Defending ring",
		ring2="Evanescence ring",
		back="Merciful cape"
	}
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		head="Futhark bandeau +2",
		body="Taeon tabard",
		hands="Taeon gloves",
		legs="Taeon tights",
		feet="Taeon boots"
	})
-------------------------------
--      Engaged sets         --
------------------------------- 
    sets.engaged = {
		ammo="Ginsen",
        head="Adhemar bonnet +1",
		body="Adhemar jacket +1",
		hands="Adhemar wristbands +1",
		legs="Samnuha tights",
		neck="Lissome necklace",
        ear1="Brutal earring",
        ear2="Telos earring",
        ring1="Chirich ring",
        ring2="Epona's ring",
        waist="Grunfeld rope",
	}
	sets.engaged.DW = set_combine(sets.engaged, {
	-- No Magic Haste 
		body="Adhemar jacket +1",	--5
		ear2="Suppanomimi",			--5
		legs="Carmine Cuisses +1",	--6
		ear1="Eabani Earring", 		--4
    })-- 49% DW Needed
	sets.engaged.MagicEva = { 
        head="Meghanada visor +1",
        neck="Loricate torque +1",
        ear1="Cessance Earring",
		ear2="Etiolation earring",
        body="Emet harness +1",
        ring1="Vengeful Ring",
        ring2="Gelatinous ring +1",
    	back="Solemnity Cape",
        waist="Flume Belt",
        legs="Carmine Cuisses +1",
	}
    sets.engaged.DW.Acc = set_combine(sets.engaged.DW, {
		ammo="Honed tathlum",
		head="Ayanmo zucchetto +1",
		neck="Iqabi necklace",
        ear1="Zennaroi earring",
        ear2="Mache earring",
        back="Rosmerta's cape",
        waist="Grunfeld rope",
		feet="Ayanmo gambieras +1"
	})	
	sets.engaged.DW.Learning = set_combine(sets.engaged.DW, {
		ammo="Mavi Tathlum",
		body="Assimilator's Jubbah +1",
		hands="Assim. Bazu. +1",
		back="Cornflower cape",
		feet="Luhlaza charuqs"
	})
----------------------------------------------
--          Weaponskill Gearsets            --
----------------------------------------------
	sets.precast.WS = {
        head="Herculean helm",
		body="Rawhide vest",
		hands="Herculean gloves",
		legs="Adhemar kecks",
		feet="Ayanmo gambieras +1",
		back="Kayapa  mantle",
		waist="Fotia belt",
		ear1="Mache earring",
		ear2="Bladeborn earring",
		ring1="Rajas ring",
		ring2="Vulcan's ring",
		neck="Caro necklace"
	}
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		head="Adhemar bonnet +1",
		body="Adhemar jacket +1",
		back="Rosmerta's cape",
		waist="Fotia belt",
		ear1="Ishvara earring",
		ear2="Bladeborn earring",
		ring1="Karieyh ring",
		ring2="Ilabrat ring",
		neck="Fotia gorget"
	})
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {	
		head="Adhemar bonnet +1",
		body="Adhemar jacket +1",
		back="Rosmerta's cape",
		waist="Fotia belt",
		ear1="Ishvara earring",
		ear2="Bladeborn earring",
		ring1="Karieyh ring",
		ring2="Ilabrat ring",
		neck="Fotia gorget"
	})
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
		ammo="Jukukik feather",
		head="Adhemar bonnet +1",
		body="Adhemar jacket +1",
		hands="Adhemar wristbands +1",
		neck="Fotia Gorget",
		ring1="Ilabrat Ring",
		ring2="Epona's ring",
		ear1="Brutal earring",
		back="Rosmerta cape",
		legs="Samnuha tights",
		waist="Fotia Belt"
	})
----------------------
--	Misc Gearsets	--
----------------------
	sets.Night = set_combine(sets.idle, {
		hands="Serpentes cuffs"
	})
	sets.Day = set_combine(sets.idle, {
		feet="Serpentes sabots"
	})
	sets.CapacityMantle = {
		back={ 
			name="Mecisto. Mantle", 
			augments={'Cap. Point+49%','MP+20','DEF+3',}}
	}
	sets.refresh = { 
		head="Rawhide mask",
		body="Mirage Jubbah +2",
		--waist="Fucho-no-obi"
	}
	sets.latent_refresh = {
		waist="Fucho-no-obi"
	}
	sets.DA = {
		ear1="Brutal earring", 
		ear2="Cessance earring"
	} 