#include "pch.h"
import Project009;
#include "../Project018/pch.h"
#include "../Project019/pch.h"
    namespace Project009 {
        void run() {
            std::cout << Project009::printString << std::endl;
            Project018::run();
            Project019::run();
    }
}
