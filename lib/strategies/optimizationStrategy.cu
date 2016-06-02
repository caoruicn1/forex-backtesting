#include "strategies/optimizationStrategy.cuh"

__device__ __host__ OptimizationStrategy::OptimizationStrategy(const char *symbol, BasicDataIndexMap dataIndexMap, int group, Configuration configuration)
        : Strategy(symbol, dataIndexMap) {
    this->group = group;
    this->configuration = configuration;
    this->tickPreviousDataPoint = nullptr;
}

__device__ __host__ OptimizationStrategy::~OptimizationStrategy() {
    // delete configuration;
    // delete tickPreviousDataPoint;
}

__device__ __host__ int OptimizationStrategy::getGroup() {
    return this->group;
}

__device__ __host__ void OptimizationStrategy::tick(double *dataPoint) {
    BasicDataIndexMap dataIndexMap = this->getDataIndexMap();

    if (this->tickPreviousDataPoint) {
        // Simulate expiry of and profit/loss related to positions held.
        closeExpiredPositions(this->tickPreviousDataPoint[dataIndexMap.close], dataPoint[dataIndexMap.timestamp] - 1);
    }

    this->tickPreviousDataPoint = dataPoint;
}

__device__ __host__ Configuration OptimizationStrategy::getConfiguration() {
    return this->configuration;
}
