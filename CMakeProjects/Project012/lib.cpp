#include "pch.h"
import Project012;
#include "../Project024/pch.h"
#include "../Project025/pch.h"
    namespace Project012 {
        void run() {
            std::cout << Project012::printString << std::endl;
            Project024::run();
            Project025::run();
    }
}
