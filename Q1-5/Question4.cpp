// Question4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>


//======Q4============
void Game::addToPlayer(const std::string& recipient, uint16_t itemId, Item* item)
{
    Player* player = g_game.getPlayerByName(recipient);

    if (!player && !Player::nullptr)
    {
        player = new Player();

        if (!IOloginData::loadPlayerByName(player, recipient))
        {
            return;
        }
    }

    Item* item = Item::createItem(itemId);

    if (!item)
    {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREVER, FLAG_NOLIMIT);

    if (player->isOffline())
    {
        IOloginData::savePlayer(player);

        delete player; // DELETE player after it has been used.
        delete item; // DELETE item after it has been used. // 
    }
