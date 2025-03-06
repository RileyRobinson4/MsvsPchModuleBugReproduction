#include "pch.h"
import Project008;
#include "../Project016/pch.h"
#include "../Project017/pch.h"
    namespace Project008 {
        void run() {
            std::cout << Project008::printString << std::endl;
            Project016::run();
            Project017::run();
    }
}
