# talon-user

For Talon user folder where each subfolder is a git submodule.  Hopefully this will make it easier to get set up and stay updated.

Related documentation at https://jacobegner.wordpress.com/2023/06/21/talon-voice-and-extras-setup-notes/

## Setup

- Go to `C:\Users\MyUsername\AppData\Roaming\Talon` (Talon system tray icon => Scripting => Open ~/.talon) and launch a terminal.
- `git clone --recurse-submodules https://github.com/jmegner/talon-user.git user`

The above command seems to put the submodule .git folders as `user/.git/modules/MODULE_NAME/` folders.  Each `user/MODULE_NAME/.git` seems to be a text file that has contents `gitdir: ../.git/modules/MODULE_NAME/` (and newline char at end).

TODO: figure out how to do a recursive clone without the weird `user/.git/modules/MODULE_NAME/` folders.  Maybe do a `git clone && git submodule update --recursive --init --remote --merge`.

TODO: figure out how to get all submodules on the appropriate branches instead of detached heads; the branches are listed inside `.gitmodules` but don't seem to be used by the recursive clone.
Running `git pull && git submodule update --recursive --init --remote --merge` does not help.

## Usage

If you have made changes in this repo and/or the submodules, then run:
`git commit -am "submodule update" && git push --recurse-submodules=on-demand`

If you want to get changes for this repo and/or the submodules, then run:
`git pull && git submodule update --recursive --init --remote --merge`

Why?
- OMITTED `git submodule sync --recursive`; [this](https://git-scm.com/book/en/v2/Git-Tools-Submodules) says to use the command in case submodule URLs have changed, but I think a `git pull` on the supermodule takes care of that and more.
- `git pull`; should pull supermodule, which will update `.gitmodules` (submodules info).
- `git submodule update --recursive --init --remote --merge`
  - `--recursive` to do stuff on sub-submodules if needed.
  - `--init` to initialize any newly declared submodules.
  - `--remote` [doc](https://git-scm.com/docs/git-submodule#Documentation/git-submodule.txt---remote): "Instead of using the superproject’s recorded SHA-1 to update the submodule, use the status of the submodule’s remote-tracking branch."
  - `--merge` so that the remote submodule commits are merged into the submodule branch instead of the sub mutual getting a detached head.
  - I came up with this as a combo of `git submodule update --recursive --init` and `git submodule update --remote --merge` that I saw.

