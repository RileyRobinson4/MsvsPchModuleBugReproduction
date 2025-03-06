#include "pch.h"
import Project007;
#include "../Project014/pch.h"
#include "../Project015/pch.h"
    namespace Project007 {
        void run() {
            std::cout << Project007::printString << std::endl;
            Project014::run();
            Project015::run();
    }
}
