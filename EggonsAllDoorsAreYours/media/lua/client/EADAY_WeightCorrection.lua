local function adjustDoorsWeightInContainer(container)
    local pseudoinventory = container:getItems()
    for i = 0, pseudoinventory:size() - 1 do
        local item = pseudoinventory:get(i)
        EADAY.adjustDoorWeight(item)        
    end
end

getSandboxOptions():load()
if SandboxVars.eggonsAllDoorsAreYours.DoorsWeightMultiplier ~= 1 then
    EggonsMU.enableEvent.OnDisplayContainerContents()
    Events.OnDisplayContainerContents.Add(adjustDoorsWeightInContainer)
end
