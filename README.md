# spark

1. Run **Terminal**

1. Install **[Homebrew](https://brew.sh)** and tap versions
   
    ```sh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap homebrew/cask-versions
    ```
    
1. Install security apps and sync `~/.ssh` 

    ```sh
    brew cask install bitwarden tresorit nordvpn
    ```
    
1. Set key permissions

    ```sh
    chmod 700 ~/.ssh && chmod 644 ~/.ssh/* && chmod 600 ~/.ssh/id_rsa ~/.ssh/*.pem
    ```

1. Add keys to `ssh-agent`

    ```sh
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ```
    
1. Clone **spark**

    ```sh
    git clone git@github.com:jordinebot/spark.git
    ```
    
1. Install **[zsh](http://zsh.sourceforge.net)**

    ```sh
    brew install zsh
    ```

1. Install **iTerm**

    ```sh
    brew cask install iterm2
    ```

1. Setup iTerm preferences

    ```sh
    # Specify the preferences directory
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/spark/iterm2"
    # Tell iTerm2 to use the custom preferences in the directory
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
    ```
    
