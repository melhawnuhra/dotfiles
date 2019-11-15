#!/usr/bin/bash

if test ! $(which spoof)
then
  sudo npm install spoof -g
fi

if test ! $(which gtop)
then
  sudo npm install gtop -g
fi

if test ! $(which fd)
then
  sudo npm install fd -g
fi

if test ! $(which ng)
then
  sudo npm install @angular/cli -g
fi

if test ! $(which localtunnel)
then
  sudo npm install localtunnel -g
fi

npm i -g neovim
npm i -g typescript
npm i -g alfred-npms
npm i -g npm-check-updates
