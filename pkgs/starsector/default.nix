{
  lib,
  newScope,
}:

lib.makeScope newScope (
  self: with self; {
    a-new-level-of-confidence-40 = callPackage ./a-new-level-of-confidence-40.nix { };
    angry-periphery = callPackage ./angry-periphery.nix { };
    aotd-ashlib = callPackage ./aotd-ashlib.nix { };
    aotd-cryosleeper-options = callPackage ./aotd-cryosleeper-options.nix { };
    aotd-question-of-loyalty = callPackage ./aotd-question-of-loyalty.nix { };
    aotd-vaults-of-knowledge = callPackage ./aotd-vaults-of-knowledge.nix { };
    aotd-virtues-of-society = callPackage ./aotd-virtues-of-society.nix { };
    armaa = callPackage ./armaa.nix { };
    automated-commands = callPackage ./automated-commands.nix { };
    autosave = callPackage ./autosave.nix { };
    brighton-federation = callPackage ./brighton.nix { };
    buildStarsectorMod = callPackage ./buildStarsectorMod.nix { };
    combat-chatter = callPackage ./combat-chatter.nix { };
    commissioned-crews = callPackage ./commissioned-crews.nix { };
    console-commands = callPackage ./console-commands.nix { };
    dassault-mikoyan-engineering = callPackage ./dme.nix { };
    detailed-combat-results = callPackage ./detailed-combat-results.nix { };
    diable-avionics = callPackage ./diable-avionics.nix { };
    everybody-loves-koc = callPackage ./koc.nix { };
    fleet-size-by-dp = callPackage ./fleet-size-by-dp.nix { };
    forge-production = callPackage ./forge-production.nix { };
    grand-colonies = callPackage ./grand-colonies.nix { };
    graphicslib = callPackage ./graphicslib.nix { };
    hazard-mining-incorporated = callPackage ./hmi.nix { };
    hmi-supervillains = callPackage ./hmi-supervillains.nix { };
    illustrated-entities = callPackage ./illustrated-entities.nix { };
    industrial-evolution = callPackage ./indevo.nix { };
    interstellar-imperium = callPackage ./interstellar-imperium.nix { };
    iron-shell = callPackage ./iron-shell.nix { };
    lazylib = callPackage ./lazylib.nix { };
    luddic-enhancement = callPackage ./luddic-enhancement.nix { };
    lunalib = callPackage ./lunalib.nix { };
    magiclib = callPackage ./magiclib.nix { };
    nexerelin = callPackage ./nexerelin.nix { };
    nomadic-survival = callPackage ./nomadic-survival.nix { };
    phillip-andrada-gas-station-manager = callPackage ./PAGSM.nix { };
    portrait-changer = callPackage ./portrait-changer.nix { };
    progressive-smods = callPackage ./progressive-smods.nix { };
    random-assortment-of-things = callPackage ./RAT.nix { };
    retrolib = callPackage ./retrolib.nix { };
    roider-union = callPackage ./roider-union.nix { };
    ruthless-sector = callPackage ./ruthless-sector.nix { };
    scalartech-solutions = callPackage ./scalartech-solutions.nix { };
    secrets-of-the-frontier = callPackage ./sotf.nix { };
    sephira-conclave = callPackage ./sephira-conclave.nix { };
    ship-and-weapon-pack = callPackage ./ship-and-weapon-pack.nix { };
    space-truckin = callPackage ./space-truckin.nix { };
    special-hullmod-upgrades = callPackage ./special-hullmod-upgrades.nix { };
    speedup = callPackage ./speedup.nix { };
    starship-legends = callPackage ./starship-legends.nix { };
    stellar-networks = callPackage ./stellar-networks.nix { };
    stinger-shipyards = callPackage ./stinger-shipyards.nix { };
    substance-abuse = callPackage ./substance-abuse.nix { };
    tahlan-shipworks = callPackage ./tahlan-shipworks.nix { };
    terraforming-and-station-construction = callPackage ./tasc.nix { };
    too-much-information = callPackage ./tmi.nix { };
    underworld = callPackage ./underworld.nix { };
    united-aurora-federation = callPackage ./uaf.nix { };
    volkov-industrial-conglomerate = callPackage ./vic.nix { };
    whichmod = callPackage ./whichmod.nix { };
    whichindustry = callPackage ./whichindustry.nix { };
    whichtmi = callPackage ./whichtmi.nix { };
  }
)
