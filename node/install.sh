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
