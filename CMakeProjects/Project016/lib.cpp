#include "pch.h"
import Project016;
#include "../Project032/pch.h"
#include "../Project033/pch.h"
    namespace Project016 {
        void run() {
            std::cout << Project016::printString << std::endl;
            Project032::run();
            Project033::run();
    }
}
