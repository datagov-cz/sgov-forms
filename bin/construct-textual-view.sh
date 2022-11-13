#!/bin/bash

PROJECT_DIR=$(dirname $(readlink -m $0/..))

if [ ! "$#" -eq 1 ]; then
      echo Construct textual view of form for specified ENTITY_NAME.
      echo Usage :  $0 "ENITY_NAME"
      echo Example:
      echo "  $0 aktuality"
      echo "  $0 sportoviště"
      echo "  $0 turistické-cíle"
      echo "  $0 události"
      exit
fi

. $PROJECT_DIR/bin/set-env.sh

ENTITY_NAME=$1

#SPIPES_SERVICE=http://localhost:8080/s-pipes

PREFIX="http://onto.fel.cvut.cz/ontologies/kodi/debug/"
_pId="${PREFIX}construct-textual-view"
_pConfigURL="$PROJECT_DIR/debug/construct-textual-view.config.ttl"

echo "==================================="
echo "INFO: s-pipes url $SPIPES_SERVICE"
echo "INFO: moduleId (_pId) $_pId"
echo "INFO: _pConfigURL $_pConfigURL"
echo "==================================="

INPUT_FORM_FILE="$PROJECT_DIR/generated-forms/form-kodi-$ENTITY_NAME.ttl"
OUTPUT_FILE=$(echo $INPUT_FORM_FILE | sed 's/.ttl$/-textual-view.json/')
TEXT_OUTPUT_FILE=$(echo $INPUT_FORM_FILE | sed 's/.ttl$/-textual-view.txt/')
APPROVED_TEXT_OUTPUT_FILE=$(echo $INPUT_FORM_FILE | sed 's/.ttl$/-textual-view-approved.txt/')

URL="$SPIPES_SERVICE/module?_pId=$_pId&_pConfigURL=$_pConfigURL"

set -x

curl --location --request POST --header 'Content-Type: text/turtle' --data "@$INPUT_FORM_FILE"  "$URL" > $OUTPUT_FILE

set +x

echo INFO: Textual view for each question created in $OUTPUT_FILE.

#https://slovník.gov.cz/datový/turistické-cíle/pojem/turistický-cíl-0-q
cat $OUTPUT_FILE | grep -A1 0-q | sed -n 's/.*textual-view.....//p'  | sed 's/.."$//' | sed "s/\\\\n/\n/g" > $TEXT_OUTPUT_FILE


echo INFO: Whole form textual view created in $TEXT_OUTPUT_FILE .

#meld $TEXT_OUTPUT_FILE $APPROVED_TEXT_OUTPUT_FILE 5>/dev/null 2>/dev/null &
