#include "pch.h"
import Project013;
#include "../Project026/pch.h"
#include "../Project027/pch.h"
    namespace Project013 {
        void run() {
            std::cout << Project013::printString << std::endl;
            Project026::run();
            Project027::run();
    }
}
