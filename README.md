ey-script-wrapper
===================
This cookbook is an example that can be used to if you have a script or rake task
that needs to be run like a daemon and will enable you to monitor it with monit.

Installation
============
* Clone this repo, then copy this directory into your custom cookbooks directory.
* Change the variables at the top of recipes/default.rb to match your command name,
command to run and app name.
* Then edit your custom cookbook main/recipes/default.rb and add
    require_recipe "ey-script-wrapper"

Caveats
=======
* This script has been written with the assumption that it will run on a util
instance. Change line 17 of default.rb if that is not the case.
