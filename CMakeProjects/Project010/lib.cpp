#include "pch.h"
import Project010;
#include "../Project020/pch.h"
#include "../Project021/pch.h"
    namespace Project010 {
        void run() {
            std::cout << Project010::printString << std::endl;
            Project020::run();
            Project021::run();
    }
}
