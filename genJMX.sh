#!/bin/bash

# Generate 9 digit random number for versioning, incremental would be better
random=$(cat /dev/urandom | tr -dc "0-9" | fold -w 9 | head -n 1)

for line in `cat config` 
do
	items=(${line//;/$'\n'})
	domain=$(echo ${items[0]}|xargs)
	name=$(echo ${items[1]}|xargs)
	cp template.json ${name}.json
	sed -i "s/<rand10>/${random}/g" ${name}.json
	sed -i "s/<app_name>/${name}/g" ${name}.json
	sed -i "s/<domain>/${domain}/g" ${name}.json
done
