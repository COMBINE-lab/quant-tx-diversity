#!/bin/bash

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
output_file=""
fn=""
verbose=0
delete_orig=0

while getopts "h?di:" opt; do
    case "$opt" in
        h|\?)
            echo "help"
            exit 0
            ;;
        i)  fn=$OPTARG
            ;;
        d)
            delete_orig=1
            ;;
    esac
done

shift $((OPTIND-1))


base=`basename $fn`
dirname=`dirname $fn`

fl=${base%*.fq.gz}_shuffled.fq.gz
output_file="$dirname/${fl}"
cmd="/usr/bin/time gunzip -c ${fn} | paste - - - - | pv -r -b | shuf | awk '{print \$1\"\n\"\$2\"\n\"\$3\"\n\"\$4 }' | pigz -p 8 > ${output_file}"

echo $cmd
eval $cmd

if [[ $delete_orig -eq 1 ]]
then
  echo "Deleting original files"
  rm $fn
fi

