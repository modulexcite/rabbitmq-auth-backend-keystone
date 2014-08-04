#!/bin/bash -v

# This script augments RabbitMQ Management UI Plugin to remove the
# UI elements responsible for managing passwords. 

set -eux

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
${PLUGIN_DIR=/usr/lib/rabbitmq/lib/rabbitmq_server-3.3.4/plugins}
unzip $PLUGIN_DIR/rabbitmq_management-0.0.0.ez
cp -f $DIR/*.ejs $PLUGIN_DIR/rabbitmq_management-0.0.0/priv/www/js/tmpl
mv -f $PLUGIN_DIR/rabbitmq_management-0.0.0.ez $PLUGIN_DIR/rabbitmq_management-0.0.0.ez.bak
zip -r -m $PLUGIN_DIR/rabbitmq_management-0.0.0.ez $PLUGIN_DIR/rabbitmq_management-0.0.0