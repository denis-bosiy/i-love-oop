#include <iostream>
#include "CCar.h"
#include "CController.h"

int main()
{
    CCar virtualCar = CCar();
	CController controller(virtualCar, std::cin, std::cout);

    while (!std::cin.eof() && !std::cin.fail())
	{
		std::cout << "> ";
		if (!controller.HandleCommand())
		{
			std::cout << "Unknown command!" << std::endl;
		}
	}
}
