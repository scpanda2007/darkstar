-----------------------------------
-- Attachment: Auto-repair Kit III
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    -- We do not have support to do a fraction of a percent so we rounded
    local frame = pet:getAutomatonFrame()
    if frame == dsp.frames.HARLEQUIN then
        pet:addMod(dsp.mod.HPP, 15)
    elseif frame == dsp.frames.VALOREDGE then
        pet:addMod(dsp.mod.HPP, 13)
    elseif frame == dsp.frames.SHARPSHOT then
        pet:addMod(dsp.mod.HPP, 17)
    elseif frame == dsp.frames.STORMWAKER then
        pet:addMod(dsp.mod.HPP, 19)
    end
end

function onUnequip(pet)
    local frame = pet:getAutomatonFrame()
    if frame == dsp.frames.HARLEQUIN then
        pet:delMod(dsp.mod.HPP, 15)
    elseif frame == dsp.frames.VALOREDGE then
        pet:delMod(dsp.mod.HPP, 13)
    elseif frame == dsp.frames.SHARPSHOT then
        pet:delMod(dsp.mod.HPP, 17)
    elseif frame == dsp.frames.STORMWAKER then
        pet:delMod(dsp.mod.HPP, 19)
    end
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    local power = 0
    if maneuvers > 0 then
        power = math.floor(6 + 3 * maneuvers + (pet:getMaxHP() * (1.2 + 0.6 * maneuvers) / 100))
    end
    updateModPerformance(pet, dsp.mod.REGEN, 'autorepair_kit_ii_mod', power)
end
