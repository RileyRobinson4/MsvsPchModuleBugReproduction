#include "pch.h"
import Project004;
#include "../Project008/pch.h"
#include "../Project009/pch.h"
    namespace Project004 {
        void run() {
            std::cout << Project004::printString << std::endl;
            Project008::run();
            Project009::run();
    }
}
