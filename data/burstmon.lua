--Copyright © 2016, 
--All rights reserved.

--Redistribution and use in source and binary forms, with or without
--modification, are permitted provided that the following conditions are met:

--    * Redistributions of source code must retain the above copyright
--      notice, this list of conditions and the following disclaimer.
--    * Redistributions in binary form must reproduce the above copyright
--      notice, this list of conditions and the following disclaimer in the
--      documentation and/or other materials provided with the distribution.
--    * Neither the name of RAWR nor the
--      names of its contributors may be used to endorse or promote products
--      derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--DISCLAIMED. IN NO EVENT SHALL THE WRITER BE LIABLE FOR ANY
--DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
--ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

_addon.name = 'BurstMon'
_addon.author = 'Selindrile'
_addon.version = '1.0'

--[[require('tables')
require('luau')
chat = require('chat')
chars = require('chat.chars')
packets = require('packets')]]

function determineElement(original)
	local player = windower.ffxi.get_player()	
	local mp = player.vitals.mp
	
	if string.find(original, "Darkness:") and mp < 437 then
		return 'Aspir'		
	elseif string.find(original, "Darkness:") then 
		return 'Blizzard'
	elseif string.find(original, "Distortion:") then
		return 'Blizzard'
	elseif string.find(original, "Induration:") then
		return 'Blizzard'
	elseif string.find(original, "Light:") then
		return 'Thunder'
	elseif string.find(original, "Impaction:") then
		return 'Thunder'
	elseif string.find(original, "Fragmentation:") then
		return 'Thunder'
	elseif string.find(original, "Fusion:") then
		return 'Fire'
	elseif string.find(original, "Liquefaction:") then
		return 'Fire'
	elseif string.find(original, "Gravitation:") then
		return 'Stone'
	elseif string.find(original, "Scission:") then
		return 'Stone'
	elseif string.find(original, "Reverberation:") then
		return 'Water'
	elseif string.find(original, "Detonation:") then
		return 'Aero'
	end
end

function determineTier(selectedElement)	
	if selectedElement == 'Aspir' then
		return getAspirTier(248, 881)
	elseif selectedElement == 'Blizzard' then		
		return getMPTier(386, 267, 162, 75, 31, 8, 153, 850)
	elseif selectedElement == 'Thunder' then		
		return getMPTier(437, 306, 195, 91, 37, 9, 168, 853)
	elseif selectedElement == 'Fire' then		
		return getMPTier(339, 228, 135, 63, 26, 7, 148, 849)
	elseif selectedElement == 'Stone' then		
		return getMPTier(237, 156, 88, 40, 16, 4, 163, 852)
	elseif selectedElement == 'Water' then		
		return getMPTier(266, 175, 99, 46, 19, 5, 173, 854)
	elseif selectedElement == 'Aero' then		
		return getMPTier(299, 198, 115, 54, 22, 6, 158, 851)	
	end	
end

function getMPTier(t6, t5, t4, t3, t2, t1, id5, id6)
	
	local player = windower.ffxi.get_player()
	local mp = player.vitals.mp
	local tier = 5
	local id = id5
	
	if mp >= t6 and player.job == 'BLM' then
		tier = 6
	elseif mp < t5 and mp >= t4 then
		tier = 4
		id = id-1
	elseif mp < t4 and mp >= t3 then
		tier = 3
		id= id-2	
	elseif mp < t3 and mp >= t2 then
		tier = 2
		id= id-3		
	elseif mp < t2 and mp >= t1 then
		tier = 1
		id= id-4	
	end
	
	return getTier(tier, id, id5, id6)
end

function getAspirTier(id2, id3)	
	local tier = 2
	local id = id2
	
	local player = windower.ffxi.get_player()
	
	if player.job == 'BLM' or player.job == 'GEO' then
		tier = 3
		id = id3
	end
	
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local timer = spell_recasts[id]
		
	while timer~= 0 do
		if tier == 3 then
			id = id2		
		else			
			id = id - 1	
		end
		timer = spell_recasts[id]
		tier = tier - 1
	end
	
	if tier == 3 then
		return 'III'
	elseif tier == 2 then
		return 'II'
	elseif tier == 1 then
		return 1
	end

end

function getTier(tier, id, id5, id6)
	local spell_recasts = windower.ffxi.get_spell_recasts()
	
	local timer = spell_recasts[id]
	local timer2 = spell_recasts[id6]
	local cast = tier
	local lowtier = id
	
	if cast == 6 then
		timer = timer2
		lowtier = id6
	end
	
	while timer ~= 0 do
		if cast == 6 then
			lowtier = id5			
		else
			lowtier = lowtier - 1			
		end
		timer = spell_recasts[lowtier]
		cast = cast - 1	
	end
	
	if cast == 6 then
		return 'VI'
	elseif cast == 5 then
		return 'V'
	elseif cast == 4 then
		return 'IV'
	elseif cast == 3 then
		return 'III'
	elseif cast == 2 then
		return 'II'
	elseif cast == 1 then
		return 1
	end
	
end

windower.register_event("incoming text", function(original,modified,original_mode,modified_mode, blocked)	
	local selectedElement = determineElement(original)
	local selectedTier = determineTier(selectedElement)	
	
	if selectedTier == 1 then
		windower.chat.input('/ma "'..selectedElement..'" <bt>')
		--windower.chat.input('/echo "'..selectedElement..'"')
	elseif (selectedTier == 'V') or (selectedTier == 'IV') or (selectedTier == 'III') or (selectedTier == 'II') then
		windower.chat.input('/ma "'..selectedElement..' '..selectedTier..'" <bt>')
		--windower.chat.input('/echo "'..selectedElement..' ' ..selectedTier..'"')
	end	
end)