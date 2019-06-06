CLIENT_ID=`cat /home/florian/.bin/sh/token`
URL="https://api.imgur.com/3/image"
maim -s -u | base64 > /home/florian/.bin/sh/image.base64
RESULT=`curl --location --request POST "$URL" --header "Authorization: Client-ID $CLIENT_ID" -d @/home/florian/.bin/sh/image.base64`
echo $RESULT
RESULT=`echo $RESULT | sed -r "s/\%//g"`
STATUS=`echo $RESULT | jq ".status"`
if [ $STATUS -ne 200 ] 
then
  notify-send "Error uploading image"
  echo $RESULT > /home/florian/.bin/sh/upload.error
  exit
fi;
LINK=`echo $RESULT | jq ".data.link" | sed -r 's/\"//g'`
echo $LINK | xclip -selection clipboard
date >> /home/florian/.bin/sh/uploads
echo $RESULT | jq ".data.deletehash" >> /home/florian/.bin/sh/uploads
echo $RESULT | jq ".data.id" >> /home/florian/.bin/sh/uploads
echo "\n" >> /home/florian/.bin/sh/uploads
notify-send "Uploaded Link to $LINK"
