#include "pch.h"
import Project014;
#include "../Project028/pch.h"
#include "../Project029/pch.h"
    namespace Project014 {
        void run() {
            std::cout << Project014::printString << std::endl;
            Project028::run();
            Project029::run();
    }
}
