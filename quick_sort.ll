declare i32 @printf(ptr, ...) 

@debug_call_str = private unnamed_addr constant [35 x i8] c"Calling quick_sort with size %llu\0A\00", align 1
define void @debug_print_size(i32* %start22, i32* %end22) {
    %start_int22 = ptrtoint i32* %start22 to i64
    %end_int22 = ptrtoint i32* %end22 to i64
    %size22 = sub i64 %end_int22, %start_int22
    call i32 (ptr, ...) @printf(ptr @debug_call_str, i64 %size22)
    ret void
}

@debug_loop_str = private unnamed_addr constant [28 x i8] c"left in %llu right in %llu\0A\00", align 1
define void @debug_print_loopidx(i32* %start22, i32* %insert_left22, i32* %insert_right22) {
    %start_int22 = ptrtoint i32* %start22 to i64
    %insert_left_int22 = ptrtoint i32* %insert_left22 to i64
    %insert_right_int22 = ptrtoint i32* %insert_right22 to i64

    %left_idx22 = sub i64 %insert_left_int22, %start_int22 
    %right_idx22 = sub i64 %insert_right_int22, %start_int22

    call i32 (ptr, ...) @printf(ptr @debug_loop_str, i64 %left_idx22, i64 %right_idx22)
    ret void
}

@debug_left_str = private unnamed_addr constant [6 x i8] c"left\0A\00", align 1
@debug_right_str = private unnamed_addr constant [7 x i8] c"right\0A\00", align 1

define void @quick_sort(i32* %start, i32* %end) {
entry: 
    call void @debug_print_size(i32* %start, i32* %end)

    %first_ptr = getelementptr i32, i32* %start, i32 1
    %valid = icmp ult i32* %first_ptr, %end
    br i1 %valid, label %setup, label %exit_early

exit_early:
    ret void

setup: 
    %pivot = load i32, i32* %start

    br label %loop

loop:
    ; PHI nodes to track the pointers and their previous values
    %elem_ptr = phi i32* [ %first_ptr, %setup ], [ %next_left, %append_left ], [ %elem_ptr, %append_right ]
    %prev_elem_ptr = phi i32* [ %first_ptr, %setup ], [ %elem_ptr, %append_left ], [ %elem_ptr, %append_right ]

    %ins_right_ptr = phi i32* [ %end, %setup ], [ %ins_right_ptr, %append_left ], [ %next_right, %append_right ]
    %prev_ins_right_ptr = phi i32* [ %end, %setup ], [ %ins_right_ptr, %append_left ], [ %ins_right_ptr, %append_right ]

    call void @debug_print_loopidx(i32* %start, i32* %elem_ptr, i32* %ins_right_ptr)

    ; Check if the pointers have crossed
    %crossed = icmp ule i32* %ins_right_ptr, %elem_ptr
    br i1 %crossed, label %done_loop, label %compare




compare:
    %elem = load i32, i32* %elem_ptr
    %bigger = icmp sgt i32 %elem, %pivot
    br i1 %bigger, label %append_right, label %append_left

append_left:	
    call i32 @printf(ptr @debug_left_str)
    %next_left = getelementptr i32, i32* %elem_ptr, i32 1
    br label %loop
	
append_right:
    call i32 @printf(ptr @debug_right_str)
    %swap_elem = load i32, i32* %ins_right_ptr
    store i32 %swap_elem, i32* %elem_ptr
    store i32 %elem, i32* %ins_right_ptr

    %next_right = getelementptr i32, i32* %ins_right_ptr, i32 -1
    br label %loop

done_loop:
    ; Use the previous iteration's pointers for the final swap
    %final_swap_elem = load i32, i32* %prev_elem_ptr
    store i32 %final_swap_elem, i32* %start
    store i32 %pivot, i32* %prev_elem_ptr

    ; Recursively sort the left and right subarrays
    %end_left = getelementptr i32, i32* %prev_elem_ptr, i32 -1
    call void @quick_sort(i32* %start, i32* %end_left)

    %start_right = getelementptr i32, i32* %prev_elem_ptr, i32 1
    call void @quick_sort(i32* %start_right, i32* %end)

    ret void

}
