#!/bin/bash

#apt-get update -y
#apt-get upgrade -y

#echo "Installing ansible"
apt-get install -y python3 ansible git

# Fetch all of the directories in the provision/migrations directory
for dir in `ls -d Installables/*/ | sort` ; do
	# We run all of the scripts in the directory in alphabetical order
	NAME=`echo $dir | sed 's/Installables\///' | sed 's/\///'`
	echo "************* INSTALLING $NAME" 

	for FILE in `find Installables/$NAME -type f | sort`;do
	echo '######'$FILE
	ansible-playbook  --connection=local --inventory 127.0.0.1, $FILE
	done
	#export ANSIBLE_HOST_KEY_CHECKING=False;
	#ansible-playbook  -u root -i "$2," --private-key $1 -e "migration_name=$NAME domain=$3" migrations/install_provision.yml;
done

echo "ok ttyl"
