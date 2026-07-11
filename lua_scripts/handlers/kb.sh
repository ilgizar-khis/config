#!/bin/bash
# focus_handler.sh

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

mmsg watch keyboardlayout  | while read -r line; do
    # Проверяем, что строка не пустая
    [ -z "$line" ] && continue

    # Парсим нужные поля через jq
    tag=$(echo "$line" | jq -r '.layout')


    # ДЕЙСТВИЕ: передаем данные в твой скрипт/бар
	# echo "Фокус переключен на: $appid ($tag) [ID: $client_id]"
	echo "Фокус переключен на kb: $tag"
	qs ipc call kb update &

    # Пример: запуск внешнего скрипта
    # ~/.config/mango/on_focus_change.sh "$client_id" "$app_id" "$title"
done
