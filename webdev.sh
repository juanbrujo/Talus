  #!/bin/sh
# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#  Reset text attributes to normal + without clearing screen.
alias Reset="tput sgr0"

# Color-echo.
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}"
  Reset # Reset to normal.
  return
}

echo ""
cecho "##############################################" $red
cecho "#         Web Dev Global NPM Scripts			#" $red
cecho "##############################################" $red
echo ""
echo "Agree?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) echo "byebye"; exit 1;;
  esac
done

echo ""
cecho "Install GulpJS -g"  $white
npm install -g gulp

echo ""
cecho "Install GruntJS CLI -g"  $white
npm install -g grunt-cli

echo ""
cecho "Install Bower -g"  $white
npm install -g bower

echo ""
cecho "Install npm-check-updates -g"  $white
npm install -g npm-check-updates

echo ""
cecho "Done!" $white
echo ""
cecho "###############################################################################" $white
