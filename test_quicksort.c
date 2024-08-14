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
void print_array(int* arr, int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main() {
    srand(time(0)); // Seed the random number generator

    // Test with different array sizes
    int sizes[] = {10, 15, 20, 25, 30};
    int num_tests = sizeof(sizes) / sizeof(sizes[0]);

    for (int t = 0; t < num_tests; t++) {
        int n = sizes[t];
        int arr[n];

        generate_random_array(arr, n, 100); // Generate a random array with elements between 0 and 99

        printf("Test %d: starting array (size %d):\n", t + 1, n);
        print_array(arr, n);

        // Call the quick_sort function
        quick_sort(arr, arr + n - 1);

        printf("Test %d: output array:\n", t + 1);
        print_array(arr, n);

        // Verify if the array is sorted
        if (is_sorted(arr, n)) {
            printf("Test %d: The array is sorted correctly.\n", t + 1);
        } else {
            printf("Test %d: The array is NOT sorted correctly.\n", t + 1);
            return 1;
        }

        printf("\n");
    }

    return 0;
}
