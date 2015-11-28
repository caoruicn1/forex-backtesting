#!/bin/bash

node --nouse-idle-notification --max-old-space-size=31000 --expose-gc `which gulp` optimize --symbol $1 --parser metatrader --data ./data/metatrader/two-year/$1.csv --optimizer Reversals --investment 1000 --profitability 0.76 --database forex-backtesting-master-instrumenting
