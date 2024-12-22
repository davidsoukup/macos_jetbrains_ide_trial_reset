#!/bin/bash

OS_NAME=$(uname -s)
JB_PRODUCTS="IntelliJIdea CLion PhpStorm GoLand PyCharm WebStorm Rider DataGrip RubyMine AppCode"

if [ "$OS_NAME" == "Darwin" ]; then
  killall cfprefsd

  for PRD in $JB_PRODUCTS; do
            echo "Reseting ${PRD}"
          rm -rf ~/Library/Preferences/"${PRD}"*/eval
          sed -i '' '/name="evlsprt.*"/d' ~/Library/Preferences/"${PRD}"*/options/other.xml >/dev/null 2>&1
          rm -rf ~/Library/Application\ Support/JetBrains/"${PRD}"*/eval
          sed -i '' '/name="evlsprt.*"/d' ~/Library/Application\ Support/JetBrains/"${PRD}"*/options/other.xml >/dev/null 2>&1
  done

  plutil -remove "/.JetBrains\.UserIdOnMachine" ~/Library/Preferences/com.apple.java.util.prefs.plist >/dev/null
  plutil -remove "/.jetbrains/.user_id_on_machine" ~/Library/Preferences/com.apple.java.util.prefs.plist >/dev/null
  plutil -remove "/.jetbrains/.device_id" ~/Library/Preferences/com.apple.java.util.prefs.plist >/dev/null
else
  echo 'Unsupported OS'
  exit
fi

echo 'Done ;)'