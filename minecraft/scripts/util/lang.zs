/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 32000

import crafttweaker.player.IPlayer;
import crafttweaker.text.ITextComponent;

import mods.zenutils.I18n;

import scripts.util.versions as VersionUtil;

function broadcast(msg as ITextComponent) {
    var players as IPlayer[] = server.getPlayers() as IPlayer[];
    for player in players {
        player.sendRichTextMessage(msg);
    }
}

function getLanguage() as string {
    var lang as string = game.localize("greedycraft.language");
    var ret as string = "en_us";
    if (isNull(lang) || lang == "greedycraft.language" || lang == "") {
        if (DEFAULT_LANGUAGE.trim() == "") {
            if (VersionUtil.getVersionGroup() == 0) {
                ret = "zh_cn";
            } else {
                ret = "en_us";
            }
        } else {
            ret = DEFAULT_LANGUAGE.trim();
        }
    } else {
        if (DEFAULT_LANGUAGE.trim() == "") {
            ret = lang;
        } else {
            ret = DEFAULT_LANGUAGE.trim();
        }
    }
    if (!(SUPPORTED_LANGUAGES has ret)) {
        return "en_us";
    }
    return ret;
}

function translate(key as string) as string {
    var lang = getLanguage();
    
    // 添加 null 检查
    if (isNull(serverTranslations) || !(serverTranslations has lang)) {
        return game.localize(key);
    }
    
    var langMap = serverTranslations[lang];
    if (isNull(langMap)) {
        return game.localize(key);
    }
    
    if (langMap has key) {
        return langMap[key];
    } else {
        return game.localize(key);
    }
}

function format(key as string, obj as string) as string {
    var lang = getLanguage();
    
    // 添加 null 检查
    if (isNull(serverTranslations) || !(serverTranslations has lang)) {
        return I18n.format(key, obj);
    }
    
    var langMap = serverTranslations[lang];
    if (isNull(langMap)) {
        return I18n.format(key, obj);
    }
    
    if (langMap has key) {
        return langMap[key].replace("%s", obj);
    } else {
        return I18n.format(key, obj);
    }
}

function formatArray(key as string, objects as string[]) as string {
    var lang = getLanguage();
    
    // 添加 null 检查
    if (isNull(serverTranslations) || !(serverTranslations has lang)) {
        return I18n.format(key, objects);
    }
    
    var langMap = serverTranslations[lang];
    if (isNull(langMap)) {
        return I18n.format(key, objects);
    }
    
    if (langMap has key) {
        var str as string = langMap[key];
        for obj in objects {
            str = str.replaceFirst("%s", obj);
        }
        return str;
    } else {
        return I18n.format(key, objects);
    }
}
