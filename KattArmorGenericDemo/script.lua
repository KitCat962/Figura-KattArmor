-- This avatar is able to switch between a cat model and a humanoid model
-- This is used to showcase both custom textures, how little is needed to get KattArmor working, custom materials, and demonstraites the concept of KattArmor Instances.

vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)

-- This sets up the armor for the humanoid model. Unlike the vanilla template, I'm half assing this to showcase flexibility.
local armorHuman=require("KattArmor")()
armorHuman.Armor.Helmet:addParts(models.model.Head.Helmet)
armorHuman.Armor.Chestplate:addParts(
    models.model.Body.Chestplate,
    models.model.RightArm.RightArmArmor,
    models.model.LeftArm.LeftArmArmor
)
armorHuman.Armor.Leggings:addParts(
    models.model.Body.Belt,
    models.model.RightLeg.RightLegArmor,
    models.model.LeftLeg.LeftLegArmor
)
armorHuman.Armor.Boots:addParts(
    models.model.RightLeg.RightBoot,
    models.model.LeftLeg.LeftBoot
)
-- This demonstraights how a custom material can be created and used.
-- Basically works like the normal materials, except uses a unique string name.
armorHuman.Materials.philza
    :setTexture(textures["model.philzaLayer1"])
    :setTextureLayer2(textures["model.philzaLayer2"])

-- This handles switching to the custom material.
-- When KattArmor detects that the armor has changed, this function will run.
-- For this one specifically, if the item's name matches a specific string (which changes depending on the armor part), it will return the material which will override KattArmor
-- For example, the string to check for for the Helmet would be "Philza Helmet".
-- If nothing is returned, KattArmor will run the next onChange function registered. If no value is ever returned, KattArmor will detect the material by itself (default behavior)
armorHuman.registerOnChange(function(partID, item)
  if item:getName() == ("Philza " .. partID) then
    return "philza"
  end
end)

-- This sets up the armor for the cat model.
-- By calling `require("KattArmor")()` again (specifically `()`), we create a new instance of KattArmor.
local armorCat=require("KattArmor")()
armorCat.Armor.Helmet:addParts(
    models.cat.body.Head.helmet,
    models.cat.body.Head.helmet2,
    models.cat.body.Head.helmet3
)
armorCat.Armor.Chestplate:addParts(models.cat.body.belly.chestplate)
armorCat.Armor.Leggings:addParts(
    models.cat.body.LeftLegBack.legg,
    models.cat.body.RightLegBack.legg,
    models.cat.body.LeftLegFront.legg,
    models.cat.body.RightLegFront.legg
)
armorCat.Armor.Boots:addParts(
    models.cat.body.LeftLegBack.boot,
    models.cat.body.RightLegBack.boot,
    models.cat.body.LeftLegFront.boot,
    models.cat.body.RightLegFront.boot
)

-- This is why we needed a seperate instance. The humanoid model uses the vanilla textures, while the cat uses custom textures.
-- Having both in the same instance would force us to use one or the other, or force us to put both armors in the same texture.
armorCat.Materials.leather:setTexture(textures["cat.leather"])
armorCat.Materials.iron:setTexture(textures["cat.iron"])
armorCat.Materials.chainmail:setTexture(textures["cat.iron"]) -- I'm lazy, so what?
armorCat.Materials.golden:setTexture(textures["cat.gold"])
armorCat.Materials.diamond:setTexture(textures["cat.diamond"])
armorCat.Materials.netherite:setTexture(textures["cat.iron"]):setDefaultColor(vectors.rgbToInt(0.2,0.2,0.2)) -- very lazy.

-- Because we are only using a single texture for armor, we need to ensure that the leggings use the layer1 texture instead of the default layer2
armorCat.Armor.Leggings:setLayer(1)

-- OnChange functions are global for all instances, so we still need to define a texture for the philza material
armorCat.Materials.philza:setTexture(textures["cat.iron"]):setDefaultColor(vectors.rgbToInt(1,0,0)) -- of course I'm doing setColor shenanagains. I already spent 2 hours on this.


-- Boilerplate model switching code
local page=action_wheel:newPage()
action_wheel:setPage(page)


local function setCat(bool)
    models.model:setVisible(not bool)
    models.cat:setVisible(bool)
end
pings.setCat=setCat

local isCatDefault=true
page:newAction()
    :title("no cat")
    :toggleTitle("CAT")
    :onToggle(pings.setCat)
    :toggled(isCatDefault)
setCat(isCatDefault)