#!/bin/bash

while getopts v: OPT
do
  case $OPT in
    "v" ) OPT_V="$OPTARG" ;;
      * ) echo "Usage: $CMDNAME [-v VALUE]" 1>&2
          exit 1 ;;
  esac
done

filter=""
if [[ -n OPT_V ]]; then
  instances=$(aws ec2 describe-instances --filters "Name=vpc-id,Values=${OPT_V}" --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[],PrivateIpAddress]' --output text)
else
  instances=$(aws ec2 describe-instances --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[],PrivateIpAddress]' --output text)
fi

name=""
for item in ${instances[@]}; do
  if [[ $item =~ ^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$ ]];then
    if [[ -n $name ]];then
      printf "%s\n" "$name"
    fi
    name=`printf "%-15s" $item`
  else
    name="$name $item"
  fi
done
if [[ -n $name ]];then
  printf "%s\n" "$name"
fi