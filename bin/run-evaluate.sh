#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

__CHECKPOINT=$1 ; shift
__INPUT=$1 ; shift

if [ ! -e $__CHECKPOINT ] ; then
  echo "$__CHECKPOINT doesn't exist."
fi
if [ ! -e $__INPUT ] ; then
  echo "$__INPUT doesn't exist."
fi

__PREFIX=$(basename $__CHECKPOINT | sed -e 's/\.ckpt$//g')
__POSTFIX=$(basename $__INPUT)
__OUTPUT="out-${__PREFIX}-${__POSTFIX}"
python evaluate.py --checkpoint "$__CHECKPOINT" \
  --in-path "$__INPUT" \
  --out-path "$__OUTPUT"
