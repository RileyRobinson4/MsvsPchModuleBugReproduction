#include "pch.h"
import Project022;
#include "../Project044/pch.h"
#include "../Project045/pch.h"
    namespace Project022 {
        void run() {
            std::cout << Project022::printString << std::endl;
            Project044::run();
            Project045::run();
    }
}
