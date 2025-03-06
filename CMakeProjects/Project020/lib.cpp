#include "pch.h"
import Project020;
#include "../Project040/pch.h"
#include "../Project041/pch.h"
    namespace Project020 {
        void run() {
            std::cout << Project020::printString << std::endl;
            Project040::run();
            Project041::run();
    }
}
