# CLI tools
brew install zsh
brew install fzf
brew install direnv
brew install tree
brew install jq
brew install git
brew install git-lfs
brew install curl
brew install fig
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install openssh

# Applications
brew install --cask iterm2
brew install --cask rectangle

# backup existing .zshrc files
mv ~/.zshrc ~/.zshrc_bak

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Copy configs
cp ./nix/.zshrc ~
cp -R ./config/. ~