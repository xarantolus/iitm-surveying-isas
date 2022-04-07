int fib(int n)
{
    if (n <= 1) {
        return n;
    }

    int prev = 0;
    int current = 1;

    int tmp;
    for (int i = 2; i <= n; i++) {
        tmp = current;
        current += prev;
        prev = tmp;
    }
    return current;
}
