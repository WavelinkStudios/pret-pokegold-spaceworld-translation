include "constants.asm"

if DEBUG
SECTION "Scrolling Menu", ROM0 [$3810]
else
SECTION "Scrolling Menu", ROM0 [$37D4]
endc

Function3810::
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	ld h, d
	ld l, e
	call CopyMenuHeader
	pop hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [de]
	ld [wMenuCursorBuffer], a
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [de]
	ld [wMenuScrollPosition], a
	push de
	call ScrollingMenu
	pop de
	ld a, [wMenuScrollPosition]
	ld [de], a
	pop de
	ld a, [wMenuCursorY]
	ld [de], a
	ld a, [wMenuJoypad]
	ret

ScrollingMenu:: ; 00:383e
	call CopyMenuData
	ldh a, [hROMBank]
	push af

	ld a, BANK(_InitScrollingMenu) ; and BANK(_ScrollingMenu)
	call Bankswitch

	call _InitScrollingMenu
	call SetPalettes
	call _ScrollingMenu

	pop af
	call Bankswitch

	ld a, [wMenuJoypad]
	ret

Function385a::
	push hl
	jr asm_3865

Function385d::
	callab Function_8f1cb
asm_3865: ; 00:3865
	pop hl
	call MenuTextBox
	ld c, $0
	call Function3872
	call CloseWindow
	ret

Function3872:: ; 00:3872
	push bc
	jr asm_387d

Function3875::
	callab Function8cd0c
asm_387d: ; 00:387d
	pop bc
	call GetJoypad
	ldh a, [hJoyDown]
	and A_BUTTON | B_BUTTON
	jr nz, .asm_388e
	ld a, c
	and a
	jr z, Function3872
	dec c
	jr z, Function3872
.asm_388e: ; 00:388e
	ret