#!/bin/bash
sed -i 's*\${HOSS_TI}*/ti*g' $1/.cproject
sed -i 's*\${HOSS_WORKSPACE}*/builds/h-mobility*g' $1/.cproject
sed -i 's*\$%7BHOSS_TI%7D*/ti*g' $1/.project 
sed -i 's*\$%7BHOSS_WORKSPACE%7D*/builds/h-mobility*g' $1/.project
