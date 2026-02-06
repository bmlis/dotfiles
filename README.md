# dotfiles

1. [Install chezmoi](https://www.chezmoi.io/install/)
1. Install brew on darwin <https://brew.sh/>
1. `chezmoi init https://github.com/bmlis/dotfiles.git
`
1. After 1Password is installed:
   1. Create a gh-ssh-key in Private vault
   1. Make sure there is "Default" identity with first name, last name and email matching your GitHub profile
1. `chezmoi apply`
1. Change origin to ssh one
