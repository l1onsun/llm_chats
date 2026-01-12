#!/usr/bin/env bash
if [ $# -eq 0 ]; then
    echo "Ошибка: Укажите файл в качестве аргумента."
    echo "Пример: $0 file.md"
    exit 1
fi
file="$1"
if [ ! -f "$file" ]; then
    echo "Ошибка: Файл '$file' не найден."
    exit 1
fi

original_content=$(cat "$file")
echo -e "\n<|assistant|>" >> "$file"
echo "$original_content" | aichat | tee -a "$file"
echo -e "\n<|user|>" >> "$file"

