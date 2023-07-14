#!/bin/bash
# list buckets and their sizes
PROJECT=$1
if [ -z "$PROJECT" ]
then
    echo "Need Project ID as first argument"
    exit 1
fi
gcloud config set project $PROJECT
buckets=$(gsutil ls)
# for each bucket find the total size
for bucket in $buckets
do
    # get the size of the bucket
    size=$(gsutil du -hs $bucket)
    # print the size of the bucket
    echo "$size \n"
done