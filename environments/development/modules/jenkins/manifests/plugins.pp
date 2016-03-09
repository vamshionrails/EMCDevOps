define jenkins::plugins ($pluginpath) {
                file {"$title":
                        ensure  => file,
                        source => $pluginpath,
                        owner => "jenkins",
                        group => "jenkins",
                        mode => "644",
                        notify => Service["jenkins"],
                        require => File["${jenkins::pathvariable}/plugins"],
                }
}
