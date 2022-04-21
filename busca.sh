#!/bin/bash
clear
echo "Busca.sh - busca hosts activos en una red"
echo "introduce la red en formato ip SIN el ultimo octeto"
echo "Ej.: 192.168.1"

read -p 'RED: ' red

i=1
h=1
while true
do
case $i in
255)
echo "Finalizado" 
break;;  
esac

p=$(ping -W 0.3 -s 2 -c 1 $red.$i | grep "1 received")

if [ -z $p ] ;then
let i++
let h++
clear
echo "Equipos escaneados: " $h
else

  ping -W 0.3 -s 2 -c 1 $red.$i | grep -e "---" -e "1 received" >> lanreport.txt
  let i++
  let h++
  clear
  echo "Equipos escaneados: " $h
 
fi

done

echo "Busqueda finalizada, puedes ver el resultado en el archivo lanreport.txt"

