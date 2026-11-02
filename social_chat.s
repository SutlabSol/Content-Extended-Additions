	.watchos_version_min 2, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_social_chat_replaces_upstream  ; -- Begin function social_chat_replaces_upstream
	.p2align	4
_social_chat_replaces_upstream:         ; @social_chat_replaces_upstream
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	adrp	x19, _social_chat_replaces_upstream.read_at@PAGE
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	ldr	w20, [x19, _social_chat_replaces_upstream.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w20, w0
	b.ne	LBB0_2
; %bb.1:
	adrp	x8, _social_chat_replaces_upstream.on@PAGE
	ldrb	w0, [x8, _social_chat_replaces_upstream.on@PAGEOFF]
	b	LBB0_3
LBB0_2:
	bl	_config_changes
	str	w0, [x19, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x8, _social_chat_replaces_upstream.on@PAGE
	cset	w0, ne
	strb	w0, [x8, _social_chat_replaces_upstream.on@PAGEOFF]
LBB0_3:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_setting
_social_chat_setting:                   ; @social_chat_setting
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	ldr	w22, [x1]
	mov	x21, x0
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	x19, x2
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	mov	x20, x1
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB1_2
; %bb.1:
	ldrb	w0, [x19]
	b	LBB1_3
LBB1_2:
	bl	_config_changes
	str	w0, [x20]
	mov	x0, x21
	bl	_config_boolean
	cmp	w0, #0
	cset	w0, ne
	strb	w0, [x19]
LBB1_3:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.globl	_social_chat_notice_text        ; -- Begin function social_chat_notice_text
	.p2align	4
_social_chat_notice_text:               ; @social_chat_notice_text
; %bb.0:
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	x19, x0
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	cbz	w19, LBB2_24
; %bb.1:
	ldrb	w8, [x19]
	cbz	w8, LBB2_24
; %bb.2:
	bl	_system_milliseconds
Lloh2:
	adrp	x10, _social_chat@PAGE+36864
Lloh3:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB2_4
; %bb.3:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB2_4:
	mov	w9, #384                        ; =0x180
Lloh4:
	adrp	x22, _social_chat@PAGE
Lloh5:
	add	x22, x22, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x22
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB2_6
; %bb.5:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB2_6:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB2_8
; %bb.7:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB2_8:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB2_11
; %bb.9:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB2_11
; %bb.10:
Lloh6:
	adrp	x8, _social_chat@PAGE+36968
Lloh7:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB2_11:
	ldrb	w10, [x19]
	add	x8, x20, #66
	cbz	w10, LBB2_22
; %bb.12:
	mov	w9, wzr
	.p2align	4, , 8
LBB2_13:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_16 Depth 2
	tbnz	w10, #7, LBB2_16
; %bb.14:                               ;   in Loop: Header=BB2_13 Depth=1
	add	x19, x19, #1
	and	w11, w10, #0xff
	cmp	w11, #32
	b.hs	LBB2_17
; %bb.15:                               ;   in Loop: Header=BB2_13 Depth=1
	mov	w10, #32                        ; =0x20
	b	LBB2_20
	.p2align	4, , 8
LBB2_16:                                ;   Parent Loop BB2_13 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w19, w19, #1
	ldrsb	w10, [x19]
	cmn	w10, #64
	b.lt	LBB2_16
	b	LBB2_19
	.p2align	4, , 8
LBB2_17:                                ;   in Loop: Header=BB2_13 Depth=1
	cmp	w11, #127
	b.eq	LBB2_19
; %bb.18:                               ;   in Loop: Header=BB2_13 Depth=1
	cmp	w11, #124
	b.ne	LBB2_20
	.p2align	4, , 8
LBB2_19:                                ;   in Loop: Header=BB2_13 Depth=1
	mov	w10, #63                        ; =0x3f
LBB2_20:                                ;   in Loop: Header=BB2_13 Depth=1
	strb	w10, [x8, w9, sxtw]
	add	w11, w9, #1
	ldrb	w10, [x19]
	cbz	w10, LBB2_23
; %bb.21:                               ;   in Loop: Header=BB2_13 Depth=1
	cmp	w9, #202
	mov	w9, w11
	b.lo	LBB2_13
	b	LBB2_23
LBB2_22:
	mov	w11, wzr
LBB2_23:
	mov	w9, #1                          ; =0x1
	mov	w10, #196608                    ; =0x30000
Lloh8:
	adrp	x1, l_.str.1@PAGE
Lloh9:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	w0, #3                          ; =0x3
	strb	wzr, [x8, w11, sxtw]
	strb	w9, [x20, #374]
	str	w10, [x20, #368]
	str	w8, [sp]
	bl	_error
LBB2_24:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
                                        ; -- End function
	.globl	_social_chat_upstream_line      ; -- Begin function social_chat_upstream_line
	.p2align	4
_social_chat_upstream_line:             ; @social_chat_upstream_line
; %bb.0:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	adrp	x8, _social_chat@PAGE+43898
	cmp	w2, #0
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	mov	x22, x3
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	mov	w20, w1
	ldrsh	w8, [x8, _social_chat@PAGEOFF+43898]
	mov	x19, x0
	cset	w21, ne
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	cmp	w8, #1
	b.lt	LBB3_9
; %bb.1:
	mov	w9, wzr
	mov	w10, #66                        ; =0x42
	mov	w11, #39674                     ; =0x9afa
Lloh10:
	adrp	x12, _social_chat@PAGE+39676
Lloh11:
	add	x12, x12, _social_chat@PAGEOFF+39676
Lloh12:
	adrp	x13, _social_chat@PAGE
Lloh13:
	add	x13, x13, _social_chat@PAGEOFF
	b	LBB3_4
	.p2align	4, , 8
LBB3_2:                                 ;   in Loop: Header=BB3_4 Depth=1
	ldrh	w14, [x14]
	cbz	w14, LBB3_11
LBB3_3:                                 ;   in Loop: Header=BB3_4 Depth=1
	add	w9, w9, #1
	add	w12, w12, #66
	cmp	w9, w8
	b.eq	LBB3_9
LBB3_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_6 Depth 2
	smaddl	x14, w9, w10, x13
	ldrh	w16, [x14, x11]
	mov	x14, x19
	cbz	w16, LBB3_2
; %bb.5:                                ;   in Loop: Header=BB3_4 Depth=1
	mov	x15, x12
	mov	x14, x19
	.p2align	4, , 8
LBB3_6:                                 ;   Parent Loop BB3_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrh	w17, [x14], #2
	cbz	w17, LBB3_3
; %bb.7:                                ;   in Loop: Header=BB3_6 Depth=2
	sub	w0, w16, #65
	orr	w1, w16, #0x20
	cmp	w0, #26
	sub	w0, w17, #65
	csel	w16, w1, w16, lo
	orr	w1, w17, #0x20
	cmp	w0, #26
	csel	w17, w1, w17, lo
	cmp	w16, w17
	b.ne	LBB3_3
; %bb.8:                                ;   in Loop: Header=BB3_6 Depth=2
	ldrh	w16, [x15]
	add	w15, w15, #2
	cbnz	w16, LBB3_6
	b	LBB3_2
LBB3_9:
	mov	x0, x19
	mov	w1, w21
	mov	x2, x22
	mov	w3, wzr
	bl	_social_chat_same_line
	mov	x23, x0
	cbz	w23, LBB3_12
LBB3_10:
	ldrb	w8, [x23, #372]
	orr	w8, w8, #0x1
	strb	w8, [x23, #372]
LBB3_11:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
LBB3_12:
	bl	_system_milliseconds
Lloh14:
	adrp	x10, _social_chat@PAGE+36864
Lloh15:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w24, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB3_14
; %bb.13:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB3_14:
	mov	w9, #384                        ; =0x180
Lloh16:
	adrp	x25, _social_chat@PAGE
Lloh17:
	add	x25, x25, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x23, w8, w9, x25
	mov	w2, #384                        ; =0x180
	mov	x0, x23
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w24, [x23, #380]
	ldrh	w8, [x25, x8]
	cbz	w8, LBB3_16
; %bb.15:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB3_16:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB3_18
; %bb.17:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB3_18:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB3_21
; %bb.19:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB3_21
; %bb.20:
Lloh18:
	adrp	x8, _social_chat@PAGE+36968
Lloh19:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB3_21:
	mov	x0, x23
	mov	x1, x19
	mov	w2, #32                         ; =0x20
	bl	_ustrncpy
	ldrb	w10, [x22]
	add	x8, x23, #66
	cbz	w10, LBB3_32
; %bb.22:
	mov	w9, wzr
	.p2align	4, , 8
LBB3_23:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_26 Depth 2
	tbnz	w10, #7, LBB3_26
; %bb.24:                               ;   in Loop: Header=BB3_23 Depth=1
	add	x22, x22, #1
	and	w11, w10, #0xff
	cmp	w11, #32
	b.hs	LBB3_27
; %bb.25:                               ;   in Loop: Header=BB3_23 Depth=1
	mov	w10, #32                        ; =0x20
	b	LBB3_30
	.p2align	4, , 8
LBB3_26:                                ;   Parent Loop BB3_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w22, w22, #1
	ldrsb	w10, [x22]
	cmn	w10, #64
	b.lt	LBB3_26
	b	LBB3_29
	.p2align	4, , 8
LBB3_27:                                ;   in Loop: Header=BB3_23 Depth=1
	cmp	w11, #127
	b.eq	LBB3_29
; %bb.28:                               ;   in Loop: Header=BB3_23 Depth=1
	cmp	w11, #124
	b.ne	LBB3_30
	.p2align	4, , 8
LBB3_29:                                ;   in Loop: Header=BB3_23 Depth=1
	mov	w10, #63                        ; =0x3f
LBB3_30:                                ;   in Loop: Header=BB3_23 Depth=1
	strb	w10, [x8, w9, sxtw]
	add	w11, w9, #1
	ldrb	w10, [x22]
	cbz	w10, LBB3_33
; %bb.31:                               ;   in Loop: Header=BB3_23 Depth=1
	cmp	w9, #202
	mov	w9, w11
	b.lo	LBB3_23
	b	LBB3_33
LBB3_32:
	mov	w11, wzr
LBB3_33:
	adrp	x9, _social_chat@PAGE+39670
	strb	wzr, [x8, w11, sxtw]
	cmp	w20, #1
	mov	w10, #2                         ; =0x2
	strh	w21, [x23, #368]
	ldrsh	w8, [x9, _social_chat@PAGEOFF+39670]
	csel	w9, w10, wzr, eq
	cmp	w20, #0
	csinc	w9, w9, wzr, ne
	cmp	w8, #1
	strh	w9, [x23, #370]
	b.lt	LBB3_10
; %bb.34:
	mov	w9, wzr
	mov	w10, #84                        ; =0x54
	mov	w11, #36982                     ; =0x9076
Lloh20:
	adrp	x12, _social_chat@PAGE+37000
Lloh21:
	add	x12, x12, _social_chat@PAGEOFF+37000
	b	LBB3_37
	.p2align	4, , 8
LBB3_35:                                ;   in Loop: Header=BB3_37 Depth=1
	ldrh	w13, [x13]
	cbz	w13, LBB3_43
LBB3_36:                                ;   in Loop: Header=BB3_37 Depth=1
	add	w9, w9, #1
	add	w12, w12, #84
	cmp	w9, w8
	b.eq	LBB3_10
LBB3_37:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_40 Depth 2
	smaddl	x13, w9, w10, x25
	add	x1, x13, x11
	ldrb	w13, [x1, #82]
	cbz	w13, LBB3_36
; %bb.38:                               ;   in Loop: Header=BB3_37 Depth=1
	ldrh	w15, [x1, #16]
	mov	x13, x19
	cbz	w15, LBB3_35
; %bb.39:                               ;   in Loop: Header=BB3_37 Depth=1
	mov	x14, x12
	mov	x13, x19
	.p2align	4, , 8
LBB3_40:                                ;   Parent Loop BB3_37 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrh	w16, [x13], #2
	cbz	w16, LBB3_36
; %bb.41:                               ;   in Loop: Header=BB3_40 Depth=2
	sub	w17, w15, #65
	orr	w0, w15, #0x20
	cmp	w17, #26
	sub	w17, w16, #65
	csel	w15, w0, w15, lo
	orr	w0, w16, #0x20
	cmp	w17, #26
	csel	w16, w0, w16, lo
	cmp	w15, w16
	b.ne	LBB3_36
; %bb.42:                               ;   in Loop: Header=BB3_40 Depth=2
	ldrh	w15, [x14]
	add	w14, w14, #2
	cbnz	w15, LBB3_40
	b	LBB3_35
LBB3_43:
	add	x0, x23, #270
	mov	w2, #15                         ; =0xf
	bl	_csstrncpy
	b	LBB3_10
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh20, Lloh21
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_same_line
_social_chat_same_line:                 ; @social_chat_same_line
; %bb.0:
	sub	sp, sp, #128
	stp	x28, x27, [sp, #32]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	mov	w23, w1
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	mov	w22, w3
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	stp	x0, x2, [sp, #16]               ; 16-byte Folded Spill
	bl	_system_milliseconds
	adrp	x27, _social_chat@PAGE+36864
	ldrsh	w8, [x27, _social_chat@PAGEOFF+36864]
	cmp	w8, #1
	b.lt	LBB4_15
; %bb.1:
	adrp	x8, _social_chat@PAGE+36866
	mov	w17, #43691                     ; =0xaaab
	mov	w21, w0
	mov	w25, wzr
	and	w24, w23, #0xffff
	mov	w9, #1                          ; =0x1
	ldrh	w8, [x8, _social_chat@PAGEOFF+36866]
	movk	w17, #10922, lsl #16
	mov	w28, #96                        ; =0x60
	mov	w26, #384                       ; =0x180
	mov	w20, #8000                      ; =0x1f40
Lloh22:
	adrp	x23, _social_chat@PAGE
Lloh23:
	add	x23, x23, _social_chat@PAGEOFF
	lsl	w0, w9, w22
	str	w0, [sp, #12]                   ; 4-byte Spill
	b	LBB4_4
LBB4_2:                                 ;   in Loop: Header=BB4_4 Depth=1
	ldr	w0, [sp, #12]                   ; 4-byte Reload
	mov	w17, #43691                     ; =0xaaab
	movk	w17, #10922, lsl #16
	.p2align	4, , 8
LBB4_3:                                 ;   in Loop: Header=BB4_4 Depth=1
	ldrsh	w9, [x27, _social_chat@PAGEOFF+36864]
	add	w25, w25, #1
	cmp	w9, w25, sxth
	b.le	LBB4_15
LBB4_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_11 Depth 2
	sxth	w9, w8
	sub	w9, w9, w25
	add	w9, w9, #96
	smull	x10, w9, w17
	lsr	x11, x10, #36
	add	x10, x11, x10, lsr #63
	msub	w19, w10, w28, w9
	smaddl	x22, w19, w26, x23
	ldr	w9, [x22, #380]
	sub	w10, w21, w9
	cmp	w9, #0
	ccmp	w10, w20, #2, ne
	b.hi	LBB4_15
; %bb.5:                                ;   in Loop: Header=BB4_4 Depth=1
	ldrb	w9, [x22, #374]
	cbnz	w9, LBB4_3
; %bb.6:                                ;   in Loop: Header=BB4_4 Depth=1
	ldrb	w9, [x22, #372]
	tst	w0, w9
	b.ne	LBB4_3
; %bb.7:                                ;   in Loop: Header=BB4_4 Depth=1
	ldrh	w9, [x22, #368]
	cmp	w9, w24
	b.ne	LBB4_3
; %bb.8:                                ;   in Loop: Header=BB4_4 Depth=1
	ldr	x1, [sp, #24]                   ; 8-byte Reload
	add	x0, x22, #66
	mov	w2, #63                         ; =0x3f
	bl	_csstrncmp
	adrp	x8, _social_chat@PAGE+36866
	ldrh	w8, [x8, _social_chat@PAGEOFF+36866]
	cbnz	w0, LBB4_2
; %bb.9:                                ;   in Loop: Header=BB4_4 Depth=1
	ldrh	w11, [x22]
	mov	w17, #43691                     ; =0xaaab
	ldr	x9, [sp, #16]                   ; 8-byte Reload
	movk	w17, #10922, lsl #16
	ldr	w0, [sp, #12]                   ; 4-byte Reload
	cbz	w11, LBB4_14
; %bb.10:                               ;   in Loop: Header=BB4_4 Depth=1
	madd	w9, w19, w26, w23
	add	w10, w9, #2
	ldr	x9, [sp, #16]                   ; 8-byte Reload
	.p2align	4, , 8
LBB4_11:                                ;   Parent Loop BB4_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrh	w12, [x9], #2
	cbz	w12, LBB4_3
; %bb.12:                               ;   in Loop: Header=BB4_11 Depth=2
	sub	w13, w11, #65
	orr	w14, w11, #0x20
	cmp	w13, #26
	sub	w13, w12, #65
	csel	w11, w14, w11, lo
	orr	w14, w12, #0x20
	cmp	w13, #26
	csel	w12, w14, w12, lo
	cmp	w11, w12
	b.ne	LBB4_3
; %bb.13:                               ;   in Loop: Header=BB4_11 Depth=2
	ldrh	w11, [x10]
	add	w10, w10, #2
	cbnz	w11, LBB4_11
LBB4_14:                                ;   in Loop: Header=BB4_4 Depth=1
	ldrh	w9, [x9]
	cbnz	w9, LBB4_3
	b	LBB4_16
LBB4_15:
	mov	x22, xzr
LBB4_16:
	mov	x0, x22
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.loh AdrpAdd	Lloh22, Lloh23
                                        ; -- End function
	.globl	_social_chat_upstream_notice    ; -- Begin function social_chat_upstream_notice
	.p2align	4
_social_chat_upstream_notice:           ; @social_chat_upstream_notice
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	x19, x0
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	bl	_system_milliseconds
Lloh24:
	adrp	x10, _social_chat@PAGE+36864
Lloh25:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB5_2
; %bb.1:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB5_2:
	mov	w9, #384                        ; =0x180
Lloh26:
	adrp	x22, _social_chat@PAGE
Lloh27:
	add	x22, x22, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x22
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB5_4
; %bb.3:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB5_4:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB5_6
; %bb.5:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB5_6:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB5_9
; %bb.7:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB5_9
; %bb.8:
Lloh28:
	adrp	x8, _social_chat@PAGE+36968
Lloh29:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB5_9:
	ldrb	w10, [x19]
	add	x8, x20, #66
	cbz	w10, LBB5_20
; %bb.10:
	mov	w9, wzr
	.p2align	4, , 8
LBB5_11:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_14 Depth 2
	tbnz	w10, #7, LBB5_14
; %bb.12:                               ;   in Loop: Header=BB5_11 Depth=1
	add	x19, x19, #1
	and	w11, w10, #0xff
	cmp	w11, #32
	b.hs	LBB5_15
; %bb.13:                               ;   in Loop: Header=BB5_11 Depth=1
	mov	w10, #32                        ; =0x20
	b	LBB5_18
	.p2align	4, , 8
LBB5_14:                                ;   Parent Loop BB5_11 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w19, w19, #1
	ldrsb	w10, [x19]
	cmn	w10, #64
	b.lt	LBB5_14
	b	LBB5_17
	.p2align	4, , 8
LBB5_15:                                ;   in Loop: Header=BB5_11 Depth=1
	cmp	w11, #127
	b.eq	LBB5_17
; %bb.16:                               ;   in Loop: Header=BB5_11 Depth=1
	cmp	w11, #124
	b.ne	LBB5_18
	.p2align	4, , 8
LBB5_17:                                ;   in Loop: Header=BB5_11 Depth=1
	mov	w10, #63                        ; =0x3f
LBB5_18:                                ;   in Loop: Header=BB5_11 Depth=1
	strb	w10, [x8, w9, sxtw]
	add	w11, w9, #1
	ldrb	w10, [x19]
	cbz	w10, LBB5_21
; %bb.19:                               ;   in Loop: Header=BB5_11 Depth=1
	cmp	w9, #202
	mov	w9, w11
	b.lo	LBB5_11
	b	LBB5_21
LBB5_20:
	mov	w11, wzr
LBB5_21:
	strb	wzr, [x8, w11, sxtw]
	mov	w9, #1                          ; =0x1
	ldrb	w8, [x20, #372]
	mov	w10, #3                         ; =0x3
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	strb	w9, [x20, #374]
	orr	w8, w8, #0x1
	strh	w10, [x20, #370]
	strb	w8, [x20, #372]
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh28, Lloh29
                                        ; -- End function
	.globl	_social_chat_unheard_set        ; -- Begin function social_chat_unheard_set
	.p2align	4
_social_chat_unheard_set:               ; @social_chat_unheard_set
; %bb.0:
	adrp	x8, _social_chat@PAGE+43898
	cmp	w1, #1
	strh	wzr, [x8, _social_chat@PAGEOFF+43898]
	b.lt	LBB6_6
; %bb.1:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	cmp	w1, #64
	mov	w9, #64                         ; =0x40
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	x19, x0
	mov	w8, wzr
	csel	w20, w1, w9, lo
	mov	w21, #66                        ; =0x42
Lloh30:
	adrp	x22, _social_chat@PAGE+39674
Lloh31:
	add	x22, x22, _social_chat@PAGEOFF+39674
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	b	LBB6_3
	.p2align	4, , 8
LBB6_2:                                 ;   in Loop: Header=BB6_3 Depth=1
	add	w19, w19, #64
	subs	w20, w20, #1
	b.eq	LBB6_5
LBB6_3:                                 ; =>This Inner Loop Header: Depth=1
	ldrh	w9, [x19]
	cbz	w9, LBB6_2
; %bb.4:                                ;   in Loop: Header=BB6_3 Depth=1
	sxth	x8, w8
	mov	x1, x19
	smaddl	x0, w8, w21, x22
	mov	w2, #32                         ; =0x20
	bl	_ustrncpy
	ldrsh	x8, [x22, #4224]
	smaddl	x9, w8, w21, x22
	add	w8, w8, #1
	strh	w8, [x22, #4224]
	strh	wzr, [x9, #64]
	b	LBB6_2
LBB6_5:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
LBB6_6:
	ret
	.loh AdrpAdd	Lloh30, Lloh31
                                        ; -- End function
	.globl	_social_chat_typing             ; -- Begin function social_chat_typing
	.p2align	4
_social_chat_typing:                    ; @social_chat_typing
; %bb.0:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w0, [x8, _social_chat@PAGEOFF+36868]
	ret
                                        ; -- End function
	.globl	_social_chat_keyboard_open      ; -- Begin function social_chat_keyboard_open
	.p2align	4
_social_chat_keyboard_open:             ; @social_chat_keyboard_open
; %bb.0:
	adrp	x8, _social_chat@PAGE+36868
	adrp	x9, _social_chat_keyboard@PAGE
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	ldrb	w9, [x9, _social_chat_keyboard@PAGEOFF]
	cmp	w8, #0
	ccmp	w9, #0, #4, ne
	cset	w0, ne
	ret
                                        ; -- End function
	.globl	_social_chat_system_keyboard    ; -- Begin function social_chat_system_keyboard
	.p2align	4
_social_chat_system_keyboard:           ; @social_chat_system_keyboard
; %bb.0:
	adrp	x8, _social_chat@PAGE+36868
Lloh32:
	adrp	x9, _social_chat_keyboard@PAGE
Lloh33:
	add	x9, x9, _social_chat_keyboard@PAGEOFF
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	ldrb	w10, [x9]
	ldrb	w9, [x9, #1]
	cmp	w8, #0
	ccmp	w10, #0, #4, ne
	ccmp	w9, #0, #4, ne
	b.ne	LBB9_2
; %bb.1:
	mov	w0, wzr
	ret
LBB9_2:
	adrp	x8, _social_chat@PAGE+36974
	ldrb	w8, [x8, _social_chat@PAGEOFF+36974]
	cmp	w8, #0
	cset	w0, eq
	ret
	.loh AdrpAdd	Lloh32, Lloh33
                                        ; -- End function
	.globl	_social_chat_controller         ; -- Begin function social_chat_controller
	.p2align	4
_social_chat_controller:                ; @social_chat_controller
; %bb.0:
	adrp	x8, _social_chat_keyboard@PAGE
Lloh34:
	adrp	x9, _social_chat@PAGE+36868
Lloh35:
	add	x9, x9, _social_chat@PAGEOFF+36868
	ldrb	w8, [x8, _social_chat_keyboard@PAGEOFF]
	ldrb	w10, [x9]
	cmp	w8, #0
	ldrh	w8, [x9, #4]
	ccmp	w10, #0, #4, ne
	csinv	w8, w8, wzr, ne
	sxth	w0, w8
	ret
	.loh AdrpAdd	Lloh34, Lloh35
                                        ; -- End function
	.globl	_social_chat_open               ; -- Begin function social_chat_open
	.p2align	4
_social_chat_open:                      ; @social_chat_open
; %bb.0:
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	adrp	x21, _social_chat_replaces_upstream.read_at@PAGE
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	w19, w1
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	ldr	w22, [x21, _social_chat_replaces_upstream.read_at@PAGEOFF]
	mov	w20, w0
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB11_2
; %bb.1:
	adrp	x8, _social_chat_replaces_upstream.on@PAGE
	ldrb	w8, [x8, _social_chat_replaces_upstream.on@PAGEOFF]
	cbnz	w8, LBB11_3
	b	LBB11_26
LBB11_2:
	bl	_config_changes
	str	w0, [x21, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh36:
	adrp	x0, l_.str@PAGE
Lloh37:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_replaces_upstream.on@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_replaces_upstream.on@PAGEOFF]
	cbz	w8, LBB11_26
LBB11_3:
	adrp	x21, _social_chat_shown.read_at@PAGE
	ldr	w22, [x21, _social_chat_shown.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB11_5
; %bb.4:
	adrp	x8, _social_chat_shown.shown@PAGE
	ldrb	w8, [x8, _social_chat_shown.shown@PAGEOFF]
	cmp	w8, #0
	cset	w8, ne
	cbnz	w8, LBB11_6
	b	LBB11_26
LBB11_5:
	bl	_config_changes
	str	w0, [x21, _social_chat_shown.read_at@PAGEOFF]
Lloh38:
	adrp	x0, l_.str.3@PAGE
Lloh39:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_shown.shown@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_shown.shown@PAGEOFF]
	cbz	w8, LBB11_26
LBB11_6:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbnz	w8, LBB11_26
; %bb.7:
	mov	w8, #1                          ; =0x1
Lloh40:
	adrp	x21, _social_chat@PAGE+36868
Lloh41:
	add	x21, x21, _social_chat@PAGEOFF+36868
	strb	w8, [x21]
	bl	_system_milliseconds
	str	w0, [x21, #8]
	cbz	w20, LBB11_16
; %bb.8:
	cmp	w20, #2
	b.eq	LBB11_12
; %bb.9:
	cmp	w20, #1
	b.ne	LBB11_17
; %bb.10:
	bl	_social_chat_team
	cmn	w0, #1
	b.eq	LBB11_16
; %bb.11:
	mov	w20, #1                         ; =0x1
	b	LBB11_17
LBB11_12:
	adrp	x20, _social_chat_private_heard.read_at@PAGE
	ldr	w21, [x20, _social_chat_private_heard.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w21, w0
	b.ne	LBB11_15
; %bb.13:
	adrp	x8, _social_chat_private_heard.heard@PAGE
	ldrb	w8, [x8, _social_chat_private_heard.heard@PAGEOFF]
	cbz	w8, LBB11_16
LBB11_14:
	mov	w20, #2                         ; =0x2
	b	LBB11_17
LBB11_15:
	bl	_config_changes
	str	w0, [x20, _social_chat_private_heard.read_at@PAGEOFF]
Lloh42:
	adrp	x0, l_.str.4@PAGE
Lloh43:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_private_heard.heard@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_private_heard.heard@PAGEOFF]
	cbnz	w8, LBB11_14
LBB11_16:
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	mov	w8, #3                          ; =0x3
	csel	w20, w8, wzr, hi
LBB11_17:
Lloh44:
	adrp	x21, _social_chat@PAGE+36870
Lloh45:
	add	x21, x21, _social_chat@PAGEOFF+36870
Lloh46:
	adrp	x0, _social_chat_keyboard@PAGE
Lloh47:
	add	x0, x0, _social_chat_keyboard@PAGEOFF
	mov	w1, wzr
	mov	w2, #32                         ; =0x20
	strh	w20, [x21]
	strh	w19, [x21, #2]
	strb	wzr, [x21, #10]
	strh	wzr, [x21, #74]
	strb	wzr, [x21, #98]
	strh	wzr, [x21, #102]
	strb	wzr, [x21, #104]
	bl	_csmemset
	cmn	w19, #1
	b.eq	LBB11_22
; %bb.18:
	adrp	x8, _social_chat_keyboard@PAGE
	mov	w20, #1                         ; =0x1
	strb	w20, [x8, _social_chat_keyboard@PAGEOFF]
	cbz	w19, LBB11_20
; %bb.19:
	mov	w8, wzr
	b	LBB11_21
LBB11_20:
	bl	_halo_system_keyboard
	cmp	w0, #0
	cset	w8, ne
LBB11_21:
Lloh48:
	adrp	x22, _social_chat_keyboard@PAGE+1
Lloh49:
	add	x22, x22, _social_chat_keyboard@PAGEOFF+1
	mov	w0, w19
	strb	w8, [x22]
	sturh	w20, [x22, #1]
	bl	_halo_chat_pad_buttons_for_port
	stur	w0, [x22, #11]
	.p2align	4, , 8
LBB11_22:                               ; =>This Inner Loop Header: Depth=1
	add	x0, sp, #12
	bl	_input_get_key
	cbnz	w0, LBB11_22
; %bb.23:
	bl	_system_milliseconds
	ldrh	w8, [x21]
	mov	w9, #9394                       ; =0x24b2
	str	w0, [x21, x9]
	cmp	w8, #2
	b.ne	LBB11_26
; %bb.24:
Lloh50:
	adrp	x8, _social_chat@PAGE+39670
Lloh51:
	add	x8, x8, _social_chat@PAGEOFF+39670
	ldrsh	w9, [x8, #2]
	ldrh	w8, [x8]
	sxth	w10, w8
	cmp	w9, w10
	ccmp	w9, #0, #8, lt
	ccmp	w10, #0, #4, mi
	b.le	LBB11_26
; %bb.25:
	add	w9, w8, w9
	sdiv	w10, w9, w8
	msub	w8, w10, w8, w9
	adrp	x9, _social_chat@PAGE+39672
	strh	w8, [x9, _social_chat@PAGEOFF+39672]
LBB11_26:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh36, Lloh37
	.loh AdrpAdd	Lloh38, Lloh39
	.loh AdrpAdd	Lloh40, Lloh41
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpAdd	Lloh46, Lloh47
	.loh AdrpAdd	Lloh44, Lloh45
	.loh AdrpAdd	Lloh48, Lloh49
	.loh AdrpAdd	Lloh50, Lloh51
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_channel_usable
_social_chat_channel_usable:            ; @social_chat_channel_usable
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	cbz	w0, LBB12_7
; %bb.1:
	cmp	w0, #2
	b.eq	LBB12_5
; %bb.2:
	cmp	w0, #1
	b.ne	LBB12_8
; %bb.3:
	bl	_social_chat_team
	cmn	w0, #1
	b.eq	LBB12_7
; %bb.4:
	mov	w0, #1                          ; =0x1
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB12_5:
Lloh52:
	adrp	x0, l_.str.4@PAGE
Lloh53:
	add	x0, x0, l_.str.4@PAGEOFF
Lloh54:
	adrp	x1, _social_chat_private_heard.read_at@PAGE
Lloh55:
	add	x1, x1, _social_chat_private_heard.read_at@PAGEOFF
Lloh56:
	adrp	x2, _social_chat_private_heard.heard@PAGE
Lloh57:
	add	x2, x2, _social_chat_private_heard.heard@PAGEOFF
	bl	_social_chat_setting
	cbz	w0, LBB12_7
; %bb.6:
	mov	w0, #2                          ; =0x2
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB12_7:
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	mov	w8, #3                          ; =0x3
	csel	w0, w8, wzr, hi
LBB12_8:
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh56, Lloh57
	.loh AdrpAdd	Lloh54, Lloh55
	.loh AdrpAdd	Lloh52, Lloh53
                                        ; -- End function
	.globl	_social_chat_open_private       ; -- Begin function social_chat_open_private
	.p2align	4
_social_chat_open_private:              ; @social_chat_open_private
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	adrp	x21, _social_chat_replaces_upstream.read_at@PAGE
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	mov	x20, x1
	mov	x19, x0
	ldr	w22, [x21, _social_chat_replaces_upstream.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB13_2
; %bb.1:
	adrp	x8, _social_chat_replaces_upstream.on@PAGE
	ldrb	w8, [x8, _social_chat_replaces_upstream.on@PAGEOFF]
	cbnz	w8, LBB13_3
	b	LBB13_16
LBB13_2:
	bl	_config_changes
	str	w0, [x21, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh58:
	adrp	x0, l_.str@PAGE
Lloh59:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_replaces_upstream.on@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_replaces_upstream.on@PAGEOFF]
	cbz	w8, LBB13_16
LBB13_3:
	adrp	x21, _social_chat_shown.read_at@PAGE
	ldr	w22, [x21, _social_chat_shown.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB13_5
; %bb.4:
	adrp	x8, _social_chat_shown.shown@PAGE
	ldrb	w8, [x8, _social_chat_shown.shown@PAGEOFF]
	cbnz	w8, LBB13_6
	b	LBB13_16
LBB13_5:
	bl	_config_changes
	str	w0, [x21, _social_chat_shown.read_at@PAGEOFF]
Lloh60:
	adrp	x0, l_.str.3@PAGE
Lloh61:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x8, _social_chat_shown.shown@PAGE
	cset	w9, ne
	strb	w9, [x8, _social_chat_shown.shown@PAGEOFF]
	cbz	w0, LBB13_16
LBB13_6:
	adrp	x21, _social_chat_private_heard.read_at@PAGE
	ldr	w22, [x21, _social_chat_private_heard.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB13_8
; %bb.7:
	adrp	x8, _social_chat_private_heard.heard@PAGE
	ldrb	w8, [x8, _social_chat_private_heard.heard@PAGEOFF]
	cbnz	w8, LBB13_9
	b	LBB13_16
LBB13_8:
	bl	_config_changes
	str	w0, [x21, _social_chat_private_heard.read_at@PAGEOFF]
Lloh62:
	adrp	x0, l_.str.4@PAGE
Lloh63:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_private_heard.heard@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_private_heard.heard@PAGEOFF]
	cbz	w8, LBB13_16
LBB13_9:
	mov	x0, x19
	mov	x1, x20
	mov	w2, wzr
	bl	_social_chat_peer_note
	adrp	x22, _social_chat@PAGE+39670
	ldrsh	w8, [x22, _social_chat@PAGEOFF+39670]
	cmp	w8, #1
	b.lt	LBB13_16
; %bb.10:
	mov	w21, wzr
Lloh64:
	adrp	x20, _social_chat@PAGE+36982
Lloh65:
	add	x20, x20, _social_chat@PAGEOFF+36982
	.p2align	4, , 8
LBB13_11:                               ; =>This Inner Loop Header: Depth=1
	mov	x0, x20
	mov	x1, x19
	bl	_csstrcmp
	cbz	w0, LBB13_13
; %bb.12:                               ;   in Loop: Header=BB13_11 Depth=1
	ldrsh	w8, [x22, _social_chat@PAGEOFF+39670]
	add	w21, w21, #1
	add	w20, w20, #84
	cmp	w21, w8
	b.lt	LBB13_11
	b	LBB13_16
LBB13_13:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB13_15
; %bb.14:
	bl	_system_milliseconds
	adrp	x8, _social_chat@PAGE+36948
	orr	w9, w0, #0x1
	str	w9, [x8, _social_chat@PAGEOFF+36948]
LBB13_15:
Lloh66:
	adrp	x8, _social_chat_keyboard@PAGE
Lloh67:
	add	x8, x8, _social_chat_keyboard@PAGEOFF
Lloh68:
	adrp	x19, _social_chat@PAGE+36868
Lloh69:
	add	x19, x19, _social_chat@PAGEOFF+36868
	strh	wzr, [x8]
	strb	wzr, [x8, #20]
Lloh70:
	adrp	x8, _social_chat_player@PAGE
Lloh71:
	add	x8, x8, _social_chat_player@PAGEOFF
	strb	wzr, [x19]
	strh	wzr, [x19, #76]
	strb	wzr, [x8]
	strb	wzr, [x8, #110]
	strh	wzr, [x8, #176]
	bl	_halo_keyboard_typed_last
	cmp	w0, #0
	mov	w0, #2                          ; =0x2
	csetm	w1, ne
	mov	w20, #2                         ; =0x2
	bl	_social_chat_open
	strh	w20, [x19, #2]
	strh	w21, [x19, #2804]
LBB13_16:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh58, Lloh59
	.loh AdrpAdd	Lloh60, Lloh61
	.loh AdrpAdd	Lloh62, Lloh63
	.loh AdrpAdd	Lloh64, Lloh65
	.loh AdrpAdd	Lloh70, Lloh71
	.loh AdrpAdd	Lloh68, Lloh69
	.loh AdrpAdd	Lloh66, Lloh67
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_peer_note
_social_chat_peer_note:                 ; @social_chat_peer_note
; %bb.0:
	ldrb	w8, [x0]
	cbz	w8, LBB14_12
; %bb.1:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	mov	w19, w2
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	mov	x20, x1
	bl	_social_account_code
	mov	x1, x0
	mov	x0, x21
	bl	_csstrcmp
	cbz	w0, LBB14_11
; %bb.2:
	adrp	x26, _social_chat@PAGE+39670
Lloh72:
	adrp	x23, _social_chat@PAGE
Lloh73:
	add	x23, x23, _social_chat@PAGEOFF
	ldrsh	w8, [x26, _social_chat@PAGEOFF+39670]
	cmp	w8, #1
	b.lt	LBB14_9
; %bb.3:
Lloh74:
	adrp	x24, _social_chat@PAGE+36982
Lloh75:
	add	x24, x24, _social_chat@PAGEOFF+36982
	mov	w25, wzr
	mov	x22, x24
	.p2align	4, , 8
LBB14_4:                                ; =>This Inner Loop Header: Depth=1
	mov	x0, x22
	mov	x1, x21
	bl	_csstrcmp
	cbz	w0, LBB14_10
; %bb.5:                                ;   in Loop: Header=BB14_4 Depth=1
	ldrsh	w8, [x26, _social_chat@PAGEOFF+39670]
	add	w25, w25, #1
	add	w22, w22, #84
	cmp	w25, w8
	b.lt	LBB14_4
; %bb.6:
	cmp	w8, #32
	b.lt	LBB14_9
; %bb.7:
	ldrh	w8, [x24, #2690]
	mov	w9, #84                         ; =0x54
	cmp	w8, #0
	mov	w8, #1                          ; =0x1
	cset	w22, eq
	cinc	w8, w8, eq
	umaddl	x0, w22, w9, x24
	umaddl	x1, w8, w9, x24
	mov	w8, #2604                       ; =0xa2c
	mov	w9, #2520                       ; =0x9d8
	csel	w2, w9, w8, eq
	bl	_csmemmove
	ldrh	w8, [x24, #2688]
	ldrsh	w9, [x24, #2690]
	sub	w8, w8, #1
	cmp	w9, w22
	b.le	LBB14_9
; %bb.8:
	and	w9, w9, #0xffff
	adrp	x10, _social_chat@PAGE+39672
	sub	w9, w9, #1
	strh	w9, [x10, _social_chat@PAGEOFF+39672]
LBB14_9:
	mov	w9, #84                         ; =0x54
	sxth	x11, w8
	mov	w24, #36982                     ; =0x9076
	add	w10, w8, #1
	smaddl	x22, w11, w9, x23
	mov	w12, #39670                     ; =0x9af6
	mov	w1, wzr
	mov	w2, #84                         ; =0x54
	add	x0, x22, x24
	sxth	w25, w8
	strh	w10, [x23, x12]
	bl	_csmemset
	add	x0, x22, x24
	mov	x1, x21
	mov	w2, #15                         ; =0xf
	bl	_csstrncpy
LBB14_10:
	mov	w8, #84                         ; =0x54
	mov	x1, x20
	mov	w2, #32                         ; =0x20
	smaddl	x21, w25, w8, x23
	mov	w8, #36998                      ; =0x9086
	add	x0, x21, x8
	bl	_ustrncpy
	mov	w8, #37064                      ; =0x90c8
	ldrb	w9, [x21, x8]
	orr	w9, w9, w19
	cmp	w9, #0
	cset	w9, ne
	strb	w9, [x21, x8]
LBB14_11:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
LBB14_12:
	ret
	.loh AdrpAdd	Lloh72, Lloh73
	.loh AdrpAdd	Lloh74, Lloh75
                                        ; -- End function
	.globl	_social_chat_recent_players     ; -- Begin function social_chat_recent_players
	.p2align	4
_social_chat_recent_players:            ; @social_chat_recent_players
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	adrp	x8, _social_chat@PAGE+39670
	subs	w9, w2, #1
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	ldrh	w8, [x8, _social_chat@PAGEOFF+39670]
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	sub	w8, w8, #1
	sxth	w8, w8
	ccmp	w8, #0, #8, ge
	b.mi	LBB15_3
; %bb.1:
	and	w10, w8, #0xffff
	and	w9, w9, #0xffff
	mov	w11, #84                        ; =0x54
	cmp	w10, w9
Lloh76:
	adrp	x12, _social_chat@PAGE
Lloh77:
	add	x12, x12, _social_chat@PAGEOFF
	csel	w9, w10, w9, lo
	madd	w8, w8, w11, w12
	add	w22, w9, #1
	mov	w9, #36998                      ; =0x9086
	mov	x19, x1
	mov	x20, x0
	and	w23, w22, #0xffff
	add	w21, w8, w9
	.p2align	4, , 8
LBB15_2:                                ; =>This Inner Loop Header: Depth=1
	sub	w1, w21, #16
	mov	x0, x20
	mov	w2, #15                         ; =0xf
	bl	_csstrncpy
	add	w8, w20, #15
	mov	x0, x19
	mov	x1, x21
	mov	w2, #31                         ; =0x1f
	strb	wzr, [x8]
	bl	_ustrncpy
	add	w8, w19, #62
	add	w20, w20, #16
	sub	w23, w23, #1
	add	w19, w19, #64
	sub	w21, w21, #84
	strh	wzr, [x8]
	cbnz	w23, LBB15_2
	b	LBB15_4
LBB15_3:
	mov	w22, wzr
LBB15_4:
	sxth	w0, w22
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh76, Lloh77
                                        ; -- End function
	.globl	_social_chat_busy               ; -- Begin function social_chat_busy
	.p2align	4
_social_chat_busy:                      ; @social_chat_busy
; %bb.0:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB16_2
; %bb.1:
	mov	w0, #1                          ; =0x1
	ret
LBB16_2:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	adrp	x19, _social_chat@PAGE+36948
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	ldr	w8, [x19, _social_chat@PAGEOFF+36948]
	cbz	w8, LBB16_4
; %bb.3:
	bl	_system_milliseconds
	ldr	w8, [x19, _social_chat@PAGEOFF+36948]
	sub	w8, w0, w8
	cmp	w8, #300
	cset	w0, lt
	b	LBB16_5
LBB16_4:
	mov	w0, wzr
LBB16_5:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.globl	_social_chat_open_docked        ; -- Begin function social_chat_open_docked
	.p2align	4
_social_chat_open_docked:               ; @social_chat_open_docked
; %bb.0:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB17_2
; %bb.1:
	ret
LBB17_2:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	adrp	x8, _social_chat@PAGE+36870
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	w19, w0
	ldrsh	w20, [x8, _social_chat@PAGEOFF+36870]
	bl	_halo_keyboard_typed_last
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	mov	w8, w0
	mov	w0, w20
	cmp	w8, #0
	csinv	w1, w19, wzr, eq
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	_social_chat_open
                                        ; -- End function
	.globl	_social_chat_dock_pick_step     ; -- Begin function social_chat_dock_pick_step
	.p2align	4
_social_chat_dock_pick_step:            ; @social_chat_dock_pick_step
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	adrp	x20, _social_chat@PAGE+36964
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	ldr	w8, [x20, _social_chat@PAGEOFF+36964]
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	cbz	w8, LBB18_35
; %bb.1:
	mov	w19, w0
	bl	_system_milliseconds
	ldr	w8, [x20, _social_chat@PAGEOFF+36964]
	sub	w8, w0, w8
	cmp	w8, #999
	b.gt	LBB18_35
; %bb.2:
Lloh78:
	adrp	x8, _social_chat@PAGE+36954
Lloh79:
	add	x8, x8, _social_chat@PAGEOFF+36954
	ldrsh	w9, [x8, #4]
	ldrsh	w8, [x8]
	cmp	w9, w8
	b.le	LBB18_35
; %bb.3:
Lloh80:
	adrp	x8, _social_chat@PAGE+36868
Lloh81:
	add	x8, x8, _social_chat@PAGEOFF+36868
	mov	w0, wzr
	ldrsh	w9, [x8, #88]
	ldrsh	w10, [x8, #84]
	cmp	w9, w10
	b.le	LBB18_36
; %bb.4:
	ldrb	w8, [x8]
	cbnz	w8, LBB18_36
; %bb.5:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB18_7
; %bb.6:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w8, [x8, _social_chat@PAGEOFF+36970]
	add	w20, w8, w19
	b	LBB18_8
LBB18_7:
	adrp	x8, _social_chat@PAGE+36972
	cmn	w19, #1
	ldrh	w8, [x8, _social_chat@PAGEOFF+36972]
	csinv	w20, w8, wzr, le
LBB18_8:
	adrp	x22, _social_chat@PAGE+36864
	sxth	w9, w20
	ldrsh	w8, [x22, _social_chat@PAGEOFF+36864]
	cmp	w9, w8
	ccmn	w9, #1, #4, lt
	b.le	LBB18_29
; %bb.9:
	cmn	w19, #1
	mov	w9, #-1                         ; =0xffffffff
Lloh82:
	adrp	x23, _social_chat@PAGE
Lloh83:
	add	x23, x23, _social_chat@PAGEOFF
	cneg	w24, w9, le
	mov	w25, #66                        ; =0x42
	mov	w26, #43900                     ; =0xab7c
	adrp	x27, _social_chat_global_everywhere.read_at@PAGE
	.p2align	4, , 8
LBB18_10:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB18_16 Depth 2
                                        ;       Child Loop BB18_18 Depth 3
	mov	w9, #36866                      ; =0x9002
	mov	w10, #43691                     ; =0xaaab
	movk	w10, #10922, lsl #16
	mov	w12, #384                       ; =0x180
	ldrsh	w9, [x23, x9]
	sub	w9, w9, w20, uxth
	add	w9, w9, #96
	smull	x10, w9, w10
	lsr	x11, x10, #36
	add	x10, x11, x10, lsr #63
	mov	w11, #96                        ; =0x60
	msub	w9, w10, w11, w9
	mov	w10, #36868                     ; =0x9004
	mov	w11, #36870                     ; =0x9006
	ldrb	w10, [x23, x10]
	smaddl	x21, w9, w12, x23
	ldrh	w11, [x23, x11]
	cmp	w10, #0
	ldrb	w9, [x21, #374]
	ccmp	w11, #3, #0, ne
	cset	w28, eq
	cbnz	w9, LBB18_29
; %bb.11:                               ;   in Loop: Header=BB18_10 Depth=1
	ldrb	w9, [x21, #372]
	tbnz	w9, #1, LBB18_21
; %bb.12:                               ;   in Loop: Header=BB18_10 Depth=1
	adrp	x9, _social_chat@PAGE+46012
	ldrsh	w9, [x9, _social_chat@PAGEOFF+46012]
	cmp	w9, #1
	b.lt	LBB18_21
; %bb.13:                               ;   in Loop: Header=BB18_10 Depth=1
	mov	w10, wzr
Lloh84:
	adrp	x11, _social_chat@PAGE+43902
Lloh85:
	add	x11, x11, _social_chat@PAGEOFF+43902
	b	LBB18_16
	.p2align	4, , 8
LBB18_14:                               ;   in Loop: Header=BB18_16 Depth=2
	ldrh	w12, [x12]
	cbz	w12, LBB18_26
LBB18_15:                               ;   in Loop: Header=BB18_16 Depth=2
	add	w10, w10, #1
	add	w11, w11, #66
	cmp	w10, w9
	b.eq	LBB18_21
LBB18_16:                               ;   Parent Loop BB18_10 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB18_18 Depth 3
	smaddl	x12, w10, w25, x23
	ldrh	w14, [x12, x26]
	mov	x12, x21
	cbz	w14, LBB18_14
; %bb.17:                               ;   in Loop: Header=BB18_16 Depth=2
	mov	x13, x11
	mov	x12, x21
	.p2align	4, , 8
LBB18_18:                               ;   Parent Loop BB18_10 Depth=1
                                        ;     Parent Loop BB18_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldrh	w15, [x12], #2
	cbz	w15, LBB18_15
; %bb.19:                               ;   in Loop: Header=BB18_18 Depth=3
	sub	w16, w14, #65
	orr	w17, w14, #0x20
	cmp	w16, #26
	sub	w16, w15, #65
	csel	w14, w17, w14, lo
	orr	w17, w15, #0x20
	cmp	w16, #26
	csel	w15, w17, w15, lo
	cmp	w14, w15
	b.ne	LBB18_15
; %bb.20:                               ;   in Loop: Header=BB18_18 Depth=3
	ldrh	w14, [x13]
	add	w13, w13, #2
	cbnz	w14, LBB18_18
	b	LBB18_14
	.p2align	4, , 8
LBB18_21:                               ;   in Loop: Header=BB18_10 Depth=1
	ldr	w19, [x27, _social_chat_global_everywhere.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w19, w0
	b.ne	LBB18_23
; %bb.22:                               ;   in Loop: Header=BB18_10 Depth=1
	adrp	x8, _social_chat_global_everywhere.everywhere@PAGE
	ldrb	w8, [x8, _social_chat_global_everywhere.everywhere@PAGEOFF]
	b	LBB18_24
LBB18_23:                               ;   in Loop: Header=BB18_10 Depth=1
	bl	_config_changes
	str	w0, [x27, _social_chat_global_everywhere.read_at@PAGEOFF]
Lloh86:
	adrp	x0, l_.str.5@PAGE
Lloh87:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_global_everywhere.everywhere@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_global_everywhere.everywhere@PAGEOFF]
LBB18_24:                               ;   in Loop: Header=BB18_10 Depth=1
	cbnz	w8, LBB18_28
; %bb.25:                               ;   in Loop: Header=BB18_10 Depth=1
	ldrh	w8, [x21, #368]
	cmp	w8, #3
	ldrh	w8, [x22, _social_chat@PAGEOFF+36864]
	cset	w9, eq
	cmp	w28, w9
	b.eq	LBB18_29
LBB18_26:                               ;   in Loop: Header=BB18_10 Depth=1
	add	w9, w20, w24
	sxth	w20, w9
	tbnz	w9, #15, LBB18_29
; %bb.27:                               ;   in Loop: Header=BB18_10 Depth=1
	cmp	w20, w8, sxth
	b.lt	LBB18_10
	b	LBB18_29
LBB18_28:
	ldrh	w8, [x22, _social_chat@PAGEOFF+36864]
LBB18_29:
	sxth	w9, w20
	cmp	w9, w8, sxth
	b.ge	LBB18_35
; %bb.30:
	tbnz	w20, #15, LBB18_32
; %bb.31:
Lloh88:
	adrp	x8, _social_chat@PAGE+36968
Lloh89:
	add	x8, x8, _social_chat@PAGEOFF+36968
	mov	w0, #1                          ; =0x1
	ldrsh	w9, [x8, #4]
	strb	w0, [x8]
	strh	w20, [x8, #2]
	cmp	w9, w20, sxth
	b.le	LBB18_36
	b	LBB18_34
LBB18_32:
	adrp	x9, _social_chat@PAGE+36968
	ldrb	w8, [x9, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB18_35
; %bb.33:
	mov	w20, wzr
	strb	wzr, [x9, _social_chat@PAGEOFF+36968]
LBB18_34:
	adrp	x8, _social_chat@PAGE+36972
	mov	w0, #1                          ; =0x1
	strh	w20, [x8, _social_chat@PAGEOFF+36972]
	b	LBB18_36
LBB18_35:
	mov	w0, wzr
LBB18_36:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh78, Lloh79
	.loh AdrpAdd	Lloh80, Lloh81
	.loh AdrpAdd	Lloh82, Lloh83
	.loh AdrpAdd	Lloh84, Lloh85
	.loh AdrpAdd	Lloh86, Lloh87
	.loh AdrpAdd	Lloh88, Lloh89
                                        ; -- End function
	.globl	_social_chat_dock_pick_menu     ; -- Begin function social_chat_dock_pick_menu
	.p2align	4
_social_chat_dock_pick_menu:            ; @social_chat_dock_pick_menu
; %bb.0:
	sub	sp, sp, #144
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	adrp	x20, _social_chat@PAGE+36964
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
	ldr	w8, [x20, _social_chat@PAGEOFF+36964]
	cbz	w8, LBB19_11
; %bb.1:
	mov	w19, w0
	bl	_system_milliseconds
	ldr	w8, [x20, _social_chat@PAGEOFF+36964]
	sub	w8, w0, w8
	cmp	w8, #999
	b.gt	LBB19_11
; %bb.2:
Lloh90:
	adrp	x8, _social_chat@PAGE+36954
Lloh91:
	add	x8, x8, _social_chat@PAGEOFF+36954
	ldrsh	w9, [x8, #4]
	ldrsh	w8, [x8]
	cmp	w9, w8
	b.le	LBB19_11
; %bb.3:
Lloh92:
	adrp	x21, _social_chat@PAGE+36868
Lloh93:
	add	x21, x21, _social_chat@PAGEOFF+36868
	mov	w0, wzr
	ldrsh	w8, [x21, #88]
	ldrsh	w9, [x21, #84]
	cmp	w8, w9
	b.le	LBB19_12
; %bb.4:
	ldrb	w8, [x21]
	cbnz	w8, LBB19_12
; %bb.5:
	ldrb	w8, [x21, #100]
	cbz	w8, LBB19_12
; %bb.6:
	mov	w9, #36970                      ; =0x906a
Lloh94:
	adrp	x8, _social_chat@PAGE
Lloh95:
	add	x8, x8, _social_chat@PAGEOFF
	mov	w0, wzr
	ldrsh	w9, [x8, x9]
	tbnz	w9, #31, LBB19_12
; %bb.7:
	mov	w10, #36864                     ; =0x9000
	ldrsh	w10, [x8, x10]
	cmp	w9, w10
	b.ge	LBB19_12
; %bb.8:
	mov	w10, #36866                     ; =0x9002
	ldrsh	w10, [x8, x10]
	sub	w9, w10, w9
	mov	w10, #43691                     ; =0xaaab
	add	w9, w9, #96
	movk	w10, #10922, lsl #16
	smull	x10, w9, w10
	lsr	x11, x10, #36
	add	x10, x11, x10, lsr #63
	mov	w11, #96                        ; =0x60
	msub	w9, w10, w11, w9
	mov	w10, #384                       ; =0x180
	smaddl	x20, w9, w10, x8
	cbz	w20, LBB19_12
; %bb.9:
	ldrb	w8, [x20, #374]
	cbnz	w8, LBB19_11
; %bb.10:
	ldrb	w8, [x20, #373]
	cbz	w8, LBB19_13
LBB19_11:
	mov	w0, wzr
LBB19_12:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
LBB19_13:
	ldrh	w8, [x20]
	cbz	w8, LBB19_11
; %bb.14:
	ldrb	w8, [x20, #270]
	cbz	w8, LBB19_17
; %bb.15:
	bl	_social_account_code
	mov	x1, x0
	add	x0, x20, #270
	bl	_csstrcmp
	cbz	w0, LBB19_12
; %bb.16:
	ldrb	w8, [x20, #270]
	cbnz	w8, LBB19_19
LBB19_17:
	ldrb	w8, [x20, #372]
	tbz	w8, #0, LBB19_11
; %bb.18:
	mov	x0, x20
	bl	_social_chat_name_is_local
	tbnz	w0, #0, LBB19_11
LBB19_19:
	sub	x0, x29, #48
	add	x1, x20, #270
	mov	w2, #15                         ; =0xf
	bl	_csstrncpy
	add	x0, sp, #14
	mov	x1, x20
	mov	w2, #32                         ; =0x20
	sturb	wzr, [x29, #-33]
	bl	_ustrncpy
	ldrsh	w0, [x21, #2]
	mov	w1, w19
	strh	wzr, [sp, #78]
	bl	_social_chat_open
	ldrb	w8, [x21]
	cbz	w8, LBB19_11
; %bb.20:
Lloh96:
	adrp	x8, _social_chat@PAGE+36952
Lloh97:
	add	x8, x8, _social_chat@PAGEOFF+36952
	mov	w9, #1                          ; =0x1
	sub	x0, x29, #48
	add	x1, sp, #14
	ldrsh	w2, [x8]
	strb	w9, [x8, #22]
	bl	_social_chat_player_open
	adrp	x8, _social_chat_player@PAGE
	mov	w0, #1                          ; =0x1
	ldrb	w8, [x8, _social_chat_player@PAGEOFF]
	cbnz	w8, LBB19_12
; %bb.21:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB19_23
; %bb.22:
	bl	_system_milliseconds
	adrp	x8, _social_chat@PAGE+36948
	orr	w9, w0, #0x1
	str	w9, [x8, _social_chat@PAGEOFF+36948]
LBB19_23:
Lloh98:
	adrp	x8, _social_chat_keyboard@PAGE
Lloh99:
	add	x8, x8, _social_chat_keyboard@PAGEOFF
	mov	w0, wzr
	strb	wzr, [x21]
	strh	wzr, [x21, #76]
	strh	wzr, [x8]
	strb	wzr, [x8, #20]
Lloh100:
	adrp	x8, _social_chat_player@PAGE
Lloh101:
	add	x8, x8, _social_chat_player@PAGEOFF
	strb	wzr, [x8]
	strb	wzr, [x8, #110]
	strh	wzr, [x8, #176]
	b	LBB19_12
	.loh AdrpAdd	Lloh90, Lloh91
	.loh AdrpAdd	Lloh92, Lloh93
	.loh AdrpAdd	Lloh94, Lloh95
	.loh AdrpAdd	Lloh96, Lloh97
	.loh AdrpAdd	Lloh100, Lloh101
	.loh AdrpAdd	Lloh98, Lloh99
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_name_is_local
_social_chat_name_is_local:             ; @social_chat_name_is_local
; %bb.0:
	sub	sp, sp, #128
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	mov	x19, x0
	mov	w0, #-1                         ; =0xffffffff
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	bl	_local_player_get_next
	cmn	w0, #1
	b.eq	LBB20_11
; %bb.1:
Lloh102:
	adrp	x21, _player_data@GOTPAGE
	add	x8, sp, #14
	add	w22, w8, #2
Lloh103:
	ldr	w21, [x21, _player_data@GOTPAGEOFF]
	b	LBB20_4
	.p2align	4, , 8
LBB20_2:                                ;   in Loop: Header=BB20_4 Depth=1
	ldrh	w8, [x8]
	cbz	w8, LBB20_13
LBB20_3:                                ;   in Loop: Header=BB20_4 Depth=1
	mov	w0, w20
	bl	_local_player_get_next
	cmn	w0, #1
	b.eq	LBB20_11
LBB20_4:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB20_8 Depth 2
	sxth	w20, w0
	mov	w0, w20
	bl	_local_player_get_player_index
	cmn	w0, #1
	b.eq	LBB20_3
; %bb.5:                                ;   in Loop: Header=BB20_4 Depth=1
	mov	w1, w0
	ldr	w0, [x21]
	bl	_datum_try_and_get
	mov	x8, x0
	cbz	w8, LBB20_3
; %bb.6:                                ;   in Loop: Header=BB20_4 Depth=1
	add	x0, sp, #14
	add	x1, x8, #4
	mov	w2, #12                         ; =0xc
	bl	_ustrncpy
	ldrh	w10, [sp, #14]
	mov	x8, x19
	strh	wzr, [sp, #38]
	cbz	w10, LBB20_2
; %bb.7:                                ;   in Loop: Header=BB20_4 Depth=1
	mov	x9, x22
	mov	x8, x19
	.p2align	4, , 8
LBB20_8:                                ;   Parent Loop BB20_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrh	w11, [x8], #2
	cbz	w11, LBB20_3
; %bb.9:                                ;   in Loop: Header=BB20_8 Depth=2
	sub	w12, w10, #65
	orr	w13, w10, #0x20
	cmp	w12, #26
	sub	w12, w11, #65
	csel	w10, w13, w10, lo
	orr	w13, w11, #0x20
	cmp	w12, #26
	csel	w11, w13, w11, lo
	cmp	w10, w11
	b.ne	LBB20_3
; %bb.10:                               ;   in Loop: Header=BB20_8 Depth=2
	ldrh	w10, [x9]
	add	w9, w9, #2
	cbnz	w10, LBB20_8
	b	LBB20_2
LBB20_11:
	mov	w0, wzr
LBB20_12:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
LBB20_13:
	mov	w0, #1                          ; =0x1
	b	LBB20_12
	.loh AdrpLdrGot	Lloh102, Lloh103
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_player_open
_social_chat_player_open:               ; @social_chat_player_open
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	ldrb	w8, [x0]
	mov	x21, x0
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	w19, w2
	mov	x20, x1
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	cbz	w8, LBB21_2
; %bb.1:
	bl	_social_account_code
	mov	x1, x0
	mov	x0, x21
	bl	_csstrcmp
	cbnz	w0, LBB21_3
	b	LBB21_5
LBB21_2:
	ldrh	w8, [x20]
	cbz	w8, LBB21_5
LBB21_3:
Lloh104:
	adrp	x22, _social_chat_player@PAGE
Lloh105:
	add	x22, x22, _social_chat_player@PAGEOFF
	add	x0, x22, #84
	mov	w1, wzr
	mov	w2, #14                         ; =0xe
	bl	_csmemset
	add	x0, x22, #1
	mov	x1, x21
	mov	w2, #15                         ; =0xf
	bl	_csstrncpy
	add	x0, x22, #18
	mov	x1, x20
	mov	w2, #32                         ; =0x20
	strb	wzr, [x22, #16]
	bl	_ustrncpy
	mov	w8, #1                          ; =0x1
	strh	wzr, [x22, #82]
	strb	wzr, [x22, #102]
	strh	wzr, [x22, #100]
	strb	w8, [x22]
	str	wzr, [x22, #104]
	strh	w19, [x22, #108]
	strb	wzr, [x22, #110]
	bl	_social_chat_player_options
	ldrh	w8, [x22, #98]
	cbnz	w8, LBB21_5
; %bb.4:
	strb	wzr, [x22]
	strb	wzr, [x22, #110]
LBB21_5:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh104, Lloh105
                                        ; -- End function
	.globl	_social_chat_dock_pick_open     ; -- Begin function social_chat_dock_pick_open
	.p2align	4
_social_chat_dock_pick_open:            ; @social_chat_dock_pick_open
; %bb.0:
	sub	sp, sp, #144
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	adrp	x19, _social_chat@PAGE+36964
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
	ldr	w8, [x19, _social_chat@PAGEOFF+36964]
	cbz	w8, LBB22_10
; %bb.1:
	bl	_system_milliseconds
	ldr	w8, [x19, _social_chat@PAGEOFF+36964]
	sub	w8, w0, w8
	cmp	w8, #999
	b.gt	LBB22_10
; %bb.2:
Lloh106:
	adrp	x8, _social_chat@PAGE+36954
Lloh107:
	add	x8, x8, _social_chat@PAGEOFF+36954
	ldrsh	w9, [x8, #4]
	ldrsh	w8, [x8]
	cmp	w9, w8
	b.le	LBB22_10
; %bb.3:
Lloh108:
	adrp	x9, _social_chat@PAGE+36868
Lloh109:
	add	x9, x9, _social_chat@PAGEOFF+36868
	mov	w8, #65535                      ; =0xffff
	ldrsh	w10, [x9, #88]
	ldrsh	w11, [x9, #84]
	cmp	w10, w11
	b.le	LBB22_11
; %bb.4:
	ldrb	w10, [x9]
	cbnz	w10, LBB22_11
; %bb.5:
	ldrb	w9, [x9, #100]
	cbz	w9, LBB22_11
; %bb.6:
	mov	w8, #36970                      ; =0x906a
Lloh110:
	adrp	x9, _social_chat@PAGE
Lloh111:
	add	x9, x9, _social_chat@PAGEOFF
	ldrsh	w10, [x9, x8]
	mov	w8, #65535                      ; =0xffff
	tbnz	w10, #31, LBB22_11
; %bb.7:
	mov	w11, #36864                     ; =0x9000
	ldrsh	w11, [x9, x11]
	cmp	w10, w11
	b.ge	LBB22_11
; %bb.8:
	mov	w11, #36866                     ; =0x9002
	ldrsh	w11, [x9, x11]
	sub	w10, w11, w10
	mov	w11, #43691                     ; =0xaaab
	add	w10, w10, #96
	movk	w11, #10922, lsl #16
	smull	x11, w10, w11
	lsr	x12, x11, #36
	add	x11, x12, x11, lsr #63
	mov	w12, #96                        ; =0x60
	msub	w20, w11, w12, w10
	mov	w10, #384                       ; =0x180
	smaddl	x19, w20, w10, x9
	cbz	w19, LBB22_11
; %bb.9:
	ldrb	w8, [x19, #374]
	cbz	w8, LBB22_12
LBB22_10:
	mov	w8, #65535                      ; =0xffff
LBB22_11:
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	sxth	w0, w8
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
LBB22_12:
	ldrb	w8, [x19, #373]
	cbz	w8, LBB22_14
LBB22_13:
	bl	_social_account_code
	ldrb	w9, [x0]
	mov	w8, #2                          ; =0x2
	cmp	w9, #0
	csinv	w8, w8, wzr, ne
	b	LBB22_11
LBB22_14:
	ldrb	w8, [x19, #270]
	cbz	w8, LBB22_10
; %bb.15:
	bl	_social_account_code
	mov	x1, x0
	add	x0, x19, #270
	bl	_csstrcmp
	cbz	w0, LBB22_13
; %bb.16:
	ldrb	w8, [x19, #270]
	cbz	w8, LBB22_10
; %bb.17:
	ldrh	w12, [x19]
	cbz	w12, LBB22_27
; %bb.18:
	mov	w9, #384                        ; =0x180
Lloh112:
	adrp	x10, _social_chat@PAGE
Lloh113:
	add	x10, x10, _social_chat@PAGEOFF
	mov	w8, wzr
	madd	w9, w20, w9, w10
	add	x10, sp, #13
	mov	w11, #2048                      ; =0x800
	add	w9, w9, #2
LBB22_19:                               ; =>This Inner Loop Header: Depth=1
	cmp	w12, #127
	b.hi	LBB22_21
; %bb.20:                               ;   in Loop: Header=BB22_19 Depth=1
	add	w13, w8, #1
	strb	w12, [x10, w8, sxtw]
	mov	w8, w13
	b	LBB22_25
LBB22_21:                               ;   in Loop: Header=BB22_19 Depth=1
	cmp	w8, #97
	ccmp	w12, w11, #2, lt
	b.hs	LBB22_23
; %bb.22:                               ;   in Loop: Header=BB22_19 Depth=1
	lsr	w13, w12, #6
	add	x14, x10, w8, sxtw
	orr	w13, w13, #0xc0
	mov	w15, #128                       ; =0x80
	add	w16, w14, #1
	bfxil	w15, w12, #0, #6
	add	w8, w8, #2
	strb	w13, [x14]
	strb	w15, [x16]
	b	LBB22_25
LBB22_23:                               ;   in Loop: Header=BB22_19 Depth=1
	cmp	w8, #95
	b.gt	LBB22_28
; %bb.24:                               ;   in Loop: Header=BB22_19 Depth=1
	lsr	w13, w12, #12
	add	x14, x10, w8, sxtw
	orr	w13, w13, #0xe0
	mov	w15, #128                       ; =0x80
	add	w16, w14, #1
	mov	w17, #128                       ; =0x80
	add	w8, w8, #3
	bfxil	w15, w12, #6, #6
	strb	w13, [x14]
	add	w13, w14, #2
	bfxil	w17, w12, #0, #6
	strb	w15, [x16]
	strb	w17, [x13]
LBB22_25:                               ;   in Loop: Header=BB22_19 Depth=1
	ldrh	w12, [x9]
	cbz	w12, LBB22_28
; %bb.26:                               ;   in Loop: Header=BB22_19 Depth=1
	add	w9, w9, #2
	cmp	w8, #98
	b.lt	LBB22_19
	b	LBB22_28
LBB22_27:
	mov	w8, wzr
LBB22_28:
	add	x9, sp, #13
	add	x0, x19, #270
	add	x1, sp, #13
	strb	wzr, [x9, w8, sxtw]
	bl	_social_menu_player_open_next
	mov	w8, #3                          ; =0x3
	b	LBB22_11
	.loh AdrpAdd	Lloh106, Lloh107
	.loh AdrpAdd	Lloh108, Lloh109
	.loh AdrpAdd	Lloh110, Lloh111
	.loh AdrpAdd	Lloh112, Lloh113
                                        ; -- End function
	.globl	_social_chat_toggle_request     ; -- Begin function social_chat_toggle_request
	.p2align	4
_social_chat_toggle_request:            ; @social_chat_toggle_request
; %bb.0:
	adrp	x8, _social_chat@PAGE+36980
	add	w9, w0, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36980]
	ret
                                        ; -- End function
	.globl	_social_chat_pointer            ; -- Begin function social_chat_pointer
	.p2align	4
_social_chat_pointer:                   ; @social_chat_pointer
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	adrp	x8, _social_chat@PAGE+36868
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB24_83
; %bb.1:
	adrp	x8, _social_chat_player@PAGE
	ldrsb	w9, [x0, #11]
	mov	x19, x0
Lloh114:
	adrp	x20, _social_chat_player@PAGE
Lloh115:
	add	x20, x20, _social_chat_player@PAGEOFF
	ldrb	w8, [x8, _social_chat_player@PAGEOFF]
	cbz	w9, LBB24_5
; %bb.2:
	cbnz	w8, LBB24_5
; %bb.3:
	adrp	x8, _social_chat@PAGE+36944
	ldrsh	w10, [x8, _social_chat@PAGEOFF+36944]
	adds	w9, w10, w9
	b.mi	LBB24_9
; %bb.4:
	adrp	x10, _social_chat@PAGE+36864
	ldrsh	w10, [x10, _social_chat@PAGEOFF+36864]
	cmp	w10, #1
	csinc	w10, w10, wzr, gt
	sub	w10, w10, #1
	cmp	w9, w10
	csel	w9, w9, w10, lo
	strh	w9, [x8, _social_chat@PAGEOFF+36944]
	b	LBB24_11
LBB24_5:
	ldrb	w9, [x19, #10]
	cbz	w9, LBB24_11
; %bb.6:
	cbz	w8, LBB24_11
; %bb.7:
	adrp	x8, _social_chat_player@PAGE+102
	ldrb	w9, [x8, _social_chat_player@PAGEOFF+102]
	cbz	w9, LBB24_10
; %bb.8:
	strb	wzr, [x8, _social_chat_player@PAGEOFF+102]
	b	LBB24_11
LBB24_9:
	strh	wzr, [x8, _social_chat@PAGEOFF+36944]
	b	LBB24_11
LBB24_10:
	strb	wzr, [x20]
	strb	wzr, [x20, #110]
LBB24_11:
	ldrh	w21, [x19]
	bl	_halo_screen_width
	ldrb	w8, [x20]
	cbz	w8, LBB24_58
; %bb.12:
	ldrb	w8, [x20, #110]
	cbz	w8, LBB24_58
; %bb.13:
	ldrb	w8, [x19, #8]
	cbz	w8, LBB24_58
; %bb.14:
	adrp	x8, _social_chat_player@PAGE+102
	ldrb	w8, [x8, _social_chat_player@PAGEOFF+102]
	cbnz	w8, LBB24_58
; %bb.15:
	adrp	x8, _social_chat_player@PAGE+98
	ldrsh	w12, [x8, _social_chat_player@PAGEOFF+98]
	cmp	w12, #1
	b.lt	LBB24_58
; %bb.16:
	sub	w8, w0, #640
	and	w10, w12, #0x3
	cmp	w12, #4
	add	w9, w8, w8, lsr #31
	ldrsh	w8, [x19, #2]
	add	w9, w21, w9, lsr #1
	sxth	w9, w9
	b.hs	LBB24_18
; %bb.17:
	mov	w11, wzr
	b	LBB24_41
LBB24_18:
	mov	w11, wzr
	and	w12, w12, #0x7ffc
	adrp	x13, _social_chat_player@PAGE+100
Lloh116:
	adrp	x14, _social_chat_player@PAGE+142
Lloh117:
	add	x14, x14, _social_chat_player@PAGEOFF+142
	b	LBB24_20
	.p2align	4, , 8
LBB24_19:                               ;   in Loop: Header=BB24_20 Depth=1
	add	w11, w11, #4
	add	w14, w14, #32
	cmp	w12, w11
	b.eq	LBB24_40
LBB24_20:                               ; =>This Inner Loop Header: Depth=1
	sub	w15, w14, #28
	ldrsh	w15, [x15]
	cmp	w9, w15
	b.lt	LBB24_25
; %bb.21:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #24
	ldrsh	w15, [x15]
	cmp	w9, w15
	b.ge	LBB24_25
; %bb.22:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #30
	ldrsh	w15, [x15]
	cmp	w8, w15
	b.lt	LBB24_25
; %bb.23:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #26
	ldrsh	w15, [x15]
	cmp	w8, w15
	b.ge	LBB24_25
; %bb.24:                               ;   in Loop: Header=BB24_20 Depth=1
	strh	w11, [x13, _social_chat_player@PAGEOFF+100]
	.p2align	4, , 8
LBB24_25:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #20
	ldrsh	w15, [x15]
	cmp	w9, w15
	b.lt	LBB24_30
; %bb.26:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #16
	ldrsh	w15, [x15]
	cmp	w9, w15
	b.ge	LBB24_30
; %bb.27:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #22
	ldrsh	w15, [x15]
	cmp	w8, w15
	b.lt	LBB24_30
; %bb.28:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #18
	ldrsh	w15, [x15]
	cmp	w8, w15
	b.ge	LBB24_30
; %bb.29:                               ;   in Loop: Header=BB24_20 Depth=1
	add	w15, w11, #1
	strh	w15, [x13, _social_chat_player@PAGEOFF+100]
	.p2align	4, , 8
LBB24_30:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #12
	ldrsh	w15, [x15]
	cmp	w9, w15
	b.lt	LBB24_35
; %bb.31:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #8
	ldrsh	w15, [x15]
	cmp	w9, w15
	b.ge	LBB24_35
; %bb.32:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #14
	ldrsh	w15, [x15]
	cmp	w8, w15
	b.lt	LBB24_35
; %bb.33:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #10
	ldrsh	w15, [x15]
	cmp	w8, w15
	b.ge	LBB24_35
; %bb.34:                               ;   in Loop: Header=BB24_20 Depth=1
	add	w15, w11, #2
	strh	w15, [x13, _social_chat_player@PAGEOFF+100]
	.p2align	4, , 8
LBB24_35:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #4
	ldrsh	w15, [x15]
	cmp	w9, w15
	b.lt	LBB24_19
; %bb.36:                               ;   in Loop: Header=BB24_20 Depth=1
	ldrsh	w15, [x14]
	cmp	w9, w15
	b.ge	LBB24_19
; %bb.37:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #6
	ldrsh	w15, [x15]
	cmp	w8, w15
	b.lt	LBB24_19
; %bb.38:                               ;   in Loop: Header=BB24_20 Depth=1
	sub	w15, w14, #2
	ldrsh	w15, [x15]
	cmp	w8, w15
	b.ge	LBB24_19
; %bb.39:                               ;   in Loop: Header=BB24_20 Depth=1
	add	w15, w11, #3
	strh	w15, [x13, _social_chat_player@PAGEOFF+100]
	b	LBB24_19
LBB24_40:
	cbz	w10, LBB24_58
LBB24_41:
	add	x12, x20, w11, sxtw #3
	ldrsh	w13, [x12, #114]
	cmp	w9, w13
	b.lt	LBB24_46
; %bb.42:
	ldursh	w13, [x12, #118]
	cmp	w9, w13
	b.ge	LBB24_46
; %bb.43:
	ldursh	w13, [x12, #112]
	cmp	w8, w13
	b.lt	LBB24_46
; %bb.44:
	ldursh	w12, [x12, #116]
	cmp	w8, w12
	b.ge	LBB24_46
; %bb.45:
	adrp	x12, _social_chat_player@PAGE+100
	strh	w11, [x12, _social_chat_player@PAGEOFF+100]
LBB24_46:
	cmp	w10, #1
	b.eq	LBB24_58
; %bb.47:
	add	w12, w11, #1
	add	x13, x20, w12, sxtw #3
	ldrsh	w14, [x13, #114]
	cmp	w9, w14
	b.lt	LBB24_52
; %bb.48:
	ldursh	w14, [x13, #118]
	cmp	w9, w14
	b.ge	LBB24_52
; %bb.49:
	ldursh	w14, [x13, #112]
	cmp	w8, w14
	b.lt	LBB24_52
; %bb.50:
	ldursh	w13, [x13, #116]
	cmp	w8, w13
	b.ge	LBB24_52
; %bb.51:
	adrp	x13, _social_chat_player@PAGE+100
	strh	w12, [x13, _social_chat_player@PAGEOFF+100]
LBB24_52:
	cmp	w10, #2
	b.eq	LBB24_58
; %bb.53:
	add	w10, w11, #2
	add	x11, x20, w10, sxtw #3
	ldrsh	w12, [x11, #114]
	cmp	w9, w12
	b.lt	LBB24_58
; %bb.54:
	ldursh	w12, [x11, #118]
	cmp	w9, w12
	b.ge	LBB24_58
; %bb.55:
	ldursh	w9, [x11, #112]
	cmp	w8, w9
	b.lt	LBB24_58
; %bb.56:
	ldursh	w9, [x11, #116]
	cmp	w8, w9
	b.ge	LBB24_58
; %bb.57:
	adrp	x8, _social_chat_player@PAGE+100
	strh	w10, [x8, _social_chat_player@PAGEOFF+100]
LBB24_58:
	ldrb	w8, [x19, #9]
	cbz	w8, LBB24_83
; %bb.59:
	ldrh	w21, [x19, #4]
	bl	_halo_screen_width
	sub	w9, w0, #640
	ldrb	w8, [x20]
	ldrsh	w1, [x19, #6]
	add	w9, w9, w9, lsr #31
	add	w9, w21, w9, lsr #1
	sxth	w0, w9
	cbz	w8, LBB24_73
; %bb.60:
	ldrb	w8, [x20, #110]
	cbz	w8, LBB24_73
; %bb.61:
	adrp	x9, _social_chat_player@PAGE+102
Lloh118:
	adrp	x8, _social_chat_player@PAGE+168
Lloh119:
	add	x8, x8, _social_chat_player@PAGEOFF+168
	ldrb	w10, [x9, _social_chat_player@PAGEOFF+102]
	cbz	w10, LBB24_63
; %bb.62:
	ldrsh	w10, [x8, #4]
	sxth	w12, w1
	ldrsh	w11, [x8, #6]
	sxth	w13, w0
	cmp	w12, w10
	ldrsh	w10, [x8]
	ccmp	w13, w11, #0, lt
	ldrsh	w11, [x8, #2]
	ccmp	w12, w10, #8, lt
	ccmp	w13, w11, #8, ge
	b.ge	LBB24_82
LBB24_63:
	adrp	x9, _social_chat_player@PAGE+98
	ldrsh	w9, [x9, _social_chat_player@PAGEOFF+98]
	cmp	w9, #1
	b.lt	LBB24_71
; %bb.64:
	mov	w10, wzr
Lloh120:
	adrp	x11, _social_chat_player@PAGE+118
Lloh121:
	add	x11, x11, _social_chat_player@PAGEOFF+118
	b	LBB24_66
	.p2align	4, , 8
LBB24_65:                               ;   in Loop: Header=BB24_66 Depth=1
	add	w10, w10, #1
	add	w11, w11, #8
	cmp	w9, w10
	b.eq	LBB24_71
LBB24_66:                               ; =>This Inner Loop Header: Depth=1
	sub	w12, w11, #4
	ldrsh	w12, [x12]
	cmp	w0, w12
	b.lt	LBB24_65
; %bb.67:                               ;   in Loop: Header=BB24_66 Depth=1
	ldrsh	w12, [x11]
	cmp	w0, w12
	b.ge	LBB24_65
; %bb.68:                               ;   in Loop: Header=BB24_66 Depth=1
	sub	w12, w11, #6
	ldrsh	w12, [x12]
	cmp	w1, w12
	b.lt	LBB24_65
; %bb.69:                               ;   in Loop: Header=BB24_66 Depth=1
	sub	w12, w11, #2
	ldrsh	w12, [x12]
	cmp	w1, w12
	b.ge	LBB24_65
; %bb.70:
	adrp	x8, _social_chat_player@PAGE+100
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	strh	w10, [x8, _social_chat_player@PAGEOFF+100]
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_social_chat_player_pick
LBB24_71:
	ldrsh	w9, [x8, #4]
	sxth	w11, w1
	ldrsh	w10, [x8, #6]
	sxth	w12, w0
	cmp	w11, w9
	ldrsh	w9, [x8]
	ccmp	w12, w10, #0, lt
	ldrsh	w8, [x8, #2]
	ccmp	w11, w9, #8, lt
	ccmp	w12, w8, #8, ge
	b.ge	LBB24_83
; %bb.72:
	strb	wzr, [x20]
	strb	wzr, [x20, #110]
LBB24_73:
	adrp	x8, _social_chat_player@PAGE+176
	ldrsh	w9, [x8, _social_chat_player@PAGEOFF+176]
	cmp	w9, #1
	b.lt	LBB24_81
; %bb.74:
Lloh122:
	adrp	x8, _social_chat_player@PAGE+202
Lloh123:
	add	x8, x8, _social_chat_player@PAGEOFF+202
	b	LBB24_76
	.p2align	4, , 8
LBB24_75:                               ;   in Loop: Header=BB24_76 Depth=1
	add	w8, w8, #90
	subs	w9, w9, #1
	b.eq	LBB24_81
LBB24_76:                               ; =>This Inner Loop Header: Depth=1
	sub	w10, w8, #22
	ldrsh	w10, [x10]
	cmp	w0, w10
	b.lt	LBB24_75
; %bb.77:                               ;   in Loop: Header=BB24_76 Depth=1
	sub	w10, w8, #18
	ldrsh	w10, [x10]
	cmp	w0, w10
	b.ge	LBB24_75
; %bb.78:                               ;   in Loop: Header=BB24_76 Depth=1
	sub	w10, w8, #24
	ldrsh	w2, [x10]
	cmp	w1, w2
	b.lt	LBB24_75
; %bb.79:                               ;   in Loop: Header=BB24_76 Depth=1
	sub	w10, w8, #20
	ldrsh	w10, [x10]
	cmp	w1, w10
	b.ge	LBB24_75
; %bb.80:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	sub	w0, w8, #16
	mov	x1, x8
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_social_chat_player_open
LBB24_81:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_social_chat_click
LBB24_82:
	strb	wzr, [x9, _social_chat_player@PAGEOFF+102]
LBB24_83:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh114, Lloh115
	.loh AdrpAdd	Lloh116, Lloh117
	.loh AdrpAdd	Lloh118, Lloh119
	.loh AdrpAdd	Lloh120, Lloh121
	.loh AdrpAdd	Lloh122, Lloh123
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_player_pick
_social_chat_player_pick:               ; @social_chat_player_pick
; %bb.0:
	adrp	x8, _social_chat_player@PAGE+102
	ldrb	w9, [x8, _social_chat_player@PAGEOFF+102]
	cbz	w9, LBB25_3
; %bb.1:
	strb	wzr, [x8, _social_chat_player@PAGEOFF+102]
LBB25_2:
	ret
LBB25_3:
Lloh124:
	adrp	x9, _social_chat_player@PAGE+98
Lloh125:
	add	x9, x9, _social_chat_player@PAGEOFF+98
	ldrsh	w8, [x9, #2]
	tbnz	w8, #31, LBB25_2
; %bb.4:
	ldrsh	w9, [x9]
	cmp	w8, w9
	b.ge	LBB25_2
; %bb.5:
	sub	sp, sp, #176
	stp	x22, x21, [sp, #128]            ; 16-byte Folded Spill
Lloh126:
	adrp	x21, _social_chat_player@PAGE
Lloh127:
	add	x21, x21, _social_chat_player@PAGEOFF
	mov	w9, wzr
	add	x8, x21, w8, sxtw #1
	stp	x24, x23, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	ldrh	w13, [x21, #18]
	ldrh	w8, [x8, #84]
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	cbz	w13, LBB25_14
; %bb.6:
	add	x10, sp, #13
	mov	w11, #2048                      ; =0x800
Lloh128:
	adrp	x12, _social_chat_player@PAGE+20
Lloh129:
	add	x12, x12, _social_chat_player@PAGEOFF+20
	.p2align	4, , 8
LBB25_7:                                ; =>This Inner Loop Header: Depth=1
	cmp	w13, #127
	b.hi	LBB25_9
; %bb.8:                                ;   in Loop: Header=BB25_7 Depth=1
	add	w14, w9, #1
	strb	w13, [x10, w9, sxtw]
	mov	w9, w14
	ldrh	w13, [x12]
	cbnz	w13, LBB25_13
	b	LBB25_14
	.p2align	4, , 8
LBB25_9:                                ;   in Loop: Header=BB25_7 Depth=1
	cmp	w9, #97
	ccmp	w13, w11, #2, lt
	b.hs	LBB25_11
; %bb.10:                               ;   in Loop: Header=BB25_7 Depth=1
	lsr	w14, w13, #6
	add	x15, x10, w9, sxtw
	orr	w14, w14, #0xc0
	mov	w16, #128                       ; =0x80
	add	w17, w15, #1
	bfxil	w16, w13, #0, #6
	add	w9, w9, #2
	strb	w14, [x15]
	strb	w16, [x17]
	ldrh	w13, [x12]
	cbnz	w13, LBB25_13
	b	LBB25_14
	.p2align	4, , 8
LBB25_11:                               ;   in Loop: Header=BB25_7 Depth=1
	cmp	w9, #95
	b.gt	LBB25_14
; %bb.12:                               ;   in Loop: Header=BB25_7 Depth=1
	lsr	w14, w13, #12
	add	x15, x10, w9, sxtw
	orr	w14, w14, #0xe0
	mov	w16, #128                       ; =0x80
	add	w17, w15, #1
	mov	w0, #128                        ; =0x80
	add	w9, w9, #3
	bfxil	w16, w13, #6, #6
	strb	w14, [x15]
	add	w14, w15, #2
	bfxil	w0, w13, #0, #6
	strb	w16, [x17]
	strb	w0, [x14]
	ldrh	w13, [x12]
	cbz	w13, LBB25_14
LBB25_13:                               ;   in Loop: Header=BB25_7 Depth=1
	add	w12, w12, #2
	cmp	w9, #98
	b.lt	LBB25_7
LBB25_14:
	add	x10, sp, #13
	cmp	w8, #2
	strb	wzr, [x10, w9, sxtw]
	b.gt	LBB25_19
; %bb.15:
	cbz	w8, LBB25_31
; %bb.16:
	cmp	w8, #1
	b.eq	LBB25_35
; %bb.17:
	cmp	w8, #2
	b.ne	LBB25_50
; %bb.18:
	mov	w8, #1                          ; =0x1
Lloh130:
	adrp	x0, _social_chat_player@PAGE+1
Lloh131:
	add	x0, x0, _social_chat_player@PAGEOFF+1
	add	x1, sp, #13
	strb	w8, [x0, #101]
	bl	_social_menu_profile_ask
	b	LBB25_54
LBB25_19:
	sub	w9, w8, #3
	cmp	w9, #2
	b.lo	LBB25_36
; %bb.20:
	sub	w9, w8, #6
	cmp	w9, #2
	b.hs	LBB25_42
; %bb.21:
	adrp	x19, _social_chat@PAGE+46012
	ldrsh	w9, [x19, _social_chat@PAGEOFF+46012]
	cmp	w9, #1
	b.lt	LBB25_37
; %bb.22:
	mov	w10, wzr
Lloh132:
	adrp	x11, _social_chat@PAGE+43902
Lloh133:
	add	x11, x11, _social_chat@PAGEOFF+43902
	mov	w12, #66                        ; =0x42
	mov	w13, #43900                     ; =0xab7c
Lloh134:
	adrp	x14, _social_chat@PAGE
Lloh135:
	add	x14, x14, _social_chat@PAGEOFF
Lloh136:
	adrp	x15, _social_chat_player@PAGE+18
Lloh137:
	add	x15, x15, _social_chat_player@PAGEOFF+18
	b	LBB25_26
LBB25_23:                               ;   in Loop: Header=BB25_26 Depth=1
	mov	x16, x15
LBB25_24:                               ;   in Loop: Header=BB25_26 Depth=1
	ldrh	w16, [x16]
	cbz	w16, LBB25_38
LBB25_25:                               ;   in Loop: Header=BB25_26 Depth=1
	add	w10, w10, #1
	add	w11, w11, #66
	cmp	w10, w9
	b.eq	LBB25_37
LBB25_26:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB25_28 Depth 2
	smaddl	x16, w10, w12, x14
	ldrh	w0, [x16, x13]
	cbz	w0, LBB25_23
; %bb.27:                               ;   in Loop: Header=BB25_26 Depth=1
	mov	x17, x11
	mov	x16, x15
	.p2align	4, , 8
LBB25_28:                               ;   Parent Loop BB25_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrh	w1, [x16], #2
	cbz	w1, LBB25_25
; %bb.29:                               ;   in Loop: Header=BB25_28 Depth=2
	sub	w2, w0, #65
	orr	w3, w0, #0x20
	cmp	w2, #26
	sub	w2, w1, #65
	csel	w0, w3, w0, lo
	orr	w3, w1, #0x20
	cmp	w2, #26
	csel	w1, w3, w1, lo
	cmp	w0, w1
	b.ne	LBB25_25
; %bb.30:                               ;   in Loop: Header=BB25_28 Depth=2
	ldrh	w0, [x17]
	add	w17, w17, #2
	cbnz	w0, LBB25_28
	b	LBB25_24
LBB25_31:
Lloh138:
	adrp	x0, _social_chat_player@PAGE+1
Lloh139:
	add	x0, x0, _social_chat_player@PAGEOFF+1
	add	x1, x0, #17
	mov	w2, wzr
	bl	_social_chat_peer_note
	adrp	x22, _social_chat@PAGE+39670
	ldrsh	w8, [x22, _social_chat@PAGEOFF+39670]
	cmp	w8, #1
	b.lt	LBB25_52
; %bb.32:
	mov	w23, wzr
Lloh140:
	adrp	x19, _social_chat@PAGE+36982
Lloh141:
	add	x19, x19, _social_chat@PAGEOFF+36982
Lloh142:
	adrp	x20, _social_chat_player@PAGE+1
Lloh143:
	add	x20, x20, _social_chat_player@PAGEOFF+1
	.p2align	4, , 8
LBB25_33:                               ; =>This Inner Loop Header: Depth=1
	mov	x0, x19
	mov	x1, x20
	bl	_csstrcmp
	cbz	w0, LBB25_51
; %bb.34:                               ;   in Loop: Header=BB25_33 Depth=1
	ldrsh	w8, [x22, _social_chat@PAGEOFF+39670]
	add	w23, w23, #1
	add	w19, w19, #84
	cmp	w23, w8
	b.lt	LBB25_33
	b	LBB25_52
LBB25_35:
	add	x0, x21, #1
	add	x1, sp, #13
	mov	w2, wzr
	bl	_social_menu_player_act
	b	LBB25_50
LBB25_36:
	cmp	w8, #3
	mov	w8, #1                          ; =0x1
	cinc	w2, w8, ne
	add	x0, x21, #1
	add	x1, sp, #13
	bl	_social_menu_player_act
	b	LBB25_50
LBB25_37:
	mov	w10, #65535                     ; =0xffff
LBB25_38:
	cmp	w9, #31
	b.gt	LBB25_46
; %bb.39:
	cmp	w8, #6
	b.ne	LBB25_46
; %bb.40:
	mov	w11, #65535                     ; =0xffff
	bics	wzr, w11, w10
	b.ne	LBB25_46
; %bb.41:
	mov	w20, #66                        ; =0x42
Lloh144:
	adrp	x22, _social_chat@PAGE+43900
Lloh145:
	add	x22, x22, _social_chat@PAGEOFF+43900
Lloh146:
	adrp	x1, _social_chat_player@PAGE+18
Lloh147:
	add	x1, x1, _social_chat_player@PAGEOFF+18
	smaddl	x0, w9, w20, x22
	mov	w2, #32                         ; =0x20
	bl	_ustrncpy
	ldrsh	x8, [x22, #2112]
	smaddl	x9, w8, w20, x22
	add	w8, w8, #1
	strh	wzr, [x9, #64]
	b	LBB25_49
LBB25_42:
	cmp	w8, #5
	b.ne	LBB25_50
; %bb.43:
	adrp	x19, _social_chat_player@PAGE+104
	ldr	w8, [x19, _social_chat_player@PAGEOFF+104]
	cbz	w8, LBB25_53
; %bb.44:
	bl	_system_milliseconds
	ldr	w8, [x19, _social_chat_player@PAGEOFF+104]
	sub	w8, w0, w8
	cmp	w8, #4000
	b.hi	LBB25_53
; %bb.45:
	add	x0, x21, #1
	add	x1, sp, #13
	mov	w2, #3                          ; =0x3
	bl	_social_menu_player_act
	b	LBB25_50
LBB25_46:
	cmp	w8, #6
	b.eq	LBB25_50
; %bb.47:
	sxth	w8, w10
	cmn	w8, #1
	b.eq	LBB25_50
; %bb.48:
	mov	w10, #66                        ; =0x42
Lloh148:
	adrp	x20, _social_chat@PAGE
Lloh149:
	add	x20, x20, _social_chat@PAGEOFF
	mov	w11, #43900                     ; =0xab7c
	smaddl	x10, w8, w10, x20
	mvn	w8, w8
	add	w8, w8, w9
	add	x0, x10, x11
	add	w1, w0, #66
	add	w8, w8, w8, lsl #5
	lsl	w2, w8, #1
	bl	_csmemmove
	mov	w8, #46012                      ; =0xb3bc
	ldrh	w8, [x20, x8]
	sub	w8, w8, #1
LBB25_49:
	strh	w8, [x19, _social_chat@PAGEOFF+46012]
LBB25_50:
	strb	wzr, [x21]
	strb	wzr, [x21, #110]
	b	LBB25_54
LBB25_51:
	mov	w8, #2                          ; =0x2
Lloh150:
	adrp	x9, _social_chat@PAGE+36870
Lloh151:
	add	x9, x9, _social_chat@PAGEOFF+36870
	strh	w8, [x9]
	strh	w23, [x9, #2802]
LBB25_52:
	adrp	x8, _social_chat@PAGE+36974
	strb	wzr, [x21]
	strb	wzr, [x21, #110]
	strb	wzr, [x8, _social_chat@PAGEOFF+36974]
	b	LBB25_54
LBB25_53:
	bl	_system_milliseconds
	str	w0, [x19, _social_chat_player@PAGEOFF+104]
LBB25_54:
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
	.loh AdrpAdd	Lloh124, Lloh125
	.loh AdrpAdd	Lloh126, Lloh127
	.loh AdrpAdd	Lloh128, Lloh129
	.loh AdrpAdd	Lloh130, Lloh131
	.loh AdrpAdd	Lloh136, Lloh137
	.loh AdrpAdd	Lloh134, Lloh135
	.loh AdrpAdd	Lloh132, Lloh133
	.loh AdrpAdd	Lloh138, Lloh139
	.loh AdrpAdd	Lloh142, Lloh143
	.loh AdrpAdd	Lloh140, Lloh141
	.loh AdrpAdd	Lloh146, Lloh147
	.loh AdrpAdd	Lloh144, Lloh145
	.loh AdrpAdd	Lloh148, Lloh149
	.loh AdrpAdd	Lloh150, Lloh151
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_click
_social_chat_click:                     ; @social_chat_click
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
Lloh152:
	adrp	x19, _social_chat_keyboard@PAGE
Lloh153:
	add	x19, x19, _social_chat_keyboard@PAGEOFF
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	ldrb	w8, [x19]
	ldrb	w9, [x19, #20]
	cmp	w8, #0
	ccmp	w9, #0, #4, ne
	b.eq	LBB26_2
; %bb.1:
Lloh154:
	adrp	x12, _social_chat_keyboard@PAGE+22
Lloh155:
	add	x12, x12, _social_chat_keyboard@PAGEOFF+22
	sxth	w13, w1
	sxth	w14, w0
	ldrsh	w10, [x12, #4]
	ldrsh	w9, [x12, #6]
	ldrsh	w11, [x12]
	ldrsh	w12, [x12, #2]
	cmp	w13, w10
	ccmp	w14, w9, #0, lt
	ccmp	w13, w11, #8, lt
	ccmp	w14, w12, #8, ge
	b.ge	LBB26_8
LBB26_2:
	adrp	x9, _social_chat_hits@PAGE
	ldrb	w9, [x9, _social_chat_hits@PAGEOFF]
	cbz	w9, LBB26_29
; %bb.3:
Lloh156:
	adrp	x11, _social_chat_hits@PAGE+10
Lloh157:
	add	x11, x11, _social_chat_hits@PAGEOFF+10
	sxth	w9, w0
	ldrsh	w10, [x11, #2]
	ldrsh	w12, [x11]
	ldrsh	w13, [x11, #6]
	ldrsh	w11, [x11, #4]
	cmp	w9, w10
	sxth	w10, w1
	ccmp	w10, w12, #8, ge
	ccmp	w9, w13, #0, ge
	ccmp	w10, w11, #0, lt
	cset	w20, lt
	b.ge	LBB26_9
; %bb.4:
	mov	w19, wzr
LBB26_5:
	mov	w21, wzr
LBB26_6:
	bl	_game_connection
	sub	w9, w0, #1
	eor	w8, w20, #0x1
	cmp	w9, #1
	csinc	w8, w8, wzr, ls
	tbnz	w8, #0, LBB26_29
; %bb.7:
	adrp	x8, _social_chat@PAGE+36870
	strh	w19, [x8, _social_chat@PAGEOFF+36870]
	cbnz	w21, LBB26_16
	b	LBB26_29
LBB26_8:
	sub	w8, w1, w11
	sub	w13, w0, w12
	sub	w10, w10, w11
	sub	w9, w9, w12
	add	w8, w8, w8, lsl #2
	add	w11, w13, w13, lsl #2
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	sdiv	w8, w8, w10
	lsl	w10, w11, #1
	sdiv	w9, w10, w9
	mov	w10, #4                         ; =0x4
	sxth	w8, w8
	bic	w8, w8, w8, asr #31
	sxth	w9, w9
	cmp	w8, #4
	bic	w9, w9, w9, asr #31
	csel	w8, w8, w10, lt
	cmp	w9, #9
	mov	w10, #9                         ; =0x9
	csel	w9, w9, w10, lt
Lloh158:
	adrp	x10, _social_chat_keyboard@PAGE+2
Lloh159:
	add	x10, x10, _social_chat_keyboard@PAGEOFF+2
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	strh	w8, [x10]
	strh	w9, [x10, #2]
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_social_chat_keyboard_press
LBB26_9:
Lloh160:
	adrp	x11, _social_chat_hits@PAGE+18
Lloh161:
	add	x11, x11, _social_chat_hits@PAGEOFF+18
	ldrsh	w12, [x11, #4]
	ldrsh	w13, [x11, #6]
	cmp	w10, w12
	ldrsh	w12, [x11]
	ccmp	w9, w13, #0, lt
	ldrsh	w11, [x11, #2]
	ccmp	w10, w12, #8, lt
	ccmp	w9, w11, #8, ge
	b.lt	LBB26_12
; %bb.10:
	bl	_social_chat_team
	mov	w19, #1                         ; =0x1
	cmn	w0, #1
	b.eq	LBB26_5
; %bb.11:
	adrp	x8, _social_chat@PAGE+36870
	strh	w19, [x8, _social_chat@PAGEOFF+36870]
	b	LBB26_29
LBB26_12:
Lloh162:
	adrp	x11, _social_chat_hits@PAGE+26
Lloh163:
	add	x11, x11, _social_chat_hits@PAGEOFF+26
	ldrsh	w12, [x11, #4]
	ldrsh	w13, [x11, #6]
	cmp	w10, w12
	ldrsh	w12, [x11]
	ccmp	w9, w13, #0, lt
	ldrsh	w11, [x11, #2]
	ccmp	w10, w12, #8, lt
	ccmp	w9, w11, #8, ge
	b.lt	LBB26_19
; %bb.13:
	adrp	x19, _social_chat_private_heard.read_at@PAGE
	ldr	w21, [x19, _social_chat_private_heard.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w21, w0
	b.ne	LBB26_21
; %bb.14:
	adrp	x8, _social_chat_private_heard.heard@PAGE
	ldrb	w8, [x8, _social_chat_private_heard.heard@PAGEOFF]
	mov	w19, #2                         ; =0x2
	cbz	w8, LBB26_22
LBB26_15:
	adrp	x8, _social_chat@PAGE+36870
	strh	w19, [x8, _social_chat@PAGEOFF+36870]
LBB26_16:
Lloh164:
	adrp	x8, _social_chat@PAGE+39670
Lloh165:
	add	x8, x8, _social_chat@PAGEOFF+39670
	ldrsh	w9, [x8, #2]
	ldrh	w8, [x8]
	sxth	w10, w8
	cmp	w9, w10
	ccmp	w9, #0, #8, lt
	ccmp	w10, #0, #4, mi
	b.le	LBB26_29
; %bb.17:
	add	w9, w8, w9
	sdiv	w10, w9, w8
	msub	w8, w10, w8, w9
	adrp	x9, _social_chat@PAGE+39672
LBB26_18:
	strh	w8, [x9, _social_chat@PAGEOFF+39672]
	b	LBB26_29
LBB26_19:
Lloh166:
	adrp	x11, _social_chat_hits@PAGE+34
Lloh167:
	add	x11, x11, _social_chat_hits@PAGEOFF+34
	ldrsh	w12, [x11, #4]
	ldrsh	w13, [x11, #6]
	cmp	w10, w12
	ldrsh	w12, [x11]
	ccmp	w9, w13, #0, lt
	ldrsh	w11, [x11, #2]
	ccmp	w10, w12, #8, lt
	ccmp	w9, w11, #8, ge
	b.lt	LBB26_23
; %bb.20:
	adrp	x8, _social_chat@PAGE+36870
	mov	w9, #3                          ; =0x3
	strh	w9, [x8, _social_chat@PAGEOFF+36870]
	b	LBB26_29
LBB26_21:
	bl	_config_changes
	str	w0, [x19, _social_chat_private_heard.read_at@PAGEOFF]
Lloh168:
	adrp	x0, l_.str.4@PAGE
Lloh169:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_private_heard.heard@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_private_heard.heard@PAGEOFF]
	mov	w19, #2                         ; =0x2
	cbnz	w8, LBB26_15
LBB26_22:
	mov	w21, #1                         ; =0x1
	b	LBB26_6
LBB26_23:
	adrp	x11, _social_chat@PAGE+36870
	ldrh	w11, [x11, _social_chat@PAGEOFF+36870]
	cmp	w11, #2
	b.ne	LBB26_25
; %bb.24:
Lloh170:
	adrp	x11, _social_chat_hits@PAGE+42
Lloh171:
	add	x11, x11, _social_chat_hits@PAGEOFF+42
	ldrsh	w12, [x11, #4]
	ldrsh	w13, [x11, #6]
	cmp	w10, w12
	ldrsh	w12, [x11]
	ccmp	w9, w13, #0, lt
	ldrsh	w11, [x11, #2]
	ccmp	w10, w12, #8, lt
	ccmp	w9, w11, #8, ge
	b.ge	LBB26_35
LBB26_25:
Lloh172:
	adrp	x11, _social_chat_hits@PAGE+2
Lloh173:
	add	x11, x11, _social_chat_hits@PAGEOFF+2
	ldrsh	w12, [x11, #4]
	ldrsh	w13, [x11, #6]
	cmp	w10, w12
	ldrsh	w12, [x11]
	ccmp	w9, w13, #0, lt
	ldrsh	w11, [x11, #2]
	ccmp	w10, w12, #8, lt
	adrp	x10, _social_chat@PAGE+36868
	ccmp	w9, w11, #8, ge
	ldrb	w9, [x10, _social_chat@PAGEOFF+36868]
	b.ge	LBB26_30
; %bb.26:
	cbz	w9, LBB26_28
; %bb.27:
	bl	_system_milliseconds
	adrp	x8, _social_chat@PAGE+36948
	orr	w9, w0, #0x1
	str	w9, [x8, _social_chat@PAGEOFF+36948]
LBB26_28:
Lloh174:
	adrp	x8, _social_chat@PAGE+36868
Lloh175:
	add	x8, x8, _social_chat@PAGEOFF+36868
	strh	wzr, [x19]
	strb	wzr, [x19, #20]
	strb	wzr, [x8]
	strh	wzr, [x8, #76]
Lloh176:
	adrp	x8, _social_chat_player@PAGE
Lloh177:
	add	x8, x8, _social_chat_player@PAGEOFF
	strb	wzr, [x8]
	strb	wzr, [x8, #110]
	strh	wzr, [x8, #176]
LBB26_29:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB26_30:
	cbz	w8, LBB26_29
; %bb.31:
	cbz	w9, LBB26_29
; %bb.32:
	adrp	x8, _social_chat_keyboard@PAGE+1
	ldrb	w8, [x8, _social_chat_keyboard@PAGEOFF+1]
	cbz	w8, LBB26_29
; %bb.33:
	adrp	x8, _social_chat@PAGE+36974
	ldrb	w8, [x8, _social_chat@PAGEOFF+36974]
	cbnz	w8, LBB26_29
; %bb.34:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_halo_system_keyboard_again
LBB26_35:
	adrp	x8, _social_chat@PAGE+39670
	ldrsh	w8, [x8, _social_chat@PAGEOFF+39670]
	cmp	w8, #1
	b.lt	LBB26_29
; %bb.36:
	adrp	x9, _social_chat@PAGE+39672
	ldrsh	w10, [x9, _social_chat@PAGEOFF+39672]
	add	w10, w8, w10
	add	w10, w10, #1
	sdiv	w11, w10, w8
	msub	w8, w11, w8, w10
	b	LBB26_18
	.loh AdrpAdd	Lloh152, Lloh153
	.loh AdrpAdd	Lloh154, Lloh155
	.loh AdrpAdd	Lloh156, Lloh157
	.loh AdrpAdd	Lloh158, Lloh159
	.loh AdrpAdd	Lloh160, Lloh161
	.loh AdrpAdd	Lloh162, Lloh163
	.loh AdrpAdd	Lloh164, Lloh165
	.loh AdrpAdd	Lloh166, Lloh167
	.loh AdrpAdd	Lloh168, Lloh169
	.loh AdrpAdd	Lloh170, Lloh171
	.loh AdrpAdd	Lloh172, Lloh173
	.loh AdrpAdd	Lloh176, Lloh177
	.loh AdrpAdd	Lloh174, Lloh175
                                        ; -- End function
	.globl	_social_chat_wants_pointer      ; -- Begin function social_chat_wants_pointer
	.p2align	4
_social_chat_wants_pointer:             ; @social_chat_wants_pointer
; %bb.0:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB27_2
; %bb.1:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	bl	_console_is_active
	cmp	w0, #0
	cset	w0, eq
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB27_2:
	mov	w0, wzr
	ret
                                        ; -- End function
	.globl	_social_chat_update             ; -- Begin function social_chat_update
	.p2align	4
_social_chat_update:                    ; @social_chat_update
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	sub	sp, sp, #1088
	bl	_system_milliseconds
	adrp	x28, _social_chat_replaces_upstream.read_at@PAGE
	mov	w22, w0
	ldr	w19, [x28, _social_chat_replaces_upstream.read_at@PAGEOFF]
	bl	_config_changes
	adrp	x27, _social_chat_replaces_upstream.on@PAGE
	cmp	w19, w0
	b.ne	LBB28_2
; %bb.1:
	ldrb	w8, [x27, _social_chat_replaces_upstream.on@PAGEOFF]
	b	LBB28_3
LBB28_2:
	bl	_config_changes
	str	w0, [x28, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh178:
	adrp	x0, l_.str@PAGE
Lloh179:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	cset	w8, ne
	strb	w8, [x27, _social_chat_replaces_upstream.on@PAGEOFF]
LBB28_3:
Lloh180:
	adrp	x24, _social_chat@PAGE+36868
Lloh181:
	add	x24, x24, _social_chat@PAGEOFF+36868
	cbz	w8, LBB28_8
; %bb.4:
	add	x0, sp, #568
	bl	_social_chat_room
Lloh182:
	adrp	x1, _social_chat@PAGE+46014
Lloh183:
	add	x1, x1, _social_chat@PAGEOFF+46014
	add	x0, sp, #568
	bl	_csstrcmp
	cbz	w0, LBB28_6
; %bb.5:
Lloh184:
	adrp	x19, _social_chat@PAGE+46012
Lloh185:
	add	x19, x19, _social_chat@PAGEOFF+46012
	add	x0, x19, #2
	add	x1, sp, #568
	mov	w2, #23                         ; =0x17
	bl	_csstrncpy
	strh	wzr, [x19]
LBB28_6:
	ldr	w19, [x28, _social_chat_replaces_upstream.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w19, w0
	b.ne	LBB28_12
; %bb.7:
	ldrb	w8, [x27, _social_chat_replaces_upstream.on@PAGEOFF]
	cbnz	w8, LBB28_13
	b	LBB28_280
LBB28_8:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB28_10
; %bb.9:
	bl	_system_milliseconds
	adrp	x8, _social_chat@PAGE+36948
	orr	w9, w0, #0x1
	str	w9, [x8, _social_chat@PAGEOFF+36948]
LBB28_10:
Lloh186:
	adrp	x8, _social_chat_keyboard@PAGE
Lloh187:
	add	x8, x8, _social_chat_keyboard@PAGEOFF
	strb	wzr, [x24]
	strh	wzr, [x24, #76]
	strh	wzr, [x8]
	strb	wzr, [x8, #20]
LBB28_11:
Lloh188:
	adrp	x8, _social_chat_player@PAGE
Lloh189:
	add	x8, x8, _social_chat_player@PAGEOFF
	b	LBB28_290
LBB28_12:
	bl	_config_changes
	str	w0, [x28, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh190:
	adrp	x0, l_.str@PAGE
Lloh191:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	cset	w8, ne
	strb	w8, [x27, _social_chat_replaces_upstream.on@PAGEOFF]
	cbz	w8, LBB28_280
LBB28_13:
	bl	_social_enabled
	cbz	w0, LBB28_280
; %bb.14:
Lloh192:
	adrp	x8, _social_chat@PAGE+46044
Lloh193:
	ldr	w0, [x8, _social_chat@PAGEOFF+46044]
	cbz	w0, LBB28_41
; %bb.15:
Lloh194:
	adrp	x2, _social_chat@PAGE+46292
Lloh195:
	add	x2, x2, _social_chat@PAGEOFF+46292
	add	x1, sp, #568
	mov	w3, #49152                      ; =0xc000
	str	wzr, [sp, #568]
	bl	_community_net_poll
	cbz	w0, LBB28_41
; %bb.16:
	ldr	w8, [sp, #568]
Lloh196:
	adrp	x9, _social_chat@PAGE+46044
Lloh197:
	add	x9, x9, _social_chat@PAGEOFF+46044
	adrp	x19, _social_chat@PAGE+46048
	cmp	w8, #200
	ldr	w8, [x9, #4]
	ccmp	w0, #1, #0, eq
	str	wzr, [x9]
	ccmp	x8, #0, #4, ne
	b.eq	LBB28_20
; %bb.17:
	ldrb	w9, [x8, #373]
	cbz	w9, LBB28_20
; %bb.18:
Lloh198:
	adrp	x1, _social_chat@PAGE+46052
Lloh199:
	add	x1, x1, _social_chat@PAGEOFF+46052
	mov	w20, w0
	add	x0, x8, #66
	bl	_csstrcmp
	mov	w8, w0
	mov	w0, w20
	cbnz	w8, LBB28_20
; %bb.19:
	ldr	w8, [x19, _social_chat@PAGEOFF+46048]
	mov	w9, #1                          ; =0x1
	strb	w9, [x8, #376]
LBB28_20:
	cmp	w0, #1
	str	wzr, [x19, _social_chat@PAGEOFF+46048]
	b.eq	LBB28_49
; %bb.21:
	bl	_system_milliseconds
Lloh200:
	adrp	x10, _social_chat@PAGE+36864
Lloh201:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB28_23
; %bb.22:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_23:
	mov	w9, #384                        ; =0x180
Lloh202:
	adrp	x19, _social_chat@PAGE
Lloh203:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x19
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x19, x8]
	cbz	w8, LBB28_25
; %bb.24:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_25:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB28_27
; %bb.26:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB28_27:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_30
; %bb.28:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_30
; %bb.29:
Lloh204:
	adrp	x8, _social_chat@PAGE+36968
Lloh205:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_30:
	mov	w9, wzr
	add	x8, x20, #66
	mov	w11, #84                        ; =0x54
Lloh206:
	adrp	x10, l_.str.33@PAGE
Lloh207:
	add	x10, x10, l_.str.33@PAGEOFF
	.p2align	4, , 8
LBB28_31:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_34 Depth 2
	tbnz	w11, #7, LBB28_34
; %bb.32:                               ;   in Loop: Header=BB28_31 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_35
; %bb.33:                               ;   in Loop: Header=BB28_31 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB28_38
	.p2align	4, , 8
LBB28_34:                               ;   Parent Loop BB28_31 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB28_34
	b	LBB28_37
	.p2align	4, , 8
LBB28_35:                               ;   in Loop: Header=BB28_31 Depth=1
	cmp	w12, #127
	b.eq	LBB28_37
; %bb.36:                               ;   in Loop: Header=BB28_31 Depth=1
	cmp	w12, #124
	b.ne	LBB28_38
	.p2align	4, , 8
LBB28_37:                               ;   in Loop: Header=BB28_31 Depth=1
	mov	w11, #63                        ; =0x3f
LBB28_38:                               ;   in Loop: Header=BB28_31 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB28_40
; %bb.39:                               ;   in Loop: Header=BB28_31 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB28_31
LBB28_40:
	mov	w9, #1                          ; =0x1
	mov	w10, #196608                    ; =0x30000
Lloh208:
	adrp	x1, l_.str.1@PAGE
Lloh209:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	w0, #3                          ; =0x3
	strb	wzr, [x8, w12, sxtw]
	strb	w9, [x20, #374]
	str	w10, [x20, #368]
	str	w8, [sp]
	bl	_error
LBB28_41:
	adrp	x19, _social_chat@PAGE+46040
	ldr	w0, [x19, _social_chat@PAGEOFF+46040]
	cbz	w0, LBB28_45
; %bb.42:
Lloh210:
	adrp	x2, _social_chat@PAGE+46292
Lloh211:
	add	x2, x2, _social_chat@PAGEOFF+46292
	add	x1, sp, #44
	mov	w3, #49152                      ; =0xc000
	str	wzr, [sp, #44]
	bl	_community_net_poll
	cbz	w0, LBB28_280
; %bb.43:
	mov	w20, w0
	str	wzr, [x24, #9172]
	bl	_game_connection
	ldrb	w8, [x24]
	sub	w9, w0, #1
	and	w9, w9, #0xffff
	mov	w10, #1500                      ; =0x5dc
	cmp	w8, #0
	ldr	w8, [sp, #44]
	ccmp	w9, #2, #0, eq
	mov	w9, #6000                       ; =0x1770
	csel	w9, w10, w9, lo
	cmp	w8, #200
	add	w8, w9, w22
	ccmp	w20, #1, #0, eq
	str	w8, [x24, #9396]
	b.eq	LBB28_72
; %bb.44:
	mov	w8, #15000                      ; =0x3a98
	adrp	x9, _social_chat@PAGE+46264
	add	w8, w22, w8
	str	w8, [x9, _social_chat@PAGEOFF+46264]
	b	LBB28_280
LBB28_45:
	bl	_social_account_code
	ldrb	w8, [x0]
	cbz	w8, LBB28_280
; %bb.46:
Lloh212:
	adrp	x8, _social_chat@PAGE+46264
Lloh213:
	ldr	w8, [x8, _social_chat@PAGEOFF+46264]
	cmp	w22, w8
	b.mi	LBB28_280
; %bb.47:
	bl	_social_chat_team
	mov	w20, w0
Lloh214:
	adrp	x0, _social_chat@PAGE+46268
Lloh215:
	add	x0, x0, _social_chat@PAGEOFF+46268
	bl	_social_chat_room
	add	x0, sp, #48
	mov	w1, #64                         ; =0x40
	bl	_social_player_name
	adrp	x23, _social_chat_reported_shown.read_at@PAGE
	ldr	w24, [x23, _social_chat_reported_shown.read_at@PAGEOFF]
	bl	_config_changes
	adrp	x21, _social_chat_reported_shown.shown@PAGE
	cmp	w24, w0
	b.ne	LBB28_126
; %bb.48:
	ldrb	w8, [x21, _social_chat_reported_shown.shown@PAGEOFF]
	b	LBB28_127
LBB28_49:
	ldr	w8, [sp, #568]
	cmp	w8, #403
	b.gt	LBB28_105
; %bb.50:
	cmp	w8, #200
	b.eq	LBB28_41
; %bb.51:
	cmp	w8, #403
	b.ne	LBB28_321
; %bb.52:
Lloh216:
	adrp	x0, _social_chat@PAGE+46292
Lloh217:
	add	x0, x0, _social_chat@PAGEOFF+46292
Lloh218:
	adrp	x1, l_.str.36@PAGE
Lloh219:
	add	x1, x1, l_.str.36@PAGEOFF
	bl	_strstr
	cbz	w0, LBB28_373
; %bb.53:
	bl	_system_milliseconds
Lloh220:
	adrp	x10, _social_chat@PAGE+36864
Lloh221:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB28_55
; %bb.54:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_55:
	mov	w9, #384                        ; =0x180
Lloh222:
	adrp	x19, _social_chat@PAGE
Lloh223:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x19
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x19, x8]
	cbz	w8, LBB28_57
; %bb.56:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_57:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB28_59
; %bb.58:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB28_59:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_62
; %bb.60:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_62
; %bb.61:
Lloh224:
	adrp	x8, _social_chat@PAGE+36968
Lloh225:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_62:
	mov	w9, wzr
	add	x8, x20, #66
	mov	w11, #84                        ; =0x54
Lloh226:
	adrp	x10, l_.str.37@PAGE
Lloh227:
	add	x10, x10, l_.str.37@PAGEOFF
LBB28_63:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_66 Depth 2
	tbnz	w11, #7, LBB28_66
; %bb.64:                               ;   in Loop: Header=BB28_63 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_67
; %bb.65:                               ;   in Loop: Header=BB28_63 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB28_70
	.p2align	4, , 8
LBB28_66:                               ;   Parent Loop BB28_63 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB28_66
	b	LBB28_69
LBB28_67:                               ;   in Loop: Header=BB28_63 Depth=1
	cmp	w12, #127
	b.eq	LBB28_69
; %bb.68:                               ;   in Loop: Header=BB28_63 Depth=1
	cmp	w12, #124
	b.ne	LBB28_70
LBB28_69:                               ;   in Loop: Header=BB28_63 Depth=1
	mov	w11, #63                        ; =0x3f
LBB28_70:                               ;   in Loop: Header=BB28_63 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB28_40
; %bb.71:                               ;   in Loop: Header=BB28_63 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB28_63
	b	LBB28_40
LBB28_72:
Lloh228:
	adrp	x20, _social_chat@PAGE+46292
Lloh229:
	add	x20, x20, _social_chat@PAGEOFF+46292
	mov	x0, x20
	bl	_csstrlen
	mov	w2, w0
	add	x0, sp, #28
	mov	x1, x20
	mov	w3, #16                         ; =0x10
	bl	_server_json_parse
	cbz	w0, LBB28_280
; %bb.73:
Lloh230:
	adrp	x2, l_.str.46@PAGE
Lloh231:
	add	x2, x2, l_.str.46@PAGEOFF
	add	x0, sp, #28
	mov	w1, wzr
	str	w22, [sp, #16]                  ; 4-byte Spill
	bl	_server_json_member
	tbnz	w0, #31, LBB28_278
; %bb.74:
Lloh232:
	adrp	x19, _social_chat@PAGE+46256
Lloh233:
	add	x19, x19, _social_chat@PAGEOFF+46256
	mov	w20, w0
Lloh234:
	adrp	x2, l_.str.47@PAGE
Lloh235:
	add	x2, x2, l_.str.47@PAGEOFF
	add	x0, sp, #28
	ldrb	w24, [x19, #4]
	mov	w1, w20
	ldr	w21, [x19]
	bl	_server_json_member
	tbnz	w0, #31, LBB28_77
; %bb.75:
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #568
	bl	_server_json_get_number
	cbz	w0, LBB28_77
; %bb.76:
	ldr	d0, [sp, #568]
	fcvtzs	w21, d0
LBB28_77:
	mov	w8, #1                          ; =0x1
Lloh236:
	adrp	x2, l_.str.48@PAGE
Lloh237:
	add	x2, x2, l_.str.48@PAGEOFF
	add	x0, sp, #28
	mov	w1, w20
	str	w21, [x19]
	strb	w8, [x19, #4]
	bl	_server_json_member
	strb	wzr, [sp, #568]
	tbnz	w0, #31, LBB28_79
; %bb.78:
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #568
	mov	w3, #32                         ; =0x20
	bl	_server_json_get_string
	cbnz	w0, LBB28_80
LBB28_79:
	strb	wzr, [sp, #568]
LBB28_80:
	add	x0, sp, #568
	bl	_social_menu_friends_key
Lloh238:
	adrp	x2, l_.str.49@PAGE
Lloh239:
	add	x2, x2, l_.str.49@PAGEOFF
	add	x0, sp, #28
	mov	w1, w20
	bl	_server_json_member
	tbnz	w0, #31, LBB28_147
; %bb.81:
	mov	w21, w0
	add	x0, sp, #28
	mov	w1, w21
	mov	w2, wzr
	mov	w26, w24
	bl	_server_json_element
	tbnz	w0, #31, LBB28_146
; %bb.82:
	mov	w25, w0
	mov	w22, wzr
	add	x19, sp, #48
Lloh240:
	adrp	x23, l_.str.50@PAGE
Lloh241:
	add	x23, x23, l_.str.50@PAGEOFF
Lloh242:
	adrp	x24, l_.str.23@PAGE
Lloh243:
	add	x24, x24, l_.str.23@PAGEOFF
	b	LBB28_85
LBB28_83:                               ;   in Loop: Header=BB28_85 Depth=1
	mov	w12, wzr
	strb	wzr, [sp, #568]
LBB28_84:                               ;   in Loop: Header=BB28_85 Depth=1
	add	x0, sp, #453
	add	x1, sp, #48
	mov	w2, #1                          ; =0x1
	strh	wzr, [x19, w12, sxtw #1]
	bl	_social_chat_peer_note
	add	w22, w22, #1
	add	x0, sp, #28
	mov	w1, w21
	mov	w2, w22
	bl	_server_json_element
	mov	w25, w0
	tbnz	w0, #31, LBB28_146
LBB28_85:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_94 Depth 2
                                        ;       Child Loop BB28_102 Depth 3
	add	x0, sp, #28
	mov	w1, w25
	mov	x2, x23
	bl	_server_json_member
	strb	wzr, [sp, #453]
	tbnz	w0, #31, LBB28_87
; %bb.86:                               ;   in Loop: Header=BB28_85 Depth=1
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #453
	mov	w3, #16                         ; =0x10
	bl	_server_json_get_string
	cbnz	w0, LBB28_88
LBB28_87:                               ;   in Loop: Header=BB28_85 Depth=1
	strb	wzr, [sp, #453]
LBB28_88:                               ;   in Loop: Header=BB28_85 Depth=1
	add	x0, sp, #28
	mov	w1, w25
	mov	x2, x24
	bl	_server_json_member
	strb	wzr, [sp, #568]
	tbnz	w0, #31, LBB28_83
; %bb.89:                               ;   in Loop: Header=BB28_85 Depth=1
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #568
	mov	w3, #99                         ; =0x63
	bl	_server_json_get_string
	cbz	w0, LBB28_83
; %bb.90:                               ;   in Loop: Header=BB28_85 Depth=1
	ldrb	w9, [sp, #568]
	cbz	w9, LBB28_104
; %bb.91:                               ;   in Loop: Header=BB28_85 Depth=1
	mov	w8, wzr
	add	x10, sp, #568
	b	LBB28_94
	.p2align	4, , 8
LBB28_92:                               ;   in Loop: Header=BB28_94 Depth=2
	and	w12, w11, #0x3f
	add	x11, x10, #2
	bfi	w12, w9, #6, #5
	mov	w9, w12
LBB28_93:                               ;   in Loop: Header=BB28_94 Depth=2
	strh	w9, [x19, w8, sxtw #1]
	add	w12, w8, #1
	ldrb	w9, [x11]
	mov	x10, x11
	cmp	w9, #0
	ccmp	w8, #31, #2, ne
	mov	w8, w12
	b.hs	LBB28_84
LBB28_94:                               ;   Parent Loop BB28_85 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB28_102 Depth 3
	add	x11, x10, #1
	cmp	w9, #224
	b.lo	LBB28_99
; %bb.95:                               ;   in Loop: Header=BB28_94 Depth=2
	ldrb	w12, [x11]
	and	w13, w12, #0xc0
	cmp	w13, #128
	b.ne	LBB28_99
; %bb.96:                               ;   in Loop: Header=BB28_94 Depth=2
	cmp	w9, #239
	b.hi	LBB28_99
; %bb.97:                               ;   in Loop: Header=BB28_94 Depth=2
	ldrb	w13, [x10, #2]
	and	w14, w13, #0xc0
	cmp	w14, #128
	b.ne	LBB28_99
; %bb.98:                               ;   in Loop: Header=BB28_94 Depth=2
	ubfiz	w9, w9, #12, #4
	add	x11, x10, #3
	bfi	w9, w12, #6, #6
	bfxil	w9, w13, #0, #6
	b	LBB28_93
	.p2align	4, , 8
LBB28_99:                               ;   in Loop: Header=BB28_94 Depth=2
	and	w12, w9, #0xe0
	cmp	w12, #192
	b.ne	LBB28_101
; %bb.100:                              ;   in Loop: Header=BB28_94 Depth=2
	ldrb	w11, [x11]
	and	w12, w11, #0xc0
	cmp	w12, #128
	b.ne	LBB28_102
	b	LBB28_92
	.p2align	4, , 8
LBB28_101:                              ;   in Loop: Header=BB28_94 Depth=2
	tbz	w9, #7, LBB28_93
	.p2align	4, , 8
LBB28_102:                              ;   Parent Loop BB28_85 Depth=1
                                        ;     Parent Loop BB28_94 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	w10, w10, #1
	ldrsb	w9, [x10]
	cmn	w9, #64
	b.lt	LBB28_102
; %bb.103:                              ;   in Loop: Header=BB28_94 Depth=2
	mov	w9, #63                         ; =0x3f
	mov	x11, x10
	b	LBB28_93
LBB28_104:                              ;   in Loop: Header=BB28_85 Depth=1
	mov	w12, wzr
	b	LBB28_84
LBB28_105:
	cmp	w8, #404
	b.eq	LBB28_340
; %bb.106:
	cmp	w8, #429
	b.ne	LBB28_321
; %bb.107:
	bl	_system_milliseconds
Lloh244:
	adrp	x10, _social_chat@PAGE+36864
Lloh245:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB28_109
; %bb.108:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_109:
	mov	w9, #384                        ; =0x180
Lloh246:
	adrp	x19, _social_chat@PAGE
Lloh247:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x19
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x19, x8]
	cbz	w8, LBB28_111
; %bb.110:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_111:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB28_113
; %bb.112:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB28_113:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_116
; %bb.114:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_116
; %bb.115:
Lloh248:
	adrp	x8, _social_chat@PAGE+36968
Lloh249:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_116:
	mov	w9, wzr
	add	x8, x20, #66
	mov	w11, #84                        ; =0x54
Lloh250:
	adrp	x10, l_.str.34@PAGE
Lloh251:
	add	x10, x10, l_.str.34@PAGEOFF
	.p2align	4, , 8
LBB28_117:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_120 Depth 2
	tbnz	w11, #7, LBB28_120
; %bb.118:                              ;   in Loop: Header=BB28_117 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_121
; %bb.119:                              ;   in Loop: Header=BB28_117 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB28_124
	.p2align	4, , 8
LBB28_120:                              ;   Parent Loop BB28_117 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB28_120
	b	LBB28_123
LBB28_121:                              ;   in Loop: Header=BB28_117 Depth=1
	cmp	w12, #127
	b.eq	LBB28_123
; %bb.122:                              ;   in Loop: Header=BB28_117 Depth=1
	cmp	w12, #124
	b.ne	LBB28_124
LBB28_123:                              ;   in Loop: Header=BB28_117 Depth=1
	mov	w11, #63                        ; =0x3f
LBB28_124:                              ;   in Loop: Header=BB28_117 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB28_40
; %bb.125:                              ;   in Loop: Header=BB28_117 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB28_117
	b	LBB28_40
LBB28_126:
	bl	_config_changes
	str	w0, [x23, _social_chat_reported_shown.read_at@PAGEOFF]
Lloh252:
	adrp	x0, l_.str.59@PAGE
Lloh253:
	add	x0, x0, l_.str.59@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	cset	w8, ne
	strb	w8, [x21, _social_chat_reported_shown.shown@PAGEOFF]
LBB28_127:
Lloh254:
	adrp	x21, _social_chat@PAGE+46038
Lloh255:
	add	x21, x21, _social_chat@PAGEOFF+46038
	adrp	x25, _social_chat_global_heard.read_at@PAGE
	ldrb	w9, [x21, #222]
	ldur	w10, [x21, #218]
	ldr	w26, [x25, _social_chat_global_heard.read_at@PAGEOFF]
	strb	w8, [x21]
	cmp	w9, #0
	csel	w23, wzr, w10, eq
	bl	_config_changes
	adrp	x24, _social_chat_global_heard.heard@PAGE
	cmp	w26, w0
	b.ne	LBB28_129
; %bb.128:
	ldrb	w8, [x24, _social_chat_global_heard.heard@PAGEOFF]
	cmp	w8, #0
	cset	w8, ne
	b	LBB28_130
LBB28_129:
	bl	_config_changes
	str	w0, [x25, _social_chat_global_heard.read_at@PAGEOFF]
Lloh256:
	adrp	x0, l_.str.60@PAGE
Lloh257:
	add	x0, x0, l_.str.60@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	cset	w8, ne
	strb	w8, [x24, _social_chat_global_heard.heard@PAGEOFF]
LBB28_130:
	ldrb	w9, [x21]
Lloh258:
	adrp	x2, l_.str.55@PAGE
Lloh259:
	add	x2, x2, l_.str.55@PAGEOFF
	add	x0, sp, #568
	mov	w1, #512                        ; =0x200
	add	x25, sp, #568
	mov	w24, #512                       ; =0x200
	str	w23, [sp]
	cmp	w9, #0
	cset	w9, ne
	stp	w8, w9, [sp, #4]
	bl	_halo_linux_snprintf
	ldrb	w8, [x21, #230]
	cbz	w8, LBB28_133
; %bb.131:
	add	x0, sp, #568
	bl	_csstrlen
	add	x21, x25, w0, sxtw
	add	x0, sp, #568
	bl	_csstrlen
	mov	w8, #46268                      ; =0xb4bc
Lloh260:
	adrp	x9, _social_chat@PAGE
Lloh261:
	add	x9, x9, _social_chat@PAGEOFF
	sub	w1, w24, w0
	add	w8, w9, w8
Lloh262:
	adrp	x2, l_.str.56@PAGE
Lloh263:
	add	x2, x2, l_.str.56@PAGEOFF
	mov	x0, x21
	str	w8, [sp]
	bl	_halo_linux_snprintf
	cmn	w20, #1
	b.eq	LBB28_133
; %bb.132:
	add	x0, sp, #568
	add	x21, sp, #568
	bl	_csstrlen
	add	x21, x21, w0, sxtw
	add	x0, sp, #568
	bl	_csstrlen
	mov	w8, #512                        ; =0x200
Lloh264:
	adrp	x2, l_.str.57@PAGE
Lloh265:
	add	x2, x2, l_.str.57@PAGEOFF
	sub	w1, w8, w0
	mov	x0, x21
	str	w20, [sp]
	bl	_halo_linux_snprintf
LBB28_133:
	ldrb	w8, [sp, #48]
	cbz	w8, LBB28_144
; %bb.134:
	add	x0, sp, #568
	add	x23, sp, #568
	bl	_csstrlen
	add	x20, x23, w0, sxtw
	add	x0, sp, #568
	bl	_csstrlen
	mov	w8, #512                        ; =0x200
Lloh266:
	adrp	x2, l_.str.58@PAGE
Lloh267:
	add	x2, x2, l_.str.58@PAGEOFF
	sub	w1, w8, w0
	mov	x0, x20
	bl	_halo_linux_snprintf
	add	x0, sp, #568
	bl	_csstrlen
	ldrb	w8, [sp, #48]
	cmp	w0, #508
	mov	w20, w0
	ccmp	w8, #0, #4, lt
	b.eq	LBB28_143
; %bb.135:
	add	x9, sp, #48
Lloh268:
	adrp	x21, l_.str.61@PAGE
Lloh269:
	add	x21, x21, l_.str.61@PAGEOFF
	add	w24, w9, #1
	b	LBB28_138
	.p2align	4, , 8
LBB28_136:                              ;   in Loop: Header=BB28_138 Depth=1
	add	w9, w20, #1
	strb	w8, [x23, w20, sxtw]
	mov	w20, w9
	ldrb	w8, [x24]
	cbz	w8, LBB28_143
LBB28_137:                              ;   in Loop: Header=BB28_138 Depth=1
	add	w24, w24, #1
	cmp	w20, #508
	b.ge	LBB28_143
LBB28_138:                              ; =>This Inner Loop Header: Depth=1
	and	w9, w8, #0xffffffdf
	sub	w10, w8, #48
	sub	w9, w9, #65
	and	w9, w9, #0xff
	cmp	w9, #26
	and	w9, w10, #0xff
	ccmp	w9, #10, #0, hs
	b.lo	LBB28_136
; %bb.139:                              ;   in Loop: Header=BB28_138 Depth=1
	and	w9, w8, #0xff
	sub	w10, w9, #45
	cmp	w10, #2
	b.lo	LBB28_136
; %bb.140:                              ;   in Loop: Header=BB28_138 Depth=1
	cmp	w9, #126
	b.eq	LBB28_136
; %bb.141:                              ;   in Loop: Header=BB28_138 Depth=1
	cmp	w9, #95
	b.eq	LBB28_136
; %bb.142:                              ;   in Loop: Header=BB28_138 Depth=1
	add	x0, x23, w20, sxtw
	mov	w1, #4                          ; =0x4
	mov	x2, x21
	str	w9, [sp]
	bl	_halo_linux_snprintf
	add	w20, w20, #3
	ldrb	w8, [x24]
	cbnz	w8, LBB28_137
LBB28_143:
	strb	wzr, [x23, w20, sxtw]
LBB28_144:
	add	x0, sp, #568
	mov	x1, xzr
	bl	_social_send
	str	w0, [x19, _social_chat@PAGEOFF+46040]
	cbnz	w0, LBB28_279
; %bb.145:
	mov	w8, #15000                      ; =0x3a98
	adrp	x9, _social_chat@PAGE+46264
	add	w8, w22, w8
	str	w8, [x9, _social_chat@PAGEOFF+46264]
	b	LBB28_279
LBB28_146:
	mov	w24, w26
LBB28_147:
Lloh270:
	adrp	x2, l_.str.51@PAGE
Lloh271:
	add	x2, x2, l_.str.51@PAGEOFF
	add	x0, sp, #28
	mov	w1, w20
	bl	_server_json_member
	tbnz	w0, #31, LBB28_278
; %bb.148:
	mov	w25, w0
	add	x0, sp, #28
	mov	w1, w25
	mov	w2, wzr
	bl	_server_json_element
	tbnz	w0, #31, LBB28_278
; %bb.149:
	mov	w23, w0
	mov	w21, wzr
Lloh272:
	adrp	x26, l_.str.52@PAGE
Lloh273:
	add	x26, x26, l_.str.52@PAGEOFF
	add	x22, sp, #256
	add	x20, sp, #48
	str	w24, [sp, #12]                  ; 4-byte Spill
	b	LBB28_152
LBB28_150:                              ;   in Loop: Header=BB28_152 Depth=1
	ldrb	w8, [x0, #372]
	orr	w8, w8, #0x2
	strb	w8, [x0, #372]
LBB28_151:                              ;   in Loop: Header=BB28_152 Depth=1
	add	w21, w21, #1
	add	x0, sp, #28
	mov	w1, w25
	mov	w2, w21
	bl	_server_json_element
	mov	w23, w0
	tbnz	w0, #31, LBB28_278
LBB28_152:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_187 Depth 2
                                        ;       Child Loop BB28_195 Depth 3
                                        ;     Child Loop BB28_204 Depth 2
                                        ;       Child Loop BB28_212 Depth 3
                                        ;     Child Loop BB28_218 Depth 2
                                        ;       Child Loop BB28_221 Depth 3
                                        ;     Child Loop BB28_241 Depth 2
                                        ;       Child Loop BB28_244 Depth 3
                                        ;     Child Loop BB28_256 Depth 2
                                        ;       Child Loop BB28_264 Depth 3
	add	x0, sp, #28
	mov	w1, w23
	mov	x2, x26
	str	wzr, [sp, #252]
	bl	_server_json_member
	tbnz	w0, #31, LBB28_154
; %bb.153:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #252
	bl	_server_json_get_boolean
	cbnz	w0, LBB28_155
LBB28_154:                              ;   in Loop: Header=BB28_152 Depth=1
	str	wzr, [sp, #252]
LBB28_155:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #28
	mov	w1, w23
Lloh274:
	adrp	x2, l_.str.17@PAGE
Lloh275:
	add	x2, x2, l_.str.17@PAGEOFF
	bl	_server_json_member
	strb	wzr, [sp, #552]
	tbnz	w0, #31, LBB28_157
; %bb.156:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #552
	mov	w3, #16                         ; =0x10
	bl	_server_json_get_string
	cbnz	w0, LBB28_158
LBB28_157:                              ;   in Loop: Header=BB28_152 Depth=1
	strb	wzr, [sp, #552]
LBB28_158:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #28
	mov	w1, w23
Lloh276:
	adrp	x2, l_.str.22@PAGE
Lloh277:
	add	x2, x2, l_.str.22@PAGEOFF
	bl	_server_json_member
	strb	wzr, [sp, #568]
	tbnz	w0, #31, LBB28_160
; %bb.159:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #568
	mov	w3, #204                        ; =0xcc
	bl	_server_json_get_string
	cbnz	w0, LBB28_161
LBB28_160:                              ;   in Loop: Header=BB28_152 Depth=1
	strb	wzr, [sp, #568]
LBB28_161:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #28
	mov	w1, w23
Lloh278:
	adrp	x2, l_.str.23@PAGE
Lloh279:
	add	x2, x2, l_.str.23@PAGEOFF
	bl	_server_json_member
	strb	wzr, [sp, #453]
	tbnz	w0, #31, LBB28_163
; %bb.162:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #453
	mov	w3, #99                         ; =0x63
	bl	_server_json_get_string
	cbnz	w0, LBB28_164
LBB28_163:                              ;   in Loop: Header=BB28_152 Depth=1
	strb	wzr, [sp, #453]
LBB28_164:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #28
	mov	w1, w23
Lloh280:
	adrp	x2, l_.str.53@PAGE
Lloh281:
	add	x2, x2, l_.str.53@PAGEOFF
	bl	_server_json_member
	strb	wzr, [sp, #437]
	tbnz	w0, #31, LBB28_166
; %bb.165:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #437
	mov	w3, #16                         ; =0x10
	bl	_server_json_get_string
	cbnz	w0, LBB28_167
LBB28_166:                              ;   in Loop: Header=BB28_152 Depth=1
	strb	wzr, [sp, #437]
LBB28_167:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #28
	mov	w1, w23
Lloh282:
	adrp	x2, l_.str.25@PAGE
Lloh283:
	add	x2, x2, l_.str.25@PAGEOFF
	bl	_server_json_member
	strb	wzr, [sp, #421]
	tbnz	w0, #31, LBB28_169
; %bb.168:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #421
	mov	w3, #16                         ; =0x10
	bl	_server_json_get_string
	cbnz	w0, LBB28_170
LBB28_169:                              ;   in Loop: Header=BB28_152 Depth=1
	strb	wzr, [sp, #421]
LBB28_170:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #28
	mov	w1, w23
Lloh284:
	adrp	x2, l_.str.54@PAGE
Lloh285:
	add	x2, x2, l_.str.54@PAGEOFF
	bl	_server_json_member
	strb	wzr, [sp, #322]
	tbnz	w0, #31, LBB28_172
; %bb.171:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w1, w0
	add	x0, sp, #28
	add	x2, sp, #322
	mov	w3, #99                         ; =0x63
	bl	_server_json_get_string
	cbnz	w0, LBB28_173
LBB28_172:                              ;   in Loop: Header=BB28_152 Depth=1
	strb	wzr, [sp, #322]
LBB28_173:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #552
Lloh286:
	adrp	x1, l_.str.18@PAGE
Lloh287:
	add	x1, x1, l_.str.18@PAGEOFF
	bl	_csstrcmp
	cbz	w0, LBB28_178
; %bb.174:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #552
Lloh288:
	adrp	x1, l_.str.19@PAGE
Lloh289:
	add	x1, x1, l_.str.19@PAGEOFF
	bl	_csstrcmp
	cbz	w0, LBB28_179
; %bb.175:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #552
Lloh290:
	adrp	x1, l_.str.20@PAGE
Lloh291:
	add	x1, x1, l_.str.20@PAGEOFF
	bl	_csstrcmp
	cbz	w0, LBB28_180
; %bb.176:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #552
Lloh292:
	adrp	x1, l_.str.21@PAGE
Lloh293:
	add	x1, x1, l_.str.21@PAGEOFF
	bl	_csstrcmp
	cbnz	w0, LBB28_151
; %bb.177:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w19, wzr
	mov	w9, wzr
	mov	w23, #3                         ; =0x3
	cbnz	w24, LBB28_181
	b	LBB28_151
LBB28_178:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w19, wzr
	mov	w9, wzr
	mov	w23, wzr
	cbnz	w24, LBB28_181
	b	LBB28_151
LBB28_179:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w19, wzr
	mov	w9, #1                          ; =0x1
	mov	w23, #1                         ; =0x1
	cbnz	w24, LBB28_181
	b	LBB28_151
LBB28_180:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w9, wzr
	mov	w23, #2                         ; =0x2
	mov	w19, #1                         ; =0x1
	cbz	w24, LBB28_151
LBB28_181:                              ;   in Loop: Header=BB28_152 Depth=1
	ldrb	w8, [sp, #568]
	cbz	w8, LBB28_151
; %bb.182:                              ;   in Loop: Header=BB28_152 Depth=1
	ldrb	w8, [sp, #437]
	str	w9, [sp, #20]                   ; 4-byte Spill
	cbz	w8, LBB28_197
; %bb.183:                              ;   in Loop: Header=BB28_152 Depth=1
	bl	_social_account_code
	mov	x1, x0
	add	x0, sp, #437
	bl	_csstrcmp
	cmp	w0, #0
	cset	w8, eq
	str	w8, [sp, #24]                   ; 4-byte Spill
	ldrb	w9, [sp, #453]
	cbz	w9, LBB28_198
LBB28_184:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w8, wzr
	add	x10, sp, #453
	b	LBB28_187
	.p2align	4, , 8
LBB28_185:                              ;   in Loop: Header=BB28_187 Depth=2
	and	w12, w11, #0x3f
	add	x11, x10, #2
	bfi	w12, w9, #6, #5
	mov	w9, w12
LBB28_186:                              ;   in Loop: Header=BB28_187 Depth=2
	strh	w9, [x22, w8, sxtw #1]
	add	w12, w8, #1
	ldrb	w9, [x11]
	mov	x10, x11
	cmp	w9, #0
	ccmp	w8, #31, #2, ne
	mov	w8, w12
	b.hs	LBB28_199
LBB28_187:                              ;   Parent Loop BB28_152 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB28_195 Depth 3
	add	x11, x10, #1
	cmp	w9, #224
	b.lo	LBB28_192
; %bb.188:                              ;   in Loop: Header=BB28_187 Depth=2
	ldrb	w12, [x11]
	and	w13, w12, #0xc0
	cmp	w13, #128
	b.ne	LBB28_192
; %bb.189:                              ;   in Loop: Header=BB28_187 Depth=2
	cmp	w9, #239
	b.hi	LBB28_192
; %bb.190:                              ;   in Loop: Header=BB28_187 Depth=2
	ldrb	w13, [x10, #2]
	and	w14, w13, #0xc0
	cmp	w14, #128
	b.ne	LBB28_192
; %bb.191:                              ;   in Loop: Header=BB28_187 Depth=2
	ubfiz	w9, w9, #12, #4
	add	x11, x10, #3
	bfi	w9, w12, #6, #6
	bfxil	w9, w13, #0, #6
	b	LBB28_186
	.p2align	4, , 8
LBB28_192:                              ;   in Loop: Header=BB28_187 Depth=2
	and	w12, w9, #0xe0
	cmp	w12, #192
	b.ne	LBB28_194
; %bb.193:                              ;   in Loop: Header=BB28_187 Depth=2
	ldrb	w11, [x11]
	and	w12, w11, #0xc0
	cmp	w12, #128
	b.ne	LBB28_195
	b	LBB28_185
	.p2align	4, , 8
LBB28_194:                              ;   in Loop: Header=BB28_187 Depth=2
	tbz	w9, #7, LBB28_186
	.p2align	4, , 8
LBB28_195:                              ;   Parent Loop BB28_152 Depth=1
                                        ;     Parent Loop BB28_187 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	w10, w10, #1
	ldrsb	w9, [x10]
	cmn	w9, #64
	b.lt	LBB28_195
; %bb.196:                              ;   in Loop: Header=BB28_187 Depth=2
	mov	w9, #63                         ; =0x3f
	mov	x11, x10
	b	LBB28_186
LBB28_197:                              ;   in Loop: Header=BB28_152 Depth=1
	str	wzr, [sp, #24]                  ; 4-byte Spill
	ldrb	w9, [sp, #453]
	cbnz	w9, LBB28_184
LBB28_198:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w12, wzr
LBB28_199:                              ;   in Loop: Header=BB28_152 Depth=1
	strh	wzr, [x22, w12, sxtw #1]
	cbz	w19, LBB28_216
; %bb.200:                              ;   in Loop: Header=BB28_152 Depth=1
	ldr	w8, [sp, #24]                   ; 4-byte Reload
	add	x9, sp, #322
	cmp	w8, #0
	add	x8, sp, #453
	csel	x10, x9, x8, ne
	ldrb	w9, [x10]
	cbz	w9, LBB28_214
; %bb.201:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w8, wzr
	b	LBB28_204
	.p2align	4, , 8
LBB28_202:                              ;   in Loop: Header=BB28_204 Depth=2
	and	w12, w11, #0x3f
	add	x11, x10, #2
	bfi	w12, w9, #6, #5
	mov	w9, w12
LBB28_203:                              ;   in Loop: Header=BB28_204 Depth=2
	strh	w9, [x20, w8, sxtw #1]
	add	w12, w8, #1
	ldrb	w9, [x11]
	mov	x10, x11
	cmp	w9, #0
	ccmp	w8, #31, #2, ne
	mov	w8, w12
	b.hs	LBB28_215
LBB28_204:                              ;   Parent Loop BB28_152 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB28_212 Depth 3
	add	x11, x10, #1
	cmp	w9, #224
	b.lo	LBB28_209
; %bb.205:                              ;   in Loop: Header=BB28_204 Depth=2
	ldrb	w12, [x11]
	and	w13, w12, #0xc0
	cmp	w13, #128
	b.ne	LBB28_209
; %bb.206:                              ;   in Loop: Header=BB28_204 Depth=2
	cmp	w9, #239
	b.hi	LBB28_209
; %bb.207:                              ;   in Loop: Header=BB28_204 Depth=2
	ldrb	w13, [x10, #2]
	and	w14, w13, #0xc0
	cmp	w14, #128
	b.ne	LBB28_209
; %bb.208:                              ;   in Loop: Header=BB28_204 Depth=2
	ubfiz	w9, w9, #12, #4
	add	x11, x10, #3
	bfi	w9, w12, #6, #6
	bfxil	w9, w13, #0, #6
	b	LBB28_203
	.p2align	4, , 8
LBB28_209:                              ;   in Loop: Header=BB28_204 Depth=2
	and	w12, w9, #0xe0
	cmp	w12, #192
	b.ne	LBB28_211
; %bb.210:                              ;   in Loop: Header=BB28_204 Depth=2
	ldrb	w11, [x11]
	and	w12, w11, #0xc0
	cmp	w12, #128
	b.ne	LBB28_212
	b	LBB28_202
	.p2align	4, , 8
LBB28_211:                              ;   in Loop: Header=BB28_204 Depth=2
	tbz	w9, #7, LBB28_203
	.p2align	4, , 8
LBB28_212:                              ;   Parent Loop BB28_152 Depth=1
                                        ;     Parent Loop BB28_204 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	w10, w10, #1
	ldrsb	w9, [x10]
	cmn	w9, #64
	b.lt	LBB28_212
; %bb.213:                              ;   in Loop: Header=BB28_204 Depth=2
	mov	w9, #63                         ; =0x3f
	mov	x11, x10
	b	LBB28_203
LBB28_214:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w12, wzr
LBB28_215:                              ;   in Loop: Header=BB28_152 Depth=1
	ldr	w8, [sp, #24]                   ; 4-byte Reload
	add	x9, sp, #421
	add	x1, sp, #48
	mov	w2, wzr
	strh	wzr, [x20, w12, sxtw #1]
	cmp	w8, #0
	add	x8, sp, #437
	csel	x0, x9, x8, ne
	bl	_social_chat_peer_note
LBB28_216:                              ;   in Loop: Header=BB28_152 Depth=1
	ldrb	w10, [sp, #568]
	cbz	w10, LBB28_227
; %bb.217:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w9, wzr
	add	x8, sp, #568
	.p2align	4, , 8
LBB28_218:                              ;   Parent Loop BB28_152 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB28_221 Depth 3
	tbnz	w10, #7, LBB28_221
; %bb.219:                              ;   in Loop: Header=BB28_218 Depth=2
	add	x8, x8, #1
	and	w11, w10, #0xff
	cmp	w11, #32
	b.hs	LBB28_222
; %bb.220:                              ;   in Loop: Header=BB28_218 Depth=2
	mov	w10, #32                        ; =0x20
	b	LBB28_225
	.p2align	4, , 8
LBB28_221:                              ;   Parent Loop BB28_152 Depth=1
                                        ;     Parent Loop BB28_218 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	w8, w8, #1
	ldrsb	w10, [x8]
	cmn	w10, #64
	b.lt	LBB28_221
	b	LBB28_224
	.p2align	4, , 8
LBB28_222:                              ;   in Loop: Header=BB28_218 Depth=2
	cmp	w11, #127
	b.eq	LBB28_224
; %bb.223:                              ;   in Loop: Header=BB28_218 Depth=2
	cmp	w11, #124
	b.ne	LBB28_225
	.p2align	4, , 8
LBB28_224:                              ;   in Loop: Header=BB28_218 Depth=2
	mov	w10, #63                        ; =0x3f
LBB28_225:                              ;   in Loop: Header=BB28_218 Depth=2
	strb	w10, [x20, w9, sxtw]
	add	w11, w9, #1
	ldrb	w10, [x8]
	cbz	w10, LBB28_228
; %bb.226:                              ;   in Loop: Header=BB28_218 Depth=2
	cmp	w9, #202
	mov	w9, w11
	b.lo	LBB28_218
	b	LBB28_228
LBB28_227:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w11, wzr
LBB28_228:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, sp, #256
	add	x2, sp, #48
	mov	w1, w23
	mov	w3, #1                          ; =0x1
	strb	wzr, [x20, w11, sxtw]
	bl	_social_chat_same_line
	cbnz	w0, LBB28_150
; %bb.229:                              ;   in Loop: Header=BB28_152 Depth=1
	ldr	w8, [sp, #24]                   ; 4-byte Reload
	tbnz	w8, #0, LBB28_151
; %bb.230:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w27, w25
	bl	_system_milliseconds
Lloh294:
	adrp	x11, _social_chat@PAGE+36864
Lloh295:
	add	x11, x11, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w25, w0
	ldrsh	w8, [x11, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x10, x9, #36
	add	x10, x10, x9, lsr #63
	ldrsh	w9, [x11]
	msub	w8, w10, w12, w8
	cmp	w9, #95
	strh	w8, [x11, #2]
	b.gt	LBB28_232
; %bb.231:                              ;   in Loop: Header=BB28_152 Depth=1
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_232:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w9, #384                        ; =0x180
Lloh296:
	adrp	x26, _social_chat@PAGE
Lloh297:
	add	x26, x26, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x24, w8, w9, x26
	mov	w2, #384                        ; =0x180
	mov	x0, x24
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w25, [x24, #380]
	ldrh	w8, [x26, x8]
	cbz	w8, LBB28_234
; %bb.233:                              ;   in Loop: Header=BB28_152 Depth=1
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_234:                              ;   in Loop: Header=BB28_152 Depth=1
	adrp	x9, _social_chat@PAGE+36972
	mov	w25, w27
	ldrh	w8, [x9, _social_chat@PAGEOFF+36972]
	cbz	w8, LBB28_236
; %bb.235:                              ;   in Loop: Header=BB28_152 Depth=1
	add	w8, w8, #1
	strh	w8, [x9, _social_chat@PAGEOFF+36972]
LBB28_236:                              ;   in Loop: Header=BB28_152 Depth=1
	adrp	x8, _social_chat@PAGE+36968
	adrp	x27, _social_chat_replaces_upstream.on@PAGE
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_239
; %bb.237:                              ;   in Loop: Header=BB28_152 Depth=1
	adrp	x10, _social_chat@PAGE+36970
	ldrh	w8, [x10, _social_chat@PAGEOFF+36970]
	add	w8, w8, #1
	sxth	w9, w8
	cmp	w9, #96
	strh	w8, [x10, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_239
; %bb.238:                              ;   in Loop: Header=BB28_152 Depth=1
Lloh298:
	adrp	x8, _social_chat@PAGE+36968
Lloh299:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_239:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x1, sp, #256
	mov	x0, x24
	mov	w2, #32                         ; =0x20
	bl	_ustrncpy
	ldrb	w11, [sp, #568]
	add	x8, x24, #66
Lloh300:
	adrp	x26, l_.str.52@PAGE
Lloh301:
	add	x26, x26, l_.str.52@PAGEOFF
	cbz	w11, LBB28_250
; %bb.240:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w10, wzr
	add	x9, sp, #568
	.p2align	4, , 8
LBB28_241:                              ;   Parent Loop BB28_152 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB28_244 Depth 3
	tbnz	w11, #7, LBB28_244
; %bb.242:                              ;   in Loop: Header=BB28_241 Depth=2
	add	x9, x9, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_245
; %bb.243:                              ;   in Loop: Header=BB28_241 Depth=2
	mov	w11, #32                        ; =0x20
	b	LBB28_248
	.p2align	4, , 8
LBB28_244:                              ;   Parent Loop BB28_152 Depth=1
                                        ;     Parent Loop BB28_241 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	w9, w9, #1
	ldrsb	w11, [x9]
	cmn	w11, #64
	b.lt	LBB28_244
	b	LBB28_247
LBB28_245:                              ;   in Loop: Header=BB28_241 Depth=2
	cmp	w12, #127
	b.eq	LBB28_247
; %bb.246:                              ;   in Loop: Header=BB28_241 Depth=2
	cmp	w12, #124
	b.ne	LBB28_248
	.p2align	4, , 8
LBB28_247:                              ;   in Loop: Header=BB28_241 Depth=2
	mov	w11, #63                        ; =0x3f
LBB28_248:                              ;   in Loop: Header=BB28_241 Depth=2
	strb	w11, [x8, w10, sxtw]
	add	w12, w10, #1
	ldrb	w11, [x9]
	cbz	w11, LBB28_251
; %bb.249:                              ;   in Loop: Header=BB28_241 Depth=2
	cmp	w10, #202
	mov	w10, w12
	b.lo	LBB28_241
	b	LBB28_251
LBB28_250:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w12, wzr
LBB28_251:                              ;   in Loop: Header=BB28_152 Depth=1
	ldr	w9, [sp, #252]
	add	x0, x24, #270
	strb	wzr, [x8, w12, sxtw]
	add	x1, sp, #437
	mov	w2, #15                         ; =0xf
	strh	w23, [x24, #368]
	cmp	w9, #0
	ldr	w9, [sp, #24]                   ; 4-byte Reload
	cset	w8, ne
	strb	w9, [x24, #373]
	strb	w8, [x24, #375]
	bl	_csstrncpy
	strh	wzr, [x24, #370]
	cbz	w19, LBB28_268
; %bb.252:                              ;   in Loop: Header=BB28_152 Depth=1
	add	x0, x24, #286
	add	x1, sp, #437
	mov	w2, #15                         ; =0xf
	bl	_csstrncpy
	ldrb	w10, [sp, #453]
	add	x8, x24, #302
	cbz	w10, LBB28_266
; %bb.253:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w9, wzr
	add	x11, sp, #453
	b	LBB28_256
LBB28_254:                              ;   in Loop: Header=BB28_256 Depth=2
	and	w13, w12, #0x3f
	add	x12, x11, #2
	bfi	w13, w10, #6, #5
	mov	w10, w13
LBB28_255:                              ;   in Loop: Header=BB28_256 Depth=2
	strh	w10, [x8, w9, sxtw #1]
	add	w13, w9, #1
	ldrb	w10, [x12]
	mov	x11, x12
	cmp	w10, #0
	ccmp	w9, #31, #2, ne
	mov	w9, w13
	b.hs	LBB28_267
LBB28_256:                              ;   Parent Loop BB28_152 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB28_264 Depth 3
	add	x12, x11, #1
	cmp	w10, #224
	b.lo	LBB28_261
; %bb.257:                              ;   in Loop: Header=BB28_256 Depth=2
	ldrb	w13, [x12]
	and	w14, w13, #0xc0
	cmp	w14, #128
	b.ne	LBB28_261
; %bb.258:                              ;   in Loop: Header=BB28_256 Depth=2
	cmp	w10, #239
	b.hi	LBB28_261
; %bb.259:                              ;   in Loop: Header=BB28_256 Depth=2
	ldrb	w14, [x11, #2]
	and	w15, w14, #0xc0
	cmp	w15, #128
	b.ne	LBB28_261
; %bb.260:                              ;   in Loop: Header=BB28_256 Depth=2
	ubfiz	w10, w10, #12, #4
	add	x12, x11, #3
	bfi	w10, w13, #6, #6
	bfxil	w10, w14, #0, #6
	b	LBB28_255
LBB28_261:                              ;   in Loop: Header=BB28_256 Depth=2
	and	w13, w10, #0xe0
	cmp	w13, #192
	b.ne	LBB28_263
; %bb.262:                              ;   in Loop: Header=BB28_256 Depth=2
	ldrb	w12, [x12]
	and	w13, w12, #0xc0
	cmp	w13, #128
	b.ne	LBB28_264
	b	LBB28_254
LBB28_263:                              ;   in Loop: Header=BB28_256 Depth=2
	tbz	w10, #7, LBB28_255
	.p2align	4, , 8
LBB28_264:                              ;   Parent Loop BB28_152 Depth=1
                                        ;     Parent Loop BB28_256 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	w11, w11, #1
	ldrsb	w10, [x11]
	cmn	w10, #64
	b.lt	LBB28_264
; %bb.265:                              ;   in Loop: Header=BB28_256 Depth=2
	mov	w10, #63                        ; =0x3f
	mov	x12, x11
	b	LBB28_255
LBB28_266:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w13, wzr
LBB28_267:                              ;   in Loop: Header=BB28_152 Depth=1
	strh	wzr, [x8, w13, sxtw #1]
LBB28_268:                              ;   in Loop: Header=BB28_152 Depth=1
	ldr	w8, [sp, #20]                   ; 4-byte Reload
	cbz	w8, LBB28_277
; %bb.269:                              ;   in Loop: Header=BB28_152 Depth=1
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.hi	LBB28_277
; %bb.270:                              ;   in Loop: Header=BB28_152 Depth=1
	bl	_game_engine_has_teams
	cbz	w0, LBB28_277
; %bb.271:                              ;   in Loop: Header=BB28_152 Depth=1
	bl	_social_chat_team
	cbz	w0, LBB28_274
; %bb.272:                              ;   in Loop: Header=BB28_152 Depth=1
	and	w8, w0, #0xffff
	cmp	w8, #1
	b.ne	LBB28_275
; %bb.273:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w8, #2                          ; =0x2
	b	LBB28_276
LBB28_274:                              ;   in Loop: Header=BB28_152 Depth=1
	mov	w8, #1                          ; =0x1
	b	LBB28_276
LBB28_275:                              ;   in Loop: Header=BB28_152 Depth=1
	ldrh	w8, [x24, #370]
LBB28_276:                              ;   in Loop: Header=BB28_152 Depth=1
	strh	w8, [x24, #370]
LBB28_277:                              ;   in Loop: Header=BB28_152 Depth=1
	ldrb	w8, [x24, #372]
	orr	w8, w8, #0x2
	strb	w8, [x24, #372]
	ldr	w24, [sp, #12]                  ; 4-byte Reload
	b	LBB28_151
LBB28_278:
	add	x0, sp, #28
	bl	_server_json_document_free
	ldr	w22, [sp, #16]                  ; 4-byte Reload
LBB28_279:
Lloh302:
	adrp	x24, _social_chat@PAGE+36868
Lloh303:
	add	x24, x24, _social_chat@PAGEOFF+36868
LBB28_280:
	ldr	w19, [x28, _social_chat_replaces_upstream.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w19, w0
	b.ne	LBB28_282
; %bb.281:
	ldrb	w8, [x27, _social_chat_replaces_upstream.on@PAGEOFF]
	cbnz	w8, LBB28_283
	b	LBB28_287
LBB28_282:
	bl	_config_changes
	str	w0, [x28, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh304:
	adrp	x0, l_.str@PAGE
Lloh305:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	cset	w8, ne
	strb	w8, [x27, _social_chat_replaces_upstream.on@PAGEOFF]
	cbz	w8, LBB28_287
LBB28_283:
	adrp	x19, _social_chat_shown.read_at@PAGE
	ldr	w20, [x19, _social_chat_shown.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w20, w0
	b.ne	LBB28_285
; %bb.284:
	adrp	x8, _social_chat_shown.shown@PAGE
	ldrb	w8, [x8, _social_chat_shown.shown@PAGEOFF]
	cbnz	w8, LBB28_286
	b	LBB28_287
LBB28_285:
	bl	_config_changes
	str	w0, [x19, _social_chat_shown.read_at@PAGEOFF]
Lloh306:
	adrp	x0, l_.str.3@PAGE
Lloh307:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x8, _social_chat_shown.shown@PAGE
	cset	w9, ne
	strb	w9, [x8, _social_chat_shown.shown@PAGEOFF]
	cbz	w0, LBB28_287
LBB28_286:
	bl	_network_replay_playing
	cbz	w0, LBB28_292
LBB28_287:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB28_289
; %bb.288:
	bl	_system_milliseconds
	adrp	x8, _social_chat@PAGE+36948
	orr	w9, w0, #0x1
	str	w9, [x8, _social_chat@PAGEOFF+36948]
LBB28_289:
Lloh308:
	adrp	x8, _social_chat_keyboard@PAGE
Lloh309:
	add	x8, x8, _social_chat_keyboard@PAGEOFF
	strb	wzr, [x24]
	strh	wzr, [x24, #76]
	strh	wzr, [x8]
	strb	wzr, [x8, #20]
Lloh310:
	adrp	x8, _social_chat_player@PAGE
Lloh311:
	add	x8, x8, _social_chat_player@PAGEOFF
	strh	wzr, [x24, #112]
LBB28_290:
	strb	wzr, [x8]
	strb	wzr, [x8, #110]
	strh	wzr, [x8, #176]
LBB28_291:
	add	sp, sp, #1088
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB28_292:
	adrp	x8, _social_chat@PAGE+36980
	ldrh	w19, [x8, _social_chat@PAGEOFF+36980]
	cbz	w19, LBB28_298
; %bb.293:
	ldrb	w8, [x24]
	strh	wzr, [x24, #112]
	cbz	w8, LBB28_296
; %bb.294:
Lloh312:
	adrp	x8, _social_chat@PAGE+36876
Lloh313:
	ldr	w8, [x8, _social_chat@PAGEOFF+36876]
	sub	w8, w22, w8
	cmp	w8, #301
	b.lo	LBB28_296
; %bb.295:
	bl	_system_milliseconds
Lloh314:
	adrp	x8, _social_chat_keyboard@PAGE
Lloh315:
	add	x8, x8, _social_chat_keyboard@PAGEOFF
	orr	w9, w0, #0x1
	strb	wzr, [x24]
	strh	wzr, [x24, #76]
	strh	wzr, [x8]
	strb	wzr, [x8, #20]
Lloh316:
	adrp	x8, _social_chat_player@PAGE
Lloh317:
	add	x8, x8, _social_chat_player@PAGEOFF
	str	w9, [x24, #80]
	strb	wzr, [x8]
	strb	wzr, [x8, #110]
	strh	wzr, [x8, #176]
	b	LBB28_298
LBB28_296:
	bl	_console_is_active
	cbnz	w0, LBB28_298
; %bb.297:
	sub	w8, w19, #1
	sxth	w19, w8
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	mov	w1, w19
	cmp	w9, w8, uxth
	mov	w8, #3                          ; =0x3
	csel	w0, w8, wzr, hi
	bl	_social_chat_open
LBB28_298:
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.hi	LBB28_301
; %bb.299:
	bl	_game_in_progress
	cbz	w0, LBB28_301
; %bb.300:
	mov	w9, wzr
	b	LBB28_306
LBB28_301:
	bl	_game_in_progress
	cbz	w0, LBB28_303
; %bb.302:
	bl	_ui_widgets_active
	cbz	w0, LBB28_304
LBB28_303:
	bl	_halo_keyboard_actions_anywhere
	b	LBB28_305
LBB28_304:
	bl	_halo_keyboard_actions
LBB28_305:
	and	w9, w0, #0x180000
LBB28_306:
	ldr	w10, [x24, #108]
	ldrb	w8, [x24]
	str	w9, [x24, #108]
	bics	w19, w9, w10
	b.eq	LBB28_311
; %bb.307:
	cbnz	w8, LBB28_311
; %bb.308:
	bl	_console_is_active
	cbnz	w0, LBB28_310
; %bb.309:
	tst	w19, #0x80000
	mov	w8, #3                          ; =0x3
	csinc	w0, w8, wzr, ne
	mov	w1, #-1                         ; =0xffffffff
	bl	_social_chat_open
LBB28_310:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
LBB28_311:
	cbz	w8, LBB28_291
; %bb.312:
	bl	_console_is_active
	cbnz	w0, LBB28_291
; %bb.313:
	adrp	x8, _social_chat_keyboard@PAGE
	adrp	x20, _social_chat_player@PAGE
	ldrb	w8, [x8, _social_chat_keyboard@PAGEOFF]
	cbz	w8, LBB28_486
; %bb.314:
	bl	_halo_chat_pad_buttons
	mov	w19, w0
	bl	_system_milliseconds
Lloh318:
	adrp	x9, _social_chat_keyboard@PAGE+8
Lloh319:
	add	x9, x9, _social_chat_keyboard@PAGEOFF+8
	ldrb	w8, [x20, _social_chat_player@PAGEOFF]
	ldp	w11, w10, [x9]
	and	w10, w10, w19
	eor	w21, w10, w19
	bic	w19, w21, w11
	stp	w21, w10, [x9]
	cbz	w8, LBB28_359
; %bb.315:
	tbnz	w19, #5, LBB28_371
; %bb.316:
	tbnz	w19, #4, LBB28_396
; %bb.317:
	mov	w8, #513                        ; =0x201
	tst	w19, w8
	b.eq	LBB28_419
; %bb.318:
Lloh320:
	adrp	x8, _social_chat_player@PAGE+98
Lloh321:
	add	x8, x8, _social_chat_player@PAGEOFF+98
	ldrb	w9, [x8, #4]
	cbnz	w9, LBB28_486
; %bb.319:
	ldrsh	w8, [x8]
	cmp	w8, #1
	b.lt	LBB28_486
; %bb.320:
	adrp	x9, _social_chat_player@PAGE+100
	ldrsh	w10, [x9, _social_chat_player@PAGEOFF+100]
	add	w10, w8, w10
	sub	w10, w10, #1
	b	LBB28_423
LBB28_321:
	bl	_system_milliseconds
Lloh322:
	adrp	x10, _social_chat@PAGE+36864
Lloh323:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB28_323
; %bb.322:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_323:
	mov	w9, #384                        ; =0x180
Lloh324:
	adrp	x19, _social_chat@PAGE
Lloh325:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x19
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x19, x8]
	cbz	w8, LBB28_325
; %bb.324:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_325:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB28_327
; %bb.326:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB28_327:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_330
; %bb.328:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_330
; %bb.329:
Lloh326:
	adrp	x8, _social_chat@PAGE+36968
Lloh327:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_330:
	mov	w9, wzr
	add	x8, x20, #66
	mov	w11, #84                        ; =0x54
Lloh328:
	adrp	x10, l_.str.45@PAGE
Lloh329:
	add	x10, x10, l_.str.45@PAGEOFF
	.p2align	4, , 8
LBB28_331:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_334 Depth 2
	tbnz	w11, #7, LBB28_334
; %bb.332:                              ;   in Loop: Header=BB28_331 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_335
; %bb.333:                              ;   in Loop: Header=BB28_331 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB28_338
	.p2align	4, , 8
LBB28_334:                              ;   Parent Loop BB28_331 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB28_334
	b	LBB28_337
LBB28_335:                              ;   in Loop: Header=BB28_331 Depth=1
	cmp	w12, #127
	b.eq	LBB28_337
; %bb.336:                              ;   in Loop: Header=BB28_331 Depth=1
	cmp	w12, #124
	b.ne	LBB28_338
LBB28_337:                              ;   in Loop: Header=BB28_331 Depth=1
	mov	w11, #63                        ; =0x3f
LBB28_338:                              ;   in Loop: Header=BB28_331 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB28_40
; %bb.339:                              ;   in Loop: Header=BB28_331 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB28_331
	b	LBB28_40
LBB28_340:
	bl	_system_milliseconds
Lloh330:
	adrp	x10, _social_chat@PAGE+36864
Lloh331:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB28_342
; %bb.341:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_342:
	mov	w9, #384                        ; =0x180
Lloh332:
	adrp	x19, _social_chat@PAGE
Lloh333:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x19
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x19, x8]
	cbz	w8, LBB28_344
; %bb.343:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_344:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB28_346
; %bb.345:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB28_346:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_349
; %bb.347:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_349
; %bb.348:
Lloh334:
	adrp	x8, _social_chat@PAGE+36968
Lloh335:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_349:
	mov	w9, wzr
	add	x8, x20, #66
	mov	w11, #84                        ; =0x54
Lloh336:
	adrp	x10, l_.str.35@PAGE
Lloh337:
	add	x10, x10, l_.str.35@PAGEOFF
	.p2align	4, , 8
LBB28_350:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_353 Depth 2
	tbnz	w11, #7, LBB28_353
; %bb.351:                              ;   in Loop: Header=BB28_350 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_354
; %bb.352:                              ;   in Loop: Header=BB28_350 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB28_357
	.p2align	4, , 8
LBB28_353:                              ;   Parent Loop BB28_350 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB28_353
	b	LBB28_356
LBB28_354:                              ;   in Loop: Header=BB28_350 Depth=1
	cmp	w12, #127
	b.eq	LBB28_356
; %bb.355:                              ;   in Loop: Header=BB28_350 Depth=1
	cmp	w12, #124
	b.ne	LBB28_357
LBB28_356:                              ;   in Loop: Header=BB28_350 Depth=1
	mov	w11, #63                        ; =0x3f
LBB28_357:                              ;   in Loop: Header=BB28_350 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB28_40
; %bb.358:                              ;   in Loop: Header=BB28_350 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB28_350
	b	LBB28_40
LBB28_359:
	tbnz	w19, #5, LBB28_393
; %bb.360:
	tbnz	w19, #8, LBB28_418
; %bb.361:
	mov	w22, w0
	tbz	w19, #13, LBB28_363
; %bb.362:
	mov	w0, #-1                         ; =0xffffffff
	bl	_social_chat_channel_step
	mov	w0, w22
LBB28_363:
	tbz	w19, #14, LBB28_365
; %bb.364:
	mov	w0, #1                          ; =0x1
	bl	_social_chat_channel_step
	mov	w0, w22
LBB28_365:
	adrp	x8, _social_chat@PAGE+36872
	ldrh	w8, [x8, _social_chat@PAGEOFF+36872]
	cbz	w8, LBB28_444
LBB28_366:
	adrp	x8, _social_chat_keyboard@PAGE+1
	ldrb	w8, [x8, _social_chat_keyboard@PAGEOFF+1]
	cbz	w8, LBB28_446
; %bb.367:
	adrp	x8, _social_chat@PAGE+39670
	tbz	w19, #0, LBB28_370
; %bb.368:
	ldrsh	w9, [x8, _social_chat@PAGEOFF+39670]
	cmp	w9, #1
	b.lt	LBB28_370
; %bb.369:
	adrp	x10, _social_chat@PAGE+39672
	ldrsh	w11, [x10, _social_chat@PAGEOFF+39672]
	add	w11, w9, w11
	sub	w11, w11, #1
	sdiv	w12, w11, w9
	msub	w9, w12, w9, w11
	strh	w9, [x10, _social_chat@PAGEOFF+39672]
LBB28_370:
	tbnz	w19, #1, LBB28_483
	b	LBB28_486
LBB28_371:
	adrp	x8, _social_chat_player@PAGE+102
	ldrb	w9, [x8, _social_chat_player@PAGEOFF+102]
	cbz	w9, LBB28_397
; %bb.372:
	strb	wzr, [x8, _social_chat_player@PAGEOFF+102]
	b	LBB28_486
LBB28_373:
Lloh338:
	adrp	x0, _social_chat@PAGE+46292
Lloh339:
	add	x0, x0, _social_chat@PAGEOFF+46292
Lloh340:
	adrp	x1, l_.str.38@PAGE
Lloh341:
	add	x1, x1, l_.str.38@PAGEOFF
	bl	_strstr
	cbz	w0, LBB28_398
; %bb.374:
	bl	_system_milliseconds
Lloh342:
	adrp	x10, _social_chat@PAGE+36864
Lloh343:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB28_376
; %bb.375:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_376:
	mov	w9, #384                        ; =0x180
Lloh344:
	adrp	x19, _social_chat@PAGE
Lloh345:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x19
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x19, x8]
	cbz	w8, LBB28_378
; %bb.377:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_378:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB28_380
; %bb.379:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB28_380:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_383
; %bb.381:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_383
; %bb.382:
Lloh346:
	adrp	x8, _social_chat@PAGE+36968
Lloh347:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_383:
	mov	w9, wzr
	add	x8, x20, #66
	mov	w11, #89                        ; =0x59
Lloh348:
	adrp	x10, l_.str.39@PAGE
Lloh349:
	add	x10, x10, l_.str.39@PAGEOFF
LBB28_384:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_387 Depth 2
	tbnz	w11, #7, LBB28_387
; %bb.385:                              ;   in Loop: Header=BB28_384 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_388
; %bb.386:                              ;   in Loop: Header=BB28_384 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB28_391
	.p2align	4, , 8
LBB28_387:                              ;   Parent Loop BB28_384 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB28_387
	b	LBB28_390
LBB28_388:                              ;   in Loop: Header=BB28_384 Depth=1
	cmp	w12, #127
	b.eq	LBB28_390
; %bb.389:                              ;   in Loop: Header=BB28_384 Depth=1
	cmp	w12, #124
	b.ne	LBB28_391
LBB28_390:                              ;   in Loop: Header=BB28_384 Depth=1
	mov	w11, #63                        ; =0x3f
LBB28_391:                              ;   in Loop: Header=BB28_384 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB28_40
; %bb.392:                              ;   in Loop: Header=BB28_384 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB28_384
	b	LBB28_40
LBB28_393:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB28_395
; %bb.394:
	bl	_system_milliseconds
	adrp	x8, _social_chat@PAGE+36948
	orr	w9, w0, #0x1
	str	w9, [x8, _social_chat@PAGEOFF+36948]
LBB28_395:
Lloh350:
	adrp	x8, _social_chat_keyboard@PAGE
Lloh351:
	add	x8, x8, _social_chat_keyboard@PAGEOFF
	strb	wzr, [x24]
	strh	wzr, [x24, #76]
	strh	wzr, [x8]
	strb	wzr, [x8, #20]
Lloh352:
	adrp	x8, _social_chat_player@PAGE
Lloh353:
	add	x8, x8, _social_chat_player@PAGEOFF
	strb	wzr, [x8]
	strb	wzr, [x8, #110]
	strh	wzr, [x8, #176]
	b	LBB28_486
LBB28_396:
	bl	_social_chat_player_pick
	b	LBB28_486
LBB28_397:
Lloh354:
	adrp	x8, _social_chat_player@PAGE
Lloh355:
	add	x8, x8, _social_chat_player@PAGEOFF
	strb	wzr, [x8]
	strb	wzr, [x8, #110]
	b	LBB28_486
LBB28_398:
Lloh356:
	adrp	x0, _social_chat@PAGE+46292
Lloh357:
	add	x0, x0, _social_chat@PAGEOFF+46292
Lloh358:
	adrp	x1, l_.str.40@PAGE
Lloh359:
	add	x1, x1, l_.str.40@PAGEOFF
	bl	_strstr
	cbz	w0, LBB28_424
; %bb.399:
	bl	_system_milliseconds
Lloh360:
	adrp	x10, _social_chat@PAGE+36864
Lloh361:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB28_401
; %bb.400:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_401:
	mov	w9, #384                        ; =0x180
Lloh362:
	adrp	x19, _social_chat@PAGE
Lloh363:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x19
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x19, x8]
	cbz	w8, LBB28_403
; %bb.402:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_403:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB28_405
; %bb.404:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB28_405:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_408
; %bb.406:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_408
; %bb.407:
Lloh364:
	adrp	x8, _social_chat@PAGE+36968
Lloh365:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_408:
	mov	w9, wzr
	add	x8, x20, #66
	mov	w11, #84                        ; =0x54
Lloh366:
	adrp	x10, l_.str.41@PAGE
Lloh367:
	add	x10, x10, l_.str.41@PAGEOFF
LBB28_409:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_412 Depth 2
	tbnz	w11, #7, LBB28_412
; %bb.410:                              ;   in Loop: Header=BB28_409 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_413
; %bb.411:                              ;   in Loop: Header=BB28_409 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB28_416
	.p2align	4, , 8
LBB28_412:                              ;   Parent Loop BB28_409 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB28_412
	b	LBB28_415
LBB28_413:                              ;   in Loop: Header=BB28_409 Depth=1
	cmp	w12, #127
	b.eq	LBB28_415
; %bb.414:                              ;   in Loop: Header=BB28_409 Depth=1
	cmp	w12, #124
	b.ne	LBB28_416
LBB28_415:                              ;   in Loop: Header=BB28_409 Depth=1
	mov	w11, #63                        ; =0x3f
LBB28_416:                              ;   in Loop: Header=BB28_409 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB28_40
; %bb.417:                              ;   in Loop: Header=BB28_409 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB28_409
	b	LBB28_40
LBB28_418:
	bl	_social_chat_send_typed
	b	LBB28_486
LBB28_419:
	mov	w8, #1026                       ; =0x402
	tst	w19, w8
	b.eq	LBB28_486
; %bb.420:
Lloh368:
	adrp	x8, _social_chat_player@PAGE+98
Lloh369:
	add	x8, x8, _social_chat_player@PAGEOFF+98
	ldrb	w9, [x8, #4]
	cbnz	w9, LBB28_486
; %bb.421:
	ldrsh	w8, [x8]
	cmp	w8, #1
	b.lt	LBB28_486
; %bb.422:
	adrp	x9, _social_chat_player@PAGE+100
	ldrsh	w10, [x9, _social_chat_player@PAGEOFF+100]
	add	w10, w8, w10
	add	w10, w10, #1
LBB28_423:
	sdiv	w11, w10, w8
	msub	w8, w11, w8, w10
	strh	w8, [x9, _social_chat_player@PAGEOFF+100]
	b	LBB28_486
LBB28_424:
	mov	w8, #9428                       ; =0x24d4
Lloh370:
	adrp	x19, _social_chat@PAGE+36864
Lloh371:
	add	x19, x19, _social_chat@PAGEOFF+36864
Lloh372:
	adrp	x1, l_.str.42@PAGE
Lloh373:
	add	x1, x1, l_.str.42@PAGEOFF
	add	x0, x19, x8
	bl	_strstr
	mov	x20, x0
	bl	_system_milliseconds
	ldrsh	w8, [x19, #2]
	mov	w9, #43691                      ; =0xaaab
	movk	w9, #10922, lsl #16
	mov	w21, w0
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x10, x9, #36
	add	x9, x10, x9, lsr #63
	mov	w10, #96                        ; =0x60
	msub	w8, w9, w10, w8
	ldrsh	w9, [x19]
	cmp	w9, #95
	strh	w8, [x19, #2]
	cbz	w20, LBB28_451
; %bb.425:
	b.gt	LBB28_427
; %bb.426:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_427:
	mov	w9, #384                        ; =0x180
Lloh374:
	adrp	x19, _social_chat@PAGE
Lloh375:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x19
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x19, x8]
	cbz	w8, LBB28_429
; %bb.428:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_429:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB28_431
; %bb.430:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB28_431:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_434
; %bb.432:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_434
; %bb.433:
Lloh376:
	adrp	x8, _social_chat@PAGE+36968
Lloh377:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_434:
	mov	w9, wzr
	add	x8, x20, #66
	mov	w11, #89                        ; =0x59
Lloh378:
	adrp	x10, l_.str.43@PAGE
Lloh379:
	add	x10, x10, l_.str.43@PAGEOFF
LBB28_435:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_438 Depth 2
	tbnz	w11, #7, LBB28_438
; %bb.436:                              ;   in Loop: Header=BB28_435 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_439
; %bb.437:                              ;   in Loop: Header=BB28_435 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB28_442
LBB28_438:                              ;   Parent Loop BB28_435 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB28_438
	b	LBB28_441
LBB28_439:                              ;   in Loop: Header=BB28_435 Depth=1
	cmp	w12, #127
	b.eq	LBB28_441
; %bb.440:                              ;   in Loop: Header=BB28_435 Depth=1
	cmp	w12, #124
	b.ne	LBB28_442
LBB28_441:                              ;   in Loop: Header=BB28_435 Depth=1
	mov	w11, #63                        ; =0x3f
LBB28_442:                              ;   in Loop: Header=BB28_435 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB28_40
; %bb.443:                              ;   in Loop: Header=BB28_435 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB28_435
	b	LBB28_40
LBB28_444:
	add	x0, sp, #568
	add	x1, sp, #48
	bl	_halo_chat_taps
	mov	w8, w0
	mov	w0, w22
	cbz	w8, LBB28_366
; %bb.445:
Lloh380:
	adrp	x8, _render@GOTPAGE
Lloh381:
	ldr	w8, [x8, _render@GOTPAGEOFF]
	ldr	s2, [sp, #568]
	ldr	s3, [sp, #48]
	ldrsh	w9, [x8, #66]
	ldrsh	w10, [x8, #62]
	ldrsh	w11, [x8, #64]
	ldrsh	w8, [x8, #60]
	sub	w9, w9, w10
	sub	w8, w11, w8
	scvtf	s0, w9
	scvtf	s1, w8
	fmul	s0, s2, s0
	fmul	s1, s3, s1
	fcvtzs	w0, s0
	fcvtzs	w1, s1
	bl	_social_chat_click
	adrp	x8, _social_chat@PAGE+36868
	mov	w0, w22
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbnz	w8, LBB28_366
	b	LBB28_486
LBB28_446:
	mov	w8, #4104                       ; =0x1008
	mov	w9, #7695                       ; =0x1e0f
	tst	w21, w8
	mov	w8, #2052                       ; =0x804
	cset	w10, ne
	tst	w21, w8
	and	w9, w21, w9
	csinv	w11, w10, wzr, eq
	adrp	x8, _social_chat_keyboard@PAGE+16
	cbz	w9, LBB28_472
; %bb.447:
	ldr	w9, [x8, _social_chat_keyboard@PAGEOFF+16]
	cbz	w9, LBB28_449
; %bb.448:
	sub	w10, w0, w9
	tbnz	w10, #31, LBB28_473
LBB28_449:
	mov	w10, #1026                      ; =0x402
	mov	w12, #513                       ; =0x201
	tst	w21, w10
Lloh382:
	adrp	x10, _social_chat_keyboard@PAGE+2
Lloh383:
	add	x10, x10, _social_chat_keyboard@PAGEOFF+2
	mov	w14, #5                         ; =0x5
	and	w12, w21, w12
	cinc	w14, w14, ne
	cmp	w12, #0
	mov	w12, #4                         ; =0x4
	ldrsh	w13, [x10]
	csel	w12, w14, w12, eq
	add	w12, w12, w13
	mov	w13, #26215                     ; =0x6667
	movk	w13, #26214, lsl #16
	smull	x13, w12, w13
	asr	x14, x13, #33
	add	x13, x14, x13, lsr #63
	add	w14, w13, w13, lsl #2
	ldrsh	w13, [x10, #2]
	sub	w12, w12, w14
	cmp	w12, #4
	b.ne	LBB28_470
; %bb.450:
	and	w14, w13, #0x8000
	lsl	w11, w11, #1
	add	w13, w13, w14, lsr #15
	and	w13, w13, #0xfffe
	add	w11, w11, w13, sxth
	b	LBB28_471
LBB28_451:
	b.gt	LBB28_453
; %bb.452:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB28_453:
	mov	w9, #384                        ; =0x180
Lloh384:
	adrp	x19, _social_chat@PAGE
Lloh385:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w1, wzr
	smaddl	x20, w8, w9, x19
	mov	w2, #384                        ; =0x180
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x19, x8]
	cbz	w8, LBB28_455
; %bb.454:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB28_455:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB28_457
; %bb.456:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB28_457:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB28_460
; %bb.458:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB28_460
; %bb.459:
Lloh386:
	adrp	x8, _social_chat@PAGE+36968
Lloh387:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB28_460:
	mov	w9, wzr
	add	x8, x20, #66
	mov	w11, #84                        ; =0x54
Lloh388:
	adrp	x10, l_.str.44@PAGE
Lloh389:
	add	x10, x10, l_.str.44@PAGEOFF
LBB28_461:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_464 Depth 2
	tbnz	w11, #7, LBB28_464
; %bb.462:                              ;   in Loop: Header=BB28_461 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB28_465
; %bb.463:                              ;   in Loop: Header=BB28_461 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB28_468
LBB28_464:                              ;   Parent Loop BB28_461 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB28_464
	b	LBB28_467
LBB28_465:                              ;   in Loop: Header=BB28_461 Depth=1
	cmp	w12, #127
	b.eq	LBB28_467
; %bb.466:                              ;   in Loop: Header=BB28_461 Depth=1
	cmp	w12, #124
	b.ne	LBB28_468
LBB28_467:                              ;   in Loop: Header=BB28_461 Depth=1
	mov	w11, #63                        ; =0x3f
LBB28_468:                              ;   in Loop: Header=BB28_461 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB28_40
; %bb.469:                              ;   in Loop: Header=BB28_461 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB28_461
	b	LBB28_40
LBB28_470:
	add	w11, w11, w13
LBB28_471:
	mov	w13, #26215                     ; =0x6667
	add	w11, w11, #10
	movk	w13, #26214, lsl #16
	mov	w14, #10                        ; =0xa
	cmp	w9, #0
	mov	w9, #120                        ; =0x78
	smull	x13, w11, w13
	strh	w12, [x10]
	lsr	x15, x13, #34
	add	x13, x15, x13, lsr #63
	msub	w11, w13, w14, w11
	mov	w13, #350                       ; =0x15e
	csel	w9, w13, w9, eq
	add	w9, w9, w0
	strh	w11, [x10, #2]
LBB28_472:
	str	w9, [x8, _social_chat_keyboard@PAGEOFF+16]
LBB28_473:
	tbz	w19, #4, LBB28_475
; %bb.474:
	bl	_social_chat_keyboard_press
LBB28_475:
	adrp	x21, _social_chat@PAGE+36868
	ldrb	w8, [x21, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB28_479
; %bb.476:
	tbz	w19, #6, LBB28_479
; %bb.477:
Lloh390:
	adrp	x0, _social_chat@PAGE+36880
Lloh391:
	add	x0, x0, _social_chat@PAGEOFF+36880
	bl	_csstrlen
	cbz	w0, LBB28_479
; %bb.478:
Lloh392:
	adrp	x8, _social_chat@PAGE
Lloh393:
	add	x8, x8, _social_chat@PAGEOFF
	add	w8, w8, w0
	mov	w9, #36879                      ; =0x900f
	add	w8, w8, w9
	strb	wzr, [x8]
LBB28_479:
	ldrb	w8, [x21, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB28_486
; %bb.480:
	tbz	w19, #7, LBB28_486
; %bb.481:
	adrp	x8, _social_chat@PAGE+36870
	ldrh	w8, [x8, _social_chat@PAGEOFF+36870]
	cmp	w8, #2
	b.ne	LBB28_485
; %bb.482:
	adrp	x8, _social_chat@PAGE+39670
LBB28_483:
	ldrsh	w8, [x8, _social_chat@PAGEOFF+39670]
	cmp	w8, #1
	b.lt	LBB28_486
; %bb.484:
	adrp	x9, _social_chat@PAGE+39672
	ldrsh	w10, [x9, _social_chat@PAGEOFF+39672]
	add	w10, w8, w10
	add	w10, w10, #1
	sdiv	w11, w10, w8
	msub	w8, w11, w8, w10
	strh	w8, [x9, _social_chat@PAGEOFF+39672]
	b	LBB28_486
LBB28_485:
	adrp	x8, _social_chat_keyboard@PAGE+6
	ldrb	w9, [x8, _social_chat_keyboard@PAGEOFF+6]
	cmp	w9, #0
	cset	w9, eq
	strb	w9, [x8, _social_chat_keyboard@PAGEOFF+6]
LBB28_486:
	adrp	x21, _social_chat@PAGE+36868
	ldrb	w8, [x21, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB28_561
; %bb.487:
	add	x8, sp, #568
Lloh394:
	adrp	x27, _social_chat_keyboard@PAGE
Lloh395:
	add	x27, x27, _social_chat_keyboard@PAGEOFF
	add	w28, w8, #1
Lloh396:
	adrp	x25, _social_chat_player@PAGE
Lloh397:
	add	x25, x25, _social_chat_player@PAGEOFF
	adrp	x19, _social_chat_player@PAGE+102
	adrp	x22, _social_chat_player@PAGE+100
Lloh398:
	adrp	x23, _social_chat_player@PAGE+98
Lloh399:
	add	x23, x23, _social_chat_player@PAGEOFF+98
	b	LBB28_492
LBB28_488:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #78
	b.eq	LBB28_509
; %bb.489:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #102
	b.ne	LBB28_491
LBB28_490:                              ;   in Loop: Header=BB28_492 Depth=1
	bl	_social_chat_player_pick
	.p2align	4, , 8
LBB28_491:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrb	w8, [x21, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB28_561
LBB28_492:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_552 Depth 2
                                        ;     Child Loop BB28_542 Depth 2
	add	x0, sp, #48
	bl	_input_get_key
	cbz	w0, LBB28_559
; %bb.493:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrb	w9, [x20, _social_chat_player@PAGEOFF]
	ldrh	w8, [sp, #50]
	cbz	w9, LBB28_501
; %bb.494:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #55
	b.le	LBB28_506
; %bb.495:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #77
	b.gt	LBB28_488
; %bb.496:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #56
	b.eq	LBB28_490
; %bb.497:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #77
	b.ne	LBB28_491
; %bb.498:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrb	w8, [x23, #4]
	cbnz	w8, LBB28_491
; %bb.499:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrsh	w8, [x23]
	cmp	w8, #1
	b.lt	LBB28_491
; %bb.500:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrsh	w9, [x22, _social_chat_player@PAGEOFF+100]
	add	w9, w8, w9
	sub	w9, w9, #1
	b	LBB28_512
LBB28_501:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #76
	b.gt	LBB28_513
; %bb.502:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #28
	b.le	LBB28_520
; %bb.503:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #29
	b.eq	LBB28_533
; %bb.504:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #30
	b.eq	LBB28_536
; %bb.505:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #56
	b.eq	LBB28_517
	b	LBB28_538
LBB28_506:                              ;   in Loop: Header=BB28_492 Depth=1
	cbz	w8, LBB28_518
; %bb.507:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #29
	b.eq	LBB28_518
; %bb.508:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #30
	b.ne	LBB28_491
LBB28_509:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrb	w8, [x23, #4]
	cbnz	w8, LBB28_491
; %bb.510:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrsh	w8, [x23]
	cmp	w8, #1
	b.lt	LBB28_491
; %bb.511:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrsh	w9, [x22, _social_chat_player@PAGEOFF+100]
	add	w9, w8, w9
	add	w9, w9, #1
LBB28_512:                              ;   in Loop: Header=BB28_492 Depth=1
	sdiv	w10, w9, w8
	msub	w8, w10, w8, w9
	strh	w8, [x22, _social_chat_player@PAGEOFF+100]
	b	LBB28_491
LBB28_513:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #82
	b.le	LBB28_522
; %bb.514:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #83
	b.eq	LBB28_535
; %bb.515:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #86
	b.eq	LBB28_537
; %bb.516:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #102
	b.ne	LBB28_538
LBB28_517:                              ;   in Loop: Header=BB28_492 Depth=1
	bl	_social_chat_send_typed
	b	LBB28_491
LBB28_518:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrb	w8, [x19, _social_chat_player@PAGEOFF+102]
	cbz	w8, LBB28_526
; %bb.519:                              ;   in Loop: Header=BB28_492 Depth=1
	strb	wzr, [x19, _social_chat_player@PAGEOFF+102]
	b	LBB28_491
LBB28_520:                              ;   in Loop: Header=BB28_492 Depth=1
	cbz	w8, LBB28_527
; %bb.521:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #16
	b.eq	LBB28_491
	b	LBB28_538
LBB28_522:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #77
	b.eq	LBB28_530
; %bb.523:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #78
	b.ne	LBB28_538
; %bb.524:                              ;   in Loop: Header=BB28_492 Depth=1
	adrp	x8, _social_chat@PAGE+39670
	ldrsh	w8, [x8, _social_chat@PAGEOFF+39670]
	cmp	w8, #1
	b.lt	LBB28_491
; %bb.525:                              ;   in Loop: Header=BB28_492 Depth=1
	adrp	x11, _social_chat@PAGE+39672
	ldrsh	w9, [x11, _social_chat@PAGEOFF+39672]
	add	w9, w8, w9
	add	w9, w9, #1
	b	LBB28_532
LBB28_526:                              ;   in Loop: Header=BB28_492 Depth=1
	strb	wzr, [x25]
	strb	wzr, [x25, #110]
	b	LBB28_491
LBB28_527:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrb	w8, [x21, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB28_529
; %bb.528:                              ;   in Loop: Header=BB28_492 Depth=1
	bl	_system_milliseconds
	orr	w8, w0, #0x1
	adrp	x9, _social_chat@PAGE+36948
	str	w8, [x9, _social_chat@PAGEOFF+36948]
LBB28_529:                              ;   in Loop: Header=BB28_492 Depth=1
	strb	wzr, [x24]
	strh	wzr, [x27]
	strb	wzr, [x27, #20]
	strh	wzr, [x24, #76]
	strb	wzr, [x25]
	strb	wzr, [x25, #110]
	strh	wzr, [x25, #176]
	b	LBB28_491
LBB28_530:                              ;   in Loop: Header=BB28_492 Depth=1
	adrp	x8, _social_chat@PAGE+39670
	ldrsh	w8, [x8, _social_chat@PAGEOFF+39670]
	cmp	w8, #1
	b.lt	LBB28_491
; %bb.531:                              ;   in Loop: Header=BB28_492 Depth=1
	adrp	x11, _social_chat@PAGE+39672
	ldrsh	w9, [x11, _social_chat@PAGEOFF+39672]
	add	w9, w8, w9
	sub	w9, w9, #1
LBB28_532:                              ;   in Loop: Header=BB28_492 Depth=1
	sdiv	w10, w9, w8
	msub	w8, w10, w8, w9
	strh	w8, [x11, _social_chat@PAGEOFF+39672]
	b	LBB28_491
LBB28_533:                              ;   in Loop: Header=BB28_492 Depth=1
Lloh400:
	adrp	x0, _social_chat@PAGE+36880
Lloh401:
	add	x0, x0, _social_chat@PAGEOFF+36880
	bl	_csstrlen
	cbz	w0, LBB28_491
; %bb.534:                              ;   in Loop: Header=BB28_492 Depth=1
Lloh402:
	adrp	x8, _social_chat@PAGE
Lloh403:
	add	x8, x8, _social_chat@PAGEOFF
	add	w8, w8, w0
	mov	w9, #36879                      ; =0x900f
	add	w8, w8, w9
	strb	wzr, [x8]
	b	LBB28_491
LBB28_535:                              ;   in Loop: Header=BB28_492 Depth=1
	adrp	x9, _social_chat@PAGE+36944
	ldrh	w8, [x9, _social_chat@PAGEOFF+36944]
	add	w8, w8, #3
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
	b	LBB28_491
LBB28_536:                              ;   in Loop: Header=BB28_492 Depth=1
	mov	w0, #1                          ; =0x1
	bl	_social_chat_channel_step
	b	LBB28_491
LBB28_537:                              ;   in Loop: Header=BB28_492 Depth=1
	adrp	x9, _social_chat@PAGE+36944
	ldrh	w8, [x9, _social_chat@PAGEOFF+36944]
	sub	w8, w8, #3
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
	b	LBB28_491
LBB28_538:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrb	w9, [sp, #48]
	tbnz	w9, #1, LBB28_548
; %bb.539:                              ;   in Loop: Header=BB28_492 Depth=1
	ldrb	w26, [sp, #49]
	sub	w8, w26, #32
	cmp	w8, #94
	b.hi	LBB28_491
; %bb.540:                              ;   in Loop: Header=BB28_492 Depth=1
	add	x8, sp, #568
Lloh404:
	adrp	x0, _social_chat@PAGE+36880
Lloh405:
	add	x0, x0, _social_chat@PAGEOFF+36880
	add	w8, w8, #1
	strb	wzr, [x8]
	bl	_csstrlen
	cmp	w0, #62
	b.gt	LBB28_558
; %bb.541:                              ;   in Loop: Header=BB28_492 Depth=1
	add	x8, sp, #568
	add	w8, w8, #1
LBB28_542:                              ;   Parent Loop BB28_492 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sxtb	w9, w26
	cmp	w9, #32
	b.lt	LBB28_546
; %bb.543:                              ;   in Loop: Header=BB28_542 Depth=2
	and	w9, w26, #0xff
	cmp	w9, #124
	b.eq	LBB28_546
; %bb.544:                              ;   in Loop: Header=BB28_542 Depth=2
	cmp	w9, #127
	b.eq	LBB28_546
; %bb.545:                              ;   in Loop: Header=BB28_542 Depth=2
	add	w9, w0, #1
Lloh406:
	adrp	x10, _social_chat@PAGE
Lloh407:
	add	x10, x10, _social_chat@PAGEOFF
	add	x10, x10, w0, sxtw
	mov	w0, w9
	mov	w9, #36880                      ; =0x9010
	strb	w26, [x10, x9]
LBB28_546:                              ;   in Loop: Header=BB28_542 Depth=2
	ldrb	w26, [x8]
	cbz	w26, LBB28_558
; %bb.547:                              ;   in Loop: Header=BB28_542 Depth=2
	add	w8, w8, #1
	cmp	w0, #63
	b.lt	LBB28_542
	b	LBB28_558
LBB28_548:                              ;   in Loop: Header=BB28_492 Depth=1
	cmp	w8, #61
	b.ne	LBB28_491
; %bb.549:                              ;   in Loop: Header=BB28_492 Depth=1
	add	x0, sp, #568
	mov	w1, #64                         ; =0x40
	bl	_platform_clipboard_get
	cbz	w0, LBB28_491
; %bb.550:                              ;   in Loop: Header=BB28_492 Depth=1
Lloh408:
	adrp	x0, _social_chat@PAGE+36880
Lloh409:
	add	x0, x0, _social_chat@PAGEOFF+36880
	bl	_csstrlen
	ldrb	w9, [sp, #568]
	cmp	w0, #63
	ccmp	w9, #0, #4, lt
	b.eq	LBB28_558
; %bb.551:                              ;   in Loop: Header=BB28_492 Depth=1
	mov	x8, x28
LBB28_552:                              ;   Parent Loop BB28_492 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sxtb	w10, w9
	cmp	w10, #32
	b.lt	LBB28_556
; %bb.553:                              ;   in Loop: Header=BB28_552 Depth=2
	and	w10, w9, #0xff
	cmp	w10, #124
	b.eq	LBB28_556
; %bb.554:                              ;   in Loop: Header=BB28_552 Depth=2
	cmp	w10, #127
	b.eq	LBB28_556
; %bb.555:                              ;   in Loop: Header=BB28_552 Depth=2
	add	w10, w0, #1
Lloh410:
	adrp	x11, _social_chat@PAGE
Lloh411:
	add	x11, x11, _social_chat@PAGEOFF
	add	x11, x11, w0, sxtw
	mov	w0, w10
	mov	w10, #36880                     ; =0x9010
	strb	w9, [x11, x10]
LBB28_556:                              ;   in Loop: Header=BB28_552 Depth=2
	ldrb	w9, [x8]
	cbz	w9, LBB28_558
; %bb.557:                              ;   in Loop: Header=BB28_552 Depth=2
	add	w8, w8, #1
	cmp	w0, #63
	b.lt	LBB28_552
LBB28_558:                              ;   in Loop: Header=BB28_492 Depth=1
Lloh412:
	adrp	x8, _social_chat@PAGE
Lloh413:
	add	x8, x8, _social_chat@PAGEOFF
	add	x8, x8, w0, sxtw
	mov	w9, #36880                      ; =0x9010
	strb	wzr, [x8, x9]
	b	LBB28_491
LBB28_559:
	ldrb	w8, [x21, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB28_561
; %bb.560:
	adrp	x8, _social_chat@PAGE+36944
	ldrh	w19, [x8, _social_chat@PAGEOFF+36944]
	bl	_halo_chat_wheel_steps
	add	w8, w19, w0
	b	LBB28_562
LBB28_561:
	adrp	x8, _social_chat@PAGE+36944
	ldrh	w8, [x8, _social_chat@PAGEOFF+36944]
LBB28_562:
	tbnz	w8, #15, LBB28_564
; %bb.563:
	adrp	x9, _social_chat@PAGE+36864
	and	w8, w8, #0xffff
	ldrsh	w9, [x9, _social_chat@PAGEOFF+36864]
	cmp	w9, #1
	csinc	w9, w9, wzr, gt
	sub	w9, w9, #1
	and	w9, w9, #0xffff
	cmp	w8, w9
	csel	w9, w8, w9, lo
	b	LBB28_565
LBB28_564:
	mov	w9, wzr
LBB28_565:
	ldrb	w8, [x24]
	strh	w9, [x24, #76]
	cbz	w8, LBB28_569
; %bb.566:
	ldrb	w9, [x24, #106]
	cbz	w9, LBB28_569
; %bb.567:
	ldrb	w9, [x20, _social_chat_player@PAGEOFF]
	cbnz	w9, LBB28_569
; %bb.568:
	bl	_system_milliseconds
Lloh414:
	adrp	x8, _social_chat_keyboard@PAGE
Lloh415:
	add	x8, x8, _social_chat_keyboard@PAGEOFF
	orr	w9, w0, #0x1
	strb	wzr, [x24]
	strh	wzr, [x24, #76]
	strh	wzr, [x8]
	strb	wzr, [x8, #20]
	str	w9, [x24, #80]
	b	LBB28_11
LBB28_569:
	cbz	w8, LBB28_291
; %bb.570:
	adrp	x19, _social_chat@PAGE+36870
	ldrh	w8, [x19, _social_chat@PAGEOFF+36870]
	cbz	w8, LBB28_580
; %bb.571:
	cmp	w8, #2
	b.eq	LBB28_575
; %bb.572:
	cmp	w8, #1
	b.ne	LBB28_581
; %bb.573:
	bl	_social_chat_team
	cmn	w0, #1
	b.eq	LBB28_580
; %bb.574:
	mov	w8, #1                          ; =0x1
	b	LBB28_581
LBB28_575:
	adrp	x20, _social_chat_private_heard.read_at@PAGE
	ldr	w21, [x20, _social_chat_private_heard.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w21, w0
	b.ne	LBB28_577
; %bb.576:
	adrp	x8, _social_chat_private_heard.heard@PAGE
	ldrb	w8, [x8, _social_chat_private_heard.heard@PAGEOFF]
	b	LBB28_578
LBB28_577:
	bl	_config_changes
	str	w0, [x20, _social_chat_private_heard.read_at@PAGEOFF]
Lloh416:
	adrp	x0, l_.str.4@PAGE
Lloh417:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_private_heard.heard@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_private_heard.heard@PAGEOFF]
LBB28_578:
	cbz	w8, LBB28_580
; %bb.579:
	mov	w8, #2                          ; =0x2
	b	LBB28_581
LBB28_580:
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	mov	w8, #3                          ; =0x3
	csel	w8, w8, wzr, hi
LBB28_581:
	strh	w8, [x19, _social_chat@PAGEOFF+36870]
	b	LBB28_291
	.loh AdrpAdd	Lloh178, Lloh179
	.loh AdrpAdd	Lloh180, Lloh181
	.loh AdrpAdd	Lloh182, Lloh183
	.loh AdrpAdd	Lloh184, Lloh185
	.loh AdrpAdd	Lloh186, Lloh187
	.loh AdrpAdd	Lloh188, Lloh189
	.loh AdrpAdd	Lloh190, Lloh191
	.loh AdrpLdr	Lloh192, Lloh193
	.loh AdrpAdd	Lloh194, Lloh195
	.loh AdrpAdd	Lloh196, Lloh197
	.loh AdrpAdd	Lloh198, Lloh199
	.loh AdrpAdd	Lloh200, Lloh201
	.loh AdrpAdd	Lloh202, Lloh203
	.loh AdrpAdd	Lloh204, Lloh205
	.loh AdrpAdd	Lloh206, Lloh207
	.loh AdrpAdd	Lloh208, Lloh209
	.loh AdrpAdd	Lloh210, Lloh211
	.loh AdrpLdr	Lloh212, Lloh213
	.loh AdrpAdd	Lloh214, Lloh215
	.loh AdrpAdd	Lloh218, Lloh219
	.loh AdrpAdd	Lloh216, Lloh217
	.loh AdrpAdd	Lloh220, Lloh221
	.loh AdrpAdd	Lloh222, Lloh223
	.loh AdrpAdd	Lloh224, Lloh225
	.loh AdrpAdd	Lloh226, Lloh227
	.loh AdrpAdd	Lloh228, Lloh229
	.loh AdrpAdd	Lloh230, Lloh231
	.loh AdrpAdd	Lloh234, Lloh235
	.loh AdrpAdd	Lloh232, Lloh233
	.loh AdrpAdd	Lloh236, Lloh237
	.loh AdrpAdd	Lloh238, Lloh239
	.loh AdrpAdd	Lloh242, Lloh243
	.loh AdrpAdd	Lloh240, Lloh241
	.loh AdrpAdd	Lloh244, Lloh245
	.loh AdrpAdd	Lloh246, Lloh247
	.loh AdrpAdd	Lloh248, Lloh249
	.loh AdrpAdd	Lloh250, Lloh251
	.loh AdrpAdd	Lloh252, Lloh253
	.loh AdrpAdd	Lloh254, Lloh255
	.loh AdrpAdd	Lloh256, Lloh257
	.loh AdrpAdd	Lloh258, Lloh259
	.loh AdrpAdd	Lloh262, Lloh263
	.loh AdrpAdd	Lloh260, Lloh261
	.loh AdrpAdd	Lloh264, Lloh265
	.loh AdrpAdd	Lloh266, Lloh267
	.loh AdrpAdd	Lloh268, Lloh269
	.loh AdrpAdd	Lloh270, Lloh271
	.loh AdrpAdd	Lloh272, Lloh273
	.loh AdrpAdd	Lloh274, Lloh275
	.loh AdrpAdd	Lloh276, Lloh277
	.loh AdrpAdd	Lloh278, Lloh279
	.loh AdrpAdd	Lloh280, Lloh281
	.loh AdrpAdd	Lloh282, Lloh283
	.loh AdrpAdd	Lloh284, Lloh285
	.loh AdrpAdd	Lloh286, Lloh287
	.loh AdrpAdd	Lloh288, Lloh289
	.loh AdrpAdd	Lloh290, Lloh291
	.loh AdrpAdd	Lloh292, Lloh293
	.loh AdrpAdd	Lloh294, Lloh295
	.loh AdrpAdd	Lloh296, Lloh297
	.loh AdrpAdd	Lloh298, Lloh299
	.loh AdrpAdd	Lloh300, Lloh301
	.loh AdrpAdd	Lloh302, Lloh303
	.loh AdrpAdd	Lloh304, Lloh305
	.loh AdrpAdd	Lloh306, Lloh307
	.loh AdrpAdd	Lloh310, Lloh311
	.loh AdrpAdd	Lloh308, Lloh309
	.loh AdrpLdr	Lloh312, Lloh313
	.loh AdrpAdd	Lloh316, Lloh317
	.loh AdrpAdd	Lloh314, Lloh315
	.loh AdrpAdd	Lloh318, Lloh319
	.loh AdrpAdd	Lloh320, Lloh321
	.loh AdrpAdd	Lloh322, Lloh323
	.loh AdrpAdd	Lloh324, Lloh325
	.loh AdrpAdd	Lloh326, Lloh327
	.loh AdrpAdd	Lloh328, Lloh329
	.loh AdrpAdd	Lloh330, Lloh331
	.loh AdrpAdd	Lloh332, Lloh333
	.loh AdrpAdd	Lloh334, Lloh335
	.loh AdrpAdd	Lloh336, Lloh337
	.loh AdrpAdd	Lloh340, Lloh341
	.loh AdrpAdd	Lloh338, Lloh339
	.loh AdrpAdd	Lloh342, Lloh343
	.loh AdrpAdd	Lloh344, Lloh345
	.loh AdrpAdd	Lloh346, Lloh347
	.loh AdrpAdd	Lloh348, Lloh349
	.loh AdrpAdd	Lloh352, Lloh353
	.loh AdrpAdd	Lloh350, Lloh351
	.loh AdrpAdd	Lloh354, Lloh355
	.loh AdrpAdd	Lloh358, Lloh359
	.loh AdrpAdd	Lloh356, Lloh357
	.loh AdrpAdd	Lloh360, Lloh361
	.loh AdrpAdd	Lloh362, Lloh363
	.loh AdrpAdd	Lloh364, Lloh365
	.loh AdrpAdd	Lloh366, Lloh367
	.loh AdrpAdd	Lloh368, Lloh369
	.loh AdrpAdd	Lloh372, Lloh373
	.loh AdrpAdd	Lloh370, Lloh371
	.loh AdrpAdd	Lloh374, Lloh375
	.loh AdrpAdd	Lloh376, Lloh377
	.loh AdrpAdd	Lloh378, Lloh379
	.loh AdrpLdrGot	Lloh380, Lloh381
	.loh AdrpAdd	Lloh382, Lloh383
	.loh AdrpAdd	Lloh384, Lloh385
	.loh AdrpAdd	Lloh386, Lloh387
	.loh AdrpAdd	Lloh388, Lloh389
	.loh AdrpAdd	Lloh390, Lloh391
	.loh AdrpAdd	Lloh392, Lloh393
	.loh AdrpAdd	Lloh398, Lloh399
	.loh AdrpAdd	Lloh396, Lloh397
	.loh AdrpAdd	Lloh394, Lloh395
	.loh AdrpAdd	Lloh400, Lloh401
	.loh AdrpAdd	Lloh402, Lloh403
	.loh AdrpAdd	Lloh404, Lloh405
	.loh AdrpAdd	Lloh406, Lloh407
	.loh AdrpAdd	Lloh408, Lloh409
	.loh AdrpAdd	Lloh410, Lloh411
	.loh AdrpAdd	Lloh412, Lloh413
	.loh AdrpAdd	Lloh414, Lloh415
	.loh AdrpAdd	Lloh416, Lloh417
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_room
_social_chat_room:                      ; @social_chat_room
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	x19, x0
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	bl	_network_game_get_game
	mov	x20, x0
	strb	wzr, [x19]
	cbz	w20, LBB29_38
; %bb.1:
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	b.hi	LBB29_38
; %bb.2:
	ldrh	w10, [x20]
	mov	w9, #40389                      ; =0x9dc5
	mov	w8, #403                        ; =0x193
	movk	w9, #33052, lsl #16
	movk	w8, #256, lsl #16
	cbz	w10, LBB29_19
; %bb.3:
	eor	w9, w10, w9
	ldrh	w10, [x20, #2]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.4:
	eor	w9, w9, w10
	ldrh	w10, [x20, #4]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.5:
	eor	w9, w9, w10
	ldrh	w10, [x20, #6]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.6:
	eor	w9, w9, w10
	ldrh	w10, [x20, #8]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.7:
	eor	w9, w9, w10
	ldrh	w10, [x20, #10]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.8:
	eor	w9, w9, w10
	ldrh	w10, [x20, #12]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.9:
	eor	w9, w9, w10
	ldrh	w10, [x20, #14]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.10:
	eor	w9, w9, w10
	ldrh	w10, [x20, #16]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.11:
	eor	w9, w9, w10
	ldrh	w10, [x20, #18]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.12:
	eor	w9, w9, w10
	ldrh	w10, [x20, #20]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.13:
	eor	w9, w9, w10
	ldrh	w10, [x20, #22]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.14:
	eor	w9, w9, w10
	ldrh	w10, [x20, #24]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.15:
	eor	w9, w9, w10
	ldrh	w10, [x20, #26]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.16:
	eor	w9, w9, w10
	ldrh	w10, [x20, #28]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.17:
	eor	w9, w9, w10
	ldrh	w10, [x20, #30]
	mul	w9, w9, w8
	cbz	w10, LBB29_19
; %bb.18:
	eor	w9, w9, w10
	mul	w9, w9, w8
LBB29_19:
	add	w10, w20, #51
	mov	w11, #128                       ; =0x80
LBB29_20:                               ; =>This Inner Loop Header: Depth=1
	sub	w12, w10, #15
	ldrb	w12, [x12]
	cbz	w12, LBB29_37
; %bb.21:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #14
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.22:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #13
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.23:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #12
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.24:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #11
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.25:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #10
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.26:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #9
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.27:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #8
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.28:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #7
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.29:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #6
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.30:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #5
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.31:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #4
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.32:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #3
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.33:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #2
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.34:                               ;   in Loop: Header=BB29_20 Depth=1
	sub	w13, w10, #1
	eor	w9, w9, w12
	mul	w9, w9, w8
	ldrb	w12, [x13]
	cbz	w12, LBB29_37
; %bb.35:                               ;   in Loop: Header=BB29_20 Depth=1
	eor	w9, w9, w12
	ldrb	w12, [x10]
	mul	w9, w9, w8
	cbz	w12, LBB29_37
; %bb.36:                               ;   in Loop: Header=BB29_20 Depth=1
	eor	w9, w9, w12
	add	w10, w10, #16
	subs	w11, w11, #16
	mul	w9, w9, w8
	b.ne	LBB29_20
LBB29_37:
	ldr	w10, [x20, #13080]
Lloh418:
	adrp	x2, l_.str.32@PAGE
Lloh419:
	add	x2, x2, l_.str.32@PAGEOFF
	mov	x0, x19
	mov	w1, #24                         ; =0x18
	and	w11, w10, #0xff
	eor	w9, w11, w9
	ubfx	w11, w10, #8, #8
	mul	w9, w9, w8
	eor	w9, w11, w9
	ubfx	w11, w10, #16, #8
	mul	w9, w9, w8
	eor	w9, w11, w9
	mul	w9, w9, w8
	eor	w9, w9, w10, lsr #24
	mul	w8, w9, w8
	stp	w8, w10, [sp]
	bl	_halo_linux_snprintf
LBB29_38:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh418, Lloh419
                                        ; -- End function
	.globl	_social_chat_draw               ; -- Begin function social_chat_draw
	.p2align	4
_social_chat_draw:                      ; @social_chat_draw
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	w0, wzr
	mov	x29, sp
	bl	_social_chat_draw_in
Lloh420:
	adrp	x8, _render@GOTPAGE
Lloh421:
	ldr	w8, [x8, _render@GOTPAGEOFF]
	ldrh	w9, [x8, #66]
	ldrh	w10, [x8, #62]
	ldrh	w11, [x8, #64]
	ldrh	w8, [x8, #60]
	sub	w9, w9, w10
	sxth	w0, w9
	sub	w8, w11, w8
	sxth	w1, w8
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	_social_menu_join_draw
	.loh AdrpLdrGot	Lloh420, Lloh421
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ; -- Begin function social_chat_draw_in
lCPI31_0:
	.long	0x3f51eb85                      ; float 0.819999992
	.long	0x3ee66666                      ; float 0.449999988
lCPI31_1:
	.long	0x3f400000                      ; float 0.75
	.long	0x3f6147ae                      ; float 0.879999995
lCPI31_2:
	.long	0x3f733333                      ; float 0.949999988
	.long	0x3f333333                      ; float 0.699999988
lCPI31_7:
	.short	110                             ; 0x6e
	.short	101                             ; 0x65
	.short	41                              ; 0x29
	.short	0                               ; 0x0
lCPI31_12:
	.short	60                              ; 0x3c
	.short	32                              ; 0x20
	.short	66                              ; 0x42
	.short	65                              ; 0x41
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0
lCPI31_3:
	.short	65                              ; 0x41
	.short	32                              ; 0x20
	.short	111                             ; 0x6f
	.short	114                             ; 0x72
	.short	32                              ; 0x20
	.short	99                              ; 0x63
	.short	108                             ; 0x6c
	.short	105                             ; 0x69
lCPI31_4:
	.short	99                              ; 0x63
	.short	107                             ; 0x6b
	.short	58                              ; 0x3a
	.short	32                              ; 0x20
	.short	119                             ; 0x77
	.short	114                             ; 0x72
	.short	105                             ; 0x69
	.short	116                             ; 0x74
lCPI31_5:
	.short	40                              ; 0x28
	.short	102                             ; 0x66
	.short	111                             ; 0x6f
	.short	114                             ; 0x72
	.short	107                             ; 0x6b
	.short	32                              ; 0x20
	.short	99                              ; 0x63
	.short	104                             ; 0x68
lCPI31_6:
	.short	97                              ; 0x61
	.short	116                             ; 0x74
	.short	32                              ; 0x20
	.short	111                             ; 0x6f
	.short	102                             ; 0x66
	.short	102                             ; 0x66
	.short	108                             ; 0x6c
	.short	105                             ; 0x69
lCPI31_8:
	.long	0x3f19999a                      ; float 0.600000024
	.long	0x00000000                      ; float 0
	.long	0x00000000                      ; float 0
	.long	0x00000000                      ; float 0
lCPI31_9:
	.short	67                              ; 0x43
	.short	76                              ; 0x4c
	.short	73                              ; 0x49
	.short	67                              ; 0x43
	.short	75                              ; 0x4b
	.short	44                              ; 0x2c
	.short	32                              ; 0x20
	.short	66                              ; 0x42
lCPI31_10:
	.short	32                              ; 0x20
	.short	79                              ; 0x4f
	.short	82                              ; 0x52
	.short	32                              ; 0x20
	.short	69                              ; 0x45
	.short	83                              ; 0x53
	.short	67                              ; 0x43
	.short	65                              ; 0x41
lCPI31_11:
	.short	80                              ; 0x50
	.short	69                              ; 0x45
	.short	58                              ; 0x3a
	.short	32                              ; 0x20
	.short	66                              ; 0x42
	.short	65                              ; 0x41
	.short	67                              ; 0x43
	.short	75                              ; 0x4b
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4
_social_chat_draw_in:                   ; @social_chat_draw_in
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
	sub	sp, sp, #2784
	mov	w28, w0
	bl	_halo_chat_touch_layout
	mov	w24, w0
	bl	_system_milliseconds
	str	w0, [sp, #208]                  ; 4-byte Spill
	cbz	w28, LBB31_2
; %bb.1:
	mov	w23, #1                         ; =0x1
	b	LBB31_7
LBB31_2:
	adrp	x19, _social_chat@PAGE+36964
	ldr	w8, [x19, _social_chat@PAGEOFF+36964]
	cbz	w8, LBB31_6
; %bb.3:
	bl	_system_milliseconds
	ldr	w8, [x19, _social_chat@PAGEOFF+36964]
	sub	w8, w0, w8
	cmp	w8, #999
	b.gt	LBB31_6
; %bb.4:
Lloh422:
	adrp	x8, _social_chat@PAGE+36954
Lloh423:
	add	x8, x8, _social_chat@PAGEOFF+36954
	ldrsh	w9, [x8, #4]
	ldrsh	w8, [x8]
	cmp	w9, w8
	b.le	LBB31_6
; %bb.5:
Lloh424:
	adrp	x8, _social_chat@PAGE+36952
Lloh425:
	add	x8, x8, _social_chat@PAGEOFF+36952
	ldrsh	w9, [x8, #4]
	ldrsh	w8, [x8]
	cmp	w9, w8
	cset	w23, gt
	b	LBB31_7
LBB31_6:
	mov	w23, wzr
LBB31_7:
Lloh426:
	adrp	x20, _social_chat@PAGE+36868
Lloh427:
	add	x20, x20, _social_chat@PAGEOFF+36868
	cmp	w28, #0
	mov	w10, wzr
	csel	w19, wzr, w23, ne
	ldrh	w9, [x20, #92]
	ldrb	w8, [x20]
	csel	w9, wzr, w9, eq
	cmp	w8, #0
	csel	w8, wzr, w23, ne
	str	x9, [sp, #192]                  ; 8-byte Spill
	csinc	w9, w23, wzr, eq
	str	w9, [sp, #224]                  ; 4-byte Spill
	cbz	w8, LBB31_9
; %bb.8:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cmp	w8, #0
	cset	w10, ne
LBB31_9:
	str	w10, [sp, #216]                 ; 4-byte Spill
	cbnz	w28, LBB31_11
; %bb.10:
	adrp	x8, _social_chat_keyboard@PAGE+20
	adrp	x9, _social_chat_player@PAGE+110
	strb	wzr, [x8, _social_chat_keyboard@PAGEOFF+20]
	strb	wzr, [x9, _social_chat_player@PAGEOFF+110]
	tbnz	w19, #0, LBB31_12
LBB31_11:
	adrp	x8, _social_chat_player@PAGE+176
	adrp	x9, _social_chat_hits@PAGE
	strh	wzr, [x8, _social_chat_player@PAGEOFF+176]
	strb	wzr, [x9, _social_chat_hits@PAGEOFF]
LBB31_12:
	adrp	x27, _social_chat_replaces_upstream.read_at@PAGE
	ldr	w21, [x27, _social_chat_replaces_upstream.read_at@PAGEOFF]
	bl	_config_changes
	adrp	x26, _social_chat_replaces_upstream.on@PAGE
	cmp	w21, w0
	b.ne	LBB31_14
; %bb.13:
	ldrb	w8, [x26, _social_chat_replaces_upstream.on@PAGEOFF]
	cbnz	w8, LBB31_15
	b	LBB31_19
LBB31_14:
	bl	_config_changes
	str	w0, [x27, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh428:
	adrp	x0, l_.str@PAGE
Lloh429:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	cset	w8, ne
	strb	w8, [x26, _social_chat_replaces_upstream.on@PAGEOFF]
	cbz	w8, LBB31_19
LBB31_15:
	adrp	x21, _social_chat_shown.read_at@PAGE
	ldr	w22, [x21, _social_chat_shown.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB31_17
; %bb.16:
	adrp	x8, _social_chat_shown.shown@PAGE
	ldrb	w8, [x8, _social_chat_shown.shown@PAGEOFF]
	cbnz	w8, LBB31_18
	b	LBB31_19
LBB31_17:
	bl	_config_changes
	str	w0, [x21, _social_chat_shown.read_at@PAGEOFF]
Lloh430:
	adrp	x0, l_.str.3@PAGE
Lloh431:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x8, _social_chat_shown.shown@PAGE
	cset	w9, ne
	strb	w9, [x8, _social_chat_shown.shown@PAGEOFF]
	cbz	w0, LBB31_19
LBB31_18:
	bl	_network_replay_playing
	cbz	w0, LBB31_20
LBB31_19:
	add	sp, sp, #2784
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
LBB31_20:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB31_29
LBB31_21:
	adrp	x8, _social_chat@PAGE+36864
	ldrh	w8, [x8, _social_chat@PAGEOFF+36864]
	cmp	w8, #0
	ldr	w8, [sp, #224]                  ; 4-byte Reload
	csinc	w8, w8, wzr, eq
	cbz	w8, LBB31_19
; %bb.22:
	mov	w0, #28276                      ; =0x6e74
Lloh432:
	adrp	x1, l_.str.62@PAGE
Lloh433:
	add	x1, x1, l_.str.62@PAGEOFF
	movk	w0, #26223, lsl #16
	bl	_tag_loaded
	cmn	w0, #1
	b.ne	LBB31_24
; %bb.23:
	mov	w0, #1                          ; =0x1
	bl	_interface_get_tag_index
	cmn	w0, #1
	b.eq	LBB31_19
LBB31_24:
	mov	w1, w0
	mov	w0, #28276                      ; =0x6e74
	movk	w0, #26223, lsl #16
	str	w1, [sp, #204]                  ; 4-byte Spill
	bl	_tag_get
	ldrh	w8, [x0, #4]
	ldrh	w9, [x0, #6]
	ldrh	w10, [x0, #8]
	add	w8, w9, w8
	add	w8, w8, w10
	sxth	w25, w8
	cmp	w25, #1
	b.lt	LBB31_19
; %bb.25:
Lloh434:
	adrp	x8, _render@GOTPAGE
Lloh435:
	ldr	w8, [x8, _render@GOTPAGEOFF]
	ldrh	w9, [x8, #66]
	ldrh	w10, [x8, #62]
	ldrh	w11, [x8, #64]
	ldrh	w8, [x8, #60]
	sub	w9, w9, w10
	sub	w8, w11, w8
	sxth	w8, w8
	cmp	w8, #1
	str	x8, [sp, #56]                   ; 8-byte Spill
	sxth	w8, w9
	ccmp	w8, #1, #8, ge
	str	w8, [sp, #68]                   ; 4-byte Spill
	b.lt	LBB31_19
; %bb.26:
	ldr	w8, [sp, #224]                  ; 4-byte Reload
	cbz	w8, LBB31_30
; %bb.27:
	adrp	x8, _social_chat@PAGE+36870
	ldr	w22, [x27, _social_chat_replaces_upstream.read_at@PAGEOFF]
	ldrh	w8, [x8, _social_chat@PAGEOFF+36870]
	cmp	w8, #2
	mov	w8, #2                          ; =0x2
	cinc	w21, w8, eq
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB31_31
; %bb.28:
	ldrb	w8, [x26, _social_chat_replaces_upstream.on@PAGEOFF]
	b	LBB31_32
LBB31_29:
	bl	_cinematic_in_progress
	cbnz	w0, LBB31_19
	b	LBB31_21
LBB31_30:
	ldr	w22, [sp, #204]                 ; 4-byte Reload
	str	wzr, [sp, #272]                 ; 4-byte Spill
	b	LBB31_36
LBB31_31:
	bl	_config_changes
	str	w0, [x27, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh436:
	adrp	x0, l_.str@PAGE
Lloh437:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	cset	w8, ne
	strb	w8, [x26, _social_chat_replaces_upstream.on@PAGEOFF]
LBB31_32:
	ldr	w22, [sp, #204]                 ; 4-byte Reload
	cbz	w8, LBB31_34
; %bb.33:
	bl	_social_enabled
	cmp	w0, #0
	cset	w8, eq
	b	LBB31_35
LBB31_34:
	mov	w8, #1                          ; =0x1
LBB31_35:
	add	w8, w8, w21
	str	w8, [sp, #272]                  ; 4-byte Spill
LBB31_36:
	adrp	x8, _social_chat@PAGE+36868
	mov	w9, #5                          ; =0x5
	str	w24, [sp, #156]                 ; 4-byte Spill
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cmp	w8, #0
	mov	w8, #10                         ; =0xa
	csel	w21, w9, w8, eq
	cbz	w23, LBB31_38
; %bb.37:
Lloh438:
	adrp	x8, _social_chat@PAGE+36952
Lloh439:
	add	x8, x8, _social_chat@PAGEOFF+36952
	ldr	w12, [sp, #272]                 ; 4-byte Reload
	cmp	w28, #0
	ldrsh	w9, [x8, #4]
	ldrsh	w10, [x8]
	ldrh	w11, [x8, #2]
	sub	w9, w9, w10
	ldrh	w10, [x8, #8]
	sub	w9, w9, #12
	ldrh	w8, [x8, #6]
	sdiv	w9, w9, w25
	csel	w10, w10, wzr, eq
	add	w10, w10, w11
	sub	w9, w9, w12
	mov	w12, #6                         ; =0x6
	bic	w21, w9, w9, asr #31
	str	w10, [sp, #52]                  ; 4-byte Spill
	sub	w10, w8, w11
	b	LBB31_39
LBB31_38:
	ldr	w11, [sp, #68]                  ; 4-byte Reload
	mov	w8, #46                         ; =0x2e
	mov	w9, #34079                      ; =0x851f
	mov	w10, #5243                      ; =0x147b
	movk	w9, #20971, lsl #16
	mov	w12, wzr
	mul	w8, w11, w8
	ubfx	w11, w11, #1, #15
	umull	x8, w8, w9
	mul	w9, w11, w10
	lsr	x10, x8, #37
	lsr	w8, w9, #17
	str	w8, [sp, #52]                   ; 4-byte Spill
LBB31_39:
	and	w8, w10, #0xffff
	str	x10, [sp, #32]                  ; 8-byte Spill
	sub	w8, w8, #12
	str	w12, [sp, #264]                 ; 4-byte Spill
	sub	w24, w8, w12
	str	w8, [sp, #44]                   ; 4-byte Spill
	bl	_get_ui_argb_white
	add	x4, sp, #2160
	mov	w0, w22
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	str	s0, [sp, #2160]
	str	s1, [sp, #2164]
	str	s2, [sp, #2168]
	str	s3, [sp, #2172]
	bl	_draw_string_set_draw_mode
	adrp	x8, _social_chat@PAGE+36864
	str	w24, [sp, #256]                 ; 4-byte Spill
	str	w25, [sp, #236]                 ; 4-byte Spill
	str	w23, [sp, #140]                 ; 4-byte Spill
	ldrsh	w8, [x8, _social_chat@PAGEOFF+36864]
	str	w28, [sp, #48]                  ; 4-byte Spill
	cmp	w8, #1
	sxth	w8, w24
	str	w8, [sp, #164]                  ; 4-byte Spill
	b.lt	LBB31_70
; %bb.40:
	mov	w1, #43691                      ; =0xaaab
	ldr	w17, [sp, #216]                 ; 4-byte Reload
	mov	w22, wzr
	mov	w24, wzr
	mov	w27, wzr
	mov	w23, wzr
Lloh440:
	adrp	x28, _social_chat@PAGE
Lloh441:
	add	x28, x28, _social_chat@PAGEOFF
	sxth	w8, w21
	mov	w0, #36866                      ; =0x9002
	movk	w1, #10922, lsl #16
	mov	w2, #96                         ; =0x60
	mov	w3, #384                        ; =0x180
	mov	w4, #36868                      ; =0x9004
	mov	w5, #36870                      ; =0x9006
	mov	w6, #66                         ; =0x42
	mov	w7, #43900                      ; =0xab7c
	adrp	x30, _social_chat_global_everywhere.read_at@PAGE
	add	x21, sp, #904
	str	w8, [sp, #284]                  ; 4-byte Spill
LBB31_41:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB31_47 Depth 2
                                        ;       Child Loop BB31_49 Depth 3
	ldrsh	w8, [x28, x0]
	sub	w8, w8, w22
	add	w8, w8, #96
	smull	x9, w8, w1
	lsr	x10, x9, #36
	add	x9, x10, x9, lsr #63
	ldrh	w10, [x28, x5]
	msub	w8, w9, w2, w8
	ldrb	w9, [x28, x4]
	smaddl	x26, w8, w3, x28
	cmp	w9, #0
	ccmp	w10, #3, #0, ne
	ldrb	w8, [x26, #374]
	cset	w9, eq
	cbnz	w8, LBB31_57
; %bb.42:                               ;   in Loop: Header=BB31_41 Depth=1
	ldrb	w8, [x26, #372]
	str	w9, [sp, #288]                  ; 4-byte Spill
	tbnz	w8, #1, LBB31_52
; %bb.43:                               ;   in Loop: Header=BB31_41 Depth=1
	adrp	x8, _social_chat@PAGE+46012
	ldrsh	w8, [x8, _social_chat@PAGEOFF+46012]
	cmp	w8, #1
	b.lt	LBB31_52
; %bb.44:                               ;   in Loop: Header=BB31_41 Depth=1
	mov	w9, wzr
Lloh442:
	adrp	x10, _social_chat@PAGE+43902
Lloh443:
	add	x10, x10, _social_chat@PAGEOFF+43902
	b	LBB31_47
	.p2align	4, , 8
LBB31_45:                               ;   in Loop: Header=BB31_47 Depth=2
	ldrh	w11, [x11]
	cbz	w11, LBB31_65
LBB31_46:                               ;   in Loop: Header=BB31_47 Depth=2
	add	w9, w9, #1
	add	w10, w10, #66
	cmp	w9, w8
	b.eq	LBB31_52
LBB31_47:                               ;   Parent Loop BB31_41 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB31_49 Depth 3
	smaddl	x11, w9, w6, x28
	ldrh	w13, [x11, x7]
	mov	x11, x26
	cbz	w13, LBB31_45
; %bb.48:                               ;   in Loop: Header=BB31_47 Depth=2
	mov	x12, x10
	mov	x11, x26
	.p2align	4, , 8
LBB31_49:                               ;   Parent Loop BB31_41 Depth=1
                                        ;     Parent Loop BB31_47 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldrh	w14, [x11], #2
	cbz	w14, LBB31_46
; %bb.50:                               ;   in Loop: Header=BB31_49 Depth=3
	sub	w15, w13, #65
	orr	w16, w13, #0x20
	cmp	w15, #26
	sub	w15, w14, #65
	csel	w13, w16, w13, lo
	orr	w16, w14, #0x20
	cmp	w15, #26
	csel	w14, w16, w14, lo
	cmp	w13, w14
	b.ne	LBB31_46
; %bb.51:                               ;   in Loop: Header=BB31_49 Depth=3
	ldrh	w13, [x12]
	add	w12, w12, #2
	cbnz	w13, LBB31_49
	b	LBB31_45
LBB31_52:                               ;   in Loop: Header=BB31_41 Depth=1
	ldr	w25, [x30, _social_chat_global_everywhere.read_at@PAGEOFF]
	mov	w21, w24
	mov	x24, x30
	bl	_config_changes
	cmp	w25, w0
	b.ne	LBB31_54
; %bb.53:                               ;   in Loop: Header=BB31_41 Depth=1
	adrp	x8, _social_chat_global_everywhere.everywhere@PAGE
	ldrb	w8, [x8, _social_chat_global_everywhere.everywhere@PAGEOFF]
	b	LBB31_55
LBB31_54:                               ;   in Loop: Header=BB31_41 Depth=1
	bl	_config_changes
	str	w0, [x24, _social_chat_global_everywhere.read_at@PAGEOFF]
Lloh444:
	adrp	x0, l_.str.5@PAGE
Lloh445:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_global_everywhere.everywhere@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_global_everywhere.everywhere@PAGEOFF]
LBB31_55:                               ;   in Loop: Header=BB31_41 Depth=1
	ldr	w25, [sp, #236]                 ; 4-byte Reload
	mov	w1, #43691                      ; =0xaaab
	ldr	w17, [sp, #216]                 ; 4-byte Reload
	mov	w0, #36866                      ; =0x9002
	ldr	w9, [sp, #288]                  ; 4-byte Reload
	movk	w1, #10922, lsl #16
	mov	w2, #96                         ; =0x60
	mov	w3, #384                        ; =0x180
	mov	w4, #36868                      ; =0x9004
	mov	w5, #36870                      ; =0x9006
	mov	w24, w21
	mov	w6, #66                         ; =0x42
	mov	w7, #43900                      ; =0xab7c
	adrp	x30, _social_chat_global_everywhere.read_at@PAGE
	add	x21, sp, #904
	cbnz	w8, LBB31_57
; %bb.56:                               ;   in Loop: Header=BB31_41 Depth=1
	ldrh	w8, [x26, #368]
	cmp	w8, #3
	cset	w8, eq
	eor	w8, w9, w8
	tbnz	w8, #0, LBB31_65
LBB31_57:                               ;   in Loop: Header=BB31_41 Depth=1
	ldrb	w8, [x20]
	cbz	w8, LBB31_60
; %bb.58:                               ;   in Loop: Header=BB31_41 Depth=1
	ldrsh	w9, [x20, #76]
	cmp	w9, w23, sxth
	b.le	LBB31_60
; %bb.59:                               ;   in Loop: Header=BB31_41 Depth=1
	add	w23, w23, #1
	b	LBB31_65
LBB31_60:                               ;   in Loop: Header=BB31_41 Depth=1
	adrp	x9, _social_chat@PAGE+36972
	cmp	w8, #0
	ldr	w8, [sp, #140]                  ; 4-byte Reload
	ldrsh	w9, [x9, _social_chat@PAGEOFF+36972]
	csel	w8, wzr, w8, ne
	cmp	w22, w9
	csel	w8, wzr, w8, ge
	tbnz	w8, #0, LBB31_65
; %bb.61:                               ;   in Loop: Header=BB31_41 Depth=1
	ldr	w8, [sp, #224]                  ; 4-byte Reload
	tbnz	w8, #0, LBB31_63
; %bb.62:                               ;   in Loop: Header=BB31_41 Depth=1
	ldr	w8, [x26, #380]
	mov	w10, #11000                     ; =0x2af8
	ldr	w9, [sp, #208]                  ; 4-byte Reload
	sub	w9, w9, w8
	cmp	w9, w10
	ccmp	w8, #0, #4, ls
	b.eq	LBB31_66
LBB31_63:                               ;   in Loop: Header=BB31_41 Depth=1
	ldr	w1, [sp, #164]                  ; 4-byte Reload
	add	x2, sp, #1728
	add	x3, sp, #2160
	mov	x0, x26
	bl	_social_chat_line_rows
	ldr	w9, [sp, #284]                  ; 4-byte Reload
	mov	w1, #43691                      ; =0xaaab
	ldr	w17, [sp, #216]                 ; 4-byte Reload
	adrp	x30, _social_chat_global_everywhere.read_at@PAGE
	mov	w7, #43900                      ; =0xab7c
	mov	w6, #66                         ; =0x42
	mov	w5, #36870                      ; =0x9006
	mov	w4, #36868                      ; =0x9004
	mov	w3, #384                        ; =0x180
	mov	w2, #96                         ; =0x60
	movk	w1, #10922, lsl #16
	add	w8, w0, w24, sxth
	mov	w0, #36866                      ; =0x9002
	cmp	w8, w9
	b.gt	LBB31_66
; %bb.64:                               ;   in Loop: Header=BB31_41 Depth=1
	mov	w9, w27
	add	w27, w27, #1
	mov	w24, w8
	sxth	x9, w9
	strh	w22, [x21, x9, lsl #1]
LBB31_65:                               ;   in Loop: Header=BB31_41 Depth=1
	adrp	x8, _social_chat@PAGE+36864
	add	w22, w22, #1
	ldrsh	w8, [x8, _social_chat@PAGEOFF+36864]
	cmp	w22, w8
	b.lt	LBB31_41
LBB31_66:                               ;   in Loop: Header=BB31_41 Depth=1
	tst	w27, #0xffff
	csel	w8, wzr, w17, eq
	cbz	w8, LBB31_69
; %bb.67:                               ;   in Loop: Header=BB31_41 Depth=1
	add	w8, w21, w27, sxth #1
	adrp	x9, _social_chat@PAGE+36970
	sub	w8, w8, #2
	ldrsh	w9, [x9, _social_chat@PAGEOFF+36970]
	ldrsh	w8, [x8]
	cmp	w9, w8
	b.le	LBB31_69
; %bb.68:                               ;   in Loop: Header=BB31_41 Depth=1
Lloh446:
	adrp	x10, _social_chat@PAGE+36864
Lloh447:
	add	x10, x10, _social_chat@PAGEOFF+36864
	ldrh	w8, [sp, #904]
	mov	w22, wzr
	mov	w24, wzr
	mov	w27, wzr
	ldrsh	w9, [x10]
	mov	w23, wzr
	add	w8, w8, #1
	cmp	w9, #0
	strh	w8, [x10, #108]
	b.gt	LBB31_41
LBB31_69:
	ldr	w23, [sp, #140]                 ; 4-byte Reload
	sub	w21, w27, #1
	b	LBB31_71
LBB31_70:
	mov	w24, wzr
	mov	w21, #65535                     ; =0xffff
LBB31_71:
	ldr	w8, [sp, #224]                  ; 4-byte Reload
	tst	w24, #0xffff
	ldr	w26, [sp, #156]                 ; 4-byte Reload
	csinc	w8, w8, wzr, eq
	cbz	w8, LBB31_19
; %bb.72:
	tbz	w23, #0, LBB31_75
; %bb.73:
Lloh448:
	adrp	x8, _social_chat@PAGE+36952
Lloh449:
	add	x8, x8, _social_chat@PAGEOFF+36952
	ldrh	w22, [x8]
	ldrh	w27, [x8, #4]
	ldr	w8, [sp, #224]                  ; 4-byte Reload
	cmp	w19, w8
	b.ne	LBB31_79
; %bb.74:
	str	wzr, [sp, #24]                  ; 4-byte Spill
	b	LBB31_83
LBB31_75:
	ldr	w8, [sp, #272]                  ; 4-byte Reload
	add	w8, w8, w24, uxth
	mul	w8, w8, w25
	cbz	w26, LBB31_77
; %bb.76:
	ldr	x10, [sp, #56]                  ; 8-byte Reload
	lsl	w9, w10, #4
	sub	w9, w9, w10, lsl #1
	mov	w10, #34079                     ; =0x851f
	movk	w10, #20971, lsl #16
	umull	x9, w9, w10
	lsr	x22, x9, #37
	add	w8, w8, w22
	add	w27, w8, #12
	b	LBB31_78
LBB31_77:
	ldr	x9, [sp, #56]                   ; 8-byte Reload
	mov	w10, #34079                     ; =0x851f
	movk	w10, #20971, lsl #16
	add	w9, w9, w9, lsl #3
	lsl	w9, w9, #3
	umull	x9, w9, w10
	lsr	x27, x9, #37
	sub	w8, w27, w8
	sub	w22, w8, #12
LBB31_78:
	ldr	w8, [sp, #224]                  ; 4-byte Reload
	tbz	w8, #0, LBB31_84
LBB31_79:
	ldr	w9, [sp, #52]                   ; 4-byte Reload
	add	x0, sp, #2160
	ldr	x8, [sp, #32]                   ; 8-byte Reload
	mov	w1, #-1728053248                ; =0x99000000
	strh	w22, [sp, #2160]
	strh	w27, [sp, #2164]
	strh	w9, [sp, #2162]
	add	w8, w9, w8
	strh	w8, [sp, #2166]
	bl	_draw_quad
	ldr	x8, [sp, #2160]
	mov	w11, #1                         ; =0x1
	ldr	x10, [sp, #192]                 ; 8-byte Reload
Lloh450:
	adrp	x12, _social_chat_hits@PAGE
Lloh451:
	add	x12, x12, _social_chat_hits@PAGEOFF
	add	w9, w10, w8, lsr #16
	add	x10, x10, x8, lsr #48
	stur	x8, [x12, #2]
	strb	w11, [x12]
	strh	w9, [x12, #4]
	strh	w10, [x12, #8]
	cbz	w23, LBB31_86
; %bb.80:
	ldrb	w9, [x20, #94]
	ldrb	w10, [x20]
	orr	w9, w9, w10
	cbz	w9, LBB31_82
; %bb.81:
	mov	w1, #39904                      ; =0x9be0
	add	w9, w8, #1
	add	x0, sp, #1728
	movk	w1, #57423, lsl #16
	str	x8, [sp, #1728]
	strh	w9, [sp, #1732]
	bl	_draw_quad
	ldrh	w8, [sp, #2164]
	mov	w1, #39904                      ; =0x9be0
	add	x0, sp, #1728
	movk	w1, #57423, lsl #16
	sub	w9, w8, #1
	strh	w8, [sp, #1732]
	strh	w9, [sp, #1728]
	bl	_draw_quad
	ldr	x8, [sp, #2160]
	mov	w1, #39904                      ; =0x9be0
	add	x0, sp, #1728
	movk	w1, #57423, lsl #16
	lsr	w9, w8, #16
	str	x8, [sp, #1728]
	add	w9, w9, #1
	strh	w9, [sp, #1734]
	bl	_draw_quad
	ldrh	w8, [sp, #2166]
	mov	w1, #39904                      ; =0x9be0
	add	x0, sp, #1728
	movk	w1, #57423, lsl #16
	sub	w9, w8, #1
	strh	w8, [sp, #1734]
	strh	w9, [sp, #1730]
	bl	_draw_quad
LBB31_82:
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #24]                   ; 4-byte Spill
LBB31_83:
	ldr	w8, [sp, #272]                  ; 4-byte Reload
	sxth	w9, w27
	add	w8, w8, w24, sxth
	mul	w8, w8, w25
	sub	w8, w9, w8
	add	w9, w22, #6
	sub	w8, w8, #6
	sxth	w9, w9
	cmp	w8, w9
	csel	w8, w8, w9, gt
	b	LBB31_85
LBB31_84:
	str	wzr, [sp, #24]                  ; 4-byte Spill
	add	w8, w22, #6
LBB31_85:
	str	w8, [sp, #284]                  ; 4-byte Spill
	b	LBB31_87
LBB31_86:
	add	w8, w22, #6
	str	w8, [sp, #284]                  ; 4-byte Spill
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #24]                   ; 4-byte Spill
LBB31_87:
	cmp	wzr, w21, lsl #16
	ldr	w24, [sp, #204]                 ; 4-byte Reload
	csinc	w8, w19, wzr, le
	ubfx	w9, w25, #1, #15
	str	x27, [sp, #16]                  ; 8-byte Spill
	str	w9, [sp, #160]                  ; 4-byte Spill
	tbz	w8, #0, LBB31_90
LBB31_88:
	ldr	w8, [sp, #24]                   ; 4-byte Reload
	cbz	w8, LBB31_752
; %bb.89:
	add	x8, sp, #2160
	add	x9, sp, #2160
	mov	w8, w8
	add	x10, sp, #2160
	add	x11, sp, #1728
	add	x12, sp, #1136
	ldr	w19, [sp, #52]                  ; 4-byte Reload
	str	x8, [sp, #184]                  ; 8-byte Spill
	mov	w8, w9
	str	x8, [sp, #272]                  ; 8-byte Spill
	mov	w8, w10
	add	w20, w19, #6
	str	x8, [sp, #264]                  ; 8-byte Spill
	mov	w8, w11
	str	x8, [sp, #256]                  ; 8-byte Spill
	mov	w8, w12
	str	x8, [sp, #112]                  ; 8-byte Spill
	bl	_get_ui_argb_white
	ldr	w9, [sp, #284]                  ; 4-byte Reload
	add	x21, sp, #2160
	mov	w28, wzr
	add	w24, w21, #42
	adrp	x27, _social_chat_private_heard.read_at@PAGE
	add	w22, w19, #6
	str	s0, [sp, #312]
	add	w8, w9, w25
	strh	w9, [sp, #1104]
	add	w9, w19, #6
	str	s1, [sp, #316]
	str	s2, [sp, #320]
	str	w8, [sp, #180]                  ; 4-byte Spill
	strh	w8, [sp, #1108]
	ldr	w8, [sp, #44]                   ; 4-byte Reload
	str	w9, [sp, #164]                  ; 4-byte Spill
	str	s3, [sp, #324]
	add	w8, w20, w8
	str	w8, [sp, #288]                  ; 4-byte Spill
	ldr	x8, [sp, #192]                  ; 8-byte Reload
	and	w8, w8, #0xffff
	str	w8, [sp, #284]                  ; 4-byte Spill
	ldr	w8, [sp, #160]                  ; 4-byte Reload
	neg	w8, w8
	and	w23, w8, #0xffff
	add	x8, sp, #1728
	add	x9, x8, #30
	add	w26, w8, #44
	str	x9, [sp, #24]                   ; 8-byte Spill
	add	x9, x8, #2
	str	x9, [sp, #248]                  ; 8-byte Spill
	add	x9, x8, #28
	str	x9, [sp, #72]                   ; 8-byte Spill
	add	x9, x8, #4
	str	x9, [sp, #240]                  ; 8-byte Spill
	add	x9, x8, #16
	str	x9, [sp, #128]                  ; 8-byte Spill
	add	x9, x8, #6
	str	x9, [sp, #224]                  ; 8-byte Spill
	add	x9, x8, #26
	str	x9, [sp, #80]                   ; 8-byte Spill
	add	x9, x8, #8
	str	x9, [sp, #216]                  ; 8-byte Spill
	add	x9, x8, #20
	str	x9, [sp, #104]                  ; 8-byte Spill
	add	x9, x8, #10
	str	x9, [sp, #208]                  ; 8-byte Spill
	add	x9, x8, #24
	str	x9, [sp, #88]                   ; 8-byte Spill
	add	x9, x8, #12
	str	x9, [sp, #168]                  ; 8-byte Spill
	add	x9, x8, #18
	str	x9, [sp, #120]                  ; 8-byte Spill
	add	x9, x8, #14
	str	x9, [sp, #144]                  ; 8-byte Spill
	add	x9, x8, #22
	mov	w8, #39322                      ; =0x999a
	movk	w8, #16153, lsl #16
	str	x9, [sp, #96]                   ; 8-byte Spill
	add	x9, sp, #2160
	add	w25, w9, #42
	fmov	s8, w8
	b	LBB31_94
LBB31_90:
	add	x8, sp, #2160
	add	x9, sp, #2160
	mov	w8, w8
	add	x10, sp, #1544
	add	x13, sp, #1728
	and	w11, w25, #0xffff
	mov	w12, #52429                     ; =0xcccd
	cmp	w25, #14
	str	x8, [sp, #248]                  ; 8-byte Spill
	mov	w8, w9
	mov	w9, w10
	ldr	w10, [sp, #52]                  ; 4-byte Reload
	fmov	s13, #1.00000000
	and	w27, w21, #0xffff
	str	x8, [sp, #88]                   ; 8-byte Spill
	mul	w8, w11, w12
	str	x9, [sp, #80]                   ; 8-byte Spill
	mov	w9, w13
	add	w22, w10, #3
	lsr	w8, w8, #18
	add	x28, sp, #2160
	str	x9, [sp, #72]                   ; 8-byte Spill
	ldr	w9, [sp, #264]                  ; 4-byte Reload
	str	w22, [sp, #128]                 ; 4-byte Spill
	add	w9, w9, w10
	add	w10, w9, #6
	ldr	w9, [sp, #256]                  ; 4-byte Reload
	str	w10, [sp, #272]                 ; 4-byte Spill
	add	w9, w10, w9
	str	w9, [sp, #120]                  ; 4-byte Spill
	ldr	x9, [sp, #192]                  ; 8-byte Reload
	add	w9, w10, w9
	mov	w10, #5243                      ; =0x147b
	movk	w10, #16238, lsl #16
	str	w9, [sp, #12]                   ; 4-byte Spill
	mov	w9, #2                          ; =0x2
	csel	w23, w8, w9, gt
	add	x8, sp, #1544
	add	w8, w8, #44
Lloh452:
	adrp	x9, lCPI31_1@PAGE
	dup	v9.2s, w10
	str	w23, [sp, #112]                 ; 4-byte Spill
	str	x8, [sp, #104]                  ; 8-byte Spill
	add	x8, sp, #2160
	add	w8, w8, #42
Lloh453:
	ldr	d10, [x9, lCPI31_1@PAGEOFF]
Lloh454:
	adrp	x9, lCPI31_2@PAGE
	str	x8, [sp, #240]                  ; 8-byte Spill
Lloh455:
	adrp	x8, lCPI31_0@PAGE
Lloh456:
	ldr	d12, [x9, lCPI31_2@PAGEOFF]
Lloh457:
	ldr	d8, [x8, lCPI31_0@PAGEOFF]
	mov	w8, #39322                      ; =0x999a
	movk	w8, #16153, lsl #16
	fmov	s11, w8
	mov	w8, #-998637568                 ; =0xc47a0000
	fmov	s14, w8
	b	LBB31_329
LBB31_91:                               ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #42
LBB31_92:                               ;   in Loop: Header=BB31_94 Depth=1
	strh	wzr, [x21, w8, sxtw #1]
	mov	x8, #140733193388032            ; =0x7fff00000000
	ldr	x1, [sp, #272]                  ; 8-byte Reload
	movk	x8, #32767, lsl #48
	add	x0, sp, #1136
	add	x2, sp, #1544
	add	x3, sp, #720
	str	x8, [sp, #1136]
	bl	_draw_unicode_string_compute_bounds
	ldrh	w8, [sp, #722]
LBB31_93:                               ;   in Loop: Header=BB31_94 Depth=1
	ldr	w9, [sp, #236]                  ; 4-byte Reload
	add	w28, w28, #1
	cmp	w28, #4
	add	w9, w22, w9
	add	w22, w9, w8
	b.eq	LBB31_302
LBB31_94:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB31_124 Depth 2
                                        ;     Child Loop BB31_215 Depth 2
	cbz	w28, LBB31_104
; %bb.95:                               ;   in Loop: Header=BB31_94 Depth=1
	cmp	w28, #2
	b.eq	LBB31_99
; %bb.96:                               ;   in Loop: Header=BB31_94 Depth=1
	mov	w8, w28
	cmp	w28, #1
	b.ne	LBB31_105
; %bb.97:                               ;   in Loop: Header=BB31_94 Depth=1
	bl	_social_chat_team
	cmn	w0, #1
	b.eq	LBB31_104
; %bb.98:                               ;   in Loop: Header=BB31_94 Depth=1
	mov	w8, #1                          ; =0x1
	b	LBB31_105
LBB31_99:                               ;   in Loop: Header=BB31_94 Depth=1
	ldr	w19, [x27, _social_chat_private_heard.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w19, w0
	b.ne	LBB31_101
; %bb.100:                              ;   in Loop: Header=BB31_94 Depth=1
	adrp	x8, _social_chat_private_heard.heard@PAGE
	ldrb	w8, [x8, _social_chat_private_heard.heard@PAGEOFF]
	b	LBB31_102
LBB31_101:                              ;   in Loop: Header=BB31_94 Depth=1
	bl	_config_changes
	str	w0, [x27, _social_chat_private_heard.read_at@PAGEOFF]
Lloh458:
	adrp	x0, l_.str.4@PAGE
Lloh459:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_private_heard.heard@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_private_heard.heard@PAGEOFF]
LBB31_102:                              ;   in Loop: Header=BB31_94 Depth=1
	cbz	w8, LBB31_104
; %bb.103:                              ;   in Loop: Header=BB31_94 Depth=1
	mov	w8, #2                          ; =0x2
	b	LBB31_105
LBB31_104:                              ;   in Loop: Header=BB31_94 Depth=1
	bl	_game_connection
	sub	w8, w0, #3
	mov	w9, #65534                      ; =0xfffe
	cmp	w9, w8, uxth
	mov	w8, #3                          ; =0x3
	csel	w8, w8, wzr, hi
LBB31_105:                              ;   in Loop: Header=BB31_94 Depth=1
Lloh460:
	adrp	x9, _social_chat_channel_names@PAGE
Lloh461:
	add	x9, x9, _social_chat_channel_names@PAGEOFF
	ldr	w9, [x9, w28, sxtw #2]
	ldrb	w10, [x9]
	cbz	w10, LBB31_121
; %bb.106:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w10, [sp, #1728]
	ldrb	w11, [x9, #1]
	ldr	x10, [sp, #248]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.107:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1730]
	ldrb	w11, [x9, #2]
	ldr	x10, [sp, #240]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.108:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1732]
	ldrb	w11, [x9, #3]
	ldr	x10, [sp, #224]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.109:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1734]
	ldrb	w11, [x9, #4]
	ldr	x10, [sp, #216]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.110:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1736]
	ldrb	w11, [x9, #5]
	ldr	x10, [sp, #208]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.111:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1738]
	ldrb	w11, [x9, #6]
	ldr	x10, [sp, #168]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.112:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1740]
	ldrb	w11, [x9, #7]
	ldr	x10, [sp, #144]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.113:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1742]
	ldrb	w11, [x9, #8]
	ldr	x10, [sp, #128]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.114:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1744]
	ldrb	w11, [x9, #9]
	ldr	x10, [sp, #120]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.115:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1746]
	ldrb	w11, [x9, #10]
	ldr	x10, [sp, #104]                 ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.116:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1748]
	ldrb	w11, [x9, #11]
	ldr	x10, [sp, #96]                  ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.117:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1750]
	ldrb	w11, [x9, #12]
	ldr	x10, [sp, #88]                  ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.118:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1752]
	ldrb	w11, [x9, #13]
	ldr	x10, [sp, #80]                  ; 8-byte Reload
	cbz	w11, LBB31_122
; %bb.119:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	w11, [sp, #1754]
	ldrb	w9, [x9, #14]
	ldr	x10, [sp, #72]                  ; 8-byte Reload
	cbz	w9, LBB31_122
; %bb.120:                              ;   in Loop: Header=BB31_94 Depth=1
	ldr	x10, [sp, #24]                  ; 8-byte Reload
	strh	w9, [sp, #1756]
	b	LBB31_122
LBB31_121:                              ;   in Loop: Header=BB31_94 Depth=1
	add	x10, sp, #1728
LBB31_122:                              ;   in Loop: Header=BB31_94 Depth=1
	adrp	x9, _social_chat@PAGE+36870
	cmp	w8, w28
Lloh462:
	adrp	x8, _social_chat_open_draw.grey@PAGE
Lloh463:
	add	x8, x8, _social_chat_open_draw.grey@PAGEOFF
	add	x11, sp, #312
	strh	w22, [sp, #1106]
	ldrh	w9, [x9, _social_chat@PAGEOFF+36870]
	csel	x8, x11, x8, eq
	add	x0, sp, #1136
	mov	w1, #1                          ; =0x1
	mov	w2, #1                          ; =0x1
	strh	wzr, [x10]
	str	xzr, [sp, #2168]
	cmp	w28, w9
Lloh464:
	adrp	x9, _social_chat_open_draw.blue@PAGE
Lloh465:
	add	x9, x9, _social_chat_open_draw.blue@PAGEOFF
	str	wzr, [sp, #2164]
	csel	x27, x9, x8, eq
	ldr	w8, [sp, #288]                  ; 4-byte Reload
	ldr	s0, [x27]
	strh	w8, [sp, #1110]
	ldr	x8, [sp, #1104]
	fmul	s0, s0, s8
	str	x8, [sp, #1136]
	str	s0, [sp, #2160]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	ldr	w19, [sp, #204]                 ; 4-byte Reload
	add	x4, sp, #2160
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	mov	w0, w19
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1136
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, w19
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	mov	x4, x27
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1104
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
	ldr	w8, [sp, #284]                  ; 4-byte Reload
	cmp	w28, #0
	ldrh	w10, [sp, #1728]
Lloh466:
	adrp	x9, _social_chat_hits@PAGE
Lloh467:
	add	x9, x9, _social_chat_hits@PAGEOFF
	add	x19, x9, w28, sxtw #3
	add	w20, w8, w22, uxth
	csel	w8, wzr, w23, eq
	add	w8, w20, w8
	strh	w8, [x19, #12]
	cbz	w10, LBB31_169
; %bb.123:                              ;   in Loop: Header=BB31_94 Depth=1
	mov	w9, wzr
	mov	w8, #43                         ; =0x2b
	adrp	x27, _social_chat_private_heard.read_at@PAGE
LBB31_124:                              ;   Parent Loop BB31_94 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w11, w26, w9
	add	w12, w21, w9
	sub	w11, w11, #42
	strh	w10, [x12]
	ldrh	w11, [x11]
	cbz	w11, LBB31_170
; %bb.125:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #40
	sub	w12, w12, #40
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_171
; %bb.126:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #38
	sub	w12, w12, #38
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_172
; %bb.127:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #36
	sub	w12, w12, #36
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_173
; %bb.128:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #34
	sub	w12, w12, #34
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_174
; %bb.129:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #32
	sub	w12, w12, #32
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_175
; %bb.130:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #30
	sub	w12, w12, #30
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_176
; %bb.131:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #28
	sub	w12, w12, #28
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_177
; %bb.132:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #26
	sub	w12, w12, #26
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_178
; %bb.133:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #24
	sub	w12, w12, #24
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_179
; %bb.134:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #22
	sub	w12, w12, #22
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_180
; %bb.135:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #20
	sub	w12, w12, #20
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_181
; %bb.136:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #18
	sub	w12, w12, #18
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_182
; %bb.137:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #16
	sub	w12, w12, #16
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_183
; %bb.138:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #14
	sub	w12, w12, #14
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_184
; %bb.139:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #12
	sub	w12, w12, #12
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_185
; %bb.140:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #10
	sub	w12, w12, #10
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_186
; %bb.141:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #8
	sub	w12, w12, #8
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_187
; %bb.142:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #6
	sub	w12, w12, #6
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_188
; %bb.143:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	sub	w10, w10, #4
	sub	w12, w12, #4
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_189
; %bb.144:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	sub	w11, w11, #2
	sub	w12, w12, #2
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_190
; %bb.145:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_191
; %bb.146:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #2
	add	w12, w12, #2
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_192
; %bb.147:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	add	w10, w10, #4
	add	w12, w12, #4
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_193
; %bb.148:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #6
	add	w12, w12, #6
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_194
; %bb.149:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	add	w10, w10, #8
	add	w12, w12, #8
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_195
; %bb.150:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #10
	add	w12, w12, #10
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_196
; %bb.151:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	add	w10, w10, #12
	add	w12, w12, #12
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_197
; %bb.152:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #14
	add	w12, w12, #14
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_198
; %bb.153:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	add	w10, w10, #16
	add	w12, w12, #16
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_199
; %bb.154:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #18
	add	w12, w12, #18
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_200
; %bb.155:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	add	w10, w10, #20
	add	w12, w12, #20
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_201
; %bb.156:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #22
	add	w12, w12, #22
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_202
; %bb.157:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	add	w10, w10, #24
	add	w12, w12, #24
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_203
; %bb.158:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #26
	add	w12, w12, #26
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_204
; %bb.159:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	add	w10, w10, #28
	add	w12, w12, #28
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_205
; %bb.160:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #30
	add	w12, w12, #30
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_206
; %bb.161:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	add	w10, w10, #32
	add	w12, w12, #32
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_207
; %bb.162:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #34
	add	w12, w12, #34
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_208
; %bb.163:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w12, w24, w9
	add	w10, w10, #36
	add	w12, w12, #36
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_209
; %bb.164:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w11, w26, w9
	add	w12, w24, w9
	add	w11, w11, #38
	add	w12, w12, #38
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_210
; %bb.165:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w13, w24, w9
	add	w10, w10, #40
	ldrh	w12, [x10]
	add	w10, w13, #40
	strh	w11, [x10]
	cbz	w12, LBB31_211
; %bb.166:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w10, w26, w9
	add	w11, w24, w9
	add	w10, w10, #42
	add	w11, w11, #42
	ldrh	w10, [x10]
	strh	w12, [x11]
	cbz	w10, LBB31_212
; %bb.167:                              ;   in Loop: Header=BB31_124 Depth=2
	add	w8, w8, #43
	add	w9, w9, #86
	cmp	w8, #344
	b.ne	LBB31_124
; %bb.168:                              ;   in Loop: Header=BB31_94 Depth=1
	mov	w8, #301                        ; =0x12d
	b	LBB31_212
LBB31_169:                              ;   in Loop: Header=BB31_94 Depth=1
	mov	w11, wzr
	mov	w8, wzr
	adrp	x27, _social_chat_private_heard.read_at@PAGE
	b	LBB31_213
LBB31_170:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #42
	b	LBB31_212
LBB31_171:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #41
	b	LBB31_212
LBB31_172:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #40
	b	LBB31_212
LBB31_173:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #39
	b	LBB31_212
LBB31_174:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #38
	b	LBB31_212
LBB31_175:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #37
	b	LBB31_212
LBB31_176:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #36
	b	LBB31_212
LBB31_177:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #35
	b	LBB31_212
LBB31_178:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #34
	b	LBB31_212
LBB31_179:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #33
	b	LBB31_212
LBB31_180:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #32
	b	LBB31_212
LBB31_181:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #31
	b	LBB31_212
LBB31_182:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #30
	b	LBB31_212
LBB31_183:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #29
	b	LBB31_212
LBB31_184:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #28
	b	LBB31_212
LBB31_185:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #27
	b	LBB31_212
LBB31_186:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #26
	b	LBB31_212
LBB31_187:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #25
	b	LBB31_212
LBB31_188:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #24
	b	LBB31_212
LBB31_189:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #23
	b	LBB31_212
LBB31_190:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #22
	b	LBB31_212
LBB31_191:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #21
	b	LBB31_212
LBB31_192:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #20
	b	LBB31_212
LBB31_193:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #19
	b	LBB31_212
LBB31_194:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #18
	b	LBB31_212
LBB31_195:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #17
	b	LBB31_212
LBB31_196:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #16
	b	LBB31_212
LBB31_197:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #15
	b	LBB31_212
LBB31_198:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #14
	b	LBB31_212
LBB31_199:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #13
	b	LBB31_212
LBB31_200:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #12
	b	LBB31_212
LBB31_201:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #11
	b	LBB31_212
LBB31_202:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #10
	b	LBB31_212
LBB31_203:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #9
	b	LBB31_212
LBB31_204:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #8
	b	LBB31_212
LBB31_205:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #7
	b	LBB31_212
LBB31_206:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #6
	b	LBB31_212
LBB31_207:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #5
	b	LBB31_212
LBB31_208:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #4
	b	LBB31_212
LBB31_209:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #3
	b	LBB31_212
LBB31_210:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #2
	b	LBB31_212
LBB31_211:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #1
LBB31_212:                              ;   in Loop: Header=BB31_94 Depth=1
	strh	wzr, [x21, w8, sxtw #1]
	mov	x8, #140733193388032            ; =0x7fff00000000
	ldr	x1, [sp, #264]                  ; 8-byte Reload
	movk	x8, #32767, lsl #48
	add	x0, sp, #1136
	add	x2, sp, #1544
	add	x3, sp, #720
	str	x8, [sp, #1136]
	bl	_draw_unicode_string_compute_bounds
	ldr	x9, [sp, #256]                  ; 8-byte Reload
	ldrh	w8, [sp, #722]
	ldrh	w11, [x9]
LBB31_213:                              ;   in Loop: Header=BB31_94 Depth=1
	ldr	w9, [sp, #160]                  ; 4-byte Reload
	ldrh	w10, [sp, #1104]
	add	w9, w20, w9
	add	w8, w9, w8
	ldrh	w9, [sp, #1108]
	sturh	w10, [x19, #10]
	sturh	w8, [x19, #16]
	sturh	w9, [x19, #14]
	cbz	w11, LBB31_260
; %bb.214:                              ;   in Loop: Header=BB31_94 Depth=1
	mov	w8, #43                         ; =0x2b
	mov	x9, x26
	mov	x10, x25
LBB31_215:                              ;   Parent Loop BB31_94 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	w12, w9, #42
	sub	w13, w10, #42
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_91
; %bb.216:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #40
	sub	w13, w10, #40
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_261
; %bb.217:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #38
	sub	w13, w10, #38
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_262
; %bb.218:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #36
	sub	w13, w10, #36
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_263
; %bb.219:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #34
	sub	w13, w10, #34
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_264
; %bb.220:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #32
	sub	w13, w10, #32
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_265
; %bb.221:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #30
	sub	w13, w10, #30
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_266
; %bb.222:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #28
	sub	w13, w10, #28
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_267
; %bb.223:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #26
	sub	w13, w10, #26
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_268
; %bb.224:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #24
	sub	w13, w10, #24
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_269
; %bb.225:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #22
	sub	w13, w10, #22
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_270
; %bb.226:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #20
	sub	w13, w10, #20
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_271
; %bb.227:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #18
	sub	w13, w10, #18
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_272
; %bb.228:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #16
	sub	w13, w10, #16
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_273
; %bb.229:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #14
	sub	w13, w10, #14
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_274
; %bb.230:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #12
	sub	w13, w10, #12
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_275
; %bb.231:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #10
	sub	w13, w10, #10
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_276
; %bb.232:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #8
	sub	w13, w10, #8
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_277
; %bb.233:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #6
	sub	w13, w10, #6
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_278
; %bb.234:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w11, w9, #4
	sub	w13, w10, #4
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_279
; %bb.235:                              ;   in Loop: Header=BB31_215 Depth=2
	sub	w12, w9, #2
	ldrh	w13, [x12]
	sub	w12, w10, #2
	strh	w11, [x12]
	cbz	w13, LBB31_280
; %bb.236:                              ;   in Loop: Header=BB31_215 Depth=2
	ldrh	w12, [x9]
	strh	w13, [x10]
	cbz	w12, LBB31_281
; %bb.237:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #2
	add	w13, w10, #2
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_282
; %bb.238:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #4
	add	w13, w10, #4
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_283
; %bb.239:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #6
	add	w13, w10, #6
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_284
; %bb.240:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #8
	add	w13, w10, #8
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_285
; %bb.241:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #10
	add	w13, w10, #10
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_286
; %bb.242:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #12
	add	w13, w10, #12
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_287
; %bb.243:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #14
	add	w13, w10, #14
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_288
; %bb.244:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #16
	add	w13, w10, #16
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_289
; %bb.245:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #18
	add	w13, w10, #18
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_290
; %bb.246:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #20
	add	w13, w10, #20
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_291
; %bb.247:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #22
	add	w13, w10, #22
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_292
; %bb.248:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #24
	add	w13, w10, #24
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_293
; %bb.249:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #26
	add	w13, w10, #26
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_294
; %bb.250:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #28
	add	w13, w10, #28
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_295
; %bb.251:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #30
	add	w13, w10, #30
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_296
; %bb.252:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #32
	add	w13, w10, #32
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_297
; %bb.253:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #34
	add	w13, w10, #34
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_298
; %bb.254:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #36
	add	w13, w10, #36
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_299
; %bb.255:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #38
	add	w13, w10, #38
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_300
; %bb.256:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w12, w9, #40
	add	w13, w10, #40
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_301
; %bb.257:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w11, w9, #42
	add	w13, w10, #42
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_92
; %bb.258:                              ;   in Loop: Header=BB31_215 Depth=2
	add	w9, w9, #86
	add	w8, w8, #43
	add	w10, w10, #86
	cmp	w8, #344
	b.ne	LBB31_215
; %bb.259:                              ;   in Loop: Header=BB31_94 Depth=1
	mov	w8, #301                        ; =0x12d
	b	LBB31_92
LBB31_260:                              ;   in Loop: Header=BB31_94 Depth=1
	mov	w8, wzr
	b	LBB31_93
LBB31_261:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #41
	b	LBB31_92
LBB31_262:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #40
	b	LBB31_92
LBB31_263:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #39
	b	LBB31_92
LBB31_264:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #38
	b	LBB31_92
LBB31_265:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #37
	b	LBB31_92
LBB31_266:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #36
	b	LBB31_92
LBB31_267:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #35
	b	LBB31_92
LBB31_268:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #34
	b	LBB31_92
LBB31_269:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #33
	b	LBB31_92
LBB31_270:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #32
	b	LBB31_92
LBB31_271:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #31
	b	LBB31_92
LBB31_272:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #30
	b	LBB31_92
LBB31_273:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #29
	b	LBB31_92
LBB31_274:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #28
	b	LBB31_92
LBB31_275:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #27
	b	LBB31_92
LBB31_276:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #26
	b	LBB31_92
LBB31_277:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #25
	b	LBB31_92
LBB31_278:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #24
	b	LBB31_92
LBB31_279:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #23
	b	LBB31_92
LBB31_280:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #22
	b	LBB31_92
LBB31_281:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #21
	b	LBB31_92
LBB31_282:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #20
	b	LBB31_92
LBB31_283:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #19
	b	LBB31_92
LBB31_284:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #18
	b	LBB31_92
LBB31_285:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #17
	b	LBB31_92
LBB31_286:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #16
	b	LBB31_92
LBB31_287:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #15
	b	LBB31_92
LBB31_288:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #14
	b	LBB31_92
LBB31_289:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #13
	b	LBB31_92
LBB31_290:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #12
	b	LBB31_92
LBB31_291:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #11
	b	LBB31_92
LBB31_292:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #10
	b	LBB31_92
LBB31_293:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #9
	b	LBB31_92
LBB31_294:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #8
	b	LBB31_92
LBB31_295:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #7
	b	LBB31_92
LBB31_296:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #6
	b	LBB31_92
LBB31_297:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #5
	b	LBB31_92
LBB31_298:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #4
	b	LBB31_92
LBB31_299:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #3
	b	LBB31_92
LBB31_300:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #2
	b	LBB31_92
LBB31_301:                              ;   in Loop: Header=BB31_94 Depth=1
	sub	w8, w8, #1
	b	LBB31_92
LBB31_302:
Lloh468:
	adrp	x26, _social_chat_hits@PAGE+42
Lloh469:
	add	x26, x26, _social_chat_hits@PAGEOFF+42
	mov	x0, x26
	mov	w1, wzr
	mov	w2, #8                          ; =0x8
	bl	_csmemset
	adrp	x8, _social_chat@PAGE+36870
	ldrh	w8, [x8, _social_chat@PAGEOFF+36870]
	cmp	w8, #2
	b.ne	LBB31_304
; %bb.303:
	mov	w8, #39672                      ; =0x9af8
Lloh470:
	adrp	x19, _social_chat@PAGE
Lloh471:
	add	x19, x19, _social_chat@PAGEOFF
	mov	w9, #39670                      ; =0x9af6
Lloh472:
	adrp	x1, l_.str.74@PAGE
Lloh473:
	add	x1, x1, l_.str.74@PAGEOFF
	add	x0, sp, #1728
	mov	w2, #127                        ; =0x7f
	ldrh	w20, [x19, x8]
	mov	w23, #127                       ; =0x7f
	ldrsh	w21, [x19, x9]
	sxth	w22, w20
	bl	_ustrncpy
	and	x8, x20, #0xffff
	mov	w9, #84                         ; =0x54
	cmp	w22, w21
	add	x0, sp, #1728
	umaddl	x8, w8, w9, x19
	ccmp	w22, #0, #8, lt
	mov	w9, #36998                      ; =0x9086
	strh	wzr, [sp, #1982]
	add	x8, x8, x9
Lloh474:
	adrp	x9, l_.str.75@PAGE
Lloh475:
	add	x9, x9, l_.str.75@PAGEOFF
	csel	x25, x9, x8, mi
	bl	_ustrlen
	sub	w2, w23, w0
	add	x0, sp, #1728
	mov	x1, x25
	bl	_ustrncat
	mov	w8, #39322                      ; =0x999a
	ldr	w10, [sp, #180]                 ; 4-byte Reload
	movk	w8, #16153, lsl #16
	ldr	w9, [sp, #236]                  ; 4-byte Reload
	ldr	s0, [sp, #312]
	add	x0, sp, #1136
	mov	w1, #1                          ; =0x1
	mov	w2, #1                          ; =0x1
	fmov	s1, w8
	ldr	w8, [sp, #164]                  ; 4-byte Reload
	strh	w10, [sp, #1104]
	add	w10, w10, w9
	str	xzr, [sp, #2168]
	str	wzr, [sp, #2164]
	strh	w8, [sp, #1106]
	ldr	w8, [sp, #288]                  ; 4-byte Reload
	fmul	s0, s0, s1
	strh	w10, [sp, #1108]
	str	w10, [sp, #180]                 ; 4-byte Spill
	strh	w8, [sp, #1110]
	ldr	x8, [sp, #1104]
	str	s0, [sp, #2160]
	str	x8, [sp, #1136]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	ldr	w19, [sp, #204]                 ; 4-byte Reload
	add	x4, sp, #2160
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	mov	w0, w19
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1136
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	add	x4, sp, #312
	mov	w0, w19
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1104
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
	ldr	x8, [sp, #1104]
	ldr	x10, [sp, #192]                 ; 8-byte Reload
	str	x8, [x26]
	add	w9, w10, w8, lsr #16
	add	x10, x10, x8, lsr #48
	strh	w9, [x26, #2]
	strh	w10, [x26, #6]
LBB31_304:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	x10, sp, #1136
	mov	w8, wzr
	mov	w9, #36880                      ; =0x9010
	add	w10, w10, #20
	mov	w11, #36881                     ; =0x9011
	mov	w12, #36882                     ; =0x9012
	mov	w13, #36883                     ; =0x9013
	mov	w14, #36884                     ; =0x9014
	mov	w15, #36885                     ; =0x9015
	mov	w16, #36886                     ; =0x9016
	mov	w17, #36887                     ; =0x9017
	mov	w0, #36888                      ; =0x9018
	mov	w1, #36889                      ; =0x9019
	mov	w2, #36890                      ; =0x901a
	mov	w3, #36891                      ; =0x901b
	mov	w4, #36892                      ; =0x901c
	mov	w5, #36893                      ; =0x901d
	mov	w6, #36894                      ; =0x901e
	mov	w7, #36895                      ; =0x901f
	mov	w19, #36896                     ; =0x9020
	mov	w20, #36897                     ; =0x9021
	mov	w21, #36898                     ; =0x9022
	mov	w22, #36899                     ; =0x9023
	mov	w23, #36900                     ; =0x9024
Lloh476:
	adrp	x24, _social_chat@PAGE
Lloh477:
	add	x24, x24, _social_chat@PAGEOFF
LBB31_305:                              ; =>This Inner Loop Header: Depth=1
	add	w25, w24, w8
	add	w26, w25, w9
	ldrb	w26, [x26]
	cbz	w26, LBB31_647
; %bb.306:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w25, w11
	sub	w27, w10, #20
	ldrb	w25, [x25]
	strh	w26, [x27]
	cbz	w25, LBB31_627
; %bb.307:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w27, w24, w8
	sub	w28, w10, #18
	add	w26, w27, w12
	strh	w25, [x28]
	ldrb	w26, [x26]
	cbz	w26, LBB31_628
; %bb.308:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w27, w13
	sub	w27, w10, #16
	ldrb	w25, [x25]
	strh	w26, [x27]
	cbz	w25, LBB31_629
; %bb.309:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w27, w24, w8
	sub	w28, w10, #14
	add	w26, w27, w14
	strh	w25, [x28]
	ldrb	w26, [x26]
	cbz	w26, LBB31_630
; %bb.310:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w27, w15
	sub	w27, w10, #12
	ldrb	w25, [x25]
	strh	w26, [x27]
	cbz	w25, LBB31_631
; %bb.311:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w27, w24, w8
	sub	w28, w10, #10
	add	w26, w27, w16
	strh	w25, [x28]
	ldrb	w26, [x26]
	cbz	w26, LBB31_632
; %bb.312:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w27, w17
	sub	w27, w10, #8
	ldrb	w25, [x25]
	strh	w26, [x27]
	cbz	w25, LBB31_633
; %bb.313:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w27, w24, w8
	sub	w28, w10, #6
	add	w26, w27, w0
	strh	w25, [x28]
	ldrb	w26, [x26]
	cbz	w26, LBB31_634
; %bb.314:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w27, w1
	sub	w27, w10, #4
	ldrb	w25, [x25]
	strh	w26, [x27]
	cbz	w25, LBB31_635
; %bb.315:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w27, w24, w8
	sub	w28, w10, #2
	add	w26, w27, w2
	strh	w25, [x28]
	ldrb	w26, [x26]
	cbz	w26, LBB31_636
; %bb.316:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w27, w3
	strh	w26, [x10]
	ldrb	w25, [x25]
	cbz	w25, LBB31_637
; %bb.317:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w27, w24, w8
	add	w28, w10, #2
	add	w26, w27, w4
	strh	w25, [x28]
	ldrb	w26, [x26]
	cbz	w26, LBB31_638
; %bb.318:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w27, w5
	add	w27, w10, #4
	ldrb	w25, [x25]
	strh	w26, [x27]
	cbz	w25, LBB31_639
; %bb.319:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w27, w24, w8
	add	w28, w10, #6
	add	w26, w27, w6
	strh	w25, [x28]
	ldrb	w26, [x26]
	cbz	w26, LBB31_640
; %bb.320:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w27, w7
	add	w27, w10, #8
	ldrb	w25, [x25]
	strh	w26, [x27]
	cbz	w25, LBB31_641
; %bb.321:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w27, w24, w8
	add	w28, w10, #10
	add	w26, w27, w19
	strh	w25, [x28]
	ldrb	w26, [x26]
	cbz	w26, LBB31_642
; %bb.322:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w27, w20
	add	w27, w10, #12
	ldrb	w25, [x25]
	strh	w26, [x27]
	cbz	w25, LBB31_643
; %bb.323:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w27, w24, w8
	add	w28, w10, #14
	add	w26, w27, w21
	strh	w25, [x28]
	ldrb	w26, [x26]
	cbz	w26, LBB31_644
; %bb.324:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w27, w22
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w27, w10, #16
	ldrb	w25, [x25]
	strh	w26, [x27]
	cbz	w25, LBB31_645
; %bb.325:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w26, w24, w8
	add	w27, w10, #18
	add	w26, w26, w23
	strh	w25, [x27]
	ldrb	w26, [x26]
	cbz	w26, LBB31_646
; %bb.326:                              ;   in Loop: Header=BB31_305 Depth=1
	add	w25, w10, #20
	add	w8, w8, #21
	add	w10, w10, #42
	cmp	w8, #63
	strh	w26, [x25]
	b.ne	LBB31_305
	b	LBB31_647
LBB31_327:                              ;   in Loop: Header=BB31_329 Depth=1
	mov	w10, #90                        ; =0x5a
Lloh478:
	adrp	x11, _social_chat_player@PAGE
Lloh479:
	add	x11, x11, _social_chat_player@PAGEOFF
	add	w9, w8, #1
	smaddl	x19, w8, w10, x11
	ldr	w10, [sp, #12]                  ; 4-byte Reload
	ldr	w8, [sp, #264]                  ; 4-byte Reload
	mov	w2, #15                         ; =0xf
	ldr	x21, [sp, #168]                 ; 8-byte Reload
	add	x0, x19, #186
	strh	w9, [x11, #176]
	strh	w10, [x19, #180]
	add	w8, w8, w10
	add	x1, x21, #270
	strh	w8, [x19, #184]
	ldr	w8, [sp, #284]                  ; 4-byte Reload
	strh	w8, [x19, #178]
	ldr	w8, [sp, #96]                   ; 4-byte Reload
	strh	w8, [x19, #182]
	bl	_csstrncpy
	add	x0, x19, #202
	mov	x1, x21
	mov	w2, #32                         ; =0x20
	strb	wzr, [x19, #201]
	bl	_ustrncpy
	strh	wzr, [x19, #266]
LBB31_328:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	w9, [sp, #180]                  ; 4-byte Reload
	sub	w27, w20, #1
	ldr	w10, [sp, #284]                 ; 4-byte Reload
	cmp	w20, #0
	mul	w9, w9, w25
	add	w10, w9, w10
	str	w10, [sp, #284]                 ; 4-byte Spill
	b.le	LBB31_88
LBB31_329:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB31_335 Depth 2
                                        ;     Child Loop BB31_337 Depth 2
                                        ;     Child Loop BB31_407 Depth 2
                                        ;     Child Loop BB31_499 Depth 2
                                        ;       Child Loop BB31_500 Depth 3
                                        ;       Child Loop BB31_503 Depth 3
                                        ;       Child Loop BB31_597 Depth 3
                                        ;         Child Loop BB31_600 Depth 4
                                        ;       Child Loop BB31_608 Depth 3
                                        ;       Child Loop BB31_613 Depth 3
	add	x8, sp, #904
Lloh480:
	adrp	x13, _social_chat@PAGE
Lloh481:
	add	x13, x13, _social_chat@PAGEOFF
	mov	w9, #36866                      ; =0x9002
	mov	w10, #43691                     ; =0xaaab
	mov	w11, #36864                     ; =0x9000
	ldrsh	w8, [x8, w27, sxtw #1]
	movk	w10, #10922, lsl #16
	ldrsh	w9, [x13, x9]
	add	x2, sp, #720
	ldrsh	w11, [x13, x11]
	add	x3, sp, #312
	ldr	w1, [sp, #164]                  ; 4-byte Reload
	sub	w9, w9, w8
	add	w9, w9, #96
	cmp	w8, w11
	ccmn	w8, #1, #4, lt
	mov	w8, #384                        ; =0x180
	smull	x10, w9, w10
	lsr	x12, x10, #36
	add	x10, x12, x10, lsr #63
	mov	w12, #96                        ; =0x60
	msub	w9, w10, w12, w9
	smaddl	x8, w9, w8, x13
	csel	x26, x8, xzr, gt
	mov	x0, x26
	bl	_social_chat_line_rows
	fmov	s15, #1.00000000
	ldr	w8, [sp, #224]                  ; 4-byte Reload
	str	w0, [sp, #180]                  ; 4-byte Spill
	tbnz	w8, #0, LBB31_332
; %bb.330:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	w8, [x26, #380]
	ldr	w9, [sp, #208]                  ; 4-byte Reload
	sub	w8, w9, w8
	mov	w9, #10001                      ; =0x2711
	cmp	w8, w9
	b.lo	LBB31_332
; %bb.331:                              ;   in Loop: Header=BB31_329 Depth=1
	mov	w9, #-10000                     ; =0xffffd8f0
	add	w8, w8, w9
	ucvtf	s0, w8
	fdiv	s0, s0, s14
	fadd	s15, s0, s13
LBB31_332:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	w8, [sp, #216]                  ; 4-byte Reload
	cbz	w8, LBB31_336
; %bb.333:                              ;   in Loop: Header=BB31_329 Depth=1
	add	x9, sp, #904
	lsl	w8, w27, #1
	ldrh	w8, [x9, w8, sxtw]
	adrp	x9, _social_chat@PAGE+36970
	ldrh	w9, [x9, _social_chat@PAGEOFF+36970]
	cmp	w8, w9
	b.ne	LBB31_336
; %bb.334:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	w9, [sp, #160]                  ; 4-byte Reload
	mov	w8, wzr
	ldr	w10, [sp, #284]                 ; 4-byte Reload
	add	w19, w10, w9
	add	w20, w19, #1
	.p2align	4, , 8
LBB31_335:                              ;   Parent Loop BB31_329 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	w21, w8
	add	w8, w22, w8
	sub	w9, w23, w21
	mov	w1, #39904                      ; =0x9be0
	add	w10, w8, #1
	sub	w11, w19, w9
	add	w9, w20, w9
	add	x0, sp, #2160
	movk	w1, #65359, lsl #16
	strh	w8, [sp, #2162]
	strh	w10, [sp, #2166]
	strh	w11, [sp, #2160]
	strh	w9, [sp, #2164]
	bl	_draw_quad
	add	w8, w21, #1
	cmp	w23, w21, uxth
	b.hi	LBB31_335
LBB31_336:                              ;   in Loop: Header=BB31_329 Depth=1
	add	x1, sp, #1544
	mov	x0, x26
	mov	w19, w26
	bl	_social_chat_head
	add	x10, sp, #1728
	mov	w8, wzr
	add	x9, x26, #66
	add	w10, w10, #28
LBB31_337:                              ;   Parent Loop BB31_329 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w11, w9, w8
	ldrb	w11, [x11]
	cbz	w11, LBB31_395
; %bb.338:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #28
	add	w13, w9, w8
	add	w13, w13, #1
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_367
; %bb.339:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #26
	add	w13, w9, w8
	add	w13, w13, #2
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_368
; %bb.340:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #24
	add	w13, w9, w8
	add	w13, w13, #3
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_369
; %bb.341:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #22
	add	w13, w9, w8
	add	w13, w13, #4
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_370
; %bb.342:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #20
	add	w13, w9, w8
	add	w13, w13, #5
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_371
; %bb.343:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #18
	add	w13, w9, w8
	add	w13, w13, #6
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_372
; %bb.344:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #16
	add	w13, w9, w8
	add	w13, w13, #7
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_373
; %bb.345:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #14
	add	w13, w9, w8
	add	w13, w13, #8
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_374
; %bb.346:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #12
	add	w13, w9, w8
	add	w13, w13, #9
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_375
; %bb.347:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #10
	add	w13, w9, w8
	add	w13, w13, #10
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_376
; %bb.348:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #8
	add	w13, w9, w8
	add	w13, w13, #11
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_377
; %bb.349:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #6
	add	w13, w9, w8
	add	w13, w13, #12
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_378
; %bb.350:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #4
	add	w13, w9, w8
	add	w13, w13, #13
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_379
; %bb.351:                              ;   in Loop: Header=BB31_337 Depth=2
	sub	w12, w10, #2
	add	w13, w9, w8
	add	w13, w13, #14
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_380
; %bb.352:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w9, w8
	strh	w11, [x10]
	add	w12, w12, #15
	ldrb	w11, [x12]
	cbz	w11, LBB31_381
; %bb.353:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #2
	add	w13, w9, w8
	add	w13, w13, #16
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_382
; %bb.354:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #4
	add	w13, w9, w8
	add	w13, w13, #17
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_383
; %bb.355:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #6
	add	w13, w9, w8
	add	w13, w13, #18
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_384
; %bb.356:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #8
	add	w13, w9, w8
	add	w13, w13, #19
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_385
; %bb.357:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #10
	add	w13, w9, w8
	add	w13, w13, #20
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_386
; %bb.358:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #12
	add	w13, w9, w8
	add	w13, w13, #21
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_387
; %bb.359:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #14
	add	w13, w9, w8
	add	w13, w13, #22
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_388
; %bb.360:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #16
	add	w13, w9, w8
	add	w13, w13, #23
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_389
; %bb.361:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #18
	add	w13, w9, w8
	add	w13, w13, #24
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_390
; %bb.362:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #20
	add	w13, w9, w8
	add	w13, w13, #25
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_391
; %bb.363:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #22
	add	w13, w9, w8
	add	w13, w13, #26
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_392
; %bb.364:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #24
	add	w13, w9, w8
	add	w13, w13, #27
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_393
; %bb.365:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #26
	add	w13, w9, w8
	add	w13, w13, #28
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB31_394
; %bb.366:                              ;   in Loop: Header=BB31_337 Depth=2
	add	w12, w10, #28
	add	w8, w8, #29
	add	w10, w10, #58
	cmp	w8, #203
	strh	w11, [x12]
	b.ne	LBB31_337
	b	LBB31_395
LBB31_367:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #1
	b	LBB31_395
LBB31_368:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #2
	b	LBB31_395
LBB31_369:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #3
	b	LBB31_395
LBB31_370:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #4
	b	LBB31_395
LBB31_371:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #5
	b	LBB31_395
LBB31_372:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #6
	b	LBB31_395
LBB31_373:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #7
	b	LBB31_395
LBB31_374:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #8
	b	LBB31_395
LBB31_375:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #9
	b	LBB31_395
LBB31_376:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #10
	b	LBB31_395
LBB31_377:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #11
	b	LBB31_395
LBB31_378:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #12
	b	LBB31_395
LBB31_379:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #13
	b	LBB31_395
LBB31_380:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #14
	b	LBB31_395
LBB31_381:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #15
	b	LBB31_395
LBB31_382:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #16
	b	LBB31_395
LBB31_383:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #17
	b	LBB31_395
LBB31_384:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #18
	b	LBB31_395
LBB31_385:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #19
	b	LBB31_395
LBB31_386:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #20
	b	LBB31_395
LBB31_387:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #21
	b	LBB31_395
LBB31_388:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #22
	b	LBB31_395
LBB31_389:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #23
	b	LBB31_395
LBB31_390:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #24
	b	LBB31_395
LBB31_391:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #25
	b	LBB31_395
LBB31_392:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #26
	b	LBB31_395
LBB31_393:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #27
	b	LBB31_395
LBB31_394:                              ;   in Loop: Header=BB31_329 Depth=1
	add	w8, w8, #28
LBB31_395:                              ;   in Loop: Header=BB31_329 Depth=1
	add	x9, sp, #1728
	str	s15, [sp, #1120]
	strh	wzr, [x9, w8, sxtw #1]
	ldrh	w8, [x26, #370]
	sub	w8, w8, #1
	and	w9, w8, #0xffff
	cmp	w9, #3
	b.hi	LBB31_397
; %bb.396:                              ;   in Loop: Header=BB31_329 Depth=1
Lloh482:
	adrp	x9, l_switch.table.social_chat_draw_in@PAGE
Lloh483:
	add	x9, x9, l_switch.table.social_chat_draw_in@PAGEOFF
	ubfiz	x8, x8, #2, #16
	ldr	s0, [x9, x8]
Lloh484:
	adrp	x9, l_switch.table.social_chat_draw_in.100@PAGE
Lloh485:
	add	x9, x9, l_switch.table.social_chat_draw_in.100@PAGEOFF
	ldr	s1, [x9, x8]
Lloh486:
	adrp	x9, l_switch.table.social_chat_draw_in.101@PAGE
Lloh487:
	add	x9, x9, l_switch.table.social_chat_draw_in.101@PAGEOFF
	ldr	s2, [x9, x8]
	b	LBB31_398
LBB31_397:                              ;   in Loop: Header=BB31_329 Depth=1
	mov	w8, #39322                      ; =0x999a
	movk	w8, #16217, lsl #16
	fmov	s0, w8
	fmov	s1, s0
	fmov	s2, s0
LBB31_398:                              ;   in Loop: Header=BB31_329 Depth=1
	ldrb	w8, [x26, #374]
	mov	w10, #5243                      ; =0x147b
	ldr	x15, [sp, #104]                 ; 8-byte Reload
	add	w14, w28, #42
	movk	w10, #16238, lsl #16
	str	s0, [sp, #1124]
	str	s1, [sp, #1128]
	cmp	w8, #0
	str	s2, [sp, #1132]
	cset	w9, eq
	str	s15, [sp, #1104]
	str	w10, [sp, #1108]
	dup	v3.2s, w9
	ldrh	w9, [x26, #368]
	cmp	w9, #3
	shl	v3.2s, v3.2s, #31
	cmlt	v3.2s, v3.2s, #0
	bsl	v3.8b, v9.8b, v8.8b
	str	d3, [sp, #1112]
	b.eq	LBB31_402
; %bb.399:                              ;   in Loop: Header=BB31_329 Depth=1
	cmp	w9, #2
	b.ne	LBB31_405
; %bb.400:                              ;   in Loop: Header=BB31_329 Depth=1
	cbnz	w8, LBB31_405
; %bb.401:                              ;   in Loop: Header=BB31_329 Depth=1
	mov	w8, #13107                      ; =0x3333
	fmov	d1, d12
	movk	w8, #16243, lsl #16
	fmov	s0, w8
	b	LBB31_404
LBB31_402:                              ;   in Loop: Header=BB31_329 Depth=1
	cbnz	w8, LBB31_405
; %bb.403:                              ;   in Loop: Header=BB31_329 Depth=1
	fmov	s0, #1.00000000
	fmov	d1, d10
LBB31_404:                              ;   in Loop: Header=BB31_329 Depth=1
	add	x8, sp, #1104
	str	s0, [sp, #1116]
	stur	d1, [x8, #4]
LBB31_405:                              ;   in Loop: Header=BB31_329 Depth=1
	ldrh	w10, [sp, #1544]
	str	x26, [sp, #168]                 ; 8-byte Spill
	str	w27, [sp, #184]                 ; 4-byte Spill
	str	x19, [sp, #144]                 ; 8-byte Spill
	cbz	w10, LBB31_452
; %bb.406:                              ;   in Loop: Header=BB31_329 Depth=1
	mov	w9, wzr
	mov	w8, #43                         ; =0x2b
LBB31_407:                              ;   Parent Loop BB31_329 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w11, w15, w9
	add	w12, w28, w9
	sub	w11, w11, #42
	strh	w10, [x12]
	ldrh	w11, [x11]
	cbz	w11, LBB31_453
; %bb.408:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #40
	sub	w12, w12, #40
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_454
; %bb.409:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #38
	sub	w12, w12, #38
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_455
; %bb.410:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #36
	sub	w12, w12, #36
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_456
; %bb.411:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #34
	sub	w12, w12, #34
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_457
; %bb.412:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #32
	sub	w12, w12, #32
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_458
; %bb.413:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #30
	sub	w12, w12, #30
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_459
; %bb.414:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #28
	sub	w12, w12, #28
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_460
; %bb.415:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #26
	sub	w12, w12, #26
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_461
; %bb.416:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #24
	sub	w12, w12, #24
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_462
; %bb.417:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #22
	sub	w12, w12, #22
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_463
; %bb.418:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #20
	sub	w12, w12, #20
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_464
; %bb.419:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #18
	sub	w12, w12, #18
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_465
; %bb.420:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #16
	sub	w12, w12, #16
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_466
; %bb.421:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #14
	sub	w12, w12, #14
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_467
; %bb.422:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #12
	sub	w12, w12, #12
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_468
; %bb.423:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #10
	sub	w12, w12, #10
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_469
; %bb.424:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #8
	sub	w12, w12, #8
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_470
; %bb.425:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #6
	sub	w12, w12, #6
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_471
; %bb.426:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	sub	w10, w10, #4
	sub	w12, w12, #4
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_472
; %bb.427:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	sub	w11, w11, #2
	sub	w12, w12, #2
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_473
; %bb.428:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_474
; %bb.429:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #2
	add	w12, w12, #2
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_475
; %bb.430:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	add	w10, w10, #4
	add	w12, w12, #4
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_476
; %bb.431:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #6
	add	w12, w12, #6
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_477
; %bb.432:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	add	w10, w10, #8
	add	w12, w12, #8
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_478
; %bb.433:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #10
	add	w12, w12, #10
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_479
; %bb.434:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	add	w10, w10, #12
	add	w12, w12, #12
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_480
; %bb.435:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #14
	add	w12, w12, #14
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_481
; %bb.436:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	add	w10, w10, #16
	add	w12, w12, #16
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_482
; %bb.437:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #18
	add	w12, w12, #18
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_483
; %bb.438:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	add	w10, w10, #20
	add	w12, w12, #20
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_484
; %bb.439:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #22
	add	w12, w12, #22
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_485
; %bb.440:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	add	w10, w10, #24
	add	w12, w12, #24
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_486
; %bb.441:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #26
	add	w12, w12, #26
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_487
; %bb.442:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	add	w10, w10, #28
	add	w12, w12, #28
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_488
; %bb.443:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #30
	add	w12, w12, #30
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_489
; %bb.444:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	add	w10, w10, #32
	add	w12, w12, #32
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_490
; %bb.445:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #34
	add	w12, w12, #34
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_491
; %bb.446:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w12, w14, w9
	add	w10, w10, #36
	add	w12, w12, #36
	ldrh	w10, [x10]
	strh	w11, [x12]
	cbz	w10, LBB31_492
; %bb.447:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w11, w15, w9
	add	w12, w14, w9
	add	w11, w11, #38
	add	w12, w12, #38
	ldrh	w11, [x11]
	strh	w10, [x12]
	cbz	w11, LBB31_493
; %bb.448:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w13, w14, w9
	add	w10, w10, #40
	ldrh	w12, [x10]
	add	w10, w13, #40
	strh	w11, [x10]
	cbz	w12, LBB31_494
; %bb.449:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w10, w15, w9
	add	w11, w14, w9
	add	w10, w10, #42
	add	w11, w11, #42
	ldrh	w10, [x10]
	strh	w12, [x11]
	cbz	w10, LBB31_495
; %bb.450:                              ;   in Loop: Header=BB31_407 Depth=2
	add	w8, w8, #43
	add	w9, w9, #86
	cmp	w8, #344
	b.ne	LBB31_407
; %bb.451:                              ;   in Loop: Header=BB31_329 Depth=1
	mov	w8, #301                        ; =0x12d
	b	LBB31_495
LBB31_452:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	w8, [sp, #272]                  ; 4-byte Reload
	ldr	w9, [sp, #120]                  ; 4-byte Reload
	str	wzr, [sp, #264]                 ; 4-byte Spill
	strh	w8, [sp, #1098]
	ldr	w8, [sp, #284]                  ; 4-byte Reload
	strh	w9, [sp, #1102]
	add	w10, w8, w25
	strh	w8, [sp, #1096]
	str	w10, [sp, #96]                  ; 4-byte Spill
	strh	w10, [sp, #1100]
	b	LBB31_497
LBB31_453:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #42
	b	LBB31_495
LBB31_454:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #41
	b	LBB31_495
LBB31_455:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #40
	b	LBB31_495
LBB31_456:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #39
	b	LBB31_495
LBB31_457:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #38
	b	LBB31_495
LBB31_458:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #37
	b	LBB31_495
LBB31_459:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #36
	b	LBB31_495
LBB31_460:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #35
	b	LBB31_495
LBB31_461:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #34
	b	LBB31_495
LBB31_462:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #33
	b	LBB31_495
LBB31_463:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #32
	b	LBB31_495
LBB31_464:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #31
	b	LBB31_495
LBB31_465:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #30
	b	LBB31_495
LBB31_466:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #29
	b	LBB31_495
LBB31_467:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #28
	b	LBB31_495
LBB31_468:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #27
	b	LBB31_495
LBB31_469:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #26
	b	LBB31_495
LBB31_470:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #25
	b	LBB31_495
LBB31_471:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #24
	b	LBB31_495
LBB31_472:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #23
	b	LBB31_495
LBB31_473:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #22
	b	LBB31_495
LBB31_474:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #21
	b	LBB31_495
LBB31_475:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #20
	b	LBB31_495
LBB31_476:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #19
	b	LBB31_495
LBB31_477:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #18
	b	LBB31_495
LBB31_478:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #17
	b	LBB31_495
LBB31_479:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #16
	b	LBB31_495
LBB31_480:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #15
	b	LBB31_495
LBB31_481:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #14
	b	LBB31_495
LBB31_482:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #13
	b	LBB31_495
LBB31_483:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #12
	b	LBB31_495
LBB31_484:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #11
	b	LBB31_495
LBB31_485:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #10
	b	LBB31_495
LBB31_486:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #9
	b	LBB31_495
LBB31_487:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #8
	b	LBB31_495
LBB31_488:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #7
	b	LBB31_495
LBB31_489:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #6
	b	LBB31_495
LBB31_490:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #5
	b	LBB31_495
LBB31_491:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #4
	b	LBB31_495
LBB31_492:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #3
	b	LBB31_495
LBB31_493:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #2
	b	LBB31_495
LBB31_494:                              ;   in Loop: Header=BB31_329 Depth=1
	sub	w8, w8, #1
LBB31_495:                              ;   in Loop: Header=BB31_329 Depth=1
	strh	wzr, [x28, w8, sxtw #1]
	mov	x8, #140733193388032            ; =0x7fff00000000
	ldr	x1, [sp, #88]                   ; 8-byte Reload
	movk	x8, #32767, lsl #48
	add	x0, sp, #1136
	add	x2, sp, #2152
	add	x3, sp, #2144
	str	x8, [sp, #1136]
	bl	_draw_unicode_string_compute_bounds
	ldrh	w8, [sp, #2146]
	ldr	w9, [sp, #272]                  ; 4-byte Reload
	ldr	w10, [sp, #120]                 ; 4-byte Reload
	str	w8, [sp, #264]                  ; 4-byte Spill
	ldr	x8, [sp, #80]                   ; 8-byte Reload
	strh	w9, [sp, #1098]
	ldr	w9, [sp, #284]                  ; 4-byte Reload
	strh	w10, [sp, #1102]
	ldrh	w8, [x8]
	add	w11, w9, w25
	strh	w9, [sp, #1096]
	str	w11, [sp, #96]                  ; 4-byte Spill
	strh	w11, [sp, #1100]
	cbz	w8, LBB31_497
; %bb.496:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	s0, [sp, #1120]
	add	x0, sp, #1136
	ldr	x8, [sp, #1096]
	mov	w1, #1                          ; =0x1
	mov	w2, #1                          ; =0x1
	str	xzr, [sp, #2168]
	str	wzr, [sp, #2164]
	fmul	s0, s0, s11
	str	x8, [sp, #1136]
	str	s0, [sp, #2160]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	add	x4, sp, #2160
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1136
	add	x4, sp, #1544
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	add	x4, sp, #1120
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1096
	add	x4, sp, #1544
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
LBB31_497:                              ;   in Loop: Header=BB31_329 Depth=1
	ldrh	w27, [sp, #1728]
	cbz	w27, LBB31_619
; %bb.498:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	x26, [sp, #72]                  ; 8-byte Reload
	mov	w20, wzr
	mov	w19, wzr
	.p2align	4, , 8
LBB31_499:                              ;   Parent Loop BB31_329 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB31_500 Depth 3
                                        ;       Child Loop BB31_503 Depth 3
                                        ;       Child Loop BB31_597 Depth 3
                                        ;         Child Loop BB31_600 Depth 4
                                        ;       Child Loop BB31_608 Depth 3
                                        ;       Child Loop BB31_613 Depth 3
	mov	w8, wzr
	.p2align	4, , 8
LBB31_500:                              ;   Parent Loop BB31_329 Depth=1
                                        ;     Parent Loop BB31_499 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	w21, w8
	sxth	x8, w21
	ldrh	w9, [x26, x8, lsl #1]
	add	w8, w21, #1
	cbnz	w9, LBB31_500
; %bb.501:                              ;   in Loop: Header=BB31_499 Depth=2
	ldr	w8, [sp, #264]                  ; 4-byte Reload
	tst	w19, #0xffff
	csel	w9, w8, wzr, eq
	ldr	w8, [sp, #256]                  ; 4-byte Reload
	str	w9, [sp, #288]                  ; 4-byte Spill
	sub	w8, w8, w9
	mov	w9, #8                          ; =0x8
	sxth	w8, w8
	cmp	w8, #8
	csel	w23, w8, w9, gt
	tst	w21, #0xffff
	b.eq	LBB31_548
; %bb.502:                              ;   in Loop: Header=BB31_499 Depth=2
	ldr	x10, [sp, #240]                 ; 8-byte Reload
	add	w9, w26, #44
	mov	w8, #43                         ; =0x2b
	mov	w11, w27
LBB31_503:                              ;   Parent Loop BB31_329 Depth=1
                                        ;     Parent Loop BB31_499 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	sub	w12, w9, #42
	sub	w13, w10, #42
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_549
; %bb.504:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #40
	sub	w13, w10, #40
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_550
; %bb.505:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #38
	sub	w13, w10, #38
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_551
; %bb.506:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #36
	sub	w13, w10, #36
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_552
; %bb.507:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #34
	sub	w13, w10, #34
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_553
; %bb.508:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #32
	sub	w13, w10, #32
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_554
; %bb.509:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #30
	sub	w13, w10, #30
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_555
; %bb.510:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #28
	sub	w13, w10, #28
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_556
; %bb.511:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #26
	sub	w13, w10, #26
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_557
; %bb.512:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #24
	sub	w13, w10, #24
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_558
; %bb.513:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #22
	sub	w13, w10, #22
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_559
; %bb.514:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #20
	sub	w13, w10, #20
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_560
; %bb.515:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #18
	sub	w13, w10, #18
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_561
; %bb.516:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #16
	sub	w13, w10, #16
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_562
; %bb.517:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #14
	sub	w13, w10, #14
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_563
; %bb.518:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #12
	sub	w13, w10, #12
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_564
; %bb.519:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #10
	sub	w13, w10, #10
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_565
; %bb.520:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #8
	sub	w13, w10, #8
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_566
; %bb.521:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #6
	sub	w13, w10, #6
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_567
; %bb.522:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w11, w9, #4
	sub	w13, w10, #4
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_568
; %bb.523:                              ;   in Loop: Header=BB31_503 Depth=3
	sub	w12, w9, #2
	ldrh	w13, [x12]
	sub	w12, w10, #2
	strh	w11, [x12]
	cbz	w13, LBB31_569
; %bb.524:                              ;   in Loop: Header=BB31_503 Depth=3
	ldrh	w12, [x9]
	strh	w13, [x10]
	cbz	w12, LBB31_570
; %bb.525:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #2
	add	w13, w10, #2
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_571
; %bb.526:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #4
	add	w13, w10, #4
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_572
; %bb.527:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #6
	add	w13, w10, #6
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_573
; %bb.528:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #8
	add	w13, w10, #8
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_574
; %bb.529:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #10
	add	w13, w10, #10
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_575
; %bb.530:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #12
	add	w13, w10, #12
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_576
; %bb.531:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #14
	add	w13, w10, #14
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_577
; %bb.532:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #16
	add	w13, w10, #16
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_578
; %bb.533:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #18
	add	w13, w10, #18
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_579
; %bb.534:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #20
	add	w13, w10, #20
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_580
; %bb.535:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #22
	add	w13, w10, #22
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_581
; %bb.536:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #24
	add	w13, w10, #24
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_582
; %bb.537:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #26
	add	w13, w10, #26
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_583
; %bb.538:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #28
	add	w13, w10, #28
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_584
; %bb.539:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #30
	add	w13, w10, #30
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_585
; %bb.540:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #32
	add	w13, w10, #32
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_586
; %bb.541:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #34
	add	w13, w10, #34
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_587
; %bb.542:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #36
	add	w13, w10, #36
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_588
; %bb.543:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #38
	add	w13, w10, #38
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_589
; %bb.544:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w12, w9, #40
	add	w13, w10, #40
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_590
; %bb.545:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w11, w9, #42
	add	w13, w10, #42
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_591
; %bb.546:                              ;   in Loop: Header=BB31_503 Depth=3
	add	w9, w9, #86
	add	w8, w8, #43
	add	w10, w10, #86
	cmp	w8, #344
	b.ne	LBB31_503
; %bb.547:                              ;   in Loop: Header=BB31_499 Depth=2
	mov	w8, #301                        ; =0x12d
	b	LBB31_591
	.p2align	4, , 8
LBB31_548:                              ;   in Loop: Header=BB31_499 Depth=2
	mov	w23, wzr
	mov	w21, wzr
	b	LBB31_617
LBB31_549:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #42
	b	LBB31_591
LBB31_550:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #41
	b	LBB31_591
LBB31_551:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #40
	b	LBB31_591
LBB31_552:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #39
	b	LBB31_591
LBB31_553:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #38
	b	LBB31_591
LBB31_554:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #37
	b	LBB31_591
LBB31_555:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #36
	b	LBB31_591
LBB31_556:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #35
	b	LBB31_591
LBB31_557:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #34
	b	LBB31_591
LBB31_558:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #33
	b	LBB31_591
LBB31_559:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #32
	b	LBB31_591
LBB31_560:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #31
	b	LBB31_591
LBB31_561:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #30
	b	LBB31_591
LBB31_562:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #29
	b	LBB31_591
LBB31_563:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #28
	b	LBB31_591
LBB31_564:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #27
	b	LBB31_591
LBB31_565:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #26
	b	LBB31_591
LBB31_566:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #25
	b	LBB31_591
LBB31_567:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #24
	b	LBB31_591
LBB31_568:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #23
	b	LBB31_591
LBB31_569:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #22
	b	LBB31_591
LBB31_570:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #21
	b	LBB31_591
LBB31_571:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #20
	b	LBB31_591
LBB31_572:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #19
	b	LBB31_591
LBB31_573:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #18
	b	LBB31_591
LBB31_574:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #17
	b	LBB31_591
LBB31_575:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #16
	b	LBB31_591
LBB31_576:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #15
	b	LBB31_591
LBB31_577:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #14
	b	LBB31_591
LBB31_578:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #13
	b	LBB31_591
LBB31_579:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #12
	b	LBB31_591
LBB31_580:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #11
	b	LBB31_591
LBB31_581:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #10
	b	LBB31_591
LBB31_582:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #9
	b	LBB31_591
LBB31_583:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #8
	b	LBB31_591
LBB31_584:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #7
	b	LBB31_591
LBB31_585:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #6
	b	LBB31_591
LBB31_586:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #5
	b	LBB31_591
LBB31_587:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #4
	b	LBB31_591
LBB31_588:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #3
	b	LBB31_591
LBB31_589:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #2
	b	LBB31_591
LBB31_590:                              ;   in Loop: Header=BB31_499 Depth=2
	sub	w8, w8, #1
	.p2align	4, , 8
LBB31_591:                              ;   in Loop: Header=BB31_499 Depth=2
	strh	wzr, [x28, w8, sxtw #1]
	mov	x8, #140733193388032            ; =0x7fff00000000
	ldr	x1, [sp, #248]                  ; 8-byte Reload
	movk	x8, #32767, lsl #48
	add	x0, sp, #2152
	add	x2, sp, #2144
	add	x3, sp, #2136
	str	x8, [sp, #2152]
	bl	_draw_unicode_string_compute_bounds
	ldrsh	w8, [sp, #2138]
	cmp	w8, w23, sxth
	b.le	LBB31_604
; %bb.592:                              ;   in Loop: Header=BB31_499 Depth=2
	sxth	w8, w21
	cmp	w8, #2
	b.lt	LBB31_605
; %bb.593:                              ;   in Loop: Header=BB31_499 Depth=2
	add	w22, w26, #2
	mov	w25, #1                         ; =0x1
	b	LBB31_597
	.p2align	4, , 8
LBB31_594:                              ;   in Loop: Header=BB31_597 Depth=3
	strh	wzr, [x28, w8, sxtw #1]
LBB31_595:                              ;   in Loop: Header=BB31_597 Depth=3
	mov	x8, #140733193388032            ; =0x7fff00000000
	add	x0, sp, #2152
	movk	x8, #32767, lsl #48
	add	x1, sp, #2160
	add	x2, sp, #2144
	add	x3, sp, #2136
	str	x8, [sp, #2152]
	bl	_draw_unicode_string_compute_bounds
	ldrsh	w8, [sp, #2138]
	sub	w9, w24, #1
	cmp	w8, w23, sxth
	csel	w25, w25, w24, gt
	csel	w21, w9, w21, gt
LBB31_596:                              ;   in Loop: Header=BB31_597 Depth=3
	sxth	w8, w25
	cmp	w8, w21, sxth
	b.ge	LBB31_606
LBB31_597:                              ;   Parent Loop BB31_329 Depth=1
                                        ;     Parent Loop BB31_499 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB31_600 Depth 4
	sxth	w9, w21
	add	w10, w9, w25, sxth
	add	w9, w10, #1
	mov	w11, #301                       ; =0x12d
	mov	w8, wzr
	add	w10, w10, #4
	add	w12, w9, w9, lsr #31
	sbfx	w9, w12, #1, #16
	cmp	w9, #301
	csel	w9, w9, w11, lt
	mov	w11, w27
	asr	w24, w12, #1
	b	LBB31_600
	.p2align	4, , 8
LBB31_598:                              ;   in Loop: Header=BB31_600 Depth=4
	cmp	w8, #300
	b.hi	LBB31_594
LBB31_599:                              ;   in Loop: Header=BB31_600 Depth=4
	lsl	w12, w8, #1
	add	w13, w28, w12
	add	w12, w22, w12
	add	w8, w8, #1
	strh	w11, [x13]
	ldrh	w11, [x12]
	cbz	w11, LBB31_594
LBB31_600:                              ;   Parent Loop BB31_329 Depth=1
                                        ;     Parent Loop BB31_499 Depth=2
                                        ;       Parent Loop BB31_597 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	cmp	w10, #2
	b.lo	LBB31_598
; %bb.601:                              ;   in Loop: Header=BB31_600 Depth=4
	cmp	w8, w9
	b.lt	LBB31_599
; %bb.602:                              ;   in Loop: Header=BB31_597 Depth=3
	add	w9, w28, w8, lsl #1
	strh	wzr, [x9]
	cbnz	w8, LBB31_595
; %bb.603:                              ;   in Loop: Header=BB31_597 Depth=3
	mov	w25, w24
	b	LBB31_596
	.p2align	4, , 8
LBB31_604:                              ;   in Loop: Header=BB31_499 Depth=2
	mov	w23, wzr
	b	LBB31_617
LBB31_605:                              ;   in Loop: Header=BB31_499 Depth=2
	mov	w25, #1                         ; =0x1
	b	LBB31_607
LBB31_606:                              ;   in Loop: Header=BB31_499 Depth=2
	ldr	w24, [sp, #204]                 ; 4-byte Reload
	cmp	w8, #1
	b.lt	LBB31_611
LBB31_607:                              ;   in Loop: Header=BB31_499 Depth=2
	mov	w8, w25
	.p2align	4, , 8
LBB31_608:                              ;   Parent Loop BB31_329 Depth=1
                                        ;     Parent Loop BB31_499 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	and	x9, x8, #0xffff
	ldrh	w9, [x26, x9, lsl #1]
	cmp	w9, #32
	b.eq	LBB31_610
; %bb.609:                              ;   in Loop: Header=BB31_608 Depth=3
	sub	w9, w8, #1
	sxth	w10, w8
	mov	w8, w9
	cmp	w10, #1
	b.gt	LBB31_608
	b	LBB31_611
LBB31_610:                              ;   in Loop: Header=BB31_499 Depth=2
	mov	w25, w8
LBB31_611:                              ;   in Loop: Header=BB31_499 Depth=2
	add	w8, w26, w25, sxth #1
	ldrh	w9, [x8]
	cmp	w9, #32
	b.ne	LBB31_615
; %bb.612:                              ;   in Loop: Header=BB31_499 Depth=2
	mov	w9, wzr
	.p2align	4, , 8
LBB31_613:                              ;   Parent Loop BB31_329 Depth=1
                                        ;     Parent Loop BB31_499 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	w9, w9, #1
	add	w10, w8, w9, sxth #1
	ldrh	w10, [x10]
	cmp	w10, #32
	b.eq	LBB31_613
; %bb.614:                              ;   in Loop: Header=BB31_499 Depth=2
	and	w23, w9, #0xffff
	b	LBB31_616
LBB31_615:                              ;   in Loop: Header=BB31_499 Depth=2
	mov	w23, wzr
LBB31_616:                              ;   in Loop: Header=BB31_499 Depth=2
	mov	w21, w25
	ldr	w25, [sp, #236]                 ; 4-byte Reload
LBB31_617:                              ;   in Loop: Header=BB31_499 Depth=2
	sxth	w8, w21
	cmp	w8, #1
	csinc	w21, w8, wzr, gt
	mov	w8, #203                        ; =0xcb
	cmp	w21, #203
	add	x0, sp, #1136
	csel	w22, w21, w8, lt
	mov	x1, x26
	lsl	w2, w22, #1
	bl	_memcpy
	ldr	w8, [sp, #272]                  ; 4-byte Reload
	add	x0, sp, #2152
	ldr	w9, [sp, #288]                  ; 4-byte Reload
	mov	w1, #1                          ; =0x1
	ldr	s0, [sp, #1104]
	mov	w2, #1                          ; =0x1
	str	xzr, [sp, #2168]
	str	wzr, [sp, #2164]
	add	w8, w9, w8
	ldr	w9, [sp, #284]                  ; 4-byte Reload
	fmul	s0, s0, s11
	strh	w8, [sp, #1098]
	madd	w9, w19, w25, w9
	add	w10, w9, w25
	str	s0, [sp, #2160]
	strh	w9, [sp, #1096]
	add	x9, sp, #1136
	strh	w10, [sp, #1100]
	ldr	x8, [sp, #1096]
	strh	wzr, [x9, w22, uxtw #1]
	str	x8, [sp, #2152]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	add	x4, sp, #2160
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #2152
	add	x4, sp, #1136
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	add	x4, sp, #1104
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1096
	add	x4, sp, #1136
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
	add	w8, w20, w23
	add	x9, sp, #1728
	add	w8, w8, w21
	add	x26, x9, w8, sxth #1
	ldrh	w27, [x26]
	cbz	w27, LBB31_619
; %bb.618:                              ;   in Loop: Header=BB31_499 Depth=2
	add	w9, w19, #1
	and	w10, w19, #0xffff
	mov	w19, w9
	sxth	w20, w8
	cmp	w10, #3
	b.lo	LBB31_499
LBB31_619:                              ;   in Loop: Header=BB31_329 Depth=1
	adrp	x8, _social_chat@PAGE+36868
	ldr	w26, [sp, #156]                 ; 4-byte Reload
	ldr	w22, [sp, #128]                 ; 4-byte Reload
	ldr	w23, [sp, #112]                 ; 4-byte Reload
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	ldr	w20, [sp, #184]                 ; 4-byte Reload
	cbz	w8, LBB31_328
; %bb.620:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	x8, [sp, #168]                  ; 8-byte Reload
	ldrb	w8, [x8, #373]
	cbnz	w8, LBB31_328
; %bb.621:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	x8, [sp, #168]                  ; 8-byte Reload
	ldrb	w8, [x8, #374]
	cbnz	w8, LBB31_328
; %bb.622:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	x8, [sp, #144]                  ; 8-byte Reload
	ldrh	w8, [x8]
	cbz	w8, LBB31_328
; %bb.623:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	x9, [sp, #168]                  ; 8-byte Reload
	ldrb	w8, [x9, #270]
	cbz	w8, LBB31_625
; %bb.624:                              ;   in Loop: Header=BB31_329 Depth=1
	adrp	x8, _social_chat_player@PAGE+176
	ldrsh	w8, [x8, _social_chat_player@PAGEOFF+176]
	cmp	w8, #15
	b.le	LBB31_327
	b	LBB31_328
LBB31_625:                              ;   in Loop: Header=BB31_329 Depth=1
	ldrb	w8, [x9, #372]
	tbz	w8, #0, LBB31_328
; %bb.626:                              ;   in Loop: Header=BB31_329 Depth=1
	ldr	x0, [sp, #168]                  ; 8-byte Reload
	bl	_social_chat_name_is_local
	adrp	x8, _social_chat_player@PAGE+176
	ldrsh	w8, [x8, _social_chat_player@PAGEOFF+176]
	cmp	w8, #16
	ccmp	w0, #0, #0, lt
	b.eq	LBB31_327
	b	LBB31_328
LBB31_627:
	add	w8, w8, #1
	b	LBB31_647
LBB31_628:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #2
	b	LBB31_647
LBB31_629:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #3
	b	LBB31_647
LBB31_630:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #4
	b	LBB31_647
LBB31_631:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #5
	b	LBB31_647
LBB31_632:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #6
	b	LBB31_647
LBB31_633:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #7
	b	LBB31_647
LBB31_634:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #8
	b	LBB31_647
LBB31_635:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #9
	b	LBB31_647
LBB31_636:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #10
	b	LBB31_647
LBB31_637:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #11
	b	LBB31_647
LBB31_638:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #12
	b	LBB31_647
LBB31_639:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #13
	b	LBB31_647
LBB31_640:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #14
	b	LBB31_647
LBB31_641:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #15
	b	LBB31_647
LBB31_642:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #16
	b	LBB31_647
LBB31_643:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #17
	b	LBB31_647
LBB31_644:
	ldr	x28, [sp, #184]                 ; 8-byte Reload
	add	w8, w8, #18
	b	LBB31_647
LBB31_645:
	add	w8, w8, #19
	b	LBB31_647
LBB31_646:
	add	w8, w8, #20
LBB31_647:
	add	x9, sp, #1136
	add	x0, sp, #1136
	strh	wzr, [x9, w8, sxtw #1]
	bl	_ustrlen
	adrp	x8, _social_chat@PAGE+36868
	ldr	w23, [sp, #236]                 ; 4-byte Reload
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB31_650
; %bb.648:
	mov	w24, w0
	bl	_system_milliseconds
	mov	w8, #19923                      ; =0x4dd3
	movk	w8, #4194, lsl #16
	umull	x8, w0, w8
	tbnz	x8, #37, LBB31_651
; %bb.649:
	sbfiz	w8, w24, #1, #16
	add	x9, sp, #1136
	add	x8, x9, w8, sxtw
	mov	w9, #95                         ; =0x5f
	add	w10, w8, #2
	strh	w9, [x8]
	strh	wzr, [x10]
	b	LBB31_651
LBB31_650:
Lloh488:
	adrp	x8, lCPI31_3@PAGE
Lloh489:
	adrp	x9, lCPI31_4@PAGE
	mov	w24, wzr
Lloh490:
	ldr	q0, [x8, lCPI31_3@PAGEOFF]
	mov	w8, #101                        ; =0x65
Lloh491:
	ldr	q1, [x9, lCPI31_4@PAGEOFF]
	ldr	x9, [sp, #112]                  ; 8-byte Reload
	str	w8, [sp, #1168]
	str	q0, [x9]
	add	x9, sp, #1104
	str	q1, [x9, #48]
LBB31_651:
Lloh492:
	adrp	x1, l_.str.77@PAGE
Lloh493:
	add	x1, x1, l_.str.77@PAGEOFF
	add	x0, sp, #1728
	mov	w2, #127                        ; =0x7f
	mov	w19, #127                       ; =0x7f
	bl	_ustrncpy
	mov	w21, wzr
	sxth	w20, w24
	cmp	w20, #1
	strh	wzr, [sp, #1982]
	b.lt	LBB31_746
; %bb.652:
	ldr	w8, [sp, #44]                   ; 4-byte Reload
	add	x25, sp, #1136
	mov	x27, #140733193388032           ; =0x7fff00000000
	mov	w22, wzr
	ubfiz	w9, w23, #1, #15
	add	x24, sp, #2160
	add	w26, w25, #44
	movk	x27, #32767, lsl #48
	sxth	w8, w8
	sub	w23, w8, w9
LBB31_653:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB31_655 Depth 2
	ldrh	w11, [x25, w21, sxtw #1]
	cbz	w11, LBB31_700
; %bb.654:                              ;   in Loop: Header=BB31_653 Depth=1
	add	w9, w26, w22, sxth #1
	mov	w8, #43                         ; =0x2b
	add	w10, w24, #42
LBB31_655:                              ;   Parent Loop BB31_653 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	w12, w9, #42
	sub	w13, w10, #42
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_701
; %bb.656:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #40
	sub	w13, w10, #40
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_702
; %bb.657:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #38
	sub	w13, w10, #38
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_703
; %bb.658:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #36
	sub	w13, w10, #36
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_704
; %bb.659:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #34
	sub	w13, w10, #34
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_705
; %bb.660:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #32
	sub	w13, w10, #32
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_706
; %bb.661:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #30
	sub	w13, w10, #30
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_707
; %bb.662:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #28
	sub	w13, w10, #28
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_708
; %bb.663:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #26
	sub	w13, w10, #26
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_709
; %bb.664:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #24
	sub	w13, w10, #24
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_710
; %bb.665:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #22
	sub	w13, w10, #22
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_711
; %bb.666:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #20
	sub	w13, w10, #20
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_712
; %bb.667:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #18
	sub	w13, w10, #18
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_713
; %bb.668:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #16
	sub	w13, w10, #16
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_714
; %bb.669:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #14
	sub	w13, w10, #14
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_715
; %bb.670:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #12
	sub	w13, w10, #12
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_716
; %bb.671:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #10
	sub	w13, w10, #10
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_717
; %bb.672:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #8
	sub	w13, w10, #8
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_718
; %bb.673:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #6
	sub	w13, w10, #6
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_719
; %bb.674:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w11, w9, #4
	sub	w13, w10, #4
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_720
; %bb.675:                              ;   in Loop: Header=BB31_655 Depth=2
	sub	w12, w9, #2
	ldrh	w13, [x12]
	sub	w12, w10, #2
	strh	w11, [x12]
	cbz	w13, LBB31_721
; %bb.676:                              ;   in Loop: Header=BB31_655 Depth=2
	ldrh	w12, [x9]
	strh	w13, [x10]
	cbz	w12, LBB31_722
; %bb.677:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #2
	add	w13, w10, #2
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_723
; %bb.678:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #4
	add	w13, w10, #4
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_724
; %bb.679:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #6
	add	w13, w10, #6
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_725
; %bb.680:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #8
	add	w13, w10, #8
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_726
; %bb.681:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #10
	add	w13, w10, #10
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_727
; %bb.682:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #12
	add	w13, w10, #12
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_728
; %bb.683:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #14
	add	w13, w10, #14
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_729
; %bb.684:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #16
	add	w13, w10, #16
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_730
; %bb.685:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #18
	add	w13, w10, #18
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_731
; %bb.686:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #20
	add	w13, w10, #20
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_732
; %bb.687:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #22
	add	w13, w10, #22
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_733
; %bb.688:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #24
	add	w13, w10, #24
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_734
; %bb.689:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #26
	add	w13, w10, #26
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_735
; %bb.690:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #28
	add	w13, w10, #28
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_736
; %bb.691:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #30
	add	w13, w10, #30
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_737
; %bb.692:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #32
	add	w13, w10, #32
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_738
; %bb.693:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #34
	add	w13, w10, #34
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_739
; %bb.694:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #36
	add	w13, w10, #36
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_740
; %bb.695:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #38
	add	w13, w10, #38
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_741
; %bb.696:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w12, w9, #40
	add	w13, w10, #40
	ldrh	w12, [x12]
	strh	w11, [x13]
	cbz	w12, LBB31_742
; %bb.697:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w11, w9, #42
	add	w13, w10, #42
	ldrh	w11, [x11]
	strh	w12, [x13]
	cbz	w11, LBB31_743
; %bb.698:                              ;   in Loop: Header=BB31_655 Depth=2
	add	w9, w9, #86
	add	w8, w8, #43
	add	w10, w10, #86
	cmp	w8, #344
	b.ne	LBB31_655
; %bb.699:                              ;   in Loop: Header=BB31_653 Depth=1
	mov	w8, #301                        ; =0x12d
	b	LBB31_743
LBB31_700:                              ;   in Loop: Header=BB31_653 Depth=1
	mov	w8, wzr
	b	LBB31_744
LBB31_701:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #42
	b	LBB31_743
LBB31_702:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #41
	b	LBB31_743
LBB31_703:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #40
	b	LBB31_743
LBB31_704:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #39
	b	LBB31_743
LBB31_705:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #38
	b	LBB31_743
LBB31_706:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #37
	b	LBB31_743
LBB31_707:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #36
	b	LBB31_743
LBB31_708:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #35
	b	LBB31_743
LBB31_709:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #34
	b	LBB31_743
LBB31_710:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #33
	b	LBB31_743
LBB31_711:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #32
	b	LBB31_743
LBB31_712:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #31
	b	LBB31_743
LBB31_713:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #30
	b	LBB31_743
LBB31_714:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #29
	b	LBB31_743
LBB31_715:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #28
	b	LBB31_743
LBB31_716:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #27
	b	LBB31_743
LBB31_717:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #26
	b	LBB31_743
LBB31_718:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #25
	b	LBB31_743
LBB31_719:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #24
	b	LBB31_743
LBB31_720:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #23
	b	LBB31_743
LBB31_721:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #22
	b	LBB31_743
LBB31_722:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #21
	b	LBB31_743
LBB31_723:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #20
	b	LBB31_743
LBB31_724:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #19
	b	LBB31_743
LBB31_725:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #18
	b	LBB31_743
LBB31_726:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #17
	b	LBB31_743
LBB31_727:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #16
	b	LBB31_743
LBB31_728:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #15
	b	LBB31_743
LBB31_729:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #14
	b	LBB31_743
LBB31_730:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #13
	b	LBB31_743
LBB31_731:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #12
	b	LBB31_743
LBB31_732:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #11
	b	LBB31_743
LBB31_733:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #10
	b	LBB31_743
LBB31_734:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #9
	b	LBB31_743
LBB31_735:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #8
	b	LBB31_743
LBB31_736:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #7
	b	LBB31_743
LBB31_737:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #6
	b	LBB31_743
LBB31_738:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #5
	b	LBB31_743
LBB31_739:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #4
	b	LBB31_743
LBB31_740:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #3
	b	LBB31_743
LBB31_741:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #2
	b	LBB31_743
LBB31_742:                              ;   in Loop: Header=BB31_653 Depth=1
	sub	w8, w8, #1
LBB31_743:                              ;   in Loop: Header=BB31_653 Depth=1
	add	x0, sp, #1544
	add	x2, sp, #720
	add	x3, sp, #1120
	mov	x1, x28
	strh	wzr, [x24, w8, sxtw #1]
	str	x27, [sp, #1544]
	bl	_draw_unicode_string_compute_bounds
	ldrsh	w8, [sp, #1122]
LBB31_744:                              ;   in Loop: Header=BB31_653 Depth=1
	cmp	w23, w8
	b.ge	LBB31_746
; %bb.745:                              ;   in Loop: Header=BB31_653 Depth=1
	add	w22, w22, #1
	sxth	w21, w22
	cmp	w20, w21
	b.gt	LBB31_653
LBB31_746:
	add	x0, sp, #1728
	add	x8, sp, #1136
	add	x23, x8, w21, sxtw #1
	bl	_ustrlen
	sub	w2, w19, w0
	add	x0, sp, #1728
	mov	x1, x23
	bl	_ustrncat
	adrp	x8, _social_chat@PAGE+36868
Lloh494:
	adrp	x9, _social_chat_open_draw.grey@PAGE
Lloh495:
	add	x9, x9, _social_chat_open_draw.grey@PAGEOFF
	ldr	w25, [sp, #236]                 ; 4-byte Reload
	ldr	w24, [sp, #164]                 ; 4-byte Reload
	add	x0, sp, #1544
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	mov	w1, #1                          ; =0x1
	mov	w2, #1                          ; =0x1
	str	xzr, [sp, #2168]
	str	wzr, [sp, #2164]
	strh	w24, [sp, #1106]
	cmp	w8, #0
	add	x8, sp, #312
	csel	x23, x9, x8, eq
	mov	w8, #39322                      ; =0x999a
	movk	w8, #16153, lsl #16
	ldr	w9, [sp, #180]                  ; 4-byte Reload
	ldr	s0, [x23]
	fmov	s1, w8
	ldr	w8, [sp, #288]                  ; 4-byte Reload
	add	w19, w9, w25
	strh	w9, [sp, #1104]
	strh	w8, [sp, #1110]
	strh	w19, [sp, #1108]
	fmul	s0, s0, s1
	ldr	x8, [sp, #1104]
	str	x8, [sp, #1544]
	str	s0, [sp, #2160]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	ldr	w21, [sp, #204]                 ; 4-byte Reload
	add	x4, sp, #2160
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	mov	w0, w21
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1544
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, w21
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	mov	x4, x23
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1104
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
	adrp	x22, _social_chat_replaces_upstream.read_at@PAGE
	ldr	w20, [x22, _social_chat_replaces_upstream.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w20, w0
	b.ne	LBB31_748
; %bb.747:
	adrp	x8, _social_chat_replaces_upstream.on@PAGE
	ldrb	w8, [x8, _social_chat_replaces_upstream.on@PAGEOFF]
	b	LBB31_749
LBB31_748:
	bl	_config_changes
	str	w0, [x22, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh496:
	adrp	x0, l_.str@PAGE
Lloh497:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_replaces_upstream.on@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_replaces_upstream.on@PAGEOFF]
LBB31_749:
	ldr	w26, [sp, #156]                 ; 4-byte Reload
	cbz	w8, LBB31_751
; %bb.750:
	bl	_social_enabled
	cbnz	w0, LBB31_752
LBB31_751:
	ldr	w10, [sp, #288]                 ; 4-byte Reload
Lloh498:
	adrp	x8, lCPI31_5@PAGE
	add	w11, w19, w25
Lloh499:
	adrp	x9, lCPI31_6@PAGE
	strh	w24, [sp, #1106]
	add	x0, sp, #1544
Lloh500:
	ldr	q0, [x8, lCPI31_5@PAGEOFF]
Lloh501:
	adrp	x8, lCPI31_8@PAGE
	strh	w10, [sp, #1110]
Lloh502:
	adrp	x10, lCPI31_7@PAGE
	strh	w19, [sp, #1104]
	mov	w1, #1                          ; =0x1
	strh	w11, [sp, #1108]
	mov	w2, #1                          ; =0x1
Lloh503:
	ldr	d2, [x10, lCPI31_7@PAGEOFF]
	add	x10, sp, #1104
Lloh504:
	ldr	q1, [x9, lCPI31_6@PAGEOFF]
	ldr	x9, [sp, #1104]
	str	q0, [x10, #1056]
Lloh505:
	ldr	q0, [x8, lCPI31_8@PAGEOFF]
	str	q1, [x10, #1072]
	str	d2, [sp, #2192]
	str	x9, [sp, #1544]
	str	q0, [x10, #32]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	add	x4, sp, #1136
	mov	w0, w21
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1544
	add	x4, sp, #2160
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
Lloh506:
	adrp	x4, _social_chat_open_draw.grey@PAGE
Lloh507:
	add	x4, x4, _social_chat_open_draw.grey@PAGEOFF
	mov	w0, w21
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1104
	add	x4, sp, #2160
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
LBB31_752:
	ldr	w28, [sp, #140]                 ; 4-byte Reload
	ldr	w8, [sp, #48]                   ; 4-byte Reload
	cbnz	w8, LBB31_19
; %bb.753:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB31_19
; %bb.754:
	adrp	x8, _social_chat_player@PAGE
	ldrb	w8, [x8, _social_chat_player@PAGEOFF]
	cbz	w8, LBB31_796
; %bb.755:
	cbz	w28, LBB31_757
; %bb.756:
	ldr	w23, [sp, #68]                  ; 4-byte Reload
	mov	w9, #34079                      ; =0x851f
	movk	w9, #20971, lsl #16
	lsl	w8, w23, #5
	sub	w8, w8, w23, lsl #1
	umull	x8, w8, w9
	ldr	w9, [sp, #52]                   ; 4-byte Reload
	lsr	x20, x8, #37
	sxth	w9, w9
	sub	w8, w9, w20
	subs	w8, w8, #6
	csel	w19, w8, wzr, gt
	b	LBB31_758
LBB31_757:
	ldr	w23, [sp, #68]                  ; 4-byte Reload
	mov	w9, #34079                      ; =0x851f
	movk	w9, #20971, lsl #16
	lsl	w8, w23, #5
	sub	w8, w8, w23, lsl #1
	umull	x8, w8, w9
	ldr	x9, [sp, #32]                   ; 8-byte Reload
	lsr	x20, x8, #37
	ldr	w8, [sp, #52]                   ; 4-byte Reload
                                        ; kill: def $w20 killed $w20 killed $x20 def $x20
	add	w8, w8, w9
	add	w19, w8, #6
LBB31_758:
Lloh508:
	adrp	x22, _social_chat_player@PAGE+102
Lloh509:
	add	x22, x22, _social_chat_player@PAGEOFF+102
	ldrh	w21, [x22, #6]
	bl	_get_ui_argb_white
	ldrb	w8, [x22]
	str	s0, [sp, #1544]
	str	s1, [sp, #1548]
	str	s2, [sp, #1552]
	str	s3, [sp, #1556]
	strb	wzr, [sp, #2160]
	cbz	w8, LBB31_768
; %bb.759:
	ldr	x8, [sp, #56]                   ; 8-byte Reload
	mov	w9, #1139802112                 ; =0x43f00000
	fmov	s4, #0.50000000
Lloh510:
	adrp	x0, _social_chat_player@PAGE+1
Lloh511:
	add	x0, x0, _social_chat_player@PAGEOFF+1
	fmov	s1, w9
	and	w9, w23, #0xffff
	and	w8, w8, #0xffff
	ucvtf	s3, w9
	ucvtf	s0, w8
	mov	w8, #1142292480                 ; =0x44160000
	fmov	s2, w8
	mov	w8, #32768                      ; =0x8000
	movk	w8, #50087, lsl #16
	fdiv	s1, s0, s1
	fmov	s5, w8
	fmul	s2, s1, s2
	fmul	s1, s1, s5
	fsub	s3, s3, s2
	fadd	s0, s0, s1
	fmul	s3, s3, s4
	fmul	s0, s0, s4
	fcvtzs	w22, s3
	fcvtzs	w24, s0
	scvtf	s1, w22
	mov	w1, w22
	mov	w2, w24
	fadd	s1, s2, s1
	fcvtzs	w23, s1
	mov	w3, w23
	bl	_social_menu_profile_card_draw
	cmp	w0, w24
	b.le	LBB31_761
; %bb.760:
Lloh512:
	adrp	x8, _social_chat_player@PAGE+168
Lloh513:
	add	x8, x8, _social_chat_player@PAGEOFF+168
	ldr	w19, [sp, #204]                 ; 4-byte Reload
Lloh514:
	adrp	x4, _social_chat_player_draw.grey@PAGE
Lloh515:
	add	x4, x4, _social_chat_player_draw.grey@PAGEOFF
	mov	w1, #-1                         ; =0xffffffff
	strh	w22, [x8, #2]
	mov	w2, #2                          ; =0x2
	strh	w24, [x8]
	mov	w3, wzr
	strh	w23, [x8, #6]
	strh	w0, [x8, #4]
	add	w8, w0, #4
	add	w9, w8, w25
	mov	w0, w19
	strh	w22, [sp, #1122]
	strh	w23, [sp, #1126]
	strh	w8, [sp, #1120]
	strh	w9, [sp, #1124]
	bl	_draw_string_set_draw_mode
Lloh516:
	adrp	x8, lCPI31_9@PAGE
Lloh517:
	adrp	x9, lCPI31_10@PAGE
Lloh518:
	adrp	x10, lCPI31_11@PAGE
	add	x0, sp, #1120
	add	x4, sp, #1728
	mov	x1, xzr
Lloh519:
	ldr	q0, [x8, lCPI31_9@PAGEOFF]
	add	x8, sp, #1104
Lloh520:
	ldr	q1, [x9, lCPI31_10@PAGEOFF]
	mov	x2, xzr
Lloh521:
	ldr	q2, [x10, lCPI31_11@PAGEOFF]
	mov	w3, wzr
	strh	wzr, [sp, #1776]
	stp	q0, q1, [x8, #624]
	str	q2, [x8, #656]
	bl	_rasterizer_draw_unicode_string
	add	x4, sp, #1544
	mov	w0, w19
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	b	LBB31_795
LBB31_761:
	adrp	x8, _social_chat_player@PAGE+102
	ldr	w23, [sp, #68]                  ; 4-byte Reload
	ldrb	w8, [x8, _social_chat_player@PAGEOFF+102]
	cbz	w8, LBB31_768
; %bb.762:
Lloh522:
	adrp	x0, _social_chat_player@PAGE+1
Lloh523:
	add	x0, x0, _social_chat_player@PAGEOFF+1
	add	x1, sp, #2160
	mov	w2, #512                        ; =0x200
	bl	_social_menu_profile_text
	cbnz	w0, LBB31_764
; %bb.763:
Lloh524:
	adrp	x2, l_.str.91@PAGE
Lloh525:
	add	x2, x2, l_.str.91@PAGEOFF
	add	x0, sp, #2160
	mov	w1, #512                        ; =0x200
	bl	_halo_linux_snprintf
LBB31_764:
	ldrb	w8, [sp, #2160]
	ldr	w24, [sp, #204]                 ; 4-byte Reload
	cbz	w8, LBB31_832
; %bb.765:
	mov	w9, wzr
	mov	w10, #1                         ; =0x1
	add	x11, sp, #2160
LBB31_766:                              ; =>This Inner Loop Header: Depth=1
	add	w9, w9, #1
	cmp	w8, #10
	sxth	x12, w9
	cinc	w10, w10, eq
	ldrb	w8, [x11, x12]
	cbnz	w8, LBB31_766
; %bb.767:
	add	w8, w10, #1
	b	LBB31_769
LBB31_768:
	bl	_social_chat_player_options
	adrp	x8, _social_chat_player@PAGE+98
	ldr	w24, [sp, #204]                 ; 4-byte Reload
	ldrh	w8, [x8, _social_chat_player@PAGEOFF+98]
LBB31_769:
	sub	w9, w23, w20
	mov	w11, w23
	add	w10, w20, w19, sxth
	add	w8, w8, #1
	bic	w9, w9, w9, asr #31
	cmp	w10, w11
	csel	w19, w9, w19, gt
	sxth	w23, w21
	tbnz	w23, #31, LBB31_772
; %bb.770:
	ldr	x10, [sp, #56]                  ; 8-byte Reload
	sxth	w9, w8
	msub	w10, w9, w25, w10
	subs	w9, w10, #12
	csel	w11, w9, wzr, gt
	cmp	w11, w21
	b.ge	LBB31_773
; %bb.771:
	cmp	w10, #12
	csel	w23, w9, wzr, gt
	b	LBB31_773
LBB31_772:
	mov	w23, wzr
LBB31_773:
	madd	w8, w8, w25, w23
Lloh526:
	adrp	x22, _social_chat_player@PAGE+18
Lloh527:
	add	x22, x22, _social_chat_player@PAGEOFF+18
	add	w20, w19, w20
	mov	x0, x22
	add	w8, w8, #12
	mov	w1, #-805306368                 ; =0xd0000000
	strh	w19, [x22, #152]
	strh	w23, [x0, #150]!
	strh	w20, [x22, #156]
	strh	w8, [x22, #154]
	bl	_draw_quad
	add	w8, w19, #6
	add	w10, w23, #6
	sub	w9, w20, #6
	add	w11, w10, w25
	add	x0, sp, #1136
	mov	w1, #1                          ; =0x1
	strh	w8, [sp, #1122]
Lloh528:
	adrp	x8, lCPI31_8@PAGE
	strh	w9, [sp, #1126]
	mov	w2, #1                          ; =0x1
	strh	w10, [sp, #1120]
	strh	w11, [sp, #1124]
	ldr	x9, [sp, #1120]
Lloh529:
	ldr	q0, [x8, lCPI31_8@PAGEOFF]
	add	x8, sp, #1104
	str	x9, [sp, #1136]
	str	q0, [sp, #288]                  ; 16-byte Spill
	str	q0, [x8, #624]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	add	x4, sp, #1728
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	add	x21, sp, #1728
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1136
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	mov	x4, x22
	bl	_rasterizer_draw_unicode_string
Lloh530:
	adrp	x4, _social_chat_player_draw.blue@PAGE
Lloh531:
	add	x4, x4, _social_chat_player_draw.blue@PAGEOFF
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1120
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	mov	x4, x22
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
	add	x0, sp, #1120
	mov	w1, wzr
	mov	w2, w25
	bl	_offset_rectangle2d
	ldrb	w8, [x22, #84]
	cbz	w8, LBB31_821
; %bb.774:
	mov	w8, #39322                      ; =0x999a
	add	x23, sp, #2160
	movk	w8, #16153, lsl #16
	fmov	s8, w8
	b	LBB31_777
LBB31_775:                              ;   in Loop: Header=BB31_777 Depth=1
	mov	w10, wzr
LBB31_776:                              ;   in Loop: Header=BB31_777 Depth=1
	ldr	s0, [sp, #1544]
	add	x0, sp, #312
	ldr	x8, [sp, #1120]
	mov	w1, #1                          ; =0x1
	mov	w2, #1                          ; =0x1
	strh	wzr, [x21, w10, sxtw #1]
	str	xzr, [sp, #1144]
	fmul	s0, s0, s8
	str	wzr, [sp, #1140]
	str	x8, [sp, #312]
	str	s0, [sp, #1136]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	add	x4, sp, #1136
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #312
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	add	x4, sp, #1544
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1120
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
	add	x0, sp, #1120
	mov	w1, wzr
	mov	w2, w25
	bl	_offset_rectangle2d
	add	x23, x22, #1
	cbz	w22, LBB31_794
LBB31_777:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB31_781 Depth 2
                                        ;       Child Loop BB31_790 Depth 3
	ldrb	w19, [x23]
	cbz	w19, LBB31_794
; %bb.778:                              ;   in Loop: Header=BB31_777 Depth=1
	mov	x0, x23
	mov	w1, #10                         ; =0xa
	bl	_strchr
	mov	x22, x0
	cbz	w22, LBB31_780
; %bb.779:                              ;   in Loop: Header=BB31_777 Depth=1
	strb	wzr, [x22]
	ldrb	w19, [x23]
	cbz	w19, LBB31_775
LBB31_780:                              ;   in Loop: Header=BB31_777 Depth=1
	mov	w8, wzr
	.p2align	4, , 8
LBB31_781:                              ;   Parent Loop BB31_777 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB31_790 Depth 3
	add	x9, x23, #1
	cmp	w19, #224
	b.lo	LBB31_786
; %bb.782:                              ;   in Loop: Header=BB31_781 Depth=2
	ldrb	w10, [x9]
	and	w11, w10, #0xc0
	cmp	w11, #128
	b.ne	LBB31_786
; %bb.783:                              ;   in Loop: Header=BB31_781 Depth=2
	cmp	w19, #239
	b.hi	LBB31_786
; %bb.784:                              ;   in Loop: Header=BB31_781 Depth=2
	ldrb	w11, [x23, #2]
	and	w12, w11, #0xc0
	cmp	w12, #128
	b.ne	LBB31_786
; %bb.785:                              ;   in Loop: Header=BB31_781 Depth=2
	ubfiz	w19, w19, #12, #4
	add	x9, x23, #3
	bfi	w19, w10, #6, #6
	bfxil	w19, w11, #0, #6
	b	LBB31_792
	.p2align	4, , 8
LBB31_786:                              ;   in Loop: Header=BB31_781 Depth=2
	and	w10, w19, #0xe0
	cmp	w10, #192
	b.ne	LBB31_789
; %bb.787:                              ;   in Loop: Header=BB31_781 Depth=2
	ldrb	w9, [x9]
	and	w10, w9, #0xc0
	cmp	w10, #128
	b.ne	LBB31_790
; %bb.788:                              ;   in Loop: Header=BB31_781 Depth=2
	and	w10, w9, #0x3f
	add	x9, x23, #2
	bfi	w10, w19, #6, #5
	mov	w19, w10
	b	LBB31_792
LBB31_789:                              ;   in Loop: Header=BB31_781 Depth=2
	tbz	w19, #7, LBB31_792
	.p2align	4, , 8
LBB31_790:                              ;   Parent Loop BB31_777 Depth=1
                                        ;     Parent Loop BB31_781 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	add	w23, w23, #1
	ldrsb	w9, [x23]
	cmn	w9, #64
	b.lt	LBB31_790
; %bb.791:                              ;   in Loop: Header=BB31_781 Depth=2
	mov	w19, #63                        ; =0x3f
	mov	x9, x23
LBB31_792:                              ;   in Loop: Header=BB31_781 Depth=2
	strh	w19, [x21, w8, sxtw #1]
	add	w10, w8, #1
	ldrb	w19, [x9]
	cbz	w19, LBB31_776
; %bb.793:                              ;   in Loop: Header=BB31_781 Depth=2
	cmp	w8, #202
	mov	x23, x9
	mov	w8, w10
	b.lo	LBB31_781
	b	LBB31_776
LBB31_794:
Lloh532:
	adrp	x8, lCPI31_12@PAGE
	mov	w9, #67                         ; =0x43
	ldr	x10, [sp, #1120]
	movk	w9, #75, lsl #16
	add	x0, sp, #312
	mov	w1, #1                          ; =0x1
Lloh533:
	ldr	d0, [x8, lCPI31_12@PAGEOFF]
	add	x8, sp, #1104
	mov	w2, #1                          ; =0x1
	strh	wzr, [sp, #1740]
	str	w9, [sp, #1736]
	str	x10, [sp, #312]
	str	d0, [sp, #1728]
	ldr	q0, [sp, #288]                  ; 16-byte Reload
	str	q0, [x8, #32]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	add	x4, sp, #1136
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #312
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
Lloh534:
	adrp	x4, _social_chat_player_draw.blue@PAGE
Lloh535:
	add	x4, x4, _social_chat_player_draw.blue@PAGEOFF
	mov	w0, w24
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1120
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
LBB31_795:
	ldr	w26, [sp, #156]                 ; 4-byte Reload
	adrp	x8, _social_chat_player@PAGE+110
	mov	w9, #1                          ; =0x1
	strb	w9, [x8, _social_chat_player@PAGEOFF+110]
LBB31_796:
Lloh536:
	adrp	x8, _social_chat_keyboard@PAGE
Lloh537:
	add	x8, x8, _social_chat_keyboard@PAGEOFF
	ldrb	w9, [x8]
	cbz	w9, LBB31_19
; %bb.797:
	ldrb	w8, [x8, #1]
	cbnz	w8, LBB31_19
; %bb.798:
	adrp	x8, _social_chat@PAGE+36974
	ldrb	w8, [x8, _social_chat@PAGEOFF+36974]
	cbnz	w8, LBB31_19
; %bb.799:
	ldr	w22, [sp, #68]                  ; 4-byte Reload
	mov	w8, #44                         ; =0x2c
	mov	w10, #34079                     ; =0x851f
	movk	w10, #20971, lsl #16
	mul	w9, w22, w8
	umull	x8, w9, w10
	lsr	x8, x8, #37
	cbz	w26, LBB31_801
; %bb.800:
	ldr	x11, [sp, #16]                  ; 8-byte Reload
	sub	w10, w22, w8
	add	w10, w10, w10, lsr #31
	asr	w20, w10, #1
	add	w21, w11, #6
	b	LBB31_802
LBB31_801:
	mov	w11, #19923                     ; =0x4dd3
	ldr	x13, [sp, #56]                  ; 8-byte Reload
	movk	w11, #4194, lsl #16
	mov	w12, #21846                     ; =0x5556
	movk	w12, #21845, lsl #16
	umull	x11, w9, w11
	umull	x10, w13, w10
	lsr	x11, x11, #37
	and	w11, w11, #0xfffffe
	sub	x10, x13, x10, lsr #35
	ldr	w13, [sp, #52]                  ; 4-byte Reload
	umull	x11, w11, w12
	mov	w12, #65531                     ; =0xfffb
	lsr	x11, x11, #32
	sub	w13, w22, w13
	madd	w21, w11, w12, w10
	sub	w20, w13, w8
LBB31_802:
	tbz	w28, #0, LBB31_804
; %bb.803:
	mov	w10, #19923                     ; =0x4dd3
	mov	w11, #21846                     ; =0x5556
	movk	w10, #4194, lsl #16
	movk	w11, #21845, lsl #16
	umull	x9, w9, w10
	ldr	w10, [sp, #52]                  ; 4-byte Reload
	lsr	x19, x9, #38
	lsl	w9, w19, #1
	umull	x9, w9, w11
                                        ; kill: def $w19 killed $w19 killed $x19 def $x19
	sxth	w10, w10
	sub	w8, w10, w8
	cmp	w8, #6
	mov	w10, #6                         ; =0x6
	csel	w8, w8, w10, gt
	lsr	x9, x9, #32
	sub	w20, w8, #6
	add	w8, w9, w9, lsl #2
	ldr	x9, [sp, #16]                   ; 8-byte Reload
	sub	w21, w9, w8
	b	LBB31_805
LBB31_804:
	mov	w8, #19923                      ; =0x4dd3
	movk	w8, #4194, lsl #16
	umull	x8, w9, w8
	lsr	x19, x8, #38
LBB31_805:
	bl	_get_ui_argb_white
	mov	w8, #21846                      ; =0x5556
	ubfiz	w9, w19, #1, #15
	str	s0, [sp, #2160]
	mul	w8, w9, w8
	add	w9, w25, #8
	str	s1, [sp, #2164]
	lsr	w8, w8, #16
	cmp	w8, w9
	csel	w25, w8, w9, hi
	cmp	w22, #205
	str	s2, [sp, #2168]
	str	s3, [sp, #2172]
	b.lt	LBB31_19
; %bb.806:
	sxth	w8, w21
	sxth	w9, w25
	ldr	x10, [sp, #56]                  ; 8-byte Reload
	bic	w8, w8, w8, asr #31
	add	w9, w9, w25, sxth #2
	add	w9, w9, w8
	cmp	w9, w10
	b.gt	LBB31_19
; %bb.807:
	mov	w10, #10                        ; =0xa
	add	x0, sp, #1136
	mov	w1, #-1610612736                ; =0xa0000000
	strh	w20, [sp, #1138]
	madd	w10, w19, w10, w20
	strh	w8, [sp, #1136]
	strh	w9, [sp, #1140]
	strh	w10, [sp, #1142]
	bl	_draw_quad
	mov	w23, wzr
Lloh538:
	adrp	x21, _social_chat_keyboard@PAGE+6
Lloh539:
	add	x21, x21, _social_chat_keyboard@PAGEOFF+6
	str	w25, [sp, #284]                 ; 4-byte Spill
	b	LBB31_809
LBB31_808:                              ;   in Loop: Header=BB31_809 Depth=1
	ldr	w8, [sp, #288]                  ; 4-byte Reload
	ldr	w25, [sp, #284]                 ; 4-byte Reload
	mov	w23, w8
	cmp	w8, #5
	b.eq	LBB31_831
LBB31_809:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB31_812 Depth 2
	cmp	w23, #4
	mov	w8, #1                          ; =0x1
	add	w9, w23, #1
	cinc	w26, w8, eq
	add	w10, w23, #1
	mul	w8, w23, w25
	mul	w24, w19, w26
	mov	w27, wzr
	str	w9, [sp, #288]                  ; 4-byte Spill
	mul	w9, w10, w25
	cset	w22, eq
	add	w28, w8, #2
	sub	w25, w9, #2
	mov	w20, w24
	b	LBB31_812
	.p2align	4, , 8
LBB31_810:                              ;   in Loop: Header=BB31_812 Depth=2
Lloh540:
	adrp	x9, _social_chat_keyboard_draw.wide_labels@PAGE
Lloh541:
	add	x9, x9, _social_chat_keyboard_draw.wide_labels@PAGEOFF
	lsr	w8, w27, #1
	add	x0, sp, #1728
	mov	w2, #7                          ; =0x7
	ldr	w1, [x9, w8, uxtw #2]
	bl	_ustrncpy
	strh	wzr, [sp, #1742]
LBB31_811:                              ;   in Loop: Header=BB31_812 Depth=2
	ldr	x8, [sp, #312]
	add	x4, sp, #2160
	ldr	w11, [sp, #236]                 ; 4-byte Reload
	mov	w1, #-1                         ; =0xffffffff
	ldr	w0, [sp, #204]                  ; 4-byte Reload
	mov	w2, #2                          ; =0x2
	mov	w3, wzr
	add	w27, w27, w26
	sbfx	x10, x8, #32, #16
	str	x8, [sp, #1544]
	add	w9, w11, w8, sxth
	sub	w9, w10, w9
	add	w9, w9, w9, lsr #31
	add	w9, w8, w9, asr #1
	add	w10, w9, w11
	strh	w9, [sp, #1544]
	strh	w10, [sp, #1548]
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1544
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	add	w20, w20, w24
	cmp	w27, #10
	b.hs	LBB31_808
LBB31_812:                              ;   Parent Loop BB31_809 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	adrp	x8, _social_chat_keyboard@PAGE+2
	ldrh	w8, [x8, _social_chat_keyboard@PAGEOFF+2]
	cmp	w23, w8
	b.ne	LBB31_814
; %bb.813:                              ;   in Loop: Header=BB31_812 Depth=2
	adrp	x8, _social_chat_keyboard@PAGE+4
	lsr	w9, w27, w22
	ldrsh	w8, [x8, _social_chat_keyboard@PAGEOFF+4]
	sdiv	w8, w8, w26
	cmp	w8, w9
	cset	w8, ne
	b	LBB31_815
	.p2align	4, , 8
LBB31_814:                              ;   in Loop: Header=BB31_812 Depth=2
	mov	w8, #1                          ; =0x1
LBB31_815:                              ;   in Loop: Header=BB31_812 Depth=2
	mov	w9, #9272                       ; =0x2438
	cmp	w23, #4
	movk	w9, #49168, lsl #16
	b.ne	LBB31_819
; %bb.816:                              ;   in Loop: Header=BB31_812 Depth=2
	cmp	w27, #1
	b.hi	LBB31_818
; %bb.817:                              ;   in Loop: Header=BB31_812 Depth=2
	adrp	x9, _social_chat_keyboard@PAGE+6
	ldrb	w10, [x9, _social_chat_keyboard@PAGEOFF+6]
	mov	w9, #20608                      ; =0x5080
	movk	w9, #57376, lsl #16
	cbnz	w10, LBB31_819
LBB31_818:                              ;   in Loop: Header=BB31_812 Depth=2
	adrp	x9, _social_chat_keyboard@PAGE+7
	and	w10, w27, #0xe
	ldrb	w9, [x9, _social_chat_keyboard@PAGEOFF+7]
	cmp	w9, #0
	mov	w9, #20608                      ; =0x5080
	ccmp	w10, #2, #0, ne
	mov	w10, #9272                      ; =0x2438
	movk	w9, #57376, lsl #16
	movk	w10, #49168, lsl #16
	csel	w9, w10, w9, ne
LBB31_819:                              ;   in Loop: Header=BB31_812 Depth=2
	ldrh	w10, [sp, #1138]
	cmp	w8, #0
	ldrh	w11, [sp, #1136]
	add	x0, sp, #312
	madd	w12, w27, w19, w10
	add	w10, w20, w10
	add	w13, w28, w11
	sub	w10, w10, #2
	add	w8, w12, #2
	mov	w12, #38655                     ; =0x96ff
	movk	w12, #61480, lsl #16
	add	w11, w25, w11
	csel	w1, w9, w12, ne
	strh	w13, [sp, #312]
	strh	w10, [sp, #318]
	strh	w8, [sp, #314]
	strh	w11, [sp, #316]
	bl	_draw_quad
	cmp	w23, #4
	b.eq	LBB31_810
; %bb.820:                              ;   in Loop: Header=BB31_812 Depth=2
	ldrb	w8, [x21, #1]
Lloh542:
	adrp	x9, _social_chat_letters@PAGE
Lloh543:
	add	x9, x9, _social_chat_letters@PAGEOFF
	cmp	w8, #0
Lloh544:
	adrp	x8, _social_chat_symbols@PAGE
Lloh545:
	add	x8, x8, _social_chat_symbols@PAGEOFF
	csel	x8, x9, x8, eq
	ldrb	w9, [x21]
	ldr	w8, [x8, w23, sxtw #2]
	add	w8, w8, w27
	ldrb	w8, [x8]
	strh	wzr, [sp, #1730]
	sub	w10, w8, #97
	and	w10, w10, #0xff
	cmp	w10, #26
	ccmp	w9, #0, #4, lo
	sub	w9, w8, #32
	csel	w8, w9, w8, ne
	and	w8, w8, #0xff
	strh	w8, [sp, #1728]
	b	LBB31_811
LBB31_821:
	adrp	x21, _social_chat_player@PAGE+98
	ldrsh	w8, [x21, _social_chat_player@PAGEOFF+98]
	cmp	w8, #1
	b.lt	LBB31_795
; %bb.822:
	mov	w9, #39322                      ; =0x999a
	add	x8, sp, #1136
	movk	w9, #16153, lsl #16
	mov	w23, wzr
Lloh546:
	adrp	x24, _social_chat_player@PAGE
Lloh547:
	add	x24, x24, _social_chat_player@PAGEOFF
	add	w26, w8, #1
	add	x27, sp, #1728
	fmov	s8, w9
Lloh548:
	adrp	x22, l_.str.93@PAGE
Lloh549:
	add	x22, x22, l_.str.93@PAGEOFF
	b	LBB31_824
LBB31_823:                              ;   in Loop: Header=BB31_824 Depth=1
	ldr	s0, [sp, #1544]
	add	x0, sp, #720
	ldr	x8, [sp, #1120]
	mov	w1, #1                          ; =0x1
	mov	w2, #1                          ; =0x1
	strh	wzr, [x27, w9, sxtw #1]
	str	xzr, [sp, #320]
	fmul	s0, s0, s8
	str	wzr, [sp, #316]
	str	x8, [sp, #720]
	str	s0, [sp, #312]
	bl	_offset_rectangle2d
	mov	w0, #1                          ; =0x1
	bl	_rasterizer_text_set_shadow_color
	ldr	w25, [sp, #204]                 ; 4-byte Reload
	add	x4, sp, #312
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	mov	w0, w25
	bl	_draw_string_set_draw_mode
	add	x0, sp, #720
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	add	x4, sp, #1544
	mov	w0, w25
	mov	w1, #-1                         ; =0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	bl	_draw_string_set_draw_mode
	add	x0, sp, #1120
	add	x4, sp, #1728
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	bl	_rasterizer_draw_unicode_string
	mov	w0, wzr
	bl	_rasterizer_text_set_shadow_color
	ldr	w25, [sp, #236]                 ; 4-byte Reload
	add	x0, sp, #1120
	mov	w1, wzr
	mov	w2, w25
	bl	_offset_rectangle2d
	ldrsh	w8, [x21, _social_chat_player@PAGEOFF+98]
	add	w23, w23, #1
	cmp	w23, w8
	b.ge	LBB31_795
LBB31_824:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB31_830 Depth 2
	add	x8, x24, w23, sxtw #1
	ldrh	w28, [x24, #100]
	ldrsh	w25, [x8, #84]
	ldr	w8, [x24, #104]
	cmp	w25, #5
	ccmp	w8, #0, #4, eq
	b.eq	LBB31_826
; %bb.825:                              ;   in Loop: Header=BB31_824 Depth=1
	bl	_system_milliseconds
Lloh550:
	adrp	x8, _social_chat_player@PAGE+104
Lloh551:
	ldr	w8, [x8, _social_chat_player@PAGEOFF+104]
	sub	w9, w0, w8
Lloh552:
	adrp	x8, l_.str.94@PAGE
Lloh553:
	add	x8, x8, l_.str.94@PAGEOFF
	cmp	w9, #4001
	b.lo	LBB31_827
LBB31_826:                              ;   in Loop: Header=BB31_824 Depth=1
Lloh554:
	adrp	x8, _social_chat_player_draw.labels@PAGE
Lloh555:
	add	x8, x8, _social_chat_player_draw.labels@PAGEOFF
	ldr	w8, [x8, w25, sxtw #2]
LBB31_827:                              ;   in Loop: Header=BB31_824 Depth=1
	add	x0, sp, #1136
	mov	w1, #48                         ; =0x30
	mov	x2, x22
	str	w8, [sp]
	bl	_halo_linux_snprintf
	ldr	x9, [sp, #1120]
	add	x8, x24, w23, sxtw #3
	cmp	w23, w28
	str	x9, [x8, #112]!
	strh	w19, [x8, #2]
	strh	w20, [x8, #6]
	b.ne	LBB31_829
; %bb.828:                              ;   in Loop: Header=BB31_824 Depth=1
	ldr	x8, [x8]
	mov	w1, #38655                      ; =0x96ff
	add	x0, sp, #312
	movk	w1, #49192, lsl #16
	str	x8, [sp, #312]
	bl	_draw_quad
LBB31_829:                              ;   in Loop: Header=BB31_824 Depth=1
	ldrb	w8, [sp, #1136]
	mov	w9, wzr
	ldr	w28, [sp, #140]                 ; 4-byte Reload
	cbz	w8, LBB31_823
	.p2align	4, , 8
LBB31_830:                              ;   Parent Loop BB31_824 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w26, w9
	and	w11, w8, #0xff
	ldrb	w8, [x10]
	add	w10, w27, w9, lsl #1
	add	w9, w9, #1
	strh	w11, [x10]
	cbnz	w8, LBB31_830
	b	LBB31_823
LBB31_831:
	ldr	x8, [sp, #1136]
	mov	w9, #1                          ; =0x1
Lloh556:
	adrp	x10, _social_chat_keyboard@PAGE+20
Lloh557:
	add	x10, x10, _social_chat_keyboard@PAGEOFF+20
	stur	x8, [x10, #2]
	strb	w9, [x10]
	b	LBB31_19
LBB31_832:
	mov	w8, #2                          ; =0x2
	b	LBB31_769
	.loh AdrpAdd	Lloh422, Lloh423
	.loh AdrpAdd	Lloh424, Lloh425
	.loh AdrpAdd	Lloh426, Lloh427
	.loh AdrpAdd	Lloh428, Lloh429
	.loh AdrpAdd	Lloh430, Lloh431
	.loh AdrpAdd	Lloh432, Lloh433
	.loh AdrpLdrGot	Lloh434, Lloh435
	.loh AdrpAdd	Lloh436, Lloh437
	.loh AdrpAdd	Lloh438, Lloh439
	.loh AdrpAdd	Lloh440, Lloh441
	.loh AdrpAdd	Lloh442, Lloh443
	.loh AdrpAdd	Lloh444, Lloh445
	.loh AdrpAdd	Lloh446, Lloh447
	.loh AdrpAdd	Lloh448, Lloh449
	.loh AdrpAdd	Lloh450, Lloh451
	.loh AdrpLdr	Lloh455, Lloh457
	.loh AdrpLdr	Lloh454, Lloh456
	.loh AdrpAdrp	Lloh452, Lloh454
	.loh AdrpLdr	Lloh452, Lloh453
	.loh AdrpAdd	Lloh458, Lloh459
	.loh AdrpAdd	Lloh460, Lloh461
	.loh AdrpAdd	Lloh466, Lloh467
	.loh AdrpAdd	Lloh464, Lloh465
	.loh AdrpAdd	Lloh462, Lloh463
	.loh AdrpAdd	Lloh468, Lloh469
	.loh AdrpAdd	Lloh474, Lloh475
	.loh AdrpAdd	Lloh472, Lloh473
	.loh AdrpAdd	Lloh470, Lloh471
	.loh AdrpAdd	Lloh476, Lloh477
	.loh AdrpAdd	Lloh478, Lloh479
	.loh AdrpAdd	Lloh480, Lloh481
	.loh AdrpAdd	Lloh486, Lloh487
	.loh AdrpAdd	Lloh484, Lloh485
	.loh AdrpAdd	Lloh482, Lloh483
	.loh AdrpLdr	Lloh489, Lloh491
	.loh AdrpLdr	Lloh488, Lloh490
	.loh AdrpAdd	Lloh492, Lloh493
	.loh AdrpAdd	Lloh494, Lloh495
	.loh AdrpAdd	Lloh496, Lloh497
	.loh AdrpAdd	Lloh506, Lloh507
	.loh AdrpLdr	Lloh502, Lloh503
	.loh AdrpLdr	Lloh501, Lloh505
	.loh AdrpLdr	Lloh499, Lloh504
	.loh AdrpAdrp	Lloh498, Lloh501
	.loh AdrpLdr	Lloh498, Lloh500
	.loh AdrpAdd	Lloh508, Lloh509
	.loh AdrpAdd	Lloh510, Lloh511
	.loh AdrpLdr	Lloh518, Lloh521
	.loh AdrpLdr	Lloh517, Lloh520
	.loh AdrpLdr	Lloh516, Lloh519
	.loh AdrpAdd	Lloh514, Lloh515
	.loh AdrpAdd	Lloh512, Lloh513
	.loh AdrpAdd	Lloh522, Lloh523
	.loh AdrpAdd	Lloh524, Lloh525
	.loh AdrpAdd	Lloh530, Lloh531
	.loh AdrpLdr	Lloh528, Lloh529
	.loh AdrpAdd	Lloh526, Lloh527
	.loh AdrpAdd	Lloh534, Lloh535
	.loh AdrpLdr	Lloh532, Lloh533
	.loh AdrpAdd	Lloh536, Lloh537
	.loh AdrpAdd	Lloh538, Lloh539
	.loh AdrpAdd	Lloh540, Lloh541
	.loh AdrpAdd	Lloh544, Lloh545
	.loh AdrpAdd	Lloh542, Lloh543
	.loh AdrpAdd	Lloh548, Lloh549
	.loh AdrpAdd	Lloh546, Lloh547
	.loh AdrpAdd	Lloh552, Lloh553
	.loh AdrpLdr	Lloh550, Lloh551
	.loh AdrpAdd	Lloh554, Lloh555
	.loh AdrpAdd	Lloh556, Lloh557
                                        ; -- End function
	.globl	_social_chat_draw_docked        ; -- Begin function social_chat_draw_docked
	.p2align	4
_social_chat_draw_docked:               ; @social_chat_draw_docked
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
Lloh558:
	adrp	x21, _social_chat@PAGE+36952
Lloh559:
	add	x21, x21, _social_chat@PAGEOFF+36952
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	w19, w5
	mov	w20, w4
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	ldr	w8, [x21, #12]
	add	x29, sp, #32
	strh	w0, [x21, #2]
	strh	w1, [x21]
	strh	w2, [x21, #6]
	strh	w3, [x21, #4]
	cbz	w8, LBB32_4
; %bb.1:
	bl	_system_milliseconds
Lloh560:
	adrp	x8, _social_chat@PAGE+36964
Lloh561:
	ldr	w8, [x8, _social_chat@PAGEOFF+36964]
	sub	w8, w0, w8
	cmp	w8, #999
	b.gt	LBB32_4
; %bb.2:
Lloh562:
	adrp	x8, _social_chat@PAGE+36954
Lloh563:
	add	x8, x8, _social_chat@PAGEOFF+36954
	ldrsh	w9, [x8, #4]
	ldrsh	w8, [x8]
	cmp	w9, w8
	b.le	LBB32_4
; %bb.3:
	ldrsh	w8, [x21, #4]
	ldrsh	w9, [x21]
	cmp	w8, w9
	b.gt	LBB32_5
LBB32_4:
Lloh564:
	adrp	x8, _social_chat@PAGE+36968
Lloh565:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB32_5:
Lloh566:
	adrp	x21, _social_chat@PAGE+36960
Lloh567:
	add	x21, x21, _social_chat@PAGEOFF+36960
	strh	w20, [x21]
	strb	w19, [x21, #2]
	bl	_system_milliseconds
	mov	w8, w0
	mov	w0, #1                          ; =0x1
	orr	w8, w8, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	str	w8, [x21, #4]
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_social_chat_draw_in
	.loh AdrpAdd	Lloh558, Lloh559
	.loh AdrpLdr	Lloh560, Lloh561
	.loh AdrpAdd	Lloh562, Lloh563
	.loh AdrpAdd	Lloh564, Lloh565
	.loh AdrpAdd	Lloh566, Lloh567
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_team
_social_chat_team:                      ; @social_chat_team
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	mov	w0, #-1                         ; =0xffffffff
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	bl	_local_player_get_next
	cmn	w0, #1
	b.eq	LBB33_7
; %bb.1:
	bl	_local_player_get_player_index
	cmn	w0, #1
	b.eq	LBB33_7
; %bb.2:
Lloh568:
	adrp	x8, _player_data@GOTPAGE
	mov	w1, w0
Lloh569:
	ldr	w8, [x8, _player_data@GOTPAGEOFF]
Lloh570:
	ldr	w0, [x8]
	bl	_datum_try_and_get
	mov	x19, x0
	cbz	w19, LBB33_7
; %bb.3:
	bl	_game_in_progress
	cbz	w0, LBB33_7
; %bb.4:
	bl	_game_engine_running
	cbz	w0, LBB33_7
; %bb.5:
	bl	_game_engine_has_teams
	cbz	w0, LBB33_7
; %bb.6:
	ldr	w8, [x19, #32]
	b	LBB33_8
LBB33_7:
	mov	w8, #65535                      ; =0xffff
LBB33_8:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	sxth	w0, w8
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGotLdr	Lloh568, Lloh569, Lloh570
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_player_options
_social_chat_player_options:            ; @social_chat_player_options
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	adrp	x19, _social_chat_replaces_upstream.read_at@PAGE
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	ldr	w20, [x19, _social_chat_replaces_upstream.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w20, w0
	b.ne	LBB34_2
; %bb.1:
	adrp	x8, _social_chat_replaces_upstream.on@PAGE
	ldrb	w8, [x8, _social_chat_replaces_upstream.on@PAGEOFF]
	cbnz	w8, LBB34_3
	b	LBB34_6
LBB34_2:
	bl	_config_changes
	str	w0, [x19, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh571:
	adrp	x0, l_.str@PAGE
Lloh572:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_replaces_upstream.on@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_replaces_upstream.on@PAGEOFF]
	cbz	w8, LBB34_6
LBB34_3:
	bl	_social_enabled
	cbz	w0, LBB34_5
; %bb.4:
	bl	_social_account_code
	ldrb	w8, [x0]
	cmp	w8, #0
	cset	w8, ne
	b	LBB34_6
LBB34_5:
	mov	w8, wzr
LBB34_6:
Lloh573:
	adrp	x19, _social_chat_player@PAGE+1
Lloh574:
	add	x19, x19, _social_chat_player@PAGEOFF+1
	adrp	x20, _social_chat_player@PAGE+100
	ldrb	w9, [x19]
	sturh	wzr, [x19, #97]
	cbz	w9, LBB34_10
; %bb.7:
	cbz	w8, LBB34_27
; %bb.8:
	adrp	x21, _social_chat_private_heard.read_at@PAGE
	ldr	w22, [x21, _social_chat_private_heard.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB34_21
; %bb.9:
	adrp	x8, _social_chat_private_heard.heard@PAGE
	ldrb	w8, [x8, _social_chat_private_heard.heard@PAGEOFF]
	cbnz	w8, LBB34_22
	b	LBB34_23
LBB34_10:
	adrp	x8, _social_chat@PAGE+46012
	ldrsh	w8, [x8, _social_chat@PAGEOFF+46012]
	cmp	w8, #1
	b.lt	LBB34_20
; %bb.11:
	mov	w9, wzr
Lloh575:
	adrp	x10, _social_chat@PAGE+43902
Lloh576:
	add	x10, x10, _social_chat@PAGEOFF+43902
	mov	w11, #66                        ; =0x42
	mov	w12, #43900                     ; =0xab7c
Lloh577:
	adrp	x13, _social_chat@PAGE
Lloh578:
	add	x13, x13, _social_chat@PAGEOFF
Lloh579:
	adrp	x14, _social_chat_player@PAGE+18
Lloh580:
	add	x14, x14, _social_chat_player@PAGEOFF+18
	b	LBB34_15
	.p2align	4, , 8
LBB34_12:                               ;   in Loop: Header=BB34_15 Depth=1
	mov	x15, x14
LBB34_13:                               ;   in Loop: Header=BB34_15 Depth=1
	ldrh	w15, [x15]
	cbz	w15, LBB34_30
LBB34_14:                               ;   in Loop: Header=BB34_15 Depth=1
	add	w9, w9, #1
	add	w10, w10, #66
	cmp	w9, w8
	b.eq	LBB34_20
LBB34_15:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB34_17 Depth 2
	smaddl	x15, w9, w11, x13
	ldrh	w17, [x15, x12]
	cbz	w17, LBB34_12
; %bb.16:                               ;   in Loop: Header=BB34_15 Depth=1
	mov	x16, x10
	mov	x15, x14
	.p2align	4, , 8
LBB34_17:                               ;   Parent Loop BB34_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrh	w0, [x15], #2
	cbz	w0, LBB34_14
; %bb.18:                               ;   in Loop: Header=BB34_17 Depth=2
	sub	w1, w17, #65
	orr	w2, w17, #0x20
	cmp	w1, #26
	sub	w1, w0, #65
	csel	w17, w2, w17, lo
	orr	w2, w0, #0x20
	cmp	w1, #26
	csel	w0, w2, w0, lo
	cmp	w17, w0
	b.ne	LBB34_14
; %bb.19:                               ;   in Loop: Header=BB34_17 Depth=2
	ldrh	w17, [x16]
	add	w16, w16, #2
	cbnz	w17, LBB34_17
	b	LBB34_13
LBB34_20:
	mov	w9, #6                          ; =0x6
	b	LBB34_31
LBB34_21:
	bl	_config_changes
	str	w0, [x21, _social_chat_private_heard.read_at@PAGEOFF]
Lloh581:
	adrp	x0, l_.str.4@PAGE
Lloh582:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_private_heard.heard@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_private_heard.heard@PAGEOFF]
	cbz	w8, LBB34_23
LBB34_22:
Lloh583:
	adrp	x8, _social_chat_player@PAGE
Lloh584:
	add	x8, x8, _social_chat_player@PAGEOFF
	ldrsh	x9, [x8, #98]
	add	w10, w9, #1
	add	x9, x8, x9, lsl #1
	strh	w10, [x8, #98]
	strh	wzr, [x9, #84]
LBB34_23:
Lloh585:
	adrp	x0, l_.str.6@PAGE
Lloh586:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_config_boolean
	cbz	w0, LBB34_26
; %bb.24:
Lloh587:
	adrp	x0, _social_chat_player@PAGE+1
Lloh588:
	add	x0, x0, _social_chat_player@PAGEOFF+1
	bl	_social_menu_is_friend
	cbnz	w0, LBB34_26
; %bb.25:
Lloh589:
	adrp	x8, _social_chat_player@PAGE
Lloh590:
	add	x8, x8, _social_chat_player@PAGEOFF
	mov	w11, #1                         ; =0x1
	ldrsh	x9, [x8, #98]
	add	w10, w9, #1
	add	x9, x8, x9, lsl #1
	strh	w10, [x8, #98]
	strh	w11, [x9, #84]
LBB34_26:
	ldursh	x8, [x19, #97]
	add	x21, x19, #83
	mov	w10, #2                         ; =0x2
	mov	x0, x19
	add	w9, w8, #1
	sturh	w9, [x19, #97]
	strh	w10, [x21, x8, lsl #1]
	bl	_social_menu_is_muted
	ldursh	x8, [x19, #97]
	mov	w9, #3                          ; =0x3
	cmp	w0, #0
	cinc	w9, w9, ne
	add	w10, w8, #1
	sturh	w10, [x19, #97]
	mov	w10, #5                         ; =0x5
	strh	w9, [x21, x8, lsl #1]
	ldursh	x8, [x19, #97]
	add	w9, w8, #1
	sturh	w9, [x19, #97]
	strh	w10, [x21, x8, lsl #1]
LBB34_27:
	ldrsh	w8, [x20, _social_chat_player@PAGEOFF+100]
	tbnz	w8, #31, LBB34_29
; %bb.28:
	adrp	x9, _social_chat_player@PAGE+98
	ldrsh	w9, [x9, _social_chat_player@PAGEOFF+98]
	cmp	w9, #1
	csinc	w9, w9, wzr, gt
	sub	w9, w9, #1
	cmp	w8, w9
	csel	w8, w8, w9, lo
	b	LBB34_32
LBB34_29:
	mov	w8, wzr
	b	LBB34_32
LBB34_30:
	mov	w9, #7                          ; =0x7
LBB34_31:
	mov	w10, #1                         ; =0x1
Lloh591:
	adrp	x11, _social_chat_player@PAGE+84
Lloh592:
	add	x11, x11, _social_chat_player@PAGEOFF+84
	mov	w8, wzr
	strh	w9, [x11]
	strh	w10, [x11, #14]
LBB34_32:
	strh	w8, [x20, _social_chat_player@PAGEOFF+100]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh571, Lloh572
	.loh AdrpAdd	Lloh573, Lloh574
	.loh AdrpAdd	Lloh579, Lloh580
	.loh AdrpAdd	Lloh577, Lloh578
	.loh AdrpAdd	Lloh575, Lloh576
	.loh AdrpAdd	Lloh581, Lloh582
	.loh AdrpAdd	Lloh583, Lloh584
	.loh AdrpAdd	Lloh585, Lloh586
	.loh AdrpAdd	Lloh587, Lloh588
	.loh AdrpAdd	Lloh589, Lloh590
	.loh AdrpAdd	Lloh591, Lloh592
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_keyboard_press
_social_chat_keyboard_press:            ; @social_chat_keyboard_press
; %bb.0:
	sub	sp, sp, #48
	adrp	x8, _social_chat_keyboard@PAGE+2
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	ldrsh	w8, [x8, _social_chat_keyboard@PAGEOFF+2]
	cmp	w8, #3
	b.gt	LBB35_9
; %bb.1:
Lloh593:
	adrp	x9, _social_chat_keyboard@PAGE+4
Lloh594:
	add	x9, x9, _social_chat_keyboard@PAGEOFF+4
Lloh595:
	adrp	x11, _social_chat_symbols@PAGE
Lloh596:
	add	x11, x11, _social_chat_symbols@PAGEOFF
Lloh597:
	adrp	x12, _social_chat_letters@PAGE
Lloh598:
	add	x12, x12, _social_chat_letters@PAGEOFF
	ldrb	w10, [x9, #3]
Lloh599:
	adrp	x0, _social_chat@PAGE+36880
Lloh600:
	add	x0, x0, _social_chat@PAGEOFF+36880
	strb	wzr, [sp, #15]
	cmp	w10, #0
	csel	x10, x12, x11, eq
	ldrsh	x11, [x9]
	ldrb	w9, [x9, #2]
	ldr	w8, [x10, w8, sxtw #2]
	ldrb	w8, [x8, x11]
	sub	w10, w8, #97
	and	w10, w10, #0xff
	cmp	w10, #26
	ccmp	w9, #0, #4, lo
	sub	w9, w8, #32
	csel	w19, w9, w8, ne
	and	w20, w19, #0xff
	bl	_csstrlen
	cmp	w0, #63
	ccmp	w20, #0, #4, lt
	b.eq	LBB35_21
; %bb.2:
	add	x8, sp, #14
	mov	w9, #36880                      ; =0x9010
	add	w8, w8, #1
Lloh601:
	adrp	x10, _social_chat@PAGE
Lloh602:
	add	x10, x10, _social_chat@PAGEOFF
	.p2align	4, , 8
LBB35_3:                                ; =>This Inner Loop Header: Depth=1
	sxtb	w11, w19
	cmp	w11, #32
	b.lt	LBB35_7
; %bb.4:                                ;   in Loop: Header=BB35_3 Depth=1
	and	w11, w19, #0xff
	cmp	w11, #124
	b.eq	LBB35_7
; %bb.5:                                ;   in Loop: Header=BB35_3 Depth=1
	cmp	w11, #127
	b.eq	LBB35_7
; %bb.6:                                ;   in Loop: Header=BB35_3 Depth=1
	add	w11, w0, #1
	add	x12, x10, w0, sxtw
	mov	w0, w11
	strb	w19, [x12, x9]
	.p2align	4, , 8
LBB35_7:                                ;   in Loop: Header=BB35_3 Depth=1
	ldrb	w19, [x8]
	cbz	w19, LBB35_21
; %bb.8:                                ;   in Loop: Header=BB35_3 Depth=1
	add	w8, w8, #1
	cmp	w0, #63
	b.lt	LBB35_3
	b	LBB35_21
LBB35_9:
	adrp	x8, _social_chat_keyboard@PAGE+4
	ldrh	w8, [x8, _social_chat_keyboard@PAGEOFF+4]
	add	w8, w8, w8, lsr #15
	sxth	w8, w8
	ubfx	w8, w8, #1, #16
	cmp	w8, #1
	b.gt	LBB35_13
; %bb.10:
	cbz	w8, LBB35_18
; %bb.11:
	cmp	w8, #1
	b.ne	LBB35_17
; %bb.12:
	adrp	x8, _social_chat_keyboard@PAGE+7
	ldrb	w9, [x8, _social_chat_keyboard@PAGEOFF+7]
	cmp	w9, #0
	cset	w9, eq
	strb	w9, [x8, _social_chat_keyboard@PAGEOFF+7]
	b	LBB35_22
LBB35_13:
	cmp	w8, #2
	b.eq	LBB35_19
; %bb.14:
	cmp	w8, #3
	b.ne	LBB35_17
; %bb.15:
Lloh603:
	adrp	x0, _social_chat@PAGE+36880
Lloh604:
	add	x0, x0, _social_chat@PAGEOFF+36880
	bl	_csstrlen
	cbz	w0, LBB35_22
; %bb.16:
Lloh605:
	adrp	x8, _social_chat@PAGE
Lloh606:
	add	x8, x8, _social_chat@PAGEOFF
	add	w8, w8, w0
	mov	w9, #36879                      ; =0x900f
	add	w8, w8, w9
	strb	wzr, [x8]
	b	LBB35_22
LBB35_17:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	b	_social_chat_send_typed
LBB35_18:
	adrp	x8, _social_chat_keyboard@PAGE+6
	ldrb	w9, [x8, _social_chat_keyboard@PAGEOFF+6]
	cmp	w9, #0
	cset	w9, eq
	strb	w9, [x8, _social_chat_keyboard@PAGEOFF+6]
	b	LBB35_22
LBB35_19:
Lloh607:
	adrp	x0, _social_chat@PAGE+36880
Lloh608:
	add	x0, x0, _social_chat@PAGEOFF+36880
	bl	_csstrlen
	cmp	w0, #62
	b.gt	LBB35_21
; %bb.20:
Lloh609:
	adrp	x9, _social_chat@PAGE
Lloh610:
	add	x9, x9, _social_chat@PAGEOFF
	add	x9, x9, w0, sxtw
	mov	w10, #36880                     ; =0x9010
	mov	w11, #32                        ; =0x20
	add	w8, w0, #1
	mov	w0, w8
	strb	w11, [x9, x10]
LBB35_21:
Lloh611:
	adrp	x8, _social_chat@PAGE
Lloh612:
	add	x8, x8, _social_chat@PAGEOFF
	add	x8, x8, w0, sxtw
	mov	w9, #36880                      ; =0x9010
	strb	wzr, [x8, x9]
LBB35_22:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh599, Lloh600
	.loh AdrpAdd	Lloh597, Lloh598
	.loh AdrpAdd	Lloh595, Lloh596
	.loh AdrpAdd	Lloh593, Lloh594
	.loh AdrpAdd	Lloh601, Lloh602
	.loh AdrpAdd	Lloh603, Lloh604
	.loh AdrpAdd	Lloh605, Lloh606
	.loh AdrpAdd	Lloh607, Lloh608
	.loh AdrpAdd	Lloh609, Lloh610
	.loh AdrpAdd	Lloh611, Lloh612
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_send_typed
_social_chat_send_typed:                ; @social_chat_send_typed
; %bb.0:
	sub	sp, sp, #288
	stp	x22, x21, [sp, #240]            ; 16-byte Folded Spill
	mov	w8, #36870                      ; =0x9006
Lloh613:
	adrp	x22, _social_chat@PAGE
Lloh614:
	add	x22, x22, _social_chat@PAGEOFF
	stp	x24, x23, [sp, #224]            ; 16-byte Folded Spill
	stp	x28, x27, [sp, #192]            ; 16-byte Folded Spill
	ldrh	w23, [x22, x8]
	stp	x26, x25, [sp, #208]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #256]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	add	x29, sp, #272
	bl	_social_chat_team
	mov	w8, #39672                      ; =0x9af8
	mov	w9, #39670                      ; =0x9af6
	adrp	x25, _social_chat_replaces_upstream.read_at@PAGE
	mov	w10, #84                        ; =0x54
	mov	w20, w0
	ldrh	w8, [x22, x8]
	ldrsh	w9, [x22, x9]
	ldr	w26, [x25, _social_chat_replaces_upstream.read_at@PAGEOFF]
	sxth	w11, w8
	cmn	w11, #1
	sxth	x8, w8
	cset	w12, gt
	cmp	w11, w9
	smaddl	x8, w8, w10, x22
	cset	w9, lt
	mov	w10, #36982                     ; =0x9076
	ands	w24, w12, w9
	add	x19, x8, x10
	csel	x21, x19, xzr, ne
	bl	_config_changes
	cmp	w26, w0
	b.ne	LBB36_2
; %bb.1:
	adrp	x8, _social_chat_replaces_upstream.on@PAGE
	ldrb	w8, [x8, _social_chat_replaces_upstream.on@PAGEOFF]
	cbnz	w8, LBB36_3
	b	LBB36_5
LBB36_2:
	bl	_config_changes
	str	w0, [x25, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh615:
	adrp	x0, l_.str@PAGE
Lloh616:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_replaces_upstream.on@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_replaces_upstream.on@PAGEOFF]
	cbz	w8, LBB36_5
LBB36_3:
	bl	_social_enabled
	cbz	w0, LBB36_5
; %bb.4:
	bl	_social_account_code
	ldrb	w8, [x0]
	cmp	w8, #0
	cset	w28, ne
	b	LBB36_6
LBB36_5:
	mov	w28, wzr
LBB36_6:
	adrp	x8, _social_chat@PAGE+36880
	ldrb	w11, [x8, _social_chat@PAGEOFF+36880]
	cbz	w11, LBB36_17
; %bb.7:
	mov	w8, wzr
	add	x9, sp, #120
Lloh617:
	adrp	x10, _social_chat@PAGE+36880
Lloh618:
	add	x10, x10, _social_chat@PAGEOFF+36880
	.p2align	4, , 8
LBB36_8:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB36_11 Depth 2
	tbnz	w11, #7, LBB36_11
; %bb.9:                                ;   in Loop: Header=BB36_8 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB36_12
; %bb.10:                               ;   in Loop: Header=BB36_8 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB36_15
	.p2align	4, , 8
LBB36_11:                               ;   Parent Loop BB36_8 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB36_11
	b	LBB36_14
	.p2align	4, , 8
LBB36_12:                               ;   in Loop: Header=BB36_8 Depth=1
	cmp	w12, #127
	b.eq	LBB36_14
; %bb.13:                               ;   in Loop: Header=BB36_8 Depth=1
	cmp	w12, #124
	b.ne	LBB36_15
	.p2align	4, , 8
LBB36_14:                               ;   in Loop: Header=BB36_8 Depth=1
	mov	w11, #63                        ; =0x3f
LBB36_15:                               ;   in Loop: Header=BB36_8 Depth=1
	strb	w11, [x9, w8, sxtw]
	add	w12, w8, #1
	ldrb	w11, [x10]
	cbz	w11, LBB36_18
; %bb.16:                               ;   in Loop: Header=BB36_8 Depth=1
	cmp	w8, #62
	mov	w8, w12
	b.lo	LBB36_8
	b	LBB36_18
LBB36_17:
	mov	w12, wzr
LBB36_18:
	add	x8, sp, #120
	mov	w9, wzr
	strb	wzr, [x8, w12, sxtw]
	.p2align	4, , 8
LBB36_19:                               ; =>This Inner Loop Header: Depth=1
	sxth	x10, w9
	ldrb	w10, [x8, x10]
	cmp	w10, #32
	b.ne	LBB36_21
; %bb.20:                               ;   in Loop: Header=BB36_19 Depth=1
	add	w9, w9, #1
	b	LBB36_19
LBB36_21:
	cbz	w10, LBB36_43
; %bb.22:
	adrp	x27, _social_chat@PAGE+46044
	ldr	w8, [x27, _social_chat@PAGEOFF+46044]
	cmp	w8, #0
	csel	w8, wzr, w28, eq
	cbz	w8, LBB36_46
; %bb.23:
	bl	_system_milliseconds
Lloh619:
	adrp	x10, _social_chat@PAGE+36864
Lloh620:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w20, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB36_25
; %bb.24:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB36_25:
	mov	w9, #384                        ; =0x180
	mov	w1, wzr
	mov	w2, #384                        ; =0x180
	smaddl	x19, w8, w9, x22
	mov	x0, x19
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w20, [x19, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB36_27
; %bb.26:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB36_27:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB36_29
; %bb.28:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB36_29:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB36_32
; %bb.30:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB36_32
; %bb.31:
Lloh621:
	adrp	x8, _social_chat@PAGE+36968
Lloh622:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB36_32:
	mov	w9, wzr
	add	x8, x19, #66
	mov	w11, #83                        ; =0x53
Lloh623:
	adrp	x10, l_.str.15@PAGE
Lloh624:
	add	x10, x10, l_.str.15@PAGEOFF
	.p2align	4, , 8
LBB36_33:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB36_36 Depth 2
	tbnz	w11, #7, LBB36_36
; %bb.34:                               ;   in Loop: Header=BB36_33 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB36_37
; %bb.35:                               ;   in Loop: Header=BB36_33 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB36_40
	.p2align	4, , 8
LBB36_36:                               ;   Parent Loop BB36_33 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB36_36
	b	LBB36_39
	.p2align	4, , 8
LBB36_37:                               ;   in Loop: Header=BB36_33 Depth=1
	cmp	w12, #127
	b.eq	LBB36_39
; %bb.38:                               ;   in Loop: Header=BB36_33 Depth=1
	cmp	w12, #124
	b.ne	LBB36_40
	.p2align	4, , 8
LBB36_39:                               ;   in Loop: Header=BB36_33 Depth=1
	mov	w11, #63                        ; =0x3f
LBB36_40:                               ;   in Loop: Header=BB36_33 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB36_42
; %bb.41:                               ;   in Loop: Header=BB36_33 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB36_33
LBB36_42:
	mov	w9, #1                          ; =0x1
	mov	w10, #196608                    ; =0x30000
Lloh625:
	adrp	x1, l_.str.1@PAGE
Lloh626:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	w0, #3                          ; =0x3
	strb	wzr, [x8, w12, sxtw]
	strb	w9, [x19, #374]
	str	w10, [x19, #368]
	str	w8, [sp]
	bl	_error
LBB36_43:
	adrp	x8, _social_chat@PAGE+36868
	ldrb	w8, [x8, _social_chat@PAGEOFF+36868]
	cbz	w8, LBB36_45
; %bb.44:
	bl	_system_milliseconds
	adrp	x8, _social_chat@PAGE+36948
	orr	w9, w0, #0x1
	str	w9, [x8, _social_chat@PAGEOFF+36948]
LBB36_45:
Lloh627:
	adrp	x8, _social_chat@PAGE+36868
Lloh628:
	add	x8, x8, _social_chat@PAGEOFF+36868
Lloh629:
	adrp	x9, _social_chat_keyboard@PAGE
Lloh630:
	add	x9, x9, _social_chat_keyboard@PAGEOFF
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	strb	wzr, [x8]
	strh	wzr, [x8, #76]
Lloh631:
	adrp	x8, _social_chat_player@PAGE
Lloh632:
	add	x8, x8, _social_chat_player@PAGEOFF
	strh	wzr, [x9]
	ldp	x20, x19, [sp, #256]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #240]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #224]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #208]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #192]            ; 16-byte Folded Reload
	strb	wzr, [x9, #20]
	strb	wzr, [x8]
	strb	wzr, [x8, #110]
	strh	wzr, [x8, #176]
	add	sp, sp, #288
	ret
LBB36_46:
	cmp	w23, #1
	b.hi	LBB36_49
; %bb.47:
	bl	_network_chat_available
	cbz	w0, LBB36_69
; %bb.48:
	cmp	w23, #1
	add	x1, sp, #120
	cset	w0, eq
	bl	_network_chat_say
	mov	w26, wzr
	str	wzr, [sp, #8]                   ; 4-byte Spill
	b	LBB36_71
LBB36_49:
	cmp	w23, #2
	csel	w8, wzr, w28, ne
	cset	w9, eq
	orn	w8, w24, w8
	str	w9, [sp, #8]                    ; 4-byte Spill
	tbnz	w8, #0, LBB36_70
; %bb.50:
	bl	_system_milliseconds
Lloh633:
	adrp	x10, _social_chat@PAGE+36864
Lloh634:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w20, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB36_52
; %bb.51:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB36_52:
	mov	w9, #384                        ; =0x180
	mov	w1, wzr
	mov	w2, #384                        ; =0x180
	smaddl	x19, w8, w9, x22
	mov	x0, x19
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w20, [x19, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB36_54
; %bb.53:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB36_54:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB36_56
; %bb.55:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB36_56:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB36_59
; %bb.57:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB36_59
; %bb.58:
Lloh635:
	adrp	x8, _social_chat@PAGE+36968
Lloh636:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB36_59:
	mov	w9, wzr
	add	x8, x19, #66
	mov	w11, #78                        ; =0x4e
Lloh637:
	adrp	x10, l_.str.16@PAGE
Lloh638:
	add	x10, x10, l_.str.16@PAGEOFF
	.p2align	4, , 8
LBB36_60:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB36_63 Depth 2
	tbnz	w11, #7, LBB36_63
; %bb.61:                               ;   in Loop: Header=BB36_60 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB36_64
; %bb.62:                               ;   in Loop: Header=BB36_60 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB36_67
	.p2align	4, , 8
LBB36_63:                               ;   Parent Loop BB36_60 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB36_63
	b	LBB36_66
	.p2align	4, , 8
LBB36_64:                               ;   in Loop: Header=BB36_60 Depth=1
	cmp	w12, #127
	b.eq	LBB36_66
; %bb.65:                               ;   in Loop: Header=BB36_60 Depth=1
	cmp	w12, #124
	b.ne	LBB36_67
	.p2align	4, , 8
LBB36_66:                               ;   in Loop: Header=BB36_60 Depth=1
	mov	w11, #63                        ; =0x3f
LBB36_67:                               ;   in Loop: Header=BB36_60 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB36_42
; %bb.68:                               ;   in Loop: Header=BB36_60 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB36_60
	b	LBB36_42
LBB36_69:
	str	wzr, [sp, #8]                   ; 4-byte Spill
LBB36_70:
	mov	w26, #1                         ; =0x1
LBB36_71:
Lloh639:
	adrp	x0, _social_chat@PAGE+46268
Lloh640:
	add	x0, x0, _social_chat@PAGEOFF+46268
	bl	_social_chat_room
	cbz	w28, LBB36_106
; %bb.72:
	and	w8, w23, #0xfffe
	cmp	w8, #2
	b.eq	LBB36_75
; %bb.73:
	mov	w9, #65535                      ; =0xffff
	adrp	x8, _social_chat@PAGE+46268
	bics	wzr, w9, w20
	ccmp	w23, #0, #4, eq
	ldrb	w9, [x8, _social_chat@PAGEOFF+46268]
	cset	w8, eq
	cbz	w9, LBB36_106
; %bb.74:
	cbz	w8, LBB36_106
LBB36_75:
	add	x0, sp, #56
	mov	w1, #64                         ; =0x40
	bl	_social_player_name
	add	x0, sp, #12
	bl	_server_json_begin
	add	x0, sp, #12
	mov	x1, xzr
	bl	_server_json_object_begin
	ldr	w10, [sp, #8]                   ; 4-byte Reload
Lloh641:
	adrp	x8, l_.str.21@PAGE
Lloh642:
	add	x8, x8, l_.str.21@PAGEOFF
Lloh643:
	adrp	x9, l_.str.20@PAGE
Lloh644:
	add	x9, x9, l_.str.20@PAGEOFF
Lloh645:
	adrp	x1, l_.str.17@PAGE
Lloh646:
	add	x1, x1, l_.str.17@PAGEOFF
	add	x0, sp, #12
	cmp	w10, #0
Lloh647:
	adrp	x10, l_.str.19@PAGE
Lloh648:
	add	x10, x10, l_.str.19@PAGEOFF
	csel	x8, x9, x8, ne
	cmp	w23, #1
Lloh649:
	adrp	x9, l_.str.18@PAGE
Lloh650:
	add	x9, x9, l_.str.18@PAGEOFF
	csel	x8, x10, x8, eq
	cmp	w23, #0
	csel	x2, x9, x8, eq
	bl	_server_json_string
Lloh651:
	adrp	x1, l_.str.22@PAGE
Lloh652:
	add	x1, x1, l_.str.22@PAGEOFF
	add	x0, sp, #12
	add	x2, sp, #120
	bl	_server_json_string
	ldrb	w8, [sp, #56]
	cbz	w8, LBB36_77
; %bb.76:
Lloh653:
	adrp	x1, l_.str.23@PAGE
Lloh654:
	add	x1, x1, l_.str.23@PAGEOFF
	add	x0, sp, #12
	add	x2, sp, #56
	bl	_server_json_string
LBB36_77:
	cmp	w23, #1
	b.hi	LBB36_80
; %bb.78:
Lloh655:
	adrp	x1, l_.str.24@PAGE
Lloh656:
	add	x1, x1, l_.str.24@PAGEOFF
Lloh657:
	adrp	x2, _social_chat@PAGE+46268
Lloh658:
	add	x2, x2, _social_chat@PAGEOFF+46268
	add	x0, sp, #12
	bl	_server_json_string
	cmp	w23, #1
	b.ne	LBB36_80
; %bb.79:
Lloh659:
	adrp	x1, l_.str.19@PAGE
Lloh660:
	add	x1, x1, l_.str.19@PAGEOFF
	add	x0, sp, #12
	sxtw	x2, w20
	bl	_server_json_integer
LBB36_80:
	ldr	w8, [sp, #8]                    ; 4-byte Reload
	cbz	w8, LBB36_82
; %bb.81:
Lloh661:
	adrp	x1, l_.str.25@PAGE
Lloh662:
	add	x1, x1, l_.str.25@PAGEOFF
	add	x0, sp, #12
	mov	x2, x21
	bl	_server_json_string
LBB36_82:
	add	x0, sp, #12
	bl	_server_json_object_end
	add	x0, sp, #12
	bl	_server_json_text
	mov	x1, x0
Lloh663:
	adrp	x0, l_.str.26@PAGE
Lloh664:
	add	x0, x0, l_.str.26@PAGEOFF
	bl	_social_send
	str	w0, [x27, _social_chat@PAGEOFF+46044]
	add	x0, sp, #12
	bl	_server_json_free
	ldr	w8, [x27, _social_chat@PAGEOFF+46044]
	cbz	w8, LBB36_106
; %bb.83:
	bl	_system_milliseconds
Lloh665:
	adrp	x10, _social_chat@PAGE+36864
Lloh666:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w21, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB36_85
; %bb.84:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB36_85:
	mov	w9, #384                        ; =0x180
	mov	w1, wzr
	mov	w2, #384                        ; =0x180
	smaddl	x20, w8, w9, x22
	mov	x0, x20
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w21, [x20, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB36_87
; %bb.86:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB36_87:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB36_89
; %bb.88:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB36_89:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB36_92
; %bb.90:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB36_92
; %bb.91:
Lloh667:
	adrp	x8, _social_chat@PAGE+36968
Lloh668:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB36_92:
	add	x0, sp, #56
	mov	w1, #64                         ; =0x40
	bl	_social_player_name
	ldrb	w9, [sp, #56]
	cbz	w9, LBB36_130
; %bb.93:
	mov	w8, wzr
	add	x10, sp, #56
	b	LBB36_96
LBB36_94:                               ;   in Loop: Header=BB36_96 Depth=1
	and	w12, w11, #0x3f
	add	x11, x10, #2
	bfi	w12, w9, #6, #5
	mov	w9, w12
LBB36_95:                               ;   in Loop: Header=BB36_96 Depth=1
	strh	w9, [x20, w8, sxtw #1]
	add	w12, w8, #1
	ldrb	w9, [x11]
	mov	x10, x11
	cmp	w9, #0
	ccmp	w8, #31, #2, ne
	mov	w8, w12
	b.hs	LBB36_131
LBB36_96:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB36_104 Depth 2
	add	x11, x10, #1
	cmp	w9, #224
	b.lo	LBB36_101
; %bb.97:                               ;   in Loop: Header=BB36_96 Depth=1
	ldrb	w12, [x11]
	and	w13, w12, #0xc0
	cmp	w13, #128
	b.ne	LBB36_101
; %bb.98:                               ;   in Loop: Header=BB36_96 Depth=1
	cmp	w9, #239
	b.hi	LBB36_101
; %bb.99:                               ;   in Loop: Header=BB36_96 Depth=1
	ldrb	w13, [x10, #2]
	and	w14, w13, #0xc0
	cmp	w14, #128
	b.ne	LBB36_101
; %bb.100:                              ;   in Loop: Header=BB36_96 Depth=1
	ubfiz	w9, w9, #12, #4
	add	x11, x10, #3
	bfi	w9, w12, #6, #6
	bfxil	w9, w13, #0, #6
	b	LBB36_95
	.p2align	4, , 8
LBB36_101:                              ;   in Loop: Header=BB36_96 Depth=1
	and	w12, w9, #0xe0
	cmp	w12, #192
	b.ne	LBB36_103
; %bb.102:                              ;   in Loop: Header=BB36_96 Depth=1
	ldrb	w11, [x11]
	and	w12, w11, #0xc0
	cmp	w12, #128
	b.ne	LBB36_104
	b	LBB36_94
	.p2align	4, , 8
LBB36_103:                              ;   in Loop: Header=BB36_96 Depth=1
	tbz	w9, #7, LBB36_95
	.p2align	4, , 8
LBB36_104:                              ;   Parent Loop BB36_96 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w9, [x10]
	cmn	w9, #64
	b.lt	LBB36_104
; %bb.105:                              ;   in Loop: Header=BB36_96 Depth=1
	mov	w9, #63                         ; =0x3f
	mov	x11, x10
	b	LBB36_95
LBB36_106:
	cbz	w26, LBB36_43
; %bb.107:
	sub	w8, w23, #4
	cmn	w8, #3
	b.hi	LBB36_127
; %bb.108:
	bl	_system_milliseconds
Lloh669:
	adrp	x10, _social_chat@PAGE+36864
Lloh670:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w20, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB36_110
; %bb.109:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB36_110:
	mov	w9, #384                        ; =0x180
	mov	w1, wzr
	mov	w2, #384                        ; =0x180
	smaddl	x19, w8, w9, x22
	mov	x0, x19
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w20, [x19, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB36_112
; %bb.111:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB36_112:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB36_114
; %bb.113:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB36_114:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB36_117
; %bb.115:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB36_117
; %bb.116:
Lloh671:
	adrp	x8, _social_chat@PAGE+36968
Lloh672:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB36_117:
	mov	w9, wzr
	add	x8, x19, #66
	mov	w11, #78                        ; =0x4e
Lloh673:
	adrp	x10, l_.str.27@PAGE
Lloh674:
	add	x10, x10, l_.str.27@PAGEOFF
	.p2align	4, , 8
LBB36_118:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB36_121 Depth 2
	tbnz	w11, #7, LBB36_121
; %bb.119:                              ;   in Loop: Header=BB36_118 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB36_122
; %bb.120:                              ;   in Loop: Header=BB36_118 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB36_125
	.p2align	4, , 8
LBB36_121:                              ;   Parent Loop BB36_118 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB36_121
	b	LBB36_124
	.p2align	4, , 8
LBB36_122:                              ;   in Loop: Header=BB36_118 Depth=1
	cmp	w12, #127
	b.eq	LBB36_124
; %bb.123:                              ;   in Loop: Header=BB36_118 Depth=1
	cmp	w12, #124
	b.ne	LBB36_125
	.p2align	4, , 8
LBB36_124:                              ;   in Loop: Header=BB36_118 Depth=1
	mov	w11, #63                        ; =0x3f
LBB36_125:                              ;   in Loop: Header=BB36_118 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB36_42
; %bb.126:                              ;   in Loop: Header=BB36_118 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB36_118
	b	LBB36_42
LBB36_127:
	bl	_community_net_enabled
	cbz	w0, LBB36_134
; %bb.128:
	ldr	w19, [x25, _social_chat_replaces_upstream.read_at@PAGEOFF]
	bl	_config_changes
	cmp	w19, w0
	b.ne	LBB36_153
; %bb.129:
	adrp	x8, _social_chat_replaces_upstream.on@PAGE
	ldrb	w8, [x8, _social_chat_replaces_upstream.on@PAGEOFF]
	b	LBB36_154
LBB36_130:
	mov	w12, wzr
LBB36_131:
	add	x0, x20, #66
	add	x1, sp, #120
	mov	w2, #203                        ; =0xcb
	strh	wzr, [x20, w12, sxtw #1]
	bl	_csstrncpy
	mov	w9, #1                          ; =0x1
	ldrb	w8, [x20, #372]
	mov	w10, #4                         ; =0x4
	strh	w23, [x20, #368]
	strb	w9, [x20, #373]
	ldr	w9, [sp, #8]                    ; 4-byte Reload
	orr	w8, w8, #0x2
	strh	w10, [x20, #370]
	strb	w8, [x20, #372]
	tst	w9, w24
	b.eq	LBB36_133
; %bb.132:
	add	x0, x20, #286
	mov	x1, x19
	mov	w2, #15                         ; =0xf
	bl	_csstrncpy
	add	x0, x20, #302
	add	x1, x19, #16
	mov	w2, #32                         ; =0x20
	bl	_ustrncpy
LBB36_133:
Lloh675:
	adrp	x0, _social_chat@PAGE+46048
Lloh676:
	add	x0, x0, _social_chat@PAGEOFF+46048
	add	x1, x20, #66
	mov	w2, #203                        ; =0xcb
	str	w20, [x0], #4
	bl	_csstrncpy
	b	LBB36_43
LBB36_134:
	bl	_system_milliseconds
Lloh677:
	adrp	x10, _social_chat@PAGE+36864
Lloh678:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w20, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB36_136
; %bb.135:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB36_136:
	mov	w9, #384                        ; =0x180
	mov	w1, wzr
	mov	w2, #384                        ; =0x180
	smaddl	x19, w8, w9, x22
	mov	x0, x19
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w20, [x19, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB36_138
; %bb.137:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB36_138:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB36_140
; %bb.139:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB36_140:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB36_143
; %bb.141:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB36_143
; %bb.142:
Lloh679:
	adrp	x8, _social_chat@PAGE+36968
Lloh680:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB36_143:
	mov	w9, wzr
	add	x8, x19, #66
	mov	w11, #84                        ; =0x54
Lloh681:
	adrp	x10, l_.str.28@PAGE
Lloh682:
	add	x10, x10, l_.str.28@PAGEOFF
	.p2align	4, , 8
LBB36_144:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB36_147 Depth 2
	tbnz	w11, #7, LBB36_147
; %bb.145:                              ;   in Loop: Header=BB36_144 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB36_148
; %bb.146:                              ;   in Loop: Header=BB36_144 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB36_151
	.p2align	4, , 8
LBB36_147:                              ;   Parent Loop BB36_144 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB36_147
	b	LBB36_150
LBB36_148:                              ;   in Loop: Header=BB36_144 Depth=1
	cmp	w12, #127
	b.eq	LBB36_150
; %bb.149:                              ;   in Loop: Header=BB36_144 Depth=1
	cmp	w12, #124
	b.ne	LBB36_151
	.p2align	4, , 8
LBB36_150:                              ;   in Loop: Header=BB36_144 Depth=1
	mov	w11, #63                        ; =0x3f
LBB36_151:                              ;   in Loop: Header=BB36_144 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB36_42
; %bb.152:                              ;   in Loop: Header=BB36_144 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB36_144
	b	LBB36_42
LBB36_153:
	bl	_config_changes
	str	w0, [x25, _social_chat_replaces_upstream.read_at@PAGEOFF]
Lloh683:
	adrp	x0, l_.str@PAGE
Lloh684:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	adrp	x9, _social_chat_replaces_upstream.on@PAGE
	cset	w8, ne
	strb	w8, [x9, _social_chat_replaces_upstream.on@PAGEOFF]
LBB36_154:
	cbz	w8, LBB36_176
; %bb.155:
	bl	_social_enabled
	cbz	w0, LBB36_176
; %bb.156:
	bl	_social_account_code
	ldrb	w19, [x0]
	bl	_system_milliseconds
Lloh685:
	adrp	x10, _social_chat@PAGE+36864
Lloh686:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w20, w0
	movk	w9, #10922, lsl #16
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x9, x11, x9, lsr #63
	mov	w11, #96                        ; =0x60
	msub	w8, w9, w11, w8
	ldrsh	w9, [x10]
	cmp	w9, #95
	strh	w8, [x10, #2]
	cbz	w19, LBB36_195
; %bb.157:
	b.gt	LBB36_159
; %bb.158:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB36_159:
	mov	w9, #384                        ; =0x180
	mov	w1, wzr
	mov	w2, #384                        ; =0x180
	smaddl	x19, w8, w9, x22
	mov	x0, x19
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w20, [x19, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB36_161
; %bb.160:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB36_161:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB36_163
; %bb.162:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB36_163:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB36_166
; %bb.164:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB36_166
; %bb.165:
Lloh687:
	adrp	x8, _social_chat@PAGE+36968
Lloh688:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB36_166:
	mov	w9, wzr
	add	x8, x19, #66
	mov	w11, #84                        ; =0x54
Lloh689:
	adrp	x10, l_.str.31@PAGE
Lloh690:
	add	x10, x10, l_.str.31@PAGEOFF
LBB36_167:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB36_170 Depth 2
	tbnz	w11, #7, LBB36_170
; %bb.168:                              ;   in Loop: Header=BB36_167 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB36_171
; %bb.169:                              ;   in Loop: Header=BB36_167 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB36_174
	.p2align	4, , 8
LBB36_170:                              ;   Parent Loop BB36_167 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB36_170
	b	LBB36_173
LBB36_171:                              ;   in Loop: Header=BB36_167 Depth=1
	cmp	w12, #127
	b.eq	LBB36_173
; %bb.172:                              ;   in Loop: Header=BB36_167 Depth=1
	cmp	w12, #124
	b.ne	LBB36_174
LBB36_173:                              ;   in Loop: Header=BB36_167 Depth=1
	mov	w11, #63                        ; =0x3f
LBB36_174:                              ;   in Loop: Header=BB36_167 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB36_42
; %bb.175:                              ;   in Loop: Header=BB36_167 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB36_167
	b	LBB36_42
LBB36_176:
	bl	_system_milliseconds
Lloh691:
	adrp	x10, _social_chat@PAGE+36864
Lloh692:
	add	x10, x10, _social_chat@PAGEOFF+36864
	mov	w9, #43691                      ; =0xaaab
	mov	w12, #96                        ; =0x60
	movk	w9, #10922, lsl #16
	mov	w20, w0
	ldrsh	w8, [x10, #2]
	add	w8, w8, #1
	smull	x9, w8, w9
	lsr	x11, x9, #36
	add	x11, x11, x9, lsr #63
	ldrsh	w9, [x10]
	msub	w8, w11, w12, w8
	cmp	w9, #95
	strh	w8, [x10, #2]
	b.gt	LBB36_178
; %bb.177:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB36_178:
	mov	w9, #384                        ; =0x180
	mov	w1, wzr
	mov	w2, #384                        ; =0x180
	smaddl	x19, w8, w9, x22
	mov	x0, x19
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w20, [x19, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB36_180
; %bb.179:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB36_180:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB36_182
; %bb.181:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB36_182:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB36_185
; %bb.183:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB36_185
; %bb.184:
Lloh693:
	adrp	x8, _social_chat@PAGE+36968
Lloh694:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB36_185:
	mov	w9, wzr
	add	x8, x19, #66
	mov	w11, #84                        ; =0x54
Lloh695:
	adrp	x10, l_.str.29@PAGE
Lloh696:
	add	x10, x10, l_.str.29@PAGEOFF
	.p2align	4, , 8
LBB36_186:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB36_189 Depth 2
	tbnz	w11, #7, LBB36_189
; %bb.187:                              ;   in Loop: Header=BB36_186 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB36_190
; %bb.188:                              ;   in Loop: Header=BB36_186 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB36_193
	.p2align	4, , 8
LBB36_189:                              ;   Parent Loop BB36_186 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB36_189
	b	LBB36_192
LBB36_190:                              ;   in Loop: Header=BB36_186 Depth=1
	cmp	w12, #127
	b.eq	LBB36_192
; %bb.191:                              ;   in Loop: Header=BB36_186 Depth=1
	cmp	w12, #124
	b.ne	LBB36_193
	.p2align	4, , 8
LBB36_192:                              ;   in Loop: Header=BB36_186 Depth=1
	mov	w11, #63                        ; =0x3f
LBB36_193:                              ;   in Loop: Header=BB36_186 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB36_42
; %bb.194:                              ;   in Loop: Header=BB36_186 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB36_186
	b	LBB36_42
LBB36_195:
	b.gt	LBB36_197
; %bb.196:
	add	w9, w9, #1
	adrp	x10, _social_chat@PAGE+36864
	strh	w9, [x10, _social_chat@PAGEOFF+36864]
LBB36_197:
	mov	w9, #384                        ; =0x180
	mov	w1, wzr
	mov	w2, #384                        ; =0x180
	smaddl	x19, w8, w9, x22
	mov	x0, x19
	bl	_csmemset
	mov	w8, #36944                      ; =0x9050
	str	w20, [x19, #380]
	ldrh	w8, [x22, x8]
	cbz	w8, LBB36_199
; %bb.198:
	add	w8, w8, #1
	adrp	x9, _social_chat@PAGE+36944
	strh	w8, [x9, _social_chat@PAGEOFF+36944]
LBB36_199:
	adrp	x8, _social_chat@PAGE+36972
	ldrh	w9, [x8, _social_chat@PAGEOFF+36972]
	cbz	w9, LBB36_201
; %bb.200:
	add	w9, w9, #1
	strh	w9, [x8, _social_chat@PAGEOFF+36972]
LBB36_201:
	adrp	x8, _social_chat@PAGE+36968
	ldrb	w8, [x8, _social_chat@PAGEOFF+36968]
	cbz	w8, LBB36_204
; %bb.202:
	adrp	x8, _social_chat@PAGE+36970
	ldrh	w9, [x8, _social_chat@PAGEOFF+36970]
	add	w9, w9, #1
	sxth	w10, w9
	cmp	w10, #96
	strh	w9, [x8, _social_chat@PAGEOFF+36970]
	b.lt	LBB36_204
; %bb.203:
Lloh697:
	adrp	x8, _social_chat@PAGE+36968
Lloh698:
	add	x8, x8, _social_chat@PAGEOFF+36968
	strb	wzr, [x8]
	strh	wzr, [x8, #4]
LBB36_204:
	mov	w9, wzr
	add	x8, x19, #66
	mov	w11, #84                        ; =0x54
Lloh699:
	adrp	x10, l_.str.30@PAGE
Lloh700:
	add	x10, x10, l_.str.30@PAGEOFF
LBB36_205:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB36_208 Depth 2
	tbnz	w11, #7, LBB36_208
; %bb.206:                              ;   in Loop: Header=BB36_205 Depth=1
	add	x10, x10, #1
	and	w12, w11, #0xff
	cmp	w12, #32
	b.hs	LBB36_209
; %bb.207:                              ;   in Loop: Header=BB36_205 Depth=1
	mov	w11, #32                        ; =0x20
	b	LBB36_212
	.p2align	4, , 8
LBB36_208:                              ;   Parent Loop BB36_205 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w10, w10, #1
	ldrsb	w11, [x10]
	cmn	w11, #64
	b.lt	LBB36_208
	b	LBB36_211
LBB36_209:                              ;   in Loop: Header=BB36_205 Depth=1
	cmp	w12, #127
	b.eq	LBB36_211
; %bb.210:                              ;   in Loop: Header=BB36_205 Depth=1
	cmp	w12, #124
	b.ne	LBB36_212
LBB36_211:                              ;   in Loop: Header=BB36_205 Depth=1
	mov	w11, #63                        ; =0x3f
LBB36_212:                              ;   in Loop: Header=BB36_205 Depth=1
	strb	w11, [x8, w9, sxtw]
	add	w12, w9, #1
	ldrb	w11, [x10]
	cbz	w11, LBB36_42
; %bb.213:                              ;   in Loop: Header=BB36_205 Depth=1
	cmp	w9, #202
	mov	w9, w12
	b.lo	LBB36_205
	b	LBB36_42
	.loh AdrpAdd	Lloh613, Lloh614
	.loh AdrpAdd	Lloh615, Lloh616
	.loh AdrpAdd	Lloh617, Lloh618
	.loh AdrpAdd	Lloh619, Lloh620
	.loh AdrpAdd	Lloh621, Lloh622
	.loh AdrpAdd	Lloh623, Lloh624
	.loh AdrpAdd	Lloh625, Lloh626
	.loh AdrpAdd	Lloh631, Lloh632
	.loh AdrpAdd	Lloh629, Lloh630
	.loh AdrpAdd	Lloh627, Lloh628
	.loh AdrpAdd	Lloh633, Lloh634
	.loh AdrpAdd	Lloh635, Lloh636
	.loh AdrpAdd	Lloh637, Lloh638
	.loh AdrpAdd	Lloh639, Lloh640
	.loh AdrpAdd	Lloh651, Lloh652
	.loh AdrpAdd	Lloh649, Lloh650
	.loh AdrpAdd	Lloh647, Lloh648
	.loh AdrpAdd	Lloh645, Lloh646
	.loh AdrpAdd	Lloh643, Lloh644
	.loh AdrpAdd	Lloh641, Lloh642
	.loh AdrpAdd	Lloh653, Lloh654
	.loh AdrpAdd	Lloh657, Lloh658
	.loh AdrpAdd	Lloh655, Lloh656
	.loh AdrpAdd	Lloh659, Lloh660
	.loh AdrpAdd	Lloh661, Lloh662
	.loh AdrpAdd	Lloh663, Lloh664
	.loh AdrpAdd	Lloh665, Lloh666
	.loh AdrpAdd	Lloh667, Lloh668
	.loh AdrpAdd	Lloh669, Lloh670
	.loh AdrpAdd	Lloh671, Lloh672
	.loh AdrpAdd	Lloh673, Lloh674
	.loh AdrpAdd	Lloh675, Lloh676
	.loh AdrpAdd	Lloh677, Lloh678
	.loh AdrpAdd	Lloh679, Lloh680
	.loh AdrpAdd	Lloh681, Lloh682
	.loh AdrpAdd	Lloh683, Lloh684
	.loh AdrpAdd	Lloh685, Lloh686
	.loh AdrpAdd	Lloh687, Lloh688
	.loh AdrpAdd	Lloh689, Lloh690
	.loh AdrpAdd	Lloh691, Lloh692
	.loh AdrpAdd	Lloh693, Lloh694
	.loh AdrpAdd	Lloh695, Lloh696
	.loh AdrpAdd	Lloh697, Lloh698
	.loh AdrpAdd	Lloh699, Lloh700
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_channel_step
_social_chat_channel_step:              ; @social_chat_channel_step
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	adrp	x20, _social_chat@PAGE+36870
	add	w8, w0, #4
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	and	w21, w8, #0xffff
	add	x29, sp, #32
	ldrsh	w8, [x20, _social_chat@PAGEOFF+36870]
	add	w8, w21, w8
	negs	w9, w8
	and	w8, w8, #0x3
	and	w9, w9, #0x3
	csneg	w19, w8, w9, mi
	mov	w0, w19
	bl	_social_chat_channel_usable
	cmp	w19, w0
	b.eq	LBB37_4
; %bb.1:
	add	w22, w19, w21
	and	w0, w22, #0x3
	and	w19, w22, #0x3
	bl	_social_chat_channel_usable
	cmp	w19, w0
	b.eq	LBB37_4
; %bb.2:
	add	w22, w22, w21
	and	w0, w22, #0x3
	and	w19, w22, #0x3
	bl	_social_chat_channel_usable
	cmp	w19, w0
	b.eq	LBB37_4
; %bb.3:
	add	w8, w22, w21
	and	w19, w8, #0x3
	mov	w0, w19
	bl	_social_chat_channel_usable
LBB37_4:
	cmp	w19, #2
	strh	w19, [x20, _social_chat@PAGEOFF+36870]
	b.ne	LBB37_7
; %bb.5:
Lloh701:
	adrp	x8, _social_chat@PAGE+39670
Lloh702:
	add	x8, x8, _social_chat@PAGEOFF+39670
	ldrsh	w9, [x8, #2]
	ldrh	w8, [x8]
	sxth	w10, w8
	cmp	w9, w10
	ccmp	w9, #0, #8, lt
	ccmp	w10, #0, #4, mi
	b.le	LBB37_7
; %bb.6:
	add	w9, w8, w9
	sdiv	w10, w9, w8
	msub	w8, w10, w8, w9
	adrp	x9, _social_chat@PAGE+39672
	strh	w8, [x9, _social_chat@PAGEOFF+39672]
LBB37_7:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh701, Lloh702
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_line_rows
_social_chat_line_rows:                 ; @social_chat_line_rows
; %bb.0:
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	w20, w1
	mov	x1, x2
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	mov	x19, x3
	mov	x21, x2
	mov	x22, x0
	bl	_social_chat_head
	mov	w8, wzr
	add	x9, x22, #66
	add	w10, w19, #28
LBB38_1:                                ; =>This Inner Loop Header: Depth=1
	add	w11, w9, w8
	ldrb	w12, [x11]
	cbz	w12, LBB38_59
; %bb.2:                                ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #28
	add	w11, w11, #1
	strh	w12, [x13]
	ldrb	w12, [x11]
	cbz	w12, LBB38_31
; %bb.3:                                ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #26
	add	w11, w9, w8
	add	w14, w11, #2
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_32
; %bb.4:                                ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #24
	add	w11, w11, #3
	strh	w12, [x13]
	ldrb	w12, [x11]
	cbz	w12, LBB38_33
; %bb.5:                                ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #22
	add	w11, w9, w8
	add	w14, w11, #4
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_34
; %bb.6:                                ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #20
	add	w11, w11, #5
	strh	w12, [x13]
	ldrb	w12, [x11]
	cbz	w12, LBB38_35
; %bb.7:                                ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #18
	add	w11, w9, w8
	add	w14, w11, #6
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_36
; %bb.8:                                ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #16
	add	w11, w11, #7
	strh	w12, [x13]
	ldrb	w12, [x11]
	cbz	w12, LBB38_37
; %bb.9:                                ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #14
	add	w11, w9, w8
	add	w14, w11, #8
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_38
; %bb.10:                               ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #12
	add	w11, w11, #9
	strh	w12, [x13]
	ldrb	w12, [x11]
	cbz	w12, LBB38_39
; %bb.11:                               ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #10
	add	w11, w9, w8
	add	w14, w11, #10
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_40
; %bb.12:                               ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #8
	add	w11, w11, #11
	strh	w12, [x13]
	ldrb	w12, [x11]
	cbz	w12, LBB38_41
; %bb.13:                               ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #6
	add	w11, w9, w8
	add	w14, w11, #12
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_42
; %bb.14:                               ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #4
	add	w11, w11, #13
	strh	w12, [x13]
	ldrb	w11, [x11]
	cbz	w11, LBB38_43
; %bb.15:                               ;   in Loop: Header=BB38_1 Depth=1
	sub	w13, w10, #2
	add	w12, w9, w8
	add	w14, w12, #14
	strh	w11, [x13]
	ldrb	w11, [x14]
	cbz	w11, LBB38_44
; %bb.16:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w12, w12, #15
	strh	w11, [x10]
	ldrb	w12, [x12]
	cbz	w12, LBB38_45
; %bb.17:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w13, w10, #2
	add	w11, w9, w8
	add	w14, w11, #16
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_46
; %bb.18:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w13, w10, #4
	add	w11, w11, #17
	strh	w12, [x13]
	ldrb	w12, [x11]
	cbz	w12, LBB38_47
; %bb.19:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w13, w10, #6
	add	w11, w9, w8
	add	w14, w11, #18
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_48
; %bb.20:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w13, w10, #8
	add	w11, w11, #19
	strh	w12, [x13]
	ldrb	w12, [x11]
	cbz	w12, LBB38_49
; %bb.21:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w13, w10, #10
	add	w11, w9, w8
	add	w14, w11, #20
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_50
; %bb.22:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w13, w10, #12
	add	w11, w11, #21
	strh	w12, [x13]
	ldrb	w12, [x11]
	cbz	w12, LBB38_51
; %bb.23:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w13, w10, #14
	add	w11, w9, w8
	add	w14, w11, #22
	strh	w12, [x13]
	ldrb	w12, [x14]
	cbz	w12, LBB38_52
; %bb.24:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w13, w10, #16
	add	w11, w11, #23
	strh	w12, [x13]
	ldrb	w11, [x11]
	cbz	w11, LBB38_53
; %bb.25:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w12, w10, #18
	add	w13, w9, w8
	add	w13, w13, #24
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB38_54
; %bb.26:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w12, w10, #20
	add	w13, w9, w8
	add	w13, w13, #25
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB38_55
; %bb.27:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w12, w10, #22
	add	w13, w9, w8
	add	w13, w13, #26
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB38_56
; %bb.28:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w12, w10, #24
	add	w13, w9, w8
	add	w13, w13, #27
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB38_57
; %bb.29:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w12, w10, #26
	add	w13, w9, w8
	add	w13, w13, #28
	strh	w11, [x12]
	ldrb	w11, [x13]
	cbz	w11, LBB38_58
; %bb.30:                               ;   in Loop: Header=BB38_1 Depth=1
	add	w12, w10, #28
	add	w8, w8, #29
	add	w10, w10, #58
	cmp	w8, #203
	strh	w11, [x12]
	b.ne	LBB38_1
	b	LBB38_59
LBB38_31:
	add	w8, w8, #1
	b	LBB38_59
LBB38_32:
	add	w8, w8, #2
	b	LBB38_59
LBB38_33:
	add	w8, w8, #3
	b	LBB38_59
LBB38_34:
	add	w8, w8, #4
	b	LBB38_59
LBB38_35:
	add	w8, w8, #5
	b	LBB38_59
LBB38_36:
	add	w8, w8, #6
	b	LBB38_59
LBB38_37:
	add	w8, w8, #7
	b	LBB38_59
LBB38_38:
	add	w8, w8, #8
	b	LBB38_59
LBB38_39:
	add	w8, w8, #9
	b	LBB38_59
LBB38_40:
	add	w8, w8, #10
	b	LBB38_59
LBB38_41:
	add	w8, w8, #11
	b	LBB38_59
LBB38_42:
	add	w8, w8, #12
	b	LBB38_59
LBB38_43:
	add	w8, w8, #13
	b	LBB38_59
LBB38_44:
	add	w8, w8, #14
	b	LBB38_59
LBB38_45:
	add	w8, w8, #15
	b	LBB38_59
LBB38_46:
	add	w8, w8, #16
	b	LBB38_59
LBB38_47:
	add	w8, w8, #17
	b	LBB38_59
LBB38_48:
	add	w8, w8, #18
	b	LBB38_59
LBB38_49:
	add	w8, w8, #19
	b	LBB38_59
LBB38_50:
	add	w8, w8, #20
	b	LBB38_59
LBB38_51:
	add	w8, w8, #21
	b	LBB38_59
LBB38_52:
	add	w8, w8, #22
	b	LBB38_59
LBB38_53:
	add	w8, w8, #23
	b	LBB38_59
LBB38_54:
	add	w8, w8, #24
	b	LBB38_59
LBB38_55:
	add	w8, w8, #25
	b	LBB38_59
LBB38_56:
	add	w8, w8, #26
	b	LBB38_59
LBB38_57:
	add	w8, w8, #27
	b	LBB38_59
LBB38_58:
	add	w8, w8, #28
LBB38_59:
	mov	x0, x21
	mov	w1, #-1                         ; =0xffffffff
	strh	wzr, [x19, w8, sxtw #1]
	bl	_social_chat_width
	ldrh	w8, [x19]
	cbz	w8, LBB38_64
; %bb.60:
	sub	w8, w20, w0
	mov	w21, #8                         ; =0x8
	sxth	w8, w8
	cmp	w8, #8
	csel	w1, w8, w21, gt
	add	x2, sp, #14
	mov	x0, x19
	bl	_social_chat_wrap
	ldrh	w8, [sp, #14]
	cmp	w0, #1
	csinc	w9, w0, wzr, gt
	add	w22, w9, w8
	sbfiz	w8, w22, #1, #16
	add	x0, x19, w8, sxtw
	ldrh	w8, [x0]
	cbz	w8, LBB38_64
; %bb.61:
	cmp	w20, #8
	add	x2, sp, #14
	csel	w20, w20, w21, gt
	mov	w1, w20
	bl	_social_chat_wrap
	ldrh	w8, [sp, #14]
	cmp	w0, #1
	csinc	w9, w0, wzr, gt
	add	w8, w22, w8
	add	w21, w8, w9
	sbfiz	w8, w21, #1, #16
	add	x0, x19, w8, sxtw
	ldrh	w8, [x0]
	cbz	w8, LBB38_66
; %bb.62:
	sxth	w20, w20
	add	x2, sp, #14
	mov	w1, w20
	bl	_social_chat_wrap
	ldrh	w8, [sp, #14]
	cmp	w0, #1
	csinc	w9, w0, wzr, gt
	add	w8, w21, w8
	add	w8, w8, w9
	sbfiz	w8, w8, #1, #16
	add	x0, x19, w8, sxtw
	ldrh	w8, [x0]
	cbz	w8, LBB38_67
; %bb.63:
	add	x2, sp, #14
	mov	w1, w20
	bl	_social_chat_wrap
	mov	w0, #4                          ; =0x4
	b	LBB38_65
LBB38_64:
	mov	w0, #1                          ; =0x1
LBB38_65:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB38_66:
	mov	w0, #2                          ; =0x2
	b	LBB38_65
LBB38_67:
	mov	w0, #3                          ; =0x3
	b	LBB38_65
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_head
_social_chat_head:                      ; @social_chat_head
; %bb.0:
	strh	wzr, [x1]
	ldrb	w8, [x0, #374]
	cbz	w8, LBB39_2
; %bb.1:
	ret
LBB39_2:
	sub	sp, sp, #64
	ldrb	w8, [x0, #375]
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	x19, x1
	mov	x20, x0
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	cbz	w8, LBB39_4
; %bb.3:
Lloh703:
	adrp	x1, l_.str.63@PAGE
Lloh704:
	add	x1, x1, l_.str.63@PAGEOFF
	b	LBB39_6
LBB39_4:
	ldrb	w8, [x20, #376]
	cbz	w8, LBB39_7
; %bb.5:
Lloh705:
	adrp	x1, l_.str.64@PAGE
Lloh706:
	add	x1, x1, l_.str.64@PAGEOFF
LBB39_6:
	mov	x0, x19
	mov	w2, #89                         ; =0x59
	bl	_ustrncpy
LBB39_7:
	strh	wzr, [x19, #178]
Lloh707:
	adrp	x9, l_.str.66@PAGE
Lloh708:
	add	x9, x9, l_.str.66@PAGEOFF
	ldrb	w8, [x20, #372]
Lloh709:
	adrp	x10, l_.str.67@PAGE
Lloh710:
	add	x10, x10, l_.str.67@PAGEOFF
Lloh711:
	adrp	x11, l_.str.65@PAGE
Lloh712:
	add	x11, x11, l_.str.65@PAGEOFF
	mov	x0, sp
	mov	w2, #7                          ; =0x7
	tst	w8, #0x1
	csel	x9, x10, x9, eq
	cmp	w8, #3
	csel	x1, x11, x9, eq
	bl	_ustrncpy
	mov	x0, x19
	strh	wzr, [sp, #14]
	bl	_ustrlen
	ldrsh	x8, [x20, #368]
Lloh713:
	adrp	x9, _social_chat_channel_tags@PAGE
Lloh714:
	add	x9, x9, _social_chat_channel_tags@PAGEOFF
	mov	w21, #89                        ; =0x59
	sub	w2, w21, w0
	mov	x0, x19
	ldr	w1, [x9, x8, lsl #2]
	bl	_ustrncat
	mov	x0, x19
	strh	wzr, [x19, #178]
	bl	_ustrlen
	cmp	w0, #88
	b.gt	LBB39_10
; %bb.8:
	add	x8, x19, w0, sxtw #1
	mov	w11, #88                        ; =0x58
	mov	w9, #91                         ; =0x5b
	add	w10, w8, #2
	sub	w2, w11, w0
	mov	x1, sp
	mov	x0, x19
	strh	w9, [x8]
	strh	wzr, [x10]
	bl	_ustrncat
	mov	x0, x19
	bl	_ustrlen
	cmp	w0, #87
	b.gt	LBB39_10
; %bb.9:
	add	x8, x19, w0, sxtw #1
	mov	w9, #93                         ; =0x5d
	mov	w10, #32                        ; =0x20
	add	w11, w8, #2
	add	w12, w8, #4
	strh	w9, [x8]
	strh	w10, [x11]
	strh	wzr, [x12]
LBB39_10:
	mov	x0, x19
	bl	_ustrlen
	sub	w2, w21, w0
	mov	x0, x19
	mov	x1, x20
	bl	_ustrncat
	ldrh	w8, [x20, #368]
	cmp	w8, #2
	b.ne	LBB39_14
; %bb.11:
	ldrb	w8, [x20, #373]
	cbz	w8, LBB39_14
; %bb.12:
	ldrh	w8, [x20, #302]
	cbz	w8, LBB39_14
; %bb.13:
	mov	x0, x19
	bl	_ustrlen
	sub	w2, w21, w0
Lloh715:
	adrp	x1, l_.str.68@PAGE
Lloh716:
	add	x1, x1, l_.str.68@PAGEOFF
	mov	x0, x19
	bl	_ustrncat
	mov	x0, x19
	bl	_ustrlen
	sub	w2, w21, w0
	add	x1, x20, #302
	mov	x0, x19
	bl	_ustrncat
LBB39_14:
	mov	x0, x19
	bl	_ustrlen
	mov	w8, #89                         ; =0x59
Lloh717:
	adrp	x1, l_.str.69@PAGE
Lloh718:
	add	x1, x1, l_.str.69@PAGEOFF
	sub	w2, w8, w0
	mov	x0, x19
	bl	_ustrncat
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh703, Lloh704
	.loh AdrpAdd	Lloh705, Lloh706
	.loh AdrpAdd	Lloh713, Lloh714
	.loh AdrpAdd	Lloh711, Lloh712
	.loh AdrpAdd	Lloh709, Lloh710
	.loh AdrpAdd	Lloh707, Lloh708
	.loh AdrpAdd	Lloh715, Lloh716
	.loh AdrpAdd	Lloh717, Lloh718
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_width
_social_chat_width:                     ; @social_chat_width
; %bb.0:
	ldrh	w9, [x0]
	cbz	w9, LBB40_10
; %bb.1:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #640
	cmp	w1, #301
	mov	w10, #301                       ; =0x12d
	mov	w8, wzr
	csel	w10, w1, w10, lt
	add	w11, w0, #2
	add	x12, sp, #36
	b	LBB40_4
	.p2align	4, , 8
LBB40_2:                                ;   in Loop: Header=BB40_4 Depth=1
	cmp	w8, #300
	b.hi	LBB40_7
LBB40_3:                                ;   in Loop: Header=BB40_4 Depth=1
	lsl	w13, w8, #1
	add	w14, w12, w13
	add	w13, w11, w13
	add	w8, w8, #1
	strh	w9, [x14]
	ldrh	w9, [x13]
	cbz	w9, LBB40_7
LBB40_4:                                ; =>This Inner Loop Header: Depth=1
	cmn	w1, #1
	b.eq	LBB40_2
; %bb.5:                                ;   in Loop: Header=BB40_4 Depth=1
	cmp	w8, w10
	b.lt	LBB40_3
; %bb.6:
	add	x9, sp, #36
	add	w9, w9, w8, lsl #1
	strh	wzr, [x9]
	cbnz	w8, LBB40_8
	b	LBB40_9
LBB40_7:
	add	x9, sp, #36
	strh	wzr, [x9, w8, sxtw #1]
LBB40_8:
	mov	x8, #140733193388032            ; =0x7fff00000000
	add	x0, sp, #24
	movk	x8, #32767, lsl #48
	add	x1, sp, #36
	add	x2, sp, #16
	add	x3, sp, #8
	str	x8, [sp, #24]
	bl	_draw_unicode_string_compute_bounds
	ldrh	w8, [sp, #10]
LBB40_9:
	add	sp, sp, #640
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	sxth	w0, w8
	ret
LBB40_10:
	sxth	w0, wzr
	ret
                                        ; -- End function
	.p2align	4                               ; -- Begin function social_chat_wrap
_social_chat_wrap:                      ; @social_chat_wrap
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	mov	w21, w1
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	x19, x2
	mov	x20, x0
	mov	w8, wzr
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	strh	wzr, [x2]
	.p2align	4, , 8
LBB41_1:                                ; =>This Inner Loop Header: Depth=1
	mov	w24, w8
	sxth	x8, w24
	ldrh	w9, [x20, x8, lsl #1]
	add	w8, w24, #1
	cbnz	w9, LBB41_1
; %bb.2:
	tst	w24, #0xffff
	b.eq	LBB41_10
; %bb.3:
	mov	x0, x20
	mov	w1, #-1                         ; =0xffffffff
	bl	_social_chat_width
	cmp	w0, w21
	b.le	LBB41_16
; %bb.4:
	mov	w23, #1                         ; =0x1
	sxth	w8, w24
	cmp	w8, #2
	b.lt	LBB41_7
	.p2align	4, , 8
LBB41_5:                                ; =>This Inner Loop Header: Depth=1
	sxth	w8, w23
	mov	x0, x20
	add	w8, w8, w24, sxth
	add	w8, w8, #1
	add	w8, w8, w8, lsr #31
	asr	w22, w8, #1
	mov	w1, w22
	bl	_social_chat_width
	sub	w8, w22, #1
	cmp	w0, w21
	csel	w9, w23, w22, gt
	csel	w8, w8, w24, gt
	sxth	w23, w9
	sxth	w24, w8
	cmp	w23, w24
	b.lt	LBB41_5
; %bb.6:
	cmp	w23, #1
	b.lt	LBB41_12
LBB41_7:
	mov	w8, w23
	.p2align	4, , 8
LBB41_8:                                ; =>This Inner Loop Header: Depth=1
	and	x9, x8, #0xffff
	ldrh	w9, [x20, x9, lsl #1]
	cmp	w9, #32
	b.eq	LBB41_11
; %bb.9:                                ;   in Loop: Header=BB41_8 Depth=1
	sub	w9, w8, #1
	sxth	w10, w8
	mov	w8, w9
	cmp	w10, #1
	b.gt	LBB41_8
	b	LBB41_12
LBB41_10:
	mov	w24, wzr
	b	LBB41_16
LBB41_11:
	mov	w23, w8
LBB41_12:
	ldrsh	w9, [x19]
	add	w8, w20, w23, sxth #1
	add	w10, w8, w9, lsl #1
	ldrh	w10, [x10]
	cmp	w10, #32
	b.ne	LBB41_15
; %bb.13:
	and	w9, w9, #0xffff
	.p2align	4, , 8
LBB41_14:                               ; =>This Inner Loop Header: Depth=1
	add	w9, w9, #1
	add	w10, w8, w9, sxth #1
	strh	w9, [x19]
	ldrh	w10, [x10]
	cmp	w10, #32
	b.eq	LBB41_14
LBB41_15:
	mov	w24, w23
LBB41_16:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	sxth	w0, w24
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.section	__DATA,__data
	.p2align	2, 0x0                          ; @social_chat_replaces_upstream.read_at
_social_chat_replaces_upstream.read_at:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_social_chat_replaces_upstream.on,1,0 ; @social_chat_replaces_upstream.on
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"social.chat"

.zerofill __DATA,__bss,_social_chat_keyboard,32,2 ; @social_chat_keyboard
.zerofill __DATA,__bss,_social_chat_player,1620,2 ; @social_chat_player
l_.str.1:                               ; @.str.1
	.asciz	"social chat notice: %s"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @social_chat
_social_chat:
	.space	36864
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	0                               ; 0x0
	.short	65535                           ; 0xffff
	.space	2
	.long	0                               ; 0x0
	.space	64
	.short	0                               ; 0x0
	.space	2
	.long	0                               ; 0x0
	.space	8
	.short	0                               ; 0x0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.long	0                               ; 0x0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.long	0                               ; 0x0
	.short	0                               ; 0x0
	.space	2688
	.short	0                               ; 0x0
	.short	0                               ; 0x0
	.space	4224
	.short	0                               ; 0x0
	.space	2112
	.short	0                               ; 0x0
	.space	24
	.byte	0                               ; 0x0
	.byte	0                               ; 0x0
	.long	0                               ; 0x0
	.long	0                               ; 0x0
	.long	0
	.space	204
	.long	0                               ; 0x0
	.byte	0                               ; 0x0
	.space	3
	.long	0                               ; 0x0
	.space	24
	.space	49152

	.p2align	2, 0x0                          ; @social_chat_shown.read_at
_social_chat_shown.read_at:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_social_chat_shown.shown,1,0 ; @social_chat_shown.shown
	.section	__TEXT,__cstring,cstring_literals
l_.str.3:                               ; @.str.3
	.asciz	"display.text_chat"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @social_chat_private_heard.read_at
_social_chat_private_heard.read_at:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_social_chat_private_heard.heard,1,0 ; @social_chat_private_heard.heard
	.section	__TEXT,__cstring,cstring_literals
l_.str.4:                               ; @.str.4
	.asciz	"social.private_chat"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @social_chat_global_everywhere.read_at
_social_chat_global_everywhere.read_at:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_social_chat_global_everywhere.everywhere,1,0 ; @social_chat_global_everywhere.everywhere
	.section	__TEXT,__cstring,cstring_literals
l_.str.5:                               ; @.str.5
	.asciz	"social.global_everywhere"

l_.str.6:                               ; @.str.6
	.asciz	"social.friends"

.zerofill __DATA,__bss,_social_chat_hits,50,1 ; @social_chat_hits
	.section	__DATA,__const
	.p2align	2, 0x0                          ; @social_chat_symbols
_social_chat_symbols:
	.long	l_.str.8
	.long	l_.str.9
	.long	l_.str.10
	.long	l_.str.11

	.p2align	2, 0x0                          ; @social_chat_letters
_social_chat_letters:
	.long	l_.str.8
	.long	l_.str.12
	.long	l_.str.13
	.long	l_.str.14

	.section	__TEXT,__cstring,cstring_literals
l_.str.8:                               ; @.str.8
	.asciz	"1234567890"

l_.str.9:                               ; @.str.9
	.asciz	"!@#$%^&*()"

l_.str.10:                              ; @.str.10
	.asciz	"-_=+[]{};:"

l_.str.11:                              ; @.str.11
	.asciz	"\"'<>/\\?~,."

l_.str.12:                              ; @.str.12
	.asciz	"qwertyuiop"

l_.str.13:                              ; @.str.13
	.asciz	"asdfghjkl'"

l_.str.14:                              ; @.str.14
	.asciz	"zxcvbnm,.?"

l_.str.15:                              ; @.str.15
	.asciz	"Still sending the last line: try again"

l_.str.16:                              ; @.str.16
	.asciz	"No one to write to: pick a player with Up and Down"

l_.str.17:                              ; @.str.17
	.asciz	"channel"

l_.str.18:                              ; @.str.18
	.asciz	"match"

l_.str.19:                              ; @.str.19
	.asciz	"team"

l_.str.20:                              ; @.str.20
	.asciz	"private"

l_.str.21:                              ; @.str.21
	.asciz	"global"

l_.str.22:                              ; @.str.22
	.asciz	"text"

l_.str.23:                              ; @.str.23
	.asciz	"name"

l_.str.24:                              ; @.str.24
	.asciz	"room"

l_.str.25:                              ; @.str.25
	.asciz	"to"

l_.str.26:                              ; @.str.26
	.asciz	"/chat/messages"

l_.str.27:                              ; @.str.27
	.asciz	"No one can hear that channel here"

l_.str.28:                              ; @.str.28
	.asciz	"The fork's chat is offline: ONLINE is off (community.enabled)"

l_.str.29:                              ; @.str.29
	.asciz	"The fork's chat is off (social.enabled, social.chat)"

l_.str.30:                              ; @.str.30
	.asciz	"The fork's chat has not signed in yet: the server did not answer"

l_.str.31:                              ; @.str.31
	.asciz	"The fork's chat is busy: try again"

l_.str.32:                              ; @.str.32
	.asciz	"g:%08lx%08lx"

l_.str.33:                              ; @.str.33
	.asciz	"The fork's chat could not be reached"

l_.str.34:                              ; @.str.34
	.asciz	"Too many lines at once: wait a moment"

l_.str.35:                              ; @.str.35
	.asciz	"That player's account was not found"

l_.str.36:                              ; @.str.36
	.asciz	"private_off"

l_.str.37:                              ; @.str.37
	.asciz	"That player takes no private lines"

l_.str.38:                              ; @.str.38
	.asciz	"own_friends_only"

l_.str.39:                              ; @.str.39
	.asciz	"You take private lines from friends alone, so you write to friends alone"

l_.str.40:                              ; @.str.40
	.asciz	"friends_only"

l_.str.41:                              ; @.str.41
	.asciz	"That player takes private lines from friends alone"

l_.str.42:                              ; @.str.42
	.asciz	"\"blocked\""

l_.str.43:                              ; @.str.43
	.asciz	"You blocked that player: unblock them in Social to write to them"

l_.str.44:                              ; @.str.44
	.asciz	"That player cannot be written to"

l_.str.45:                              ; @.str.45
	.asciz	"The fork's chat refused the line"

l_.str.46:                              ; @.str.46
	.asciz	"data"

l_.str.47:                              ; @.str.47
	.asciz	"cursor"

l_.str.48:                              ; @.str.48
	.asciz	"friends"

l_.str.49:                              ; @.str.49
	.asciz	"members"

l_.str.50:                              ; @.str.50
	.asciz	"code"

l_.str.51:                              ; @.str.51
	.asciz	"messages"

l_.str.52:                              ; @.str.52
	.asciz	"reported"

l_.str.53:                              ; @.str.53
	.asciz	"from"

l_.str.54:                              ; @.str.54
	.asciz	"toName"

l_.str.55:                              ; @.str.55
	.asciz	"/chat/messages?after=%ld&global=%d&reported=%d"

l_.str.56:                              ; @.str.56
	.asciz	"&room=%s"

l_.str.57:                              ; @.str.57
	.asciz	"&team=%d"

l_.str.58:                              ; @.str.58
	.asciz	"&name="

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @social_chat_reported_shown.read_at
_social_chat_reported_shown.read_at:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_social_chat_reported_shown.shown,1,0 ; @social_chat_reported_shown.shown
	.section	__TEXT,__cstring,cstring_literals
l_.str.59:                              ; @.str.59
	.asciz	"social.show_reported"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @social_chat_global_heard.read_at
_social_chat_global_heard.read_at:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_social_chat_global_heard.heard,1,0 ; @social_chat_global_heard.heard
	.section	__TEXT,__cstring,cstring_literals
l_.str.60:                              ; @.str.60
	.asciz	"social.global_chat"

l_.str.61:                              ; @.str.61
	.asciz	"%%%02X"

l_.str.62:                              ; @.str.62
	.asciz	"ui\\small_ui"

	.section	__TEXT,__ustring
	.p2align	1, 0x0                          ; @.str.63
l_.str.63:
	.short	91                              ; 0x5b
	.short	82                              ; 0x52
	.short	69                              ; 0x45
	.short	80                              ; 0x50
	.short	79                              ; 0x4f
	.short	82                              ; 0x52
	.short	84                              ; 0x54
	.short	69                              ; 0x45
	.short	68                              ; 0x44
	.short	93                              ; 0x5d
	.short	32                              ; 0x20
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.64
l_.str.64:
	.short	91                              ; 0x5b
	.short	78                              ; 0x4e
	.short	79                              ; 0x4f
	.short	84                              ; 0x54
	.short	32                              ; 0x20
	.short	83                              ; 0x53
	.short	69                              ; 0x45
	.short	78                              ; 0x4e
	.short	84                              ; 0x54
	.short	93                              ; 0x5d
	.short	32                              ; 0x20
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.65
l_.str.65:
	.short	85                              ; 0x55
	.short	43                              ; 0x2b
	.short	70                              ; 0x46
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.66
l_.str.66:
	.short	85                              ; 0x55
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.67
l_.str.67:
	.short	70                              ; 0x46
	.short	0                               ; 0x0

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @social_chat_channel_tags
_social_chat_channel_tags:
	.long	l_.str.70
	.long	l_.str.71
	.long	l_.str.72
	.long	l_.str.73

	.section	__TEXT,__ustring
	.p2align	1, 0x0                          ; @.str.68
l_.str.68:
	.short	32                              ; 0x20
	.short	62                              ; 0x3e
	.short	32                              ; 0x20
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.69
l_.str.69:
	.short	58                              ; 0x3a
	.short	32                              ; 0x20
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.70
l_.str.70:
	.space	2

	.p2align	1, 0x0                          ; @.str.71
l_.str.71:
	.short	91                              ; 0x5b
	.short	84                              ; 0x54
	.short	69                              ; 0x45
	.short	65                              ; 0x41
	.short	77                              ; 0x4d
	.short	93                              ; 0x5d
	.short	32                              ; 0x20
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.72
l_.str.72:
	.short	91                              ; 0x5b
	.short	80                              ; 0x50
	.short	77                              ; 0x4d
	.short	93                              ; 0x5d
	.short	32                              ; 0x20
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.73
l_.str.73:
	.short	91                              ; 0x5b
	.short	71                              ; 0x47
	.short	76                              ; 0x4c
	.short	79                              ; 0x4f
	.short	66                              ; 0x42
	.short	65                              ; 0x41
	.short	76                              ; 0x4c
	.short	93                              ; 0x5d
	.short	32                              ; 0x20
	.short	0                               ; 0x0

	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @social_chat_open_draw.blue
_social_chat_open_draw.blue:
	.long	0x3f800000                      ; float 1
	.long	0x3e20a0a1                      ; float 0.156862751
	.long	0x3f169697                      ; float 0.588235319
	.long	0x3f800000                      ; float 1

	.p2align	2, 0x0                          ; @social_chat_open_draw.grey
_social_chat_open_draw.grey:
	.long	0x3f800000                      ; float 1
	.long	0x3f0ccccd                      ; float 0.550000012
	.long	0x3f0ccccd                      ; float 0.550000012
	.long	0x3f0ccccd                      ; float 0.550000012

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @social_chat_channel_names
_social_chat_channel_names:
	.long	l_.str.79
	.long	l_.str.80
	.long	l_.str.81
	.long	l_.str.82

	.section	__TEXT,__ustring
	.p2align	1, 0x0                          ; @.str.74
l_.str.74:
	.short	84                              ; 0x54
	.short	79                              ; 0x4f
	.short	58                              ; 0x3a
	.short	32                              ; 0x20
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.75
l_.str.75:
	.short	110                             ; 0x6e
	.short	111                             ; 0x6f
	.short	32                              ; 0x20
	.short	111                             ; 0x6f
	.short	110                             ; 0x6e
	.short	101                             ; 0x65
	.short	32                              ; 0x20
	.short	121                             ; 0x79
	.short	101                             ; 0x65
	.short	116                             ; 0x74
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.77
l_.str.77:
	.short	62                              ; 0x3e
	.short	32                              ; 0x20
	.short	0                               ; 0x0

	.section	__TEXT,__cstring,cstring_literals
l_.str.79:                              ; @.str.79
	.asciz	"MATCH"

l_.str.80:                              ; @.str.80
	.asciz	"TEAM"

l_.str.81:                              ; @.str.81
	.asciz	"PRIVATE"

l_.str.82:                              ; @.str.82
	.asciz	"GLOBAL"

	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @social_chat_player_draw.blue
_social_chat_player_draw.blue:
	.long	0x3f800000                      ; float 1
	.long	0x3e20a0a1                      ; float 0.156862751
	.long	0x3f169697                      ; float 0.588235319
	.long	0x3f800000                      ; float 1

	.p2align	2, 0x0                          ; @social_chat_player_draw.grey
_social_chat_player_draw.grey:
	.long	0x3f800000                      ; float 1
	.long	0x3f266666                      ; float 0.649999976
	.long	0x3f266666                      ; float 0.649999976
	.long	0x3f266666                      ; float 0.649999976

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @social_chat_player_draw.labels
_social_chat_player_draw.labels:
	.long	l_.str.83
	.long	l_.str.84
	.long	l_.str.85
	.long	l_.str.86
	.long	l_.str.87
	.long	l_.str.88
	.long	l_.str.89
	.long	l_.str.87

	.section	__TEXT,__cstring,cstring_literals
l_.str.83:                              ; @.str.83
	.asciz	"SEND PRIVATE MESSAGE"

l_.str.84:                              ; @.str.84
	.asciz	"ADD FRIEND"

l_.str.85:                              ; @.str.85
	.asciz	"VIEW PROFILE"

l_.str.86:                              ; @.str.86
	.asciz	"MUTE"

l_.str.87:                              ; @.str.87
	.asciz	"UNMUTE"

l_.str.88:                              ; @.str.88
	.asciz	"REPORT"

l_.str.89:                              ; @.str.89
	.asciz	"MUTE IN THIS MATCH"

l_.str.91:                              ; @.str.91
	.asciz	"Asking the server..."

l_.str.93:                              ; @.str.93
	.asciz	"%s"

l_.str.94:                              ; @.str.94
	.asciz	"REPORT: AGAIN TO SEND"

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @social_chat_keyboard_draw.wide_labels
_social_chat_keyboard_draw.wide_labels:
	.long	l_.str.95
	.long	l_.str.96
	.long	l_.str.97
	.long	l_.str.98
	.long	l_.str.99

	.section	__TEXT,__ustring
	.p2align	1, 0x0                          ; @.str.95
l_.str.95:
	.short	83                              ; 0x53
	.short	72                              ; 0x48
	.short	73                              ; 0x49
	.short	70                              ; 0x46
	.short	84                              ; 0x54
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.96
l_.str.96:
	.short	35                              ; 0x23
	.short	43                              ; 0x2b
	.short	61                              ; 0x3d
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.97
l_.str.97:
	.short	83                              ; 0x53
	.short	80                              ; 0x50
	.short	65                              ; 0x41
	.short	67                              ; 0x43
	.short	69                              ; 0x45
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.98
l_.str.98:
	.short	68                              ; 0x44
	.short	69                              ; 0x45
	.short	76                              ; 0x4c
	.short	0                               ; 0x0

	.p2align	1, 0x0                          ; @.str.99
l_.str.99:
	.short	83                              ; 0x53
	.short	69                              ; 0x45
	.short	78                              ; 0x4e
	.short	68                              ; 0x44
	.short	0                               ; 0x0

	.section	__TEXT,__literal16,16byte_literals
	.p2align	2, 0x0                          ; @switch.table.social_chat_draw_in
l_switch.table.social_chat_draw_in:
	.long	0x3f5c28f6                      ; float 0.860000014
	.long	0x3eae147b                      ; float 0.340000004
	.long	0x3f6e147b                      ; float 0.930000007
	.long	0x3f0ccccd                      ; float 0.550000012

	.p2align	2, 0x0                          ; @switch.table.social_chat_draw_in.100
l_switch.table.social_chat_draw_in.100:
	.long	0x3ea3d70a                      ; float 0.319999993
	.long	0x3f028f5c                      ; float 0.50999999
	.long	0x3f51eb85                      ; float 0.819999992
	.long	0x3f59999a                      ; float 0.850000023

	.p2align	2, 0x0                          ; @switch.table.social_chat_draw_in.101
l_switch.table.social_chat_draw_in.101:
	.long	0x3e8f5c29                      ; float 0.280000001
	.long	0x3f5c28f6                      ; float 0.860000014
	.long	0x3ee66666                      ; float 0.449999988
	.long	0x3f0ccccd                      ; float 0.550000012

.subsections_via_symbols
