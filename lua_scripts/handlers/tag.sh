#!/bin/bash

# Убедимся, что переменная окружения установлена (обычно уже есть)
export MANGO_INSTANCE_SIGNATURE="${MANGO_INSTANCE_SIGNATURE:-/tmp/mango.sock}"

last_tag=0

name="$(basename $0)"
pids=$(pgrep "$name")

if [ -n "$pids" ] && [ "$$" != "$pids" ]; then
	echo "уже запущен $name"
	echo "$$"
	echo "$pids"
	exit 0
fi

echo "запущен $name"

mmsg watch tags HDMI-A-1 | while read -r line; do
    # Проверяем, что строка не пустая
    [ -z "$line" ] && continue

    # Парсим нужные поля через jq
    tag=$(echo "$line" | jq -r '.active_tags[0]')


    # ДЕЙСТВИЕ: передаем данные в твой скрипт/бар
	# echo "Фокус переключен на: $appid ($tag) [ID: $client_id]"
	if [ "$last_tag" != "$tag" ]; then
		echo "Фокус переключен на tag: $tag"
		last_tag="$tag"
		qs ipc call tags update &
	fi

    # Пример: запуск внешнего скрипта
    # ~/.config/mango/on_focus_change.sh "$client_id" "$app_id" "$title"
done
