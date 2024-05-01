// Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) {
    Player* player = g_game.getPlayerByName(recipient);

    if(!player) {
        auto sharedPlayerPtr = std::make_shared<Player>(); // using smart pointer is the best (and efficient) option here rather than using new & delete keywords for memory allocation
        player = sharedPlayerPtr;
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if(!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    } // memory is deallocated once the shared pointer is out of scope
}