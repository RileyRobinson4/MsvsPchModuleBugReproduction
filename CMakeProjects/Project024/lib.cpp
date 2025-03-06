#include "pch.h"
import Project024;
#include "../Project048/pch.h"
#include "../Project049/pch.h"
    namespace Project024 {
        void run() {
            std::cout << Project024::printString << std::endl;
            Project048::run();
            Project049::run();
    }
}
