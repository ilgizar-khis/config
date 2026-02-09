#!/bin/bash

# Убиваем все запущенные экземпляры polybar
killall -q polybar

# Ждем пока процессы будут остановлены
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запускаем Polybar со стандартным расположением конфига
polybar example &

echo "Polybar запущен..."
