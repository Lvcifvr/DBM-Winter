local mod	= DBM:NewMod("Freya_Elders", "DBM-Ulduar")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1192 $"):sub(12, -3))
mod:SetCreatureID(32914, 32915, 32913)
mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_SUMMON",
	"UNIT_TARGET",
	"SPELL_AURA_APPLIED",
	"UNIT_DIED"
)

local warnImpale			= mod:NewSpellAnnounce(62928)
local warnPhotosynthesis		= mod:NewSpellAnnounce(62209)
local timerImpale			= mod:NewTargetTimer(5, 62928)
local timerUnstableSunBeam		= mod:NewTargetTimer(15, 62243)


local specWarnFistofStone	= mod:NewSpecialWarningSpell(62344, mod:IsTank())
local specWarnUnstableSunBeam 		= mod:NewSpecialWarningCast(62243, mod:IsTank())
local specWarnPhotosynthesis		=mod:NewSpecialWarnin ---- unfinished code
local specWarnGroundTremor	= mod:NewSpecialWarningCast(62932, true)
local specWarnImpale = mod:NewSpecialWarningCast(

mod:AddBoolOption("PlaySoundOnFistOfStone", true)
mod:AddBoolOption("TrashRespawnTimer", true, "timer")
mod:AddBoolOption("HealthFrame", true)
mod:AddBoolOption("RangeFrame", true)


function mod:SPELL_CAST_START(args)
	if args:IsSpellID(62344) then 					-- Fists of Stone
		specWarnFistofStone:Show()
		if self.Options.PlaySoundOnFistOfStone then
			PlaySoundFile("Sound\\Creature\\HoodWolf\\HoodWolfTransformPlayer01.wav")
		end
	elseif args:IsSpellID(62325, 62932) then		-- Ground Tremor
		specWarnGroundTremor:Show()
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(62243) then
		specWarnUnstableSunBeam:Show()
		specWarn
	
	
function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(62310, 62928) then 			-- Impale
		warnImpale:Show(args.destName)
		timerImpale:Start(args.destName)
	end
end

function mod:UNIT_DIED(args)
	if self.Options.TrashRespawnTimer and not DBM.Bars:GetBar(L.TrashRespawnTimer) then
		local guid = tonumber(args.destGUID:sub(9, 12), 16)
		if guid == 33430 or guid == 33355 or guid == 33354 then		-- guardian lasher / nymph / tree
			DBM.Bars:CreateBar(7200, L.TrashRespawnTimer)
		end
	end
end
