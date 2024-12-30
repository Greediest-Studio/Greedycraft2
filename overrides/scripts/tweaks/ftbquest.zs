#reloadable

import crafttweaker.player.IPlayer;
import mods.zenutils.ftbq.ITaskChecker;
import mods.zenutils.ftbq.CustomTaskEvent;
import mods.zenutils.ftbq.QuestCompletedEvent;

events.register(function (e as mods.zenutils.ftbq.QuestCompletedEvent) {
  if (isNull(e.quest) || isNull(e.quest.tags) || e.quest.tags.length < 1 || !(e.quest.tags has 'challenge')) return;
  for player in e.notifyPlayers {
    if(!isNull(player.data.PlayerPersisted.challenge)){
                var data as int = player.data.PlayerPersisted.challenge.asInt();
                player.update({PlayerPersisted: {challenge : (data+1) as int}});
            }
            else{
                player.update({PlayerPersisted: {challenge  : 1 as int}});
        }
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge1")) {
        event.maxProgress = 5;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge2")) {
        event.maxProgress = 10;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge3")) {
        event.maxProgress = 15;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge4")) {
        event.maxProgress = 25;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge5")) {
        event.maxProgress = 35;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge6")) {
        event.maxProgress = 45;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge7")) {
        event.maxProgress = 60;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge8")) {
        event.maxProgress = 80;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge9")) {
        event.maxProgress = 100;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challenge10")) {
        event.maxProgress = 125;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});

events.onCustomTask(function(event as CustomTaskEvent) {
    if (event.task.hasTag("challengeall")) {
        event.maxProgress = 150;
        event.checkTimer = 20;
        event.enableButton = false;
        event.checker = function(player,currentProgress) {
            if(!isNull(player.data.PlayerPersisted.challenge)){
                return player.data.PlayerPersisted.challenge.asInt();
            } else {
                return 0;
            }
        };
    }
});