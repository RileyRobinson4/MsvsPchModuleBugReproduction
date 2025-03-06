#include "pch.h"
import Project003;
#include "../Project006/pch.h"
#include "../Project007/pch.h"
    namespace Project003 {
        void run() {
            std::cout << Project003::printString << std::endl;
            Project006::run();
            Project007::run();
    }
}
