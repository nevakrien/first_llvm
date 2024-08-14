; declare i32 @printf(ptr, ...) 

; @debug_compare_str = private unnamed_addr constant [28 x i8] c"Comparing %d with pivot %d\0A\00", align 1
; @debug_compare_result_str = private unnamed_addr constant [23 x i8] c"Comparison result: %d\0A\00", align 1
; @debug_swap_str = private unnamed_addr constant [21 x i8] c"Swapping %d with %d\0A\00", align 1

define void @quick_sort(i32* %start, i32* %end) {
entry: 
    %first_ptr = getelementptr i32, i32* %start, i32 1
    %valid = icmp ult i32* %first_ptr, %end
    br i1 %valid, label %setup, label %exit_early

exit_early:
    ret void

setup: 
    %pivot = load i32, i32* %start
    br label %loop

loop:
    ; Track the replace spot: the last inserted left element
    %replace_spot = phi i32* [ %start, %setup ], [ %elem_ptr, %append_left ], [ %replace_spot, %append_right ]

    %elem_ptr = phi i32* [ %first_ptr, %setup ], [ %next_left, %append_left ], [ %elem_ptr, %append_right ]
    %ins_right_ptr = phi i32* [ %end, %setup ], [ %ins_right_ptr, %append_left ], [ %next_right, %append_right ]

    %crossed = icmp ult i32* %ins_right_ptr, %elem_ptr
    br i1 %crossed, label %done_loop, label %compare

compare:
    %elem = load i32, i32* %elem_ptr
    ; Print the comparison
    ; call i32 (ptr, ...) @printf(ptr @debug_compare_str, i32 %elem, i32 %pivot)

    %bigger = icmp sgt i32 %elem, %pivot
    
    ; %bigger_i32 = zext i1 %bigger to i32
    ; ; Print the comparison result
    ; call i32 (ptr, ...) @printf(ptr @debug_compare_result_str, i32 %bigger_i32)
    
    br i1 %bigger, label %append_right, label %append_left

append_left:	
    %next_left = getelementptr i32, i32* %elem_ptr, i32 1
    br label %loop
	
append_right:
    ; Print the swap operation
    %swap_elem = load i32, i32* %ins_right_ptr
    ; call i32 (ptr, ...) @printf(ptr @debug_swap_str, i32 %elem, i32 %swap_elem)

    store i32 %swap_elem, i32* %elem_ptr
    store i32 %elem, i32* %ins_right_ptr

    %next_right = getelementptr i32, i32* %ins_right_ptr, i32 -1
    br label %loop

done_loop:
    ; Use the replace_spot for the final swap
    %final_swap_elem = load i32, i32* %replace_spot
    ; call i32 (ptr, ...) @printf(ptr @debug_swap_str, i32 %pivot, i32 %final_swap_elem)

    store i32 %final_swap_elem, i32* %start
    store i32 %pivot, i32* %replace_spot

    ; Recursively sort the left and right subarrays
    %end_left = getelementptr i32, i32* %replace_spot, i32 -1
    call void @quick_sort(i32* %start, i32* %end_left)

    %start_right = getelementptr i32, i32* %replace_spot, i32 1
    call void @quick_sort(i32* %start_right, i32* %end)

    ret void
}
