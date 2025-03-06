#include "pch.h"
import Project041;
#include "../Project082/pch.h"
#include "../Project083/pch.h"
    namespace Project041 {
        void run() {
            std::cout << Project041::printString << std::endl;
            Project082::run();
            Project083::run();
    }
}
