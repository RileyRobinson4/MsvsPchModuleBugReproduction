#include "pch.h"
import Project011;
#include "../Project022/pch.h"
#include "../Project023/pch.h"
    namespace Project011 {
        void run() {
            std::cout << Project011::printString << std::endl;
            Project022::run();
            Project023::run();
    }
}
