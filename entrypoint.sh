#!/bin/bash
if [ -z "$WALLET" ]; then
    echo "Ошибка: переменная окружения WALLET не задана!"
    exit 1
fi
exec /root/krig-miner \
    --url stratum+ssl://prl.kryptex.network:8048 \
    --user "$WALLET"
