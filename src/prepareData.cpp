#include <iterator>
#include <iostream>
#include "dataParsers/oandaDataParser.h"
#include "optimizers/reversalsOptimizer.h"

int main(int argc, char *argv[]) {
    OandaDataParser dataParser("/Users/chad/development/desktop/forex-backtesting/data/oanda/k-fold/combined/AUDJPY.csv");
    // std::vector<std::map<std::string, double>> parsedData = dataParser.parse();
    std::string symbol = "AUDJPY";
    int group = 1;
    ReversalsOptimizer optimizer(symbol, group);

    // Output the data.
    // for (std::vector<std::map<std::string, double>>::iterator iterator = parsedData.begin(); iterator != parsedData.end(); ++iterator) {
    //     std::cout << "timestamp: " << (*iterator).at("timestamp") << std::endl;
    //     std::cout << "open: " << (*iterator).at("open") << "    " << ((*iterator).at("open") + 1) << std::endl;
    //     std::cout << "high: " << (*iterator).at("high") << std::endl;
    //     std::cout << "low: " << (*iterator).at("low") << std::endl;
    //     std::cout << "close: " << (*iterator).at("close") << std::endl;
    //     std::cout << std::endl;
    // }

    // Prepare the data.
    optimizer.prepareStudies();

    return 0;
}
