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
      .HelmetHat                  -- This is the helmet's secondary layer. Unused in vanilla, but usable with resource packs.
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

