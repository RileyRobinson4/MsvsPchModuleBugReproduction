#include "pch.h"
import Project030;
#include "../Project060/pch.h"
#include "../Project061/pch.h"
    namespace Project030 {
        void run() {
            std::cout << Project030::printString << std::endl;
            Project060::run();
            Project061::run();
    }
}
