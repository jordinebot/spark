# spark
**Spark** is a script to setup the minimal configuration that I want in my OSX.

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
    brew cask install bitwarden tresorit
    ```

    Consider downloading these critical packages from owner's website:

    * https://bitwarden.com/#download
    * https://tresorit.com/download/mac


1. Set key permissions

    ```sh
    chmod 700 ~/.ssh && chmod 644 ~/.ssh/* && chmod 400 ~/.ssh/id_rsa ~/.ssh/*.pem
    ```

1. Add keys to `ssh-agent` (`--apple-use-keychain` to store passphrase into System's Keychain)

    ```sh
    eval "$(ssh-agent -s)"
    ssh-add --apple-use-keychain ~/.ssh/id_rsa
    ```

## Setup git
1. Install latest **[git](https://git-scm.com/)**

    ```sh
    brew install git
    ```

1. Clone **spark**

    ```sh
    git clone git@github.com:jordinebot/spark.git ~/.spark
    ```

1. Install latest **[zsh](http://zsh.sourceforge.net)** and set it as default shell

    ```sh
    brew install zsh
    chsh -s /bin/zsh
    ```

1. Install **[iTerm](https://iterm2.com/)**

    ```sh
    brew cask install iterm2
    ```

## Run script
1. Spark!

    ```sh
    chmod +x ~/.spark/spark.sh
    ~/.spark/spark.sh
    ```
