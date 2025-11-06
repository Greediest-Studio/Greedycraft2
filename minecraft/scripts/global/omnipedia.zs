/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 30000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.zenutils.I18n;

import scripts.util.lang as LangUtil;

global omnipedia as IItemStack = <akashictome:tome>.withTag({
	"akashictome:is_morphing": 1 as byte,
	display: {
		Lore: [LangUtil.format("greedycraft.omnipedia.version", "" + 14), LangUtil.translate("greedycraft.omnipedia.tooltip")],
		Name: LangUtil.translate("greedycraft.omnipedia.name")
	},
	"akashictome:data": {
		forestry: {
			id: "forestry:book_forester",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "forestry"
			},
			Damage: 0 as short
		},
		tconstruct: {
			id: "tconstruct:book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "tconstruct"
			},
			Damage: 0 as short
		},
		"thermal foundation": {
			id: "thermalfoundation:tome_lexicon",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "thermalfoundation"
			},
			Damage: 0 as short
		},
		cookingforblockheads: {
			id: "cookingforblockheads:recipe_book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "cookingforblockheads"
			},
			Damage: 0 as short
		},
		cyclicmagic: {
			id: "guideapi:cyclicmagic-guide",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "cyclicmagic"
			},
			Damage: 0 as short
		},
		patchouli1: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "patchouli:greedycraft_guide_book",
				"akashictome:definedMod": "patchouli1"
			},
			Damage: 0 as short
		},
		conarm: {
			id: "conarm:book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "conarm"
			},
			Damage: 0 as short
		},
		thebetweenlands: {
			id: "thebetweenlands:manual_hl",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "thebetweenlands"
			},
			Damage: 0 as short
		},
		actuallyadditions: {
			id: "actuallyadditions:item_booklet",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "actuallyadditions"
			},
			Damage: 0 as short
		},
		touhou_little_maid: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "touhou_little_maid:memorizable_gensokyo",
				"akashictome:definedMod": "touhou_little_maid"
			},
			Damage: 0 as short
		},
		astralsorcery: {
			id: "astralsorcery:itemjournal",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "astralsorcery"
			},
			Damage: 0 as short
		},
		abyssalcraft: {
			id: "abyssalcraft:necronomicon",
			Count: 1 as byte,
			tag: {
				PotEnergy: 0.0f,
				"akashictome:definedMod": "abyssalcraft"
			},
			Damage: 0 as short
		},
		rftools: {
			id: "rftools:rftools_manual",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "rftools"
			},
			Damage: 0 as short
		},
		bloodmagic: {
			id: "bloodmagic:sanguine_book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "bloodmagic"
			},
			Damage: 0 as short
		},
		aether_legacy: {
			id: "aether_legacy:lore_book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "aether_legacy"
			},
			Damage: 0 as short
		},
		packagedauto: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "packagedauto:guide",
				"akashictome:definedMod": "packagedauto"
			},
			Damage: 0 as short
		},
		endreborn: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "endreborn:book",
				"akashictome:definedMod": "endreborn",
				"akashictome:is_morphing": 1 as byte,
				display: {
					Name: "阿卡什宝典（末地之书）"
				},
				"akashictome:displayName": "末地之书"
			},
			Damage: 0 as short
		},
		projecte: {
			id: "projecte:item.pe_manual",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "projecte"
			},
			Damage: 0 as short
		},
		ftbquests: {
			id: "ftbquests:book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "ftbquests"
			},
			Damage: 0 as short
		},
		nuclearcraft: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "nuclearcraft:guide",
				"akashictome:definedMod": "nuclearcraft"
			},
			Damage: 0 as short
		},
		extendedcrafting: {
			id: "extendedcrafting:guide",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "extendedcrafting"
			},
			Damage: 0 as short
		},
		forestry1: {
			id: "forestry:catalogue",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "forestry1"
			},
			Damage: 0 as short
		},
		ee: {
			id: "ee:end_info_book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "ee"
			},
			Damage: 0 as short
		},
		thaumcraft: {
			id: "thaumcraft:thaumonomicon",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "thaumcraft"
			},
			Damage: 0 as short
		},
		rftools1: {
			id: "rftools:rftools_shape_manual",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "rftools1"
			},
			Damage: 0 as short
		},
		rftoolscontrol: {
			id: "rftoolscontrol:rftoolscontrol_manual",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "rftoolscontrol"
			},
			Damage: 0 as short
		},
		patchouli: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "patchouli:the_elysia_project",
				"akashictome:definedMod": "patchouli"
			},
			Damage: 0 as short
		},
		botania: {
			id: "botania:lexicon",
			Count: 1 as byte,
			tag: {
				"knowledge.minecraft": 1 as byte,
				"knowledge.relic": 1 as byte,
				"knowledge.dream": 1 as byte,
				"knowledge.alfheim": 1 as byte,
				"akashictome:definedMod": "botania"
			},
			Damage: 0 as short
		},
		hammercore: {
			id: "hammercore:manual",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "hammercore"
			},
			Damage: 0 as short
		},
		blue_skies: {
			id: "blue_skies:blue_lore",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "blue_skies"
			},
			Damage: 0 as short
		},
		solcarrot: {
			id: "solcarrot:food_book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "solcarrot"
			},
			Damage: 0 as short
		},
		mekanism: {
			id: "mekanism:dictionary",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "mekanism"
			},
			Damage: 0 as short
		},
		cyclicmagic1: {
			id: "cyclicmagic:tool_trade",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "cyclicmagic1"
			},
			Damage: 0 as short
		},
		compactmachines3: {
			id: "compactmachines3:psd",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "compactmachines3"
			},
			Damage: 0 as short
		},
		openblocks: {
			id: "openblocks:info_book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "openblocks"
			},
			Damage: 0 as short
		},
		theaurorian: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "theaurorian:the_aurorian_guide",
				"akashictome:definedMod": "theaurorian"
			},
			Damage: 0 as short
		},
		opencomputers: {
			id: "opencomputers:tool",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "opencomputers"
			},
			Damage: 4 as short
		},
		theoneprobe: {
			id: "theoneprobe:probenote",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "theoneprobe"
			},
			Damage: 0 as short
		},
		cfm: {
			id: "cfm:item_recipe_book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "cfm"
			},
			Damage: 0 as short
		},
		cookingforblockheads2: {
			id: "cookingforblockheads:recipe_book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "cookingforblockheads2"
			},
			Damage: 2 as short
		},
		naturesaura: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "naturesaura:book",
				"akashictome:definedMod": "naturesaura"
			},
			Damage: 0 as short
		},
		twilightforest: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "twilightforest:guide",
				"akashictome:definedMod": "twilightforest"
			},
			Damage: 0 as short
		},
		sakura: {
			id: "patchouli:guide_book",
			Count: 1 as byte,
			tag: {
				"patchouli:book": "sakura:sakura_guide",
				"akashictome:definedMod": "sakura"
			},
			Damage: 0 as short
		},
		xnet: {
			id: "xnet:xnet_manual",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "xnet"
			},
			Damage: 0 as short
		},
		extrautils2: {
			id: "extrautils2:book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "extrautils2"
			},
			Damage: 0 as short
		},
		draconicevolution: {
			id: "draconicevolution:info_tablet",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "draconicevolution"
			},
			Damage: 0 as short
		},
		bloodarsenal: {
			id: "guideapi:bloodarsenal-guide",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "bloodarsenal"
			},
			Damage: 0 as short
		},
		rftools2: {
			id: "rftools:developers_delight",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "rftools2"
			},
			Damage: 0 as short
		},
		cookingforblockheads1: {
			id: "cookingforblockheads:recipe_book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "cookingforblockheads1"
			},
			Damage: 1 as short
		},
		rustic: {
			id: "rustic:book",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "rustic"
			},
			Damage: 0 as short
		},
		bloodmagic1: {
			id: "guideapi:bloodmagic-guide",
			Count: 1 as byte,
			tag: {
				"akashictome:definedMod": "bloodmagic1"
			},
			Damage: 0 as short
		}
	}
}) as IItemStack;
