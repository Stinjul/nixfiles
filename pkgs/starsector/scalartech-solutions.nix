{
  buildStarsectorMod,
  fetchzip,
  jaq,
}:
buildStarsectorMod rec {
  pname = "scalartech-solutions";
  version = "0.9.1";

  src = fetchzip {
    url = "https://github.com/niatahl/tahlan-scalartech/releases/download/${version}/scalartech-solutions-${version}.zip";
    sha256 = "sha256-KkpUIwEgkMeph1xPQ6SINjC/GezzJZ/REG9gKNtkNzw=";
  };
  # I HATE JSON COMMENTS I HATE JSON COMMENTS I HATE JSON COMMENTS
  postInstall = ''
    fix_weapon_normal() {
        mv $out/graphics/tahlan/maps/weapons_normals/$1 $out/graphics/tahlan/maps/weapons_normals/$2
    }
    fix_weapon_normal tahlan_percale_cover_l_Normal.png tahlan_percale_cover_l_normal.png
    fix_weapon_normal tahlan_percale_cover_r_Normal.png tahlan_percale_cover_r_normal.png
    fix_weapon_normal tahlan_banshee_cover_1_Normal.png tahlan_banshee_cover_1_normal.png
    fix_weapon_normal tahlan_banshee_cover_2_Normal.png tahlan_banshee_cover_2_normal.png
    fix_weapon_normal tahlan_banshee_cover_3_Normal.png tahlan_banshee_cover_3_normal.png
    ${jaq}/bin/jaq -i '.gameVersion = "0.97a"' $out/mod_info.json
  '';
}
