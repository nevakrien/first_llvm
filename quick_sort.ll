define void @quick_sort(i32* %arr,i64 %len) {
	entry:
	%pivot = load i32,i32* %arr
	
	%end_p = getelementptr i32*,i32* %arr,i64 %len
	%first = getelementptr i32*,i32* %arr, i1 1
	%last = getelementptr i32*,i32* %end_p, i2 -1
	

	%insert_left = alloca i32*
	%insert_right = alloca i32*

	store i32* %arr, ptr %insert_left
	store i32* %last, ptr %insert_right

	%empty = icmp sle i64 %len, 0
	br i1 %empty, label %end_empty, label %loop
	
	loop:
		%p =  phi i32* [ %first, %entry ], [ %next_p, %left ],[ %next_p, %right ]
		%next_p = getelementptr i32*,i32* %p,i1 1
		%done = icmp eq i32* %next_p, %end_p

		%left_ptr = load i32*, ptr %insert_left
		%right_ptr = load i32*,ptr %insert_right

		%elem = load i32, i32* %p
		%biger = icmp sgt i32 %elem , %pivot
		br i1 %biger, label %right,label %left

	left:
		%next_left = getelementptr i32*,i32* %left_ptr,i1 1
		store i32* %next_left, ptr %insert_left

		br i1 %done, label %recurse, label %loop

	right:
		%swap = load i32,ptr %right_ptr
		store i32 %swap, ptr %right_ptr

		%next_right = getelementptr i32*,i32* %right_ptr, i2 -1
		store i32* %next_right, ptr %insert_right 

		br i1 %done, label %recurse, label %loop
	
	recurse:
	ret void

	end_empty:
	ret void
}