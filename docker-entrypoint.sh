#!/bin/sh

# Define default values.
: ${FLOWER_BROKER_URL:="amqp://guest:guest@localhost:5672//"}

# Launch Flower.
exec celery flower --broker=$FLOWER_BROKER_URL
