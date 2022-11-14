#!/bin/bash

if [ ! "$#" -eq 1 ]; then
      echo Deploy form from FORM_FILE_PATH to SForms related projects. The form should be in json format.
      echo Usage :  $0 "FORM_FILE_PATH" 
      echo Example:
      echo "  $0 ./generated-forms/form-kodi-aktuality.json"
      echo "  $0 ./generated-forms/form-kodi-sportoviště.json"
      echo "  $0 ./generated-forms/form-kodi-turistické-cíle.json"
      echo "  $0 ./generated-forms/form-kodi-události.json"
      exit
fi

FORM_FILE_PATH=$1

echo "DEBUG: Copying form to SForms project ..."
cp $FORM_FILE_PATH /home/blcha/projects/s-forms/git/s-forms/src/stories/assets/form/
cp $FORM_FILE_PATH /home/blcha/projects/s-forms/git/s-forms/src/stories/assets/form/form1.json


echo "DEBUG: Copying form to SForms Components project ..."
cp $FORM_FILE_PATH /home/blcha/workspace/projects/s-forms/git/s-forms-components/src/stories/assets/
cp $FORM_FILE_PATH /home/blcha/workspace/projects/s-forms/git/s-forms-components/src/stories/assets/example_form.json

echo "DEBUG: Copying form to SForms Geo Components project ..."
cp $FORM_FILE_PATH /home/blcha/workspace/projects/s-forms/git/s-forms-geo-components/src/stories/assets/
cp $FORM_FILE_PATH /home/blcha/workspace/projects/s-forms/git/s-forms-geo-components/src/stories/assets/example_form.json
