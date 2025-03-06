#include "pch.h"
import Project021;
#include "../Project042/pch.h"
#include "../Project043/pch.h"
    namespace Project021 {
        void run() {
            std::cout << Project021::printString << std::endl;
            Project042::run();
            Project043::run();
    }
}
