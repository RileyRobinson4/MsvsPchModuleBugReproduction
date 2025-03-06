#include "pch.h"
import Project005;
#include "../Project010/pch.h"
#include "../Project011/pch.h"
    namespace Project005 {
        void run() {
            std::cout << Project005::printString << std::endl;
            Project010::run();
            Project011::run();
    }
}
