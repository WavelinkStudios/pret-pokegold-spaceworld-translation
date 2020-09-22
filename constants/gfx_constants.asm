TILE_WIDTH EQU 8 ; pixels
LEN_1BPP_TILE EQU 1 * TILE_WIDTH ; bytes
LEN_2BPP_TILE EQU 2 * TILE_WIDTH ; bytes

NUM_PAL_COLORS EQU 4
PAL_COLOR_SIZE EQU 2
PALETTE_SIZE EQU NUM_PAL_COLORS * PAL_COLOR_SIZE

PALRGB_WHITE EQUS "palred 31 + palgreen 31 + palblue 31" ; $7fff

SCREEN_WIDTH  EQU 20 ; tiles
SCREEN_HEIGHT EQU 18 ; tiles
SCREEN_WIDTH_PX  EQU SCREEN_WIDTH  * TILE_WIDTH ; pixels
SCREEN_HEIGHT_PX EQU SCREEN_HEIGHT * TILE_WIDTH ; pixels

BG_MAP_WIDTH  EQU 32 ; tiles
BG_MAP_HEIGHT EQU 32 ; tiles

METATILE_WIDTH EQU 4 ; tiles
SCREEN_META_WIDTH EQU 6 ; metatiles
SCREEN_META_HEIGHT EQU 5 ; metatiles
SURROUNDING_WIDTH  EQU SCREEN_META_WIDTH * METATILE_WIDTH ; tiles
SURROUNDING_HEIGHT EQU SCREEN_META_HEIGHT * METATILE_WIDTH ; tiles

HP_BAR_LENGTH  EQU 6 ; tiles
EXP_BAR_LENGTH EQU 8 ; tiles
HP_BAR_LENGTH_PX  EQU HP_BAR_LENGTH  * TILE_WIDTH ; pixels
EXP_BAR_LENGTH_PX EQU EXP_BAR_LENGTH * TILE_WIDTH ; pixels

; GetHPPal return values (see home.asm)
HP_GREEN  EQU 0
HP_YELLOW EQU 1
HP_RED    EQU 2

SPRITEBUFFERSIZE EQU 7 * 7 * 8 ; 7 * 7 (tiles) * 8 (bytes per tile)
DOUBLESPRITEBUFFERSIZE EQU 2 * SPRITEBUFFERSIZE

; sprite_oam_struct members (see macros/wram.asm)
	const_def
	const SPRITEOAMSTRUCT_YCOORD     ; 0
	const SPRITEOAMSTRUCT_XCOORD     ; 1
	const SPRITEOAMSTRUCT_TILE_ID    ; 2
	const SPRITEOAMSTRUCT_ATTRIBUTES ; 3
SPRITEOAMSTRUCT_LENGTH EQU const_value
NUM_SPRITE_OAM_STRUCTS EQU 40 ; see wVirtualOAM
