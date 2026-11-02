	.watchos_version_min 2, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_network_chat_handle_config     ; -- Begin function network_chat_handle_config
	.p2align	4
_network_chat_handle_config:            ; @network_chat_handle_config
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	w20, w1
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	mov	x19, x0
	bl	_game_connection
	cmp	w0, #1
	ccmp	w20, #0, #4, eq
	b.eq	LBB0_2
; %bb.1:
	add	x0, sp, #12
	mov	x1, x19
	mov	w2, #4                          ; =0x4
	bl	_csmemcpy
	ldrb	w10, [sp, #12]
	adrp	x8, _chat_config.0@PAGE
	mov	w9, #1                          ; =0x1
	adrp	x11, _chat_config.1@PAGE
	strb	w9, [x8, _chat_config.0@PAGEOFF]
	strb	w10, [x11, _chat_config.1@PAGEOFF]
LBB0_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
                                        ; -- End function
	.globl	_network_chat_config_entry_size ; -- Begin function network_chat_config_entry_size
	.p2align	4
_network_chat_config_entry_size:        ; @network_chat_config_entry_size
; %bb.0:
	mov	w0, #4                          ; =0x4
	ret
                                        ; -- End function
	.globl	_network_chat_name_blocked      ; -- Begin function network_chat_name_blocked
	.p2align	4
_network_chat_name_blocked:             ; @network_chat_name_blocked
; %bb.0:
	sub	sp, sp, #160
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	mov	w20, w1
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	mov	x19, x0
	bl	_chat_filter_mode_now
	cmp	w0, #2
	b.ne	LBB2_6
; %bb.1:
	cmp	w20, #1
	b.lt	LBB2_7
; %bb.2:
	cmp	w20, #63
	mov	w9, #63                         ; =0x3f
	mov	w8, wzr
	csel	w9, w20, w9, lo
	mov	w10, #32                        ; =0x20
	add	x11, sp, #64
	.p2align	4, , 8
LBB2_3:                                 ; =>This Inner Loop Header: Depth=1
	add	w12, w19, w8, lsl #1
	ldrh	w12, [x12]
	cbz	w12, LBB2_8
; %bb.4:                                ;   in Loop: Header=BB2_3 Depth=1
	sub	w13, w12, #32
	cmp	w13, #95
	add	w13, w11, w8
	csel	w12, w12, w10, lo
	add	w8, w8, #1
	cmp	w9, w8
	strb	w12, [x13]
	b.ne	LBB2_3
; %bb.5:
	mov	w8, w9
	b	LBB2_8
LBB2_6:
	mov	w0, wzr
	b	LBB2_9
LBB2_7:
	mov	w8, wzr
LBB2_8:
	add	x9, sp, #64
	add	x0, sp, #64
	mov	x1, sp
	strb	wzr, [x9, w8, sxtw]
	bl	_chat_filter_marks
	cmp	w0, #0
	cset	w0, gt
LBB2_9:
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_filter_mode_now
_chat_filter_mode_now:                  ; @chat_filter_mode_now
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	bl	_halo_server_mode
	cbz	w0, LBB3_11
; %bb.1:
Lloh0:
	adrp	x0, l_.str.12@PAGE
Lloh1:
	add	x0, x0, l_.str.12@PAGEOFF
	bl	_config_string
	cbz	w0, LBB3_10
; %bb.2:
	mov	w8, wzr
Lloh2:
	adrp	x9, l_.str.13@PAGE
Lloh3:
	add	x9, x9, l_.str.13@PAGEOFF
	.p2align	4, , 8
LBB3_3:                                 ; =>This Inner Loop Header: Depth=1
	sxth	x10, w8
	ldrb	w12, [x0, x10]
	ldrb	w11, [x9, x10]
	sub	w10, w12, #65
	orr	w13, w12, #0x20
	cmp	w10, #26
	sub	w14, w11, #65
	csel	w10, w13, w12, lo
	orr	w13, w11, #0x20
	cmp	w14, #26
	csel	w11, w13, w11, lo
	cbz	w12, LBB3_5
; %bb.4:                                ;   in Loop: Header=BB3_3 Depth=1
	add	w8, w8, #1
	cmp	w10, w11
	b.eq	LBB3_3
LBB3_5:
	cmp	w10, w11
	b.eq	LBB3_12
; %bb.6:
	mov	w8, wzr
Lloh4:
	adrp	x9, l_.str.14@PAGE
Lloh5:
	add	x9, x9, l_.str.14@PAGEOFF
	.p2align	4, , 8
LBB3_7:                                 ; =>This Inner Loop Header: Depth=1
	sxth	x10, w8
	ldrb	w12, [x0, x10]
	ldrb	w11, [x9, x10]
	sub	w10, w12, #65
	orr	w13, w12, #0x20
	cmp	w10, #26
	sub	w14, w11, #65
	csel	w10, w13, w12, lo
	orr	w13, w11, #0x20
	cmp	w14, #26
	csel	w11, w13, w11, lo
	cbz	w12, LBB3_9
; %bb.8:                                ;   in Loop: Header=BB3_7 Depth=1
	add	w8, w8, #1
	cmp	w10, w11
	b.eq	LBB3_7
LBB3_9:
	cmp	w10, w11
	b.eq	LBB3_13
LBB3_10:
	mov	w0, wzr
LBB3_11:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB3_12:
	mov	w0, #1                          ; =0x1
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB3_13:
	mov	w0, #2                          ; =0x2
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_filter_marks
_chat_filter_marks:                     ; @chat_filter_marks
; %bb.0:
	sub	sp, sp, #192
	add	x9, sp, #16
	stp	x22, x21, [sp, #144]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #160]            ; 16-byte Folded Spill
	mov	x19, x1
	mov	w20, w9
	add	w8, w0, #7
	add	w9, w9, #16
	mov	w21, #15                        ; =0xf
	stp	x29, x30, [sp, #176]            ; 16-byte Folded Spill
	add	x29, sp, #176
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	add	w10, w8, w21
	sub	w11, w10, #22
	ldrb	w11, [x11]
	cbz	w11, LBB4_19
; %bb.2:                                ;   in Loop: Header=BB4_1 Depth=1
	sub	w10, w10, #21
	sub	w12, w9, #16
	ldrb	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB4_20
; %bb.3:                                ;   in Loop: Header=BB4_1 Depth=1
	add	w12, w8, w21
	sub	w13, w9, #14
	sub	w11, w12, #20
	strh	w10, [x13]
	ldrb	w11, [x11]
	cbz	w11, LBB4_21
; %bb.4:                                ;   in Loop: Header=BB4_1 Depth=1
	sub	w10, w12, #19
	sub	w12, w9, #12
	ldrb	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB4_22
; %bb.5:                                ;   in Loop: Header=BB4_1 Depth=1
	add	w12, w8, w21
	sub	w13, w9, #10
	sub	w11, w12, #18
	strh	w10, [x13]
	ldrb	w11, [x11]
	cbz	w11, LBB4_23
; %bb.6:                                ;   in Loop: Header=BB4_1 Depth=1
	sub	w10, w12, #17
	sub	w12, w9, #8
	ldrb	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB4_24
; %bb.7:                                ;   in Loop: Header=BB4_1 Depth=1
	add	w12, w8, w21
	sub	w13, w9, #6
	sub	w11, w12, #16
	strh	w10, [x13]
	ldrb	w11, [x11]
	cbz	w11, LBB4_25
; %bb.8:                                ;   in Loop: Header=BB4_1 Depth=1
	sub	w10, w12, #15
	sub	w12, w9, #4
	ldrb	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB4_26
; %bb.9:                                ;   in Loop: Header=BB4_1 Depth=1
	add	w12, w8, w21
	sub	w13, w9, #2
	sub	w11, w12, #14
	strh	w10, [x13]
	ldrb	w11, [x11]
	cbz	w11, LBB4_27
; %bb.10:                               ;   in Loop: Header=BB4_1 Depth=1
	sub	w10, w12, #13
	strh	w11, [x9]
	ldrb	w10, [x10]
	cbz	w10, LBB4_28
; %bb.11:                               ;   in Loop: Header=BB4_1 Depth=1
	add	w12, w8, w21
	add	w13, w9, #2
	sub	w11, w12, #12
	strh	w10, [x13]
	ldrb	w11, [x11]
	cbz	w11, LBB4_29
; %bb.12:                               ;   in Loop: Header=BB4_1 Depth=1
	sub	w10, w12, #11
	add	w12, w9, #4
	ldrb	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB4_30
; %bb.13:                               ;   in Loop: Header=BB4_1 Depth=1
	add	w12, w8, w21
	add	w13, w9, #6
	sub	w11, w12, #10
	strh	w10, [x13]
	ldrb	w11, [x11]
	cbz	w11, LBB4_31
; %bb.14:                               ;   in Loop: Header=BB4_1 Depth=1
	sub	w10, w12, #9
	add	w12, w9, #8
	ldrb	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB4_32
; %bb.15:                               ;   in Loop: Header=BB4_1 Depth=1
	add	w12, w8, w21
	add	w13, w9, #10
	sub	w11, w12, #8
	strh	w10, [x13]
	ldrb	w11, [x11]
	cbz	w11, LBB4_35
; %bb.16:                               ;   in Loop: Header=BB4_1 Depth=1
	sub	w10, w12, #7
	add	w12, w9, #12
	ldrb	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB4_33
; %bb.17:                               ;   in Loop: Header=BB4_1 Depth=1
	add	w11, w9, #14
	add	w21, w21, #16
	add	w9, w9, #32
	cmp	w21, #79
	strh	w10, [x11]
	b.ne	LBB4_1
; %bb.18:
	mov	w21, #64                        ; =0x40
	b	LBB4_34
LBB4_19:
	sub	w21, w21, #15
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_20:
	sub	w21, w21, #14
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_21:
	sub	w21, w21, #13
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_22:
	sub	w21, w21, #12
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_23:
	sub	w21, w21, #11
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_24:
	sub	w21, w21, #10
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_25:
	sub	w21, w21, #9
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_26:
	sub	w21, w21, #8
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_27:
	sub	w21, w21, #7
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_28:
	sub	w21, w21, #6
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_29:
	sub	w21, w21, #5
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_30:
	sub	w21, w21, #4
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_31:
	sub	w21, w21, #3
	cbnz	w21, LBB4_34
	b	LBB4_36
LBB4_32:
	sub	w21, w21, #2
LBB4_33:
	cbz	w21, LBB4_36
LBB4_34:
Lloh6:
	adrp	x0, l_.str.15@PAGE
Lloh7:
	add	x0, x0, l_.str.15@PAGEOFF
	bl	_config_string
	bl	_chat_filter_level
	strb	w0, [sp, #12]
Lloh8:
	adrp	x0, l_.str.16@PAGE
Lloh9:
	add	x0, x0, l_.str.16@PAGEOFF
	bl	_config_string
	bl	_chat_filter_level
	strb	w0, [sp, #13]
Lloh10:
	adrp	x0, l_.str.17@PAGE
Lloh11:
	add	x0, x0, l_.str.17@PAGEOFF
	bl	_config_string
	bl	_chat_filter_level
	strb	w0, [sp, #14]
	add	x3, sp, #12
	mov	x0, x20
	mov	w1, w21
	mov	w2, #1                          ; =0x1
	mov	x4, x19
	strb	wzr, [sp, #15]
	bl	_text_filter_censor
	b	LBB4_37
LBB4_35:
	sub	w21, w21, #1
	cbnz	w21, LBB4_34
LBB4_36:
	mov	w0, wzr
LBB4_37:
	ldp	x29, x30, [sp, #176]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #160]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #192
	ret
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
                                        ; -- End function
	.globl	_network_chat_host_mute_minutes ; -- Begin function network_chat_host_mute_minutes
	.p2align	4
_network_chat_host_mute_minutes:        ; @network_chat_host_mute_minutes
; %bb.0:
	sub	sp, sp, #80
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	mov	w19, w0
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB5_13
; %bb.1:
	mov	w0, w19
	bl	_distributed_player
	mov	x20, x0
	bl	_system_milliseconds
	cbz	w20, LBB5_14
; %bb.2:
	mov	x21, x20
	mov	w19, w0
	ldrh	w8, [x21, #4]!
	cbz	w8, LBB5_16
; %bb.3:
	ldrh	w8, [x20, #6]
	cbz	w8, LBB5_17
; %bb.4:
	ldrh	w8, [x20, #8]
	cbz	w8, LBB5_18
; %bb.5:
	ldrh	w8, [x20, #10]
	cbz	w8, LBB5_19
; %bb.6:
	ldrh	w8, [x20, #12]
	cbz	w8, LBB5_20
; %bb.7:
	ldrh	w8, [x20, #14]
	cbz	w8, LBB5_21
; %bb.8:
	ldrh	w8, [x20, #16]
	cbz	w8, LBB5_22
; %bb.9:
	ldrh	w8, [x20, #18]
	cbz	w8, LBB5_23
; %bb.10:
	ldrh	w8, [x20, #20]
	cbz	w8, LBB5_24
; %bb.11:
	ldrh	w8, [x20, #22]
	cbz	w8, LBB5_25
; %bb.12:
	ldrh	w8, [x20, #24]
	cmp	w8, #0
	mov	w8, #10                         ; =0xa
	cinc	w20, w8, ne
	b	LBB5_26
LBB5_13:
	bl	_system_milliseconds
LBB5_14:
	mov	w17, wzr
LBB5_15:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	sxth	w0, w17
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB5_16:
	mov	w20, wzr
	b	LBB5_28
LBB5_17:
	mov	w20, #1                         ; =0x1
	b	LBB5_26
LBB5_18:
	mov	w20, #2                         ; =0x2
	b	LBB5_26
LBB5_19:
	mov	w20, #3                         ; =0x3
	b	LBB5_26
LBB5_20:
	mov	w20, #4                         ; =0x4
	b	LBB5_26
LBB5_21:
	mov	w20, #5                         ; =0x5
	b	LBB5_26
LBB5_22:
	mov	w20, #6                         ; =0x6
	b	LBB5_26
LBB5_23:
	mov	w20, #7                         ; =0x7
	b	LBB5_26
LBB5_24:
	mov	w20, #8                         ; =0x8
	b	LBB5_26
LBB5_25:
	mov	w20, #9                         ; =0x9
LBB5_26:
	mov	w22, wzr
	add	x23, sp, #4
	.p2align	4, , 8
LBB5_27:                                ; =>This Inner Loop Header: Depth=1
	add	w8, w21, w22, lsl #1
	ldrh	w0, [x8]
	bl	_player_name_character_ascii
	add	w8, w23, w22
	add	w22, w22, #1
	cmp	w20, w22
	strb	w0, [x8]
	b.ne	LBB5_27
LBB5_28:
	add	x9, sp, #4
	mov	w13, #45683                     ; =0xb273
	mov	w8, wzr
	movk	w13, #17895, lsl #16
Lloh12:
	adrp	x14, _chat_mutes@PAGE
Lloh13:
	add	x14, x14, _chat_mutes@PAGEOFF
	strb	wzr, [x9, w20, uxtw]
	ldrb	w11, [sp, #4]
	sub	w10, w11, #65
	orr	w12, w11, #0x20
	cmp	w10, #26
	mov	w10, #24                        ; =0x18
	csel	w11, w12, w11, lo
	mov	w12, #59999                     ; =0xea5f
	b	LBB5_31
	.p2align	4, , 8
LBB5_29:                                ;   in Loop: Header=BB5_31 Depth=1
	strb	wzr, [x15, #24]
LBB5_30:                                ;   in Loop: Header=BB5_31 Depth=1
	add	w8, w8, #2
	cmp	w8, #128
	b.eq	LBB5_14
LBB5_31:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_36 Depth 2
                                        ;     Child Loop BB5_44 Depth 2
	smaddl	x15, w8, w10, x14
	ldrb	w16, [x15]
	cbz	w16, LBB5_39
; %bb.32:                               ;   in Loop: Header=BB5_31 Depth=1
	ldp	w16, w17, [x15, #16]
	sub	w16, w19, w16
	subs	w16, w17, w16
	b.ls	LBB5_38
; %bb.33:                               ;   in Loop: Header=BB5_31 Depth=1
	add	w16, w16, w12
	umull	x17, w16, w13
	ubfx	x16, x17, #46, #16
	cbz	w16, LBB5_39
; %bb.34:                               ;   in Loop: Header=BB5_31 Depth=1
	mov	x16, x15
	ldrb	w0, [x16, #1]!
	sub	w1, w0, #65
	orr	w2, w0, #0x20
	cmp	w1, #26
	csel	w1, w2, w0, lo
	cmp	w1, w11
	b.ne	LBB5_39
; %bb.35:                               ;   in Loop: Header=BB5_31 Depth=1
	mov	w1, wzr
	lsr	x17, x17, #46
	cbz	w0, LBB5_15
	.p2align	4, , 8
LBB5_36:                                ;   Parent Loop BB5_31 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w1, w1, #1
	sxth	x2, w1
	ldrb	w0, [x16, x2]
	ldrb	w2, [x9, x2]
	sub	w3, w0, #65
	orr	w4, w0, #0x20
	cmp	w3, #26
	sub	w3, w2, #65
	csel	w4, w4, w0, lo
	orr	w5, w2, #0x20
	cmp	w3, #26
	csel	w2, w5, w2, lo
	cmp	w4, w2
	b.ne	LBB5_39
; %bb.37:                               ;   in Loop: Header=BB5_36 Depth=2
	cbnz	w0, LBB5_36
	b	LBB5_15
	.p2align	4, , 8
LBB5_38:                                ;   in Loop: Header=BB5_31 Depth=1
	strb	wzr, [x15]
LBB5_39:                                ;   in Loop: Header=BB5_31 Depth=1
	ldrb	w16, [x15, #24]
	cbz	w16, LBB5_30
; %bb.40:                               ;   in Loop: Header=BB5_31 Depth=1
	ldp	w16, w17, [x15, #40]
	sub	w16, w19, w16
	subs	w16, w17, w16
	b.ls	LBB5_29
; %bb.41:                               ;   in Loop: Header=BB5_31 Depth=1
	add	w16, w16, w12
	umull	x17, w16, w13
	ubfx	x16, x17, #46, #16
	cbz	w16, LBB5_30
; %bb.42:                               ;   in Loop: Header=BB5_31 Depth=1
	ldrb	w16, [x15, #25]!
	sub	w0, w16, #65
	orr	w1, w16, #0x20
	cmp	w0, #26
	csel	w0, w1, w16, lo
	cmp	w0, w11
	b.ne	LBB5_30
; %bb.43:                               ;   in Loop: Header=BB5_31 Depth=1
	mov	w0, wzr
	lsr	x17, x17, #46
	.p2align	4, , 8
LBB5_44:                                ;   Parent Loop BB5_31 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cbz	w16, LBB5_46
; %bb.45:                               ;   in Loop: Header=BB5_44 Depth=2
	add	w0, w0, #1
	sxth	x1, w0
	ldrb	w16, [x15, x1]
	ldrb	w1, [x9, x1]
	sub	w2, w16, #65
	orr	w3, w16, #0x20
	cmp	w2, #26
	sub	w2, w1, #65
	csel	w3, w3, w16, lo
	orr	w4, w1, #0x20
	cmp	w2, #26
	csel	w1, w4, w1, lo
	cmp	w3, w1
	b.eq	LBB5_44
	b	LBB5_30
LBB5_46:
                                        ; kill: def $w17 killed $w17 killed $x17 def $x17
	b	LBB5_15
	.loh AdrpAdd	Lloh12, Lloh13
                                        ; -- End function
	.globl	_network_chat_host_mute         ; -- Begin function network_chat_host_mute
	.p2align	4
_network_chat_host_mute:                ; @network_chat_host_mute
; %bb.0:
	sub	sp, sp, #80
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	mov	w19, w1
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	mov	w20, w0
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB6_28
; %bb.1:
	mov	w0, w20
	bl	_distributed_player
	cbz	w0, LBB6_28
; %bb.2:
	mov	x20, x0
	ldrh	w8, [x20, #4]!
	cbz	w8, LBB6_13
; %bb.3:
	ldrh	w8, [x0, #6]
	cbz	w8, LBB6_14
; %bb.4:
	ldrh	w8, [x0, #8]
	cbz	w8, LBB6_15
; %bb.5:
	ldrh	w8, [x0, #10]
	cbz	w8, LBB6_16
; %bb.6:
	ldrh	w8, [x0, #12]
	cbz	w8, LBB6_17
; %bb.7:
	ldrh	w8, [x0, #14]
	cbz	w8, LBB6_18
; %bb.8:
	ldrh	w8, [x0, #16]
	cbz	w8, LBB6_19
; %bb.9:
	ldrh	w8, [x0, #18]
	cbz	w8, LBB6_20
; %bb.10:
	ldrh	w8, [x0, #20]
	cbz	w8, LBB6_21
; %bb.11:
	ldrh	w8, [x0, #22]
	cbz	w8, LBB6_22
; %bb.12:
	ldrh	w8, [x0, #24]
	cmp	w8, #0
	mov	w8, #10                         ; =0xa
	cinc	w21, w8, ne
	b	LBB6_23
LBB6_13:
	mov	w21, wzr
	b	LBB6_25
LBB6_14:
	mov	w21, #1                         ; =0x1
	b	LBB6_23
LBB6_15:
	mov	w21, #2                         ; =0x2
	b	LBB6_23
LBB6_16:
	mov	w21, #3                         ; =0x3
	b	LBB6_23
LBB6_17:
	mov	w21, #4                         ; =0x4
	b	LBB6_23
LBB6_18:
	mov	w21, #5                         ; =0x5
	b	LBB6_23
LBB6_19:
	mov	w21, #6                         ; =0x6
	b	LBB6_23
LBB6_20:
	mov	w21, #7                         ; =0x7
	b	LBB6_23
LBB6_21:
	mov	w21, #8                         ; =0x8
	b	LBB6_23
LBB6_22:
	mov	w21, #9                         ; =0x9
LBB6_23:
	mov	w22, wzr
	add	x23, sp, #4
	.p2align	4, , 8
LBB6_24:                                ; =>This Inner Loop Header: Depth=1
	add	w8, w20, w22, lsl #1
	ldrh	w0, [x8]
	bl	_player_name_character_ascii
	add	w8, w23, w22
	add	w22, w22, #1
	cmp	w21, w22
	strb	w0, [x8]
	b.ne	LBB6_24
LBB6_25:
	add	x8, sp, #4
	add	x0, sp, #4
	strb	wzr, [x8, w21, uxtw]
	cbz	w19, LBB6_27
; %bb.26:
	mov	w1, #20                         ; =0x14
	bl	_chat_host_mute_name
	b	LBB6_28
LBB6_27:
	bl	_chat_host_unmute_name
LBB6_28:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_host_mute_name
_chat_host_mute_name:                   ; @chat_host_mute_name
; %bb.0:
	stp	x28, x27, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	sub	sp, sp, #736
	mov	w20, w1
	mov	x19, x0
	bl	_system_milliseconds
	mov	w11, #45683                     ; =0xb273
	mov	w21, w0
	mov	w8, wzr
	mov	w9, #24                         ; =0x18
	mov	w10, #59999                     ; =0xea5f
	movk	w11, #17895, lsl #16
Lloh14:
	adrp	x12, _chat_mutes@PAGE
Lloh15:
	add	x12, x12, _chat_mutes@PAGEOFF
	b	LBB7_3
	.p2align	4, , 8
LBB7_1:                                 ;   in Loop: Header=BB7_3 Depth=1
	strb	wzr, [x13]
LBB7_2:                                 ;   in Loop: Header=BB7_3 Depth=1
	add	w8, w8, #2
	cmp	w8, #128
	b.eq	LBB7_24
LBB7_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_8 Depth 2
                                        ;     Child Loop BB7_16 Depth 2
	smaddl	x22, w8, w9, x12
	ldrb	w13, [x22]
	cbz	w13, LBB7_11
; %bb.4:                                ;   in Loop: Header=BB7_3 Depth=1
	ldp	w13, w14, [x22, #16]
	sub	w13, w21, w13
	subs	w13, w14, w13
	b.ls	LBB7_10
; %bb.5:                                ;   in Loop: Header=BB7_3 Depth=1
	add	w13, w13, w10
	umull	x13, w13, w11
	ubfx	x13, x13, #46, #16
	cbz	w13, LBB7_11
; %bb.6:                                ;   in Loop: Header=BB7_3 Depth=1
	mov	x13, x22
	ldrb	w15, [x19]
	ldrb	w14, [x13, #1]!
	orr	w0, w15, #0x20
	sub	w16, w14, #65
	orr	w17, w14, #0x20
	cmp	w16, #26
	sub	w16, w15, #65
	csel	w17, w17, w14, lo
	cmp	w16, #26
	csel	w15, w0, w15, lo
	cmp	w17, w15
	b.ne	LBB7_11
; %bb.7:                                ;   in Loop: Header=BB7_3 Depth=1
	mov	w15, wzr
	cbz	w14, LBB7_19
	.p2align	4, , 8
LBB7_8:                                 ;   Parent Loop BB7_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w15, w15, #1
	sxth	x16, w15
	ldrb	w14, [x13, x16]
	ldrb	w16, [x19, x16]
	sub	w17, w14, #65
	orr	w0, w14, #0x20
	cmp	w17, #26
	sub	w17, w16, #65
	csel	w0, w0, w14, lo
	orr	w1, w16, #0x20
	cmp	w17, #26
	csel	w16, w1, w16, lo
	cmp	w0, w16
	b.ne	LBB7_11
; %bb.9:                                ;   in Loop: Header=BB7_8 Depth=2
	cbnz	w14, LBB7_8
	b	LBB7_19
	.p2align	4, , 8
LBB7_10:                                ;   in Loop: Header=BB7_3 Depth=1
	strb	wzr, [x22]
LBB7_11:                                ;   in Loop: Header=BB7_3 Depth=1
	mov	x13, x22
	ldrb	w14, [x13, #24]!
	cbz	w14, LBB7_2
; %bb.12:                               ;   in Loop: Header=BB7_3 Depth=1
	ldp	w14, w15, [x22, #40]
	sub	w14, w21, w14
	subs	w14, w15, w14
	b.ls	LBB7_1
; %bb.13:                               ;   in Loop: Header=BB7_3 Depth=1
	add	w14, w14, w10
	umull	x14, w14, w11
	ubfx	x14, x14, #46, #16
	cbz	w14, LBB7_2
; %bb.14:                               ;   in Loop: Header=BB7_3 Depth=1
	ldrb	w14, [x22, #25]!
	ldrb	w15, [x19]
	sub	w16, w14, #65
	orr	w17, w14, #0x20
	cmp	w16, #26
	sub	w16, w15, #65
	csel	w17, w17, w14, lo
	orr	w0, w15, #0x20
	cmp	w16, #26
	csel	w15, w0, w15, lo
	cmp	w17, w15
	b.ne	LBB7_2
; %bb.15:                               ;   in Loop: Header=BB7_3 Depth=1
	mov	w15, wzr
	.p2align	4, , 8
LBB7_16:                                ;   Parent Loop BB7_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cbz	w14, LBB7_18
; %bb.17:                               ;   in Loop: Header=BB7_16 Depth=2
	add	w15, w15, #1
	sxth	x16, w15
	ldrb	w14, [x22, x16]
	ldrb	w16, [x19, x16]
	sub	w17, w14, #65
	orr	w0, w14, #0x20
	cmp	w17, #26
	sub	w17, w16, #65
	csel	w0, w0, w14, lo
	orr	w1, w16, #0x20
	cmp	w17, #26
	csel	w16, w1, w16, lo
	cmp	w0, w16
	b.eq	LBB7_16
	b	LBB7_2
LBB7_18:
	mov	x22, x13
LBB7_19:
	mov	w8, #1                          ; =0x1
	add	x0, x22, #1
	mov	x1, x19
	mov	w2, #11                         ; =0xb
	strb	w8, [x22]
	bl	_csstrncpy
	mov	w8, #60000                      ; =0xea60
Lloh16:
	adrp	x9, l_.str.26@PAGE
Lloh17:
	add	x9, x9, l_.str.26@PAGEOFF
Lloh18:
	adrp	x10, l_.str.25@PAGE
Lloh19:
	add	x10, x10, l_.str.25@PAGEOFF
	mul	w8, w20, w8
	cmp	w20, #1
Lloh20:
	adrp	x2, l_.str.22@PAGE
Lloh21:
	add	x2, x2, l_.str.22@PAGEOFF
	csel	x9, x10, x9, eq
	add	x0, sp, #20
	mov	w1, #128                        ; =0x80
	strb	wzr, [x22, #12]
	stp	w21, w8, [x22, #16]
	stp	w20, w9, [sp, #4]
	str	w19, [sp]
	bl	_halo_linux_snprintf
	add	x0, sp, #148
	mov	w1, wzr
	mov	w2, #76                         ; =0x4c
	add	x19, sp, #148
	bl	_csmemset
	mov	w8, #4                          ; =0x4
	add	x0, x19, #12
	add	x1, sp, #20
	mov	w2, #63                         ; =0x3f
	strb	w8, [sp, #157]
	bl	_csstrncpy
	add	x0, sp, #224
	mov	w1, #128                        ; =0x80
	bl	_distributed_client_machines
	cmp	w0, #1
	b.lt	LBB7_22
; %bb.20:
	mov	w19, w0
	add	x20, sp, #224
	.p2align	4, , 8
LBB7_21:                                ; =>This Inner Loop Header: Depth=1
	ldr	w0, [x20]
	add	x1, sp, #148
	mov	w2, #88                         ; =0x58
	mov	w3, #1                          ; =0x1
	mov	w4, #76                         ; =0x4c
	bl	_distributed_send_to_machine_reliably
	add	w20, w20, #4
	subs	w19, w19, #1
	b.ne	LBB7_21
LBB7_22:
	add	x0, sp, #20
	bl	_chat_add_notice
	mov	w0, #1                          ; =0x1
LBB7_23:
	add	sp, sp, #736
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #64             ; 16-byte Folded Reload
	ret
LBB7_24:
	mov	w10, #45683                     ; =0xb273
	mov	w8, wzr
	mov	w9, #59999                      ; =0xea5f
	movk	w10, #17895, lsl #16
Lloh22:
	adrp	x22, _chat_mutes@PAGE
Lloh23:
	add	x22, x22, _chat_mutes@PAGEOFF
	.p2align	4, , 8
LBB7_25:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w11, [x22]
	cbz	w11, LBB7_19
; %bb.26:                               ;   in Loop: Header=BB7_25 Depth=1
	add	w11, w22, #16
	add	w12, w22, #20
	ldr	w11, [x11]
	ldr	w12, [x12]
	sub	w11, w21, w11
	subs	w11, w12, w11
	b.ls	LBB7_31
; %bb.27:                               ;   in Loop: Header=BB7_25 Depth=1
	add	w11, w11, w9
	add	w22, w22, #24
	umull	x11, w11, w10
	ubfx	x11, x11, #46, #16
	cbz	w11, LBB7_29
; %bb.28:                               ;   in Loop: Header=BB7_25 Depth=1
	add	w12, w8, #1
	cmp	w8, #127
	mov	w8, w12
	b.lo	LBB7_25
LBB7_29:
	sub	w8, w22, #24
	cmp	w11, #0
	csel	x22, xzr, x8, ne
	cbz	w11, LBB7_19
; %bb.30:
Lloh24:
	adrp	x0, l_.str.21@PAGE
Lloh25:
	add	x0, x0, l_.str.21@PAGEOFF
	bl	_chat_add_notice
	mov	w0, wzr
	b	LBB7_23
LBB7_31:
	strb	wzr, [x22]
	b	LBB7_19
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh24, Lloh25
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_host_unmute_name
_chat_host_unmute_name:                 ; @chat_host_unmute_name
; %bb.0:
	stp	x28, x27, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	sub	sp, sp, #720
	mov	x19, x0
	bl	_system_milliseconds
	mov	w11, #45683                     ; =0xb273
	mov	w8, wzr
	mov	w9, #24                         ; =0x18
	mov	w10, #59999                     ; =0xea5f
	movk	w11, #17895, lsl #16
Lloh26:
	adrp	x12, _chat_mutes@PAGE
Lloh27:
	add	x12, x12, _chat_mutes@PAGEOFF
	b	LBB8_3
	.p2align	4, , 8
LBB8_1:                                 ;   in Loop: Header=BB8_3 Depth=1
	strb	wzr, [x14]
LBB8_2:                                 ;   in Loop: Header=BB8_3 Depth=1
	add	w8, w8, #2
	cmp	w8, #128
	b.eq	LBB8_23
LBB8_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_8 Depth 2
                                        ;     Child Loop BB8_16 Depth 2
	smaddl	x13, w8, w9, x12
	ldrb	w14, [x13]
	cbz	w14, LBB8_11
; %bb.4:                                ;   in Loop: Header=BB8_3 Depth=1
	ldp	w14, w15, [x13, #16]
	sub	w14, w0, w14
	subs	w14, w15, w14
	b.ls	LBB8_10
; %bb.5:                                ;   in Loop: Header=BB8_3 Depth=1
	add	w14, w14, w10
	umull	x14, w14, w11
	ubfx	x14, x14, #46, #16
	cbz	w14, LBB8_11
; %bb.6:                                ;   in Loop: Header=BB8_3 Depth=1
	mov	x14, x13
	ldrb	w16, [x19]
	ldrb	w15, [x14, #1]!
	orr	w2, w16, #0x20
	sub	w17, w15, #65
	orr	w1, w15, #0x20
	cmp	w17, #26
	sub	w17, w16, #65
	csel	w1, w1, w15, lo
	cmp	w17, #26
	csel	w16, w2, w16, lo
	cmp	w1, w16
	b.ne	LBB8_11
; %bb.7:                                ;   in Loop: Header=BB8_3 Depth=1
	mov	w16, wzr
	cbz	w15, LBB8_19
	.p2align	4, , 8
LBB8_8:                                 ;   Parent Loop BB8_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w16, w16, #1
	sxth	x17, w16
	ldrb	w15, [x14, x17]
	ldrb	w17, [x19, x17]
	sub	w1, w15, #65
	orr	w2, w15, #0x20
	cmp	w1, #26
	sub	w1, w17, #65
	csel	w2, w2, w15, lo
	orr	w3, w17, #0x20
	cmp	w1, #26
	csel	w17, w3, w17, lo
	cmp	w2, w17
	b.ne	LBB8_11
; %bb.9:                                ;   in Loop: Header=BB8_8 Depth=2
	cbnz	w15, LBB8_8
	b	LBB8_19
	.p2align	4, , 8
LBB8_10:                                ;   in Loop: Header=BB8_3 Depth=1
	strb	wzr, [x13]
LBB8_11:                                ;   in Loop: Header=BB8_3 Depth=1
	mov	x14, x13
	ldrb	w15, [x14, #24]!
	cbz	w15, LBB8_2
; %bb.12:                               ;   in Loop: Header=BB8_3 Depth=1
	ldp	w15, w16, [x13, #40]
	sub	w15, w0, w15
	subs	w15, w16, w15
	b.ls	LBB8_1
; %bb.13:                               ;   in Loop: Header=BB8_3 Depth=1
	add	w15, w15, w10
	umull	x15, w15, w11
	ubfx	x15, x15, #46, #16
	cbz	w15, LBB8_2
; %bb.14:                               ;   in Loop: Header=BB8_3 Depth=1
	ldrb	w15, [x13, #25]!
	ldrb	w16, [x19]
	sub	w17, w15, #65
	orr	w1, w15, #0x20
	cmp	w17, #26
	sub	w17, w16, #65
	csel	w1, w1, w15, lo
	orr	w2, w16, #0x20
	cmp	w17, #26
	csel	w16, w2, w16, lo
	cmp	w1, w16
	b.ne	LBB8_2
; %bb.15:                               ;   in Loop: Header=BB8_3 Depth=1
	mov	w16, wzr
	.p2align	4, , 8
LBB8_16:                                ;   Parent Loop BB8_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cbz	w15, LBB8_18
; %bb.17:                               ;   in Loop: Header=BB8_16 Depth=2
	add	w16, w16, #1
	sxth	x17, w16
	ldrb	w15, [x13, x17]
	ldrb	w17, [x19, x17]
	sub	w1, w15, #65
	orr	w2, w15, #0x20
	cmp	w1, #26
	sub	w1, w17, #65
	csel	w2, w2, w15, lo
	orr	w3, w17, #0x20
	cmp	w1, #26
	csel	w17, w3, w17, lo
	cmp	w2, w17
	b.eq	LBB8_16
	b	LBB8_2
LBB8_18:
	mov	x13, x14
LBB8_19:
Lloh28:
	adrp	x2, l_.str.24@PAGE
Lloh29:
	add	x2, x2, l_.str.24@PAGEOFF
	add	x0, sp, #4
	mov	w1, #128                        ; =0x80
	strb	wzr, [x13]
	str	w19, [sp]
	bl	_halo_linux_snprintf
	add	x0, sp, #132
	mov	w1, wzr
	mov	w2, #76                         ; =0x4c
	add	x19, sp, #132
	bl	_csmemset
	mov	w8, #4                          ; =0x4
	add	x0, x19, #12
	add	x1, sp, #4
	mov	w2, #63                         ; =0x3f
	strb	w8, [sp, #141]
	bl	_csstrncpy
	add	x0, sp, #208
	mov	w1, #128                        ; =0x80
	bl	_distributed_client_machines
	cmp	w0, #1
	b.lt	LBB8_22
; %bb.20:
	mov	w19, w0
	add	x20, sp, #208
	.p2align	4, , 8
LBB8_21:                                ; =>This Inner Loop Header: Depth=1
	ldr	w0, [x20]
	add	x1, sp, #132
	mov	w2, #88                         ; =0x58
	mov	w3, #1                          ; =0x1
	mov	w4, #76                         ; =0x4c
	bl	_distributed_send_to_machine_reliably
	add	w20, w20, #4
	subs	w19, w19, #1
	b.ne	LBB8_21
LBB8_22:
	add	x0, sp, #4
	bl	_chat_add_notice
	mov	w0, #1                          ; =0x1
	b	LBB8_24
LBB8_23:
Lloh30:
	adrp	x2, l_.str.23@PAGE
Lloh31:
	add	x2, x2, l_.str.23@PAGEOFF
	add	x0, sp, #4
	mov	w1, #128                        ; =0x80
	str	w19, [sp]
	bl	_halo_linux_snprintf
	add	x0, sp, #4
	bl	_chat_add_notice
	mov	w0, wzr
LBB8_24:
	add	sp, sp, #720
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpAdd	Lloh30, Lloh31
                                        ; -- End function
	.globl	_network_chat_host_mute_named   ; -- Begin function network_chat_host_mute_named
	.p2align	4
_network_chat_host_mute_named:          ; @network_chat_host_mute_named
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	w21, w2
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	mov	w20, w1
	mov	x19, x0
	bl	_game_connection
	cmp	w0, #2
	ccmp	w19, #0, #4, eq
	b.eq	LBB9_4
; %bb.1:
	ldrb	w8, [x19]
	cbz	w8, LBB9_4
; %bb.2:
	cbz	w21, LBB9_5
; %bb.3:
	cmp	w20, #0
	mov	w8, #20                         ; =0x14
	csel	w1, w20, w8, gt
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_chat_host_mute_name
LBB9_4:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	mov	w0, wzr
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB9_5:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_chat_host_unmute_name
                                        ; -- End function
	.globl	_network_chat_host_name_muted   ; -- Begin function network_chat_host_name_muted
	.p2align	4
_network_chat_host_name_muted:          ; @network_chat_host_name_muted
; %bb.0:
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	x20, x0
	ldrh	w0, [x0]
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	cbz	w0, LBB10_43
; %bb.1:
	add	x21, sp, #4
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #2]
	mov	w19, w0
	strb	w0, [sp, #4]
	cbz	w8, LBB10_12
; %bb.2:
	mov	w0, w8
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #4]
	strb	w0, [sp, #5]
	cbz	w8, LBB10_13
; %bb.3:
	mov	w0, w8
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #6]
	strb	w0, [sp, #6]
	cbz	w8, LBB10_14
; %bb.4:
	mov	w0, w8
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #8]
	strb	w0, [sp, #7]
	cbz	w8, LBB10_15
; %bb.5:
	mov	w0, w8
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #10]
	strb	w0, [sp, #8]
	cbz	w8, LBB10_16
; %bb.6:
	mov	w0, w8
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #12]
	strb	w0, [sp, #9]
	cbz	w8, LBB10_17
; %bb.7:
	mov	w0, w8
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #14]
	strb	w0, [sp, #10]
	cbz	w8, LBB10_18
; %bb.8:
	mov	w0, w8
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #16]
	strb	w0, [sp, #11]
	cbz	w8, LBB10_19
; %bb.9:
	mov	w0, w8
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #18]
	strb	w0, [sp, #12]
	cbz	w8, LBB10_20
; %bb.10:
	mov	w0, w8
	bl	_player_name_character_ascii
	ldrh	w8, [x20, #20]
	strb	w0, [sp, #13]
	cbz	w8, LBB10_21
; %bb.11:
	mov	w0, w8
	bl	_player_name_character_ascii
	strb	wzr, [sp, #15]
	strb	w0, [sp, #14]
	b	LBB10_23
LBB10_12:
	add	x8, x21, #1
	b	LBB10_22
LBB10_13:
	add	x8, x21, #2
	b	LBB10_22
LBB10_14:
	add	x8, x21, #3
	b	LBB10_22
LBB10_15:
	add	x8, x21, #4
	b	LBB10_22
LBB10_16:
	add	x8, x21, #5
	b	LBB10_22
LBB10_17:
	add	x8, x21, #6
	b	LBB10_22
LBB10_18:
	add	x8, x21, #7
	b	LBB10_22
LBB10_19:
	add	x8, x21, #8
	b	LBB10_22
LBB10_20:
	add	x8, x21, #9
	b	LBB10_22
LBB10_21:
	add	x8, x21, #10
LBB10_22:
	strb	wzr, [x8]
LBB10_23:
	bl	_system_milliseconds
	sub	w9, w19, #65
	orr	w10, w19, #0x20
	cmp	w9, #26
	mov	w12, #45683                     ; =0xb273
	mov	w8, wzr
	csel	w9, w10, w19, lo
	mov	w10, #24                        ; =0x18
	mov	w11, #59999                     ; =0xea5f
	movk	w12, #17895, lsl #16
	add	x13, sp, #4
Lloh32:
	adrp	x14, _chat_mutes@PAGE
Lloh33:
	add	x14, x14, _chat_mutes@PAGEOFF
	b	LBB10_26
	.p2align	4, , 8
LBB10_24:                               ;   in Loop: Header=BB10_26 Depth=1
	strb	wzr, [x15, #24]
LBB10_25:                               ;   in Loop: Header=BB10_26 Depth=1
	add	w8, w8, #2
	cmp	w8, #128
	b.eq	LBB10_42
LBB10_26:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_31 Depth 2
                                        ;     Child Loop BB10_39 Depth 2
	smaddl	x15, w8, w10, x14
	ldrb	w16, [x15]
	cbz	w16, LBB10_34
; %bb.27:                               ;   in Loop: Header=BB10_26 Depth=1
	ldp	w16, w17, [x15, #16]
	sub	w16, w0, w16
	subs	w16, w17, w16
	b.ls	LBB10_33
; %bb.28:                               ;   in Loop: Header=BB10_26 Depth=1
	add	w16, w16, w11
	umull	x16, w16, w12
	ubfx	x16, x16, #46, #16
	cbz	w16, LBB10_34
; %bb.29:                               ;   in Loop: Header=BB10_26 Depth=1
	mov	x16, x15
	ldrb	w17, [x16, #1]!
	sub	w1, w17, #65
	orr	w2, w17, #0x20
	cmp	w1, #26
	csel	w1, w2, w17, lo
	cmp	w1, w9, uxtb
	b.ne	LBB10_34
; %bb.30:                               ;   in Loop: Header=BB10_26 Depth=1
	mov	w1, wzr
	.p2align	4, , 8
LBB10_31:                               ;   Parent Loop BB10_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	tst	w17, #0xff
	b.eq	LBB10_41
; %bb.32:                               ;   in Loop: Header=BB10_31 Depth=2
	add	w1, w1, #1
	sxth	x2, w1
	ldrb	w17, [x16, x2]
	ldrb	w2, [x13, x2]
	sub	w3, w17, #65
	orr	w4, w17, #0x20
	sub	w5, w2, #65
	cmp	w3, #26
	and	w3, w5, #0xff
	csel	w4, w4, w17, lo
	orr	w5, w2, #0x20
	cmp	w3, #26
	csel	w2, w5, w2, lo
	cmp	w4, w2, uxtb
	b.eq	LBB10_31
	b	LBB10_34
	.p2align	4, , 8
LBB10_33:                               ;   in Loop: Header=BB10_26 Depth=1
	strb	wzr, [x15]
LBB10_34:                               ;   in Loop: Header=BB10_26 Depth=1
	ldrb	w16, [x15, #24]
	cbz	w16, LBB10_25
; %bb.35:                               ;   in Loop: Header=BB10_26 Depth=1
	ldp	w16, w17, [x15, #40]
	sub	w16, w0, w16
	subs	w16, w17, w16
	b.ls	LBB10_24
; %bb.36:                               ;   in Loop: Header=BB10_26 Depth=1
	add	w16, w16, w11
	umull	x16, w16, w12
	ubfx	x16, x16, #46, #16
	cbz	w16, LBB10_25
; %bb.37:                               ;   in Loop: Header=BB10_26 Depth=1
	ldrb	w16, [x15, #25]!
	sub	w17, w16, #65
	orr	w1, w16, #0x20
	cmp	w17, #26
	csel	w17, w1, w16, lo
	cmp	w17, w9, uxtb
	b.ne	LBB10_25
; %bb.38:                               ;   in Loop: Header=BB10_26 Depth=1
	mov	w17, wzr
	.p2align	4, , 8
LBB10_39:                               ;   Parent Loop BB10_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	tst	w16, #0xff
	b.eq	LBB10_41
; %bb.40:                               ;   in Loop: Header=BB10_39 Depth=2
	add	w17, w17, #1
	sxth	x1, w17
	ldrb	w16, [x15, x1]
	ldrb	w1, [x13, x1]
	sub	w2, w16, #65
	orr	w3, w16, #0x20
	sub	w4, w1, #65
	cmp	w2, #26
	and	w2, w4, #0xff
	csel	w3, w3, w16, lo
	orr	w4, w1, #0x20
	cmp	w2, #26
	csel	w1, w4, w1, lo
	cmp	w3, w1, uxtb
	b.eq	LBB10_39
	b	LBB10_25
LBB10_41:
	mov	w0, #1                          ; =0x1
	b	LBB10_43
LBB10_42:
	mov	w0, wzr
LBB10_43:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh32, Lloh33
                                        ; -- End function
	.globl	_network_chat_handle_up         ; -- Begin function network_chat_handle_up
	.p2align	4
_network_chat_handle_up:                ; @network_chat_handle_up
; %bb.0:
	sub	sp, sp, #384
	stp	x28, x27, [sp, #304]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #320]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #336]            ; 16-byte Folded Spill
	mov	w22, w2
	stp	x20, x19, [sp, #352]            ; 16-byte Folded Spill
	mov	x21, x1
	stp	x29, x30, [sp, #368]            ; 16-byte Folded Spill
	add	x29, sp, #368
	mov	w19, w0
	bl	_system_milliseconds
	mov	w20, w0
	bl	_game_connection
	cbz	w22, LBB11_90
; %bb.1:
	cmp	w19, #127
	b.hi	LBB11_90
; %bb.2:
	cmp	w0, #2
	b.ne	LBB11_90
; %bb.3:
	add	x0, sp, #160
	mov	x1, x21
	mov	w2, #68                         ; =0x44
	bl	_csmemcpy
	ldrsb	w1, [sp, #160]
	tbnz	w1, #31, LBB11_90
; %bb.4:
	mov	w0, w19
	bl	_distributed_machine_has_player
	cbz	w0, LBB11_90
; %bb.5:
Lloh34:
	adrp	x8, _chat_rates@PAGE
Lloh35:
	add	x8, x8, _chat_rates@PAGEOFF
	add	x9, x8, w19, sxtw #3
	ldrb	w8, [x9]
	cbz	w8, LBB11_7
; %bb.6:
	ldr	w8, [x9, #4]
	b	LBB11_8
LBB11_7:
	mov	w10, #1                         ; =0x1
	mov	w11, #5                         ; =0x5
	mov	w8, w20
	str	w20, [x9, #4]
	strb	w10, [x9]
	strh	w11, [x9, #2]
LBB11_8:
	sub	w10, w20, w8
	cmp	w10, #1499
	b.hi	LBB11_10
; %bb.9:
	ldrh	w11, [x9, #2]
	b	LBB11_11
LBB11_10:
	mov	w11, #6641                      ; =0x19f1
	ldrsh	w12, [x9, #2]
	movk	w11, #1398, lsl #16
	mov	w13, #5                         ; =0x5
	umull	x10, w10, w11
	mov	w11, #1500                      ; =0x5dc
	lsr	x10, x10, #37
	add	w12, w10, w12
	cmp	w12, #5
	madd	w8, w10, w11, w8
	csel	w11, w12, w13, lo
	strh	w11, [x9, #2]
	str	w8, [x9, #4]
LBB11_11:
	sxth	w8, w11
	cmp	w8, #4
	b.le	LBB11_13
; %bb.12:
	str	w20, [x9, #4]
	b	LBB11_14
LBB11_13:
	cmp	w8, #1
	b.lt	LBB11_90
LBB11_14:
	mov	w10, wzr
	mov	w8, wzr
	sub	w15, w11, #1
	add	x11, sp, #160
	mov	w12, #124                       ; =0x7c
	mov	w13, #63                        ; =0x3f
	add	x14, sp, #96
	strh	w15, [x9, #2]
	b	LBB11_17
	.p2align	4, , 8
LBB11_15:                               ;   in Loop: Header=BB11_17 Depth=1
	add	w8, w8, #1
	strb	w15, [x14, w9, sxtw]
LBB11_16:                               ;   in Loop: Header=BB11_17 Depth=1
	add	w10, w10, #4
	cmp	w10, #64
	b.eq	LBB11_39
LBB11_17:                               ; =>This Inner Loop Header: Depth=1
	add	w9, w11, w10
	add	w9, w9, #4
	ldrb	w15, [x9]
	sxth	w9, w8
	cbz	w15, LBB11_40
; %bb.18:                               ;   in Loop: Header=BB11_17 Depth=1
	cmp	w9, #62
	b.gt	LBB11_40
; %bb.19:                               ;   in Loop: Header=BB11_17 Depth=1
	sub	w16, w15, #127
	and	w16, w16, #0xff
	cmp	w16, #161
	and	w16, w8, #0xffff
	ccmp	w15, w12, #4, hs
	csel	w15, w13, w15, eq
	cmp	w15, #32
	ccmp	w16, #0, #0, eq
	b.eq	LBB11_21
; %bb.20:                               ;   in Loop: Header=BB11_17 Depth=1
	add	w8, w8, #1
	strb	w15, [x14, w9, sxtw]
	b	LBB11_22
	.p2align	4, , 8
LBB11_21:                               ;   in Loop: Header=BB11_17 Depth=1
	mov	w8, wzr
LBB11_22:                               ;   in Loop: Header=BB11_17 Depth=1
	add	w9, w11, w10
	add	w9, w9, #5
	ldrb	w15, [x9]
	sxth	w9, w8
	cbz	w15, LBB11_40
; %bb.23:                               ;   in Loop: Header=BB11_17 Depth=1
	cmp	w9, #62
	b.gt	LBB11_40
; %bb.24:                               ;   in Loop: Header=BB11_17 Depth=1
	sub	w16, w15, #127
	and	w16, w16, #0xff
	cmp	w16, #161
	ccmp	w15, w12, #4, hs
	csel	w15, w13, w15, eq
	cmp	w15, #32
	b.ne	LBB11_27
; %bb.25:                               ;   in Loop: Header=BB11_17 Depth=1
	tst	w8, #0xffff
	b.ne	LBB11_27
; %bb.26:                               ;   in Loop: Header=BB11_17 Depth=1
	mov	w8, wzr
	b	LBB11_28
	.p2align	4, , 8
LBB11_27:                               ;   in Loop: Header=BB11_17 Depth=1
	add	w8, w8, #1
	strb	w15, [x14, w9, sxtw]
LBB11_28:                               ;   in Loop: Header=BB11_17 Depth=1
	add	w9, w11, w10
	add	w9, w9, #6
	ldrb	w15, [x9]
	sxth	w9, w8
	cbz	w15, LBB11_40
; %bb.29:                               ;   in Loop: Header=BB11_17 Depth=1
	cmp	w9, #62
	b.gt	LBB11_40
; %bb.30:                               ;   in Loop: Header=BB11_17 Depth=1
	sub	w16, w15, #127
	and	w16, w16, #0xff
	cmp	w16, #161
	ccmp	w15, w12, #4, hs
	csel	w15, w13, w15, eq
	cmp	w15, #32
	b.ne	LBB11_33
; %bb.31:                               ;   in Loop: Header=BB11_17 Depth=1
	tst	w8, #0xffff
	b.ne	LBB11_33
; %bb.32:                               ;   in Loop: Header=BB11_17 Depth=1
	mov	w8, wzr
	b	LBB11_34
	.p2align	4, , 8
LBB11_33:                               ;   in Loop: Header=BB11_17 Depth=1
	add	w8, w8, #1
	strb	w15, [x14, w9, sxtw]
LBB11_34:                               ;   in Loop: Header=BB11_17 Depth=1
	add	w9, w11, w10
	add	w9, w9, #7
	ldrb	w15, [x9]
	sxth	w9, w8
	cbz	w15, LBB11_40
; %bb.35:                               ;   in Loop: Header=BB11_17 Depth=1
	cmp	w9, #62
	b.gt	LBB11_40
; %bb.36:                               ;   in Loop: Header=BB11_17 Depth=1
	sub	w16, w15, #127
	and	w16, w16, #0xff
	cmp	w16, #161
	ccmp	w15, w12, #4, hs
	csel	w15, w13, w15, eq
	cmp	w15, #32
	b.ne	LBB11_15
; %bb.37:                               ;   in Loop: Header=BB11_17 Depth=1
	tst	w8, #0xffff
	b.ne	LBB11_15
; %bb.38:                               ;   in Loop: Header=BB11_17 Depth=1
	mov	w8, wzr
	b	LBB11_16
LBB11_39:
	sxth	w9, w8
LBB11_40:
	sxth	w10, w8
	cmp	w10, #1
	b.lt	LBB11_45
; %bb.41:
	add	x8, sp, #96
	sub	w8, w8, #1
	.p2align	4, , 8
LBB11_42:                               ; =>This Inner Loop Header: Depth=1
	add	w10, w8, w9
	ldrb	w10, [x10]
	cmp	w10, #32
	b.ne	LBB11_44
; %bb.43:                               ;   in Loop: Header=BB11_42 Depth=1
	subs	w9, w9, #1
	b.gt	LBB11_42
	b	LBB11_90
LBB11_44:
	mov	w8, w9
LBB11_45:
	add	x10, sp, #96
	tst	w8, #0xffff
	strb	wzr, [x10, w9, sxtw]
	b.eq	LBB11_90
; %bb.46:
	ldrb	w0, [sp, #160]
	bl	_distributed_player
	cbz	w0, LBB11_90
; %bb.47:
	mov	x21, x0
	ldrh	w8, [x21, #4]!
	cbz	w8, LBB11_58
; %bb.48:
	ldrh	w8, [x0, #6]
	cbz	w8, LBB11_59
; %bb.49:
	ldrh	w8, [x0, #8]
	cbz	w8, LBB11_60
; %bb.50:
	ldrh	w8, [x0, #10]
	cbz	w8, LBB11_61
; %bb.51:
	ldrh	w8, [x0, #12]
	cbz	w8, LBB11_62
; %bb.52:
	ldrh	w8, [x0, #14]
	cbz	w8, LBB11_63
; %bb.53:
	ldrh	w8, [x0, #16]
	cbz	w8, LBB11_64
; %bb.54:
	ldrh	w8, [x0, #18]
	cbz	w8, LBB11_65
; %bb.55:
	ldrh	w8, [x0, #20]
	cbz	w8, LBB11_66
; %bb.56:
	ldrh	w8, [x0, #22]
	cbz	w8, LBB11_67
; %bb.57:
	ldrh	w8, [x0, #24]
	cmp	w8, #0
	mov	w8, #10                         ; =0xa
	cinc	w22, w8, ne
	b	LBB11_68
LBB11_58:
	mov	w22, wzr
	b	LBB11_70
LBB11_59:
	mov	w22, #1                         ; =0x1
	b	LBB11_68
LBB11_60:
	mov	w22, #2                         ; =0x2
	b	LBB11_68
LBB11_61:
	mov	w22, #3                         ; =0x3
	b	LBB11_68
LBB11_62:
	mov	w22, #4                         ; =0x4
	b	LBB11_68
LBB11_63:
	mov	w22, #5                         ; =0x5
	b	LBB11_68
LBB11_64:
	mov	w22, #6                         ; =0x6
	b	LBB11_68
LBB11_65:
	mov	w22, #7                         ; =0x7
	b	LBB11_68
LBB11_66:
	mov	w22, #8                         ; =0x8
	b	LBB11_68
LBB11_67:
	mov	w22, #9                         ; =0x9
LBB11_68:
	mov	w23, wzr
	add	x24, sp, #84
	.p2align	4, , 8
LBB11_69:                               ; =>This Inner Loop Header: Depth=1
	add	w8, w21, w23, lsl #1
	ldrh	w0, [x8]
	bl	_player_name_character_ascii
	add	w8, w24, w23
	add	w23, w23, #1
	cmp	w22, w23
	strb	w0, [x8]
	b.ne	LBB11_69
LBB11_70:
	add	x9, sp, #84
	mov	w13, #45683                     ; =0xb273
	mov	w8, wzr
	movk	w13, #17895, lsl #16
Lloh36:
	adrp	x14, _chat_mutes@PAGE
Lloh37:
	add	x14, x14, _chat_mutes@PAGEOFF
	strb	wzr, [x9, w22, uxtw]
	ldrb	w11, [sp, #84]
	sub	w10, w11, #65
	orr	w12, w11, #0x20
	cmp	w10, #26
	mov	w10, #24                        ; =0x18
	csel	w11, w12, w11, lo
	mov	w12, #59999                     ; =0xea5f
	b	LBB11_73
LBB11_71:                               ;   in Loop: Header=BB11_73 Depth=1
	strb	wzr, [x15, #24]
LBB11_72:                               ;   in Loop: Header=BB11_73 Depth=1
	add	w8, w8, #2
	cmp	w8, #128
	b.eq	LBB11_91
LBB11_73:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_78 Depth 2
                                        ;     Child Loop BB11_86 Depth 2
	smaddl	x15, w8, w10, x14
	ldrb	w16, [x15]
	cbz	w16, LBB11_81
; %bb.74:                               ;   in Loop: Header=BB11_73 Depth=1
	ldp	w16, w17, [x15, #16]
	sub	w16, w20, w16
	subs	w16, w17, w16
	b.ls	LBB11_80
; %bb.75:                               ;   in Loop: Header=BB11_73 Depth=1
	add	w17, w16, w12
	umull	x17, w17, w13
	ubfx	x17, x17, #46, #16
	cbz	w17, LBB11_81
; %bb.76:                               ;   in Loop: Header=BB11_73 Depth=1
	mov	x17, x15
	ldrb	w0, [x17, #1]!
	sub	w1, w0, #65
	orr	w2, w0, #0x20
	cmp	w1, #26
	csel	w1, w2, w0, lo
	cmp	w1, w11
	b.ne	LBB11_81
; %bb.77:                               ;   in Loop: Header=BB11_73 Depth=1
	mov	w1, wzr
	.p2align	4, , 8
LBB11_78:                               ;   Parent Loop BB11_73 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cbz	w0, LBB11_88
; %bb.79:                               ;   in Loop: Header=BB11_78 Depth=2
	add	w1, w1, #1
	sxth	x2, w1
	ldrb	w0, [x17, x2]
	ldrb	w2, [x9, x2]
	sub	w3, w0, #65
	orr	w4, w0, #0x20
	cmp	w3, #26
	sub	w3, w2, #65
	csel	w4, w4, w0, lo
	orr	w5, w2, #0x20
	cmp	w3, #26
	csel	w2, w5, w2, lo
	cmp	w4, w2
	b.eq	LBB11_78
	b	LBB11_81
LBB11_80:                               ;   in Loop: Header=BB11_73 Depth=1
	strb	wzr, [x15]
LBB11_81:                               ;   in Loop: Header=BB11_73 Depth=1
	ldrb	w16, [x15, #24]
	cbz	w16, LBB11_72
; %bb.82:                               ;   in Loop: Header=BB11_73 Depth=1
	ldp	w16, w17, [x15, #40]
	sub	w16, w20, w16
	subs	w16, w17, w16
	b.ls	LBB11_71
; %bb.83:                               ;   in Loop: Header=BB11_73 Depth=1
	add	w17, w16, w12
	umull	x17, w17, w13
	ubfx	x17, x17, #46, #16
	cbz	w17, LBB11_72
; %bb.84:                               ;   in Loop: Header=BB11_73 Depth=1
	ldrb	w17, [x15, #25]!
	sub	w0, w17, #65
	orr	w1, w17, #0x20
	cmp	w0, #26
	csel	w0, w1, w17, lo
	cmp	w0, w11
	b.ne	LBB11_72
; %bb.85:                               ;   in Loop: Header=BB11_73 Depth=1
	mov	w0, wzr
	.p2align	4, , 8
LBB11_86:                               ;   Parent Loop BB11_73 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cbz	w17, LBB11_88
; %bb.87:                               ;   in Loop: Header=BB11_86 Depth=2
	add	w0, w0, #1
	sxth	x1, w0
	ldrb	w17, [x15, x1]
	ldrb	w1, [x9, x1]
	sub	w2, w17, #65
	orr	w3, w17, #0x20
	cmp	w2, #26
	sub	w2, w1, #65
	csel	w3, w3, w17, lo
	orr	w4, w1, #0x20
	cmp	w2, #26
	csel	w1, w4, w1, lo
	cmp	w3, w1
	b.eq	LBB11_86
	b	LBB11_72
LBB11_88:
	mov	w8, #59999                      ; =0xea5f
	mov	w9, #45683                      ; =0xb273
	movk	w9, #17895, lsl #16
	add	w8, w16, w8
Lloh38:
	adrp	x10, l_.str.25@PAGE
Lloh39:
	add	x10, x10, l_.str.25@PAGEOFF
	umull	x8, w8, w9
Lloh40:
	adrp	x9, l_.str.26@PAGE
Lloh41:
	add	x9, x9, l_.str.26@PAGEOFF
Lloh42:
	adrp	x2, l_.str@PAGE
Lloh43:
	add	x2, x2, l_.str@PAGEOFF
	ubfx	x11, x8, #46, #16
	cmp	w11, #1
	add	x0, sp, #20
	csel	x9, x10, x9, eq
	mov	w1, #64                         ; =0x40
	sbfx	x8, x8, #46, #16
	stp	w8, w9, [sp]
	bl	_halo_linux_snprintf
	sub	x0, x29, #140
	mov	w1, wzr
	mov	w2, #76                         ; =0x4c
	sub	x20, x29, #140
	bl	_csmemset
	mov	w8, #4                          ; =0x4
	add	x0, x20, #12
	add	x1, sp, #20
LBB11_89:
	sturb	w8, [x29, #-131]
	mov	w2, #63                         ; =0x3f
	bl	_csstrncpy
	sub	x1, x29, #140
	mov	w0, w19
	mov	w2, #88                         ; =0x58
	mov	w3, #1                          ; =0x1
	mov	w4, #76                         ; =0x4c
	bl	_distributed_send_to_machine_reliably
LBB11_90:
	ldp	x29, x30, [sp, #368]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #352]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #336]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #320]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #304]            ; 16-byte Folded Reload
	add	sp, sp, #384
	ret
LBB11_91:
	bl	_chat_host_config_flags
	add	x1, sp, #96
	bl	_chat_refused
	mov	x20, x0
	cbz	w20, LBB11_93
; %bb.92:
	sub	x0, x29, #140
	mov	w1, wzr
	mov	w2, #76                         ; =0x4c
	sub	x21, x29, #140
	bl	_csmemset
	mov	w8, #4                          ; =0x4
	add	x0, x21, #12
	mov	x1, x20
	b	LBB11_89
LBB11_93:
	bl	_chat_filter_mode_now
	cbz	w0, LBB11_131
; %bb.94:
	mov	w20, w0
	add	x0, sp, #96
	add	x1, sp, #20
	bl	_chat_filter_marks
	cmp	w0, #1
	b.lt	LBB11_131
; %bb.95:
	cmp	w20, #2
	b.ne	LBB11_97
; %bb.96:
Lloh44:
	adrp	x0, l_.str.1@PAGE
Lloh45:
	add	x0, x0, l_.str.1@PAGEOFF
	add	x8, sp, #84
	str	w8, [sp]
	bl	_platform_log
	sub	x0, x29, #140
	mov	w1, wzr
	mov	w2, #76                         ; =0x4c
	sub	x20, x29, #140
	bl	_csmemset
	mov	w8, #4                          ; =0x4
Lloh46:
	adrp	x1, l_.str.2@PAGE
Lloh47:
	add	x1, x1, l_.str.2@PAGEOFF
	add	x0, x20, #12
	b	LBB11_89
LBB11_97:
	add	x8, sp, #20
	add	x9, sp, #96
	add	w8, w8, #3
	add	w9, w9, #3
	mov	w10, #64                        ; =0x40
	mov	w11, #42                        ; =0x2a
	b	LBB11_99
LBB11_98:                               ;   in Loop: Header=BB11_99 Depth=1
	add	w8, w8, #8
	add	w9, w9, #8
	subs	w10, w10, #8
	b.eq	LBB11_130
LBB11_99:                               ; =>This Inner Loop Header: Depth=1
	sub	w12, w9, #3
	ldrb	w12, [x12]
	cbz	w12, LBB11_130
; %bb.100:                              ;   in Loop: Header=BB11_99 Depth=1
	sub	w13, w8, #3
	cmp	w12, #32
	ldrb	w13, [x13]
	ccmp	w13, #0, #4, ne
	b.eq	LBB11_102
; %bb.101:                              ;   in Loop: Header=BB11_99 Depth=1
	sub	w12, w9, #3
	strb	w11, [x12]
LBB11_102:                              ;   in Loop: Header=BB11_99 Depth=1
	sub	w12, w9, #2
	ldrb	w12, [x12]
	cbz	w12, LBB11_130
; %bb.103:                              ;   in Loop: Header=BB11_99 Depth=1
	cmp	w12, #32
	b.eq	LBB11_106
; %bb.104:                              ;   in Loop: Header=BB11_99 Depth=1
	sub	w12, w8, #2
	ldrb	w12, [x12]
	cbz	w12, LBB11_106
; %bb.105:                              ;   in Loop: Header=BB11_99 Depth=1
	sub	w12, w9, #2
	strb	w11, [x12]
LBB11_106:                              ;   in Loop: Header=BB11_99 Depth=1
	sub	w12, w9, #1
	ldrb	w12, [x12]
	cbz	w12, LBB11_130
; %bb.107:                              ;   in Loop: Header=BB11_99 Depth=1
	cmp	w12, #32
	b.eq	LBB11_110
; %bb.108:                              ;   in Loop: Header=BB11_99 Depth=1
	sub	w12, w8, #1
	ldrb	w12, [x12]
	cbz	w12, LBB11_110
; %bb.109:                              ;   in Loop: Header=BB11_99 Depth=1
	sub	w12, w9, #1
	strb	w11, [x12]
LBB11_110:                              ;   in Loop: Header=BB11_99 Depth=1
	ldrb	w12, [x9]
	cbz	w12, LBB11_130
; %bb.111:                              ;   in Loop: Header=BB11_99 Depth=1
	cmp	w12, #32
	b.eq	LBB11_114
; %bb.112:                              ;   in Loop: Header=BB11_99 Depth=1
	ldrb	w12, [x8]
	cbz	w12, LBB11_114
; %bb.113:                              ;   in Loop: Header=BB11_99 Depth=1
	strb	w11, [x9]
LBB11_114:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w9, #1
	ldrb	w12, [x12]
	cbz	w12, LBB11_130
; %bb.115:                              ;   in Loop: Header=BB11_99 Depth=1
	cmp	w12, #32
	b.eq	LBB11_118
; %bb.116:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w8, #1
	ldrb	w12, [x12]
	cbz	w12, LBB11_118
; %bb.117:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w9, #1
	strb	w11, [x12]
LBB11_118:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w9, #2
	ldrb	w12, [x12]
	cbz	w12, LBB11_130
; %bb.119:                              ;   in Loop: Header=BB11_99 Depth=1
	cmp	w12, #32
	b.eq	LBB11_122
; %bb.120:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w8, #2
	ldrb	w12, [x12]
	cbz	w12, LBB11_122
; %bb.121:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w9, #2
	strb	w11, [x12]
LBB11_122:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w9, #3
	ldrb	w12, [x12]
	cbz	w12, LBB11_130
; %bb.123:                              ;   in Loop: Header=BB11_99 Depth=1
	cmp	w12, #32
	b.eq	LBB11_126
; %bb.124:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w8, #3
	ldrb	w12, [x12]
	cbz	w12, LBB11_126
; %bb.125:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w9, #3
	strb	w11, [x12]
LBB11_126:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w9, #4
	ldrb	w12, [x12]
	cbz	w12, LBB11_130
; %bb.127:                              ;   in Loop: Header=BB11_99 Depth=1
	cmp	w12, #32
	b.eq	LBB11_98
; %bb.128:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w8, #4
	ldrb	w12, [x12]
	cbz	w12, LBB11_98
; %bb.129:                              ;   in Loop: Header=BB11_99 Depth=1
	add	w12, w9, #4
	strb	w11, [x12]
	b	LBB11_98
LBB11_130:
Lloh48:
	adrp	x0, l_.str.3@PAGE
Lloh49:
	add	x0, x0, l_.str.3@PAGEOFF
	add	x8, sp, #84
	str	w8, [sp]
	bl	_platform_log
LBB11_131:
	ldrb	w8, [sp, #161]
	add	x2, sp, #96
	ldrb	w0, [sp, #160]
	and	w9, w8, #0x1
	tst	w8, #0x2
	mov	w8, #2                          ; =0x2
	csel	w1, w9, w8, eq
	bl	_chat_host_send
	b	LBB11_90
	.loh AdrpAdd	Lloh34, Lloh35
	.loh AdrpAdd	Lloh36, Lloh37
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpAdd	Lloh40, Lloh41
	.loh AdrpAdd	Lloh38, Lloh39
	.loh AdrpAdd	Lloh46, Lloh47
	.loh AdrpAdd	Lloh44, Lloh45
	.loh AdrpAdd	Lloh48, Lloh49
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_refused
_chat_refused:                          ; @chat_refused
; %bb.0:
	sub	sp, sp, #176
	stp	x28, x27, [sp, #80]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	tbnz	w0, #0, LBB12_2
; %bb.1:
Lloh50:
	adrp	x19, l_.str.5@PAGE
Lloh51:
	add	x19, x19, l_.str.5@PAGEOFF
	b	LBB12_117
LBB12_2:
	tbnz	w0, #1, LBB12_116
; %bb.3:
	ldrb	w8, [x1]
	cbz	w8, LBB12_116
; %bb.4:
	add	x19, sp, #16
	mov	w23, wzr
	mov	w25, wzr
	sub	w20, w19, #1
	mov	w21, #46                        ; =0x2e
	mov	x26, x1
Lloh52:
	adrp	x22, _chat_text_has_link.dots@PAGE
Lloh53:
	add	x22, x22, _chat_text_has_link.dots@PAGEOFF
	mov	x24, x1
	.p2align	4, , 8
LBB12_5:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB12_61 Depth 2
                                        ;     Child Loop BB12_67 Depth 2
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #90
	b.gt	LBB12_13
; %bb.6:                                ;   in Loop: Header=BB12_5 Depth=1
	cmp	w8, #32
	b.eq	LBB12_20
; %bb.7:                                ;   in Loop: Header=BB12_5 Depth=1
	cmp	w8, #40
	b.ne	LBB12_55
; %bb.8:                                ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #1
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #100
	b.ne	LBB12_31
; %bb.9:                                ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #2
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #111
	b.ne	LBB12_31
; %bb.10:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #3
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #116
	b.ne	LBB12_31
; %bb.11:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #4
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #41
	b.ne	LBB12_31
; %bb.12:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w8, wzr
	b	LBB12_25
	.p2align	4, , 8
LBB12_13:                               ;   in Loop: Header=BB12_5 Depth=1
	cmp	w8, #91
	b.eq	LBB12_26
; %bb.14:                               ;   in Loop: Header=BB12_5 Depth=1
	cmp	w8, #123
	b.ne	LBB12_55
; %bb.15:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #1
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #100
	b.ne	LBB12_55
; %bb.16:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #2
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #111
	b.ne	LBB12_55
; %bb.17:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #3
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #116
	b.ne	LBB12_55
; %bb.18:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #4
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #125
	b.ne	LBB12_55
; %bb.19:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w27, #5                         ; =0x5
	mov	w8, #2                          ; =0x2
	b	LBB12_37
LBB12_20:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #1
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #100
	b.ne	LBB12_55
; %bb.21:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #2
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #111
	b.ne	LBB12_55
; %bb.22:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #3
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #116
	b.ne	LBB12_55
; %bb.23:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #4
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #32
	b.ne	LBB12_55
; %bb.24:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w8, #5                          ; =0x5
LBB12_25:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w27, #5                         ; =0x5
	b	LBB12_37
LBB12_26:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #1
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #100
	b.ne	LBB12_34
; %bb.27:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #2
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #111
	b.ne	LBB12_34
; %bb.28:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #3
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #116
	b.ne	LBB12_34
; %bb.29:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #4
	ldrb	w8, [x8]
	cmp	w8, #93
	b.ne	LBB12_34
; %bb.30:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w27, #5                         ; =0x5
	mov	w8, #1                          ; =0x1
	b	LBB12_37
LBB12_31:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #1
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #46
	b.ne	LBB12_55
; %bb.32:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #2
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #41
	b.ne	LBB12_55
; %bb.33:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w8, #3                          ; =0x3
	mov	w27, #3                         ; =0x3
	b	LBB12_37
LBB12_34:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #1
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #46
	b.ne	LBB12_55
; %bb.35:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, #2
	ldrb	w8, [x8]
	cmp	w8, #93
	b.ne	LBB12_55
; %bb.36:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w27, #3                         ; =0x3
	mov	w8, #4                          ; =0x4
LBB12_37:                               ;   in Loop: Header=BB12_5 Depth=1
	ldr	w8, [x22, w8, uxtw #2]
	ldrb	w8, [x8]
	cmp	w8, #32
	b.ne	LBB12_60
; %bb.38:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w26, w27
	ldrb	w9, [x8]
	sub	w10, w9, #65
	orr	w11, w9, #0x20
	cmp	w10, #26
	csel	w10, w11, w9, lo
	sub	w9, w10, #97
	cmp	w9, #25
	b.hi	LBB12_47
; %bb.39:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w9, w8, #1
	strb	w10, [sp, #8]
	ldrb	w9, [x9]
	sub	w11, w9, #65
	orr	w12, w9, #0x20
	cmp	w11, #26
	csel	w9, w12, w9, lo
	sub	w11, w9, #97
	cmp	w11, #25
	b.hi	LBB12_48
; %bb.40:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w10, w8, #2
	strb	w9, [sp, #9]
	ldrb	w10, [x10]
	sub	w11, w10, #65
	orr	w12, w10, #0x20
	cmp	w11, #26
	csel	w10, w12, w10, lo
	sub	w11, w10, #97
	cmp	w11, #25
	b.hi	LBB12_49
; %bb.41:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w9, w8, #3
	strb	w10, [sp, #10]
	ldrb	w9, [x9]
	sub	w11, w9, #65
	orr	w12, w9, #0x20
	cmp	w11, #26
	csel	w9, w12, w9, lo
	sub	w11, w9, #97
	cmp	w11, #25
	b.hi	LBB12_50
; %bb.42:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w10, w8, #4
	strb	w9, [sp, #11]
	ldrb	w10, [x10]
	sub	w11, w10, #65
	orr	w12, w10, #0x20
	cmp	w11, #26
	csel	w10, w12, w10, lo
	sub	w11, w10, #97
	cmp	w11, #25
	b.hi	LBB12_51
; %bb.43:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w9, w8, #5
	strb	w10, [sp, #12]
	ldrb	w9, [x9]
	sub	w11, w9, #65
	orr	w12, w9, #0x20
	cmp	w11, #26
	csel	w9, w12, w9, lo
	sub	w11, w9, #97
	cmp	w11, #25
	b.hi	LBB12_52
; %bb.44:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w10, w8, #6
	strb	w9, [sp, #13]
	ldrb	w10, [x10]
	sub	w11, w10, #65
	orr	w12, w10, #0x20
	cmp	w11, #26
	csel	w10, w12, w10, lo
	sub	w11, w10, #97
	cmp	w11, #25
	b.hi	LBB12_53
; %bb.45:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w8, w8, #7
	strb	w10, [sp, #14]
	ldrb	w8, [x8]
	sub	w9, w8, #65
	orr	w11, w8, #0x20
	cmp	w9, #26
	csel	w8, w11, w8, lo
	sub	w8, w8, #97
	cmp	w8, #26
	b.lo	LBB12_55
; %bb.46:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w1, #7                          ; =0x7
	b	LBB12_54
LBB12_47:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w1, wzr
	b	LBB12_54
LBB12_48:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w1, #1                          ; =0x1
	b	LBB12_54
LBB12_49:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w1, #2                          ; =0x2
	b	LBB12_54
LBB12_50:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w1, #3                          ; =0x3
	b	LBB12_54
LBB12_51:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w1, #4                          ; =0x4
	b	LBB12_54
LBB12_52:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w1, #5                          ; =0x5
	b	LBB12_54
LBB12_53:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w1, #6                          ; =0x6
LBB12_54:                               ;   in Loop: Header=BB12_5 Depth=1
	add	x0, sp, #8
	bl	_chat_link_domain
	mov	x1, x24
	cmp	w0, #2
	b.eq	LBB12_60
	.p2align	4, , 8
LBB12_55:                               ;   in Loop: Header=BB12_5 Depth=1
	ldrb	w8, [x26]
	cmp	w8, #46
	b.ne	LBB12_64
; %bb.56:                               ;   in Loop: Header=BB12_5 Depth=1
	tst	w23, #0xffff
	b.eq	LBB12_64
; %bb.57:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w9, w19, w23
	sub	w9, w9, #1
	ldrb	w9, [x9]
	cmp	w9, #32
	b.ne	LBB12_64
; %bb.58:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w9, w26, #1
	ldrb	w9, [x9]
	cmp	w9, #32
	b.ne	LBB12_64
; %bb.59:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w27, #1                         ; =0x1
LBB12_60:                               ;   in Loop: Header=BB12_5 Depth=1
	sxth	w9, w23
	cmp	w9, #1
	b.lt	LBB12_66
	.p2align	4, , 8
LBB12_61:                               ;   Parent Loop BB12_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w8, w20, w9
	ldrb	w8, [x8]
	cmp	w8, #32
	b.ne	LBB12_65
; %bb.62:                               ;   in Loop: Header=BB12_61 Depth=2
	subs	w9, w9, #1
	b.gt	LBB12_61
; %bb.63:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w23, wzr
	b	LBB12_66
	.p2align	4, , 8
LBB12_64:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w9, w25, #1
	sub	w10, w8, #65
	sxth	x11, w9
	orr	w12, w8, #0x20
	cmp	w10, #26
	mov	w25, w9
	csel	w12, w12, w8, lo
	ldrb	w8, [x1, x11]
	sxth	w10, w9
	strb	w12, [x19, w23, sxtw]
	b	LBB12_69
LBB12_65:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w23, w9
LBB12_66:                               ;   in Loop: Header=BB12_5 Depth=1
	add	w10, w27, w25
	.p2align	4, , 8
LBB12_67:                               ;   Parent Loop BB12_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w25, w10
	add	w10, w10, #1
	sxth	x8, w25
	ldrb	w8, [x1, x8]
	cmp	w8, #32
	b.eq	LBB12_67
; %bb.68:                               ;   in Loop: Header=BB12_5 Depth=1
	sxth	w10, w25
	strb	w21, [x19, w9, sxtw]
LBB12_69:                               ;   in Loop: Header=BB12_5 Depth=1
	mov	w9, w23
	add	w11, w23, #1
	sxth	w23, w11
	cbz	w8, LBB12_71
; %bb.70:                               ;   in Loop: Header=BB12_5 Depth=1
	add	x26, x1, w10, sxtw
	cmp	w23, #63
	b.lt	LBB12_5
LBB12_71:
	add	x24, sp, #16
	mov	w8, #32766                      ; =0x7ffe
	cmp	w8, w9, uxth
	strb	wzr, [x24, w23, sxtw]
	b.lo	LBB12_116
; %bb.72:
	mov	w25, wzr
	mov	w26, #46                        ; =0x2e
Lloh54:
	adrp	x20, l_.str.34@PAGE
Lloh55:
	add	x20, x20, l_.str.34@PAGEOFF
Lloh56:
	adrp	x19, l_.str.27@PAGE
Lloh57:
	add	x19, x19, l_.str.27@PAGEOFF
Lloh58:
	adrp	x21, l_.str.35@PAGE
Lloh59:
	add	x21, x21, l_.str.35@PAGEOFF
	b	LBB12_74
	.p2align	4, , 8
LBB12_73:                               ;   in Loop: Header=BB12_74 Depth=1
	add	w25, w25, #1
	cmp	w25, w23
	b.eq	LBB12_116
LBB12_74:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB12_108 Depth 2
                                        ;     Child Loop BB12_85 Depth 2
                                        ;     Child Loop BB12_91 Depth 2
                                        ;     Child Loop BB12_97 Depth 2
                                        ;     Child Loop BB12_103 Depth 2
	add	x22, x24, w25, sxtw
	mov	x1, x20
	mov	x0, x22
	mov	w2, #3                          ; =0x3
	bl	_csstrncmp
	cbz	w0, LBB12_117
; %bb.75:                               ;   in Loop: Header=BB12_74 Depth=1
	mov	x0, x22
	mov	x1, x21
	mov	w2, #4                          ; =0x4
	bl	_csstrncmp
	cbnz	w0, LBB12_78
; %bb.76:                               ;   in Loop: Header=BB12_74 Depth=1
	cbz	w25, LBB12_117
; %bb.77:                               ;   in Loop: Header=BB12_74 Depth=1
	sub	w8, w22, #1
	ldrb	w8, [x8]
	sub	w9, w8, #58
	sub	w8, w8, #123
	cmn	w9, #10
	ccmn	w8, #26, #2, lo
	b.lo	LBB12_117
LBB12_78:                               ;   in Loop: Header=BB12_74 Depth=1
	cbz	w25, LBB12_81
; %bb.79:                               ;   in Loop: Header=BB12_74 Depth=1
	ldrb	w8, [x24, w25, sxtw]
	cmp	w8, #46
	b.ne	LBB12_81
; %bb.80:                               ;   in Loop: Header=BB12_74 Depth=1
	sub	w8, w22, #1
	ldrb	w8, [x8]
	sub	w9, w8, #58
	sub	w8, w8, #123
	cmn	w9, #10
	ccmn	w8, #26, #2, lo
	b.hs	LBB12_107
LBB12_81:                               ;   in Loop: Header=BB12_74 Depth=1
	ldrb	w8, [x22]
	sub	w8, w8, #48
	cmp	w8, #9
	b.hi	LBB12_73
; %bb.82:                               ;   in Loop: Header=BB12_74 Depth=1
	cbz	w25, LBB12_84
; %bb.83:                               ;   in Loop: Header=BB12_74 Depth=1
	sub	w8, w22, #1
	ldrb	w8, [x8]
	sub	w9, w8, #48
	sub	w10, w8, #97
	cmp	w9, #10
	ccmp	w10, #26, #0, hs
	ccmp	w8, w26, #4, hs
	b.eq	LBB12_73
LBB12_84:                               ;   in Loop: Header=BB12_74 Depth=1
	mov	w9, wzr
	mov	w11, w25
	.p2align	4, , 8
LBB12_85:                               ;   Parent Loop BB12_74 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w8, w11
	add	w11, w11, #1
	sxth	x10, w11
	add	w9, w9, #1
	sxth	w9, w9
	ldrb	w10, [x24, x10]
	sub	w12, w10, #48
	cmp	w12, #10
	b.lo	LBB12_85
; %bb.86:                               ;   in Loop: Header=BB12_74 Depth=1
	cbz	w9, LBB12_73
; %bb.87:                               ;   in Loop: Header=BB12_74 Depth=1
	cmp	w9, #3
	b.gt	LBB12_73
; %bb.88:                               ;   in Loop: Header=BB12_74 Depth=1
	cmp	w10, #46
	b.ne	LBB12_73
; %bb.89:                               ;   in Loop: Header=BB12_74 Depth=1
	add	w11, w8, #2
	sxth	x8, w11
	ldrb	w8, [x24, x8]
	sub	w8, w8, #48
	cmp	w8, #9
	b.hi	LBB12_73
; %bb.90:                               ;   in Loop: Header=BB12_74 Depth=1
	mov	w9, wzr
                                        ; kill: def $w11 killed $w11 killed $x11 def $x11
	.p2align	4, , 8
LBB12_91:                               ;   Parent Loop BB12_74 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w8, w11
	add	w11, w11, #1
	sxth	x10, w11
	add	w9, w9, #1
	sxth	w9, w9
	ldrb	w10, [x24, x10]
	sub	w12, w10, #48
	cmp	w12, #10
	b.lo	LBB12_91
; %bb.92:                               ;   in Loop: Header=BB12_74 Depth=1
	cbz	w9, LBB12_73
; %bb.93:                               ;   in Loop: Header=BB12_74 Depth=1
	cmp	w9, #3
	b.gt	LBB12_73
; %bb.94:                               ;   in Loop: Header=BB12_74 Depth=1
	cmp	w10, #46
	b.ne	LBB12_73
; %bb.95:                               ;   in Loop: Header=BB12_74 Depth=1
	add	w11, w8, #2
	sxth	x8, w11
	ldrb	w8, [x24, x8]
	sub	w8, w8, #48
	cmp	w8, #9
	b.hi	LBB12_73
; %bb.96:                               ;   in Loop: Header=BB12_74 Depth=1
	mov	w9, wzr
                                        ; kill: def $w11 killed $w11 killed $x11 def $x11
	.p2align	4, , 8
LBB12_97:                               ;   Parent Loop BB12_74 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w8, w11
	add	w11, w11, #1
	sxth	x10, w11
	add	w9, w9, #1
	sxth	w9, w9
	ldrb	w10, [x24, x10]
	sub	w12, w10, #48
	cmp	w12, #10
	b.lo	LBB12_97
; %bb.98:                               ;   in Loop: Header=BB12_74 Depth=1
	cbz	w9, LBB12_73
; %bb.99:                               ;   in Loop: Header=BB12_74 Depth=1
	cmp	w9, #3
	b.gt	LBB12_73
; %bb.100:                              ;   in Loop: Header=BB12_74 Depth=1
	cmp	w10, #46
	b.ne	LBB12_73
; %bb.101:                              ;   in Loop: Header=BB12_74 Depth=1
	add	w8, w8, #2
	sxth	x9, w8
	ldrb	w9, [x24, x9]
	sub	w9, w9, #48
	cmp	w9, #9
	b.hi	LBB12_73
; %bb.102:                              ;   in Loop: Header=BB12_74 Depth=1
	mov	w9, wzr
                                        ; kill: def $w8 killed $w8 killed $x8 def $x8
LBB12_103:                              ;   Parent Loop BB12_74 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w8, w8, #1
	add	w9, w9, #1
	sxth	x10, w8
	sxth	w9, w9
	ldrb	w10, [x24, x10]
	sub	w10, w10, #48
	cmp	w10, #10
	b.lo	LBB12_103
; %bb.104:                              ;   in Loop: Header=BB12_74 Depth=1
	cmp	w9, #3
	ccmp	w9, #0, #4, le
	b.eq	LBB12_73
; %bb.105:                              ;   in Loop: Header=BB12_74 Depth=1
	add	x8, x24, w8, sxth
	ldrb	w9, [x8]
	cmp	w9, #46
	b.ne	LBB12_117
; %bb.106:                              ;   in Loop: Header=BB12_74 Depth=1
	add	w8, w8, #1
	ldrb	w8, [x8]
	sub	w8, w8, #48
	cmp	w8, #9
	b.ls	LBB12_73
	b	LBB12_117
	.p2align	4, , 8
LBB12_107:                              ;   in Loop: Header=BB12_74 Depth=1
	mov	w8, w25
	.p2align	4, , 8
LBB12_108:                              ;   Parent Loop BB12_74 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w8, w8, #1
	sxth	x9, w8
	ldrb	w9, [x24, x9]
	sub	w10, w9, #97
	cmp	w10, #26
	b.lo	LBB12_108
; %bb.109:                              ;   in Loop: Header=BB12_74 Depth=1
	sxth	w27, w8
	mvn	w8, w25
	sub	w9, w9, #58
	add	w1, w27, w8
	cmn	w9, #11
	ccmp	w1, #2, #8, ls
	b.lt	LBB12_73
; %bb.110:                              ;   in Loop: Header=BB12_74 Depth=1
	add	x0, x22, #1
	bl	_chat_link_domain
	cmp	w0, #1
	b.eq	LBB12_112
; %bb.111:                              ;   in Loop: Header=BB12_74 Depth=1
	cmp	w0, #2
	b.ne	LBB12_81
	b	LBB12_117
LBB12_112:                              ;   in Loop: Header=BB12_74 Depth=1
	add	x9, x24, w27, sxtw
	ldrb	w8, [x9]
	cmp	w8, #46
	b.eq	LBB12_115
; %bb.113:                              ;   in Loop: Header=BB12_74 Depth=1
	cmp	w8, #47
	b.eq	LBB12_117
; %bb.114:                              ;   in Loop: Header=BB12_74 Depth=1
	cmp	w8, #58
	b.ne	LBB12_81
	b	LBB12_117
LBB12_115:                              ;   in Loop: Header=BB12_74 Depth=1
	add	w8, w9, #1
	ldrb	w8, [x8]
	sub	w8, w8, #97
	cmp	w8, #26
	b.hs	LBB12_81
	b	LBB12_117
LBB12_116:
	mov	x19, xzr
LBB12_117:
	mov	x0, x19
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
	.loh AdrpAdd	Lloh50, Lloh51
	.loh AdrpAdd	Lloh52, Lloh53
	.loh AdrpAdd	Lloh58, Lloh59
	.loh AdrpAdd	Lloh56, Lloh57
	.loh AdrpAdd	Lloh54, Lloh55
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_host_config_flags
_chat_host_config_flags:                ; @chat_host_config_flags
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
Lloh60:
	adrp	x0, l_.str.100@PAGE
Lloh61:
	add	x0, x0, l_.str.100@PAGEOFF
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	bl	_config_string
	cbz	w0, LBB13_14
; %bb.1:
	ldrb	w8, [x0]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w9, w10, w8, lo
	cmp	w9, #111
	b.ne	LBB13_5
; %bb.2:
	mov	w9, wzr
Lloh62:
	adrp	x10, l_.str.101@PAGE
Lloh63:
	add	x10, x10, l_.str.101@PAGEOFF
	.p2align	4, , 8
LBB13_3:                                ; =>This Inner Loop Header: Depth=1
	cbz	w8, LBB13_12
; %bb.4:                                ;   in Loop: Header=BB13_3 Depth=1
	add	w9, w9, #1
	sxth	x11, w9
	ldrb	w8, [x0, x11]
	ldrb	w11, [x10, x11]
	sub	w12, w8, #65
	orr	w13, w8, #0x20
	cmp	w12, #26
	sub	w12, w11, #65
	csel	w13, w13, w8, lo
	orr	w14, w11, #0x20
	cmp	w12, #26
	csel	w11, w14, w11, lo
	cmp	w13, w11
	b.eq	LBB13_3
LBB13_5:
	mov	x20, x0
	bl	_p2p_hosting_listed
	mov	w19, w0
	bl	_halo_server_mode
	cbz	w19, LBB13_7
; %bb.6:
	cbz	w0, LBB13_14
LBB13_7:
	ldrb	w9, [x20]
	sub	w10, w9, #65
	orr	w11, w9, #0x20
	cmp	w10, #26
	csel	w10, w11, w9, lo
	cmp	w10, #108
	b.ne	LBB13_11
; %bb.8:
	mov	x8, x20
	mov	w10, wzr
Lloh64:
	adrp	x11, l_.str.102@PAGE
Lloh65:
	add	x11, x11, l_.str.102@PAGEOFF
	.p2align	4, , 8
LBB13_9:                                ; =>This Inner Loop Header: Depth=1
	cbz	w9, LBB13_13
; %bb.10:                               ;   in Loop: Header=BB13_9 Depth=1
	add	w10, w10, #1
	sxth	x12, w10
	ldrb	w9, [x8, x12]
	ldrb	w12, [x11, x12]
	sub	w13, w9, #65
	orr	w14, w9, #0x20
	cmp	w13, #26
	sub	w13, w12, #65
	csel	w14, w14, w9, lo
	orr	w15, w12, #0x20
	cmp	w13, #26
	csel	w12, w15, w12, lo
	cmp	w14, w12
	b.eq	LBB13_9
LBB13_11:
	mov	w0, #1                          ; =0x1
	b	LBB13_14
LBB13_12:
	mov	w0, wzr
	b	LBB13_14
LBB13_13:
	mov	w0, #3                          ; =0x3
LBB13_14:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh60, Lloh61
	.loh AdrpAdd	Lloh62, Lloh63
	.loh AdrpAdd	Lloh64, Lloh65
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_host_send
_chat_host_send:                        ; @chat_host_send
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	sub	sp, sp, #640
	mov	x23, x2
	mov	w20, w1
	mov	w22, w0
	bl	_distributed_player
	mov	x19, x0
	bl	_game_engine_has_teams
	str	w0, [sp, #8]                    ; 4-byte Spill
	add	x0, sp, #120
	mov	w1, #128                        ; =0x80
	bl	_distributed_client_machines
	str	w0, [sp, #12]                   ; 4-byte Spill
	str	x19, [sp, #16]                  ; 8-byte Spill
	cbz	w19, LBB14_2
; %bb.1:
	ldr	x8, [sp, #16]                   ; 8-byte Reload
	ldrb	w8, [x8, #209]
	cbz	w8, LBB14_3
LBB14_2:
	add	sp, sp, #640
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB14_3:
	ldr	x8, [sp, #16]                   ; 8-byte Reload
	ldr	w0, [x8, #52]
	cmn	w0, #1
	b.eq	LBB14_7
; %bb.4:
	mov	w1, #-1                         ; =0xffffffff
	mov	w26, #-1                        ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	cbz	w0, LBB14_8
	.p2align	4, , 8
LBB14_5:                                ; =>This Inner Loop Header: Depth=1
	ldr	w25, [x0, #204]
	cmn	w25, #1
	b.eq	LBB14_8
; %bb.6:                                ;   in Loop: Header=BB14_5 Depth=1
	mov	w0, w25
	mov	w1, #-1                         ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	mov	w26, w25
	cbnz	w0, LBB14_5
	b	LBB14_8
LBB14_7:
	mov	w26, #-1                        ; =0xffffffff
LBB14_8:
	mov	w0, w22
	mov	w1, w20
	mov	x2, x23
	bl	_server_event_chat
	add	x0, sp, #44
	mov	w1, wzr
	mov	w2, #76                         ; =0x4c
	cmp	w20, #1
	cset	w8, eq
	cmp	w20, #2
	csel	w19, w20, w8, eq
	add	x21, sp, #44
	bl	_csmemset
	cmn	w22, #1
	b.eq	LBB14_10
; %bb.9:
	mov	w0, w22
	bl	_distributed_player_to_byte
	strb	w0, [sp, #52]
LBB14_10:
	add	x0, x21, #12
	mov	x1, x23
	mov	w2, #63                         ; =0x3f
	strb	w19, [sp, #53]
	str	x23, [sp]                       ; 8-byte Spill
	bl	_csstrncpy
	ldr	w8, [sp, #12]                   ; 4-byte Reload
	cmp	w8, #1
	b.lt	LBB14_31
; %bb.11:
	mov	w28, wzr
	add	x19, sp, #120
	b	LBB14_14
	.p2align	4, , 8
LBB14_12:                               ;   in Loop: Header=BB14_14 Depth=1
	lsl	w8, w28, #2
	add	x1, sp, #44
	mov	w2, #88                         ; =0x58
	mov	w3, #1                          ; =0x1
	ldr	w0, [x19, w8, sxtw]
	mov	w4, #76                         ; =0x4c
	bl	_distributed_send_to_machine_reliably
LBB14_13:                               ;   in Loop: Header=BB14_14 Depth=1
	ldr	w8, [sp, #12]                   ; 4-byte Reload
	add	w28, w28, #1
	cmp	w28, w8
	b.eq	LBB14_31
LBB14_14:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_18 Depth 2
                                        ;       Child Loop BB14_22 Depth 3
	ldr	w0, [x19, w28, sxtw #2]
	mov	w1, w22
	bl	_distributed_machine_has_player
Lloh66:
	adrp	x8, _player_data@GOTPAGE
	mov	w25, w0
	add	x0, sp, #28
Lloh67:
	ldr	w8, [x8, _player_data@GOTPAGEOFF]
Lloh68:
	ldr	w1, [x8]
	bl	_data_iterator_new
	cbnz	w25, LBB14_12
; %bb.15:                               ;   in Loop: Header=BB14_14 Depth=1
	add	x0, sp, #28
	bl	_data_iterator_next
	cbz	w0, LBB14_13
; %bb.16:                               ;   in Loop: Header=BB14_14 Depth=1
	lsl	w23, w28, #2
	b	LBB14_18
	.p2align	4, , 8
LBB14_17:                               ;   in Loop: Header=BB14_18 Depth=2
	add	x0, sp, #28
	bl	_data_iterator_next
	cbz	w0, LBB14_13
LBB14_18:                               ;   Parent Loop BB14_14 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB14_22 Depth 3
	ldrb	w8, [x0, #209]
	cbnz	w8, LBB14_17
; %bb.19:                               ;   in Loop: Header=BB14_18 Depth=2
	ldr	w8, [x19, w23, sxtw]
	mov	x21, x0
	ldrsh	w1, [sp, #36]
	mov	w0, w8
	bl	_distributed_machine_has_player
	cbz	w0, LBB14_17
; %bb.20:                               ;   in Loop: Header=BB14_18 Depth=2
	ldr	x9, [sp, #16]                   ; 8-byte Reload
	ldr	w0, [x21, #52]
	ldr	w21, [x21, #32]
	ldr	w27, [x9, #32]
	cmn	w0, #1
	b.eq	LBB14_28
; %bb.21:                               ;   in Loop: Header=BB14_18 Depth=2
	mov	w1, #-1                         ; =0xffffffff
	mov	w24, #-1                        ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	cbz	w0, LBB14_24
	.p2align	4, , 8
LBB14_22:                               ;   Parent Loop BB14_14 Depth=1
                                        ;     Parent Loop BB14_18 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	w25, [x0, #204]
	cmn	w25, #1
	b.eq	LBB14_24
; %bb.23:                               ;   in Loop: Header=BB14_22 Depth=3
	mov	w0, w25
	mov	w1, #-1                         ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	mov	w24, w25
	cbnz	w0, LBB14_22
	.p2align	4, , 8
LBB14_24:                               ;   in Loop: Header=BB14_18 Depth=2
	cmp	w20, #1
	b.eq	LBB14_29
LBB14_25:                               ;   in Loop: Header=BB14_18 Depth=2
	cmp	w20, #2
	b.ne	LBB14_12
; %bb.26:                               ;   in Loop: Header=BB14_18 Depth=2
	cmn	w26, #1
	b.eq	LBB14_17
; %bb.27:                               ;   in Loop: Header=BB14_18 Depth=2
	cmp	w26, w24
	b.ne	LBB14_17
	b	LBB14_12
LBB14_28:                               ;   in Loop: Header=BB14_18 Depth=2
	mov	w24, #-1                        ; =0xffffffff
	cmp	w20, #1
	b.ne	LBB14_25
LBB14_29:                               ;   in Loop: Header=BB14_18 Depth=2
	ldr	w8, [sp, #8]                    ; 4-byte Reload
	cbz	w8, LBB14_12
; %bb.30:                               ;   in Loop: Header=BB14_18 Depth=2
	cmp	w27, w21
	b.ne	LBB14_17
	b	LBB14_12
LBB14_31:
	mov	w0, #-1                         ; =0xffffffff
	bl	_local_player_get_next
	ldr	x27, [sp]                       ; 8-byte Reload
	cmn	w0, #1
	b.ne	LBB14_33
	b	LBB14_2
	.p2align	4, , 8
LBB14_32:                               ;   in Loop: Header=BB14_33 Depth=1
	mov	w0, w24
	bl	_local_player_get_next
	cmn	w0, #1
	b.eq	LBB14_2
LBB14_33:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_37 Depth 2
	sxth	w24, w0
	mov	w0, w24
	bl	_local_player_get_player_index
	cmn	w0, #1
	b.eq	LBB14_32
; %bb.34:                               ;   in Loop: Header=BB14_33 Depth=1
	mov	w25, w0
	cmp	w22, w0, sxth
	b.eq	LBB14_46
; %bb.35:                               ;   in Loop: Header=BB14_33 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Reload
Lloh69:
	adrp	x21, _player_data@GOTPAGE
	mov	w1, w25
	ldr	w19, [x8, #32]
Lloh70:
	ldr	w21, [x21, _player_data@GOTPAGEOFF]
	ldr	w0, [x21]
	bl	_datum_get
	ldr	w8, [x21]
	mov	w1, w25
	ldr	w23, [x0, #32]
	mov	x0, x8
	bl	_datum_get
	ldr	w0, [x0, #52]
	cmn	w0, #1
	b.eq	LBB14_43
; %bb.36:                               ;   in Loop: Header=BB14_33 Depth=1
	mov	w1, #-1                         ; =0xffffffff
	mov	w21, #-1                        ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	cbz	w0, LBB14_39
	.p2align	4, , 8
LBB14_37:                               ;   Parent Loop BB14_33 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w25, [x0, #204]
	cmn	w25, #1
	b.eq	LBB14_39
; %bb.38:                               ;   in Loop: Header=BB14_37 Depth=2
	mov	w0, w25
	mov	w1, #-1                         ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	mov	w21, w25
	cbnz	w0, LBB14_37
	.p2align	4, , 8
LBB14_39:                               ;   in Loop: Header=BB14_33 Depth=1
	cmp	w20, #1
	b.eq	LBB14_44
LBB14_40:                               ;   in Loop: Header=BB14_33 Depth=1
	cmp	w20, #2
	b.ne	LBB14_46
; %bb.41:                               ;   in Loop: Header=BB14_33 Depth=1
	cmn	w26, #1
	b.eq	LBB14_32
; %bb.42:                               ;   in Loop: Header=BB14_33 Depth=1
	cmp	w26, w21
	b.ne	LBB14_32
	b	LBB14_46
	.p2align	4, , 8
LBB14_43:                               ;   in Loop: Header=BB14_33 Depth=1
	mov	w21, #-1                        ; =0xffffffff
	cmp	w20, #1
	b.ne	LBB14_40
LBB14_44:                               ;   in Loop: Header=BB14_33 Depth=1
	ldr	w8, [sp, #8]                    ; 4-byte Reload
	cbz	w8, LBB14_46
; %bb.45:                               ;   in Loop: Header=BB14_33 Depth=1
	cmp	w19, w23
	b.ne	LBB14_32
LBB14_46:
	mov	w0, w22
	mov	w1, w20
	mov	x2, x27
	bl	_chat_add_line
	b	LBB14_2
	.loh AdrpLdrGotLdr	Lloh66, Lloh67, Lloh68
	.loh AdrpLdrGot	Lloh69, Lloh70
                                        ; -- End function
	.globl	_network_chat_line_entry_size   ; -- Begin function network_chat_line_entry_size
	.p2align	4
_network_chat_line_entry_size:          ; @network_chat_line_entry_size
; %bb.0:
	mov	w0, #68                         ; =0x44
	ret
                                        ; -- End function
	.globl	_network_chat_handle_down       ; -- Begin function network_chat_handle_down
	.p2align	4
_network_chat_handle_down:              ; @network_chat_handle_down
; %bb.0:
	sub	sp, sp, #176
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	mov	w20, w1
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	mov	x19, x0
	bl	_game_connection
	cmp	w0, #1
	ccmp	w20, #0, #4, eq
	b.eq	LBB16_41
; %bb.1:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB16_28
; %bb.2:
	bl	_p2p_joined_listed_dedicated
LBB16_3:
	add	x0, sp, #76
	mov	x1, x19
	mov	w2, #68                         ; =0x44
	add	x19, sp, #76
	bl	_csmemcpy
	mov	w10, wzr
	mov	w8, wzr
	mov	w11, #124                       ; =0x7c
	mov	w12, #63                        ; =0x3f
	add	x13, sp, #12
	b	LBB16_6
	.p2align	4, , 8
LBB16_4:                                ;   in Loop: Header=BB16_6 Depth=1
	add	w8, w8, #1
	strb	w14, [x13, w9, sxtw]
LBB16_5:                                ;   in Loop: Header=BB16_6 Depth=1
	add	w10, w10, #4
	cmp	w10, #64
	b.eq	LBB16_30
LBB16_6:                                ; =>This Inner Loop Header: Depth=1
	add	w9, w19, w10
	add	w9, w9, #4
	ldrb	w14, [x9]
	sxth	w9, w8
	cbz	w14, LBB16_31
; %bb.7:                                ;   in Loop: Header=BB16_6 Depth=1
	cmp	w9, #62
	b.gt	LBB16_31
; %bb.8:                                ;   in Loop: Header=BB16_6 Depth=1
	sub	w15, w14, #127
	and	w15, w15, #0xff
	cmp	w15, #161
	and	w15, w8, #0xffff
	ccmp	w14, w11, #4, hs
	csel	w14, w12, w14, eq
	cmp	w14, #32
	ccmp	w15, #0, #0, eq
	b.eq	LBB16_10
; %bb.9:                                ;   in Loop: Header=BB16_6 Depth=1
	add	w8, w8, #1
	strb	w14, [x13, w9, sxtw]
	b	LBB16_11
	.p2align	4, , 8
LBB16_10:                               ;   in Loop: Header=BB16_6 Depth=1
	mov	w8, wzr
LBB16_11:                               ;   in Loop: Header=BB16_6 Depth=1
	add	w9, w19, w10
	add	w9, w9, #5
	ldrb	w14, [x9]
	sxth	w9, w8
	cbz	w14, LBB16_31
; %bb.12:                               ;   in Loop: Header=BB16_6 Depth=1
	cmp	w9, #62
	b.gt	LBB16_31
; %bb.13:                               ;   in Loop: Header=BB16_6 Depth=1
	sub	w15, w14, #127
	and	w15, w15, #0xff
	cmp	w15, #161
	ccmp	w14, w11, #4, hs
	csel	w14, w12, w14, eq
	cmp	w14, #32
	b.ne	LBB16_16
; %bb.14:                               ;   in Loop: Header=BB16_6 Depth=1
	tst	w8, #0xffff
	b.ne	LBB16_16
; %bb.15:                               ;   in Loop: Header=BB16_6 Depth=1
	mov	w8, wzr
	b	LBB16_17
	.p2align	4, , 8
LBB16_16:                               ;   in Loop: Header=BB16_6 Depth=1
	add	w8, w8, #1
	strb	w14, [x13, w9, sxtw]
LBB16_17:                               ;   in Loop: Header=BB16_6 Depth=1
	add	w9, w19, w10
	add	w9, w9, #6
	ldrb	w14, [x9]
	sxth	w9, w8
	cbz	w14, LBB16_31
; %bb.18:                               ;   in Loop: Header=BB16_6 Depth=1
	cmp	w9, #62
	b.gt	LBB16_31
; %bb.19:                               ;   in Loop: Header=BB16_6 Depth=1
	sub	w15, w14, #127
	and	w15, w15, #0xff
	cmp	w15, #161
	ccmp	w14, w11, #4, hs
	csel	w14, w12, w14, eq
	cmp	w14, #32
	b.ne	LBB16_22
; %bb.20:                               ;   in Loop: Header=BB16_6 Depth=1
	tst	w8, #0xffff
	b.ne	LBB16_22
; %bb.21:                               ;   in Loop: Header=BB16_6 Depth=1
	mov	w8, wzr
	b	LBB16_23
	.p2align	4, , 8
LBB16_22:                               ;   in Loop: Header=BB16_6 Depth=1
	add	w8, w8, #1
	strb	w14, [x13, w9, sxtw]
LBB16_23:                               ;   in Loop: Header=BB16_6 Depth=1
	add	w9, w19, w10
	add	w9, w9, #7
	ldrb	w14, [x9]
	sxth	w9, w8
	cbz	w14, LBB16_31
; %bb.24:                               ;   in Loop: Header=BB16_6 Depth=1
	cmp	w9, #62
	b.gt	LBB16_31
; %bb.25:                               ;   in Loop: Header=BB16_6 Depth=1
	sub	w15, w14, #127
	and	w15, w15, #0xff
	cmp	w15, #161
	ccmp	w14, w11, #4, hs
	csel	w14, w12, w14, eq
	cmp	w14, #32
	b.ne	LBB16_4
; %bb.26:                               ;   in Loop: Header=BB16_6 Depth=1
	tst	w8, #0xffff
	b.ne	LBB16_4
; %bb.27:                               ;   in Loop: Header=BB16_6 Depth=1
	mov	w8, wzr
	b	LBB16_5
LBB16_28:
	bl	_p2p_joined_listed_host
	mov	w20, w0
	bl	_p2p_joined_listed_dedicated
	cbz	w20, LBB16_3
; %bb.29:
	cbz	w0, LBB16_41
	b	LBB16_3
LBB16_30:
	sxth	w9, w8
LBB16_31:
	sxth	w10, w8
	cmp	w10, #1
	b.lt	LBB16_36
; %bb.32:
	add	x8, sp, #12
	sub	w8, w8, #1
	.p2align	4, , 8
LBB16_33:                               ; =>This Inner Loop Header: Depth=1
	add	w10, w8, w9
	ldrb	w10, [x10]
	cmp	w10, #32
	b.ne	LBB16_35
; %bb.34:                               ;   in Loop: Header=BB16_33 Depth=1
	subs	w9, w9, #1
	b.gt	LBB16_33
	b	LBB16_41
LBB16_35:
	mov	w8, w9
LBB16_36:
	add	x10, sp, #12
	tst	w8, #0xffff
	strb	wzr, [x10, w9, sxtw]
	b.eq	LBB16_41
; %bb.37:
	ldrb	w8, [sp, #77]
	tbnz	w8, #2, LBB16_40
; %bb.38:
	ldrb	w0, [sp, #76]
	bl	_distributed_player_from_byte
	cmn	w0, #1
	b.eq	LBB16_41
; %bb.39:
	ldrb	w8, [sp, #77]
	add	x2, sp, #12
	ldrb	w0, [sp, #76]
	and	w9, w8, #0x1
	tst	w8, #0x2
	mov	w8, #2                          ; =0x2
	csel	w1, w9, w8, eq
	bl	_chat_add_line
	b	LBB16_41
LBB16_40:
	add	x0, sp, #12
	bl	_chat_add_notice
LBB16_41:
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_add_notice
_chat_add_notice:                       ; @chat_add_notice
; %bb.0:
	sub	sp, sp, #64
	adrp	x11, _chat_newest_line@PAGE
	adrp	x8, _chat_line_count@PAGE
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	ldrsh	w9, [x11, _chat_newest_line@PAGEOFF]
	ldrsh	w10, [x8, _chat_line_count@PAGEOFF]
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	add	w9, w9, #1
	negs	w12, w9
	and	w9, w9, #0x3f
	and	w12, w12, #0x3f
	csneg	w9, w9, w12, mi
	cmp	w10, #63
	strh	w9, [x11, _chat_newest_line@PAGEOFF]
	b.gt	LBB17_2
; %bb.1:
	add	w10, w10, #1
	strh	w10, [x8, _chat_line_count@PAGEOFF]
LBB17_2:
	mov	w8, #100                        ; =0x64
Lloh71:
	adrp	x10, _chat_lines@PAGE
Lloh72:
	add	x10, x10, _chat_lines@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w9, w8, x10
	mov	w2, #100                        ; =0x64
	mov	x0, x20
	bl	_csmemset
	add	x0, x20, #24
	mov	x1, x21
	mov	w2, #63                         ; =0x3f
	add	x19, x20, #24
	bl	_csstrncpy
	bl	_system_milliseconds
	mov	w8, #2                          ; =0x2
	str	w0, [x20, #96]
	mov	w0, #-1                         ; =0xffffffff
	str	w8, [x20, #88]
	bl	_local_player_get_next
	cmn	w0, #1
	b.eq	LBB17_5
; %bb.3:
	mov	w21, wzr
	mov	w22, #1                         ; =0x1
	.p2align	4, , 8
LBB17_4:                                ; =>This Inner Loop Header: Depth=1
	tst	w0, #0xfffc
	lsl	w8, w22, w0
	sxth	w0, w0
	csel	w8, w8, wzr, eq
	orr	w21, w8, w21
	bl	_local_player_get_next
	cmn	w0, #1
	b.ne	LBB17_4
	b	LBB17_6
LBB17_5:
	mov	w21, wzr
LBB17_6:
Lloh73:
	adrp	x1, l_.str.103@PAGE
Lloh74:
	add	x1, x1, l_.str.103@PAGEOFF
	mov	w0, #3                          ; =0x3
	strh	w21, [x20, #92]
	str	w19, [sp]
	bl	_error
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	b	_social_chat_upstream_notice
	.loh AdrpAdd	Lloh71, Lloh72
	.loh AdrpAdd	Lloh73, Lloh74
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_add_line
_chat_add_line:                         ; @chat_add_line
; %bb.0:
	sub	sp, sp, #160
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
	mov	w28, w1
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	mov	x23, x2
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	str	w0, [sp, #48]                   ; 4-byte Spill
	bl	_distributed_player
	mov	x24, x0
	cbz	w24, LBB18_84
; %bb.1:
	ldrsb	w0, [x24, #100]
	bl	_network_voice_machine_muted
	cbnz	w0, LBB18_84
; %bb.2:
	adrp	x11, _chat_newest_line@PAGE
	adrp	x8, _chat_line_count@PAGE
	ldrsh	w9, [x11, _chat_newest_line@PAGEOFF]
	ldrsh	w10, [x8, _chat_line_count@PAGEOFF]
	add	w9, w9, #1
	negs	w12, w9
	and	w9, w9, #0x3f
	and	w12, w12, #0x3f
	csneg	w9, w9, w12, mi
	cmp	w10, #63
	strh	w9, [x11, _chat_newest_line@PAGEOFF]
	b.gt	LBB18_4
; %bb.3:
	add	w10, w10, #1
	strh	w10, [x8, _chat_line_count@PAGEOFF]
LBB18_4:
	mov	w8, #100                        ; =0x64
Lloh75:
	adrp	x10, _chat_lines@PAGE
Lloh76:
	add	x10, x10, _chat_lines@PAGEOFF
	mov	w1, wzr
	smaddl	x27, w9, w8, x10
	mov	w2, #100                        ; =0x64
	mov	x0, x27
	bl	_csmemset
	add	x0, x27, #24
	mov	x1, x23
	mov	w2, #63                         ; =0x3f
	bl	_csstrncpy
	bl	_system_milliseconds
	mov	x23, x24
	str	w0, [x27, #96]
	ldrh	w8, [x23, #4]!
	cbz	w8, LBB18_15
; %bb.5:
	ldrh	w8, [x24, #6]
	cbz	w8, LBB18_16
; %bb.6:
	ldrh	w8, [x24, #8]
	cbz	w8, LBB18_17
; %bb.7:
	ldrh	w8, [x24, #10]
	cbz	w8, LBB18_18
; %bb.8:
	ldrh	w8, [x24, #12]
	cbz	w8, LBB18_19
; %bb.9:
	ldrh	w8, [x24, #14]
	cbz	w8, LBB18_20
; %bb.10:
	ldrh	w8, [x24, #16]
	cbz	w8, LBB18_21
; %bb.11:
	ldrh	w8, [x24, #18]
	cbz	w8, LBB18_22
; %bb.12:
	ldrh	w8, [x24, #20]
	cbz	w8, LBB18_23
; %bb.13:
	ldrh	w8, [x24, #22]
	cbz	w8, LBB18_24
; %bb.14:
	ldrh	w8, [x24, #24]
	mov	w9, #20                         ; =0x14
	cmp	w8, #0
	mov	w8, #22                         ; =0x16
	csel	w2, w9, w8, eq
	b	LBB18_25
LBB18_15:
	mov	w2, wzr
	b	LBB18_25
LBB18_16:
	mov	w2, #2                          ; =0x2
	b	LBB18_25
LBB18_17:
	mov	w2, #4                          ; =0x4
	b	LBB18_25
LBB18_18:
	mov	w2, #6                          ; =0x6
	b	LBB18_25
LBB18_19:
	mov	w2, #8                          ; =0x8
	b	LBB18_25
LBB18_20:
	mov	w2, #10                         ; =0xa
	b	LBB18_25
LBB18_21:
	mov	w2, #12                         ; =0xc
	b	LBB18_25
LBB18_22:
	mov	w2, #14                         ; =0xe
	b	LBB18_25
LBB18_23:
	mov	w2, #16                         ; =0x10
	b	LBB18_25
LBB18_24:
	mov	w2, #18                         ; =0x12
LBB18_25:
	mov	x0, x27
	mov	x1, x23
	bl	_csmemcpy
	bl	_game_engine_has_teams
	cbz	w0, LBB18_27
; %bb.26:
	ldr	w8, [x24, #32]
	cmp	w8, #0
	cset	w8, ne
	b	LBB18_28
LBB18_27:
	mov	w8, #1                          ; =0x1
LBB18_28:
	strh	w8, [x27, #88]
	strh	w28, [x27, #90]
	bl	_game_engine_has_teams
	ldr	w8, [x24, #52]
	str	w0, [sp, #36]                   ; 4-byte Spill
	cmn	w8, #1
	b.eq	LBB18_33
; %bb.29:
	mov	w0, w8
	mov	w1, #-1                         ; =0xffffffff
	mov	w22, #-1                        ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	add	x8, x27, #24
	cbz	w0, LBB18_34
; %bb.30:
	str	x8, [sp, #24]                   ; 8-byte Spill
	.p2align	4, , 8
LBB18_31:                               ; =>This Inner Loop Header: Depth=1
	ldr	w26, [x0, #204]
	cmn	w26, #1
	b.eq	LBB18_35
; %bb.32:                               ;   in Loop: Header=BB18_31 Depth=1
	mov	w0, w26
	mov	w1, #-1                         ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	mov	w22, w26
	cbnz	w0, LBB18_31
	b	LBB18_35
LBB18_33:
	add	x8, x27, #24
	mov	w22, #-1                        ; =0xffffffff
LBB18_34:
	str	x8, [sp, #24]                   ; 8-byte Spill
LBB18_35:
	mov	w0, #-1                         ; =0xffffffff
	bl	_local_player_get_next
	cmn	w0, #1
	b.eq	LBB18_53
; %bb.36:
	mov	w26, w0
	mov	w25, wzr
	str	x27, [sp, #16]                  ; 8-byte Spill
	str	x24, [sp, #40]                  ; 8-byte Spill
	b	LBB18_39
	.p2align	4, , 8
LBB18_37:                               ;   in Loop: Header=BB18_39 Depth=1
	mov	w8, #1                          ; =0x1
	lsl	w8, w8, w26
	orr	w25, w25, w8
LBB18_38:                               ;   in Loop: Header=BB18_39 Depth=1
	mov	w0, w27
	bl	_local_player_get_next
	mov	w26, w0
	cmn	w0, #1
	b.eq	LBB18_52
LBB18_39:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB18_43 Depth 2
	sxth	w27, w26
	mov	w0, w27
	and	w19, w26, #0xffff
	bl	_local_player_get_player_index
	cmn	w0, #1
	ccmp	w19, #4, #2, ne
	b.hs	LBB18_38
; %bb.40:                               ;   in Loop: Header=BB18_39 Depth=1
	ldr	w8, [sp, #48]                   ; 4-byte Reload
	cmp	w8, w0, sxth
	b.eq	LBB18_37
; %bb.41:                               ;   in Loop: Header=BB18_39 Depth=1
	ldr	x8, [sp, #40]                   ; 8-byte Reload
Lloh77:
	adrp	x20, _player_data@GOTPAGE
	mov	w24, w28
	mov	w28, w0
	mov	w1, w28
	ldr	w19, [x8, #32]
Lloh78:
	ldr	w20, [x20, _player_data@GOTPAGEOFF]
	ldr	w8, [x20]
	mov	x0, x8
	bl	_datum_get
	ldr	w8, [x20]
	mov	w1, w28
	ldr	w21, [x0, #32]
	mov	x0, x8
	bl	_datum_get
	ldr	w0, [x0, #52]
	cmn	w0, #1
	b.eq	LBB18_45
; %bb.42:                               ;   in Loop: Header=BB18_39 Depth=1
	mov	w1, #-1                         ; =0xffffffff
	mov	w20, #-1                        ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	cbz	w0, LBB18_46
	.p2align	4, , 8
LBB18_43:                               ;   Parent Loop BB18_39 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w28, [x0, #204]
	cmn	w28, #1
	b.eq	LBB18_46
; %bb.44:                               ;   in Loop: Header=BB18_43 Depth=2
	mov	w0, w28
	mov	w1, #-1                         ; =0xffffffff
	bl	_object_try_and_get_and_verify_type
	mov	w20, w28
	cbnz	w0, LBB18_43
	b	LBB18_46
LBB18_45:                               ;   in Loop: Header=BB18_39 Depth=1
	mov	w20, #-1                        ; =0xffffffff
LBB18_46:                               ;   in Loop: Header=BB18_39 Depth=1
	mov	w28, w24
	cmp	w24, #1
	b.eq	LBB18_50
; %bb.47:                               ;   in Loop: Header=BB18_39 Depth=1
	cmp	w28, #2
	b.ne	LBB18_37
; %bb.48:                               ;   in Loop: Header=BB18_39 Depth=1
	cmn	w22, #1
	b.eq	LBB18_38
; %bb.49:                               ;   in Loop: Header=BB18_39 Depth=1
	cmp	w22, w20
	b.eq	LBB18_37
	b	LBB18_38
LBB18_50:                               ;   in Loop: Header=BB18_39 Depth=1
	ldr	w8, [sp, #36]                   ; 4-byte Reload
	cbz	w8, LBB18_37
; %bb.51:                               ;   in Loop: Header=BB18_39 Depth=1
	cmp	w19, w21
	b.ne	LBB18_38
	b	LBB18_37
LBB18_52:
	ldr	x24, [sp, #40]                  ; 8-byte Reload
	tst	w25, #0xffff
	ldr	x27, [sp, #16]                  ; 8-byte Reload
	b.ne	LBB18_57
LBB18_53:
	mov	w0, #-1                         ; =0xffffffff
	bl	_local_player_get_next
	cmn	w0, #1
	b.eq	LBB18_56
; %bb.54:
	mov	w25, wzr
	mov	w19, #1                         ; =0x1
	.p2align	4, , 8
LBB18_55:                               ; =>This Inner Loop Header: Depth=1
	tst	w0, #0xfffc
	lsl	w8, w19, w0
	sxth	w0, w0
	csel	w8, w8, wzr, eq
	orr	w25, w8, w25
	bl	_local_player_get_next
	cmn	w0, #1
	b.ne	LBB18_55
	b	LBB18_57
LBB18_56:
	mov	w25, wzr
LBB18_57:
	strh	w25, [x27, #92]
	ldrh	w8, [x23]
	cbz	w8, LBB18_68
; %bb.58:
	ldrh	w8, [x24, #6]
	ldr	x22, [sp, #24]                  ; 8-byte Reload
	cbz	w8, LBB18_69
; %bb.59:
	ldrh	w8, [x24, #8]
	cbz	w8, LBB18_70
; %bb.60:
	ldrh	w8, [x24, #10]
	cbz	w8, LBB18_71
; %bb.61:
	ldrh	w8, [x24, #12]
	cbz	w8, LBB18_72
; %bb.62:
	ldrh	w8, [x24, #14]
	cbz	w8, LBB18_73
; %bb.63:
	ldrh	w8, [x24, #16]
	cbz	w8, LBB18_74
; %bb.64:
	ldrh	w8, [x24, #18]
	cbz	w8, LBB18_75
; %bb.65:
	ldrh	w8, [x24, #20]
	cbz	w8, LBB18_76
; %bb.66:
	ldrh	w8, [x24, #22]
	cbz	w8, LBB18_77
; %bb.67:
	ldrh	w8, [x24, #24]
	cmp	w8, #0
	mov	w8, #10                         ; =0xa
	cinc	w19, w8, ne
	b	LBB18_78
LBB18_68:
	ldr	x22, [sp, #24]                  ; 8-byte Reload
	mov	w19, wzr
	b	LBB18_80
LBB18_69:
	mov	w19, #1                         ; =0x1
	b	LBB18_78
LBB18_70:
	mov	w19, #2                         ; =0x2
	b	LBB18_78
LBB18_71:
	mov	w19, #3                         ; =0x3
	b	LBB18_78
LBB18_72:
	mov	w19, #4                         ; =0x4
	b	LBB18_78
LBB18_73:
	mov	w19, #5                         ; =0x5
	b	LBB18_78
LBB18_74:
	mov	w19, #6                         ; =0x6
	b	LBB18_78
LBB18_75:
	mov	w19, #7                         ; =0x7
	b	LBB18_78
LBB18_76:
	mov	w19, #8                         ; =0x8
	b	LBB18_78
LBB18_77:
	mov	w19, #9                         ; =0x9
LBB18_78:
	mov	w20, wzr
	add	x21, sp, #52
	.p2align	4, , 8
LBB18_79:                               ; =>This Inner Loop Header: Depth=1
	add	w8, w23, w20, lsl #1
	ldrh	w0, [x8]
	bl	_player_name_character_ascii
	add	w8, w21, w20
	add	w20, w20, #1
	cmp	w19, w20
	strb	w0, [x8]
	b.ne	LBB18_79
LBB18_80:
Lloh79:
	adrp	x8, l_.str.25@PAGE
Lloh80:
	add	x8, x8, l_.str.25@PAGEOFF
Lloh81:
	adrp	x9, l_.str.106@PAGE
Lloh82:
	add	x9, x9, l_.str.106@PAGEOFF
	cmp	w28, #2
Lloh83:
	adrp	x11, l_.str.105@PAGE
Lloh84:
	add	x11, x11, l_.str.105@PAGEOFF
	csel	x8, x9, x8, eq
	cmp	w28, #1
	add	x10, sp, #52
	csel	x8, x11, x8, eq
Lloh85:
	adrp	x1, l_.str.104@PAGE
Lloh86:
	add	x1, x1, l_.str.104@PAGEOFF
	mov	w0, #3                          ; =0x3
	strb	wzr, [x10, w19, uxtw]
	stp	w10, w22, [sp, #4]
	str	w8, [sp]
	bl	_error
	bl	_game_engine_has_teams
	cbz	w0, LBB18_82
; %bb.81:
	ldr	w8, [x24, #32]
	cmp	w8, #0
	cset	w8, ne
	b	LBB18_83
LBB18_82:
	mov	w8, #65535                      ; =0xffff
LBB18_83:
	cmp	w28, #0
	mov	x0, x27
	cset	w2, ne
	mov	x3, x22
	sxth	w1, w8
	bl	_social_chat_upstream_line
LBB18_84:
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
	.loh AdrpAdd	Lloh75, Lloh76
	.loh AdrpLdrGot	Lloh77, Lloh78
	.loh AdrpAdd	Lloh85, Lloh86
	.loh AdrpAdd	Lloh83, Lloh84
	.loh AdrpAdd	Lloh81, Lloh82
	.loh AdrpAdd	Lloh79, Lloh80
                                        ; -- End function
	.globl	_network_chat_host_notice       ; -- Begin function network_chat_host_notice
	.p2align	4
_network_chat_host_notice:              ; @network_chat_host_notice
; %bb.0:
	sub	sp, sp, #144
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	mov	x19, x0
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
	bl	_csstrlen
	mov	w20, w0
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.hi	LBB19_16
; %bb.1:
	adrp	x21, _chat_shown.read_at@PAGE
	ldr	w22, [x21, _chat_shown.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB19_15
; %bb.2:
	adrp	x8, _chat_shown.shown@PAGE
	ldrb	w8, [x8, _chat_shown.shown@PAGEOFF]
	cbz	w8, LBB19_16
LBB19_3:
	cmp	w20, #1
	b.lt	LBB19_17
; %bb.4:
	mov	w8, wzr
	mov	w22, #2147483584                ; =0x7fffffc0
	add	x23, sp, #16
	b	LBB19_6
	.p2align	4, , 8
LBB19_5:                                ;   in Loop: Header=BB19_6 Depth=1
	mov	w8, w24
	cmp	w24, w20
	b.ge	LBB19_17
LBB19_6:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB19_9 Depth 2
                                        ;     Child Loop BB19_13 Depth 2
	mov	w24, w20
	add	w9, w8, #63
	cmp	w9, w20
	b.ge	LBB19_12
; %bb.7:                                ;   in Loop: Header=BB19_6 Depth=1
	cmp	w8, w22
	b.gt	LBB19_11
; %bb.8:                                ;   in Loop: Header=BB19_6 Depth=1
	add	w24, w8, #63
	.p2align	4, , 8
LBB19_9:                                ;   Parent Loop BB19_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w9, w19, w24
	ldrb	w9, [x9]
	cmp	w9, #32
	b.eq	LBB19_12
; %bb.10:                               ;   in Loop: Header=BB19_9 Depth=2
	sub	w24, w24, #1
	cmp	w24, w8
	b.gt	LBB19_9
LBB19_11:                               ;   in Loop: Header=BB19_6 Depth=1
	add	w24, w8, #63
LBB19_12:                               ;   in Loop: Header=BB19_6 Depth=1
	sub	w21, w24, w8
	add	x1, x19, w8, sxtw
	add	x0, sp, #16
	mov	w2, w21
	bl	_csmemcpy
	add	x0, sp, #16
	strb	wzr, [x23, w21, sxtw]
	bl	_chat_add_notice
	cmp	w24, w20
	b.ge	LBB19_5
	.p2align	4, , 8
LBB19_13:                               ;   Parent Loop BB19_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w8, w19, w24
	ldrb	w8, [x8]
	cmp	w8, #32
	b.ne	LBB19_5
; %bb.14:                               ;   in Loop: Header=BB19_13 Depth=2
	add	w24, w24, #1
	cmp	w20, w24
	b.ne	LBB19_13
	b	LBB19_17
LBB19_15:
	bl	_config_changes
	str	w0, [x21, _chat_shown.read_at@PAGEOFF]
Lloh87:
	adrp	x0, l_.str.107@PAGE
Lloh88:
	add	x0, x0, l_.str.107@PAGEOFF
	bl	_config_boolean
	adrp	x9, _chat_shown.shown@PAGE
	and	w8, w0, #0xff
	strb	w0, [x9, _chat_shown.shown@PAGEOFF]
	cbnz	w8, LBB19_3
LBB19_16:
Lloh89:
	adrp	x8, _global_real_argb_red@GOTPAGE
Lloh90:
	adrp	x1, l_.str.4@PAGE
Lloh91:
	add	x1, x1, l_.str.4@PAGEOFF
Lloh92:
	ldr	w8, [x8, _global_real_argb_red@GOTPAGEOFF]
	str	w19, [sp]
Lloh93:
	ldr	w0, [x8]
	bl	_terminal_printf
LBB19_17:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
	.loh AdrpAdd	Lloh87, Lloh88
	.loh AdrpAdd	Lloh90, Lloh91
	.loh AdrpLdrGotLdr	Lloh89, Lloh92, Lloh93
                                        ; -- End function
	.globl	_network_chat_say               ; -- Begin function network_chat_say
	.p2align	4
_network_chat_say:                      ; @network_chat_say
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x19, x1
	mov	w20, w0
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.hi	LBB20_3
; %bb.1:
	bl	_game_in_progress
	cmp	w0, #0
	ccmp	w20, #2, #2, ne
	b.hi	LBB20_3
; %bb.2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	mov	w0, w20
	mov	x1, x19
	mov	w2, #1                          ; =0x1
	mov	w3, wzr
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	_chat_send
LBB20_3:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_send
_chat_send:                             ; @chat_send
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	sub	sp, sp, #1824
	mov	w22, w3
	mov	w20, w2
	mov	x21, x1
	mov	w19, w0
	cbz	w3, LBB21_3
; %bb.1:
	adrp	x8, _chat_input@PAGE
	ldrb	w8, [x8, _chat_input@PAGEOFF]
	cbz	w8, LBB21_3
; %bb.2:
	adrp	x8, _chat_input@PAGE+4
	ldrsh	w0, [x8, _chat_input@PAGEOFF+4]
	bl	_controller_remap_local_player
	cmn	w0, #1
	b.ne	LBB21_4
	b	LBB21_5
LBB21_3:
	mov	w0, #-1                         ; =0xffffffff
	bl	_local_player_get_next
	cmn	w0, #1
	b.eq	LBB21_5
LBB21_4:
	bl	_local_player_get_player_index
LBB21_5:
Lloh94:
	adrp	x8, _chat_input@PAGE
Lloh95:
	add	x8, x8, _chat_input@PAGEOFF
	ldr	w9, [x8, #8]
	ldrb	w8, [x8]
	cmp	w0, w9
	ccmp	w8, #0, #4, ne
	mov	w8, #65535                      ; =0xffff
	bic	w8, w8, w0
	ccmp	w22, #0, #4, ne
	ccmp	w8, #0, #4, eq
	b.eq	LBB21_149
; %bb.6:
	mov	w8, wzr
	add	w10, w21, #3
	mov	w11, #64                        ; =0x40
	mov	w12, #124                       ; =0x7c
	mov	w13, #63                        ; =0x3f
	add	x14, sp, #14
	b	LBB21_9
	.p2align	4, , 8
LBB21_7:                                ;   in Loop: Header=BB21_9 Depth=1
	add	w8, w8, #1
	strb	w15, [x14, w9, sxtw]
LBB21_8:                                ;   in Loop: Header=BB21_9 Depth=1
	add	w10, w10, #4
	subs	w11, w11, #4
	b.eq	LBB21_31
LBB21_9:                                ; =>This Inner Loop Header: Depth=1
	sub	w9, w10, #3
	ldrb	w15, [x9]
	sxth	w9, w8
	cbz	w15, LBB21_32
; %bb.10:                               ;   in Loop: Header=BB21_9 Depth=1
	cmp	w9, #62
	b.gt	LBB21_32
; %bb.11:                               ;   in Loop: Header=BB21_9 Depth=1
	sub	w16, w15, #127
	and	w16, w16, #0xff
	cmp	w16, #161
	and	w16, w8, #0xffff
	ccmp	w15, w12, #4, hs
	csel	w15, w13, w15, eq
	cmp	w15, #32
	ccmp	w16, #0, #0, eq
	b.eq	LBB21_13
; %bb.12:                               ;   in Loop: Header=BB21_9 Depth=1
	add	w8, w8, #1
	strb	w15, [x14, w9, sxtw]
	b	LBB21_14
	.p2align	4, , 8
LBB21_13:                               ;   in Loop: Header=BB21_9 Depth=1
	mov	w8, wzr
LBB21_14:                               ;   in Loop: Header=BB21_9 Depth=1
	sub	w9, w10, #2
	ldrb	w15, [x9]
	sxth	w9, w8
	cbz	w15, LBB21_32
; %bb.15:                               ;   in Loop: Header=BB21_9 Depth=1
	cmp	w9, #62
	b.gt	LBB21_32
; %bb.16:                               ;   in Loop: Header=BB21_9 Depth=1
	sub	w16, w15, #127
	and	w16, w16, #0xff
	cmp	w16, #161
	ccmp	w15, w12, #4, hs
	csel	w15, w13, w15, eq
	cmp	w15, #32
	b.ne	LBB21_19
; %bb.17:                               ;   in Loop: Header=BB21_9 Depth=1
	tst	w8, #0xffff
	b.ne	LBB21_19
; %bb.18:                               ;   in Loop: Header=BB21_9 Depth=1
	mov	w8, wzr
	b	LBB21_20
	.p2align	4, , 8
LBB21_19:                               ;   in Loop: Header=BB21_9 Depth=1
	add	w8, w8, #1
	strb	w15, [x14, w9, sxtw]
LBB21_20:                               ;   in Loop: Header=BB21_9 Depth=1
	sub	w9, w10, #1
	ldrb	w15, [x9]
	sxth	w9, w8
	cbz	w15, LBB21_32
; %bb.21:                               ;   in Loop: Header=BB21_9 Depth=1
	cmp	w9, #62
	b.gt	LBB21_32
; %bb.22:                               ;   in Loop: Header=BB21_9 Depth=1
	sub	w16, w15, #127
	and	w16, w16, #0xff
	cmp	w16, #161
	ccmp	w15, w12, #4, hs
	csel	w15, w13, w15, eq
	cmp	w15, #32
	b.ne	LBB21_25
; %bb.23:                               ;   in Loop: Header=BB21_9 Depth=1
	tst	w8, #0xffff
	b.ne	LBB21_25
; %bb.24:                               ;   in Loop: Header=BB21_9 Depth=1
	mov	w8, wzr
	b	LBB21_26
	.p2align	4, , 8
LBB21_25:                               ;   in Loop: Header=BB21_9 Depth=1
	add	w8, w8, #1
	strb	w15, [x14, w9, sxtw]
LBB21_26:                               ;   in Loop: Header=BB21_9 Depth=1
	ldrb	w15, [x10]
	sxth	w9, w8
	cbz	w15, LBB21_32
; %bb.27:                               ;   in Loop: Header=BB21_9 Depth=1
	cmp	w9, #62
	b.gt	LBB21_32
; %bb.28:                               ;   in Loop: Header=BB21_9 Depth=1
	sub	w16, w15, #127
	and	w16, w16, #0xff
	cmp	w16, #161
	ccmp	w15, w12, #4, hs
	csel	w15, w13, w15, eq
	cmp	w15, #32
	b.ne	LBB21_7
; %bb.29:                               ;   in Loop: Header=BB21_9 Depth=1
	tst	w8, #0xffff
	b.ne	LBB21_7
; %bb.30:                               ;   in Loop: Header=BB21_9 Depth=1
	mov	w8, wzr
	b	LBB21_8
LBB21_31:
	sxth	w9, w8
LBB21_32:
	sxth	w10, w8
	cmp	w10, #1
	b.lt	LBB21_37
; %bb.33:
	add	x8, sp, #14
	sub	w8, w8, #1
	.p2align	4, , 8
LBB21_34:                               ; =>This Inner Loop Header: Depth=1
	add	w10, w8, w9
	ldrb	w10, [x10]
	cmp	w10, #32
	b.ne	LBB21_36
; %bb.35:                               ;   in Loop: Header=BB21_34 Depth=1
	subs	w9, w9, #1
	b.gt	LBB21_34
	b	LBB21_149
LBB21_36:
	mov	w8, w9
LBB21_37:
	add	x10, sp, #14
	tst	w8, #0xffff
	strb	wzr, [x10, w9, sxtw]
	b.eq	LBB21_149
; %bb.38:
	ldrb	w8, [sp, #14]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #33
	b.ne	LBB21_71
; %bb.39:
	ldrb	w8, [sp, #15]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #101
	b.ne	LBB21_51
; %bb.40:
	ldrb	w8, [sp, #16]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #110
	b.ne	LBB21_51
; %bb.41:
	ldrb	w8, [sp, #17]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #100
	b.ne	LBB21_51
; %bb.42:
	ldrb	w8, [sp, #18]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #103
	b.ne	LBB21_51
; %bb.43:
	ldrb	w8, [sp, #19]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #97
	b.ne	LBB21_51
; %bb.44:
	ldrb	w8, [sp, #20]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #109
	b.ne	LBB21_51
; %bb.45:
	ldrb	w8, [sp, #21]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #101
	b.ne	LBB21_51
; %bb.46:
	ldrb	w8, [sp, #22]
	tst	w8, #0xffffffdf
	b.ne	LBB21_51
; %bb.47:
	mov	w10, #8                         ; =0x8
	add	x9, sp, #14
LBB21_48:                               ; =>This Inner Loop Header: Depth=1
	mov	w8, w10
	sxth	x10, w8
	ldrb	w11, [x9, x10]
	add	w10, w8, #1
	cmp	w11, #32
	b.eq	LBB21_48
; %bb.49:
	add	x9, sp, #14
	sxth	w8, w8
	cmn	w9, w8
	b.eq	LBB21_51
; %bb.50:
	bl	_network_vote_end_game
	b	LBB21_149
LBB21_51:
	ldrb	w8, [sp, #15]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w9, w10, w8, lo
	cmp	w9, #121
	b.ne	LBB21_58
; %bb.52:
	ldrb	w9, [sp, #16]
	sub	w10, w9, #65
	orr	w11, w9, #0x20
	cmp	w10, #26
	csel	w10, w11, w9, lo
	cmp	w10, #101
	b.ne	LBB21_58
; %bb.53:
	ldrb	w10, [sp, #17]
	sub	w11, w10, #65
	orr	w12, w10, #0x20
	cmp	w11, #26
	csel	w11, w12, w10, lo
	cmp	w11, #115
	b.ne	LBB21_58
; %bb.54:
	ldrb	w11, [sp, #18]
	tst	w11, #0xffffffdf
	b.ne	LBB21_58
; %bb.55:
	mov	w13, #4                         ; =0x4
	add	x12, sp, #14
	.p2align	4, , 8
LBB21_56:                               ; =>This Inner Loop Header: Depth=1
	mov	w11, w13
	sxth	x13, w11
	ldrb	w14, [x12, x13]
	add	w13, w11, #1
	cmp	w14, #32
	b.eq	LBB21_56
; %bb.57:
	add	x12, sp, #14
	sxth	w11, w11
	cmn	w12, w11
	b.ne	LBB21_64
LBB21_58:
	ldrb	w8, [sp, #15]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w9, w10, w8, lo
	cmp	w9, #110
	b.ne	LBB21_71
; %bb.59:
	ldrb	w9, [sp, #16]
	sub	w10, w9, #65
	orr	w11, w9, #0x20
	cmp	w10, #26
	csel	w10, w11, w9, lo
	cmp	w10, #111
	b.ne	LBB21_71
; %bb.60:
	ldrb	w10, [sp, #17]
	tst	w10, #0xffffffdf
	b.ne	LBB21_71
; %bb.61:
	mov	w13, #3                         ; =0x3
	add	x12, sp, #14
	.p2align	4, , 8
LBB21_62:                               ; =>This Inner Loop Header: Depth=1
	mov	w11, w13
	sxth	x13, w11
	ldrb	w14, [x12, x13]
	add	w13, w11, #1
	cmp	w14, #32
	b.eq	LBB21_62
; %bb.63:
	add	x12, sp, #14
	sxth	w11, w11
	cmn	w12, w11
	b.eq	LBB21_71
LBB21_64:
	sub	w11, w8, #65
	orr	w12, w8, #0x20
	cmp	w11, #26
	csel	w8, w12, w8, lo
	cmp	w8, #121
	b.ne	LBB21_136
; %bb.65:
	sub	w8, w9, #65
	orr	w11, w9, #0x20
	cmp	w8, #26
	csel	w8, w11, w9, lo
	cmp	w8, #101
	b.ne	LBB21_136
; %bb.66:
	sub	w8, w10, #65
	orr	w9, w10, #0x20
	cmp	w8, #26
	csel	w8, w9, w10, lo
	cmp	w8, #115
	b.ne	LBB21_136
; %bb.67:
	ldrb	w8, [sp, #18]
	tst	w8, #0xffffffdf
	b.ne	LBB21_136
; %bb.68:
	mov	w10, #4                         ; =0x4
	add	x9, sp, #14
LBB21_69:                               ; =>This Inner Loop Header: Depth=1
	mov	w8, w10
	sxth	x10, w8
	ldrb	w11, [x9, x10]
	add	w10, w8, #1
	cmp	w11, #32
	b.eq	LBB21_69
; %bb.70:
	add	x9, sp, #14
	sxth	w8, w8
	cmn	w9, w8
	cset	w0, ne
	b	LBB21_137
LBB21_71:
	mov	w21, w0
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB21_75
; %bb.72:
	add	x0, sp, #14
	sub	x1, x29, #144
	add	x2, sp, #78
	bl	_chat_command_parse
	cbz	w0, LBB21_75
; %bb.73:
	cmp	w0, #3
	b.ne	LBB21_85
; %bb.74:
Lloh96:
	adrp	x0, l_.str.113@PAGE
Lloh97:
	add	x0, x0, l_.str.113@PAGEOFF
	b	LBB21_148
LBB21_75:
	bl	_game_connection
	cmp	w0, #2
	b.eq	LBB21_78
; %bb.76:
	add	x0, sp, #14
	add	x1, sp, #96
	sub	x2, x29, #144
	bl	_chat_command_parse
	cbz	w0, LBB21_78
; %bb.77:
Lloh98:
	adrp	x0, l_.str.112@PAGE
Lloh99:
	add	x0, x0, l_.str.112@PAGEOFF
	b	LBB21_148
LBB21_78:
	cbnz	w20, LBB21_80
; %bb.79:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB21_142
LBB21_80:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB21_82
; %bb.81:
	bl	_chat_host_config_flags
	b	LBB21_141
LBB21_82:
	adrp	x8, _chat_config.0@PAGE
	ldrb	w8, [x8, _chat_config.0@PAGEOFF]
	cbz	w8, LBB21_135
; %bb.83:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB21_139
; %bb.84:
	mov	w20, #1                         ; =0x1
	b	LBB21_140
LBB21_85:
	mov	w19, w0
	add	x0, sp, #224
	mov	w1, wzr
	mov	w2, #1536                       ; =0x600
	bl	_csmemset
Lloh100:
	adrp	x8, _player_data@GOTPAGE
	add	x0, sp, #80
Lloh101:
	ldr	w8, [x8, _player_data@GOTPAGEOFF]
Lloh102:
	ldr	w1, [x8]
	bl	_data_iterator_new
	add	x0, sp, #80
	bl	_data_iterator_next
	cbz	w0, LBB21_113
; %bb.86:
	mov	w20, #12                        ; =0xc
	add	x22, sp, #224
	mov	w23, #10                        ; =0xa
	b	LBB21_90
LBB21_87:                               ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, wzr
LBB21_88:                               ;   in Loop: Header=BB21_90 Depth=1
	strb	wzr, [x24, w26, uxtw]
LBB21_89:                               ;   in Loop: Header=BB21_90 Depth=1
	add	x0, sp, #80
	bl	_data_iterator_next
	cbz	w0, LBB21_113
LBB21_90:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB21_112 Depth 2
	ldrsh	w8, [sp, #88]
	ldrb	w9, [x0, #209]
	cmp	w8, #128
	ccmp	w9, #0, #0, lo
	b.ne	LBB21_89
; %bb.91:                               ;   in Loop: Header=BB21_90 Depth=1
	mov	x25, x0
	madd	w24, w8, w20, w22
	ldrh	w9, [x25, #4]!
	cbz	w9, LBB21_87
; %bb.92:                               ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #6]
	cbz	w8, LBB21_102
; %bb.93:                               ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #8]
	cbz	w8, LBB21_103
; %bb.94:                               ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #10]
	cbz	w8, LBB21_104
; %bb.95:                               ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #12]
	cbz	w8, LBB21_105
; %bb.96:                               ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #14]
	cbz	w8, LBB21_106
; %bb.97:                               ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #16]
	cbz	w8, LBB21_107
; %bb.98:                               ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #18]
	cbz	w8, LBB21_108
; %bb.99:                               ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #20]
	cbz	w8, LBB21_109
; %bb.100:                              ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #22]
	cbz	w8, LBB21_110
; %bb.101:                              ;   in Loop: Header=BB21_90 Depth=1
	ldrh	w8, [x0, #24]
	cmp	w8, #0
	cinc	w26, w23, ne
	b	LBB21_111
LBB21_102:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, #1                         ; =0x1
	b	LBB21_111
LBB21_103:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, #2                         ; =0x2
	b	LBB21_111
LBB21_104:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, #3                         ; =0x3
	b	LBB21_111
LBB21_105:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, #4                         ; =0x4
	b	LBB21_111
LBB21_106:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, #5                         ; =0x5
	b	LBB21_111
LBB21_107:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, #6                         ; =0x6
	b	LBB21_111
LBB21_108:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, #7                         ; =0x7
	b	LBB21_111
LBB21_109:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, #8                         ; =0x8
	b	LBB21_111
LBB21_110:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w26, #9                         ; =0x9
	.p2align	4, , 8
LBB21_111:                              ;   in Loop: Header=BB21_90 Depth=1
	mov	w27, wzr
	.p2align	4, , 8
LBB21_112:                              ;   Parent Loop BB21_90 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w8, w25, w27, lsl #1
	ldrh	w0, [x8]
	bl	_player_name_character_ascii
	add	w8, w24, w27
	add	w27, w27, #1
	cmp	w26, w27
	strb	w0, [x8]
	b.ne	LBB21_112
	b	LBB21_88
LBB21_113:
	ldurb	w10, [x29, #-144]
	cbz	w10, LBB21_134
; %bb.114:
	mov	w8, w19
	mov	w12, wzr
	mov	w11, wzr
	mov	w9, wzr
	mov	w17, #65535                     ; =0xffff
	mov	w14, #12                        ; =0xc
	add	x15, sp, #224
	sub	x16, x29, #144
	mov	w13, #65535                     ; =0xffff
	b	LBB21_117
	.p2align	4, , 8
LBB21_115:                              ;   in Loop: Header=BB21_117 Depth=1
	ldrb	w17, [x2, w3, sxtw]
	add	w11, w11, #1
	cmp	w17, #0
	orr	w17, w12, #0x3
	csel	w13, w0, w13, eq
	cinc	w9, w9, eq
LBB21_116:                              ;   in Loop: Header=BB21_117 Depth=1
	add	w12, w12, #4
	cmp	w12, #128
	b.eq	LBB21_132
LBB21_117:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB21_118 Depth 2
                                        ;     Child Loop BB21_122 Depth 2
                                        ;     Child Loop BB21_126 Depth 2
                                        ;     Child Loop BB21_130 Depth 2
	mov	w2, wzr
	mov	w0, wzr
	smaddl	x1, w12, w14, x15
	mov	w3, w10
	.p2align	4, , 8
LBB21_118:                              ;   Parent Loop BB21_117 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w2, [x1, w2, sxtw]
	sub	w4, w2, #65
	orr	w5, w2, #0x20
	cmp	w4, #26
	sub	w4, w3, #65
	csel	w2, w5, w2, lo
	orr	w5, w3, #0x20
	cmp	w4, #26
	csel	w3, w5, w3, lo
	cmp	w2, w3
	b.ne	LBB21_121
; %bb.119:                              ;   in Loop: Header=BB21_118 Depth=2
	add	w0, w0, #1
	sxth	x2, w0
	ldrb	w3, [x16, x2]
	sxth	w2, w0
	cbnz	w3, LBB21_118
; %bb.120:                              ;   in Loop: Header=BB21_117 Depth=1
	ldrb	w17, [x1, w2, sxtw]
	add	w11, w11, #1
	cmp	w17, #0
	mov	w17, w12
	csel	w13, w12, w13, eq
	cinc	w9, w9, eq
LBB21_121:                              ;   in Loop: Header=BB21_117 Depth=1
	orr	w0, w12, #0x1
	mov	w3, wzr
	mov	w1, wzr
	mov	w4, w10
	smaddl	x2, w0, w14, x15
	.p2align	4, , 8
LBB21_122:                              ;   Parent Loop BB21_117 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w3, [x2, w3, sxtw]
	sub	w5, w3, #65
	orr	w6, w3, #0x20
	cmp	w5, #26
	sub	w5, w4, #65
	csel	w3, w6, w3, lo
	orr	w6, w4, #0x20
	cmp	w5, #26
	csel	w4, w6, w4, lo
	cmp	w3, w4
	b.ne	LBB21_125
; %bb.123:                              ;   in Loop: Header=BB21_122 Depth=2
	add	w1, w1, #1
	sxth	x3, w1
	ldrb	w4, [x16, x3]
	sxth	w3, w1
	cbnz	w4, LBB21_122
; %bb.124:                              ;   in Loop: Header=BB21_117 Depth=1
	ldrb	w17, [x2, w3, sxtw]
	add	w11, w11, #1
	cmp	w17, #0
	orr	w17, w12, #0x1
	csel	w13, w0, w13, eq
	cinc	w9, w9, eq
LBB21_125:                              ;   in Loop: Header=BB21_117 Depth=1
	orr	w0, w12, #0x2
	mov	w3, wzr
	mov	w1, wzr
	mov	w4, w10
	smaddl	x2, w0, w14, x15
	.p2align	4, , 8
LBB21_126:                              ;   Parent Loop BB21_117 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w3, [x2, w3, sxtw]
	sub	w5, w3, #65
	orr	w6, w3, #0x20
	cmp	w5, #26
	sub	w5, w4, #65
	csel	w3, w6, w3, lo
	orr	w6, w4, #0x20
	cmp	w5, #26
	csel	w4, w6, w4, lo
	cmp	w3, w4
	b.ne	LBB21_129
; %bb.127:                              ;   in Loop: Header=BB21_126 Depth=2
	add	w1, w1, #1
	sxth	x3, w1
	ldrb	w4, [x16, x3]
	sxth	w3, w1
	cbnz	w4, LBB21_126
; %bb.128:                              ;   in Loop: Header=BB21_117 Depth=1
	ldrb	w17, [x2, w3, sxtw]
	add	w11, w11, #1
	cmp	w17, #0
	orr	w17, w12, #0x2
	csel	w13, w0, w13, eq
	cinc	w9, w9, eq
LBB21_129:                              ;   in Loop: Header=BB21_117 Depth=1
	orr	w0, w12, #0x3
	mov	w3, wzr
	mov	w1, wzr
	mov	w4, w10
	smaddl	x2, w0, w14, x15
	.p2align	4, , 8
LBB21_130:                              ;   Parent Loop BB21_117 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w3, [x2, w3, sxtw]
	sub	w5, w3, #65
	orr	w6, w3, #0x20
	cmp	w5, #26
	sub	w5, w4, #65
	csel	w3, w6, w3, lo
	orr	w6, w4, #0x20
	cmp	w5, #26
	csel	w4, w6, w4, lo
	cmp	w3, w4
	b.ne	LBB21_116
; %bb.131:                              ;   in Loop: Header=BB21_130 Depth=2
	add	w1, w1, #1
	sxth	x3, w1
	ldrb	w4, [x16, x3]
	sxth	w3, w1
	cbnz	w4, LBB21_130
	b	LBB21_115
LBB21_132:
	sxth	w10, w11
	cmp	w10, #1
	sxth	w10, w9
	ccmp	w10, #1, #0, le
	and	w9, w9, #0xffff
	mov	w10, #-2                        ; =0xfffffffe
	mov	w11, #65534                     ; =0xfffe
	csel	w10, w10, w17, gt
	cmp	w9, #1
	csel	w9, w13, w10, eq
	and	w10, w9, #0xffff
	cmp	w10, w11
	b.eq	LBB21_145
; %bb.133:
	mov	w11, #65535                     ; =0xffff
	cmp	w10, w11
	b.ne	LBB21_150
LBB21_134:
Lloh103:
	adrp	x2, l_.str.114@PAGE
Lloh104:
	add	x2, x2, l_.str.114@PAGEOFF
	b	LBB21_146
LBB21_135:
	mov	w0, wzr
	b	LBB21_141
LBB21_136:
	mov	w0, wzr
LBB21_137:
	bl	_network_vote_choose
	cbnz	w0, LBB21_149
; %bb.138:
Lloh105:
	adrp	x0, l_.str.111@PAGE
Lloh106:
	add	x0, x0, l_.str.111@PAGEOFF
	b	LBB21_148
LBB21_139:
	bl	_p2p_joined_listed_host
	cmp	w0, #0
	cset	w20, eq
LBB21_140:
	bl	_p2p_joined_listed_dedicated
	adrp	x8, _chat_config.1@PAGE
	cmp	w0, #0
	csinc	w9, w20, wzr, eq
	cmp	w9, #0
	ldrb	w8, [x8, _chat_config.1@PAGEOFF]
	csel	w0, w8, wzr, ne
LBB21_141:
	and	w0, w0, #0xff
	add	x1, sp, #14
	bl	_chat_refused
	cbnz	w0, LBB21_148
LBB21_142:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB21_144
; %bb.143:
	add	x2, sp, #14
	mov	w1, w19
	sxth	w0, w21
	bl	_chat_host_send
	b	LBB21_149
LBB21_144:
	add	x0, sp, #224
	mov	w1, wzr
	mov	w2, #76                         ; =0x4c
	cmp	w19, #1
	cset	w8, eq
	cmp	w19, #2
	csel	w19, w19, w8, eq
	add	x20, sp, #224
	bl	_csmemset
	sxth	w0, w21
	bl	_distributed_player_to_byte
	strb	w0, [sp, #232]
	add	x0, x20, #12
	add	x1, sp, #14
	mov	w2, #63                         ; =0x3f
	strb	w19, [sp, #233]
	bl	_csstrncpy
	add	x0, sp, #224
	mov	w1, #87                         ; =0x57
	mov	w2, #1                          ; =0x1
	mov	w3, #76                         ; =0x4c
	mov	w4, #3                          ; =0x3
	bl	_distributed_send
	b	LBB21_149
LBB21_145:
Lloh107:
	adrp	x2, l_.str.115@PAGE
Lloh108:
	add	x2, x2, l_.str.115@PAGEOFF
LBB21_146:
	sub	x8, x29, #144
LBB21_147:
	add	x0, sp, #96
	mov	w1, #128                        ; =0x80
	str	w8, [sp]
	bl	_halo_linux_snprintf
	add	x0, sp, #96
LBB21_148:
	bl	_chat_add_notice
LBB21_149:
	add	sp, sp, #1824
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB21_150:
	sxth	w9, w9
	and	w10, w9, #0xffff
	cmp	w10, w21, uxth
	b.ne	LBB21_152
; %bb.151:
Lloh109:
	adrp	x9, l_.str.118@PAGE
Lloh110:
	add	x9, x9, l_.str.118@PAGEOFF
Lloh111:
	adrp	x10, l_.str.117@PAGE
Lloh112:
	add	x10, x10, l_.str.117@PAGEOFF
	cmp	w8, #1
Lloh113:
	adrp	x2, l_.str.116@PAGE
Lloh114:
	add	x2, x2, l_.str.116@PAGEOFF
	csel	x8, x10, x9, eq
	b	LBB21_147
LBB21_152:
	mov	w10, #12                        ; =0xc
	add	x11, sp, #224
	cmp	w8, #1
	smaddl	x0, w9, w10, x11
	b.ne	LBB21_154
; %bb.153:
	ldrsh	w1, [sp, #78]
	bl	_chat_host_mute_name
	b	LBB21_149
LBB21_154:
	bl	_chat_host_unmute_name
	b	LBB21_149
	.loh AdrpAdd	Lloh94, Lloh95
	.loh AdrpAdd	Lloh96, Lloh97
	.loh AdrpAdd	Lloh98, Lloh99
	.loh AdrpLdrGotLdr	Lloh100, Lloh101, Lloh102
	.loh AdrpAdd	Lloh103, Lloh104
	.loh AdrpAdd	Lloh105, Lloh106
	.loh AdrpAdd	Lloh107, Lloh108
	.loh AdrpAdd	Lloh113, Lloh114
	.loh AdrpAdd	Lloh111, Lloh112
	.loh AdrpAdd	Lloh109, Lloh110
                                        ; -- End function
	.globl	_network_chat_say_unchecked     ; -- Begin function network_chat_say_unchecked
	.p2align	4
_network_chat_say_unchecked:            ; @network_chat_say_unchecked
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x19, x1
	mov	w20, w0
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.hi	LBB22_3
; %bb.1:
	bl	_game_in_progress
	cmp	w0, #0
	ccmp	w20, #2, #2, ne
	b.hi	LBB22_3
; %bb.2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	mov	w0, w20
	mov	x1, x19
	mov	w2, wzr
	mov	w3, wzr
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	_chat_send
LBB22_3:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.globl	_network_chat_keyboard_open     ; -- Begin function network_chat_keyboard_open
	.p2align	4
_network_chat_keyboard_open:            ; @network_chat_keyboard_open
; %bb.0:
	adrp	x8, _chat_input@PAGE
	ldrb	w8, [x8, _chat_input@PAGEOFF]
	cbz	w8, LBB23_3
; %bb.1:
	adrp	x8, _chat_keyboard.0@PAGE
	ldrb	w8, [x8, _chat_keyboard.0@PAGEOFF]
	tbz	w8, #0, LBB23_3
; %bb.2:
	mov	w0, #1                          ; =0x1
	ret
LBB23_3:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	bl	_social_chat_keyboard_open
	cmp	w0, #0
	cset	w0, ne
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.globl	_network_chat_system_keyboard   ; -- Begin function network_chat_system_keyboard
	.p2align	4
_network_chat_system_keyboard:          ; @network_chat_system_keyboard
; %bb.0:
	adrp	x8, _chat_input@PAGE
	adrp	x9, _chat_keyboard.0@PAGE
	adrp	x10, _chat_keyboard.1@PAGE
	ldrb	w8, [x8, _chat_input@PAGEOFF]
	ldrb	w9, [x9, _chat_keyboard.0@PAGEOFF]
	ldrb	w10, [x10, _chat_keyboard.1@PAGEOFF]
	cmp	w8, #0
	ccmp	w9, #0, #4, ne
	ccmp	w10, #0, #4, ne
	b.ne	LBB24_2
; %bb.1:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	bl	_social_chat_system_keyboard
	cmp	w0, #0
	cset	w0, ne
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB24_2:
	mov	w0, #1                          ; =0x1
	ret
                                        ; -- End function
	.globl	_network_chat_update            ; -- Begin function network_chat_update
	.p2align	4
_network_chat_update:                   ; @network_chat_update
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	sub	sp, sp, #656
	bl	_halo_chat_pad_buttons
	adrp	x21, _chat_keyboard.2@PAGE
	adrp	x23, _chat_keyboard.7@PAGE
	mov	w20, w0
	ldr	w8, [x21, _chat_keyboard.2@PAGEOFF]
	and	w22, w8, w0
	ldr	w8, [x23, _chat_keyboard.7@PAGEOFF]
	str	w22, [x21, _chat_keyboard.2@PAGEOFF]
	str	w8, [sp, #4]                    ; 4-byte Spill
	bl	_system_milliseconds
	str	w0, [sp]                        ; 4-byte Spill
	mov	w0, wzr
	mov	w1, #458752                     ; =0x70000
	bl	_controller_remap_pressed
	cbz	w0, LBB25_2
; %bb.1:
	tst	w0, #0x20000
	mov	w8, #1                          ; =0x1
	cinc	w8, w8, eq
	tst	w0, #0x10000
	mov	w0, #1                          ; =0x1
	mov	w1, #458752                     ; =0x70000
	csel	w26, w8, wzr, eq
	bl	_controller_remap_pressed
	mov	w25, wzr
	mov	w24, wzr
	b	LBB25_5
LBB25_2:
	mov	w0, #1                          ; =0x1
	mov	w1, #458752                     ; =0x70000
	mov	w25, #1                         ; =0x1
	bl	_controller_remap_pressed
	cbz	w0, LBB25_4
; %bb.3:
	tst	w0, #0x20000
	mov	w24, #1                         ; =0x1
	cinc	w8, w25, eq
	tst	w0, #0x10000
	csel	w26, w8, wzr, eq
	mov	w25, wzr
	b	LBB25_5
LBB25_4:
	mov	w26, wzr
	mov	w24, #65535                     ; =0xffff
LBB25_5:
	mov	w0, #2                          ; =0x2
	mov	w1, #458752                     ; =0x70000
	bl	_controller_remap_pressed
	eor	w8, w25, #0x1
	cmp	w0, #0
	csinc	w8, w8, wzr, ne
	tbnz	w8, #0, LBB25_7
; %bb.6:
	tst	w0, #0x20000
	mov	w8, #1                          ; =0x1
	cinc	w8, w8, eq
	tst	w0, #0x10000
	csel	w26, w8, wzr, eq
	mov	w24, #2                         ; =0x2
LBB25_7:
	mov	w0, #3                          ; =0x3
	mov	w1, #458752                     ; =0x70000
	bl	_controller_remap_pressed
	mov	w8, #65535                      ; =0xffff
	cmp	w24, w8
	ccmp	w0, #0, #4, eq
	b.eq	LBB25_9
; %bb.8:
	tst	w0, #0x20000
	mov	w8, #1                          ; =0x1
	cinc	w8, w8, eq
	tst	w0, #0x10000
	csel	w26, w8, wzr, eq
	mov	w24, #3                         ; =0x3
LBB25_9:
	eor	w28, w22, w20
	str	w28, [x23, _chat_keyboard.7@PAGEOFF]
	bl	_game_connection
	sub	w9, w0, #3
	adrp	x20, _chat_scroll@PAGE
	adrp	x19, _chat_in_game@PAGE
	mov	w8, #65534                      ; =0xfffe
	cmp	w8, w9, uxth
	b.hi	LBB25_22
; %bb.10:
	bl	_game_in_progress
	cbz	w0, LBB25_22
; %bb.11:
	ldrb	w8, [x19, _chat_in_game@PAGEOFF]
	tbnz	w8, #0, LBB25_13
; %bb.12:
	mov	w8, #1                          ; =0x1
	adrp	x9, _chat_line_count@PAGE
Lloh115:
	adrp	x0, _chat_motion_sensors@PAGE
Lloh116:
	add	x0, x0, _chat_motion_sensors@PAGEOFF
	mov	w1, wzr
	mov	w2, #48                         ; =0x30
	strb	w8, [x19, _chat_in_game@PAGEOFF]
	strh	wzr, [x9, _chat_line_count@PAGEOFF]
	strh	wzr, [x20, _chat_scroll@PAGEOFF]
	bl	_csmemset
	adrp	x8, _chat_off_noticed@PAGE
Lloh117:
	adrp	x0, _chat_rates@PAGE
Lloh118:
	add	x0, x0, _chat_rates@PAGEOFF
	mov	w1, wzr
	mov	w2, #1024                       ; =0x400
	strb	wzr, [x8, _chat_off_noticed@PAGEOFF]
	bl	_csmemset
LBB25_13:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB25_23
; %bb.14:
	bl	_chat_host_config_flags
	mov	w20, w0
	bl	_system_milliseconds
	adrp	x9, _chat_config.1@PAGE
	adrp	x8, _chat_config.0@PAGE
	ldrb	w10, [x9, _chat_config.1@PAGEOFF]
	ldrb	w11, [x8, _chat_config.0@PAGEOFF]
	cmp	w10, w20, uxtb
	adrp	x10, _chat_config.2@PAGE
	csel	w11, wzr, w11, ne
	cbz	w11, LBB25_16
; %bb.15:
	ldr	w11, [x10, _chat_config.2@PAGEOFF]
	sub	w11, w0, w11
	cmp	w11, #3000
	b.lo	LBB25_19
LBB25_16:
	mov	w11, #1                         ; =0x1
	str	w0, [x10, _chat_config.2@PAGEOFF]
	add	x0, sp, #8
	mov	w1, wzr
	mov	w2, #12                         ; =0xc
	strb	w20, [x9, _chat_config.1@PAGEOFF]
	strb	w11, [x8, _chat_config.0@PAGEOFF]
	bl	_csmemset
	add	x0, sp, #136
	mov	w1, #128                        ; =0x80
	strb	w20, [sp, #16]
	bl	_distributed_client_machines
	cmp	w0, #1
	b.lt	LBB25_19
; %bb.17:
	mov	w20, w0
	add	x22, sp, #136
	.p2align	4, , 8
LBB25_18:                               ; =>This Inner Loop Header: Depth=1
	ldr	w0, [x22]
	add	x1, sp, #8
	mov	w2, #89                         ; =0x59
	mov	w3, #1                          ; =0x1
	mov	w4, #12                         ; =0xc
	bl	_distributed_send_to_machine_reliably
	add	w22, w22, #4
	subs	w20, w20, #1
	b.ne	LBB25_18
LBB25_19:
	add	x0, sp, #136
	mov	w1, #128                        ; =0x80
	bl	_distributed_client_machines
	mov	w20, w0
	add	x0, sp, #8
	mov	w1, wzr
	mov	w2, #128                        ; =0x80
	bl	_csmemset
	cmp	w20, #1
	b.lt	LBB25_112
; %bb.20:
	cmp	w20, #8
	b.hs	LBB25_49
; %bb.21:
	mov	w8, wzr
	b	LBB25_165
LBB25_22:
	adrp	x8, _chat_config.0@PAGE
	strb	wzr, [x19, _chat_in_game@PAGEOFF]
	strb	wzr, [x8, _chat_config.0@PAGEOFF]
LBB25_23:
	bl	_game_connection
	sub	w8, w0, #3
	adrp	x25, _chat_input@PAGE
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.hi	LBB25_27
; %bb.24:
	bl	_game_in_progress
	cbz	w0, LBB25_27
; %bb.25:
	bl	_ui_widgets_active
	cbnz	w0, LBB25_27
; %bb.26:
	bl	_cinematic_in_progress
	cbz	w0, LBB25_69
LBB25_27:
	mov	w22, wzr
LBB25_28:
	mov	w20, wzr
LBB25_29:
	adrp	x19, _network_chat_update.vote_keys_held@PAGE
	adrp	x27, _network_chat_update.vote_pad_held@PAGE
	ldr	w8, [x19, _network_chat_update.vote_keys_held@PAGEOFF]
	bics	w8, w22, w8
	b.eq	LBB25_31
; %bb.30:
	lsr	w8, w8, #21
	b	LBB25_33
LBB25_31:
	ldr	w8, [x27, _network_chat_update.vote_pad_held@PAGEOFF]
	bics	w8, w20, w8
	b.eq	LBB25_34
; %bb.32:
	lsr	w8, w8, #2
LBB25_33:
	and	w0, w8, #0x1
	bl	_network_vote_choose
LBB25_34:
	str	w22, [x19, _network_chat_update.vote_keys_held@PAGEOFF]
	str	w20, [x27, _network_chat_update.vote_pad_held@PAGEOFF]
	bl	_game_connection
	sub	w8, w0, #3
	adrp	x20, _chat_actions_held@PAGE
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.hi	LBB25_47
; %bb.35:
	bl	_game_in_progress
	cbz	w0, LBB25_47
; %bb.36:
	ldrb	w8, [x25, _chat_input@PAGEOFF]
	cbz	w8, LBB25_42
; %bb.37:
	adrp	x8, _chat_input@PAGE+4
	ldrsh	w0, [x8, _chat_input@PAGEOFF+4]
	bl	_controller_remap_local_player
	cmn	w0, #1
	b.eq	LBB25_39
LBB25_38:
	bl	_local_player_get_player_index
LBB25_39:
Lloh119:
	adrp	x9, _chat_input@PAGE
Lloh120:
	add	x9, x9, _chat_input@PAGEOFF
	ldr	w8, [x9, #8]
	ldrb	w9, [x9]
	cmp	w0, w8
	mov	w8, #65535                      ; =0xffff
	ccmp	w9, #0, #4, ne
	bic	w8, w8, w0
	ccmp	w8, #0, #4, eq
	b.eq	LBB25_47
; %bb.40:
	adrp	x22, _chat_shown.read_at@PAGE
	ldr	w27, [x22, _chat_shown.read_at@PAGEOFF]
	bl	_config_changes
	adrp	x19, _chat_shown.shown@PAGE
	cmp	w27, w0
	b.ne	LBB25_43
; %bb.41:
	ldrb	w8, [x19, _chat_shown.shown@PAGEOFF]
	b	LBB25_44
LBB25_42:
	mov	w0, #-1                         ; =0xffffffff
	bl	_local_player_get_next
	cmn	w0, #1
	b.ne	LBB25_38
	b	LBB25_39
LBB25_43:
	bl	_config_changes
	str	w0, [x22, _chat_shown.read_at@PAGEOFF]
Lloh121:
	adrp	x0, l_.str.107@PAGE
Lloh122:
	add	x0, x0, l_.str.107@PAGEOFF
	bl	_config_boolean
	and	w8, w0, #0xff
	strb	w0, [x19, _chat_shown.shown@PAGEOFF]
LBB25_44:
Lloh123:
	adrp	x22, _chat_input@PAGE
Lloh124:
	add	x22, x22, _chat_input@PAGEOFF
	cbz	w8, LBB25_47
; %bb.45:
	bl	_ui_widgets_active
	cbnz	w0, LBB25_47
; %bb.46:
	bl	_cinematic_in_progress
	cbz	w0, LBB25_146
LBB25_47:
Lloh125:
	adrp	x8, _chat_keyboard.0@PAGE
	adrp	x9, _chat_keyboard.1@PAGE
	adrp	x10, _chat_keyboard.9@PAGE
	strb	wzr, [x25, _chat_input@PAGEOFF]
	str	wzr, [x21, _chat_keyboard.2@PAGEOFF]
	strb	wzr, [x8, _chat_keyboard.0@PAGEOFF]
Lloh126:
	adrp	x8, _chat_scroll@PAGE
	strb	wzr, [x9, _chat_keyboard.1@PAGEOFF]
	strb	wzr, [x10, _chat_keyboard.9@PAGEOFF]
	strh	wzr, [x8, _chat_scroll@PAGEOFF]
	str	wzr, [x20, _chat_actions_held@PAGEOFF]
LBB25_48:
	add	sp, sp, #656
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB25_49:
	cmp	w20, #16
	b.hs	LBB25_77
; %bb.50:
	mov	w8, wzr
LBB25_51:
	mov	w10, w8
	and	w8, w20, #0x7ff8
	add	x11, sp, #136
	sub	w9, w10, w8
	add	w10, w11, w10, lsl #2
	add	x11, sp, #8
	mov	w12, #1                         ; =0x1
	b	LBB25_53
	.p2align	4, , 8
LBB25_52:                               ;   in Loop: Header=BB25_53 Depth=1
	add	w10, w10, #32
	adds	w9, w9, #8
	b.eq	LBB25_76
LBB25_53:                               ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x10]
	fmov	w13, s0
	cmp	w13, #127
	b.hi	LBB25_55
; %bb.54:                               ;   in Loop: Header=BB25_53 Depth=1
	fmov	w13, s0
	strb	w12, [x11, w13, sxtw]
LBB25_55:                               ;   in Loop: Header=BB25_53 Depth=1
	mov	w13, v0.s[1]
	cmp	w13, #127
	b.hi	LBB25_57
; %bb.56:                               ;   in Loop: Header=BB25_53 Depth=1
	strb	w12, [x11, w13, sxtw]
LBB25_57:                               ;   in Loop: Header=BB25_53 Depth=1
	mov	w13, v0.s[2]
	cmp	w13, #127
	b.hi	LBB25_59
; %bb.58:                               ;   in Loop: Header=BB25_53 Depth=1
	strb	w12, [x11, w13, sxtw]
LBB25_59:                               ;   in Loop: Header=BB25_53 Depth=1
	mov	w13, v0.s[3]
	cmp	w13, #127
	b.hi	LBB25_61
; %bb.60:                               ;   in Loop: Header=BB25_53 Depth=1
	strb	w12, [x11, w13, sxtw]
LBB25_61:                               ;   in Loop: Header=BB25_53 Depth=1
	ldr	q0, [x10, #16]
	fmov	w13, s0
	cmp	w13, #127
	b.hi	LBB25_63
; %bb.62:                               ;   in Loop: Header=BB25_53 Depth=1
	fmov	w13, s0
	strb	w12, [x11, w13, sxtw]
LBB25_63:                               ;   in Loop: Header=BB25_53 Depth=1
	mov	w13, v0.s[1]
	cmp	w13, #127
	b.hi	LBB25_65
; %bb.64:                               ;   in Loop: Header=BB25_53 Depth=1
	strb	w12, [x11, w13, sxtw]
LBB25_65:                               ;   in Loop: Header=BB25_53 Depth=1
	mov	w13, v0.s[2]
	cmp	w13, #127
	b.hi	LBB25_67
; %bb.66:                               ;   in Loop: Header=BB25_53 Depth=1
	strb	w12, [x11, w13, sxtw]
LBB25_67:                               ;   in Loop: Header=BB25_53 Depth=1
	mov	w13, v0.s[3]
	cmp	w13, #127
	b.hi	LBB25_52
; %bb.68:                               ;   in Loop: Header=BB25_53 Depth=1
	strb	w12, [x11, w13, sxtw]
	b	LBB25_52
LBB25_69:
Lloh127:
	adrp	x8, _hud_scripted_globals@GOTPAGE
Lloh128:
	ldr	w8, [x8, _hud_scripted_globals@GOTPAGEOFF]
Lloh129:
	ldr	w8, [x8]
	cbz	w8, LBB25_71
; %bb.70:
	ldrb	w8, [x8]
	cmp	w8, #0
	cset	w8, eq
LBB25_71:
	mov	w22, wzr
	tbnz	w8, #0, LBB25_169
; %bb.72:
	ldrb	w8, [x25, _chat_input@PAGEOFF]
	mov	w20, w22
	cbnz	w8, LBB25_29
; %bb.73:
	bl	_console_is_active
	cbnz	w0, LBB25_27
; %bb.74:
	bl	_halo_keyboard_actions
	and	w22, w0, #0x600000
	bl	_network_vote_pad_open
	cbz	w0, LBB25_28
; %bb.75:
	mov	w0, wzr
	bl	_halo_chat_pad_buttons_for_port
	and	w20, w0, #0xc
	b	LBB25_29
LBB25_76:
	cmp	w8, w20
	b.eq	LBB25_112
	b	LBB25_165
LBB25_77:
	and	w8, w20, #0x7ff0
	add	x9, sp, #136
	add	x10, sp, #8
	mov	w11, #1                         ; =0x1
	and	w12, w20, #0x7ff0
	b	LBB25_79
	.p2align	4, , 8
LBB25_78:                               ;   in Loop: Header=BB25_79 Depth=1
	add	w9, w9, #64
	subs	w12, w12, #16
	b.eq	LBB25_111
LBB25_79:                               ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x9]
	fmov	w13, s0
	cmp	w13, #127
	b.hi	LBB25_81
; %bb.80:                               ;   in Loop: Header=BB25_79 Depth=1
	fmov	w13, s0
	strb	w11, [x10, w13, sxtw]
LBB25_81:                               ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v0.s[1]
	cmp	w13, #127
	b.hi	LBB25_83
; %bb.82:                               ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_83:                               ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v0.s[2]
	cmp	w13, #127
	b.hi	LBB25_85
; %bb.84:                               ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_85:                               ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v0.s[3]
	cmp	w13, #127
	b.hi	LBB25_87
; %bb.86:                               ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_87:                               ;   in Loop: Header=BB25_79 Depth=1
	ldr	q0, [x9, #16]
	fmov	w13, s0
	cmp	w13, #127
	b.hi	LBB25_89
; %bb.88:                               ;   in Loop: Header=BB25_79 Depth=1
	fmov	w13, s0
	strb	w11, [x10, w13, sxtw]
LBB25_89:                               ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v0.s[1]
	cmp	w13, #127
	b.hi	LBB25_91
; %bb.90:                               ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_91:                               ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v0.s[2]
	cmp	w13, #127
	b.hi	LBB25_93
; %bb.92:                               ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_93:                               ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v0.s[3]
	cmp	w13, #127
	b.hi	LBB25_95
; %bb.94:                               ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_95:                               ;   in Loop: Header=BB25_79 Depth=1
	ldr	q1, [x9, #32]
	fmov	w13, s1
	cmp	w13, #127
	b.hi	LBB25_97
; %bb.96:                               ;   in Loop: Header=BB25_79 Depth=1
	fmov	w13, s1
	strb	w11, [x10, w13, sxtw]
LBB25_97:                               ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v1.s[1]
	cmp	w13, #127
	b.hi	LBB25_99
; %bb.98:                               ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_99:                               ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v1.s[2]
	ldr	q0, [x9, #48]
	cmp	w13, #127
	b.hi	LBB25_101
; %bb.100:                              ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_101:                              ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v1.s[3]
	cmp	w13, #127
	b.hi	LBB25_103
; %bb.102:                              ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_103:                              ;   in Loop: Header=BB25_79 Depth=1
	fmov	w13, s0
	cmp	w13, #127
	b.hi	LBB25_105
; %bb.104:                              ;   in Loop: Header=BB25_79 Depth=1
	fmov	w13, s0
	strb	w11, [x10, w13, sxtw]
LBB25_105:                              ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v0.s[1]
	cmp	w13, #127
	b.hi	LBB25_107
; %bb.106:                              ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_107:                              ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v0.s[2]
	cmp	w13, #127
	b.hi	LBB25_109
; %bb.108:                              ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
LBB25_109:                              ;   in Loop: Header=BB25_79 Depth=1
	mov	w13, v0.s[3]
	cmp	w13, #127
	b.hi	LBB25_78
; %bb.110:                              ;   in Loop: Header=BB25_79 Depth=1
	strb	w11, [x10, w13, sxtw]
	b	LBB25_78
LBB25_111:
	cmp	w8, w20
	b.ne	LBB25_164
LBB25_112:
	mov	w8, wzr
	add	x9, sp, #8
Lloh130:
	adrp	x10, _chat_rates@PAGE+64
Lloh131:
	add	x10, x10, _chat_rates@PAGEOFF+64
	b	LBB25_114
	.p2align	4, , 8
LBB25_113:                              ;   in Loop: Header=BB25_114 Depth=1
	add	w8, w8, #16
	add	w10, w10, #128
	cmp	w8, #128
	b.eq	LBB25_23
LBB25_114:                              ; =>This Inner Loop Header: Depth=1
	add	w11, w9, w8
	ldr	q0, [x11]
	umov	w11, v0.b[0]
	cbnz	w11, LBB25_130
; %bb.115:                              ;   in Loop: Header=BB25_114 Depth=1
	sub	w11, w10, #64
	strb	wzr, [x11]
	umov	w11, v0.b[1]
	cbz	w11, LBB25_131
LBB25_116:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[2]
	cbnz	w11, LBB25_132
LBB25_117:                              ;   in Loop: Header=BB25_114 Depth=1
	sub	w11, w10, #48
	strb	wzr, [x11]
	umov	w11, v0.b[3]
	cbz	w11, LBB25_133
LBB25_118:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[4]
	cbnz	w11, LBB25_134
LBB25_119:                              ;   in Loop: Header=BB25_114 Depth=1
	sub	w11, w10, #32
	strb	wzr, [x11]
	umov	w11, v0.b[5]
	cbz	w11, LBB25_135
LBB25_120:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[6]
	cbnz	w11, LBB25_136
LBB25_121:                              ;   in Loop: Header=BB25_114 Depth=1
	sub	w11, w10, #16
	strb	wzr, [x11]
	umov	w11, v0.b[7]
	cbz	w11, LBB25_137
LBB25_122:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[8]
	cbnz	w11, LBB25_138
LBB25_123:                              ;   in Loop: Header=BB25_114 Depth=1
	strb	wzr, [x10]
	umov	w11, v0.b[9]
	cbz	w11, LBB25_139
LBB25_124:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[10]
	cbnz	w11, LBB25_140
LBB25_125:                              ;   in Loop: Header=BB25_114 Depth=1
	add	w11, w10, #16
	strb	wzr, [x11]
	umov	w11, v0.b[11]
	cbz	w11, LBB25_141
LBB25_126:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[12]
	cbnz	w11, LBB25_142
LBB25_127:                              ;   in Loop: Header=BB25_114 Depth=1
	add	w11, w10, #32
	strb	wzr, [x11]
	umov	w11, v0.b[13]
	cbz	w11, LBB25_143
LBB25_128:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[14]
	cbnz	w11, LBB25_144
LBB25_129:                              ;   in Loop: Header=BB25_114 Depth=1
	add	w11, w10, #48
	strb	wzr, [x11]
	umov	w11, v0.b[15]
	cbnz	w11, LBB25_113
	b	LBB25_145
	.p2align	4, , 8
LBB25_130:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[1]
	cbnz	w11, LBB25_116
LBB25_131:                              ;   in Loop: Header=BB25_114 Depth=1
	sub	w11, w10, #56
	strb	wzr, [x11]
	umov	w11, v0.b[2]
	cbz	w11, LBB25_117
LBB25_132:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[3]
	cbnz	w11, LBB25_118
LBB25_133:                              ;   in Loop: Header=BB25_114 Depth=1
	sub	w11, w10, #40
	strb	wzr, [x11]
	umov	w11, v0.b[4]
	cbz	w11, LBB25_119
LBB25_134:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[5]
	cbnz	w11, LBB25_120
LBB25_135:                              ;   in Loop: Header=BB25_114 Depth=1
	sub	w11, w10, #24
	strb	wzr, [x11]
	umov	w11, v0.b[6]
	cbz	w11, LBB25_121
LBB25_136:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[7]
	cbnz	w11, LBB25_122
LBB25_137:                              ;   in Loop: Header=BB25_114 Depth=1
	sub	w11, w10, #8
	strb	wzr, [x11]
	umov	w11, v0.b[8]
	cbz	w11, LBB25_123
LBB25_138:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[9]
	cbnz	w11, LBB25_124
LBB25_139:                              ;   in Loop: Header=BB25_114 Depth=1
	add	w11, w10, #8
	strb	wzr, [x11]
	umov	w11, v0.b[10]
	cbz	w11, LBB25_125
LBB25_140:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[11]
	cbnz	w11, LBB25_126
LBB25_141:                              ;   in Loop: Header=BB25_114 Depth=1
	add	w11, w10, #24
	strb	wzr, [x11]
	umov	w11, v0.b[12]
	cbz	w11, LBB25_127
LBB25_142:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[13]
	cbnz	w11, LBB25_128
LBB25_143:                              ;   in Loop: Header=BB25_114 Depth=1
	add	w11, w10, #40
	strb	wzr, [x11]
	umov	w11, v0.b[14]
	cbz	w11, LBB25_129
LBB25_144:                              ;   in Loop: Header=BB25_114 Depth=1
	umov	w11, v0.b[15]
	cbnz	w11, LBB25_113
LBB25_145:                              ;   in Loop: Header=BB25_114 Depth=1
	add	w11, w10, #56
	strb	wzr, [x11]
	b	LBB25_113
LBB25_146:
Lloh132:
	adrp	x8, _hud_scripted_globals@GOTPAGE
Lloh133:
	ldr	w8, [x8, _hud_scripted_globals@GOTPAGEOFF]
Lloh134:
	ldr	w8, [x8]
	cbz	w8, LBB25_148
; %bb.147:
	ldrb	w8, [x8]
	cbz	w8, LBB25_47
LBB25_148:
	ldrb	w8, [x22]
	cbz	w8, LBB25_152
; %bb.149:
	ldrb	w9, [x22, #12]
	cbz	w9, LBB25_152
; %bb.150:
	adrp	x8, _chat_input@PAGE+4
	ldrsh	w0, [x8, _chat_input@PAGEOFF+4]
	bl	_controller_remap_connected
	cbz	w0, LBB25_47
; %bb.151:
	ldrb	w8, [x25, _chat_input@PAGEOFF]
LBB25_152:
	ldr	w9, [sp, #4]                    ; 4-byte Reload
	bic	w27, w28, w9
	cbz	w8, LBB25_170
; %bb.153:
	str	wzr, [x20, _chat_actions_held@PAGEOFF]
	bl	_console_is_active
	cbnz	w0, LBB25_48
; %bb.154:
	adrp	x23, _chat_keyboard.0@PAGE
	ldrb	w8, [x23, _chat_keyboard.0@PAGEOFF]
	cbz	w8, LBB25_183
; %bb.155:
	bl	_system_milliseconds
	tbnz	w27, #5, LBB25_179
; %bb.156:
	tbnz	w27, #8, LBB25_180
; %bb.157:
	tbz	w27, #0, LBB25_159
; %bb.158:
	adrp	x8, _chat_input@PAGE+2
	mov	w10, #21846                     ; =0x5556
	movk	w10, #21845, lsl #16
	ldrsh	w9, [x8, _chat_input@PAGEOFF+2]
	add	w9, w9, #2
	smull	x10, w9, w10
	lsr	x11, x10, #32
	add	x10, x11, x10, lsr #63
	add	w10, w10, w10, lsl #1
	sub	w9, w9, w10
	strh	w9, [x8, _chat_input@PAGEOFF+2]
LBB25_159:
	tbz	w27, #1, LBB25_161
; %bb.160:
	adrp	x8, _chat_input@PAGE+2
	mov	w10, #21846                     ; =0x5556
	movk	w10, #21845, lsl #16
	ldrsh	w9, [x8, _chat_input@PAGEOFF+2]
	add	w9, w9, #1
	smull	x10, w9, w10
	lsr	x11, x10, #32
	add	x10, x11, x10, lsr #63
	add	w10, w10, w10, lsl #1
	sub	w9, w9, w10
	strh	w9, [x8, _chat_input@PAGEOFF+2]
LBB25_161:
	adrp	x19, _chat_keyboard.1@PAGE
	ldrb	w8, [x19, _chat_keyboard.1@PAGEOFF]
	cbz	w8, LBB25_240
; %bb.162:
	add	x0, sp, #136
	add	x1, sp, #8
	bl	_halo_chat_taps
	cbz	w0, LBB25_183
; %bb.163:
	bl	_halo_system_keyboard_again
	b	LBB25_183
LBB25_164:
	tbnz	w20, #3, LBB25_51
LBB25_165:
	add	x10, sp, #136
	sub	w9, w20, w8
	add	w8, w10, w8, lsl #2
	add	x10, sp, #8
	mov	w11, #1                         ; =0x1
	b	LBB25_167
	.p2align	4, , 8
LBB25_166:                              ;   in Loop: Header=BB25_167 Depth=1
	add	w8, w8, #4
	subs	w9, w9, #1
	b.eq	LBB25_112
LBB25_167:                              ; =>This Inner Loop Header: Depth=1
	ldr	w12, [x8]
	cmp	w12, #127
	b.hi	LBB25_166
; %bb.168:                              ;   in Loop: Header=BB25_167 Depth=1
	strb	w11, [x10, w12, sxtw]
	b	LBB25_166
LBB25_169:
	mov	w20, w22
	b	LBB25_29
LBB25_170:
	mov	w0, wzr
	bl	_halo_keyboard_actions
	ldr	w8, [x20, _chat_actions_held@PAGEOFF]
	and	w9, w0, #0x180000
	mov	w10, #65535                     ; =0xffff
	cmp	w24, w10
	str	w9, [x20, _chat_actions_held@PAGEOFF]
	bic	w28, w9, w8
	ccmp	w28, #0, #0, eq
	b.eq	LBB25_177
LBB25_171:
	bl	_console_is_active
	cbnz	w0, LBB25_48
; %bb.172:
	bl	_overlay_menu_open
	cbnz	w0, LBB25_48
; %bb.173:
	bl	_social_chat_replaces_upstream
	cbz	w0, LBB25_238
; %bb.174:
	bl	_social_chat_typing
	cbnz	w0, LBB25_48
; %bb.175:
	cbz	w28, LBB25_251
; %bb.176:
	mov	w8, #1                          ; =0x1
	bic	w0, w8, w28, lsr #19
	b	LBB25_252
LBB25_177:
	tbz	w27, #0, LBB25_48
; %bb.178:
	bl	_network_replay_playing
	cbnz	w0, LBB25_48
	b	LBB25_171
LBB25_179:
	strb	wzr, [x25, _chat_input@PAGEOFF]
	b	LBB25_181
LBB25_180:
	ldrsh	w0, [x22, #2]
	add	x1, x22, #13
	mov	w2, #1                          ; =0x1
	mov	w3, #1                          ; =0x1
	bl	_chat_send
	strb	wzr, [x22]
LBB25_181:
	adrp	x8, _chat_keyboard.1@PAGE
	adrp	x9, _chat_keyboard.9@PAGE
	strb	wzr, [x23, _chat_keyboard.0@PAGEOFF]
	str	wzr, [x21, _chat_keyboard.2@PAGEOFF]
	strb	wzr, [x8, _chat_keyboard.1@PAGEOFF]
	strb	wzr, [x9, _chat_keyboard.9@PAGEOFF]
LBB25_182:
	adrp	x8, _chat_scroll@PAGE
	strh	wzr, [x8, _chat_scroll@PAGEOFF]
LBB25_183:
	ldrb	w8, [x25, _chat_input@PAGEOFF]
	cbz	w8, LBB25_233
; %bb.184:
	add	x8, sp, #136
	mov	w19, #21846                     ; =0x5556
	adrp	x26, _chat_keyboard.1@PAGE
	add	w27, w8, #1
	adrp	x28, _chat_keyboard.9@PAGE
	adrp	x24, _chat_input@PAGE+2
	movk	w19, #21845, lsl #16
	b	LBB25_190
LBB25_185:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #86
	b.eq	LBB25_202
; %bb.186:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #102
	b.ne	LBB25_207
LBB25_187:                              ;   in Loop: Header=BB25_190 Depth=1
	ldrsh	w0, [x22, #2]
	add	x1, x22, #13
	mov	w2, #1                          ; =0x1
	mov	w3, #1                          ; =0x1
	bl	_chat_send
	strb	wzr, [x22]
LBB25_188:                              ;   in Loop: Header=BB25_190 Depth=1
	adrp	x8, _chat_scroll@PAGE
	strb	wzr, [x23, _chat_keyboard.0@PAGEOFF]
	strb	wzr, [x26, _chat_keyboard.1@PAGEOFF]
	str	wzr, [x21, _chat_keyboard.2@PAGEOFF]
	strb	wzr, [x28, _chat_keyboard.9@PAGEOFF]
	strh	wzr, [x8, _chat_scroll@PAGEOFF]
LBB25_189:                              ;   in Loop: Header=BB25_190 Depth=1
	ldrb	w8, [x25, _chat_input@PAGEOFF]
	cbz	w8, LBB25_233
LBB25_190:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB25_221 Depth 2
                                        ;     Child Loop BB25_211 Depth 2
	add	x0, sp, #8
	bl	_input_get_key
	cbz	w0, LBB25_231
; %bb.191:                              ;   in Loop: Header=BB25_190 Depth=1
	ldrh	w8, [sp, #10]
	cmp	w8, #55
	b.gt	LBB25_195
; %bb.192:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #28
	b.gt	LBB25_199
; %bb.193:                              ;   in Loop: Header=BB25_190 Depth=1
	cbz	w8, LBB25_204
; %bb.194:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #16
	b.eq	LBB25_189
	b	LBB25_207
LBB25_195:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #85
	b.gt	LBB25_185
; %bb.196:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #56
	b.eq	LBB25_187
; %bb.197:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #83
	b.ne	LBB25_207
; %bb.198:                              ;   in Loop: Header=BB25_190 Depth=1
	adrp	x9, _chat_scroll@PAGE
	ldrh	w8, [x9, _chat_scroll@PAGEOFF]
	add	w8, w8, #3
	b	LBB25_203
LBB25_199:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #29
	b.eq	LBB25_205
; %bb.200:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #30
	b.ne	LBB25_207
; %bb.201:                              ;   in Loop: Header=BB25_190 Depth=1
	ldrsh	w8, [x24, _chat_input@PAGEOFF+2]
	add	w8, w8, #1
	smull	x9, w8, w19
	lsr	x10, x9, #32
	add	x9, x10, x9, lsr #63
	add	w9, w9, w9, lsl #1
	sub	w8, w8, w9
	strh	w8, [x24, _chat_input@PAGEOFF+2]
	b	LBB25_189
LBB25_202:                              ;   in Loop: Header=BB25_190 Depth=1
	adrp	x9, _chat_scroll@PAGE
	ldrh	w8, [x9, _chat_scroll@PAGEOFF]
	sub	w8, w8, #3
LBB25_203:                              ;   in Loop: Header=BB25_190 Depth=1
	strh	w8, [x9, _chat_scroll@PAGEOFF]
	b	LBB25_189
LBB25_204:                              ;   in Loop: Header=BB25_190 Depth=1
	strb	wzr, [x25, _chat_input@PAGEOFF]
	b	LBB25_188
LBB25_205:                              ;   in Loop: Header=BB25_190 Depth=1
Lloh135:
	adrp	x0, _chat_input@PAGE+13
Lloh136:
	add	x0, x0, _chat_input@PAGEOFF+13
	bl	_csstrlen
	tst	w0, #0xffff
	b.eq	LBB25_189
; %bb.206:                              ;   in Loop: Header=BB25_190 Depth=1
	add	w8, w22, w0, sxth
	add	w8, w8, #12
	strb	wzr, [x8]
	b	LBB25_189
LBB25_207:                              ;   in Loop: Header=BB25_190 Depth=1
	ldrb	w9, [sp, #8]
	tbnz	w9, #1, LBB25_217
; %bb.208:                              ;   in Loop: Header=BB25_190 Depth=1
	ldrb	w20, [sp, #9]
	sub	w8, w20, #32
	cmp	w8, #94
	b.hi	LBB25_189
; %bb.209:                              ;   in Loop: Header=BB25_190 Depth=1
	add	x19, sp, #136
Lloh137:
	adrp	x0, _chat_input@PAGE+13
Lloh138:
	add	x0, x0, _chat_input@PAGEOFF+13
	add	w8, w19, #1
	strb	wzr, [x8]
	bl	_csstrlen
	sxth	w9, w0
	cmp	w9, #62
	b.gt	LBB25_228
; %bb.210:                              ;   in Loop: Header=BB25_190 Depth=1
	add	w8, w19, #1
	mov	w19, #21846                     ; =0x5556
	movk	w19, #21845, lsl #16
LBB25_211:                              ;   Parent Loop BB25_190 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sxtb	w10, w20
	cmp	w10, #32
	b.lt	LBB25_215
; %bb.212:                              ;   in Loop: Header=BB25_211 Depth=2
	and	w10, w20, #0xff
	cmp	w10, #124
	b.eq	LBB25_215
; %bb.213:                              ;   in Loop: Header=BB25_211 Depth=2
	cmp	w10, #127
	b.eq	LBB25_215
; %bb.214:                              ;   in Loop: Header=BB25_211 Depth=2
	add	x9, x22, w9, sxtw
	add	w0, w0, #1
	strb	w20, [x9, #13]
LBB25_215:                              ;   in Loop: Header=BB25_211 Depth=2
	ldrb	w20, [x8]
	sxth	w9, w0
	cbz	w20, LBB25_229
; %bb.216:                              ;   in Loop: Header=BB25_211 Depth=2
	add	w8, w8, #1
	cmp	w9, #63
	b.lt	LBB25_211
	b	LBB25_229
LBB25_217:                              ;   in Loop: Header=BB25_190 Depth=1
	cmp	w8, #61
	b.ne	LBB25_189
; %bb.218:                              ;   in Loop: Header=BB25_190 Depth=1
	add	x0, sp, #136
	mov	w1, #64                         ; =0x40
	bl	_platform_clipboard_get
	cbz	w0, LBB25_189
; %bb.219:                              ;   in Loop: Header=BB25_190 Depth=1
Lloh139:
	adrp	x0, _chat_input@PAGE+13
Lloh140:
	add	x0, x0, _chat_input@PAGEOFF+13
	bl	_csstrlen
	ldrb	w10, [sp, #136]
	sxth	w8, w0
	cmp	w8, #63
	ccmp	w10, #0, #4, lt
	b.eq	LBB25_227
; %bb.220:                              ;   in Loop: Header=BB25_190 Depth=1
	mov	x9, x27
LBB25_221:                              ;   Parent Loop BB25_190 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sxtb	w11, w10
	cmp	w11, #32
	b.lt	LBB25_225
; %bb.222:                              ;   in Loop: Header=BB25_221 Depth=2
	and	w11, w10, #0xff
	cmp	w11, #124
	b.eq	LBB25_225
; %bb.223:                              ;   in Loop: Header=BB25_221 Depth=2
	cmp	w11, #127
	b.eq	LBB25_225
; %bb.224:                              ;   in Loop: Header=BB25_221 Depth=2
	add	x8, x22, w8, sxtw
	add	w0, w0, #1
	strb	w10, [x8, #13]
LBB25_225:                              ;   in Loop: Header=BB25_221 Depth=2
	ldrb	w10, [x9]
	sxth	w8, w0
	cbz	w10, LBB25_227
; %bb.226:                              ;   in Loop: Header=BB25_221 Depth=2
	add	w9, w9, #1
	cmp	w8, #63
	b.lt	LBB25_221
LBB25_227:                              ;   in Loop: Header=BB25_190 Depth=1
	add	x8, x22, w8, sxtw
	b	LBB25_230
LBB25_228:                              ;   in Loop: Header=BB25_190 Depth=1
	mov	w19, #21846                     ; =0x5556
	movk	w19, #21845, lsl #16
LBB25_229:                              ;   in Loop: Header=BB25_190 Depth=1
	add	x8, x22, w9, sxtw
LBB25_230:                              ;   in Loop: Header=BB25_190 Depth=1
	strb	wzr, [x8, #13]
	b	LBB25_189
LBB25_231:
	ldrb	w8, [x25, _chat_input@PAGEOFF]
	cbz	w8, LBB25_233
; %bb.232:
	adrp	x20, _chat_scroll@PAGE
	ldrh	w19, [x20, _chat_scroll@PAGEOFF]
	bl	_halo_chat_wheel_steps
	add	w8, w19, w0
	b	LBB25_234
LBB25_233:
	adrp	x20, _chat_scroll@PAGE
	ldrh	w8, [x20, _chat_scroll@PAGEOFF]
LBB25_234:
	tbnz	w8, #15, LBB25_236
; %bb.235:
	adrp	x9, _chat_line_count@PAGE
	and	w8, w8, #0xffff
	ldrsh	w9, [x9, _chat_line_count@PAGEOFF]
	cmp	w9, #1
	csinc	w9, w9, wzr, gt
	sub	w9, w9, #1
	and	w9, w9, #0xffff
	cmp	w8, w9
	csel	w8, w8, w9, lo
	b	LBB25_237
LBB25_236:
	mov	w8, wzr
LBB25_237:
	strh	w8, [x20, _chat_scroll@PAGEOFF]
	b	LBB25_48
LBB25_238:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB25_242
; %bb.239:
	bl	_chat_host_config_flags
	b	LBB25_275
LBB25_240:
	adrp	x8, _chat_keyboard.8@PAGE
	mov	w9, #2052                       ; =0x804
	tst	w28, w9
	b.eq	LBB25_245
; %bb.241:
	mov	w9, #-1                         ; =0xffffffff
	b	LBB25_246
LBB25_242:
	adrp	x8, _chat_config.0@PAGE
	ldrb	w8, [x8, _chat_config.0@PAGEOFF]
	cbz	w8, LBB25_276
; %bb.243:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB25_273
; %bb.244:
	mov	w19, #1                         ; =0x1
	b	LBB25_274
LBB25_245:
	mov	w9, #4104                       ; =0x1008
	mov	w10, #5640                      ; =0x1608
	tst	w28, w9
	cset	w9, ne
	tst	w28, w10
	b.eq	LBB25_253
LBB25_246:
	ldr	w10, [x8, _chat_keyboard.8@PAGEOFF]
	cbz	w10, LBB25_250
; %bb.247:
	sub	w11, w0, w10
	tbz	w11, #31, LBB25_250
; %bb.248:
	tbnz	w27, #4, LBB25_255
LBB25_249:
	tbnz	w27, #6, LBB25_256
	b	LBB25_259
LBB25_250:
	adrp	x11, _chat_keyboard.3@PAGE
	ubfx	w13, w28, #10, #1
	add	w13, w13, #5
	tst	w28, #0x200
	mov	w14, #4                         ; =0x4
	adrp	x15, _chat_keyboard.4@PAGE
	ldrsh	w12, [x11, _chat_keyboard.3@PAGEOFF]
	csel	w13, w13, w14, eq
	mov	w14, #26215                     ; =0x6667
	movk	w14, #26214, lsl #16
	add	w12, w13, w12
	smull	x13, w12, w14
	asr	x16, x13, #33
	add	x13, x16, x13, lsr #63
	ldrsh	w16, [x15, _chat_keyboard.4@PAGEOFF]
	add	w13, w13, w13, lsl #2
	sub	w12, w12, w13
	mov	w13, #1                         ; =0x1
	cmp	w12, #4
	cinc	w13, w13, eq
	strh	w12, [x11, _chat_keyboard.3@PAGEOFF]
	sdiv	w16, w16, w13
	mul	w13, w16, w13
	cset	w16, eq
	cmp	w10, #0
	lsl	w9, w9, w16
	add	w9, w9, w13, sxth
	add	w9, w9, #10
	smull	x13, w9, w14
	lsr	x14, x13, #34
	add	x13, x14, x13, lsr #63
	mov	w14, #10                        ; =0xa
	msub	w10, w13, w14, w9
	mov	w9, #120                        ; =0x78
	mov	w13, #350                       ; =0x15e
	csel	w9, w13, w9, eq
	add	w9, w9, w0
	strh	w10, [x15, _chat_keyboard.4@PAGEOFF]
	b	LBB25_254
LBB25_251:
	tst	w26, #0xffff
	mov	w8, #65535                      ; =0xffff
	ccmp	w24, w8, #4, ne
	cset	w0, ne
LBB25_252:
	mov	w8, #65535                      ; =0xffff
	cmp	w24, w8
	csel	w8, w24, wzr, ne
	cmp	w28, #0
	csinv	w8, w8, wzr, eq
	sxth	w1, w8
	bl	_social_chat_open
	b	LBB25_48
LBB25_253:
	mov	w9, wzr
LBB25_254:
	str	w9, [x8, _chat_keyboard.8@PAGEOFF]
	tbz	w27, #4, LBB25_249
LBB25_255:
	bl	_chat_keyboard_press
	tbz	w27, #6, LBB25_259
LBB25_256:
	ldrb	w8, [x25, _chat_input@PAGEOFF]
	cbz	w8, LBB25_259
; %bb.257:
Lloh141:
	adrp	x0, _chat_input@PAGE+13
Lloh142:
	add	x0, x0, _chat_input@PAGEOFF+13
	bl	_csstrlen
	tst	w0, #0xffff
	b.eq	LBB25_259
; %bb.258:
Lloh143:
	adrp	x8, _chat_input@PAGE
Lloh144:
	add	x8, x8, _chat_input@PAGEOFF
	add	w8, w8, w0, sxth
	add	w8, w8, #12
	strb	wzr, [x8]
LBB25_259:
	ldrb	w8, [x25, _chat_input@PAGEOFF]
	tbz	w27, #7, LBB25_262
; %bb.260:
	cbz	w8, LBB25_262
; %bb.261:
	adrp	x9, _chat_keyboard.5@PAGE
	ldrb	w10, [x9, _chat_keyboard.5@PAGEOFF]
	cmp	w10, #0
	cset	w10, eq
	strb	w10, [x9, _chat_keyboard.5@PAGEOFF]
LBB25_262:
	cbz	w8, LBB25_183
; %bb.263:
	adrp	x8, _chat_input@PAGE+4
	ldrh	w8, [x8, _chat_input@PAGEOFF+4]
	cbnz	w8, LBB25_183
; %bb.264:
	add	x0, sp, #136
	add	x1, sp, #8
	bl	_halo_chat_taps
	cbz	w0, LBB25_183
; %bb.265:
	adrp	x8, _chat_keyboard.9@PAGE
	ldrb	w9, [x8, _chat_keyboard.9@PAGEOFF]
	cbz	w9, LBB25_183
; %bb.266:
	mov	w10, #1148846080                ; =0x447a0000
	adrp	x9, _chat_keyboard.11@PAGE
	ldr	s0, [sp, #8]
	adrp	x11, _chat_keyboard.13@PAGE
	fmov	s1, w10
	ldrsh	w9, [x9, _chat_keyboard.11@PAGEOFF]
	ldrsh	w10, [x11, _chat_keyboard.13@PAGEOFF]
	scvtf	s2, w9
	sub	w9, w10, w9
	fmul	s0, s0, s1
	fsub	s0, s0, s2
	scvtf	s2, w9
	fdiv	s0, s0, s2
	fmov	s2, #1.00000000
	fcmp	s0, s2
	b.ge	LBB25_286
; %bb.267:
	adrp	x9, _chat_keyboard.10@PAGE
	ldr	s2, [sp, #136]
	adrp	x10, _chat_keyboard.12@PAGE
	ldrsh	w9, [x9, _chat_keyboard.10@PAGEOFF]
	ldrsh	w10, [x10, _chat_keyboard.12@PAGEOFF]
	fmul	s1, s2, s1
	scvtf	s2, w9
	sub	w9, w10, w9
	fsub	s1, s1, s2
	scvtf	s2, w9
	fdiv	s1, s1, s2
	fcmp	s1, #0.0
	b.mi	LBB25_286
; %bb.268:
	fmov	s2, #1.00000000
	fcmp	s1, s2
	b.ge	LBB25_286
; %bb.269:
	fcmp	s0, #0.0
	b.mi	LBB25_286
; %bb.270:
	fmov	s2, #5.00000000
	adrp	x9, _chat_keyboard.3@PAGE
	fmov	s3, #10.00000000
	fmul	s0, s0, s2
	fmul	s1, s1, s3
	fcvtzs	s0, s0
	fcvtzs	w8, s1
	fmov	w10, s0
	str	h0, [x9, _chat_keyboard.3@PAGEOFF]
	cmp	w10, #4
	b.ne	LBB25_272
; %bb.271:
	and	w9, w8, #0x8000
	add	w8, w8, w9, lsr #15
	and	w8, w8, #0xfffffffe
LBB25_272:
	adrp	x9, _chat_keyboard.4@PAGE
	strh	w8, [x9, _chat_keyboard.4@PAGEOFF]
	bl	_chat_keyboard_press
	b	LBB25_183
LBB25_273:
	bl	_p2p_joined_listed_host
	cmp	w0, #0
	cset	w19, eq
LBB25_274:
	bl	_p2p_joined_listed_dedicated
	adrp	x8, _chat_config.1@PAGE
	cmp	w0, #0
	csinc	w9, w19, wzr, eq
	cmp	w9, #0
	ldrb	w8, [x8, _chat_config.1@PAGEOFF]
	csel	w0, w8, wzr, ne
LBB25_275:
	tbnz	w0, #0, LBB25_279
LBB25_276:
	adrp	x8, _chat_off_noticed@PAGE
	adrp	x9, _chat_off_noticed_at@PAGE
	ldrb	w10, [x8, _chat_off_noticed@PAGEOFF]
	cbz	w10, LBB25_278
; %bb.277:
	ldr	w10, [x9, _chat_off_noticed_at@PAGEOFF]
	ldr	w11, [sp]                       ; 4-byte Reload
	sub	w10, w11, w10
	lsr	w10, w10, #3
	cmp	w10, #1375
	b.lo	LBB25_48
LBB25_278:
	mov	w10, #1                         ; =0x1
Lloh145:
	adrp	x0, l_.str.5@PAGE
Lloh146:
	add	x0, x0, l_.str.5@PAGEOFF
	strb	w10, [x8, _chat_off_noticed@PAGEOFF]
	ldr	w8, [sp]                        ; 4-byte Reload
	str	w8, [x9, _chat_off_noticed_at@PAGEOFF]
	bl	_chat_add_notice
	b	LBB25_48
LBB25_279:
	cbz	w28, LBB25_284
; %bb.280:
	mov	w0, #-1                         ; =0xffffffff
	tst	w28, #0x80000
	cset	w20, eq
	bl	_local_player_get_next
	cmn	w0, #1
	b.eq	LBB25_48
; %bb.281:
	bl	_local_player_get_player_index
	cmn	w0, #1
	b.eq	LBB25_48
; %bb.282:
Lloh147:
	adrp	x21, _chat_input@PAGE
Lloh148:
	add	x21, x21, _chat_input@PAGEOFF
	mov	w19, w0
	mov	x0, x21
	mov	w1, wzr
	mov	w2, #80                         ; =0x50
	bl	_csmemset
Lloh149:
	adrp	x8, _player_data@GOTPAGE
	mov	w9, #1                          ; =0x1
	mov	w1, w19
Lloh150:
	ldr	w8, [x8, _player_data@GOTPAGEOFF]
	strb	w9, [x21]
	strh	w20, [x21, #2]
Lloh151:
	ldr	w0, [x8]
	adrp	x8, _chat_scroll@PAGE
	strh	wzr, [x8, _chat_scroll@PAGEOFF]
	bl	_datum_get
	ldrh	w8, [x0, #2]
	str	w19, [x21, #8]
	strb	wzr, [x21, #12]
	strh	w8, [x21, #4]
LBB25_283:                              ; =>This Inner Loop Header: Depth=1
	add	x0, sp, #136
	bl	_input_get_key
	cbnz	w0, LBB25_283
	b	LBB25_48
LBB25_284:
	mov	w8, #65535                      ; =0xffff
	cmp	w24, w8
	cset	w20, ne
	tbnz	w24, #15, LBB25_287
; %bb.285:
	sxth	w0, w24
	bl	_controller_remap_local_player
	b	LBB25_288
LBB25_286:
	strb	wzr, [x25, _chat_input@PAGEOFF]
	strb	wzr, [x23, _chat_keyboard.0@PAGEOFF]
	strb	wzr, [x19, _chat_keyboard.1@PAGEOFF]
	str	wzr, [x21, _chat_keyboard.2@PAGEOFF]
	strb	wzr, [x8, _chat_keyboard.9@PAGEOFF]
	b	LBB25_182
LBB25_287:
	mov	w0, #-1                         ; =0xffffffff
	bl	_local_player_get_next
LBB25_288:
	cmn	w0, #1
	b.eq	LBB25_292
; %bb.289:
	bl	_local_player_get_player_index
	cmn	w0, #1
	b.eq	LBB25_292
; %bb.290:
	mov	w19, w0
	mov	x0, x22
	mov	w1, wzr
	mov	w2, #80                         ; =0x50
	bl	_csmemset
Lloh152:
	adrp	x8, _player_data@GOTPAGE
	mov	w9, #1                          ; =0x1
	mov	w1, w19
Lloh153:
	ldr	w8, [x8, _player_data@GOTPAGEOFF]
	strb	w9, [x22]
	strh	w26, [x22, #2]
Lloh154:
	ldr	w0, [x8]
	adrp	x8, _chat_scroll@PAGE
	strh	wzr, [x8, _chat_scroll@PAGEOFF]
	bl	_datum_get
	ldrh	w8, [x0, #2]
	str	w19, [x22, #8]
	strb	w20, [x22, #12]
	strh	w8, [x22, #4]
LBB25_291:                              ; =>This Inner Loop Header: Depth=1
	add	x0, sp, #136
	bl	_input_get_key
	cbnz	w0, LBB25_291
LBB25_292:
	ldrb	w8, [x25, _chat_input@PAGEOFF]
	cbz	w8, LBB25_48
; %bb.293:
	mov	w8, #65535                      ; =0xffff
	cmp	w24, w8
	b.eq	LBB25_295
; %bb.294:
	adrp	x8, _chat_input@PAGE+4
	ldrsh	w0, [x8, _chat_input@PAGEOFF+4]
	bl	_halo_chat_pad_buttons_for_port
	b	LBB25_296
LBB25_295:
	bl	_halo_chat_pad_buttons
LBB25_296:
	adrp	x8, _chat_input@PAGE+12
	adrp	x9, _chat_keyboard.0@PAGE
	mov	w20, #1                         ; =0x1
Lloh155:
	adrp	x19, l_.str.7@PAGE
Lloh156:
	add	x19, x19, l_.str.7@PAGEOFF
	str	w0, [x21, _chat_keyboard.2@PAGEOFF]
	ldrb	w8, [x8, _chat_input@PAGEOFF+12]
	str	wzr, [x23, _chat_keyboard.7@PAGEOFF]
	strb	w20, [x9, _chat_keyboard.0@PAGEOFF]
	cbz	w8, LBB25_298
; %bb.297:
	mov	w8, wzr
	b	LBB25_299
LBB25_298:
	bl	_halo_system_keyboard
	cmp	w0, #0
Lloh157:
	adrp	x9, l_.str.6@PAGE
Lloh158:
	add	x9, x9, l_.str.6@PAGEOFF
	cset	w8, ne
	csel	x19, x9, x19, ne
LBB25_299:
	adrp	x9, _chat_keyboard.1@PAGE
	mov	w0, #3                          ; =0x3
	mov	x1, x19
	strb	w8, [x9, _chat_keyboard.1@PAGEOFF]
	bl	_error
Lloh159:
	adrp	x8, _chat_keyboard.3@PAGE
	adrp	x9, _chat_keyboard.4@PAGE
	adrp	x10, _chat_keyboard.5@PAGE
	adrp	x11, _chat_keyboard.6@PAGE
	strh	w20, [x8, _chat_keyboard.3@PAGEOFF]
Lloh160:
	adrp	x8, _chat_keyboard.8@PAGE
	strh	wzr, [x9, _chat_keyboard.4@PAGEOFF]
	strb	wzr, [x10, _chat_keyboard.5@PAGEOFF]
	strb	wzr, [x11, _chat_keyboard.6@PAGEOFF]
	str	wzr, [x8, _chat_keyboard.8@PAGEOFF]
	b	LBB25_48
	.loh AdrpAdd	Lloh117, Lloh118
	.loh AdrpAdd	Lloh115, Lloh116
	.loh AdrpAdd	Lloh119, Lloh120
	.loh AdrpAdd	Lloh121, Lloh122
	.loh AdrpAdd	Lloh123, Lloh124
	.loh AdrpAdrp	Lloh125, Lloh126
	.loh AdrpLdrGotLdr	Lloh127, Lloh128, Lloh129
	.loh AdrpAdd	Lloh130, Lloh131
	.loh AdrpLdrGotLdr	Lloh132, Lloh133, Lloh134
	.loh AdrpAdd	Lloh135, Lloh136
	.loh AdrpAdd	Lloh137, Lloh138
	.loh AdrpAdd	Lloh139, Lloh140
	.loh AdrpAdd	Lloh141, Lloh142
	.loh AdrpAdd	Lloh143, Lloh144
	.loh AdrpAdd	Lloh145, Lloh146
	.loh AdrpLdrGotLdr	Lloh149, Lloh150, Lloh151
	.loh AdrpAdd	Lloh147, Lloh148
	.loh AdrpLdrGotLdr	Lloh152, Lloh153, Lloh154
	.loh AdrpAdd	Lloh155, Lloh156
	.loh AdrpAdd	Lloh157, Lloh158
	.loh AdrpAdrp	Lloh159, Lloh160
                                        ; -- End function
	.globl	_network_chat_controller        ; -- Begin function network_chat_controller
	.p2align	4
_network_chat_controller:               ; @network_chat_controller
; %bb.0:
	adrp	x8, _chat_input@PAGE
	adrp	x9, _chat_keyboard.0@PAGE
	ldrb	w8, [x8, _chat_input@PAGEOFF]
	ldrb	w9, [x9, _chat_keyboard.0@PAGEOFF]
	cmp	w8, #0
	ccmp	w9, #0, #4, ne
	b.ne	LBB26_2
; %bb.1:
	b	_social_chat_controller
LBB26_2:
	adrp	x8, _chat_input@PAGE+4
	ldrsh	w0, [x8, _chat_input@PAGEOFF+4]
	ret
                                        ; -- End function
	.globl	_network_chat_typing            ; -- Begin function network_chat_typing
	.p2align	4
_network_chat_typing:                   ; @network_chat_typing
; %bb.0:
	adrp	x8, _chat_input@PAGE
	ldrb	w8, [x8, _chat_input@PAGEOFF]
	cbz	w8, LBB27_2
; %bb.1:
	mov	w0, #1                          ; =0x1
	ret
LBB27_2:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	bl	_social_chat_typing
	cmp	w0, #0
	cset	w0, ne
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.globl	_network_chat_available         ; -- Begin function network_chat_available
	.p2align	4
_network_chat_available:                ; @network_chat_available
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.ls	LBB28_2
LBB28_1:
	mov	w0, wzr
	b	LBB28_16
LBB28_2:
	bl	_game_in_progress
	cbz	w0, LBB28_16
; %bb.3:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB28_5
; %bb.4:
	bl	_chat_host_config_flags
	tbz	w0, #0, LBB28_1
	b	LBB28_10
LBB28_5:
	adrp	x8, _chat_config.0@PAGE
	ldrb	w8, [x8, _chat_config.0@PAGEOFF]
	cbz	w8, LBB28_1
; %bb.6:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB28_8
; %bb.7:
	mov	w19, #1                         ; =0x1
	b	LBB28_9
LBB28_8:
	bl	_p2p_joined_listed_host
	cmp	w0, #0
	cset	w19, eq
LBB28_9:
	bl	_p2p_joined_listed_dedicated
	adrp	x8, _chat_config.1@PAGE
	cmp	w0, #0
	csinc	w9, w19, wzr, eq
	cmp	w9, #0
	ldrb	w8, [x8, _chat_config.1@PAGEOFF]
	csel	w0, w8, wzr, ne
	tbz	w0, #0, LBB28_1
LBB28_10:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB28_12
; %bb.11:
	mov	w0, #1                          ; =0x1
	b	LBB28_16
LBB28_12:
	bl	_game_connection
	cmp	w0, #2
	b.ne	LBB28_14
; %bb.13:
	mov	w19, #1                         ; =0x1
	b	LBB28_15
LBB28_14:
	bl	_p2p_joined_listed_host
	cmp	w0, #0
	cset	w19, eq
LBB28_15:
	bl	_p2p_joined_listed_dedicated
	cmp	w0, #0
	csinc	w0, w19, wzr, eq
LBB28_16:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.globl	_network_chat_note_motion_sensor ; -- Begin function network_chat_note_motion_sensor
	.p2align	4
_network_chat_note_motion_sensor:       ; @network_chat_note_motion_sensor
; %bb.0:
	cmp	w0, #3
	b.hi	LBB29_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
Lloh161:
	adrp	x8, _render@GOTPAGE
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	mov	w10, #12                        ; =0xc
Lloh162:
	adrp	x9, _chat_motion_sensors@PAGE
Lloh163:
	add	x9, x9, _chat_motion_sensors@PAGEOFF
	add	x29, sp, #16
Lloh164:
	ldr	w8, [x8, _render@GOTPAGEOFF]
	smaddl	x19, w0, w10, x9
	mov	w10, #1                         ; =0x1
	ldrh	w11, [x8, #74]
	ldrh	w12, [x8, #70]
	ldrh	w9, [x8, #72]
	ldrh	w8, [x8, #68]
	strb	w10, [x19]
	sub	w10, w11, w12
	strh	w1, [x19, #2]
	strh	w2, [x19, #4]
	sub	w8, w9, w8
	strh	w10, [x19, #6]
	strh	w8, [x19, #8]
	bl	_local_player_count
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	strh	w0, [x19, #10]
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB29_2:
	ret
	.loh AdrpAdd	Lloh162, Lloh163
	.loh AdrpLdrGot	Lloh161, Lloh164
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ; -- Begin function network_chat_draw
lCPI30_0:
	.long	0x3eae147b                      ; float 0.340000004
	.long	0x3f028f5c                      ; float 0.50999999
lCPI30_1:
	.long	0x3f23d70a                      ; float 0.639999986
	.long	0x3f400000                      ; float 0.75
lCPI30_2:
	.long	0x3f6e147b                      ; float 0.930000007
	.long	0x3f51eb85                      ; float 0.819999992
lCPI30_3:
	.long	0x3f5c28f6                      ; float 0.860000014
	.long	0x3ea3d70a                      ; float 0.319999993
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_network_chat_draw
	.p2align	4
_network_chat_draw:                     ; @network_chat_draw
; %bb.0:
	stp	d15, d14, [sp, #-160]!          ; 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             ; 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	sub	sp, sp, #640
	mov	w25, w0
	bl	_social_chat_replaces_upstream
	cbnz	w0, LBB30_162
; %bb.1:
	bl	_hud_get_font_index
	mov	w24, w0
	bl	_system_milliseconds
	adrp	x19, _chat_input@PAGE
	mov	w26, w0
	ldrb	w8, [x19, _chat_input@PAGEOFF]
	cbz	w8, LBB30_3
; %bb.2:
	adrp	x8, _chat_input@PAGE+4
	ldrsh	w0, [x8, _chat_input@PAGEOFF+4]
	bl	_controller_remap_local_player
	b	LBB30_4
LBB30_3:
	mov	w0, #-1                         ; =0xffffffff
	bl	_local_player_get_next
LBB30_4:
	mov	w22, wzr
	add	x28, sp, #272
	cmp	w25, w0
	b.ne	LBB30_7
; %bb.5:
	ldrb	w8, [x19, _chat_input@PAGEOFF]
	cbz	w8, LBB30_7
; %bb.6:
	bl	_console_is_active
	cmp	w0, #0
	cset	w22, eq
LBB30_7:
	bl	_halo_chat_touch_layout
Lloh165:
	adrp	x8, _render@GOTPAGE
	mov	w23, w0
Lloh166:
	ldr	w8, [x8, _render@GOTPAGEOFF]
	ldur	x8, [x8, #68]
	str	x8, [x28, #40]
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.hi	LBB30_162
; %bb.8:
	adrp	x20, _chat_shown.read_at@PAGE
	ldr	w21, [x20, _chat_shown.read_at@PAGEOFF]
	bl	_config_changes
	adrp	x19, _chat_shown.shown@PAGE
	cmp	w21, w0
	b.ne	LBB30_10
; %bb.9:
	ldrb	w8, [x19, _chat_shown.shown@PAGEOFF]
	cbnz	w8, LBB30_11
	b	LBB30_162
LBB30_10:
	bl	_config_changes
	str	w0, [x20, _chat_shown.read_at@PAGEOFF]
Lloh167:
	adrp	x0, l_.str.107@PAGE
Lloh168:
	add	x0, x0, l_.str.107@PAGEOFF
	bl	_config_boolean
	and	w8, w0, #0xff
	strb	w0, [x19, _chat_shown.shown@PAGEOFF]
	cbz	w8, LBB30_162
LBB30_11:
	bl	_ui_widgets_active
	cbnz	w0, LBB30_162
; %bb.12:
	bl	_cinematic_in_progress
	cbnz	w0, LBB30_162
; %bb.13:
Lloh169:
	adrp	x8, _hud_scripted_globals@GOTPAGE
Lloh170:
	ldr	w8, [x8, _hud_scripted_globals@GOTPAGEOFF]
Lloh171:
	ldr	w8, [x8]
	cbz	w8, LBB30_15
; %bb.14:
	ldrb	w8, [x8]
	cmp	w8, #0
	cset	w8, eq
LBB30_15:
	cmn	w24, #1
	csinc	w8, w8, wzr, ne
	cmp	w25, #3
	csinc	w8, w8, wzr, ls
	tbnz	w8, #0, LBB30_162
; %bb.16:
	adrp	x21, _chat_line_count@PAGE
	ldrh	w8, [x21, _chat_line_count@PAGEOFF]
	cmp	w8, #0
	cset	w8, ne
	orr	w8, w8, w22
	tbz	w8, #0, LBB30_162
; %bb.17:
Lloh172:
	adrp	x9, _render@GOTPAGE
	add	x0, sp, #312
Lloh173:
	ldr	w9, [x9, _render@GOTPAGEOFF]
	ldrh	w8, [x9, #62]
	ldrh	w9, [x9, #60]
	neg	w8, w8
	neg	w9, w9
	sxth	w1, w8
	sxth	w2, w9
	bl	_offset_rectangle2d
	ldrh	w8, [sp, #318]
	mov	w0, #28276                      ; =0x6e74
	ldrh	w9, [sp, #314]
	movk	w0, #26223, lsl #16
	mov	w1, w24
	sub	w19, w8, w9
	sxth	w20, w19
	bl	_tag_get
	ldrh	w8, [x0, #4]
	cmp	w20, #1
	ldrh	w9, [x0, #6]
	ldrh	w10, [x0, #8]
	add	w8, w9, w8
	add	w8, w8, w10
	sxth	w27, w8
	ccmp	w27, #1, #8, ge
	b.lt	LBB30_162
; %bb.18:
	fmov	s0, #1.00000000
	mov	w8, #12                         ; =0xc
	fmov	s1, #0.50000000
Lloh174:
	adrp	x9, _chat_motion_sensors@PAGE
Lloh175:
	add	x9, x9, _chat_motion_sensors@PAGEOFF
	cmp	w23, #0
	smaddl	x20, w25, w8, x9
	and	w19, w19, #0xffff
	str	w27, [sp, #120]                 ; 4-byte Spill
	str	w19, [sp, #96]                  ; 4-byte Spill
	fcsel	s8, s1, s0, eq
	ldrb	w8, [x20]
	cbz	w8, LBB30_23
; %bb.19:
	ldrh	w8, [x20, #6]
	cmp	w8, w19
	b.ne	LBB30_23
; %bb.20:
	ldrh	w8, [sp, #316]
	ldrh	w9, [sp, #312]
	ldrh	w10, [x20, #8]
	sub	w8, w8, w9
	cmp	w10, w8, uxth
	b.ne	LBB30_23
; %bb.21:
	mov	x27, x21
	ldrh	w21, [x20, #10]
	bl	_local_player_count
	cmp	w21, w0, uxth
	mov	x21, x27
	ldr	w27, [sp, #120]                 ; 4-byte Reload
	b.ne	LBB30_23
; %bb.22:
	ucvtf	s0, w27
	ldrsh	w8, [x20, #2]
	fmov	s1, #0.50000000
	ldrsh	w9, [x20, #4]
	ldrh	w20, [sp, #314]
	scvtf	s2, w8
	scvtf	s3, w9
	fmul	s0, s8, s0
	fmul	s1, s0, s1
	fadd	s0, s1, s2
	fsub	s10, s3, s1
	b	LBB30_24
LBB30_23:
	bl	_local_player_count
	cmp	w0, #1
	cset	w0, gt
	bl	_hud_globals_get_scale
	mov	w8, #-1025769472                ; =0xc2dc0000
	ldrh	w20, [sp, #314]
	fmov	s1, #24.00000000
	ldrsh	w9, [sp, #316]
	fmov	s2, w8
	sxth	w8, w20
	scvtf	s4, w9
	scvtf	s3, w8
	fmul	s1, s0, s1
	fmul	s2, s0, s2
	fadd	s0, s1, s3
	fadd	s10, s4, s2
LBB30_24:
	fcvtzs	w19, s0
	bl	_local_player_count
	cbz	w23, LBB30_26
; %bb.25:
	ldrsh	w8, [sp, #312]
	scvtf	s9, w8
	bl	_local_player_count
	cmp	w0, #1
	cset	w0, gt
	bl	_hud_globals_get_scale
	mov	w8, #1114636288                 ; =0x42700000
	fmov	s1, w8
	ldrh	w8, [sp, #318]
	sub	w9, w8, w27
	mov	w27, #4                         ; =0x4
	fmul	s0, s0, s1
	fadd	s10, s0, s9
	b	LBB30_27
LBB30_26:
	ldr	w9, [sp, #96]                   ; 4-byte Reload
	mov	w8, #55                         ; =0x37
	cmp	w0, #1
	mov	w10, #3                         ; =0x3
	mul	w8, w9, w8
	mov	w9, #23593                      ; =0x5c29
	movk	w9, #655, lsl #16
	umull	x8, w8, w9
	mov	w9, #6                          ; =0x6
	csel	w11, w10, w9, gt
	sxth	w9, w20
	add	w10, w19, w27, lsl #3
	mov	w27, w11
	add	x9, x9, x8, lsr #32
	ldrh	w8, [sp, #318]
	cmp	w9, w10
	csel	w9, w9, w10, gt
LBB30_27:
	sxth	w8, w8
	sxth	w9, w9
	cmp	w9, w8
	scvtf	s9, w19
	csel	w8, w9, w8, lt
	mov	w20, w19
	sub	w8, w8, w19
	scvtf	s0, w8
	fcvtzs	w8, s10
	fmov	s1, s9
	fdiv	s0, s0, s8
	scvtf	s10, w8
	fmov	s2, s10
	fadd	s0, s0, s9
	fcvtzs	w9, s0
	fmov	s0, s8
	stp	w9, w8, [sp, #80]               ; 8-byte Folded Spill
	bl	_rasterizer_text_set_scale
	adrp	x13, lCPI30_0@PAGE
	adrp	x12, lCPI30_1@PAGE
	str	w23, [sp, #44]                  ; 4-byte Spill
	str	w19, [sp, #76]                  ; 4-byte Spill
	cbz	w22, LBB30_84
; %bb.28:
Lloh176:
	adrp	x8, _chat_input@PAGE+2
Lloh177:
	add	x8, x8, _chat_input@PAGEOFF+2
Lloh178:
	adrp	x11, l_.str.10@PAGE
Lloh179:
	add	x11, x11, l_.str.10@PAGEOFF
Lloh180:
	adrp	x12, l_.str.9@PAGE
Lloh181:
	add	x12, x12, l_.str.9@PAGEOFF
	ldrh	w9, [x8]
Lloh182:
	adrp	x13, l_.str.8@PAGE
Lloh183:
	add	x13, x13, l_.str.8@PAGEOFF
	ldrb	w10, [x8, #11]
	str	w27, [sp, #36]                  ; 4-byte Spill
	cmp	w9, #2
	csel	x8, x12, x11, eq
	cmp	w9, #1
	csel	x21, x13, x8, eq
	cbz	w10, LBB30_32
; %bb.29:
	mov	w9, wzr
	add	x8, sp, #124
Lloh184:
	adrp	x11, _chat_input@PAGE
Lloh185:
	add	x11, x11, _chat_input@PAGEOFF
LBB30_30:                               ; =>This Inner Loop Header: Depth=1
	and	w10, w10, #0xff
	add	w12, w8, w9, lsl #1
	add	w27, w9, #1
	cmp	w9, #61
	strh	w10, [x12]
	b.hi	LBB30_33
; %bb.31:                               ;   in Loop: Header=BB30_30 Depth=1
	add	w9, w11, w9
	add	w9, w9, #14
	ldrb	w10, [x9]
	mov	w9, w27
	cbnz	w10, LBB30_30
	b	LBB30_33
LBB30_32:
	mov	w27, wzr
LBB30_33:
	mov	w8, #19923                      ; =0x4dd3
	mov	w9, #32                         ; =0x20
	movk	w8, #4194, lsl #16
	mov	w10, #95                        ; =0x5f
	str	w22, [sp, #40]                  ; 4-byte Spill
	add	x22, sp, #124
	umull	x8, w26, w8
	add	w11, w27, #1
	mov	w19, #1065353216                ; =0x3f800000
	lsr	x8, x8, #37
	tst	w8, #0x1
	csel	w8, w10, w9, eq
	add	w9, w27, #1
	strh	wzr, [x22, w11, sxtw #1]
	str	w19, [sp, #272]
	str	w9, [sp, #64]                   ; 4-byte Spill
	strh	w8, [x22, w27, sxtw #1]
	bl	_chat_style_white
	cmp	w0, #0
Lloh186:
	adrp	x9, lCPI30_0@PAGE
	cset	w8, eq
	fmov	s12, #1.00000000
	fmov	v13.2s, #1.00000000
	str	w19, [sp, #288]
Lloh187:
	ldr	d1, [x9, lCPI30_0@PAGEOFF]
	dup	v0.2s, w8
	mov	w8, #10486                      ; =0x28f6
	movk	w8, #16220, lsl #16
	fmov	s2, w8
	shl	v0.2s, v0.2s, #31
	fcsel	s2, s2, s12, eq
	cmlt	v0.2s, v0.2s, #0
	str	s2, [sp, #284]
	bsl	v0.8b, v1.8b, v13.8b
	stur	d0, [x28, #4]
	bl	_chat_style_white
	cmp	w0, #0
Lloh188:
	adrp	x9, lCPI30_1@PAGE
	cset	w8, eq
	add	x4, sp, #272
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
Lloh189:
	ldr	d11, [x9, lCPI30_1@PAGEOFF]
	mov	w2, wzr
	dup	v0.2s, w8
	mov	w8, #47186                      ; =0xb852
	movk	w8, #16222, lsl #16
	mov	w3, wzr
	fmov	s1, w8
	shl	v0.2s, v0.2s, #31
	fcsel	s1, s1, s12, eq
	cmlt	v0.2s, v0.2s, #0
	str	s1, [sp, #300]
	bsl	v0.8b, v11.8b, v13.8b
	stur	d0, [x28, #20]
	bl	_draw_string_set_draw_mode
	bl	_text_filter_suspend
	ldr	w2, [sp, #120]                  ; 4-byte Reload
	add	x4, sp, #124
	add	x5, sp, #256
	mov	w0, w20
	mov	w1, #32767                      ; =0x7fff
	mov	x3, x21
	str	x21, [sp, #88]                  ; 8-byte Spill
	bl	_chat_line_layout
	ldrh	w8, [sp, #270]
	mov	x9, #140733193388032            ; =0x7fff00000000
	movk	x9, #32767, lsl #48
	sub	x10, x29, #200
	mov	w19, wzr
	tst	w27, #0xffff
	str	x9, [x10, #24]
	b.eq	LBB30_49
; %bb.34:
	ldr	w10, [sp, #80]                  ; 4-byte Reload
	add	x9, sp, #320
	mov	w9, w9
	add	x20, sp, #320
	add	w21, w22, #8
	sub	w8, w10, w8
	add	x10, sp, #124
	sxth	w22, w8
	str	x9, [sp, #96]                   ; 8-byte Spill
	b	LBB30_38
LBB30_35:                               ;   in Loop: Header=BB30_38 Depth=1
	add	w8, w8, #1
LBB30_36:                               ;   in Loop: Header=BB30_38 Depth=1
	ldr	x1, [sp, #96]                   ; 8-byte Reload
	sub	x0, x29, #176
	sub	x2, x29, #200
	sub	x3, x29, #168
	strh	wzr, [x20, w8, sxtw #1]
	bl	_draw_unicode_string_compute_bounds
	ldurh	w8, [x29, #-166]
	add	x10, sp, #124
	ldurh	w9, [x29, #-174]
	sub	w8, w8, w9
LBB30_37:                               ;   in Loop: Header=BB30_38 Depth=1
	sxth	w8, w8
	cmp	w8, w22
	csinc	w8, w19, w23, le
	csel	w9, w27, w23, gt
	sxth	w19, w8
	sxth	w27, w9
	cmp	w19, w27
	b.ge	LBB30_49
LBB30_38:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB30_40 Depth 2
	sxth	w8, w27
	add	w8, w8, w19, sxth
	add	w8, w8, w8, lsr #31
	asr	w23, w8, #1
	ldrh	w11, [x10, w23, sxtw #1]
	cbz	w11, LBB30_45
; %bb.39:                               ;   in Loop: Header=BB30_38 Depth=1
	mov	w8, wzr
	add	w9, w21, w23, lsl #1
	add	w10, w20, #6
LBB30_40:                               ;   Parent Loop BB30_38 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	w12, w9, #6
	sub	w13, w10, #6
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB30_35
; %bb.41:                               ;   in Loop: Header=BB30_40 Depth=2
	sub	w11, w9, #4
	sub	w13, w10, #4
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB30_46
; %bb.42:                               ;   in Loop: Header=BB30_40 Depth=2
	sub	w12, w9, #2
	sub	w13, w10, #2
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB30_47
; %bb.43:                               ;   in Loop: Header=BB30_40 Depth=2
	cmp	w8, #124
	b.eq	LBB30_48
; %bb.44:                               ;   in Loop: Header=BB30_40 Depth=2
	ldrh	w11, [x9]
	add	w8, w8, #4
	strh	w12, [x10]
	add	w10, w10, #8
	add	w9, w9, #8
	cbnz	w11, LBB30_40
	b	LBB30_36
LBB30_45:                               ;   in Loop: Header=BB30_38 Depth=1
	mov	w8, wzr
	b	LBB30_37
LBB30_46:                               ;   in Loop: Header=BB30_38 Depth=1
	add	w8, w8, #2
	b	LBB30_36
LBB30_47:                               ;   in Loop: Header=BB30_38 Depth=1
	add	w8, w8, #3
	b	LBB30_36
LBB30_48:                               ;   in Loop: Header=BB30_38 Depth=1
	mov	w8, #127                        ; =0x7f
	b	LBB30_36
LBB30_49:
	ldr	w10, [sp, #44]                  ; 4-byte Reload
	mov	w8, #1                          ; =0x1
	ldr	w9, [sp, #64]                   ; 4-byte Reload
	fmov	s0, #1.00000000
	ldr	w20, [sp, #120]                 ; 4-byte Reload
	add	x1, sp, #256
	ldp	w3, w23, [sp, #80]              ; 8-byte Folded Reload
	cmp	w10, #0
	add	x7, sp, #272
	sub	w9, w9, w19
	ldr	w2, [sp, #76]                   ; 4-byte Reload
	csel	w10, w20, wzr, eq
	ldr	x6, [sp, #88]                   ; 8-byte Reload
	strh	w8, [sp, #256]
	add	x8, sp, #124
	strh	w9, [sp, #264]
	add	x9, sp, #288
	str	w10, [sp, #28]                  ; 4-byte Spill
	sub	w10, w23, w10
	mov	w0, w24
	mov	w5, w20
	sxth	w4, w10
	cneg	w27, w20, eq
	strh	w19, [sp, #258]
	stp	w8, w9, [sp]
	bl	_chat_draw_layout
	bl	_text_filter_resume
	adrp	x8, _chat_keyboard.0@PAGE
	ldr	w22, [sp, #40]                  ; 4-byte Reload
	adrp	x21, _chat_line_count@PAGE
	ldrb	w8, [x8, _chat_keyboard.0@PAGEOFF]
	cbz	w8, LBB30_80
; %bb.50:
	adrp	x8, _chat_keyboard.1@PAGE
	ldrb	w8, [x8, _chat_keyboard.1@PAGEOFF]
	cbnz	w8, LBB30_80
; %bb.51:
	fmov	s0, #1.00000000
	movi	d1, #0000000000000000
	movi	d2, #0000000000000000
	bl	_rasterizer_text_set_scale
	bl	_halo_chat_touch_layout
	ldrh	w8, [sp, #318]
	mov	w10, #36                        ; =0x24
	ldrh	w9, [sp, #314]
	mov	w11, #40                        ; =0x28
	cmp	w0, #0
	csel	w10, w11, w10, eq
	sub	w8, w8, w9
	mov	w9, #19923                      ; =0x4dd3
	sxth	w19, w8
	movk	w9, #4194, lsl #16
	mul	w8, w10, w19
	smull	x9, w8, w9
	asr	x10, x9, #38
	add	x9, x10, x9, lsr #63
	str	x9, [sp, #64]                   ; 8-byte Spill
	add	w9, w9, w9, lsl #1
	sxth	w10, w9
	ubfx	w10, w10, #29, #2
	add	w9, w9, w10
	add	w10, w20, #4
	sbfx	w9, w9, #2, #14
	cmp	w9, w10
	csel	w9, w9, w10, gt
	str	w9, [sp, #60]                   ; 4-byte Spill
	mov	w9, #5000                       ; =0x1388
	cmp	w8, w9
	b.lt	LBB30_79
; %bb.52:
	cmp	w19, #1
	b.lt	LBB30_79
; %bb.53:
	ldrh	w8, [sp, #316]
	ldrh	w9, [sp, #312]
	sub	w8, w8, w9
	sxth	w8, w8
	cmp	w8, #1
	b.lt	LBB30_79
; %bb.54:
	bl	_halo_chat_touch_layout
	mov	w23, w24
	str	w26, [sp, #24]                  ; 4-byte Spill
	str	w27, [sp, #32]                  ; 4-byte Spill
	cbz	w0, LBB30_56
; %bb.55:
	ldrsh	w8, [sp, #314]
	mov	w10, #-10                       ; =0xfffffff6
	ldr	x21, [sp, #64]                  ; 8-byte Reload
	ldrsh	w9, [sp, #318]
	madd	w8, w21, w10, w8
	add	w8, w8, w9
	add	w8, w8, w8, lsr #31
	asr	w11, w8, #1
	b	LBB30_57
LBB30_56:
	and	w8, w19, #0xffff
	mov	w9, #18351                      ; =0x47af
	ldr	x21, [sp, #64]                  ; 8-byte Reload
	mov	w10, #65526                     ; =0xfff6
	mul	w8, w8, w9
	ldrh	w11, [sp, #318]
	lsr	w8, w8, #16
	sub	w9, w19, w8
	and	w9, w9, #0xfffe
	add	w8, w8, w9, lsr #1
	mul	w9, w21, w10
	sub	w8, w9, w8, lsr #4
	add	w11, w8, w11
LBB30_57:
	ldrh	w8, [sp, #316]
	mov	w9, #10                         ; =0xa
	ldr	w10, [sp, #60]                  ; 4-byte Reload
	sub	x0, x29, #168
	madd	w12, w21, w9, w11
	sub	w9, w11, #4
	str	w11, [sp, #56]                  ; 4-byte Spill
	mov	w1, #-1610612736                ; =0xa0000000
	sub	w11, w8, w20
	add	w8, w12, #4
	add	w10, w10, w10, lsl #2
	sturh	w9, [x29, #-166]
	sub	w19, w11, w10
	add	w9, w11, #4
	sub	w10, w19, #4
	stp	w12, w11, [sp, #16]             ; 8-byte Folded Spill
	sturh	w8, [x29, #-162]
	sturh	w9, [x29, #-164]
	sturh	w10, [x29, #-168]
	bl	_draw_quad
	add	w9, w19, #2
	sub	w8, w19, #2
	mov	w27, wzr
	adrp	x26, _chat_keyboard.5@PAGE
	str	w19, [sp, #12]                  ; 4-byte Spill
	stp	w8, w9, [sp, #48]               ; 8-byte Folded Spill
Lloh190:
	adrp	x8, l___const.chat_keyboard_draw.color@PAGE
Lloh191:
	add	x8, x8, l___const.chat_keyboard_draw.color@PAGEOFF
Lloh192:
	ldr	q0, [x8]
	str	q0, [sp, #96]                   ; 16-byte Spill
	b	LBB30_59
LBB30_58:                               ;   in Loop: Header=BB30_59 Depth=1
	ldr	w8, [sp, #88]                   ; 4-byte Reload
	ldr	x21, [sp, #64]                  ; 8-byte Reload
	mov	w27, w8
	cmp	w8, #5
	b.eq	LBB30_77
LBB30_59:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB30_63 Depth 2
	add	w10, w27, #1
	cmp	w27, #4
	ldp	w22, w9, [sp, #56]              ; 8-byte Folded Reload
	mov	w8, #1                          ; =0x1
	add	w11, w27, #1
	str	w10, [sp, #88]                  ; 4-byte Spill
	cinc	w28, w8, eq
	ldr	w10, [sp, #52]                  ; 4-byte Reload
	mov	w19, wzr
	mul	w8, w27, w9
	mul	w9, w11, w9
	mul	w21, w21, w28
	add	w20, w10, w8
	ldr	w8, [sp, #48]                   ; 4-byte Reload
	add	w24, w8, w9
	b	LBB30_63
LBB30_60:                               ;   in Loop: Header=BB30_63 Depth=2
	adrp	x8, _chat_keyboard.6@PAGE
Lloh193:
	adrp	x9, _chat_keyboard_letters@PAGE
Lloh194:
	add	x9, x9, _chat_keyboard_letters@PAGEOFF
	ldrb	w8, [x8, _chat_keyboard.6@PAGEOFF]
	cmp	w8, #0
Lloh195:
	adrp	x8, _chat_keyboard_symbols@PAGE
Lloh196:
	add	x8, x8, _chat_keyboard_symbols@PAGEOFF
	csel	x8, x9, x8, eq
	ldrb	w9, [x26, _chat_keyboard.5@PAGEOFF]
	ldr	w8, [x8, w27, sxtw #2]
	add	w8, w8, w19
	ldrb	w8, [x8]
	sub	w10, w8, #97
	and	w10, w10, #0xff
	cmp	w10, #26
	ccmp	w9, #0, #4, lo
	sub	w9, w8, #32
	csel	w8, w9, w8, ne
LBB30_61:                               ;   in Loop: Header=BB30_63 Depth=2
	and	w8, w8, #0xff
	sturh	w8, [x29, #-200]
LBB30_62:                               ;   in Loop: Header=BB30_63 Depth=2
	sub	x12, x29, #200
	ldr	w11, [sp, #120]                 ; 4-byte Reload
	add	x4, sp, #320
	mov	w0, w23
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, #2                          ; =0x2
	ldr	x8, [x12, #24]
	mov	w3, wzr
	add	w19, w19, w28
	add	w9, w11, w8, sxth
	sbfx	x10, x8, #32, #16
	sub	w9, w10, w9
	str	x8, [x12, #16]
	add	w9, w9, w9, lsr #31
	add	w9, w8, w9, asr #1
	add	w10, w9, w11
	sturh	w9, [x29, #-184]
	sturh	w10, [x29, #-180]
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #184
	sub	x4, x29, #200
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	add	w22, w22, w21
	cmp	w19, #10
	b.hs	LBB30_58
LBB30_63:                               ;   Parent Loop BB30_59 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w8, [x26, _chat_keyboard.5@PAGEOFF]
	adrp	x9, _chat_keyboard.3@PAGE
	mov	w11, #14408                     ; =0x3848
	mov	w12, #24720                     ; =0x6090
	movk	w11, #36904, lsl #16
	movk	w12, #49216, lsl #16
	ldrh	w9, [x9, _chat_keyboard.3@PAGEOFF]
	add	w10, w21, w22
	cmp	w8, #0
	adrp	x8, _chat_keyboard.4@PAGE
	ccmp	w19, #2, #2, ne
	ldr	q0, [sp, #96]                   ; 16-byte Reload
	sub	w10, w10, #2
	sub	x0, x29, #176
	ldrh	w8, [x8, _chat_keyboard.4@PAGEOFF]
	ccmp	w27, #4, #0, lo
	sturh	w20, [x29, #-176]
	sturh	w10, [x29, #-170]
	sturh	w24, [x29, #-172]
	csel	w11, w12, w11, eq
	cmp	w8, w19, uxth
	add	w8, w22, #2
	ccmp	w27, w9, #0, eq
	add	x12, sp, #272
	sturh	w8, [x29, #-174]
	mov	w8, #33500                      ; =0x82dc
	movk	w8, #61526, lsl #16
	str	q0, [x12, #48]
	csel	w1, w8, w11, eq
	stp	xzr, xzr, [x12, #312]
	bl	_draw_quad
	cmp	w27, #4
	b.ne	LBB30_75
; %bb.64:                               ;   in Loop: Header=BB30_63 Depth=2
	lsr	w9, w19, #1
	cmp	w9, #1
	b.ne	LBB30_66
; %bb.65:                               ;   in Loop: Header=BB30_63 Depth=2
Lloh197:
	adrp	x8, _chat_keyboard.6@PAGE
	ldrb	w10, [x8, _chat_keyboard.6@PAGEOFF]
Lloh198:
	adrp	x8, l_.str.136@PAGE
Lloh199:
	add	x8, x8, l_.str.136@PAGEOFF
	cbnz	w10, LBB30_67
LBB30_66:                               ;   in Loop: Header=BB30_63 Depth=2
Lloh200:
	adrp	x8, _chat_keyboard_draw.wide@PAGE
Lloh201:
	add	x8, x8, _chat_keyboard_draw.wide@PAGEOFF
	ldr	w8, [x8, w9, uxtw #2]
LBB30_67:                               ;   in Loop: Header=BB30_63 Depth=2
	ldrh	w10, [x8]
	cbz	w10, LBB30_62
; %bb.68:                               ;   in Loop: Header=BB30_63 Depth=2
	ldrh	w9, [x8, #2]
	sturh	w10, [x29, #-200]
	cbz	w9, LBB30_62
; %bb.69:                               ;   in Loop: Header=BB30_63 Depth=2
	ldrh	w10, [x8, #4]
	sturh	w9, [x29, #-198]
	cbz	w10, LBB30_62
; %bb.70:                               ;   in Loop: Header=BB30_63 Depth=2
	ldrh	w9, [x8, #6]
	sturh	w10, [x29, #-196]
	cbz	w9, LBB30_62
; %bb.71:                               ;   in Loop: Header=BB30_63 Depth=2
	ldrh	w10, [x8, #8]
	sturh	w9, [x29, #-194]
	cbz	w10, LBB30_62
; %bb.72:                               ;   in Loop: Header=BB30_63 Depth=2
	ldrh	w9, [x8, #10]
	sturh	w10, [x29, #-192]
	cbz	w9, LBB30_62
; %bb.73:                               ;   in Loop: Header=BB30_63 Depth=2
	ldrh	w8, [x8, #12]
	sturh	w9, [x29, #-190]
	cbz	w8, LBB30_62
; %bb.74:                               ;   in Loop: Header=BB30_63 Depth=2
	sturh	w8, [x29, #-188]
	b	LBB30_62
LBB30_75:                               ;   in Loop: Header=BB30_63 Depth=2
	cmp	w27, #3
	b.ls	LBB30_60
; %bb.76:                               ;   in Loop: Header=BB30_63 Depth=2
	mov	w8, wzr
	b	LBB30_61
LBB30_77:
Lloh202:
	adrp	x11, _render@GOTPAGE
	mov	w24, w23
	add	x28, sp, #272
	adrp	x21, _chat_line_count@PAGE
Lloh203:
	ldr	w11, [x11, _render@GOTPAGEOFF]
	ldr	w26, [sp, #24]                  ; 4-byte Reload
	ldr	w22, [sp, #40]                  ; 4-byte Reload
	ldr	w23, [sp, #84]                  ; 4-byte Reload
	ldrh	w8, [x11, #66]
	ldrh	w9, [x11, #62]
	ldrh	w10, [x11, #64]
	ldrh	w11, [x11, #60]
	ldr	w27, [sp, #32]                  ; 4-byte Reload
	sub	w9, w8, w9
	sxth	w9, w9
	sub	w8, w10, w11
	sxth	w8, w8
	cmp	w8, #1
	ccmp	w9, #1, #8, ge
	b.lt	LBB30_79
; %bb.78:
	adrp	x10, _chat_keyboard.9@PAGE
	mov	w11, #1                         ; =0x1
	mov	w12, #1000                      ; =0x3e8
	ldr	w14, [sp, #20]                  ; 4-byte Reload
	adrp	x15, _chat_keyboard.11@PAGE
	strb	w11, [x10, _chat_keyboard.9@PAGEOFF]
	ldr	w10, [sp, #56]                  ; 4-byte Reload
	ldp	w13, w11, [sp, #12]             ; 8-byte Folded Reload
	sxth	w14, w14
	sxth	w10, w10
	mul	w10, w10, w12
	sxth	w11, w11
	sxth	w13, w13
	mul	w11, w11, w12
	mul	w13, w13, w12
	sdiv	w10, w10, w9
	mul	w12, w14, w12
	adrp	x14, _chat_keyboard.10@PAGE
	sdiv	w9, w11, w9
	sdiv	w13, w13, w8
	adrp	x11, _chat_keyboard.12@PAGE
	sdiv	w8, w12, w8
	strh	w10, [x14, _chat_keyboard.10@PAGEOFF]
	adrp	x10, _chat_keyboard.13@PAGE
	strh	w9, [x11, _chat_keyboard.12@PAGEOFF]
	strh	w13, [x15, _chat_keyboard.11@PAGEOFF]
	strh	w8, [x10, _chat_keyboard.13@PAGEOFF]
LBB30_79:
	fmov	s0, s8
	fmov	s1, s9
	fmov	s2, s10
	bl	_rasterizer_text_set_scale
LBB30_80:
	adrp	x8, _chat_scroll@PAGE
	add	w19, w27, w23
	ldrsh	w8, [x8, _chat_scroll@PAGEOFF]
	cmp	w8, #1
	b.lt	LBB30_82
; %bb.81:
	mov	w8, #39322                      ; =0x999a
	strh	wzr, [sp, #320]
	movk	w8, #16153, lsl #16
	str	w8, [sp, #288]
	bl	_chat_style_white
	cmp	w0, #0
	fmov	v0.2s, #1.00000000
	cset	w8, eq
	fmov	s2, #1.00000000
	add	x4, sp, #288
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	dup	v1.2s, w8
	mov	w8, #47186                      ; =0xb852
	movk	w8, #16222, lsl #16
	mov	w3, wzr
	fmov	s3, w8
	shl	v1.2s, v1.2s, #31
	cmlt	v1.2s, v1.2s, #0
	bit	v0.8b, v11.8b, v1.8b
	fcsel	s1, s3, s2, eq
	stur	d0, [x28, #20]
	str	s1, [sp, #300]
	bl	_draw_string_set_draw_mode
	ldr	w20, [sp, #76]                  ; 4-byte Reload
Lloh204:
	adrp	x4, l_.str.11@PAGE
Lloh205:
	add	x4, x4, l_.str.11@PAGEOFF
	str	w27, [sp, #32]                  ; 4-byte Spill
	ldr	w27, [sp, #80]                  ; 4-byte Reload
	add	x3, sp, #320
	ldr	w23, [sp, #120]                 ; 4-byte Reload
	add	x5, sp, #256
	mov	w0, w20
	mov	w1, w27
	mov	w2, w23
	bl	_chat_line_layout
	mov	w8, #1                          ; =0x1
	ldr	w9, [sp, #28]                   ; 4-byte Reload
	add	x1, sp, #256
	add	x6, sp, #320
	add	x7, sp, #288
	mov	w0, w24
	strh	w8, [sp, #256]
	mov	w8, #39322                      ; =0x999a
	movk	w8, #16153, lsl #16
	sub	w9, w19, w9
	mov	w2, w20
	mov	w3, w27
	mov	w5, w23
	sxth	w4, w9
	fmov	s0, w8
	add	x8, sp, #288
	str	w8, [sp, #4]
Lloh206:
	adrp	x8, l_.str.11@PAGE
Lloh207:
	add	x8, x8, l_.str.11@PAGEOFF
	str	w8, [sp]
	bl	_chat_draw_layout
	ldp	w8, w27, [sp, #32]              ; 8-byte Folded Reload
	add	w19, w19, w8
	sub	w27, w27, #2
	str	w19, [sp, #84]                  ; 4-byte Spill
	b	LBB30_83
LBB30_82:
	ldr	w27, [sp, #36]                  ; 4-byte Reload
	str	w19, [sp, #84]                  ; 4-byte Spill
	sub	w27, w27, #1
LBB30_83:
	adrp	x12, lCPI30_1@PAGE
	adrp	x13, lCPI30_0@PAGE
LBB30_84:
	ldrsh	w8, [x21, _chat_line_count@PAGEOFF]
	cmp	w8, #1
	b.lt	LBB30_161
; %bb.85:
Lloh208:
	adrp	x10, lCPI30_2@PAGE
Lloh209:
	adrp	x15, _chat_newest_line@PAGE
Lloh210:
	adrp	x11, lCPI30_3@PAGE
	fmov	v12.2s, #1.00000000
	fmov	s13, #1.00000000
	mov	w9, #1                          ; =0x1
Lloh211:
	ldr	d9, [x10, lCPI30_2@PAGEOFF]
	mov	w10, #-998637568                ; =0xc47a0000
	lsl	w16, w9, w25
	ldrh	w9, [x15, _chat_newest_line@PAGEOFF]
Lloh212:
	ldr	d10, [x11, lCPI30_3@PAGEOFF]
	mov	w23, wzr
	fmov	s15, w10
	ldr	d11, [x13, lCPI30_0@PAGEOFF]
	ldr	d14, [x12, lCPI30_1@PAGEOFF]
	mov	w14, wzr
Lloh213:
	adrp	x15, _chat_lines@PAGE
Lloh214:
	add	x15, x15, _chat_lines@PAGEOFF
	mov	w17, #100                       ; =0x64
	str	w16, [sp, #88]                  ; 4-byte Spill
LBB30_86:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB30_103 Depth 2
                                        ;     Child Loop BB30_135 Depth 2
                                        ;     Child Loop BB30_145 Depth 2
                                        ;     Child Loop BB30_152 Depth 2
	sxth	w10, w9
	sub	w10, w10, w23
	add	w10, w10, #64
	negs	w11, w10
	and	w10, w10, #0x3f
	and	w11, w11, #0x3f
	csneg	w20, w10, w11, mi
	smaddl	x19, w20, w17, x15
	ldr	w10, [x19, #96]
	sub	w10, w26, w10
	lsr	w11, w10, #4
	cmp	w11, #624
	cset	w11, hi
	bic	w11, w11, w22
	tbnz	w11, #0, LBB30_88
; %bb.87:                               ;   in Loop: Header=BB30_86 Depth=1
	fmov	s8, #1.00000000
	b	LBB30_90
LBB30_88:                               ;   in Loop: Header=BB30_86 Depth=1
	lsr	w11, w10, #3
	cmp	w11, #1375
	b.hs	LBB30_161
; %bb.89:                               ;   in Loop: Header=BB30_86 Depth=1
	mov	w11, #-10000                    ; =0xffffd8f0
	add	w10, w10, w11
	ucvtf	s0, w10
	fdiv	s0, s0, s15
	fadd	s8, s0, s13
	fcmp	s8, #0.0
	b.ls	LBB30_161
LBB30_90:                               ;   in Loop: Header=BB30_86 Depth=1
	ldrsh	w10, [x19, #92]
	tst	w16, w10
	b.eq	LBB30_158
; %bb.91:                               ;   in Loop: Header=BB30_86 Depth=1
	adrp	x10, _chat_scroll@PAGE
	ldrsh	w10, [x10, _chat_scroll@PAGEOFF]
	cmp	w10, w14, sxth
	csel	w10, wzr, w22, le
	cbz	w10, LBB30_93
; %bb.92:                               ;   in Loop: Header=BB30_86 Depth=1
	add	w14, w14, #1
	b	LBB30_158
LBB30_93:                               ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w21, [x19, #88]
	mov	w25, #100                       ; =0x64
	str	w14, [sp, #96]                  ; 4-byte Spill
	stur	s8, [x29, #-200]
	bl	_chat_style_white
	cbz	w0, LBB30_95
; %bb.94:                               ;   in Loop: Header=BB30_86 Depth=1
	mov	w8, #1065353216                 ; =0x3f800000
	stur	w8, [x29, #-188]
	sub	x8, x29, #200
	stur	d12, [x8, #4]
	b	LBB30_101
LBB30_95:                               ;   in Loop: Header=BB30_86 Depth=1
	sub	x8, x29, #200
	cmp	w21, #2
	b.eq	LBB30_98
; %bb.96:                               ;   in Loop: Header=BB30_86 Depth=1
	cbnz	w21, LBB30_99
; %bb.97:                               ;   in Loop: Header=BB30_86 Depth=1
	stur	d10, [x8, #4]
	mov	w8, #23593                      ; =0x5c29
	movk	w8, #16015, lsl #16
	b	LBB30_100
LBB30_98:                               ;   in Loop: Header=BB30_86 Depth=1
	stur	d9, [x8, #4]
	mov	w8, #26214                      ; =0x6666
	movk	w8, #16102, lsl #16
	b	LBB30_100
LBB30_99:                               ;   in Loop: Header=BB30_86 Depth=1
	stur	d11, [x8, #4]
	mov	w8, #10486                      ; =0x28f6
	movk	w8, #16220, lsl #16
LBB30_100:                              ;   in Loop: Header=BB30_86 Depth=1
	stur	w8, [x29, #-188]
LBB30_101:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrb	w11, [x19, #24]
	cbz	w11, LBB30_105
; %bb.102:                              ;   in Loop: Header=BB30_86 Depth=1
Lloh215:
	adrp	x9, _chat_lines@PAGE
Lloh216:
	add	x9, x9, _chat_lines@PAGEOFF
	madd	w9, w20, w25, w9
	ldr	w21, [sp, #76]                  ; 4-byte Reload
	mov	w8, wzr
	add	x25, sp, #124
	add	w9, w9, #25
LBB30_103:                              ;   Parent Loop BB30_86 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	w11, w11, #0xff
	add	w12, w25, w8, lsl #1
	add	w10, w8, #1
	cmp	w8, #61
	strh	w11, [x12]
	b.hi	LBB30_106
; %bb.104:                              ;   in Loop: Header=BB30_103 Depth=2
	add	w8, w9, w8
	ldrb	w11, [x8]
	mov	w8, w10
	cbnz	w11, LBB30_103
	b	LBB30_106
LBB30_105:                              ;   in Loop: Header=BB30_86 Depth=1
	ldr	w21, [sp, #76]                  ; 4-byte Reload
	mov	w10, wzr
	add	x25, sp, #124
LBB30_106:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w8, [x19, #88]
	strh	wzr, [x25, w10, sxtw #1]
	cmp	w8, #2
	b.ne	LBB30_108
; %bb.107:                              ;   in Loop: Header=BB30_86 Depth=1
	sub	x8, x29, #200
	strh	wzr, [sp, #320]
	add	x19, sp, #320
	ldr	q0, [x8]
	str	q0, [x28, #16]
	b	LBB30_142
LBB30_108:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w8, [x19, #90]
Lloh217:
	adrp	x10, l_.str.139@PAGE
Lloh218:
	add	x10, x10, l_.str.139@PAGEOFF
Lloh219:
	adrp	x11, l_.str.138@PAGE
Lloh220:
	add	x11, x11, l_.str.138@PAGEOFF
	ldrh	w9, [x19]
	cmp	w8, #2
	csel	x10, x11, x10, eq
	cmp	w8, #1
Lloh221:
	adrp	x8, l_.str.137@PAGE
Lloh222:
	add	x8, x8, l_.str.137@PAGEOFF
	csel	x8, x8, x10, eq
	cbz	w9, LBB30_133
; %bb.109:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w10, [x19, #2]
	strh	w9, [sp, #320]
	cbz	w10, LBB30_121
; %bb.110:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w9, [x19, #4]
	strh	w10, [sp, #322]
	cbz	w9, LBB30_122
; %bb.111:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w10, [x19, #6]
	strh	w9, [sp, #324]
	cbz	w10, LBB30_123
; %bb.112:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w9, [x19, #8]
	strh	w10, [sp, #326]
	cbz	w9, LBB30_124
; %bb.113:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w10, [x19, #10]
	strh	w9, [sp, #328]
	cbz	w10, LBB30_125
; %bb.114:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w9, [x19, #12]
	strh	w10, [sp, #330]
	cbz	w9, LBB30_126
; %bb.115:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w10, [x19, #14]
	strh	w9, [sp, #332]
	cbz	w10, LBB30_127
; %bb.116:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w9, [x19, #16]
	strh	w10, [sp, #334]
	cbz	w9, LBB30_128
; %bb.117:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w10, [x19, #18]
	strh	w9, [sp, #336]
	cbz	w10, LBB30_129
; %bb.118:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w9, [x19, #20]
	strh	w10, [sp, #338]
	cbz	w9, LBB30_130
; %bb.119:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w10, [x19, #22]
	strh	w9, [sp, #340]
	cbz	w10, LBB30_131
; %bb.120:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #12                         ; =0xc
	strh	w10, [sp, #342]
	b	LBB30_132
LBB30_121:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #1                          ; =0x1
	b	LBB30_133
LBB30_122:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #2                          ; =0x2
	b	LBB30_133
LBB30_123:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #3                          ; =0x3
	b	LBB30_133
LBB30_124:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #4                          ; =0x4
	b	LBB30_133
LBB30_125:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #5                          ; =0x5
	b	LBB30_133
LBB30_126:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #6                          ; =0x6
	b	LBB30_133
LBB30_127:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #7                          ; =0x7
	b	LBB30_133
LBB30_128:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #8                          ; =0x8
	b	LBB30_132
LBB30_129:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #9                          ; =0x9
	b	LBB30_132
LBB30_130:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #10                         ; =0xa
	b	LBB30_132
LBB30_131:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w9, #11                         ; =0xb
LBB30_132:                              ;   in Loop: Header=BB30_86 Depth=1
	ldr	w21, [sp, #76]                  ; 4-byte Reload
	add	x28, sp, #272
	add	x25, sp, #124
LBB30_133:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w10, [x8]
	add	x19, sp, #320
	cbz	w10, LBB30_137
; %bb.134:                              ;   in Loop: Header=BB30_86 Depth=1
	add	w8, w8, #2
LBB30_135:                              ;   Parent Loop BB30_86 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w11, w19, w9, lsl #1
	strh	w10, [x11]
	add	w11, w9, #1
	ldrh	w10, [x8]
	cbz	w10, LBB30_138
; %bb.136:                              ;   in Loop: Header=BB30_135 Depth=2
	add	w8, w8, #2
	cmp	w9, #62
	mov	w9, w11
	b.lo	LBB30_135
	b	LBB30_138
LBB30_137:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w11, w9
LBB30_138:                              ;   in Loop: Header=BB30_86 Depth=1
	strh	wzr, [x19, w11, sxtw #1]
	str	s8, [sp, #288]
	bl	_chat_style_white
	cbz	w0, LBB30_140
; %bb.139:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w8, #1065353216                 ; =0x3f800000
	stur	d12, [x28, #20]
	b	LBB30_141
LBB30_140:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w8, #47186                      ; =0xb852
	stur	d14, [x28, #20]
	movk	w8, #16222, lsl #16
LBB30_141:                              ;   in Loop: Header=BB30_86 Depth=1
	str	w8, [sp, #300]
LBB30_142:                              ;   in Loop: Header=BB30_86 Depth=1
	add	x0, sp, #320
	bl	_text_filter_unicode
	cmp	w0, w19
	b.eq	LBB30_149
; %bb.143:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w9, [x0]
	cbz	w9, LBB30_147
; %bb.144:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w8, wzr
	add	w10, w0, #2
LBB30_145:                              ;   Parent Loop BB30_86 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w12, w8
	lsl	w11, w8, #1
	add	w13, w19, w11
	add	w8, w8, #1
	cmp	w12, #61
	strh	w9, [x13]
	b.hi	LBB30_148
; %bb.146:                              ;   in Loop: Header=BB30_145 Depth=2
	add	w9, w10, w11
	ldrh	w9, [x9]
	cbnz	w9, LBB30_145
	b	LBB30_148
LBB30_147:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w8, wzr
LBB30_148:                              ;   in Loop: Header=BB30_86 Depth=1
	strh	wzr, [x19, w8, sxtw #1]
LBB30_149:                              ;   in Loop: Header=BB30_86 Depth=1
	add	x0, sp, #124
	mov	w20, w27
	bl	_text_filter_unicode
	cmp	w0, w25
	b.eq	LBB30_156
; %bb.150:                              ;   in Loop: Header=BB30_86 Depth=1
	ldrh	w9, [x0]
	cbz	w9, LBB30_154
; %bb.151:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w8, wzr
	add	w10, w0, #2
LBB30_152:                              ;   Parent Loop BB30_86 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w12, w8
	lsl	w11, w8, #1
	add	w13, w25, w11
	add	w8, w8, #1
	cmp	w12, #61
	strh	w9, [x13]
	b.hi	LBB30_155
; %bb.153:                              ;   in Loop: Header=BB30_152 Depth=2
	add	w9, w10, w11
	ldrh	w9, [x9]
	cbnz	w9, LBB30_152
	b	LBB30_155
LBB30_154:                              ;   in Loop: Header=BB30_86 Depth=1
	mov	w8, wzr
LBB30_155:                              ;   in Loop: Header=BB30_86 Depth=1
	strh	wzr, [x25, w8, sxtw #1]
LBB30_156:                              ;   in Loop: Header=BB30_86 Depth=1
	bl	_text_filter_suspend
	sub	x4, x29, #200
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	ldr	w25, [sp, #80]                  ; 4-byte Reload
	add	x3, sp, #320
	ldr	w27, [sp, #120]                 ; 4-byte Reload
	add	x4, sp, #124
	add	x5, sp, #272
	mov	w0, w21
	mov	w1, w25
	mov	w2, w27
	bl	_chat_line_layout
	ldrsh	w19, [sp, #272]
	cmp	w19, w20, sxth
	b.gt	LBB30_160
; %bb.157:                              ;   in Loop: Header=BB30_86 Depth=1
	ldr	w9, [sp, #44]                   ; 4-byte Reload
	mov	w3, w25
	ldr	w25, [sp, #84]                  ; 4-byte Reload
	mul	w8, w19, w27
	fmov	s0, s8
	mov	w2, w21
	add	x1, sp, #272
	add	x6, sp, #320
	cmp	w9, #0
	add	x9, sp, #124
	csel	w8, w8, wzr, eq
	sub	x7, x29, #200
	sub	w8, w25, w8
	mov	w0, w24
	sxth	w4, w8
	mov	w5, w27
	add	x8, sp, #288
	cneg	w21, w19, eq
	stp	w9, w8, [sp]
	bl	_chat_draw_layout
	bl	_text_filter_resume
Lloh223:
	adrp	x8, _chat_newest_line@PAGE
	madd	w25, w21, w27, w25
	ldr	w14, [sp, #96]                  ; 4-byte Reload
	sub	w27, w20, w19
	ldr	w16, [sp, #88]                  ; 4-byte Reload
Lloh224:
	adrp	x15, _chat_lines@PAGE
Lloh225:
	add	x15, x15, _chat_lines@PAGEOFF
	ldrh	w9, [x8, _chat_newest_line@PAGEOFF]
Lloh226:
	adrp	x8, _chat_line_count@PAGE
	mov	w17, #100                       ; =0x64
	str	w25, [sp, #84]                  ; 4-byte Spill
	ldrh	w8, [x8, _chat_line_count@PAGEOFF]
LBB30_158:                              ;   in Loop: Header=BB30_86 Depth=1
	add	w23, w23, #1
	cmp	w23, w8, sxth
	b.ge	LBB30_161
; %bb.159:                              ;   in Loop: Header=BB30_86 Depth=1
	sxth	w10, w27
	cmp	w10, #0
	b.gt	LBB30_86
	b	LBB30_161
LBB30_160:
	bl	_text_filter_resume
LBB30_161:
	fmov	s0, #1.00000000
	movi	d1, #0000000000000000
	movi	d2, #0000000000000000
	bl	_rasterizer_text_set_scale
LBB30_162:
	add	sp, sp, #640
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             ; 16-byte Folded Reload
	ldp	d15, d14, [sp], #160            ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh165, Lloh166
	.loh AdrpAdd	Lloh167, Lloh168
	.loh AdrpLdrGotLdr	Lloh169, Lloh170, Lloh171
	.loh AdrpLdrGot	Lloh172, Lloh173
	.loh AdrpAdd	Lloh174, Lloh175
	.loh AdrpAdd	Lloh182, Lloh183
	.loh AdrpAdd	Lloh180, Lloh181
	.loh AdrpAdd	Lloh178, Lloh179
	.loh AdrpAdd	Lloh176, Lloh177
	.loh AdrpAdd	Lloh184, Lloh185
	.loh AdrpLdr	Lloh188, Lloh189
	.loh AdrpLdr	Lloh186, Lloh187
	.loh AdrpAddLdr	Lloh190, Lloh191, Lloh192
	.loh AdrpAdd	Lloh195, Lloh196
	.loh AdrpAdd	Lloh193, Lloh194
	.loh AdrpAdd	Lloh198, Lloh199
	.loh AdrpAdrp	Lloh197, Lloh198
	.loh AdrpAdd	Lloh200, Lloh201
	.loh AdrpLdrGot	Lloh202, Lloh203
	.loh AdrpAdd	Lloh206, Lloh207
	.loh AdrpAdd	Lloh204, Lloh205
	.loh AdrpAdd	Lloh213, Lloh214
	.loh AdrpLdr	Lloh210, Lloh212
	.loh AdrpAdrp	Lloh209, Lloh213
	.loh AdrpLdr	Lloh208, Lloh211
	.loh AdrpAdd	Lloh215, Lloh216
	.loh AdrpAdd	Lloh221, Lloh222
	.loh AdrpAdd	Lloh219, Lloh220
	.loh AdrpAdd	Lloh217, Lloh218
	.loh AdrpAdd	Lloh224, Lloh225
	.loh AdrpAdrp	Lloh223, Lloh226
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_line_layout
_chat_line_layout:                      ; @chat_line_layout
; %bb.0:
	sub	sp, sp, #400
	ldrh	w11, [x3]
	mov	x8, #140733193388032            ; =0x7fff00000000
	stp	x28, x27, [sp, #304]            ; 16-byte Folded Spill
	mov	w27, w2
	stp	x26, x25, [sp, #320]            ; 16-byte Folded Spill
	mov	x26, x4
	stp	x24, x23, [sp, #336]            ; 16-byte Folded Spill
	movk	x8, #32767, lsl #48
	stp	x22, x21, [sp, #352]            ; 16-byte Folded Spill
	mov	w22, w1
	stp	x20, x19, [sp, #368]            ; 16-byte Folded Spill
	mov	x19, x5
	mov	w23, w0
	stp	x29, x30, [sp, #384]            ; 16-byte Folded Spill
	add	x29, sp, #384
	str	x8, [sp, #16]
	cbz	w11, LBB31_12
; %bb.1:
	add	x9, sp, #40
	add	x10, sp, #40
	mov	w8, wzr
	mov	w1, w9
	add	w9, w10, #6
	add	w10, w3, #8
	.p2align	4, , 8
LBB31_2:                                ; =>This Inner Loop Header: Depth=1
	sub	w12, w10, #6
	sub	w13, w9, #6
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_7
; %bb.3:                                ;   in Loop: Header=BB31_2 Depth=1
	sub	w11, w10, #4
	sub	w13, w9, #4
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_8
; %bb.4:                                ;   in Loop: Header=BB31_2 Depth=1
	sub	w12, w10, #2
	sub	w13, w9, #2
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_9
; %bb.5:                                ;   in Loop: Header=BB31_2 Depth=1
	cmp	w8, #124
	b.eq	LBB31_10
; %bb.6:                                ;   in Loop: Header=BB31_2 Depth=1
	ldrh	w11, [x10]
	add	w8, w8, #4
	strh	w12, [x9]
	add	w9, w9, #8
	add	w10, w10, #8
	cbnz	w11, LBB31_2
	b	LBB31_11
LBB31_7:
	add	w8, w8, #1
	b	LBB31_11
LBB31_8:
	add	w8, w8, #2
	b	LBB31_11
LBB31_9:
	add	w8, w8, #3
	b	LBB31_11
LBB31_10:
	mov	w8, #127                        ; =0x7f
LBB31_11:
	add	x9, sp, #40
	add	x0, sp, #16
	add	x2, sp, #32
	add	x3, sp, #24
	strh	wzr, [x9, w8, sxtw #1]
	bl	_draw_unicode_string_compute_bounds
	ldrh	w8, [sp, #26]
	ubfx	w10, w27, #29, #2
	ldrh	w9, [sp, #18]
	add	w10, w27, w10
	sxth	w10, w10
	add	w10, w23, w10, asr #2
	add	w8, w10, w8
	sub	w23, w8, w9
LBB31_12:
	strh	w23, [x19, #14]
	strh	wzr, [x19]
	ldrh	w9, [x26]
	cbz	w9, LBB31_57
; %bb.13:
	mov	w8, wzr
	mov	w24, wzr
	sub	w10, w22, w23
	add	x21, x19, #2
	add	x11, x19, #8
	add	x25, sp, #40
	mov	x20, x26
	sxth	w28, w10
	str	x26, [sp, #8]                   ; 8-byte Spill
	str	w27, [sp, #4]                   ; 4-byte Spill
	b	LBB31_15
	.p2align	4, , 8
LBB31_14:                               ;   in Loop: Header=BB31_15 Depth=1
	ldrsh	x9, [x19]
	add	w8, w8, w24
	strh	w24, [x21, x9, lsl #1]
	add	w24, w8, w22
	ldrsh	x9, [x19]
	add	x20, x26, w24, sxth #1
	strh	w22, [x11, x9, lsl #1]
	ldrh	w9, [x19]
	add	w8, w9, #1
	strh	w8, [x19]
	ldrh	w9, [x20]
	cbz	w9, LBB31_56
LBB31_15:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB31_18 Depth 2
                                        ;     Child Loop BB31_20 Depth 2
                                        ;     Child Loop BB31_36 Depth 2
                                        ;       Child Loop BB31_40 Depth 3
                                        ;     Child Loop BB31_47 Depth 2
                                        ;     Child Loop BB31_51 Depth 2
                                        ;     Child Loop BB31_55 Depth 2
	sxth	w8, w8
	cmp	w8, #2
	b.gt	LBB31_58
; %bb.16:                               ;   in Loop: Header=BB31_15 Depth=1
	cmp	w28, w27
	b.le	LBB31_25
; %bb.17:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w8, wzr
	mov	w23, w20
	.p2align	4, , 8
LBB31_18:                               ;   Parent Loop BB31_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w22, w8
	add	w8, w20, w8, sxth #1
	ldrh	w10, [x8]
	add	w8, w22, #1
	cbnz	w10, LBB31_18
; %bb.19:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w8, wzr
	add	w11, w20, #8
	.p2align	4, , 8
LBB31_20:                               ;   Parent Loop BB31_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w12, w11, w10
	add	w13, w25, w10
	sub	w12, w12, #6
	strh	w9, [x13]
	ldrh	w12, [x12]
	cbz	w12, LBB31_26
; %bb.21:                               ;   in Loop: Header=BB31_20 Depth=2
	add	w9, w11, w10
	add	w13, w25, w10
	sub	w9, w9, #4
	add	w13, w13, #2
	ldrh	w9, [x9]
	strh	w12, [x13]
	cbz	w9, LBB31_27
; %bb.22:                               ;   in Loop: Header=BB31_20 Depth=2
	add	w12, w11, w10
	add	w13, w25, w10
	sub	w12, w12, #2
	add	w13, w13, #4
	ldrh	w12, [x12]
	strh	w9, [x13]
	cbz	w12, LBB31_28
; %bb.23:                               ;   in Loop: Header=BB31_20 Depth=2
	cmp	w8, #124
	b.eq	LBB31_29
; %bb.24:                               ;   in Loop: Header=BB31_20 Depth=2
	add	w9, w11, w10
	add	w13, w25, w10
	add	w13, w13, #6
	add	w8, w8, #4
	add	w10, w10, #8
	ldrh	w9, [x9]
	strh	w12, [x13]
	cbnz	w9, LBB31_20
	b	LBB31_30
	.p2align	4, , 8
LBB31_25:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w8, wzr
	b	LBB31_54
LBB31_26:                               ;   in Loop: Header=BB31_15 Depth=1
	add	w8, w8, #1
	b	LBB31_30
LBB31_27:                               ;   in Loop: Header=BB31_15 Depth=1
	add	w8, w8, #2
	b	LBB31_30
LBB31_28:                               ;   in Loop: Header=BB31_15 Depth=1
	add	w8, w8, #3
	b	LBB31_30
LBB31_29:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w8, #127                        ; =0x7f
	.p2align	4, , 8
LBB31_30:                               ;   in Loop: Header=BB31_15 Depth=1
	add	x0, sp, #16
	add	x1, sp, #40
	add	x2, sp, #32
	add	x3, sp, #24
	strh	wzr, [x25, w8, sxtw #1]
	bl	_draw_unicode_string_compute_bounds
	ldrh	w8, [sp, #26]
	ldrh	w9, [sp, #18]
	sub	w9, w8, w9
	cmp	w28, w9, sxth
	b.ge	LBB31_43
; %bb.31:                               ;   in Loop: Header=BB31_15 Depth=1
	sxth	w8, w22
	cmp	w8, #2
	b.lt	LBB31_44
; %bb.32:                               ;   in Loop: Header=BB31_15 Depth=1
	add	w27, w20, #2
	mov	w21, #1                         ; =0x1
	b	LBB31_36
	.p2align	4, , 8
LBB31_33:                               ;   in Loop: Header=BB31_36 Depth=2
	strh	wzr, [x25, w8, sxtw #1]
LBB31_34:                               ;   in Loop: Header=BB31_36 Depth=2
	add	x0, sp, #16
	add	x1, sp, #40
	add	x2, sp, #32
	add	x3, sp, #24
	bl	_draw_unicode_string_compute_bounds
	ldrh	w8, [sp, #26]
	ldrh	w9, [sp, #18]
	sub	w8, w8, w9
LBB31_35:                               ;   in Loop: Header=BB31_36 Depth=2
	sxth	w8, w8
	cmp	w8, w28
	sub	w8, w26, #1
	csel	w9, w21, w26, gt
	csel	w8, w8, w22, gt
	sxth	w21, w9
	sxth	w22, w8
	cmp	w21, w22
	b.ge	LBB31_45
LBB31_36:                               ;   Parent Loop BB31_15 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB31_40 Depth 3
	sxth	w8, w22
	add	w11, w8, w21, sxth
	add	w8, w11, #1
	ldrh	w9, [x23]
	add	w8, w8, w8, lsr #31
	asr	w26, w8, #1
	mov	w8, wzr
	cbz	w9, LBB31_35
; %bb.37:                               ;   in Loop: Header=BB31_36 Depth=2
	sxth	w10, w26
	cmp	w10, #127
	mov	w12, #127                       ; =0x7f
	and	w11, w11, #0xfffffffe
	csel	w10, w10, w12, lt
	b	LBB31_40
	.p2align	4, , 8
LBB31_38:                               ;   in Loop: Header=BB31_40 Depth=3
	cmp	w8, #126
	b.hi	LBB31_33
LBB31_39:                               ;   in Loop: Header=BB31_40 Depth=3
	lsl	w12, w8, #1
	add	w13, w25, w12
	add	w12, w27, w12
	add	w8, w8, #1
	strh	w9, [x13]
	ldrh	w9, [x12]
	cbz	w9, LBB31_33
LBB31_40:                               ;   Parent Loop BB31_15 Depth=1
                                        ;     Parent Loop BB31_36 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	cmn	w11, #4
	b.eq	LBB31_38
; %bb.41:                               ;   in Loop: Header=BB31_40 Depth=3
	cmp	w8, w10
	b.lt	LBB31_39
; %bb.42:                               ;   in Loop: Header=BB31_36 Depth=2
	add	w9, w25, w8, lsl #1
	strh	wzr, [x9]
	cbnz	w8, LBB31_34
	b	LBB31_35
	.p2align	4, , 8
LBB31_43:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w8, wzr
	b	LBB31_53
LBB31_44:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w21, #1                         ; =0x1
	b	LBB31_46
LBB31_45:                               ;   in Loop: Header=BB31_15 Depth=1
	ldr	x26, [sp, #8]                   ; 8-byte Reload
	cmp	w21, #1
	ldr	w27, [sp, #4]                   ; 4-byte Reload
	b.lt	LBB31_50
LBB31_46:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w8, w21
	.p2align	4, , 8
LBB31_47:                               ;   Parent Loop BB31_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w9, w20, w8, uxth #1
	ldrh	w9, [x9]
	cmp	w9, #32
	b.eq	LBB31_49
; %bb.48:                               ;   in Loop: Header=BB31_47 Depth=2
	sub	w9, w8, #1
	sxth	w10, w8
	mov	w8, w9
	cmp	w10, #1
	b.gt	LBB31_47
	b	LBB31_50
LBB31_49:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w21, w8
LBB31_50:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w10, wzr
	add	w9, w20, w21, sxth #1
	.p2align	4, , 8
LBB31_51:                               ;   Parent Loop BB31_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w8, w10
	add	w10, w9, w10, sxth #1
	ldrh	w11, [x10]
	add	w10, w8, #1
	cmp	w11, #32
	b.eq	LBB31_51
; %bb.52:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w22, w21
	add	x21, x19, #2
LBB31_53:                               ;   in Loop: Header=BB31_15 Depth=1
	add	x11, x19, #8
	mov	w9, #65535                      ; =0xffff
	bics	wzr, w9, w22
	b.ne	LBB31_14
LBB31_54:                               ;   in Loop: Header=BB31_15 Depth=1
	mov	w9, wzr
	.p2align	4, , 8
LBB31_55:                               ;   Parent Loop BB31_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w22, w9
	add	w9, w20, w9, sxth #1
	ldrh	w10, [x9]
	add	w9, w22, #1
	cbnz	w10, LBB31_55
	b	LBB31_14
LBB31_56:
	tst	w8, #0xffff
	b.ne	LBB31_58
LBB31_57:
	mov	w8, #1                          ; =0x1
	strh	wzr, [x19, #8]
	str	w8, [x19]
LBB31_58:
	ldp	x29, x30, [sp, #384]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #368]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #352]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #336]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #320]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #304]            ; 16-byte Folded Reload
	add	sp, sp, #400
	ret
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_draw_layout
_chat_draw_layout:                      ; @chat_draw_layout
; %bb.0:
	sub	sp, sp, #336
	ldrsh	w8, [x1]
	stp	d9, d8, [sp, #224]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #240]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #256]            ; 16-byte Folded Spill
	cmp	w8, #1
	stp	x24, x23, [sp, #272]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #288]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #304]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #320]            ; 16-byte Folded Spill
	add	x29, sp, #320
	str	x7, [sp, #8]                    ; 8-byte Spill
	str	w4, [sp, #36]                   ; 4-byte Spill
	b.lt	LBB32_18
; %bb.1:
	ldr	w8, [x29, #20]
	fmov	s8, s0
	mov	x20, x1
	mov	x21, x6
	mov	w22, w5
	mov	w24, w3
	mov	w25, w2
	mov	w26, w0
	str	x8, [sp, #24]                   ; 8-byte Spill
	mov	w28, wzr
	ldr	w8, [x29, #16]
	str	x8, [sp, #16]                   ; 8-byte Spill
	b	LBB32_3
	.p2align	4, , 8
LBB32_2:                                ;   in Loop: Header=BB32_3 Depth=1
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
	ldrsh	w8, [x20]
	add	w28, w28, #1
	cmp	w28, w8
	b.ge	LBB32_18
LBB32_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB32_9 Depth 2
                                        ;     Child Loop BB32_12 Depth 2
	add	x8, x20, #8
	ldrsh	w8, [x8, w28, sxtw #1]
	cmp	w8, #1
	b.lt	LBB32_5
; %bb.4:                                ;   in Loop: Header=BB32_3 Depth=1
	add	x9, x20, #2
	cmp	w8, #65
	mov	w10, #65                        ; =0x41
	add	x0, sp, #52
	csel	w19, w8, w10, lo
	ldr	x10, [sp, #16]                  ; 8-byte Reload
	ldrsh	w9, [x9, w28, sxtw #1]
	sub	w8, w19, #1
	and	w8, w8, #0xffff
	lsl	w8, w8, #1
	add	w2, w8, #2
	add	w1, w10, w9, lsl #1
	bl	_memcpy
	b	LBB32_6
	.p2align	4, , 8
LBB32_5:                                ;   in Loop: Header=BB32_3 Depth=1
	mov	w19, wzr
LBB32_6:                                ;   in Loop: Header=BB32_3 Depth=1
	ldr	w8, [sp, #36]                   ; 4-byte Reload
	add	x10, sp, #52
	strh	w25, [sp, #42]
	mov	w0, #1                          ; =0x1
	strh	w24, [sp, #46]
	cmp	w28, #0
	strh	wzr, [x10, w19, sxtw #1]
	csel	x19, x21, xzr, eq
	madd	w8, w22, w28, w8
	add	w9, w8, w22
	strh	w8, [sp, #40]
	strh	w9, [sp, #44]
	ldr	x8, [sp, #40]
	ldrh	w9, [x20, #14]
	stur	x8, [x29, #-136]
	sturh	w9, [x29, #-134]
	bl	_rasterizer_text_set_shadow_color
	cbz	w19, LBB32_10
; %bb.7:                                ;   in Loop: Header=BB32_3 Depth=1
	ldrh	w8, [x19]
	cbz	w8, LBB32_10
; %bb.8:                                ;   in Loop: Header=BB32_3 Depth=1
	mov	w27, #7                         ; =0x7
Lloh227:
	adrp	x23, _chat_draw_shadow.copies@PAGE+2
Lloh228:
	add	x23, x23, _chat_draw_shadow.copies@PAGEOFF+2
	.p2align	4, , 8
LBB32_9:                                ;   Parent Loop BB32_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w8, w23, #2
	sub	w9, w23, #2
	ldrsh	w2, [x23]
	sub	x0, x29, #128
	stur	xzr, [x29, #-112]
	ldr	s0, [x8]
	ldr	x8, [sp, #40]
	ldrsh	w1, [x9]
	stur	wzr, [x29, #-116]
	fmul	s0, s8, s0
	stur	x8, [x29, #-128]
	stur	s0, [x29, #-120]
	bl	_offset_rectangle2d
	sub	x4, x29, #120
	mov	w0, w26
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #128
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	mov	x4, x21
	bl	_rasterizer_draw_unicode_string
	add	w23, w23, #8
	subs	w27, w27, #1
	b.ne	LBB32_9
LBB32_10:                               ;   in Loop: Header=BB32_3 Depth=1
	ldrh	w8, [sp, #52]
	cbz	w8, LBB32_13
; %bb.11:                               ;   in Loop: Header=BB32_3 Depth=1
	mov	w27, #7                         ; =0x7
Lloh229:
	adrp	x23, _chat_draw_shadow.copies@PAGE+2
Lloh230:
	add	x23, x23, _chat_draw_shadow.copies@PAGEOFF+2
	.p2align	4, , 8
LBB32_12:                               ;   Parent Loop BB32_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w8, w23, #2
	sub	w9, w23, #2
	ldrsh	w2, [x23]
	sub	x0, x29, #128
	stur	xzr, [x29, #-112]
	ldr	s0, [x8]
	ldur	x8, [x29, #-136]
	ldrsh	w1, [x9]
	stur	wzr, [x29, #-116]
	fmul	s0, s8, s0
	stur	x8, [x29, #-128]
	stur	s0, [x29, #-120]
	bl	_offset_rectangle2d
	sub	x4, x29, #120
	mov	w0, w26
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #128
	add	x4, sp, #52
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	add	w23, w23, #8
	subs	w27, w27, #1
	b.ne	LBB32_12
LBB32_13:                               ;   in Loop: Header=BB32_3 Depth=1
	cbz	w19, LBB32_16
; %bb.14:                               ;   in Loop: Header=BB32_3 Depth=1
	ldrh	w8, [x19]
	cbz	w8, LBB32_16
; %bb.15:                               ;   in Loop: Header=BB32_3 Depth=1
	ldr	x4, [sp, #8]                    ; 8-byte Reload
	mov	w0, w26
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #40
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	mov	x4, x21
	bl	_rasterizer_draw_unicode_string
LBB32_16:                               ;   in Loop: Header=BB32_3 Depth=1
	ldrh	w8, [sp, #52]
	cbz	w8, LBB32_2
; %bb.17:                               ;   in Loop: Header=BB32_3 Depth=1
	ldr	x4, [sp, #24]                   ; 8-byte Reload
	mov	w0, w26
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	sub	x0, x29, #136
	add	x4, sp, #52
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	b	LBB32_2
LBB32_18:
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #304]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #288]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #272]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #256]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #240]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #224]              ; 16-byte Folded Reload
	add	sp, sp, #336
	ret
	.loh AdrpAdd	Lloh227, Lloh228
	.loh AdrpAdd	Lloh229, Lloh230
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_filter_level
_chat_filter_level:                     ; @chat_filter_level
; %bb.0:
	cbz	w0, LBB33_14
; %bb.1:
	ldrb	w8, [x0]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w9, w10, w8, lo
	cmp	w9, #115
	b.eq	LBB33_7
; %bb.2:
	cmp	w9, #109
	b.ne	LBB33_13
; %bb.3:
	mov	w10, wzr
	mov	w12, w8
Lloh231:
	adrp	x11, l_.str.18@PAGE
Lloh232:
	add	x11, x11, l_.str.18@PAGEOFF
	.p2align	4, , 8
LBB33_4:                                ; =>This Inner Loop Header: Depth=1
	cbz	w12, LBB33_16
; %bb.5:                                ;   in Loop: Header=BB33_4 Depth=1
	add	w10, w10, #1
	sxth	x13, w10
	ldrb	w12, [x0, x13]
	ldrb	w13, [x11, x13]
	sub	w14, w12, #65
	orr	w15, w12, #0x20
	cmp	w14, #26
	sub	w14, w13, #65
	csel	w15, w15, w12, lo
	orr	w16, w13, #0x20
	cmp	w14, #26
	csel	w13, w16, w13, lo
	cmp	w15, w13
	b.eq	LBB33_4
; %bb.6:
	cmp	w9, #115
	b.ne	LBB33_13
LBB33_7:
	mov	w9, wzr
	mov	w11, w8
Lloh233:
	adrp	x10, l_.str.19@PAGE
Lloh234:
	add	x10, x10, l_.str.19@PAGEOFF
	.p2align	4, , 8
LBB33_8:                                ; =>This Inner Loop Header: Depth=1
	cbz	w11, LBB33_15
; %bb.9:                                ;   in Loop: Header=BB33_8 Depth=1
	add	w9, w9, #1
	sxth	x12, w9
	ldrb	w11, [x0, x12]
	ldrb	w12, [x10, x12]
	sub	w13, w11, #65
	orr	w14, w11, #0x20
	cmp	w13, #26
	sub	w13, w12, #65
	csel	w14, w14, w11, lo
	orr	w15, w12, #0x20
	cmp	w13, #26
	csel	w12, w15, w12, lo
	cmp	w14, w12
	b.eq	LBB33_8
; %bb.10:
	mov	w9, wzr
Lloh235:
	adrp	x10, l_.str.20@PAGE
Lloh236:
	add	x10, x10, l_.str.20@PAGEOFF
	.p2align	4, , 8
LBB33_11:                               ; =>This Inner Loop Header: Depth=1
	cbz	w8, LBB33_17
; %bb.12:                               ;   in Loop: Header=BB33_11 Depth=1
	add	w9, w9, #1
	sxth	x11, w9
	ldrb	w8, [x0, x11]
	ldrb	w11, [x10, x11]
	sub	w12, w8, #65
	orr	w13, w8, #0x20
	cmp	w12, #26
	sub	w12, w11, #65
	csel	w13, w13, w8, lo
	orr	w14, w11, #0x20
	cmp	w12, #26
	csel	w11, w14, w11, lo
	cmp	w13, w11
	b.eq	LBB33_11
LBB33_13:
	mov	w0, wzr
LBB33_14:
	ret
LBB33_15:
	mov	w0, #2                          ; =0x2
	ret
LBB33_16:
	mov	w0, #1                          ; =0x1
	ret
LBB33_17:
	mov	w0, #3                          ; =0x3
	ret
	.loh AdrpAdd	Lloh231, Lloh232
	.loh AdrpAdd	Lloh233, Lloh234
	.loh AdrpAdd	Lloh235, Lloh236
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_link_domain
_chat_link_domain:                      ; @chat_link_domain
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	mov	w22, wzr
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	w19, w1
	mov	x20, x0
Lloh237:
	adrp	x23, _chat_link_domain.domains@PAGE
Lloh238:
	add	x23, x23, _chat_link_domain.domains@PAGEOFF
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	b	LBB34_2
	.p2align	4, , 8
LBB34_1:                                ;   in Loop: Header=BB34_2 Depth=1
	add	w22, w22, #4
	cmp	w22, #192
	b.eq	LBB34_5
LBB34_2:                                ; =>This Inner Loop Header: Depth=1
	add	w8, w23, w22
	ldr	w21, [x8]
	mov	x0, x21
	bl	_csstrlen
	cmp	w19, w0, sxth
	b.ne	LBB34_1
; %bb.3:                                ;   in Loop: Header=BB34_2 Depth=1
	mov	x0, x20
	mov	x1, x21
	mov	w2, w19
	bl	_csstrncmp
	cbnz	w0, LBB34_1
; %bb.4:
	mov	w0, #2                          ; =0x2
	b	LBB34_11
LBB34_5:
	mov	w22, wzr
Lloh239:
	adrp	x23, _chat_link_domain.words@PAGE
Lloh240:
	add	x23, x23, _chat_link_domain.words@PAGEOFF
	b	LBB34_7
	.p2align	4, , 8
LBB34_6:                                ;   in Loop: Header=BB34_7 Depth=1
	add	w22, w22, #4
	cmp	w22, #64
	b.eq	LBB34_10
LBB34_7:                                ; =>This Inner Loop Header: Depth=1
	add	w8, w23, w22
	ldr	w21, [x8]
	mov	x0, x21
	bl	_csstrlen
	cmp	w19, w0, sxth
	b.ne	LBB34_6
; %bb.8:                                ;   in Loop: Header=BB34_7 Depth=1
	mov	x0, x20
	mov	x1, x21
	mov	w2, w19
	bl	_csstrncmp
	cbnz	w0, LBB34_6
; %bb.9:
	mov	w0, #1                          ; =0x1
	b	LBB34_11
LBB34_10:
	mov	w0, wzr
LBB34_11:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh237, Lloh238
	.loh AdrpAdd	Lloh239, Lloh240
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_command_parse
_chat_command_parse:                    ; @chat_command_parse
; %bb.0:
	mov	w8, #20                         ; =0x14
	strb	wzr, [x1]
	strh	w8, [x2]
	ldrb	w8, [x0]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #47
	b.ne	LBB35_14
; %bb.1:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	ldrb	w8, [x0, #1]
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #109
	b.ne	LBB35_15
; %bb.2:
	ldrb	w8, [x0, #2]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #117
	b.ne	LBB35_15
; %bb.3:
	ldrb	w8, [x0, #3]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #116
	b.ne	LBB35_15
; %bb.4:
	ldrb	w8, [x0, #4]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #101
	b.ne	LBB35_15
; %bb.5:
	ldrb	w8, [x0, #5]
	tst	w8, #0xffffffdf
	b.ne	LBB35_15
; %bb.6:
	mov	w9, #5                          ; =0x5
	.p2align	4, , 8
LBB35_7:                                ; =>This Inner Loop Header: Depth=1
	mov	w8, w9
	sxth	x9, w8
	ldrb	w10, [x0, x9]
	add	w9, w8, #1
	cmp	w10, #32
	b.eq	LBB35_7
; %bb.8:
	sxth	w8, w8
	add	x19, x0, w8, sxtw
	cbz	w19, LBB35_15
; %bb.9:
	mov	x23, x2
	mov	x21, x1
	mov	w22, #1                         ; =0x1
	mov	w20, #1                         ; =0x1
LBB35_10:
	mov	x0, x19
	bl	_csstrlen
	sxth	w8, w0
	cmp	w8, #1
	b.lt	LBB35_28
; %bb.11:
	mov	w10, w19
	and	w9, w0, #0x7fff
	sub	w8, w19, #1
	mov	x11, x23
LBB35_12:                               ; =>This Inner Loop Header: Depth=1
	add	w12, w8, w9
	ldrb	w12, [x12]
	cmp	w12, #32
	b.eq	LBB35_29
; %bb.13:                               ;   in Loop: Header=BB35_12 Depth=1
	subs	w9, w9, #1
	b.gt	LBB35_12
	b	LBB35_40
LBB35_14:
	mov	w0, wzr
	ret
LBB35_15:
	ldrb	w8, [x0, #1]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #117
	b.ne	LBB35_26
; %bb.16:
	ldrb	w8, [x0, #2]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #110
	b.ne	LBB35_26
; %bb.17:
	ldrb	w8, [x0, #3]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #109
	b.ne	LBB35_26
; %bb.18:
	ldrb	w8, [x0, #4]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #117
	b.ne	LBB35_26
; %bb.19:
	ldrb	w8, [x0, #5]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #116
	b.ne	LBB35_26
; %bb.20:
	ldrb	w8, [x0, #6]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w8, w10, w8, lo
	cmp	w8, #101
	b.ne	LBB35_26
; %bb.21:
	ldrb	w8, [x0, #7]
	tst	w8, #0xffffffdf
	b.ne	LBB35_26
; %bb.22:
	mov	w9, #7                          ; =0x7
LBB35_23:                               ; =>This Inner Loop Header: Depth=1
	mov	w8, w9
	sxth	x9, w8
	ldrb	w10, [x0, x9]
	add	w9, w8, #1
	cmp	w10, #32
	b.eq	LBB35_23
; %bb.24:
	sxth	w8, w8
	add	x19, x0, w8, sxtw
	cbz	w19, LBB35_26
; %bb.25:
	mov	x23, x2
	mov	x21, x1
	mov	w22, wzr
	mov	w20, #2                         ; =0x2
	b	LBB35_10
LBB35_26:
	mov	w0, wzr
LBB35_27:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB35_28:
	mov	w9, wzr
	mov	w11, #3                         ; =0x3
	mov	x8, x21
	b	LBB35_63
LBB35_29:
	cbz	w22, LBB35_40
; %bb.30:
	and	w12, w0, #0x7fff
	mov	x8, x21
	cmp	w12, w9
	b.le	LBB35_41
; %bb.31:
	mov	w13, wzr
	mov	w14, #10                        ; =0xa
	mov	w15, #1440                      ; =0x5a0
	mov	w16, w9
	mov	w17, w9
LBB35_32:                               ; =>This Inner Loop Header: Depth=1
	ldrb	w1, [x19, w16, sxtw]
	sub	w1, w1, #48
	and	w2, w1, #0xff
	cmp	w2, #9
	b.hi	LBB35_34
; %bb.33:                               ;   in Loop: Header=BB35_32 Depth=1
	mul	w13, w13, w14
	add	w17, w17, #1
	sxth	w16, w17
	add	w13, w13, w1, uxtb
	cmp	w13, #1440
	csel	w13, w13, w15, lt
	cmp	w12, w16
	b.gt	LBB35_32
LBB35_34:
	cmp	w12, w16
	b.ne	LBB35_41
; %bb.35:
	cbz	w13, LBB35_64
; %bb.36:
	cmp	w9, #1
	strh	w13, [x11]
	b.lt	LBB35_44
; %bb.37:
	mov	w0, w9
	mov	w11, #3                         ; =0x3
LBB35_38:                               ; =>This Inner Loop Header: Depth=1
	add	w9, w19, w0, uxth
	sub	w9, w9, #1
	ldrb	w9, [x9]
	cmp	w9, #32
	b.ne	LBB35_41
; %bb.39:                               ;   in Loop: Header=BB35_38 Depth=1
	sub	w12, w0, #1
	mov	w9, wzr
	sxth	w13, w0
	mov	w0, w12
	cmp	w13, #1
	b.gt	LBB35_38
	b	LBB35_63
LBB35_40:
	mov	x8, x21
LBB35_41:
	sxth	w9, w0
	cmp	w9, #1
	b.lt	LBB35_44
; %bb.42:
	and	w11, w0, #0xffff
	mov	w9, #63                         ; =0x3f
	cmp	w11, #63
	sub	w12, w19, w8
	csel	w9, w11, w9, lo
	cmn	w12, #16
	ccmp	w11, #4, #0, ls
	b.hs	LBB35_45
; %bb.43:
	mov	w10, wzr
	b	LBB35_55
LBB35_44:
	mov	w9, wzr
	mov	w11, #3                         ; =0x3
	b	LBB35_63
LBB35_45:
	cmp	w11, #16
	b.hs	LBB35_47
; %bb.46:
	mov	w10, wzr
	b	LBB35_52
LBB35_47:
	ldr	d0, [x10]
	and	w10, w9, #0x30
	ldr	d1, [x19, #8]
	cmp	w10, #16
	stp	d0, d1, [x8]
	b.eq	LBB35_50
; %bb.48:
	ldp	d0, d1, [x19, #16]
	cmp	w10, #32
	stp	d0, d1, [x8, #16]
	b.eq	LBB35_50
; %bb.49:
	ldp	d0, d1, [x19, #32]
	stp	d0, d1, [x8, #32]
LBB35_50:
	cmp	w10, w9
	b.eq	LBB35_62
; %bb.51:
	and	w11, w9, #0xc
	cbz	w11, LBB35_55
LBB35_52:
	mov	w13, w10
	and	w10, w9, #0x3c
	sub	w11, w13, w10
	add	w12, w8, w13
	add	w13, w19, w13
LBB35_53:                               ; =>This Inner Loop Header: Depth=1
	ldr	w14, [x13]
	add	w13, w13, #4
	adds	w11, w11, #4
	str	w14, [x12]
	add	w12, w12, #4
	b.ne	LBB35_53
; %bb.54:
	cmp	w10, w9
	b.eq	LBB35_62
LBB35_55:
	mov	w11, w10
	ands	w12, w9, #0x3
	b.eq	LBB35_59
; %bb.56:
	ldrb	w13, [x19, w10, uxtw]
	orr	w11, w10, #0x1
	cmp	w12, #1
	strb	w13, [x8, w10, uxtw]
	b.eq	LBB35_59
; %bb.57:
	ldrb	w13, [x19, w11, uxtw]
	cmp	w12, #2
	strb	w13, [x8, w11, uxtw]
	orr	w11, w10, #0x2
	b.eq	LBB35_59
; %bb.58:
	ldrb	w12, [x19, w11, uxtw]
	strb	w12, [x8, w11, uxtw]
	orr	w11, w10, #0x3
LBB35_59:
	sub	w10, w10, w9
	cmn	w10, #4
	b.hi	LBB35_62
; %bb.60:
	add	w12, w11, #3
	sub	w10, w9, w11
	add	w11, w8, w12
	add	w12, w19, w12
LBB35_61:                               ; =>This Inner Loop Header: Depth=1
	sub	w13, w12, #3
	sub	w14, w11, #3
	sub	w15, w12, #2
	subs	w10, w10, #4
	ldrb	w13, [x13]
	strb	w13, [x14]
	sub	w14, w11, #2
	ldrb	w13, [x15]
	sub	w15, w12, #1
	strb	w13, [x14]
	sub	w14, w11, #1
	ldrb	w13, [x15]
	strb	w13, [x14]
	ldrb	w13, [x12]
	add	w12, w12, #4
	strb	w13, [x11]
	add	w11, w11, #4
	b.ne	LBB35_61
LBB35_62:
	mov	w11, w20
LBB35_63:
	strb	wzr, [x8, w9, uxtw]
	mov	w0, w11
	b	LBB35_27
LBB35_64:
	mov	w0, #3                          ; =0x3
	b	LBB35_27
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_keyboard_press
_chat_keyboard_press:                   ; @chat_keyboard_press
; %bb.0:
	sub	sp, sp, #48
	adrp	x8, _chat_keyboard.3@PAGE
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	ldrsh	w8, [x8, _chat_keyboard.3@PAGEOFF]
	cmp	w8, #3
	b.gt	LBB36_3
; %bb.1:
	adrp	x9, _chat_keyboard.4@PAGE
	cmp	w8, #3
	ldrh	w9, [x9, _chat_keyboard.4@PAGEOFF]
	ccmp	w9, #9, #2, ls
	b.ls	LBB36_7
; %bb.2:
	mov	w19, wzr
	b	LBB36_8
LBB36_3:
	adrp	x8, _chat_keyboard.4@PAGE
	ldrh	w8, [x8, _chat_keyboard.4@PAGEOFF]
	add	w8, w8, w8, lsr #15
	sxth	w8, w8
	ubfx	w8, w8, #1, #16
	cmp	w8, #1
	b.gt	LBB36_16
; %bb.4:
	cbz	w8, LBB36_21
; %bb.5:
	cmp	w8, #1
	b.ne	LBB36_20
; %bb.6:
	adrp	x8, _chat_keyboard.6@PAGE
	ldrb	w9, [x8, _chat_keyboard.6@PAGEOFF]
	cmp	w9, #0
	cset	w9, eq
	strb	w9, [x8, _chat_keyboard.6@PAGEOFF]
	b	LBB36_25
LBB36_7:
	adrp	x10, _chat_keyboard.6@PAGE
Lloh241:
	adrp	x11, _chat_keyboard_symbols@PAGE
Lloh242:
	add	x11, x11, _chat_keyboard_symbols@PAGEOFF
Lloh243:
	adrp	x12, _chat_keyboard_letters@PAGE
Lloh244:
	add	x12, x12, _chat_keyboard_letters@PAGEOFF
	ldrb	w10, [x10, _chat_keyboard.6@PAGEOFF]
	cmp	w10, #0
	csel	x10, x12, x11, eq
	ldr	w8, [x10, w8, sxtw #2]
	adrp	x10, _chat_keyboard.5@PAGE
	ldrb	w8, [x8, w9, uxtw]
	ldrb	w9, [x10, _chat_keyboard.5@PAGEOFF]
	sub	w10, w8, #97
	and	w10, w10, #0xff
	cmp	w10, #26
	ccmp	w9, #0, #4, lo
	sub	w9, w8, #32
	csel	w19, w9, w8, ne
LBB36_8:
Lloh245:
	adrp	x0, _chat_input@PAGE+13
Lloh246:
	add	x0, x0, _chat_input@PAGEOFF+13
	strb	wzr, [sp, #15]
	bl	_csstrlen
	and	w9, w19, #0xff
	sxth	w8, w0
	cmp	w8, #63
	ccmp	w9, #0, #4, lt
	b.eq	LBB36_24
; %bb.9:
	add	x9, sp, #14
Lloh247:
	adrp	x10, _chat_input@PAGE
Lloh248:
	add	x10, x10, _chat_input@PAGEOFF
	add	w9, w9, #1
	.p2align	4, , 8
LBB36_10:                               ; =>This Inner Loop Header: Depth=1
	sxtb	w11, w19
	cmp	w11, #32
	b.lt	LBB36_14
; %bb.11:                               ;   in Loop: Header=BB36_10 Depth=1
	and	w11, w19, #0xff
	cmp	w11, #124
	b.eq	LBB36_14
; %bb.12:                               ;   in Loop: Header=BB36_10 Depth=1
	cmp	w11, #127
	b.eq	LBB36_14
; %bb.13:                               ;   in Loop: Header=BB36_10 Depth=1
	add	x8, x10, w8, sxtw
	add	w0, w0, #1
	strb	w19, [x8, #13]
	.p2align	4, , 8
LBB36_14:                               ;   in Loop: Header=BB36_10 Depth=1
	ldrb	w19, [x9]
	sxth	w8, w0
	cbz	w19, LBB36_24
; %bb.15:                               ;   in Loop: Header=BB36_10 Depth=1
	add	w9, w9, #1
	cmp	w8, #63
	b.lt	LBB36_10
	b	LBB36_24
LBB36_16:
	cmp	w8, #2
	b.eq	LBB36_22
; %bb.17:
	cmp	w8, #3
	b.ne	LBB36_20
; %bb.18:
Lloh249:
	adrp	x0, _chat_input@PAGE+13
Lloh250:
	add	x0, x0, _chat_input@PAGEOFF+13
	bl	_csstrlen
	tst	w0, #0xffff
	b.eq	LBB36_25
; %bb.19:
Lloh251:
	adrp	x8, _chat_input@PAGE
Lloh252:
	add	x8, x8, _chat_input@PAGEOFF
	add	w8, w8, w0, sxth
	add	w8, w8, #12
	strb	wzr, [x8]
	b	LBB36_25
LBB36_20:
Lloh253:
	adrp	x19, _chat_input@PAGE
Lloh254:
	add	x19, x19, _chat_input@PAGEOFF
	add	x1, x19, #13
	mov	w2, #1                          ; =0x1
	mov	w3, #1                          ; =0x1
	ldrsh	w0, [x19, #2]
	bl	_chat_send
Lloh255:
	adrp	x8, _chat_keyboard.0@PAGE
	adrp	x9, _chat_keyboard.1@PAGE
	adrp	x10, _chat_keyboard.2@PAGE
	adrp	x11, _chat_keyboard.9@PAGE
	strb	wzr, [x19]
	strb	wzr, [x8, _chat_keyboard.0@PAGEOFF]
Lloh256:
	adrp	x8, _chat_scroll@PAGE
	strb	wzr, [x9, _chat_keyboard.1@PAGEOFF]
	str	wzr, [x10, _chat_keyboard.2@PAGEOFF]
	strb	wzr, [x11, _chat_keyboard.9@PAGEOFF]
	strh	wzr, [x8, _chat_scroll@PAGEOFF]
	b	LBB36_25
LBB36_21:
	adrp	x8, _chat_keyboard.5@PAGE
	ldrb	w9, [x8, _chat_keyboard.5@PAGEOFF]
	cmp	w9, #0
	cset	w9, eq
	strb	w9, [x8, _chat_keyboard.5@PAGEOFF]
	b	LBB36_25
LBB36_22:
Lloh257:
	adrp	x0, _chat_input@PAGE+13
Lloh258:
	add	x0, x0, _chat_input@PAGEOFF+13
	bl	_csstrlen
	sxth	w8, w0
	cmp	w8, #62
	b.gt	LBB36_24
; %bb.23:
Lloh259:
	adrp	x9, _chat_input@PAGE
Lloh260:
	add	x9, x9, _chat_input@PAGEOFF
	add	x9, x9, w8, sxtw
	mov	w10, #32                        ; =0x20
	add	w8, w0, #1
	sxth	w8, w8
	strb	w10, [x9, #13]
LBB36_24:
Lloh261:
	adrp	x9, _chat_input@PAGE
Lloh262:
	add	x9, x9, _chat_input@PAGEOFF
	add	x8, x9, w8, sxtw
	strb	wzr, [x8, #13]
LBB36_25:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh243, Lloh244
	.loh AdrpAdd	Lloh241, Lloh242
	.loh AdrpAdd	Lloh245, Lloh246
	.loh AdrpAdd	Lloh247, Lloh248
	.loh AdrpAdd	Lloh249, Lloh250
	.loh AdrpAdd	Lloh251, Lloh252
	.loh AdrpAdrp	Lloh255, Lloh256
	.loh AdrpAdd	Lloh253, Lloh254
	.loh AdrpAdd	Lloh257, Lloh258
	.loh AdrpAdd	Lloh259, Lloh260
	.loh AdrpAdd	Lloh261, Lloh262
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_style_white
_chat_style_white:                      ; @chat_style_white
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	adrp	x20, _chat_style_white.read_at@PAGE
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	ldr	w19, [x20, _chat_style_white.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w19, w0
	b.ne	LBB37_2
; %bb.1:
	adrp	x8, _chat_style_white.white@PAGE
	ldrb	w0, [x8, _chat_style_white.white@PAGEOFF]
	b	LBB37_9
LBB37_2:
Lloh263:
	adrp	x0, l_.str.129@PAGE
Lloh264:
	add	x0, x0, l_.str.129@PAGEOFF
	bl	_config_string
	mov	x19, x0
	bl	_config_changes
	str	w0, [x20, _chat_style_white.read_at@PAGEOFF]
	cbz	w19, LBB37_7
; %bb.3:
	ldrb	w8, [x19]
	sub	w9, w8, #65
	orr	w10, w8, #0x20
	cmp	w9, #26
	csel	w9, w10, w8, lo
	cmp	w9, #119
	b.ne	LBB37_7
; %bb.4:
	mov	w9, wzr
Lloh265:
	adrp	x10, l_.str.130@PAGE
Lloh266:
	add	x10, x10, l_.str.130@PAGEOFF
	.p2align	4, , 8
LBB37_5:                                ; =>This Inner Loop Header: Depth=1
	cmp	w8, #0
	cset	w0, eq
	cbz	w8, LBB37_8
; %bb.6:                                ;   in Loop: Header=BB37_5 Depth=1
	add	w9, w9, #1
	sxth	x11, w9
	ldrb	w8, [x19, x11]
	ldrb	w11, [x10, x11]
	sub	w12, w8, #65
	orr	w13, w8, #0x20
	cmp	w12, #26
	sub	w12, w11, #65
	csel	w13, w13, w8, lo
	orr	w14, w11, #0x20
	cmp	w12, #26
	csel	w11, w14, w11, lo
	cmp	w13, w11
	b.eq	LBB37_5
	b	LBB37_8
LBB37_7:
	mov	w0, wzr
LBB37_8:
	adrp	x8, _chat_style_white.white@PAGE
	strb	w0, [x8, _chat_style_white.white@PAGEOFF]
LBB37_9:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh263, Lloh264
	.loh AdrpAdd	Lloh265, Lloh266
                                        ; -- End function
.zerofill __DATA,__bss,_chat_config.0,1,2 ; @chat_config.0
.zerofill __DATA,__bss,_chat_config.1,1,0 ; @chat_config.1
.zerofill __DATA,__bss,_chat_config.2,4,2 ; @chat_config.2
.zerofill __DATA,__bss,_chat_mutes,3072,2 ; @chat_mutes
.zerofill __DATA,__bss,_chat_rates,1024,2 ; @chat_rates
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"You are muted for %d more minute%s"

l_.str.1:                               ; @.str.1
	.asciz	"chat filter: a line of %s not sent (blocked words)"

l_.str.2:                               ; @.str.2
	.asciz	"Your line was not sent: it has words this server does not allow"

l_.str.3:                               ; @.str.3
	.asciz	"chat filter: a line of %s sent with its blocked words starred"

l_.str.4:                               ; @.str.4
	.asciz	"%s"

.zerofill __DATA,__bss,_chat_input,80,2 ; @chat_input
.zerofill __DATA,__bss,_chat_keyboard.0,1,2 ; @chat_keyboard.0
.zerofill __DATA,__bss,_chat_keyboard.1,1,0 ; @chat_keyboard.1
.zerofill __DATA,__bss,_chat_keyboard.2,4,2 ; @chat_keyboard.2
.zerofill __DATA,__bss,_chat_keyboard.3,2,2 ; @chat_keyboard.3
.zerofill __DATA,__bss,_chat_keyboard.4,2,1 ; @chat_keyboard.4
.zerofill __DATA,__bss,_chat_keyboard.5,1,2 ; @chat_keyboard.5
.zerofill __DATA,__bss,_chat_keyboard.6,1,0 ; @chat_keyboard.6
.zerofill __DATA,__bss,_chat_keyboard.7,4,2 ; @chat_keyboard.7
.zerofill __DATA,__bss,_chat_keyboard.8,4,2 ; @chat_keyboard.8
.zerofill __DATA,__bss,_chat_keyboard.9,1,2 ; @chat_keyboard.9
.zerofill __DATA,__bss,_chat_keyboard.10,2,1 ; @chat_keyboard.10
.zerofill __DATA,__bss,_chat_keyboard.11,2,2 ; @chat_keyboard.11
.zerofill __DATA,__bss,_chat_keyboard.12,2,1 ; @chat_keyboard.12
.zerofill __DATA,__bss,_chat_keyboard.13,2,2 ; @chat_keyboard.13
.zerofill __DATA,__bss,_chat_in_game,1,0 ; @chat_in_game
.zerofill __DATA,__bss,_chat_line_count,2,1 ; @chat_line_count
.zerofill __DATA,__bss,_chat_scroll,2,1 ; @chat_scroll
.zerofill __DATA,__bss,_chat_motion_sensors,48,1 ; @chat_motion_sensors
.zerofill __DATA,__bss,_chat_off_noticed,1,0 ; @chat_off_noticed
.zerofill __DATA,__bss,_network_chat_update.vote_keys_held,4,2 ; @network_chat_update.vote_keys_held
.zerofill __DATA,__bss,_network_chat_update.vote_pad_held,4,2 ; @network_chat_update.vote_pad_held
.zerofill __DATA,__bss,_chat_actions_held,4,2 ; @chat_actions_held
.zerofill __DATA,__bss,_chat_off_noticed_at,4,2 ; @chat_off_noticed_at
l_.str.5:                               ; @.str.5
	.asciz	"Text chat is off in this game"

l_.str.6:                               ; @.str.6
	.asciz	"chat: the system's keyboard opened"

l_.str.7:                               ; @.str.7
	.asciz	"chat: the on-screen keyboard opened"

	.section	__TEXT,__ustring
	.p2align	1, 0x0                          ; @.str.8
l_.str.8:
	.short	83                              ; 0x53
	.short	97                              ; 0x61
	.short	121                             ; 0x79
	.short	32                              ; 0x20
	.short	116                             ; 0x74
	.short	111                             ; 0x6f
	.short	32                              ; 0x20
	.short	116                             ; 0x74
	.short	101                             ; 0x65
	.short	97                              ; 0x61
	.short	109                             ; 0x6d
	.short	58                              ; 0x3a
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.9
l_.str.9:
	.short	83                              ; 0x53
	.short	97                              ; 0x61
	.short	121                             ; 0x79
	.short	32                              ; 0x20
	.short	116                             ; 0x74
	.short	111                             ; 0x6f
	.short	32                              ; 0x20
	.short	118                             ; 0x76
	.short	101                             ; 0x65
	.short	104                             ; 0x68
	.short	105                             ; 0x69
	.short	99                              ; 0x63
	.short	108                             ; 0x6c
	.short	101                             ; 0x65
	.short	58                              ; 0x3a
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.10
l_.str.10:
	.short	83                              ; 0x53
	.short	97                              ; 0x61
	.short	121                             ; 0x79
	.short	58                              ; 0x3a
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.11
l_.str.11:
	.short	40                              ; 0x28
	.short	80                              ; 0x50
	.short	97                              ; 0x61
	.short	103                             ; 0x67
	.short	101                             ; 0x65
	.short	32                              ; 0x20
	.short	68                              ; 0x44
	.short	111                             ; 0x6f
	.short	119                             ; 0x77
	.short	110                             ; 0x6e
	.short	58                              ; 0x3a
	.short	32                              ; 0x20
	.short	110                             ; 0x6e
	.short	101                             ; 0x65
	.short	119                             ; 0x77
	.short	101                             ; 0x65
	.short	114                             ; 0x72
	.short	32                              ; 0x20
	.short	108                             ; 0x6c
	.short	105                             ; 0x69
	.short	110                             ; 0x6e
	.short	101                             ; 0x65
	.short	115                             ; 0x73
	.short	41                              ; 0x29
	.short	0                               ; 0x0

.zerofill __DATA,__bss,_chat_lines,6400,2 ; @chat_lines
.zerofill __DATA,__bss,_chat_newest_line,2,1 ; @chat_newest_line
	.section	__TEXT,__cstring,cstring_literals
l_.str.12:                              ; @.str.12
	.asciz	"server.chat_filter"

l_.str.13:                              ; @.str.13
	.asciz	"censor"

l_.str.14:                              ; @.str.14
	.asciz	"block"

l_.str.15:                              ; @.str.15
	.asciz	"server.chat_filter_slurs"

l_.str.16:                              ; @.str.16
	.asciz	"server.chat_filter_swearing"

l_.str.17:                              ; @.str.17
	.asciz	"server.chat_filter_insults"

l_.str.18:                              ; @.str.18
	.asciz	"mild"

l_.str.19:                              ; @.str.19
	.asciz	"strong"

l_.str.20:                              ; @.str.20
	.asciz	"severe"

l_.str.21:                              ; @.str.21
	.asciz	"Too many players are muted"

l_.str.22:                              ; @.str.22
	.asciz	"%s muted for %d minute%s"

l_.str.23:                              ; @.str.23
	.asciz	"%s isn't muted"

l_.str.24:                              ; @.str.24
	.asciz	"%s unmuted"

l_.str.25:                              ; @.str.25
	.space	1

l_.str.26:                              ; @.str.26
	.asciz	"s"

l_.str.27:                              ; @.str.27
	.asciz	"Links aren't allowed in this game"

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @chat_text_has_link.dots
_chat_text_has_link.dots:
	.long	l_.str.28
	.long	l_.str.29
	.long	l_.str.30
	.long	l_.str.31
	.long	l_.str.32
	.long	l_.str.33

	.section	__TEXT,__cstring,cstring_literals
l_.str.28:                              ; @.str.28
	.asciz	"(dot)"

l_.str.29:                              ; @.str.29
	.asciz	"[dot]"

l_.str.30:                              ; @.str.30
	.asciz	"{dot}"

l_.str.31:                              ; @.str.31
	.asciz	"(.)"

l_.str.32:                              ; @.str.32
	.asciz	"[.]"

l_.str.33:                              ; @.str.33
	.asciz	" dot "

l_.str.34:                              ; @.str.34
	.asciz	"://"

l_.str.35:                              ; @.str.35
	.asciz	"www."

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @chat_link_domain.domains
_chat_link_domain.domains:
	.long	l_.str.36
	.long	l_.str.37
	.long	l_.str.38
	.long	l_.str.39
	.long	l_.str.40
	.long	l_.str.41
	.long	l_.str.42
	.long	l_.str.43
	.long	l_.str.44
	.long	l_.str.45
	.long	l_.str.46
	.long	l_.str.47
	.long	l_.str.48
	.long	l_.str.49
	.long	l_.str.50
	.long	l_.str.51
	.long	l_.str.52
	.long	l_.str.53
	.long	l_.str.54
	.long	l_.str.55
	.long	l_.str.56
	.long	l_.str.57
	.long	l_.str.58
	.long	l_.str.59
	.long	l_.str.60
	.long	l_.str.61
	.long	l_.str.62
	.long	l_.str.63
	.long	l_.str.64
	.long	l_.str.65
	.long	l_.str.66
	.long	l_.str.67
	.long	l_.str.68
	.long	l_.str.69
	.long	l_.str.70
	.long	l_.str.71
	.long	l_.str.72
	.long	l_.str.73
	.long	l_.str.74
	.long	l_.str.75
	.long	l_.str.76
	.long	l_.str.77
	.long	l_.str.78
	.long	l_.str.79
	.long	l_.str.80
	.long	l_.str.81
	.long	l_.str.82
	.long	l_.str.83

	.section	__TEXT,__cstring,cstring_literals
l_.str.36:                              ; @.str.36
	.asciz	"com"

l_.str.37:                              ; @.str.37
	.asciz	"net"

l_.str.38:                              ; @.str.38
	.asciz	"org"

l_.str.39:                              ; @.str.39
	.asciz	"gg"

l_.str.40:                              ; @.str.40
	.asciz	"io"

l_.str.41:                              ; @.str.41
	.asciz	"tv"

l_.str.42:                              ; @.str.42
	.asciz	"uk"

l_.str.43:                              ; @.str.43
	.asciz	"ru"

l_.str.44:                              ; @.str.44
	.asciz	"de"

l_.str.45:                              ; @.str.45
	.asciz	"fr"

l_.str.46:                              ; @.str.46
	.asciz	"nl"

l_.str.47:                              ; @.str.47
	.asciz	"eu"

l_.str.48:                              ; @.str.48
	.asciz	"info"

l_.str.49:                              ; @.str.49
	.asciz	"biz"

l_.str.50:                              ; @.str.50
	.asciz	"xyz"

l_.str.51:                              ; @.str.51
	.asciz	"ly"

l_.str.52:                              ; @.str.52
	.asciz	"app"

l_.str.53:                              ; @.str.53
	.asciz	"dev"

l_.str.54:                              ; @.str.54
	.asciz	"cc"

l_.str.55:                              ; @.str.55
	.asciz	"ca"

l_.str.56:                              ; @.str.56
	.asciz	"au"

l_.str.57:                              ; @.str.57
	.asciz	"stream"

l_.str.58:                              ; @.str.58
	.asciz	"shop"

l_.str.59:                              ; @.str.59
	.asciz	"site"

l_.str.60:                              ; @.str.60
	.asciz	"online"

l_.str.61:                              ; @.str.61
	.asciz	"club"

l_.str.62:                              ; @.str.62
	.asciz	"gl"

l_.str.63:                              ; @.str.63
	.asciz	"ws"

l_.str.64:                              ; @.str.64
	.asciz	"cn"

l_.str.65:                              ; @.str.65
	.asciz	"jp"

l_.str.66:                              ; @.str.66
	.asciz	"kr"

l_.str.67:                              ; @.str.67
	.asciz	"br"

l_.str.68:                              ; @.str.68
	.asciz	"es"

l_.str.69:                              ; @.str.69
	.asciz	"pl"

l_.str.70:                              ; @.str.70
	.asciz	"se"

l_.str.71:                              ; @.str.71
	.asciz	"tk"

l_.str.72:                              ; @.str.72
	.asciz	"icu"

l_.str.73:                              ; @.str.73
	.asciz	"vip"

l_.str.74:                              ; @.str.74
	.asciz	"edu"

l_.str.75:                              ; @.str.75
	.asciz	"gov"

l_.str.76:                              ; @.str.76
	.asciz	"mil"

l_.str.77:                              ; @.str.77
	.asciz	"ai"

l_.str.78:                              ; @.str.78
	.asciz	"sh"

l_.str.79:                              ; @.str.79
	.asciz	"fm"

l_.str.80:                              ; @.str.80
	.asciz	"gd"

l_.str.81:                              ; @.str.81
	.asciz	"im"

l_.str.82:                              ; @.str.82
	.asciz	"st"

l_.str.83:                              ; @.str.83
	.asciz	"su"

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @chat_link_domain.words
_chat_link_domain.words:
	.long	l_.str.84
	.long	l_.str.85
	.long	l_.str.86
	.long	l_.str.87
	.long	l_.str.88
	.long	l_.str.89
	.long	l_.str.90
	.long	l_.str.91
	.long	l_.str.92
	.long	l_.str.93
	.long	l_.str.94
	.long	l_.str.95
	.long	l_.str.96
	.long	l_.str.97
	.long	l_.str.98
	.long	l_.str.99

	.section	__TEXT,__cstring,cstring_literals
l_.str.84:                              ; @.str.84
	.asciz	"me"

l_.str.85:                              ; @.str.85
	.asciz	"us"

l_.str.86:                              ; @.str.86
	.asciz	"to"

l_.str.87:                              ; @.str.87
	.asciz	"co"

l_.str.88:                              ; @.str.88
	.asciz	"be"

l_.str.89:                              ; @.str.89
	.asciz	"in"

l_.str.90:                              ; @.str.90
	.asciz	"is"

l_.str.91:                              ; @.str.91
	.asciz	"it"

l_.str.92:                              ; @.str.92
	.asciz	"fun"

l_.str.93:                              ; @.str.93
	.asciz	"top"

l_.str.94:                              ; @.str.94
	.asciz	"win"

l_.str.95:                              ; @.str.95
	.asciz	"pro"

l_.str.96:                              ; @.str.96
	.asciz	"lol"

l_.str.97:                              ; @.str.97
	.asciz	"live"

l_.str.98:                              ; @.str.98
	.asciz	"link"

l_.str.99:                              ; @.str.99
	.asciz	"int"

l_.str.100:                             ; @.str.100
	.asciz	"network.text_chat"

l_.str.101:                             ; @.str.101
	.asciz	"off"

l_.str.102:                             ; @.str.102
	.asciz	"links"

l_.str.103:                             ; @.str.103
	.asciz	"chat notice: %s"

l_.str.104:                             ; @.str.104
	.asciz	"chat%s: %s: %s"

l_.str.105:                             ; @.str.105
	.asciz	" (team)"

l_.str.106:                             ; @.str.106
	.asciz	" (vehicle)"

	.section	__DATA,__data
_chat_shown.shown:                      ; @chat_shown.shown
	.byte	1                               ; 0x1

	.p2align	2, 0x0                          ; @chat_shown.read_at
_chat_shown.read_at:
	.long	4294967295                      ; 0xffffffff

	.section	__TEXT,__cstring,cstring_literals
l_.str.107:                             ; @.str.107
	.asciz	"display.text_chat"

l_.str.111:                             ; @.str.111
	.asciz	"There is no vote you can vote in"

l_.str.112:                             ; @.str.112
	.asciz	"Only the host can mute players"

l_.str.113:                             ; @.str.113
	.asciz	"Say /mute <player> [minutes] or /unmute <player>"

l_.str.114:                             ; @.str.114
	.asciz	"No player's name begins with \"%s\""

l_.str.115:                             ; @.str.115
	.asciz	"More than one player's name begins with \"%s\""

l_.str.116:                             ; @.str.116
	.asciz	"You can't %s yourself"

l_.str.117:                             ; @.str.117
	.asciz	"mute"

l_.str.118:                             ; @.str.118
	.asciz	"unmute"

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @chat_keyboard_symbols
_chat_keyboard_symbols:
	.long	l_.str.122
	.long	l_.str.123
	.long	l_.str.124
	.long	l_.str.125

	.p2align	2, 0x0                          ; @chat_keyboard_letters
_chat_keyboard_letters:
	.long	l_.str.122
	.long	l_.str.126
	.long	l_.str.127
	.long	l_.str.128

	.section	__TEXT,__cstring,cstring_literals
l_.str.122:                             ; @.str.122
	.asciz	"1234567890"

l_.str.123:                             ; @.str.123
	.asciz	"!@#$%^&*()"

l_.str.124:                             ; @.str.124
	.asciz	"-_=+[]{};:"

l_.str.125:                             ; @.str.125
	.asciz	"\"'<>/\\?~,."

l_.str.126:                             ; @.str.126
	.asciz	"qwertyuiop"

l_.str.127:                             ; @.str.127
	.asciz	"asdfghjkl'"

l_.str.128:                             ; @.str.128
	.asciz	"zxcvbnm,.?"

.zerofill __DATA,__bss,_chat_style_white.white,1,0 ; @chat_style_white.white
	.section	__DATA,__data
	.p2align	2, 0x0                          ; @chat_style_white.read_at
_chat_style_white.read_at:
	.long	4294967295                      ; 0xffffffff

	.section	__TEXT,__cstring,cstring_literals
l_.str.129:                             ; @.str.129
	.asciz	"display.chat_style"

l_.str.130:                             ; @.str.130
	.asciz	"white"

	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @chat_draw_shadow.copies
_chat_draw_shadow.copies:
	.short	1                               ; 0x1
	.short	1                               ; 0x1
	.long	0x3ee66666                      ; float 0.449999988
	.short	2                               ; 0x2
	.short	2                               ; 0x2
	.long	0x3eb33333                      ; float 0.349999994
	.short	2                               ; 0x2
	.short	1                               ; 0x1
	.long	0x3e800000                      ; float 0.25
	.short	1                               ; 0x1
	.short	2                               ; 0x2
	.long	0x3e800000                      ; float 0.25
	.short	3                               ; 0x3
	.short	2                               ; 0x2
	.long	0x3df5c28f                      ; float 0.119999997
	.short	2                               ; 0x2
	.short	3                               ; 0x3
	.long	0x3df5c28f                      ; float 0.119999997
	.short	3                               ; 0x3
	.short	3                               ; 0x3
	.long	0x3dcccccd                      ; float 0.100000001

	.section	__TEXT,__literal16,16byte_literals
	.p2align	2, 0x0                          ; @__const.chat_keyboard_draw.color
l___const.chat_keyboard_draw.color:
	.long	0x3f800000                      ; float 1
	.long	0x3f800000                      ; float 1
	.long	0x3f800000                      ; float 1
	.long	0x3f800000                      ; float 1

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @chat_keyboard_draw.wide
_chat_keyboard_draw.wide:
	.long	l_.str.131
	.long	l_.str.132
	.long	l_.str.133
	.long	l_.str.134
	.long	l_.str.135

	.section	__TEXT,__ustring
	.p2align	1, 0x0                          ; @.str.131
l_.str.131:
	.short	65                              ; 0x41
	.short	97                              ; 0x61
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.132
l_.str.132:
	.short	35                              ; 0x23
	.short	43                              ; 0x2b
	.short	61                              ; 0x3d
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.133
l_.str.133:
	.short	115                             ; 0x73
	.short	112                             ; 0x70
	.short	97                              ; 0x61
	.short	99                              ; 0x63
	.short	101                             ; 0x65
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.134
l_.str.134:
	.short	68                              ; 0x44
	.short	69                              ; 0x45
	.short	76                              ; 0x4c
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.135
l_.str.135:
	.short	83                              ; 0x53
	.short	69                              ; 0x45
	.short	78                              ; 0x4e
	.short	68                              ; 0x44
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.136
l_.str.136:
	.short	65                              ; 0x41
	.short	66                              ; 0x42
	.short	67                              ; 0x43
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.137
l_.str.137:
	.short	32                              ; 0x20
	.short	40                              ; 0x28
	.short	116                             ; 0x74
	.short	101                             ; 0x65
	.short	97                              ; 0x61
	.short	109                             ; 0x6d
	.short	41                              ; 0x29
	.short	58                              ; 0x3a
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.138
l_.str.138:
	.short	32                              ; 0x20
	.short	40                              ; 0x28
	.short	118                             ; 0x76
	.short	101                             ; 0x65
	.short	104                             ; 0x68
	.short	105                             ; 0x69
	.short	99                              ; 0x63
	.short	108                             ; 0x6c
	.short	101                             ; 0x65
	.short	41                              ; 0x29
	.short	58                              ; 0x3a
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.139
l_.str.139:
	.short	58                              ; 0x3a
	.short	0                               ; 0x0

.subsections_via_symbols
