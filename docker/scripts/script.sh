#!/bin/sh

FILE_PATH=/root
DATA_PATH=$FILE_PATH/data

geth init --datadir $DATA_PATH $FILE_PATH/genesis.json

geth --datadir $DATA_PATH \
--syncmode full \
--networkid 4693 \
--http \
--http.addr 0.0.0.0 \
--http.api web3,eth,admin,net \
--http.corsdomain "*" \
--ws \
--ws.api eth,net,web3 \
--ws.addr 0.0.0.0 \
--ws.origins "*" \
--authrpc.vhosts "*" \
--authrpc.addr 0.0.0.0 \
--authrpc.jwtsecret $FILE_PATH/jwtsecret \
--mine \
--miner.etherbase 0xa6a3495548d7993af15654a7e9a9f2b0238416e9 \
--unlock 0xa6a3495548d7993af15654a7e9a9f2b0238416e9 \
--allow-insecure-unlock \
--password $FILE_PATH/password.txt \
--nodiscover
``