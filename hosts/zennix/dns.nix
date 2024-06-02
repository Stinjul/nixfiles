{
    services.dnsmasq = {
        enable = true;
        resolveLocalQueries = true;
        settings = {
            address = "/stinjul.com/192.168.1.59";
        };
    };
}
