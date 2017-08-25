#!/bin/sh
#this is ping wangluo
for i in {1..10}
do 
	ping -c2 10.0.0.$i &> /dev/null 
		
		if  [ $? -eq 1 ]; then
			echo "10.0.0.$i is down"
		else
			echo "10.0.0.$i is ok"
fi		                          
done
