#!/bin/sh

FILE_PATH=/root
DATA_PATH=$FILE_PATH/data

geth init --datadir $DATA_PATH $FILE_PATH/genesis.json

geth --datadir $DATA_PATH \
--syncmode full \
--networkid 4693 \
--http \
--http.addr 127.0.0.1 \
--http.api web3,eth,admin,net \
--ws \
--ws.api eth,net,web3 \
--ws.addr 127.0.0.1 \
--ws.origins "*" \
--authrpc.vhosts "*" \
--authrpc.addr 127.0.0.1 \
--authrpc.jwtsecret $FILE_PATH/jwtsecret \
--mine \
--miner.etherbase 0x645ce75f67eb385390a2b78f9f3b3c8384c75f95 \
--unlock 0x645ce75f67eb385390a2b78f9f3b3c8384c75f95 \
--allow-insecure-unlock \
--password $FILE_PATH/password.txt \
--nodiscover
