#!/usr/bin/env bash

number=0
files=""

echo "Downloading all the files..."

for FILE in "$@"
do
    let "number++"
    aws s3 cp s3://${BUCKET}/${FILE} ${number}.pdf
    files="$files $number.pdf"
done

echo $files

echo "Merging PDF's"
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=${CORRELATIONID}.pdf $files

echo "Uploading file to S3"
expiresAt=`date -d "+10 seconds" -u +"%Y-%m-%dT%H:%M:%SZ"`
aws s3 cp ${CORRELATIONID}.pdf s3://${BUCKET}/${CORRELATIONID}.pdf --content-type "application/pdf" --expires "${expiresAt}"

exit 0