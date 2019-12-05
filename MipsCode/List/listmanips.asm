.data
start_msg:	.asciiz "List before: "
end_msg:	.asciiz "List after: "

.text
main:	jal	create_default_list #传建一个链表并返回头结点地址
	addu	$s0, $v0, $0	# $s0 为链表头节点地址

# 这里的链表创建比较巧妙，从 1-9 开始创建, 返回的 List 首节点地址却是 9 这个value 所在的节点的地址
# python 中的 map 是: 对某个序列执行某种函数

	#print "list before: "
	la	$a0, start_msg
	li	$v0, 4
	syscall

	#print the list
	addu	$a0, $s0, $0 #传入参数-首地址
	jal	print_list

	# print a newline
	jal	print_newline

	#issue the map call
	addu	$a0, $s0, $0	# 传入首节点地址 
	# load the address of the function into $a1 (check out la)
	### YOUR CODE HERE ###
    #这里期待你填第二个参数
    #void map(struct node *head, int (*f)(int))
    la $a1 square #假设第二个参数为 square
	jal	map

	# print "list after: "
	la	$a0, end_msg
	li	$v0, 4
	syscall

	#print the list
	addu	$a0, $s0, $0
	jal	print_list

	li	$v0, 10
	syscall

map:
	addiu	$sp, $sp, -12
	sw	$ra, 0($sp)
	sw	$s1, 4($sp)
	sw	$s0, 8($sp) 

	beq	$a0, $0, done	# if we were given a null pointer, we're dones(返回).

	addu	$s0, $a0, $0	# save address of this node in $s0
	addu	$s1, $a1, $0	# save address of function in $s1

	# remember that each node is 8 bytes long: 4 for the value followed by 4 for the pointer to next
	# load the value of the current node into $a0
	### YOUR CODE HERE ###
    	lw $a0 0($s0)
	# call the function on that value.
	### YOUR CODE HERE ###
    	jalr $s1  #这里第一次使用的 jalr 指令
	# store the returned value back into the node
	### YOUR CODE HERE ###
    sw $v0 0($s0) 
	# load the address of the next node into $a0
	### YOUR CODE HERE ###
    lw $a0 4($s0)  # tmp = tmp->next
	# put the address of the function back into $a1 to prepare for the recursion
	### YOUR CODE HERE ###
    la $a1 0($s1) 
	#recurse
	### YOUR CODE HERE ###
    jal map

done: #返回
	lw	$s0, 8($sp)
	lw	$s1, 4($sp)
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 12
	jr	$ra

square:
	mul	$v0 ,$a0, $a0
	jr	$ra

create_default_list:  #这个 process 创建了一个节点数目为10的单链表
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$s0, 0		# pointer to the last node we handled 初始化为 null
	li	$s1, 0		# number of nodes handled
loop:	#do...
	li	$a0, 8
    jal	malloc		# get memory for the next node
	sw	$s1, 0($v0)	# node->value = i # [0,8) hlaf store the addree of value, another half store the address of pointer "next". #注意此时 0($v0) 里没有数据
	sw	$s0, 4($v0)	# node->next = last
	addu	$s0, $0, $v0	# last = node
	addiu	$s1, $s1, 1	# i++
	bne	$s1, 10, loop	# ... while i!= 10
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr	$ra

print_list:
	bne	$a0, $0, printMeAndRecurse #if list in not null
	jr	$ra 		# nothing to print
printMeAndRecurse:
	addu	$t0, $a0, $0	# t0 gets current node address
	lw	$a0, 0($t0)	# a0 gets value in current node
	li	$v0, 1		# preparte for print integer syscall
	syscall
	li	$a0, ' '	# a0 gets address of string containing space
	li	$v0, 11		# prepare for print string syscall
	syscall
	lw	$a0, 4($t0)	# a0 gets address of next node
	j	print_list	# recurse. We don't have to use jal because we already have where we want to return to in $ra

print_newline:
	li	$a0, '\n'
	li	$v0, 11
	syscall
	jr	$ra

malloc:  #申请为 $a0 存储大小的内存,并返回其地址
	li	$v0, 9
	syscall
	jr	$ra

