#include "pch.h"
import Project060;
#include "../Project120/pch.h"
#include "../Project121/pch.h"
    namespace Project060 {
        void run() {
            std::cout << Project060::printString << std::endl;
            Project120::run();
            Project121::run();
    }
}
