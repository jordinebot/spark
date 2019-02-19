# spark

## Basics

1. Run **Terminal**

1. Install **[Homebrew](https://brew.sh)** and tap versions
   
    ```sh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap homebrew/cask-versions
    ```
    
## SSH Keys
    
1. Install security apps and sync `~/.ssh` 

    ```sh
    brew cask install bitwarden tresorit nordvpn
    ```
    
1. Set key permissions

    ```sh
    chmod 700 ~/.ssh && chmod 644 ~/.ssh/* && chmod 600 ~/.ssh/id_rsa ~/.ssh/*.pem
    ```

1. Add keys to `ssh-agent` (`-K` to store passphrase into System's Keychain)

    ```sh
    eval "$(ssh-agent -s)"
    ssh-add -K ~/.ssh/id_rsa
    ```

## Setup git
1. Install latest **[git](https://git-scm.com/)**
    
    ```sh
    brew install git
    ```
    
1. Configure global settings

    ```sh
    git config --global user.name "Jordi Nebot"
    git config --global user.email hola@jordinebot.cat
    ```

1. Clone **spark**

    ```sh
    git clone git@github.com:jordinebot/spark.git ~/.spark
    ```
    
1. Install **[zsh](http://zsh.sourceforge.net)**

    ```sh
    brew install zsh
    ```

1. Install **iTerm**

    ```sh
    brew cask install iterm2
    ```

## Spark!
1. Light the fire

    ```sh
    ~/.spark/spark.sh
    ```
    
