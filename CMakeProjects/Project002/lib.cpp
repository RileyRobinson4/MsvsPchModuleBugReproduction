#include "pch.h"
import Project002;
#include "../Project004/pch.h"
#include "../Project005/pch.h"
    namespace Project002 {
        void run() {
            std::cout << Project002::printString << std::endl;
            Project004::run();
            Project005::run();
    }
}
