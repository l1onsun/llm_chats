#!/usr/bin/env bash

./scripts/org.sh

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

if [[ -z "${EDITOR}" ]]; then
    EDITOR=nano
fi

"${EDITOR}" "chat_${idx}.md"

