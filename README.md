# yconfig

Simple config loader based on yaml files.  In it's most basic usage it allows us to load a config file in yaml format and convert it to a ruby hash.

Yconfig provides the additional benefit of allowing for a default configuration file by convention.  It handles this case by assuming that if you want to load myproj_config.yaml then you may also want to merge in default settings from myproj_config_default.yaml.

This is an example where you have a multi-node deployment and want a section of the config to be exactly the same and deployed across all nodes but a seperate set of configs that are custom on a per-node basis.

# Installation and Usage

* Install the gem.     `gem install yconfig`
* Add the requirement. `require 'yconfig'`
* Load the config file:

`root_dir = "/path/to/dir"`<br>
`file_name = "config.yaml"`<br>
`config = YConfig.new(root_dir).parse file_name`<br>
