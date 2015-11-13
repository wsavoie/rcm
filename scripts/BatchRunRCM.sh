#!/bin/bash
exePath="D:/RCMcode/RCM/Release/RCM.exe"


#varying LW
#lwArr=(1.4 1.3 1.2 1.1 1.0 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0);
#a1Arr=(70 70 70 70 70 70 70 70 70 70 70 70 70 70 70);
#a2Arr=(70 70 70 70 70 70 70 70 70 70 70 70 70 70 70);
#boxSizeArr=(122 122 122 122 122 122 122 122 122 122 122 122 122 122 122);

lwVals=(1.4 1.3 1.2 1.1 1.0 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0);
for z in `seq 0 14`; do
	for b in `seq 0 12`; do
	  lwArr[$b]=${lwVals[$z]};
	done;
	#lwArr=(0.0 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.7);
	a1Arr=(0 10 20 30 40 50 60 70 80 90 100 110 120);
	a2Arr=(0 10 20 30 40 50 60 70 80 90 100 110 120);
	boxSizeArr=(250 250 250 250 250 250 250 250 250 250 250 250 250);

	cd D:/RCMcode/RCM/Results;
	foldName=AngleChangeLW=${lwArr[1]};
	mkdir $foldName
	for i in `seq 0 12`; do
	  printf '\n%s\n' "$i"
	  #a=./$foldName/${lwArr[$i]}-${a1Arr[$i]}-${a2Arr[$i]}-$(date '+%Y%m%d-%H%M%S')
	  a=./$foldName/${lwArr[$i]}-${a1Arr[$i]}-${a2Arr[$i]}-${boxSizeArr[$i]}
	  mkdir $a
	  cd $a
	  $exePath ${a1Arr[$i]} ${a2Arr[$i]} ${lwArr[$i]} ${boxSizeArr[$i]};
	  cd ../..;
	done;
done;