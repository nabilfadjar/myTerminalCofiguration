# My Terminal Cofiguration
#### Muhammad Nabil Fadhiya

### CURRENTLY THIS IS STILL IN DEVELOPEMNT BUT YOU CAN STILL RUN IT...

The repository name is referred to as myTerminalCofiguration.

## What is it?

This repository stores my personal configuration for how my terminal should be like.

## Who can use it?

Anyone can use it.

## What does it do?

This will edit `.bashrc` file if it exists by inserting the `.bash_feel` to be executed at the end of the file.

## What is `.bash_feel`?

This stores the configuration of how you would like your terminal to look like. See the sample `.bash_feel` file in this repository.

Note that this sample `.bash_feel` would need to have the following packages installed in the system before being able to run it:
- `fortune`
- `cowsay`
- `lolcat`

You can install these packages using your following package manager.
Debian/Ubuntu:
```
sudo apt-get install fortune cowsay lolcat
```

## What if there is already an existing `.bashrc`?

Your initial `.bashrc` will be saved as `.bashrc_backup` and we will insert a new `.bashrc` into your system.


## How to install it?

Just run `initBashFeelConfig.sh` and they will automatically configure your terminal. There will be prompts to warn you during the installation process.

Sample execution:
```
# Run this if you have not allowed user execution
chmod u+x initBashFeelConfig.sh

# Use this to execute the script
./initBashFeelConfig.sh
```

## Where has this been tested?

This has been tested on a clean build of "Ubuntu 16.04.1 LTS".

## Can I add my own configuration to this file?

As long as you edit the `.bash_feel` file with your own settings, you would be able to customise this to on your own.

## Special thanks
I would like to thank Saif Azmi for helping me out with this small project.
