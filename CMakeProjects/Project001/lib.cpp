#include "pch.h"
import Project001;
#include "../Project002/pch.h"
#include "../Project003/pch.h"
    namespace Project001 {
        void run() {
            std::cout << Project001::printString << std::endl;
            Project002::run();
            Project003::run();
    }
}
