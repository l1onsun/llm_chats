#!/usr/bin/env bash

# Функция, ищет первый свободный индекс для файла chat_<n>.md
next_index() {
    local i=0
    while [[ -e "chat_${i}.md" ]]; do
        ((i++))
    done
    echo "$i"
}

# Получаем индекс
idx=$(next_index)

# # Создаём пустой файл (если он уже существует, ничего не делаем)
# touch "chat_${idx}.md"

# Открываем файл в редакторе, заданном переменной окружения EDITOR
# Если EDITOR не установлен, используем nano по умолчанию
if [[ -z "${EDITOR}" ]]; then
    EDITOR=nano
fi

"${EDITOR}" "chat_${idx}.md"

