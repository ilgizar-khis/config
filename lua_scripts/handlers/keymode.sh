#!/bin/bash

# Убедимся, что переменная окружения установлена (обычно уже есть)
export MANGO_INSTANCE_SIGNATURE="${MANGO_INSTANCE_SIGNATURE:-/tmp/mango.sock}"

name="$(basename $0)"
pids=$(pgrep "$name")

if [ -n "$pids" ] && [ "$$" != "$pids" ]; then
	echo "уже запущен $name"
	echo "$$"
	echo "$pids"
	exit 0
fi

echo "запущен $name"

mmsg watch keymode| while read -r line; do
    # Проверяем, что строка не пустая
    [ -z "$line" ] && continue

    # Парсим нужные поля через jq
    keymode=$(echo "$line" | jq -r '.keymode')


    # ДЕЙСТВИЕ: передаем данные в твой скрипт/бар
	# echo "Фокус переключен на: $appid ($tag) [ID: $client_id]"
	echo "переключен на keymode: $keymode"
	qs ipc call keymode update &
done
