#Here's a bash script to count and list how many files of each type are present in a given directory, traversing the directory recursively and identifying file types based on their extensions:

#!/bin/bash

# Check if the directory is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Directory to traverse
directory=$1

# Associative array to store counts of each file type
declare -A file_types

# Traverse the directory recursively and count file types based on extensions
while IFS= read -r -d '' file; do
  extension="${file##*.}"
  if [ "$file" != "$extension" ]; then
    ((file_types["$extension"]++))
  else
    ((file_types["no_extension"]++))
  fi
done < <(find "$directory" -type f -print0)

# Print the sorted list of file types along with their counts
for extension in "${!file_types[@]}"; do
  echo "$extension: ${file_types[$extension]}"
done | sort


#the directory structure is as follows:

#test_directory/
#├── file1.txt
#├── file2.txt
#├── script.sh
#├── document.pdf
#└── subdir
    #├── image.jpg
    #└── another_script.sh

#Running the script:
#./count_file_types.sh test_directory


#Output:
  #jpg: 1
  #pdf: 1
  #sh: 2
  #txt: 2


#Explanation:

#1.The script checks if the directory is provided as an argument.
#2.It uses an associative array to store the counts of each file type.
#3.The find command traverses the directory recursively and lists all files.
#4.For each file, the script extracts the file extension and updates the count in the associative array.
#5.Finally, the script prints the sorted list of file types along with their counts. The output is sorted alphabetically by file extension.






