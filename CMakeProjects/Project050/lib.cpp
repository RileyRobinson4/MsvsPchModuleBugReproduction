#include "pch.h"
import Project050;
#include "../Project100/pch.h"
#include "../Project101/pch.h"
    namespace Project050 {
        void run() {
            std::cout << Project050::printString << std::endl;
            Project100::run();
            Project101::run();
    }
}
