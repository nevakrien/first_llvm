define void @quick_sort(i32* %start,i32* %end) {
	entry: 
		%degen = icmp ule i32* %start, %end
		br i1 %degen , label %exit_early, label %setup
	exit_early:
		ret void

	setup: 
		%pivot = load i32,i32* %start

		%insert_left = alloca i32*
		%insert_right = alloca i32*

		%first_ptr = getelementptr i32*,i32* %start, i1 1
		store i32* %first_ptr, ptr %insert_left
		store i32* %end, ptr %insert_right

		br label %loop
	loop:
		%elem_ptr = load i32*, ptr %insert_left
		%keep_looping = icmp ule i32* %start, %end
		br i1 %keep_looping , label %compare, label %done_loop

	compare:
		%elem = load i32, i32* %elem_ptr
		%bigger = icmp sgt i32 %elem,%pivot
		br i1 %bigger, label %append_right , label %append_left

	append_left:	
		%next_left = getelementptr i32*,i32* %elem_ptr, i1 1
		store i32* %next_left , ptr %insert_left
		br label %loop
	
	append_right:
		%ins_ptr = load i32*, ptr %insert_right
		%swap_elem = load i32, ptr %ins_ptr
		store i32 %elem, ptr %ins_ptr
		
		%next_right = getelementptr i32*,i32* %ins_ptr, i2 -1
		store i32* %next_right , ptr %insert_right
		br label %loop

	done_loop:
		store i32 %elem, ptr %start
		store i32 %pivot, ptr %elem_ptr

		%end_left = getelementptr i32*,i32* %elem_ptr, i2 -1
		call void @quick_sort(i32* %start,i32* %end_left)

		%start_right = getelementptr i32*,i32* %elem_ptr, i2 1
		call void @quick_sort(i32* %start_right,i32* %end)

		ret void
	
}