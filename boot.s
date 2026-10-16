.extern kmain
.code16
.intel_syntax noprefix
.global _start

_start:
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov si, OFFSET message

print_message:
	lodsb
	or al, al
	jz runc
	mov ah, 0x0e
	int 0x10
	jmp print_message
runc:
	call kmain
	jmp hang
hang:
	cli
	hlt
	jmp hang

message:
	.asciz "Hello from message beast!"

.org 510
.word 0xaa55

