include('augments.lua')
----------------------
--	Field/Town Idle	--
----------------------
	sets.idle = {
		main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
        head="Convoker's Horn +3",
		neck="Loricate Torque +1",
		ear1="C. Palug Earring",
		ear2="Ethereal Earring",
        body="Shomonjijoe +1",
		hands=gear.merlinic_refresh_hands,
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
        back="Umbra Cape",
		waist="Regal Belt",
		legs="Assid. Pants +1",
		feet="Baayami Sabots"
	}
	sets.idle.Avatar = {
		main="Gridarvor",
		sub="Oneiros Grip",
		ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
		neck="Caller's Pendant",
		ear1="C. Palug Earring",
		ear2="Evans Earring",
        body="Shomonjijoe +1",
		hands=gear.merlinic_refresh_hands,
		ring1="Evoker's Ring",
		ring2="Stikini Ring +1",
        back="Moonlight Cape",
		waist="Lucidity Sash",
		legs="Assid. Pants +1",
		feet="Convo. Pigaches +3"
	}
	sets.idle.Spirit = {
		main="Gridarvor",sub="Oneiros Grip",
		ammo="Sancus Sachet +1",
        head="Convoker's Horn +3"
		neck="Caller's Pendant",
		ear1="C. Palug Earring",
		ear2="Ethereal Earring",
        body="Shomonjijoe +1",
		hands=gear.merlinic_refresh_hands,
		ring1="Evoker's Ring",
		ring2="Stikini Ring +1",
        back="Conveyance Cape",
		waist="Lucidity Sash",
		legs="Assid. Pants +1",
		feet="Convo. Pigaches +3"
	}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Engaged = {}
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
	sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.resting = {
		main="Chatoyant Staff",
		ammo="Staunch Tathlum +1",
        head="Beckoner's Horn +1",
		neck="Loricate Torque +1",
		ear1="C. Palug Earring",
		ear2="Ethereal Earring",
        body="Shomonjijoe +1",
		hands=gear.merlinic_refresh_hands,
		ring1="Defending Ring",
		ring2="Sheltered Ring",
        back="Umbra Cape",
		waist="Fucho-no-obi",
		legs="Assid. Pants +1",
		feet="Baayami Sabots"
	}
	sets.HPDown = {
		head="Apogee Crown +1",
		ear1="Mendicant's Earring",
		ear2="Evans Earring",
		body="Seidr Cotehardie",
		hands="Hieros Mittens",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Swith Cape +1",
		legs="Apogee Slacks +1",
		feet="Apogee Pumps +1"
	}
    --
	--
	--
		sets.perp = {}
		sets.perp.Day = {}
		sets.perp.Weather = {}
		sets.perp.Carbuncle = {}
		sets.perp.Diabolos = {}
		sets.perp.Alexander = sets.midcast.Pet.BloodPactWard
		sets.perp.staff_and_grip = {}
----------------------------------
--		Job Ability sets		--
----------------------------------
	 sets.precast.JA['Astral Flow'] = {
		head="Glyphic Horn"
	}    
    sets.precast.JA['Elemental Siphon'] = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Esper Stone +1",
        head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Lodurr Earring",
        body="Telchine Chasuble",
		hands="Baayami Cuffs",
		ring1="Evoker's Ring",
		ring2="Stikini Ring +1",
        back="Conveyance Cape",
		waist="Kobo Obi",
		legs="Telchine Braconi",
		feet="Beck. Pigaches +1"
	}
    sets.precast.JA['Mana Cede'] = {
		hands="Beck. Bracers +1"
	}
----------------------------------
--		Pet Gear sets			--
----------------------------------
	-------------------
	-- Pet idle sets --
	-------------------
		sets.idle.Avatar = {
			main="Solstice",
			sub="Genmei Shield",
			range="Dunna",
			head="Azimuth Hood +1",
			body="Mallquis saio +2",
			hands="Geomancy Mitaines +2",
			legs="Assiduity pants +1",
			feet="Bagua sandals +2",
			neck="Bagua Charm +1",
			waist="Isa Belt",
			ear1="Moonshade Earring",
			ear2="Handler's earring +1",
			ring1="Yacuruna ring",
			ring2="Yacuruna Ring",
			back=Nant.Pet
		}
	----------------------
	-- Pet engaged sets --
	----------------------
		sets.idle.Avatar.Engaged = {}
		sets.idle.Avatar.Engaged.Carbuncle = {}
		sets.idle.Avatar.Engaged['Cait Sith'] = {}
--------------------------------------
--		Pre-Cast Gear sets			--
--------------------------------------
	sets.precast.FC = {
		main="Grioavolr",
		sub="Elan strap +1",
		range="Seraphicaller",
		head="Amalric coif",
		body="Shango robe",
		hands="",
		legs="",
		feet="Merlinic crackows",
		neck="Baetyl pendant",
		waist="Channeler's stone",
		ear2="Loquac. Earring",
		ring1="Prolix Ring",
		ring2="Lebeche Ring",
		back=
	}
	sets.precast.BloodPactWard = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Lodurr Earring",
        body="Baayami Robe",
		hands="Baayami Cuffs",
		ring1="Evoker's Ring",
		ring2="Stikini Ring +1",
        back="Conveyance Cape",
		waist="Kobo Obi",
		legs="Baayami Slops",
		feet="Baayami Sabots"
	}	
    sets.precast.BloodPactRage = sets.precast.BloodPactWard
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		main="Serenity",
		sub="Clerisy Strap +1"
	})
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		head=empty,body="Twilight Cloak"
	})       
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
		main="Daybreak",
		sub="Genmei Shield"
	})
--------------------------
--	Midcast Gear Sets 	--
--------------------------
	sets.midcast.FastRecast = {
		main=gear.grioavolr_fc_staff,
		sub="Clerisy Strap +1",
		ammo="Hasty Pinion +1",
		head="Amalric Coif +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Malignance Earring",
		body="Inyanga Jubbah +2",
		hands="Volte Gloves",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
		back="Swith Cape +1",
		waist="Witful Belt",
		legs="Lengo Pants",
		feet="Regal Pumps +1"
	}	
    sets.midcast.Cure = {
		main=gear.gada_healing_club,
		sub="Sors Shield",
		ammo="Hasty Pinion +1",
        head="Vanya Hood",
		neck="Incanter's Torque",
		ear1="Mendicant's Earring",
		ear2="Gifted Earring",
        body="Vrikodara Jupon",
		hands="Telchine Gloves",
		ring1="Janniston Ring",
		ring2="Menelaus's Ring",
        back="Tempered Cape +1",
		waist="Austerity Belt +1",
		legs="Gyve Trousers",
		feet="Vanya Clogs"
	}		
	sets.Self_Healing = {
		neck="Phalaina Locket",
		ring1="Kunaji Ring",
		ring2="Asklepian Ring",
		waist="Gishdubar Sash"
	}
	sets.Cure_Received = {
		neck="Phalaina Locket",
		ring1="Kunaji Ring",
		ring2="Asklepian Ring",
		waist="Gishdubar Sash"
	}
	sets.Self_Refresh = {
		back="Grapevine Cape",
		waist="Gishdubar Sash",
		feet="Inspirited Boots"
	}		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		neck="Debilis Medallion",
		hands="Hieros Mittens",
		back="Oretan. Cape +1",
		ring1="Haoma's Ring",
		ring2="Menelaus's Ring",
		waist="Witful Belt"
	})		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
		main=gear.grioavolr_fc_staff,
		sub="Clemency Grip"
	})
	sets.midcast['Summoning Magic'] = {
		main="Malignance Pole",
		sub="Umbra Strap",
		ammo="Sancus Sachet +1",
        head="Convoker's Horn +3",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Lodurr Earring",
        body="Baayami Robe",
		hands="Baayami Cuffs",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
        back=gear.magic_jse_back,
		waist="Emphatikos Rope",
		legs="Assid. Pants +1",
		feet="Baayami Sabots"
	}				
	sets.midcast.Impact = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head=empty,
		neck="Erra Pendant",
		ear1="Enchntr. Earring +1",
		ear2="Gwati Earring",
		body="Twilight Cloak",
		hands="Regal Cuffs",
		ring1="Metamor. Ring +1",
		ring2="Stikini Ring +1",
		back="Toro Cape",
		waist="Acuity Belt +1",
		legs="Merlinic Shalwar",
		feet=gear.merlinic_aspir_feet
	}			
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod",
		sub="Genmei Shield",
		head="Amalric Coif +1",
		hands="Regal Cuffs",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels"
	})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		ear2="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		legs="Shedir Seraweels"
	})
	--------------------------
	--	Avatar Blood Pacts	--
	--------------------------
		sets.midcast.Pet.BloodPactWard = {
			main="Espiritus",
			sub="Vox Grip",
			ammo="Sancus Sachet +1",
			head="Convoker's Horn +3",
			neck="Incanter's Torque",
			ear1="Andoaa Earring",
			ear2="Lodurr Earring",
			body="Baayami Robe",
			hands="Baayami Cuffs",
			ring1="Evoker's Ring",
			ring2="Stikini Ring +1",
			back="Conveyance Cape",
			waist="Kobo Obi",
			legs="Baayami Slops",
			feet="Baayami Sabots"
		}
		sets.midcast.Pet.DebuffBloodPactWard = {
			main="Espiritus",
			sub="Vox Grip",
			ammo="Sancus Sachet +1",
			head="C. Palug Crown",
			neck="Adad Amulet",
			ear1="Lugalbanda Earring",
			ear2="Enmerkar Earring",
			body="Con. Doublet +3",
			hands=gear.merlinic_magpact_hands,
			ring1="Evoker's Ring",
			ring2="C. Palug Ring",
			back=gear.magic_jse_back,
			waist="Incarnation Sash",
			legs="Tali'ah Sera. +2",
			feet="Convo. Pigaches +3"
		}	
		sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
		
		sets.midcast.Pet.PhysicalBloodPactRage = {main="Gridarvor",sub="Elan Strap +1",ammo="Sancus Sachet +1",
			head="Helios Band",neck="Shulmanu Collar",ear1="Lugalbanda Earring",ear2="Gelos Earring",
			body="Con. Doublet +3",hands=gear.merlinic_physpact_hands,ring1="Varar Ring +1",ring2="C. Palug Ring",
			back=gear.phys_jse_back,waist="Incarnation Sash",legs="Apogee Slacks +1",feet="Apogee Pumps +1"}
			
		sets.midcast.Pet.PhysicalBloodPactRage.Acc = {feet="Convo. Pigaches +3"}

		sets.midcast.Pet.MagicalBloodPactRage = {main=gear.grioavolr_pet_staff,sub="Elan Strap +1",ammo="Sancus Sachet +1",
			head="Apogee Crown +1",neck="Adad Amulet",ear1="Lugalbanda Earring",ear2="Gelos Earring",
			body="Con. Doublet +3",hands=gear.merlinic_magpact_hands,ring1="Varar Ring +1",ring2="Varar Ring +1",
			back=gear.magic_jse_back,waist="Regal Belt",legs="Enticer's Pants",feet="Apogee Pumps +1"}

		sets.midcast.Pet.MagicalBloodPactRage.Acc = {head="C. Palug Crown",feet="Convo. Pigaches +3"}

		-- Spirits cast magic spells, which can be identified in standard ways.
		
		sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
		
		sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"

		sets.midcast.Pet['Elemental Magic'].Resistant = {}
		
		sets.midcast.Pet['Impact'] = sets.midcast.Pet.DebuffBloodPactWard

		sets.midcast.Pet['Flaming Crush'] = {main=gear.grioavolr_pet_staff,sub="Elan Strap +1",ammo="Sancus Sachet +1",
			head="Apogee Crown +1",neck="Adad Amulet",ear1="Lugalbanda Earring",ear2="Gelos Earring",
			body="Con. Doublet +3",hands=gear.merlinic_magpact_hands,ring1="Varar Ring +1",ring2="Varar Ring +1",
			back=gear.phys_jse_back,waist="Regal Belt",legs="Apogee Slacks +1",feet="Apogee Pumps +1"}
			
		sets.midcast.Pet['Flaming Crush'].Acc = {head="C. Palug Crown",feet="Convo. Pigaches +3"}
		
		sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
		sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
		sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
		sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
		sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
		sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
		sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
		sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
		sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
		sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
----------------------------------
--		Engaged sets			--
----------------------------------
	sets.engaged = {main="Gridarvor",sub="Bloodrain Strap",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Shulmanu Collar",ear1="Digni. Earring",ear2="Telos Earring",
        body="Con. Doublet +3",hands="Gazu Bracelet +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.phys_jse_back,waist="Olseni Belt",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
----------------------------------------------
--			Weaponskill Gearsets			--
----------------------------------------------
	sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Gifted Earring",
        body="Con. Doublet +3",hands="Regal Cuffs",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        back="Conveyance Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet="Beck. Pigaches +1"}
