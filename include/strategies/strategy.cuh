#ifndef STRATEGY_H
#define STRATEGY_H

#include "positions/position.cuh"
#include "types/configuration.cuh"
#include "types/strategyResults.cuh"
#include "types/basicDataIndexMap.cuh"

class Strategy {
    private:
        const char *symbol;
        BasicDataIndexMap dataIndexMap;
        // std::vector<Position*> openPositions;
        double profitLoss;
        int winCount;
        int loseCount;
        int consecutiveLosses;
        int maximumConsecutiveLosses;
        double minimumProfitLoss;

    protected:
        __device__ BasicDataIndexMap getDataIndexMap();
        __device__ virtual void tick(double *dataPoint) = 0;
        __device__ double getWinRate();
        __device__ double getProfitLoss();
        __device__ void closeExpiredPositions(double price, time_t timestamp);
        __device__ void addPosition(Position *position);

    public:
        __host__ Strategy(const char *symbol, BasicDataIndexMap dataIndexMap);
        __host__ virtual ~Strategy() {}
        __device__ virtual void backtest(double *dataPoint, double investment, double profitability);
        __device__ const char *getSymbol();
        __device__ void setProfitLoss(double profitLoss);
        __device__ StrategyResults getResults();
};

#endif
