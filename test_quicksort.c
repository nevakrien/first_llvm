#include <stdio.h>

// Declare the quick_sort function which is defined in LLVM IR
extern void quick_sort(int* start, int* end);

int main() {
    int arr[] = {5, 3, 8, 6, 2, 7, 1, 4};
    int n = sizeof(arr) / sizeof(arr[0]);

    printf("starting array:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    // Call the quick_sort function
    quick_sort(arr, arr + n -1);

    printf("output array:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
