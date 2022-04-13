#include <iostream>
#include <iomanip>
#include <cmath>

extern "C"
{
	double __cdecl first_task(double, double);
	double __cdecl second_task(double, double, double);
}

int main() 
{
	double x = 2, y = 11.755;
	std::cout << "C: " << std::setprecision(10) << pow(x, 2) * tan(x / y) + pow(y, 2) * (cos(x / y) / sin(x / y)) << '\n';
	std::cout << "Assembler: " << std::setprecision(10) << first_task(x, y) << '\n';
	double a = 1, b = 1, c = -24.375;
	std::cout << "Solution: " << second_task(a, b, c) << '\n';
}