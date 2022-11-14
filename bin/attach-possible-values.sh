#!/bin/bash

PROJECT_DIR=$(dirname $(readlink -m $0/..))

if [ ! "$#" -eq 1 ]; then
      echo Attach possible values to form for specified ENTITY_NAME.
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
_pId="${PREFIX}attach-possible-values"
_pConfigURL="$PROJECT_DIR/debug/attach-possible-values.config.ttl"


echo "==================================="
echo "INFO: s-pipes url $SPIPES_SERVICE"
echo "INFO: moduleId (_pId) $_pId"
echo "INFO: _pConfigURL $_pConfigURL"
echo "==================================="

INPUT_FORM_FILE="$PROJECT_DIR/generated-forms/form-kodi-$ENTITY_NAME.ttl"
OUTPUT_FILE=$(echo $INPUT_FORM_FILE | sed 's/.ttl$/-with-possible-values.json/')

URL="$SPIPES_SERVICE/module?_pId=$_pId&_pConfigURL=$_pConfigURL"


set -x

curl --location --request POST --header 'Content-Type: text/turtle' --data "@$INPUT_FORM_FILE"  "$URL" > $OUTPUT_FILE

set +x

./bin/deploy-form-to-s-forms-projects.sh $OUTPUT_FILE
