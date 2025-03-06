#include "pch.h"
import Project040;
#include "../Project080/pch.h"
#include "../Project081/pch.h"
    namespace Project040 {
        void run() {
            std::cout << Project040::printString << std::endl;
            Project080::run();
            Project081::run();
    }
}
