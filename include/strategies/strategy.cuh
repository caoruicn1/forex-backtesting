#ifndef STRATEGY_H
#define STRATEGY_H

#include "positions/position.cuh"
#include "positions/callPosition.cuh"
#include "positions/putPosition.cuh"
#include "types/configuration.cuh"
#include "types/strategyResult.cuh"

class Strategy {
    private:
        const char *symbol;
        Position *openPositions[10];
        double profitLoss;
        int winCount;
        int loseCount;
        int consecutiveLosses;
        int maximumConsecutiveLosses;
        double minimumProfitLoss;

    protected:
        __device__ __host__ void tick(double *dataPoint) {}
        __device__ __host__ double getWinRate();
        __device__ __host__ double getProfitLoss();
        __device__ __host__ void closeExpiredPositions(double price, time_t timestamp);
        __device__ __host__ void addPosition(Position *position);

    public:
        __device__ __host__ Strategy(const char *symbol);
        __device__ __host__ ~Strategy() {}
        __device__ __host__ void backtest(double *dataPoint, double investment, double profitability) {}
        __device__ __host__ const char *getSymbol();
        __device__ __host__ void setProfitLoss(double profitLoss);
        __device__ __host__ StrategyResult getResult();
};

#endif
