#!/bin/bash

printf "\nInitial ship setup..."
printf "\n- Create a fakeship"

pier_name=wrdu-zod
ship_name=zod

while false; do    # TODO
  printf "\nEnter a filesystem-safe name to be used for the pier:\n"
  read pier_name
  printf "\nYou entered: $pier_name. Okay? (y/n)"
  read -n 1 decision
  case $decision in
    [yY])
      printf "\nOkay."
      break
    ;; # contiue
    [nN]) # try again
  esac
done

while false; do     # TODO
  printf "\nEnter a ship name (zod, sum, sogrum-savluc, etc):\n"
  read ship_name
  printf "\nYou entered: $ship_name. Okay? (y/n)"
  read -n 1 decision
  case $decision in
    [yY])
      printf "\nOkay."
      break
    ;; # contiue
    [nN]) # try again
  esac
done

printf "\nUsing ship: $ship_name, pier: $pier_name\n"

printf "\n\t- Do: \$urbit -F $ship_name -c $pier_name"
# sleep 1
printf "\n\t- Wait for boot to complete..."
printf "\n\nPress any key to continue when boot is complete"
read -n 1 advance

printf "\n\t- Shut down ship <ctrl-d>"
# sleep 1
printf "\n\t- Back up fakeship: \$cp -r $pier_name $pier_name-bak"
printf "\n\nPress any key to continue after copy is made"
read -n 1 advance

printf "\n\t- Start ship again: \$urbit $pier_name"

printf "\n\n- Create a development desk"
printf "\n\t1. dojo> |merge %%wrdu our %%base"
printf "\n\t2. dojo> |mount %%wrdu"
printf "\n\t3. Shut down ship <ctrl-d>"
printf "\n\nPress any key to continue after ship is down"
read -n 1 advance
printf "\n\t4. Clear out %%wrdu desk: \$rm -rf $pier_name/wrdu/*"

printf "\n\nPress any key to continue after directory is emptied"
read -n 1 advance

printf "\n\t- Back up wrdu ship again: \$cp -r $pier_name $pier_name-bak"
printf "\n\nPress any key to continue after copy is made"
read -n 1 advance

printf "\n\n- Install and run"

printf "\n\t1. Start ship again: \$urbit $pier_name"
printf "\n\t2. Copy in source code: \$cp -r [THIS REPO]/urbit/* $pier_name/wrdu/"
printf "\n\t3. dojo> |commit %%wrdu"
printf "\n\t4. dojo> |install our %%wrdu"

printf "\n\nPress any key to continue after install completes"
read -n 1 advance

printf "\n\n- Keep desk updated:"

printf "\n\t- [some watch script]"

printf "\nDone!"

printf "\n"
