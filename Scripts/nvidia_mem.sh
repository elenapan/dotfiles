# Prints used GPU global memory
# Work in progress
while :
do
	nvidia-settings -q all | grep -i "attribute 'useddedi"
done
