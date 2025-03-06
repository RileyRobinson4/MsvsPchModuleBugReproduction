#include "pch.h"
import Project015;
#include "../Project030/pch.h"
#include "../Project031/pch.h"
    namespace Project015 {
        void run() {
            std::cout << Project015::printString << std::endl;
            Project030::run();
            Project031::run();
    }
}
