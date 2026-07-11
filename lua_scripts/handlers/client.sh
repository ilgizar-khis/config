#!/bin/bash
# focus_handler.sh

# Убедимся, что переменная окружения установлена (обычно уже есть)
export MANGO_INSTANCE_SIGNATURE="${MANGO_INSTANCE_SIGNATURE:-/tmp/mango.sock}"

last_client_id=0
last_appid=0

mmsg watch focusing-client | while read -r line; do
    # Проверяем, что строка не пустая
    [ -z "$line" ] && continue

    # Парсим нужные поля через jq
    client_id=$(echo "$line" | jq -r '.id')
    appid=$(echo "$line" | jq -r '.appid')
    title=$(echo "$line" | jq -r '.title')

	if [[ "$client_id" == "null" ]]; then
		echo "empty workspace"
		last_client_id=0
		last_appid=0
		continue 
	fi

    # ДЕЙСТВИЕ: передаем данные в твой скрипт/бар
	if [ "$last_client_id" != "$client_id" ] || [ "$last_appid" != "$appid" ]; then
		echo "Фокус переключен на: $appid ($title) [ID: $client_id]"
		last_client_id=$client_id
		last_appid=$appid
	fi

    # Пример: запуск внешнего скрипта
    # ~/.config/mango/on_focus_change.sh "$client_id" "$app_id" "$title"
done
