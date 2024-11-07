#!/bin/bash

# Prompt the user for the directory path
echo "Enter the directory path to organize:"
read dir_path

# Check if the directory exists and is accessible
if [[ ! -d "$dir_path" || ! -r "$dir_path" ]]; then
    echo "Error: Directory does not exist or is not accessible."
    exit 1
fi

# Optional: Ask the user if they want to specify file extensions to exclude
echo "Do you want to exclude any file extensions? (y/n)"
read exclude_choice
if [[ "$exclude_choice" == "y" ]]; then
    echo "Enter the file extensions to exclude (comma-separated, e.g., txt,png):"
    read exclude_extensions
    IFS=',' read -r -a exclude_array <<<"$exclude_extensions"
fi

# Optional: Ask if the user wants to specify a different destination directory
echo "Do you want to specify a different destination directory? (y/n)"
read dest_choice
if [[ "$dest_choice" == "y" ]]; then
    echo "Enter the destination directory path:"
    read dest_dir
    if [[ ! -d "$dest_dir" ]]; then
        mkdir -p "$dest_dir"
    fi
else
    dest_dir="$dir_path"
fi

# Initialize a log file
log_file="$dest_dir/file_organizer.log"
echo "File Organizer Log" >"$log_file"
echo "Organizing files in '$dir_path'" >>"$log_file"
echo "=============================" >>"$log_file"

# Move files based on their extension
declare -A file_count
for file in "$dir_path"/*; do
    # Skip directories and hidden files
    if [[ -f "$file" ]]; then
        ext="${file##*.}"
        # Check if extension is excluded
        if [[ -n "$exclude_choice" && " ${exclude_array[@]} " =~ " $ext " ]]; then
            continue
        fi

        # Create a subdirectory for the extension if it doesn't exist
        target_dir="$dest_dir/$ext"
        if [[ ! -d "$target_dir" ]]; then
            mkdir "$target_dir"
            echo "Created directory: $target_dir"
        fi

        # Move the file and update the count
        mv "$file" "$target_dir/"
        file_count["$ext"]=$((file_count["$ext"] + 1))
        echo "Moved $file to $target_dir" | tee -a "$log_file"
    fi
done

# Display summary
echo "Organization Summary:"
for ext in "${!file_count[@]}"; do
    echo "$ext files: ${file_count[$ext]}"
    echo "$ext files: ${file_count[$ext]}" >>"$log_file"
done

echo "Log file saved at $log_file"
