        org 	100h

	section	.text

	mov	AX, 65
	mov	CX, 65
	mov	DX, 67
        mov     DI, 65
        mov     BX, 201h

	mov	[200h], AX
        mov	[201h], CX
        mov	[202h], DX
        mov	[203h], DI

	mov	CX, [BX]
	mov	[BX + DI], DX
        mov     DI, [DI + 103h]


	int	20h

