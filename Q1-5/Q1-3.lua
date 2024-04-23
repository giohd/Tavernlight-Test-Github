print("ghg");
-- ==== Q1 ====
local function releaseStorage(player)

    if player then -- Added valid check for player. 
       player:setStorageValue(1000, -1)

     end
end 

function onLogout(player)
-- Checks if the player storage value is set to 1. 
    if player:getStorageValue(1000) == 1 then
    -- Release Storage function to run after 1 sec. 
        addEvent(releaseStorage, 1000, player)

    end
    return true

end


-- ====Q2====== 
function PrintSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

    if resultId ~= nil then --checks if valid. 
        repeat -- loop untill condiction is met. 
            local guildName = result.getDataString(resultId, "name") -- get the name from current row. 
            print(guildName); -- print current index

        until not result.next(resultId) -- continue until there are no more rows to read in result. 
  
    else
        print("No results found.");
    end
end



--Q3 - Fix or improve the name and the implementation of the below method
function RemoveMemberFromParty(playerId, membername)

player = Player(playerId)
local party = player:getParty()

    for k,v in pairs(party:getMembers()) do

       if v == Player(membername) then

         party:removeMember(Player(membername));
         print(membername .. " has been removed from the party.");
         break;  -- exit the loop once member is removed. 
        end

    end

end

