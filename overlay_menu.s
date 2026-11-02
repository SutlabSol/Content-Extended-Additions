	.watchos_version_min 2, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_overlay_menu_open              ; -- Begin function overlay_menu_open
	.p2align	4
_overlay_menu_open:                     ; @overlay_menu_open
; %bb.0:
	adrp	x8, _overlay@PAGE
	ldrb	w0, [x8, _overlay@PAGEOFF]
	ret
                                        ; -- End function
	.globl	_overlay_menu_typing            ; -- Begin function overlay_menu_typing
	.p2align	4
_overlay_menu_typing:                   ; @overlay_menu_typing
; %bb.0:
	adrp	x8, _overlay@PAGE
	ldrb	w8, [x8, _overlay@PAGEOFF]
	cbz	w8, LBB1_2
; %bb.1:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	bl	_tag_editor_menu_typing
	cmp	w0, #0
	cset	w0, ne
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB1_2:
	mov	w0, wzr
	ret
                                        ; -- End function
	.globl	_overlay_menu_toggle_request    ; -- Begin function overlay_menu_toggle_request
	.p2align	4
_overlay_menu_toggle_request:           ; @overlay_menu_toggle_request
; %bb.0:
	adrp	x8, _overlay@PAGE+1
	mov	w9, #1                          ; =0x1
	strb	w9, [x8, _overlay@PAGEOFF+1]
	ret
                                        ; -- End function
	.globl	_overlay_menu_take_pad          ; -- Begin function overlay_menu_take_pad
	.p2align	4
_overlay_menu_take_pad:                 ; @overlay_menu_take_pad
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	adrp	x23, _overlay@PAGE
	and	w24, w1, #0x700
	mov	w8, #769                        ; =0x301
	cmp	w24, #1792
	and	w8, w1, w8
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	cset	w22, eq
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	cmp	w8, #769
	ldrb	w20, [x23, _overlay@PAGEOFF]
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	cset	w25, eq
	cmp	w0, #3
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	b.hi	LBB3_14
; %bb.1:
	mov	w21, w1
	mov	w19, w0
Lloh0:
	adrp	x26, _overlay_menu_take_pad.chat_combinations@PAGE
Lloh1:
	add	x26, x26, _overlay_menu_take_pad.chat_combinations@PAGEOFF
	cmp	w8, #769
	b.ne	LBB3_4
; %bb.2:
	ldrb	w8, [x26, w19, sxtw]
	and	w9, w20, #0xff
	orr	w8, w8, w9
	cmp	w8, #0
	mov	w8, #1792                       ; =0x700
	ccmp	w24, w8, #4, eq
	b.eq	LBB3_4
; %bb.3:
	mov	w0, w19
	bl	_social_chat_toggle_request
LBB3_4:
	adrp	x27, _overlay_menu_take_pad.changes@PAGE
	strb	w25, [x26, w19, sxtw]
	ldr	w28, [x27, _overlay_menu_take_pad.changes@PAGEOFF]
	bl	_config_changes
	cmp	w28, w0
	b.eq	LBB3_6
; %bb.5:
	bl	_config_changes
	str	w0, [x27, _overlay_menu_take_pad.changes@PAGEOFF]
Lloh2:
	adrp	x0, l_.str@PAGE
Lloh3:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x8, _overlay_menu_take_pad.enabled@PAGE
	cset	w9, ne
	strb	w9, [x8, _overlay_menu_take_pad.enabled@PAGEOFF]
LBB3_6:
Lloh4:
	adrp	x25, _overlay@PAGE
Lloh5:
	add	x25, x25, _overlay@PAGEOFF
	add	x8, x25, w19, sxtw #2
	cmp	w24, #1792
	str	w21, [x8, #56]
	b.ne	LBB3_13
; %bb.7:
	add	x8, x25, w19, sxtw
	ldrb	w8, [x8, #72]
	cbnz	w8, LBB3_13
; %bb.8:
	adrp	x8, _overlay_menu_take_pad.enabled@PAGE
	ldrb	w9, [x8, _overlay_menu_take_pad.enabled@PAGEOFF]
	ldrb	w8, [x23, _overlay@PAGEOFF]
	orr	w9, w9, w8
	tst	w9, #0xff
	b.eq	LBB3_13
; %bb.9:
	cbz	w8, LBB3_12
; %bb.10:
	mov	w0, wzr
LBB3_11:
	bl	_overlay_set_open
	b	LBB3_13
LBB3_12:
	bl	_network_chat_typing
	cbz	w0, LBB3_15
LBB3_13:
	ldrb	w8, [x25]
	and	w9, w20, #0xff
	orr	w8, w8, w9
	add	x9, x25, w19, sxtw
	cmp	w8, #0
	cset	w20, ne
	strb	w22, [x9, #72]
LBB3_14:
	mov	w0, w20
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB3_15:
	ldrb	w8, [x23, _overlay@PAGEOFF]
	cmp	w8, #0
	cset	w0, eq
	b	LBB3_11
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_set_open
_overlay_set_open:                      ; @overlay_set_open
; %bb.0:
	adrp	x8, _overlay@PAGE
	ldrb	w8, [x8, _overlay@PAGEOFF]
	cmp	w8, w0
	b.eq	LBB4_16
; %bb.1:
	stp	x28, x27, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	sub	sp, sp, #576
	cbnz	w0, LBB4_3
; %bb.2:
	mov	w19, w0
	mov	w0, #1                          ; =0x1
	bl	_tag_editor_menu_update
	mov	w0, w19
LBB4_3:
Lloh6:
	adrp	x19, _overlay@PAGE
Lloh7:
	add	x19, x19, _overlay@PAGEOFF
	ldp	w8, w9, [x19, #56]
	ldp	w10, w11, [x19, #64]
	orr	w8, w8, w9
	strb	w0, [x19]
	strh	wzr, [x19, #184]
	orr	w9, w10, w11
	orr	w8, w8, w9
	stp	w8, wzr, [x19, #76]
	cbz	w0, LBB4_15
; %bb.4:
	bl	_platform_data_root
	mov	x8, x0
Lloh8:
	adrp	x2, l_.str.12@PAGE
Lloh9:
	add	x2, x2, l_.str.12@PAGEOFF
	add	x0, sp, #64
	mov	w1, #512                        ; =0x200
	str	w8, [sp]
	bl	_halo_linux_snprintf
	add	x0, sp, #64
	add	x1, sp, #28
	bl	_posix_stat
	cbz	w0, LBB4_6
; %bb.5:
	add	x0, sp, #64
	bl	_posix_make_directory
LBB4_6:
	add	x0, sp, #64
	mov	w1, wzr
	mov	w2, wzr
	bl	_overlay_signature
Lloh10:
	adrp	x8, _overlay_tree@PAGE+103952
Lloh11:
	add	x8, x8, _overlay_tree@PAGEOFF+103952
	ldrb	w9, [x8, #4]
	cbz	w9, LBB4_9
; %bb.7:
	ldr	w8, [x8]
	cmp	w0, w8
	b.ne	LBB4_9
; %bb.8:
	adrp	x8, _overlay@PAGE+2
	ldrsh	w9, [x8, _overlay@PAGEOFF+2]
	b	LBB4_10
LBB4_9:
	mov	w8, #36880                      ; =0x9010
Lloh12:
	adrp	x20, _overlay_tree@PAGE+1536
Lloh13:
	add	x20, x20, _overlay_tree@PAGEOFF+1536
	movk	w8, #1, lsl #16
	mov	w9, #36884                      ; =0x9014
	mov	w10, #1                         ; =0x1
	movk	w9, #1, lsl #16
	mov	w21, #36872                     ; =0x9008
	str	w0, [x20, x8]
	mov	w8, #36876                      ; =0x900c
	movk	w8, #1, lsl #16
Lloh14:
	adrp	x0, l_.str.4@PAGE
Lloh15:
	add	x0, x0, l_.str.4@PAGEOFF
Lloh16:
	adrp	x1, _overlay_root@PAGE
Lloh17:
	add	x1, x1, _overlay_root@PAGEOFF
	add	x2, sp, #64
	mov	w3, wzr
	strh	w10, [x20, x9]
	strh	wzr, [x20]
	add	x22, sp, #64
	strh	wzr, [x20, #6148]
	strh	wzr, [x20, x21]
	str	wzr, [x20, x8]
	bl	_overlay_build_folder
	add	x8, x20, #25, lsl #12           ; =102400
	ldrsh	w9, [x20]
Lloh18:
	adrp	x10, l_.str.14@PAGE
Lloh19:
	add	x10, x10, l_.str.14@PAGEOFF
Lloh20:
	adrp	x11, l_.str.15@PAGE
Lloh21:
	add	x11, x11, l_.str.15@PAGEOFF
	ldrb	w8, [x8, #21]
Lloh22:
	adrp	x1, l_.str.13@PAGE
Lloh23:
	add	x1, x1, l_.str.13@PAGEOFF
	ldrsh	w12, [x20, x21]
	mov	w0, #2                          ; =0x2
	stp	w22, w9, [sp]
	cmp	w8, #0
	csel	x8, x11, x10, eq
	stp	w12, w8, [sp, #8]
	bl	_error
	mov	w9, wzr
Lloh24:
	adrp	x8, _overlay@PAGE+2
Lloh25:
	add	x8, x8, _overlay@PAGEOFF+2
	strh	wzr, [x8]
	strh	wzr, [x8, #34]
	strh	wzr, [x8, #50]
LBB4_10:
	ldrsh	w8, [x19, #206]
Lloh26:
	adrp	x10, _overlay_tree@PAGE
Lloh27:
	add	x10, x10, _overlay_tree@PAGEOFF
	cmp	w8, #1
	str	w10, [x19, #4]
	b.lt	LBB4_15
; %bb.11:
	add	x10, x19, w9, sxtw #1
	adrp	x9, _overlay@PAGE+52
	ldrsh	w10, [x10, #36]
	ldrsh	w11, [x9, _overlay@PAGEOFF+52]
	cmp	w10, w11
	b.ge	LBB4_13
; %bb.12:
	mov	w11, w10
	strh	w10, [x9, _overlay@PAGEOFF+52]
LBB4_13:
	add	w11, w11, w8
	cmp	w11, w10
	b.gt	LBB4_15
; %bb.14:
	sub	w8, w10, w8
	add	w8, w8, #1
	strh	w8, [x9, _overlay@PAGEOFF+52]
LBB4_15:
	add	sp, sp, #576
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #64             ; 16-byte Folded Reload
LBB4_16:
	ret
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh26, Lloh27
                                        ; -- End function
	.globl	_overlay_menu_pointer           ; -- Begin function overlay_menu_pointer
	.p2align	4
_overlay_menu_pointer:                  ; @overlay_menu_pointer
; %bb.0:
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	adrp	x21, _overlay@PAGE
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	ldrb	w8, [x21, _overlay@PAGEOFF]
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	cbz	w8, LBB5_33
; %bb.1:
	mov	x19, x0
	bl	_tag_editor_menu_typing
	cbz	w0, LBB5_5
; %bb.2:
	ldrb	w8, [x19, #9]
	cbz	w8, LBB5_31
; %bb.3:
	bl	_halo_system_keyboard
	cbz	w0, LBB5_23
; %bb.4:
	bl	_halo_system_keyboard_again
	b	LBB5_33
LBB5_5:
Lloh28:
	adrp	x20, _overlay@PAGE
Lloh29:
	add	x20, x20, _overlay@PAGEOFF
	ldrb	w8, [x20]
	cbz	w8, LBB5_33
; %bb.6:
	ldrb	w8, [x20, #184]
	cbz	w8, LBB5_33
; %bb.7:
	bl	_overlay_editor_refresh
	ldrh	w23, [x19]
	bl	_halo_screen_width
	ldrsb	w9, [x19, #11]
	ldrsh	w8, [x19, #2]
	cbz	w9, LBB5_9
; %bb.8:
	ldrsh	x10, [x20, #2]
	ldrsh	w12, [x20, #206]
	ldrsh	w13, [x20, #52]
	add	x11, x20, x10, lsl #2
	add	x10, x20, x10, lsl #1
	sub	w9, w13, w9
	ldr	w11, [x11, #4]
	ldrsh	w11, [x11, #4]
	subs	w11, w11, w12
	sxth	w11, w11
	csel	w11, w11, wzr, gt
	cmp	w9, w11
	csel	w11, w9, w11, lt
	cmp	w9, #0
	csel	w9, wzr, w11, mi
	sxth	w13, w9
	add	w12, w12, w13
	sub	w12, w12, #1
	strh	w9, [x20, #52]
	ldrsh	w11, [x10, #36]
	cmp	w11, w12
	csel	w12, w11, w12, lt
	cmp	w13, w11
	csel	w9, w9, w12, gt
	strh	w9, [x10, #36]
LBB5_9:
	ldrb	w9, [x19, #8]
	adrp	x22, _overlay@PAGE+186
	cbz	w9, LBB5_16
; %bb.10:
	sub	w9, w0, #640
	ldrsh	w10, [x22, _overlay@PAGEOFF+186]
	ldrb	w11, [x19, #12]
	add	w9, w9, w9, lsr #31
	add	w9, w23, w9, lsr #1
	sxth	w9, w9
	sxth	w9, w9
	cmp	w9, w10
	ccmn	w9, #1, #4, lt
	ccmp	w11, #0, #0, gt
	b.ne	LBB5_16
; %bb.11:
Lloh30:
	adrp	x9, _overlay@PAGE+202
Lloh31:
	add	x9, x9, _overlay@PAGEOFF+202
	ldrsh	w10, [x9]
	subs	w8, w8, w10
	b.lt	LBB5_16
; %bb.12:
	ldrsh	w9, [x9, #2]
	cmp	w9, #1
	b.lt	LBB5_16
; %bb.13:
Lloh32:
	adrp	x10, _overlay@PAGE+52
Lloh33:
	add	x10, x10, _overlay@PAGEOFF+52
	sdiv	w8, w8, w9
	ldrsh	w11, [x10]
	ldrsh	w10, [x10, #154]
	add	w8, w11, w8
	add	w9, w10, w11
	sxth	w8, w8
	cmp	w9, w8
	b.le	LBB5_16
; %bb.14:
	ldrsh	x9, [x20, #2]
	add	x10, x20, x9, lsl #2
	ldr	w10, [x10, #4]
	ldrsh	w10, [x10, #4]
	cmp	w8, w10
	b.ge	LBB5_16
; %bb.15:
	add	x9, x20, w9, sxtw #1
	strh	w8, [x9, #36]
LBB5_16:
	ldrb	w8, [x19, #10]
	cbz	w8, LBB5_18
; %bb.17:
	bl	_overlay_back
LBB5_18:
	ldrb	w8, [x19, #9]
	cbz	w8, LBB5_33
; %bb.19:
	ldrh	w23, [x19, #4]
	bl	_halo_screen_width
	sub	w8, w0, #640
	add	w8, w8, w8, lsr #31
	add	w8, w23, w8, lsr #1
	tbnz	w8, #15, LBB5_34
; %bb.20:
	ldrsh	w9, [x22, _overlay@PAGEOFF+186]
	sxth	w8, w8
	cmp	w8, w9
	b.ge	LBB5_34
; %bb.21:
Lloh34:
	adrp	x9, _overlay@PAGE+2
Lloh35:
	add	x9, x9, _overlay@PAGEOFF+2
	ldrsh	w8, [x19, #6]
	ldrsh	w10, [x9, #188]
	ldrsh	w11, [x9, #186]
	sxth	w12, w8
	ldrsh	w9, [x9]
	cmp	w12, w10
	ccmp	w12, w11, #8, lt
	ccmp	w9, #0, #4, ge
	b.le	LBB5_36
; %bb.22:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	b	_overlay_back
LBB5_23:
	ldrb	w8, [x19, #9]
	cbz	w8, LBB5_31
; %bb.24:
	adrp	x8, _overlay@PAGE+192
	ldrb	w8, [x8, _overlay@PAGEOFF+192]
	cbz	w8, LBB5_31
; %bb.25:
	ldrh	w20, [x19, #4]
	bl	_halo_screen_width
Lloh36:
	adrp	x8, _overlay@PAGE+194
Lloh37:
	add	x8, x8, _overlay@PAGEOFF+194
	ldrsh	w10, [x8, #4]
	ldrsh	w11, [x8]
	ldrsh	w12, [x8, #6]
	ldrsh	w13, [x8, #2]
	sub	w8, w10, w11
	sxth	w8, w8
	cmp	w8, #0
	sub	w9, w12, w13
	sxth	w9, w9
	ccmp	w9, #0, #4, gt
	b.le	LBB5_33
; %bb.26:
	sub	w14, w0, #640
	add	w14, w14, w14, lsr #31
	add	w14, w20, w14, lsr #1
	sxth	w14, w14
	subs	w13, w14, w13
	b.lt	LBB5_33
; %bb.27:
	cmp	w14, w12
	b.ge	LBB5_33
; %bb.28:
	ldrsh	w12, [x19, #6]
	subs	w11, w12, w11
	b.lt	LBB5_33
; %bb.29:
	cmp	w12, w10
	b.ge	LBB5_33
; %bb.30:
	add	w10, w11, w11, lsl #2
	add	w11, w13, w13, lsl #2
	lsl	w11, w11, #1
	sdiv	w8, w10, w8
	sdiv	w9, w11, w9
	sxth	w0, w8
	sxth	w1, w9
	bl	_tag_editor_menu_keyboard_press
	b	LBB5_33
LBB5_31:
	ldrb	w8, [x19, #10]
	cbz	w8, LBB5_33
; %bb.32:
	add	x0, sp, #14
	bl	_tag_editor_menu_back
LBB5_33:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB5_34:
	ldrb	w8, [x21, _overlay@PAGEOFF]
	cbz	w8, LBB5_33
; %bb.35:
	mov	w0, #1                          ; =0x1
	bl	_tag_editor_menu_update
	ldp	w8, w9, [x20, #56]
	ldp	w10, w11, [x20, #64]
	orr	w8, w9, w8
	strb	wzr, [x20]
	strh	wzr, [x20, #184]
	orr	w9, w10, w11
	orr	w8, w8, w9
	stp	w8, wzr, [x20, #76]
	b	LBB5_33
LBB5_36:
Lloh38:
	adrp	x9, _overlay@PAGE+202
Lloh39:
	add	x9, x9, _overlay@PAGEOFF+202
	ldrsh	w10, [x9]
	subs	w8, w8, w10
	b.lt	LBB5_33
; %bb.37:
	ldrsh	w9, [x9, #2]
	cmp	w9, #1
	b.lt	LBB5_33
; %bb.38:
Lloh40:
	adrp	x10, _overlay@PAGE+52
Lloh41:
	add	x10, x10, _overlay@PAGEOFF+52
	sdiv	w8, w8, w9
	ldrsh	w11, [x10]
	ldrsh	w10, [x10, #154]
	add	w8, w11, w8
	add	w9, w10, w11
	sxth	w0, w8
	cmp	w9, w0
	b.le	LBB5_33
; %bb.39:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	b	_overlay_choose
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpAdd	Lloh34, Lloh35
	.loh AdrpAdd	Lloh36, Lloh37
	.loh AdrpAdd	Lloh38, Lloh39
	.loh AdrpAdd	Lloh40, Lloh41
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_editor_refresh
_overlay_editor_refresh:                ; @overlay_editor_refresh
; %bb.0:
	adrp	x8, _overlay@PAGE
	ldrb	w8, [x8, _overlay@PAGEOFF]
	cbz	w8, LBB6_2
; %bb.1:
Lloh42:
	adrp	x9, _overlay@PAGE
Lloh43:
	add	x9, x9, _overlay@PAGEOFF
	ldrsh	x8, [x9, #2]
	add	x8, x9, x8, lsl #2
Lloh44:
	adrp	x9, _overlay_editor@PAGE
Lloh45:
	add	x9, x9, _overlay_editor@PAGEOFF
	ldr	w8, [x8, #4]
	cmp	w8, w9
	b.eq	LBB6_3
LBB6_2:
	ret
LBB6_3:
	sub	sp, sp, #112
Lloh46:
	adrp	x0, _overlay_editor@PAGE+10252
Lloh47:
	add	x0, x0, _overlay_editor@PAGEOFF+10252
	mov	w1, #160                        ; =0xa0
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	bl	_tag_editor_menu_rows
	cmp	w0, #1
	str	w0, [sp, #8]                    ; 4-byte Spill
	b.lt	LBB6_6
; %bb.4:
	ldr	w9, [sp, #8]                    ; 4-byte Reload
	mov	w20, wzr
	mov	w24, #9612                      ; =0x258c
	mov	w25, #10342                     ; =0x2866
	mov	w26, #10318                     ; =0x284e
	mov	w27, #10254                     ; =0x280e
	mov	w28, #10252                     ; =0x280c
Lloh48:
	adrp	x19, _overlay_editor@PAGE
Lloh49:
	add	x19, x19, _overlay_editor@PAGEOFF
	lsl	w8, w9, #6
	sub	w8, w8, w9, lsl #2
	str	w8, [sp, #12]                   ; 4-byte Spill
	.p2align	4, , 8
LBB6_5:                                 ; =>This Inner Loop Header: Depth=1
	add	w22, w19, w20
	mov	w1, wzr
	add	w0, w22, #12
	mov	w2, #60                         ; =0x3c
	add	w21, w22, #12
	add	w23, w19, w28
	bl	_csmemset
	add	w8, w22, #14
	add	w9, w19, w27
	add	w10, w22, #16
	mov	w11, #6                         ; =0x6
	add	w20, w20, #60
	add	w27, w27, #218
	strh	wzr, [x8]
	add	w8, w22, #42
	str	w9, [x10]
	mov	w9, #65535                      ; =0xffff
	strh	w11, [x21]
	add	w10, w19, w25
	sub	w11, w10, #24
	add	w25, w25, #218
	strh	w9, [x8]
	add	w9, w22, #64
	ldrh	w8, [x23]
	add	w28, w28, #218
	strh	w8, [x9]
	add	w9, w19, w26
	ldrb	w8, [x11]
	add	w11, w19, w24
	add	w24, w24, #4
	add	w26, w26, #218
	cmp	w8, #0
	add	w8, w22, #68
	csel	x9, xzr, x9, eq
	str	w9, [x8]
	add	w9, w22, #60
	ldrb	w8, [x10]
	cmp	w8, #0
	csel	x8, xzr, x10, eq
	ldr	w10, [sp, #12]                  ; 4-byte Reload
	str	w8, [x9]
	cmp	w10, w20
	str	w21, [x11]
	b.ne	LBB6_5
LBB6_6:
	bl	_tag_editor_menu_title
	mov	w9, #45132                      ; =0xb04c
Lloh50:
	adrp	x19, _overlay_editor@PAGE
Lloh51:
	add	x19, x19, _overlay_editor@PAGEOFF
	mov	x8, x0
	add	x20, x19, x9
Lloh52:
	adrp	x2, l_.str.260@PAGE
Lloh53:
	add	x2, x2, l_.str.260@PAGEOFF
	mov	x0, x20
	mov	w1, #64                         ; =0x40
	str	w8, [sp]
	bl	_halo_linux_snprintf
Lloh54:
	adrp	x11, _overlay@PAGE
Lloh55:
	add	x11, x11, _overlay@PAGEOFF
	mov	w10, #9612                      ; =0x258c
	ldr	w12, [sp, #8]                   ; 4-byte Reload
	add	w10, w19, w10
	str	w20, [x19]
	ldrsh	x8, [x11, #2]
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	strh	w12, [x19, #4]
	add	x9, x11, x8, lsl #1
	str	w10, [x19, #8]
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldrsh	w9, [x9, #36]
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	cmp	w9, w12
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	b.lt	LBB6_2
; %bb.7:
	cmp	w12, #1
	lsl	w8, w8, #1
	csinc	w9, w12, wzr, gt
	add	x8, x11, w8, sxtw
	sub	w9, w9, #1
	strh	w9, [x8, #36]
	ret
	.loh AdrpAdd	Lloh44, Lloh45
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpAdd	Lloh46, Lloh47
	.loh AdrpAdd	Lloh48, Lloh49
	.loh AdrpAdd	Lloh54, Lloh55
	.loh AdrpAdd	Lloh52, Lloh53
	.loh AdrpAdd	Lloh50, Lloh51
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_back
_overlay_back:                          ; @overlay_back
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
Lloh56:
	adrp	x19, _overlay@PAGE
Lloh57:
	add	x19, x19, _overlay@PAGEOFF
Lloh58:
	adrp	x10, _overlay_editor@PAGE
Lloh59:
	add	x10, x10, _overlay_editor@PAGEOFF
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	strh	wzr, [sp, #14]
	ldrsh	x8, [x19, #2]
	add	x9, x19, x8, lsl #2
	ldr	w9, [x9, #4]
	cmp	w9, w10
	b.eq	LBB7_6
; %bb.1:
	and	w9, w8, #0xffff
LBB7_2:
	sxth	w8, w9
	cmp	w8, #1
	b.lt	LBB7_12
; %bb.3:
	ldrsh	w8, [x19, #206]
	sub	w9, w9, #1
	strh	wzr, [x19, #52]
	strh	w9, [x19, #2]
	cmp	w8, #1
	b.lt	LBB7_19
; %bb.4:
	add	x9, x19, w9, uxth #1
	ldrsh	w9, [x9, #36]
	tbnz	w9, #31, LBB7_15
; %bb.5:
	mov	w10, wzr
	b	LBB7_16
LBB7_6:
	add	x0, sp, #14
	bl	_tag_editor_menu_back
	cbz	w0, LBB7_14
; %bb.7:
Lloh60:
	adrp	x20, _overlay@PAGE+2
Lloh61:
	add	x20, x20, _overlay@PAGEOFF+2
	ldrh	w8, [sp, #14]
	add	x19, x20, #34
	ldrsh	x9, [x20]
	strh	w8, [x19, x9, lsl #1]
	strh	wzr, [x20, #50]
	bl	_overlay_editor_refresh
	ldrsh	w8, [x20, #204]
	cmp	w8, #1
	b.lt	LBB7_19
; %bb.8:
	ldrsh	x10, [x20]
	adrp	x9, _overlay@PAGE+52
	ldrsh	w11, [x9, _overlay@PAGEOFF+52]
	ldrsh	w10, [x19, x10, lsl #1]
	cmp	w10, w11
	b.ge	LBB7_10
; %bb.9:
	mov	w11, w10
	strh	w10, [x9, _overlay@PAGEOFF+52]
LBB7_10:
	add	w11, w11, w8
	cmp	w11, w10
	b.gt	LBB7_19
; %bb.11:
	sub	w8, w10, w8
	b	LBB7_18
LBB7_12:
	adrp	x8, _overlay@PAGE
	ldrb	w8, [x8, _overlay@PAGEOFF]
	cbz	w8, LBB7_19
; %bb.13:
	mov	w0, #1                          ; =0x1
	bl	_tag_editor_menu_update
	ldp	w8, w9, [x19, #56]
	ldp	w10, w11, [x19, #64]
	orr	w8, w9, w8
	strb	wzr, [x19]
	strh	wzr, [x19, #184]
	orr	w9, w10, w11
	orr	w8, w8, w9
	stp	w8, wzr, [x19, #76]
	b	LBB7_19
LBB7_14:
	adrp	x8, _overlay@PAGE+2
	ldrh	w9, [x8, _overlay@PAGEOFF+2]
	b	LBB7_2
LBB7_15:
	adrp	x11, _overlay@PAGE+52
	mov	w10, w9
	strh	w9, [x11, _overlay@PAGEOFF+52]
LBB7_16:
	add	w10, w10, w8
	cmp	w10, w9
	b.gt	LBB7_19
; %bb.17:
	sub	w8, w9, w8
	adrp	x9, _overlay@PAGE+52
LBB7_18:
	add	w8, w8, #1
	strh	w8, [x9, _overlay@PAGEOFF+52]
LBB7_19:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh58, Lloh59
	.loh AdrpAdd	Lloh56, Lloh57
	.loh AdrpAdd	Lloh60, Lloh61
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_choose
_overlay_choose:                        ; @overlay_choose
; %bb.0:
	sub	sp, sp, #336
	stp	x24, x23, [sp, #272]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #288]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #304]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #320]            ; 16-byte Folded Spill
	add	x29, sp, #320
	tbnz	w0, #31, LBB8_37
; %bb.1:
Lloh62:
	adrp	x20, _overlay@PAGE
Lloh63:
	add	x20, x20, _overlay@PAGEOFF
	ldrsh	x9, [x20, #2]
	add	x8, x20, x9, lsl #2
	ldr	w8, [x8, #4]
	ldrsh	w10, [x8, #4]
	cmp	w0, w10
	b.ge	LBB8_37
; %bb.2:
	add	x9, x20, w9, sxtw #1
	mov	w22, #1                         ; =0x1
	strh	w0, [x9, #36]
	ldr	w8, [x8, #8]
	ldr	w19, [x8, w0, sxtw #2]
	mov	w8, #8                          ; =0x8
	ldrh	w9, [x19]
	cmp	w9, #3
	b.le	LBB8_15
; %bb.3:
	cmp	w9, #4
	b.eq	LBB8_20
; %bb.4:
	cmp	w9, #5
	b.eq	LBB8_22
; %bb.5:
	cmp	w9, #6
	b.ne	LBB8_25
; %bb.6:
	strh	w0, [sp, #14]
	bl	_tag_editor_menu_title
	mov	x8, x0
Lloh64:
	adrp	x2, l_.str.260@PAGE
Lloh65:
	add	x2, x2, l_.str.260@PAGEOFF
	add	x0, sp, #16
	mov	w1, #64                         ; =0x40
	str	w8, [sp]
	bl	_halo_linux_snprintf
Lloh66:
	adrp	x8, _overlay_editor@PAGE
Lloh67:
	add	x8, x8, _overlay_editor@PAGEOFF
	sub	w8, w19, w8
	mov	w9, #61167                      ; =0xeeef
	sub	w8, w8, #12
	movk	w9, #61166, lsl #16
	lsr	w8, w8, #2
	add	x1, sp, #14
	mul	w8, w8, w9
	add	x2, sp, #144
	mov	w3, #96                         ; =0x60
	sxth	w0, w8
	bl	_tag_editor_menu_choose
	ldrsh	x8, [x20, #2]
	ldrh	w9, [sp, #14]
	add	x8, x20, x8, lsl #1
	strh	w9, [x8, #36]
	bl	_tag_editor_menu_title
	mov	x1, x0
	add	x0, sp, #16
	bl	_csstrcmp
	adrp	x19, _overlay@PAGE+52
	cbz	w0, LBB8_8
; %bb.7:
	strh	wzr, [x19, _overlay@PAGEOFF+52]
LBB8_8:
	bl	_overlay_editor_refresh
	ldrsh	w8, [x20, #206]
	cmp	w8, #1
	b.lt	LBB8_13
; %bb.9:
	ldrsh	x9, [x20, #2]
	ldrsh	w10, [x19, _overlay@PAGEOFF+52]
	add	x9, x20, x9, lsl #1
	ldrsh	w9, [x9, #36]
	cmp	w9, w10
	b.ge	LBB8_11
; %bb.10:
	mov	w10, w9
	strh	w9, [x19, _overlay@PAGEOFF+52]
LBB8_11:
	add	w10, w10, w8
	cmp	w10, w9
	b.gt	LBB8_13
; %bb.12:
	sub	w8, w9, w8
	add	w8, w8, #1
	strh	w8, [x19, _overlay@PAGEOFF+52]
LBB8_13:
	ldrb	w8, [sp, #144]
	cbz	w8, LBB8_37
; %bb.14:
Lloh68:
	adrp	x19, _overlay@PAGE+84
Lloh69:
	add	x19, x19, _overlay@PAGEOFF+84
Lloh70:
	adrp	x2, l_.str.260@PAGE
Lloh71:
	add	x2, x2, l_.str.260@PAGEOFF
	add	x8, sp, #144
	mov	x0, x19
	mov	w1, #96                         ; =0x60
	str	w8, [sp]
	b	LBB8_21
LBB8_15:
	cmp	w9, #1
	b.eq	LBB8_24
; %bb.16:
	cmp	w9, #3
	b.ne	LBB8_25
; %bb.17:
	adrp	x8, _overlay@PAGE+2
	ldrsh	w9, [x8, _overlay@PAGEOFF+2]
	cmp	w9, #6
	b.gt	LBB8_37
; %bb.18:
	ldr	w8, [x19, #36]
	cbz	w8, LBB8_37
; %bb.19:
	add	w9, w9, #1
	add	x10, x20, w9, sxth #2
	strh	w9, [x20, #2]
	str	w8, [x10, #4]
	ldrsh	x8, [x20, #2]
	add	x8, x20, x8, lsl #1
	strh	wzr, [x8, #36]
	strh	wzr, [x20, #52]
	b	LBB8_37
LBB8_20:
	ldp	w10, w8, [x19, #40]
Lloh72:
	adrp	x9, l_.str.262@PAGE
Lloh73:
	add	x9, x9, l_.str.262@PAGEOFF
Lloh74:
	adrp	x2, l_.str.261@PAGE
Lloh75:
	add	x2, x2, l_.str.261@PAGEOFF
	add	x0, sp, #144
	mov	w1, #96                         ; =0x60
	cmp	w8, #0
	add	x20, sp, #144
	csel	x8, x9, x8, eq
	stp	w8, w10, [sp]
	bl	_halo_linux_snprintf
Lloh76:
	adrp	x19, _overlay@PAGE+84
Lloh77:
	add	x19, x19, _overlay@PAGEOFF+84
Lloh78:
	adrp	x2, l_.str.260@PAGE
Lloh79:
	add	x2, x2, l_.str.260@PAGEOFF
	mov	x0, x19
	mov	w1, #96                         ; =0x60
	str	w20, [sp]
LBB8_21:
	bl	_halo_linux_snprintf
	bl	_system_milliseconds
	add	w8, w0, #3000
	str	w8, [x19, #96]
	b	LBB8_37
LBB8_22:
	adrp	x8, _overlay@PAGE+2
	ldrsh	w8, [x8, _overlay@PAGEOFF+2]
	cmp	w8, #6
	b.gt	LBB8_37
; %bb.23:
	bl	_tag_editor_menu_open
	ldrh	w8, [x20, #2]
Lloh80:
	adrp	x10, _overlay_editor@PAGE
Lloh81:
	add	x10, x10, _overlay_editor@PAGEOFF
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	add	w8, w8, #1
	ldp	x22, x21, [sp, #288]            ; 16-byte Folded Reload
	add	x9, x20, w8, sxth #2
	strh	w8, [x20, #2]
	ldp	x24, x23, [sp, #272]            ; 16-byte Folded Reload
	str	w10, [x9, #4]
	ldrsh	x8, [x20, #2]
	add	x8, x20, x8, lsl #1
	strh	wzr, [x8, #36]
	strh	wzr, [x20, #52]
	ldp	x20, x19, [sp, #304]            ; 16-byte Folded Reload
	add	sp, sp, #336
	b	_overlay_editor_refresh
LBB8_24:
	mov	x0, x19
	bl	_overlay_entry_on
	mov	w8, #12                         ; =0xc
	cmp	w0, #0
	mov	w9, #8                          ; =0x8
	cset	w22, eq
	csel	w8, w9, w8, eq
LBB8_25:
	ldr	w20, [x19, w8, uxtw]
	cbz	w20, LBB8_37
; %bb.26:
Lloh82:
	adrp	x1, l_.str.266@PAGE
Lloh83:
	add	x1, x1, l_.str.266@PAGEOFF
	mov	x0, x20
	mov	w2, #7                          ; =0x7
	strb	wzr, [sp, #16]
	bl	_csstrncmp
	cbz	w0, LBB8_29
; %bb.27:
	mov	x0, x20
	bl	_hs_compile_and_evaluate
	cbnz	w0, LBB8_32
; %bb.28:
Lloh84:
	adrp	x2, l_.str.268@PAGE
Lloh85:
	add	x2, x2, l_.str.268@PAGEOFF
	add	x0, sp, #16
	mov	w1, #128                        ; =0x80
	bl	_halo_linux_snprintf
	b	LBB8_34
LBB8_29:
Lloh86:
	adrp	x1, l_.str.267@PAGE
Lloh87:
	add	x1, x1, l_.str.267@PAGEOFF
	add	x0, x20, #7
	bl	_strcspn
	mov	w8, #127                        ; =0x7f
	cmp	w0, #127
	csel	w21, w0, w8, lo
	add	x0, sp, #144
	add	x1, x20, #7
	mov	w2, w21
	add	x23, sp, #144
	bl	_csmemcpy
	add	w8, w21, w20
	strb	wzr, [x23, w21, uxtw]
	add	w1, w8, #6
	.p2align	4, , 8
LBB8_30:                                ; =>This Inner Loop Header: Depth=1
	add	w1, w1, #1
	ldrb	w8, [x1]
	cmp	w8, #32
	b.eq	LBB8_30
; %bb.31:
	add	x0, sp, #144
	add	x2, sp, #16
	mov	w3, #128                        ; =0x80
	bl	_config_set_text
	cbz	w0, LBB8_34
LBB8_32:
	ldrh	w8, [x19]
	cmp	w8, #1
	b.ne	LBB8_35
; %bb.33:
Lloh88:
	adrp	x8, l_.str.27@PAGE
Lloh89:
	add	x8, x8, l_.str.27@PAGEOFF
Lloh90:
	adrp	x9, l_.str.23@PAGE
Lloh91:
	add	x9, x9, l_.str.23@PAGEOFF
	ldr	w10, [x19, #4]
	cmp	w22, #0
	csel	x8, x9, x8, eq
	strb	w22, [x19, #28]
Lloh92:
	adrp	x2, l_.str.261@PAGE
Lloh93:
	add	x2, x2, l_.str.261@PAGEOFF
	add	x0, sp, #144
	mov	w1, #96                         ; =0x60
	stp	w10, w8, [sp]
	b	LBB8_36
LBB8_34:
	ldrb	w8, [sp, #16]
Lloh94:
	adrp	x10, l_.str.264@PAGE
Lloh95:
	add	x10, x10, l_.str.264@PAGEOFF
	ldr	w9, [x19, #4]
Lloh96:
	adrp	x2, l_.str.261@PAGE
Lloh97:
	add	x2, x2, l_.str.261@PAGEOFF
	add	x0, sp, #144
	mov	w1, #96                         ; =0x60
	cmp	w8, #0
	add	x8, sp, #16
	csel	x8, x10, x8, eq
	stp	w9, w8, [sp]
	b	LBB8_36
LBB8_35:
	ldr	w8, [x19, #4]
Lloh98:
	adrp	x2, l_.str.263@PAGE
Lloh99:
	add	x2, x2, l_.str.263@PAGEOFF
	add	x0, sp, #144
	mov	w1, #96                         ; =0x60
	str	w8, [sp]
LBB8_36:
	bl	_halo_linux_snprintf
Lloh100:
	adrp	x19, _overlay@PAGE+84
Lloh101:
	add	x19, x19, _overlay@PAGEOFF+84
Lloh102:
	adrp	x2, l_.str.260@PAGE
Lloh103:
	add	x2, x2, l_.str.260@PAGEOFF
	add	x21, sp, #144
	mov	x0, x19
	mov	w1, #96                         ; =0x60
	str	w21, [sp]
	bl	_halo_linux_snprintf
	bl	_system_milliseconds
	add	w8, w0, #3000
Lloh104:
	adrp	x1, l_.str.265@PAGE
Lloh105:
	add	x1, x1, l_.str.265@PAGEOFF
	mov	w0, #2                          ; =0x2
	str	w8, [x19, #96]
	stp	w20, w21, [sp]
	bl	_error
LBB8_37:
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #304]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #288]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #272]            ; 16-byte Folded Reload
	add	sp, sp, #336
	ret
	.loh AdrpAdd	Lloh62, Lloh63
	.loh AdrpAdd	Lloh66, Lloh67
	.loh AdrpAdd	Lloh64, Lloh65
	.loh AdrpAdd	Lloh70, Lloh71
	.loh AdrpAdd	Lloh68, Lloh69
	.loh AdrpAdd	Lloh78, Lloh79
	.loh AdrpAdd	Lloh76, Lloh77
	.loh AdrpAdd	Lloh74, Lloh75
	.loh AdrpAdd	Lloh72, Lloh73
	.loh AdrpAdd	Lloh80, Lloh81
	.loh AdrpAdd	Lloh82, Lloh83
	.loh AdrpAdd	Lloh84, Lloh85
	.loh AdrpAdd	Lloh86, Lloh87
	.loh AdrpAdd	Lloh92, Lloh93
	.loh AdrpAdd	Lloh90, Lloh91
	.loh AdrpAdd	Lloh88, Lloh89
	.loh AdrpAdd	Lloh96, Lloh97
	.loh AdrpAdd	Lloh94, Lloh95
	.loh AdrpAdd	Lloh98, Lloh99
	.loh AdrpAdd	Lloh104, Lloh105
	.loh AdrpAdd	Lloh102, Lloh103
	.loh AdrpAdd	Lloh100, Lloh101
                                        ; -- End function
	.globl	_overlay_menu_update            ; -- Begin function overlay_menu_update
	.p2align	4
_overlay_menu_update:                   ; @overlay_menu_update
; %bb.0:
	sub	sp, sp, #176
	stp	x24, x23, [sp, #112]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	bl	_system_milliseconds
	adrp	x8, _overlay@PAGE+1
	mov	w20, w0
	ldrb	w8, [x8, _overlay@PAGEOFF+1]
	cbz	w8, LBB9_2
; %bb.1:
Lloh106:
	adrp	x8, _overlay@PAGE
Lloh107:
	add	x8, x8, _overlay@PAGEOFF
	ldrb	w9, [x8]
	strb	wzr, [x8, #1]
	cmp	w9, #0
	cset	w0, eq
	bl	_overlay_set_open
LBB9_2:
	adrp	x22, _overlay@PAGE
	ldrb	w8, [x22, _overlay@PAGEOFF]
	cbz	w8, LBB9_48
; %bb.3:
Lloh108:
	adrp	x8, _overlay@PAGE+56
Lloh109:
	add	x8, x8, _overlay@PAGEOFF+56
	mov	w0, wzr
	ldp	w9, w10, [x8]
	ldp	w11, w12, [x8, #8]
	ldr	w13, [x8, #20]
	orr	w9, w10, w9
	orr	w10, w12, w11
	orr	w21, w10, w9
	bic	w19, w21, w13
	str	w21, [x8, #20]
	bl	_tag_editor_menu_update
	bl	_tag_editor_menu_capturing
	cbz	w0, LBB9_6
; %bb.4:
	tbnz	w19, #6, LBB9_9
; %bb.5:
	mov	w0, w19
	mov	w1, w21
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #176
	b	_tag_editor_menu_capture
LBB9_6:
	bl	_overlay_editor_refresh
Lloh110:
	adrp	x23, _overlay@PAGE
Lloh111:
	add	x23, x23, _overlay@PAGEOFF
	ldrsh	x9, [x23, #2]
	add	x8, x23, x9, lsl #2
	add	x10, x23, x9, lsl #1
	ldr	w8, [x8, #4]
	ldrsh	w10, [x10, #36]
	ldrsh	w11, [x8, #4]
	cmp	w10, w11
	b.ge	LBB9_11
; %bb.7:
	ldr	w8, [x8, #8]
	ldr	w8, [x8, w10, sxtw #2]
	mov	w10, #3                         ; =0x3
	ldrh	w11, [x8]
	cmp	w11, #6
	b.ne	LBB9_12
; %bb.8:
	ldrh	w8, [x8, #52]
	cmp	w8, #2
	mov	w8, #15                         ; =0xf
	csel	w10, w8, w10, eq
	b	LBB9_12
LBB9_9:
	ldrb	w8, [x22, _overlay@PAGEOFF]
	cbz	w8, LBB9_48
; %bb.10:
	mov	w0, #1                          ; =0x1
	bl	_tag_editor_menu_update
Lloh112:
	adrp	x8, _overlay@PAGE
Lloh113:
	add	x8, x8, _overlay@PAGEOFF
	ldp	w9, w10, [x8, #56]
	ldp	w11, w12, [x8, #64]
	orr	w9, w10, w9
	strb	wzr, [x8]
	strh	wzr, [x8, #184]
	orr	w10, w11, w12
	orr	w9, w9, w10
	stp	w9, wzr, [x8, #76]
	b	LBB9_48
LBB9_11:
	mov	w10, #3                         ; =0x3
LBB9_12:
	tst	w19, #0xc
	b.eq	LBB9_14
; %bb.13:
	adrp	x8, _overlay@PAGE+220
	str	w20, [x8, _overlay@PAGEOFF+220]
LBB9_14:
	and	w8, w9, #0xffff
	adrp	x11, _overlay@PAGE+80
	tst	w10, w19
	b.eq	LBB9_16
; %bb.15:
	mov	w10, #400                       ; =0x190
	b	LBB9_18
LBB9_16:
	ldr	w12, [x11, _overlay@PAGEOFF+80]
	and	w10, w10, w21
	sub	w13, w20, w12
	cmn	w13, #1
	ccmp	w12, #0, #4, gt
	ccmp	w10, #0, #4, ne
	b.eq	LBB9_19
; %bb.17:
	orr	w19, w10, w19
	mov	w10, #90                        ; =0x5a
LBB9_18:
	add	w10, w20, w10
	str	w10, [x11, _overlay@PAGEOFF+80]
LBB9_19:
	tbz	w19, #0, LBB9_26
; %bb.20:
	lsl	w10, w9, #2
	add	x10, x23, w10, sxtw
	ldr	w10, [x10, #4]
	ldrsh	w11, [x10, #4]
	cmp	w11, #1
	b.lt	LBB9_26
; %bb.21:
Lloh114:
	adrp	x8, _overlay@PAGE+2
Lloh115:
	add	x8, x8, _overlay@PAGEOFF+2
	add	x10, x8, #34
	lsl	w9, w9, #1
	ldrsh	w12, [x10, w9, sxtw]
	add	w12, w11, w12
	sub	w12, w12, #1
	sdiv	w13, w12, w11
	msub	w11, w13, w11, w12
	strh	w11, [x10, w9, sxtw]
	ldrsh	x12, [x8]
	ldrsh	w9, [x8, #204]
	and	w8, w12, #0xffff
	cmp	w9, #1
	b.lt	LBB9_26
; %bb.22:
	adrp	x11, _overlay@PAGE+52
	ldrsh	w10, [x10, x12, lsl #1]
	ldrsh	w12, [x11, _overlay@PAGEOFF+52]
	cmp	w10, w12
	b.ge	LBB9_24
; %bb.23:
	mov	w12, w10
	strh	w10, [x11, _overlay@PAGEOFF+52]
LBB9_24:
	add	w12, w12, w9
	cmp	w12, w10
	b.gt	LBB9_26
; %bb.25:
	sub	w9, w10, w9
	add	w9, w9, #1
	strh	w9, [x11, _overlay@PAGEOFF+52]
LBB9_26:
	tbz	w19, #1, LBB9_33
; %bb.27:
	add	x9, x23, w8, sxth #2
	ldr	w9, [x9, #4]
	ldrsh	w9, [x9, #4]
	cmp	w9, #1
	b.lt	LBB9_33
; %bb.28:
Lloh116:
	adrp	x10, _overlay@PAGE+2
Lloh117:
	add	x10, x10, _overlay@PAGEOFF+2
	add	x11, x10, #34
	sxth	w8, w8
	ldrsh	w12, [x11, w8, sxtw #1]
	add	w12, w9, w12
	add	w12, w12, #1
	sdiv	w13, w12, w9
	msub	w9, w13, w9, w12
	strh	w9, [x11, w8, sxtw #1]
	ldrsh	x12, [x10]
	ldrsh	w9, [x10, #204]
	and	w8, w12, #0xffff
	cmp	w9, #1
	b.lt	LBB9_33
; %bb.29:
	adrp	x10, _overlay@PAGE+52
	ldrsh	w11, [x11, x12, lsl #1]
	ldrsh	w12, [x10, _overlay@PAGEOFF+52]
	cmp	w11, w12
	b.ge	LBB9_31
; %bb.30:
	mov	w12, w11
	strh	w11, [x10, _overlay@PAGEOFF+52]
LBB9_31:
	add	w12, w12, w9
	cmp	w12, w11
	b.gt	LBB9_33
; %bb.32:
	sub	w9, w11, w9
	add	w9, w9, #1
	strh	w9, [x10, _overlay@PAGEOFF+52]
LBB9_33:
	tbnz	w19, #4, LBB9_41
; %bb.34:
	tst	w19, #0xc
	b.eq	LBB9_43
; %bb.35:
	add	x9, x23, w8, sxth #2
	add	x8, x23, w8, sxth #1
	ldr	w9, [x9, #4]
	ldrsh	w0, [x8, #36]
	ldrsh	w8, [x9, #4]
	cmp	w0, w8
	b.ge	LBB9_49
; %bb.36:
	ldr	w8, [x9, #8]
	ldr	w9, [x8, w0, sxtw #2]
	ldrh	w8, [x9]
	cmp	w8, #6
	b.eq	LBB9_51
; %bb.37:
	cmp	w8, #1
	b.eq	LBB9_42
; %bb.38:
	tbnz	w19, #2, LBB9_50
; %bb.39:
	cmp	w8, #5
	b.eq	LBB9_42
; %bb.40:
	cmp	w8, #3
	b.eq	LBB9_42
	b	LBB9_43
LBB9_41:
	add	x8, x23, w8, sxth #1
	ldrsh	w0, [x8, #36]
LBB9_42:
	bl	_overlay_choose
LBB9_43:
	tbz	w19, #5, LBB9_45
; %bb.44:
	bl	_overlay_back
LBB9_45:
	tst	w19, #0xc0
	b.eq	LBB9_48
; %bb.46:
	ldrb	w8, [x22, _overlay@PAGEOFF]
	cbz	w8, LBB9_48
; %bb.47:
	mov	w0, #1                          ; =0x1
	bl	_tag_editor_menu_update
	ldp	w8, w9, [x23, #56]
	ldp	w10, w11, [x23, #64]
	orr	w8, w9, w8
	strb	wzr, [x23]
	strh	wzr, [x23, #184]
	orr	w9, w10, w11
	orr	w8, w8, w9
	stp	w8, wzr, [x23, #76]
LBB9_48:
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
LBB9_49:
	tbz	w19, #2, LBB9_43
LBB9_50:
	bl	_overlay_back
	b	LBB9_43
LBB9_51:
	ldrh	w8, [x9, #52]
	cmp	w8, #2
	b.ne	LBB9_54
; %bb.52:
Lloh118:
	adrp	x8, _overlay@PAGE+220
	add	x3, sp, #16
	mov	w4, #96                         ; =0x60
Lloh119:
	ldr	w8, [x8, _overlay@PAGEOFF+220]
	sub	w8, w20, w8
	cmp	w8, #1499
	mov	w8, #1                          ; =0x1
	cset	w2, gt
	tst	w19, #0x4
	cneg	w1, w8, ne
	bl	_tag_editor_menu_adjust
	ldrb	w8, [sp, #16]
	cbz	w8, LBB9_43
; %bb.53:
Lloh120:
	adrp	x20, _overlay@PAGE+84
Lloh121:
	add	x20, x20, _overlay@PAGEOFF+84
Lloh122:
	adrp	x2, l_.str.260@PAGE
Lloh123:
	add	x2, x2, l_.str.260@PAGEOFF
	add	x8, sp, #16
	mov	x0, x20
	mov	w1, #96                         ; =0x60
	str	w8, [sp]
	bl	_halo_linux_snprintf
	bl	_system_milliseconds
	add	w8, w0, #3000
	str	w8, [x20, #96]
	b	LBB9_43
LBB9_54:
	tbnz	w19, #2, LBB9_50
; %bb.55:
	cmp	w8, #1
	b.eq	LBB9_42
	b	LBB9_43
	.loh AdrpAdd	Lloh106, Lloh107
	.loh AdrpAdd	Lloh108, Lloh109
	.loh AdrpAdd	Lloh110, Lloh111
	.loh AdrpAdd	Lloh112, Lloh113
	.loh AdrpAdd	Lloh114, Lloh115
	.loh AdrpAdd	Lloh116, Lloh117
	.loh AdrpLdr	Lloh118, Lloh119
	.loh AdrpAdd	Lloh122, Lloh123
	.loh AdrpAdd	Lloh120, Lloh121
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function overlay_menu_draw
lCPI10_0:
	.byte	79                              ; 0x4f
	.byte	80                              ; 0x50
	.byte	69                              ; 0x45
	.byte	78                              ; 0x4e
	.byte	67                              ; 0x43
	.byte	69                              ; 0x45
	.byte	32                              ; 0x20
	.byte	70                              ; 0x46
	.byte	79                              ; 0x4f
	.byte	82                              ; 0x52
	.byte	32                              ; 0x20
	.byte	65                              ; 0x41
	.byte	78                              ; 0x4e
	.byte	68                              ; 0x44
	.byte	82                              ; 0x52
	.byte	79                              ; 0x4f
lCPI10_1:
	.quad	-32                             ; 0xffffffffffffffe0
	.quad	-48                             ; 0xffffffffffffffd0
lCPI10_2:
	.quad	0                               ; 0x0
	.quad	-16                             ; 0xfffffffffffffff0
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0
lCPI10_3:
	.short	2                               ; 0x2
	.short	2                               ; 0x2
	.short	65534                           ; 0xfffe
	.short	65534                           ; 0xfffe
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_overlay_menu_draw
	.p2align	4
_overlay_menu_draw:                     ; @overlay_menu_draw
; %bb.0:
	stp	d9, d8, [sp, #-112]!            ; 16-byte Folded Spill
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	sub	sp, sp, #768
	bl	_get_ui_argb_white
	adrp	x8, _overlay@PAGE
	stp	s0, s1, [x29, #-184]
	stp	s2, s3, [x29, #-176]
	ldrb	w8, [x8, _overlay@PAGEOFF]
	cbz	w8, LBB10_14
; %bb.1:
	mov	w0, #28276                      ; =0x6e74
Lloh124:
	adrp	x8, _overlay@PAGE+184
Lloh125:
	add	x8, x8, _overlay@PAGEOFF+184
Lloh126:
	adrp	x1, l_.str.1@PAGE
Lloh127:
	add	x1, x1, l_.str.1@PAGEOFF
	movk	w0, #26223, lsl #16
	strb	wzr, [x8]
	strb	wzr, [x8, #8]
	bl	_tag_loaded
	cmn	w0, #1
	b.ne	LBB10_3
; %bb.2:
	mov	w0, #1                          ; =0x1
	bl	_interface_get_tag_index
	cmn	w0, #1
	b.eq	LBB10_13
LBB10_3:
	mov	w23, w0
	mov	w0, #28276                      ; =0x6e74
	movk	w0, #26223, lsl #16
	mov	w1, w23
	bl	_tag_get
	ldrh	w8, [x0, #4]
	ldrh	w9, [x0, #6]
	ldrh	w10, [x0, #8]
	add	w8, w9, w8
	add	w8, w8, w10
	sxth	w24, w8
	cmp	w24, #1
	b.lt	LBB10_13
; %bb.4:
	mov	w0, #28276                      ; =0x6e74
Lloh128:
	adrp	x1, l_.str.2@PAGE
Lloh129:
	add	x1, x1, l_.str.2@PAGEOFF
	movk	w0, #26223, lsl #16
	bl	_tag_loaded
	cmn	w0, #1
	b.ne	LBB10_6
; %bb.5:
	mov	w0, #1                          ; =0x1
	bl	_interface_get_tag_index
	cmn	w0, #1
	b.eq	LBB10_13
LBB10_6:
	mov	w19, w0
	mov	w0, #28276                      ; =0x6e74
	movk	w0, #26223, lsl #16
	mov	w1, w19
	bl	_tag_get
	ldrh	w8, [x0, #4]
	ldrh	w9, [x0, #6]
	ldrh	w10, [x0, #8]
	add	w8, w9, w8
	add	w8, w8, w10
	sxth	w25, w8
	cmp	w25, #0
	b.le	LBB10_13
; %bb.7:
Lloh130:
	adrp	x8, _render@GOTPAGE
Lloh131:
	ldr	w8, [x8, _render@GOTPAGEOFF]
	ldrh	w9, [x8, #66]
	ldrh	w10, [x8, #62]
	ldrh	w11, [x8, #64]
	ldrh	w8, [x8, #60]
	sub	w21, w9, w10
	sub	w8, w11, w8
	sxth	w20, w8
	cmp	w20, #1
	sxth	w8, w21
	ccmp	w8, #1, #8, ge
	b.lt	LBB10_14
; %bb.8:
	and	w22, w21, #0xffff
	bl	_tag_editor_menu_capturing
	str	w24, [sp, #76]                  ; 4-byte Spill
	cbz	w0, LBB10_16
; %bb.9:
	add	x0, sp, #544
	add	x1, sp, #416
	mov	w2, #128                        ; =0x80
	bl	_tag_editor_menu_capture_text
	sub	w9, w20, w25, lsl #1
	sub	w8, w20, #10
	sub	w9, w9, #31
	add	x0, sp, #152
	mov	w1, #-1610612736                ; =0xa0000000
	strh	wzr, [sp, #154]
	strh	w21, [sp, #158]
	strh	w8, [sp, #156]
	strh	w9, [sp, #152]
	bl	_draw_quad
	ldrh	w8, [sp, #152]
	mov	w9, #10                         ; =0xa
	sub	w10, w21, #10
	sub	x4, x29, #184
	mov	w0, w19
	mov	w1, #-1                         ; =0xffffffff
	sturh	w9, [x29, #-190]
	mov	w2, wzr
	add	w8, w8, #7
	mov	w3, wzr
	add	w9, w8, w25
	sturh	w10, [x29, #-186]
	sturh	w8, [x29, #-192]
	sturh	w9, [x29, #-188]
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #192
	sub	x1, x29, #192
	add	x4, sp, #544
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_string
	ldrb	w12, [sp, #416]
	cbz	w12, LBB10_24
; %bb.10:
	add	x9, sp, #416
	mov	w8, wzr
	add	w9, w9, #1
	add	x11, sp, #160
	.p2align	4, , 8
LBB10_11:                               ; =>This Inner Loop Header: Depth=1
	and	w12, w12, #0xff
	add	w13, w11, w8, lsl #1
	add	w10, w8, #1
	cmp	w8, #125
	strh	w12, [x13]
	b.hi	LBB10_25
; %bb.12:                               ;   in Loop: Header=BB10_11 Depth=1
	add	w8, w9, w8
	ldrb	w12, [x8]
	mov	w8, w10
	cbnz	w12, LBB10_11
	b	LBB10_25
LBB10_13:
	adrp	x8, _overlay@PAGE+185
	ldrb	w9, [x8, _overlay@PAGEOFF+185]
	cbz	w9, LBB10_15
LBB10_14:
	add	sp, sp, #768
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #112              ; 16-byte Folded Reload
	ret
LBB10_15:
	mov	w9, #1                          ; =0x1
Lloh132:
	adrp	x1, l_.str.3@PAGE
Lloh133:
	add	x1, x1, l_.str.3@PAGEOFF
	mov	w0, #2                          ; =0x2
	strb	w9, [x8, _overlay@PAGEOFF+185]
	add	sp, sp, #768
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #112              ; 16-byte Folded Reload
	b	_error
LBB10_16:
	str	w25, [sp, #24]                  ; 4-byte Spill
	str	w19, [sp, #12]                  ; 4-byte Spill
	bl	_overlay_editor_refresh
Lloh134:
	adrp	x25, _overlay@PAGE
Lloh135:
	add	x25, x25, _overlay@PAGEOFF
	lsl	w9, w22, #5
	mov	w10, #23593                     ; =0x5c29
	sub	w9, w9, w22, lsl #1
	movk	w10, #655, lsl #16
	ldrsh	x8, [x25, #2]
	add	x0, sp, #416
	umull	x9, w9, w10
	mov	w1, #1711276032                 ; =0x66000000
	str	wzr, [sp, #416]
	strh	w20, [sp, #420]
	add	x8, x25, x8, lsl #2
	ldr	w27, [x8, #4]
	lsr	x8, x9, #32
	strh	w8, [sp, #422]
	bl	_draw_quad
	ldrh	w8, [sp, #422]
Lloh136:
	adrp	x10, lCPI10_0@PAGE
	mov	w9, #10                         ; =0xa
	add	w11, w24, #10
	movk	w9, #10, lsl #16
	mov	w12, #17481                     ; =0x4449
Lloh137:
	ldr	q0, [x10, lCPI10_0@PAGEOFF]
Lloh138:
	adrp	x4, _overlay_menu_draw.blue@PAGE
Lloh139:
	add	x4, x4, _overlay_menu_draw.blue@PAGEOFF
	sub	w8, w8, #10
	mov	w0, w23
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	stur	w9, [x29, #-192]
	sturh	w11, [x29, #-188]
	strh	w12, [sp, #176]
	sturh	w8, [x29, #-186]
	str	q0, [sp, #160]
	strb	wzr, [sp, #178]
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #192
	sub	x1, x29, #192
	add	x4, sp, #160
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_string
	ldrsh	w8, [x25, #2]
	add	w28, w24, #17
	add	w19, w24, #17
	strh	w28, [x25, #190]
	cmp	w8, #1
	strh	w28, [x25, #188]
	b.lt	LBB10_40
; %bb.17:
	ldr	w10, [x27]
	add	x9, sp, #160
	mov	w26, w9
	add	x9, sp, #160
	mov	w8, wzr
	add	w11, w9, #2
	add	w10, w10, #2
LBB10_18:                               ; =>This Inner Loop Header: Depth=1
	add	w12, w10, w8
	sub	w13, w12, #2
	ldrb	w13, [x13]
	cbz	w13, LBB10_39
; %bb.19:                               ;   in Loop: Header=BB10_18 Depth=1
	sub	w14, w13, #97
	sub	w15, w13, #32
	cmp	w14, #26
	add	w14, w9, w8
	csel	w13, w15, w13, lo
	sub	w12, w12, #1
	strb	w13, [x14]
	ldrb	w13, [x12]
	cbz	w13, LBB10_35
; %bb.20:                               ;   in Loop: Header=BB10_18 Depth=1
	sub	w12, w13, #97
	sub	w14, w13, #32
	cmp	w12, #26
	add	w12, w11, w8
	csel	w14, w14, w13, lo
	sub	w15, w12, #1
	add	w13, w10, w8
	strb	w14, [x15]
	ldrb	w14, [x13]
	cbz	w14, LBB10_36
; %bb.21:                               ;   in Loop: Header=BB10_18 Depth=1
	sub	w15, w14, #97
	sub	w16, w14, #32
	cmp	w15, #26
	add	w13, w13, #1
	csel	w14, w16, w14, lo
	strb	w14, [x12]
	ldrb	w13, [x13]
	cbz	w13, LBB10_37
; %bb.22:                               ;   in Loop: Header=BB10_18 Depth=1
	sub	w12, w13, #97
	sub	w14, w13, #32
	cmp	w12, #26
	add	w12, w11, w8
	csel	w13, w14, w13, lo
	add	w14, w12, #1
	add	w15, w10, w8
	add	w15, w15, #2
	strb	w13, [x14]
	ldrb	w13, [x15]
	cbz	w13, LBB10_38
; %bb.23:                               ;   in Loop: Header=BB10_18 Depth=1
	sub	w14, w13, #97
	sub	w15, w13, #32
	cmp	w14, #26
	add	w12, w12, #2
	csel	w13, w15, w13, lo
	add	w8, w8, #5
	cmp	w8, #95
	strb	w13, [x12]
	b.ne	LBB10_18
	b	LBB10_39
LBB10_24:
	mov	w10, wzr
LBB10_25:
	ldurh	w8, [x29, #-188]
	add	x9, sp, #160
Lloh140:
	adrp	x4, _overlay_menu_draw.blue@PAGE
Lloh141:
	add	x4, x4, _overlay_menu_draw.blue@PAGEOFF
	mov	w0, w19
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	add	w8, w8, #7
	strh	wzr, [x9, w10, sxtw #1]
	add	w11, w8, w25
	sturh	w8, [x29, #-192]
	sturh	w11, [x29, #-188]
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #192
	add	x4, sp, #160
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	mov	w5, wzr
	bl	_draw_string_and_hack_in_icons
	bl	_tag_editor_menu_typing
	cbz	w0, LBB10_14
; %bb.26:
	bl	_halo_keyboard_typed_last
	cbnz	w0, LBB10_14
; %bb.27:
	bl	_halo_system_keyboard
	cbnz	w0, LBB10_14
; %bb.28:
	ldrh	w19, [sp, #152]
	bl	_get_ui_argb_white
	lsl	w8, w22, #6
	mov	w9, #35128                      ; =0x8938
	sub	w8, w8, w22, lsl #3
	movk	w9, #65, lsl #16
	stp	s0, s1, [x29, #-120]
	umull	x8, w8, w9
	mov	w9, #21846                      ; =0x5556
	stp	s2, s3, [x29, #-112]
	lsr	x22, x8, #32
	ubfiz	w8, w22, #1, #15
	mul	w8, w8, w9
	add	w9, w24, #8
	lsr	w8, w8, #16
	cmp	w8, w9
	csel	w24, w8, w9, hi
	and	w8, w21, #0xffff
	cmp	w8, #161
	b.lo	LBB10_14
; %bb.29:
	sub	w9, w19, #10
	add	w8, w24, w24, lsl #2
	sub	w8, w9, w8
	tbnz	w8, #15, LBB10_14
; %bb.30:
	sub	w9, w19, #10
	str	w23, [sp, #28]                  ; 4-byte Spill
	sub	x0, x29, #128
	mov	w1, #-1610612736                ; =0xa0000000
	str	w9, [sp, #80]                   ; 4-byte Spill
	add	w9, w22, w22, lsl #2
	lsl	w9, w9, #1
	sub	w10, w21, w9
	and	w11, w10, #0x8000
	sxth	w21, w8
	add	w8, w10, w11, lsr #15
	sub	w10, w21, #4
	sbfx	w23, w8, #1, #15
	add	w9, w23, w9
	sub	w8, w23, #4
	sturh	w10, [x29, #-128]
	sub	w10, w19, #6
	str	w9, [sp, #68]                   ; 4-byte Spill
	add	w9, w9, #4
	sturh	w8, [x29, #-126]
	sturh	w10, [x29, #-124]
	sturh	w9, [x29, #-122]
	bl	_draw_quad
	add	w8, w23, #2
	ldr	w28, [sp, #28]                  ; 4-byte Reload
	ldr	w26, [sp, #76]                  ; 4-byte Reload
	str	wzr, [sp, #144]                 ; 4-byte Spill
	stp	w8, w24, [sp, #132]             ; 8-byte Folded Spill
	sub	w8, w23, #2
	str	w23, [sp, #48]                  ; 4-byte Spill
	str	w21, [sp, #72]                  ; 4-byte Spill
	str	w8, [sp, #120]                  ; 4-byte Spill
	add	w8, w21, #2
	str	w8, [sp, #112]                  ; 4-byte Spill
	sub	w8, w21, #2
	str	w8, [sp, #104]                  ; 4-byte Spill
LBB10_31:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_32 Depth 2
	ldr	w8, [sp, #144]                  ; 4-byte Reload
	mov	w19, wzr
	ldr	w9, [sp, #112]                  ; 4-byte Reload
	ldr	w23, [sp, #132]                 ; 4-byte Reload
	ldr	w20, [sp, #120]                 ; 4-byte Reload
	add	w10, w8, #1
	cmp	w8, #4
	madd	w25, w8, w24, w9
	ldr	w8, [sp, #104]                  ; 4-byte Reload
	str	w10, [sp, #140]                 ; 4-byte Spill
	madd	w27, w10, w24, w8
	mov	w8, #1                          ; =0x1
	cinc	w24, w8, eq
	.p2align	4, , 8
LBB10_32:                               ;   Parent Loop BB10_31 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w0, [sp, #144]                  ; 4-byte Reload
	sxth	w21, w19
	sub	x2, x29, #144
	sub	x4, x29, #145
	sub	x5, x29, #146
	mov	w1, w21
	mov	w3, #16                         ; =0x10
	bl	_tag_editor_menu_keyboard_key
	ldurb	w9, [x29, #-146]
	madd	w8, w19, w22, w23
	ldurb	w10, [x29, #-145]
	add	w19, w24, w21
	mov	w13, #9272                      ; =0x2438
	mov	w12, #20608                     ; =0x5080
	mov	w14, #38655                     ; =0x96ff
	movk	w13, #49168, lsl #16
	movk	w12, #57376, lsl #16
	cmp	w9, #0
	movk	w14, #61480, lsl #16
	madd	w11, w19, w22, w20
	sturh	w8, [x29, #-158]
	csel	w8, w13, w12, eq
	cmp	w10, #0
	sub	x0, x29, #160
	csel	w1, w8, w14, eq
	sturh	w25, [x29, #-160]
	sturh	w11, [x29, #-154]
	sturh	w27, [x29, #-156]
	bl	_draw_quad
	ldur	x8, [x29, #-160]
	sub	x4, x29, #120
	mov	w0, w28
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, #2                          ; =0x2
	mov	w3, wzr
	add	w9, w26, w8, sxth
	sbfx	x10, x8, #32, #16
	sub	w9, w10, w9
	stur	x8, [x29, #-168]
	add	w9, w9, w9, lsr #31
	add	w9, w8, w9, asr #1
	add	w10, w9, w26
	sturh	w9, [x29, #-168]
	sturh	w10, [x29, #-164]
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #168
	sub	x1, x29, #168
	sub	x4, x29, #144
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_string
	cmp	w19, #10
	b.lt	LBB10_32
; %bb.33:                               ;   in Loop: Header=BB10_31 Depth=1
	ldp	w24, w8, [sp, #136]             ; 8-byte Folded Reload
	cmp	w8, #5
	str	w8, [sp, #144]                  ; 4-byte Spill
	b.ne	LBB10_31
; %bb.34:
	ldr	w9, [sp, #72]                   ; 4-byte Reload
Lloh142:
	adrp	x8, _overlay@PAGE+192
Lloh143:
	add	x8, x8, _overlay@PAGEOFF+192
	ldr	w10, [sp, #80]                  ; 4-byte Reload
	strh	w9, [x8, #2]
	ldr	w9, [sp, #48]                   ; 4-byte Reload
	strh	w10, [x8, #6]
	ldr	w10, [sp, #68]                  ; 4-byte Reload
	strh	w9, [x8, #4]
	mov	w9, #1                          ; =0x1
	strh	w10, [x8, #8]
	strb	w9, [x8]
	b	LBB10_14
LBB10_35:
	add	w8, w8, #1
	b	LBB10_39
LBB10_36:
	add	w8, w8, #2
	b	LBB10_39
LBB10_37:
	add	w8, w8, #3
	b	LBB10_39
LBB10_38:
	add	w8, w8, #4
LBB10_39:
	add	x9, sp, #160
	and	w11, w24, #0xfffe
	mov	w1, #38655                      ; =0x96ff
	mov	w10, #18                        ; =0x12
	add	w21, w28, w11, lsr #1
	mov	w19, #13                        ; =0xd
	mov	w12, #14                        ; =0xe
	strb	wzr, [x9, w8, sxtw]
	sub	w8, w21, #4
	add	w9, w21, #4
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	sturh	w10, [x29, #-190]
	strh	w19, [sp, #546]
	strh	w12, [sp, #550]
	strh	w8, [sp, #544]
	strh	w9, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	mov	w22, #12                        ; =0xc
	sub	w8, w21, #3
	add	w9, w21, #3
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w19, [sp, #550]
	strh	w22, [sp, #546]
	strh	w8, [sp, #544]
	strh	w9, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	mov	w19, #11                        ; =0xb
	sub	w8, w21, #2
	add	w9, w21, #2
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w22, [sp, #550]
	strh	w19, [sp, #546]
	strh	w8, [sp, #544]
	strh	w9, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	mov	w22, #10                        ; =0xa
	sub	w8, w21, #1
	add	w9, w21, #1
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w19, [sp, #550]
	strh	w22, [sp, #546]
	strh	w8, [sp, #544]
	strh	w9, [sp, #548]
	bl	_draw_quad
	add	w19, w28, w24
	sub	x4, x29, #184
	mov	w0, w23
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	sturh	w28, [x29, #-192]
	sturh	w19, [x29, #-188]
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #192
	sub	x1, x29, #192
	mov	x2, xzr
	mov	w3, wzr
	mov	x4, x26
	bl	_rasterizer_draw_string
	add	w19, w19, #7
	adrp	x8, _overlay@PAGE+190
	sturh	w22, [x29, #-190]
	strh	w19, [x8, _overlay@PAGEOFF+190]
LBB10_40:
	ldrh	w8, [sp, #422]
	mov	w1, #38655                      ; =0x96ff
	mov	w9, #10                         ; =0xa
	add	w10, w19, #1
	add	x0, sp, #160
	movk	w1, #49192, lsl #16
	strh	w19, [sp, #160]
	sub	w8, w8, #10
	strh	w9, [sp, #162]
	strh	w10, [sp, #164]
	strh	w8, [sp, #166]
	bl	_draw_quad
	ldr	w8, [sp, #24]                   ; 4-byte Reload
	sub	w9, w20, #10
	add	w26, w19, #7
Lloh144:
	adrp	x10, _overlay@PAGE+52
Lloh145:
	add	x10, x10, _overlay@PAGEOFF+52
	str	w9, [sp, #8]                    ; 4-byte Spill
	sub	w8, w8, w8, lsl #2
	add	w8, w8, w9, sxth
	sxth	w9, w28
	sub	w8, w8, w26, sxth
	strh	w26, [x10, #150]
	sub	w8, w8, #21
	strh	w28, [x10, #152]
	sdiv	w8, w8, w9
	ldrsh	w9, [x10]
	cmp	w8, #1
	csinc	w8, w8, wzr, gt
	strh	w8, [x10, #154]
	tbnz	w9, #31, LBB10_42
; %bb.41:
	ldrsh	w10, [x27, #4]
	sub	w10, w10, w8, sxth
	bic	w10, w10, w10, asr #31
	cmp	w10, w9
	csel	w13, w10, w9, lo
	b	LBB10_43
LBB10_42:
	mov	w13, wzr
LBB10_43:
	sxth	w9, w8
	cmp	w9, #1
	strh	w13, [x25, #52]
	b.lt	LBB10_49
; %bb.44:
	ldrsh	x9, [x25, #2]
	add	x9, x25, x9, lsl #1
	ldrsh	w10, [x9, #36]
	adrp	x9, _overlay@PAGE+52
	cmp	w10, w13, sxth
	b.ge	LBB10_46
; %bb.45:
	mov	w11, w10
	mov	w13, w10
	strh	w10, [x9, _overlay@PAGEOFF+52]
	b	LBB10_47
LBB10_46:
	and	w11, w13, #0xffff
LBB10_47:
	and	w12, w8, #0x7fff
	add	w11, w12, w11
	cmp	w11, w10
	b.gt	LBB10_49
; %bb.48:
	sub	w8, w10, w8
	add	w13, w8, #1
	strh	w13, [x9, _overlay@PAGEOFF+52]
LBB10_49:
	ldrsh	w8, [x27, #4]
	cmp	w8, w13, sxth
	b.le	LBB10_166
; %bb.50:
	add	x8, sp, #160
Lloh146:
	adrp	x9, lCPI10_1@PAGE
	mov	w8, w8
	add	x10, sp, #160
	add	w21, w10, #9
Lloh147:
	adrp	x10, lCPI10_3@PAGE
Lloh148:
	ldr	q0, [x9, lCPI10_1@PAGEOFF]
	add	x11, sp, #544
	str	x8, [sp, #120]                  ; 8-byte Spill
Lloh149:
	adrp	x8, lCPI10_2@PAGE
Lloh150:
	ldr	d8, [x10, lCPI10_3@PAGEOFF]
	add	w11, w11, #9
	str	x21, [sp, #112]                 ; 8-byte Spill
	str	q0, [sp, #48]                   ; 16-byte Spill
Lloh151:
	ldr	q0, [x8, lCPI10_2@PAGEOFF]
	str	x11, [sp, #104]                 ; 8-byte Spill
	str	w23, [sp, #28]                  ; 4-byte Spill
	str	x27, [sp, #16]                  ; 8-byte Spill
	str	q0, [sp, #32]                   ; 16-byte Spill
	b	LBB10_54
LBB10_51:                               ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #1
LBB10_52:                               ;   in Loop: Header=BB10_54 Depth=1
	ldr	w9, [sp, #140]                  ; 4-byte Reload
	sub	x10, x29, #184
	sub	x1, x29, #144
	mov	w0, w23
	strb	wzr, [x20, w8, sxtw]
	cmp	w9, w19, uxth
Lloh152:
	adrp	x9, _overlay_menu_draw.blue@PAGE
Lloh153:
	add	x9, x9, _overlay_menu_draw.blue@PAGEOFF
	csel	x2, x10, x9, eq
LBB10_53:                               ;   in Loop: Header=BB10_54 Depth=1
	ldr	x3, [sp, #120]                  ; 8-byte Reload
	ldr	w4, [sp, #132]                  ; 4-byte Reload
	bl	_overlay_label
	adrp	x8, _overlay@PAGE+204
	add	w9, w19, #1
	sxth	w13, w9
	ldrh	w28, [x8, _overlay@PAGEOFF+204]
	ldrsh	w8, [x27, #4]
	add	w26, w28, w26
	cmp	w13, w8
	b.ge	LBB10_165
LBB10_54:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_86 Depth 2
                                        ;     Child Loop BB10_108 Depth 2
Lloh154:
	adrp	x8, _overlay@PAGE+52
Lloh155:
	add	x8, x8, _overlay@PAGEOFF+52
	ldrsh	w9, [x8]
	ldrsh	w8, [x8, #154]
	add	w10, w8, w9
	sxth	w8, w13
	cmp	w10, w8
	b.le	LBB10_164
; %bb.55:                               ;   in Loop: Header=BB10_54 Depth=1
	ldrsh	x9, [x25, #2]
	ldr	w10, [x27, #8]
	ldrh	w22, [sp, #422]
	add	x9, x25, x9, lsl #1
	ldr	w8, [x10, w8, sxtw #2]
	and	w10, w13, #0xffff
	sturh	w26, [x29, #-120]
	ldrh	w11, [x9, #36]
	add	w9, w26, w28
	sub	w19, w9, #3
	mov	w9, #5                          ; =0x5
	str	x8, [sp, #144]                  ; 8-byte Spill
	sub	w8, w22, #5
	cmp	w10, w11
	sturh	w9, [x29, #-118]
	cset	w9, eq
	stp	w13, w11, [sp, #136]            ; 8-byte Folded Spill
	sturh	w8, [x29, #-114]
	sturh	w19, [x29, #-116]
	str	w9, [sp, #132]                  ; 4-byte Spill
	b.ne	LBB10_57
; %bb.56:                               ;   in Loop: Header=BB10_54 Depth=1
	ldur	d0, [x29, #-120]
	mov	w2, #39423                      ; =0x99ff
	sub	x0, x29, #120
	mov	w1, #8                          ; =0x8
	movk	w2, #65314, lsl #16
	str	q0, [sp, #80]                   ; 16-byte Spill
	bl	_overlay_rounded
	ldr	q0, [sp, #80]                   ; 16-byte Reload
	mov	w2, #8772                       ; =0x2244
	ldp	q2, q1, [sp, #32]               ; 32-byte Folded Reload
	add	x0, sp, #544
	mov	w1, #6                          ; =0x6
	movk	w2, #65280, lsl #16
	dup	v0.2d, v0.d[0]
	ushl	v1.2d, v0.2d, v1.2d
	ushl	v0.2d, v0.2d, v2.2d
	uzp1	v0.4s, v0.4s, v1.4s
	xtn	v0.4h, v0.4s
	add	v0.4h, v0.4h, v8.4h
	str	d0, [sp, #544]
	b	LBB10_58
LBB10_57:                               ;   in Loop: Header=BB10_54 Depth=1
	mov	w2, #4386                       ; =0x1122
	sub	x0, x29, #120
	mov	w1, #8                          ; =0x8
	movk	w2, #39168, lsl #16
LBB10_58:                               ;   in Loop: Header=BB10_54 Depth=1
	bl	_overlay_rounded
	sub	w9, w22, #10
	add	w10, w26, #7
	ldr	x12, [sp, #144]                 ; 8-byte Reload
	mov	w8, wzr
	mov	x28, xzr
	sturh	w9, [x29, #-138]
	add	w9, w10, w24
	sturh	w10, [x29, #-144]
	mov	w10, #10                        ; =0xa
	sturh	w9, [x29, #-140]
	sturh	w10, [x29, #-142]
	sxth	w10, w19
	ldrh	w9, [x12]
	add	w10, w10, w26, sxth
	add	w10, w10, w10, lsr #31
	asr	w20, w10, #1
	cmp	w9, #2
	b.le	LBB10_63
; %bb.59:                               ;   in Loop: Header=BB10_54 Depth=1
	cmp	w9, #6
	b.eq	LBB10_66
; %bb.60:                               ;   in Loop: Header=BB10_54 Depth=1
	cmp	w9, #5
	b.eq	LBB10_62
; %bb.61:                               ;   in Loop: Header=BB10_54 Depth=1
	cmp	w9, #3
	b.ne	LBB10_69
LBB10_62:                               ;   in Loop: Header=BB10_54 Depth=1
	mov	w1, #38655                      ; =0x96ff
	sub	w8, w22, #16
	sub	w19, w22, #15
	sub	w9, w20, #4
	add	w10, w20, #4
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w8, [sp, #546]
	strh	w19, [sp, #550]
	strh	w9, [sp, #544]
	strh	w10, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	sub	w21, w22, #14
	sub	w8, w20, #3
	add	w9, w20, #3
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w19, [sp, #546]
	strh	w21, [sp, #550]
	strh	w8, [sp, #544]
	strh	w9, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	sub	w19, w22, #13
	sub	w8, w20, #2
	strh	w21, [sp, #546]
	ldr	x21, [sp, #112]                 ; 8-byte Reload
	add	w9, w20, #2
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w19, [sp, #550]
	strh	w8, [sp, #544]
	strh	w9, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	sub	w8, w22, #12
	sub	w9, w20, #1
	add	w10, w20, #1
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w19, [sp, #546]
	strh	w8, [sp, #550]
	strh	w9, [sp, #544]
	strh	w10, [sp, #548]
	bl	_draw_quad
	ldurh	w8, [x29, #-138]
	mov	x28, xzr
	ldr	x12, [sp, #144]                 ; 8-byte Reload
	sub	w9, w8, #12
	mov	w8, wzr
	sturh	w9, [x29, #-138]
	b	LBB10_69
LBB10_63:                               ;   in Loop: Header=BB10_54 Depth=1
	cmp	w9, #1
	b.eq	LBB10_71
; %bb.64:                               ;   in Loop: Header=BB10_54 Depth=1
	cmp	w9, #2
	b.ne	LBB10_69
; %bb.65:                               ;   in Loop: Header=BB10_54 Depth=1
	ldr	x0, [sp, #144]                  ; 8-byte Reload
	bl	_overlay_entry_on
	ldr	x12, [sp, #144]                 ; 8-byte Reload
	cmp	w0, #0
Lloh156:
	adrp	x9, l_.str.5@PAGE
Lloh157:
	add	x9, x9, l_.str.5@PAGEOFF
	mov	w8, wzr
	csel	x28, xzr, x9, eq
	b	LBB10_69
LBB10_66:                               ;   in Loop: Header=BB10_54 Depth=1
	ldrh	w8, [x12, #52]
	cmp	w8, #1
	b.ne	LBB10_68
; %bb.67:                               ;   in Loop: Header=BB10_54 Depth=1
	mov	w1, #38655                      ; =0x96ff
	sub	w8, w22, #16
	sub	w19, w22, #15
	sub	w9, w20, #4
	add	w10, w20, #4
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w8, [sp, #546]
	strh	w19, [sp, #550]
	strh	w9, [sp, #544]
	strh	w10, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	sub	w21, w22, #14
	sub	w8, w20, #3
	add	w9, w20, #3
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w19, [sp, #546]
	strh	w21, [sp, #550]
	strh	w8, [sp, #544]
	strh	w9, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	sub	w19, w22, #13
	sub	w8, w20, #2
	strh	w21, [sp, #546]
	ldr	x21, [sp, #112]                 ; 8-byte Reload
	add	w9, w20, #2
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w19, [sp, #550]
	strh	w8, [sp, #544]
	strh	w9, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	sub	w8, w22, #12
	sub	w9, w20, #1
	add	w10, w20, #1
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w19, [sp, #546]
	strh	w8, [sp, #550]
	strh	w9, [sp, #544]
	strh	w10, [sp, #548]
	bl	_draw_quad
	ldr	x12, [sp, #144]                 ; 8-byte Reload
	ldurh	w8, [x29, #-138]
	sub	w9, w8, #12
	ldrh	w8, [x12, #52]
	sturh	w9, [x29, #-138]
LBB10_68:                               ;   in Loop: Header=BB10_54 Depth=1
	ldr	w28, [x12, #56]
	cmp	w8, #2
	cset	w8, eq
LBB10_69:                               ;   in Loop: Header=BB10_54 Depth=1
	cmp	w28, #0
	cset	w13, ne
	cbnz	w28, LBB10_72
; %bb.70:                               ;   in Loop: Header=BB10_54 Depth=1
	cbz	w8, LBB10_77
	b	LBB10_72
LBB10_71:                               ;   in Loop: Header=BB10_54 Depth=1
	ldr	x0, [sp, #144]                  ; 8-byte Reload
	bl	_overlay_entry_on
	ldr	x12, [sp, #144]                 ; 8-byte Reload
	cmp	w0, #0
Lloh158:
	adrp	x8, l_.str.5@PAGE
Lloh159:
	add	x8, x8, l_.str.5@PAGEOFF
Lloh160:
	adrp	x9, l_.str.6@PAGE
Lloh161:
	add	x9, x9, l_.str.6@PAGEOFF
	mov	w13, #1                         ; =0x1
	csel	x28, x9, x8, eq
	mov	w8, #1                          ; =0x1
LBB10_72:                               ;   in Loop: Header=BB10_54 Depth=1
	ldur	x9, [x29, #-144]
	mov	w11, #-88                       ; =0xffffffa8
	stur	x9, [x29, #-128]
	ldrh	w10, [x12]
	cmp	w10, #6
	mov	w10, #-64                       ; =0xffffffc0
	csel	w10, w11, w10, eq
	add	x21, x10, x9, lsr #48
	sturh	w21, [x29, #-126]
	cbz	w8, LBB10_74
; %bb.73:                               ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w21, #4
	mov	w1, #38655                      ; =0x96ff
	str	w26, [sp, #80]                  ; 4-byte Spill
	add	w26, w21, #3
	sub	w25, w20, #4
	add	w9, w20, #4
	strh	w8, [sp, #550]
	add	w8, w20, #4
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w26, [sp, #546]
	strh	w25, [sp, #544]
	strh	w9, [sp, #548]
	stp	w8, w13, [sp, #68]              ; 8-byte Folded Spill
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	add	w24, w21, #2
	sub	w23, w20, #3
	strh	w26, [sp, #550]
	add	w26, w20, #3
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w24, [sp, #546]
	strh	w23, [sp, #544]
	strh	w26, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	add	w27, w21, #1
	sub	w22, w20, #2
	strh	w24, [sp, #550]
	add	w24, w20, #2
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w27, [sp, #546]
	strh	w22, [sp, #544]
	strh	w24, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	sub	w19, w20, #1
	add	w20, w20, #1
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w21, [sp, #546]
	strh	w27, [sp, #550]
	strh	w19, [sp, #544]
	strh	w20, [sp, #548]
	bl	_draw_quad
	ldurh	w21, [x29, #-122]
	mov	w1, #38655                      ; =0x96ff
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w25, [sp, #544]
	sub	w8, w21, #4
	sub	w27, w21, #3
	strh	w8, [sp, #546]
	ldr	w8, [sp, #68]                   ; 4-byte Reload
	strh	w27, [sp, #550]
	strh	w8, [sp, #548]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	sub	w25, w21, #2
	strh	w27, [sp, #546]
	add	x0, sp, #544
	ldr	x27, [sp, #16]                  ; 8-byte Reload
	movk	w1, #65320, lsl #16
	strh	w26, [sp, #548]
	ldr	w26, [sp, #80]                  ; 4-byte Reload
	strh	w23, [sp, #544]
	strh	w25, [sp, #550]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	sub	w23, w21, #1
	strh	w24, [sp, #548]
	add	x0, sp, #544
	ldr	w24, [sp, #76]                  ; 4-byte Reload
	movk	w1, #65320, lsl #16
	strh	w25, [sp, #546]
Lloh162:
	adrp	x25, _overlay@PAGE
Lloh163:
	add	x25, x25, _overlay@PAGEOFF
	strh	w22, [sp, #544]
	strh	w23, [sp, #550]
	bl	_draw_quad
	mov	w1, #38655                      ; =0x96ff
	strh	w23, [sp, #546]
	ldr	w23, [sp, #28]                  ; 4-byte Reload
	add	x0, sp, #544
	movk	w1, #65320, lsl #16
	strh	w21, [sp, #550]
	strh	w19, [sp, #544]
	strh	w20, [sp, #548]
	bl	_draw_quad
	ldr	w13, [sp, #72]                  ; 4-byte Reload
	ldr	x12, [sp, #144]                 ; 8-byte Reload
LBB10_74:                               ;   in Loop: Header=BB10_54 Depth=1
	cbz	w13, LBB10_76
; %bb.75:                               ;   in Loop: Header=BB10_54 Depth=1
	sub	x4, x29, #184
	mov	w0, w23
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, #2                          ; =0x2
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #128
	sub	x1, x29, #128
	mov	x2, xzr
	mov	w3, wzr
	mov	x4, x28
	bl	_rasterizer_draw_string
	ldr	x12, [sp, #144]                 ; 8-byte Reload
LBB10_76:                               ;   in Loop: Header=BB10_54 Depth=1
	ldurh	w8, [x29, #-126]
	ldr	x21, [sp, #112]                 ; 8-byte Reload
	sub	w8, w8, #4
	sturh	w8, [x29, #-138]
LBB10_77:                               ;   in Loop: Header=BB10_54 Depth=1
	ldp	w19, w8, [sp, #136]             ; 8-byte Folded Reload
	cmp	w8, w19, uxth
	b.ne	LBB10_81
; %bb.78:                               ;   in Loop: Header=BB10_54 Depth=1
Lloh164:
	adrp	x8, _overlay@PAGE+208
Lloh165:
	add	x8, x8, _overlay@PAGEOFF+208
	ldrh	w8, [x8, #4]
	cmp	w8, w19, uxth
	b.ne	LBB10_80
; %bb.79:                               ;   in Loop: Header=BB10_54 Depth=1
Lloh166:
	adrp	x8, _overlay@PAGE+208
Lloh167:
	add	x8, x8, _overlay@PAGEOFF+208
Lloh168:
	ldr	w8, [x8]
	cmp	w8, w27
	b.eq	LBB10_81
LBB10_80:                               ;   in Loop: Header=BB10_54 Depth=1
Lloh169:
	adrp	x20, _overlay@PAGE+208
Lloh170:
	add	x20, x20, _overlay@PAGEOFF+208
	strh	w19, [x20, #4]
	str	w27, [x20]
	bl	_system_milliseconds
	ldr	x12, [sp, #144]                 ; 8-byte Reload
	str	w0, [x20, #8]
LBB10_81:                               ;   in Loop: Header=BB10_54 Depth=1
	ldrh	w8, [x12]
	add	x20, sp, #160
	ldr	x22, [sp, #104]                 ; 8-byte Reload
	cmp	w8, #4
	b.ne	LBB10_85
; %bb.82:                               ;   in Loop: Header=BB10_54 Depth=1
	ldr	w8, [x12, #4]
	cbz	w8, LBB10_106
; %bb.83:                               ;   in Loop: Header=BB10_54 Depth=1
	ldrb	w9, [x8]
	cbz	w9, LBB10_106
; %bb.84:                               ;   in Loop: Header=BB10_54 Depth=1
	add	x0, sp, #544
	mov	w1, #96                         ; =0x60
Lloh171:
	adrp	x2, l_.str.7@PAGE
Lloh172:
	add	x2, x2, l_.str.7@PAGEOFF
	str	w8, [sp]
	b	LBB10_107
LBB10_85:                               ;   in Loop: Header=BB10_54 Depth=1
	ldr	w9, [x12, #4]
	mov	w8, wzr
	add	w9, w9, #9
LBB10_86:                               ;   Parent Loop BB10_54 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w9, w8
	sub	w10, w10, #9
	ldrb	w10, [x10]
	cbz	w10, LBB10_52
; %bb.87:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w20, w8
	csel	w10, w12, w10, lo
	add	w12, w9, w8
	sub	w12, w12, #8
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_51
; %bb.88:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #8
	add	w12, w9, w8
	sub	w12, w12, #7
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_129
; %bb.89:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #7
	add	w12, w9, w8
	sub	w12, w12, #6
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_131
; %bb.90:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #6
	add	w12, w9, w8
	sub	w12, w12, #5
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_133
; %bb.91:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #5
	add	w12, w9, w8
	sub	w12, w12, #4
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_135
; %bb.92:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #4
	add	w12, w9, w8
	sub	w12, w12, #3
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_137
; %bb.93:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #3
	add	w12, w9, w8
	sub	w12, w12, #2
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_139
; %bb.94:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #2
	add	w12, w9, w8
	sub	w12, w12, #1
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_141
; %bb.95:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #1
	add	w12, w9, w8
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_143
; %bb.96:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w12, w9, w8
	add	w12, w12, #1
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_145
; %bb.97:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #1
	add	w12, w9, w8
	add	w12, w12, #2
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_147
; %bb.98:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #2
	add	w12, w9, w8
	add	w12, w12, #3
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_149
; %bb.99:                               ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #3
	add	w12, w9, w8
	add	w12, w12, #4
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_151
; %bb.100:                              ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #4
	add	w12, w9, w8
	add	w12, w12, #5
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_153
; %bb.101:                              ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #5
	add	w12, w9, w8
	add	w12, w12, #6
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_155
; %bb.102:                              ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #6
	add	w12, w9, w8
	add	w12, w12, #7
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_157
; %bb.103:                              ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #7
	add	w12, w9, w8
	add	w12, w12, #8
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_159
; %bb.104:                              ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #8
	add	w12, w9, w8
	add	w12, w12, #9
	strb	w10, [x11]
	ldrb	w10, [x12]
	cbz	w10, LBB10_161
; %bb.105:                              ;   in Loop: Header=BB10_86 Depth=2
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #9
	add	w8, w8, #19
	cmp	w8, #95
	strb	w10, [x11]
	b.ne	LBB10_86
	b	LBB10_52
LBB10_106:                              ;   in Loop: Header=BB10_54 Depth=1
	add	x0, sp, #544
	mov	w1, #96                         ; =0x60
Lloh173:
	adrp	x2, l_.str.8@PAGE
Lloh174:
	add	x2, x2, l_.str.8@PAGEOFF
LBB10_107:                              ;   in Loop: Header=BB10_54 Depth=1
	bl	_halo_linux_snprintf
	mov	w8, wzr
LBB10_108:                              ;   Parent Loop BB10_54 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x9, sp, #544
	add	w9, w9, w8
	ldrb	w10, [x9]
	cbz	w10, LBB10_163
; %bb.109:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w11, w10, #97
	sub	w9, w9, #8
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w20, w8
	csel	w10, w12, w10, lo
	ldrb	w9, [x9]
	strb	w10, [x11]
	cbz	w9, LBB10_128
; %bb.110:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w10, w22, w8
	sub	w11, w9, #97
	sub	w10, w10, #7
	sub	w12, w9, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w9, w12, w9, lo
	sub	w11, w11, #8
	ldrb	w10, [x10]
	strb	w9, [x11]
	cbz	w10, LBB10_130
; %bb.111:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w11, w10, #97
	sub	w9, w9, #6
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #7
	ldrb	w9, [x9]
	strb	w10, [x11]
	cbz	w9, LBB10_132
; %bb.112:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w10, w22, w8
	sub	w11, w9, #97
	sub	w10, w10, #5
	sub	w12, w9, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w9, w12, w9, lo
	sub	w11, w11, #6
	ldrb	w10, [x10]
	strb	w9, [x11]
	cbz	w10, LBB10_134
; %bb.113:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w11, w10, #97
	sub	w9, w9, #4
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #5
	ldrb	w9, [x9]
	strb	w10, [x11]
	cbz	w9, LBB10_136
; %bb.114:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w10, w22, w8
	sub	w11, w9, #97
	sub	w10, w10, #3
	sub	w12, w9, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w9, w12, w9, lo
	sub	w11, w11, #4
	ldrb	w10, [x10]
	strb	w9, [x11]
	cbz	w10, LBB10_138
; %bb.115:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w11, w10, #97
	sub	w9, w9, #2
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	sub	w11, w11, #3
	ldrb	w9, [x9]
	strb	w10, [x11]
	cbz	w9, LBB10_140
; %bb.116:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w10, w22, w8
	sub	w11, w9, #97
	sub	w10, w10, #1
	sub	w12, w9, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w9, w12, w9, lo
	sub	w11, w11, #2
	ldrb	w10, [x10]
	strb	w9, [x11]
	cbz	w10, LBB10_142
; %bb.117:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w11, w10, #97
	sub	w12, w10, #32
	cmp	w11, #26
	add	w13, w21, w8
	ldrb	w11, [x9]
	csel	w9, w12, w10, lo
	sub	w10, w13, #1
	strb	w9, [x10]
	cbz	w11, LBB10_144
; %bb.118:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w10, w11, #97
	add	w9, w9, #1
	sub	w12, w11, #32
	cmp	w10, #26
	csel	w10, w12, w11, lo
	add	w11, w21, w8
	ldrb	w9, [x9]
	strb	w10, [x11]
	cbz	w9, LBB10_146
; %bb.119:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w10, w22, w8
	sub	w11, w9, #97
	add	w10, w10, #2
	sub	w12, w9, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w9, w12, w9, lo
	add	w11, w11, #1
	ldrb	w10, [x10]
	strb	w9, [x11]
	cbz	w10, LBB10_148
; %bb.120:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w11, w10, #97
	add	w9, w9, #3
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #2
	ldrb	w9, [x9]
	strb	w10, [x11]
	cbz	w9, LBB10_150
; %bb.121:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w10, w22, w8
	sub	w11, w9, #97
	add	w10, w10, #4
	sub	w12, w9, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w9, w12, w9, lo
	add	w11, w11, #3
	ldrb	w10, [x10]
	strb	w9, [x11]
	cbz	w10, LBB10_152
; %bb.122:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w11, w10, #97
	add	w9, w9, #5
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #4
	ldrb	w9, [x9]
	strb	w10, [x11]
	cbz	w9, LBB10_154
; %bb.123:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w10, w22, w8
	sub	w11, w9, #97
	add	w10, w10, #6
	sub	w12, w9, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w9, w12, w9, lo
	add	w11, w11, #5
	ldrb	w10, [x10]
	strb	w9, [x11]
	cbz	w10, LBB10_156
; %bb.124:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w11, w10, #97
	add	w9, w9, #7
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #6
	ldrb	w9, [x9]
	strb	w10, [x11]
	cbz	w9, LBB10_158
; %bb.125:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w10, w22, w8
	sub	w11, w9, #97
	add	w10, w10, #8
	sub	w12, w9, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w9, w12, w9, lo
	add	w11, w11, #7
	ldrb	w10, [x10]
	strb	w9, [x11]
	cbz	w10, LBB10_160
; %bb.126:                              ;   in Loop: Header=BB10_108 Depth=2
	add	w9, w22, w8
	sub	w11, w10, #97
	add	w9, w9, #9
	sub	w12, w10, #32
	cmp	w11, #26
	add	w11, w21, w8
	csel	w10, w12, w10, lo
	add	w11, w11, #8
	ldrb	w9, [x9]
	strb	w10, [x11]
	cbz	w9, LBB10_162
; %bb.127:                              ;   in Loop: Header=BB10_108 Depth=2
	sub	w10, w9, #97
	sub	w11, w9, #32
	cmp	w10, #26
	add	w10, w21, w8
	csel	w9, w11, w9, lo
	add	w10, w10, #9
	add	w8, w8, #19
	cmp	w8, #95
	strb	w9, [x10]
	b.ne	LBB10_108
	b	LBB10_163
LBB10_128:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #1
	b	LBB10_163
LBB10_129:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #2
	b	LBB10_52
LBB10_130:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #2
	b	LBB10_163
LBB10_131:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #3
	b	LBB10_52
LBB10_132:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #3
	b	LBB10_163
LBB10_133:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #4
	b	LBB10_52
LBB10_134:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #4
	b	LBB10_163
LBB10_135:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #5
	b	LBB10_52
LBB10_136:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #5
	b	LBB10_163
LBB10_137:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #6
	b	LBB10_52
LBB10_138:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #6
	b	LBB10_163
LBB10_139:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #7
	b	LBB10_52
LBB10_140:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #7
	b	LBB10_163
LBB10_141:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #8
	b	LBB10_52
LBB10_142:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #8
	b	LBB10_163
LBB10_143:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #9
	b	LBB10_52
LBB10_144:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #9
	b	LBB10_163
LBB10_145:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #10
	b	LBB10_52
LBB10_146:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #10
	b	LBB10_163
LBB10_147:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #11
	b	LBB10_52
LBB10_148:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #11
	b	LBB10_163
LBB10_149:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #12
	b	LBB10_52
LBB10_150:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #12
	b	LBB10_163
LBB10_151:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #13
	b	LBB10_52
LBB10_152:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #13
	b	LBB10_163
LBB10_153:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #14
	b	LBB10_52
LBB10_154:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #14
	b	LBB10_163
LBB10_155:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #15
	b	LBB10_52
LBB10_156:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #15
	b	LBB10_163
LBB10_157:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #16
	b	LBB10_52
LBB10_158:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #16
	b	LBB10_163
LBB10_159:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #17
	b	LBB10_52
LBB10_160:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #17
	b	LBB10_163
LBB10_161:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #18
	b	LBB10_52
LBB10_162:                              ;   in Loop: Header=BB10_54 Depth=1
	add	w8, w8, #18
LBB10_163:                              ;   in Loop: Header=BB10_54 Depth=1
	strb	wzr, [x20, w8, sxtw]
	sub	x1, x29, #144
	mov	w0, w23
Lloh175:
	adrp	x2, _overlay_menu_draw.red@PAGE
Lloh176:
	add	x2, x2, _overlay_menu_draw.red@PAGEOFF
	b	LBB10_53
LBB10_164:
	and	w13, w9, #0xffff
	b	LBB10_166
LBB10_165:
	adrp	x8, _overlay@PAGE+52
	ldrh	w13, [x8, _overlay@PAGEOFF+52]
LBB10_166:
	ldrh	w8, [sp, #422]
	mov	w9, #10                         ; =0xa
	ldr	w19, [sp, #12]                  ; 4-byte Reload
Lloh177:
	adrp	x20, _overlay@PAGE+184
Lloh178:
	add	x20, x20, _overlay@PAGEOFF+184
	ldr	w21, [sp, #24]                  ; 4-byte Reload
	sturh	w9, [x29, #-190]
	sxth	w9, w13
	sub	w8, w8, #5
	cmp	w9, #1
	sturh	w8, [x29, #-186]
	b.lt	LBB10_168
; %bb.167:
Lloh179:
	adrp	x22, _overlay@PAGE+52
Lloh180:
	add	x22, x22, _overlay@PAGEOFF+52
Lloh181:
	adrp	x4, _overlay_menu_draw.blue@PAGE
Lloh182:
	add	x4, x4, _overlay_menu_draw.blue@PAGEOFF
	mov	w0, w23
	mov	w1, #-1                         ; =0xffffffff
	ldrh	w8, [x22, #150]
	mov	w2, #1                          ; =0x1
	mov	w3, wzr
	sub	w9, w8, w24
	sturh	w8, [x29, #-188]
	sturh	w9, [x29, #-192]
	bl	_draw_string_set_draw_mode
Lloh183:
	adrp	x4, l_.str.9@PAGE
Lloh184:
	add	x4, x4, l_.str.9@PAGEOFF
	sub	x0, x29, #192
	sub	x1, x29, #192
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_string
	ldrh	w13, [x22]
LBB10_168:
	adrp	x8, _overlay@PAGE+206
	ldrsh	w9, [x27, #4]
	ldrsh	w8, [x8, _overlay@PAGEOFF+206]
	add	w8, w8, w13, sxth
	cmp	w8, w9
	b.ge	LBB10_170
; %bb.169:
	add	w8, w26, w24
Lloh185:
	adrp	x4, _overlay_menu_draw.blue@PAGE
Lloh186:
	add	x4, x4, _overlay_menu_draw.blue@PAGEOFF
	mov	w0, w23
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, #1                          ; =0x1
	mov	w3, wzr
	sturh	w26, [x29, #-192]
	sturh	w8, [x29, #-188]
	bl	_draw_string_set_draw_mode
Lloh187:
	adrp	x4, l_.str.10@PAGE
Lloh188:
	add	x4, x4, l_.str.10@PAGEOFF
	sub	x0, x29, #192
	sub	x1, x29, #192
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_string
LBB10_170:
	ldrsh	x8, [x25, #2]
	ldr	w22, [sp, #8]                   ; 4-byte Reload
	add	x8, x25, x8, lsl #1
	ldrsh	w8, [x8, #36]
	tbnz	w8, #31, LBB10_176
; %bb.171:
	ldrsh	w9, [x27, #4]
	cmp	w8, w9
	b.ge	LBB10_176
; %bb.172:
	ldr	w9, [x27, #8]
	ldr	w8, [x9, w8, sxtw #2]
	cbz	w8, LBB10_176
; %bb.173:
	ldr	w3, [x8, #48]
	cbz	w3, LBB10_176
; %bb.174:
	ldrb	w8, [x3]
	cbz	w8, LBB10_176
; %bb.175:
	ldrh	w8, [sp, #422]
	sub	w10, w22, w21
	sub	w10, w10, #7
	mov	w9, #10                         ; =0xa
	sub	w11, w10, w21
Lloh189:
	adrp	x2, _overlay_menu_draw.blue@PAGE
Lloh190:
	add	x2, x2, _overlay_menu_draw.blue@PAGEOFF
	sub	x1, x29, #192
	sub	w8, w8, #10
	mov	w0, w19
	mov	w4, #1                          ; =0x1
	sturh	w9, [x29, #-190]
	sturh	w10, [x29, #-188]
	sturh	w8, [x29, #-186]
	sturh	w11, [x29, #-192]
	bl	_overlay_label
LBB10_176:
	ldrh	w8, [sp, #422]
	adrp	x9, _overlay@PAGE+84
	mov	w10, #10                        ; =0xa
	sub	w11, w22, w21
	sturh	w22, [x29, #-188]
	ldrb	w9, [x9, _overlay@PAGEOFF+84]
	sub	w8, w8, #10
	sturh	w10, [x29, #-190]
	sturh	w11, [x29, #-192]
	sturh	w8, [x29, #-186]
	cbz	w9, LBB10_178
; %bb.177:
	bl	_system_milliseconds
Lloh191:
	adrp	x8, _overlay@PAGE+180
Lloh192:
	ldr	w8, [x8, _overlay@PAGEOFF+180]
	cmp	w0, w8
	b.mi	LBB10_179
LBB10_178:
	sub	x4, x29, #184
	mov	w0, w19
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
Lloh193:
	adrp	x4, l_.str.11@PAGE
Lloh194:
	add	x4, x4, l_.str.11@PAGEOFF
	sub	x0, x29, #192
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	mov	w5, wzr
	bl	_draw_string_and_hack_in_icons
	b	LBB10_180
LBB10_179:
	sub	x4, x29, #184
	mov	w0, w19
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
Lloh195:
	adrp	x4, _overlay@PAGE+84
Lloh196:
	add	x4, x4, _overlay@PAGEOFF+84
	sub	x0, x29, #192
	sub	x1, x29, #192
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_string
LBB10_180:
	ldrh	w8, [sp, #422]
	mov	w9, #1                          ; =0x1
	strb	w9, [x20]
	strh	w8, [x20, #2]
	b	LBB10_14
	.loh AdrpAdd	Lloh126, Lloh127
	.loh AdrpAdd	Lloh124, Lloh125
	.loh AdrpAdd	Lloh128, Lloh129
	.loh AdrpLdrGot	Lloh130, Lloh131
	.loh AdrpAdd	Lloh132, Lloh133
	.loh AdrpAdd	Lloh138, Lloh139
	.loh AdrpLdr	Lloh136, Lloh137
	.loh AdrpAdd	Lloh134, Lloh135
	.loh AdrpAdd	Lloh140, Lloh141
	.loh AdrpAdd	Lloh142, Lloh143
	.loh AdrpAdd	Lloh144, Lloh145
	.loh AdrpLdr	Lloh149, Lloh151
	.loh AdrpLdr	Lloh147, Lloh150
	.loh AdrpLdr	Lloh146, Lloh148
	.loh AdrpAdd	Lloh152, Lloh153
	.loh AdrpAdd	Lloh154, Lloh155
	.loh AdrpAdd	Lloh156, Lloh157
	.loh AdrpAdd	Lloh160, Lloh161
	.loh AdrpAdd	Lloh158, Lloh159
	.loh AdrpAdd	Lloh162, Lloh163
	.loh AdrpAdd	Lloh164, Lloh165
	.loh AdrpAddLdr	Lloh166, Lloh167, Lloh168
	.loh AdrpAdd	Lloh169, Lloh170
	.loh AdrpAdd	Lloh171, Lloh172
	.loh AdrpAdd	Lloh173, Lloh174
	.loh AdrpAdd	Lloh175, Lloh176
	.loh AdrpAdd	Lloh177, Lloh178
	.loh AdrpAdd	Lloh183, Lloh184
	.loh AdrpAdd	Lloh181, Lloh182
	.loh AdrpAdd	Lloh179, Lloh180
	.loh AdrpAdd	Lloh187, Lloh188
	.loh AdrpAdd	Lloh185, Lloh186
	.loh AdrpAdd	Lloh189, Lloh190
	.loh AdrpLdr	Lloh191, Lloh192
	.loh AdrpAdd	Lloh193, Lloh194
	.loh AdrpAdd	Lloh195, Lloh196
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_rounded
_overlay_rounded:                       ; @overlay_rounded
; %bb.0:
	sub	sp, sp, #112
	ldrh	w8, [x0, #4]
	ldrh	w9, [x0]
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	mov	w19, w2
	mov	x20, x0
	stp	d11, d10, [sp, #16]             ; 16-byte Folded Spill
	sub	w8, w8, w9
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
	and	w9, w8, #0x8000
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	add	w9, w8, w9, lsr #15
	sxth	w8, w8
	sbfx	w9, w9, #1, #15
	cmp	w1, w9
	csel	w21, w1, w9, lt
	cmp	w8, #2
	b.lt	LBB11_3
; %bb.1:
	and	w23, w21, #0xffff
	sxth	w9, w21
	fmov	s8, #-0.50000000
	cmp	w9, #1
	mul	w8, w23, w23
	scvtf	s9, w9
	fmov	s11, #0.50000000
	mov	w22, wzr
	csinc	w24, w9, wzr, gt
	ucvtf	s10, w8
	.p2align	4, , 8
LBB11_2:                                ; =>This Inner Loop Header: Depth=1
	scvtf	s0, w23
	ldrh	w9, [x20]
	ldrh	w10, [x20, #2]
	add	x0, sp, #8
	ldrh	w11, [x20, #6]
	mov	w1, w19
	add	w9, w9, w22
	fadd	s0, s0, s8
	strh	w9, [sp, #8]
	add	w9, w9, #1
	strh	w9, [sp, #12]
	fmul	s0, s0, s0
	fsub	s0, s10, s0
	fsqrt	s0, s0
	fsub	s0, s9, s0
	fadd	s0, s0, s11
	fcvtzs	w8, s0
	add	w10, w10, w8
	sub	w8, w11, w8
	strh	w10, [sp, #10]
	strh	w8, [sp, #14]
	bl	_draw_quad
	ldrh	w8, [x20, #4]
	mvn	w9, w22
	add	x0, sp, #8
	mov	w1, w19
	add	w9, w8, w9
	sub	w8, w8, w22
	strh	w9, [sp, #8]
	strh	w8, [sp, #12]
	bl	_draw_quad
	add	w22, w22, #1
	sub	w23, w23, #1
	cmp	w24, w22
	b.ne	LBB11_2
LBB11_3:
	ldr	x8, [x20]
	lsr	x10, x8, #32
	add	w9, w21, w8
	sub	w10, w10, w21
	str	x8, [sp, #8]
	sxth	w8, w10
	cmp	w8, w9, sxth
	strh	w9, [sp, #8]
	strh	w10, [sp, #12]
	b.le	LBB11_5
; %bb.4:
	add	x0, sp, #8
	mov	w1, w19
	bl	_draw_quad
LBB11_5:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_entry_on
_overlay_entry_on:                      ; @overlay_entry_on
; %bb.0:
	sub	sp, sp, #160
	ldrh	w8, [x0, #2]
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	sub	w8, w8, #1
	cmp	w8, #9
	b.hi	LBB12_15
; %bb.1:
Lloh197:
	adrp	x9, LJTI12_0@PAGE
Lloh198:
	add	x9, x9, LJTI12_0@PAGEOFF
	adr	x10, LBB12_2
	ldrb	w11, [x9, x8]
	add	x10, x10, x11, lsl #2
	br	x10
LBB12_2:
	mov	x1, sp
	bl	_overlay_global_value
	ldr	s0, [sp]
	fcmp	s0, #0.0
	csel	w0, wzr, w0, eq
	b	LBB12_23
LBB12_3:
	ldr	w0, [x0, #16]
	bl	_config_integer
	cmp	w0, #0
	b	LBB12_22
LBB12_4:
	mov	x19, x0
	ldr	w0, [x0, #16]
	mov	x1, sp
	mov	w2, #128                        ; =0x80
	bl	_config_text
	cbz	w0, LBB12_23
; %bb.5:
	ldr	w1, [x19, #32]
	cbz	w1, LBB12_20
; %bb.6:
	mov	x0, sp
	b	LBB12_14
LBB12_7:
	mov	x1, sp
	mov	x19, x0
	bl	_overlay_global_value
	cbz	w0, LBB12_23
; %bb.8:
	ldr	s0, [sp]
	ldr	s1, [x19, #20]
	fcmp	s0, s1
	cset	w0, eq
	b	LBB12_23
LBB12_9:
	ldr	w0, [x0, #16]
	bl	_config_boolean
	cmp	w0, #0
	b	LBB12_22
LBB12_10:
	mov	x19, x0
	bl	_game_time_get_speed
	mov	w8, #55050                      ; =0xd70a
	ldr	s1, [x19, #20]
	movk	w8, #15395, lsl #16
	fmov	s2, w8
	mov	w8, #55050                      ; =0xd70a
	movk	w8, #48163, lsl #16
	fmov	s3, w8
	fadd	s2, s1, s2
	fadd	s1, s1, s3
	fcmp	s0, s2
	fccmp	s0, s1, #4, mi
	cset	w0, gt
	b	LBB12_23
LBB12_11:
	mov	x1, sp
	bl	_overlay_global_value
	ldr	s0, [sp]
	fcmp	s0, #0.0
	csel	w0, wzr, w0, ne
	b	LBB12_23
LBB12_12:
	mov	x19, x0
	ldr	w0, [x0, #16]
	bl	_config_string
	cbz	w0, LBB12_23
; %bb.13:
	ldr	w1, [x19, #32]
	cbz	w1, LBB12_15
LBB12_14:
	bl	_csstrcmp
	cmp	w0, #0
	cset	w0, eq
	b	LBB12_23
LBB12_15:
	mov	w0, wzr
	b	LBB12_23
LBB12_16:
	bl	_game_map_loaded
	mov	w8, w0
	mov	w0, wzr
	cbz	w8, LBB12_23
; %bb.17:
Lloh199:
	adrp	x8, _hud_scripted_globals@GOTPAGE
Lloh200:
	ldr	w8, [x8, _hud_scripted_globals@GOTPAGEOFF]
Lloh201:
	ldr	w8, [x8]
	cbz	w8, LBB12_23
; %bb.18:
	ldrb	w8, [x8]
	cmp	w8, #0
	b	LBB12_22
LBB12_19:
	ldrb	w0, [x0, #28]
	b	LBB12_23
LBB12_20:
Lloh202:
	adrp	x1, l_.str.269@PAGE
Lloh203:
	add	x1, x1, l_.str.269@PAGEOFF
	mov	x0, sp
	bl	_csstrcmp
	cbz	w0, LBB12_24
; %bb.21:
	mov	x0, sp
	bl	_atof
	fcmp	d0, #0.0
LBB12_22:
	cset	w0, ne
LBB12_23:
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB12_24:
	mov	w0, #1                          ; =0x1
	b	LBB12_23
	.loh AdrpAdd	Lloh197, Lloh198
	.loh AdrpLdrGotLdr	Lloh199, Lloh200, Lloh201
	.loh AdrpAdd	Lloh202, Lloh203
	.section	__TEXT,__const
LJTI12_0:
	.byte	(LBB12_2-LBB12_2)>>2
	.byte	(LBB12_11-LBB12_2)>>2
	.byte	(LBB12_7-LBB12_2)>>2
	.byte	(LBB12_9-LBB12_2)>>2
	.byte	(LBB12_3-LBB12_2)>>2
	.byte	(LBB12_12-LBB12_2)>>2
	.byte	(LBB12_16-LBB12_2)>>2
	.byte	(LBB12_10-LBB12_2)>>2
	.byte	(LBB12_19-LBB12_2)>>2
	.byte	(LBB12_4-LBB12_2)>>2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4                               ; -- Begin function overlay_label
_overlay_label:                         ; @overlay_label
; %bb.0:
	sub	sp, sp, #96
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	mov	w21, w4
	ldr	x22, [x1]
	mov	x4, x2
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	mov	x19, x3
	mov	x20, x1
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	str	x22, [sp, #24]
	bl	_draw_string_set_draw_mode
	mov	x0, x20
	cbz	w21, LBB13_7
; %bb.1:
	lsr	w8, w22, #16
	add	x0, sp, #24
	add	w8, w8, #4000
	add	x2, sp, #16
	add	x3, sp, #8
	mov	x1, x19
	strh	w8, [sp, #30]
	bl	_draw_string_compute_bounds
	ldrh	w8, [sp, #10]
	mov	x0, x20
	ldrh	w9, [x20, #6]
	sub	w8, w8, w9
	sxth	w21, w8
	cmp	w21, #1
	b.lt	LBB13_7
; %bb.2:
	mov	w8, #25                         ; =0x19
	mul	w22, w21, w8
	add	w23, w22, #2000
	bl	_system_milliseconds
Lloh204:
	adrp	x8, _overlay@PAGE+216
Lloh205:
	ldr	w8, [x8, _overlay@PAGEOFF+216]
	sub	w8, w0, w8
	udiv	w9, w8, w23
	msub	w8, w9, w23, w8
	cmp	w8, #1000
	b.hs	LBB13_4
; %bb.3:
	mov	w21, wzr
	b	LBB13_6
LBB13_4:
	add	w9, w22, #1000
	cmp	w8, w9
	b.hs	LBB13_6
; %bb.5:
	mov	w9, #40                         ; =0x28
	mov	w10, #-40000                    ; =0xffff63c0
	madd	w8, w8, w9, w10
	mov	w9, #19923                      ; =0x4dd3
	movk	w9, #4194, lsl #16
	umull	x8, w8, w9
	lsr	x21, x8, #38
LBB13_6:
	ldrh	w8, [x20, #2]
	add	x0, sp, #24
	sub	w8, w8, w21
	add	w9, w8, #4000
	strh	w8, [sp, #26]
	strh	w9, [sp, #30]
LBB13_7:
	mov	x1, x20
	mov	x2, xzr
	mov	w3, wzr
	mov	x4, x19
	bl	_rasterizer_draw_string
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.loh AdrpLdr	Lloh204, Lloh205
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_signature
_overlay_signature:                     ; @overlay_signature
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	sub	sp, sp, #688
	mov	w19, w2
	cmp	w1, #8
	b.ge	LBB14_13
; %bb.1:
	mov	x20, x0
	mov	w22, w1
	bl	_posix_directory_open
	mov	x21, x0
	cbz	w21, LBB14_13
; %bb.2:
	sub	x1, x29, #208
	mov	x0, x21
	mov	w2, #128                        ; =0x80
	bl	_posix_directory_next
	cbz	w0, LBB14_12
; %bb.3:
	mov	w24, #403                       ; =0x193
	add	x9, sp, #48
	movk	w24, #256, lsl #16
	add	w8, w22, #1
	add	w25, w9, #1
	sub	x26, x29, #208
Lloh206:
	adrp	x23, l_.str.16@PAGE
Lloh207:
	add	x23, x23, l_.str.16@PAGEOFF
	sxth	w22, w8
	b	LBB14_5
	.p2align	4, , 8
LBB14_4:                                ;   in Loop: Header=BB14_5 Depth=1
	sub	x1, x29, #208
	mov	x0, x21
	mov	w2, #128                        ; =0x80
	bl	_posix_directory_next
	cbz	w0, LBB14_12
LBB14_5:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_9 Depth 2
	ldurb	w8, [x29, #-208]
	cmp	w8, #46
	b.eq	LBB14_4
; %bb.6:                                ;   in Loop: Header=BB14_5 Depth=1
	add	x0, sp, #48
	mov	w1, #512                        ; =0x200
	mov	x2, x23
	stp	w20, w26, [sp]
	bl	_halo_linux_snprintf
	add	x0, sp, #48
	add	x1, sp, #12
	bl	_posix_stat
	cbnz	w0, LBB14_4
; %bb.7:                                ;   in Loop: Header=BB14_5 Depth=1
	ldrb	w8, [sp, #48]
	mov	w9, #40389                      ; =0x9dc5
	movk	w9, #33052, lsl #16
	cbz	w8, LBB14_10
; %bb.8:                                ;   in Loop: Header=BB14_5 Depth=1
	mov	x10, x25
	.p2align	4, , 8
LBB14_9:                                ;   Parent Loop BB14_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	eor	w9, w9, w8
	ldrb	w8, [x10]
	add	w10, w10, #1
	mul	w9, w9, w24
	cbnz	w8, LBB14_9
LBB14_10:                               ;   in Loop: Header=BB14_5 Depth=1
	ldr	w8, [sp, #16]
	ldr	w10, [sp, #24]
	eor	w8, w8, w9
	ldr	w9, [sp, #28]
	mul	w8, w8, w24
	eor	w8, w8, w10
	mul	w8, w8, w24
	eor	w8, w8, w9
	ldrb	w9, [sp, #12]
	madd	w19, w8, w24, w19
	tbz	w9, #0, LBB14_4
; %bb.11:                               ;   in Loop: Header=BB14_5 Depth=1
	add	x0, sp, #48
	mov	w1, w22
	mov	w2, w19
	bl	_overlay_signature
	mov	w19, w0
	b	LBB14_4
LBB14_12:
	mov	x0, x21
	bl	_posix_directory_close
LBB14_13:
	mov	w0, w19
	add	sp, sp, #688
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh206, Lloh207
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_build_folder
_overlay_build_folder:                  ; @overlay_build_folder
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	sub	sp, sp, #1200
	adrp	x8, _overlay_tree@PAGE+1536
	str	w3, [sp, #76]                   ; 4-byte Spill
	ldrsh	w8, [x8, _overlay_tree@PAGEOFF+1536]
	cmp	w8, #128
	b.lt	LBB15_2
; %bb.1:
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x20, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_61
LBB15_2:
	mov	w9, #12                         ; =0xc
Lloh208:
	adrp	x11, _overlay_tree@PAGE
Lloh209:
	add	x11, x11, _overlay_tree@PAGEOFF
	add	w10, w8, #1
	smaddl	x20, w8, w9, x11
	mov	x28, x2
	mov	x25, x1
	strh	w10, [x11, #1536]
	str	w0, [x20]
	mov	w0, #768                        ; =0x300
	strh	wzr, [x20, #4]
	str	wzr, [x20, #8]
	bl	_malloc
	mov	x21, x0
	cbz	w21, LBB15_61
; %bb.3:
	str	x20, [sp, #40]                  ; 8-byte Spill
	cbz	w28, LBB15_11
; %bb.4:
	mov	x0, x28
	bl	_posix_directory_open
	mov	x23, x0
	mov	w0, #24576                      ; =0x6000
	bl	_malloc
	mov	x24, x0
	cbz	w23, LBB15_12
; %bb.5:
	cbz	w24, LBB15_12
; %bb.6:
	mov	w19, wzr
	.p2align	4, , 8
LBB15_7:                                ; =>This Inner Loop Header: Depth=1
	add	x1, sp, #88
	mov	x0, x23
	mov	w2, #128                        ; =0x80
	bl	_posix_directory_next
	cbz	w0, LBB15_17
; %bb.8:                                ;   in Loop: Header=BB15_7 Depth=1
	ldrb	w8, [sp, #88]
	cmp	w8, #46
	b.eq	LBB15_7
; %bb.9:                                ;   in Loop: Header=BB15_7 Depth=1
	cmp	w19, #192
	b.eq	LBB15_16
; %bb.10:                               ;   in Loop: Header=BB15_7 Depth=1
	sxtw	x8, w19
	add	x1, sp, #88
	add	x0, x24, x8, lsl #7
	mov	w2, #128                        ; =0x80
	add	w19, w19, #1
	bl	_csmemcpy
                                        ; kill: def $w19 killed $w19 def $x19
	b	LBB15_7
LBB15_11:
	mov	w23, wzr
	mov	x24, xzr
	str	x28, [sp, #64]                  ; 8-byte Spill
	cbnz	w25, LBB15_20
	b	LBB15_40
LBB15_12:
	cbz	w23, LBB15_14
; %bb.13:
	mov	x0, x23
	bl	_posix_directory_close
LBB15_14:
	mov	w19, wzr
LBB15_15:
	sxth	w23, w19
	str	x28, [sp, #64]                  ; 8-byte Spill
	cbnz	w25, LBB15_20
	b	LBB15_40
LBB15_16:
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	w19, #192                       ; =0xc0
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
LBB15_17:
	mov	x0, x23
	bl	_posix_directory_close
	cbz	w24, LBB15_15
; %bb.18:
	tst	w19, #0xffff
	b.eq	LBB15_15
; %bb.19:
	sxth	w23, w19
Lloh210:
	adrp	x3, _overlay_compare_names@PAGE
Lloh211:
	add	x3, x3, _overlay_compare_names@PAGEOFF
	mov	x0, x24
	mov	w1, w23
	mov	w2, #128                        ; =0x80
	bl	_qsort
	str	x28, [sp, #64]                  ; 8-byte Spill
	cbz	w25, LBB15_40
LBB15_20:
	cmp	w24, #0
	ldrsh	w8, [x25, #4]
	ccmp	w23, #0, #4, ne
	cset	w9, gt
	cmp	w8, #1
	str	w9, [sp, #80]                   ; 4-byte Spill
	b.lt	LBB15_40
; %bb.21:
	ldr	w8, [sp, #76]                   ; 4-byte Reload
	mov	w28, wzr
	add	w27, w24, #1
	mov	w20, #60                        ; =0x3c
	add	w8, w8, #1
	sxth	w26, w8
	.p2align	4, , 8
LBB15_22:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB15_29 Depth 2
                                        ;       Child Loop BB15_31 Depth 3
	ldr	w8, [x25, #8]
	smaddl	x19, w28, w20, x8
	ldrh	w8, [x19]
	cmp	w8, #3
	b.ne	LBB15_37
; %bb.23:                               ;   in Loop: Header=BB15_22 Depth=1
	ldr	w8, [sp, #76]                   ; 4-byte Reload
	ldr	w1, [x19, #24]
	cmp	w8, #7
	ccmp	x1, #0, #4, ne
	b.eq	LBB15_37
; %bb.24:                               ;   in Loop: Header=BB15_22 Depth=1
	ldr	w8, [sp, #80]                   ; 4-byte Reload
	cbz	w8, LBB15_34
; %bb.25:                               ;   in Loop: Header=BB15_22 Depth=1
	ldr	w8, [x19, #4]
	mov	w10, wzr
	mov	w9, wzr
	b	LBB15_29
	.p2align	4, , 8
LBB15_26:                               ;   in Loop: Header=BB15_29 Depth=2
	mov	x10, x8
LBB15_27:                               ;   in Loop: Header=BB15_29 Depth=2
	ldrb	w10, [x10]
	cmp	w11, w10
	b.eq	LBB15_35
LBB15_28:                               ;   in Loop: Header=BB15_29 Depth=2
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w23, w10
	b.le	LBB15_34
LBB15_29:                               ;   Parent Loop BB15_22 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB15_31 Depth 3
	sxtw	x10, w10
	add	x22, x24, x10, lsl #7
	ldrb	w11, [x22]
	cbz	w11, LBB15_26
; %bb.30:                               ;   in Loop: Header=BB15_29 Depth=2
	sxth	w10, w9
	add	w12, w27, w10, lsl #7
	mov	x10, x8
	.p2align	4, , 8
LBB15_31:                               ;   Parent Loop BB15_22 Depth=1
                                        ;     Parent Loop BB15_29 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldrb	w13, [x10]
	cbz	w13, LBB15_27
; %bb.32:                               ;   in Loop: Header=BB15_31 Depth=3
	sub	w14, w11, #65
	add	w15, w11, #32
	cmp	w14, #26
	sub	w14, w13, #65
	csel	w11, w15, w11, lo
	add	w15, w13, #32
	cmp	w14, #26
	csel	w13, w15, w13, lo
	cmp	w11, w13
	b.ne	LBB15_28
; %bb.33:                               ;   in Loop: Header=BB15_31 Depth=3
	ldrb	w11, [x12]
	add	x10, x10, #1
	add	w12, w12, #1
	cbnz	w11, LBB15_31
	b	LBB15_27
LBB15_34:                               ;   in Loop: Header=BB15_22 Depth=1
	mov	x2, xzr
	b	LBB15_36
LBB15_35:                               ;   in Loop: Header=BB15_22 Depth=1
	ldr	x8, [sp, #64]                   ; 8-byte Reload
	add	x0, sp, #88
	mov	w1, #512                        ; =0x200
Lloh212:
	adrp	x2, l_.str.16@PAGE
Lloh213:
	add	x2, x2, l_.str.16@PAGEOFF
	stp	w8, w22, [sp]
	bl	_halo_linux_snprintf
	strb	wzr, [x22]
	add	x2, sp, #88
	ldr	w1, [x19, #24]
LBB15_36:                               ;   in Loop: Header=BB15_22 Depth=1
	ldr	w0, [x19, #4]
	mov	w3, w26
	bl	_overlay_build_folder
	str	w0, [x19, #36]
LBB15_37:                               ;   in Loop: Header=BB15_22 Depth=1
	ldrsh	w8, [x25, #4]
	add	w22, w28, #1
	str	w19, [x21, w28, sxtw #2]
	cmp	w22, w8
	b.ge	LBB15_39
; %bb.38:                               ;   in Loop: Header=BB15_22 Depth=1
	cmp	w28, #191
	mov	w28, w22
	b.lo	LBB15_22
LBB15_39:
	ldr	x28, [sp, #64]                  ; 8-byte Reload
	str	x21, [sp, #56]                  ; 8-byte Spill
	cbnz	w24, LBB15_41
	b	LBB15_54
LBB15_40:
	mov	w22, wzr
	str	x21, [sp, #56]                  ; 8-byte Spill
	cbz	w24, LBB15_54
LBB15_41:
	cmp	w23, #1
	b.lt	LBB15_54
; %bb.42:
	ldr	w9, [sp, #76]                   ; 4-byte Reload
	mov	w8, wzr
	mov	w20, wzr
Lloh214:
	adrp	x26, l_.str.16@PAGE
Lloh215:
	add	x26, x26, l_.str.16@PAGEOFF
	str	x24, [sp, #80]                  ; 8-byte Spill
	str	w23, [sp, #36]                  ; 4-byte Spill
	add	w9, w9, #1
	sxth	w9, w9
	str	w9, [sp, #52]                   ; 4-byte Spill
	b	LBB15_44
	.p2align	4, , 8
LBB15_43:                               ;   in Loop: Header=BB15_44 Depth=1
	add	w20, w20, #1
	sxth	w8, w20
	cmp	w23, w8
	b.le	LBB15_66
LBB15_44:                               ; =>This Inner Loop Header: Depth=1
	sxtw	x8, w8
	add	x27, x24, x8, lsl #7
	ldrb	w8, [x27]
	cbz	w8, LBB15_43
; %bb.45:                               ;   in Loop: Header=BB15_44 Depth=1
	add	x0, sp, #88
	mov	w1, #512                        ; =0x200
	mov	x2, x26
	stp	w28, w27, [sp]
	bl	_halo_linux_snprintf
	add	x0, sp, #88
	add	x1, sp, #864
	bl	_posix_stat
	cbnz	w0, LBB15_43
; %bb.46:                               ;   in Loop: Header=BB15_44 Depth=1
	ldrb	w8, [sp, #864]
	tbz	w8, #0, LBB15_43
; %bb.47:                               ;   in Loop: Header=BB15_44 Depth=1
	ldr	w8, [sp, #76]                   ; 4-byte Reload
	cmp	w8, #7
	b.eq	LBB15_43
; %bb.48:                               ;   in Loop: Header=BB15_44 Depth=1
	sxth	w25, w22
	cmp	w25, #191
	b.gt	LBB15_43
; %bb.49:                               ;   in Loop: Header=BB15_44 Depth=1
	adrp	x8, _overlay_tree@PAGE+38408
	ldrsh	w8, [x8, _overlay_tree@PAGEOFF+38408]
	cmp	w8, #512
	b.ge	LBB15_62
; %bb.50:                               ;   in Loop: Header=BB15_44 Depth=1
	mov	w10, #60                        ; =0x3c
Lloh216:
	adrp	x9, _overlay_tree@PAGE
Lloh217:
	add	x9, x9, _overlay_tree@PAGEOFF
	mov	w11, #7688                      ; =0x1e08
	smaddl	x19, w8, w10, x9
	add	w8, w8, #1
	mov	w10, #38408                     ; =0x9608
	mov	w1, wzr
	add	x0, x19, x11
	mov	w2, #60                         ; =0x3c
	add	x24, x19, x11
	strh	w8, [x9, x10]
	bl	_csmemset
	mov	w8, #65535                      ; =0xffff
	strh	w8, [x19, #7718]
	cbz	w24, LBB15_65
; %bb.51:                               ;   in Loop: Header=BB15_44 Depth=1
	mov	w8, #3                          ; =0x3
	mov	x0, x27
	mov	x23, x26
	strh	w8, [x24]
	bl	_csstrlen
Lloh218:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w26, w0, #1
Lloh219:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w26, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.gt	LBB15_63
; %bb.52:                               ;   in Loop: Header=BB15_44 Depth=1
Lloh220:
	adrp	x21, _overlay_tree@PAGE
Lloh221:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	mov	w19, w0
	add	x28, x8, x9
	mov	x0, x28
	mov	x1, x27
	mov	w2, w19
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x28, w19, sxtw]
	movk	w9, #1, lsl #16
	str	w28, [x24, #4]
	ldr	w8, [x21, x9]
	add	w8, w8, w26
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
	cbz	w28, LBB15_65
; %bb.53:                               ;   in Loop: Header=BB15_44 Depth=1
	ldr	w3, [sp, #52]                   ; 4-byte Reload
	add	x2, sp, #88
	mov	x0, x28
	mov	x1, xzr
	mov	x26, x23
	bl	_overlay_build_folder
	str	w24, [x21, w25, sxtw #2]
	add	w22, w22, #1
	str	w0, [x24, #36]
	ldr	x24, [sp, #80]                  ; 8-byte Reload
	ldr	x28, [sp, #64]                  ; 8-byte Reload
	ldr	w23, [sp, #36]                  ; 4-byte Reload
	strb	wzr, [x27]
	b	LBB15_43
LBB15_54:
	mov	w25, w22
LBB15_55:
	ldr	x20, [sp, #40]                  ; 8-byte Reload
LBB15_56:
	sxth	w19, w25
	sxth	w8, w22
	sub	w1, w19, w8
	cmp	w1, #2
	b.lt	LBB15_58
; %bb.57:
	add	x0, x21, w8, sxtw #2
Lloh222:
	adrp	x3, _overlay_compare_entries@PAGE
Lloh223:
	add	x3, x3, _overlay_compare_entries@PAGEOFF
	mov	w2, #4                          ; =0x4
	bl	_qsort
LBB15_58:
	adrp	x8, _overlay_tree@PAGE+7684
	ldrsh	w8, [x8, _overlay_tree@PAGEOFF+7684]
	add	w9, w8, w19
	cmp	w9, #1537
	b.lt	LBB15_60
; %bb.59:
	mov	w11, #1536                      ; =0x600
	adrp	x9, _overlay_tree@PAGE+103957
	mov	w10, #1                         ; =0x1
	sub	w25, w11, w8
	sxth	w19, w25
	strb	w10, [x9, _overlay_tree@PAGEOFF+103957]
LBB15_60:
	lsl	w2, w19, #2
	ldr	x19, [sp, #56]                  ; 8-byte Reload
Lloh224:
	adrp	x21, _overlay_tree@PAGE
Lloh225:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw #2
	add	x0, x8, #1540
	mov	x1, x19
	str	w0, [x20, #8]
	bl	_csmemcpy
	ldrh	w8, [x21, #7684]
	mov	x0, x24
	add	w8, w8, w25
	strh	w8, [x21, #7684]
	strh	w25, [x20, #4]
	bl	_free
	mov	x0, x19
	bl	_free
LBB15_61:
	mov	x0, x20
	add	sp, sp, #1200
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB15_62:
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	b	LBB15_64
LBB15_63:
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	str	wzr, [x24, #4]
LBB15_64:
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
LBB15_65:
	ldr	x24, [sp, #80]                  ; 8-byte Reload
	ldr	x28, [sp, #64]                  ; 8-byte Reload
	ldr	w23, [sp, #36]                  ; 4-byte Reload
LBB15_66:
	mov	w8, wzr
	mov	w19, wzr
	mov	w25, w22
	b	LBB15_69
	.p2align	4, , 8
LBB15_67:                               ;   in Loop: Header=BB15_69 Depth=1
	ldr	x24, [sp, #80]                  ; 8-byte Reload
LBB15_68:                               ;   in Loop: Header=BB15_69 Depth=1
	add	w19, w19, #1
	sxth	w8, w19
	cmp	w23, w8
	b.le	LBB15_55
LBB15_69:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB15_104 Depth 2
                                        ;       Child Loop BB15_107 Depth 3
                                        ;       Child Loop BB15_112 Depth 3
                                        ;       Child Loop BB15_116 Depth 3
	sxtw	x8, w8
	add	x24, x24, x8, lsl #7
	mov	x0, x24
	bl	_csstrlen
	cmp	w0, #5
	b.lo	LBB15_67
; %bb.70:                               ;   in Loop: Header=BB15_69 Depth=1
	add	x8, x24, w0, sxtw
	ldurb	w9, [x8, #-5]
	cbz	w9, LBB15_81
; %bb.71:                               ;   in Loop: Header=BB15_69 Depth=1
	sub	w10, w9, #65
	add	w11, w9, #32
	cmp	w10, #26
	csel	w9, w11, w9, lo
	cmp	w9, #46
	b.ne	LBB15_67
; %bb.72:                               ;   in Loop: Header=BB15_69 Depth=1
	ldurb	w9, [x8, #-4]
	cbz	w9, LBB15_82
; %bb.73:                               ;   in Loop: Header=BB15_69 Depth=1
	sub	w10, w9, #65
	add	w11, w9, #32
	cmp	w10, #26
	csel	w9, w11, w9, lo
	cmp	w9, #116
	b.ne	LBB15_67
; %bb.74:                               ;   in Loop: Header=BB15_69 Depth=1
	ldurb	w9, [x8, #-3]
	cbz	w9, LBB15_83
; %bb.75:                               ;   in Loop: Header=BB15_69 Depth=1
	sub	w10, w9, #65
	add	w11, w9, #32
	cmp	w10, #26
	csel	w9, w11, w9, lo
	cmp	w9, #111
	b.ne	LBB15_67
; %bb.76:                               ;   in Loop: Header=BB15_69 Depth=1
	ldurb	w9, [x8, #-2]
	cbz	w9, LBB15_84
; %bb.77:                               ;   in Loop: Header=BB15_69 Depth=1
	sub	w10, w9, #65
	add	w11, w9, #32
	cmp	w10, #26
	csel	w9, w11, w9, lo
	cmp	w9, #109
	b.ne	LBB15_67
; %bb.78:                               ;   in Loop: Header=BB15_69 Depth=1
	ldurb	w9, [x8, #-1]
	cbz	w9, LBB15_85
; %bb.79:                               ;   in Loop: Header=BB15_69 Depth=1
	sub	w10, w9, #65
	add	w11, w9, #32
	cmp	w10, #26
	csel	w9, w11, w9, lo
	cmp	w9, #108
	b.ne	LBB15_67
; %bb.80:                               ;   in Loop: Header=BB15_69 Depth=1
	ldrb	w8, [x8]
Lloh226:
	adrp	x9, l_.str.17@PAGE+5
Lloh227:
	add	x9, x9, l_.str.17@PAGEOFF+5
	b	LBB15_86
LBB15_81:                               ;   in Loop: Header=BB15_69 Depth=1
	mov	w8, wzr
Lloh228:
	adrp	x9, l_.str.17@PAGE
Lloh229:
	add	x9, x9, l_.str.17@PAGEOFF
	b	LBB15_86
LBB15_82:                               ;   in Loop: Header=BB15_69 Depth=1
	mov	w8, wzr
Lloh230:
	adrp	x9, l_.str.17@PAGE+1
Lloh231:
	add	x9, x9, l_.str.17@PAGEOFF+1
	b	LBB15_86
LBB15_83:                               ;   in Loop: Header=BB15_69 Depth=1
	mov	w8, wzr
Lloh232:
	adrp	x9, l_.str.17@PAGE+2
Lloh233:
	add	x9, x9, l_.str.17@PAGEOFF+2
	b	LBB15_86
LBB15_84:                               ;   in Loop: Header=BB15_69 Depth=1
	mov	w8, wzr
Lloh234:
	adrp	x9, l_.str.17@PAGE+3
Lloh235:
	add	x9, x9, l_.str.17@PAGEOFF+3
	b	LBB15_86
LBB15_85:                               ;   in Loop: Header=BB15_69 Depth=1
	mov	w8, wzr
Lloh236:
	adrp	x9, l_.str.17@PAGE+4
Lloh237:
	add	x9, x9, l_.str.17@PAGEOFF+4
	.p2align	4, , 8
LBB15_86:                               ;   in Loop: Header=BB15_69 Depth=1
	ldrb	w9, [x9]
	cmp	w8, w9
	b.ne	LBB15_67
; %bb.87:                               ;   in Loop: Header=BB15_69 Depth=1
	sxth	w26, w25
	cmp	w26, #192
	b.ge	LBB15_224
; %bb.88:                               ;   in Loop: Header=BB15_69 Depth=1
	add	x0, sp, #88
	mov	w1, #512                        ; =0x200
Lloh238:
	adrp	x2, l_.str.16@PAGE
Lloh239:
	add	x2, x2, l_.str.16@PAGEOFF
	stp	w28, w24, [sp]
	bl	_halo_linux_snprintf
	adrp	x8, _overlay_tree@PAGE+38408
	ldrsh	w8, [x8, _overlay_tree@PAGEOFF+38408]
	cmp	w8, #512
	b.ge	LBB15_225
; %bb.89:                               ;   in Loop: Header=BB15_69 Depth=1
	mov	w10, #60                        ; =0x3c
Lloh240:
	adrp	x9, _overlay_tree@PAGE
Lloh241:
	add	x9, x9, _overlay_tree@PAGEOFF
	mov	w11, #7688                      ; =0x1e08
	smaddl	x20, w8, w10, x9
	add	w8, w8, #1
	mov	w10, #38408                     ; =0x9608
	mov	w1, wzr
	add	x0, x20, x11
	mov	w2, #60                         ; =0x3c
	add	x27, x20, x11
	strh	w8, [x9, x10]
	bl	_csmemset
	mov	w8, #65535                      ; =0xffff
	stur	xzr, [x29, #-152]
	strh	w8, [x20, #7718]
	cbz	w27, LBB15_226
; %bb.90:                               ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x24
	str	w26, [sp, #52]                  ; 4-byte Spill
	str	w25, [sp, #76]                  ; 4-byte Spill
	bl	_csstrlen
Lloh242:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w0, #1
Lloh243:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_92
; %bb.91:                               ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x25, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_93
LBB15_92:                               ;   in Loop: Header=BB15_69 Depth=1
Lloh244:
	adrp	x21, _overlay_tree@PAGE
Lloh245:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	mov	w26, w0
	add	x25, x8, x9
	mov	x0, x25
	mov	x1, x24
	mov	w2, w26
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x25, w26, sxtw]
	movk	w9, #1, lsl #16
	ldr	w8, [x21, x9]
	add	w8, w8, w20
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
LBB15_93:                               ;   in Loop: Header=BB15_69 Depth=1
	add	x0, sp, #88
	sub	x1, x29, #152
	str	w25, [x27, #44]
	bl	_config_file_read
	ldr	x24, [sp, #80]                  ; 8-byte Reload
	mov	x26, x0
	cbz	w26, LBB15_101
; %bb.94:                               ;   in Loop: Header=BB15_69 Depth=1
	ldur	w1, [x29, #-152]
	add	x8, sp, #864
	mov	x0, x26
	bl	_toml_parse
	ldrb	w8, [sp, #864]
	tbz	w8, #0, LBB15_102
; %bb.95:                               ;   in Loop: Header=BB15_69 Depth=1
	add	x8, sp, #864
	sub	x0, x29, #144
Lloh246:
	adrp	x1, l_.str.20@PAGE
Lloh247:
	add	x1, x1, l_.str.20@PAGEOFF
	ldur	q0, [x8, #8]
	ldur	q1, [x8, #24]
	ldur	q2, [x8, #40]
	sub	x8, x29, #144
	stp	q0, q1, [x8]
	str	q2, [x8, #32]
	add	x8, sp, #600
	bl	_toml_get
	ldr	w8, [sp, #600]
	cbz	w8, LBB15_130
; %bb.96:                               ;   in Loop: Header=BB15_69 Depth=1
	cmp	w8, #1
	b.ne	LBB15_131
; %bb.97:                               ;   in Loop: Header=BB15_69 Depth=1
	ldr	w25, [sp, #628]
	ldr	w28, [sp, #624]
	tbz	w25, #31, LBB15_99
; %bb.98:                               ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x28
	bl	_csstrlen
	mov	w25, w0
LBB15_99:                               ;   in Loop: Header=BB15_69 Depth=1
Lloh248:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w25, #1
Lloh249:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_132
; %bb.100:                              ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x24, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_133
LBB15_101:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w25, [sp, #76]                  ; 4-byte Reload
Lloh250:
	adrp	x8, l_.str.18@PAGE
Lloh251:
	add	x8, x8, l_.str.18@PAGEOFF
	ldr	w20, [sp, #52]                  ; 4-byte Reload
	b	LBB15_206
LBB15_102:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x28, x26
	b	LBB15_104
	.p2align	4, , 8
LBB15_103:                              ;   in Loop: Header=BB15_104 Depth=2
	mov	x0, x28
	mov	w1, #10                         ; =0xa
	bl	_strchr
	add	x28, x0, #1
	cbz	w0, LBB15_125
LBB15_104:                              ;   Parent Loop BB15_69 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB15_107 Depth 3
                                        ;       Child Loop BB15_112 Depth 3
                                        ;       Child Loop BB15_116 Depth 3
	ldrb	w8, [x28]
	cbz	w8, LBB15_125
; %bb.105:                              ;   in Loop: Header=BB15_104 Depth=2
	add	w24, w28, #7
	add	w20, w28, #7
	mov	x25, x28
	b	LBB15_107
	.p2align	4, , 8
LBB15_106:                              ;   in Loop: Header=BB15_107 Depth=3
	add	w25, w25, #1
	add	w24, w24, #1
	add	w20, w20, #1
	ldrb	w8, [x25]
LBB15_107:                              ;   Parent Loop BB15_69 Depth=1
                                        ;     Parent Loop BB15_104 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	cmp	w8, #32
	b.eq	LBB15_106
; %bb.108:                              ;   in Loop: Header=BB15_107 Depth=3
	cmp	w8, #9
	b.eq	LBB15_106
; %bb.109:                              ;   in Loop: Header=BB15_104 Depth=2
	mov	x0, x25
Lloh252:
	adrp	x1, l_.str.20@PAGE
Lloh253:
	add	x1, x1, l_.str.20@PAGEOFF
	mov	w2, #5                          ; =0x5
	bl	_csstrncmp
	cbnz	w0, LBB15_103
; %bb.110:                              ;   in Loop: Header=BB15_104 Depth=2
	add	w8, w25, #5
	b	LBB15_112
	.p2align	4, , 8
LBB15_111:                              ;   in Loop: Header=BB15_112 Depth=3
	add	x8, x8, #1
	add	w24, w24, #1
	add	w20, w20, #1
LBB15_112:                              ;   Parent Loop BB15_69 Depth=1
                                        ;     Parent Loop BB15_104 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldrb	w9, [x8]
	cmp	w9, #9
	b.eq	LBB15_111
; %bb.113:                              ;   in Loop: Header=BB15_112 Depth=3
	cmp	w9, #32
	b.eq	LBB15_111
; %bb.114:                              ;   in Loop: Header=BB15_104 Depth=2
	cmp	w9, #61
	b.eq	LBB15_116
	b	LBB15_103
	.p2align	4, , 8
LBB15_115:                              ;   in Loop: Header=BB15_116 Depth=3
	add	w24, w24, #1
	add	w20, w20, #1
LBB15_116:                              ;   Parent Loop BB15_69 Depth=1
                                        ;     Parent Loop BB15_104 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	sub	w8, w24, #1
	ldrb	w8, [x8]
	cmp	w8, #9
	b.eq	LBB15_115
; %bb.117:                              ;   in Loop: Header=BB15_116 Depth=3
	cmp	w8, #32
	b.eq	LBB15_115
; %bb.118:                              ;   in Loop: Header=BB15_104 Depth=2
	cmp	w8, #34
	b.ne	LBB15_103
; %bb.119:                              ;   in Loop: Header=BB15_104 Depth=2
	mov	x0, x24
	mov	w1, #34                         ; =0x22
	bl	_strchr
	mov	x25, x0
	cmp	w25, w24
	b.ls	LBB15_103
; %bb.120:                              ;   in Loop: Header=BB15_104 Depth=2
	sub	w2, w25, w20
	mov	x0, x24
	mov	w1, #10                         ; =0xa
	bl	_memchr
	cbnz	w0, LBB15_103
; %bb.121:                              ;   in Loop: Header=BB15_69 Depth=1
	subs	w25, w25, w20
	b.pl	LBB15_123
; %bb.122:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x24
	bl	_csstrlen
	mov	w25, w0
LBB15_123:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh254:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w25, #1
Lloh255:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_220
; %bb.124:                              ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x28, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_126
LBB15_125:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x28, xzr
LBB15_126:                              ;   in Loop: Header=BB15_69 Depth=1
	str	w28, [x27, #4]
	add	x28, sp, #864
	add	x0, x28, #56
	bl	_csstrlen
Lloh256:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w0, #1
Lloh257:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_128
; %bb.127:                              ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x24, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_129
LBB15_128:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh258:
	adrp	x21, _overlay_tree@PAGE
Lloh259:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	mov	w25, w0
	add	x24, x8, x9
	add	x1, x28, #56
	mov	x0, x24
	mov	w2, w25
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x24, w25, sxtw]
	movk	w9, #1, lsl #16
	ldr	w8, [x21, x9]
	add	w8, w8, w20
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
LBB15_129:                              ;   in Loop: Header=BB15_69 Depth=1
	cmp	w24, #0
Lloh260:
	adrp	x8, l_.str.19@PAGE
Lloh261:
	add	x8, x8, l_.str.19@PAGEOFF
	ldr	x28, [sp, #64]                  ; 8-byte Reload
	csel	x8, x8, x24, eq
	ldr	x24, [sp, #80]                  ; 8-byte Reload
	stp	xzr, xzr, [sp, #16]             ; 16-byte Folded Spill
	stur	w8, [x29, #-148]
	b	LBB15_197
LBB15_130:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x24, xzr
	b	LBB15_134
LBB15_131:                              ;   in Loop: Header=BB15_69 Depth=1
	ldur	w8, [x29, #-148]
Lloh262:
	adrp	x9, l_.str.37@PAGE
Lloh263:
	add	x9, x9, l_.str.37@PAGEOFF
	mov	x24, xzr
	cmp	w8, #0
	csel	x8, x9, x8, eq
	stur	w8, [x29, #-148]
	b	LBB15_134
LBB15_132:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh264:
	adrp	x21, _overlay_tree@PAGE
Lloh265:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	add	x24, x8, x9
	mov	x1, x28
	mov	x0, x24
	mov	w2, w25
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x24, w25, sxtw]
	movk	w9, #1, lsl #16
	ldr	w8, [x21, x9]
	add	w8, w8, w20
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
LBB15_133:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x28, [sp, #64]                  ; 8-byte Reload
LBB15_134:                              ;   in Loop: Header=BB15_69 Depth=1
	add	x8, sp, #864
	sub	x0, x29, #144
Lloh266:
	adrp	x1, l_.str.21@PAGE
Lloh267:
	add	x1, x1, l_.str.21@PAGEOFF
	str	w24, [x27, #4]
	ldur	q0, [x8, #8]
	ldur	q1, [x8, #24]
	ldur	q2, [x8, #40]
	sub	x8, x29, #144
	stp	q0, q1, [x8]
	str	q2, [x8, #32]
	add	x8, sp, #600
	bl	_toml_get
	ldr	w8, [sp, #600]
	cbz	w8, LBB15_140
; %bb.135:                              ;   in Loop: Header=BB15_69 Depth=1
	cmp	w8, #1
	b.ne	LBB15_141
; %bb.136:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w24, [sp, #628]
	ldr	w28, [sp, #624]
	tbz	w24, #31, LBB15_138
; %bb.137:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x28
	bl	_csstrlen
	mov	w24, w0
LBB15_138:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh268:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w24, #1
Lloh269:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_142
; %bb.139:                              ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	str	xzr, [sp, #24]                  ; 8-byte Spill
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_143
LBB15_140:                              ;   in Loop: Header=BB15_69 Depth=1
	str	xzr, [sp, #24]                  ; 8-byte Spill
	b	LBB15_144
LBB15_141:                              ;   in Loop: Header=BB15_69 Depth=1
	ldur	w8, [x29, #-148]
Lloh270:
	adrp	x9, l_.str.37@PAGE
Lloh271:
	add	x9, x9, l_.str.37@PAGEOFF
	str	xzr, [sp, #24]                  ; 8-byte Spill
	cmp	w8, #0
	csel	x8, x9, x8, eq
	stur	w8, [x29, #-148]
	b	LBB15_144
LBB15_142:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh272:
	adrp	x21, _overlay_tree@PAGE
Lloh273:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	add	x25, x8, x9
	mov	x1, x28
	mov	x0, x25
	mov	w2, w24
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x25, w24, sxtw]
	movk	w9, #1, lsl #16
	str	x25, [sp, #24]                  ; 8-byte Spill
	ldr	w8, [x21, x9]
	add	w8, w8, w20
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
LBB15_143:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x28, [sp, #64]                  ; 8-byte Reload
LBB15_144:                              ;   in Loop: Header=BB15_69 Depth=1
	add	x8, sp, #864
	sub	x0, x29, #144
Lloh274:
	adrp	x1, l_.str.22@PAGE
Lloh275:
	add	x1, x1, l_.str.22@PAGEOFF
	ldur	q0, [x8, #8]
	ldur	q1, [x8, #24]
	ldur	q2, [x8, #40]
	sub	x8, x29, #144
	stp	q0, q1, [x8]
	str	q2, [x8, #32]
	add	x8, sp, #600
	bl	_toml_get
	ldr	w8, [sp, #600]
	cbz	w8, LBB15_150
; %bb.145:                              ;   in Loop: Header=BB15_69 Depth=1
	cmp	w8, #1
	b.ne	LBB15_151
; %bb.146:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w28, [sp, #628]
	ldr	w25, [sp, #624]
	tbz	w28, #31, LBB15_148
; %bb.147:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x25
	bl	_csstrlen
	mov	w28, w0
LBB15_148:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh276:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w28, #1
Lloh277:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_152
; %bb.149:                              ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x24, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_153
LBB15_150:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x24, xzr
	b	LBB15_154
LBB15_151:                              ;   in Loop: Header=BB15_69 Depth=1
	ldur	w8, [x29, #-148]
Lloh278:
	adrp	x9, l_.str.37@PAGE
Lloh279:
	add	x9, x9, l_.str.37@PAGEOFF
	mov	x24, xzr
	cmp	w8, #0
	csel	x8, x9, x8, eq
	stur	w8, [x29, #-148]
	b	LBB15_154
LBB15_152:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh280:
	adrp	x21, _overlay_tree@PAGE
Lloh281:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	add	x24, x8, x9
	mov	x1, x25
	mov	x0, x24
	mov	w2, w28
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x24, w28, sxtw]
	movk	w9, #1, lsl #16
	ldr	w8, [x21, x9]
	add	w8, w8, w20
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
LBB15_153:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x28, [sp, #64]                  ; 8-byte Reload
LBB15_154:                              ;   in Loop: Header=BB15_69 Depth=1
	add	x8, sp, #864
	sub	x0, x29, #144
Lloh282:
	adrp	x1, l_.str.23@PAGE
Lloh283:
	add	x1, x1, l_.str.23@PAGEOFF
	str	w24, [x27, #8]
	ldur	q0, [x8, #8]
	ldur	q1, [x8, #24]
	ldur	q2, [x8, #40]
	sub	x8, x29, #144
	stp	q0, q1, [x8]
	str	q2, [x8, #32]
	add	x8, sp, #600
	bl	_toml_get
	ldr	w8, [sp, #600]
	cbz	w8, LBB15_160
; %bb.155:                              ;   in Loop: Header=BB15_69 Depth=1
	cmp	w8, #1
	b.ne	LBB15_161
; %bb.156:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w28, [sp, #628]
	ldr	w25, [sp, #624]
	tbz	w28, #31, LBB15_158
; %bb.157:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x25
	bl	_csstrlen
	mov	w28, w0
LBB15_158:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh284:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w28, #1
Lloh285:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_162
; %bb.159:                              ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x24, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_163
LBB15_160:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x24, xzr
	b	LBB15_164
LBB15_161:                              ;   in Loop: Header=BB15_69 Depth=1
	ldur	w8, [x29, #-148]
Lloh286:
	adrp	x9, l_.str.37@PAGE
Lloh287:
	add	x9, x9, l_.str.37@PAGEOFF
	mov	x24, xzr
	cmp	w8, #0
	csel	x8, x9, x8, eq
	stur	w8, [x29, #-148]
	b	LBB15_164
LBB15_162:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh288:
	adrp	x21, _overlay_tree@PAGE
Lloh289:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	add	x24, x8, x9
	mov	x1, x25
	mov	x0, x24
	mov	w2, w28
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x24, w28, sxtw]
	movk	w9, #1, lsl #16
	ldr	w8, [x21, x9]
	add	w8, w8, w20
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
LBB15_163:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x28, [sp, #64]                  ; 8-byte Reload
LBB15_164:                              ;   in Loop: Header=BB15_69 Depth=1
	add	x8, sp, #864
	sub	x0, x29, #144
Lloh290:
	adrp	x1, l_.str.24@PAGE
Lloh291:
	add	x1, x1, l_.str.24@PAGEOFF
	str	w24, [x27, #12]
	ldur	q0, [x8, #8]
	ldur	q1, [x8, #24]
	ldur	q2, [x8, #40]
	sub	x8, x29, #144
	stp	q0, q1, [x8]
	str	q2, [x8, #32]
	add	x8, sp, #600
	bl	_toml_get
	ldr	w8, [sp, #600]
	cbz	w8, LBB15_170
; %bb.165:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x24, [sp, #80]                  ; 8-byte Reload
	cmp	w8, #1
	b.ne	LBB15_171
; %bb.166:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w28, [sp, #628]
	ldr	w25, [sp, #624]
	tbz	w28, #31, LBB15_168
; %bb.167:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x25
	bl	_csstrlen
	mov	w28, w0
LBB15_168:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh292:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w28, #1
Lloh293:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_172
; %bb.169:                              ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	str	xzr, [sp, #16]                  ; 8-byte Spill
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_173
LBB15_170:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x24, [sp, #80]                  ; 8-byte Reload
	str	xzr, [sp, #16]                  ; 8-byte Spill
	b	LBB15_174
LBB15_171:                              ;   in Loop: Header=BB15_69 Depth=1
	ldur	w8, [x29, #-148]
Lloh294:
	adrp	x9, l_.str.37@PAGE
Lloh295:
	add	x9, x9, l_.str.37@PAGEOFF
	str	xzr, [sp, #16]                  ; 8-byte Spill
	cmp	w8, #0
	csel	x8, x9, x8, eq
	stur	w8, [x29, #-148]
	b	LBB15_174
LBB15_172:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh296:
	adrp	x9, _overlay_tree@PAGE
Lloh297:
	add	x9, x9, _overlay_tree@PAGEOFF
	add	x8, x9, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	add	x21, x8, x9
	mov	x1, x25
	mov	x0, x21
	mov	w2, w28
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
Lloh298:
	adrp	x10, _overlay_tree@PAGE
Lloh299:
	add	x10, x10, _overlay_tree@PAGEOFF
	movk	w9, #1, lsl #16
	strb	wzr, [x21, w28, sxtw]
	str	x21, [sp, #16]                  ; 8-byte Spill
	ldr	w8, [x10, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
	add	w8, w8, w20
	str	w8, [x10, x9]
LBB15_173:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x28, [sp, #64]                  ; 8-byte Reload
LBB15_174:                              ;   in Loop: Header=BB15_69 Depth=1
	add	x8, sp, #864
	sub	x0, x29, #144
Lloh300:
	adrp	x1, l_.str.25@PAGE
Lloh301:
	add	x1, x1, l_.str.25@PAGEOFF
	ldur	q0, [x8, #8]
	ldur	q1, [x8, #24]
	ldur	q2, [x8, #40]
	sub	x8, x29, #144
	stp	q0, q1, [x8]
	str	q2, [x8, #32]
	add	x8, sp, #600
	bl	_toml_get
	ldr	w8, [sp, #600]
	cbz	w8, LBB15_180
; %bb.175:                              ;   in Loop: Header=BB15_69 Depth=1
	cmp	w8, #1
	b.ne	LBB15_181
; %bb.176:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w28, [sp, #628]
	ldr	w25, [sp, #624]
	tbz	w28, #31, LBB15_178
; %bb.177:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x25
	bl	_csstrlen
	mov	w28, w0
LBB15_178:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh302:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w28, #1
Lloh303:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_182
; %bb.179:                              ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x24, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_183
LBB15_180:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x24, xzr
	b	LBB15_184
LBB15_181:                              ;   in Loop: Header=BB15_69 Depth=1
	ldur	w8, [x29, #-148]
Lloh304:
	adrp	x9, l_.str.37@PAGE
Lloh305:
	add	x9, x9, l_.str.37@PAGEOFF
	str	wzr, [x27, #48]
	cmp	w8, #0
	csel	x8, x9, x8, eq
	stur	w8, [x29, #-148]
	b	LBB15_197
LBB15_182:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh306:
	adrp	x21, _overlay_tree@PAGE
Lloh307:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	add	x24, x8, x9
	mov	x1, x25
	mov	x0, x24
	mov	w2, w28
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x24, w28, sxtw]
	movk	w9, #1, lsl #16
	ldr	w8, [x21, x9]
	add	w8, w8, w20
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
LBB15_183:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x28, [sp, #64]                  ; 8-byte Reload
LBB15_184:                              ;   in Loop: Header=BB15_69 Depth=1
	ldur	w8, [x29, #-148]
	str	w24, [x27, #48]
	cbz	w8, LBB15_186
; %bb.185:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x24, [sp, #80]                  ; 8-byte Reload
	b	LBB15_197
LBB15_186:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x9, [sp, #24]                   ; 8-byte Reload
Lloh308:
	adrp	x8, l_.str.15@PAGE
Lloh309:
	add	x8, x8, l_.str.15@PAGEOFF
Lloh310:
	adrp	x1, l_.str.26@PAGE
Lloh311:
	add	x1, x1, l_.str.26@PAGEOFF
	cmp	w9, #0
	csel	x0, x8, x9, eq
	bl	_csstrcmp
	ldr	x24, [sp, #80]                  ; 8-byte Reload
	cbnz	w0, LBB15_197
; %bb.187:                              ;   in Loop: Header=BB15_69 Depth=1
	add	x8, sp, #864
	sub	x0, x29, #144
Lloh312:
	adrp	x1, l_.str.27@PAGE
Lloh313:
	add	x1, x1, l_.str.27@PAGEOFF
	ldur	q0, [x8, #8]
	ldur	q1, [x8, #24]
	ldur	q2, [x8, #40]
	sub	x8, x29, #144
	stp	q0, q1, [x8]
	str	q2, [x8, #32]
	add	x8, sp, #600
	bl	_toml_get
	ldr	w8, [sp, #600]
	cbz	w8, LBB15_193
; %bb.188:                              ;   in Loop: Header=BB15_69 Depth=1
	cmp	w8, #1
	b.ne	LBB15_194
; %bb.189:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w25, [sp, #628]
	ldr	w1, [sp, #624]
	tbz	w25, #31, LBB15_191
; %bb.190:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x1
	mov	x20, x1
	bl	_csstrlen
	mov	x1, x20
	mov	w25, w0
LBB15_191:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh314:
	adrp	x8, _overlay_tree@PAGE+103948
	add	w20, w25, #1
Lloh315:
	ldr	w8, [x8, _overlay_tree@PAGEOFF+103948]
	add	w9, w20, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB15_195
; %bb.192:                              ;   in Loop: Header=BB15_69 Depth=1
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x28, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB15_196
LBB15_193:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x28, xzr
	b	LBB15_196
LBB15_194:                              ;   in Loop: Header=BB15_69 Depth=1
	ldur	w8, [x29, #-148]
Lloh316:
	adrp	x9, l_.str.37@PAGE
Lloh317:
	add	x9, x9, l_.str.37@PAGEOFF
	mov	x28, xzr
	cmp	w8, #0
	csel	x8, x9, x8, eq
	stur	w8, [x29, #-148]
	b	LBB15_196
LBB15_195:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh318:
	adrp	x21, _overlay_tree@PAGE
Lloh319:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	add	x28, x8, x9
	mov	w2, w25
	mov	x0, x28
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x28, w25, sxtw]
	movk	w9, #1, lsl #16
	ldr	w8, [x21, x9]
	add	w8, w8, w20
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
LBB15_196:                              ;   in Loop: Header=BB15_69 Depth=1
	str	w28, [x27, #8]
	ldr	x28, [sp, #64]                  ; 8-byte Reload
LBB15_197:                              ;   in Loop: Header=BB15_69 Depth=1
	add	x0, sp, #600
	add	x1, sp, #864
	mov	w2, #264                        ; =0x108
	bl	_memcpy
	add	x0, sp, #600
	bl	_toml_free
	mov	x0, x26
	bl	_free
	ldur	w8, [x29, #-148]
	ldr	w25, [sp, #76]                  ; 4-byte Reload
	ldr	w20, [sp, #52]                  ; 4-byte Reload
	cbnz	w8, LBB15_206
; %bb.198:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w8, [x27, #4]
	cbz	w8, LBB15_205
; %bb.199:                              ;   in Loop: Header=BB15_69 Depth=1
	ldrb	w8, [x8]
	cbz	w8, LBB15_205
; %bb.200:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x26, [sp, #24]                  ; 8-byte Reload
	cbz	w26, LBB15_208
; %bb.201:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x26
Lloh320:
	adrp	x1, l_.str.22@PAGE
Lloh321:
	add	x1, x1, l_.str.22@PAGEOFF
	bl	_csstrcmp
	cbz	w0, LBB15_209
; %bb.202:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x26
Lloh322:
	adrp	x1, l_.str.26@PAGE
Lloh323:
	add	x1, x1, l_.str.26@PAGEOFF
	bl	_csstrcmp
	cbz	w0, LBB15_211
; %bb.203:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	x0, x26
Lloh324:
	adrp	x1, l_.str.33@PAGE
Lloh325:
	add	x1, x1, l_.str.33@PAGEOFF
	bl	_csstrcmp
Lloh326:
	adrp	x8, l_.str.35@PAGE
Lloh327:
	add	x8, x8, l_.str.35@PAGEOFF
	cbz	w0, LBB15_215
LBB15_204:                              ;   in Loop: Header=BB15_69 Depth=1
	stur	w8, [x29, #-148]
	b	LBB15_206
LBB15_205:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh328:
	adrp	x8, l_.str.28@PAGE
Lloh329:
	add	x8, x8, l_.str.28@PAGEOFF
LBB15_206:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	w9, #4                          ; =0x4
	str	w8, [x27, #40]
	mov	w0, #2                          ; =0x2
Lloh330:
	adrp	x1, l_.str.36@PAGE
Lloh331:
	add	x1, x1, l_.str.36@PAGEOFF
	str	w8, [sp, #4]
	add	x8, sp, #88
	strh	w9, [x27]
	str	w8, [sp]
	bl	_error
LBB15_207:                              ;   in Loop: Header=BB15_69 Depth=1
	add	w25, w25, #1
	str	w27, [x21, w20, sxtw #2]
	b	LBB15_68
LBB15_208:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh332:
	adrp	x8, l_.str.29@PAGE
Lloh333:
	add	x8, x8, l_.str.29@PAGEOFF
	b	LBB15_206
LBB15_209:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w8, [x27, #8]
	strh	wzr, [x27]
	cbnz	w8, LBB15_218
; %bb.210:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh334:
	adrp	x8, l_.str.30@PAGE
Lloh335:
	add	x8, x8, l_.str.30@PAGEOFF
	b	LBB15_206
LBB15_211:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w8, [x27, #8]
	mov	w9, #1                          ; =0x1
	strh	w9, [x27]
	cbz	w8, LBB15_219
; %bb.212:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w8, [x27, #12]
	cbz	w8, LBB15_221
; %bb.213:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x1, [sp, #16]                   ; 8-byte Reload
	cbnz	w1, LBB15_217
; %bb.214:                              ;   in Loop: Header=BB15_69 Depth=1
	mov	w8, #9                          ; =0x9
	strh	w8, [x27, #2]
	b	LBB15_218
LBB15_215:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	w8, [x27, #8]
	mov	w9, #2                          ; =0x2
	strh	w9, [x27]
	cbz	w8, LBB15_222
; %bb.216:                              ;   in Loop: Header=BB15_69 Depth=1
	ldr	x1, [sp, #16]                   ; 8-byte Reload
	cbz	w1, LBB15_223
LBB15_217:                              ;   in Loop: Header=BB15_69 Depth=1
	sub	x2, x29, #148
	mov	x0, x27
	bl	_overlay_file_state
LBB15_218:                              ;   in Loop: Header=BB15_69 Depth=1
	ldur	w8, [x29, #-148]
	cbnz	w8, LBB15_206
	b	LBB15_207
LBB15_219:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh336:
	adrp	x8, l_.str.31@PAGE
Lloh337:
	add	x8, x8, l_.str.31@PAGEOFF
	b	LBB15_206
LBB15_220:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh338:
	adrp	x21, _overlay_tree@PAGE
Lloh339:
	add	x21, x21, _overlay_tree@PAGEOFF
	add	x8, x21, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	add	x28, x8, x9
	mov	x1, x24
	mov	x0, x28
	mov	w2, w25
	bl	_csmemcpy
	mov	w9, #38412                      ; =0x960c
	strb	wzr, [x28, w25, sxtw]
	movk	w9, #1, lsl #16
	ldr	w8, [x21, x9]
	add	w8, w8, w20
	str	w8, [x21, x9]
	ldr	x21, [sp, #56]                  ; 8-byte Reload
	b	LBB15_126
LBB15_221:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh340:
	adrp	x8, l_.str.32@PAGE
Lloh341:
	add	x8, x8, l_.str.32@PAGEOFF
	b	LBB15_204
LBB15_222:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh342:
	adrp	x8, l_.str.30@PAGE
Lloh343:
	add	x8, x8, l_.str.30@PAGEOFF
	stur	w8, [x29, #-148]
	b	LBB15_206
LBB15_223:                              ;   in Loop: Header=BB15_69 Depth=1
Lloh344:
	adrp	x8, l_.str.34@PAGE
Lloh345:
	add	x8, x8, l_.str.34@PAGEOFF
	stur	w8, [x29, #-148]
	b	LBB15_206
LBB15_224:
	mov	w8, #1                          ; =0x1
	adrp	x9, _overlay_tree@PAGE+103957
	strb	w8, [x9, _overlay_tree@PAGEOFF+103957]
	b	LBB15_227
LBB15_225:
	mov	w8, #1                          ; =0x1
	adrp	x9, _overlay_tree@PAGE+103957
	strb	w8, [x9, _overlay_tree@PAGEOFF+103957]
LBB15_226:
	str	wzr, [x21, w26, sxtw #2]
LBB15_227:
	ldr	x20, [sp, #40]                  ; 8-byte Reload
	ldr	x24, [sp, #80]                  ; 8-byte Reload
	b	LBB15_56
	.loh AdrpAdd	Lloh208, Lloh209
	.loh AdrpAdd	Lloh210, Lloh211
	.loh AdrpAdd	Lloh212, Lloh213
	.loh AdrpAdd	Lloh214, Lloh215
	.loh AdrpAdd	Lloh216, Lloh217
	.loh AdrpLdr	Lloh218, Lloh219
	.loh AdrpAdd	Lloh220, Lloh221
	.loh AdrpAdd	Lloh222, Lloh223
	.loh AdrpAdd	Lloh224, Lloh225
	.loh AdrpAdd	Lloh226, Lloh227
	.loh AdrpAdd	Lloh228, Lloh229
	.loh AdrpAdd	Lloh230, Lloh231
	.loh AdrpAdd	Lloh232, Lloh233
	.loh AdrpAdd	Lloh234, Lloh235
	.loh AdrpAdd	Lloh236, Lloh237
	.loh AdrpAdd	Lloh238, Lloh239
	.loh AdrpAdd	Lloh240, Lloh241
	.loh AdrpLdr	Lloh242, Lloh243
	.loh AdrpAdd	Lloh244, Lloh245
	.loh AdrpAdd	Lloh246, Lloh247
	.loh AdrpLdr	Lloh248, Lloh249
	.loh AdrpAdd	Lloh250, Lloh251
	.loh AdrpAdd	Lloh252, Lloh253
	.loh AdrpLdr	Lloh254, Lloh255
	.loh AdrpLdr	Lloh256, Lloh257
	.loh AdrpAdd	Lloh258, Lloh259
	.loh AdrpAdd	Lloh260, Lloh261
	.loh AdrpAdd	Lloh262, Lloh263
	.loh AdrpAdd	Lloh264, Lloh265
	.loh AdrpAdd	Lloh266, Lloh267
	.loh AdrpLdr	Lloh268, Lloh269
	.loh AdrpAdd	Lloh270, Lloh271
	.loh AdrpAdd	Lloh272, Lloh273
	.loh AdrpAdd	Lloh274, Lloh275
	.loh AdrpLdr	Lloh276, Lloh277
	.loh AdrpAdd	Lloh278, Lloh279
	.loh AdrpAdd	Lloh280, Lloh281
	.loh AdrpAdd	Lloh282, Lloh283
	.loh AdrpLdr	Lloh284, Lloh285
	.loh AdrpAdd	Lloh286, Lloh287
	.loh AdrpAdd	Lloh288, Lloh289
	.loh AdrpAdd	Lloh290, Lloh291
	.loh AdrpLdr	Lloh292, Lloh293
	.loh AdrpAdd	Lloh294, Lloh295
	.loh AdrpAdd	Lloh298, Lloh299
	.loh AdrpAdd	Lloh296, Lloh297
	.loh AdrpAdd	Lloh300, Lloh301
	.loh AdrpLdr	Lloh302, Lloh303
	.loh AdrpAdd	Lloh304, Lloh305
	.loh AdrpAdd	Lloh306, Lloh307
	.loh AdrpAdd	Lloh310, Lloh311
	.loh AdrpAdd	Lloh308, Lloh309
	.loh AdrpAdd	Lloh312, Lloh313
	.loh AdrpLdr	Lloh314, Lloh315
	.loh AdrpAdd	Lloh316, Lloh317
	.loh AdrpAdd	Lloh318, Lloh319
	.loh AdrpAdd	Lloh320, Lloh321
	.loh AdrpAdd	Lloh322, Lloh323
	.loh AdrpAdd	Lloh326, Lloh327
	.loh AdrpAdd	Lloh324, Lloh325
	.loh AdrpAdd	Lloh328, Lloh329
	.loh AdrpAdd	Lloh330, Lloh331
	.loh AdrpAdd	Lloh332, Lloh333
	.loh AdrpAdd	Lloh334, Lloh335
	.loh AdrpAdd	Lloh336, Lloh337
	.loh AdrpAdd	Lloh338, Lloh339
	.loh AdrpAdd	Lloh340, Lloh341
	.loh AdrpAdd	Lloh342, Lloh343
	.loh AdrpAdd	Lloh344, Lloh345
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_compare_names
_overlay_compare_names:                 ; @overlay_compare_names
; %bb.0:
	ldrb	w9, [x0]
	cbz	w9, LBB16_5
; %bb.1:
	add	w8, w0, #1
	.p2align	4, , 8
LBB16_2:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w10, [x1], #1
	cbz	w10, LBB16_6
; %bb.3:                                ;   in Loop: Header=BB16_2 Depth=1
	sub	w11, w9, #65
	add	w12, w9, #32
	cmp	w11, #26
	sub	w11, w10, #65
	csel	w9, w12, w9, lo
	add	w12, w10, #32
	cmp	w11, #26
	csel	w10, w12, w10, lo
	cmp	w9, w10
	b.ne	LBB16_7
; %bb.4:                                ;   in Loop: Header=BB16_2 Depth=1
	ldrb	w9, [x8]
	add	w8, w8, #1
	cbnz	w9, LBB16_2
LBB16_5:
	ldrb	w8, [x1]
	cmp	w8, #0
	csetm	w0, ne
	ret
LBB16_6:
	mov	w0, #1                          ; =0x1
	ret
LBB16_7:
	sxtb	w8, w9
	cmp	w8, w10, sxtb
	mov	w8, #-1                         ; =0xffffffff
	cneg	w0, w8, ge
	ret
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_compare_entries
_overlay_compare_entries:               ; @overlay_compare_entries
; %bb.0:
	ldr	w9, [x0]
Lloh346:
	adrp	x8, l_.str.15@PAGE
Lloh347:
	add	x8, x8, l_.str.15@PAGEOFF
	ldr	w10, [x1]
	ldr	w9, [x9, #4]
	ldr	w11, [x10, #4]
	cmp	w9, #0
	csel	x9, x8, x9, eq
	cmp	w11, #0
	csel	x8, x8, x11, eq
	ldrb	w10, [x9]
	cbz	w10, LBB17_5
; %bb.1:
	add	w9, w9, #1
	.p2align	4, , 8
LBB17_2:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w11, [x8], #1
	cbz	w11, LBB17_6
; %bb.3:                                ;   in Loop: Header=BB17_2 Depth=1
	sub	w12, w10, #65
	add	w13, w10, #32
	cmp	w12, #26
	sub	w12, w11, #65
	csel	w10, w13, w10, lo
	add	w13, w11, #32
	cmp	w12, #26
	csel	w11, w13, w11, lo
	cmp	w10, w11
	b.ne	LBB17_7
; %bb.4:                                ;   in Loop: Header=BB17_2 Depth=1
	ldrb	w10, [x9]
	add	w9, w9, #1
	cbnz	w10, LBB17_2
LBB17_5:
	ldrb	w8, [x8]
	cmp	w8, #0
	csetm	w0, ne
	ret
LBB17_6:
	mov	w0, #1                          ; =0x1
	ret
LBB17_7:
	sxtb	w8, w10
	cmp	w8, w11, sxtb
	mov	w8, #-1                         ; =0xffffffff
	cneg	w0, w8, ge
	ret
	.loh AdrpAdd	Lloh346, Lloh347
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_file_state
_overlay_file_state:                    ; @overlay_file_state
; %bb.0:
	sub	sp, sp, #352
	stp	x22, x21, [sp, #304]            ; 16-byte Folded Spill
	mov	x22, x1
	stp	x20, x19, [sp, #320]            ; 16-byte Folded Spill
	mov	x20, x0
Lloh348:
	adrp	x1, l_.str.38@PAGE
Lloh349:
	add	x1, x1, l_.str.38@PAGEOFF
	mov	x0, x22
	stp	x28, x27, [sp, #256]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #272]            ; 16-byte Folded Spill
	mov	x19, x2
	stp	x24, x23, [sp, #288]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #336]            ; 16-byte Folded Spill
	add	x29, sp, #336
	bl	_csstrcmp
	cbz	w0, LBB18_5
; %bb.1:
Lloh350:
	adrp	x1, l_.str.39@PAGE
Lloh351:
	add	x1, x1, l_.str.39@PAGEOFF
	mov	x0, x22
	mov	w2, #6                          ; =0x6
	bl	_csstrncmp
	cbz	w0, LBB18_8
; %bb.2:
Lloh352:
	adrp	x1, l_.str.41@PAGE
Lloh353:
	add	x1, x1, l_.str.41@PAGEOFF
	mov	x0, x22
	mov	w2, #7                          ; =0x7
	bl	_csstrncmp
	cbz	w0, LBB18_6
; %bb.3:
Lloh354:
	adrp	x1, l_.str.42@PAGE
Lloh355:
	add	x1, x1, l_.str.42@PAGEOFF
	mov	x0, x22
	mov	w2, #7                          ; =0x7
	bl	_csstrncmp
	cbz	w0, LBB18_6
; %bb.4:
Lloh356:
	adrp	x8, l_.str.46@PAGE
Lloh357:
	add	x8, x8, l_.str.46@PAGEOFF
	b	LBB18_13
LBB18_5:
	mov	w8, #9                          ; =0x9
	strh	w8, [x20, #2]
	b	LBB18_14
LBB18_6:
	ldrb	w24, [x22], #7
	mov	x0, x22
	mov	w1, #61                         ; =0x3d
	bl	_strchr
	mov	x21, x0
	cbz	w21, LBB18_10
; %bb.7:
	sub	w23, w21, w22
	b	LBB18_11
LBB18_8:
	mov	w8, #8                          ; =0x8
	add	x0, x22, #6
	strh	w8, [x20, #2]
	bl	_atof
	mov	x8, #3931642474694443008        ; =0x3690000000000000
	fcvt	s2, d0
	fmov	d1, x8
	str	s2, [x20, #20]
	fcmp	d0, d1
	b.hi	LBB18_14
; %bb.9:
Lloh358:
	adrp	x8, l_.str.40@PAGE
Lloh359:
	add	x8, x8, l_.str.40@PAGEOFF
	b	LBB18_13
LBB18_10:
	mov	x0, x22
	bl	_csstrlen
	mov	w23, w0
LBB18_11:
	sub	w8, w23, #128
	cmn	w8, #128
	b.hi	LBB18_15
; %bb.12:
Lloh360:
	adrp	x8, l_.str.43@PAGE
Lloh361:
	add	x8, x8, l_.str.43@PAGEOFF
LBB18_13:
	str	w8, [x19]
LBB18_14:
	ldp	x29, x30, [sp, #336]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #320]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #304]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #288]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #272]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #256]            ; 16-byte Folded Reload
	add	sp, sp, #352
	ret
LBB18_15:
	add	x0, sp, #128
	mov	x1, x22
	mov	w2, w23
	add	x22, sp, #128
	bl	_csmemcpy
	adrp	x26, _overlay_tree@PAGE+103948
	add	w27, w23, #1
	strb	wzr, [x22, w23, sxtw]
	ldr	w8, [x26, _overlay_tree@PAGEOFF+103948]
	add	w9, w8, w27
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB18_17
; %bb.16:
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	str	wzr, [x20, #16]
	b	LBB18_14
LBB18_17:
Lloh362:
	adrp	x25, _overlay_tree@PAGE
Lloh363:
	add	x25, x25, _overlay_tree@PAGEOFF
	add	x8, x25, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	add	x22, x8, x9
	add	x1, sp, #128
	mov	x0, x22
	mov	w2, w23
	bl	_csmemcpy
	mov	w8, #38412                      ; =0x960c
	strb	wzr, [x22, w23, sxtw]
	movk	w8, #1, lsl #16
	ldr	w9, [x25, x8]
	add	w9, w9, w27
	str	w9, [x25, x8]
	str	w22, [x20, #16]
	cbz	w22, LBB18_14
; %bb.18:
	cmp	w24, #103
	b.ne	LBB18_23
; %bb.19:
	cmp	w21, #0
	mov	w8, #3                          ; =0x3
	csinc	w8, w8, wzr, ne
	strh	w8, [x20, #2]
	cbz	w21, LBB18_21
; %bb.20:
	add	x0, x21, #1
	bl	_atof
	fcvt	s0, d0
	str	s0, [x20, #20]
LBB18_21:
	ldrb	w8, [x20, #29]
	cbz	w8, LBB18_26
; %bb.22:
	ldrh	w8, [x20, #30]
	b	LBB18_27
LBB18_23:
	mov	w8, #10                         ; =0xa
	strh	w8, [x20, #2]
	cbz	w21, LBB18_32
; %bb.24:
	add	x0, x21, #1
	bl	_csstrlen
	ldr	w8, [x26, _overlay_tree@PAGEOFF+103948]
	add	w24, w0, #1
	add	w9, w24, w8
	cmp	w9, #16, lsl #12                ; =65536
	b.le	LBB18_30
; %bb.25:
	adrp	x8, _overlay_tree@PAGE+103957
	mov	w9, #1                          ; =0x1
	mov	x22, xzr
	strb	w9, [x8, _overlay_tree@PAGEOFF+103957]
	b	LBB18_31
LBB18_26:
	mov	x0, x22
	bl	_hs_find_global_by_name
	and	w8, w0, #0x7fff
	cmn	w0, #1
	mov	w9, #1                          ; =0x1
	csinv	w8, w8, wzr, lt
	strb	w9, [x20, #29]
	strh	w8, [x20, #30]
LBB18_27:
	mov	w9, #65535                      ; =0xffff
	bics	wzr, w9, w8
	b.eq	LBB18_29
; %bb.28:
	sxth	w0, w8
	bl	_hs_global_external_get
	cbnz	w0, LBB18_14
LBB18_29:
Lloh364:
	adrp	x8, l_.str.44@PAGE
Lloh365:
	add	x8, x8, l_.str.44@PAGEOFF
	b	LBB18_13
LBB18_30:
	add	x8, x25, w8, sxtw
	mov	w9, #38410                      ; =0x960a
	mov	w23, w0
	add	x22, x8, x9
	add	x1, x21, #1
	mov	x0, x22
	mov	w2, w23
	bl	_csmemcpy
	mov	w8, #38412                      ; =0x960c
	strb	wzr, [x22, w23, sxtw]
	movk	w8, #1, lsl #16
	ldr	w9, [x25, x8]
	add	w9, w9, w24
	str	w9, [x25, x8]
LBB18_31:
	str	w22, [x20, #32]
LBB18_32:
	add	x0, sp, #128
	mov	x1, sp
	mov	w2, #128                        ; =0x80
	bl	_config_text
	cbnz	w0, LBB18_14
; %bb.33:
Lloh366:
	adrp	x8, l_.str.45@PAGE
Lloh367:
	add	x8, x8, l_.str.45@PAGEOFF
	b	LBB18_13
	.loh AdrpAdd	Lloh348, Lloh349
	.loh AdrpAdd	Lloh350, Lloh351
	.loh AdrpAdd	Lloh352, Lloh353
	.loh AdrpAdd	Lloh354, Lloh355
	.loh AdrpAdd	Lloh356, Lloh357
	.loh AdrpAdd	Lloh358, Lloh359
	.loh AdrpAdd	Lloh360, Lloh361
	.loh AdrpAdd	Lloh362, Lloh363
	.loh AdrpAdd	Lloh364, Lloh365
	.loh AdrpAdd	Lloh366, Lloh367
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_global_value
_overlay_global_value:                  ; @overlay_global_value
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	ldrb	w8, [x0, #29]
	mov	x19, x1
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	cbz	w8, LBB19_2
; %bb.1:
	ldrh	w8, [x0, #30]
	b	LBB19_6
LBB19_2:
	ldr	w8, [x0, #16]
	cbz	w8, LBB19_4
; %bb.3:
	mov	x20, x0
	mov	x0, x8
	bl	_hs_find_global_by_name
	mov	w8, w0
	mov	x0, x20
	b	LBB19_5
LBB19_4:
	mov	w8, #-1                         ; =0xffffffff
LBB19_5:
	tst	w8, #0x8000
	mov	w9, #1                          ; =0x1
	ccmn	w8, #1, #4, ne
	and	w8, w8, #0x7fff
	strb	w9, [x0, #29]
	csinv	w8, w8, wzr, ne
	strh	w8, [x0, #30]
LBB19_6:
	mov	w9, #65535                      ; =0xffff
	bics	wzr, w9, w8
	b.eq	LBB19_13
; %bb.7:
	sxth	w0, w8
	bl	_hs_global_external_get
	cbz	w0, LBB19_20
; %bb.8:
	ldr	w8, [x0, #8]
	cbz	w8, LBB19_13
; %bb.9:
	ldrh	w9, [x0, #4]
	mov	w0, wzr
	cmp	w9, #6
	b.gt	LBB19_14
; %bb.10:
	cmp	w9, #5
	b.eq	LBB19_17
; %bb.11:
	cmp	w9, #6
	b.ne	LBB19_20
; %bb.12:
	ldr	s0, [x8]
	b	LBB19_19
LBB19_13:
	mov	w0, wzr
	b	LBB19_20
LBB19_14:
	cmp	w9, #7
	b.eq	LBB19_18
; %bb.15:
	cmp	w9, #8
	b.ne	LBB19_20
; %bb.16:
	ldr	s0, [x8]
	scvtf	s0, s0
	b	LBB19_19
LBB19_17:
	fmov	s0, #1.00000000
	ldrb	w8, [x8]
	movi	d1, #0000000000000000
	cmp	w8, #0
	fcsel	s0, s1, s0, eq
	b	LBB19_19
LBB19_18:
	ldrsh	w8, [x8]
	scvtf	s0, w8
LBB19_19:
	mov	w0, #1                          ; =0x1
	str	s0, [x19]
LBB19_20:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
                                        ; -- End function
.zerofill __DATA,__bss,_overlay,224,2   ; @overlay
	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_menu_take_pad.changes
_overlay_menu_take_pad.changes:
	.long	4294967295                      ; 0xffffffff

_overlay_menu_take_pad.enabled:         ; @overlay_menu_take_pad.enabled
	.byte	1                               ; 0x1

.zerofill __DATA,__bss,_overlay_menu_take_pad.chat_combinations,4,0 ; @overlay_menu_take_pad.chat_combinations
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"game.overlay_menu"

	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @overlay_menu_draw.blue
_overlay_menu_draw.blue:
	.long	0x3f800000                      ; float 1
	.long	0x3e20a0a1                      ; float 0.156862751
	.long	0x3f169697                      ; float 0.588235319
	.long	0x3f800000                      ; float 1

	.p2align	2, 0x0                          ; @overlay_menu_draw.red
_overlay_menu_draw.red:
	.long	0x3f800000                      ; float 1
	.long	0x3f800000                      ; float 1
	.long	0x3e99999a                      ; float 0.300000012
	.long	0x3e99999a                      ; float 0.300000012

	.section	__TEXT,__cstring,cstring_literals
l_.str.1:                               ; @.str.1
	.asciz	"ui\\large_ui"

l_.str.2:                               ; @.str.2
	.asciz	"ui\\small_ui"

l_.str.3:                               ; @.str.3
	.asciz	"overlay menu: not drawn: no font"

l_.str.4:                               ; @.str.4
	.asciz	"OpenCE for Android"

l_.str.5:                               ; @.str.5
	.asciz	"ON"

l_.str.6:                               ; @.str.6
	.asciz	"OFF"

l_.str.7:                               ; @.str.7
	.asciz	"%s: malformed entry"

l_.str.8:                               ; @.str.8
	.asciz	"malformed entry: no label"

l_.str.9:                               ; @.str.9
	.asciz	"^"

l_.str.10:                              ; @.str.10
	.asciz	"v"

	.section	__TEXT,__ustring
	.p2align	1, 0x0                          ; @.str.11
l_.str.11:
	.short	37                              ; 0x25
	.short	97                              ; 0x61
	.short	45                              ; 0x2d
	.short	98                              ; 0x62
	.short	117                             ; 0x75
	.short	116                             ; 0x74
	.short	116                             ; 0x74
	.short	111                             ; 0x6f
	.short	110                             ; 0x6e
	.short	32                              ; 0x20
	.short	83                              ; 0x53
	.short	101                             ; 0x65
	.short	108                             ; 0x6c
	.short	101                             ; 0x65
	.short	99                              ; 0x63
	.short	116                             ; 0x74
	.short	32                              ; 0x20
	.short	32                              ; 0x20
	.short	32                              ; 0x20
	.short	37                              ; 0x25
	.short	98                              ; 0x62
	.short	45                              ; 0x2d
	.short	98                              ; 0x62
	.short	117                             ; 0x75
	.short	116                             ; 0x74
	.short	116                             ; 0x74
	.short	111                             ; 0x6f
	.short	110                             ; 0x6e
	.short	32                              ; 0x20
	.short	66                              ; 0x42
	.short	97                              ; 0x61
	.short	99                              ; 0x63
	.short	107                             ; 0x6b
	.short	0                               ; 0x0

.zerofill __DATA,__bss,_overlay_tree,103960,2 ; @overlay_tree
	.section	__TEXT,__cstring,cstring_literals
l_.str.12:                              ; @.str.12
	.asciz	"%s/overlay"

l_.str.13:                              ; @.str.13
	.asciz	"overlay menu: %s read: %d folders, %d of its own entries%s"

l_.str.14:                              ; @.str.14
	.asciz	" (more than fit were left out)"

l_.str.15:                              ; @.str.15
	.space	1

l_.str.16:                              ; @.str.16
	.asciz	"%s/%s"

l_.str.17:                              ; @.str.17
	.asciz	".toml"

l_.str.18:                              ; @.str.18
	.asciz	"it cannot be read"

l_.str.19:                              ; @.str.19
	.asciz	"it is not TOML"

l_.str.20:                              ; @.str.20
	.asciz	"label"

l_.str.21:                              ; @.str.21
	.asciz	"type"

l_.str.22:                              ; @.str.22
	.asciz	"command"

l_.str.23:                              ; @.str.23
	.asciz	"off"

l_.str.24:                              ; @.str.24
	.asciz	"state"

l_.str.25:                              ; @.str.25
	.asciz	"note"

l_.str.26:                              ; @.str.26
	.asciz	"toggle"

l_.str.27:                              ; @.str.27
	.asciz	"on"

l_.str.28:                              ; @.str.28
	.asciz	"no label"

l_.str.29:                              ; @.str.29
	.asciz	"no type (command, toggle or choice)"

l_.str.30:                              ; @.str.30
	.asciz	"no command"

l_.str.31:                              ; @.str.31
	.asciz	"no on"

l_.str.32:                              ; @.str.32
	.asciz	"no off"

l_.str.33:                              ; @.str.33
	.asciz	"choice"

l_.str.34:                              ; @.str.34
	.asciz	"no state (a choice shows which is chosen)"

l_.str.35:                              ; @.str.35
	.asciz	"a type not command, toggle or choice"

l_.str.36:                              ; @.str.36
	.asciz	"overlay menu: %s: a malformed entry: %s"

l_.str.37:                              ; @.str.37
	.asciz	"a value that is not a string in quotes"

l_.str.38:                              ; @.str.38
	.asciz	"remembered"

l_.str.39:                              ; @.str.39
	.asciz	"speed="

l_.str.40:                              ; @.str.40
	.asciz	"speed= is not a speed"

l_.str.41:                              ; @.str.41
	.asciz	"global:"

l_.str.42:                              ; @.str.42
	.asciz	"config:"

l_.str.43:                              ; @.str.43
	.asciz	"a state with no name"

l_.str.44:                              ; @.str.44
	.asciz	"no console global of that name"

l_.str.45:                              ; @.str.45
	.asciz	"no setting of that name"

l_.str.46:                              ; @.str.46
	.asciz	"a state not global:, config:, speed= or remembered"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_root
_overlay_root:
	.long	l_.str.4
	.short	7                               ; 0x7
	.space	2
	.long	_overlay_root_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.48:                              ; @.str.48
	.asciz	"Cheats"

l_.str.49:                              ; @.str.49
	.asciz	"Bots"

l_.str.50:                              ; @.str.50
	.asciz	"Tag Editor"

l_.str.51:                              ; @.str.51
	.asciz	"Game Speed"

l_.str.52:                              ; @.str.52
	.asciz	"HUD"

l_.str.53:                              ; @.str.53
	.asciz	"Camera"

l_.str.54:                              ; @.str.54
	.asciz	"System"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_root_entries
_overlay_root_entries:
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.48
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_cheats
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.49
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_bots
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	5                               ; 0x5
	.short	0                               ; 0x0
	.long	l_.str.50
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.51
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_speed
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.52
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_hud
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.53
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_camera
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.54
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_system
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_cheats
_overlay_cheats:
	.long	l_.str.48
	.short	12                              ; 0xc
	.space	2
	.long	_overlay_cheats_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.57:                              ; @.str.57
	.asciz	"God Mode"

l_.str.58:                              ; @.str.58
	.asciz	"cheat_deathless_player true"

l_.str.59:                              ; @.str.59
	.asciz	"cheat_deathless_player false"

l_.str.60:                              ; @.str.60
	.asciz	"cheat_deathless_player"

l_.str.61:                              ; @.str.61
	.asciz	"Omnipotent"

l_.str.62:                              ; @.str.62
	.asciz	"cheat_omnipotent true"

l_.str.63:                              ; @.str.63
	.asciz	"cheat_omnipotent false"

l_.str.64:                              ; @.str.64
	.asciz	"cheat_omnipotent"

l_.str.65:                              ; @.str.65
	.asciz	"Infinite Ammo"

l_.str.66:                              ; @.str.66
	.asciz	"cheat_infinite_ammo true"

l_.str.67:                              ; @.str.67
	.asciz	"cheat_infinite_ammo false"

l_.str.68:                              ; @.str.68
	.asciz	"cheat_infinite_ammo"

l_.str.69:                              ; @.str.69
	.asciz	"Bottomless Clip"

l_.str.70:                              ; @.str.70
	.asciz	"cheat_bottomless_clip true"

l_.str.71:                              ; @.str.71
	.asciz	"cheat_bottomless_clip false"

l_.str.72:                              ; @.str.72
	.asciz	"cheat_bottomless_clip"

l_.str.73:                              ; @.str.73
	.asciz	"Super Jump"

l_.str.74:                              ; @.str.74
	.asciz	"cheat_super_jump true"

l_.str.75:                              ; @.str.75
	.asciz	"cheat_super_jump false"

l_.str.76:                              ; @.str.76
	.asciz	"cheat_super_jump"

l_.str.77:                              ; @.str.77
	.asciz	"No Fall Damage"

l_.str.78:                              ; @.str.78
	.asciz	"cheat_jetpack true"

l_.str.79:                              ; @.str.79
	.asciz	"cheat_jetpack false"

l_.str.80:                              ; @.str.80
	.asciz	"cheat_jetpack"

l_.str.81:                              ; @.str.81
	.asciz	"Medusa Mode"

l_.str.82:                              ; @.str.82
	.asciz	"cheat_medusa true"

l_.str.83:                              ; @.str.83
	.asciz	"cheat_medusa false"

l_.str.84:                              ; @.str.84
	.asciz	"cheat_medusa"

l_.str.85:                              ; @.str.85
	.asciz	"Bump Possession"

l_.str.86:                              ; @.str.86
	.asciz	"cheat_bump_possession true"

l_.str.87:                              ; @.str.87
	.asciz	"cheat_bump_possession false"

l_.str.88:                              ; @.str.88
	.asciz	"cheat_bump_possession"

l_.str.89:                              ; @.str.89
	.asciz	"Easy Rider"

l_.str.90:                              ; @.str.90
	.asciz	"rider_ejection false"

l_.str.91:                              ; @.str.91
	.asciz	"rider_ejection true"

l_.str.92:                              ; @.str.92
	.asciz	"rider_ejection"

l_.str.93:                              ; @.str.93
	.asciz	"Spawn All Weapons"

l_.str.94:                              ; @.str.94
	.asciz	"cheat_all_weapons"

l_.str.95:                              ; @.str.95
	.asciz	"Spawn All Powerups"

l_.str.96:                              ; @.str.96
	.asciz	"cheat_all_powerups"

l_.str.97:                              ; @.str.97
	.asciz	"Spawn All Vehicles"

l_.str.98:                              ; @.str.98
	.asciz	"cheat_all_vehicles"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_cheats_entries
_overlay_cheats_entries:
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.57
	.long	l_.str.58
	.long	l_.str.59
	.long	l_.str.60
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.61
	.long	l_.str.62
	.long	l_.str.63
	.long	l_.str.64
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.65
	.long	l_.str.66
	.long	l_.str.67
	.long	l_.str.68
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.69
	.long	l_.str.70
	.long	l_.str.71
	.long	l_.str.72
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.73
	.long	l_.str.74
	.long	l_.str.75
	.long	l_.str.76
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.77
	.long	l_.str.78
	.long	l_.str.79
	.long	l_.str.80
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.81
	.long	l_.str.82
	.long	l_.str.83
	.long	l_.str.84
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.85
	.long	l_.str.86
	.long	l_.str.87
	.long	l_.str.88
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	2                               ; 0x2
	.long	l_.str.89
	.long	l_.str.90
	.long	l_.str.91
	.long	l_.str.92
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.93
	.long	l_.str.94
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.95
	.long	l_.str.96
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.97
	.long	l_.str.98
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_bots
_overlay_bots:
	.long	l_.str.49
	.short	5                               ; 0x5
	.space	2
	.long	_overlay_bots_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.101:                             ; @.str.101
	.asciz	"Add Bots"

l_.str.102:                             ; @.str.102
	.asciz	"Drop Bots"

l_.str.103:                             ; @.str.103
	.asciz	"Difficulty"

l_.str.104:                             ; @.str.104
	.asciz	"Vehicles"

l_.str.105:                             ; @.str.105
	.asciz	"config bots.vehicles 1"

l_.str.106:                             ; @.str.106
	.asciz	"config bots.vehicles 0"

l_.str.107:                             ; @.str.107
	.asciz	"bots.vehicles"

l_.str.108:                             ; @.str.108
	.asciz	"Routes"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_bots_entries
_overlay_bots_entries:
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.101
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_bots_add
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.102
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_bots_drop
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.103
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_bots_skill
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	5                               ; 0x5
	.long	l_.str.104
	.long	l_.str.105
	.long	l_.str.106
	.long	l_.str.107
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	3                               ; 0x3
	.short	0                               ; 0x0
	.long	l_.str.108
	.long	0
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	_overlay_bots_routes
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_bots_add
_overlay_bots_add:
	.long	l_.str.101
	.short	3                               ; 0x3
	.space	2
	.long	_overlay_bots_add_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.111:                             ; @.str.111
	.asciz	"Add Bot (Any Team)"

l_.str.112:                             ; @.str.112
	.asciz	"add_bot"

l_.str.113:                             ; @.str.113
	.asciz	"Add Bot (Blue Team)"

l_.str.114:                             ; @.str.114
	.asciz	"add_bot_blue"

l_.str.115:                             ; @.str.115
	.asciz	"Add Bot (Red Team)"

l_.str.116:                             ; @.str.116
	.asciz	"add_bot_red"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_bots_add_entries
_overlay_bots_add_entries:
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.111
	.long	l_.str.112
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.113
	.long	l_.str.114
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.115
	.long	l_.str.116
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_bots_drop
_overlay_bots_drop:
	.long	l_.str.102
	.short	3                               ; 0x3
	.space	2
	.long	_overlay_bots_drop_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.119:                             ; @.str.119
	.asciz	"Drop Bot (Any Team)"

l_.str.120:                             ; @.str.120
	.asciz	"drop_bot"

l_.str.121:                             ; @.str.121
	.asciz	"Drop Bot (Blue Team)"

l_.str.122:                             ; @.str.122
	.asciz	"drop_bot_blue"

l_.str.123:                             ; @.str.123
	.asciz	"Drop Bot (Red Team)"

l_.str.124:                             ; @.str.124
	.asciz	"drop_bot_red"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_bots_drop_entries
_overlay_bots_drop_entries:
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.119
	.long	l_.str.120
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.121
	.long	l_.str.122
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.123
	.long	l_.str.124
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_bots_skill
_overlay_bots_skill:
	.long	l_.str.103
	.short	7                               ; 0x7
	.space	2
	.long	_overlay_bots_skill_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.127:                             ; @.str.127
	.asciz	"Distributed"

l_.str.128:                             ; @.str.128
	.asciz	"config bots.skill distributed"

l_.str.129:                             ; @.str.129
	.asciz	"bots.skill"

l_.str.130:                             ; @.str.130
	.asciz	"distributed"

l_.str.131:                             ; @.str.131
	.asciz	"Recruit"

l_.str.132:                             ; @.str.132
	.asciz	"config bots.skill recruit"

l_.str.133:                             ; @.str.133
	.asciz	"recruit"

l_.str.134:                             ; @.str.134
	.asciz	"Easy"

l_.str.135:                             ; @.str.135
	.asciz	"config bots.skill easy"

l_.str.136:                             ; @.str.136
	.asciz	"easy"

l_.str.137:                             ; @.str.137
	.asciz	"Normal"

l_.str.138:                             ; @.str.138
	.asciz	"config bots.skill normal"

l_.str.139:                             ; @.str.139
	.asciz	"normal"

l_.str.140:                             ; @.str.140
	.asciz	"Heroic"

l_.str.141:                             ; @.str.141
	.asciz	"config bots.skill heroic"

l_.str.142:                             ; @.str.142
	.asciz	"heroic"

l_.str.143:                             ; @.str.143
	.asciz	"Veteran"

l_.str.144:                             ; @.str.144
	.asciz	"config bots.skill veteran"

l_.str.145:                             ; @.str.145
	.asciz	"veteran"

l_.str.146:                             ; @.str.146
	.asciz	"Legendary"

l_.str.147:                             ; @.str.147
	.asciz	"config bots.skill legendary"

l_.str.148:                             ; @.str.148
	.asciz	"legendary"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_bots_skill_entries
_overlay_bots_skill_entries:
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.127
	.long	l_.str.128
	.long	0
	.long	l_.str.129
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.130
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.131
	.long	l_.str.132
	.long	0
	.long	l_.str.129
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.133
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.134
	.long	l_.str.135
	.long	0
	.long	l_.str.129
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.136
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.137
	.long	l_.str.138
	.long	0
	.long	l_.str.129
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.139
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.140
	.long	l_.str.141
	.long	0
	.long	l_.str.129
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.142
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.143
	.long	l_.str.144
	.long	0
	.long	l_.str.129
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.145
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.146
	.long	l_.str.147
	.long	0
	.long	l_.str.129
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.148
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_bots_routes
_overlay_bots_routes:
	.long	l_.str.108
	.short	3                               ; 0x3
	.space	2
	.long	_overlay_bots_routes_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.151:                             ; @.str.151
	.asciz	"Direct"

l_.str.152:                             ; @.str.152
	.asciz	"config bots.routes direct"

l_.str.153:                             ; @.str.153
	.asciz	"bots.routes"

l_.str.154:                             ; @.str.154
	.asciz	"direct"

l_.str.155:                             ; @.str.155
	.asciz	"Lanes"

l_.str.156:                             ; @.str.156
	.asciz	"config bots.routes lanes"

l_.str.157:                             ; @.str.157
	.asciz	"lanes"

l_.str.158:                             ; @.str.158
	.asciz	"Mixed"

l_.str.159:                             ; @.str.159
	.asciz	"config bots.routes mixed"

l_.str.160:                             ; @.str.160
	.asciz	"mixed"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_bots_routes_entries
_overlay_bots_routes_entries:
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.151
	.long	l_.str.152
	.long	0
	.long	l_.str.153
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.154
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.155
	.long	l_.str.156
	.long	0
	.long	l_.str.153
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.157
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	6                               ; 0x6
	.long	l_.str.158
	.long	l_.str.159
	.long	0
	.long	l_.str.153
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	l_.str.160
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_speed
_overlay_speed:
	.long	l_.str.51
	.short	6                               ; 0x6
	.space	2
	.long	_overlay_speed_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.163:                             ; @.str.163
	.asciz	"1x (Normal)"

l_.str.164:                             ; @.str.164
	.asciz	"game_speed 1"

l_.str.165:                             ; @.str.165
	.asciz	"2x"

l_.str.166:                             ; @.str.166
	.asciz	"game_speed 2"

l_.str.167:                             ; @.str.167
	.asciz	"3x"

l_.str.168:                             ; @.str.168
	.asciz	"game_speed 3"

l_.str.169:                             ; @.str.169
	.asciz	"4x"

l_.str.170:                             ; @.str.170
	.asciz	"game_speed 4"

l_.str.171:                             ; @.str.171
	.asciz	"5x"

l_.str.172:                             ; @.str.172
	.asciz	"game_speed 5"

l_.str.173:                             ; @.str.173
	.asciz	"10x"

l_.str.174:                             ; @.str.174
	.asciz	"game_speed 10"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_speed_entries
_overlay_speed_entries:
	.short	2                               ; 0x2
	.short	8                               ; 0x8
	.long	l_.str.163
	.long	l_.str.164
	.long	0
	.long	0
	.long	0x3f800000                      ; float 1
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	8                               ; 0x8
	.long	l_.str.165
	.long	l_.str.166
	.long	0
	.long	0
	.long	0x40000000                      ; float 2
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	8                               ; 0x8
	.long	l_.str.167
	.long	l_.str.168
	.long	0
	.long	0
	.long	0x40400000                      ; float 3
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	8                               ; 0x8
	.long	l_.str.169
	.long	l_.str.170
	.long	0
	.long	0
	.long	0x40800000                      ; float 4
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	8                               ; 0x8
	.long	l_.str.171
	.long	l_.str.172
	.long	0
	.long	0
	.long	0x40a00000                      ; float 5
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	2                               ; 0x2
	.short	8                               ; 0x8
	.long	l_.str.173
	.long	l_.str.174
	.long	0
	.long	0
	.long	0x41200000                      ; float 10
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_hud
_overlay_hud:
	.long	l_.str.52
	.short	5                               ; 0x5
	.space	2
	.long	_overlay_hud_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.177:                             ; @.str.177
	.asciz	"HUD Visibility"

l_.str.178:                             ; @.str.178
	.asciz	"show_hud true"

l_.str.179:                             ; @.str.179
	.asciz	"show_hud false"

l_.str.180:                             ; @.str.180
	.asciz	"Crosshair"

l_.str.181:                             ; @.str.181
	.asciz	"hud_show_crosshair true"

l_.str.182:                             ; @.str.182
	.asciz	"hud_show_crosshair false"

l_.str.183:                             ; @.str.183
	.asciz	"Health Bar"

l_.str.184:                             ; @.str.184
	.asciz	"hud_show_health true"

l_.str.185:                             ; @.str.185
	.asciz	"hud_show_health false"

l_.str.186:                             ; @.str.186
	.asciz	"Shield Bar"

l_.str.187:                             ; @.str.187
	.asciz	"hud_show_shield true"

l_.str.188:                             ; @.str.188
	.asciz	"hud_show_shield false"

l_.str.189:                             ; @.str.189
	.asciz	"Motion Sensor"

l_.str.190:                             ; @.str.190
	.asciz	"hud_show_motion_sensor true"

l_.str.191:                             ; @.str.191
	.asciz	"hud_show_motion_sensor false"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_hud_entries
_overlay_hud_entries:
	.short	1                               ; 0x1
	.short	7                               ; 0x7
	.long	l_.str.177
	.long	l_.str.178
	.long	l_.str.179
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	9                               ; 0x9
	.long	l_.str.180
	.long	l_.str.181
	.long	l_.str.182
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	1                               ; 0x1
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	9                               ; 0x9
	.long	l_.str.183
	.long	l_.str.184
	.long	l_.str.185
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	1                               ; 0x1
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	9                               ; 0x9
	.long	l_.str.186
	.long	l_.str.187
	.long	l_.str.188
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	1                               ; 0x1
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	9                               ; 0x9
	.long	l_.str.189
	.long	l_.str.190
	.long	l_.str.191
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	1                               ; 0x1
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_camera
_overlay_camera:
	.long	l_.str.53
	.short	5                               ; 0x5
	.space	2
	.long	_overlay_camera_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.194:                             ; @.str.194
	.asciz	"Set Default Player Camera"

l_.str.195:                             ; @.str.195
	.asciz	"camera_control 0"

l_.str.196:                             ; @.str.196
	.asciz	"Set Cinematic Camera"

l_.str.197:                             ; @.str.197
	.asciz	"camera_control 1"

l_.str.198:                             ; @.str.198
	.asciz	"Load Debug Camera"

l_.str.199:                             ; @.str.199
	.asciz	"debug_camera_load"

l_.str.200:                             ; @.str.200
	.asciz	"Save Debug Camera"

l_.str.201:                             ; @.str.201
	.asciz	"debug_camera_save"

l_.str.202:                             ; @.str.202
	.asciz	"Teleport to Camera"

l_.str.203:                             ; @.str.203
	.asciz	"cheat_teleport_to_camera"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_camera_entries
_overlay_camera_entries:
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.194
	.long	l_.str.195
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.196
	.long	l_.str.197
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.198
	.long	l_.str.199
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.200
	.long	l_.str.201
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.202
	.long	l_.str.203
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0

	.p2align	2, 0x0                          ; @overlay_system
_overlay_system:
	.long	l_.str.54
	.short	14                              ; 0xe
	.space	2
	.long	_overlay_system_entries

	.section	__TEXT,__cstring,cstring_literals
l_.str.206:                             ; @.str.206
	.asciz	"Display Framerate"

l_.str.207:                             ; @.str.207
	.asciz	"display_framerate true"

l_.str.208:                             ; @.str.208
	.asciz	"display_framerate false"

l_.str.209:                             ; @.str.209
	.asciz	"display_framerate"

l_.str.210:                             ; @.str.210
	.asciz	"Show Resolution & FPS"

l_.str.211:                             ; @.str.211
	.asciz	"config debug.show_resolution true"

l_.str.212:                             ; @.str.212
	.asciz	"config debug.show_resolution false"

l_.str.213:                             ; @.str.213
	.asciz	"debug.show_resolution"

l_.str.214:                             ; @.str.214
	.asciz	"Detailed FPS"

l_.str.215:                             ; @.str.215
	.asciz	"rasterizer_stats 5"

l_.str.216:                             ; @.str.216
	.asciz	"rasterizer_stats 0"

l_.str.217:                             ; @.str.217
	.asciz	"rasterizer_stats"

l_.str.218:                             ; @.str.218
	.asciz	"Force Checkpoint"

l_.str.219:                             ; @.str.219
	.asciz	"game_save_totally_unsafe"

l_.str.220:                             ; @.str.220
	.asciz	"Revert to Last Checkpoint"

l_.str.221:                             ; @.str.221
	.asciz	"game_revert"

l_.str.222:                             ; @.str.222
	.asciz	"Wireframe Mode"

l_.str.223:                             ; @.str.223
	.asciz	"rasterizer_wireframe true"

l_.str.224:                             ; @.str.224
	.asciz	"rasterizer_wireframe false"

l_.str.225:                             ; @.str.225
	.asciz	"rasterizer_wireframe"

l_.str.226:                             ; @.str.226
	.asciz	"Environment Textures"

l_.str.227:                             ; @.str.227
	.asciz	"rasterizer_environment_diffuse_textures true"

l_.str.228:                             ; @.str.228
	.asciz	"rasterizer_environment_diffuse_textures false"

l_.str.229:                             ; @.str.229
	.asciz	"rasterizer_environment_diffuse_textures"

l_.str.230:                             ; @.str.230
	.asciz	"Atmospheric Fog"

l_.str.231:                             ; @.str.231
	.asciz	"rasterizer_fog_atmosphere true"

l_.str.232:                             ; @.str.232
	.asciz	"rasterizer_fog_atmosphere false"

l_.str.233:                             ; @.str.233
	.asciz	"rasterizer_fog_atmosphere"

l_.str.234:                             ; @.str.234
	.asciz	"Fog Plane"

l_.str.235:                             ; @.str.235
	.asciz	"rasterizer_fog_plane true"

l_.str.236:                             ; @.str.236
	.asciz	"rasterizer_fog_plane false"

l_.str.237:                             ; @.str.237
	.asciz	"rasterizer_fog_plane"

l_.str.238:                             ; @.str.238
	.asciz	"Environment Shadows"

l_.str.239:                             ; @.str.239
	.asciz	"rasterizer_environment_shadows true"

l_.str.240:                             ; @.str.240
	.asciz	"rasterizer_environment_shadows false"

l_.str.241:                             ; @.str.241
	.asciz	"rasterizer_environment_shadows"

l_.str.242:                             ; @.str.242
	.asciz	"Lens Flares"

l_.str.243:                             ; @.str.243
	.asciz	"rasterizer_lens_flares true"

l_.str.244:                             ; @.str.244
	.asciz	"rasterizer_lens_flares false"

l_.str.245:                             ; @.str.245
	.asciz	"rasterizer_lens_flares"

l_.str.246:                             ; @.str.246
	.asciz	"Screen Effects"

l_.str.247:                             ; @.str.247
	.asciz	"rasterizer_screen_effects true"

l_.str.248:                             ; @.str.248
	.asciz	"rasterizer_screen_effects false"

l_.str.249:                             ; @.str.249
	.asciz	"rasterizer_screen_effects"

l_.str.250:                             ; @.str.250
	.asciz	"Weather Particles"

l_.str.251:                             ; @.str.251
	.asciz	"weather true"

l_.str.252:                             ; @.str.252
	.asciz	"weather false"

l_.str.253:                             ; @.str.253
	.asciz	"weather"

l_.str.254:                             ; @.str.254
	.asciz	"Record Replays"

l_.str.255:                             ; @.str.255
	.asciz	"config network.record_replays true"

l_.str.256:                             ; @.str.256
	.asciz	"config network.record_replays false"

l_.str.257:                             ; @.str.257
	.asciz	"network.record_replays"

l_.str.258:                             ; @.str.258
	.asciz	"From the next network game"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @overlay_system_entries
_overlay_system_entries:
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.206
	.long	l_.str.207
	.long	l_.str.208
	.long	l_.str.209
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	4                               ; 0x4
	.long	l_.str.210
	.long	l_.str.211
	.long	l_.str.212
	.long	l_.str.213
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	3                               ; 0x3
	.long	l_.str.214
	.long	l_.str.215
	.long	l_.str.216
	.long	l_.str.217
	.long	0x40a00000                      ; float 5
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.218
	.long	l_.str.219
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.long	l_.str.220
	.long	l_.str.221
	.long	0
	.long	0
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.222
	.long	l_.str.223
	.long	l_.str.224
	.long	l_.str.225
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.226
	.long	l_.str.227
	.long	l_.str.228
	.long	l_.str.229
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.230
	.long	l_.str.231
	.long	l_.str.232
	.long	l_.str.233
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.234
	.long	l_.str.235
	.long	l_.str.236
	.long	l_.str.237
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.238
	.long	l_.str.239
	.long	l_.str.240
	.long	l_.str.241
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.242
	.long	l_.str.243
	.long	l_.str.244
	.long	l_.str.245
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.246
	.long	l_.str.247
	.long	l_.str.248
	.long	l_.str.249
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	l_.str.250
	.long	l_.str.251
	.long	l_.str.252
	.long	l_.str.253
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.short	0                               ; 0x0
	.space	2
	.long	0
	.short	1                               ; 0x1
	.short	4                               ; 0x4
	.long	l_.str.254
	.long	l_.str.255
	.long	l_.str.256
	.long	l_.str.257
	.long	0x00000000                      ; float 0
	.long	0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	65535                           ; 0xffff
	.long	0
	.long	0
	.long	0
	.long	0
	.long	l_.str.258
	.short	0                               ; 0x0
	.space	2
	.long	0

.zerofill __DATA,__bss,_overlay_editor,45196,2 ; @overlay_editor
	.section	__TEXT,__cstring,cstring_literals
l_.str.260:                             ; @.str.260
	.asciz	"%s"

l_.str.261:                             ; @.str.261
	.asciz	"%s: %s"

l_.str.262:                             ; @.str.262
	.asciz	"?"

l_.str.263:                             ; @.str.263
	.asciz	"%s: done"

l_.str.264:                             ; @.str.264
	.asciz	"not done"

l_.str.265:                             ; @.str.265
	.asciz	"overlay menu: %s (%s)"

l_.str.266:                             ; @.str.266
	.asciz	"config "

l_.str.267:                             ; @.str.267
	.asciz	" "

l_.str.268:                             ; @.str.268
	.asciz	"the console did not run it"

l_.str.269:                             ; @.str.269
	.asciz	"true"

.subsections_via_symbols
