#include "pch.h"
import Project025;
#include "../Project050/pch.h"
#include "../Project051/pch.h"
    namespace Project025 {
        void run() {
            std::cout << Project025::printString << std::endl;
            Project050::run();
            Project051::run();
    }
}
