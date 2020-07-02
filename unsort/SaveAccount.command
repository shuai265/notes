#!/bin/bash

dirname=`dirname $0`


echo "buildscript {
    repositories {
        jcenter()
    }
    dependencies {
        classpath \"nu.studer:gradle-credentials-plugin:1.0.1\"
    }
}

apply plugin: 'nu.studer.credentials'" > /tmp/script

input_account_info() {
    echo -n "Input Your Git Username : "

    read username
    unset $PWORD
    PWORD=
    echo -n "Input Your Git Password : "

    stty_save=`stty -g`
    trap 'stty "$stty_save";' EXIT
    trap 'exit_loop=true; exit 10' HUP INT QUIT ABRT TERM  # how to kill the read?
    stty cbreak -echo </dev/tty >/dev/tty 2>&1  # raw mode
    
    # Prompt and read password one character at a time
    while IFS= read -r -n1 char; do
      # Was the read Interupted - not working yet
      [ "$exit_loop" -o $? -ne 0 ] && { code=03; break; }
    
      # Hexadecimal Code of the users key press...
      code="$( echo -n "$char" | od -An -tx1 | tr -d ' ' )"
      case "$code" in
      ''|03|0a|0d) break ;;               # Finish on EOF, ^C, LineFeed, or Return
      08|7f)                              # Backspace or Delete
          if [ -n "$PWORD" ]; then
            PWORD="$( echo "$PWORD" | sed 's/.$//' )"
            echo -n $'\b \b' >/dev/tty
          fi
          ;;
      15)                                 # ^U or kill line
          #echo -n "$PWORD" | tr -c '\b' '\b' >/dev/tty  # backspace
          #echo -n "$PWORD" | tr -c ' '  ' '  >/dev/tty  # clear stars
          #echo -n "$PWORD" | tr -c '\b' '\b' >/dev/tty  # backspace
          echo -n "$PWORD" | sed 's/./\cH \cH/g' >/dev/tty # remove in reverse
          PWORD=''
          ;;
      [01]?) ;;                           # Ignore ALL other control characters
      *)  PWORD="$PWORD$char"             # Normal char - record it
          echo -n '*' >/dev/tty
          ;;
      esac
    done
    
    # Disable TTY cbreak mode
    stty "$stty_save"
    trap - EXIT HUP INT QUIT TERM
    
    case "$code" in   # what was the last code - and report appropriatally
      03) echo >/dev/tty "==== INTERPUT ====" ;;   # currently does not happen
      *)  echo >/dev/tty ;
    esac
}

auth=

while true; do
    input_account_info
    auth=`curl -u $username:$PWORD -s http://192.168.1.29:8081/nexus/service/local/authentication/login`

    if [ -z "$auth" ]; then
        echo ""
        echo "Incorrect username or password. Please try again."
        echo ""
    else
        break
    fi
done

echo ""
echo "Start Saving Username and Password ..."
echo ""

conf=~/.gradle/gradle.properties
if [ ! -f $conf ] || [ -z `grep "username=" "$conf"` ]; then 
    echo "username=$username" >> $conf
else
    sed -E -i "" "s/username=.+/username=$username/g" $conf
fi

$dirname/gradlew -b/tmp/script addCredentials --key $username --value $PWORD

