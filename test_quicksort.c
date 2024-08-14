#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Declare the quick_sort function which is defined in LLVM IR
extern void quick_sort(int* start, int* end);

// Function to generate an array of random integers
void generate_random_array(int* arr, int n, int max_value) {
    for (int i = 0; i < n; i++) {
        arr[i] = rand() % max_value;
    }
}

// Function to verify if an array is sorted in ascending order
int is_sorted(int* arr, int n) {
    for (int i = 1; i < n; i++) {
        if (arr[i] < arr[i - 1]) {
            return 0; // Array is not sorted
        }
    }
    return 1; // Array is sorted
}

// Function to print the array
void print_array(int* arr, int* end) {
    for (; arr!=end; arr++) {
        printf("%d ", *arr);
    }
    printf("%d \n", *arr);
}

int main() {
    srand(23); // Seed the random number generator

    int max_tests = 10000; // Number of arrays to test
    int max_value = 10000; // Maximum value for elements in the array

    for (int t = 0; t < max_tests; t++) {
        int n;

        // Ensure that some arrays are at least 100,000 elements long
        if (t % 100 == 0) {
            n = 100000;
        } else {
            n = rand() % 100 + 10; // Array size between 10 and 109
        }

        int* arr = (int*)malloc(n * sizeof(int));

        if (arr == NULL) {
            printf("Memory allocation failed for test %d\n", t + 1);
            return 1;
        }

        generate_random_array(arr, n, max_value); // Generate a random array with elements between 0 and 99

        printf("Test %d: starting array (size %d):\n", t + 1, n);
        // Optionally, print the array if needed for debugging
        // print_array(arr, arr+n-1);

        // Call the quick_sort function
        quick_sort(arr, arr + n - 1);

        printf("Test %d: output array:\n", t + 1);
        // Optionally, print the array if needed for debugging
        // print_array(arr, arr+n-1);

        // Verify if the array is sorted
        if (is_sorted(arr, n)) {
            printf("Test %d: The array is sorted correctly.\n", t + 1);
        } else {
            printf("Test %d: The array is NOT sorted correctly.\n", t + 1);
            print_array(arr, arr+n-1);
            free(arr);
            return 1;
        }

        free(arr);
        printf("\n");
    }

    return 0;
}
