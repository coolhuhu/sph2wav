#!/bin/bash

source_dir=$(realpath $1)
destination_dir=$(realpath $2)

if [ ! -d $source_dir ]; then
    echo $source_dir "does not exist!"
    exit 1
fi

if [ ! -d $destination_dir ]; then
    echo $destination_dir "does not exist!"
    exit 1
fi

files=()
while IFS= read -r -d '' file; do
  files+=("$file")
done < <(find "$source_dir" -type f -name "*.sph" -print0)

declare -i  cnt=${#files[*]}
echo "$cnt files in total"

for src_file in ${files[*]}; do
    dest_file=$(basename $src_file .sph)
    dest_file="$destination_dir/$dest_file.wav"
    echo $dest_file
    ./sph2pipe -f wav $src_file > $dest_file
done

echo "A total of $cnt files were converted"