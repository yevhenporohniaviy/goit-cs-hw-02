#!/bin/bash

# Масив з URL вебсайтів
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Ім'я файлу логів
log_file="website_status.log"

# Перевірка доступності кожного сайту
for site in "${websites[@]}"; do
    # Виконання HTTP GET запиту до сайту і перевірка HTTP статус-коду
    response=$(curl -Is $site | head -n 1)
    if [[ $response == *"200 OK"* ]]; then
        status="UP"
    else
        status="DOWN"
    fi
    
    # Запис результату перевірки в файл логів
    echo "$site is $status" >> $log_file
    
    # Виведення результату на екран
    echo "$site is $status"
done

# Повідомлення про завершення запису результатів у файл логів
echo "Результати записано у файл $log_file"
