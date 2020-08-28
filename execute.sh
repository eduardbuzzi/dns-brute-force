#!/bin/bash

domain(){
read -p "DOMAIN => " DOMAIN
if [ -z "$DOMAIN" ]
then
domain
fi
}

wordlist(){
read -p "WORDLIST => " WORDLIST
if [ -z "$WORDLIST" ] || [ ! -f "$WORDLIST" ]
then
wordlist
fi
}

principal(){
echo
domain
wordlist
echo
for palavra in $(cat $WORDLIST);
do
host $palavra.$DOMAIN | grep "address"
done
echo
principal
}
principal
