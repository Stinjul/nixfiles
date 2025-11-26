# Behold, overengineering a stupid string for qtct
{
  family,
  pointSize ? -1,
  pixelSize ? -1,
  styleHint ? 5,
  style ? 0,
  underline ? false,
  strikeOut ? false,
  fixedPitch ? false,
  styleName ? "",

  weightQt5 ? 50,
  weightOpenType ? null,

  capitalization ? 0,
  letterSpacingType ? 0,
  letterSpacing ? 0,
  wordSpacing ? 0,
  stretch ? 0,
  styleStrategy ? 1,
}:
let
  boolStr = b: if b then "1" else "0";

  legacyToOpenTypeWeight = {
    "0" = 100;
    "12" = 200;
    "25" = 300;
    "50" = 400;
    "57" = 500;
    "63" = 600;
    "75" = 700;
    "81" = 800;
    "87" = 900;
  };

  convertLegacyWeight =
    w:
    if legacyToOpenTypeWeight ? ${toString w} then
      legacyToOpenTypeWeight.${toString w}
    else
      throw "Unknown Qt5 weight ${toString w}. Valid: ${builtins.concatStringsSep ", " (builtins.attrNames legacyToOpenTypeWeight)}";
  weightQt6 = if weightOpenType != null then weightOpenType else convertLegacyWeight weightQt5;

  # https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/text/qfont.cpp?h=5.15#n2110
  qt5Fields = [
    family
    (toString pointSize)
    (toString pixelSize)
    (toString styleHint)
    (toString weightQt5)
    (toString style)
    (boolStr underline)
    (boolStr strikeOut)
    (boolStr fixedPitch)
    "0"
  ]
  ++ (if styleName != "" then [ styleName ] else [ ]);

  # https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/text/qfont.cpp?h=6.9.3#n2161
  qt6Fields = [
    family
    (toString pointSize)
    (toString pixelSize)
    (toString styleHint)
    (toString weightQt6)
    (toString style)
    (boolStr underline)
    (boolStr strikeOut)
    (boolStr fixedPitch)
    "0"
    (toString capitalization)
    (toString letterSpacingType)
    (toString letterSpacing)
    (toString wordSpacing)
    (toString stretch)
    (toString styleStrategy)
  ]
  ++ (if styleName != "" then [ styleName ] else [ ]);

in
{
  qt5String = builtins.concatStringsSep "," qt5Fields;
  qt6String = builtins.concatStringsSep "," qt6Fields;
}
