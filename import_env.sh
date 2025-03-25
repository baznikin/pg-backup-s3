#!/bin/bash

# s3cmd config options
if env | grep '^S3_'
then
  echo -e "\n## S3 CONFIG ##\n" >> ~/s3cfg
  env | grep '^S3_' | while read I_CONF
  do
    CONFD_CONF_NAME=$(echo "$I_CONF" | cut -d'=' -f1 | sed 's/^S3_//g' | tr '[:upper:]' '[:lower:]')
    CONFD_CONF_VALUE=$(echo "$I_CONF" | sed 's/^[^=]*=//g')

    echo "${CONFD_CONF_NAME} = ${CONFD_CONF_VALUE}" >> ~/.s3cfg
  done
fi
