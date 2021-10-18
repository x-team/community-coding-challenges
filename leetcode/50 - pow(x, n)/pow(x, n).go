package main

import (
	"fmt"
)

func myPow(x float64, n int) float64 {
	// if the exponent is zero, the result is one
	if n == 0 {
		return 1
	}
	// if the exponent is less than zero, the result is one divided by pow with the positive exponent
	// called recursively
	if n < 0 {
		return 1 / myPow(x, -n)
	}
	// if the exponent is odd, we call the function recursively, but transforming the exponent into
	// even (-1) and multiplying by the base
	if n%2 == 1 {
		return x * myPow(x, n-1)
	}
	// if the exponent is even, we can reduce the steps to checkout the result, multiplying the base
	// by the base and dividing the expoent by two in the recursively call
	return myPow(x*x, n/2)
}

func main() {

	// definition of a slice (stack) of test cases and addition of cases
	cases := []struct {
		base     float64
		exponent int
		expected float64
	}{
		{2, 10, 1024},
		{2.1, 3, 9.261000},
		{2, -2, 0.25},
		{1, 2147483647, 1},
		{10, 0, 1},
		{10, 1, 10},
		{-5, 1, -5},
	}

	// running the test for each case in the stack
	for _, c := range cases {
		pow := myPow(c.base, c.exponent)
		// to compare a floating point number, we need to check the subtraction difference, which must
		// be less than 0.00000000001
		if diff := (pow - c.expected); diff > -0.0000000001 && diff < 0.0000000001 {
			fmt.Printf("OK myPow(%f, %d): %f\n", c.base, c.exponent, pow)
		} else {
			fmt.Printf("Error should be %f but got %f\n", c.expected, pow)
		}
	}
}
