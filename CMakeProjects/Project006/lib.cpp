#include "pch.h"
import Project006;
#include "../Project012/pch.h"
#include "../Project013/pch.h"
    namespace Project006 {
        void run() {
            std::cout << Project006::printString << std::endl;
            Project012::run();
            Project013::run();
    }
}
