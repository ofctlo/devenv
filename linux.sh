sudo apt-get update

./setup-linux/symlink-linux.sh

find ./setup-linux/plugins/* -name setup.sh | while read filename; do
  $filename
done
