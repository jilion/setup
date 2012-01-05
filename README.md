# Jilion setup

This repository groups all Jilion dotfiles/conventions/bookmarklets/themes

## Installation

``` bash
git clone git@github.com:jilion/setup.git $JILION_PATH/Products/setup
```

### Bash

Add at the top of your ~/.bashrc

``` bash
export JILION_PATH=<path to your Jilion projects dir.>

. $JILION_PATH/Products/setup/dotfiles/bashrc
```

### ZSH

Add at the top of your ~/.zshrc

``` bash
export JILION_PATH=<path to your Jilion projects dir.>

. $JILION_PATH/Products/setup/dotfiles/zshrc
```

## Update

Just use these 2 aliases

``` bash
js && gl
```

Quick aliases update alias:

``` bash
jsau
```

## Documentations

- [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) ([RailsCast](http://railscasts.com/episodes/308-oh-my-zsh))
