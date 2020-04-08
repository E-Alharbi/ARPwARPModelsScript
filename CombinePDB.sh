#!/bin/csh -f

mkdir scripts
count=0
for i in $1/*
do
if   [[ ${i: -4} == ".pdb" ]]
then
filename=$(basename -- "$i")
value=$(<$i)
count=$((count+1))
echo "$count"
cat > scripts/$count.sh  <<EOF
cat > $filename  <<EOF
$value
@EOF@
EOF
fi

done
find ./scripts -type f  -exec sed -i 's/@EOF@/EOF/g' {} +
cd scripts
cat *.sh >> ../All.sh
cd ..
rm -r scripts
