.intel_syntax noprefix

.section __DATA,__data # .data
message: .asciz "Hello, world!\n"
.set message_size, . - message

.section __TEXT,__text # .text
.global entry
entry:
	# write(1, message, message_size)
	mov rax, 0x02000004
	mov rdi, 1
	lea rsi, message[rip]
	mov rdx, offset message_size
	syscall
	# exit(0)
	mov rax, 0x02000001
	mov rdi, 0
	syscall

.global _main
_main:
	call entry

