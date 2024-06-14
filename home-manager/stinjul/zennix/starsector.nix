{ pkgs, ... }: {
  xdg.dataFile = builtins.listToAttrs
    (
      builtins.map
        (
          x: {
            name = "starsector/mods/${x.name}";
            value = {
              source = pkgs.fetchzip
                {
                  url = x.url;
                  sha256 = x.sha256;
                };
            };
          }
        ) [
        {
          name = "LunaLib";
          url = "https://github.com/Lukas22041/LunaLib/releases/download/1.8.5/LunaLib.zip";
          sha256 = "sha256-xxRK1aA7GxsvQdlNVHkhIbL3M3UmVMvWPfZ0m2/Jr7E=";
        }
        {
          name = "LazyLib";
          url = "https://github.com/LazyWizard/lazylib/releases/download/2.8b/LazyLib.2.8b.zip";
          sha256 = "sha256-0HypoB/ZW/1HdHJMTxEktnbSBWQBjvuxAgoq6c2uzbs=";
        }
        {
          name = "MagicLib";
          url = "https://github.com/MagicLibStarsector/MagicLib/releases/download/1.4.4/MagicLib.zip";
          sha256 = "sha256-un+GzEFuTToM8Ll7xwEovg1BL30I9ZiccACVvjthvio=";
        }
        # {
        #   name = "GraphicsLib";
        #   url = "https://bitbucket.org/DarkRevenant/graphicslib/downloads/GraphicsLib_1.9.0.7z";
        #   sha256 = "sha256-ZnpTOQTwzfBPKKBbRZ/yuBcSHc9QgOF2iXYCm63h4pY=";
        # }
        {
          name = "Industrial_Evolution";
          url = "https://bitbucket.org/SirHartley/deconomics/downloads/Industrial.Evolution3.3.e.zip";
          sha256 = "sha256-3v8v40oZ6G+gF8OurQuKcpSj2HE3aPkRM36XUiINggM=";
        }
        {
          name = "Grand_Colonies";
          url = "https://bitbucket.org/SirHartley/grand.colonies/downloads/Grand.Colonies2.0.e.zip";
          sha256 = "sha256-Lu3vJV1H1cB3GAuAB24KFwXV9r8vGwO1UcfawO3f13I=";
        }
        {
          name = "Illustrated_Entities";
          url = "https://bitbucket.org/SirHartley/illustrated.entites/downloads/Illustrated.Entities1.1.b.zip";
          sha256 = "sha256-QtqFssS5biWuZ10iP/cfk5JWaJrPS8e/RrvlDzi9Lhg=";
        }
        {
          name = "Substance_Abuse";
          url = "https://bitbucket.org/SirHartley/substance.abuse/downloads/Substance.Abuse1.1.b.zip";
          sha256 = "sha256-IxrrGCMHkerh/qQ1snp1VHeJNmVSrSD9VMscq1wqY7A=";
        }
        {
          name = "armaa";
          url = "https://github.com/gomarz/SS-armaa/releases/download/v3.0.6/SS-armaa-3.0.6.zip";
          sha256 = "sha256-38DiwC6QxFIa/1ke5Y05ZRG2cxjAGoAzjAKWy3v6cpE=";
        }
        {
          name = "Combat_Chatter";
          url = "https://github.com/Histidine91/SS-CombatChatter/releases/download/v1.14.1/CombatChatter_1.14.1.zip";
          sha256 = "sha256-C5Cglvz6vR3n+mxSN6ZkHxUqCX38VlzmTMWnrxLalTk=";
        }
        {
          name = "Detailed_Combat_Results";
          url = "https://bitbucket.org/NickWWest/starsectorcombatanalytics/downloads/DetailedCombatResults.5.4.0.zip";
          sha256 = "sha256-dDCklCebY6w8GXx5ihojh4A1WT6U1Rn4qSLNbIJpiDI=";
        }
        {
          name = "Diable_Avionics";
          url = "https://github.com/CaymonJoestar/Diable-Avionics/releases/download/Diable/Diable-Avionics.zip";
          sha256 = "sha256-G5slYIFiGI+kNDSkYVLa5MgWoysNIM0aHg02gRES+bM=";
        }
        {
          name = "Forge_Production";
          url = "https://github.com/Alaricdragon/ForgeProduction/archive/ab20707939afe11536bd78c51e8cacaccc50b562.zip";
          sha256 = "sha256-t/PUHJmZur+0mmbD9WSIoDxLzA2yFDbUvzVf3D/Kbmw=";
        }
        # {
        #   name = "Imperium";
        #   url = "https://bitbucket.org/DarkRevenant/interstellar-imperium/downloads/Interstellar_Imperium_2.6.4.7z";
        #   sha256 = "sha256-0BteGt0+W1vowNMSTuQT82nRxiMOy39XJy67YXFNoJg=";
        # }
        {
          name = "Luddic_Enhancement";
          url = "https://bitbucket.org/King_Alfonzo/i-will-make-sindria-great-again/downloads/Luddic_Enhancement_1_2_6e.zip";
          sha256 = "sha256-sqzDr0QAdVnQclOQXFe+0/kzO6JtfPE80XFiPmDsNjo=";
        }
        {
          name = "Special_Hullmod_Upgrades";
          url = "https://github.com/CremeDeFramboise/Special-Hullmod-Upgrades/releases/download/v1.5/Special.Hullmod.Upgrades.zip";
          sha256 = "sha256-I8EzI7SruAVkAfuEs+sk1QDsVuBFIBqjf3D2sN7Hnl8=";
        }
        {
          name = "Nexerelin";
          url = "https://github.com/Histidine91/Nexerelin/releases/download/v0.11.2b/Nexerelin_0.11.2b.zip";
          sha256 = "sha256-Ni+OEzwEBUuoEKKaEamtHreatcoWN1mHUiQIP1fRNKY=";
        }
        {
          name = "Progressive_SMods";
          url = "https://github.com/qcwxezda/Starsector-Progressive-S-Mods/releases/download/v1.0.0/Progressive.S-Mods.zip";
          sha256 = "sha256-Q7JUEofFu0G9koxF0rVgH05YCDuaFbnE1NvwJFsxsMg=";
        }
        {
          name = "Nomadic_Survival";
          url = "https://github.com/NateNBJ/NomadicSurvival/releases/download/v1.4.0/Nomadic.Survival.zip";
          sha256 = "sha256-5W+YuuEEw2TF/2FNIwP7WRqF6XQ65jd2/AON3kNnFP4=";
        }
        {
          name = "Ruthless_Sector";
          url = "https://github.com/NateNBJ/RuthlessSector/releases/download/v1.6.2/Ruthless.Sector.zip";
          sha256 = "sha256-Y2rXzjWaUx4xcJ5z9aDY/qocqygt3GXdRlttiU2Xflk=";
        }
        {
          name = "Starship_Legends";
          url = "https://github.com/NateNBJ/StarshipLegends/releases/download/v2.5.2/Starship.Legends.zip";
          sha256 = "sha256-NKa1rkI1JTzwWeMUQMYJcU2IJMK76IbrASsvnQGSNV4=";
        }
        # {
        #   name = "Ship_Weapon_Pack";
        #   url = "https://bitbucket.org/modmafia/ship-weapon-pack/downloads/Ship_and_Weapon_Pack_1.15.1.7z";
        #   sha256 = "sha256-puZeVF9e4LKybKCct75fh3szRalTGvltgj2ziEz1l/o=";
        # }
        {
          name = "Commissioned_Crews";
          url = "https://github.com/TechpriestEnginseer/solid-winner/releases/download/1.999999gggg/Commissioned.Crews.zip";
          sha256 = "sha256-wpMeqmia8tdbOCAIBk7LCi3/vVLEqGr519N+FDHDlXM=";
        }
        {
          name = "Too_Much_Information";
          url = "https://github.com/TechpriestEnginseer/solid-winner8/releases/download/0.98a/Too.Much.Information.zip";
          sha256 = "sha256-jpVnM+eKneHXIzFYzDH9aRPKYbvM4Hf6FAOI+ne5u+4=";
        }
        # {
        #   name = "Underworld";
        #   url = "https://bitbucket.org/modmafia/underworld/downloads/Underworld_1.8.3.7z";
        #   sha256 = "sha256-J1ajPP/AkINuEHpC/RJyeUZUuJB3r8hOCfHLHCZVPmE=";
        # }
        {
          name = "Which_Mod";
          url = "https://github.com/theDragn/whichmod/releases/download/1.2.2/WhichMod_v1.2.2a.zip";
          sha256 = "sha256-l9gxhXqnXOVK80otjxiPrLNl6Y84QmD4Y9sBin3F0wA=";
        }
        {
          name = "Which_TMI";
          url = "https://github.com/PrincessOfEvil/WhichTMI/archive/refs/tags/1.2.0.zip";
          sha256 = "sha256-l9TLPUQ40pZ2dxvIzw/HHOEXa6ENyuGRtxOvnC4pWJw=";
        }
        {
          name = "Fleet_Size_by_DP";
          url = "https://bitbucket.org/Chozo/fleetsizebydp/downloads/FleetSizeByDP-1.0.2b_97.zip";
          sha256 = "sha256-j6g9rzWST2QencMC60ah0gsf1wRQK2C3s1H/ndYzCXI=";
        }
        # Mods with unusable download links, manual version changes or other weird stuff:
        # KoC
        # AotD
        # Autosave
        # Console Commands
        # DME
        # HMI
        # Iron Shell
        # PAGSM
        # Portrait Changer
        # Roider Union/Retro Lib
        # Scalartech
        # Sephira Conclave
        # Space Truckin
        # SpeedUp
        # stelnet
        # Tahlan
        # Terraformaing and Station Construction
        # UAF
        # VIC
        # Which-Industry
      ]);
}
