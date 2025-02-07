{ pkgs, lib, ... }:
{
  xdg.dataFile."starsector/mods".source =
    let
      mods = with pkgs.starsectorMods; [
        a-new-level-of-confidence-40
        angry-periphery
        aotd-ashlib
        aotd-dreams-of-past
        aotd-question-of-loyalty
        aotd-vaults-of-knowledge
        aotd-virtues-of-society
        armaa
        automated-commands
        autosave
        brighton-federation
        building-menu-overhaul
        combat-chatter
        commissioned-crews
        console-commands
        dassault-mikoyan-engineering
        detailed-combat-results
        diable-avionics
        everybody-loves-koc
        fleet-size-by-dp
        forge-production
        grand-colonies
        graphicslib
        hazard-mining-incorporated
        hmi-supervillains
        illustrated-entities
        industrial-evolution
        interstellar-imperium
        iron-shell
        lazylib
        luddic-enhancement
        lunalib
        magiclib
        nexerelin
        nomadic-survival
        phillip-andrada-gas-station-manager
        portrait-changer
        progressive-smods
        random-assortment-of-things
        retrolib
        roider-union
        ruthless-sector
        scalartech-solutions
        secrets-of-the-frontier
        sephira-conclave
        ship-and-weapon-pack
        space-truckin
        special-hullmod-upgrades
        speedup
        starship-legends
        stellar-networks
        stinger-shipyards
        substance-abuse
        tahlan-shipworks
        terraforming-and-station-construction
        too-much-information
        underworld
        united-aurora-federation
        volkov-industrial-conglomerate
        whichmod
        whichindustry
        whichtmi
      ];
    in
    pkgs.stdenv.mkDerivation {
      name = "starsector-mods";
      buildCommand = ''
        mkdir $out
        ${lib.concatMapStringsSep "\n" (mod: ''ln -s ${mod} $out/${mod.drvAttrs.pname}'') mods}
        ${pkgs.jaq}/bin/jaq '[.id]' $out/*/mod_info.json | ${pkgs.jaq}/bin/jaq -s '{enabledMods: add}' > $out/enabled_mods.json
      '';
    };
  # xdg.dataFile = builtins.listToAttrs (
  #   builtins.map
  #     (x: {
  #       name = "starsector/mods/${x.drvAttrs.pname}";
  #       value = {
  #         source = x.outPath;
  #       };
  #     })
  #     (
  #       with pkgs.starsectorMods;
  #       [
  #         angry-periphery
  #         aotd-ashlib
  #         aotd-cryosleeper-options
  #         aotd-question-of-loyalty
  #         aotd-vaults-of-knowledge
  #         aotd-virtues-of-society
  #         armaa
  #         autosave
  #         brighton-federation
  #         combat-chatter
  #         commissioned-crews
  #         console-commands
  #         dassault-mikoyan-engineering
  #         detailed-combat-results
  #         diable-avionics
  #         everybody-loves-koc
  #         fleet-size-by-dp
  #         forge-production
  #         grand-colonies
  #         graphicslib
  #         hazard-mining-incorporated
  #         hmi-supervillains
  #         illustrated-entities
  #         industrial-evolution
  #         interstellar-imperium
  #         iron-shell
  #         lazylib
  #         luddic-enhancement
  #         lunalib
  #         magiclib
  #         nexerelin
  #         nomadic-survival
  #         phillip-andrada-gas-station-manager
  #         portrait-changer
  #         progressive-smods
  #         retrolib
  #         roider-union
  #         ruthless-sector
  #         scalartech-solutions
  #         secrets-of-the-frontier
  #         sephira-conclave
  #         ship-and-weapon-pack
  #         space-truckin
  #         special-hullmod-upgrades
  #         speedup
  #         starship-legends
  #         stellar-networks
  #         substance-abuse
  #         tahlan-shipworks
  #         terraforming-and-station-construction
  #         too-much-information
  #         underworld
  #         united-aurora-federation
  #         volkov-industrial-conglomerate
  #         whichmod
  #         whichindustry
  #         whichtmi
  #       ]
  #     )
  # );
}
