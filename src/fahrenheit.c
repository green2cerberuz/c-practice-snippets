#include <stdio.h>

int main(void) {
    int fahr, celsius;
    int lower, upper, step;

    lower = 0;
    upper= 300;
    step = 20;

    fahr = lower;
    while (fahr <= upper) {
        celsius = (5.0/9.0) * (fahr-32.0) ;
        // 3 characters wide no decimals, and 6 characters wide and 1 decimal
        printf("%3.0f\t%6.1f\n", fahr, celsius);
        fahr = fahr + step;
    }
}