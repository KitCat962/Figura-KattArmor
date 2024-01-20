-- This template is designed to mimic the vanilla armor as much as possible.
-- Many additional unneeded things are included to correctly mimic everything.
-- This includes the second hat layer used in resource packs, trims, and the brown parts on leather armor.


vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)

local kattArmor = require("KattArmor")()
kattArmor.Armor.Helmet
-- the `addParts` function is not strict with the number of ModelParts provided. Add or remove parts as desired.
    :addParts(
        models.model.Head.Helmet,
        models.model.Head
        .HelmetHat -- This is the helmet's secondary layer. Unused in vanilla, but usable with resource packs.
    )
-- trims need a seperate cube to correctly function, so they get registered seperatly.
    :addTrimParts(
        models.model.Head.HelmetTrim,
        models.model.Head.HelmetHatTrim
    )
kattArmor.Armor.Chestplate
    :addParts(
        models.model.Body.Chestplate,
        models.model.RightArm.RightArmArmor,
        models.model.LeftArm.LeftArmArmor
    )
    :addTrimParts(
        models.model.Body.ChestplateTrim,
        models.model.RightArm.RightArmArmorTrim,
        models.model.LeftArm.LeftArmArmorTrim
    )
kattArmor.Armor.Leggings
    :addParts(
        models.model.Body.Belt,
        models.model.RightLeg.RightLegArmor,
        models.model.LeftLeg.LeftLegArmor
    )
    :addTrimParts(
        models.model.Body.BeltTrim,
        models.model.RightLeg.RightLegArmorTrim,
        models.model.LeftLeg.LeftLegArmorTrim
    )
kattArmor.Armor.Boots
    :addParts(
        models.model.RightLeg.RightBoot,
        models.model.LeftLeg.LeftBoot
    )
    :addTrimParts(
        models.model.RightLeg.RightBootTrim,
        models.model.LeftLeg.LeftBootTrim
    )

-- This adds the brown parts of the leather armor that do not change color.
-- Because the texture path is long, store it in a variable.
local leather1 = "minecraft:textures/models/armor/leather_layer_1_overlay.png"
local leather2 = "minecraft:textures/models/armor/leather_layer_2_overlay.png"
kattArmor.Materials.leather
    :addParts("Helmet",
        -- Because this template aims to mimic the vanilla armor as much as possible, I'm setting the texture of the leather cubes in the bbmodel to the vanilla texture.
        models.model.Head.HelmetLeather:setPrimaryTexture("RESOURCE", leather1),
        models.model.Head.HelmetHatLeather:setPrimaryTexture("RESOURCE", leather1)
    )
    :addParts("Chestplate",
        models.model.Body.ChestplateLeather:setPrimaryTexture("RESOURCE", leather1),
        models.model.RightArm.RightArmArmorLeather:setPrimaryTexture("RESOURCE", leather1),
        models.model.LeftArm.LeftArmArmorLeather:setPrimaryTexture("RESOURCE", leather1)
    )
    :addParts("Leggings",
        models.model.Body.BeltLeather:setPrimaryTexture("RESOURCE", leather2), -- Leggings use a different texture than other armor parts in vanilla.
        models.model.RightLeg.RightLegLeather:setPrimaryTexture("RESOURCE", leather2),
        models.model.LeftLeg.LeftLegLeather:setPrimaryTexture("RESOURCE", leather2)
    )
    :addParts("Boots",
        models.model.RightLeg.RightBootLeather:setPrimaryTexture("RESOURCE", leather1),
        models.model.LeftLeg.LeftBootLeather:setPrimaryTexture("RESOURCE", leather1)
    )

local minecraftDungeonsMaterialMap = {
    ["archers"] = "archer",
    ["arctic_fox_armor"] = "arctic",
    ["battle_robe"] = "battle",
    ["beehive_armor"] = "beehive",
    ["beenest_armor"] = "beenest",
    ["black_wolf_armor"] = "blackwolf",
    ["blue_mystery_armor"] = "bluemystery",
    ["cauldron_armor"] = "cauldron",
    ["cave_crawler"] = "cave",
    ["champions_armor"] = "champions",
    ["climbing_gear"] = "climbing",
    ["curious_armor"] = "curious",
    ["dark_armor"] = "dark",
    ["ember_robe"] = "ember",
    ["emerald_gear"] = "emeraldgear",
    ["entertainer_garb"] = "entertainer",
    ["evocation_robe"] = "evocation",
    ["fox_armor"] = "fox",
    ["frost_armor"] = "frost",
    ["frost_bite_armor"] = "frostbite",
    ["full_metal_armor"] = "fullmetal",
    ["ghost_kindler"] = "ghostkindler",
    ["ghostly_armor"] = "ghostly",
    ["gilded_glory"] = "gildedglory",
    ["glow_squid_armor"] = "glowsquid",
    ["goat_gear"] = "goat",
    ["golden_piglin_armor"] = "goldenpiglin",
    ["gourdian_armor"] = "gourdian",
    ["green_mystery_armor"] = "greenmystery",
    ["grim_armor"] = "grim",
    ["guards_armor"] = "guards",
    ["heros_armor"] = "heros",
    ["highland_armor"] = "highland",
    ["hungry_horror"] = "hungryhorror",
    ["hunters"] = "hunter",
    ["living_vines_armor"] = "livingvines",
    ["mercenary_armor"] = "mercenary",
    ["nimble_turtle_armor"] = "nimbleturtle",
    ["ocelot_armor"] = "ocelot",
    ["opulent_armor"] = "opulentarmor",
    ["phantom_armor"] = "phantom",
    ["piglin_armor"] = "piglin",
    ["plate_armor"] = "plate",
    ["purple_mystery_armor"] = "purplemystery",
    ["red_mystery_armor"] = "redmystery",
    ["reinforced_mail"] = "reinforced",
    ["renegade_armor"] = "renegade",
    ["royal_guard_armor"] = "royalguard",
    ["rugged_climbing_gear"] = "rugged",
    ["scale_mail"] = "scale",
    ["shadow_walker_armor"] = "shadowwalker",
    ["shulker_armor"] = "shulker",
    ["snow_armor"] = "snow",
    ["souldancer_robe"] = "souldancer",
    ["soul_robe"] = "soulrobe",
    ["spelunker_armor"] = "spelunker",
    ["spider_armor"] = "spider",
    ["splendid_robe"] = "splendid",
    ["sprout_armor"] = "sprout",
    ["squid_armor"] = "squid",
    ["stalwart_armor"] = "stalwart",
    ["sturdy_shulker_armor"] = "sturdyshulker",
    ["sweet_tooth"] = "sweettooth",
    ["teleportation_robe"] = "teleportation",
    ["thief_armor"] = "thief",
    ["titans_shroud"] = "titans",
    ["troubadour_armor"] = "troubadour",
    ["turtle_armor"] = "turtle",
    ["unstable_robe"] = "unstable",
    ["vanguard_armor"] = "vanguard",
    ["verdant_robe"] = "verdant",
    ["white_mystery_armor"] = "whitemystery",
    ["wither_armor"] = "wither",
    ["wolf_armor"] = "wolf",
}

local formatString = "minecraft:textures/models/armor/%s_layer_%s.png"
for mat, path in pairs(minecraftDungeonsMaterialMap) do
    kattArmor.Materials[mat]
        :setTexture(formatString:format(path, "1"))
        :setTextureLayer2(formatString:format(path, "2"))
    if client.hasResource(formatString:format(path, "1_e")) then
        kattArmor.Materials[mat]:setEmissiveTexture(formatString:format(path, "1_e"))
    end
    if client.hasResource(formatString:format(path, "2_e")) then
        kattArmor.Materials[mat]:setEmissiveTextureLayer2(formatString:format(path, "2_e"))
    end
end
