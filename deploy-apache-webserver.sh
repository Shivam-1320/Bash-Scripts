#!/bin/bash

#assigning a variables

REPO_URL=https://github.com/Shivam-1320/Test_Repo-AWS.git
TARGET_DIR=/var/www/html

echo -e "1. \e[32m Updating package list....\e[0m"
sudo apt update -y > /dev/null 2>&1

if [ $? -eq 0 ] ; then

    echo -e "2. \e[32m System update successfully.\e[0m"
else
    echo -e "2. \e[31m sysytem update failed! \e[0m"
    exit 1
fi

    echo -e  "3. \e[32m installing apache web server....\e[0m"
    sudo apt install apache2 -y > /dev/null 2>&1

if [ $? -eq 0 ] ; then
    echo -e "4. \e[32m apache web server install successfully\e[0m"

else

    echo -e "4. \e[31m Failed to install Apache.\e[0m"

    exit 1

fi

    echo -e "5. \e[32m installing git package for clone directory... \e[0m"
    sudo apt install git -y > /dev/null 2>&1

if  [ $? -eq 0 ] ; then

   echo -e "6. \e[32m git install successfully \e[0m"

else

    echo -e "6. \e[31m Failed to install git package.\e[0m"

fi

    echo -e "7. \e[32m Cleaning the web directory... \e[0m"
    sudo find "$TARGET_DIR" -mindepth 1 -exec rm -rf {} +  > /dev/null 2>&1

if [ $? -eq 0 ] ; then

    echo -e  "8. \e[32m Directory is successfully clean \e[0m"

else

    echo -e "8. \e[31m Directory cleaning proccess is failed \e[0m"
    exit 1

 fi

    echo -e "9. \e[32m cloning GitHUb repo in web server....\e[0m"
    sudo git clone $REPO_URL $TARGET_DIR > /dev/null 2>&1

if [ $? -eq 0 ] ; then

    echo -e "10.\e[32m Repository clone successufull \e[0m"
else
    echo -e "10.  \e[31m Repository cloning is failed \e[0m"

    exit 1
fi

    echo -e "11.\e[32m Start and Enabling the apache web service.... \e[0m"
    sudo systemctl start apache2 --now > /dev/null 2>&1

if  [ $? -eq 0 ] ; then

     echo -e "12.\e[32m Apache service successufully start and enable on boot \e[0m"

else

     echo -e "12. \e[31m Failed to start apache2 on service! \e[0m"

     sudo /usr/sbin/apache2ctl start > /dev/null 2>&1

if  [ $? -eq 0 ] ; then

     echo -e "13. \e[33m Service is start with temporary fallback method! \e[0m"

else

     echo -e "13. \e[31m Apache failed to start even with fallback method. \e[0m"


  fi

fi
     echo
     echo
     echo
     echo -e "\e[32m Deployment completed successfully!\e[0m"
     echo
     echo
     echo -e "\e[36mScript created by: Pankaj Baghel \e[0m"
     echo -e "\e[36mGitHub: https://github.com/Shivam-1320\e[0m"

     exit 1
