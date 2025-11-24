package com.example.fizzbuzz;

public final class FizzBuzz {
    private FizzBuzz() {}

    public static String apply(int n) {
        if (n % 15 == 0) return "FizzBuzz";
        if (n % 3 == 0) return "Fizz";
        if (n % 5 == 0) return "Buzz";
        return Integer.toString(n);
    }
}
