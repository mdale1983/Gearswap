include('augments.lua')
----------------------
--  Field/Town Idle --
----------------------
sets.idle = {
	main="Bolelabunga",
	sub="Genmei Shield",
	ammo="Incantor Stone",
	head="Befouled Crown",
	body="Piety Briault +3",
	hands="Inyan. Dastanas +2",
	legs="Assid. Pants +1",
	feet="Inyan. Crackows +2",
	neck="Loricate torque +1",
	waist="Fucho-no-Obi",
	ear1="Moonshade Earring",
	ear2="Etiolation Earring",
	ring1="Inyanga Ring",
	ring2="Gelatinous ring",
	back="Solemnity cape"
}
sets.idle.MagicEva = { 
	head="Inyanga tiara +1",
	body="Inyanga jubbah +2",
	hands="Inyanga Dastanas +2",
	legs="Inyanga Shalwar +1",
	feet="Inyanga Crackows +2",
	ring1="Persis ring",
	ring2="Inyanga ring",
	ear1="Flashward earring",
	ear2="Etiolation earring",
	neck="Loricate Torque +1",
	back="Solemnity cape"		
}
sets.idle.PDT = {
	head="Ayanmo Zucchetto +1",
	body="Ayanmo Corazza +1",
	hands="Ayanmo Manopolas +1",
	legs="Ayanmo Cosciales +2",
	feet="Ayanmo Gambieras +1",
	ring1="Persis ring",
	ring2="Inyanga ring",
	ear1="Flashward earring",
	ear2="Etiolation earring",
	neck="Loricate Torque +1",
	back="Solemnity cape"
}
sets.Kiting = {
	feet="Herald's gaiters"
}
sets.idle.Weak = set_combine(sets.idle,{

})
--------------------------------------
-- 	Pre-cast Job Ability Gear-sets 	--	
--------------------------------------
sets.buff['Divine Caress'] = {
	hands="Ebers Mitts +1",
	back="Mending Cape"
}
sets.precast.JA.Benediction = {
	body="Piety Briault +3"
}
----------------------------------
-- 	Pre-cast Magic Gear-sets 	--	
----------------------------------
sets.precast.FC = {
	main="Grioavolr", 
	sub="Achaq Grip",
	ammo="Incantor Stone",
	head="Vanya Hood", 
	body="Inyanga jubbah +2",
	hands="Gende. Gages +1", 
	legs="Aya. Cosciales +2",
	feet="Chelona Boots",
	neck="Orison Locket",
	waist="Channeler's Stone",
	ear1="Loquac. Earring",
	ear2="Etiolation Earring",
	ring1="Kishar Ring",
	ring2="Sirona's Ring",
	back="Alaunus's Cape",
}
sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
	waist="Siegel Sash"
})
sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
	head="Umuthi Hat",
	legs="Doyen Pants",
})
sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
	legs="Ebers Pant. +1",
})
sets.precast.FC.StatusRemoval = set_combine(sets.precast.FC['Healing Magic'], {
	main="Yagrush",
})
sets.precast.FC.Erase = set_combine(sets.precast.FC.StatusRemoval, {

})
sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
	main="Queller Rod", 
	sub="Genmei Shield",
	ammo="Incantor Stone",
	head="Piety Cap", 
	body="Inyanga jubbah +2",
	hands="Gende. Gages +1",
	legs="Ebers Pant. +1",
	feet="Vanya Clogs",
	neck="Orison Locket",
	waist="Channeler's Stone",
	ear1="Nourish. Earring",
	ear2="Nourish. Earring +1",
	ring1="Warp Ring",
	ring2="Sirona's Ring",
	back="Alaunus's Cape",
})
sets.precast.FC.Curaga = sets.precast.FC.Cure
sets.precast.FC.CureSolace = sets.precast.FC.Cure
----------------------------------
-- 	Mid-cast Magic Gear-Sets 	--
----------------------------------
sets.midcast.FastRecast = set_combine(sets.precast.FC, {
	
})
	-- Cure sets
gear.default.obi_waist = "Goading Belt"
gear.default.obi_back = "Mending Cape"
sets.midcast.CureSolace = { --cure potency cap is 50% and 30% Rec.
	main="Iridal Staff",
	sub="Achaq Grip",
	ammo="Leisure Musk +1",
	head="Vanya Hood",
	body="Ebers Bliaud +1",
	hands="Theophany Mitts +3",
	legs="Ebers Pant. +1",
	feet="Vanya Clogs",
	neck="Cleric's Torque",
	waist="Korin Obi",
	ear1="Nourish. Earring",
	ear2="Nourish. Earring +1",
	ring1="Tamas Ring",
	ring2="Persis Ring",
	back="Alaunus's Cape",
}
sets.midcast.Cure = { --cure potency cap is 50% and 30% Rec.
	main="Iridal Staff",
	sub="Achaq Grip",
	ammo="Clarus Stone",
	head="Vanya Hood",
	body="Theo. Briault +3",
	hands="Theophany Mitts +3",
	legs="Ebers Pant. +1",
	feet="Vanya Clogs",
	neck="Incanter's Torque",
	waist="Korin Obi",
	ear1="Nourish. Earring",
	ear2="Nourish. Earring +1",
	ring1="Tamas Ring",
	ring2="Persis Ring",
	back="Mending Cape",
}
sets.midcast.Curaga = set_combine(sets.midcast.Cure, {

})
sets.midcast.CureMelee = {
	--ammo="Incantor Stone"
}
sets.midcast.Cursna = {
	-- main="Yagrush",
	-- sub="Thuellaic Ecu +1",
	main="Gada",
	sub="Genmei shield",
	ammo="Hasty Pinion +1",
	head="Ebers Cap +1",
	body="Ebers bliaud +1",
	hands="Fanatic Gloves",
	legs="Th. Pantaloons +2",
	feet="Gendewitha galoshes +1",
	neck="Malison Medallion",
	waist="Channeler's Stone",
	ear1="Beatific Earring",
	ring1="Haoma's Ring",
	ring2="Haoma's Ring",
	back="Alaunus's Cape",
}
sets.midcast.StatusRemoval = {
	main="Yagrush",
	sub="Thuellaic Ecu +1",
	ammo="Leisure Musk +1",
	head="Ebers Cap +1",
	body="Inyanga jubbah +2",
	hands="Theophany Mitts +3",
	legs="Ebers Pant. +1",
	feet="Piety Duckbills",
	neck="Orison Locket",
	waist="Channeler's Stone",
	ear2="Etiolation Earring",
	ear1="Loquac. Earring",
	ring1="Persis Ring",
	ring2="Kishar Ring",
	back="Alaunus's Cape",
}
sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {
	neck="Cleric's Torque",
	name="Gende. Gages +1",
})
-- 110 total Enhancing Magic Skill; caps even without Light Arts
sets.midcast['Enhancing Magic'] = { -- Enh. Ma. Skill > Conserve MP
	main="Gada",
	sub="Genmei Shield",
	ammo="Pemphredo Tathlum",
	legs="Piety Pantaloons",
	feet="Ebers Duckbills",
	neck="Incanter's Torque",
	waist="Austerity Belt",
	ear1="Mendi. Earring",
	ear2="Andoaa Earring",
	ring1="Stikini Ring",
	ring2="Stikini Ring",
	back="Mending Cape",
}
sets.midcast.Duration = set_combine(sets.midcast['Enhancing Magic'],{ -- Enh. Ma. Dur. (exclusivly for set_combine, nothing will directly call this set)
	main="Gada",
	sub="Genmei Shield",
	head=Telc.Head.Dur,
	body=Telc.Body.Dur,
	hands=Telc.Hands.Dur,
	legs=Telc.Legs.Dur,
	feet=Telc.Feet.Dur,
})
sets.midcast.Stoneskin = set_combine(sets.midcast.Duration,{
	neck="noden's Gorget",
	waist="Siegel Sash",
	ear1="Earthcry Earring",
})
sets.midcast.Haste = set_combine(sets.midcast.Duration,{-- Used to force duration onto Haste
	ammo="Hasty Pinion +1",
	neck="Orison Locket",
	waist="Channeler's Stone",
	ear2="Loquac. Earring",
	ear1="Etiolation Earring",
	ring1="Rahab Ring",
	ring2="Kishar Ring",
	back="Alaunus's Cape",
})
sets.midcast.Auspice = set_combine(sets.midcast.Duration,{
	feet="Ebers Duckbills"
})
sets.midcast.Aquaveil = set_combine(sets.midcast.Duration, {

})
sets.midcast.Refresh = set_combine(sets.midcast.Duration, {

})
sets.midcast.Phalanx = set_combine(sets.midcast.Duration, { -- Enhancing Skill = -36 damage @ 3 minutes. Enh. Dur. = -33 damage @ 5 minutes

})
sets.midcast.Storm = set_combine(sets.midcast.Duration, {

})
sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'],{
	main="Beneficus",
	head="Ebers Cap +1",
	body="Ebers Bliaud +1",
	hands="Ebers Mitts",
	legs="Piety Pantaloons",
	feet="Ebers Duckbills",
	neck="Incanter's Torque",
	ring1="Stikini Ring",
	ring2="Stikini Ring",
	waist="Cascade Belt",
	back="Mending Cape",
})
sets.midcast.Regen = set_combine(sets.midcast.Duration,{
	main="Gada",
	head="Inyanga Tiara +1",
	body="Piety Briault +3",
	hands=Telc.Hands.Dur,
	legs=Telc.Legs.Dur,
	feet=Telc.Feet.Dur
})
sets.midcast.Protectra = set_combine(sets.midcast.Duration,{
	ring1="Sheltered Ring",
	feet="Piety Duckbills"
})
sets.midcast.Protect = sets.midcast.Protectra
sets.midcast.Shellra = set_combine(sets.midcast.Duration,{
	ring1="Sheltered Ring",
	legs="Piety Pantaloons"
})
sets.midcast.Shell = sets.midcast.Shellra
sets.midcast['Divine Magic'] = {
	main="Yagrush",
	sub="Genmei Shield",
	ammo="Pemphredo Tathlum",
	head="Inyanga Tiara +1",
	body="Theo. Briault +3",
	hands="Inyan. Dastanas +1",
	legs="Th. Pant. +3",
	feet="Theo. Duckbills +2",
	neck="Incanter's Torque",
	waist="Refoccilation Stone",
	ear2="Beatific Earring",
	ear1="Regal Earring",
	ring1="Stikini Ring",
	ring2="Stikini Ring",
	back="Alaunus's Cape",
}
sets.midcast['Dark Magic'] = {
	main="Rubicundity",
	sub="Genmei Shield",
	ammo="Pemphredo Tathlum",
	head="Inyanga Tiara +1",
	body="Zendik Robe",
	hands="Inyan. Dastanas +1",
	legs="Inyanga Shalwar +1",
	feet="Inyan. Crackows +1",
	neck="Erra Pendant",
	waist="Refoccilation Stone",
	ear2="Digni. Earring",
	ear1="Regal Earring",
	ring1="Evanescence Ring",
	ring2="Stikini Ring",
	back="Alaunus's Cape",
}
-- Custom spell classes
sets.midcast.MndEnfeebles = {
	main="Gada",
	sub="Genmei Shield",
	ammo="Hydrocera",
	head="Inyanga Tiara +1",
	body="Theo. Briault +3",
	hands="Inyan. Dastanas +1",
	legs="Th. Pant. +3",
	feet="Theo. Duckbills +2",
	neck="Incanter's Torque",
	waist="Luminary Sash",
	ear2="Digni. Earring",
	ear1="Regal Earring",
	ring1="Kishar Ring",
	ring2="Stikini Ring",
	back="Alaunus's Cape",
}
sets.midcast.IntEnfeebles = {
	main="Gada",
	sub="Genmei Shield",
	ammo="Pemphredo Tathlum",
	head="Inyanga Tiara +1",
	body="Theo. Briault +3",
	hands="Inyan. Dastanas +1",
	legs="Th. Pant. +3",
	feet="Theo. Duckbills +2",
	neck="Incanter's Torque",
	waist="Luminary Sash",
	ear2="Digni. Earring",
	ear1="Regal Earring",
	ring1="Kishar Ring",
	ring2="Stikini Ring",
	back="Alaunus's Cape",
}
----------------------
-- 	Misc Gear-sets 	--
----------------------
sets.resting = {
	main="Boonwell Staff",
	sub="Enki Strap",
	ammo="Clarus Stone",
	head="Orvail Corona +1",
	body="Chelona Blazer",
	hands="Nares Cuffs",
	legs="Nisse Slacks",
	feet="Chelona Boots",
	neck="Eidolon Pendant",
	waist="Austerity Belt",
	ear1="Mendi. Earring",
	ear2="Andoaa Earring",
	ring1="Star Ring",
	ring2="Star Ring",
	back="Vita Cape",
}