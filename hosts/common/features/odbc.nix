{ pkgs, ... }:
{
  environment.unixODBCDrivers = with pkgs.unixODBCDrivers; [
    msodbcsql18
    psql
    sqlite
  ];
}
