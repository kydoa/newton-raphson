#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int sqrt_nr(int x, int i) {
    if (i == 0) {
        return x;
    } else {
        int guess = sqrt_nr(x, i - 1);
        return (guess + x / guess) / 2;
    }
}

int main() {
    int x, i;
    printf("Programa de Raiz Quadrada – Newton-Raphson\n");
    printf("Desenvolvedor: Daniel Scheuermann\n");

    while (1) {
        printf("Digite o parâmetro x para calcular sqrt_nr (x, i) ou -1 para abortar a execução: ");
        scanf("%d", &x);

        if (x == -1) {
            printf("Execução abortada.\n");
            break;
        }

        printf("Digite o parâmetro i para calcular sqrt_nr (x, i) ou -1 para abortar a execução: ");
        scanf("%d", &i);

        if (i == -1) {
            printf("Execução abortada.\n");
            break;
        }

        if (x <= 0 || i < 0) {
            printf("Por favor, insira um inteiro positivo para x e um inteiro não negativo para i.\n");
            continue;
        }

        int result = sqrt_nr(x, i);
        printf("sqrt(%d, %d) = %d\n", x, i, result);
    }

    return 0;

}
