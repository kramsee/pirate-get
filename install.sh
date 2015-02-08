#!/usr/bin/env sh
set -e

TMP=$(mktemp pirate-get-XXXXXX)

{
  if [ $(which python2.7) ]
  then
    python='python2.7'
  elif [ `which python2` ]
  then
    python='python2'
  else
    python='python'
  fi

  if [ $(which pip2.7) ]
  then
    pip='pip2.7'
  elif [ `which pip2` ]
  then
    pip='pip2'
  else
    pip='pip'
  fi

  echo "#!/usr/bin/env $python" > "$TMP" &&

  sed 1d $(dirname $0)/pirate-get.py >> "$TMP"

  cp "$TMP" /usr/bin/pirate-get &&
  chmod +x /usr/bin/pirate-get &&
  chmod 755 /usr/bin/pirate-get &&

  $pip install -r requirements.txt &&

  rm $TMP
} || rm $TMP
