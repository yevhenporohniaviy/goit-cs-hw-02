#!/bin/bash

# Масив з URL вебсайтів
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Ім'я файлу логів
log_file="website_status.log"

# Чистемо файл логів
> "$log_file"

# Перевірка доступності кожного сайту
for site in "${websites[@]}"
do
    
    if curl -o /dev/null -s -L --head -w "%{http_code}\n" "$site" | grep 200 > /dev/null
    then
        echo "$site is UP" >> "$log_file"
        echo "$site is UP"
    else
        echo "$site is DOWN" >> "$log_file"
        echo "$site is DOWN"
    fi
done
