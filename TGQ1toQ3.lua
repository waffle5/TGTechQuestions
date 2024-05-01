-- Q1

--[[ I don't see Q1 as a question that needs fixing. releaseStorage 
sets the storage value to the default value (no storage) and will 
execute in the onLogout function if the condition is met. ]]--

local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player)
    end
    return true
end

-- Q2

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local guilds = Game.getGuilds() -- reference guild names and cache guilds to local variable
    for _, guild in ipairs(guilds) do
        if guild < memberCount then
            print(guild:getName())
        end
    end
end 

-- Q3

function removePartyMember(playerId, memberName) -- made function name proper and readable
    local player = Player(playerId)
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do
        if v == Player(memberName) then
            party:removeMember(Player(memberName))
        end
    end
end

