#include "pch.h"
import Project026;
#include "../Project052/pch.h"
#include "../Project053/pch.h"
    namespace Project026 {
        void run() {
            std::cout << Project026::printString << std::endl;
            Project052::run();
            Project053::run();
    }
}
