#!/usr/bin/env bash
# cecho
#
# echo with a dash of colour
#
# Author:      René Hansen renehh@gmail.com
# License:     http://rhardih.mit-license.org/
#
# Attribution: Giles Orr, Daniel Crisman
# http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

cecho() {
  local OPTIND fg bg n E

  usage() {
    echo "usage: cecho options"
    echo
    echo "Colour echo"
    echo
    echo "Wrapper for echo with explicit options to set for- and background"
    echo "colours."
    echo ""
    echo "EXTRA OPTIONS:"
    echo "-h         Show this message"
    echo "-b <value> Background colour"
    echo "-f <value> Foreground colour"
    echo "-a         Show available colour values for f and b"
    echo ""
    echo "ECHO OPTIONS:"
    echo "-n         Trailing newline is suppressed"
    echo "-e         Interpretation of backslash-escaped characters"
    echo "           is enabled (See bash man page)"
    echo "           *Always on to enable colours*"
    echo "-E         Disables the interpretation of escape characters"
    echo
  }

  available_colours() {
    echo -e "Available colour values:\n"

    echo "b: 40-47"
    echo "f: 30-37"

    echo -e '\nExamples:\n'

    echo '    40    41    42    43    44    45    46    47'
    for fg in '  ' '30' '31' '32' '33' '34' '35' '36' '37'; do
      echo -n "$fg"

      for bg in 40 41 42 43 44 45 46 47; do
        echo -en "\033[${fg}m\033[${bg}m  ab  \033[0m"
      done

      echo
    done
    echo
  }

  while getopts ":hb:f:anE" OPTION; do
    case $OPTION in
      a)
        available_colours
        unset available_colours
        return 0
        ;;
      h)
        usage
        unset usage
        return 0
        ;;
      b)
        bg="\033[${OPTARG}m"
        ;;
      f)
        fg="\033[${OPTARG}m"
        ;;
      n)
        n="-n"
        ;;
      E)
        E="-E"
        ;;
    esac
  done

  stripped_opts=${@:$OPTIND}
  end="\033[0m"

  echo -e $n $E "$fg$bg$stripped_opts$end"
}
