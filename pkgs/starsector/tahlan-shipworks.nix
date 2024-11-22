{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "tahlan-shipworks";
  version = "1.3";

  src = fetchzip {
    url = "https://github.com/niatahl/tahlan-shipworks/releases/download/${version}/tahlan-shipworks-${version}.zip";
    sha256 = "sha256-mDryToVVmZkzJzBqEWGQS6HRphjGtNLlAMX3zry/dXM=";
  };
  postInstall = ''
    fix_weapon_normal() {
        mv $out/graphics/tahlan/maps/weapon_normals/$1 $out/graphics/tahlan/maps/weapon_normals/$2
    }
    fix_weapon_normal tahlan_nibelung_cover_L_Normal.png tahlan_nibelung_cover_L_normal.png
    fix_weapon_normal tahlan_nibelung_cover_R_Normal.png tahlan_nibelung_cover_R_normal.png
    fix_weapon_normal tahlan_fountainfall_l_Normal.png tahlan_fountainfall_l_normal.png
    fix_weapon_normal tahlan_fountainfall_r_Normal.png tahlan_fountainfall_r_normal.png
    fix_weapon_normal tahlan_stahlherz_shoulder_l_Normal.png tahlan_stahlherz_shoulder_l_normal.png
    fix_weapon_normal tahlan_stahlherz_shoulder_r_Normal.png tahlan_stahlherz_shoulder_r_normal.png
    fix_weapon_normal tahlan_nelson_cover_Normal.png tahlan_nelson_cover_normal.png
    fix_weapon_normal tahlan_nelson_xiv_cover_Normal.png tahlan_nelson_xiv_cover_normal.png
  '';
}
