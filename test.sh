#!/bin/bash
echo "Avaiable Stack Name .... "
sudo aws cloudformation describe-stacks --output yaml| grep StackName
echo  "stack name"
read stackname
echo  ".yaml file"
read ymlfile
echo  ".json file"
read jsonfile
create_stack(){
     test=$(sudo aws cloudformation create-stack --stack-name $stackname --template-body file://$ymlfile    --parameters file://$jsonfile  --region=us-east-1  --profile default)
     ret=$?
     if [ $ret == 0 ]; then
          echo "Done"
          return 0
     else 
          echo "Name already exist"
     fi
}
stack=$(create_stack)
ret=$?
if [ $ret == 0 ];then
     echo "$stack"
else
     echo "error : $ret"     
fi     