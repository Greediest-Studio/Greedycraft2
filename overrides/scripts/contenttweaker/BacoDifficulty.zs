/*BacoDifficulty */
#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.server.IServer;
import crafttweaker.event.CommandEvent;

events.onCommand(function(event as CommandEvent) {
    
    val command = event.command;
    val sender = event.commandSender;

    if (isNull(command) || !(command.name == "difficulty" || command.name == "gamerule")) {
    return;
    }

    if (!(sender instanceof IPlayer || sender instanceof IServer)) {
        event.cancel();
    }

});