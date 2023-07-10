# talon-user

For Talon user folder where each subfolder is a git submodule.  Hopefully this will make it easier to get set up and stay updated.

Related documentation at https://jacobegner.wordpress.com/2023/06/21/talon-voice-and-extras-setup-notes/

## Setup

- Go to `C:\Users\MyUsername\AppData\Roaming\Talon` (Talon system tray icon => Scripting => Open ~/.talon) and launch a terminal.
- `git clone --recurse-submodules https://github.com/jmegner/talon-user.git user`

## Usage

If you have made changes in this repo and/or the submodules, then run:
`git commit -am "submodule update" && git push --recurse-submodules=on-demand`

If you want to get changes for this repo and/or the submodules, then run:
`git pull --recurse-submodules=yes`
