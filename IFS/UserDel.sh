while IFS=":" read un ui gi gr; do
echo $usr
userdel -rf $usr
done < userlist.txt
