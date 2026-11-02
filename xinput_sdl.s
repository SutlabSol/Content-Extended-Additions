	.watchos_version_min 2, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_D3DDevice_SetRenderState       ; -- Begin function D3DDevice_SetRenderState
	.weak_definition	_D3DDevice_SetRenderState
	.p2align	4
_D3DDevice_SetRenderState:              ; @D3DDevice_SetRenderState
; %bb.0:
	cmp	w0, #81
	b.hi	LBB0_3
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
Lloh0:
	adrp	x8, _D3DSIMPLERENDERSTATEENCODE@GOTPAGE
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	mov	w20, w0
	add	x29, sp, #16
	mov	w19, w1
Lloh1:
	ldr	w8, [x8, _D3DSIMPLERENDERSTATEENCODE@GOTPAGEOFF]
	ldr	w8, [x8, w0, sxtw #2]
	mov	w0, w8
	bl	_D3DDevice_SetRenderState_Simple
Lloh2:
	adrp	x8, _D3D__RenderState@GOTPAGE
Lloh3:
	ldr	w8, [x8, _D3D__RenderState@GOTPAGEOFF]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	str	w19, [x8, w20, sxtw #2]
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
LBB0_2:
	ret
LBB0_3:
	cmp	w0, #115
	b.hi	LBB0_5
; %bb.4:
	b	_D3DDevice_SetRenderState_Deferred
LBB0_5:
	sub	w8, w0, #116
	cmp	w8, #27
	b.hi	LBB0_2
; %bb.6:
Lloh4:
	adrp	x9, LJTI0_0@PAGE
Lloh5:
	add	x9, x9, LJTI0_0@PAGEOFF
	adr	x10, LBB0_7
	ldrb	w11, [x9, x8]
	add	x10, x10, x11, lsl #2
	br	x10
LBB0_7:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_PSTextureModes
LBB0_8:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_DoNotCullUncompressed
LBB0_9:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_MultiSampleAntiAlias
LBB0_10:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_LogicOp
LBB0_11:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_CullMode
LBB0_12:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_BackFillMode
LBB0_13:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_TextureFactor
LBB0_14:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_StencilFail
LBB0_15:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_RopZCmpAlwaysRead
LBB0_16:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_StencilCullEnable
LBB0_17:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_FogColor
LBB0_18:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_EdgeAntiAlias
LBB0_19:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_FillMode
LBB0_20:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_ZEnable
LBB0_21:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_VertexBlend
LBB0_22:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_MultiSampleMask
LBB0_23:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_LineWidth
LBB0_24:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_TwoSidedLighting
LBB0_25:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_Dxt1NoiseEnable
LBB0_26:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_ZBias
LBB0_27:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_NormalizeNormals
LBB0_28:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_MultiSampleType
LBB0_29:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_FrontFace
LBB0_30:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_StencilEnable
LBB0_31:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_YuvEnable
LBB0_32:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_ShadowFunc
LBB0_33:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_OcclusionCullEnable
LBB0_34:
	mov	w0, w1
	b	_D3DDevice_SetRenderState_RopZRead
	.loh AdrpLdrGot	Lloh2, Lloh3
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpAdd	Lloh4, Lloh5
	.section	__TEXT,__const
LJTI0_0:
	.byte	(LBB0_7-LBB0_7)>>2
	.byte	(LBB0_21-LBB0_7)>>2
	.byte	(LBB0_17-LBB0_7)>>2
	.byte	(LBB0_19-LBB0_7)>>2
	.byte	(LBB0_12-LBB0_7)>>2
	.byte	(LBB0_24-LBB0_7)>>2
	.byte	(LBB0_27-LBB0_7)>>2
	.byte	(LBB0_20-LBB0_7)>>2
	.byte	(LBB0_30-LBB0_7)>>2
	.byte	(LBB0_14-LBB0_7)>>2
	.byte	(LBB0_29-LBB0_7)>>2
	.byte	(LBB0_11-LBB0_7)>>2
	.byte	(LBB0_13-LBB0_7)>>2
	.byte	(LBB0_26-LBB0_7)>>2
	.byte	(LBB0_10-LBB0_7)>>2
	.byte	(LBB0_18-LBB0_7)>>2
	.byte	(LBB0_9-LBB0_7)>>2
	.byte	(LBB0_22-LBB0_7)>>2
	.byte	(LBB0_28-LBB0_7)>>2
	.byte	(LBB0_32-LBB0_7)>>2
	.byte	(LBB0_23-LBB0_7)>>2
	.byte	(LBB0_25-LBB0_7)>>2
	.byte	(LBB0_31-LBB0_7)>>2
	.byte	(LBB0_33-LBB0_7)>>2
	.byte	(LBB0_16-LBB0_7)>>2
	.byte	(LBB0_15-LBB0_7)>>2
	.byte	(LBB0_34-LBB0_7)>>2
	.byte	(LBB0_8-LBB0_7)>>2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_D3DXMatrixIdentity             ; -- Begin function D3DXMatrixIdentity
	.weak_definition	_D3DXMatrixIdentity
	.p2align	4
_D3DXMatrixIdentity:                    ; @D3DXMatrixIdentity
; %bb.0:
	mov	w8, #1065353216                 ; =0x3f800000
	stur	xzr, [x0, #12]
	stur	xzr, [x0, #4]
	stp	xzr, xzr, [x0, #24]
	str	w8, [x0]
	str	w8, [x0, #20]
	str	w8, [x0, #40]
	stur	xzr, [x0, #52]
	stur	xzr, [x0, #44]
	str	w8, [x0, #60]
	ret
                                        ; -- End function
	.globl	_halo_linux_mouse_look          ; -- Begin function halo_linux_mouse_look
	.p2align	4
_halo_linux_mouse_look:                 ; @halo_linux_mouse_look
; %bb.0:
	str	wzr, [x1]
	str	wzr, [x2]
	cbz	w0, LBB2_2
; %bb.1:
	mov	w0, wzr
	ret
LBB2_2:
	stp	d11, d10, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	adrp	x19, _halo_linux_mouse_look.read_at@PAGE
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	mov	x20, x1
	stp	d9, d8, [sp, #16]               ; 16-byte Folded Spill
	mov	x21, x2
	ldr	w22, [x19, _halo_linux_mouse_look.read_at@PAGEOFF]
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	bl	_config_changes
	cmp	w22, w0
	b.eq	LBB2_4
; %bb.3:
	bl	_config_changes
	str	w0, [x19, _halo_linux_mouse_look.read_at@PAGEOFF]
Lloh6:
	adrp	x0, l_.str@PAGE
Lloh7:
	add	x0, x0, l_.str@PAGEOFF
	bl	_config_boolean
	adrp	x8, _halo_linux_mouse_look.invert@PAGE
	str	w0, [x8, _halo_linux_mouse_look.invert@PAGEOFF]
LBB2_4:
Lloh8:
	adrp	x19, _mouse_lock@PAGE
Lloh9:
	add	x19, x19, _mouse_lock@PAGEOFF
	mov	x0, x19
	bl	_pthread_mutex_lock
	adrp	x8, _mouse_pending_x@PAGE
	adrp	x9, _mouse_pending_y@PAGE
	adrp	x10, _mouse_polls_unconsumed@PAGE
	mov	x0, x19
	ldr	s9, [x8, _mouse_pending_x@PAGEOFF]
	ldr	s8, [x9, _mouse_pending_y@PAGEOFF]
	str	wzr, [x8, _mouse_pending_x@PAGEOFF]
	str	wzr, [x9, _mouse_pending_y@PAGEOFF]
	str	wzr, [x10, _mouse_polls_unconsumed@PAGEOFF]
	bl	_pthread_mutex_unlock
	fcmp	s9, #0.0
	b.ne	LBB2_6
; %bb.5:
	fcmp	s8, #0.0
	b.eq	LBB2_7
LBB2_6:
	bl	_overlay_menu_open
	cbz	w0, LBB2_9
LBB2_7:
	mov	w0, wzr
LBB2_8:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp], #80             ; 16-byte Folded Reload
	ret
LBB2_9:
	mov	w8, #11744                      ; =0x2de0
	adrp	x19, _mouse_sensitivity.read_at@PAGE
	movk	w8, #47888, lsl #16
	ldr	w22, [x19, _mouse_sensitivity.read_at@PAGEOFF]
	fmov	s0, w8
	fmul	s9, s9, s0
	bl	_config_changes
	cmp	w22, w0
	b.ne	LBB2_11
; %bb.10:
Lloh10:
	adrp	x8, _mouse_sensitivity.sensitivity@PAGE
Lloh11:
	adrp	x9, _vertical_sensitivity@PAGE
Lloh12:
	ldr	s0, [x8, _mouse_sensitivity.sensitivity@PAGEOFF]
Lloh13:
	ldr	s1, [x9, _vertical_sensitivity@PAGEOFF]
	b	LBB2_13
LBB2_11:
	bl	_config_changes
	str	w0, [x19, _mouse_sensitivity.read_at@PAGEOFF]
Lloh14:
	adrp	x0, l_.str.10@PAGE
Lloh15:
	add	x0, x0, l_.str.10@PAGEOFF
	bl	_config_real
	mov	x8, #3931642474694443008        ; =0x3690000000000000
	fcvt	s1, d0
	adrp	x19, _mouse_sensitivity.sensitivity@PAGE
Lloh16:
	adrp	x0, l_.str.11@PAGE
Lloh17:
	add	x0, x0, l_.str.11@PAGEOFF
	fmov	d10, x8
	fcmp	d0, d10
	fmov	s0, #1.00000000
	fcsel	s0, s1, s0, hi
	str	s0, [x19, _mouse_sensitivity.sensitivity@PAGEOFF]
	bl	_config_real
	fcvt	s1, d0
	adrp	x8, _vertical_sensitivity@PAGE
	fcmp	d0, d10
	ldr	s0, [x19, _mouse_sensitivity.sensitivity@PAGEOFF]
	str	s1, [x8, _vertical_sensitivity@PAGEOFF]
	b.hi	LBB2_13
; %bb.12:
	fmov	s1, s0
	str	s0, [x8, _vertical_sensitivity@PAGEOFF]
LBB2_13:
	fmul	s0, s9, s0
Lloh18:
	adrp	x8, _halo_linux_mouse_look.invert@PAGE
	mov	w0, #1                          ; =0x1
	str	s0, [x20]
	fneg	s0, s8
Lloh19:
	ldr	w8, [x8, _halo_linux_mouse_look.invert@PAGEOFF]
	cmp	w8, #0
	mov	w8, #11744                      ; =0x2de0
	movk	w8, #15120, lsl #16
	fcsel	s0, s0, s8, eq
	fmov	s2, w8
	fmul	s3, s0, s2
	fmul	s0, s1, s3
	str	s0, [x21]
	b	LBB2_8
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpLdr	Lloh11, Lloh13
	.loh AdrpLdr	Lloh10, Lloh12
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpLdr	Lloh18, Lloh19
                                        ; -- End function
	.globl	_halo_chat_pad_buttons_for_port ; -- Begin function halo_chat_pad_buttons_for_port
	.p2align	4
_halo_chat_pad_buttons_for_port:        ; @halo_chat_pad_buttons_for_port
; %bb.0:
	cmp	w0, #3
	b.hi	LBB3_2
; %bb.1:
Lloh20:
	adrp	x8, _chat_physical_pad@PAGE
Lloh21:
	add	x8, x8, _chat_physical_pad@PAGEOFF
	ldr	w0, [x8, w0, sxtw #2]
	ret
LBB3_2:
	mov	w0, wzr
	ret
	.loh AdrpAdd	Lloh20, Lloh21
                                        ; -- End function
	.globl	_halo_chat_pad_buttons          ; -- Begin function halo_chat_pad_buttons
	.p2align	4
_halo_chat_pad_buttons:                 ; @halo_chat_pad_buttons
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	bl	_network_chat_controller
	cmp	w0, #4
Lloh22:
	adrp	x9, _chat_pad@PAGE
Lloh23:
	add	x9, x9, _chat_pad@PAGEOFF
	csel	w8, w0, wzr, lo
	ldr	w0, [x9, w8, sxtw #2]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh22, Lloh23
                                        ; -- End function
	.globl	_halo_chat_taps                 ; -- Begin function halo_chat_taps
	.p2align	4
_halo_chat_taps:                        ; @halo_chat_taps
; %bb.0:
	b	_touch_input_chat_taps
                                        ; -- End function
	.globl	_halo_chat_wheel_steps          ; -- Begin function halo_chat_wheel_steps
	.p2align	4
_halo_chat_wheel_steps:                 ; @halo_chat_wheel_steps
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
Lloh24:
	adrp	x19, _mouse_lock@PAGE
Lloh25:
	add	x19, x19, _mouse_lock@PAGEOFF
	mov	x0, x19
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	bl	_pthread_mutex_lock
	adrp	x8, _chat_wheel_steps@PAGE
	mov	x0, x19
	ldr	w20, [x8, _chat_wheel_steps@PAGEOFF]
	str	wzr, [x8, _chat_wheel_steps@PAGEOFF]
	bl	_pthread_mutex_unlock
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	mov	w0, w20
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh24, Lloh25
                                        ; -- End function
	.globl	_halo_chat_touch_layout         ; -- Begin function halo_chat_touch_layout
	.p2align	4
_halo_chat_touch_layout:                ; @halo_chat_touch_layout
; %bb.0:
	mov	w0, #1                          ; =0x1
	ret
                                        ; -- End function
	.globl	_halo_system_keyboard           ; -- Begin function halo_system_keyboard
	.p2align	4
_halo_system_keyboard:                  ; @halo_system_keyboard
; %bb.0:
	b	_touch_input_screen_buttons
                                        ; -- End function
	.globl	_halo_system_keyboard_again     ; -- Begin function halo_system_keyboard_again
	.p2align	4
_halo_system_keyboard_again:            ; @halo_system_keyboard_again
; %bb.0:
	adrp	x8, _system_keyboard_requests@PAGE
	ldr	w9, [x8, _system_keyboard_requests@PAGEOFF]
	add	w9, w9, #1
	str	w9, [x8, _system_keyboard_requests@PAGEOFF]
	ret
                                        ; -- End function
	.globl	_halo_gamepad_last_used         ; -- Begin function halo_gamepad_last_used
	.p2align	4
_halo_gamepad_last_used:                ; @halo_gamepad_last_used
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
Lloh26:
	adrp	x19, _mouse_lock@PAGE
Lloh27:
	add	x19, x19, _mouse_lock@PAGEOFF
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	mov	x0, x19
	add	x29, sp, #32
	bl	_pthread_mutex_lock
Lloh28:
	adrp	x8, _pad_used_ms@PAGE
Lloh29:
	adrp	x9, _stick_aimed_ms@PAGE
Lloh30:
	adrp	x10, _keyboard_used_ms@PAGE
Lloh31:
	adrp	x11, _mouse_aimed_ms@PAGE
	mov	x0, x19
Lloh32:
	ldr	x8, [x8, _pad_used_ms@PAGEOFF]
Lloh33:
	ldr	x9, [x9, _stick_aimed_ms@PAGEOFF]
Lloh34:
	ldr	x10, [x10, _keyboard_used_ms@PAGEOFF]
Lloh35:
	ldr	x11, [x11, _mouse_aimed_ms@PAGEOFF]
	cmp	x8, x9
	csel	x20, x8, x9, hi
	cmp	x10, x11
	csel	x21, x10, x11, hi
	bl	_pthread_mutex_unlock
	cmp	x20, #0
	ccmp	x20, x21, #0, ne
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	cset	w0, hi
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpLdr	Lloh31, Lloh35
	.loh AdrpLdr	Lloh30, Lloh34
	.loh AdrpLdr	Lloh29, Lloh33
	.loh AdrpLdr	Lloh28, Lloh32
	.loh AdrpAdd	Lloh26, Lloh27
                                        ; -- End function
	.globl	_halo_linux_touch_move          ; -- Begin function halo_linux_touch_move
	.p2align	4
_halo_linux_touch_move:                 ; @halo_linux_touch_move
; %bb.0:
	mov	w8, w0
	mov	w0, wzr
	str	wzr, [x1]
	str	wzr, [x2]
	cbz	w8, LBB11_2
; %bb.1:
	ret
LBB11_2:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	mov	x20, x1
	mov	x0, x1
	mov	x1, x2
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x19, x2
	bl	_touch_input_move
	cbz	w0, LBB11_5
; %bb.3:
	bl	_network_chat_controller
	cbz	w0, LBB11_5
; %bb.4:
	bl	_overlay_menu_open
	cbz	w0, LBB11_7
LBB11_5:
	mov	w0, wzr
	str	wzr, [x20]
	str	wzr, [x19]
LBB11_6:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB11_7:
Lloh36:
	adrp	x19, _mouse_lock@PAGE
Lloh37:
	add	x19, x19, _mouse_lock@PAGEOFF
	mov	x0, x19
	bl	_pthread_mutex_lock
	bl	_SDL_GetTicks
	adrp	x8, _touch_aimed_ms@PAGE
	str	x0, [x8, _touch_aimed_ms@PAGEOFF]
	mov	x0, x19
	bl	_pthread_mutex_unlock
	mov	w0, #1                          ; =0x1
	b	LBB11_6
	.loh AdrpAdd	Lloh36, Lloh37
                                        ; -- End function
	.globl	_halo_linux_gyro_zoom_only      ; -- Begin function halo_linux_gyro_zoom_only
	.p2align	4
_halo_linux_gyro_zoom_only:             ; @halo_linux_gyro_zoom_only
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	bl	_gyro_settings_read
Lloh38:
	adrp	x8, _gyro.1@PAGE
Lloh39:
	ldr	w0, [x8, _gyro.1@PAGEOFF]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpLdr	Lloh38, Lloh39
                                        ; -- End function
	.p2align	4                               ; -- Begin function gyro_settings_read
_gyro_settings_read:                    ; @gyro_settings_read
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	adrp	x19, _gyro.6@PAGE
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	ldr	w20, [x19, _gyro.6@PAGEOFF]
	bl	_config_changes
	cmp	w20, w0
	b.ne	LBB13_2
; %bb.1:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB13_2:
	bl	_config_changes
	str	w0, [x19, _gyro.6@PAGEOFF]
Lloh40:
	adrp	x0, l_.str.12@PAGE
Lloh41:
	add	x0, x0, l_.str.12@PAGEOFF
	bl	_config_string
Lloh42:
	adrp	x1, l_.str.13@PAGE
Lloh43:
	add	x1, x1, l_.str.13@PAGEOFF
	mov	x19, x0
	bl	_strcmp
	adrp	x20, _gyro.0@PAGE
	cbz	w0, LBB13_5
; %bb.3:
Lloh44:
	adrp	x1, l_.str.14@PAGE
Lloh45:
	add	x1, x1, l_.str.14@PAGEOFF
	mov	x0, x19
	bl	_strcmp
	cmp	w0, #0
	cset	w8, eq
	str	w8, [x20, _gyro.0@PAGEOFF]
	cbz	w0, LBB13_6
; %bb.4:
	mov	w8, wzr
	b	LBB13_7
LBB13_5:
	mov	w8, #1                          ; =0x1
	str	w8, [x20, _gyro.0@PAGEOFF]
LBB13_6:
Lloh46:
	adrp	x0, l_.str.15@PAGE
Lloh47:
	add	x0, x0, l_.str.15@PAGEOFF
	bl	_config_boolean
	cmp	w0, #0
	cset	w8, ne
LBB13_7:
	adrp	x19, _gyro.1@PAGE
Lloh48:
	adrp	x0, l_.str.16@PAGE
Lloh49:
	add	x0, x0, l_.str.16@PAGEOFF
	str	w8, [x19, _gyro.1@PAGEOFF]
	bl	_config_boolean
	adrp	x8, _gyro.2@PAGE
	str	w0, [x8, _gyro.2@PAGEOFF]
Lloh50:
	adrp	x0, l_.str.17@PAGE
Lloh51:
	add	x0, x0, l_.str.17@PAGEOFF
	bl	_config_boolean
	adrp	x8, _gyro.3@PAGE
	str	w0, [x8, _gyro.3@PAGEOFF]
Lloh52:
	adrp	x0, l_.str.18@PAGE
Lloh53:
	add	x0, x0, l_.str.18@PAGEOFF
	bl	_config_real
	fcvt	s0, d0
	adrp	x8, _gyro.4@PAGE
Lloh54:
	adrp	x0, l_.str.19@PAGE
Lloh55:
	add	x0, x0, l_.str.19@PAGEOFF
	str	s0, [x8, _gyro.4@PAGEOFF]
	bl	_config_real
	ldr	w8, [x19, _gyro.1@PAGEOFF]
	fcvt	s0, d0
	ldr	w9, [x20, _gyro.0@PAGEOFF]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	cmp	w8, #0
	mov	w8, #1                          ; =0x1
	cinc	w8, w8, ne
	cmp	w9, #0
	csel	w0, wzr, w8, eq
	adrp	x8, _gyro.5@PAGE
	str	s0, [x8, _gyro.5@PAGEOFF]
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	_touch_input_gyro_mode
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpAdd	Lloh40, Lloh41
	.loh AdrpAdd	Lloh44, Lloh45
	.loh AdrpAdd	Lloh46, Lloh47
	.loh AdrpAdd	Lloh54, Lloh55
	.loh AdrpAdd	Lloh52, Lloh53
	.loh AdrpAdd	Lloh50, Lloh51
	.loh AdrpAdd	Lloh48, Lloh49
                                        ; -- End function
	.globl	_halo_linux_touch_look          ; -- Begin function halo_linux_touch_look
	.p2align	4
_halo_linux_touch_look:                 ; @halo_linux_touch_look
; %bb.0:
	str	wzr, [x1]
	str	wzr, [x2]
	str	wzr, [x3]
	str	wzr, [x4]
	cbz	w0, LBB14_2
; %bb.1:
	mov	w0, wzr
	ret
LBB14_2:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	mov	w8, #11744                      ; =0x2de0
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	movk	w8, #15120, lsl #16
	mov	x20, x3
	mov	x21, x2
	mov	x22, x1
	mov	x0, x1
	mov	x1, x2
	fmov	s0, w8
	mov	x2, x3
	mov	x3, x4
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	mov	x19, x4
	bl	_touch_input_look
	bl	_gyro_settings_read
Lloh56:
	adrp	x8, _gyro.0@PAGE
Lloh57:
	ldr	w8, [x8, _gyro.0@PAGEOFF]
	cbnz	w8, LBB14_4
; %bb.3:
	str	wzr, [x20]
	str	wzr, [x19]
LBB14_4:
	ldr	s0, [x20]
Lloh58:
	adrp	x8, _gyro.2@PAGE
Lloh59:
	ldr	w8, [x8, _gyro.2@PAGEOFF]
	fneg	s1, s0
	cmp	w8, #0
Lloh60:
	adrp	x8, _gyro.4@PAGE
	fcsel	s0, s0, s1, eq
Lloh61:
	ldr	s1, [x8, _gyro.4@PAGEOFF]
Lloh62:
	adrp	x8, _gyro.3@PAGE
	fmul	s0, s0, s1
	str	s0, [x20]
	ldr	s0, [x19]
Lloh63:
	ldr	w8, [x8, _gyro.3@PAGEOFF]
	fneg	s1, s0
	cmp	w8, #0
Lloh64:
	adrp	x8, _gyro.5@PAGE
	fcsel	s0, s0, s1, eq
Lloh65:
	ldr	s1, [x8, _gyro.5@PAGEOFF]
	fmul	s3, s0, s1
	str	s3, [x19]
	bl	_network_chat_keyboard_open
	cbz	w0, LBB14_6
; %bb.5:
	bl	_network_chat_controller
	cbz	w0, LBB14_7
LBB14_6:
	bl	_overlay_menu_open
	cbz	w0, LBB14_8
LBB14_7:
	str	wzr, [x22]
	str	wzr, [x21]
	str	wzr, [x20]
	str	wzr, [x19]
LBB14_8:
	ldr	s0, [x22]
	fcmp	s0, #0.0
	b.ne	LBB14_13
; %bb.9:
	ldr	s0, [x21]
	fcmp	s0, #0.0
	b.ne	LBB14_13
; %bb.10:
	ldr	s0, [x20]
	fcmp	s0, #0.0
	b.ne	LBB14_13
; %bb.11:
	ldr	s0, [x19]
	fcmp	s0, #0.0
	b.ne	LBB14_13
; %bb.12:
	mov	w0, wzr
	b	LBB14_14
LBB14_13:
Lloh66:
	adrp	x19, _mouse_lock@PAGE
Lloh67:
	add	x19, x19, _mouse_lock@PAGEOFF
	mov	x0, x19
	bl	_pthread_mutex_lock
	bl	_SDL_GetTicks
	adrp	x8, _touch_aimed_ms@PAGE
	str	x0, [x8, _touch_aimed_ms@PAGEOFF]
	mov	x0, x19
	bl	_pthread_mutex_unlock
	mov	w0, #1                          ; =0x1
LBB14_14:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpLdr	Lloh56, Lloh57
	.loh AdrpLdr	Lloh64, Lloh65
	.loh AdrpLdr	Lloh62, Lloh63
	.loh AdrpAdrp	Lloh60, Lloh62
	.loh AdrpLdr	Lloh60, Lloh61
	.loh AdrpLdr	Lloh58, Lloh59
	.loh AdrpAdd	Lloh66, Lloh67
                                        ; -- End function
	.globl	_halo_linux_touch_aiming        ; -- Begin function halo_linux_touch_aiming
	.p2align	4
_halo_linux_touch_aiming:               ; @halo_linux_touch_aiming
; %bb.0:
	cbz	w0, LBB15_2
; %bb.1:
	mov	w0, wzr
	ret
LBB15_2:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	bl	_touch_input_aim_assist
	cbz	w0, LBB15_4
; %bb.3:
	mov	w0, wzr
	b	LBB15_5
LBB15_4:
Lloh68:
	adrp	x19, _mouse_lock@PAGE
Lloh69:
	add	x19, x19, _mouse_lock@PAGEOFF
	mov	x0, x19
	bl	_pthread_mutex_lock
Lloh70:
	adrp	x8, _touch_aimed_ms@PAGE
Lloh71:
	adrp	x9, _stick_aimed_ms@PAGE
	mov	x0, x19
Lloh72:
	ldr	x8, [x8, _touch_aimed_ms@PAGEOFF]
Lloh73:
	ldr	x9, [x9, _stick_aimed_ms@PAGEOFF]
	cmp	x8, #0
	ccmp	x8, x9, #0, ne
	cset	w20, hs
	bl	_pthread_mutex_unlock
	mov	w0, w20
LBB15_5:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpLdr	Lloh71, Lloh73
	.loh AdrpLdr	Lloh70, Lloh72
	.loh AdrpAdd	Lloh68, Lloh69
                                        ; -- End function
	.globl	_halo_linux_mouse_aiming        ; -- Begin function halo_linux_mouse_aiming
	.p2align	4
_halo_linux_mouse_aiming:               ; @halo_linux_mouse_aiming
; %bb.0:
	cbz	w0, LBB16_2
; %bb.1:
	mov	w0, wzr
	ret
LBB16_2:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	adrp	x19, _halo_linux_mouse_aiming.read_at@PAGE
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	ldr	w21, [x19, _halo_linux_mouse_aiming.read_at@PAGEOFF]
	bl	_config_changes
	adrp	x20, _halo_linux_mouse_aiming.aim_assist@PAGE
	cmp	w21, w0
	b.eq	LBB16_4
; %bb.3:
	bl	_config_changes
	str	w0, [x19, _halo_linux_mouse_aiming.read_at@PAGEOFF]
Lloh74:
	adrp	x0, l_.str.1@PAGE
Lloh75:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_config_boolean
	str	w0, [x20, _halo_linux_mouse_aiming.aim_assist@PAGEOFF]
LBB16_4:
	bl	_network_aim_assist_block_mouse
	cbz	w0, LBB16_6
; %bb.5:
Lloh76:
	adrp	x19, _mouse_lock@PAGE
Lloh77:
	add	x19, x19, _mouse_lock@PAGEOFF
	mov	x0, x19
	bl	_pthread_mutex_lock
Lloh78:
	adrp	x8, _mouse_aimed_ms@PAGE
Lloh79:
	adrp	x9, _touch_aimed_ms@PAGE
Lloh80:
	adrp	x10, _stick_aimed_ms@PAGE
	mov	x0, x19
Lloh81:
	ldr	x8, [x8, _mouse_aimed_ms@PAGEOFF]
Lloh82:
	ldr	x9, [x9, _touch_aimed_ms@PAGEOFF]
Lloh83:
	ldr	x10, [x10, _stick_aimed_ms@PAGEOFF]
	cmp	x9, x8
	ccmp	x9, x10, #0, hs
	ccmp	x9, #0, #4, hs
	cset	w9, ne
	cmp	x10, #0
	ccmp	x8, x10, #2, ne
	csinc	w21, w9, wzr, hs
	bl	_pthread_mutex_unlock
	cbz	w21, LBB16_8
LBB16_6:
	ldr	w8, [x20, _halo_linux_mouse_aiming.aim_assist@PAGEOFF]
	cbz	w8, LBB16_9
; %bb.7:
	mov	w0, wzr
	b	LBB16_10
LBB16_8:
	mov	w0, #1                          ; =0x1
	b	LBB16_10
LBB16_9:
Lloh84:
	adrp	x19, _mouse_lock@PAGE
Lloh85:
	add	x19, x19, _mouse_lock@PAGEOFF
	mov	x0, x19
	bl	_pthread_mutex_lock
Lloh86:
	adrp	x8, _mouse_aimed_ms@PAGE
Lloh87:
	adrp	x9, _stick_aimed_ms@PAGE
	mov	x0, x19
Lloh88:
	ldr	x8, [x8, _mouse_aimed_ms@PAGEOFF]
Lloh89:
	ldr	x9, [x9, _stick_aimed_ms@PAGEOFF]
	cmp	x8, #0
	ccmp	x8, x9, #0, ne
	cset	w20, hs
	bl	_pthread_mutex_unlock
	mov	w0, w20
LBB16_10:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh74, Lloh75
	.loh AdrpLdr	Lloh80, Lloh83
	.loh AdrpLdr	Lloh79, Lloh82
	.loh AdrpLdr	Lloh78, Lloh81
	.loh AdrpAdd	Lloh76, Lloh77
	.loh AdrpLdr	Lloh87, Lloh89
	.loh AdrpLdr	Lloh86, Lloh88
	.loh AdrpAdd	Lloh84, Lloh85
                                        ; -- End function
	.globl	_platform_text_typing           ; -- Begin function platform_text_typing
	.p2align	4
_platform_text_typing:                  ; @platform_text_typing
; %bb.0:
Lloh90:
	adrp	x8, _text_typing_field@PAGE
	cmp	w0, #0
Lloh91:
	ldr	w9, [x8, _text_typing_field@PAGEOFF]
Lloh92:
	adrp	x8, _text_typing@PAGE
	ldr	w10, [x8, _text_typing@PAGEOFF]
	orr	w11, w0, w9
	cset	w0, ne
	cmp	w11, #0
	cset	w9, ne
	cmp	w11, #0
	adrp	x11, _text_typing_keyboard@PAGE
	ccmp	w10, #0, #0, ne
	str	w0, [x11, _text_typing_keyboard@PAGEOFF]
	b.ne	LBB17_2
; %bb.1:
	adrp	x10, _text_typing_enter_armed@PAGE
	strb	wzr, [x10, _text_typing_enter_armed@PAGEOFF]
LBB17_2:
	mov	w1, wzr
	str	w9, [x8, _text_typing@PAGEOFF]
	b	_platform_screen_keyboard
	.loh AdrpAdrp	Lloh90, Lloh92
	.loh AdrpLdr	Lloh90, Lloh91
                                        ; -- End function
	.globl	_platform_text_field            ; -- Begin function platform_text_field
	.p2align	4
_platform_text_field:                   ; @platform_text_field
; %bb.0:
Lloh93:
	adrp	x8, _text_typing_keyboard@PAGE
	adrp	x9, _text_typing@PAGE
	cmp	w0, #0
	adrp	x12, _text_typing_field@PAGE
Lloh94:
	ldr	w8, [x8, _text_typing_keyboard@PAGEOFF]
	ldr	w11, [x9, _text_typing@PAGEOFF]
	orr	w10, w8, w0
	cset	w8, ne
	cmp	w10, #0
	ccmp	w11, #0, #0, ne
	str	w8, [x12, _text_typing_field@PAGEOFF]
	b.ne	LBB18_2
; %bb.1:
	adrp	x11, _text_typing_enter_armed@PAGE
	strb	wzr, [x11, _text_typing_enter_armed@PAGEOFF]
LBB18_2:
	cmp	w10, #0
	cset	w10, ne
	cmp	w0, #0
	ccmp	w1, #0, #4, ne
	mov	w0, w8
	str	w10, [x9, _text_typing@PAGEOFF]
	cset	w1, ne
	b	_platform_screen_keyboard
	.loh AdrpLdr	Lloh93, Lloh94
                                        ; -- End function
	.globl	_halo_input_from_name           ; -- Begin function halo_input_from_name
	.p2align	4
_halo_input_from_name:                  ; @halo_input_from_name
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	ldrb	w8, [x0]
	mov	w9, wzr
Lloh95:
	adrp	x11, _named_inputs@PAGE
Lloh96:
	add	x11, x11, _named_inputs@PAGEOFF
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	b	LBB19_4
	.p2align	4, , 8
LBB19_1:                                ;   in Loop: Header=BB19_4 Depth=1
	mov	w14, wzr
LBB19_2:                                ;   in Loop: Header=BB19_4 Depth=1
	ldrb	w12, [x12]
	cmp	w12, w14, uxtb
	b.eq	LBB19_22
LBB19_3:                                ;   in Loop: Header=BB19_4 Depth=1
	add	w9, w9, #2
	cmp	w9, #26
	b.eq	LBB19_16
LBB19_4:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB19_6 Depth 2
                                        ;     Child Loop BB19_13 Depth 2
	add	x10, x11, w9, sxtw #3
	ldr	w12, [x10]
	cbz	w8, LBB19_9
; %bb.5:                                ;   in Loop: Header=BB19_4 Depth=1
	add	w13, w0, #1
	mov	w14, w8
	.p2align	4, , 8
LBB19_6:                                ;   Parent Loop BB19_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrsb	w15, [x12]
	cbz	w15, LBB19_10
; %bb.7:                                ;   in Loop: Header=BB19_6 Depth=2
	sub	w16, w14, #97
	sub	w17, w14, #32
	and	w16, w16, #0xff
	and	w17, w17, #0xff
	sxtb	w14, w14
	cmp	w16, #26
	sub	w16, w15, #97
	csel	w14, w17, w14, lo
	sub	w17, w15, #32
	cmp	w16, #26
	and	w17, w17, #0xff
	csel	w15, w17, w15, lo
	cmp	w14, w15
	b.ne	LBB19_11
; %bb.8:                                ;   in Loop: Header=BB19_6 Depth=2
	ldrb	w14, [x13]
	add	x12, x12, #1
	add	w13, w13, #1
	cbnz	w14, LBB19_6
	b	LBB19_10
	.p2align	4, , 8
LBB19_9:                                ;   in Loop: Header=BB19_4 Depth=1
	mov	w14, wzr
LBB19_10:                               ;   in Loop: Header=BB19_4 Depth=1
	ldrb	w12, [x12]
	cmp	w12, w14, uxtb
	b.eq	LBB19_23
LBB19_11:                               ;   in Loop: Header=BB19_4 Depth=1
	ldr	w12, [x10, #8]
	cbz	w8, LBB19_1
; %bb.12:                               ;   in Loop: Header=BB19_4 Depth=1
	add	w13, w0, #1
	mov	w14, w8
	.p2align	4, , 8
LBB19_13:                               ;   Parent Loop BB19_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrsb	w15, [x12]
	cbz	w15, LBB19_2
; %bb.14:                               ;   in Loop: Header=BB19_13 Depth=2
	sub	w16, w14, #97
	sub	w17, w14, #32
	and	w16, w16, #0xff
	and	w17, w17, #0xff
	sxtb	w14, w14
	cmp	w16, #26
	sub	w16, w15, #97
	csel	w14, w17, w14, lo
	sub	w17, w15, #32
	cmp	w16, #26
	and	w17, w17, #0xff
	csel	w15, w17, w15, lo
	cmp	w14, w15
	b.ne	LBB19_3
; %bb.15:                               ;   in Loop: Header=BB19_13 Depth=2
	ldrb	w14, [x13]
	add	x12, x12, #1
	add	w13, w13, #1
	cbnz	w14, LBB19_13
	b	LBB19_2
LBB19_16:
Lloh97:
	adrp	x1, l_.str.2@PAGE
Lloh98:
	add	x1, x1, l_.str.2@PAGEOFF
	mov	w2, #6                          ; =0x6
	mov	x19, x0
	bl	_strncmp
	cbnz	w0, LBB19_21
; %bb.17:
	ldrb	w8, [x19, #6]
	sub	w9, w8, #49
	cmp	w9, #8
	b.hi	LBB19_21
; %bb.18:
	cmp	w8, #55
	b.hi	LBB19_21
; %bb.19:
	ldrb	w9, [x19, #7]
	cbnz	w9, LBB19_21
; %bb.20:
	add	w0, w8, #464
	b	LBB19_24
LBB19_21:
	mov	x0, x19
	bl	_SDL_GetScancodeFromName
	cmp	w0, #0
	csinv	w0, w0, wzr, ne
	b	LBB19_24
LBB19_22:
	add	x10, x10, #8
LBB19_23:
	ldr	w0, [x10, #4]
LBB19_24:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh95, Lloh96
	.loh AdrpAdd	Lloh97, Lloh98
                                        ; -- End function
	.globl	_halo_input_name                ; -- Begin function halo_input_name
	.p2align	4
_halo_input_name:                       ; @halo_input_name
; %bb.0:
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	w19, w2
	mov	x20, x1
	sub	w8, w0, #513
	cmp	w8, #37
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	b.hi	LBB20_3
; %bb.1:
Lloh99:
	adrp	x9, LJTI20_0@PAGE
Lloh100:
	add	x9, x9, LJTI20_0@PAGEOFF
	adr	x10, LBB20_2
	ldrb	w11, [x9, x8]
	add	x10, x10, x11, lsl #2
	br	x10
LBB20_2:
Lloh101:
	adrp	x8, _named_inputs@PAGE+16
Lloh102:
	add	x8, x8, _named_inputs@PAGEOFF+16
	b	LBB20_35
LBB20_3:
	cmp	w0, #54
	b.eq	LBB20_34
; %bb.4:
	cmp	w0, #133
	b.ne	LBB20_6
; %bb.5:
Lloh103:
	adrp	x8, _named_inputs@PAGE+8
Lloh104:
	add	x8, x8, _named_inputs@PAGEOFF+8
	b	LBB20_35
LBB20_6:
	subs	w22, w0, #512
	b.hs	LBB20_32
; %bb.7:
	mov	w21, w0
	bl	_SDL_GetScancodeName
	mov	x8, x0
	mov	w0, w21
	ldrb	w8, [x8]
	cbz	w8, LBB20_32
; %bb.8:
	bl	_SDL_GetScancodeName
	mov	x8, x0
Lloh105:
	adrp	x2, l_.str.3@PAGE
Lloh106:
	add	x2, x2, l_.str.3@PAGEOFF
	mov	x0, x20
	mov	w1, w19
	b	LBB20_38
LBB20_9:
Lloh107:
	adrp	x8, _named_inputs@PAGE+96
Lloh108:
	add	x8, x8, _named_inputs@PAGEOFF+96
	b	LBB20_35
LBB20_10:
Lloh109:
	adrp	x8, _named_inputs@PAGE+128
Lloh110:
	add	x8, x8, _named_inputs@PAGEOFF+128
	b	LBB20_35
LBB20_11:
Lloh111:
	adrp	x8, _named_inputs@PAGE+200
Lloh112:
	add	x8, x8, _named_inputs@PAGEOFF+200
	b	LBB20_35
LBB20_12:
Lloh113:
	adrp	x8, _named_inputs@PAGE+104
Lloh114:
	add	x8, x8, _named_inputs@PAGEOFF+104
	b	LBB20_35
LBB20_13:
Lloh115:
	adrp	x8, _named_inputs@PAGE+64
Lloh116:
	add	x8, x8, _named_inputs@PAGEOFF+64
	b	LBB20_35
LBB20_14:
Lloh117:
	adrp	x8, _named_inputs@PAGE+40
Lloh118:
	add	x8, x8, _named_inputs@PAGEOFF+40
	b	LBB20_35
LBB20_15:
Lloh119:
	adrp	x8, _named_inputs@PAGE+24
Lloh120:
	add	x8, x8, _named_inputs@PAGEOFF+24
	b	LBB20_35
LBB20_16:
Lloh121:
	adrp	x8, _named_inputs@PAGE+32
Lloh122:
	add	x8, x8, _named_inputs@PAGEOFF+32
	b	LBB20_35
LBB20_17:
Lloh123:
	adrp	x8, _named_inputs@PAGE+168
Lloh124:
	add	x8, x8, _named_inputs@PAGEOFF+168
	b	LBB20_35
LBB20_18:
Lloh125:
	adrp	x8, _named_inputs@PAGE+80
Lloh126:
	add	x8, x8, _named_inputs@PAGEOFF+80
	b	LBB20_35
LBB20_19:
Lloh127:
	adrp	x8, _named_inputs@PAGE+136
Lloh128:
	add	x8, x8, _named_inputs@PAGEOFF+136
	b	LBB20_35
LBB20_20:
Lloh129:
	adrp	x8, _named_inputs@PAGE+88
Lloh130:
	add	x8, x8, _named_inputs@PAGEOFF+88
	b	LBB20_35
LBB20_21:
Lloh131:
	adrp	x8, _named_inputs@PAGE+112
Lloh132:
	add	x8, x8, _named_inputs@PAGEOFF+112
	b	LBB20_35
LBB20_22:
Lloh133:
	adrp	x8, _named_inputs@PAGE+192
Lloh134:
	add	x8, x8, _named_inputs@PAGEOFF+192
	b	LBB20_35
LBB20_23:
Lloh135:
	adrp	x8, _named_inputs@PAGE+144
Lloh136:
	add	x8, x8, _named_inputs@PAGEOFF+144
	b	LBB20_35
LBB20_24:
Lloh137:
	adrp	x8, _named_inputs@PAGE+48
Lloh138:
	add	x8, x8, _named_inputs@PAGEOFF+48
	b	LBB20_35
LBB20_25:
Lloh139:
	adrp	x8, _named_inputs@PAGE+56
Lloh140:
	add	x8, x8, _named_inputs@PAGEOFF+56
	b	LBB20_35
LBB20_26:
Lloh141:
	adrp	x8, _named_inputs@PAGE+72
Lloh142:
	add	x8, x8, _named_inputs@PAGEOFF+72
	b	LBB20_35
LBB20_27:
Lloh143:
	adrp	x8, _named_inputs@PAGE+120
Lloh144:
	add	x8, x8, _named_inputs@PAGEOFF+120
	b	LBB20_35
LBB20_28:
Lloh145:
	adrp	x8, _named_inputs@PAGE+152
Lloh146:
	add	x8, x8, _named_inputs@PAGEOFF+152
	b	LBB20_35
LBB20_29:
Lloh147:
	adrp	x8, _named_inputs@PAGE+160
Lloh148:
	add	x8, x8, _named_inputs@PAGEOFF+160
	b	LBB20_35
LBB20_30:
Lloh149:
	adrp	x8, _named_inputs@PAGE+184
Lloh150:
	add	x8, x8, _named_inputs@PAGEOFF+184
	b	LBB20_35
LBB20_31:
Lloh151:
	adrp	x8, _named_inputs@PAGE+176
Lloh152:
	add	x8, x8, _named_inputs@PAGEOFF+176
	b	LBB20_35
LBB20_32:
	and	w8, w0, #0xfffffff8
	cmp	w8, #512
	b.ne	LBB20_37
; %bb.33:
Lloh153:
	adrp	x2, l_.str.4@PAGE
Lloh154:
	add	x2, x2, l_.str.4@PAGEOFF
	mov	x0, x20
	mov	w1, w19
	str	w22, [sp]
	b	LBB20_36
LBB20_34:
Lloh155:
	adrp	x8, _named_inputs@PAGE
Lloh156:
	add	x8, x8, _named_inputs@PAGEOFF
LBB20_35:
	ldr	w8, [x8]
Lloh157:
	adrp	x2, l_.str.3@PAGE
Lloh158:
	add	x2, x2, l_.str.3@PAGEOFF
	mov	x0, x20
	mov	w1, w19
	str	w8, [sp]
LBB20_36:
	bl	_snprintf
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB20_37:
Lloh159:
	adrp	x2, l_.str.3@PAGE
Lloh160:
	add	x2, x2, l_.str.3@PAGEOFF
	mov	x0, x20
	mov	w1, w19
Lloh161:
	adrp	x8, l_.str.5@PAGE
Lloh162:
	add	x8, x8, l_.str.5@PAGEOFF
LBB20_38:
	str	w8, [sp]
	b	LBB20_36
	.loh AdrpAdd	Lloh99, Lloh100
	.loh AdrpAdd	Lloh101, Lloh102
	.loh AdrpAdd	Lloh103, Lloh104
	.loh AdrpAdd	Lloh105, Lloh106
	.loh AdrpAdd	Lloh107, Lloh108
	.loh AdrpAdd	Lloh109, Lloh110
	.loh AdrpAdd	Lloh111, Lloh112
	.loh AdrpAdd	Lloh113, Lloh114
	.loh AdrpAdd	Lloh115, Lloh116
	.loh AdrpAdd	Lloh117, Lloh118
	.loh AdrpAdd	Lloh119, Lloh120
	.loh AdrpAdd	Lloh121, Lloh122
	.loh AdrpAdd	Lloh123, Lloh124
	.loh AdrpAdd	Lloh125, Lloh126
	.loh AdrpAdd	Lloh127, Lloh128
	.loh AdrpAdd	Lloh129, Lloh130
	.loh AdrpAdd	Lloh131, Lloh132
	.loh AdrpAdd	Lloh133, Lloh134
	.loh AdrpAdd	Lloh135, Lloh136
	.loh AdrpAdd	Lloh137, Lloh138
	.loh AdrpAdd	Lloh139, Lloh140
	.loh AdrpAdd	Lloh141, Lloh142
	.loh AdrpAdd	Lloh143, Lloh144
	.loh AdrpAdd	Lloh145, Lloh146
	.loh AdrpAdd	Lloh147, Lloh148
	.loh AdrpAdd	Lloh149, Lloh150
	.loh AdrpAdd	Lloh151, Lloh152
	.loh AdrpAdd	Lloh153, Lloh154
	.loh AdrpAdd	Lloh155, Lloh156
	.loh AdrpAdd	Lloh157, Lloh158
	.loh AdrpAdd	Lloh161, Lloh162
	.loh AdrpAdd	Lloh159, Lloh160
	.section	__TEXT,__const
LJTI20_0:
	.byte	(LBB20_2-LBB20_2)>>2
	.byte	(LBB20_16-LBB20_2)>>2
	.byte	(LBB20_15-LBB20_2)>>2
	.byte	(LBB20_14-LBB20_2)>>2
	.byte	(LBB20_24-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_25-LBB20_2)>>2
	.byte	(LBB20_13-LBB20_2)>>2
	.byte	(LBB20_26-LBB20_2)>>2
	.byte	(LBB20_18-LBB20_2)>>2
	.byte	(LBB20_20-LBB20_2)>>2
	.byte	(LBB20_9-LBB20_2)>>2
	.byte	(LBB20_12-LBB20_2)>>2
	.byte	(LBB20_29-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_17-LBB20_2)>>2
	.byte	(LBB20_23-LBB20_2)>>2
	.byte	(LBB20_28-LBB20_2)>>2
	.byte	(LBB20_21-LBB20_2)>>2
	.byte	(LBB20_27-LBB20_2)>>2
	.byte	(LBB20_31-LBB20_2)>>2
	.byte	(LBB20_30-LBB20_2)>>2
	.byte	(LBB20_22-LBB20_2)>>2
	.byte	(LBB20_11-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_6-LBB20_2)>>2
	.byte	(LBB20_10-LBB20_2)>>2
	.byte	(LBB20_19-LBB20_2)>>2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_halo_input_shown_name          ; -- Begin function halo_input_shown_name
	.p2align	4
_halo_input_shown_name:                 ; @halo_input_shown_name
; %bb.0:
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	w19, w2
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	mov	x20, x1
	bl	_halo_input_from_name
Lloh163:
	adrp	x2, l_.str.3@PAGE
Lloh164:
	add	x2, x2, l_.str.3@PAGEOFF
	mov	x0, x20
	mov	w1, w19
	str	w21, [sp]
	bl	_snprintf
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh163, Lloh164
                                        ; -- End function
	.globl	_halo_keyboard_actions          ; -- Begin function halo_keyboard_actions
	.p2align	4
_halo_keyboard_actions:                 ; @halo_keyboard_actions
; %bb.0:
Lloh165:
	adrp	x8, _keyboard_actions_held@PAGE
	cmp	w0, #0
Lloh166:
	ldr	w8, [x8, _keyboard_actions_held@PAGEOFF]
	csel	w0, w8, wzr, eq
	ret
	.loh AdrpLdr	Lloh165, Lloh166
                                        ; -- End function
	.globl	_halo_keyboard_actions_anywhere ; -- Begin function halo_keyboard_actions_anywhere
	.p2align	4
_halo_keyboard_actions_anywhere:        ; @halo_keyboard_actions_anywhere
; %bb.0:
Lloh167:
	adrp	x8, _keyboard_actions_anywhere@PAGE
Lloh168:
	ldr	w0, [x8, _keyboard_actions_anywhere@PAGEOFF]
	ret
	.loh AdrpLdr	Lloh167, Lloh168
                                        ; -- End function
	.globl	_halo_replay_keyboard_last      ; -- Begin function halo_replay_keyboard_last
	.p2align	4
_halo_replay_keyboard_last:             ; @halo_replay_keyboard_last
; %bb.0:
Lloh169:
	adrp	x8, _replay_keyboard_last@PAGE
Lloh170:
	ldr	w0, [x8, _replay_keyboard_last@PAGEOFF]
	ret
	.loh AdrpLdr	Lloh169, Lloh170
                                        ; -- End function
	.globl	_halo_binding_shown_name        ; -- Begin function halo_binding_shown_name
	.p2align	4
_halo_binding_shown_name:               ; @halo_binding_shown_name
; %bb.0:
	sub	sp, sp, #128
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	mov	w19, w2
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	mov	x20, x1
	bl	_config_string
	mov	x21, x0
	cbnz	w21, LBB25_3
; %bb.1:
	mov	w8, wzr
Lloh171:
	adrp	x21, l_.str.5@PAGE
Lloh172:
	add	x21, x21, l_.str.5@PAGEOFF
	b	LBB25_6
	.p2align	4, , 8
LBB25_2:                                ;   in Loop: Header=BB25_3 Depth=1
	add	x21, x21, #1
LBB25_3:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w8, [x21]
	cmp	w8, #44
	b.eq	LBB25_2
; %bb.4:                                ;   in Loop: Header=BB25_3 Depth=1
	cmp	w8, #32
	b.eq	LBB25_2
; %bb.5:
Lloh173:
	adrp	x1, l_.str.6@PAGE
Lloh174:
	add	x1, x1, l_.str.6@PAGEOFF
	mov	x0, x21
	bl	_strcspn
	mov	w8, w0
LBB25_6:
Lloh175:
	adrp	x2, l_.str.7@PAGE
Lloh176:
	add	x2, x2, l_.str.7@PAGEOFF
	add	x0, sp, #16
	mov	w1, #64                         ; =0x40
	stp	w8, w21, [sp]
	bl	_snprintf
	ldrb	w8, [sp, #16]
	cbz	w8, LBB25_10
; %bb.7:
	add	x21, sp, #16
	.p2align	4, , 8
LBB25_8:                                ; =>This Inner Loop Header: Depth=1
	add	x0, sp, #16
	bl	_strlen
	add	w8, w21, w0
	sub	w9, w8, #1
	ldrb	w9, [x9]
	cmp	w9, #32
	b.ne	LBB25_11
; %bb.9:                                ;   in Loop: Header=BB25_8 Depth=1
	sub	w8, w8, #1
	strb	wzr, [x8]
	ldrb	w8, [sp, #16]
	cbnz	w8, LBB25_8
LBB25_10:
	mov	x0, x20
	mov	w1, w19
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
Lloh177:
	adrp	x2, l_.str.8@PAGE
Lloh178:
	add	x2, x2, l_.str.8@PAGEOFF
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #128
	b	_snprintf
LBB25_11:
	add	x0, sp, #16
	add	x21, sp, #16
	bl	_halo_input_from_name
Lloh179:
	adrp	x2, l_.str.3@PAGE
Lloh180:
	add	x2, x2, l_.str.3@PAGEOFF
	mov	x0, x20
	mov	w1, w19
	str	w21, [sp]
	bl	_snprintf
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.loh AdrpAdd	Lloh171, Lloh172
	.loh AdrpAdd	Lloh173, Lloh174
	.loh AdrpAdd	Lloh175, Lloh176
	.loh AdrpAdd	Lloh177, Lloh178
	.loh AdrpAdd	Lloh179, Lloh180
                                        ; -- End function
	.globl	_halo_push_to_talk_held         ; -- Begin function halo_push_to_talk_held
	.p2align	4
_halo_push_to_talk_held:                ; @halo_push_to_talk_held
; %bb.0:
	stp	x28, x27, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	sub	sp, sp, #560
	add	x0, sp, #12
	bl	_sdl_gamepads
	adrp	x21, _split_players@PAGE
	mov	w19, w0
	cmp	w0, #1
	ldr	w20, [x21, _split_players@PAGEOFF]
	b.ne	LBB26_8
; %bb.1:
	adrp	x22, _lone_gamepad_split@PAGE
	ldr	w8, [x22, _lone_gamepad_split@PAGEOFF]
	cmp	w20, w8
	b.eq	LBB26_4
; %bb.2:
	ldr	w0, [sp, #12]
	bl	_gamepad_idle
	cbz	w0, LBB26_6
; %bb.3:
	str	w20, [x22, _lone_gamepad_split@PAGEOFF]
LBB26_4:
	cbz	w20, LBB26_7
LBB26_5:
	mov	x19, xzr
	bl	_overlay_menu_open
	cbnz	w0, LBB26_16
	b	LBB26_17
LBB26_6:
	ldr	w20, [x22, _lone_gamepad_split@PAGEOFF]
	cbnz	w20, LBB26_5
LBB26_7:
	ldr	w20, [x21, _split_players@PAGEOFF]
LBB26_8:
	adrp	x21, _keyboard_alone_wanted@PAGE
	cbz	w20, LBB26_10
; %bb.9:
	ldr	w9, [x21, _keyboard_alone_wanted@PAGEOFF]
	b	LBB26_11
LBB26_10:
	mov	w9, wzr
	str	wzr, [x21, _keyboard_alone_wanted@PAGEOFF]
LBB26_11:
	adrp	x22, _keyboard_alone@PAGE
	ldr	w20, [sp, #12]
	ldr	w8, [x22, _keyboard_alone@PAGEOFF]
	cmp	w8, w9
	ccmp	w19, #2, #8, ne
	b.lt	LBB26_15
; %bb.12:
	mov	x0, x20
	bl	_gamepad_idle
	cbz	w0, LBB26_14
; %bb.13:
	ldr	w8, [x21, _keyboard_alone_wanted@PAGEOFF]
	str	w8, [x22, _keyboard_alone@PAGEOFF]
	b	LBB26_15
LBB26_14:
	ldr	w8, [x22, _keyboard_alone@PAGEOFF]
LBB26_15:
	cmp	w8, #0
	and	w8, w19, #0xfffffffe
	ccmp	w8, #2, #0, ne
	ccmp	w19, #0, #4, ne
	csel	x19, x20, xzr, gt
	bl	_overlay_menu_open
	cbz	w0, LBB26_17
LBB26_16:
	mov	w0, wzr
	b	LBB26_55
LBB26_17:
	bl	_bindings_read
	add	x0, sp, #12
	mov	w1, wzr
	bl	_platform_input_read
Lloh181:
	adrp	x8, _bindings@PAGE+144
Lloh182:
	ldr	w21, [x8, _bindings@PAGEOFF+144]
	bl	_SDL_GetTicks
	adrp	x20, _wheel_press_until_ms@PAGE
	tbnz	w21, #31, LBB26_35
; %bb.18:
	subs	w1, w21, #523
	b.lo	LBB26_23
; %bb.19:
	cmp	w21, #550
	ccmp	w19, #0, #4, ls
	b.eq	LBB26_35
; %bb.20:
	mov	x0, x19
	cmp	w21, #550
	b.eq	LBB26_31
; %bb.21:
	cmp	w21, #549
	b.ne	LBB26_33
; %bb.22:
	mov	w1, #4                          ; =0x4
	b	LBB26_32
LBB26_23:
	cmp	w21, #511
	b.hi	LBB26_25
; %bb.24:
	add	x8, sp, #12
	ldrb	w8, [x8, w21, sxtw]
	cbnz	w8, LBB26_54
	b	LBB26_35
LBB26_25:
	cmp	w21, #519
	b.hi	LBB26_28
; %bb.26:
	ldr	w8, [sp, #548]
	cbnz	w8, LBB26_35
; %bb.27:
	add	x8, sp, #12
	add	w8, w8, w21
	ldrb	w8, [x8]
	cbnz	w8, LBB26_54
	b	LBB26_35
LBB26_28:
	ldr	x8, [x20, _wheel_press_until_ms@PAGEOFF]
	cmp	w21, #520
	b.eq	LBB26_34
; %bb.29:
	cmp	x0, x8
	b.hs	LBB26_34
; %bb.30:
Lloh183:
	adrp	x8, _wheel_direction@PAGE
	cmp	w21, #521
	mov	w0, #1                          ; =0x1
	cneg	w9, w0, ne
Lloh184:
	ldr	w8, [x8, _wheel_direction@PAGEOFF]
	cmp	w8, w9
	b.eq	LBB26_55
	b	LBB26_35
LBB26_31:
	mov	w1, #5                          ; =0x5
LBB26_32:
	bl	_SDL_GetGamepadAxis
	mov	w8, #16000                      ; =0x3e80
	cmp	w0, w8
	b.le	LBB26_35
	b	LBB26_54
LBB26_33:
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB26_54
	b	LBB26_35
LBB26_34:
	cmp	x0, x8
	mov	w8, #520                        ; =0x208
	ccmp	w21, w8, #0, lo
	b.eq	LBB26_54
LBB26_35:
Lloh185:
	adrp	x8, _bindings@PAGE+148
Lloh186:
	ldr	w21, [x8, _bindings@PAGEOFF+148]
	bl	_SDL_GetTicks
	tbnz	w21, #31, LBB26_53
; %bb.36:
	cmp	w21, #522
	b.ls	LBB26_41
; %bb.37:
	cmp	w21, #550
	ccmp	w19, #0, #4, ls
	b.eq	LBB26_53
; %bb.38:
	cmp	w21, #549
	b.eq	LBB26_49
; %bb.39:
	cmp	w21, #550
	b.ne	LBB26_51
; %bb.40:
	mov	x0, x19
	mov	w1, #5                          ; =0x5
	b	LBB26_50
LBB26_41:
	cmp	w21, #512
	b.hs	LBB26_43
; %bb.42:
	add	x8, sp, #12
	ldrb	w8, [x8, w21, sxtw]
	cbnz	w8, LBB26_54
	b	LBB26_53
LBB26_43:
	cmp	w21, #520
	b.hs	LBB26_46
; %bb.44:
	ldr	w8, [sp, #548]
	cbnz	w8, LBB26_53
; %bb.45:
	add	x8, sp, #12
	add	w8, w8, w21
	ldrb	w8, [x8]
	cbnz	w8, LBB26_54
	b	LBB26_53
LBB26_46:
	ldr	x8, [x20, _wheel_press_until_ms@PAGEOFF]
	b.eq	LBB26_52
; %bb.47:
	cmp	x0, x8
	b.hs	LBB26_52
; %bb.48:
Lloh187:
	adrp	x8, _wheel_direction@PAGE
	cmp	w21, #521
	mov	w0, #1                          ; =0x1
	cneg	w9, w0, ne
Lloh188:
	ldr	w8, [x8, _wheel_direction@PAGEOFF]
	cmp	w8, w9
	b.eq	LBB26_55
	b	LBB26_53
LBB26_49:
	mov	x0, x19
	mov	w1, #4                          ; =0x4
LBB26_50:
	bl	_SDL_GetGamepadAxis
	mov	w8, #16000                      ; =0x3e80
	cmp	w0, w8
	b.gt	LBB26_54
	b	LBB26_53
LBB26_51:
	sub	w1, w21, #523
	mov	x0, x19
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB26_54
	b	LBB26_53
LBB26_52:
	cmp	x0, x8
	mov	w8, #520                        ; =0x208
	ccmp	w21, w8, #0, lo
	b.eq	LBB26_54
LBB26_53:
	bl	_controller_remap_talk
	cbz	w0, LBB26_56
LBB26_54:
	mov	w0, #1                          ; =0x1
LBB26_55:
	add	sp, sp, #560
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #64             ; 16-byte Folded Reload
	ret
LBB26_56:
	ldr	w8, [sp, #556]
	cbnz	w8, LBB26_16
; %bb.57:
	bl	_network_replay_playing
	cbnz	w0, LBB26_16
; %bb.58:
Lloh189:
	adrp	x8, _chat_pad@PAGE
Lloh190:
	ldr	w8, [x8, _chat_pad@PAGEOFF]
	ubfx	w0, w8, #1, #1
	b	LBB26_55
	.loh AdrpLdr	Lloh181, Lloh182
	.loh AdrpLdr	Lloh183, Lloh184
	.loh AdrpLdr	Lloh185, Lloh186
	.loh AdrpLdr	Lloh187, Lloh188
	.loh AdrpLdr	Lloh189, Lloh190
                                        ; -- End function
	.p2align	4                               ; -- Begin function bindings_read
_bindings_read:                         ; @bindings_read
; %bb.0:
	sub	sp, sp, #176
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	adrp	x19, _bindings_read_at@PAGE
	stp	x28, x27, [sp, #80]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             ; 16-byte Folded Spill
	ldr	w20, [x19, _bindings_read_at@PAGEOFF]
	stp	x24, x23, [sp, #112]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160
	bl	_config_changes
	cmp	w20, w0
	b.ne	LBB27_2
LBB27_1:
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
LBB27_2:
	bl	_config_changes
	movi	v0.2d, #0000000000000000
	mov	w25, wzr
Lloh191:
	adrp	x8, _gamepad_bound_to_talk@PAGE
Lloh192:
	add	x8, x8, _gamepad_bound_to_talk@PAGEOFF
Lloh193:
	adrp	x9, _gamepad_bound_in_game@PAGE
Lloh194:
	add	x9, x9, _gamepad_bound_in_game@PAGEOFF
	str	w0, [x19, _bindings_read_at@PAGEOFF]
Lloh195:
	adrp	x26, _bindings@PAGE
Lloh196:
	add	x26, x26, _bindings@PAGEOFF
Lloh197:
	adrp	x19, l_.str.6@PAGE
Lloh198:
	add	x19, x19, l_.str.6@PAGEOFF
	mov	w27, #-1                        ; =0xffffffff
	add	x21, sp, #16
Lloh199:
	adrp	x20, l_.str.7@PAGE
Lloh200:
	add	x20, x20, l_.str.7@PAGEOFF
	stp	q0, q0, [x8]
	stp	q0, q0, [x8, #32]
	stp	q0, q0, [x8, #64]
	str	q0, [x8, #96]
	stp	q0, q0, [x9]
	stp	q0, q0, [x9, #32]
	stp	q0, q0, [x9, #64]
	str	q0, [x9, #96]
	b	LBB27_5
	.p2align	4, , 8
LBB27_3:                                ;   in Loop: Header=BB27_5 Depth=1
Lloh201:
	adrp	x0, l_.str.46@PAGE
Lloh202:
	add	x0, x0, l_.str.46@PAGEOFF
	stp	w22, w21, [sp]
	bl	_platform_log
LBB27_4:                                ;   in Loop: Header=BB27_5 Depth=1
	add	w25, w25, #1
	cmp	w25, #23
	b.eq	LBB27_1
LBB27_5:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB27_7 Depth 2
                                        ;     Child Loop BB27_11 Depth 2
                                        ;     Child Loop BB27_23 Depth 2
                                        ;     Child Loop BB27_27 Depth 2
Lloh203:
	adrp	x8, _binding_settings@PAGE
Lloh204:
	add	x8, x8, _binding_settings@PAGEOFF
	ldr	w22, [x8, w25, sxtw #2]
	mov	x0, x22
	bl	_config_string
	add	x28, x26, w25, sxtw #3
	mov	x23, x0
	str	w27, [x28]
	b	LBB27_7
	.p2align	4, , 8
LBB27_6:                                ;   in Loop: Header=BB27_7 Depth=2
	add	x23, x23, #1
LBB27_7:                                ;   Parent Loop BB27_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w8, [x23]
	cmp	w8, #44
	b.eq	LBB27_6
; %bb.8:                                ;   in Loop: Header=BB27_7 Depth=2
	cmp	w8, #32
	b.eq	LBB27_6
; %bb.9:                                ;   in Loop: Header=BB27_5 Depth=1
	mov	x0, x23
	mov	x1, x19
	bl	_strcspn
	cbz	w0, LBB27_21
; %bb.10:                               ;   in Loop: Header=BB27_5 Depth=1
	mov	w24, w0
	add	x0, sp, #16
	mov	w1, #64                         ; =0x40
	mov	x2, x20
	stp	w24, w23, [sp]
	bl	_snprintf
	ldrb	w8, [sp, #16]
	cbz	w8, LBB27_13
	.p2align	4, , 8
LBB27_11:                               ;   Parent Loop BB27_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x0, sp, #16
	bl	_strlen
	add	w8, w21, w0
	sub	w9, w8, #1
	ldrb	w9, [x9]
	cmp	w9, #32
	b.ne	LBB27_13
; %bb.12:                               ;   in Loop: Header=BB27_11 Depth=2
	sub	w8, w8, #1
	strb	wzr, [x8]
	ldrb	w8, [sp, #16]
	cbnz	w8, LBB27_11
LBB27_13:                               ;   in Loop: Header=BB27_5 Depth=1
	add	x0, sp, #16
	bl	_halo_input_from_name
	str	w0, [x28]
	tbnz	w0, #31, LBB27_17
; %bb.14:                               ;   in Loop: Header=BB27_5 Depth=1
	sub	w8, w0, #523
	cmp	w8, #27
	b.hi	LBB27_20
; %bb.15:                               ;   in Loop: Header=BB27_5 Depth=1
	cmp	w25, #18
	b.ne	LBB27_18
; %bb.16:                               ;   in Loop: Header=BB27_5 Depth=1
Lloh205:
	adrp	x8, _gamepad_bound_to_talk@PAGE
Lloh206:
	add	x8, x8, _gamepad_bound_to_talk@PAGEOFF
	b	LBB27_19
	.p2align	4, , 8
LBB27_17:                               ;   in Loop: Header=BB27_5 Depth=1
Lloh207:
	adrp	x0, l_.str.46@PAGE
Lloh208:
	add	x0, x0, l_.str.46@PAGEOFF
	stp	w22, w21, [sp]
	bl	_platform_log
	b	LBB27_20
LBB27_18:                               ;   in Loop: Header=BB27_5 Depth=1
Lloh209:
	adrp	x8, _gamepad_bound_in_game@PAGE
Lloh210:
	add	x8, x8, _gamepad_bound_in_game@PAGEOFF
LBB27_19:                               ;   in Loop: Header=BB27_5 Depth=1
	add	w8, w8, w0, lsl #2
	mov	w9, #1                          ; =0x1
	sub	w8, w8, #2092
	str	w9, [x8]
LBB27_20:                               ;   in Loop: Header=BB27_5 Depth=1
	add	w23, w23, w24
LBB27_21:                               ;   in Loop: Header=BB27_5 Depth=1
	str	w27, [x28, #4]
	b	LBB27_23
	.p2align	4, , 8
LBB27_22:                               ;   in Loop: Header=BB27_23 Depth=2
	add	x23, x23, #1
LBB27_23:                               ;   Parent Loop BB27_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w8, [x23]
	cmp	w8, #44
	b.eq	LBB27_22
; %bb.24:                               ;   in Loop: Header=BB27_23 Depth=2
	cmp	w8, #32
	b.eq	LBB27_22
; %bb.25:                               ;   in Loop: Header=BB27_5 Depth=1
	mov	x0, x23
	mov	x1, x19
	bl	_strcspn
	cbz	w0, LBB27_4
; %bb.26:                               ;   in Loop: Header=BB27_5 Depth=1
	mov	w8, w0
	add	x0, sp, #16
	mov	w1, #64                         ; =0x40
	mov	x2, x20
	stp	w8, w23, [sp]
	bl	_snprintf
	ldrb	w8, [sp, #16]
	cbz	w8, LBB27_29
	.p2align	4, , 8
LBB27_27:                               ;   Parent Loop BB27_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	x0, sp, #16
	bl	_strlen
	add	w8, w21, w0
	sub	w9, w8, #1
	ldrb	w9, [x9]
	cmp	w9, #32
	b.ne	LBB27_29
; %bb.28:                               ;   in Loop: Header=BB27_27 Depth=2
	sub	w8, w8, #1
	strb	wzr, [x8]
	ldrb	w8, [sp, #16]
	cbnz	w8, LBB27_27
LBB27_29:                               ;   in Loop: Header=BB27_5 Depth=1
	add	x0, sp, #16
	bl	_halo_input_from_name
	str	w0, [x28, #4]
	tbnz	w0, #31, LBB27_3
; %bb.30:                               ;   in Loop: Header=BB27_5 Depth=1
	sub	w8, w0, #523
	cmp	w8, #27
	b.hi	LBB27_4
; %bb.31:                               ;   in Loop: Header=BB27_5 Depth=1
	cmp	w25, #18
	b.ne	LBB27_33
; %bb.32:                               ;   in Loop: Header=BB27_5 Depth=1
Lloh211:
	adrp	x8, _gamepad_bound_to_talk@PAGE
Lloh212:
	add	x8, x8, _gamepad_bound_to_talk@PAGEOFF
	b	LBB27_34
LBB27_33:                               ;   in Loop: Header=BB27_5 Depth=1
Lloh213:
	adrp	x8, _gamepad_bound_in_game@PAGE
Lloh214:
	add	x8, x8, _gamepad_bound_in_game@PAGEOFF
LBB27_34:                               ;   in Loop: Header=BB27_5 Depth=1
	add	w8, w8, w0, lsl #2
	mov	w9, #1                          ; =0x1
	sub	w8, w8, #2092
	str	w9, [x8]
	b	LBB27_4
	.loh AdrpAdd	Lloh199, Lloh200
	.loh AdrpAdd	Lloh197, Lloh198
	.loh AdrpAdd	Lloh195, Lloh196
	.loh AdrpAdd	Lloh193, Lloh194
	.loh AdrpAdd	Lloh191, Lloh192
	.loh AdrpAdd	Lloh201, Lloh202
	.loh AdrpAdd	Lloh203, Lloh204
	.loh AdrpAdd	Lloh205, Lloh206
	.loh AdrpAdd	Lloh207, Lloh208
	.loh AdrpAdd	Lloh209, Lloh210
	.loh AdrpAdd	Lloh211, Lloh212
	.loh AdrpAdd	Lloh213, Lloh214
                                        ; -- End function
	.globl	_test_input_hold_action         ; -- Begin function test_input_hold_action
	.p2align	4
_test_input_hold_action:                ; @test_input_hold_action
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	mov	w19, w0
	adrp	x20, _test_input_holding_action@PAGE
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	cbz	w0, LBB28_5
; %bb.1:
	ldr	w8, [x20, _test_input_holding_action@PAGEOFF]
	cbnz	w8, LBB28_5
; %bb.2:
	bl	_network_test_game_seconds
	fcmp	d0, #0.0
	b.ge	LBB28_4
; %bb.3:
	bl	_SDL_GetTicks
	mov	x8, #70368744177664             ; =0x400000000000
	ucvtf	d0, x0
	movk	x8, #16527, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
LBB28_4:
	adrp	x8, _test_input_holding_action_since@PAGE
	str	d0, [x8, _test_input_holding_action_since@PAGEOFF]
LBB28_5:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	str	w19, [x20, _test_input_holding_action@PAGEOFF]
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.globl	_test_input_press               ; -- Begin function test_input_press
	.p2align	4
_test_input_press:                      ; @test_input_press
; %bb.0:
	adrp	x8, _test_input_pressed@PAGE
	str	w0, [x8, _test_input_pressed@PAGEOFF]
	ret
                                        ; -- End function
	.globl	_sdl_gamepads                   ; -- Begin function sdl_gamepads
	.p2align	4
_sdl_gamepads:                          ; @sdl_gamepads
; %bb.0:
	sub	sp, sp, #80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	mov	x20, x0
	stp	xzr, xzr, [x0]
	add	x0, sp, #12
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	str	wzr, [sp, #12]
	bl	_SDL_GetGamepads
	mov	x19, x0
	cbz	w19, LBB30_15
; %bb.1:
	ldr	w8, [sp, #12]
	cmp	w8, #1
	b.lt	LBB30_16
; %bb.2:
	mov	w21, wzr
	mov	w23, #1                         ; =0x1
	mov	x24, x19
	.p2align	4, , 8
LBB30_3:                                ; =>This Inner Loop Header: Depth=1
	ldr	w0, [x24]
	bl	_SDL_GetGamepadFromID
	mov	x22, x0
	cbz	w22, LBB30_6
; %bb.4:                                ;   in Loop: Header=BB30_3 Depth=1
	mov	x0, x22
	bl	_SDL_GetGamepadType
	cmp	w0, #2
	b.lo	LBB30_6
; %bb.5:                                ;   in Loop: Header=BB30_3 Depth=1
	add	w8, w21, #1
	str	w22, [x20, w21, sxtw #2]
	mov	w21, w8
LBB30_6:                                ;   in Loop: Header=BB30_3 Depth=1
	ldr	w8, [sp, #12]
	cmp	w23, w8
	b.ge	LBB30_8
; %bb.7:                                ;   in Loop: Header=BB30_3 Depth=1
	add	w24, w24, #4
	add	w23, w23, #1
	cmp	w21, #4
	b.lt	LBB30_3
LBB30_8:
	cmp	w21, #4
	ccmp	w8, #0, #4, lt
	b.le	LBB30_17
; %bb.9:
	mov	w23, #1                         ; =0x1
	mov	x24, x19
	.p2align	4, , 8
LBB30_10:                               ; =>This Inner Loop Header: Depth=1
	ldr	w0, [x24]
	bl	_SDL_GetGamepadFromID
	mov	x22, x0
	cbz	w22, LBB30_13
; %bb.11:                               ;   in Loop: Header=BB30_10 Depth=1
	mov	x0, x22
	bl	_SDL_GetGamepadType
	cmp	w0, #1
	b.hi	LBB30_13
; %bb.12:                               ;   in Loop: Header=BB30_10 Depth=1
	add	w8, w21, #1
	str	w22, [x20, w21, sxtw #2]
	mov	w21, w8
LBB30_13:                               ;   in Loop: Header=BB30_10 Depth=1
	ldr	w8, [sp, #12]
	cmp	w23, w8
	b.ge	LBB30_17
; %bb.14:                               ;   in Loop: Header=BB30_10 Depth=1
	add	w24, w24, #4
	add	w23, w23, #1
	cmp	w21, #4
	b.lt	LBB30_10
	b	LBB30_17
LBB30_15:
	mov	w21, wzr
	b	LBB30_18
LBB30_16:
	mov	w21, wzr
LBB30_17:
	mov	x0, x19
	bl	_SDL_free
LBB30_18:
	mov	w0, w21
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
                                        ; -- End function
	.globl	_halo_keyboard_join_held        ; -- Begin function halo_keyboard_join_held
	.p2align	4
_halo_keyboard_join_held:               ; @halo_keyboard_join_held
; %bb.0:
Lloh215:
	adrp	x8, _keyboard_join_down@PAGE
Lloh216:
	ldr	w8, [x8, _keyboard_join_down@PAGEOFF]
	cmp	w8, #0
	cset	w0, ne
	ret
	.loh AdrpLdr	Lloh215, Lloh216
                                        ; -- End function
	.globl	_halo_keyboard_alone_set        ; -- Begin function halo_keyboard_alone_set
	.p2align	4
_halo_keyboard_alone_set:               ; @halo_keyboard_alone_set
; %bb.0:
	cmp	w0, #0
	adrp	x8, _keyboard_alone_wanted@PAGE
	cset	w9, ne
	str	w9, [x8, _keyboard_alone_wanted@PAGEOFF]
	ret
                                        ; -- End function
	.globl	_halo_keyboard_shares_gamepad   ; -- Begin function halo_keyboard_shares_gamepad
	.p2align	4
_halo_keyboard_shares_gamepad:          ; @halo_keyboard_shares_gamepad
; %bb.0:
	sub	sp, sp, #64
	mov	x0, sp
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	bl	_sdl_gamepads
	adrp	x21, _split_players@PAGE
	mov	w19, w0
	cmp	w0, #1
	ldr	w20, [x21, _split_players@PAGEOFF]
	b.ne	LBB33_8
; %bb.1:
	adrp	x22, _lone_gamepad_split@PAGE
	ldr	w8, [x22, _lone_gamepad_split@PAGEOFF]
	cmp	w20, w8
	b.eq	LBB33_4
; %bb.2:
	ldr	w0, [sp]
	bl	_gamepad_idle
	cbz	w0, LBB33_6
; %bb.3:
	str	w20, [x22, _lone_gamepad_split@PAGEOFF]
LBB33_4:
	cbz	w20, LBB33_7
LBB33_5:
	mov	w0, wzr
	b	LBB33_16
LBB33_6:
	ldr	w20, [x22, _lone_gamepad_split@PAGEOFF]
	cbnz	w20, LBB33_5
LBB33_7:
	ldr	w20, [x21, _split_players@PAGEOFF]
LBB33_8:
	adrp	x8, _keyboard_alone_wanted@PAGE
	cbz	w20, LBB33_10
; %bb.9:
	ldr	w9, [x8, _keyboard_alone_wanted@PAGEOFF]
	b	LBB33_11
LBB33_10:
	mov	w9, wzr
	str	wzr, [x8, _keyboard_alone_wanted@PAGEOFF]
LBB33_11:
	adrp	x21, _keyboard_alone@PAGE
	ldr	w20, [sp]
	ldr	w8, [x21, _keyboard_alone@PAGEOFF]
	cmp	w8, w9
	ccmp	w19, #2, #8, ne
	b.lt	LBB33_15
; %bb.12:
	mov	x0, x20
	bl	_gamepad_idle
	cbz	w0, LBB33_14
; %bb.13:
Lloh217:
	adrp	x8, _keyboard_alone_wanted@PAGE
Lloh218:
	ldr	w8, [x8, _keyboard_alone_wanted@PAGEOFF]
	str	w8, [x21, _keyboard_alone@PAGEOFF]
	b	LBB33_15
LBB33_14:
	ldr	w8, [x21, _keyboard_alone@PAGEOFF]
LBB33_15:
	and	w9, w19, #0xfffffffe
	cmp	w9, #2
	ccmp	w8, #0, #4, eq
	ccmp	w19, #0, #4, eq
	ccmp	w20, #0, #4, gt
	cset	w0, ne
LBB33_16:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpLdr	Lloh217, Lloh218
                                        ; -- End function
	.p2align	4                               ; -- Begin function port_gamepad
_port_gamepad:                          ; @port_gamepad
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	adrp	x23, _split_players@PAGE
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	w19, w2
	mov	w21, w1
	mov	x20, x0
	ldr	w22, [x23, _split_players@PAGEOFF]
	cmp	w1, #1
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	b.ne	LBB34_8
; %bb.1:
	adrp	x24, _lone_gamepad_split@PAGE
	ldr	w8, [x24, _lone_gamepad_split@PAGEOFF]
	cmp	w22, w8
	b.eq	LBB34_4
; %bb.2:
	ldr	w0, [x20]
	bl	_gamepad_idle
	cbz	w0, LBB34_6
; %bb.3:
	str	w22, [x24, _lone_gamepad_split@PAGEOFF]
LBB34_4:
	cbz	w22, LBB34_7
LBB34_5:
	cmp	w19, #1
	b.ne	LBB34_23
	b	LBB34_19
LBB34_6:
	ldr	w22, [x24, _lone_gamepad_split@PAGEOFF]
	cbnz	w22, LBB34_5
LBB34_7:
	ldr	w22, [x23, _split_players@PAGEOFF]
LBB34_8:
	adrp	x8, _keyboard_alone_wanted@PAGE
	cbz	w22, LBB34_10
; %bb.9:
	ldr	w9, [x8, _keyboard_alone_wanted@PAGEOFF]
	b	LBB34_11
LBB34_10:
	mov	w9, wzr
	str	wzr, [x8, _keyboard_alone_wanted@PAGEOFF]
LBB34_11:
	adrp	x22, _keyboard_alone@PAGE
	ldr	w8, [x22, _keyboard_alone@PAGEOFF]
	cmp	w8, w9
	ccmp	w21, #2, #8, ne
	b.lt	LBB34_15
; %bb.12:
	ldr	w0, [x20]
	bl	_gamepad_idle
	cbz	w0, LBB34_14
; %bb.13:
Lloh219:
	adrp	x8, _keyboard_alone_wanted@PAGE
Lloh220:
	ldr	w8, [x8, _keyboard_alone_wanted@PAGEOFF]
	str	w8, [x22, _keyboard_alone@PAGEOFF]
	b	LBB34_15
LBB34_14:
	ldr	w8, [x22, _keyboard_alone@PAGEOFF]
LBB34_15:
	and	w9, w21, #0xfffffffe
	cmp	w9, #2
	b.ne	LBB34_20
; %bb.16:
	cbz	w8, LBB34_20
; %bb.17:
	cbz	w19, LBB34_23
; %bb.18:
	cmp	w19, w21
	b.ne	LBB34_22
LBB34_19:
	ldr	w0, [x20]
	b	LBB34_24
LBB34_20:
	cmp	w19, w21
	b.ge	LBB34_23
LBB34_21:
	ldr	w0, [x20, w19, sxtw #2]
	b	LBB34_24
LBB34_22:
	b.lt	LBB34_21
LBB34_23:
	mov	x0, xzr
LBB34_24:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.loh AdrpLdr	Lloh219, Lloh220
                                        ; -- End function
	.globl	_halo_gamepad_count             ; -- Begin function halo_gamepad_count
	.p2align	4
_halo_gamepad_count:                    ; @halo_gamepad_count
; %bb.0:
	sub	sp, sp, #32
	mov	x0, sp
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	bl	_sdl_gamepads
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
                                        ; -- End function
	.globl	_halo_scoreboard_controller_set ; -- Begin function halo_scoreboard_controller_set
	.p2align	4
_halo_scoreboard_controller_set:        ; @halo_scoreboard_controller_set
; %bb.0:
	cmp	w0, #4
	adrp	x8, _scoreboard_picking_port@PAGE
	csinv	w9, w0, wzr, lo
	str	w9, [x8, _scoreboard_picking_port@PAGEOFF]
	ret
                                        ; -- End function
	.globl	_halo_scoreboard_controller_read ; -- Begin function halo_scoreboard_controller_read
	.p2align	4
_halo_scoreboard_controller_read:       ; @halo_scoreboard_controller_read
; %bb.0:
	cmp	w0, #3
	b.ls	LBB37_2
; %bb.1:
	mov	w0, wzr
	ret
LBB37_2:
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	mov	w22, w0
	mov	x0, sp
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	mov	x19, x3
	mov	x20, x2
	mov	x21, x1
	bl	_sdl_gamepads
	mov	w1, w0
	mov	x0, sp
	mov	w2, w22
	bl	_port_gamepad
	cbz	w0, LBB37_4
; %bb.3:
	mov	w1, #2                          ; =0x2
	mov	x22, x0
	bl	_SDL_GetGamepadAxis
	strh	w0, [x21]
	mov	x0, x22
	mov	w1, #3                          ; =0x3
	bl	_SDL_GetGamepadAxis
	mvn	w8, w0
	mov	x0, x22
	mov	w1, wzr
	strh	w8, [x20]
	bl	_SDL_GetGamepadButton
	str	w0, [x19]
	mov	x0, x22
	mov	w1, #4                          ; =0x4
	bl	_SDL_GetGamepadButton
LBB37_4:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
                                        ; -- End function
	.globl	_halo_gamepad_capture_begin     ; -- Begin function halo_gamepad_capture_begin
	.p2align	4
_halo_gamepad_capture_begin:            ; @halo_gamepad_capture_begin
; %bb.0:
	sub	sp, sp, #64
	mov	x0, sp
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	bl	_sdl_gamepads
	adrp	x21, _split_players@PAGE
	mov	w19, w0
	cmp	w0, #1
	ldr	w20, [x21, _split_players@PAGEOFF]
	b.ne	LBB38_8
; %bb.1:
	adrp	x22, _lone_gamepad_split@PAGE
	ldr	w8, [x22, _lone_gamepad_split@PAGEOFF]
	cmp	w20, w8
	b.eq	LBB38_4
; %bb.2:
	ldr	w0, [sp]
	bl	_gamepad_idle
	cbz	w0, LBB38_6
; %bb.3:
	str	w20, [x22, _lone_gamepad_split@PAGEOFF]
LBB38_4:
	cbz	w20, LBB38_7
LBB38_5:
	mov	x20, xzr
	b	LBB38_16
LBB38_6:
	ldr	w20, [x22, _lone_gamepad_split@PAGEOFF]
	cbnz	w20, LBB38_5
LBB38_7:
	ldr	w20, [x21, _split_players@PAGEOFF]
LBB38_8:
	adrp	x8, _keyboard_alone_wanted@PAGE
	cbz	w20, LBB38_10
; %bb.9:
	ldr	w9, [x8, _keyboard_alone_wanted@PAGEOFF]
	b	LBB38_11
LBB38_10:
	mov	w9, wzr
	str	wzr, [x8, _keyboard_alone_wanted@PAGEOFF]
LBB38_11:
	adrp	x21, _keyboard_alone@PAGE
	ldr	w20, [sp]
	ldr	w8, [x21, _keyboard_alone@PAGEOFF]
	cmp	w8, w9
	ccmp	w19, #2, #8, ne
	b.lt	LBB38_15
; %bb.12:
	mov	x0, x20
	bl	_gamepad_idle
	cbz	w0, LBB38_14
; %bb.13:
Lloh221:
	adrp	x8, _keyboard_alone_wanted@PAGE
Lloh222:
	ldr	w8, [x8, _keyboard_alone_wanted@PAGEOFF]
	str	w8, [x21, _keyboard_alone@PAGEOFF]
	b	LBB38_15
LBB38_14:
	ldr	w8, [x21, _keyboard_alone@PAGEOFF]
LBB38_15:
	cmp	w8, #0
	and	w8, w19, #0xfffffffe
	ccmp	w8, #2, #0, ne
	ccmp	w19, #0, #4, ne
	csel	x20, x20, xzr, gt
LBB38_16:
	mov	w19, wzr
	mov	w21, #16000                     ; =0x3e80
Lloh223:
	adrp	x22, _gamepad_capture_held@PAGE
Lloh224:
	add	x22, x22, _gamepad_capture_held@PAGEOFF
	b	LBB38_19
	.p2align	4, , 8
LBB38_17:                               ;   in Loop: Header=BB38_19 Depth=1
	mov	w0, wzr
LBB38_18:                               ;   in Loop: Header=BB38_19 Depth=1
	add	w8, w22, w19, lsl #2
	add	w19, w19, #1
	cmp	w19, #28
	str	w0, [x8]
	b.eq	LBB38_25
LBB38_19:                               ; =>This Inner Loop Header: Depth=1
	cbz	w20, LBB38_17
; %bb.20:                               ;   in Loop: Header=BB38_19 Depth=1
	cmp	w19, #26
	b.eq	LBB38_23
; %bb.21:                               ;   in Loop: Header=BB38_19 Depth=1
	cmp	w19, #27
	b.eq	LBB38_24
; %bb.22:                               ;   in Loop: Header=BB38_19 Depth=1
	mov	x0, x20
	mov	w1, w19
	bl	_SDL_GetGamepadButton
	b	LBB38_18
	.p2align	4, , 8
LBB38_23:                               ;   in Loop: Header=BB38_19 Depth=1
	mov	x0, x20
	mov	w1, #4                          ; =0x4
	bl	_SDL_GetGamepadAxis
	cmp	w0, w21
	cset	w0, gt
	b	LBB38_18
LBB38_24:
	mov	x0, x20
	mov	w1, #5                          ; =0x5
	bl	_SDL_GetGamepadAxis
	mov	w8, #16000                      ; =0x3e80
	cmp	w0, w8
Lloh225:
	adrp	x8, _gamepad_capture_held@PAGE
Lloh226:
	add	x8, x8, _gamepad_capture_held@PAGEOFF
	cset	w9, gt
	add	w8, w8, w19, lsl #2
	str	w9, [x8]
LBB38_25:
	adrp	x8, _gamepad_capture@PAGE
	mov	w9, #1                          ; =0x1
	str	w9, [x8, _gamepad_capture@PAGEOFF]
	bl	_SDL_GetTicks
	adrp	x8, _gamepad_capture_polled_ms@PAGE
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	str	x0, [x8, _gamepad_capture_polled_ms@PAGEOFF]
	add	sp, sp, #64
	ret
	.loh AdrpLdr	Lloh221, Lloh222
	.loh AdrpAdd	Lloh223, Lloh224
	.loh AdrpAdd	Lloh225, Lloh226
                                        ; -- End function
	.globl	_halo_gamepad_capture_poll      ; -- Begin function halo_gamepad_capture_poll
	.p2align	4
_halo_gamepad_capture_poll:             ; @halo_gamepad_capture_poll
; %bb.0:
	sub	sp, sp, #96
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	adrp	x22, _gamepad_capture@PAGE
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	ldr	w8, [x22, _gamepad_capture@PAGEOFF]
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	cmp	w8, #1
	b.ne	LBB39_28
; %bb.1:
	mov	x19, x0
	bl	_SDL_GetTicks
	adrp	x8, _gamepad_capture_polled_ms@PAGE
	str	x0, [x8, _gamepad_capture_polled_ms@PAGEOFF]
	mov	x0, sp
	bl	_sdl_gamepads
	adrp	x23, _split_players@PAGE
	mov	w20, w0
	cmp	w0, #1
	ldr	w21, [x23, _split_players@PAGEOFF]
	b.ne	LBB39_9
; %bb.2:
	adrp	x24, _lone_gamepad_split@PAGE
	ldr	w8, [x24, _lone_gamepad_split@PAGEOFF]
	cmp	w21, w8
	b.eq	LBB39_5
; %bb.3:
	ldr	w0, [sp]
	bl	_gamepad_idle
	cbz	w0, LBB39_7
; %bb.4:
	str	w21, [x24, _lone_gamepad_split@PAGEOFF]
LBB39_5:
	cbz	w21, LBB39_8
LBB39_6:
	mov	x21, xzr
	b	LBB39_17
LBB39_7:
	ldr	w21, [x24, _lone_gamepad_split@PAGEOFF]
	cbnz	w21, LBB39_6
LBB39_8:
	ldr	w21, [x23, _split_players@PAGEOFF]
LBB39_9:
	adrp	x8, _keyboard_alone_wanted@PAGE
	cbz	w21, LBB39_11
; %bb.10:
	ldr	w9, [x8, _keyboard_alone_wanted@PAGEOFF]
	b	LBB39_12
LBB39_11:
	mov	w9, wzr
	str	wzr, [x8, _keyboard_alone_wanted@PAGEOFF]
LBB39_12:
	adrp	x23, _keyboard_alone@PAGE
	ldr	w21, [sp]
	ldr	w8, [x23, _keyboard_alone@PAGEOFF]
	cmp	w8, w9
	ccmp	w20, #2, #8, ne
	b.lt	LBB39_16
; %bb.13:
	mov	x0, x21
	bl	_gamepad_idle
	cbz	w0, LBB39_15
; %bb.14:
Lloh227:
	adrp	x8, _keyboard_alone_wanted@PAGE
Lloh228:
	ldr	w8, [x8, _keyboard_alone_wanted@PAGEOFF]
	str	w8, [x23, _keyboard_alone@PAGEOFF]
	b	LBB39_16
LBB39_15:
	ldr	w8, [x23, _keyboard_alone@PAGEOFF]
LBB39_16:
	cmp	w8, #0
	and	w8, w20, #0xfffffffe
	ccmp	w8, #2, #0, ne
	ccmp	w20, #0, #4, ne
	csel	x21, x21, xzr, gt
LBB39_17:
	mov	w20, wzr
	mov	w23, #16001                     ; =0x3e81
	mov	w24, #16000                     ; =0x3e80
Lloh229:
	adrp	x25, _gamepad_capture_held@PAGE
Lloh230:
	add	x25, x25, _gamepad_capture_held@PAGEOFF
	b	LBB39_20
	.p2align	4, , 8
LBB39_18:                               ;   in Loop: Header=BB39_20 Depth=1
	mov	w8, wzr
LBB39_19:                               ;   in Loop: Header=BB39_20 Depth=1
	add	w20, w20, #1
	str	w8, [x26]
	cmp	w20, #28
	b.eq	LBB39_28
LBB39_20:                               ; =>This Inner Loop Header: Depth=1
	add	w26, w25, w20, lsl #2
	cbz	w21, LBB39_18
; %bb.21:                               ;   in Loop: Header=BB39_20 Depth=1
	add	w8, w20, #523
	mov	x0, x21
	cmp	w8, #549
	b.eq	LBB39_24
; %bb.22:                               ;   in Loop: Header=BB39_20 Depth=1
	cmp	w8, #550
	b.ne	LBB39_25
; %bb.23:                               ;   in Loop: Header=BB39_20 Depth=1
	mov	w1, #5                          ; =0x5
	bl	_SDL_GetGamepadAxis
	cmp	w0, w24
	b.le	LBB39_18
	b	LBB39_26
	.p2align	4, , 8
LBB39_24:                               ;   in Loop: Header=BB39_20 Depth=1
	mov	w1, #4                          ; =0x4
	bl	_SDL_GetGamepadAxis
	cmp	w0, w23
	b.lt	LBB39_18
	b	LBB39_26
	.p2align	4, , 8
LBB39_25:                               ;   in Loop: Header=BB39_20 Depth=1
	mov	w1, w20
	bl	_SDL_GetGamepadButton
	tbz	w0, #0, LBB39_18
LBB39_26:                               ;   in Loop: Header=BB39_20 Depth=1
	ldr	w9, [x26]
	mov	w8, #1                          ; =0x1
	cbnz	w9, LBB39_19
; %bb.27:
	cmp	w20, #4
	mov	w11, #3                         ; =0x3
	cinc	w8, w8, eq
	cmp	w20, #6
	mov	w9, #2                          ; =0x2
	add	w10, w20, #523
	csel	w0, w11, w8, eq
	str	w9, [x22, _gamepad_capture@PAGEOFF]
	str	w10, [x19]
	b	LBB39_29
LBB39_28:
	mov	w0, wzr
LBB39_29:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.loh AdrpLdr	Lloh227, Lloh228
	.loh AdrpAdd	Lloh229, Lloh230
                                        ; -- End function
	.globl	_halo_gamepad_capture_end       ; -- Begin function halo_gamepad_capture_end
	.p2align	4
_halo_gamepad_capture_end:              ; @halo_gamepad_capture_end
; %bb.0:
	adrp	x8, _gamepad_capture@PAGE
	ldr	w9, [x8, _gamepad_capture@PAGEOFF]
	cmp	w9, #1
	b.ne	LBB40_2
; %bb.1:
	mov	w9, #2                          ; =0x2
	str	w9, [x8, _gamepad_capture@PAGEOFF]
LBB40_2:
	ret
                                        ; -- End function
	.globl	_halo_virtual_gamepads_start    ; -- Begin function halo_virtual_gamepads_start
	.p2align	4
_halo_virtual_gamepads_start:           ; @halo_virtual_gamepads_start
; %bb.0:
	ret
                                        ; -- End function
	.globl	_XInitDevices                   ; -- Begin function XInitDevices
	.p2align	4
_XInitDevices:                          ; @XInitDevices
; %bb.0:
	b	_platform_sdl_initialize
                                        ; -- End function
	.globl	_XGetDeviceChanges              ; -- Begin function XGetDeviceChanges
	.p2align	4
_XGetDeviceChanges:                     ; @XGetDeviceChanges
; %bb.0:
	sub	sp, sp, #128
Lloh231:
	adrp	x8, _XDEVICE_TYPE_GAMEPAD_TABLE@GOTPAGE
	stp	x28, x27, [sp, #32]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	mov	x19, x2
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	mov	x20, x1
Lloh232:
	ldr	w8, [x8, _XDEVICE_TYPE_GAMEPAD_TABLE@GOTPAGEOFF]
	add	x29, sp, #112
	str	wzr, [x1]
	str	wzr, [x2]
	cmp	w0, w8
	b.eq	LBB43_3
; %bb.1:
Lloh233:
	adrp	x9, _XDEVICE_TYPE_DEBUG_KEYBOARD_TABLE@GOTPAGE
	adrp	x8, _reported_keyboard@PAGE
Lloh234:
	ldr	w9, [x9, _XDEVICE_TYPE_DEBUG_KEYBOARD_TABLE@GOTPAGEOFF]
	ldrb	w10, [x8, _reported_keyboard@PAGEOFF]
	cmp	w0, w9
	cset	w9, ne
	orr	w9, w9, w10
	tbnz	w9, #0, LBB43_25
; %bb.2:
	mov	w0, #1                          ; =0x1
	str	w0, [x20]
	strb	w0, [x8, _reported_keyboard@PAGEOFF]
	b	LBB43_28
LBB43_3:
	add	x0, sp, #16
	bl	_sdl_gamepads
	mov	w21, w0
	add	x0, sp, #16
	mov	w1, w21
	mov	w2, wzr
	bl	_port_gamepad
	mov	x1, x0
	mov	w0, wzr
	bl	_controller_device_update
	add	x0, sp, #16
	mov	w1, w21
	mov	w2, #1                          ; =0x1
	bl	_port_gamepad
	mov	x1, x0
	mov	w0, #1                          ; =0x1
	bl	_controller_device_update
	add	x0, sp, #16
	mov	w1, w21
	mov	w2, #2                          ; =0x2
	bl	_port_gamepad
	mov	x1, x0
	mov	w0, #2                          ; =0x2
	bl	_controller_device_update
	add	x0, sp, #16
	mov	w1, w21
	mov	w2, #3                          ; =0x3
	mov	w22, #3                         ; =0x3
	bl	_port_gamepad
	mov	x1, x0
	mov	w0, #3                          ; =0x3
	bl	_controller_device_update
	add	x0, sp, #16
	mov	w1, w21
	mov	w2, #1                          ; =0x1
	bl	_port_gamepad
	cmp	w0, #0
	add	x0, sp, #16
	mov	w1, w21
	mov	w2, #2                          ; =0x2
	csinc	w22, w22, wzr, ne
	bl	_port_gamepad
	cmp	w0, #0
	add	x0, sp, #16
	mov	w1, w21
	mov	w2, #3                          ; =0x3
	mov	w8, #4                          ; =0x4
	csel	w8, wzr, w8, eq
	orr	w22, w8, w22
	bl	_port_gamepad
	adrp	x25, _reported_gamepads@PAGE
	mov	w9, #8                          ; =0x8
	cmp	w0, #0
	csel	w9, wzr, w9, eq
	ldr	w8, [x25, _reported_gamepads@PAGEOFF]
	orr	w26, w9, w22
	bic	w9, w26, w8
	bic	w10, w8, w26
	cmp	w26, w8
	str	w9, [x20]
	str	w10, [x19]
	b.eq	LBB43_24
; %bb.4:
	add	x0, sp, #16
	str	wzr, [sp, #16]
	bl	_SDL_GetGamepads
	ldr	w8, [sp, #16]
	mov	x21, x0
Lloh235:
	adrp	x0, l_.str.70@PAGE
Lloh236:
	add	x0, x0, l_.str.70@PAGEOFF
	str	w8, [sp]
	bl	_platform_log
	cbz	w21, LBB43_23
; %bb.5:
	ldr	w8, [sp, #16]
	cmp	w8, #1
	b.lt	LBB43_23
; %bb.6:
	mov	w24, wzr
	mov	w27, wzr
Lloh237:
	adrp	x22, l_.str.72@PAGE
Lloh238:
	add	x22, x22, l_.str.72@PAGEOFF
Lloh239:
	adrp	x23, l_.str.73@PAGE
Lloh240:
	add	x23, x23, l_.str.73@PAGEOFF
	b	LBB43_9
LBB43_7:                                ;   in Loop: Header=BB43_9 Depth=1
	ldr	w8, [x28]
	mov	x0, x23
	str	w8, [sp]
	bl	_platform_log
	.p2align	4, , 8
LBB43_8:                                ;   in Loop: Header=BB43_9 Depth=1
	ldr	w8, [sp, #16]
	add	w24, w24, #1
	cmp	w24, w8
	b.ge	LBB43_13
LBB43_9:                                ; =>This Inner Loop Header: Depth=1
	add	w28, w21, w24, lsl #2
	ldr	w0, [x28]
	bl	_SDL_GetGamepadFromID
	cbz	w0, LBB43_8
; %bb.10:                               ;   in Loop: Header=BB43_9 Depth=1
	bl	_SDL_GetGamepadType
	cmp	w0, #2
	b.lo	LBB43_8
; %bb.11:                               ;   in Loop: Header=BB43_9 Depth=1
	cmp	w27, #3
	b.gt	LBB43_7
; %bb.12:                               ;   in Loop: Header=BB43_9 Depth=1
	ldr	w8, [x28]
	mov	w9, w0
	mov	x0, x22
	add	w28, w27, #1
	str	w27, [sp]
	stp	w8, w9, [sp, #4]
	bl	_platform_log
	mov	w27, w28
	b	LBB43_8
LBB43_13:
	cmp	w8, #1
	b.lt	LBB43_23
; %bb.14:
	mov	w28, wzr
Lloh241:
	adrp	x22, l_.str.71@PAGE
Lloh242:
	add	x22, x22, l_.str.71@PAGEOFF
Lloh243:
	adrp	x24, l_.str.73@PAGE
Lloh244:
	add	x24, x24, l_.str.73@PAGEOFF
	b	LBB43_18
	.p2align	4, , 8
LBB43_15:                               ;   in Loop: Header=BB43_18 Depth=1
	ldr	w8, [x23]
	mov	x0, x22
LBB43_16:                               ;   in Loop: Header=BB43_18 Depth=1
	str	w8, [sp]
	bl	_platform_log
LBB43_17:                               ;   in Loop: Header=BB43_18 Depth=1
	ldr	w8, [sp, #16]
	add	w28, w28, #1
	cmp	w28, w8
	b.ge	LBB43_23
LBB43_18:                               ; =>This Inner Loop Header: Depth=1
	add	w23, w21, w28, lsl #2
	ldr	w0, [x23]
	bl	_SDL_GetGamepadFromID
	cbz	w0, LBB43_15
; %bb.19:                               ;   in Loop: Header=BB43_18 Depth=1
	bl	_SDL_GetGamepadType
	cmp	w0, #1
	b.hi	LBB43_17
; %bb.20:                               ;   in Loop: Header=BB43_18 Depth=1
	cmp	w27, #4
	b.ge	LBB43_22
; %bb.21:                               ;   in Loop: Header=BB43_18 Depth=1
	ldr	w8, [x23]
	mov	w9, w0
Lloh245:
	adrp	x0, l_.str.72@PAGE
Lloh246:
	add	x0, x0, l_.str.72@PAGEOFF
	add	w23, w27, #1
	str	w27, [sp]
	stp	w8, w9, [sp, #4]
	bl	_platform_log
	mov	w27, w23
	b	LBB43_17
LBB43_22:                               ;   in Loop: Header=BB43_18 Depth=1
	ldr	w8, [x23]
	mov	x0, x24
	b	LBB43_16
LBB43_23:
	mov	x0, x21
	bl	_SDL_free
LBB43_24:
	str	w26, [x25, _reported_gamepads@PAGEOFF]
LBB43_25:
	ldr	w8, [x20]
	cbz	w8, LBB43_27
; %bb.26:
	mov	w0, #1                          ; =0x1
	b	LBB43_28
LBB43_27:
	ldr	w8, [x19]
	cmp	w8, #0
	cset	w0, ne
LBB43_28:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.loh AdrpLdrGot	Lloh231, Lloh232
	.loh AdrpLdrGot	Lloh233, Lloh234
	.loh AdrpAdd	Lloh235, Lloh236
	.loh AdrpAdd	Lloh239, Lloh240
	.loh AdrpAdd	Lloh237, Lloh238
	.loh AdrpAdd	Lloh243, Lloh244
	.loh AdrpAdd	Lloh241, Lloh242
	.loh AdrpAdd	Lloh245, Lloh246
                                        ; -- End function
	.globl	_XInputOpen                     ; -- Begin function XInputOpen
	.p2align	4
_XInputOpen:                            ; @XInputOpen
; %bb.0:
Lloh247:
	adrp	x8, _XDEVICE_TYPE_GAMEPAD_TABLE@GOTPAGE
	cmp	w1, #3
Lloh248:
	ldr	w8, [x8, _XDEVICE_TYPE_GAMEPAD_TABLE@GOTPAGEOFF]
	ccmp	w0, w8, #0, ls
	b.ne	LBB44_2
; %bb.1:
	mov	w8, #28                         ; =0x1c
Lloh249:
	adrp	x9, _controllers@PAGE
Lloh250:
	add	x9, x9, _controllers@PAGEOFF
	smaddl	x0, w1, w8, x9
	mov	w8, #1                          ; =0x1
	stur	xzr, [x0, #12]
	stur	xzr, [x0, #4]
	stur	xzr, [x0, #20]
	b	LBB44_5
LBB44_2:
Lloh251:
	adrp	x8, _XDEVICE_TYPE_DEBUG_KEYBOARD_TABLE@GOTPAGE
Lloh252:
	ldr	w8, [x8, _XDEVICE_TYPE_DEBUG_KEYBOARD_TABLE@GOTPAGEOFF]
	cmp	w0, w8
	b.ne	LBB44_6
; %bb.3:
	cbnz	w1, LBB44_6
; %bb.4:
	mov	w8, #1                          ; =0x1
Lloh253:
	adrp	x0, _keyboard_device@PAGE
Lloh254:
	add	x0, x0, _keyboard_device@PAGEOFF
LBB44_5:
	str	w8, [x0]
	ret
LBB44_6:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	w0, #1167                       ; =0x48f
	mov	x29, sp
	bl	_SetLastError
	mov	x0, xzr
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh247, Lloh248
	.loh AdrpAdd	Lloh249, Lloh250
	.loh AdrpLdrGot	Lloh251, Lloh252
	.loh AdrpAdd	Lloh253, Lloh254
                                        ; -- End function
	.globl	_XInputClose                    ; -- Begin function XInputClose
	.p2align	4
_XInputClose:                           ; @XInputClose
; %bb.0:
	cbz	w0, LBB45_2
; %bb.1:
	str	wzr, [x0]
LBB45_2:
	ret
                                        ; -- End function
	.globl	_halo_linux_debug_camera_input  ; -- Begin function halo_linux_debug_camera_input
	.p2align	4
_halo_linux_debug_camera_input:         ; @halo_linux_debug_camera_input
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
Lloh255:
	adrp	x23, _mouse_lock@PAGE
Lloh256:
	add	x23, x23, _mouse_lock@PAGEOFF
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	mov	x22, x0
	mov	x0, x23
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	mov	x19, x3
	mov	x20, x2
	mov	x21, x1
	bl	_pthread_mutex_lock
Lloh257:
	adrp	x8, _debug_cam_middle@PAGE
Lloh258:
	adrp	x9, _debug_cam_up@PAGE
	mov	x0, x23
Lloh259:
	ldr	w8, [x8, _debug_cam_middle@PAGEOFF]
	str	w8, [x22]
Lloh260:
	ldr	w8, [x9, _debug_cam_up@PAGEOFF]
Lloh261:
	adrp	x9, _debug_cam_down@PAGE
	str	w8, [x21]
Lloh262:
	ldr	w8, [x9, _debug_cam_down@PAGEOFF]
Lloh263:
	adrp	x9, _debug_cam_wheel@PAGE
	str	w8, [x20]
	ldr	s0, [x9, _debug_cam_wheel@PAGEOFF]
	str	s0, [x19]
	str	wzr, [x9, _debug_cam_wheel@PAGEOFF]
	bl	_pthread_mutex_unlock
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	mov	w0, #1                          ; =0x1
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.loh AdrpAdrp	Lloh261, Lloh263
	.loh AdrpLdr	Lloh261, Lloh262
	.loh AdrpAdrp	Lloh258, Lloh261
	.loh AdrpLdr	Lloh258, Lloh260
	.loh AdrpLdr	Lloh257, Lloh259
	.loh AdrpAdd	Lloh255, Lloh256
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ; -- Begin function XInputGetState
lCPI47_0:
	.quad	0x3feccccccccccccd              ; double 0.90000000000000002
lCPI47_1:
	.quad	0x3fd999999999999a              ; double 0.40000000000000002
lCPI47_2:
	.quad	0x3fb999999999999a              ; double 0.10000000000000001
lCPI47_3:
	.quad	0x3fc999999999999a              ; double 0.20000000000000001
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_XInputGetState
	.p2align	4
_XInputGetState:                        ; @XInputGetState
; %bb.0:
	stp	d9, d8, [sp, #-112]!            ; 16-byte Folded Spill
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	sub	sp, sp, #752
	mov	x19, x1
	mov	x27, x0
Lloh264:
	adrp	x8, _controllers@PAGE
Lloh265:
	add	x8, x8, _controllers@PAGEOFF
	cmp	w27, w8
	b.eq	LBB47_6
; %bb.1:
	add	w8, w8, #28
	cmp	w27, w8
	b.eq	LBB47_8
; %bb.2:
Lloh266:
	adrp	x8, _controllers@PAGE
Lloh267:
	add	x8, x8, _controllers@PAGEOFF
	add	w8, w8, #56
	cmp	w27, w8
	b.eq	LBB47_10
; %bb.3:
Lloh268:
	adrp	x8, _controllers@PAGE+84
Lloh269:
	add	x8, x8, _controllers@PAGEOFF+84
	cmp	w27, w8
	b.ne	LBB47_18
; %bb.4:
	ldr	w8, [x8]
	cbz	w8, LBB47_18
; %bb.5:
	mov	w26, #3                         ; =0x3
	b	LBB47_12
LBB47_6:
Lloh270:
	adrp	x8, _controllers@PAGE
Lloh271:
	ldr	w8, [x8, _controllers@PAGEOFF]
	cbz	w8, LBB47_18
; %bb.7:
	mov	w26, wzr
	b	LBB47_12
LBB47_8:
Lloh272:
	adrp	x8, _controllers@PAGE+28
Lloh273:
	ldr	w8, [x8, _controllers@PAGEOFF+28]
	cbz	w8, LBB47_18
; %bb.9:
	mov	w26, #1                         ; =0x1
	b	LBB47_12
LBB47_10:
Lloh274:
	adrp	x8, _controllers@PAGE+56
Lloh275:
	ldr	w8, [x8, _controllers@PAGEOFF+56]
	cbz	w8, LBB47_18
; %bb.11:
	mov	w26, #2                         ; =0x2
LBB47_12:
Lloh276:
	adrp	x20, _controllers@PAGE
Lloh277:
	add	x20, x20, _controllers@PAGEOFF
	sub	x25, x29, #144
	stp	xzr, xzr, [x19]
	stur	xzr, [x19, #14]
	bl	_platform_pump_events
	bl	_pc_menu_split_players
	cmp	w0, #0
	adrp	x8, _split_players@PAGE
	cset	w9, ne
	sub	x0, x29, #120
	str	w9, [x8, _split_players@PAGEOFF]
	bl	_sdl_gamepads
	mov	w1, w0
	sub	x0, x29, #120
	mov	w2, w26
	bl	_port_gamepad
	mov	x22, x0
	mov	w0, w26
	mov	x1, x22
	bl	_controller_device_update
	cmp	w27, w20
	b.eq	LBB47_19
; %bb.13:
	cmp	w22, #0
	stp	xzr, xzr, [x25]
	cset	w23, ne
	sturh	wzr, [x29, #-128]
LBB47_14:
Lloh278:
	adrp	x8, _controllers@PAGE
Lloh279:
	add	x8, x8, _controllers@PAGEOFF
	cmp	w27, w8
	eor	w8, w23, #0x1
	csinc	w8, w8, wzr, ne
	tbnz	w8, #0, LBB47_89
; %bb.15:
Lloh280:
	adrp	x8, _scoreboard_picking_port@PAGE
	sub	x1, x29, #144
	mov	x0, x22
	mov	x2, xzr
Lloh281:
	ldr	w8, [x8, _scoreboard_picking_port@PAGEOFF]
	cmp	w8, w26
LBB47_16:
	cset	w3, eq
	bl	_sdl_gamepad_state
LBB47_17:
	mov	w23, #1                         ; =0x1
	b	LBB47_89
LBB47_18:
	mov	w0, #1167                       ; =0x48f
	stp	xzr, xzr, [x19]
	stur	xzr, [x19, #14]
	b	LBB47_405
LBB47_19:
	add	x0, sp, #156
	mov	w1, #1                          ; =0x1
	bl	_platform_input_read
Lloh282:
	adrp	x0, _mouse_lock@PAGE
Lloh283:
	add	x0, x0, _mouse_lock@PAGEOFF
	bl	_pthread_mutex_lock
	adrp	x8, _mouse_polls_unconsumed@PAGE
	ldr	w9, [x8, _mouse_polls_unconsumed@PAGEOFF]
	add	w9, w9, #1
	cmp	w9, #5
	str	w9, [x8, _mouse_polls_unconsumed@PAGEOFF]
	b.lo	LBB47_21
; %bb.20:
	adrp	x8, _mouse_pending_x@PAGE
	adrp	x9, _mouse_pending_y@PAGE
	str	wzr, [x8, _mouse_pending_x@PAGEOFF]
	str	wzr, [x9, _mouse_pending_y@PAGEOFF]
LBB47_21:
	ldr	w8, [sp, #692]
	adrp	x21, _mouse_wheel_accumulated@PAGE
	cbnz	w8, LBB47_27
; %bb.22:
	adrp	x8, _mouse_pending_x@PAGE
	adrp	x9, _mouse_pending_y@PAGE
	ldr	s1, [sp, #676]
	ldr	s0, [sp, #680]
	ldr	s2, [x8, _mouse_pending_x@PAGEOFF]
	ldr	s3, [x9, _mouse_pending_y@PAGEOFF]
	fcmp	s1, #0.0
	fadd	s1, s1, s2
	fadd	s2, s0, s3
	str	s1, [x8, _mouse_pending_x@PAGEOFF]
	str	s2, [x9, _mouse_pending_y@PAGEOFF]
	b.ne	LBB47_24
; %bb.23:
	fcmp	s0, #0.0
	b.eq	LBB47_25
LBB47_24:
	bl	_SDL_GetTicks
	adrp	x8, _mouse_aimed_ms@PAGE
	str	x0, [x8, _mouse_aimed_ms@PAGEOFF]
LBB47_25:
	ldr	s0, [sp, #684]
	ldr	s1, [x21, _mouse_wheel_accumulated@PAGEOFF]
	fcmp	s0, #0.0
	fadd	s1, s0, s1
	str	s1, [x21, _mouse_wheel_accumulated@PAGEOFF]
	b.eq	LBB47_27
; %bb.26:
	bl	_SDL_GetTicks
	adrp	x8, _wheel_moved_ms@PAGE
	str	x0, [x8, _wheel_moved_ms@PAGEOFF]
LBB47_27:
Lloh284:
	adrp	x24, _mouse_lock@PAGE
Lloh285:
	add	x24, x24, _mouse_lock@PAGEOFF
	mov	x0, x24
	bl	_pthread_mutex_unlock
	bl	_SDL_GetTicks
	mov	x23, x0
	mov	x0, x24
	bl	_pthread_mutex_lock
	bl	_network_chat_typing
	adrp	x8, _wheel_scrolling@PAGE
	cbz	w0, LBB47_84
; %bb.28:
	fmov	s1, #1.00000000
	ldr	s0, [x21, _mouse_wheel_accumulated@PAGEOFF]
	adrp	x9, _chat_wheel_steps@PAGE
	ldr	w10, [x9, _chat_wheel_steps@PAGEOFF]
	fcmp	s0, s1
	b.lt	LBB47_32
; %bb.29:
	fmov	s2, #-1.00000000
	.p2align	4, , 8
LBB47_30:                               ; =>This Inner Loop Header: Depth=1
	fadd	s0, s0, s2
	add	w10, w10, #1
	fcmp	s0, s1
	b.ge	LBB47_30
; %bb.31:
	str	w10, [x9, _chat_wheel_steps@PAGEOFF]
	str	s0, [x21, _mouse_wheel_accumulated@PAGEOFF]
LBB47_32:
	fmov	s1, #-1.00000000
	fcmp	s0, s1
	b.hi	LBB47_36
; %bb.33:
	fmov	s2, #1.00000000
	.p2align	4, , 8
LBB47_34:                               ; =>This Inner Loop Header: Depth=1
	fadd	s0, s0, s2
	sub	w10, w10, #1
	fcmp	s0, s1
	b.ls	LBB47_34
; %bb.35:
	str	w10, [x9, _chat_wheel_steps@PAGEOFF]
	str	s0, [x21, _mouse_wheel_accumulated@PAGEOFF]
LBB47_36:
	strb	wzr, [x8, _wheel_scrolling@PAGEOFF]
LBB47_37:
Lloh286:
	adrp	x0, _mouse_lock@PAGE
Lloh287:
	add	x0, x0, _mouse_lock@PAGEOFF
	bl	_pthread_mutex_unlock
Lloh288:
	adrp	x8, _text_typing@PAGE
	ldr	w9, [sp, #700]
	adrp	x10, _keyboard_actions_held@PAGE
Lloh289:
	ldr	w8, [x8, _text_typing@PAGEOFF]
	str	wzr, [x10, _keyboard_actions_held@PAGEOFF]
	cmp	w8, #0
	mov	w8, #2                          ; =0x2
	csel	w8, wzr, w8, eq
	cmp	w9, #0
	cinc	w20, w8, ne
	bl	_console_is_active
	mov	w8, #4                          ; =0x4
	cmp	w0, #0
	csel	w21, wzr, w8, eq
	bl	_network_chat_typing
	mov	w8, #8                          ; =0x8
	cmp	w0, #0
	csel	w8, wzr, w8, eq
	orr	w21, w21, w8
	bl	_overlay_menu_typing
	adrp	x8, _keys_held_over_switch.context@PAGE
	cmp	w0, #0
	mov	w9, #16                         ; =0x10
	csel	w9, wzr, w9, eq
	ldr	w10, [x8, _keys_held_over_switch.context@PAGEOFF]
	orr	w9, w21, w9
	orr	w9, w20, w9
	cmp	w10, w9
	b.eq	LBB47_39
; %bb.38:
Lloh290:
	adrp	x0, _keys_held_over_switch.held@PAGE
Lloh291:
	add	x0, x0, _keys_held_over_switch.held@PAGEOFF
	add	x1, sp, #156
	mov	w2, #512                        ; =0x200
	str	w9, [x8, _keys_held_over_switch.context@PAGEOFF]
	bl	_memcpy
LBB47_39:
	add	x8, sp, #156
	mov	w9, #512                        ; =0x200
	orr	w8, w8, #0x3
Lloh292:
	adrp	x10, _keys_held_over_switch.held@PAGE+3
Lloh293:
	add	x10, x10, _keys_held_over_switch.held@PAGEOFF+3
	b	LBB47_43
	.p2align	4, , 8
LBB47_40:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w10, #4
LBB47_41:                               ;   in Loop: Header=BB47_43 Depth=1
	strb	wzr, [x11]
LBB47_42:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w10, w10, #8
	add	w8, w8, #8
	subs	w9, w9, #8
	b.eq	LBB47_80
LBB47_43:                               ; =>This Inner Loop Header: Depth=1
	sub	w11, w8, #3
	ldrb	w11, [x11]
	cbz	w11, LBB47_46
; %bb.44:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w10, #3
	ldrb	w11, [x11]
	cbz	w11, LBB47_48
; %bb.45:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w8, #3
	b	LBB47_47
	.p2align	4, , 8
LBB47_46:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w10, #3
LBB47_47:                               ;   in Loop: Header=BB47_43 Depth=1
	strb	wzr, [x11]
LBB47_48:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w8, #2
	ldrb	w11, [x11]
	cbz	w11, LBB47_51
; %bb.49:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w10, #2
	ldrb	w11, [x11]
	cbz	w11, LBB47_53
; %bb.50:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w8, #2
	b	LBB47_52
	.p2align	4, , 8
LBB47_51:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w10, #2
LBB47_52:                               ;   in Loop: Header=BB47_43 Depth=1
	strb	wzr, [x11]
LBB47_53:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w8, #1
	ldrb	w11, [x11]
	cbz	w11, LBB47_56
; %bb.54:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w10, #1
	ldrb	w11, [x11]
	cbz	w11, LBB47_58
; %bb.55:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w8, #1
	b	LBB47_57
	.p2align	4, , 8
LBB47_56:                               ;   in Loop: Header=BB47_43 Depth=1
	sub	w11, w10, #1
LBB47_57:                               ;   in Loop: Header=BB47_43 Depth=1
	strb	wzr, [x11]
LBB47_58:                               ;   in Loop: Header=BB47_43 Depth=1
	ldrb	w11, [x8]
	cbz	w11, LBB47_61
; %bb.59:                               ;   in Loop: Header=BB47_43 Depth=1
	ldrb	w11, [x10]
	cbz	w11, LBB47_62
; %bb.60:                               ;   in Loop: Header=BB47_43 Depth=1
	strb	wzr, [x8]
	b	LBB47_62
	.p2align	4, , 8
LBB47_61:                               ;   in Loop: Header=BB47_43 Depth=1
	strb	wzr, [x10]
LBB47_62:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w8, #1
	ldrb	w11, [x11]
	cbz	w11, LBB47_65
; %bb.63:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w10, #1
	ldrb	w11, [x11]
	cbz	w11, LBB47_67
; %bb.64:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w8, #1
	b	LBB47_66
	.p2align	4, , 8
LBB47_65:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w10, #1
LBB47_66:                               ;   in Loop: Header=BB47_43 Depth=1
	strb	wzr, [x11]
LBB47_67:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w8, #2
	ldrb	w11, [x11]
	cbz	w11, LBB47_70
; %bb.68:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w10, #2
	ldrb	w11, [x11]
	cbz	w11, LBB47_72
; %bb.69:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w8, #2
	b	LBB47_71
	.p2align	4, , 8
LBB47_70:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w10, #2
LBB47_71:                               ;   in Loop: Header=BB47_43 Depth=1
	strb	wzr, [x11]
LBB47_72:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w8, #3
	ldrb	w11, [x11]
	cbz	w11, LBB47_75
; %bb.73:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w10, #3
	ldrb	w11, [x11]
	cbz	w11, LBB47_77
; %bb.74:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w8, #3
	b	LBB47_76
	.p2align	4, , 8
LBB47_75:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w10, #3
LBB47_76:                               ;   in Loop: Header=BB47_43 Depth=1
	strb	wzr, [x11]
LBB47_77:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w8, #4
	ldrb	w11, [x11]
	cbz	w11, LBB47_40
; %bb.78:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w10, #4
	ldrb	w11, [x11]
	cbz	w11, LBB47_42
; %bb.79:                               ;   in Loop: Header=BB47_43 Depth=1
	add	w11, w8, #4
	b	LBB47_41
LBB47_80:
	bl	_bindings_read
	stp	xzr, xzr, [x25]
	sturh	wzr, [x29, #-128]
	cbz	w22, LBB47_88
; %bb.81:
	adrp	x20, _gamepad_capture@PAGE
	ldr	w8, [x20, _gamepad_capture@PAGEOFF]
	cmp	w8, #1
	b.ne	LBB47_198
; %bb.82:
	bl	_SDL_GetTicks
Lloh294:
	adrp	x8, _gamepad_capture_polled_ms@PAGE
Lloh295:
	ldr	x8, [x8, _gamepad_capture_polled_ms@PAGEOFF]
	sub	x8, x0, x8
	cmp	x8, #501
	b.lo	LBB47_197
; %bb.83:
	mov	w8, #2                          ; =0x2
	str	w8, [x20, _gamepad_capture@PAGEOFF]
	b	LBB47_200
LBB47_84:
	ldrb	w9, [x8, _wheel_scrolling@PAGEOFF]
	tbz	w9, #0, LBB47_166
; %bb.85:
Lloh296:
	adrp	x9, _wheel_press_until_ms@PAGE
Lloh297:
	ldr	x9, [x9, _wheel_press_until_ms@PAGEOFF]
	cmp	x23, x9
	b.lo	LBB47_37
; %bb.86:
Lloh298:
	adrp	x9, _wheel_moved_ms@PAGE
Lloh299:
	ldr	x9, [x9, _wheel_moved_ms@PAGEOFF]
	sub	x9, x23, x9
	cmp	x9, #200
	b.lo	LBB47_37
; %bb.87:
	strb	wzr, [x8, _wheel_scrolling@PAGEOFF]
	str	wzr, [x21, _mouse_wheel_accumulated@PAGEOFF]
	b	LBB47_37
LBB47_88:
	mov	w23, wzr
LBB47_89:
	ldurh	w8, [x29, #-144]
Lloh300:
	adrp	x21, _chat_pad@PAGE
Lloh301:
	add	x21, x21, _chat_pad@PAGEOFF
	ldursb	w9, [x29, #-142]
	ldursb	w10, [x29, #-141]
	sub	x1, x29, #144
	ldursb	w11, [x29, #-140]
	mov	w0, w26
	lsr	w12, w8, #4
	and	w8, w8, #0xf
	cmp	w9, #0
	ldurb	w9, [x29, #-139]
	bfi	w8, w12, #8, #1
	orr	w12, w8, #0x10
	csel	w8, w12, w8, mi
	cmp	w10, #0
	orr	w10, w8, #0x20
	ldursh	w12, [x29, #-132]
	csel	w8, w10, w8, mi
	cmp	w11, #0
	orr	w11, w8, #0x40
	and	w9, w9, #0x80
	csel	w8, w11, w8, mi
	mov	w10, #22000                     ; =0x55f0
	orr	w8, w8, w9
	ldursh	w11, [x29, #-134]
	cmp	w12, w10
	orr	w9, w8, #0x200
	csel	w8, w9, w8, gt
	mov	w9, #-22000                     ; =0xffffaa10
	cmp	w12, w9
	orr	w12, w8, #0x400
	csel	w8, w12, w8, lt
	ldursb	w12, [x29, #-137]
	cmp	w11, w9
	orr	w9, w8, #0x800
	csel	w8, w9, w8, lt
	ldursb	w9, [x29, #-138]
	cmp	w11, w10
	orr	w10, w8, #0x1000
	csel	w8, w10, w8, gt
	cmp	w12, #0
	orr	w10, w8, #0x2000
	mov	w2, w23
	csel	w8, w10, w8, mi
	cmp	w9, #0
	orr	w9, w8, #0x4000
Lloh302:
	adrp	x20, _controllers@PAGE
Lloh303:
	add	x20, x20, _controllers@PAGEOFF
	csel	w8, w9, w8, mi
Lloh304:
	adrp	x9, _chat_physical_pad@PAGE
Lloh305:
	add	x9, x9, _chat_physical_pad@PAGEOFF
	str	w8, [x21, w26, uxtw #2]
	str	w8, [x9, w26, uxtw #2]
	bl	_controller_remap_input
	mov	w28, w0
	cmp	w27, w20
	b.eq	LBB47_92
; %bb.90:
	cbz	w23, LBB47_399
; %bb.91:
	ldr	q0, [x25]
	add	x1, x19, #4
	ldurh	w8, [x29, #-128]
	mov	w0, w26
	mov	x2, x22
	stur	q0, [x19, #4]
	strh	w8, [x19, #20]
	bl	_overlay_pad_take
	b	LBB47_399
LBB47_92:
	bl	_console_is_active
	adrp	x20, _debug_cam_middle@PAGE
	cbz	w0, LBB47_94
; %bb.93:
Lloh306:
	adrp	x0, _mouse_lock@PAGE
Lloh307:
	add	x0, x0, _mouse_lock@PAGEOFF
	bl	_pthread_mutex_lock
	b	LBB47_95
LBB47_94:
	bl	_network_chat_typing
	mov	w25, w0
Lloh308:
	adrp	x0, _mouse_lock@PAGE
Lloh309:
	add	x0, x0, _mouse_lock@PAGEOFF
	bl	_pthread_mutex_lock
	cbz	w25, LBB47_206
LBB47_95:
	mov	w9, wzr
	mov	w8, wzr
	mov	w10, #1                         ; =0x1
	mov	w21, #1                         ; =0x1
	str	wzr, [x20, _debug_cam_middle@PAGEOFF]
LBB47_96:
	adrp	x11, _debug_cam_wheel@PAGE
	ldr	s0, [sp, #684]
	ldrb	w12, [sp, #165]
Lloh310:
	adrp	x0, _mouse_lock@PAGE
Lloh311:
	add	x0, x0, _mouse_lock@PAGEOFF
	stp	w23, w28, [sp, #24]             ; 8-byte Folded Spill
	ldr	s1, [x11, _debug_cam_wheel@PAGEOFF]
	str	x27, [sp, #32]                  ; 8-byte Spill
	cmp	w12, #0
	adrp	x12, _debug_cam_down@PAGE
	csel	w9, wzr, w9, eq
	cmp	w10, #0
	fadd	s0, s0, s1
	adrp	x10, _debug_cam_up@PAGE
	movi	d1, #0000000000000000
	str	w26, [sp, #40]                  ; 4-byte Spill
	str	w9, [x12, _debug_cam_down@PAGEOFF]
	str	w8, [x10, _debug_cam_up@PAGEOFF]
	fcsel	s0, s1, s0, ne
	str	s0, [x11, _debug_cam_wheel@PAGEOFF]
	bl	_pthread_mutex_unlock
	str	w21, [sp, #20]                  ; 4-byte Spill
	tbz	w21, #0, LBB47_125
; %bb.97:
	mov	w27, wzr
LBB47_98:
	adrp	x20, _text_typing@PAGE
	adrp	x10, _keyboard_actions_anywhere@PAGE
	ldr	w8, [x20, _text_typing@PAGEOFF]
	cmp	w8, #0
	ldurh	w8, [x29, #-144]
	csel	w9, w27, wzr, eq
	str	w9, [x10, _keyboard_actions_anywhere@PAGEOFF]
	cbnz	w8, LBB47_104
; %bb.99:
	ldurh	w9, [x29, #-134]
	mov	w8, #-8001                      ; =0xffffe0bf
	add	w10, w9, w8
	mov	w9, #49535                      ; =0xc17f
	cmp	w10, w9
	b.lo	LBB47_104
; %bb.100:
	ldurh	w10, [x29, #-132]
	add	w8, w10, w8
	cmp	w8, w9
	b.lo	LBB47_104
; %bb.101:
	ldurh	w8, [x29, #-130]
	mov	w9, #-8001                      ; =0xffffe0bf
	add	w8, w8, w9
	mov	w9, #49535                      ; =0xc17f
	cmp	w8, w9
	b.lo	LBB47_104
; %bb.102:
	ldurh	w8, [x29, #-128]
	mov	w9, #8000                       ; =0x1f40
	add	w8, w8, w9
	mov	w9, #16000                      ; =0x3e80
	cmp	w9, w8, uxth
	b.lo	LBB47_104
; %bb.103:
	ldurb	w9, [x29, #-142]
Lloh312:
	adrp	x0, _mouse_lock@PAGE
Lloh313:
	add	x0, x0, _mouse_lock@PAGEOFF
	ldurb	w8, [x29, #-141]
	ldurb	w24, [x29, #-140]
	ldurb	w25, [x29, #-139]
	ldurb	w26, [x29, #-138]
	ldurb	w28, [x29, #-137]
	ldurb	w21, [x29, #-136]
	ldurb	w23, [x29, #-135]
	stp	w8, w9, [sp, #12]               ; 8-byte Folded Spill
	bl	_pthread_mutex_lock
	cmp	w23, #65
	mov	w8, #65                         ; =0x41
	ccmp	w21, w8, #2, lo
	ldp	w10, w9, [sp, #12]              ; 8-byte Folded Reload
	ccmp	w28, w8, #2, lo
	ccmp	w26, w8, #2, lo
	ccmp	w25, w8, #2, lo
	ccmp	w24, w8, #2, lo
	ccmp	w10, w8, #2, lo
	ccmp	w9, w8, #2, lo
	b.hs	LBB47_105
	b	LBB47_106
LBB47_104:
Lloh314:
	adrp	x0, _mouse_lock@PAGE
Lloh315:
	add	x0, x0, _mouse_lock@PAGEOFF
	bl	_pthread_mutex_lock
LBB47_105:
	bl	_SDL_GetTicks
	adrp	x8, _pad_used_ms@PAGE
	str	x0, [x8, _pad_used_ms@PAGEOFF]
LBB47_106:
	ldr	w26, [sp, #40]                  ; 4-byte Reload
	ldr	w28, [sp, #28]                  ; 4-byte Reload
	cbz	w27, LBB47_108
; %bb.107:
	bl	_SDL_GetTicks
	adrp	x8, _keyboard_used_ms@PAGE
	str	x0, [x8, _keyboard_used_ms@PAGEOFF]
LBB47_108:
Lloh316:
	adrp	x0, _mouse_lock@PAGE
Lloh317:
	add	x0, x0, _mouse_lock@PAGEOFF
	bl	_pthread_mutex_unlock
	adrp	x21, _keyboard_screenshot.was_down@PAGE
	lsr	w8, w27, #17
	ubfx	w23, w27, #17, #1
	tbz	w8, #0, LBB47_111
; %bb.109:
	ldr	w8, [x21, _keyboard_screenshot.was_down@PAGEOFF]
	cbnz	w8, LBB47_111
; %bb.110:
	bl	_platform_screenshot_request
LBB47_111:
	str	w23, [x21, _keyboard_screenshot.was_down@PAGEOFF]
	ldp	w8, w23, [sp, #20]              ; 8-byte Folded Reload
	tbnz	w8, #0, LBB47_275
; %bb.112:
	ldr	w8, [sp, #700]
	cbz	w8, LBB47_168
; %bb.113:
	ldr	w8, [x20, _text_typing@PAGEOFF]
	cbz	w8, LBB47_207
; %bb.114:
	ldrb	w8, [sp, #196]
	ldrb	w9, [sp, #244]
	orr	w8, w8, w9
	ldrb	w9, [sp, #238]
	cmp	w8, #0
	cset	w8, ne
	cbz	w9, LBB47_116
; %bb.115:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x1
	strh	w9, [x19, #4]
LBB47_116:
	ldrb	w9, [sp, #237]
	cbz	w9, LBB47_118
; %bb.117:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x2
	strh	w9, [x19, #4]
LBB47_118:
	ldrb	w9, [sp, #236]
	cbz	w9, LBB47_120
; %bb.119:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x4
	strh	w9, [x19, #4]
LBB47_120:
	ldrb	w9, [sp, #235]
	cbz	w9, LBB47_122
; %bb.121:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x8
	strh	w9, [x19, #4]
LBB47_122:
	adrp	x9, _text_typing_enter_armed@PAGE
	tbz	w8, #0, LBB47_224
; %bb.123:
	ldrb	w8, [x9, _text_typing_enter_armed@PAGEOFF]
	cbz	w8, LBB47_225
; %bb.124:
	ldrh	w8, [x19, #4]
	orr	w8, w8, #0x10
	strh	w8, [x19, #4]
	b	LBB47_225
LBB47_125:
	bl	_bindings_read
	mov	w28, wzr
	mov	w27, wzr
	mov	w26, #1                         ; =0x1
	add	x25, sp, #156
Lloh318:
	adrp	x23, _bindings@PAGE+4
Lloh319:
	add	x23, x23, _bindings@PAGEOFF+4
	b	LBB47_129
LBB47_126:                              ;   in Loop: Header=BB47_129 Depth=1
	ldr	w8, [sp, #692]
	cbz	w8, LBB47_165
	.p2align	4, , 8
LBB47_127:                              ;   in Loop: Header=BB47_129 Depth=1
	mov	w20, wzr
LBB47_128:                              ;   in Loop: Header=BB47_129 Depth=1
	orr	w8, w21, w27
	add	w23, w23, #8
	orr	w27, w20, w8
	add	w28, w28, #1
	cmp	w28, #23
	b.eq	LBB47_98
LBB47_129:                              ; =>This Inner Loop Header: Depth=1
	sub	w8, w23, #4
	lsl	w20, w26, w28
	ldr	w21, [x8]
	bl	_SDL_GetTicks
	tbnz	w21, #31, LBB47_146
; %bb.130:                              ;   in Loop: Header=BB47_129 Depth=1
	subs	w1, w21, #523
	b.lo	LBB47_135
; %bb.131:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w21, #550
	ccmp	w22, #0, #4, ls
	b.eq	LBB47_146
; %bb.132:                              ;   in Loop: Header=BB47_129 Depth=1
	mov	x0, x22
	cmp	w21, #550
	b.eq	LBB47_144
; %bb.133:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w21, #549
	b.ne	LBB47_161
; %bb.134:                              ;   in Loop: Header=BB47_129 Depth=1
	mov	w1, #4                          ; =0x4
	b	LBB47_145
	.p2align	4, , 8
LBB47_135:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w21, #511
	b.hi	LBB47_138
; %bb.136:                              ;   in Loop: Header=BB47_129 Depth=1
	ldrb	w8, [x25, w21, sxtw]
LBB47_137:                              ;   in Loop: Header=BB47_129 Depth=1
	mov	w21, w20
	cbnz	w8, LBB47_147
	b	LBB47_146
LBB47_138:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w21, #519
	b.hi	LBB47_141
; %bb.139:                              ;   in Loop: Header=BB47_129 Depth=1
	ldr	w8, [sp, #692]
	cbnz	w8, LBB47_146
; %bb.140:                              ;   in Loop: Header=BB47_129 Depth=1
	add	w8, w25, w21
	ldrb	w8, [x8]
	b	LBB47_137
LBB47_141:                              ;   in Loop: Header=BB47_129 Depth=1
Lloh320:
	adrp	x8, _wheel_press_until_ms@PAGE
	cmp	w21, #520
Lloh321:
	ldr	x8, [x8, _wheel_press_until_ms@PAGEOFF]
	b.eq	LBB47_163
; %bb.142:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	x0, x8
	b.hs	LBB47_163
; %bb.143:                              ;   in Loop: Header=BB47_129 Depth=1
Lloh322:
	adrp	x8, _wheel_direction@PAGE
	cmp	w21, #521
	mov	w21, w20
	cneg	w9, w26, ne
Lloh323:
	ldr	w8, [x8, _wheel_direction@PAGEOFF]
	cmp	w8, w9
	b.ne	LBB47_146
	b	LBB47_147
LBB47_144:                              ;   in Loop: Header=BB47_129 Depth=1
	mov	w1, #5                          ; =0x5
LBB47_145:                              ;   in Loop: Header=BB47_129 Depth=1
	bl	_SDL_GetGamepadAxis
	mov	w21, w20
	mov	w8, #16000                      ; =0x3e80
	cmp	w0, w8
	b.gt	LBB47_147
	.p2align	4, , 8
LBB47_146:                              ;   in Loop: Header=BB47_129 Depth=1
	mov	w21, wzr
LBB47_147:                              ;   in Loop: Header=BB47_129 Depth=1
	ldr	w24, [x23]
	bl	_SDL_GetTicks
	tbnz	w24, #31, LBB47_127
; %bb.148:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w24, #522
	b.ls	LBB47_153
; %bb.149:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w24, #550
	ccmp	w22, #0, #4, ls
	b.eq	LBB47_127
; %bb.150:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w24, #549
	b.eq	LBB47_159
; %bb.151:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w24, #550
	b.ne	LBB47_162
; %bb.152:                              ;   in Loop: Header=BB47_129 Depth=1
	mov	x0, x22
	mov	w1, #5                          ; =0x5
	b	LBB47_160
	.p2align	4, , 8
LBB47_153:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w24, #512
	b.hs	LBB47_155
; %bb.154:                              ;   in Loop: Header=BB47_129 Depth=1
	ldrb	w8, [x25, w24, sxtw]
	cbnz	w8, LBB47_128
	b	LBB47_127
LBB47_155:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	w24, #520
	b.lo	LBB47_126
; %bb.156:                              ;   in Loop: Header=BB47_129 Depth=1
Lloh324:
	adrp	x8, _wheel_press_until_ms@PAGE
Lloh325:
	ldr	x8, [x8, _wheel_press_until_ms@PAGEOFF]
	b.eq	LBB47_164
; %bb.157:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	x0, x8
	b.hs	LBB47_164
; %bb.158:                              ;   in Loop: Header=BB47_129 Depth=1
Lloh326:
	adrp	x8, _wheel_direction@PAGE
	cmp	w24, #521
	cneg	w9, w26, ne
Lloh327:
	ldr	w8, [x8, _wheel_direction@PAGEOFF]
	cmp	w8, w9
	b.ne	LBB47_127
	b	LBB47_128
LBB47_159:                              ;   in Loop: Header=BB47_129 Depth=1
	mov	x0, x22
	mov	w1, #4                          ; =0x4
LBB47_160:                              ;   in Loop: Header=BB47_129 Depth=1
	bl	_SDL_GetGamepadAxis
	mov	w8, #16000                      ; =0x3e80
	cmp	w0, w8
	b.le	LBB47_127
	b	LBB47_128
LBB47_161:                              ;   in Loop: Header=BB47_129 Depth=1
	bl	_SDL_GetGamepadButton
	mov	w21, w20
	tbz	w0, #0, LBB47_146
	b	LBB47_147
LBB47_162:                              ;   in Loop: Header=BB47_129 Depth=1
	sub	w1, w24, #523
	mov	x0, x22
	bl	_SDL_GetGamepadButton
	tbz	w0, #0, LBB47_127
	b	LBB47_128
LBB47_163:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	x0, x8
	mov	w8, #520                        ; =0x208
	ccmp	w21, w8, #0, lo
	mov	w21, w20
	b.ne	LBB47_146
	b	LBB47_147
LBB47_164:                              ;   in Loop: Header=BB47_129 Depth=1
	cmp	x0, x8
	mov	w8, #520                        ; =0x208
	ccmp	w24, w8, #0, lo
	b.ne	LBB47_127
	b	LBB47_128
LBB47_165:                              ;   in Loop: Header=BB47_129 Depth=1
	add	w8, w25, w24
	ldrb	w8, [x8]
	cbnz	w8, LBB47_128
	b	LBB47_127
LBB47_166:
	ldr	s0, [x21, _mouse_wheel_accumulated@PAGEOFF]
	fmov	s2, #1.00000000
	fabs	s1, s0
	fcmp	s1, s2
	b.lt	LBB47_37
; %bb.167:
	fcmp	s0, #0.0
	mov	w10, #-1                        ; =0xffffffff
	mov	w9, #1                          ; =0x1
	adrp	x11, _wheel_direction@PAGE
	add	x12, x23, #50
	adrp	x13, _wheel_press_until_ms@PAGE
	strb	w9, [x8, _wheel_scrolling@PAGEOFF]
	str	x12, [x13, _wheel_press_until_ms@PAGEOFF]
	csinc	w10, w10, wzr, le
	str	w10, [x11, _wheel_direction@PAGEOFF]
	b	LBB47_37
LBB47_168:
	bl	_network_replay_playing
	cbz	w0, LBB47_226
; %bb.169:
	ldr	w25, [sp, #692]
	bl	_SDL_GetTicks
Lloh328:
	adrp	x8, _wheel_press_until_ms@PAGE
Lloh329:
	ldr	x8, [x8, _wheel_press_until_ms@PAGEOFF]
	tbz	w27, #16, LBB47_171
; %bb.170:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x10
	strh	w9, [x19, #4]
LBB47_171:
	tbz	w27, #15, LBB47_173
; %bb.172:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x20
	strh	w9, [x19, #4]
LBB47_173:
	ldrb	w11, [sp, #163]
	adrp	x17, _keyboard_actions_held@PAGE
	ldrb	w15, [sp, #182]
	ldrb	w9, [sp, #160]
	ldrb	w14, [sp, #178]
	cmp	w11, #0
	str	wzr, [x17, _keyboard_actions_held@PAGEOFF]
	cset	w10, eq
	cset	w12, ne
	cmp	w15, #0
	cset	w16, eq
	cset	w13, ne
	cmp	w9, #0
	csel	w12, w12, w10, eq
	cmp	w14, #0
	csel	w13, w13, w16, eq
	orr	w1, w12, w13
	cbz	w1, LBB47_175
; %bb.174:
	tst	w15, #0xff
	sbfx	w15, w16, #0, #1
	cset	w16, ne
	cmp	w11, #0
	cset	w11, ne
	tst	w14, #0xff
	mov	w14, #1267                      ; =0x4f3
	csel	w15, w16, w15, eq
	movk	w14, #16181, lsl #16
	cmp	w9, #0
	sbfx	w9, w10, #0, #1
	fmov	s0, #1.00000000
	csel	w9, w11, w9, eq
	tst	w12, w13
	fmov	s1, w14
	lsl	w10, w9, #15
	sub	w9, w10, w9
	lsl	w10, w15, #15
	sub	w10, w10, w15
	scvtf	s2, w10
	fcsel	s0, s1, s0, ne
	scvtf	s1, w9
	fmul	s1, s0, s1
	fmul	s0, s0, s2
	fcvtzs	s1, s1
	fcvtzs	s0, s0
	str	h1, [x19, #14]
	str	h0, [x19, #16]
LBB47_175:
	ldrb	w9, [sp, #238]
	cbz	w9, LBB47_177
; %bb.176:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x1
	strh	w9, [x19, #4]
LBB47_177:
	ldrb	w9, [sp, #237]
	cbz	w9, LBB47_179
; %bb.178:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x2
	strh	w9, [x19, #4]
LBB47_179:
	ldrb	w9, [sp, #236]
	cbz	w9, LBB47_181
; %bb.180:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x4
	strh	w9, [x19, #4]
LBB47_181:
	ldrb	w9, [sp, #235]
	cbz	w9, LBB47_183
; %bb.182:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x8
	strh	w9, [x19, #4]
LBB47_183:
	ldrb	w9, [sp, #177]
	cbnz	w9, LBB47_186
; %bb.184:
	cbnz	w25, LBB47_187
; %bb.185:
	ldrb	w9, [sp, #670]
	cbz	w9, LBB47_187
LBB47_186:
	ldrh	w9, [x19, #4]
	orr	w9, w9, #0x80
	strh	w9, [x19, #4]
LBB47_187:
	ldrb	w9, [sp, #200]
	ldrb	w11, [sp, #162]
	ldrb	w12, [sp, #380]
	ldrb	w10, [x19, #13]
	ldrb	w13, [x19, #12]
	cmp	w9, #0
	ldrb	w14, [sp, #164]
	orr	w9, w11, w12
	csinv	w10, w10, wzr, eq
	cmp	w9, #0
	csinv	w11, w13, wzr, eq
	cmp	w14, #0
	cset	w9, ne
	strb	w10, [x19, #13]
	strb	w11, [x19, #12]
	cbnz	w14, LBB47_190
; %bb.188:
	cbnz	w25, LBB47_190
; %bb.189:
	ldrb	w9, [sp, #669]
	cmp	w9, #0
	cset	w9, ne
LBB47_190:
	ldrb	w10, [x19, #6]
	cmp	w9, #0
	ldrb	w11, [sp, #176]
	csinv	w10, w10, wzr, eq
	cmp	w11, #0
	cset	w9, ne
	strb	w10, [x19, #6]
	cbnz	w11, LBB47_193
; %bb.191:
	cbnz	w25, LBB47_193
; %bb.192:
	ldrb	w9, [sp, #671]
	cmp	w9, #0
	cset	w9, ne
LBB47_193:
	ldrb	w10, [x19, #8]
	cmp	w9, #0
	ldrb	w11, [sp, #181]
	ldrb	w12, [x19, #9]
	ldrb	w13, [sp, #202]
	ldrb	w14, [sp, #243]
	csinv	w9, w10, wzr, eq
	cmp	w11, #0
	csinv	w10, w12, wzr, eq
	strb	w9, [x19, #8]
	orr	w11, w13, w14
	strb	w10, [x19, #9]
	cbnz	w11, LBB47_231
; %bb.194:
	cbnz	w25, LBB47_266
; %bb.195:
	cmp	x0, x8
	b.hs	LBB47_266
; %bb.196:
Lloh330:
	adrp	x10, _wheel_direction@PAGE
	mov	x9, x19
Lloh331:
	ldr	w10, [x10, _wheel_direction@PAGEOFF]
	ldrb	w11, [x9, #10]!
	cmp	w10, #1
	csinv	w10, w11, wzr, ne
	b	LBB47_267
LBB47_197:
	ldr	w8, [x20, _gamepad_capture@PAGEOFF]
LBB47_198:
	cbz	w8, LBB47_233
; %bb.199:
	cmp	w8, #2
	b.ne	LBB47_17
LBB47_200:
	mov	w23, wzr
	mov	w21, #16000                     ; =0x3e80
	b	LBB47_203
	.p2align	4, , 8
LBB47_201:                              ;   in Loop: Header=BB47_203 Depth=1
	mov	w1, #4                          ; =0x4
	bl	_SDL_GetGamepadAxis
	cmp	w0, w21
	b.gt	LBB47_223
LBB47_202:                              ;   in Loop: Header=BB47_203 Depth=1
	add	w23, w23, #1
LBB47_203:                              ; =>This Inner Loop Header: Depth=1
	mov	x0, x22
	cmp	w23, #26
	b.eq	LBB47_201
; %bb.204:                              ;   in Loop: Header=BB47_203 Depth=1
	cmp	w23, #27
	b.eq	LBB47_222
; %bb.205:                              ;   in Loop: Header=BB47_203 Depth=1
	mov	w1, w23
	bl	_SDL_GetGamepadButton
	tbz	w0, #0, LBB47_202
	b	LBB47_223
LBB47_206:
	ldr	w8, [sp, #692]
	mov	w21, wzr
	ldrb	w9, [sp, #670]
	ldrb	w10, [sp, #177]
	cmp	w8, #0
	ccmp	w9, #0, #4, eq
	mov	w9, #1                          ; =0x1
	cset	w11, ne
	cmp	w10, #0
	cset	w8, ne
	eor	w10, w11, #0x1
	str	w11, [x20, _debug_cam_middle@PAGEOFF]
	b	LBB47_96
LBB47_207:
	ldr	w21, [sp, #692]
	bl	_overlay_menu_typing
	cbnz	w0, LBB47_275
; %bb.208:
	ldrb	w10, [sp, #163]
	ldrb	w14, [sp, #182]
	ldrb	w8, [sp, #160]
	ldrb	w13, [sp, #178]
	cmp	w10, #0
	cset	w9, eq
	cset	w11, ne
	cmp	w14, #0
	cset	w15, eq
	cset	w12, ne
	cmp	w8, #0
	csel	w11, w11, w9, eq
	cmp	w13, #0
	csel	w12, w12, w15, eq
	orr	w16, w11, w12
	cbz	w16, LBB47_210
; %bb.209:
	tst	w14, #0xff
	sbfx	w14, w15, #0, #1
	cset	w15, ne
	cmp	w10, #0
	cset	w10, ne
	tst	w13, #0xff
	mov	w13, #1267                      ; =0x4f3
	csel	w14, w15, w14, eq
	movk	w13, #16181, lsl #16
	cmp	w8, #0
	sbfx	w8, w9, #0, #1
	fmov	s0, #1.00000000
	csel	w8, w10, w8, eq
	tst	w11, w12
	fmov	s1, w13
	lsl	w9, w8, #15
	sub	w8, w9, w8
	lsl	w9, w14, #15
	sub	w9, w9, w14
	scvtf	s2, w9
	fcsel	s0, s1, s0, ne
	scvtf	s1, w8
	fmul	s1, s0, s1
	fmul	s0, s0, s2
	fcvtzs	s1, s1
	fcvtzs	s0, s0
	str	h1, [x19, #14]
	str	h0, [x19, #16]
LBB47_210:
	ldrb	w8, [sp, #238]
	cbz	w8, LBB47_212
; %bb.211:
	ldrh	w8, [x19, #4]
	orr	w8, w8, #0x1
	strh	w8, [x19, #4]
LBB47_212:
	ldrb	w8, [sp, #237]
	cbz	w8, LBB47_214
; %bb.213:
	ldrh	w8, [x19, #4]
	orr	w8, w8, #0x2
	strh	w8, [x19, #4]
LBB47_214:
	ldrb	w8, [sp, #236]
	cbz	w8, LBB47_216
; %bb.215:
	ldrh	w8, [x19, #4]
	orr	w8, w8, #0x4
	strh	w8, [x19, #4]
LBB47_216:
	ldrb	w8, [sp, #235]
	cbz	w8, LBB47_218
; %bb.217:
	ldrh	w8, [x19, #4]
	orr	w8, w8, #0x8
	strh	w8, [x19, #4]
LBB47_218:
	ldrb	w8, [sp, #214]
	cbz	w8, LBB47_220
; %bb.219:
	ldrh	w8, [x19, #4]
	orr	w8, w8, #0x20
	strh	w8, [x19, #4]
LBB47_220:
	ldrb	w8, [sp, #200]
	adrp	x10, _keyboard_join_down@PAGE
	ldrb	w9, [sp, #196]
	cmp	w8, #0
	orr	w9, w8, w9
	and	w8, w9, #0xff
	cset	w9, ne
	str	w9, [x10, _keyboard_join_down@PAGEOFF]
	cbz	w8, LBB47_379
; %bb.221:
	add	x8, x19, #6
	mov	w9, #255                        ; =0xff
	b	LBB47_380
LBB47_222:
	mov	w1, #5                          ; =0x5
	bl	_SDL_GetGamepadAxis
	mov	w8, #16000                      ; =0x3e80
	cmp	w0, w8
	b.le	LBB47_232
LBB47_223:
	mov	w23, #1                         ; =0x1
	b	LBB47_14
LBB47_224:
	mov	w8, #1                          ; =0x1
	strb	w8, [x9, _text_typing_enter_armed@PAGEOFF]
LBB47_225:
	ldrb	w8, [sp, #197]
	b	LBB47_274
LBB47_226:
	tbz	w27, #16, LBB47_228
; %bb.227:
	ldrh	w8, [x19, #4]
	orr	w8, w8, #0x10
	strh	w8, [x19, #4]
LBB47_228:
	tbz	w27, #15, LBB47_230
; %bb.229:
	ldrh	w8, [x19, #4]
	orr	w8, w8, #0x20
	strh	w8, [x19, #4]
LBB47_230:
	adrp	x8, _keyboard_actions_held@PAGE
	str	w27, [x8, _keyboard_actions_held@PAGEOFF]
	bl	_network_replay_playing
	cbnz	w0, LBB47_276
	b	LBB47_299
LBB47_231:
	add	x9, x19, #10
	mov	w10, #255                       ; =0xff
	b	LBB47_267
LBB47_232:
	str	wzr, [x20, _gamepad_capture@PAGEOFF]
LBB47_233:
	bl	_network_replay_playing
	ldr	w9, [sp, #700]
	mov	w8, wzr
	add	x10, sp, #44
Lloh332:
	adrp	x11, _gamepad_bound_to_talk@PAGE
Lloh333:
	add	x11, x11, _gamepad_bound_to_talk@PAGEOFF
Lloh334:
	adrp	x12, _gamepad_bound_in_game@PAGE
Lloh335:
	add	x12, x12, _gamepad_bound_in_game@PAGEOFF
	b	LBB47_236
	.p2align	4, , 8
LBB47_234:                              ;   in Loop: Header=BB47_236 Depth=1
	mov	w13, wzr
LBB47_235:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w14, w10, w8
	add	w8, w8, #28
	add	w14, w14, #24
	cmp	w8, #112
	str	w13, [x14]
	b.eq	LBB47_263
LBB47_236:                              ; =>This Inner Loop Header: Depth=1
	cbz	w0, LBB47_238
; %bb.237:                              ;   in Loop: Header=BB47_236 Depth=1
	mov	w14, wzr
	b	LBB47_240
	.p2align	4, , 8
LBB47_238:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w11, w8
	ldr	w13, [x13]
	cmp	w13, #0
	orr	w15, w13, w9
	cset	w14, ne
	cbnz	w15, LBB47_240
; %bb.239:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w12, w8
	ldr	w13, [x13]
	cmp	w13, #0
	cset	w14, ne
	.p2align	4, , 8
LBB47_240:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w10, w8
	str	w14, [x13]
	cbz	w0, LBB47_242
; %bb.241:                              ;   in Loop: Header=BB47_236 Depth=1
	mov	w14, wzr
	b	LBB47_244
	.p2align	4, , 8
LBB47_242:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w14, w11, w8
	add	w14, w14, #4
	ldr	w14, [x14]
	cmp	w14, #0
	orr	w15, w14, w9
	cset	w14, ne
	cbnz	w15, LBB47_244
; %bb.243:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w14, w12, w8
	add	w14, w14, #4
	ldr	w14, [x14]
	cmp	w14, #0
	cset	w14, ne
	.p2align	4, , 8
LBB47_244:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w13, #4
	str	w14, [x13]
	cbz	w0, LBB47_246
; %bb.245:                              ;   in Loop: Header=BB47_236 Depth=1
	mov	w14, wzr
	b	LBB47_248
	.p2align	4, , 8
LBB47_246:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w11, w8
	add	w13, w13, #8
	ldr	w13, [x13]
	cmp	w13, #0
	orr	w15, w13, w9
	cset	w14, ne
	cbnz	w15, LBB47_248
; %bb.247:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w12, w8
	add	w13, w13, #8
	ldr	w13, [x13]
	cmp	w13, #0
	cset	w14, ne
	.p2align	4, , 8
LBB47_248:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w10, w8
	add	w15, w13, #8
	str	w14, [x15]
	cbz	w0, LBB47_250
; %bb.249:                              ;   in Loop: Header=BB47_236 Depth=1
	mov	w14, wzr
	b	LBB47_252
	.p2align	4, , 8
LBB47_250:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w14, w11, w8
	add	w14, w14, #12
	ldr	w14, [x14]
	cmp	w14, #0
	orr	w15, w14, w9
	cset	w14, ne
	cbnz	w15, LBB47_252
; %bb.251:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w14, w12, w8
	add	w14, w14, #12
	ldr	w14, [x14]
	cmp	w14, #0
	cset	w14, ne
	.p2align	4, , 8
LBB47_252:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w13, #12
	str	w14, [x13]
	cbz	w0, LBB47_254
; %bb.253:                              ;   in Loop: Header=BB47_236 Depth=1
	mov	w13, wzr
	b	LBB47_256
	.p2align	4, , 8
LBB47_254:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w11, w8
	add	w13, w13, #16
	ldr	w13, [x13]
	cmp	w13, #0
	orr	w14, w13, w9
	cset	w13, ne
	cbnz	w14, LBB47_256
; %bb.255:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w12, w8
	add	w13, w13, #16
	ldr	w13, [x13]
	cmp	w13, #0
	cset	w13, ne
	.p2align	4, , 8
LBB47_256:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w14, w10, w8
	add	w14, w14, #16
	str	w13, [x14]
	cbz	w0, LBB47_258
; %bb.257:                              ;   in Loop: Header=BB47_236 Depth=1
	mov	w13, wzr
	b	LBB47_260
	.p2align	4, , 8
LBB47_258:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w11, w8
	add	w13, w13, #20
	ldr	w13, [x13]
	cmp	w13, #0
	orr	w14, w13, w9
	cset	w13, ne
	cbnz	w14, LBB47_260
; %bb.259:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w12, w8
	add	w13, w13, #20
	ldr	w13, [x13]
	cmp	w13, #0
	cset	w13, ne
	.p2align	4, , 8
LBB47_260:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w14, w10, w8
	add	w14, w14, #20
	str	w13, [x14]
	cbnz	w0, LBB47_234
; %bb.261:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w11, w8
	add	w13, w13, #24
	ldr	w13, [x13]
	cmp	w13, #0
	orr	w14, w13, w9
	cset	w13, ne
	cbnz	w14, LBB47_235
; %bb.262:                              ;   in Loop: Header=BB47_236 Depth=1
	add	w13, w12, w8
	add	w13, w13, #24
	ldr	w13, [x13]
	cmp	w13, #0
	cset	w13, ne
	b	LBB47_235
LBB47_263:
	mov	x0, x22
	mov	w1, wzr
	bl	_SDL_GetGamepadButton
	mov	x0, x22
	mov	w1, #1                          ; =0x1
	mov	w20, #1                         ; =0x1
	bl	_SDL_GetGamepadButton
	adrp	x8, _face_buttons_held_over_swap.swapped@PAGE
	ldrb	w9, [x8, _face_buttons_held_over_swap.swapped@PAGEOFF]
	tbnz	w9, #0, LBB47_265
; %bb.264:
	strb	w20, [x8, _face_buttons_held_over_swap.swapped@PAGEOFF]
LBB47_265:
Lloh336:
	adrp	x8, _scoreboard_picking_port@PAGE
	sub	x1, x29, #144
	add	x2, sp, #44
	mov	x0, x22
Lloh337:
	ldr	w8, [x8, _scoreboard_picking_port@PAGEOFF]
	cmp	w8, #0
	b	LBB47_16
LBB47_266:
	mov	x9, x19
	ldrb	w10, [x9, #10]!
LBB47_267:
	ldrb	w11, [sp, #201]
	ldrb	w12, [sp, #242]
	strb	w10, [x9]
	orr	w11, w11, w12
	cbnz	w11, LBB47_271
; %bb.268:
	cbnz	w25, LBB47_272
; %bb.269:
	cmp	x0, x8
	b.hs	LBB47_272
; %bb.270:
Lloh338:
	adrp	x8, _wheel_direction@PAGE
	ldrb	w9, [x19, #11]
Lloh339:
	ldr	w8, [x8, _wheel_direction@PAGEOFF]
	cmn	w8, #1
	csinv	w8, w9, wzr, ne
	b	LBB47_273
LBB47_271:
	mov	w8, #255                        ; =0xff
	b	LBB47_273
LBB47_272:
	ldrb	w8, [x19, #11]
LBB47_273:
	strb	w8, [x19, #11]
	bl	_network_replay_paused
	mov	w8, #42                         ; =0x2a
	cmp	w0, #0
	mov	w9, #11                         ; =0xb
	csel	w8, w9, w8, eq
	add	x9, sp, #156
	ldrb	w8, [x9, w8, uxtw]
LBB47_274:
	ldrb	w9, [x19, #7]
	cmp	w8, #0
	csinv	w8, w9, wzr, eq
	strb	w8, [x19, #7]
LBB47_275:
	bl	_network_replay_playing
	cbz	w0, LBB47_299
LBB47_276:
	adrp	x21, _replay_keyboard_last@PAGE
	cbz	w22, LBB47_296
; %bb.277:
	mov	x0, x22
	bl	_gamepad_idle
	cbz	w0, LBB47_297
; %bb.278:
	ldr	w8, [sp, #692]
	cbnz	w8, LBB47_281
; %bb.279:
	ldr	s0, [sp, #676]
	mov	w9, #1                          ; =0x1
	fcmp	s0, #0.0
	b.ne	LBB47_298
; %bb.280:
	ldr	s0, [sp, #680]
	fcmp	s0, #0.0
	b.ne	LBB47_298
LBB47_281:
	ldr	w9, [x21, _replay_keyboard_last@PAGEOFF]
	cbnz	w9, LBB47_299
; %bb.282:
	cbnz	w8, LBB47_284
; %bb.283:
	ldrb	w9, [sp, #668]
	cbnz	w9, LBB47_296
LBB47_284:
	cbnz	w8, LBB47_286
; %bb.285:
	ldrb	w9, [sp, #669]
	cbnz	w9, LBB47_296
LBB47_286:
	cbnz	w8, LBB47_288
; %bb.287:
	ldrb	w9, [sp, #670]
	cbnz	w9, LBB47_296
LBB47_288:
	cbnz	w8, LBB47_290
; %bb.289:
	ldrb	w9, [sp, #671]
	cbnz	w9, LBB47_296
LBB47_290:
	cbnz	w8, LBB47_292
; %bb.291:
	ldrb	w9, [sp, #672]
	cbnz	w9, LBB47_296
LBB47_292:
	cbnz	w8, LBB47_294
; %bb.293:
	ldrb	w9, [sp, #673]
	cbnz	w9, LBB47_296
LBB47_294:
	cbnz	w8, LBB47_422
; %bb.295:
	ldrb	w9, [sp, #674]
	cbz	w9, LBB47_422
LBB47_296:
	mov	w9, #1                          ; =0x1
	b	LBB47_298
LBB47_297:
	mov	w9, wzr
LBB47_298:
	str	w9, [x21, _replay_keyboard_last@PAGEOFF]
LBB47_299:
	cbz	w23, LBB47_301
; %bb.300:
	sub	x0, x29, #144
	add	x1, x19, #4
	bl	_controller_remap_merge
LBB47_301:
Lloh340:
	adrp	x8, _test_input_pressed@PAGE
Lloh341:
	ldr	w8, [x8, _test_input_pressed@PAGEOFF]
	tbnz	w8, #0, LBB47_315
; %bb.302:
	add	x27, x19, #6
	tbnz	w8, #4, LBB47_316
LBB47_303:
	tbnz	w8, #1, LBB47_317
LBB47_304:
	tbnz	w8, #5, LBB47_318
LBB47_305:
	tbnz	w8, #2, LBB47_319
LBB47_306:
	tbnz	w8, #6, LBB47_320
LBB47_307:
	tbnz	w8, #3, LBB47_321
LBB47_308:
	tbnz	w8, #7, LBB47_322
LBB47_309:
	tbnz	w8, #8, LBB47_323
LBB47_310:
	tbnz	w8, #9, LBB47_324
LBB47_311:
	tbnz	w8, #10, LBB47_325
LBB47_312:
	tbnz	w8, #11, LBB47_326
LBB47_313:
	tbnz	w8, #12, LBB47_327
LBB47_314:
	bl	_network_chat_keyboard_open
	cbnz	w0, LBB47_328
	b	LBB47_329
LBB47_315:
	ldurh	w9, [x19, #4]
	orr	w9, w9, #0x1
	sturh	w9, [x19, #4]
	add	x27, x19, #6
	tbz	w8, #4, LBB47_303
LBB47_316:
	mov	w9, #255                        ; =0xff
	strb	w9, [x27]
	tbz	w8, #1, LBB47_304
LBB47_317:
	ldurh	w9, [x19, #4]
	orr	w9, w9, #0x2
	sturh	w9, [x19, #4]
	tbz	w8, #5, LBB47_305
LBB47_318:
	mov	w9, #255                        ; =0xff
	strb	w9, [x19, #7]
	tbz	w8, #2, LBB47_306
LBB47_319:
	ldurh	w9, [x19, #4]
	orr	w9, w9, #0x4
	sturh	w9, [x19, #4]
	tbz	w8, #6, LBB47_307
LBB47_320:
	mov	w9, #255                        ; =0xff
	strb	w9, [x19, #8]
	tbz	w8, #3, LBB47_308
LBB47_321:
	ldurh	w9, [x19, #4]
	orr	w9, w9, #0x8
	sturh	w9, [x19, #4]
	tbz	w8, #7, LBB47_309
LBB47_322:
	mov	w9, #255                        ; =0xff
	strb	w9, [x19, #9]
	tbz	w8, #8, LBB47_310
LBB47_323:
	ldurh	w9, [x19, #4]
	orr	w9, w9, #0x10
	sturh	w9, [x19, #4]
	tbz	w8, #9, LBB47_311
LBB47_324:
	mov	w9, #32000                      ; =0x7d00
	strh	w9, [x19, #16]
	tbz	w8, #10, LBB47_312
LBB47_325:
	mov	w9, #33536                      ; =0x8300
	strh	w9, [x19, #16]
	tbz	w8, #11, LBB47_313
LBB47_326:
	mov	w9, #33536                      ; =0x8300
	strh	w9, [x19, #14]
	tbz	w8, #12, LBB47_314
LBB47_327:
	mov	w8, #32000                      ; =0x7d00
	strh	w8, [x19, #14]
	bl	_network_chat_keyboard_open
	cbz	w0, LBB47_329
LBB47_328:
	bl	_network_chat_controller
	cbz	w0, LBB47_396
LBB47_329:
	adrp	x20, _test_input_gamepad.checked@PAGE
	ldrb	w8, [x20, _test_input_gamepad.checked@PAGEOFF]
	tbnz	w8, #0, LBB47_338
; %bb.330:
Lloh342:
	adrp	x0, l_.str.74@PAGE
Lloh343:
	add	x0, x0, l_.str.74@PAGEOFF
	bl	_config_string
	mov	w8, #1                          ; =0x1
Lloh344:
	adrp	x1, l_.str.75@PAGE
Lloh345:
	add	x1, x1, l_.str.75@PAGEOFF
	mov	w2, #5                          ; =0x5
	mov	x24, x0
	strb	w8, [x20, _test_input_gamepad.checked@PAGEOFF]
	bl	_strncmp
	cbz	w0, LBB47_335
; %bb.331:
Lloh346:
	adrp	x1, l_.str.76@PAGE
Lloh347:
	add	x1, x1, l_.str.76@PAGEOFF
	mov	x0, x24
	mov	w2, #4                          ; =0x4
	bl	_strncmp
	cbz	w0, LBB47_336
; %bb.332:
Lloh348:
	adrp	x1, l_.str.77@PAGE
Lloh349:
	add	x1, x1, l_.str.77@PAGEOFF
	mov	x0, x24
	bl	_strcmp
	cbz	w0, LBB47_337
; %bb.333:
Lloh350:
	adrp	x1, l_.str.78@PAGE
Lloh351:
	add	x1, x1, l_.str.78@PAGEOFF
	mov	x0, x24
	mov	w2, #5                          ; =0x5
	bl	_strncmp
	cbnz	w0, LBB47_338
; %bb.334:
	add	x0, x24, #5
	bl	_atoi
	adrp	x8, _test_input_gamepad.seed@PAGE
	adrp	x9, _test_input_gamepad.looking@PAGE
	mov	w10, #1                         ; =0x1
	str	w0, [x8, _test_input_gamepad.seed@PAGEOFF]
	strb	w10, [x9, _test_input_gamepad.looking@PAGEOFF]
	b	LBB47_338
LBB47_335:
	add	w8, w24, #5
Lloh352:
	adrp	x0, _test_input_menu@PAGE
Lloh353:
	add	x0, x0, _test_input_menu@PAGEOFF
Lloh354:
	adrp	x2, l_.str.3@PAGE
Lloh355:
	add	x2, x2, l_.str.3@PAGEOFF
	mov	w1, #512                        ; =0x200
	str	w8, [sp]
	bl	_snprintf
	bl	_SDL_GetTicks
	adrp	x8, _test_input_menu_since@PAGE
	str	x0, [x8, _test_input_menu_since@PAGEOFF]
	b	LBB47_338
LBB47_336:
	add	x0, x24, #4
	bl	_atoi
	adrp	x8, _test_input_gamepad.seed@PAGE
	str	w0, [x8, _test_input_gamepad.seed@PAGEOFF]
	b	LBB47_338
LBB47_337:
	adrp	x8, _test_input_gamepad.seed@PAGE
	str	wzr, [x8, _test_input_gamepad.seed@PAGEOFF]
LBB47_338:
	adrp	x8, _test_input_menu@PAGE
	ldrb	w8, [x8, _test_input_menu@PAGEOFF]
	cbz	w8, LBB47_349
; %bb.339:
	bl	_SDL_GetTicks
Lloh356:
	adrp	x8, _test_input_menu_since@PAGE
Lloh357:
	ldr	x8, [x8, _test_input_menu_since@PAGEOFF]
	sub	x21, x0, x8
	mov	x8, #63439                      ; =0xf7cf
	movk	x8, #58195, lsl #16
	lsr	x9, x21, #3
	movk	x8, #39845, lsl #32
	movk	x8, #8388, lsl #48
	umulh	x8, x9, x8
	mov	w9, #1000                       ; =0x3e8
	lsr	x20, x8, #4
	msub	x8, x20, x9, x21
	cmp	x8, #149
	b.hi	LBB47_396
; %bb.340:
Lloh358:
	adrp	x24, _test_input_menu@PAGE
Lloh359:
	add	x24, x24, _test_input_menu@PAGEOFF
Lloh360:
	adrp	x25, l_.str.89@PAGE
Lloh361:
	add	x25, x25, l_.str.89@PAGEOFF
	mov	x0, x24
	mov	x1, x25
	bl	_strspn
	add	x24, x24, w0, sxtw
	mov	x1, x25
	mov	x0, x24
	bl	_strcspn
	cbz	w0, LBB47_396
; %bb.341:
	cmp	x21, #1000
	b.lo	LBB47_344
	.p2align	4, , 8
LBB47_342:                              ; =>This Inner Loop Header: Depth=1
	add	x24, x24, w0, sxtw
	mov	x1, x25
	mov	x0, x24
	bl	_strspn
	add	x24, x24, w0, sxtw
	mov	x1, x25
	mov	x0, x24
	bl	_strcspn
	cbz	w0, LBB47_396
; %bb.343:                              ;   in Loop: Header=BB47_342 Depth=1
	subs	x20, x20, #1
	b.ne	LBB47_342
LBB47_344:
	cmp	w0, #3
	b.gt	LBB47_359
; %bb.345:
	cmp	w0, #1
	b.eq	LBB47_370
; %bb.346:
	cmp	w0, #2
	b.ne	LBB47_396
; %bb.347:
Lloh362:
	adrp	x1, l_.str.83@PAGE
Lloh363:
	add	x1, x1, l_.str.83@PAGEOFF
	mov	w2, w0
	mov	x0, x24
	bl	_strncmp
	cbnz	w0, LBB47_396
; %bb.348:
Lloh364:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE+48
Lloh365:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF+48
	b	LBB47_393
LBB47_349:
	adrp	x20, _test_input_gamepad.seed@PAGE
	ldr	w8, [x20, _test_input_gamepad.seed@PAGEOFF]
	tbnz	w8, #31, LBB47_396
; %bb.350:
Lloh366:
	adrp	x8, _test_input_holding_action@PAGE
Lloh367:
	ldr	w21, [x8, _test_input_holding_action@PAGEOFF]
	bl	_network_test_game_seconds
	fcmp	d0, #0.0
	cbz	w21, LBB47_355
; %bb.351:
	b.ge	LBB47_353
; %bb.352:
	bl	_SDL_GetTicks
	mov	x8, #70368744177664             ; =0x400000000000
	ucvtf	d0, x0
	movk	x8, #16527, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
LBB47_353:
Lloh368:
	adrp	x8, _test_input_holding_action_since@PAGE
Lloh369:
	ldr	d1, [x8, _test_input_holding_action_since@PAGEOFF]
	fsub	d0, d0, d1
	fmov	d1, #1.00000000
	fcmp	d0, d1
	b.lt	LBB47_396
; %bb.354:
	mov	w8, #255                        ; =0xff
	strb	w8, [x19, #8]
	b	LBB47_396
LBB47_355:
	b.ge	LBB47_357
; %bb.356:
	bl	_SDL_GetTicks
	mov	x8, #70368744177664             ; =0x400000000000
	ucvtf	d0, x0
	movk	x8, #16527, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
LBB47_357:
	ldr	w8, [x20, _test_input_gamepad.seed@PAGEOFF]
	scvtf	d1, w8
	mov	x8, #3689348814741910323        ; =0x3333333333333333
	movk	x8, #16379, lsl #48
	fmov	d2, x8
	adrp	x8, _test_input_gamepad.looking@PAGE
	ldrb	w8, [x8, _test_input_gamepad.looking@PAGEOFF]
	fmul	d1, d1, d2
	fadd	d8, d0, d1
	cbz	w8, LBB47_364
; %bb.358:
	fmov	d0, #0.50000000
	fmul	d0, d8, d0
	bl	_halo_sin
	mov	x8, #96757023244288             ; =0x580000000000
	movk	x8, #16587, lsl #48
	fmov	d1, x8
	mov	x8, #3689348814741910323        ; =0x3333333333333333
	movk	x8, #16339, lsl #48
	fmul	d3, d0, d1
	fmov	d1, x8
	fcvtzs	w8, d3
	fmul	d0, d8, d1
	strh	w8, [x19, #18]
	bl	_halo_sin
	mov	x8, #70368744177664             ; =0x400000000000
	movk	x8, #16607, lsl #48
	fmov	d1, x8
	fmul	d3, d0, d1
	fcvtzs	w8, d3
	strh	w8, [x19, #20]
	b	LBB47_396
LBB47_359:
	cmp	w0, #4
	b.eq	LBB47_375
; %bb.360:
	cmp	w0, #5
	b.ne	LBB47_396
; %bb.361:
Lloh370:
	adrp	x1, l_.str.86@PAGE
Lloh371:
	add	x1, x1, l_.str.86@PAGEOFF
	mov	w2, w0
	mov	x0, x24
	mov	w25, w2
	bl	_strncmp
	cbz	w0, LBB47_386
; %bb.362:
Lloh372:
	adrp	x1, l_.str.87@PAGE
Lloh373:
	add	x1, x1, l_.str.87@PAGEOFF
	mov	x0, x24
	mov	w2, w25
	bl	_strncmp
	cbnz	w0, LBB47_396
; %bb.363:
Lloh374:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE+96
Lloh375:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF+96
	b	LBB47_393
LBB47_364:
Lloh376:
	adrp	x8, lCPI47_0@PAGE
Lloh377:
	ldr	d0, [x8, lCPI47_0@PAGEOFF]
	fmul	d0, d8, d0
	bl	_halo_sin
	mov	x8, #70368744177664             ; =0x400000000000
	mov	x9, #3689348814741910323        ; =0x3333333333333333
	movk	x8, #16607, lsl #48
	movk	x9, #16355, lsl #48
	fmov	d1, x8
	ldr	w8, [x20, _test_input_gamepad.seed@PAGEOFF]
	fmov	d2, x9
	fmul	d0, d0, d1
	fmul	d1, d8, d2
	scvtf	d2, w8
	fcvtzs	w8, d0
	fadd	d0, d1, d2
	strh	w8, [x19, #16]
	bl	_halo_cos
	mov	x8, #149533581377536            ; =0x880000000000
	movk	x8, #16595, lsl #48
	fmov	d1, x8
Lloh378:
	adrp	x8, lCPI47_1@PAGE
	fmul	d3, d0, d1
Lloh379:
	ldr	d1, [x8, lCPI47_1@PAGEOFF]
	fmul	d0, d8, d1
	fcvtzs	w8, d3
	strh	w8, [x19, #14]
	bl	_halo_sin
	mov	x8, #96757023244288             ; =0x580000000000
	movk	x8, #16587, lsl #48
	fmov	d1, x8
	fmul	d3, d0, d1
	fmov	d1, #3.00000000
	fmov	d0, d8
	fcvtzs	w8, d3
	strh	w8, [x19, #18]
	bl	_fmod
	mov	x8, #3689348814741910323        ; =0x3333333333333333
	movk	x8, #16339, lsl #48
	fmov	d1, x8
	fcmp	d0, d1
	b.pl	LBB47_366
; %bb.365:
	mov	w8, #255                        ; =0xff
	strb	w8, [x19, #13]
LBB47_366:
	fmov	d1, #5.00000000
	fmov	d0, d8
	bl	_fmod
Lloh380:
	adrp	x8, lCPI47_2@PAGE
Lloh381:
	ldr	d1, [x8, lCPI47_2@PAGEOFF]
	fcmp	d0, d1
	b.pl	LBB47_368
; %bb.367:
	mov	w8, #255                        ; =0xff
	strb	w8, [x27]
LBB47_368:
	fmov	d1, #7.00000000
	fmov	d0, d8
	bl	_fmod
Lloh382:
	adrp	x8, lCPI47_3@PAGE
Lloh383:
	ldr	d1, [x8, lCPI47_3@PAGEOFF]
	fcmp	d0, d1
	b.pl	LBB47_396
; %bb.369:
	mov	w8, #255                        ; =0xff
	strb	w8, [x19, #12]
	b	LBB47_396
LBB47_370:
Lloh384:
	adrp	x1, l_.str.79@PAGE
Lloh385:
	add	x1, x1, l_.str.79@PAGEOFF
	mov	w2, w0
	mov	x0, x24
	mov	w25, w2
	bl	_strncmp
	cbz	w0, LBB47_387
; %bb.371:
Lloh386:
	adrp	x1, l_.str.80@PAGE
Lloh387:
	add	x1, x1, l_.str.80@PAGEOFF
	mov	x0, x24
	mov	w2, w25
	bl	_strncmp
	cbz	w0, LBB47_391
; %bb.372:
Lloh388:
	adrp	x1, l_.str.81@PAGE
Lloh389:
	add	x1, x1, l_.str.81@PAGEOFF
	mov	x0, x24
	mov	w2, w25
	bl	_strncmp
	cbz	w0, LBB47_394
; %bb.373:
Lloh390:
	adrp	x1, l_.str.82@PAGE
Lloh391:
	add	x1, x1, l_.str.82@PAGEOFF
	mov	x0, x24
	mov	w2, w25
	bl	_strncmp
	cbnz	w0, LBB47_396
; %bb.374:
Lloh392:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE+36
Lloh393:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF+36
	b	LBB47_395
LBB47_375:
Lloh394:
	adrp	x1, l_.str.84@PAGE
Lloh395:
	add	x1, x1, l_.str.84@PAGEOFF
	mov	w2, w0
	mov	x0, x24
	mov	w25, w2
	bl	_strncmp
	cbz	w0, LBB47_388
; %bb.376:
Lloh396:
	adrp	x1, l_.str.85@PAGE
Lloh397:
	add	x1, x1, l_.str.85@PAGEOFF
	mov	x0, x24
	mov	w2, w25
	bl	_strncmp
	cbz	w0, LBB47_392
; %bb.377:
Lloh398:
	adrp	x1, l_.str.88@PAGE
Lloh399:
	add	x1, x1, l_.str.88@PAGEOFF
	mov	x0, x24
	mov	w2, w25
	bl	_strncmp
	cbnz	w0, LBB47_396
; %bb.378:
Lloh400:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE+108
Lloh401:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF+108
	b	LBB47_393
LBB47_379:
	mov	x8, x19
	ldrb	w9, [sp, #244]
	ldrb	w10, [x8, #6]!
	cmp	w9, #0
	csinv	w9, w10, wzr, eq
LBB47_380:
	ldrb	w10, [sp, #197]
	strb	w9, [x8]
	cbz	w10, LBB47_383
LBB47_381:
	mov	w8, #255                        ; =0xff
LBB47_382:
	ldrb	w9, [sp, #438]
	ldrb	w10, [sp, #232]
	ldrb	w11, [sp, #164]
	ldrb	w12, [x19, #8]
	ldrb	w13, [sp, #199]
	cmp	w9, #0
	ldrb	w14, [x19, #9]
	csinv	w8, w8, wzr, eq
	orr	w9, w10, w11
	cmp	w9, #0
	csinv	w9, w12, wzr, eq
	cmp	w13, #0
	csinv	w10, w14, wzr, eq
	strb	w8, [x19, #7]
	strb	w9, [x19, #8]
	strb	w10, [x19, #9]
	bl	_network_replay_playing
	cbnz	w0, LBB47_276
	b	LBB47_299
LBB47_383:
	ldrb	w8, [sp, #198]
	cbnz	w8, LBB47_389
; %bb.384:
	cbnz	w21, LBB47_389
; %bb.385:
	ldrb	w8, [sp, #672]
	cbnz	w8, LBB47_381
	b	LBB47_390
LBB47_386:
Lloh402:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE+84
Lloh403:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF+84
	b	LBB47_393
LBB47_387:
Lloh404:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE
Lloh405:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF
	b	LBB47_395
LBB47_388:
Lloh406:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE+60
Lloh407:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF+60
	b	LBB47_393
LBB47_389:
	cbnz	w8, LBB47_381
LBB47_390:
	ldrb	w8, [x19, #7]
	b	LBB47_382
LBB47_391:
Lloh408:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE+12
Lloh409:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF+12
	b	LBB47_395
LBB47_392:
Lloh410:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE+72
Lloh411:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF+72
LBB47_393:
	ldrh	w8, [x8, #8]
	ldurh	w9, [x19, #4]
	orr	w8, w9, w8
	sturh	w8, [x19, #4]
	b	LBB47_396
LBB47_394:
Lloh412:
	adrp	x8, _test_input_menu_gamepad.buttons@PAGE+24
Lloh413:
	add	x8, x8, _test_input_menu_gamepad.buttons@PAGEOFF+24
LBB47_395:
	ldrsw	x8, [x8, #4]
	mov	w9, #255                        ; =0xff
	strb	w9, [x27, x8]
LBB47_396:
	add	x0, x19, #4
	bl	_touch_input_gamepad
	ldr	w1, [sp, #700]
	add	x0, x19, #4
	bl	_touch_input_controls
	add	x1, x19, #4
	mov	w0, wzr
	mov	x2, x22
	bl	_overlay_pad_take
	ldrh	w9, [x19, #18]
	mov	w8, #-8001                      ; =0xffffe0bf
	ldr	x27, [sp, #32]                  ; 8-byte Reload
Lloh414:
	adrp	x21, _chat_pad@PAGE
Lloh415:
	add	x21, x21, _chat_pad@PAGEOFF
	mov	w10, #49535                     ; =0xc17f
	add	w9, w9, w8
	cmp	w9, w10
	b.lo	LBB47_398
; %bb.397:
	ldrh	w9, [x19, #20]
	add	w8, w9, w8
	mov	w9, #49534                      ; =0xc17e
	cmp	w8, w9
	b.hi	LBB47_399
LBB47_398:
Lloh416:
	adrp	x22, _mouse_lock@PAGE
Lloh417:
	add	x22, x22, _mouse_lock@PAGEOFF
	mov	x0, x22
	bl	_pthread_mutex_lock
	bl	_SDL_GetTicks
	adrp	x8, _stick_aimed_ms@PAGE
	str	x0, [x8, _stick_aimed_ms@PAGEOFF]
	mov	x0, x22
	bl	_pthread_mutex_unlock
LBB47_399:
	mov	x22, x19
	mov	w10, #22000                     ; =0x55f0
Lloh418:
	adrp	x23, _controllers@PAGE
Lloh419:
	add	x23, x23, _controllers@PAGEOFF
	ldrh	w8, [x22, #4]!
	ldrsb	w9, [x22, #2]
	ldrsb	w11, [x22, #3]
	lsr	w12, w8, #4
	and	w8, w8, #0xf
	cmp	w9, #0
	ldrsb	w9, [x22, #4]
	bfi	w8, w12, #8, #1
	orr	w12, w8, #0x10
	csel	w8, w12, w8, mi
	ldrb	w12, [x22, #5]
	cmp	w11, #0
	orr	w11, w8, #0x20
	csel	w8, w11, w8, mi
	ldrsh	w11, [x22, #12]
	cmp	w9, #0
	orr	w9, w8, #0x40
	and	w12, w12, #0x80
	csel	w8, w9, w8, mi
	orr	w8, w8, w12
	ldrsh	w9, [x22, #10]
	cmp	w11, w10
	orr	w12, w8, #0x200
	csel	w8, w12, w8, gt
	mov	w12, #-22000                    ; =0xffffaa10
	cmp	w11, w12
	orr	w11, w8, #0x400
	csel	w8, w11, w8, lt
	cmp	w9, w12
	orr	w11, w8, #0x800
	ldrsb	w12, [x22, #7]
	csel	w8, w11, w8, lt
	cmp	w9, w10
	orr	w11, w8, #0x1000
	ldrsb	w9, [x22, #6]
	csel	w8, w11, w8, gt
	orr	w10, w8, #0x2000
	cmp	w12, #0
	csel	w8, w10, w8, mi
	orr	w10, w8, #0x4000
	cmp	w9, #0
	csel	w8, w10, w8, mi
	lsl	w9, w26, #2
	cmp	w27, w23
	str	w8, [x21, w9, uxtw]
	b.eq	LBB47_406
; %bb.400:
	mov	w0, w26
	mov	x1, x22
	bl	_chat_pad_hold_over
	cbz	w28, LBB47_402
LBB47_401:
	stp	xzr, xzr, [x22]
	strh	wzr, [x22, #16]
LBB47_402:
	mov	w8, #28                         ; =0x1c
	add	w10, w22, #8
	ldr	x13, [x22]
	add	w14, w22, #16
	umaddl	x9, w26, w8, x23
	ldr	x10, [x10]
	mov	x8, x9
	ldrh	w14, [x14]
	ldr	x11, [x8, #8]!
	add	w12, w8, #8
	add	w15, w8, #16
	ldr	x12, [x12]
	cmp	x13, x11
	ldrh	w15, [x15]
	ccmp	x10, x12, #0, eq
	ldr	w10, [x9, #4]
	ccmp	x14, x15, #0, eq
	b.eq	LBB47_404
; %bb.403:
	add	w10, w10, #1
	str	w10, [x9, #4]
	ldrh	w9, [x22, #16]
	ldr	q0, [x22]
	strh	w9, [x8, #16]
	str	q0, [x8]
LBB47_404:
	mov	w0, wzr
	str	w10, [x19]
LBB47_405:
	add	sp, sp, #752
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #112              ; 16-byte Folded Reload
	ret
LBB47_406:
	bl	_network_chat_system_keyboard
	cbz	w0, LBB47_409
; %bb.407:
	ldrb	w8, [sp, #438]
	cbz	w8, LBB47_409
; %bb.408:
	adrp	x8, _chat_pad@PAGE
	ldr	w9, [x8, _chat_pad@PAGEOFF]
	orr	w9, w9, #0x20
	str	w9, [x8, _chat_pad@PAGEOFF]
LBB47_409:
	bl	_network_chat_system_keyboard
	adrp	x20, _system_keyboard_update.shown@PAGE
	adrp	x25, _system_keyboard_requests@PAGE
	adrp	x24, _system_keyboard_update.requests_handled@PAGE
	cbz	w0, LBB47_412
; %bb.410:
	ldr	w8, [x20, _system_keyboard_update.shown@PAGEOFF]
	cmp	w8, #1
	b.ne	LBB47_415
LBB47_411:
	ldr	w8, [x24, _system_keyboard_update.requests_handled@PAGEOFF]
	mov	w21, #1                         ; =0x1
	ldr	w9, [x25, _system_keyboard_requests@PAGEOFF]
	cmp	w8, w9
	b.ne	LBB47_417
	b	LBB47_418
LBB47_412:
	bl	_overlay_menu_typing
	cbz	w0, LBB47_416
; %bb.413:
	bl	_touch_input_screen_buttons
	ldr	w8, [x20, _system_keyboard_update.shown@PAGEOFF]
	cmp	w0, #0
	cset	w21, ne
	cmp	w8, w21
	b.ne	LBB47_417
; %bb.414:
	cbnz	w0, LBB47_411
	b	LBB47_418
LBB47_415:
	mov	w21, #1                         ; =0x1
	b	LBB47_417
LBB47_416:
	ldr	w8, [x20, _system_keyboard_update.shown@PAGEOFF]
	mov	w21, wzr
	cbz	w8, LBB47_418
LBB47_417:
	mov	w0, w21
	mov	w1, wzr
	bl	_platform_screen_keyboard
LBB47_418:
	ldr	w8, [x25, _system_keyboard_requests@PAGEOFF]
	mov	w0, w26
	mov	x1, x22
	str	w21, [x20, _system_keyboard_update.shown@PAGEOFF]
	str	w8, [x24, _system_keyboard_update.requests_handled@PAGEOFF]
	bl	_chat_pad_hold_over
	bl	_network_vote_pad_open
	ldrh	w8, [x22]
	adrp	x20, _vote_held_buttons@PAGE
	cbz	w0, LBB47_420
; %bb.419:
	ldrh	w9, [x20, _vote_held_buttons@PAGEOFF]
	and	w8, w8, #0xc
	orr	w8, w9, w8
	b	LBB47_421
LBB47_420:
	ldrh	w9, [x20, _vote_held_buttons@PAGEOFF]
	and	w8, w9, w8
LBB47_421:
	strh	w8, [x20, _vote_held_buttons@PAGEOFF]
	bl	_network_vote_pad_open
	ldrh	w8, [x20, _vote_held_buttons@PAGEOFF]
	cmp	w0, #0
	ldrh	w9, [x22]
	mov	w10, #-13                       ; =0xfffffff3
	csinv	w8, w10, w8, ne
	and	w8, w9, w8
	strh	w8, [x22]
	cbnz	w28, LBB47_401
	b	LBB47_402
LBB47_422:
	cbz	w8, LBB47_427
LBB47_423:
	mov	w8, wzr
	add	x9, sp, #156
LBB47_424:                              ; =>This Inner Loop Header: Depth=1
	add	w10, w9, w8
	cmp	w8, #510
	ldrb	w10, [x10]
	b.hi	LBB47_426
; %bb.425:                              ;   in Loop: Header=BB47_424 Depth=1
	add	w8, w8, #1
	cbz	w10, LBB47_424
LBB47_426:
	cmp	w10, #0
	cset	w9, ne
	b	LBB47_298
LBB47_427:
	ldrb	w8, [sp, #675]
	cmp	w8, #0
	cset	w9, ne
	str	w9, [x21, _replay_keyboard_last@PAGEOFF]
	cbnz	w8, LBB47_299
	b	LBB47_423
	.loh AdrpAdd	Lloh264, Lloh265
	.loh AdrpAdd	Lloh266, Lloh267
	.loh AdrpAdd	Lloh268, Lloh269
	.loh AdrpLdr	Lloh270, Lloh271
	.loh AdrpLdr	Lloh272, Lloh273
	.loh AdrpLdr	Lloh274, Lloh275
	.loh AdrpAdd	Lloh276, Lloh277
	.loh AdrpAdd	Lloh278, Lloh279
	.loh AdrpLdr	Lloh280, Lloh281
	.loh AdrpAdd	Lloh282, Lloh283
	.loh AdrpAdd	Lloh284, Lloh285
	.loh AdrpLdr	Lloh288, Lloh289
	.loh AdrpAdd	Lloh286, Lloh287
	.loh AdrpAdd	Lloh290, Lloh291
	.loh AdrpAdd	Lloh292, Lloh293
	.loh AdrpLdr	Lloh294, Lloh295
	.loh AdrpLdr	Lloh296, Lloh297
	.loh AdrpLdr	Lloh298, Lloh299
	.loh AdrpAdd	Lloh304, Lloh305
	.loh AdrpAdd	Lloh302, Lloh303
	.loh AdrpAdd	Lloh300, Lloh301
	.loh AdrpAdd	Lloh306, Lloh307
	.loh AdrpAdd	Lloh308, Lloh309
	.loh AdrpAdd	Lloh310, Lloh311
	.loh AdrpAdd	Lloh312, Lloh313
	.loh AdrpAdd	Lloh314, Lloh315
	.loh AdrpAdd	Lloh316, Lloh317
	.loh AdrpAdd	Lloh318, Lloh319
	.loh AdrpLdr	Lloh320, Lloh321
	.loh AdrpLdr	Lloh322, Lloh323
	.loh AdrpLdr	Lloh324, Lloh325
	.loh AdrpLdr	Lloh326, Lloh327
	.loh AdrpLdr	Lloh328, Lloh329
	.loh AdrpLdr	Lloh330, Lloh331
	.loh AdrpAdd	Lloh334, Lloh335
	.loh AdrpAdd	Lloh332, Lloh333
	.loh AdrpLdr	Lloh336, Lloh337
	.loh AdrpLdr	Lloh338, Lloh339
	.loh AdrpLdr	Lloh340, Lloh341
	.loh AdrpAdd	Lloh344, Lloh345
	.loh AdrpAdd	Lloh342, Lloh343
	.loh AdrpAdd	Lloh346, Lloh347
	.loh AdrpAdd	Lloh348, Lloh349
	.loh AdrpAdd	Lloh350, Lloh351
	.loh AdrpAdd	Lloh354, Lloh355
	.loh AdrpAdd	Lloh352, Lloh353
	.loh AdrpLdr	Lloh356, Lloh357
	.loh AdrpAdd	Lloh360, Lloh361
	.loh AdrpAdd	Lloh358, Lloh359
	.loh AdrpAdd	Lloh362, Lloh363
	.loh AdrpAdd	Lloh364, Lloh365
	.loh AdrpLdr	Lloh366, Lloh367
	.loh AdrpLdr	Lloh368, Lloh369
	.loh AdrpAdd	Lloh370, Lloh371
	.loh AdrpAdd	Lloh372, Lloh373
	.loh AdrpAdd	Lloh374, Lloh375
	.loh AdrpLdr	Lloh378, Lloh379
	.loh AdrpLdr	Lloh376, Lloh377
	.loh AdrpLdr	Lloh380, Lloh381
	.loh AdrpLdr	Lloh382, Lloh383
	.loh AdrpAdd	Lloh384, Lloh385
	.loh AdrpAdd	Lloh386, Lloh387
	.loh AdrpAdd	Lloh388, Lloh389
	.loh AdrpAdd	Lloh390, Lloh391
	.loh AdrpAdd	Lloh392, Lloh393
	.loh AdrpAdd	Lloh394, Lloh395
	.loh AdrpAdd	Lloh396, Lloh397
	.loh AdrpAdd	Lloh398, Lloh399
	.loh AdrpAdd	Lloh400, Lloh401
	.loh AdrpAdd	Lloh402, Lloh403
	.loh AdrpAdd	Lloh404, Lloh405
	.loh AdrpAdd	Lloh406, Lloh407
	.loh AdrpAdd	Lloh408, Lloh409
	.loh AdrpAdd	Lloh410, Lloh411
	.loh AdrpAdd	Lloh412, Lloh413
	.loh AdrpAdd	Lloh414, Lloh415
	.loh AdrpAdd	Lloh416, Lloh417
	.loh AdrpAdd	Lloh418, Lloh419
                                        ; -- End function
	.p2align	4                               ; -- Begin function sdl_gamepad_state
_sdl_gamepad_state:                     ; @sdl_gamepad_state
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	mov	w22, w3
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	x21, x2
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	cbz	w21, LBB48_2
; %bb.1:
	ldr	w8, [x21, #44]
	cbnz	w8, LBB48_5
LBB48_2:
	mov	x0, x20
	mov	w1, #11                         ; =0xb
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_4
; %bb.3:
	ldrh	w8, [x19]
	orr	w8, w8, #0x1
	strh	w8, [x19]
LBB48_4:
	cbz	w21, LBB48_6
LBB48_5:
	ldr	w8, [x21, #48]
	cbnz	w8, LBB48_9
LBB48_6:
	mov	x0, x20
	mov	w1, #12                         ; =0xc
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_8
; %bb.7:
	ldrh	w8, [x19]
	orr	w8, w8, #0x2
	strh	w8, [x19]
LBB48_8:
	cbz	w21, LBB48_10
LBB48_9:
	ldr	w8, [x21, #52]
	cbnz	w8, LBB48_13
LBB48_10:
	mov	x0, x20
	mov	w1, #13                         ; =0xd
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_12
; %bb.11:
	ldrh	w8, [x19]
	orr	w8, w8, #0x4
	strh	w8, [x19]
LBB48_12:
	cbz	w21, LBB48_14
LBB48_13:
	ldr	w8, [x21, #56]
	cbnz	w8, LBB48_17
LBB48_14:
	mov	x0, x20
	mov	w1, #14                         ; =0xe
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_16
; %bb.15:
	ldrh	w8, [x19]
	orr	w8, w8, #0x8
	strh	w8, [x19]
LBB48_16:
	cbz	w21, LBB48_18
LBB48_17:
	ldr	w8, [x21, #24]
	cbnz	w8, LBB48_21
LBB48_18:
	mov	x0, x20
	mov	w1, #6                          ; =0x6
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_20
; %bb.19:
	ldrh	w8, [x19]
	orr	w8, w8, #0x10
	strh	w8, [x19]
LBB48_20:
	cbz	w21, LBB48_22
LBB48_21:
	ldr	w8, [x21, #16]
	cbnz	w8, LBB48_25
LBB48_22:
	mov	x0, x20
	mov	w1, #4                          ; =0x4
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_24
; %bb.23:
	ldrh	w8, [x19]
	orr	w8, w8, #0x20
	strh	w8, [x19]
LBB48_24:
	cbz	w21, LBB48_26
LBB48_25:
	ldr	w8, [x21, #28]
	cbnz	w8, LBB48_29
LBB48_26:
	mov	x0, x20
	mov	w1, #7                          ; =0x7
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_28
; %bb.27:
	ldrh	w8, [x19]
	orr	w8, w8, #0x40
	strh	w8, [x19]
LBB48_28:
	cbz	w21, LBB48_32
LBB48_29:
	ldr	w8, [x21, #32]
	cbz	w8, LBB48_32
; %bb.30:
	cbz	w22, LBB48_37
; %bb.31:
	mov	w22, wzr
	b	LBB48_41
LBB48_32:
	mov	x0, x20
	mov	w1, #8                          ; =0x8
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_34
; %bb.33:
	ldrh	w8, [x19]
	orr	w8, w8, #0x80
	strh	w8, [x19]
LBB48_34:
	cbz	w22, LBB48_36
; %bb.35:
	mov	w22, wzr
	cbnz	w21, LBB48_41
	b	LBB48_44
LBB48_36:
	cbz	w21, LBB48_39
LBB48_37:
	ldr	w8, [x21]
	cbz	w8, LBB48_39
; %bb.38:
	mov	w22, #1                         ; =0x1
	b	LBB48_41
LBB48_39:
	mov	x0, x20
	mov	w1, wzr
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_43
; %bb.40:
	mov	w8, #255                        ; =0xff
	mov	w22, #1                         ; =0x1
	strb	w8, [x19, #2]
	cbz	w21, LBB48_44
LBB48_41:
	ldr	w8, [x21, #4]
	cbnz	w8, LBB48_49
; %bb.42:
	mov	w23, wzr
	b	LBB48_45
LBB48_43:
	mov	w22, #1                         ; =0x1
	cbnz	w21, LBB48_41
LBB48_44:
	mov	w23, #1                         ; =0x1
LBB48_45:
	mov	x0, x20
	mov	w1, #1                          ; =0x1
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_47
; %bb.46:
	mov	w8, #255                        ; =0xff
	strb	w8, [x19, #3]
LBB48_47:
	tbz	w23, #0, LBB48_49
; %bb.48:
	mov	w23, #1                         ; =0x1
	b	LBB48_51
LBB48_49:
	ldr	w8, [x21, #8]
	cbnz	w8, LBB48_55
; %bb.50:
	mov	w23, wzr
LBB48_51:
	mov	x0, x20
	mov	w1, #2                          ; =0x2
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_53
; %bb.52:
	mov	w8, #255                        ; =0xff
	strb	w8, [x19, #4]
LBB48_53:
	tbz	w23, #0, LBB48_55
; %bb.54:
	mov	w23, #1                         ; =0x1
	b	LBB48_57
LBB48_55:
	ldr	w8, [x21, #12]
	cbnz	w8, LBB48_61
; %bb.56:
	mov	w23, wzr
LBB48_57:
	mov	x0, x20
	mov	w1, #3                          ; =0x3
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_59
; %bb.58:
	mov	w8, #255                        ; =0xff
	strb	w8, [x19, #5]
LBB48_59:
	tbz	w23, #0, LBB48_61
; %bb.60:
	mov	w23, #1                         ; =0x1
	b	LBB48_63
LBB48_61:
	ldr	w8, [x21, #36]
	cbnz	w8, LBB48_67
; %bb.62:
	mov	w23, wzr
LBB48_63:
	mov	x0, x20
	mov	w1, #9                          ; =0x9
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_65
; %bb.64:
	mov	w8, #255                        ; =0xff
	strb	w8, [x19, #7]
LBB48_65:
	tbz	w23, #0, LBB48_67
; %bb.66:
	mov	w23, #1                         ; =0x1
	b	LBB48_69
LBB48_67:
	ldr	w8, [x21, #40]
	cbnz	w8, LBB48_73
; %bb.68:
	mov	w23, wzr
LBB48_69:
	mov	x0, x20
	mov	w1, #10                         ; =0xa
	bl	_SDL_GetGamepadButton
	cbz	w0, LBB48_71
; %bb.70:
	mov	w8, #255                        ; =0xff
	strb	w8, [x19, #6]
LBB48_71:
	tbz	w23, #0, LBB48_73
; %bb.72:
	mov	w24, #1                         ; =0x1
	b	LBB48_76
LBB48_73:
	ldr	w8, [x21, #104]
	cbz	w8, LBB48_75
; %bb.74:
	mov	w23, wzr
	b	LBB48_77
LBB48_75:
	mov	w24, wzr
LBB48_76:
	mov	x0, x20
	mov	w1, #4                          ; =0x4
	bl	_SDL_GetGamepadAxis
	mov	w8, #3                          ; =0x3
	lsl	w9, w0, #8
	movk	w8, #32769, lsl #16
	sub	w9, w9, w0
	smull	x8, w9, w8
	add	x8, x9, x8, lsr #32
	asr	w9, w8, #14
	add	w23, w9, w8, lsr #31
	tbnz	w24, #0, LBB48_79
LBB48_77:
	ldr	w8, [x21, #108]
	cbz	w8, LBB48_79
; %bb.78:
	mov	w8, wzr
	b	LBB48_80
LBB48_79:
	mov	x0, x20
	mov	w1, #5                          ; =0x5
	bl	_SDL_GetGamepadAxis
	mov	w8, #3                          ; =0x3
	lsl	w9, w0, #8
	movk	w8, #32769, lsl #16
	sub	w9, w9, w0
	smull	x8, w9, w8
	add	x8, x9, x8, lsr #32
	asr	w9, w8, #14
	add	w8, w9, w8, lsr #31
LBB48_80:
	ldrb	w9, [x19, #8]
	cmp	w23, w9
	b.le	LBB48_82
; %bb.81:
	strb	w23, [x19, #8]
LBB48_82:
	ldrb	w9, [x19, #9]
	cmp	w8, w9
	b.le	LBB48_84
; %bb.83:
	strb	w8, [x19, #9]
LBB48_84:
	mov	x0, x20
	mov	w1, wzr
	bl	_SDL_GetGamepadAxis
	ldrsh	w8, [x19, #10]
	cmp	w0, #0
	cneg	w9, w0, mi
	cmp	w8, #0
	cneg	w8, w8, mi
	cmp	w9, w8
	b.ls	LBB48_86
; %bb.85:
	strh	w0, [x19, #10]
LBB48_86:
	mov	x0, x20
	mov	w1, #1                          ; =0x1
	bl	_SDL_GetGamepadAxis
	ldrsh	w9, [x19, #12]
	mvn	w8, w0
	neg	w10, w8
	cmp	w8, #0
	csinv	w10, w10, w0, mi
	cmp	w9, #0
	cneg	w9, w9, mi
	cmp	w10, w9
	b.ls	LBB48_88
; %bb.87:
	strh	w8, [x19, #12]
LBB48_88:
	cbz	w22, LBB48_93
; %bb.89:
	mov	x0, x20
	mov	w1, #2                          ; =0x2
	bl	_SDL_GetGamepadAxis
	ldrsh	w8, [x19, #14]
	cmp	w0, #0
	cneg	w9, w0, mi
	cmp	w8, #0
	cneg	w8, w8, mi
	cmp	w9, w8
	b.ls	LBB48_91
; %bb.90:
	strh	w0, [x19, #14]
LBB48_91:
	mov	x0, x20
	mov	w1, #3                          ; =0x3
	bl	_SDL_GetGamepadAxis
	ldrsh	w9, [x19, #16]
	mvn	w8, w0
	neg	w10, w8
	cmp	w8, #0
	csinv	w10, w10, w0, mi
	cmp	w9, #0
	cneg	w9, w9, mi
	cmp	w10, w9
	b.ls	LBB48_93
; %bb.92:
	strh	w8, [x19, #16]
LBB48_93:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
                                        ; -- End function
	.p2align	4                               ; -- Begin function overlay_pad_take
_overlay_pad_take:                      ; @overlay_pad_take
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	ldrh	w8, [x1]
	mov	x21, x2
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	mov	x19, x1
	mov	w20, w0
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	tbnz	w8, #0, LBB49_2
; %bb.1:
	ldrsh	w9, [x19, #12]
	mov	w10, #22001                     ; =0x55f1
	cmp	w9, w10
	b.lt	LBB49_3
LBB49_2:
	mov	w9, #1                          ; =0x1
	tbz	w8, #1, LBB49_4
	b	LBB49_5
LBB49_3:
	mov	w9, wzr
	tbnz	w8, #1, LBB49_5
LBB49_4:
	ldrsh	w10, [x19, #12]
	mov	w11, #-22001                    ; =0xffffaa0f
	cmp	w10, w11
	b.gt	LBB49_6
LBB49_5:
	orr	w9, w9, #0x2
LBB49_6:
	tbnz	w8, #2, LBB49_8
; %bb.7:
	ldrsh	w10, [x19, #10]
	mov	w11, #-22001                    ; =0xffffaa0f
	cmp	w10, w11
	b.gt	LBB49_9
LBB49_8:
	orr	w9, w9, #0x4
LBB49_9:
	tbnz	w8, #3, LBB49_11
; %bb.10:
	ldrsh	w10, [x19, #10]
	mov	w11, #22001                     ; =0x55f1
	cmp	w10, w11
	b.lt	LBB49_12
LBB49_11:
	orr	w9, w9, #0x8
LBB49_12:
	lsr	w10, w8, #4
	ldrsb	w11, [x19, #2]
	lsl	w8, w8, #9
	and	w8, w8, #0x400
	bfi	w8, w10, #6, #2
	ldrsb	w10, [x19, #3]
	orr	w8, w9, w8
	cmp	w11, #0
	orr	w9, w8, #0x10
	ldrsb	w11, [x19, #7]
	csel	w8, w9, w8, mi
	orr	w9, w8, #0x20
	cmp	w10, #0
	ldrsb	w10, [x19, #6]
	csel	w8, w9, w8, mi
	cmp	w11, #0
	orr	w9, w8, #0x100
	csel	w8, w9, w8, mi
	orr	w9, w8, #0x200
	cmp	w10, #0
	csel	w22, w9, w8, mi
	cbz	w21, LBB49_14
; %bb.13:
	mov	x0, x21
	mov	w1, #9                          ; =0x9
	bl	_SDL_GetGamepadButton
	cmp	w0, #0
	mov	x0, x21
	mov	w1, #10                         ; =0xa
	orr	w8, w22, #0x100
	csel	w22, w8, w22, ne
	bl	_SDL_GetGamepadButton
	cmp	w0, #0
	mov	x0, x21
	mov	w1, #12                         ; =0xc
	orr	w8, w22, #0x200
	csel	w22, w8, w22, ne
	bl	_SDL_GetGamepadButton
	orr	w8, w22, #0x400
	cmp	w0, #0
	csel	w22, w8, w22, ne
LBB49_14:
	mov	w1, w22
	sxth	w0, w20
	bl	_overlay_menu_take_pad
	ldrh	w9, [x19]
Lloh420:
	adrp	x11, _overlay_held_buttons@PAGE
Lloh421:
	add	x11, x11, _overlay_held_buttons@PAGEOFF
Lloh422:
	adrp	x8, _overlay_held_analog@PAGE
Lloh423:
	add	x8, x8, _overlay_held_analog@PAGEOFF
	lsl	w10, w20, #1
	cbz	w0, LBB49_30
; %bb.15:
	strh	w9, [x11, w10, sxtw]
	strb	wzr, [x8, w20, sxtw]
	ldrb	w9, [x19, #2]
	cmp	w9, #0
	cset	w9, ne
	strb	w9, [x8, w20, sxtw]
	ldrb	w10, [x19, #3]
	cbz	w10, LBB49_17
; %bb.16:
	orr	w9, w9, #0x2
	strb	w9, [x8, w20, sxtw]
LBB49_17:
	ldrb	w10, [x19, #4]
	cbz	w10, LBB49_19
; %bb.18:
	orr	w9, w9, #0x4
	strb	w9, [x8, w20, sxtw]
LBB49_19:
	ldrb	w10, [x19, #5]
	cbz	w10, LBB49_21
; %bb.20:
	orr	w9, w9, #0x8
	strb	w9, [x8, w20, sxtw]
LBB49_21:
	ldrb	w10, [x19, #6]
	cbz	w10, LBB49_23
; %bb.22:
	orr	w9, w9, #0x10
	strb	w9, [x8, w20, sxtw]
LBB49_23:
	ldrb	w10, [x19, #7]
	cbz	w10, LBB49_25
; %bb.24:
	orr	w9, w9, #0x20
	strb	w9, [x8, w20, sxtw]
LBB49_25:
	ldrb	w10, [x19, #8]
	cbz	w10, LBB49_27
; %bb.26:
	orr	w9, w9, #0x40
	strb	w9, [x8, w20, sxtw]
LBB49_27:
	ldrb	w10, [x19, #9]
	cbz	w10, LBB49_29
; %bb.28:
	orr	w9, w9, #0x80
	strb	w9, [x8, w20, sxtw]
LBB49_29:
	stp	xzr, xzr, [x19]
	strh	wzr, [x19, #16]
	b	LBB49_62
LBB49_30:
	ldrh	w12, [x11, w10, sxtw]
	and	w12, w12, w9
	eor	w9, w12, w9
	strh	w12, [x11, w10, sxtw]
	strh	w9, [x19]
	ldrb	w9, [x8, w20, sxtw]
	tbnz	w9, #0, LBB49_38
; %bb.31:
	tbnz	w9, #1, LBB49_41
LBB49_32:
	tbnz	w9, #2, LBB49_44
LBB49_33:
	tbnz	w9, #3, LBB49_47
LBB49_34:
	tbnz	w9, #4, LBB49_50
LBB49_35:
	tbnz	w9, #5, LBB49_53
LBB49_36:
	tbnz	w9, #6, LBB49_56
LBB49_37:
	tbnz	w9, #7, LBB49_59
	b	LBB49_62
LBB49_38:
	ldrb	w10, [x19, #2]
	cbz	w10, LBB49_40
; %bb.39:
	strb	wzr, [x19, #2]
	tbz	w9, #1, LBB49_32
	b	LBB49_41
LBB49_40:
	and	w9, w9, #0xfe
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #1, LBB49_32
LBB49_41:
	ldrb	w10, [x19, #3]
	cbz	w10, LBB49_43
; %bb.42:
	strb	wzr, [x19, #3]
	tbz	w9, #2, LBB49_33
	b	LBB49_44
LBB49_43:
	and	w9, w9, #0xfffffffd
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #2, LBB49_33
LBB49_44:
	ldrb	w10, [x19, #4]
	cbz	w10, LBB49_46
; %bb.45:
	strb	wzr, [x19, #4]
	tbz	w9, #3, LBB49_34
	b	LBB49_47
LBB49_46:
	mov	w10, #251                       ; =0xfb
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #3, LBB49_34
LBB49_47:
	ldrb	w10, [x19, #5]
	cbz	w10, LBB49_49
; %bb.48:
	strb	wzr, [x19, #5]
	tbz	w9, #4, LBB49_35
	b	LBB49_50
LBB49_49:
	mov	w10, #247                       ; =0xf7
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #4, LBB49_35
LBB49_50:
	ldrb	w10, [x19, #6]
	cbz	w10, LBB49_52
; %bb.51:
	strb	wzr, [x19, #6]
	tbz	w9, #5, LBB49_36
	b	LBB49_53
LBB49_52:
	mov	w10, #239                       ; =0xef
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #5, LBB49_36
LBB49_53:
	ldrb	w10, [x19, #7]
	cbz	w10, LBB49_55
; %bb.54:
	strb	wzr, [x19, #7]
	tbz	w9, #6, LBB49_37
	b	LBB49_56
LBB49_55:
	mov	w10, #223                       ; =0xdf
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #6, LBB49_37
LBB49_56:
	ldrb	w10, [x19, #8]
	cbz	w10, LBB49_58
; %bb.57:
	strb	wzr, [x19, #8]
	tbnz	w9, #7, LBB49_59
	b	LBB49_62
LBB49_58:
	mov	w10, #191                       ; =0xbf
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #7, LBB49_62
LBB49_59:
	ldrb	w10, [x19, #9]
	cbz	w10, LBB49_61
; %bb.60:
	strb	wzr, [x19, #9]
	b	LBB49_62
LBB49_61:
	and	w9, w9, #0x7f
	strb	w9, [x8, w20, sxtw]
LBB49_62:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh422, Lloh423
	.loh AdrpAdd	Lloh420, Lloh421
                                        ; -- End function
	.p2align	4                               ; -- Begin function chat_pad_hold_over
_chat_pad_hold_over:                    ; @chat_pad_hold_over
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	mov	x19, x1
	mov	w20, w0
	bl	_network_chat_controller
	ldrh	w9, [x19]
Lloh424:
	adrp	x11, _chat_held_buttons@PAGE
Lloh425:
	add	x11, x11, _chat_held_buttons@PAGEOFF
Lloh426:
	adrp	x8, _chat_held_analog@PAGE
Lloh427:
	add	x8, x8, _chat_held_analog@PAGEOFF
	lsl	w10, w20, #1
	cmp	w0, w20
	b.ne	LBB50_16
; %bb.1:
	strh	w9, [x11, w10, sxtw]
	strb	wzr, [x8, w20, sxtw]
	ldrb	w9, [x19, #2]
	cmp	w9, #0
	cset	w9, ne
	strb	w9, [x8, w20, sxtw]
	ldrb	w10, [x19, #3]
	cbz	w10, LBB50_3
; %bb.2:
	orr	w9, w9, #0x2
	strb	w9, [x8, w20, sxtw]
LBB50_3:
	ldrb	w10, [x19, #4]
	cbz	w10, LBB50_5
; %bb.4:
	orr	w9, w9, #0x4
	strb	w9, [x8, w20, sxtw]
LBB50_5:
	ldrb	w10, [x19, #5]
	cbz	w10, LBB50_7
; %bb.6:
	orr	w9, w9, #0x8
	strb	w9, [x8, w20, sxtw]
LBB50_7:
	ldrb	w10, [x19, #6]
	cbz	w10, LBB50_9
; %bb.8:
	orr	w9, w9, #0x10
	strb	w9, [x8, w20, sxtw]
LBB50_9:
	ldrb	w10, [x19, #7]
	cbz	w10, LBB50_11
; %bb.10:
	orr	w9, w9, #0x20
	strb	w9, [x8, w20, sxtw]
LBB50_11:
	ldrb	w10, [x19, #8]
	cbz	w10, LBB50_13
; %bb.12:
	orr	w9, w9, #0x40
	strb	w9, [x8, w20, sxtw]
LBB50_13:
	ldrb	w10, [x19, #9]
	cbz	w10, LBB50_15
; %bb.14:
	orr	w9, w9, #0x80
	strb	w9, [x8, w20, sxtw]
LBB50_15:
	stp	xzr, xzr, [x19]
	strh	wzr, [x19, #16]
	b	LBB50_48
LBB50_16:
	ldrh	w12, [x11, w10, sxtw]
	and	w12, w12, w9
	eor	w9, w12, w9
	strh	w12, [x11, w10, sxtw]
	strh	w9, [x19]
	ldrb	w9, [x8, w20, sxtw]
	tbnz	w9, #0, LBB50_24
; %bb.17:
	tbnz	w9, #1, LBB50_27
LBB50_18:
	tbnz	w9, #2, LBB50_30
LBB50_19:
	tbnz	w9, #3, LBB50_33
LBB50_20:
	tbnz	w9, #4, LBB50_36
LBB50_21:
	tbnz	w9, #5, LBB50_39
LBB50_22:
	tbnz	w9, #6, LBB50_42
LBB50_23:
	tbnz	w9, #7, LBB50_45
	b	LBB50_48
LBB50_24:
	ldrb	w10, [x19, #2]
	cbz	w10, LBB50_26
; %bb.25:
	strb	wzr, [x19, #2]
	tbz	w9, #1, LBB50_18
	b	LBB50_27
LBB50_26:
	and	w9, w9, #0xfe
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #1, LBB50_18
LBB50_27:
	ldrb	w10, [x19, #3]
	cbz	w10, LBB50_29
; %bb.28:
	strb	wzr, [x19, #3]
	tbz	w9, #2, LBB50_19
	b	LBB50_30
LBB50_29:
	and	w9, w9, #0xfffffffd
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #2, LBB50_19
LBB50_30:
	ldrb	w10, [x19, #4]
	cbz	w10, LBB50_32
; %bb.31:
	strb	wzr, [x19, #4]
	tbz	w9, #3, LBB50_20
	b	LBB50_33
LBB50_32:
	mov	w10, #251                       ; =0xfb
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #3, LBB50_20
LBB50_33:
	ldrb	w10, [x19, #5]
	cbz	w10, LBB50_35
; %bb.34:
	strb	wzr, [x19, #5]
	tbz	w9, #4, LBB50_21
	b	LBB50_36
LBB50_35:
	mov	w10, #247                       ; =0xf7
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #4, LBB50_21
LBB50_36:
	ldrb	w10, [x19, #6]
	cbz	w10, LBB50_38
; %bb.37:
	strb	wzr, [x19, #6]
	tbz	w9, #5, LBB50_22
	b	LBB50_39
LBB50_38:
	mov	w10, #239                       ; =0xef
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #5, LBB50_22
LBB50_39:
	ldrb	w10, [x19, #7]
	cbz	w10, LBB50_41
; %bb.40:
	strb	wzr, [x19, #7]
	tbz	w9, #6, LBB50_23
	b	LBB50_42
LBB50_41:
	mov	w10, #223                       ; =0xdf
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #6, LBB50_23
LBB50_42:
	ldrb	w10, [x19, #8]
	cbz	w10, LBB50_44
; %bb.43:
	strb	wzr, [x19, #8]
	tbnz	w9, #7, LBB50_45
	b	LBB50_48
LBB50_44:
	mov	w10, #191                       ; =0xbf
	and	w9, w9, w10
	strb	w9, [x8, w20, sxtw]
	tbz	w9, #7, LBB50_48
LBB50_45:
	ldrb	w10, [x19, #9]
	cbz	w10, LBB50_47
; %bb.46:
	strb	wzr, [x19, #9]
	b	LBB50_48
LBB50_47:
	and	w9, w9, #0x7f
	strb	w9, [x8, w20, sxtw]
LBB50_48:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh426, Lloh427
	.loh AdrpAdd	Lloh424, Lloh425
                                        ; -- End function
	.globl	_XInputSetState                 ; -- Begin function XInputSetState
	.p2align	4
_XInputSetState:                        ; @XInputSetState
; %bb.0:
	sub	sp, sp, #64
Lloh428:
	adrp	x8, _controllers@PAGE
Lloh429:
	add	x8, x8, _controllers@PAGEOFF
	cmp	w0, w8
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	b.eq	LBB51_6
; %bb.1:
	add	w8, w8, #28
	cmp	w0, w8
	b.eq	LBB51_9
; %bb.2:
Lloh430:
	adrp	x8, _controllers@PAGE
Lloh431:
	add	x8, x8, _controllers@PAGEOFF
	add	w8, w8, #56
	cmp	w0, w8
	b.eq	LBB51_11
; %bb.3:
Lloh432:
	adrp	x8, _controllers@PAGE+84
Lloh433:
	add	x8, x8, _controllers@PAGEOFF+84
	cmp	w0, w8
	b.ne	LBB51_16
; %bb.4:
	ldr	w8, [x8]
	cbz	w8, LBB51_16
; %bb.5:
	mov	w19, #3                         ; =0x3
	cbnz	w1, LBB51_13
	b	LBB51_18
LBB51_6:
Lloh434:
	adrp	x8, _controllers@PAGE
Lloh435:
	ldr	w8, [x8, _controllers@PAGEOFF]
	cbz	w8, LBB51_16
; %bb.7:
	cbz	w1, LBB51_18
; %bb.8:
	ldrh	w8, [x1, #68]
	mov	x21, x1
	ldrh	w0, [x1, #66]
	str	wzr, [x1]
	mov	w1, w8
	bl	_touch_input_rumble
	mov	w19, wzr
	b	LBB51_14
LBB51_9:
Lloh436:
	adrp	x8, _controllers@PAGE+28
Lloh437:
	ldr	w8, [x8, _controllers@PAGEOFF+28]
	cbz	w8, LBB51_16
; %bb.10:
	mov	w19, #1                         ; =0x1
	cbnz	w1, LBB51_13
	b	LBB51_18
LBB51_11:
Lloh438:
	adrp	x8, _controllers@PAGE+56
Lloh439:
	ldr	w8, [x8, _controllers@PAGEOFF+56]
	cbz	w8, LBB51_16
; %bb.12:
	mov	w19, #2                         ; =0x2
	cbz	w1, LBB51_18
LBB51_13:
	mov	x21, x1
	str	wzr, [x1]
LBB51_14:
	mov	x0, sp
	bl	_sdl_gamepads
	mov	w20, w0
	mov	x0, sp
	mov	w1, w20
	mov	w2, w19
	bl	_port_gamepad
	cbz	w0, LBB51_19
; %bb.15:
	mov	x0, sp
	mov	w1, w20
	mov	w2, w19
	bl	_port_gamepad
	ldrh	w1, [x21, #66]
	mov	w3, #100                        ; =0x64
	ldrh	w2, [x21, #68]
	bl	_SDL_RumbleGamepad
	mov	w0, wzr
	b	LBB51_19
LBB51_16:
	cbz	w1, LBB51_18
; %bb.17:
	mov	w0, #1167                       ; =0x48f
	str	wzr, [x1]
	b	LBB51_19
LBB51_18:
	mov	w0, #87                         ; =0x57
LBB51_19:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh428, Lloh429
	.loh AdrpAdd	Lloh430, Lloh431
	.loh AdrpAdd	Lloh432, Lloh433
	.loh AdrpLdr	Lloh434, Lloh435
	.loh AdrpLdr	Lloh436, Lloh437
	.loh AdrpLdr	Lloh438, Lloh439
                                        ; -- End function
	.globl	_XInputDebugInitKeyboardQueue   ; -- Begin function XInputDebugInitKeyboardQueue
	.p2align	4
_XInputDebugInitKeyboardQueue:          ; @XInputDebugInitKeyboardQueue
; %bb.0:
	mov	w0, wzr
	ret
                                        ; -- End function
	.globl	_XInputDebugGetKeystroke        ; -- Begin function XInputDebugGetKeystroke
	.p2align	4
_XInputDebugGetKeystroke:               ; @XInputDebugGetKeystroke
; %bb.0:
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	mov	x19, x0
	strb	wzr, [x0, #2]
	strh	wzr, [x0]
	add	x0, sp, #8
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	bl	_platform_next_keystroke
	cbz	w0, LBB53_19
; %bb.1:
	adrp	x21, _text_typing@PAGE
Lloh440:
	adrp	x20, l_.str.9@PAGE
Lloh441:
	add	x20, x20, l_.str.9@PAGEOFF
	b	LBB53_5
LBB53_2:                                ;   in Loop: Header=BB53_5 Depth=1
	bl	_overlay_menu_open
	cbz	w0, LBB53_18
LBB53_3:                                ;   in Loop: Header=BB53_5 Depth=1
	bl	_overlay_menu_toggle_request
	.p2align	4, , 8
LBB53_4:                                ;   in Loop: Header=BB53_5 Depth=1
	add	x0, sp, #8
	bl	_platform_next_keystroke
	cbz	w0, LBB53_19
LBB53_5:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	ldrb	w22, [sp, #10]
	cbz	w8, LBB53_7
; %bb.6:                                ;   in Loop: Header=BB53_5 Depth=1
	bl	_console_is_active
	cbz	w0, LBB53_15
LBB53_7:                                ;   in Loop: Header=BB53_5 Depth=1
	tbnz	w22, #6, LBB53_20
; %bb.8:                                ;   in Loop: Header=BB53_5 Depth=1
	bl	_overlay_menu_typing
	cbnz	w0, LBB53_20
; %bb.9:                                ;   in Loop: Header=BB53_5 Depth=1
	bl	_overlay_menu_open
	cbnz	w0, LBB53_4
; %bb.10:                               ;   in Loop: Header=BB53_5 Depth=1
	ldrb	w8, [sp, #8]
	cmp	w8, #192
	b.eq	LBB53_20
; %bb.11:                               ;   in Loop: Header=BB53_5 Depth=1
	bl	_console_is_active
	cbnz	w0, LBB53_20
; %bb.12:                               ;   in Loop: Header=BB53_5 Depth=1
	bl	_network_chat_typing
	cbnz	w0, LBB53_20
; %bb.13:                               ;   in Loop: Header=BB53_5 Depth=1
	ldr	w8, [x21, _text_typing@PAGEOFF]
	cbz	w8, LBB53_4
; %bb.14:                               ;   in Loop: Header=BB53_5 Depth=1
	ldrb	w8, [sp, #8]
	cmp	w8, #27
	b.eq	LBB53_4
	b	LBB53_20
	.p2align	4, , 8
LBB53_15:                               ;   in Loop: Header=BB53_5 Depth=1
	bl	_network_chat_typing
	cbnz	w0, LBB53_7
; %bb.16:                               ;   in Loop: Header=BB53_5 Depth=1
	ldr	w8, [x21, _text_typing@PAGEOFF]
	cbnz	w8, LBB53_7
; %bb.17:                               ;   in Loop: Header=BB53_5 Depth=1
	bl	_overlay_menu_typing
	cbnz	w0, LBB53_7
	b	LBB53_2
LBB53_18:                               ;   in Loop: Header=BB53_5 Depth=1
	mov	x0, x20
	bl	_config_boolean
	cbnz	w0, LBB53_3
	b	LBB53_7
LBB53_19:
	mov	w0, #38                         ; =0x26
	b	LBB53_21
LBB53_20:
	ldrb	w8, [sp, #8]
	mov	w0, wzr
	ldurh	w9, [sp, #9]
	strb	w8, [x19]
	sturh	w9, [x19, #1]
LBB53_21:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.loh AdrpAdd	Lloh440, Lloh441
                                        ; -- End function
	.p2align	4                               ; -- Begin function gamepad_idle
_gamepad_idle:                          ; @gamepad_idle
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	mov	w1, wzr
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	mov	x19, x0
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.1:
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.2:
	mov	x0, x19
	mov	w1, #2                          ; =0x2
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.3:
	mov	x0, x19
	mov	w1, #3                          ; =0x3
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.4:
	mov	x0, x19
	mov	w1, #4                          ; =0x4
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.5:
	mov	x0, x19
	mov	w1, #5                          ; =0x5
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.6:
	mov	x0, x19
	mov	w1, #6                          ; =0x6
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.7:
	mov	x0, x19
	mov	w1, #7                          ; =0x7
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.8:
	mov	x0, x19
	mov	w1, #8                          ; =0x8
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.9:
	mov	x0, x19
	mov	w1, #9                          ; =0x9
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.10:
	mov	x0, x19
	mov	w1, #10                         ; =0xa
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.11:
	mov	x0, x19
	mov	w1, #11                         ; =0xb
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.12:
	mov	x0, x19
	mov	w1, #12                         ; =0xc
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.13:
	mov	x0, x19
	mov	w1, #13                         ; =0xd
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.14:
	mov	x0, x19
	mov	w1, #14                         ; =0xe
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.15:
	mov	x0, x19
	mov	w1, #15                         ; =0xf
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.16:
	mov	x0, x19
	mov	w1, #16                         ; =0x10
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.17:
	mov	x0, x19
	mov	w1, #17                         ; =0x11
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.18:
	mov	x0, x19
	mov	w1, #18                         ; =0x12
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.19:
	mov	x0, x19
	mov	w1, #19                         ; =0x13
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.20:
	mov	x0, x19
	mov	w1, #20                         ; =0x14
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.21:
	mov	x0, x19
	mov	w1, #21                         ; =0x15
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.22:
	mov	x0, x19
	mov	w1, #22                         ; =0x16
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.23:
	mov	x0, x19
	mov	w1, #23                         ; =0x17
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.24:
	mov	x0, x19
	mov	w1, #24                         ; =0x18
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.25:
	mov	x0, x19
	mov	w1, #25                         ; =0x19
	bl	_SDL_GetGamepadButton
	tbnz	w0, #0, LBB54_31
; %bb.26:
	mov	x0, x19
	mov	w1, wzr
	bl	_SDL_GetGamepadAxis
	mov	w20, #-8001                     ; =0xffffe0bf
	mov	w21, #49535                     ; =0xc17f
	add	w8, w0, w20
	cmp	w21, w8, uxth
	b.hi	LBB54_31
; %bb.27:
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	bl	_SDL_GetGamepadAxis
	add	w8, w0, w20
	cmp	w21, w8, uxth
	b.hi	LBB54_31
; %bb.28:
	mov	x0, x19
	mov	w1, #2                          ; =0x2
	bl	_SDL_GetGamepadAxis
	add	w8, w0, w20
	cmp	w21, w8, uxth
	b.hi	LBB54_31
; %bb.29:
	mov	x0, x19
	mov	w1, #3                          ; =0x3
	bl	_SDL_GetGamepadAxis
	add	w8, w0, w20
	cmp	w21, w8, uxth
	b.hi	LBB54_31
; %bb.30:
	mov	x0, x19
	mov	w1, #4                          ; =0x4
	bl	_SDL_GetGamepadAxis
	mov	w8, #-8001                      ; =0xffffe0bf
	mov	w9, #49535                      ; =0xc17f
	add	w8, w0, w8
	cmp	w9, w8, uxth
	b.ls	LBB54_33
LBB54_31:
	mov	w0, wzr
LBB54_32:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB54_33:
	mov	x0, x19
	mov	w1, #5                          ; =0x5
	bl	_SDL_GetGamepadAxis
	mov	w8, #8000                       ; =0x1f40
	mov	w9, #16001                      ; =0x3e81
	add	w8, w0, w8
	cmp	w9, w8, uxth
	cset	w0, hi
	b	LBB54_32
                                        ; -- End function
	.section	__TEXT,__const
	.globl	_D3DSIMPLERENDERSTATEENCODE     ; @D3DSIMPLERENDERSTATEENCODE
	.weak_definition	_D3DSIMPLERENDERSTATEENCODE
	.p2align	2, 0x0
_D3DSIMPLERENDERSTATEENCODE:
	.long	262752                          ; 0x40260
	.long	262756                          ; 0x40264
	.long	262760                          ; 0x40268
	.long	262764                          ; 0x4026c
	.long	262768                          ; 0x40270
	.long	262772                          ; 0x40274
	.long	262776                          ; 0x40278
	.long	262780                          ; 0x4027c
	.long	262792                          ; 0x40288
	.long	262796                          ; 0x4028c
	.long	264800                          ; 0x40a60
	.long	264804                          ; 0x40a64
	.long	264808                          ; 0x40a68
	.long	264812                          ; 0x40a6c
	.long	264816                          ; 0x40a70
	.long	264820                          ; 0x40a74
	.long	264824                          ; 0x40a78
	.long	264828                          ; 0x40a7c
	.long	264832                          ; 0x40a80
	.long	264836                          ; 0x40a84
	.long	264840                          ; 0x40a88
	.long	264844                          ; 0x40a8c
	.long	264848                          ; 0x40a90
	.long	264852                          ; 0x40a94
	.long	264856                          ; 0x40a98
	.long	264860                          ; 0x40a9c
	.long	264864                          ; 0x40aa0
	.long	264868                          ; 0x40aa4
	.long	264872                          ; 0x40aa8
	.long	264876                          ; 0x40aac
	.long	264880                          ; 0x40ab0
	.long	264884                          ; 0x40ab4
	.long	264888                          ; 0x40ab8
	.long	264892                          ; 0x40abc
	.long	264896                          ; 0x40ac0
	.long	264900                          ; 0x40ac4
	.long	264904                          ; 0x40ac8
	.long	264908                          ; 0x40acc
	.long	264912                          ; 0x40ad0
	.long	264916                          ; 0x40ad4
	.long	264920                          ; 0x40ad8
	.long	264924                          ; 0x40adc
	.long	268280                          ; 0x417f8
	.long	269856                          ; 0x41e20
	.long	269860                          ; 0x41e24
	.long	269888                          ; 0x41e40
	.long	269892                          ; 0x41e44
	.long	269896                          ; 0x41e48
	.long	269900                          ; 0x41e4c
	.long	269904                          ; 0x41e50
	.long	269908                          ; 0x41e54
	.long	269912                          ; 0x41e58
	.long	269916                          ; 0x41e5c
	.long	269920                          ; 0x41e60
	.long	269712                          ; 0x41d90
	.long	269940                          ; 0x41e74
	.long	269944                          ; 0x41e78
	.long	262996                          ; 0x40354
	.long	262972                          ; 0x4033c
	.long	262916                          ; 0x40304
	.long	262912                          ; 0x40300
	.long	262976                          ; 0x40340
	.long	262980                          ; 0x40344
	.long	262984                          ; 0x40348
	.long	263004                          ; 0x4035c
	.long	262928                          ; 0x40310
	.long	263036                          ; 0x4037c
	.long	263000                          ; 0x40358
	.long	263028                          ; 0x40374
	.long	263032                          ; 0x40378
	.long	263012                          ; 0x40364
	.long	263016                          ; 0x40368
	.long	263020                          ; 0x4036c
	.long	263008                          ; 0x40360
	.long	262992                          ; 0x40350
	.long	262988                          ; 0x4034c
	.long	264696                          ; 0x409f8
	.long	263044                          ; 0x40384
	.long	263048                          ; 0x40388
	.long	262960                          ; 0x40330
	.long	262964                          ; 0x40334
	.long	262968                          ; 0x40338

	.globl	_D3DPRIMITIVETOVERTEXCOUNT      ; @D3DPRIMITIVETOVERTEXCOUNT
	.weak_definition	_D3DPRIMITIVETOVERTEXCOUNT
	.p2align	2, 0x0
_D3DPRIMITIVETOVERTEXCOUNT:
	.space	8
	.long	1                               ; 0x1
	.long	0                               ; 0x0
	.long	2                               ; 0x2
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.long	1                               ; 0x1
	.long	1                               ; 0x1
	.long	1                               ; 0x1
	.long	3                               ; 0x3
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	4                               ; 0x4
	.long	0                               ; 0x0
	.long	2                               ; 0x2
	.long	2                               ; 0x2
	.space	8

.zerofill __DATA,__bss,_halo_linux_mouse_look.invert,4,2 ; @halo_linux_mouse_look.invert
	.section	__DATA,__data
	.p2align	2, 0x0                          ; @halo_linux_mouse_look.read_at
_halo_linux_mouse_look.read_at:
	.long	4294967295                      ; 0xffffffff

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"input.invert_mouse"

.zerofill __DATA,__bss,_mouse_lock,24,2 ; @mouse_lock
.zerofill __DATA,__bss,_mouse_pending_x,4,2 ; @mouse_pending_x
.zerofill __DATA,__bss,_mouse_pending_y,4,2 ; @mouse_pending_y
.zerofill __DATA,__bss,_mouse_polls_unconsumed,4,2 ; @mouse_polls_unconsumed
	.section	__DATA,__data
	.p2align	2, 0x0                          ; @vertical_sensitivity
_vertical_sensitivity:
	.long	0x3f800000                      ; float 1

.zerofill __DATA,__bss,_chat_physical_pad,16,2 ; @chat_physical_pad
.zerofill __DATA,__bss,_chat_pad,16,2   ; @chat_pad
.zerofill __DATA,__bss,_chat_wheel_steps,4,2 ; @chat_wheel_steps
.zerofill __DATA,__bss,_system_keyboard_requests,4,2 ; @system_keyboard_requests
.zerofill __DATA,__bss,_pad_used_ms,8,3 ; @pad_used_ms
.zerofill __DATA,__bss,_stick_aimed_ms,8,3 ; @stick_aimed_ms
.zerofill __DATA,__bss,_keyboard_used_ms,8,3 ; @keyboard_used_ms
.zerofill __DATA,__bss,_mouse_aimed_ms,8,3 ; @mouse_aimed_ms
.zerofill __DATA,__bss,_gyro.0,4,2      ; @gyro.0
.zerofill __DATA,__bss,_gyro.1,4,2      ; @gyro.1
.zerofill __DATA,__bss,_gyro.2,4,2      ; @gyro.2
.zerofill __DATA,__bss,_gyro.3,4,2      ; @gyro.3
	.p2align	2, 0x0                          ; @gyro.4
_gyro.4:
	.long	0x3f800000                      ; float 1

	.p2align	2, 0x0                          ; @gyro.5
_gyro.5:
	.long	0x3f800000                      ; float 1

	.p2align	2, 0x0                          ; @gyro.6
_gyro.6:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_touch_aimed_ms,8,3 ; @touch_aimed_ms
.zerofill __DATA,__bss,_halo_linux_mouse_aiming.aim_assist,4,2 ; @halo_linux_mouse_aiming.aim_assist
	.p2align	2, 0x0                          ; @halo_linux_mouse_aiming.read_at
_halo_linux_mouse_aiming.read_at:
	.long	4294967295                      ; 0xffffffff

	.section	__TEXT,__cstring,cstring_literals
l_.str.1:                               ; @.str.1
	.asciz	"input.mouse_aim_assist"

.zerofill __DATA,__bss,_text_typing_keyboard,4,2 ; @text_typing_keyboard
.zerofill __DATA,__bss,_text_typing_field,4,2 ; @text_typing_field
	.section	__DATA,__const
	.p2align	2, 0x0                          ; @named_inputs
_named_inputs:
	.long	l_.str.20
	.long	54                              ; 0x36
	.long	l_.str.21
	.long	133                             ; 0x85
	.long	l_.str.22
	.long	513                             ; 0x201
	.long	l_.str.23
	.long	515                             ; 0x203
	.long	l_.str.24
	.long	514                             ; 0x202
	.long	l_.str.25
	.long	516                             ; 0x204
	.long	l_.str.26
	.long	517                             ; 0x205
	.long	l_.str.27
	.long	520                             ; 0x208
	.long	l_.str.28
	.long	521                             ; 0x209
	.long	l_.str.29
	.long	522                             ; 0x20a
	.long	l_.str.30
	.long	523                             ; 0x20b
	.long	l_.str.31
	.long	524                             ; 0x20c
	.long	l_.str.32
	.long	525                             ; 0x20d
	.long	l_.str.33
	.long	526                             ; 0x20e
	.long	l_.str.34
	.long	532                             ; 0x214
	.long	l_.str.35
	.long	533                             ; 0x215
	.long	l_.str.36
	.long	549                             ; 0x225
	.long	l_.str.37
	.long	550                             ; 0x226
	.long	l_.str.38
	.long	530                             ; 0x212
	.long	l_.str.39
	.long	531                             ; 0x213
	.long	l_.str.40
	.long	527                             ; 0x20f
	.long	l_.str.41
	.long	529                             ; 0x211
	.long	l_.str.42
	.long	534                             ; 0x216
	.long	l_.str.43
	.long	535                             ; 0x217
	.long	l_.str.44
	.long	536                             ; 0x218
	.long	l_.str.45
	.long	537                             ; 0x219

	.section	__TEXT,__cstring,cstring_literals
l_.str.2:                               ; @.str.2
	.asciz	"Mouse "

l_.str.3:                               ; @.str.3
	.asciz	"%s"

l_.str.4:                               ; @.str.4
	.asciz	"Mouse %d"

l_.str.5:                               ; @.str.5
	.space	1

.zerofill __DATA,__bss,_keyboard_actions_held,4,2 ; @keyboard_actions_held
.zerofill __DATA,__bss,_keyboard_actions_anywhere,4,2 ; @keyboard_actions_anywhere
	.section	__DATA,__data
	.p2align	2, 0x0                          ; @replay_keyboard_last
_replay_keyboard_last:
	.long	1                               ; 0x1

	.section	__TEXT,__cstring,cstring_literals
l_.str.6:                               ; @.str.6
	.asciz	","

l_.str.7:                               ; @.str.7
	.asciz	"%.*s"

l_.str.8:                               ; @.str.8
	.asciz	"-"

.zerofill __DATA,__bss,_bindings,184,2  ; @bindings
.zerofill __DATA,__bss,_test_input_holding_action,4,2 ; @test_input_holding_action
.zerofill __DATA,__bss,_test_input_holding_action_since,8,3 ; @test_input_holding_action_since
.zerofill __DATA,__bss,_test_input_pressed,4,2 ; @test_input_pressed
.zerofill __DATA,__bss,_keyboard_join_down,4,2 ; @keyboard_join_down
.zerofill __DATA,__bss,_keyboard_alone_wanted,4,2 ; @keyboard_alone_wanted
	.section	__DATA,__data
	.p2align	2, 0x0                          ; @scoreboard_picking_port
_scoreboard_picking_port:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_gamepad_capture_held,112,2 ; @gamepad_capture_held
.zerofill __DATA,__bss,_gamepad_capture,4,2 ; @gamepad_capture
.zerofill __DATA,__bss,_gamepad_capture_polled_ms,8,3 ; @gamepad_capture_polled_ms
	.comm	_XDEVICE_TYPE_GAMEPAD_TABLE,12,2 ; @XDEVICE_TYPE_GAMEPAD_TABLE
.zerofill __DATA,__bss,_reported_gamepads,4,2 ; @reported_gamepads
	.comm	_XDEVICE_TYPE_DEBUG_KEYBOARD_TABLE,12,2 ; @XDEVICE_TYPE_DEBUG_KEYBOARD_TABLE
.zerofill __DATA,__bss,_reported_keyboard,1,2 ; @reported_keyboard
.zerofill __DATA,__bss,_controllers,112,2 ; @controllers
.zerofill __DATA,__bss,_keyboard_device,28,2 ; @keyboard_device
.zerofill __DATA,__bss,_debug_cam_middle,4,2 ; @debug_cam_middle
.zerofill __DATA,__bss,_debug_cam_up,4,2 ; @debug_cam_up
.zerofill __DATA,__bss,_debug_cam_down,4,2 ; @debug_cam_down
.zerofill __DATA,__bss,_debug_cam_wheel,4,2 ; @debug_cam_wheel
.zerofill __DATA,__bss,_split_players,4,2 ; @split_players
.zerofill __DATA,__bss,_gamepad_bound_to_talk,112,2 ; @gamepad_bound_to_talk
.zerofill __DATA,__bss,_gamepad_bound_in_game,112,2 ; @gamepad_bound_in_game
.zerofill __DATA,__bss,_text_typing,4,2 ; @text_typing
	.section	__TEXT,__cstring,cstring_literals
l_.str.9:                               ; @.str.9
	.asciz	"game.overlay_menu"

	.comm	_XDEVICE_TYPE_MEMORY_UNIT_TABLE,12,2 ; @XDEVICE_TYPE_MEMORY_UNIT_TABLE
.zerofill __DATA,__bss,_mouse_sensitivity.sensitivity,4,2 ; @mouse_sensitivity.sensitivity
	.section	__DATA,__data
	.p2align	2, 0x0                          ; @mouse_sensitivity.read_at
_mouse_sensitivity.read_at:
	.long	4294967295                      ; 0xffffffff

	.section	__TEXT,__cstring,cstring_literals
l_.str.10:                              ; @.str.10
	.asciz	"input.mouse_sensitivity"

l_.str.11:                              ; @.str.11
	.asciz	"input.mouse_vertical_sensitivity"

l_.str.12:                              ; @.str.12
	.asciz	"input.gyro_aim"

l_.str.13:                              ; @.str.13
	.asciz	"true"

l_.str.14:                              ; @.str.14
	.asciz	"zoom"

l_.str.15:                              ; @.str.15
	.asciz	"input.gyro_zoom_only"

l_.str.16:                              ; @.str.16
	.asciz	"input.gyro_invert_horizontal"

l_.str.17:                              ; @.str.17
	.asciz	"input.gyro_invert_vertical"

l_.str.18:                              ; @.str.18
	.asciz	"input.gyro_sensitivity_horizontal"

l_.str.19:                              ; @.str.19
	.asciz	"input.gyro_sensitivity_vertical"

.zerofill __DATA,__bss,_text_typing_enter_armed,1,2 ; @text_typing_enter_armed
l_.str.20:                              ; @.str.20
	.asciz	"Comma"

l_.str.21:                              ; @.str.21
	.asciz	"Keypad Comma"

l_.str.22:                              ; @.str.22
	.asciz	"Mouse Left"

l_.str.23:                              ; @.str.23
	.asciz	"Mouse Right"

l_.str.24:                              ; @.str.24
	.asciz	"Mouse Middle"

l_.str.25:                              ; @.str.25
	.asciz	"Mouse 4"

l_.str.26:                              ; @.str.26
	.asciz	"Mouse 5"

l_.str.27:                              ; @.str.27
	.asciz	"Wheel"

l_.str.28:                              ; @.str.28
	.asciz	"Wheel Up"

l_.str.29:                              ; @.str.29
	.asciz	"Wheel Down"

l_.str.30:                              ; @.str.30
	.asciz	"Gamepad A"

l_.str.31:                              ; @.str.31
	.asciz	"Gamepad B"

l_.str.32:                              ; @.str.32
	.asciz	"Gamepad X"

l_.str.33:                              ; @.str.33
	.asciz	"Gamepad Y"

l_.str.34:                              ; @.str.34
	.asciz	"Gamepad LB"

l_.str.35:                              ; @.str.35
	.asciz	"Gamepad RB"

l_.str.36:                              ; @.str.36
	.asciz	"Gamepad LT"

l_.str.37:                              ; @.str.37
	.asciz	"Gamepad RT"

l_.str.38:                              ; @.str.38
	.asciz	"Gamepad L3"

l_.str.39:                              ; @.str.39
	.asciz	"Gamepad R3"

l_.str.40:                              ; @.str.40
	.asciz	"Gamepad Back"

l_.str.41:                              ; @.str.41
	.asciz	"Gamepad Start"

l_.str.42:                              ; @.str.42
	.asciz	"Gamepad DPad Up"

l_.str.43:                              ; @.str.43
	.asciz	"Gamepad DPad Down"

l_.str.44:                              ; @.str.44
	.asciz	"Gamepad DPad Left"

l_.str.45:                              ; @.str.45
	.asciz	"Gamepad DPad Right"

	.section	__DATA,__data
	.p2align	2, 0x0                          ; @bindings_read_at
_bindings_read_at:
	.long	4294967295                      ; 0xffffffff

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @binding_settings
_binding_settings:
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

	.section	__TEXT,__cstring,cstring_literals
l_.str.46:                              ; @.str.46
	.asciz	"controls: %s has no key or button named \"%s\""

l_.str.47:                              ; @.str.47
	.asciz	"controls.move_forward"

l_.str.48:                              ; @.str.48
	.asciz	"controls.move_backward"

l_.str.49:                              ; @.str.49
	.asciz	"controls.strafe_left"

l_.str.50:                              ; @.str.50
	.asciz	"controls.strafe_right"

l_.str.51:                              ; @.str.51
	.asciz	"controls.jump"

l_.str.52:                              ; @.str.52
	.asciz	"controls.crouch"

l_.str.53:                              ; @.str.53
	.asciz	"controls.fire"

l_.str.54:                              ; @.str.54
	.asciz	"controls.throw_grenade"

l_.str.55:                              ; @.str.55
	.asciz	"controls.melee"

l_.str.56:                              ; @.str.56
	.asciz	"controls.reload"

l_.str.57:                              ; @.str.57
	.asciz	"controls.zoom"

l_.str.58:                              ; @.str.58
	.asciz	"controls.switch_weapon"

l_.str.59:                              ; @.str.59
	.asciz	"controls.switch_grenade"

l_.str.60:                              ; @.str.60
	.asciz	"controls.action"

l_.str.61:                              ; @.str.61
	.asciz	"controls.flashlight"

l_.str.62:                              ; @.str.62
	.asciz	"controls.scoreboard"

l_.str.63:                              ; @.str.63
	.asciz	"controls.pause"

l_.str.64:                              ; @.str.64
	.asciz	"controls.screenshot"

l_.str.65:                              ; @.str.65
	.asciz	"controls.push_to_talk"

l_.str.66:                              ; @.str.66
	.asciz	"controls.chat"

l_.str.67:                              ; @.str.67
	.asciz	"controls.team_chat"

l_.str.68:                              ; @.str.68
	.asciz	"controls.vote_yes"

l_.str.69:                              ; @.str.69
	.asciz	"controls.vote_no"

.zerofill __DATA,__bss,_wheel_press_until_ms,8,3 ; @wheel_press_until_ms
.zerofill __DATA,__bss,_wheel_direction,4,2 ; @wheel_direction
.zerofill __DATA,__bss,_lone_gamepad_split,4,2 ; @lone_gamepad_split
.zerofill __DATA,__bss,_keyboard_alone,4,2 ; @keyboard_alone
l_.str.70:                              ; @.str.70
	.asciz	"gamepads: SDL lists %d"

l_.str.71:                              ; @.str.71
	.asciz	"gamepads: SDL gamepad %u is not open"

l_.str.72:                              ; @.str.72
	.asciz	"gamepads: port %d reads SDL gamepad %u (type %d)"

l_.str.73:                              ; @.str.73
	.asciz	"gamepads: SDL gamepad %u has no port"

.zerofill __DATA,__bss,_mouse_wheel_accumulated,4,2 ; @mouse_wheel_accumulated
.zerofill __DATA,__bss,_wheel_moved_ms,8,3 ; @wheel_moved_ms
.zerofill __DATA,__bss,_wheel_scrolling,1,2 ; @wheel_scrolling
.zerofill __DATA,__bss,_keys_held_over_switch.held,512,0 ; @keys_held_over_switch.held
	.section	__DATA,__data
	.p2align	2, 0x0                          ; @keys_held_over_switch.context
_keys_held_over_switch.context:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_face_buttons_held_over_swap.swapped,1,2 ; @face_buttons_held_over_swap.swapped
.zerofill __DATA,__bss,_keyboard_screenshot.was_down,4,2 ; @keyboard_screenshot.was_down
.zerofill __DATA,__bss,_test_input_gamepad.checked,1,2 ; @test_input_gamepad.checked
	.p2align	2, 0x0                          ; @test_input_gamepad.seed
_test_input_gamepad.seed:
	.long	4294967295                      ; 0xffffffff

.zerofill __DATA,__bss,_test_input_gamepad.looking,1,2 ; @test_input_gamepad.looking
	.section	__TEXT,__cstring,cstring_literals
l_.str.74:                              ; @.str.74
	.asciz	"debug.test_input"

l_.str.75:                              ; @.str.75
	.asciz	"menu:"

.zerofill __DATA,__bss,_test_input_menu,512,0 ; @test_input_menu
.zerofill __DATA,__bss,_test_input_menu_since,8,3 ; @test_input_menu_since
l_.str.76:                              ; @.str.76
	.asciz	"bot:"

l_.str.77:                              ; @.str.77
	.asciz	"bot"

l_.str.78:                              ; @.str.78
	.asciz	"look:"

	.section	__DATA,__const
	.p2align	2, 0x0                          ; @test_input_menu_gamepad.buttons
_test_input_menu_gamepad.buttons:
	.long	l_.str.79
	.long	0                               ; 0x0
	.short	0                               ; 0x0
	.space	2
	.long	l_.str.80
	.long	1                               ; 0x1
	.short	0                               ; 0x0
	.space	2
	.long	l_.str.81
	.long	2                               ; 0x2
	.short	0                               ; 0x0
	.space	2
	.long	l_.str.82
	.long	3                               ; 0x3
	.short	0                               ; 0x0
	.space	2
	.long	l_.str.83
	.long	4294967295                      ; 0xffffffff
	.short	1                               ; 0x1
	.space	2
	.long	l_.str.84
	.long	4294967295                      ; 0xffffffff
	.short	2                               ; 0x2
	.space	2
	.long	l_.str.85
	.long	4294967295                      ; 0xffffffff
	.short	4                               ; 0x4
	.space	2
	.long	l_.str.86
	.long	4294967295                      ; 0xffffffff
	.short	8                               ; 0x8
	.space	2
	.long	l_.str.87
	.long	4294967295                      ; 0xffffffff
	.short	16                              ; 0x10
	.space	2
	.long	l_.str.88
	.long	4294967295                      ; 0xffffffff
	.short	32                              ; 0x20
	.space	2

	.section	__TEXT,__cstring,cstring_literals
l_.str.79:                              ; @.str.79
	.asciz	"a"

l_.str.80:                              ; @.str.80
	.asciz	"b"

l_.str.81:                              ; @.str.81
	.asciz	"x"

l_.str.82:                              ; @.str.82
	.asciz	"y"

l_.str.83:                              ; @.str.83
	.asciz	"up"

l_.str.84:                              ; @.str.84
	.asciz	"down"

l_.str.85:                              ; @.str.85
	.asciz	"left"

l_.str.86:                              ; @.str.86
	.asciz	"right"

l_.str.87:                              ; @.str.87
	.asciz	"start"

l_.str.88:                              ; @.str.88
	.asciz	"back"

l_.str.89:                              ; @.str.89
	.asciz	" ,"

.zerofill __DATA,__bss,_overlay_held_buttons,8,1 ; @overlay_held_buttons
.zerofill __DATA,__bss,_overlay_held_analog,4,0 ; @overlay_held_analog
.zerofill __DATA,__bss,_system_keyboard_update.shown,4,2 ; @system_keyboard_update.shown
.zerofill __DATA,__bss,_system_keyboard_update.requests_handled,4,2 ; @system_keyboard_update.requests_handled
.zerofill __DATA,__bss,_chat_held_buttons,8,1 ; @chat_held_buttons
.zerofill __DATA,__bss,_chat_held_analog,4,0 ; @chat_held_analog
.zerofill __DATA,__bss,_vote_held_buttons,2,1 ; @vote_held_buttons
	.cg_profile _XInitDevices, _platform_sdl_initialize, 11
.subsections_via_symbols
