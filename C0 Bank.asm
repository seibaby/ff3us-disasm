C0/0000:	207968  	JSR $6879
C0/0003:	6B      	RTL

C0/0004:	0300    	

C0/0006:	08      	 

C0/0007:	08      	
 
C0/0008:	4C76C1  	JMP $C176

C0/000B:	4C3F4A  	JMP $4A3F

C0/000E:	EA      	NOP
C0/000F:	EA      	NOP
C0/0010:	EA      	NOP
C0/0011:	EA      	NOP
C0/0012:	EA      	NOP
C0/0013:	EA      	NOP
C0/0014:	EA      	NOP

C0/0015:	2024BB  	JSR $BB24      (from C1/0BA2, C1/102A, C3/13B1)
C0/0018:	6B      	RTL

C0/0019:	78      	SEI            (from C0/FF03, this is pretty much the entry point)
C0/001A:	18      	CLC
C0/001B:	FB      	XCE            (now in native mode...still)
C0/001C:	E220    	SEP #$20       (8 bit accum./memory)
C0/001E:	C210    	REP #$10       (16 bit index registers)
C0/0020:	A2FF15  	LDX #$15FF
C0/0023:	9A      	TXS            (make the stack point to $15FF)
C0/0024:	A20000  	LDX #$0000
C0/0027:	DA      	PHX
C0/0028:	2B      	PLD            (make the direct page reg. hold #$0000)
C0/0029:	7B      	TDC            (A = #$0000)
C0/002A:	48      	PHA
C0/002B:	AB      	PLB            (make the data bank reg. hold #$00)
C0/002C:	A901    	LDA #$01       (INC A!)
C0/002E:	8D0D42  	STA $420D      (Disable SlowROM???)
C0/0031:	9C0B42  	STZ $420B      (turn off DMA)
C0/0034:	9C0C42  	STZ $420C      (turn off HDMA)
C0/0037:	A98F    	LDA #$8F
C0/0039:	8D0021  	STA $2100
C0/003C:	9C0042  	STZ $4200      (turn off NMI, auto joypad read, etc)
C0/003F:	202505  	JSR $0525
C0/0042:	A20000  	LDX #$0000
C0/0045:	8600    	STX $00        ($00 and $01 will always hold #$0000 from here on out)
C0/0047:	A2FFFF  	LDX #$FFFF     (DEX?)
C0/004A:	8602    	STX $02        ($02 and $03 will hold #$FFFF for a while, this can be overwritten at some point)
C0/004C:	207305  	JSR $0573      (set NMI and IRQ locations)
C0/004F:	220000C5	JSL $C50000    (load the core music engine into the SPC chip)
C0/0053:	220600C3	JSL $C30006    (reset timers for input decoding)
C0/0057:	AF0600C0	LDA $C00006    (LDA #$08?!)
C0/005B:	8DC01F  	STA $1FC0      (Stores #08 to $1FC0)
C0/005E:	AF0700C0	LDA $C00007    (LDA #$08?!)
C0/0062:	8DC11F  	STA $1FC1      (Stores #08 to $1FC1)
C0/0065:	C220    	REP #$20       (16 bit accum./memory)
C0/0067:	AF0400C0	LDA $C00004    (LDA #$0003?!)
C0/006B:	8D641F  	STA $1F64      (Stores #0003 to $1F64, the current map, Darkness)
C0/006E:	7B      	TDC            (A = #$0000)
C0/006F:	E220    	SEP #$20       (8 bit accum./memory)
C0/0071:	9C5A11  	STZ $115A      (could do STZ $1159 and then SEP #$20...)
C0/0074:	9C5911  	STZ $1159      (optionally, you could've done STA $1159 before the SEP #$20)
C0/0077:	A940    	LDA #$40
C0/0079:	8DFA11  	STA $11FA
C0/007C:	208DBD  	JSR $BD8D

C0/007F:	644A    	STZ $4A        (from C0/00A1, C0/010A, C0/0116, C0/017F, C0/C65C, C0/C6B0)
C0/0081:	A901    	LDA #$01
C0/0083:	8584    	STA $84

C0/0085:	A54A    	LDA $4A
C0/0087:	D021    	BNE $00AA
C0/0089:	A584    	LDA $84
C0/008B:	F01D    	BEQ $00AA
C0/008D:	C220    	REP #$20       (16 bit accum./memory)
C0/008F:	AD641F  	LDA $1F64      (load current map)
C0/0092:	29FF03  	AND #$03FF     (we only care about the actual map number)
C0/0095:	AA      	TAX
C0/0096:	7B      	TDC            (A = #$0000)
C0/0097:	E220    	SEP #$20       (8 bit accum./memory)
C0/0099:	E00300  	CPX #$0003     (compare current map to Darkness)
C0/009C:	B006    	BCS $00A4      (if it's equal or higher, ie not a world map, branch)
C0/009E:	209703  	JSR $0397
C0/00A1:	4C7F00  	JMP $007F      (BRA would work)

C0/00A4:	20BCBE  	JSR $BEBC
C0/00A7:	208603  	JSR $0386

C0/00AA:	206405  	JSR $0564      ; wait until after next NMI
C0/00AD:	20A00E  	JSR $0EA0
C0/00B0:	20748D  	JSR $8D74
C0/00B3:	AC0308  	LDY $0803
C0/00B6:	C220    	REP #$20       (16 bit accum./memory)
C0/00B8:	B96D08  	LDA $086D,Y
C0/00BB:	4A      	LSR A
C0/00BC:	4A      	LSR A
C0/00BD:	4A      	LSR A
C0/00BE:	4A      	LSR A
C0/00BF:	E220    	SEP #$20       (8 bit accum./memory)
C0/00C1:	85B0    	STA $B0
C0/00C3:	C220    	REP #$20       (16 bit accum./memory)
C0/00C5:	B96A08  	LDA $086A,Y
C0/00C8:	4A      	LSR A
C0/00C9:	4A      	LSR A
C0/00CA:	4A      	LSR A
C0/00CB:	4A      	LSR A
C0/00CC:	E220    	SEP #$20       (8 bit accum./memory)
C0/00CE:	85AF    	STA $AF
C0/00D0:	7B      	TDC            (A = #$0000)
C0/00D1:	20F1BB  	JSR $BBF1
C0/00D4:	206FBC  	JSR $BC6F
C0/00D7:	20CCBB  	JSR $BBCC
C0/00DA:	205A9A  	JSR $9A5A      (This takes you to General Actions)
C0/00DD:	A54A    	LDA $4A
C0/00DF:	D004    	BNE $00E5
C0/00E1:	A584    	LDA $84
C0/00E3:	D0A0    	BNE $0085

C0/00E5:	20A318  	JSR $18A3
C0/00E8:	A54A    	LDA $4A
C0/00EA:	D004    	BNE $00F0
C0/00EC:	A584    	LDA $84
C0/00EE:	D095    	BNE $0085

C0/00F0:	202DC3  	JSR $C32D      (encounters and junk)
C0/00F3:	ADF111  	LDA $11F1
C0/00F6:	F015    	BEQ $010D
C0/00F8:	9CF111  	STZ $11F1
C0/00FB:	A20000  	LDX #$0000     (LDX $00 would work...)
C0/00FE:	86E5    	STX $E5
C0/0100:	A9CA    	LDA #$CA
C0/0102:	85E7    	STA $E7        (event queue starts at CA/0000)
C0/0104:	20B3C4  	JSR $C4B3
C0/0107:	2020BD  	JSR $BD20
C0/010A:	4C7F00  	JMP $007F

C0/010D:	A556    	LDA $56          (from C0/00F6)
C0/010F:	F008    	BEQ $0119
C0/0111:	6456    	STZ $56
C0/0113:	203EC1  	JSR $C13E
C0/0116:	4C7F00  	JMP $007F

C0/0119:	204C81  	JSR $814C
C0/011C:	208130  	JSR $3081
C0/011F:	207875  	JSR $7578
C0/0122:	20D02B  	JSR $2BD0
C0/0125:	203C57  	JSR $573C
C0/0128:	20081F  	JSR $1F08
C0/012B:	20C21F  	JSR $1FC2
C0/012E:	208120  	JSR $2081
C0/0131:	200221  	JSR $2102
C0/0134:	202D5A  	JSR $5A2D
C0/0137:	2095CC  	JSR $CC95
C0/013A:	20266D  	JSR $6D26
C0/013D:	20AC73  	JSR $73AC     ; handle collisions
C0/0140:	20AF06  	JSR $06AF     ; handle flashlight
C0/0143:	202308  	JSR $0823     ; handle pyramid?
C0/0146:	20BD0B  	JSR $0BBD     ; handle spotlights
C0/0149:	20046A  	JSR $6A04     ; handle field timer
C0/014C:	A546    	LDA $46       ; VBlank counter
C0/014E:	D003    	BNE $0153     ; branch if not zero
C0/0150:	9C3206  	STZ $0632     ; zero max vertical scanline [?]
C0/0153:	AD3721  	LDA $2137     ; advance H/V counter register [?]
C0/0156:	AD3C21  	LDA $213C
C0/0159:	8D3006  	STA $0630     ; set horizontal scanline [?]
C0/015C:	AD3C21  	LDA $213C     ; <---- also useless
C0/015F:	AD3D21  	LDA $213D
C0/0162:	8D3106  	STA $0631     ; set vertical scanline [?]
C0/0165:	AD3D21  	LDA $213D     ; advance V-counter register [?]
C0/0168:	AD3106  	LDA $0631
C0/016B:	CD3206  	CMP $0632
C0/016E:	9003    	BCC $0173
C0/0170:	8D3206  	STA $0632     ; enforce max scanline position [?]
C0/0173:	20D4C5  	JSR $C5D4     ; handle pushing X
C0/0176:	4C2BC6  	JMP $C62B

C0/0179:	4C8500  	JMP $0085

C0/017C:	207403  	JSR $0374
C0/017F:	4C7F00  	JMP $007F

NMI stuff
C0/0182:	08      	PHP           ; NMI already pushes the processor...
C0/0183:	C230    	REP #$30      ; 16-bit A, X/Y
C0/0185:	48      	PHA           ; save A
C0/0186:	DA      	PHX           ; save X
C0/0187:	5A      	PHY           ; save Y
C0/0188:	8B      	PHB           ; save Bank
C0/0189:	0B      	PHD           ; save Direct Page
C0/018A:	C210    	REP #$10      ; 16-bit X/Y (redundant)
C0/018C:	E220    	SEP #$20      ; 8-bit A
C0/018E:	A20000  	LDX #$0000    ; new Direct Page
C0/0191:	DA      	PHX           ; push to stack
C0/0192:	2B      	PLD           ; pull Direct Page
C0/0193:	7B      	TDC           ; new Bank
C0/0194:	48      	PHA           ; push to stack
C0/0195:	AB      	PLB           ; pull Bank
C0/0196:	AD1042  	LDA $4210     ; clear "NMI" flag
C0/0199:	9C0B42  	STZ $420B     ; disable all DMA channels
C0/019C:	9C0C42  	STZ $420C     ; disable all HDMA channels
C0/019F:	A9A1    	LDA #$A1      ; "Enable NMI","Enable IRQ","Enable Joypad"
C0/01A1:	8D0042  	STA $4200     ; set interrupt flags
C0/01A4:	205F0F  	JSR $0F5F     ; adjust screen brightness
C0/01A7:	200110  	JSR $1001     ; transfer color palettes over HDMA
C0/01AA:	20BF0F  	JSR $0FBF     ; transfer OAM data over HDMA
C0/01AD:	20371E  	JSR $1E37     ; handle pending BG updates

C0/01B0:	AD8605  	LDA $0586     ; BG1 horizontal scroll status
C0/01B3:	C902    	CMP #$02      ; "Update in VRAM"
C0/01B5:	D006    	BNE $01BD     ; branch to check BG2 horizontal if not ^
C0/01B7:	20782A  	JSR $2A78     ; update BG1 horizontal scroll [?]
C0/01BA:	9C8605  	STZ $0586     ; clear "BG1 horizontal scroll update"

C0/01BD:	AD8805  	LDA $0588     ; BG2 horizontal scroll status
C0/01C0:	C902    	CMP #$02      ; "Update in VRAM"
C0/01C2:	D008    	BNE $01CC     ; branch to check BG1 vertical if not ^
C0/01C4:	20FB2A  	JSR $2AFB     ; update BG2 horizontal scroll [?]
C0/01C7:	9C8805  	STZ $0588     ; clear "BG2 horizontal scroll update"
C0/01CA:	801C    	BRA $01E8     ; branch to skip vertical updates [?]

C0/01CC:	AD8505  	LDA $0585     ; BG1 vertical scroll status
C0/01CF:	C902    	CMP #$02      ; "Update in VRAM"
C0/01D1:	D006    	BNE $01D9     ; branch to check BG2 vertical if not ^
C0/01D3:	20472A  	JSR $2A47     ; update BG1 vertical scroll [?]
C0/01D6:	9C8505  	STZ $0585     ; clear "BG1 vertical scroll update"

C0/01D9:	AD8705  	LDA $0587     ; BG2 vertical scroll status
C0/01DC:	C902    	CMP #$02      ; "Update in VRAM"
C0/01DE:	D008    	BNE $01E8     ; branch to check BG3 horizontal if not ^
C0/01E0:	20CA2A  	JSR $2ACA     ; update BG2 vertical scroll [?]
C0/01E3:	9C8705  	STZ $0587     ; clear "BG2 vertical scroll update"
C0/01E6:	80E4    	BRA $01CC     ; branch back to BG1 vertical check

C0/01E8:	AD8A05  	LDA $058A     ; BG3 horizontal scroll status
C0/01EB:	C902    	CMP #$02      ; "Update in VRAM"
C0/01ED:	D008    	BNE $01F7     ; branch to check BG3 vertical if not ^
C0/01EF:	207E2B  	JSR $2B7E     ; update BG3 horizontal scroll [?]
C0/01F2:	9C8A05  	STZ $058A     ; clear "BG3 horizontal scroll update"
C0/01F5:	800D    	BRA $0204     ; branch to skip BG3 vertical update [?]

C0/01F7:	AD8905  	LDA $0589     ; BG3 vertical scroll status
C0/01FA:	C902    	CMP #$02      ; "Update in VRAM"
C0/01FC:	D006    	BNE $0204     ; branch if not ^
C0/01FE:	204D2B  	JSR $2B4D     ; update BG3 vertical scroll [?]
C0/0201:	9C8905  	STZ $0589     ; clear "BG3 vertical scroll update"

C0/0204:	207B67  	JSR $677B     ; handle object animations [?]
C0/0207:	203E88  	JSR $883E     ; handle dialogue window updates [?]
C0/020A:	200386  	JSR $8603     ; handle text graphics updates [?]
C0/020D:	20B085  	JSR $85B0     ; handle dialoque window clearing [?]
C0/0210:	A9E0    	LDA #$E0      ; some color
C0/0212:	8D3221  	STA $2132     ; set Fixed Color Data
C0/0215:	9C0B42  	STZ $420B     ; disable DMA all channels
C0/0218:	A943    	LDA #$43      ; two registers write twice each
C0/021A:	8D0043  	STA $4300     ; set HDMI write mode
C0/021D:	A90F    	LDA #$0F      ; destination register $210F
C0/021F:	8D0143  	STA $4301     ; set destination (BG Scroll)
C0/0222:	A2517C  	LDX #$7C51    ; source $7E7C51
C0/0225:	8E0243  	STX $4302     ; set source address
C0/0228:	A97E    	LDA #$7E      ; source $7E7C51
C0/022A:	8D0443  	STA $4304     ; set source bank
C0/022D:	8D0743  	STA $4307     ; set HDMA indirect address register [?]
C0/0230:	AD2105  	LDA $0521     ; field BG flags
C0/0233:	2908    	AND #$08      ; "Wavy BG2"
C0/0235:	4A      	LSR A
C0/0236:	4A      	LSR A
C0/0237:	4A      	LSR A         ; /8
C0/0238:	09FE    	ORA #$FE      ; 0xFF if Wavy BG2, 0xFE if not
C0/023A:	8D0C42  	STA $420C     ; enable all HDMA channels (except maybe 1)
C0/023D:	20B642  	JSR $42B6     ; handle background scroll [??]
C0/0240:	205310  	JSR $1053     ; handle screen colors [?]
C0/0243:	20370E  	JSR $0E37     ; handle screen mosaic [?]
C0/0246:	209B3B  	JSR $3B9B     ; [?]
C0/0249:	203C06  	JSR $063C     ; handle flashlight/pyramid [?]
C0/024C:	206D05  	JSR $056D     ; decode joypads for field [?]
C0/024F:	220C00C3	JSL $C3000C   ; adjust game-time
C0/0253:	E646    	INC $46       ; increment frame counter
C0/0255:	E645    	INC $45       ; increment alternate frame counter
C0/0257:	E655    	INC $55       ; set "NMI Just Ran"
C0/0259:	C230    	REP #$30      ; 16-bit A, X/Y
C0/025B:	2B      	PLD           ; restore Direct Page
C0/025C:	AB      	PLB           ; restore Bank
C0/025D:	7A      	PLY           ; restore Y
C0/025E:	FA      	PLX           ; restore X
C0/025F:	68      	PLA           ; restore A
C0/0260:	28      	PLP           ; restore flags
C0/0261:	40      	RTI           ; return from NMI
 
IRQ stuff
C0/0262:	08      	PHP           ; store flags
C0/0263:	C230    	REP #$30      ; 16-bit A, X/Y
C0/0265:	48      	PHA           ; store A
C0/0266:	DA      	PHX           ; store X
C0/0267:	5A      	PHY           ; store Y
C0/0268:	8B      	PHB           ; store Bank
C0/0269:	0B      	PHD           ; store Direct Page
C0/026A:	C210    	REP #$10      ; 16-bit X/Y
C0/026C:	E220    	SEP #$20      ; 8-bit A
C0/026E:	A20000  	LDX #$0000    ; zero
C0/0271:	DA      	PHX           ; push to stack
C0/0272:	2B      	PLD           ; new direct page
C0/0273:	7B      	TDC           ; zero
C0/0274:	48      	PHA           ; push to stack
C0/0275:	AB      	PLB           ; new data bank
C0/0276:	AD1142  	LDA $4211     ; read IRQ triggered flag
C0/0279:	1015    	BPL $0290     ; exit if no IRQ (how?)
C0/027B:	A981    	LDA #$81      ; enable NMI, joypad read
C0/027D:	8D0042  	STA $4200     ; update interrupt flags
C0/0280:	9C0C42  	STZ $420C     ; disable all HDMA channels
C0/0283:	A545    	LDA $45       ; NMI frame counter
C0/0285:	4A      	LSR A         ; /2
C0/0286:	B005    	BCS $028D     ; branch every other frame
C0/0288:	203F90  	JSR $903F     ; BG animation [?], maybe force blank [?]
C0/028B:	8003    	BRA $0290
C0/028D:	207891  	JSR $9178     ; transfer background animation frame
C0/0290:	C230    	REP #$30
C0/0292:	2B      	PLD 
C0/0293:	AB      	PLB
C0/0294:	7A      	PLY
C0/0295:	FA      	PLX
C0/0296:	68      	PLA
C0/0297:	28      	PLP            (pull what was pointlessly pushed)
C0/0298:	40      	RTI
 
Calculate the checksum of the entire game, and if it's ok don't crap out the game.
Do note that this routine is never called...
C0/0299:	A20000  	LDX #$0000     (LDX $00 would work)
C0/029C:	861E    	STX $1E
C0/029E:	862A    	STX $2A
C0/02A0:	A9C0    	LDA #$C0
C0/02A2:	852C    	STA $2C
C0/02A4:	A00000  	LDY #$0000     (LDY $00 would work)
C0/02A7:	B72A    	LDA [$2A],Y
C0/02A9:	18      	CLC
C0/02AA:	651E    	ADC $1E
C0/02AC:	851E    	STA $1E
C0/02AE:	7B      	TDC 
C0/02AF:	651F    	ADC $1F
C0/02B1:	851F    	STA $1F
C0/02B3:	C8      	INY 
C0/02B4:	D0F1    	BNE $02A7
C0/02B6:	A52C    	LDA $2C
C0/02B8:	1A      	INC A
C0/02B9:	852C    	STA $2C        (INC $2C then LDA $2C would work...)
C0/02BB:	C9F0    	CMP #$F0       (have we hit bank F0 yet? this signifies no more ROM to read)
C0/02BD:	D0E5    	BNE $02A4      (branch if not)
C0/02BF:	AFDFFFC0	LDA $C0FFDF
C0/02C3:	C51F    	CMP $1F
C0/02C5:	D009    	BNE $02D0
C0/02C7:	AFDEFFC0	LDA $C0FFDE
C0/02CB:	C51E    	CMP $1E
C0/02CD:	D001    	BNE $02D0
C0/02CF:	60      	RTS
 
C0/02D0:	4CD002  	JMP $02D0      (jump to itself, hence an infinite loop)

; Play a sound effect [?]
C0/02D3:	8D0113  	STA $1301      (from C0/4D02, C0/4D08, C0/4DFE, C0/B856, C0/C0F8)
C0/02D6:	A918    	LDA #$18
C0/02D8:	8D0013    	STA $1300
C0/02DB:	A980    	LDA #$80
C0/02DD:	8D0213    	LDA $1302
C0/02E0:	220400C5	JSL $C50004    (play a song)
C0/02E4:	60      	RTS
 
C0/02E5:	DA      	PHX			(from only C0/4C78)
C0/02E6:	5A      	PHY
C0/02E7:	A600    	LDX $00
C0/02E9:	A00000  	LDY #$0000     (LDY $00...)
C0/02EC:	6425    	STZ $25
C0/02EE:	C220    	REP #$20      (16 bit accum./memory)
C0/02F0:	A522    	LDA $22
C0/02F2:	38      	SEC 
C0/02F3:	FF2E03C0	SBC $C0032E,X
C0/02F7:	8522    	STA $22
C0/02F9:	A524    	LDA $24
C0/02FB:	FF3E03C0	SBC $C0033E,X
C0/02FF:	8524    	STA $24
C0/0301:	9004    	BCC $0307      (branch only if the result wrapped)
C0/0303:	C8      	INY 
C0/0304:	4CEE02  	JMP $02EE      (no BRA?)

C0/0307:	A522    	LDA $22
C0/0309:	18      	CLC
C0/030A:	7F2E03C0	ADC $C0032E,X
C0/030E:	8522    	STA $22
C0/0310:	A524    	LDA $24
C0/0312:	7F3E03C0	ADC $C0033E,X
C0/0316:	8524    	STA $24
C0/0318:	7B      	TDC 
C0/0319:	E220    	SEP #$20      (8 bit accum./memory)
C0/031B:	DA      	PHX
C0/031C:	8A      	TXA
C0/031D:	4A      	LSR A
C0/031E:	AA      	TAX
C0/031F:	98      	TYA
C0/0320:	9D5407  	STA $0754,X
C0/0323:	FA      	PLX
C0/0324:	E8      	INX
C0/0325:	E8      	INX
C0/0326:	E01000  	CPX #$0010
C0/0329:	D0BE    	BNE $02E9
C0/032B:	7A      	PLY
C0/032C:	FA      	PLX
C0/032D:	60      	RTS

Data, loaded from above, 2 bytes wide
C0/032E:	8096    	
C0/0330:	4042      	
C0/0332:	A086    	
C0/0334:	1027    	
C0/0336:	E803    	
C0/0338:	6400    	
C0/033A:	0A00    	
C0/033C:	0100 
   	
C0/033E:	9800    	
C0/0340:	0F00    	
C0/0342:	0100    	
C0/0344:	0000    	
C0/0346:	0000    	
C0/0348:	0000    	
C0/034A:	0000    	
C0/034C:	0000    	

C0/034E:	ADB91E    LDA $1EB9      ; various event bits for overrides, etc
C0/0351:	2910    	AND #10        ; "allow changing music"
C0/0353:	D00A    	BNE $035F      ; branch if not ^
C0/0355:	AD3C05  	LDA $053C      ; else, get song ID for current map
C0/0358:	F019    	BEQ $0373      ; exit if none ^
C0/035A:	8D801F  	STA $1F80      ; set new current song
C0/035D:	8003    	BRA $0362      ; and branch (no need to branch here)
C0/035F:	AD801F  	LDA $1F80      ; get current song
C0/0362:	8D0113  	STA $1301      ; save input for C5 music/sound handling
C0/0365:	A910    	LDA #$10       ; music command "play song"
C0/0367:	8D0013  	STA $1300      ; save input for C5 music/sound handling
C0/036A:	A9FF    	LDA #$FF       ; max volume
C0/036C:	8D0213  	STA $1302      ; save input for C5 music/sound handling
C0/036F:	220400C5	JSL $C50004    ; execute music/sound handling
C0/0373:	60      	RTS
 
C0/0374:	9C0B42  	STZ $420B      (from C0/017C, C0/B969, C0/B973, C0/B995, C0/B99F, C0/B9BE, C0/B9C8, C0/B9D9, C0/B9EA, C0/B9FB, C0/BA39, C0/BA43, C0/BA54, C0/BA5E, C0/BA6C, C0/BA76, C0/BEBC, C0/C141, C0/C165, C0/C6CA, C0/C700)
C0/0377:	9C0C42  	STZ $420C      (turn off HDMA)
C0/037A:	A980    	LDA #$80
C0/037C:	8D0021  	STA $2100      ; set screen off
C0/037F:	A900    	LDA #$00
C0/0381:	8D0042  	STA $4200      ; disable NMI, other things[?]
C0/0384:	78      	SEI            ; set interrupt disabled
C0/0385:	60      	RTS
 
C0/0386:	AD1042  	LDA $4210	     ; read (and clear) NMI fired flag
C0/0389:	10FB    	BPL $0386      ; loop until NMI fired?
C0/038B:	A981    	LDA #$81
C0/038D:	8D0042  	STA $4200      ; enable NMI and Joypad
C0/0390:	A900    	LDA #$00       ; zero brightness, no force blank
C0/0392:	8D0021  	STA $2100
C0/0395:	58      	CLI 
C0/0396:	60      	RTS
 
C0/0397:	9C0502  	STZ $0205      (from only C0/009E)
C0/039A:	9C0B42  	STZ $420B      (turn off DMA)
C0/039D:	9C0C42  	STZ $420C      (turn off HDMA)
C0/03A0:	A98F    	LDA #$8F
C0/03A2:	8D0021  	STA $2100
C0/03A5:	A900    	LDA #$00
C0/03A7:	8D0042  	STA $4200      (turn off NMI, auto joypad read, etc)
C0/03AA:	A6E5    	LDX $E5
C0/03AC:	D00F    	BNE $03BD
C0/03AE:	A5E7    	LDA $E7
C0/03B0:	C9CA    	CMP #$CA
C0/03B2:	D009    	BNE $03BD
C0/03B4:	9CFD11  	STZ $11FD
C0/03B7:	9CFE11  	STZ $11FE
C0/03BA:	9CFF11  	STZ $11FF

;
C0/03BD:	200505  	JSR $0505
C0/03C0:	209170  	JSR $7091
C0/03C3:	20216F  	JSR $6F21
C0/03C6:	20886E  	JSR $6E88
C0/03C9:	AE0308  	LDX $0803
C0/03CC:	8EA61F  	STX $1FA6
C0/03CF:	AC0308  	LDY $0803
C0/03D2:	B97908  	LDA $0879,Y
C0/03D5:	8DFB11  	STA $11FB
C0/03D8:	8C0442  	STY $4204
C0/03DB:	A929    	LDA #$29
C0/03DD:	8D0642  	STA $4206      (to be divided by 41)
C0/03E0:	EA      	NOP
C0/03E1:	EA      	NOP
C0/03E2:	EA      	NOP
C0/03E3:	EA      	NOP
C0/03E4:	EA      	NOP
C0/03E5:	EA      	NOP
C0/03E6:	EA      	NOP
C0/03E7:	AC1442  	LDY $4214      (load the result)
C0/03EA:	B9701F  	LDA $1F70,Y    (palette number?)
C0/03ED:	4A      	LSR A
C0/03EE:	8DFC11  	STA $11FC
C0/03F1:	48      	PHA
C0/03F2:	DA      	PHX
C0/03F3:	5A      	PHY
C0/03F4:	0B      	PHD
C0/03F5:	8B      	PHB
C0/03F6:	08      	PHP 
C0/03F7:	220000EE	JSL $EE0000    (Is this the decompression routine?)
C0/03FB:	28      	PLP 
C0/03FC:	AB      	PLB
C0/03FD:	2B      	PLD 
C0/03FE:	7A      	PLY
C0/03FF:	FA      	PLX
C0/0400:	68      	PLA
C0/0401:	78      	SEI 
C0/0402:	9C0B42  	STZ $420B      (turn off DMA)
C0/0405:	9C0C42  	STZ $420C      (turn off HDMA)
C0/0408:	A98F    	LDA #$8F
C0/040A:	8D0021  	STA $2100
C0/040D:	A900    	LDA #$00
C0/040F:	8D0042  	STA $4200      (turn off NMI, auto joypad read, etc)
C0/0412:	EB      	XBA
C0/0413:	207305  	JSR $0573      (set C0's NMI and IRQ)
C0/0416:	201505  	JSR $0515      ; restore direct page bytes 00-FF
C0/0419:	207770  	JSR $7077 
C0/041C:	20BF6E  	JSR $6EBF
C0/041F:	AD4E1D  	LDA $1D4E      (load miscellaneous settings)
C0/0422:	2907    	AND #$07       (isolate the wallpaper)
C0/0424:	8D6505  	STA $0565      (save the wallpaper)
C0/0427:	C220    	REP #$20       (16 bit accum./memory)
C0/0429:	AD641F  	LDA $1F64      (load map number)
C0/042C:	851E    	STA $1E
C0/042E:	29FF01  	AND #$01FF     (isolate the map number)
C0/0431:	8D641F  	STA $1F64      (save map number, without the flags)
C0/0434:	AD661F  	LDA $1F66      (load position to appear at)
C0/0437:	8DC01F  	STA $1FC0      (save it)
C0/043A:	7B      	TDC 
C0/043B:	E220    	SEP #$20       (8 bit accum./memory)
C0/043D:	A51F    	LDA $1F        (load upper map byte)
C0/043F:	2930    	AND #$30       (mask two bits)
C0/0441:	4A      	LSR A
C0/0442:	4A      	LSR A
C0/0443:	4A      	LSR A
C0/0444:	4A      	LSR A          (shift to the lower nybble)
C0/0445:	8D4307  	STA $0743
C0/0448:	A51F    	LDA $1F        (load upper map byte)
C0/044A:	2908    	AND #$08       (mask location name flag)
C0/044C:	8D4507  	STA $0745      (set location name to appear when map loads)
C0/044F:	AEFD11  	LDX $11FD      ; map event pointer
C0/0452:	86E5    	STX $E5        ; save event pointer
C0/0454:	ADFF11  	LDA $11FF      ; map event bank
C0/0457:	85E7    	STA $E7        ; save event bank
C0/0459:	C9CA    	CMP #$CA       ; "null" bank
C0/045B:	D00E    	BNE $046B      ; exit if not
C0/045D:	E00000  	CPX #$0000     ; "null" pointer
C0/0460:	D009    	BNE $046B      ; exit if not
C0/0462:	A600    	LDX $00        ; zero X
C0/0464:	86E8    	STX $E8        ; reset event stack pointer
C0/0466:	A980    	LDA #$80       ; enable map startup event
C0/0468:	8DFA11  	STA $11FA      ; set ^
C0/046B:	60      	RTS
 
LZ decompression routine
C0/046C:	8B      	PHB           (LONG-from C0/1CEE, C0/278F, C0/280C, C0/285D, C0/28B4, C0/2908, C0/295E, C0/903A, C0/C8A0, etc.)
C0/046D:	C220    	REP #$20      (16 bit accum./memory)
C0/046F:	A7F3    	LDA [$F3]
C0/0471:	85FC    	STA $FC
C0/0473:	A5F6    	LDA $F6
C0/0475:	8F812100	STA $002181
C0/0479:	E220    	SEP #$20      (8 bit accum./memory)
C0/047B:	A5F8    	LDA $F8
C0/047D:	2901    	AND #$01
C0/047F:	8F832100	STA $002183
C0/0483:	A901    	LDA #$01
C0/0485:	85FE    	STA $FE
C0/0487:	A00200  	LDY #$0002
C0/048A:	A97F    	LDA #$7F
C0/048C:	48      	PHA
C0/048D:	AB      	PLB           (set bank to 7F)
C0/048E:	A200F8  	LDX #$F800
C0/0491:	7B      	TDC 
C0/0492:	9D0000  	STA $0000,X
C0/0495:	E8      	INX
C0/0496:	D0FA    	BNE $0492
C0/0498:	A2DEFF  	LDX #$FFDE
C0/049B:	C6FE    	DEC $FE
C0/049D:	D009    	BNE $04A8
C0/049F:	A908    	LDA #$08
C0/04A1:	85FE    	STA $FE
C0/04A3:	B7F3    	LDA [$F3],Y
C0/04A5:	85FF    	STA $FF
C0/04A7:	C8      	INY 
C0/04A8:	46FF    	LSR $FF
C0/04AA:	9011    	BCC $04BD
C0/04AC:	B7F3    	LDA [$F3],Y
C0/04AE:	8F802100	STA $002180
C0/04B2:	9D0000  	STA $0000,X
C0/04B5:	E8      	INX
C0/04B6:	D037    	BNE $04EF
C0/04B8:	A200F8  	LDX #$F800
C0/04BB:	8032    	BRA $04EF
C0/04BD:	B7F3    	LDA [$F3],Y
C0/04BF:	EB      	XBA
C0/04C0:	C8      	INY 
C0/04C1:	84F9    	STY $F9
C0/04C3:	B7F3    	LDA [$F3],Y
C0/04C5:	4A      	LSR A
C0/04C6:	4A      	LSR A
C0/04C7:	4A      	LSR A
C0/04C8:	18      	CLC
C0/04C9:	6903    	ADC #$03
C0/04CB:	85FB    	STA $FB
C0/04CD:	B7F3    	LDA [$F3],Y
C0/04CF:	09F8    	ORA #$F8
C0/04D1:	EB      	XBA
C0/04D2:	A8      	TAY
C0/04D3:	B90000  	LDA $0000,Y
C0/04D6:	8F802100	STA $002180
C0/04DA:	9D0000  	STA $0000,X
C0/04DD:	E8      	INX
C0/04DE:	D003    	BNE $04E3
C0/04E0:	A200F8  	LDX #$F800
C0/04E3:	C8      	INY 
C0/04E4:	D003    	BNE $04E9
C0/04E6:	A000F8  	LDY #$F800
C0/04E9:	C6FB    	DEC $FB
C0/04EB:	D0E6    	BNE $04D3
C0/04ED:	A4F9    	LDY $F9
C0/04EF:	C8      	INY 
C0/04F0:	C4FC    	CPY $FC
C0/04F2:	D0A7    	BNE $049B
C0/04F4:	7B      	TDC 
C0/04F5:	EB      	XBA
C0/04F6:	AB      	PLB
C0/04F7:	6B      	RTL

Zero out the first 256 bytes of ram
C0/04F8:	A20000  	LDX #$0000
C0/04FB:	9E0000  	STZ $0000,X
C0/04FE:	E8      	INX
C0/04FF:	E00001  	CPX #$0100     (LDX #$00FF DEX BPL would've worked just as easily)
C0/0502:	D0F7    	BNE $04FB
C0/0504:	60      	RTS

Copy 256 bytes of RAM from 0000-00FF to 1200-12FF
C0/0505:	A20000  	LDX #$0000     (from C0/03BD, C0/B966, C0/B992, C0/B9C5, C0/B9E7, C0/BA36, C0/BA51, C0/BA69, C0/C144, C0/C27A, C0/C326, C0/C4EA, C0/C6B6, C0/C6D6)
C0/0508:	BD0000  	LDA $0000,X
C0/050B:	9D0012  	STA $1200,X
C0/050E:	E8      	INX
C0/050F:	E00001  	CPX #$0100
C0/0512:	D0F4    	BNE $0508
C0/0514:	60      	RTS

Copy 256 bytes of RAM from 1200-12FF to 0000-00FF
C0/0515:	A20000  	LDX #$0000     (from C0/0416, C0/B970, C0/B99C, C0/B9D6, C0/B9F8, C0/BA40, C0/BA5B, C0/BA73, C0/C168, C0/C177, C0/C4F7, C0/C4F7, C0/C703)
C0/0518:	BD0012  	LDA $1200,X
C0/051B:	9D0000  	STA $0000,X
C0/051E:	E8      	INX
C0/051F:	E00001  	CPX #$0100
C0/0522:	D0F4    	BNE $0518
C0/0524:	60      	RTS
 
C0/0525:	7B      	TDC            (from only C0/003F)
C0/0526:	AA      	TAX
C0/0527:	8E8121  	STX $2181
C0/052A:	8D8321  	STA $2183
C0/052D:	A22001  	LDX #$0120
C0/0530:	8D8021  	STA $2180
C0/0533:	8D8021  	STA $2180
C0/0536:	8D8021  	STA $2180
C0/0539:	8D8021  	STA $2180
C0/053C:	8D8021  	STA $2180
C0/053F:	8D8021  	STA $2180
C0/0542:	8D8021  	STA $2180
C0/0545:	8D8021  	STA $2180
C0/0548:	8D8021  	STA $2180
C0/054B:	8D8021  	STA $2180
C0/054E:	8D8021  	STA $2180
C0/0551:	8D8021  	STA $2180
C0/0554:	8D8021  	STA $2180
C0/0557:	8D8021  	STA $2180
C0/055A:	8D8021  	STA $2180
C0/055D:	8D8021  	STA $2180
C0/0560:	CA      	DEX
C0/0561:	D0CD    	BNE $0530
C0/0563:	60      	RTS
 
C0/0564:	6455    	STZ $55        ; clear "NMI Just Ran"
C0/0566:	A555    	LDA $55        ; "NMI Just Ran"
C0/0568:	F0FC    	BEQ $0566      ; wait until NMI just ran
C0/056A:	6455    	STZ $55        ; clear "NMI Just Ran"
C0/056C:	60      	RTS

; Decode joypads
C0/056D:	220900C3	JSL $C30009    ; decode joypads for field
C0/0571:	7B      	TDC            ; clear A/B
C0/0572:	60      	RTS
 
Set NMI and IRQ entry points
C0/0573:	A95C    	LDA #$5C       (from C0/004C, C0/0413, C0/B976, C0/B9A2, C0/B9DC, C0/B9FE, C0/BA46, C0/BA61, C0/BA79, C0/C172, C0/C71D)
C0/0575:	8D0015  	STA $1500
C0/0578:	8D0415  	STA $1504
C0/057B:	A28201  	LDX #$0182
C0/057E:	8E0115  	STX $1501
C0/0581:	A9C0    	LDA #$C0
C0/0583:	8D0315  	STA $1503      (set NMI to JMP $C00182)
C0/0586:	A26202  	LDX #$0262
C0/0589:	8E0515  	STX $1505
C0/058C:	A9C0    	LDA #$C0       (A should still hold this value)
C0/058E:	8D0715  	STA $1507      (set IRQ to JMP $C00262)
C0/0591:	60      	RTS
 
C0/0592:	A980    	LDA #$80       (from only C0/BF5B)
C0/0594:	8D0021  	STA $2100
C0/0597:	A900    	LDA #$00
C0/0599:	8D0042  	STA $4200      (STZ $4200...turn off NMI, auto joypad read, etc)
C0/059C:	9C0B42  	STZ $420B      (turn off DMA)
C0/059F:	9C0C42  	STZ $420C      (turn off HDMA)
C0/05A2:	A903    	LDA #$03
C0/05A4:	0960    	ORA #$60       (there had better be a branch or jump that goes here...)
C0/05A6:	8D0121  	STA $2101
C0/05A9:	9C0221  	STZ $2102
C0/05AC:	9C0321  	STZ $2103
C0/05AF:	A909    	LDA #$09
C0/05B1:	8D0521  	STA $2105
C0/05B4:	9C0621  	STZ $2106
C0/05B7:	A948    	LDA #$48
C0/05B9:	8D0721  	STA $2107
C0/05BC:	A950    	LDA #$50
C0/05BE:	8D0821  	STA $2108
C0/05C1:	A958    	LDA #$58
C0/05C3:	8D0921  	STA $2109
C0/05C6:	A900    	LDA #$00
C0/05C8:	8D0B21  	STA $210B
C0/05CB:	A903    	LDA #$03
C0/05CD:	8D0C21  	STA $210C
C0/05D0:	A980    	LDA #$80
C0/05D2:	8D1521  	STA $2115
C0/05D5:	8D2121  	STA $2121
C0/05D8:	A933    	LDA #$33
C0/05DA:	8D2321  	STA $2123
C0/05DD:	A903    	LDA #$03
C0/05DF:	8D2421  	STA $2124
C0/05E2:	A9F3    	LDA #$F3
C0/05E4:	8D2521  	STA $2125
C0/05E7:	A908    	LDA #$08
C0/05E9:	8D2621  	STA $2126
C0/05EC:	A9F7    	LDA #$F7
C0/05EE:	8D2721  	STA $2127
C0/05F1:	A900    	LDA #$00
C0/05F3:	8D2821  	STA $2128
C0/05F6:	A9FF    	LDA #$FF
C0/05F8:	8D2921  	STA $2129
C0/05FB:	A900    	LDA #$00
C0/05FD:	8D2A21  	STA $212A
C0/0600:	A900    	LDA #$00
C0/0602:	8D2B21  	STA $212B
C0/0605:	A917    	LDA #$17
C0/0607:	8D2E21  	STA $212E
C0/060A:	9C2F21  	STZ $212F
C0/060D:	A922    	LDA #$22
C0/060F:	8D3021  	STA $2130
C0/0612:	A9E0    	LDA #$E0
C0/0614:	8D3221  	STA $2132
C0/0617:	A900    	LDA #$00
C0/0619:	8D3321  	STA $2133
C0/061C:	A9FF    	LDA #$FF
C0/061E:	8D0142  	STA $4201
C0/0621:	9C0742  	STZ $4207
C0/0624:	9C0842  	STZ $4208
C0/0627:	A2D700  	LDX #$00D7
C0/062A:	8E0942  	STX $4209
C0/062D:	60      	RTS
 
Random number generator
C0/062E:	DA      	PHX            (from C0/0EDB, C0/0EFD, C0/7B0C, C0/7B19, C0/7BB1, C0/B271)
C0/062F:	EE6D1F  	INC $1F6D      (increment RNG index in SRAM)
C0/0632:	AD6D1F  	LDA $1F6D      (load RNG index from SRAM)
C0/0635:	AA      	TAX
C0/0636:	BF00FDC0	LDA $C0FD00,X  (Load Xth entry of Random number table)
C0/063A:	FA      	PLX
C0/063B:	60      	RTS
 
C0/063C:	AD7B07  	LDA $077B		  ; enable flashlight [?]
C0/063F:	D00E    	BNE $064F
C0/0641:	AD8107  	LDA $0781     ; enable pyramid [?]
C0/0644:	D009    	BNE $064F
C0/0646:	AD2105  	LDA $0521
C0/0649:	2920    	AND #$20
C0/064B:	D002    	BNE $064F
C0/064D:	801E    	BRA $066D
C0/064F:	AD2605  	LDA $0526
C0/0652:	2903    	AND #$03
C0/0654:	0A      	ASL A
C0/0655:	0A      	ASL A
C0/0656:	AA      	TAX
C0/0657:	BF7D06C0	LDA $C0067D,X
C0/065B:	8D2321  	STA $2123
C0/065E:	BF7E06C0	LDA $C0067E,X
C0/0662:	8D2421  	STA $2124
C0/0665:	BF7F06C0	LDA $C0067F,X
C0/0669:	8D2521  	STA $2125
C0/066C:	60      	RTS
 
C0/066D:	A933    	LDA #$33		(from C0/064D)
C0/066F:	8D2321  	STA $2123
C0/0672:	A903    	LDA #$03
C0/0674:	8D2421  	STA $2124
C0/0677:	A9F3    	LDA #$F3
C0/0679:	8D2521  	STA $2125
C0/067C:	60      	RTS
 
Data
C0/067D:	3303    	AND ($03,S),Y	
C0/067F:	F300    	SBC ($00,S),Y
C0/0681:	B303    	LDA ($03,S),Y
C0/0683:	F300    	SBC ($00,S),Y
C0/0685:	FF0FFF00	SBC $00FF0F,X
C0/0689:	330F    	AND ($0F,S),Y
C0/068B:	F300    	SBC ($00,S),Y

C0/068D:	EE6605  	INC $0566
C0/0690:	AD6605  	LDA $0566
C0/0693:	4A      	LSR A
C0/0694:	B008    	BCS $069E
C0/0696:	A2B38C  	LDX #$8CB3
C0/0699:	8E8121  	STX $2181
C0/069C:	8006    	BRA $06A4
C0/069E:	A2538E  	LDX #$8E53
C0/06A1:	8E8121  	STX $2181
C0/06A4:	A97E    	LDA #$7E
C0/06A6:	8D8321  	STA $2183
C0/06A9:	A9D0    	LDA #$D0
C0/06AB:	206E0B  	JSR $0B6E
C0/06AE:	60      	RTS
 
C0/06AF:	AD7B07  	LDA $077B		(from only C0/0140)
C0/06B2:	3001    	BMI $06B5
C0/06B4:	60      	RTS
 
C0/06B5:	291F    	AND #$1F		(from C0/06B5)
C0/06B7:	0A      	ASL A
C0/06B8:	CD7C07  	CMP $077C
C0/06BB:	F010    	BEQ $06CD
C0/06BD:	B008    	BCS $06C7
C0/06BF:	CE7C07  	DEC $077C
C0/06C2:	CE7C07  	DEC $077C
C0/06C5:	8006    	BRA $06CD
C0/06C7:	EE7C07  	INC $077C
C0/06CA:	EE7C07  	INC $077C
C0/06CD:	AC0308  	LDY $0803
C0/06D0:	B96A08  	LDA $086A,Y
C0/06D3:	38      	SEC 
C0/06D4:	E55C    	SBC $5C
C0/06D6:	18      	CLC
C0/06D7:	6910    	ADC #$10
C0/06D9:	8D7D07  	STA $077D
C0/06DC:	B96D08  	LDA $086D,Y
C0/06DF:	38      	SEC 
C0/06E0:	E560    	SBC $60
C0/06E2:	38      	SEC 
C0/06E3:	E908    	SBC #$08
C0/06E5:	8D7E07  	STA $077E
C0/06E8:	EE6605  	INC $0566
C0/06EB:	AD6605  	LDA $0566
C0/06EE:	4A      	LSR A
C0/06EF:	B008    	BCS $06F9
C0/06F1:	A2B38C  	LDX #$8CB3
C0/06F4:	8E8121  	STX $2181
C0/06F7:	8006    	BRA $06FF
C0/06F9:	A2538E  	LDX #$8E53
C0/06FC:	8E8121  	STX $2181
C0/06FF:	A97E    	LDA #$7E
C0/0701:	8D8321  	STA $2183
C0/0704:	AD7C07  	LDA $077C
C0/0707:	851A    	STA $1A
C0/0709:	D009    	BNE $0714
C0/070B:	A9D0    	LDA #$D0
C0/070D:	206E0B  	JSR $0B6E
C0/0710:	9C7B07  	STZ $077B
C0/0713:	60      	RTS
 
C0/0714:	A20001  	LDX #$0100		(from C0/0709)
C0/0717:	8E0442  	STX $4204
C0/071A:	A51A    	LDA $1A
C0/071C:	8D0642  	STA $4206
C0/071F:	EA      	NOP
C0/0720:	EA      	NOP
C0/0721:	EA      	NOP
C0/0722:	EA      	NOP
C0/0723:	EA      	NOP
C0/0724:	EA      	NOP
C0/0725:	EA      	NOP
C0/0726:	AD1442  	LDA $4214
C0/0729:	8D0242  	STA $4202
C0/072C:	A51A    	LDA $1A
C0/072E:	8527    	STA $27
C0/0730:	A980    	LDA #$80
C0/0732:	8526    	STA $26
C0/0734:	6428    	STZ $28
C0/0736:	6429    	STZ $29
C0/0738:	E210    	SEP #$10      (8 bit index registers)
C0/073A:	C220    	REP #$20      (16 bit accum./memory) 
C0/073C:	A629    	LDX $29
C0/073E:	8E0342  	STX $4203
C0/0741:	A526    	LDA $26
C0/0743:	38      	SEC 
C0/0744:	ED1642  	SBC $4216
C0/0747:	8526    	STA $26
C0/0749:	3014    	BMI $075F
C0/074B:	EB      	XBA
C0/074C:	9F007B7E	STA $7E7B00,X
C0/0750:	A427    	LDY $27
C0/0752:	8C0342  	STY $4203
C0/0755:	A528    	LDA $28
C0/0757:	18      	CLC
C0/0758:	6D1642  	ADC $4216
C0/075B:	8528    	STA $28
C0/075D:	80DD    	BRA $073C
C0/075F:	7B      	TDC 
C0/0760:	E220    	SEP #$20      (8 bit accum./memory)
C0/0762:	AD7E07  	LDA $077E
C0/0765:	38      	SEC 
C0/0766:	E51A    	SBC $1A
C0/0768:	9003    	BCC $076D
C0/076A:	206E0B  	JSR $0B6E
C0/076D:	AC7D07  	LDY $077D
C0/0770:	A61A    	LDX $1A
C0/0772:	EC7E07  	CPX $077E
C0/0775:	9003    	BCC $077A
C0/0777:	AE7E07  	LDX $077E
C0/077A:	CA      	DEX
C0/077B:	98      	TYA
C0/077C:	38      	SEC 
C0/077D:	FF007B7E	SBC $7E7B00,X
C0/0781:	B001    	BCS $0784
C0/0783:	7B      	TDC 
C0/0784:	8D8021  	STA $2180
C0/0787:	98      	TYA
C0/0788:	18      	CLC
C0/0789:	7F007B7E	ADC $7E7B00,X
C0/078D:	9002    	BCC $0791
C0/078F:	A9FF    	LDA #$FF
C0/0791:	8D8021  	STA $2180
C0/0794:	CA      	DEX
C0/0795:	D0E4    	BNE $077B
C0/0797:	AC7D07  	LDY $077D
C0/079A:	A61A    	LDX $1A
C0/079C:	AD7E07  	LDA $077E
C0/079F:	C9D0    	CMP #$D0
C0/07A1:	B03C    	BCS $07DF
C0/07A3:	18      	CLC
C0/07A4:	651A    	ADC $1A
C0/07A6:	C9D0    	CMP #$D0
C0/07A8:	9007    	BCC $07B1
C0/07AA:	A9D0    	LDA #$D0
C0/07AC:	38      	SEC 
C0/07AD:	ED7E07  	SBC $077E
C0/07B0:	AA      	TAX
C0/07B1:	862A    	STX $2A
C0/07B3:	A600    	LDX $00
C0/07B5:	98      	TYA
C0/07B6:	38      	SEC 
C0/07B7:	FF007B7E	SBC $7E7B00,X
C0/07BB:	B001    	BCS $07BE
C0/07BD:	7B      	TDC 
C0/07BE:	8D8021  	STA $2180
C0/07C1:	98      	TYA
C0/07C2:	18      	CLC
C0/07C3:	7F007B7E	ADC $7E7B00,X
C0/07C7:	9002    	BCC $07CB
C0/07C9:	A9FF    	LDA #$FF
C0/07CB:	8D8021  	STA $2180
C0/07CE:	E8      	INX
C0/07CF:	E42A    	CPX $2A
C0/07D1:	D0E2    	BNE $07B5
C0/07D3:	A9D1    	LDA #$D1
C0/07D5:	38      	SEC 
C0/07D6:	E51A    	SBC $1A
C0/07D8:	38      	SEC 
C0/07D9:	ED7E07  	SBC $077E
C0/07DC:	206E0B  	JSR $0B6E
C0/07DF:	C210    	REP #$10      	(16 bit index registers)
C0/07E1:	60      	RTS
 
C0/07E2:	A51A    	LDA $1A		(from C0/0862, C0/0892, C0/08C1)
C0/07E4:	8D0242  	STA $4202
C0/07E7:	4A      	LSR A
C0/07E8:	851A    	STA $1A
C0/07EA:	A51B    	LDA $1B
C0/07EC:	AA      	TAX
C0/07ED:	BF6DFEC2	LDA $C2FE6D,X  (load from the sine table)
C0/07F1:	18      	CLC
C0/07F2:	6980    	ADC #$80
C0/07F4:	8D0342  	STA $4203
C0/07F7:	EA      	NOP
C0/07F8:	EA      	NOP
C0/07F9:	EA      	NOP
C0/07FA:	AD1742  	LDA $4217
C0/07FD:	38      	SEC 
C0/07FE:	E51A    	SBC $1A
C0/0800:	60      	RTS
 
C0/0801:	A51A    	LDA $1A		(from C0/0871, C0/08A0, C0/08CF)
C0/0803:	8D0242  	STA $4202		
C0/0806:	4A      	LSR A
C0/0807:	851A    	STA $1A
C0/0809:	A51B    	LDA $1B
C0/080B:	18      	CLC
C0/080C:	6940    	ADC #$40
C0/080E:	AA      	TAX           (BRA $07EC?)
C0/080F:	BF6DFEC2	LDA $C2FE6D,X  (load from the sine table)
C0/0813:	18      	CLC
C0/0814:	6980    	ADC #$80
C0/0816:	8D0342  	STA $4203
C0/0819:	EA      	NOP
C0/081A:	EA      	NOP
C0/081B:	EA      	NOP
C0/081C:	AD1742  	LDA $4217
C0/081F:	38      	SEC 
C0/0820:	E51A    	SBC $1A
C0/0822:	60      	RTS
 
C0/0823:	AD8107  	LDA $0781		(from only C0/0143)
C0/0826:	D001    	BNE $0829
C0/0828:	60      	RTS
 
C0/0829:	AC7F07  	LDY $077F		(from C0/0826)
C0/082C:	B96A08  	LDA $086A,Y
C0/082F:	38      	SEC 
C0/0830:	E55C    	SBC $5C
C0/0832:	18      	CLC
C0/0833:	6910    	ADC #$10
C0/0835:	8D7D07  	STA $077D
C0/0838:	B96D08  	LDA $086D,Y
C0/083B:	38      	SEC 
C0/083C:	E560    	SBC $60
C0/083E:	8D7E07  	STA $077E
C0/0841:	C221    	REP #$21
C0/0843:	AD9007  	LDA $0790
C0/0846:	18      	CLC
C0/0847:	694000  	ADC #$0040
C0/084A:	8D9007  	STA $0790
C0/084D:	7B      	TDC 
C0/084E:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0850:	AD9007  	LDA $0790
C0/0853:	29C0    	AND #$C0
C0/0855:	851B    	STA $1B
C0/0857:	AD9107  	LDA $0791
C0/085A:	0A      	ASL A
C0/085B:	18      	CLC
C0/085C:	651B    	ADC $1B
C0/085E:	851B    	STA $1B
C0/0860:	641A    	STZ $1A
C0/0862:	20E207  	JSR $07E2      (notice each time this is called...)
C0/0865:	18      	CLC
C0/0866:	6D7E07  	ADC $077E      (...these 2 lines follow it)
C0/0869:	38      	SEC 
C0/086A:	E930    	SBC #$30
C0/086C:	8D5D07  	STA $075D
C0/086F:	641A    	STZ $1A
C0/0871:	200108  	JSR $0801
C0/0874:	18      	CLC
C0/0875:	6D7D07  	ADC $077D
C0/0878:	8D5C07  	STA $075C
C0/087B:	AD9007  	LDA $0790
C0/087E:	29C0    	AND #$C0
C0/0880:	851B    	STA $1B
C0/0882:	AD9107  	LDA $0791
C0/0885:	0A      	ASL A
C0/0886:	18      	CLC
C0/0887:	651B    	ADC $1B
C0/0889:	38      	SEC 
C0/088A:	E920    	SBC #$20
C0/088C:	851B    	STA $1B
C0/088E:	A920    	LDA #$20
C0/0890:	851A    	STA $1A
C0/0892:	20E207  	JSR $07E2
C0/0895:	18      	CLC
C0/0896:	6D7E07  	ADC $077E
C0/0899:	8D5F07  	STA $075F
C0/089C:	A940    	LDA #$40
C0/089E:	851A    	STA $1A
C0/08A0:	200108  	JSR $0801
C0/08A3:	18      	CLC
C0/08A4:	6D7D07  	ADC $077D
C0/08A7:	8D5E07  	STA $075E
C0/08AA:	AD9007  	LDA $0790
C0/08AD:	29C0    	AND #$C0
C0/08AF:	851B    	STA $1B
C0/08B1:	AD9107  	LDA $0791
C0/08B4:	0A      	ASL A
C0/08B5:	18      	CLC
C0/08B6:	651B    	ADC $1B
C0/08B8:	18      	CLC
C0/08B9:	6920    	ADC #$20
C0/08BB:	851B    	STA $1B
C0/08BD:	A920    	LDA #$20
C0/08BF:	851A    	STA $1A
C0/08C1:	20E207  	JSR $07E2
C0/08C4:	18      	CLC
C0/08C5:	6D7E07  	ADC $077E
C0/08C8:	8D6107  	STA $0761
C0/08CB:	A940    	LDA #$40
C0/08CD:	851A    	STA $1A
C0/08CF:	200108  	JSR $0801
C0/08D2:	18      	CLC
C0/08D3:	6D7D07  	ADC $077D
C0/08D6:	8D6007  	STA $0760
C0/08D9:	EE6605  	INC $0566
C0/08DC:	AD6605  	LDA $0566
C0/08DF:	4A      	LSR A
C0/08E0:	B008    	BCS $08EA
C0/08E2:	A2B38C  	LDX #$8CB3
C0/08E5:	8E8121  	STX $2181
C0/08E8:	8006    	BRA $08F0
C0/08EA:	A2538E  	LDX #$8E53
C0/08ED:	8E8121  	STX $2181
C0/08F0:	A97E    	LDA #$7E
C0/08F2:	8D8321  	STA $2183
C0/08F5:	AD5D07  	LDA $075D
C0/08F8:	CD5F07  	CMP $075F
C0/08FB:	900C    	BCC $0909
C0/08FD:	AE5C07  	LDX $075C
C0/0900:	AC5E07  	LDY $075E
C0/0903:	8E5E07  	STX $075E
C0/0906:	8C5C07  	STY $075C
C0/0909:	AD5F07  	LDA $075F
C0/090C:	CD6107  	CMP $0761
C0/090F:	900C    	BCC $091D
C0/0911:	AE5E07  	LDX $075E
C0/0914:	AC6007  	LDY $0760
C0/0917:	8E6007  	STX $0760
C0/091A:	8C5E07  	STY $075E
C0/091D:	AD5D07  	LDA $075D
C0/0920:	CD5F07  	CMP $075F
C0/0923:	900C    	BCC $0931
C0/0925:	AE5C07  	LDX $075C
C0/0928:	AC5E07  	LDY $075E
C0/092B:	8E5E07  	STX $075E
C0/092E:	8C5C07  	STY $075C
C0/0931:	AD5D07  	LDA $075D
C0/0934:	CD5F07  	CMP $075F
C0/0937:	D017    	BNE $0950
C0/0939:	AD5C07  	LDA $075C
C0/093C:	CD5E07  	CMP $075E
C0/093F:	900C    	BCC $094D
C0/0941:	AE5C07  	LDX $075C
C0/0944:	AC5E07  	LDY $075E
C0/0947:	8E5E07  	STX $075E
C0/094A:	8C5C07  	STY $075C
C0/094D:	4C240A  	JMP $0A24		(could use BRL $0A24)

C0/0950:	AD5E07  	LDA $075E
C0/0953:	CD6007  	CMP $0760
C0/0956:	900C    	BCC $0964
C0/0958:	AE5E07  	LDX $075E
C0/095B:	AC6007  	LDY $0760
C0/095E:	8E6007  	STX $0760
C0/0961:	8C5E07  	STY $075E
C0/0964:	AD5F07  	LDA $075F
C0/0967:	CD6107  	CMP $0761
C0/096A:	D003    	BNE $096F
C0/096C:	4C780A  	JMP $0A78		(could use BRL $0A78)

C0/096F:	AD5D07  	LDA $075D
C0/0972:	852C    	STA $2C
C0/0974:	AD5F07  	LDA $075F
C0/0977:	38      	SEC 
C0/0978:	ED5D07  	SBC $075D
C0/097B:	8528    	STA $28
C0/097D:	AD5E07  	LDA $075E
C0/0980:	8526    	STA $26
C0/0982:	AD5C07  	LDA $075C
C0/0985:	8527    	STA $27
C0/0987:	207F0B  	JSR $0B7F
C0/098A:	851A    	STA $1A
C0/098C:	842A    	STY $2A
C0/098E:	AD6107  	LDA $0761
C0/0991:	38      	SEC 
C0/0992:	ED5D07  	SBC $075D
C0/0995:	8528    	STA $28
C0/0997:	AD6007  	LDA $0760
C0/099A:	8526    	STA $26
C0/099C:	AD5C07  	LDA $075C
C0/099F:	8527    	STA $27
C0/09A1:	207F0B  	JSR $0B7F
C0/09A4:	842D    	STY $2D
C0/09A6:	C51A    	CMP $1A
C0/09A8:	D01A    	BNE $09C4
C0/09AA:	A42A    	LDY $2A
C0/09AC:	C42D    	CPY $2D
C0/09AE:	9014    	BCC $09C4
C0/09B0:	AE5E07  	LDX $075E
C0/09B3:	AC6007  	LDY $0760
C0/09B6:	8E6007  	STX $0760
C0/09B9:	8C5E07  	STY $075E
C0/09BC:	A62A    	LDX $2A
C0/09BE:	A42D    	LDY $2D
C0/09C0:	862D    	STX $2D
C0/09C2:	842A    	STY $2A
C0/09C4:	AD6107  	LDA $0761
C0/09C7:	38      	SEC 
C0/09C8:	ED5F07  	SBC $075F
C0/09CB:	902A    	BCC $09F7
C0/09CD:	8528    	STA $28
C0/09CF:	AD6007  	LDA $0760
C0/09D2:	8526    	STA $26
C0/09D4:	38      	SEC 
C0/09D5:	AD5E07  	LDA $075E
C0/09D8:	8527    	STA $27
C0/09DA:	207F0B  	JSR $0B7F
C0/09DD:	8430    	STY $30
C0/09DF:	AD5F07  	LDA $075F
C0/09E2:	8532    	STA $32
C0/09E4:	AD6107  	LDA $0761
C0/09E7:	852F    	STA $2F
C0/09E9:	AD5C07  	LDA $075C
C0/09EC:	C220    	REP #$20      	(16 bit accum./memory)
C0/09EE:	EB      	XBA
C0/09EF:	AA      	TAX
C0/09F0:	A8      	TAY
C0/09F1:	7B      	TDC 
C0/09F2:	E220    	SEP #$20      	(8 bit accum./memory)
C0/09F4:	4CC20A  	JMP $0AC2		(could use BRL $0AC2)

C0/09F7:	49FF    	EOR #$FF
C0/09F9:	1A      	INC A
C0/09FA:	8528    	STA $28
C0/09FC:	AD5E07  	LDA $075E
C0/09FF:	8526    	STA $26
C0/0A01:	38      	SEC 
C0/0A02:	AD6007  	LDA $0760
C0/0A05:	8527    	STA $27
C0/0A07:	207F0B  	JSR $0B7F
C0/0A0A:	8430    	STY $30
C0/0A0C:	AD6107  	LDA $0761
C0/0A0F:	8532    	STA $32
C0/0A11:	AD5F07  	LDA $075F
C0/0A14:	852F    	STA $2F
C0/0A16:	AD5C07  	LDA $075C
C0/0A19:	C220    	REP #$20      	(16 bit accum./memory) 
C0/0A1B:	EB      	XBA
C0/0A1C:	AA      	TAX
C0/0A1D:	A8      	TAY
C0/0A1E:	7B      	TDC 
C0/0A1F:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0A21:	4C180B  	JMP $0B18		(could use BRL $0B18)

C0/0A24:	AD6107  	LDA $0761
C0/0A27:	38      	SEC 
C0/0A28:	ED5D07  	SBC $075D
C0/0A2B:	8528    	STA $28
C0/0A2D:	AD6007  	LDA $0760
C0/0A30:	8526    	STA $26
C0/0A32:	AD5C07  	LDA $075C
C0/0A35:	8527    	STA $27
C0/0A37:	207F0B  	JSR $0B7F
C0/0A3A:	842A    	STY $2A
C0/0A3C:	AD6107  	LDA $0761
C0/0A3F:	38      	SEC 
C0/0A40:	ED5F07  	SBC $075F
C0/0A43:	8528    	STA $28
C0/0A45:	AD6007  	LDA $0760
C0/0A48:	8526    	STA $26
C0/0A4A:	AD5E07  	LDA $075E
C0/0A4D:	8527    	STA $27
C0/0A4F:	207F0B  	JSR $0B7F
C0/0A52:	842D    	STY $2D
C0/0A54:	AD5D07  	LDA $075D
C0/0A57:	852C    	STA $2C
C0/0A59:	AD6107  	LDA $0761
C0/0A5C:	8532    	STA $32
C0/0A5E:	852F    	STA $2F
C0/0A60:	C220    	REP #$20      	(16 bit accum./memory)
C0/0A62:	AD5C07  	LDA $075C
C0/0A65:	29FF00  	AND #$00FF
C0/0A68:	EB      	XBA
C0/0A69:	AA      	TAX
C0/0A6A:	AD5E07  	LDA $075E
C0/0A6D:	29FF00  	AND #$00FF
C0/0A70:	EB      	XBA
C0/0A71:	A8      	TAY
C0/0A72:	7B      	TDC 
C0/0A73:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0A75:	4CC20A  	JMP $0AC2		(could used BRA $0AC2, saving one byte) 

C0/0A78:	AD5F07  	LDA $075F
C0/0A7B:	38      	SEC 
C0/0A7C:	ED5D07  	SBC $075D
C0/0A7F:	8528    	STA $28
C0/0A81:	AD5E07  	LDA $075E
C0/0A84:	8526    	STA $26
C0/0A86:	AD5C07  	LDA $075C
C0/0A89:	8527    	STA $27
C0/0A8B:	207F0B  	JSR $0B7F
C0/0A8E:	842A    	STY $2A
C0/0A90:	AD6107  	LDA $0761
C0/0A93:	38      	SEC 
C0/0A94:	ED5D07  	SBC $075D
C0/0A97:	8528    	STA $28
C0/0A99:	AD6007  	LDA $0760
C0/0A9C:	8526    	STA $26
C0/0A9E:	AD5C07  	LDA $075C
C0/0AA1:	8527    	STA $27
C0/0AA3:	207F0B  	JSR $0B7F
C0/0AA6:	842D    	STY $2D
C0/0AA8:	AD5D07  	LDA $075D
C0/0AAB:	852C    	STA $2C
C0/0AAD:	AD6107  	LDA $0761
C0/0AB0:	852F    	STA $2F
C0/0AB2:	8532    	STA $32
C0/0AB4:	AD5C07  	LDA $075C
C0/0AB7:	C220    	REP #$20      	(16 bit accum./memory)
C0/0AB9:	EB      	XBA
C0/0ABA:	AA      	TAX
C0/0ABB:	A8      	TAY
C0/0ABC:	7B      	TDC 
C0/0ABD:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0ABF:	4CC20A  	JMP $0AC2		(could eliminate, saving three bytes)

C0/0AC2:	A52C    	LDA $2C
C0/0AC4:	206E0B  	JSR $0B6E
C0/0AC7:	A532    	LDA $32
C0/0AC9:	38      	SEC 
C0/0ACA:	E52C    	SBC $2C
C0/0ACC:	F01D    	BEQ $0AEB
C0/0ACE:	8522    	STA $22
C0/0AD0:	6423    	STZ $23
C0/0AD2:	C221    	REP #$21
C0/0AD4:	8A      	TXA
C0/0AD5:	18      	CLC
C0/0AD6:	652A    	ADC $2A
C0/0AD8:	AA      	TAX
C0/0AD9:	8D7F21  	STA $217F
C0/0ADC:	98      	TYA
C0/0ADD:	18      	CLC
C0/0ADE:	652D    	ADC $2D
C0/0AE0:	A8      	TAY
C0/0AE1:	8D7F21  	STA $217F
C0/0AE4:	C622    	DEC $22
C0/0AE6:	D0EC    	BNE $0AD4
C0/0AE8:	7B      	TDC 
C0/0AE9:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0AEB:	A52F    	LDA $2F
C0/0AED:	38      	SEC 
C0/0AEE:	E532    	SBC $32
C0/0AF0:	F01D    	BEQ $0B0F
C0/0AF2:	8522    	STA $22
C0/0AF4:	6423    	STZ $23
C0/0AF6:	C221    	REP #$21
C0/0AF8:	8A      	TXA
C0/0AF9:	18      	CLC
C0/0AFA:	6530    	ADC $30
C0/0AFC:	AA      	TAX
C0/0AFD:	8D7F21  	STA $217F
C0/0B00:	98      	TYA
C0/0B01:	18      	CLC
C0/0B02:	652D    	ADC $2D
C0/0B04:	A8      	TAY
C0/0B05:	8D7F21  	STA $217F
C0/0B08:	C622    	DEC $22
C0/0B0A:	D0EC    	BNE $0AF8
C0/0B0C:	7B      	TDC 
C0/0B0D:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0B0F:	A9D0    	LDA #$D0
C0/0B11:	38      	SEC 
C0/0B12:	E52F    	SBC $2F
C0/0B14:	206E0B  	JSR $0B6E
C0/0B17:	60      	RTS
 
C0/0B18:	A52C    	LDA $2C		(from C0/0A21, via JMP)
C0/0B1A:	206E0B  	JSR $0B6E
C0/0B1D:	A532    	LDA $32
C0/0B1F:	38      	SEC 
C0/0B20:	E52C    	SBC $2C
C0/0B22:	F01D    	BEQ $0B41
C0/0B24:	8522    	STA $22
C0/0B26:	6423    	STZ $23
C0/0B28:	C221    	REP #$21
C0/0B2A:	8A      	TXA
C0/0B2B:	18      	CLC
C0/0B2C:	652A    	ADC $2A
C0/0B2E:	AA      	TAX
C0/0B2F:	8D7F21  	STA $217F
C0/0B32:	98      	TYA
C0/0B33:	18      	CLC
C0/0B34:	652D    	ADC $2D
C0/0B36:	A8      	TAY
C0/0B37:	8D7F21  	STA $217F
C0/0B3A:	C622    	DEC $22
C0/0B3C:	D0EC    	BNE $0B2A
C0/0B3E:	7B      	TDC 
C0/0B3F:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0B41:	A52F    	LDA $2F
C0/0B43:	38      	SEC 
C0/0B44:	E532    	SBC $32
C0/0B46:	F01D    	BEQ $0B65
C0/0B48:	8522    	STA $22
C0/0B4A:	6423    	STZ $23
C0/0B4C:	C221    	REP #$21
C0/0B4E:	8A      	TXA
C0/0B4F:	18      	CLC
C0/0B50:	652A    	ADC $2A
C0/0B52:	AA      	TAX
C0/0B53:	8D7F21  	STA $217F
C0/0B56:	98      	TYA
C0/0B57:	18      	CLC
C0/0B58:	6530    	ADC $30
C0/0B5A:	A8      	TAY
C0/0B5B:	8D7F21  	STA $217F
C0/0B5E:	C622    	DEC $22
C0/0B60:	D0EC    	BNE $0B4E
C0/0B62:	7B      	TDC 
C0/0B63:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0B65:	A9D0    	LDA #$D0
C0/0B67:	38      	SEC 
C0/0B68:	E52F    	SBC $2F
C0/0B6A:	206E0B  	JSR $0B6E
C0/0B6D:	60      	RTS
 
C0/0B6E:	DA      	PHX			(from C0/06AB, C0/070D, C0/076A, C0/07DC, C0/0AC4, C0/0B14, C0/0B1A, C0/0B6A)
C0/0B6F:	AA      	TAX
C0/0B70:	F00B    	BEQ $0B7D
C0/0B72:	A9FF    	LDA #$FF
C0/0B74:	8D8021  	STA $2180
C0/0B77:	9C8021  	STZ $2180
C0/0B7A:	CA      	DEX
C0/0B7B:	D0F7    	BNE $0B74
C0/0B7D:	FA      	PLX
C0/0B7E:	60      	RTS
 
Divider #1
Coming in, if $26 - $27 wraps then A will be 1 on exit
Otherwise A will be 0
C0/0B7F:	A526    	LDA $26        (atomic, from C0/0987, C0/09A1, C0/09DA, C0/0A07, C0/0A37, C0/0A4F, C0/0A8B, C0/0AA3)
C0/0B81:	38      	SEC 
C0/0B82:	E527    	SBC $27
C0/0B84:	9015    	BCC $0B9B
C0/0B86:	EB      	XBA            (move to high byte)
C0/0B87:	A8      	TAY            (then transfer all of A to Y)
C0/0B88:	8C0442  	STY $4204
C0/0B8B:	A528    	LDA $28
C0/0B8D:	8D0642  	STA $4206      (divide by contents of $28)
C0/0B90:	7B      	TDC            (2 cycles)
C0/0B91:	EA      	NOP            (4 cycles)
C0/0B92:	EA      	NOP            (6 cycles)
C0/0B93:	EA      	NOP            (8 cycles)
C0/0B94:	EA      	NOP            (10 cycles)
C0/0B95:	EA      	NOP            (12 cycles)
C0/0B96:	EA      	NOP            (14 cycles)
C0/0B97:	AC1442  	LDY $4214      (19 cycles)
C0/0B9A:	60      	RTS
 
Divider #2
C0/0B9B:	49FF    	EOR #$FF       (atomic, from C0/0B84, subtract 255)
C0/0B9D:	1A      	INC A          (and add 1)
C0/0B9E:	EB      	XBA            (move to the high byte)
C0/0B9F:	A8      	TAY            (then transfer all of A to Y)
C0/0BA0:	8C0442  	STY $4204
C0/0BA3:	A528    	LDA $28
C0/0BA5:	8D0642  	STA $4206      (divide by contents of $28)
C0/0BA8:	7B      	TDC            (2 cycles)
C0/0BA9:	EA      	NOP            (4 cycles)
C0/0BAA:	EA      	NOP            (6 cycles)
C0/0BAB:	EA      	NOP            (8 cycles)
C0/0BAC:	EA      	NOP            (10 cycles)
C0/0BAD:	EA      	NOP            (12 cycles)
C0/0BAE:	C220    	REP #$20       (16 bit accum./memory, 15 cycles)
C0/0BB0:	AD1442  	LDA $4214      (20 cycles, overkill much?)
C0/0BB3:	4502    	EOR $02        (EOR #$FF, though it could also be 0...)
C0/0BB5:	1A      	INC A          (and add 1)
C0/0BB6:	A8      	TAY            (put result in Y)
C0/0BB7:	7B      	TDC            (A = #$0000)
C0/0BB8:	E220    	SEP #$20       (8 bit accum./memory)
C0/0BBA:	A901    	LDA #$01       (INC A...)
C0/0BBC:	60      	RTS

---------------------------------
C0/0BBD:	AD2105  	LDA $0521      (from only C0/0146)
C0/0BC0:	2920    	AND #$20      ; "enable spotlights"
C0/0BC2:	D001    	BNE $0BC5
C0/0BC4:	60      	RTS
 
C0/0BC5:	EE6605  	INC $0566      (from C0/0BC2)
C0/0BC8:	AD6605  	LDA $0566
C0/0BCB:	4A      	LSR A
C0/0BCC:	B008    	BCS $0BD6
C0/0BCE:	A2B38C  	LDX #$8CB3
C0/0BD1:	8E8121  	STX $2181      (7E/8CB3...)
C0/0BD4:	8006    	BRA $0BDC

C0/0BD6:	A2538E  	LDX #$8E53     (from C0/0BCC)
C0/0BD9:	8E8121  	STX $2181      (7E/8E53...)
C0/0BDC:	A97E    	LDA #$7E       (from C0/0BD4)
C0/0BDE:	8D8321  	STA $2183
C0/0BE1:	6426    	STZ $26
C0/0BE3:	AD9007  	LDA $0790
C0/0BE6:	4A      	LSR A
C0/0BE7:	B02D    	BCS $0C16
C0/0BE9:	C220    	REP #$20      	(16 bit accum./memory)
C0/0BEB:	AD8307  	LDA $0783
C0/0BEE:	18      	CLC
C0/0BEF:	693200  	ADC #$0032
C0/0BF2:	8D8307  	STA $0783
C0/0BF5:	7B      	TDC 
C0/0BF6:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0BF8:	AD8407  	LDA $0784
C0/0BFB:	AA      	TAX
C0/0BFC:	BF6DFEC2	LDA $C2FE6D,X  (load from the sine table)
C0/0C00:	18      	CLC
C0/0C01:	6980    	ADC #$80
C0/0C03:	4A      	LSR A
C0/0C04:	8527    	STA $27
C0/0C06:	C220    	REP #$20      	(16 bit accum./memory)
C0/0C08:	EE9007  	INC $0790
C0/0C0B:	AD9007  	LDA $0790
C0/0C0E:	4A      	LSR A
C0/0C0F:	29FF00  	AND #$00FF
C0/0C12:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0C14:	8035    	BRA $0C4B

C0/0C16:	C220    	REP #$20      	(from C0/0BE7)(16 bit accum./memory)
C0/0C18:	AD8507  	LDA $0785
C0/0C1B:	18      	CLC
C0/0C1C:	691E00  	ADC #$001E
C0/0C1F:	8D8507  	STA $0785
C0/0C22:	7B      	TDC 
C0/0C23:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0C25:	AD8607  	LDA $0786
C0/0C28:	18      	CLC
C0/0C29:	6940    	ADC #$40
C0/0C2B:	AA      	TAX
C0/0C2C:	BF6DFEC2	LDA $C2FE6D,X  (load from the sine table)
C0/0C30:	18      	CLC
C0/0C31:	6980    	ADC #$80
C0/0C33:	4A      	LSR A
C0/0C34:	18      	CLC
C0/0C35:	6970    	ADC #$70
C0/0C37:	8527    	STA $27
C0/0C39:	C220    	REP #$20      	(16 bit accum./memory)
C0/0C3B:	EE9007  	INC $0790
C0/0C3E:	AD9007  	LDA $0790
C0/0C41:	4A      	LSR A
C0/0C42:	18      	CLC
C0/0C43:	694000  	ADC #$0040
C0/0C46:	29FF00  	AND #$00FF
C0/0C49:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0C4B:	AA      	TAX			(from C0/0C14)
C0/0C4C:	BF6DFEC2	LDA $C2FE6D,X  (load from the sine table)
C0/0C50:	3014    	BMI $0C66
C0/0C52:	C220    	REP #$20      	(16 bit accum./memory)
C0/0C54:	0A      	ASL A
C0/0C55:	38      	SEC 
C0/0C56:	E91800  	SBC #$0018
C0/0C59:	8520    	STA $20
C0/0C5B:	18      	CLC
C0/0C5C:	693000  	ADC #$0030
C0/0C5F:	8524    	STA $24
C0/0C61:	7B      	TDC 
C0/0C62:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0C64:	801B    	BRA $0C81

C0/0C66:	C220    	REP #$20      	(from C0/0C50)(16 bit accum./memory)
C0/0C68:	4502    	EOR $02
C0/0C6A:	1A      	INC A
C0/0C6B:	0A      	ASL A
C0/0C6C:	4502    	EOR $02
C0/0C6E:	1A      	INC A
C0/0C6F:	0900FE  	ORA #$FE00
C0/0C72:	38      	SEC 
C0/0C73:	E91800  	SBC #$0018
C0/0C76:	8520    	STA $20
C0/0C78:	18      	CLC
C0/0C79:	693000  	ADC #$0030
C0/0C7C:	8524    	STA $24
C0/0C7E:	7B      	TDC 
C0/0C7F:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0C81:	C221    	REP #$21		(from C0/0C64)
C0/0C83:	A526    	LDA $26
C0/0C85:	AA      	TAX
C0/0C86:	69000C  	ADC #$0C00
C0/0C89:	A8      	TAY
C0/0C8A:	7B      	TDC 
C0/0C8B:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0C8D:	A521    	LDA $21
C0/0C8F:	3002    	BMI $0C93
C0/0C91:	8008    	BRA $0C9B
C0/0C93:	A525    	LDA $25		(from C0/0C8F)
C0/0C95:	3002    	BMI $0C99
C0/0C97:	803C    	BRA $0CD5
C0/0C99:	807C    	BRA $0D17		(from C0/0C95)
C0/0C9B:	A968    	LDA #$68		(from C0/0C91)
C0/0C9D:	8522    	STA $22
C0/0C9F:	6423    	STZ $23
C0/0CA1:	C221    	REP #$21
C0/0CA3:	8A      	TXA			(from C0/0CBD)
C0/0CA4:	6520    	ADC $20
C0/0CA6:	AA      	TAX
C0/0CA7:	B01A    	BCS $0CC3
C0/0CA9:	8D7F21  	STA $217F		(from C0/0CC9)
C0/0CAC:	98      	TYA
C0/0CAD:	6524    	ADC $24
C0/0CAF:	A8      	TAY
C0/0CB0:	B019    	BCS $0CCB
C0/0CB2:	8D7F21  	STA $217F		(from C0/0CD3)
C0/0CB5:	8E7F21  	STX $217F
C0/0CB8:	8C7F21  	STY $217F
C0/0CBB:	C622    	DEC $22
C0/0CBD:	D0E4    	BNE $0CA3
C0/0CBF:	7B      	TDC 
C0/0CC0:	E220    	SEP #$20   		(8 bit accum./memory)
C0/0CC2:	60      	RTS
 
C0/0CC3:	A502    	LDA $02		(from C0/0CA7)
C0/0CC5:	AA      	TAX
C0/0CC6:	6420    	STZ $20
C0/0CC8:	18      	CLC
C0/0CC9:	80DE    	BRA $0CA9

C0/0CCB:	A502    	LDA $02		(from C0/0CB0)
C0/0CCD:	A8      	TAY
C0/0CCE:	6424    	STZ $24
C0/0CD0:	6425    	STZ $25
C0/0CD2:	18      	CLC
C0/0CD3:	80DD    	BRA $0CB2

C0/0CD5:	A968    	LDA #$68		(from C0/0C97)
C0/0CD7:	8522    	STA $22		
C0/0CD9:	6423    	STZ $23
C0/0CDB:	C220    	REP #$20      	(16 bit accum./memory)
C0/0CDD:	A520    	LDA $20
C0/0CDF:	4502    	EOR $02
C0/0CE1:	1A      	INC A
C0/0CE2:	8520    	STA $20
C0/0CE4:	8A      	TXA
C0/0CE5:	38      	SEC 
C0/0CE6:	E520    	SBC $20
C0/0CE8:	AA      	TAX
C0/0CE9:	901B    	BCC $0D06
C0/0CEB:	8D7F21  	STA $217F		(from C0/0D0B)
C0/0CEE:	98      	TYA
C0/0CEF:	18      	CLC
C0/0CF0:	6524    	ADC $24
C0/0CF2:	A8      	TAY
C0/0CF3:	B018    	BCS $0D0D
C0/0CF5:	8D7F21  	STA $217F		(from C0/0D15)
C0/0CF8:	8E7F21  	STX $217F
C0/0CFB:	8C7F21  	STY $217F
C0/0CFE:	C622    	DEC $22
C0/0D00:	D0E2    	BNE $0CE4
C0/0D02:	7B      	TDC 
C0/0D03:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0D05:	60      	RTS
 
C0/0D06:	A600    	LDX $00		(from C0/0CE9)
C0/0D08:	8620    	STX $20
C0/0D0A:	7B      	TDC 
C0/0D0B:	80DE    	BRA $0CEB

C0/0D0D:	A502    	LDA $02		(from C0/0CF3)
C0/0D0F:	A8      	TAY
C0/0D10:	6424    	STZ $24
C0/0D12:	6425    	STZ $25
C0/0D14:	18      	CLC
C0/0D15:	80DE    	BRA $0CF5

C0/0D17:	A968    	LDA #$68		(from C0/0C99)
C0/0D19:	8522    	STA $22
C0/0D1B:	6423    	STZ $23
C0/0D1D:	C220    	REP #$20      	(16 bit accum./memory)
C0/0D1F:	A520    	LDA $20
C0/0D21:	4502    	EOR $02
C0/0D23:	1A      	INC A
C0/0D24:	8520    	STA $20
C0/0D26:	A524    	LDA $24
C0/0D28:	4502    	EOR $02
C0/0D2A:	1A      	INC A
C0/0D2B:	8524    	STA $24
C0/0D2D:	8A      	TXA			(from C0/0D49)
C0/0D2E:	38      	SEC 
C0/0D2F:	E520    	SBC $20
C0/0D31:	AA      	TAX
C0/0D32:	901B    	BCC $0D4F
C0/0D34:	8D7F21  	STA $217F		(from C0/0D54)
C0/0D37:	98      	TYA
C0/0D38:	38      	SEC 
C0/0D39:	E524    	SBC $24
C0/0D3B:	A8      	TAY
C0/0D3C:	9018    	BCC $0D56
C0/0D3E:	8D7F21  	STA $217F
C0/0D41:	8E7F21  	STX $217F		(from C0/0D5B)
C0/0D44:	8C7F21  	STY $217F
C0/0D47:	C622    	DEC $22
C0/0D49:	D0E2    	BNE $0D2D
C0/0D4B:	7B      	TDC 
C0/0D4C:	E220    	SEP #$20      	(8 bit accum./memory)
C0/0D4E:	60      	RTS
 
C0/0D4F:	A600    	LDX $00		(from C0/0D32)
C0/0D51:	8620    	STX $20
C0/0D53:	7B      	TDC 
C0/0D54:	80DE    	BRA $0D34

C0/0D56:	A400    	LDY $00		(from C0/0D3C)
C0/0D58:	8424    	STY $24
C0/0D5A:	7B      	TDC 
C0/0D5B:	80E1    	BRA $0D3E
-------------------------------------
C0/0D5D:	A97E    	LDA #$7E		(is this function ever called?)
C0/0D5F:	48      	PHA
C0/0D60:	AB      	PLB
C0/0D61:	C220    	REP #$20      	(16 bit accum./memory)
C0/0D63:	A400    	LDY $00
C0/0D65:	BB      	TYX
C0/0D66:	B9087D  	LDA $7D08,Y
C0/0D69:	C95387  	CMP #$8753
C0/0D6C:	D007    	BNE $0D75
C0/0D6E:	BF8D0DC0	LDA $C00D8D,X
C0/0D72:	99087D  	STA $7D08,Y    (set VRAM positioning?)
C0/0D75:	8A      	TXA
C0/0D76:	18      	CLC
C0/0D77:	690200  	ADC #$0002     (INC A INC A would save two bytes)
C0/0D7A:	290700  	AND #$0007
C0/0D7D:	AA      	TAX
C0/0D7E:	C8      	INY 
C0/0D7F:	C8      	INY 
C0/0D80:	C8      	INY 
C0/0D81:	C05A00  	CPY #$005A
C0/0D84:	D0E0    	BNE $0D66
C0/0D86:	7B      	TDC 
C0/0D87:	E220    	SEP #$20      (8 bit accum./memory)
C0/0D89:	7B      	TDC            (A is already #$0000)
C0/0D8A:	48      	PHA
C0/0D8B:	AB      	PLB
C0/0D8C:	60      	RTS
 
Data of some sort 

C0/0D8D:	6387    	
C0/0D8F:	7387    	
C0/0D91:	8387    	
C0/0D93:	9387    	

C0/0D95:	A920    	LDA #$20
C0/0D97:	8D5207  	STA $0752
C0/0D9A:	A940    	LDA #$40
C0/0D9C:	8D5307  	STA $0753
C0/0D9F:	A980    	LDA #$80
C0/0DA1:	8D0242  	STA $4202
C0/0DA4:	A26387  	LDX #$8763
C0/0DA7:	8E8121  	STX $2181
C0/0DAA:	A97E    	LDA #$7E
C0/0DAC:	8D8321  	STA $2183      (7E/8763...)
C0/0DAF:	AD4600  	LDA $0046
C0/0DB2:	291F    	AND #$1F
C0/0DB4:	AA      	TAX
C0/0DB5:	861E    	STX $1E
C0/0DB7:	AD4600  	LDA $0046
C0/0DBA:	0A      	ASL A
C0/0DBB:	291F    	AND #$1F
C0/0DBD:	AA      	TAX
C0/0DBE:	8620    	STX $20
C0/0DC0:	A02000  	LDY #$0020
C0/0DC3:	A61E    	LDX $1E
C0/0DC5:	BFF70DC0	LDA $C00DF7,X
C0/0DC9:	8D0342  	STA $4203
C0/0DCC:	8A      	TXA
C0/0DCD:	1A      	INC A
C0/0DCE:	291F    	AND #$1F
C0/0DD0:	851E    	STA $1E
C0/0DD2:	AD1742  	LDA $4217
C0/0DD5:	0D5207  	ORA $0752
C0/0DD8:	8D8021  	STA $2180
C0/0DDB:	A620    	LDX $20
C0/0DDD:	BF170EC0	LDA $C00E17,X
C0/0DE1:	8D0342  	STA $4203
C0/0DE4:	8A      	TXA
C0/0DE5:	1A      	INC A
C0/0DE6:	291F    	AND #$1F
C0/0DE8:	8520    	STA $20
C0/0DEA:	AD1742  	LDA $4217
C0/0DED:	0D5307  	ORA $0753
C0/0DF0:	8D8021  	STA $2180
C0/0DF3:	88      	DEY 
C0/0DF4:	D0CD    	BNE $0DC3
C0/0DF6:	60      	RTS
 
Data of some sort (I think)

C0/0DF7:	1011    	
C0/0DF9:	1213    	
C0/0DFB:	1415    	
C0/0DFD:	1617    	
C0/0DFF:	1819      	
C0/0E01:	1A1B  	
C0/0E03:	1C1D  	
C0/0E05:	1E1F	
C0/0E07:	1F1E
C0/0E09:	1D1C
C0/0E0B:	1B1A  	
C0/0E0D:	1918  	
C0/0E0F:	1716    	
C0/0E11:	1514    	
C0/0E13:	1312    	
C0/0E15:	1110  
  	
C0/0E17:	0001    	
C0/0E19:	0203    	
C0/0E1B:	0405    	
C0/0E1D:	0607    	
C0/0E1F:	0809    	
C0/0E21:	0A0B      	
C0/0E23:	0C0D  	
C0/0E25:	0E0F
C0/0E27:	0F0E	
C0/0E29:	0D0C
C0/0E2B:	0B0A  	
C0/0E2D:	0908    	
C0/0E2F:	0706    
C0/0E31:	0504    	
C0/0E33:	0302    	
C0/0E35:	0100    	

C0/0E37:	ADF011  	LDA $11F0		(from only C0/0243)
C0/0E3A:	F025    	BEQ $0E61
C0/0E3C:	1A      	INC A
C0/0E3D:	C220    	REP #$20      	(16 bit accum./memory)
C0/0E3F:	0A      	ASL A
C0/0E40:	0A      	ASL A
C0/0E41:	0A      	ASL A
C0/0E42:	0A      	ASL A
C0/0E43:	8510    	STA $10
C0/0E45:	AD9607  	LDA $0796
C0/0E48:	38      	SEC 
C0/0E49:	E510    	SBC $10
C0/0E4B:	8D9607  	STA $0796
C0/0E4E:	1006    	BPL $0E56
C0/0E50:	9C9607  	STZ $0796
C0/0E53:	9CF011  	STZ $11F0
C0/0E56:	7B      	TDC 
C0/0E57:	E220    	SEP #$20      (8 bit accum./memory)
C0/0E59:	AD9707  	LDA $0797
C0/0E5C:	AA      	TAX
C0/0E5D:	BF820EC0	LDA $C00E82,X
C0/0E61:	8F33827E	STA $7E8233
C0/0E65:	8F37827E	STA $7E8237
C0/0E69:	8F3B827E	STA $7E823B
C0/0E6D:	8F3F827E	STA $7E823F
C0/0E71:	8F43827E	STA $7E8243
C0/0E75:	8F47827E	STA $7E8247
C0/0E79:	8F4B827E	STA $7E824B
C0/0E7D:	8F4F827E	STA $7E824F
C0/0E81:	60      	RTS
 
Data

C0/0E82:	0F 1F 2F 3F	
C0/0E86:	4F 5F 6F 7F	
C0/0E8A:	8F 9F AF BF	
C0/0E8E:	CF DF EF FF	
C0/0E92:	EF DF CF BF	
C0/0E96:	AF 9F 8F 7F	
C0/0E9A:	6F 5F 4F 3F	
C0/0E9E:	2F 1F
	
C0/0EA0:	A546    	LDA $46		(from C0/00AD)
C0/0EA2:	4A      	LSR A
C0/0EA3:	9023    	BCC $0EC8
C0/0EA5:	AD4B07  	LDA $074B
C0/0EA8:	8D0242  	STA $4202
C0/0EAB:	A9C08D  	LDA #$8DC0
C0/0EAE:	0342    	ORA $42,S
C0/0EB0:	EA      	NOP
C0/0EB1:	EA      	NOP
C0/0EB2:	EA      	NOP
C0/0EB3:	AD1742  	LDA $4217
C0/0EB6:	8D4B07  	STA $074B
C0/0EB9:	A600    	LDX $00
C0/0EBB:	8E4C07  	STX $074C
C0/0EBE:	8E4E07  	STX $074E
C0/0EC1:	8E5007  	STX $0750
C0/0EC4:	8E7F00  	STX $007F
C0/0EC7:	60      	RTS
  
C0/0EC8:	AD4A07  	LDA $074A		(from C0/0EA3)
C0/0ECB:	2903    	AND #$03
C0/0ECD:	8522    	STA $22
C0/0ECF:	F036    	BEQ $0F07
C0/0ED1:	AD4A07  	LDA $074A
C0/0ED4:	290C    	AND #$0C
C0/0ED6:	4A      	LSR A
C0/0ED7:	4A      	LSR A
C0/0ED8:	F00C    	BEQ $0EE6
C0/0EDA:	AA      	TAX
C0/0EDB:	202E06  	JSR $062E          (Random number generator)
C0/0EDE:	3F450FC0	AND $C00F45,X
C0/0EE2:	D023    	BNE $0F07
C0/0EE4:	8014    	BRA $0EFA
C0/0EE6:	AD4A07  	LDA $074A
C0/0EE9:	29FC    	AND #$FC
C0/0EEB:	8D4A07  	STA $074A
C0/0EEE:	A522    	LDA $22
C0/0EF0:	AA      	TAX
C0/0EF1:	BF450FC0	LDA $C00F45,X
C0/0EF5:	8D4B07  	STA $074B
C0/0EF8:	800D    	BRA $0F07
C0/0EFA:	A522    	LDA $22
C0/0EFC:	AA      	TAX
C0/0EFD:	202E06  	JSR $062E          (Random number generator)
C0/0F00:	3F450FC0	AND $C00F45,X
C0/0F04:	8D4B07  	STA $074B
C0/0F07:	9C4D07  	STZ $074D
C0/0F0A:	9C4F07  	STZ $074F
C0/0F0D:	9C5107  	STZ $0751
C0/0F10:	9C8000  	STZ $0080
C0/0F13:	AD4A07  	LDA $074A
C0/0F16:	2910    	AND #$10
C0/0F18:	F006    	BEQ $0F20
C0/0F1A:	AD4B07  	LDA $074B
C0/0F1D:	8D4C07  	STA $074C
C0/0F20:	AD4A07  	LDA $074A
C0/0F23:	2920    	AND #$20
C0/0F25:	F006    	BEQ $0F2D
C0/0F27:	AD4B07  	LDA $074B
C0/0F2A:	8D4E07  	STA $074E
C0/0F2D:	AD4A07  	LDA $074A
C0/0F30:	2940    	AND #$40
C0/0F32:	F006    	BEQ $0F3A
C0/0F34:	AD4B07  	LDA $074B
C0/0F37:	8D5007  	STA $0750
C0/0F3A:	AD4A07  	LDA $074A
C0/0F3D:	1005    	BPL $0F44
C0/0F3F:	AD4B07  	LDA $074B
C0/0F42:	857F    	STA $7F
C0/0F44:	60      	RTS
 
C0/0F45:	0003    	
C0/0F47:	060C    	
C0/0F49:	0007    	
C0/0F4B:	0F1F	

C0/0F4D:	A910		LDA #$10		(from C0/C0AB)
C0/0F4F:	854A    	STA $4A
C0/0F51:	A910    	LDA #$10
C0/0F53:	854C    	STA $4C
C0/0F55:	60      	RTS
 
C0/0F56:	A990    	LDA #$90		(from C0/199B, C0/19D7, C0/1A0A, C0/1A1D, C0/1AE2, C0/1B17, C0/1B4E, C0/1B70, C0/6E2D, C0/6E6C, C0/C627)
C0/0F58:	854A    	STA $4A    ; set fade out?
C0/0F5A:	A9F0    	LDA #$F0
C0/0F5C:	854C    	STA $4C
C0/0F5E:	60      	RTS

; Handle Screen Brightness (Fade In / Fade Out)
C0/0F5F:	A54A    	LDA $4A	       ; screen fade flags
C0/0F61:	3013    	BMI $0F76      ; branch if fading in

; Screen Fading In
C0/0F63:	A54C    	LDA $4C        ; screen brightness
C0/0F65:	29F0    	AND #$F0       ; only top nibble used
C0/0F67:	C9F0    	CMP #$F0       ; maximum brightness
C0/0F69:	F01E    	BEQ $0F89      ; branch if max (already faded in)
C0/0F6B:	A54A    	LDA $4A        ; screen fade flags
C0/0F6D:	291F    	AND #$1F       ; fade speed
C0/0F6F:	18      	CLC            ; clear carry
C0/0F70:	654C    	ADC $4C        ; add to brightness
C0/0F72:	854C    	STA $4C        ; set new screen brightness
C0/0F74:	8015    	BRA $0F8B      ; finish up

; Screen Fading Out
C0/0F76:	A54C    	LDA $4C        ; screen brightness
C0/0F78:	F00F    	BEQ $0F89      ; branch if black (already faded)
C0/0F7A:	A54A    	LDA $4A        ; screen fade flags
C0/0F7C:	291F    	AND #$1F       ; fade speed
C0/0F7E:	8510    	STA $10        ; store temp
C0/0F80:	A54C    	LDA $4C        ; screen brightness
C0/0F82:	38      	SEC            ; set carry
C0/0F83:	E510    	SBC $10        ; subtract brightness
C0/0F85:	854C    	STA $4C        ; set new screen brightness
C0/0F87:	8002    	BRA $0F8B      ; finish up

C0/0F89:	644A    	STZ $4A        ; clear screen fade byte (done fading)

; Update hardware brightness
C0/0F8B:	A54C    	LDA $4C        ; screen brightness
C0/0F8D:	4A      	LSR A          ; /2
C0/0F8E:	4A      	LSR A          ; /4
C0/0F8F:	4A      	LSR A          ; /8
C0/0F90:	4A      	LSR A          ; /16
C0/0F91:	8D0021  	STA $2100      ; set PPU brightness
C0/0F94:	60      	RTS
 
C0/0F95:	9C1521  	STZ $2115
C0/0F98:	9C0B42  	STZ $420B      (turn off DMA)
C0/0F9B:	A941    	LDA #$41
C0/0F9D:	8D0043  	STA $4300
C0/0FA0:	A918    	LDA #$18
C0/0FA2:	8D0143  	STA $4301
C0/0FA5:	A52C    	LDA $2C
C0/0FA7:	8D0443  	STA $4304
C0/0FAA:	A63B    	LDX $3B
C0/0FAC:	8E1621  	STX $2116
C0/0FAF:	A62A    	LDX $2A
C0/0FB1:	8E0243  	STX $4302
C0/0FB4:	A639    	LDX $39
C0/0FB6:	8E0543  	STX $4305
C0/0FB9:	A901    	LDA #$01
C0/0FBB:	8D0B42  	STA $420B      (turn on channel 1 of DMA)
C0/0FBE:	60      	RTS

; Transfer (updated) OAM via HDMA
C0/0FBF:	9C0221  	STZ $2102		   ; clear OAM address
C0/0FC2:	9C0B42  	STZ $420B      ; disable HDMA channels
C0/0FC5:	A940    	LDA #$40       ; HDMA instructions 1 reg, write 1
C0/0FC7:	8D0043  	STA $4300      ; set HDMA flags
C0/0FCA:	A904    	LDA #$04       ; register $2104
C0/0FCC:	8D0143  	STA $4301      ; set DMA destination
C0/0FCF:	A20003  	LDX #$0300     ; source $000300
C0/0FD2:	8E0243  	STX $4302      ; set DMA source address
C0/0FD5:	A900    	LDA #$00       ; source $000300
C0/0FD7:	8D0443  	STA $4304      ; set DMA source bank
C0/0FDA:	8D0743  	STA $4307      ; set indirect HDMA address [?]
C0/0FDD:	A22002  	LDX #$0220     ; size of transfer
C0/0FE0:	8E0543  	STX $4305      ; set number of bytes to transfer
C0/0FE3:	A901    	LDA #$01       ; DMA channel 1
C0/0FE5:	8D0B42  	STA $420B      ; turn on channel 1 of DMA
C0/0FE8:	60      	RTS
 
C0/0FE9:	A20002  	LDX #$0200		(from C0/BF8E)
C0/0FEC:	A9F0    	LDA #$F0
C0/0FEE:	9DFD02  	STA $02FD,X
C0/0FF1:	CA      	DEX
C0/0FF2:	CA      	DEX
C0/0FF3:	CA      	DEX
C0/0FF4:	CA      	DEX
C0/0FF5:	D0F7    	BNE $0FEE
C0/0FF7:	A22000  	LDX #$0020
C0/0FFA:	9EFF04  	STZ $04FF,X
C0/0FFD:	CA      	DEX
C0/0FFE:	D0FA    	BNE $0FFA
C0/1000:	60      	RTS

; Transfer color palettes over HDMA
C0/1001:	9C2121  	STZ $2121		   ; clear CGRAM word (palette to write to)
C0/1004:	9C0B42  	STZ $420B      ; disable all DMA channels
C0/1007:	A942    	LDA #$42       ; CPU->PPU, HDMA Pointers, 1RegWrite2
C0/1009:	8D0043  	STA $4300      ; prep HDMA over channel 1
C0/100C:	A922    	LDA #$22       ; register $2122 [?]
C0/100E:	8D0143  	STA $4301      ; set DMA destination register
C0/1011:	A20074  	LDX #$7400     ; source $7E7400 (color palettes)
C0/1014:	8E0243  	STX $4302      ; set DMA source address
C0/1017:	A97E    	LDA #$7E       ; source $7E7400 (color palettes)
C0/1019:	8D0443  	STA $4304      ; set DMA source bank
C0/101C:	8D0743  	STA $4307      ; set indirect HDMA address [?]
C0/101F:	A20002  	LDX #$0200     ; number of bytes to transfer
C0/1022:	8E0543  	STX $4305      ; set number of bytes to transfer
C0/1025:	A901    	LDA #$01       ; channel to enable
C0/1027:	8D0B42  	STA $420B      ; turn on channel 1 of DMA
C0/102A:	60      	RTS
 
C0/102B:	48      	PHA			(from C0/A7C0)
C0/102C:	A54E    	LDA $4E
C0/102E:	854F    	STA $4F
C0/1030:	A552    	LDA $52
C0/1032:	8553    	STA $53
C0/1034:	6452    	STZ $52
C0/1036:	A907    	LDA #$07
C0/1038:	854E    	STA $4E
C0/103A:	68      	PLA
C0/103B:	8010    	BRA $104D

C0/103D:	48      	PHA			(from C0/A7D6)
C0/103E:	A54E    	LDA $4E
C0/1040:	854F    	STA $4F
C0/1042:	A552    	LDA $52
C0/1044:	8553    	STA $53
C0/1046:	6452    	STZ $52
C0/1048:	A987    	LDA #$87
C0/104A:	854E    	STA $4E
C0/104C:	68      	PLA
C0/104D:	202311  	JSR $1123
C0/1050:	644D    	STZ $4D
C0/1052:	60      	RTS
 
C0/1053:	A54B    	LDA $4B		(from C0/0240)
C0/1055:	101B    	BPL $1072
C0/1057:	297F    	AND #$7F
C0/1059:	18      	CLC
C0/105A:	654D    	ADC $4D
C0/105C:	854D    	STA $4D
C0/105E:	A554    	LDA $54
C0/1060:	291F    	AND #$1F
C0/1062:	0A      	ASL A
C0/1063:	0A      	ASL A
C0/1064:	0A      	ASL A
C0/1065:	C54D    	CMP $4D
C0/1067:	B01E    	BCS $1087
C0/1069:	A54D    	LDA $4D
C0/106B:	29F8    	AND #$F8
C0/106D:	854D    	STA $4D
C0/106F:	4C8710  	JMP $1087
C0/1072:	A54D    	LDA $4D
C0/1074:	F007    	BEQ $107D
C0/1076:	38      	SEC 
C0/1077:	E54B    	SBC $4B
C0/1079:	854D    	STA $4D
C0/107B:	800A    	BRA $1087
C0/107D:	A54F    	LDA $4F
C0/107F:	854E    	STA $4E
C0/1081:	A553    	LDA $53
C0/1083:	8552    	STA $52
C0/1085:	644B    	STZ $4B
C0/1087:	A54D    	LDA $4D
C0/1089:	4A      	LSR A
C0/108A:	4A      	LSR A
C0/108B:	4A      	LSR A
C0/108C:	850E    	STA $0E
C0/108E:	F00A    	BEQ $109A
C0/1090:	A554    	LDA $54
C0/1092:	29E0    	AND #$E0
C0/1094:	F004    	BEQ $109A
C0/1096:	050E    	ORA $0E
C0/1098:	8002    	BRA $109C
C0/109A:	A9E0    	LDA #$E0
C0/109C:	8F53877E	STA $7E8753
C0/10A0:	8F55877E	STA $7E8755
C0/10A4:	8F57877E	STA $7E8757
C0/10A8:	8F59877E	STA $7E8759
C0/10AC:	8F5B877E	STA $7E875B
C0/10B0:	8F5D877E	STA $7E875D
C0/10B4:	8F5F877E	STA $7E875F
C0/10B8:	8F61877E	STA $7E8761
C0/10BC:	A54E    	LDA $4E
C0/10BE:	8F648C7E	STA $7E8C64
C0/10C2:	8F668C7E	STA $7E8C66
C0/10C6:	8F688C7E	STA $7E8C68
C0/10CA:	8F6A8C7E	STA $7E8C6A
C0/10CE:	8F6C8C7E	STA $7E8C6C
C0/10D2:	8F6E8C7E	STA $7E8C6E
C0/10D6:	8F708C7E	STA $7E8C70
C0/10DA:	8F728C7E	STA $7E8C72
C0/10DE:	A550    	LDA $50
C0/10E0:	8F638C7E	STA $7E8C63
C0/10E4:	8F658C7E	STA $7E8C65
C0/10E8:	8F678C7E	STA $7E8C67
C0/10EC:	8F698C7E	STA $7E8C69
C0/10F0:	8F6B8C7E	STA $7E8C6B
C0/10F4:	8F6D8C7E	STA $7E8C6D
C0/10F8:	8F6F8C7E	STA $7E8C6F
C0/10FC:	8F718C7E	STA $7E8C71
C0/1100:	A552    	LDA $52
C0/1102:	8F64817E	STA $7E8164
C0/1106:	8F66817E	STA $7E8166
C0/110A:	8F68817E	STA $7E8168
C0/110E:	8F6A817E	STA $7E816A
C0/1112:	8F6C817E	STA $7E816C
C0/1116:	8F6E817E	STA $7E816E
C0/111A:	8F70817E	STA $7E8170
C0/111E:	8F72817E	STA $7E8172
C0/1122:	60      	RTS
 
C0/1123:	48      	PHA			(from C0/104D)
C0/1124:	48      	PHA
C0/1125:	29E0    	AND #$E0
C0/1127:	851A    	STA $1A
C0/1129:	68      	PLA
C0/112A:	2907    	AND #$07
C0/112C:	0A      	ASL A
C0/112D:	0A      	ASL A
C0/112E:	18      	CLC
C0/112F:	6903    	ADC #$03
C0/1131:	051A    	ORA $1A
C0/1133:	8554    	STA $54
C0/1135:	68      	PLA
C0/1136:	2918    	AND #$18
C0/1138:	4A      	LSR A
C0/1139:	4A      	LSR A
C0/113A:	4A      	LSR A
C0/113B:	AA      	TAX
C0/113C:	BF4311C0	LDA $C01143,X
C0/1140:	854B    	STA $4B
C0/1142:	60      	RTS
 
C0/1143:	8182    	
C0/1145:	8484    	

C0/1147:	A97E    	LDA #$7E		(from C0/A60B, C0/A651)
C0/1149:	48      	PHA
C0/114A:	AB      	PLB
C0/114B:	E210    	SEP #$10      	(8 bit index registers)
C0/114D:	A4DF    	LDY $DF
C0/114F:	B90074  	LDA $7400,Y
C0/1152:	291F    	AND #$1F
C0/1154:	C51A    	CMP $1A
C0/1156:	B001    	BCS $1159
C0/1158:	1A      	INC A
C0/1159:	851E    	STA $1E
C0/115B:	B90174  	LDA $7401,Y
C0/115E:	297C    	AND #$7C
C0/1160:	C51B    	CMP $1B
C0/1162:	B002    	BCS $1166
C0/1164:	6904    	ADC #$04
C0/1166:	851F    	STA $1F
C0/1168:	C220    	REP #$20      	(16 bit accum./memory)
C0/116A:	B90074  	LDA $7400,Y
C0/116D:	29E003  	AND #$03E0
C0/1170:	C520    	CMP $20
C0/1172:	B003    	BCS $1177
C0/1174:	692000  	ADC #$0020
C0/1177:	051E    	ORA $1E
C0/1179:	990074  	STA $7400,Y
C0/117C:	7B      	TDC 
C0/117D:	E220    	SEP #$20      	(8 bit accum./memory)
C0/117F:	C8      	INY 
C0/1180:	C8      	INY 
C0/1181:	C4E0    	CPY $E0
C0/1183:	D0CA    	BNE $114F
C0/1185:	C210    	REP #$10      	(16 bit index registers)
C0/1187:	7B      	TDC 
C0/1188:	48      	PHA
C0/1189:	AB      	PLB
C0/118A:	60      	RTS
 
C0/118B:	A97E    	LDA #$7E		(from C0/A61B, C0/A661)
C0/118D:	48      	PHA
C0/118E:	AB      	PLB
C0/118F:	E210    	SEP #$10      	(8 bit index registers)
C0/1191:	A4DF    	LDY $DF
C0/1193:	B90072  	LDA $7200,Y
C0/1196:	291F    	AND #$1F
C0/1198:	851A    	STA $1A
C0/119A:	B90074  	LDA $7400,Y
C0/119D:	291F    	AND #$1F
C0/119F:	C51A    	CMP $1A
C0/11A1:	F001    	BEQ $11A4
C0/11A3:	3A      	DEC A
C0/11A4:	851E    	STA $1E
C0/11A6:	B90172  	LDA $7201,Y
C0/11A9:	297C    	AND #$7C
C0/11AB:	851B    	STA $1B
C0/11AD:	B90174  	LDA $7401,Y
C0/11B0:	297C    	AND #$7C
C0/11B2:	C51B    	CMP $1B
C0/11B4:	F002    	BEQ $11B8
C0/11B6:	E904    	SBC #$04
C0/11B8:	851F    	STA $1F
C0/11BA:	C220    	REP #$20      	(16 bit accum./memory)
C0/11BC:	B90072  	LDA $7200,Y
C0/11BF:	29E003  	AND #$03E0
C0/11C2:	8520    	STA $20
C0/11C4:	B90074  	LDA $7400,Y
C0/11C7:	29E003  	AND #$03E0
C0/11CA:	C520    	CMP $20
C0/11CC:	F003    	BEQ $11D1
C0/11CE:	E92000  	SBC #$0020
C0/11D1:	051E    	ORA $1E
C0/11D3:	990074  	STA $7400,Y
C0/11D6:	7B      	TDC 
C0/11D7:	E220    	SEP #$20      	(8 bit accum./memory)
C0/11D9:	C8      	INY 
C0/11DA:	C8      	INY 
C0/11DB:	C4E0    	CPY $E0
C0/11DD:	D0B4    	BNE $1193
C0/11DF:	C210    	REP #$10      	(16 bit index registers)
C0/11E1:	7B      	TDC 
C0/11E2:	48      	PHA
C0/11E3:	AB      	PLB
C0/11E4:	60      	RTS
 
C0/11E5:	A97E    	LDA #$7E		(from C0/A623, C0/A669)
C0/11E7:	48      	PHA
C0/11E8:	AB      	PLB
C0/11E9:	E210    	SEP #$10      	(8 bit index registers)
C0/11EB:	A4DF    	LDY $DF
C0/11ED:	B90074  	LDA $7400,Y
C0/11F0:	291F    	AND #$1F
C0/11F2:	C51A    	CMP $1A
C0/11F4:	F003    	BEQ $11F9
C0/11F6:	9001    	BCC $11F9
C0/11F8:	3A      	DEC A
C0/11F9:	851E    	STA $1E
C0/11FB:	B90174  	LDA $7401,Y
C0/11FE:	297C    	AND #$7C
C0/1200:	C51B    	CMP $1B
C0/1202:	F004    	BEQ $1208
C0/1204:	9002    	BCC $1208
C0/1206:	E904    	SBC #$04
C0/1208:	851F    	STA $1F
C0/120A:	C220    	REP #$20      	(16 bit accum./memory)
C0/120C:	B90074  	LDA $7400,Y
C0/120F:	29E003  	AND #$03E0
C0/1212:	C520    	CMP $20
C0/1214:	F005    	BEQ $121B
C0/1216:	9003    	BCC $121B
C0/1218:	E92000  	SBC #$0020
C0/121B:	051E    	ORA $1E
C0/121D:	990074  	STA $7400,Y
C0/1220:	7B      	TDC 
C0/1221:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1223:	C8      	INY 
C0/1224:	C8      	INY 
C0/1225:	C4E0    	CPY $E0
C0/1227:	D0C4    	BNE $11ED
C0/1229:	C210    	REP #$10      	(16 bit index registers)
C0/122B:	7B      	TDC 
C0/122C:	48      	PHA
C0/122D:	AB      	PLB
C0/122E:	60      	RTS
 
C0/122F:	A97E    	LDA #$7E		(from C0/A633, C0/A679)
C0/1231:	48      	PHA
C0/1232:	AB      	PLB
C0/1233:	E210    	SEP #$10      	(8 bit index registers)
C0/1235:	A4DF    	LDY $DF
C0/1237:	B90072  	LDA $7200,Y
C0/123A:	291F    	AND #$1F
C0/123C:	851A    	STA $1A
C0/123E:	B90074  	LDA $7400,Y
C0/1241:	291F    	AND #$1F
C0/1243:	C51A    	CMP $1A
C0/1245:	F001    	BEQ $1248
C0/1247:	1A      	INC A
C0/1248:	851E    	STA $1E
C0/124A:	B90172  	LDA $7201,Y
C0/124D:	297C    	AND #$7C
C0/124F:	851B    	STA $1B
C0/1251:	B90174  	LDA $7401,Y
C0/1254:	297C    	AND #$7C
C0/1256:	C51B    	CMP $1B
C0/1258:	F002    	BEQ $125C
C0/125A:	6904    	ADC #$04
C0/125C:	851F    	STA $1F
C0/125E:	C220    	REP #$20      	(16 bit accum./memory)
C0/1260:	B90072  	LDA $7200,Y
C0/1263:	29E003  	AND #$03E0
C0/1266:	8520    	STA $20
C0/1268:	B90074  	LDA $7400,Y
C0/126B:	29E003  	AND #$03E0
C0/126E:	C520    	CMP $20
C0/1270:	F003    	BEQ $1275
C0/1272:	692000  	ADC #$0020
C0/1275:	051E    	ORA $1E
C0/1277:	990074  	STA $7400,Y
C0/127A:	7B      	TDC 
C0/127B:	E220    	SEP #$20      	(8 bit accum./memory)
C0/127D:	C8      	INY 
C0/127E:	C8      	INY 
C0/127F:	C4E0    	CPY $E0
C0/1281:	D0B4    	BNE $1237
C0/1283:	C210    	REP #$10      	(16 bit index registers)
C0/1285:	7B      	TDC 
C0/1286:	48      	PHA
C0/1287:	AB      	PLB
C0/1288:	60      	RTS
 
C0/1289:	A91F    	LDA #$1F		(from C0/A613, C0/A659)
C0/128B:	851A    	STA $1A
C0/128D:	A97C    	LDA #$7C
C0/128F:	851B    	STA $1B
C0/1291:	A2E003  	LDX #$03E0
C0/1294:	8620    	STX $20
C0/1296:	A97E    	LDA #$7E
C0/1298:	48      	PHA
C0/1299:	AB      	PLB
C0/129A:	E210    	SEP #$10      	(8 bit index registers)
C0/129C:	A4DF    	LDY $DF
C0/129E:	B90074  	LDA $7400,Y
C0/12A1:	291F    	AND #$1F
C0/12A3:	18      	CLC
C0/12A4:	651A    	ADC $1A
C0/12A6:	C91F    	CMP #$1F
C0/12A8:	9002    	BCC $12AC
C0/12AA:	A91F    	LDA #$1F
C0/12AC:	851E    	STA $1E
C0/12AE:	B90174  	LDA $7401,Y
C0/12B1:	297C    	AND #$7C
C0/12B3:	18      	CLC
C0/12B4:	651B    	ADC $1B
C0/12B6:	C97C    	CMP #$7C
C0/12B8:	9002    	BCC $12BC
C0/12BA:	A97C    	LDA #$7C
C0/12BC:	851F    	STA $1F
C0/12BE:	C220    	REP #$20      	(16 bit accum./memory)
C0/12C0:	B90074  	LDA $7400,Y
C0/12C3:	29E003  	AND #$03E0
C0/12C6:	18      	CLC
C0/12C7:	6520    	ADC $20
C0/12C9:	C9E003  	CMP #$03E0
C0/12CC:	9003    	BCC $12D1
C0/12CE:	A9E003  	LDA #$03E0
C0/12D1:	051E    	ORA $1E
C0/12D3:	990074  	STA $7400,Y
C0/12D6:	7B      	TDC 
C0/12D7:	E220    	SEP #$20      	(8 bit accum./memory)
C0/12D9:	C8      	INY 
C0/12DA:	C8      	INY 
C0/12DB:	C4E0    	CPY $E0
C0/12DD:	D0BF    	BNE $129E
C0/12DF:	C210    	REP #$10      	(16 bit index registers)
C0/12E1:	7B      	TDC 
C0/12E2:	48      	PHA
C0/12E3:	AB      	PLB
C0/12E4:	60      	RTS
 
C0/12E5:	A51A    	LDA $1A		(from C0/A62B, C0/A671)
C0/12E7:	18      	CLC
C0/12E8:	6904    	ADC #$04
C0/12EA:	851A    	STA $1A
C0/12EC:	A51B    	LDA $1B
C0/12EE:	18      	CLC
C0/12EF:	6910    	ADC #$10
C0/12F1:	851B    	STA $1B
C0/12F3:	C220    	REP #$20      	(16 bit accum./memory)
C0/12F5:	A520    	LDA $20
C0/12F7:	18      	CLC
C0/12F8:	698000  	ADC #$0080
C0/12FB:	8520    	STA $20
C0/12FD:	7B      	TDC 
C0/12FE:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1300:	A97E    	LDA #$7E
C0/1302:	48      	PHA
C0/1303:	AB      	PLB
C0/1304:	E210    	SEP #$10      	(8 bit index registers)
C0/1306:	A4DF    	LDY $DF
C0/1308:	B90074  	LDA $7400,Y
C0/130B:	291F    	AND #$1F
C0/130D:	38      	SEC 
C0/130E:	E51A    	SBC $1A
C0/1310:	1001    	BPL $1313
C0/1312:	7B      	TDC 
C0/1313:	851E    	STA $1E
C0/1315:	B90174  	LDA $7401,Y
C0/1318:	297C    	AND #$7C
C0/131A:	38      	SEC 
C0/131B:	E51B    	SBC $1B
C0/131D:	1001    	BPL $1320
C0/131F:	7B      	TDC 
C0/1320:	851F    	STA $1F
C0/1322:	C220    	REP #$20      	(16 bit accum./memory)
C0/1324:	B90074  	LDA $7400,Y
C0/1327:	29E003  	AND #$03E0
C0/132A:	38      	SEC 
C0/132B:	E520    	SBC $20
C0/132D:	1001    	BPL $1330
C0/132F:	7B      	TDC 
C0/1330:	051E    	ORA $1E
C0/1332:	990074  	STA $7400,Y
C0/1335:	7B      	TDC 
C0/1336:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1338:	C8      	INY 
C0/1339:	C8      	INY 
C0/133A:	C4E0    	CPY $E0
C0/133C:	D0CA    	BNE $1308
C0/133E:	C210    	REP #$10      	(16 bit index registers)
C0/1340:	7B      	TDC 
C0/1341:	48      	PHA
C0/1342:	AB      	PLB
C0/1343:	60      	RTS
 
C0/1344:	A97E    	LDA #$7E
C0/1346:	48      	PHA
C0/1347:	AB      	PLB
C0/1348:	C220    	REP #$20      	(16 bit accum./memory)
C0/134A:	E210    	SEP #$10      	(8 bit index registers)
C0/134C:	A600    	LDX $00
C0/134E:	BD0072  	LDA $7200,X
C0/1351:	9D0074  	STA $7400,X
C0/1354:	BD0272  	LDA $7202,X
C0/1357:	9D0274  	STA $7402,X
C0/135A:	BD0472  	LDA $7204,X
C0/135D:	9D0474  	STA $7404,X
C0/1360:	BD0672  	LDA $7206,X
C0/1363:	9D0674  	STA $7406,X
C0/1366:	BD0872  	LDA $7208,X
C0/1369:	9D0874  	STA $7408,X
C0/136C:	BD0A72  	LDA $720A,X
C0/136F:	9D0A74  	STA $740A,X
C0/1372:	BD0C72  	LDA $720C,X
C0/1375:	9D0C74  	STA $740C,X
C0/1378:	BD0E72  	LDA $720E,X
C0/137B:	9D0E74  	STA $740E,X
C0/137E:	8A      	TXA
C0/137F:	18      	CLC
C0/1380:	691000  	ADC #$0010
C0/1383:	AA      	TAX
C0/1384:	D0C8    	BNE $134E
C0/1386:	7B      	TDC 
C0/1387:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1389:	C210    	REP #$10      	(16 bit index registers)
C0/138B:	7B      	TDC 
C0/138C:	48      	PHA
C0/138D:	AB      	PLB
C0/138E:	60      	RTS
 
C0/138F:	A97E    	LDA #$7E		(from C0/A690, C0/A6D6)
C0/1391:	48      	PHA
C0/1392:	AB      	PLB
C0/1393:	E210    	SEP #$10      	(8 bit index registers)
C0/1395:	A4DF    	LDY $DF
C0/1397:	B90075  	LDA $7500,Y
C0/139A:	291F    	AND #$1F
C0/139C:	C51A    	CMP $1A
C0/139E:	B001    	BCS $13A1
C0/13A0:	1A      	INC A
C0/13A1:	851E    	STA $1E
C0/13A3:	B90175  	LDA $7501,Y
C0/13A6:	297C    	AND #$7C
C0/13A8:	C51B    	CMP $1B
C0/13AA:	B002    	BCS $13AE
C0/13AC:	6904    	ADC #$04
C0/13AE:	851F    	STA $1F
C0/13B0:	C220    	REP #$20      (16 bit accum./memory)
C0/13B2:	B90075  	LDA $7500,Y
C0/13B5:	29E003  	AND #$03E0
C0/13B8:	C520    	CMP $20
C0/13BA:	B003    	BCS $13BF
C0/13BC:	692000  	ADC #$0020
C0/13BF:	051E    	ORA $1E
C0/13C1:	990075  	STA $7500,Y
C0/13C4:	7B      	TDC 
C0/13C5:	E220    	SEP #$20      	(8 bit accum./memory)
C0/13C7:	C8      	INY 
C0/13C8:	C8      	INY 
C0/13C9:	C4E0    	CPY $E0
C0/13CB:	D0CA    	BNE $1397
C0/13CD:	C210    	REP #$10      	(16 bit index registers)
C0/13CF:	7B      	TDC 
C0/13D0:	48      	PHA
C0/13D1:	AB      	PLB
C0/13D2:	60      	RTS
 
C0/13D3:	A97E    	LDA #$7E		(from C0/A6A0, C0/A6E6)
C0/13D5:	48      	PHA
C0/13D6:	AB      	PLB
C0/13D7:	E210    	SEP #$10      	(8 bit index registers)
C0/13D9:	A4DF    	LDY $DF
C0/13DB:	B90073  	LDA $7300,Y
C0/13DE:	291F    	AND #$1F
C0/13E0:	851A    	STA $1A
C0/13E2:	B90075  	LDA $7500,Y
C0/13E5:	291F    	AND #$1F
C0/13E7:	C51A    	CMP $1A
C0/13E9:	F001    	BEQ $13EC
C0/13EB:	3A      	DEC A
C0/13EC:	851E    	STA $1E
C0/13EE:	B90173  	LDA $7301,Y
C0/13F1:	297C    	AND #$7C
C0/13F3:	851B    	STA $1B
C0/13F5:	B90175  	LDA $7501,Y
C0/13F8:	297C    	AND #$7C
C0/13FA:	C51B    	CMP $1B
C0/13FC:	F002    	BEQ $1400
C0/13FE:	E904    	SBC #$04
C0/1400:	851F    	STA $1F
C0/1402:	C220    	REP #$20      	(16 bit accum./memory)
C0/1404:	B90073  	LDA $7300,Y
C0/1407:	29E003  	AND #$03E0
C0/140A:	8520    	STA $20
C0/140C:	B90075  	LDA $7500,Y
C0/140F:	29E003  	AND #$03E0
C0/1412:	C520    	CMP $20
C0/1414:	F003    	BEQ $1419
C0/1416:	E92000  	SBC #$0020
C0/1419:	051E    	ORA $1E
C0/141B:	990075  	STA $7500,Y
C0/141E:	7B      	TDC 
C0/141F:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1421:	C8      	INY 
C0/1422:	C8      	INY 
C0/1423:	C4E0    	CPY $E0
C0/1425:	D0B4    	BNE $13DB
C0/1427:	C210    	REP #$10      	(16 bit index registers)
C0/1429:	7B      	TDC 
C0/142A:	48      	PHA
C0/142B:	AB      	PLB
C0/142C:	60      	RTS
 
C0/142D:	A97E    	LDA #$7E		(from C0/A6A8, C0/A6EE)
C0/142F:	48      	PHA
C0/1430:	AB      	PLB
C0/1431:	E210    	SEP #$10      	(8 bit index registers)
C0/1433:	A4DF    	LDY $DF
C0/1435:	B90075  	LDA $7500,Y
C0/1438:	291F    	AND #$1F
C0/143A:	C51A    	CMP $1A
C0/143C:	F003    	BEQ $1441
C0/143E:	9001    	BCC $1441
C0/1440:	3A      	DEC A
C0/1441:	851E    	STA $1E
C0/1443:	B90175  	LDA $7501,Y
C0/1446:	297C    	AND #$7C
C0/1448:	C51B    	CMP $1B
C0/144A:	F004    	BEQ $1450
C0/144C:	9002    	BCC $1450
C0/144E:	E904    	SBC #$04
C0/1450:	851F    	STA $1F
C0/1452:	C220    	REP #$20      	(16 bit accum./memory)
C0/1454:	B90075  	LDA $7500,Y
C0/1457:	29E003  	AND #$03E0
C0/145A:	C520    	CMP $20
C0/145C:	F005    	BEQ $1463
C0/145E:	9003    	BCC $1463
C0/1460:	E92000  	SBC #$0020
C0/1463:	051E    	ORA $1E
C0/1465:	990075  	STA $7500,Y
C0/1468:	7B      	TDC 
C0/1469:	E220    	SEP #$20      	(8 bit accum./memory)
C0/146B:	C8      	INY 
C0/146C:	C8      	INY 
C0/146D:	C4E0    	CPY $E0
C0/146F:	D0C4    	BNE $1435
C0/1471:	C210    	REP #$10      	(16 bit index registers)
C0/1473:	7B      	TDC 
C0/1474:	48      	PHA
C0/1475:	AB      	PLB
C0/1476:	60      	RTS
 
C0/1477:	A97E    	LDA #$7E		(from C0/A6B8, C0/A6FE)
C0/1479:	48      	PHA	
C0/147A:	AB      	PLB
C0/147B:	E210    	SEP #$10      	(8 bit index registers)
C0/147D:	A4DF    	LDY $DF
C0/147F:	B90073  	LDA $7300,Y
C0/1482:	291F    	AND #$1F
C0/1484:	851A    	STA $1A
C0/1486:	B90075  	LDA $7500,Y
C0/1489:	291F    	AND #$1F
C0/148B:	C51A    	CMP $1A
C0/148D:	F001    	BEQ $1490
C0/148F:	1A      	INC A
C0/1490:	851E    	STA $1E
C0/1492:	B90173  	LDA $7301,Y
C0/1495:	297C    	AND #$7C
C0/1497:	851B    	STA $1B
C0/1499:	B90175  	LDA $7501,Y
C0/149C:	297C    	AND #$7C
C0/149E:	C51B    	CMP $1B
C0/14A0:	F002    	BEQ $14A4
C0/14A2:	6904    	ADC #$04
C0/14A4:	851F    	STA $1F
C0/14A6:	C220    	REP #$20      	(16 bit accum./memory)
C0/14A8:	B90073  	LDA $7300,Y
C0/14AB:	29E003  	AND #$03E0
C0/14AE:	8520    	STA $20
C0/14B0:	B90075  	LDA $7500,Y
C0/14B3:	29E003  	AND #$03E0
C0/14B6:	C520    	CMP $20
C0/14B8:	F003    	BEQ $14BD
C0/14BA:	692000  	ADC #$0020
C0/14BD:	051E    	ORA $1E
C0/14BF:	990075  	STA $7500,Y
C0/14C2:	7B      	TDC 
C0/14C3:	E220    	SEP #$20      	(8 bit accum./memory)
C0/14C5:	C8      	INY 
C0/14C6:	C8      	INY 
C0/14C7:	C4E0    	CPY $E0
C0/14C9:	D0B4    	BNE $147F
C0/14CB:	C210    	REP #$10      	(16 bit index registers)
C0/14CD:	7B      	TDC 
C0/14CE:	48      	PHA
C0/14CF:	AB      	PLB
C0/14D0:	60      	RTS
 
C0/14D1:	A91F    	LDA #$1F		(from C0/A698, C0/A6DE)
C0/14D3:	851A    	STA $1A
C0/14D5:	A97C    	LDA #$7C
C0/14D7:	851B    	STA $1B
C0/14D9:	A2E003  	LDX #$03E0
C0/14DC:	8620    	STX $20
C0/14DE:	A97E    	LDA #$7E
C0/14E0:	48      	PHA
C0/14E1:	AB      	PLB
C0/14E2:	E210    	SEP #$10      	(8 bit index registers)
C0/14E4:	A4DF    	LDY $DF
C0/14E6:	B90075  	LDA $7500,Y
C0/14E9:	291F    	AND #$1F
C0/14EB:	18      	CLC
C0/14EC:	651A    	ADC $1A
C0/14EE:	C91F    	CMP #$1F
C0/14F0:	9002    	BCC $14F4
C0/14F2:	A91F    	LDA #$1F
C0/14F4:	851E    	STA $1E
C0/14F6:	B90175  	LDA $7501,Y
C0/14F9:	297C    	AND #$7C
C0/14FB:	18      	CLC
C0/14FC:	651B    	ADC $1B
C0/14FE:	C97C    	CMP #$7C
C0/1500:	9002    	BCC $1504
C0/1502:	A97C    	LDA #$7C
C0/1504:	851F    	STA $1F
C0/1506:	C220    	REP #$20      	(16 bit accum./memory)
C0/1508:	B90075  	LDA $7500,Y
C0/150B:	29E003  	AND #$03E0
C0/150E:	18      	CLC
C0/150F:	6520    	ADC $20
C0/1511:	C9E003  	CMP #$03E0
C0/1514:	9003    	BCC $1519
C0/1516:	A9E003  	LDA #$03E0
C0/1519:	051E    	ORA $1E
C0/151B:	990075  	STA $7500,Y
C0/151E:	7B      	TDC 
C0/151F:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1521:	C8      	INY 
C0/1522:	C8      	INY 
C0/1523:	C4E0    	CPY $E0
C0/1525:	D0BF    	BNE $14E6
C0/1527:	C210    	REP #$10      	(16 bit index registers)
C0/1529:	7B      	TDC 
C0/152A:	48      	PHA
C0/152B:	AB      	PLB
C0/152C:	60      	RTS
 
C0/152D:	A51A    	LDA $1A		(from C0/A6B0, C0/A6F6)
C0/152F:	18      	CLC
C0/1530:	6904    	ADC #$04
C0/1532:	851A    	STA $1A
C0/1534:	A51B    	LDA $1B
C0/1536:	18      	CLC
C0/1537:	6910    	ADC #$10
C0/1539:	851B    	STA $1B
C0/153B:	C220    	REP #$20      	(16 bit accum./memory)
C0/153D:	A520    	LDA $20
C0/153F:	18      	CLC
C0/1540:	698000  	ADC #$0080
C0/1543:	8520    	STA $20
C0/1545:	7B      	TDC 
C0/1546:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1548:	A97E    	LDA #$7E
C0/154A:	48      	PHA
C0/154B:	AB      	PLB
C0/154C:	E210    	SEP #$10      	(8 bit index registers)
C0/154E:	A4DF    	LDY $DF
C0/1550:	B90075  	LDA $7500,Y
C0/1553:	291F    	AND #$1F
C0/1555:	38      	SEC 
C0/1556:	E51A    	SBC $1A
C0/1558:	1001    	BPL $155B
C0/155A:	7B      	TDC 
C0/155B:	851E    	STA $1E
C0/155D:	B90175  	LDA $7501,Y
C0/1560:	297C    	AND #$7C
C0/1562:	38      	SEC 
C0/1563:	E51B    	SBC $1B
C0/1565:	1001    	BPL $1568
C0/1567:	7B      	TDC 
C0/1568:	851F    	STA $1F
C0/156A:	C220    	REP #$20      	(16 bit accum./memory)
C0/156C:	B90075  	LDA $7500,Y
C0/156F:	29E003  	AND #$03E0
C0/1572:	38      	SEC 
C0/1573:	E520    	SBC $20
C0/1575:	1001    	BPL $1578
C0/1577:	7B      	TDC 
C0/1578:	051E    	ORA $1E
C0/157A:	990075  	STA $7500,Y
C0/157D:	7B      	TDC 
C0/157E:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1580:	C8      	INY 
C0/1581:	C8      	INY 
C0/1582:	C4E0    	CPY $E0
C0/1584:	D0CA    	BNE $1550
C0/1586:	C210    	REP #$10      	(16 bit index registers)
C0/1588:	7B      	TDC 
C0/1589:	48      	PHA
C0/158A:	AB      	PLB
C0/158B:	60      	RTS
 
C0/158C:	A97E    	LDA #$7E		(from C0/A6BD, C0/A703)
C0/158E:	48      	PHA
C0/158F:	AB      	PLB
C0/1590:	C220    	REP #$20      	(16 bit accum./memory)
C0/1592:	E210    	SEP #$10      	(8 bit index registers)
C0/1594:	A600    	LDX $00
C0/1596:	BD0073  	LDA $7300,X
C0/1599:	9D0075  	STA $7500,X
C0/159C:	BD0273  	LDA $7302,X
C0/159F:	9D0275  	STA $7502,X
C0/15A2:	BD0473  	LDA $7304,X
C0/15A5:	9D0475  	STA $7504,X
C0/15A8:	BD0673  	LDA $7306,X
C0/15AB:	9D0675  	STA $7506,X
C0/15AE:	BD0873  	LDA $7308,X
C0/15B1:	9D0875  	STA $7508,X
C0/15B4:	BD0A73  	LDA $730A,X
C0/15B7:	9D0A75  	STA $750A,X
C0/15BA:	BD0C73  	LDA $730C,X
C0/15BD:	9D0C75  	STA $750C,X
C0/15C0:	BD0E73  	LDA $730E,X
C0/15C3:	9D0E75  	STA $750E,X
C0/15C6:	8A      	TXA
C0/15C7:	18      	CLC
C0/15C8:	691000  	ADC #$0010
C0/15CB:	AA      	TAX
C0/15CC:	D0C8    	BNE $1596
C0/15CE:	7B      	TDC 
C0/15CF:	E220    	SEP #$20      (8 bit accum./memory)
C0/15D1:	C210    	REP #$10      (16 bit index registers)
C0/15D3:	7B      	TDC 
C0/15D4:	48      	PHA
C0/15D5:	AB      	PLB
C0/15D6:	60      	RTS
 
C0/15D7:	C220    	REP #$20         ; 16-bit A
C0/15D9:	A582    	LDA $82          ; map ID
C0/15DB:	0A      	ASL A            ; x2
C0/15DC:	AA      	TAX              ; index it
C0/15DD:	BFF682ED	LDA $ED82F6,X    ; next map treasure data pointer
C0/15E1:	851E    	STA $1E          ; save as EOF
C0/15E3:	BFF482ED	LDA $ED82F4,X    ; this map treasure data pointer
C0/15E7:	AA      	TAX              ; index it
C0/15E8:	7B      	TDC              ; zero A/B
C0/15E9:	E220    	SEP #$20         ; 8-bit A
C0/15EB:	E41E    	CPX $1E          ; equal to EOF
C0/15ED:	F048    	BEQ $1637        ; exit if no treasure data
C0/15EF:	C220    	REP #$20         ; 16-bit A
C0/15F1:	BF3486ED	LDA $ED8634,X    ; X-coordinate
C0/15F5:	852A    	STA $2A          ; save ^
C0/15F7:	BF3586ED	LDA $ED8635,X    ; Y-coordinate
C0/15FB:	852B    	STA $2B          ; save ^ (overwrites 2C)
C0/15FD:	DA      	PHX              ; store treasure data index
C0/15FE:	BF3686ED	LDA $ED8636,X    ; event bit and type
C0/1602:	29FF01  	AND #$01FF       ; isolate event bit
C0/1605:	4A      	LSR A            ; / 2
C0/1606:	4A      	LSR A            ; / 4
C0/1607:	4A      	LSR A            ; / 8
C0/1608:	A8      	TAY              ; index event byte
C0/1609:	BF3686ED	LDA $ED8636,X    ; get event bit again
C0/160D:	290700  	AND #$0007       ; isolate "bit" within byte
C0/1610:	AA      	TAX              ; index it
C0/1611:	7B      	TDC              ; zero A/B
C0/1612:	E220    	SEP #$20         ; 8-bit A
C0/1614:	B9401E  	LDA $1E40,Y      ; load treasure byte
C0/1617:	3FFCBAC0	AND $C0BAFC,X    ; check whether bit is set
C0/161B:	F010    	BEQ $162D        ; branch if not ^
C0/161D:	A62A    	LDX $2A          ; coordinates
C0/161F:	BF00007F	LDA $7F0000,X    ; map data at coordinates
C0/1623:	C913    	CMP #$13         ; check for "treasure chest" tile
C0/1625:	D006    	BNE $162D        ; branch if not ^
C0/1627:	A912    	LDA #$12         ; load "opened chest" tile
C0/1629:	9F00007F	STA $7F0000,X    ; replace tile

C0/162D:	FA      	PLX              ; restore treasure data index
C0/162E:	E8      	INX
C0/162F:	E8      	INX
C0/1630:	E8      	INX
C0/1631:	E8      	INX
C0/1632:	E8      	INX              ; point to next treasure
C0/1633:	E41E    	CPX $1E          ; at end of treasures
C0/1635:	D0B8    	BNE $15EF        ; loop till done
C0/1637:	60      	RTS
 
C0/1638:	AD4005  	LDA $0540		(from C0/BF58)
C0/163B:	0A      	ASL A
C0/163C:	18      	CLC
C0/163D:	6D4005  	ADC $0540
C0/1640:	AA      	TAX
C0/1641:	BF00FEC0	LDA $C0FE00,X
C0/1645:	854F    	STA $4F
C0/1647:	A922    	LDA #$22
C0/1649:	8550    	STA $50
C0/164B:	A54B    	LDA $4B
C0/164D:	D004    	BNE $1653
C0/164F:	A54F    	LDA $4F
C0/1651:	854E    	STA $4E
C0/1653:	BF01FEC0	LDA $C0FE01,X
C0/1657:	0901    	ORA #$01
C0/1659:	8551    	STA $51
C0/165B:	BF02FEC0	LDA $C0FE02,X
C0/165F:	8553    	STA $53
C0/1661:	8D2D21  	STA $212D
C0/1664:	A54B    	LDA $4B
C0/1666:	D004    	BNE $166C
C0/1668:	A553    	LDA $53
C0/166A:	8552    	STA $52
C0/166C:	60      	RTS
 
C0/166D:	AD3605  	LDA $0536		(from C0/BF14)
C0/1670:	0A      	ASL A
C0/1671:	0A      	ASL A
C0/1672:	0A      	ASL A
C0/1673:	AA      	TAX
C0/1674:	BF40FEC0	LDA $C0FE40,X
C0/1678:	300E    	BMI $1688
C0/167A:	C220    	REP #$20      	(16 bit accum./memory)
C0/167C:	0A      	ASL A
C0/167D:	0A      	ASL A
C0/167E:	0A      	ASL A
C0/167F:	0A      	ASL A
C0/1680:	8D4B05  	STA $054B
C0/1683:	7B      	TDC 
C0/1684:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1686:	8012    	BRA $169A
C0/1688:	4502    	EOR $02
C0/168A:	1A      	INC A
C0/168B:	C220    	REP #$20      	(16 bit accum./memory)
C0/168D:	0A      	ASL A
C0/168E:	0A      	ASL A
C0/168F:	0A      	ASL A
C0/1690:	0A      	ASL A
C0/1691:	4502    	EOR $02
C0/1693:	1A      	INC A
C0/1694:	8D4B05  	STA $054B
C0/1697:	7B      	TDC 
C0/1698:	E220    	SEP #$20      	(8 bit accum./memory)
C0/169A:	BF41FEC0	LDA $C0FE41,X
C0/169E:	300E    	BMI $16AE
C0/16A0:	C220    	REP #$20      	(16 bit accum./memory)
C0/16A2:	0A      	ASL A
C0/16A3:	0A      	ASL A
C0/16A4:	0A      	ASL A
C0/16A5:	0A      	ASL A
C0/16A6:	8D4D05  	STA $054D
C0/16A9:	7B      	TDC 
C0/16AA:	E220    	SEP #$20      	(8 bit accum./memory)
C0/16AC:	8012    	BRA $16C0
C0/16AE:	4502    	EOR $02
C0/16B0:	1A      	INC A
C0/16B1:	C220    	REP #$20      	(16 bit accum./memory)
C0/16B3:	0A      	ASL A
C0/16B4:	0A      	ASL A
C0/16B5:	0A      	ASL A
C0/16B6:	0A      	ASL A
C0/16B7:	4502    	EOR $02
C0/16B9:	1A      	INC A
C0/16BA:	8D4D05  	STA $054D
C0/16BD:	7B      	TDC 
C0/16BE:	E220    	SEP #$20      	(8 bit accum./memory)
C0/16C0:	BF42FEC0	LDA $C0FE42,X
C0/16C4:	300E    	BMI $16D4
C0/16C6:	C220    	REP #$20      	(16 bit accum./memory)
C0/16C8:	0A      	ASL A
C0/16C9:	0A      	ASL A
C0/16CA:	0A      	ASL A
C0/16CB:	0A      	ASL A
C0/16CC:	8D4F05  	STA $054F
C0/16CF:	7B      	TDC 
C0/16D0:	E220    	SEP #$20      	(8 bit accum./memory)
C0/16D2:	8012    	BRA $16E6
C0/16D4:	4502    	EOR $02
C0/16D6:	1A      	INC A
C0/16D7:	C220    	REP #$20      	(16 bit accum./memory)
C0/16D9:	0A      	ASL A
C0/16DA:	0A      	ASL A
C0/16DB:	0A      	ASL A
C0/16DC:	0A      	ASL A
C0/16DD:	4502    	EOR $02
C0/16DF:	1A      	INC A
C0/16E0:	8D4F05  	STA $054F
C0/16E3:	7B      	TDC 
C0/16E4:	E220    	SEP #$20      	(8 bit accum./memory)
C0/16E6:	BF43FEC0	LDA $C0FE43,X
C0/16EA:	300E    	BMI $16FA
C0/16EC:	C220    	REP #$20      	(16 bit accum./memory)
C0/16EE:	0A      	ASL A
C0/16EF:	0A      	ASL A
C0/16F0:	0A      	ASL A
C0/16F1:	0A      	ASL A
C0/16F2:	8D5105  	STA $0551
C0/16F5:	7B      	TDC 
C0/16F6:	E220    	SEP #$20      	(8 bit accum./memory)
C0/16F8:	8012    	BRA $170C
C0/16FA:	4502    	EOR $02
C0/16FC:	1A      	INC A
C0/16FD:	C220    	REP #$20      	(16 bit accum./memory)
C0/16FF:	0A      	ASL A
C0/1700:	0A      	ASL A
C0/1701:	0A      	ASL A
C0/1702:	0A      	ASL A
C0/1703:	4502    	EOR $02
C0/1705:	1A      	INC A
C0/1706:	8D5105  	STA $0551
C0/1709:	7B      	TDC 
C0/170A:	E220    	SEP #$20      	(8 bit accum./memory)
C0/170C:	BF44FEC0	LDA $C0FE44,X
C0/1710:	8D5305  	STA $0553
C0/1713:	BF45FEC0	LDA $C0FE45,X
C0/1717:	8D5405  	STA $0554
C0/171A:	BF46FEC0	LDA $C0FE46,X
C0/171E:	8D5505  	STA $0555
C0/1721:	BF47FEC0	LDA $C0FE47,X
C0/1725:	8D5605  	STA $0556
C0/1728:	60      	RTS
 
C0/1729:	A600    	LDX $00		(from C0/BF05)
C0/172B:	865B    	STX $5B
C0/172D:	865D    	STX $5D
C0/172F:	865F    	STX $5F
C0/1731:	8661    	STX $61
C0/1733:	8663    	STX $63
C0/1735:	8665    	STX $65
C0/1737:	8667    	STX $67
C0/1739:	8669    	STX $69
C0/173B:	866B    	STX $6B
C0/173D:	866D    	STX $6D
C0/173F:	866F    	STX $6F
C0/1741:	8671    	STX $71
C0/1743:	8673    	STX $73
C0/1745:	8675    	STX $75
C0/1747:	8677    	STX $77
C0/1749:	8679    	STX $79
C0/174B:	867B    	STX $7B
C0/174D:	867D    	STX $7D
C0/174F:	8E4705  	STX $0547
C0/1752:	8E4905  	STX $0549
C0/1755:	8E4B05  	STX $054B
C0/1758:	8E4D05  	STX $054D
C0/175B:	8E4F05  	STX $054F
C0/175E:	8E5105  	STX $0551
C0/1761:	9C8605  	STZ $0586
C0/1764:	9C8505  	STZ $0585
C0/1767:	9C8805  	STZ $0588
C0/176A:	9C8705  	STZ $0587
C0/176D:	9C8A05  	STZ $058A
C0/1770:	9C8905  	STZ $0589
C0/1773:	20E717  	JSR $17E7
C0/1776:	207F17  	JSR $177F      (JMP fool!)
C0/1779:	60      	RTS
 
C0/177A:	0F
C0/177B:	1F
C0/177C:	3F
C0/177D:	7F	
C0/177E:	FF

C0/177F:	AE		NOP			(from C0/1776, C0/BEEA)
C0/1780:	C01F		CPY #$1F
C0/1782:	8E661F  	STX $1F66
C0/1785:	AE3E05  	LDX $053E
C0/1788:	D010    	BNE $179A
C0/178A:	9C2C06  	STZ $062C
C0/178D:	9C2E06  	STZ $062E        
C0/1790:	A9FF    	LDA #$FF
C0/1792:	8D2D06  	STA $062D
C0/1795:	8D2F06  	STA $062F
C0/1798:	801C    	BRA $17B6
C0/179A:	A908    	LDA #$08
C0/179C:	8D2C06  	STA $062C
C0/179F:	AD3E05  	LDA $053E
C0/17A2:	38      	SEC 
C0/17A3:	E907    	SBC #$07
C0/17A5:	8D2D06  	STA $062D
C0/17A8:	A907    	LDA #$07
C0/17AA:	8D2E06  	STA $062E       
C0/17AD:	AD3F05  	LDA $053F
C0/17B0:	38      	SEC 
C0/17B1:	E907    	SBC #$07
C0/17B3:	8D2F06  	STA $062F
C0/17B6:	AD2C06  	LDA $062C
C0/17B9:	CD661F  	CMP $1F66
C0/17BC:	9005    	BCC $17C3
C0/17BE:	8D661F  	STA $1F66
C0/17C1:	800B    	BRA $17CE
C0/17C3:	AD2D06  	LDA $062D
C0/17C6:	CD661F  	CMP $1F66
C0/17C9:	B003    	BCS $17CE
C0/17CB:	8D661F  	STA $1F66
C0/17CE:	AD2E06  	LDA $062E       
C0/17D1:	CD671F  	CMP $1F67
C0/17D4:	9005    	BCC $17DB
C0/17D6:	8D671F  	STA $1F67
C0/17D9:	800B    	BRA $17E6
C0/17DB:	AD2F06  	LDA $062F
C0/17DE:	CD671F  	CMP $1F67
C0/17E1:	B003    	BCS $17E6
C0/17E3:	8D671F  	STA $1F67
C0/17E6:	60      	RTS
 
C0/17E7:	AD3705  	LDA $0537		(from C0/1773)
C0/17EA:	2903    	AND #$03
C0/17EC:	AA      	TAX
C0/17ED:	BF7A17C0	LDA $C0177A,X
C0/17F1:	8589    	STA $89
C0/17F3:	AD3705  	LDA $0537
C0/17F6:	4A      	LSR A
C0/17F7:	4A      	LSR A
C0/17F8:	2903    	AND #$03
C0/17FA:	AA      	TAX
C0/17FB:	BF7A17C0	LDA $C0177A,X
C0/17FF:	8588    	STA $88
C0/1801:	AD3705  	LDA $0537
C0/1804:	4A      	LSR A
C0/1805:	4A      	LSR A
C0/1806:	4A      	LSR A
C0/1807:	4A      	LSR A
C0/1808:	2903    	AND #$03
C0/180A:	AA      	TAX
C0/180B:	BF7A17C0	LDA $C0177A,X
C0/180F:	8587    	STA $87
C0/1811:	AD3705  	LDA $0537
C0/1814:	4A      	LSR A
C0/1815:	4A      	LSR A
C0/1816:	4A      	LSR A
C0/1817:	4A      	LSR A
C0/1818:	4A      	LSR A
C0/1819:	4A      	LSR A
C0/181A:	AA      	TAX
C0/181B:	BF7A17C0	LDA $C0177A,X
C0/181F:	8586    	STA $86
C0/1821:	AD3805  	LDA $0538
C0/1824:	4A      	LSR A
C0/1825:	4A      	LSR A
C0/1826:	4A      	LSR A
C0/1827:	4A      	LSR A
C0/1828:	2903    	AND #$03
C0/182A:	AA      	TAX
C0/182B:	BF7A17C0	LDA $C0177A,X
C0/182F:	858B    	STA $8B
C0/1831:	AD3805  	LDA $0538
C0/1834:	4A      	LSR A
C0/1835:	4A      	LSR A
C0/1836:	4A      	LSR A
C0/1837:	4A      	LSR A
C0/1838:	4A      	LSR A
C0/1839:	4A      	LSR A
C0/183A:	AA      	TAX
C0/183B:	BF7A17C0	LDA $C0177A,X
C0/183F:	858A    	STA $8A
C0/1841:	AD3805  	LDA $0538
C0/1844:	2901    	AND #$01
C0/1846:	8D9105  	STA $0591
C0/1849:	AD3805  	LDA $0538
C0/184C:	4A      	LSR A
C0/184D:	2901    	AND #$01
C0/184F:	8D9205  	STA $0592
C0/1852:	AD3805  	LDA $0538
C0/1855:	4A      	LSR A
C0/1856:	2901    	AND #$01
C0/1858:	8D9305  	STA $0593
C0/185B:	60      	RTS
 
C0/185C:	AD4205  	LDA $0542		(from C0/BF79)
C0/185F:	38      	SEC 
C0/1860:	E90F    	SBC #$0F
C0/1862:	8D4205  	STA $0542
C0/1865:	AD4405  	LDA $0544
C0/1868:	38      	SEC 
C0/1869:	E90F    	SBC #$0F
C0/186B:	8D4405  	STA $0544
C0/186E:	AD4605  	LDA $0546
C0/1871:	38      	SEC 
C0/1872:	E90F    	SBC #$0F
C0/1874:	8D4605  	STA $0546
C0/1877:	A910    	LDA #$10
C0/1879:	48      	PHA
C0/187A:	205D21  	JSR $215D
C0/187D:	20472A  	JSR $2A47
C0/1880:	20D822  	JSR $22D8
C0/1883:	20CA2A  	JSR $2ACA
C0/1886:	205724  	JSR $2457
C0/1889:	204D2B  	JSR $2B4D
C0/188C:	EE4205  	INC $0542
C0/188F:	EE4405  	INC $0544
C0/1892:	EE4605  	INC $0546
C0/1895:	68      	PLA
C0/1896:	3A      	DEC A
C0/1897:	D0E0    	BNE $1879
C0/1899:	CE4205  	DEC $0542
C0/189C:	CE4405  	DEC $0544
C0/189F:	CE4605  	DEC $0546
C0/18A2:	60      	RTS
 
C0/18A3:	A584    	LDA $84		(from C0/00E5)
C0/18A5:	D03C    	BNE $18E3
C0/18A7:	A559    	LDA $59
C0/18A9:	D038    	BNE $18E3
C0/18AB:	A585    	LDA $85
C0/18AD:	D034    	BNE $18E3
C0/18AF:	A556    	LDA $56
C0/18B1:	D030    	BNE $18E3
C0/18B3:	AC0308  	LDY $0803
C0/18B6:	B96A08  	LDA $086A,Y
C0/18B9:	290F    	AND #$0F
C0/18BB:	D026    	BNE $18E3
C0/18BD:	B96D08  	LDA $086D,Y
C0/18C0:	290F    	AND #$0F
C0/18C2:	D01F    	BNE $18E3
C0/18C4:	A6E5    	LDX $E5
C0/18C6:	E00000  	CPX #$0000
C0/18C9:	D018    	BNE $18E3
C0/18CB:	A5E7    	LDA $E7
C0/18CD:	C9CA    	CMP #$CA
C0/18CF:	D012    	BNE $18E3
C0/18D1:	A5B8    	LDA $B8
C0/18D3:	2904    	AND #$04
C0/18D5:	F006    	BEQ $18DD
C0/18D7:	A5B2    	LDA $B2
C0/18D9:	C901    	CMP #$01
C0/18DB:	D006    	BNE $18E3
C0/18DD:	20E418  	JSR $18E4
C0/18E0:	20771A  	JSR $1A77
C0/18E3:	60      	RTS
 
C0/18E4:	C220    	REP #$20      	(16 bit accum./memory)
C0/18E6:	A582    	LDA $82
C0/18E8:	0A      	ASL A
C0/18E9:	AA      	TAX
C0/18EA:	BF82F4ED	LDA $EDF482,X
C0/18EE:	851E    	STA $1E
C0/18F0:	BF80F4ED	LDA $EDF480,X
C0/18F4:	AA      	TAX
C0/18F5:	C51E    	CMP $1E
C0/18F7:	D003    	BNE $18FC
C0/18F9:	4C261A  	JMP $1A26
C0/18FC:	7B      	TDC 
C0/18FD:	E220    	SEP #$20      	(8 bit accum./memory)
C0/18FF:	6426    	STZ $26
C0/1901:	6428    	STZ $28
C0/1903:	BF82F4ED	LDA $EDF482,X
C0/1907:	3022    	BMI $192B
C0/1909:	851A    	STA $1A
C0/190B:	BF81F4ED	LDA $EDF481,X
C0/190F:	C5B0    	CMP $B0
C0/1911:	D03A    	BNE $194D
C0/1913:	A5AF    	LDA $AF
C0/1915:	38      	SEC 
C0/1916:	FF80F4ED	SBC $EDF480,X
C0/191A:	9031    	BCC $194D
C0/191C:	8526    	STA $26
C0/191E:	BF80F4ED	LDA $EDF480,X
C0/1922:	18      	CLC
C0/1923:	651A    	ADC $1A
C0/1925:	C5AF    	CMP $AF
C0/1927:	B033    	BCS $195C
C0/1929:	8022    	BRA $194D
C0/192B:	297F    	AND #$7F
C0/192D:	851A    	STA $1A
C0/192F:	BF80F4ED	LDA $EDF480,X
C0/1933:	C5AF    	CMP $AF
C0/1935:	D016    	BNE $194D
C0/1937:	A5B0    	LDA $B0
C0/1939:	38      	SEC 
C0/193A:	FF81F4ED	SBC $EDF481,X
C0/193E:	900D    	BCC $194D
C0/1940:	8528    	STA $28
C0/1942:	BF81F4ED	LDA $EDF481,X
C0/1946:	18      	CLC
C0/1947:	651A    	ADC $1A
C0/1949:	C5B0    	CMP $B0
C0/194B:	B00F    	BCS $195C
C0/194D:	C221    	REP #$21
C0/194F:	8A      	TXA
C0/1950:	690700  	ADC #$0007
C0/1953:	AA      	TAX
C0/1954:	7B      	TDC 
C0/1955:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1957:	E41E    	CPX $1E
C0/1959:	D0A4    	BNE $18FF
C0/195B:	60      	RTS
 
C0/195C:	A901    	LDA #$01
C0/195E:	8D8E07  	STA $078E
C0/1961:	C220    	REP #$20      	(16 bit accum./memory)
C0/1963:	BF83F4ED	LDA $EDF483,X
C0/1967:	290002  	AND #$0200
C0/196A:	F003    	BEQ $196F
C0/196C:	202A1A  	JSR $1A2A
C0/196F:	BF83F4ED	LDA $EDF483,X
C0/1973:	29FF01  	AND #$01FF
C0/1976:	C9FF01  	CMP #$01FF
C0/1979:	F065    	BEQ $19E0
C0/197B:	BF83F4ED	LDA $EDF483,X
C0/197F:	8D641F  	STA $1F64
C0/1982:	29FF01  	AND #$01FF
C0/1985:	C90300  	CMP #$0003
C0/1988:	B015    	BCS $199F
C0/198A:	BF85F4ED	LDA $EDF485,X
C0/198E:	8D601F  	STA $1F60
C0/1991:	7B      	TDC 
C0/1992:	E220    	SEP #$20      	(8 bit accum./memory)
C0/1994:	A901    	LDA #$01
C0/1996:	8584    	STA $84
C0/1998:	20886E  	JSR $6E88
C0/199B:	20560F  	JSR $0F56
C0/199E:	60      	RTS
 
C0/199F:	BF85F4ED	LDA $EDF485,X
C0/19A3:	8DC01F  	STA $1FC0
C0/19A6:	7B      	TDC 
C0/19A7:	E220    	SEP #$20      	(8 bit accum./memory)
C0/19A9:	BF84F4ED	LDA $EDF484,X
C0/19AD:	2930    	AND #$30
C0/19AF:	4A      	LSR A
C0/19B0:	4A      	LSR A
C0/19B1:	4A      	LSR A
C0/19B2:	4A      	LSR A
C0/19B3:	8D4307  	STA $0743
C0/19B6:	BF84F4ED	LDA $EDF484,X
C0/19BA:	2908    	AND #$08
C0/19BC:	8D4507  	STA $0745      (set location name to appear when map loads)
C0/19BF:	A901    	LDA #$01
C0/19C1:	8D4407  	STA $0744
C0/19C4:	BF84F4ED	LDA $EDF484,X
C0/19C8:	2904    	AND #$04
C0/19CA:	F004    	BEQ $19D0
C0/19CC:	4A      	LSR A
C0/19CD:	8D4407  	STA $0744
C0/19D0:	A901    	LDA #$01
C0/19D2:	8584    	STA $84
C0/19D4:	20886E  	JSR $6E88
C0/19D7:	20560F  	JSR $0F56
C0/19DA:	A980    	LDA #$80
C0/19DC:	8DFA11  	STA $11FA
C0/19DF:	60      	RTS
 
C0/19E0:	20461A  	JSR $1A46      (you should only be here if map loaded was $1FFF)
C0/19E3:	C220    	REP #$20      (16 bit accum./memory)
C0/19E5:	BF83F4ED	LDA $EDF483,X
C0/19E9:	2900FE  	AND #$FE00
C0/19EC:	0D691F  	ORA $1F69      (add in bits from parent map)
C0/19EF:	8D641F  	STA $1F64      (set as current map with flags set)
C0/19F2:	7B      	TDC 
C0/19F3:	E220    	SEP #$20      (8 bit accum./memory)
C0/19F5:	AE691F  	LDX $1F69
C0/19F8:	E00300  	CPX #$0003     (is parent map darkness (or greater)?)
C0/19FB:	B011    	BCS $1A0E      (branch if so)
C0/19FD:	AC6B1F  	LDY $1F6B      (load position to be on when loading parent map)
C0/1A00:	8C601F  	STY $1F60      (set as current position)
C0/1A03:	A901    	LDA #$01
C0/1A05:	8584    	STA $84
C0/1A07:	20886E  	JSR $6E88
C0/1A0A:	20560F  	JSR $0F56      (JMP fool!)
C0/1A0D:	60      	RTS
 
C0/1A0E:	AD681F  	LDA $1F68
C0/1A11:	8D4307  	STA $0743
C0/1A14:	BF84F4ED	LDA $EDF484,X
C0/1A18:	2908    	AND #$08
C0/1A1A:	8D4507  	STA $0745      (set location name to appear when map loads)
C0/1A1D:	20560F  	JSR $0F56
C0/1A20:	A980    	LDA #$80
C0/1A22:	8DFA11  	STA $11FA
C0/1A25:	60      	RTS
 
C0/1A26:	7B      	TDC 
C0/1A27:	E220    	SEP #$20      (8 bit accum./memory)
C0/1A29:	60      	RTS
 
C0/1A2A:	C220    	REP #$20      (16 bit accum./memory)
C0/1A2C:	A582    	LDA $82
C0/1A2E:	29FF01  	AND #$01FF
C0/1A31:	8D691F  	STA $1F69      (save as parent map)
C0/1A34:	A5AF    	LDA $AF
C0/1A36:	8D6B1F  	STA $1F6B      (save as position to be on when loading parent map)
C0/1A39:	7B      	TDC 
C0/1A3A:	E220    	SEP #$20      (8 bit accum./memory)
C0/1A3C:	AC0308  	LDY $0803
C0/1A3F:	B97E08  	LDA $087E,Y
C0/1A42:	8DD21F  	STA $1FD2
C0/1A45:	60      	RTS
 
C0/1A46:	DA      	PHX
C0/1A47:	7B      	TDC 
C0/1A48:	E220    	SEP #$20      (8 bit accum./memory)
C0/1A4A:	ADD21F  	LDA $1FD2      ; parent facing direction
C0/1A4D:	2903    	AND #$03
C0/1A4F:	4902    	EOR #$02       ; invert direction
C0/1A51:	AA      	TAX
C0/1A52:	4980    	EOR #$80
C0/1A54:	8D681F  	STA $1F68
C0/1A57:	AD6B1F  	LDA $1F6B
C0/1A5A:	18      	CLC
C0/1A5B:	7F6F1AC0	ADC $C01A6F,X  (+/- 1 to the X position, I think)
C0/1A5F:	8D6B1F  	STA $1F6B      (save as X position to be on when loading parent map)
C0/1A62:	AD6C1F  	LDA $1F6C
C0/1A65:	18      	CLC
C0/1A66:	7F731AC0	ADC $C01A73,X  (+/- 1 to the Y position, I think)
C0/1A6A:	8D6C1F  	STA $1F6C      (save as Y position to be on when loading parent map)
C0/1A6D:	FA      	PLX
C0/1A6E:	60      	RTS
 
C0/1A6F:	0001
C0/1A71:	00FF 

C0/1A73:	FF000100	SBC $000100,X
C0/1A77:	C220    	REP #$20      (16 bit accum./memory)
C0/1A79:	A582    	LDA $82
C0/1A7B:	0A      	ASL A
C0/1A7C:	AA      	TAX
C0/1A7D:	BF02BBDF	LDA $DFBB02,X	(Pointer to entrance triggers)
C0/1A81:	851E    	STA $1E
C0/1A83:	BF00BBDF	LDA $DFBB00,X
C0/1A87:	AA      	TAX
C0/1A88:	C51E    	CMP $1E
C0/1A8A:	D003    	BNE $1A8F
C0/1A8C:	4C771B  	JMP $1B77

C0/1A8F:	BF00BBDF	LDA $DFBB00,X
C0/1A93:	C5AF    	CMP $AF
C0/1A95:	F00D    	BEQ $1AA4
C0/1A97:	8A      	TXA
C0/1A98:	18      	CLC
C0/1A99:	690600  	ADC #$0006
C0/1A9C:	AA      	TAX
C0/1A9D:	E41E    	CPX $1E
C0/1A9F:	D0EE    	BNE $1A8F
C0/1AA1:	4C771B  	JMP $1B77

C0/1AA4:	A90100  	LDA #$0001
C0/1AA7:	8D8E07  	STA $078E
C0/1AAA:	BF02BBDF	LDA $DFBB02,X
C0/1AAE:	290002  	AND #$0200
C0/1AB1:	F003    	BEQ $1AB6
C0/1AB3:	202A1A  	JSR $1A2A
C0/1AB6:	BF02BBDF	LDA $DFBB02,X
C0/1ABA:	29FF01  	AND #$01FF
C0/1ABD:	C9FF01  	CMP #$01FF
C0/1AC0:	F065    	BEQ $1B27
C0/1AC2:	BF02BBDF	LDA $DFBB02,X
C0/1AC6:	8D641F  	STA $1F64
C0/1AC9:	29FF01  	AND #$01FF
C0/1ACC:	C90300  	CMP #$0003
C0/1ACF:	B015    	BCS $1AE6
C0/1AD1:	BF04BBDF	LDA $DFBB04,X
C0/1AD5:	8D601F  	STA $1F60
C0/1AD8:	7B      	TDC 
C0/1AD9:	E220    	SEP #$20      (8 bit accum./memory)
C0/1ADB:	A901    	LDA #$01
C0/1ADD:	8584    	STA $84
C0/1ADF:	20886E  	JSR $6E88
C0/1AE2:	20560F  	JSR $0F56      (JMP fool!)
C0/1AE5:	60      	RTS
 
C0/1AE6:	BF04BBDF	LDA $DFBB04,X
C0/1AEA:	8DC01F  	STA $1FC0
C0/1AED:	7B      	TDC 
C0/1AEE:	E220    	SEP #$20      (8 bit accum./memory)
C0/1AF0:	BF03BBDF	LDA $DFBB03,X
C0/1AF4:	4A      	LSR A
C0/1AF5:	4A      	LSR A
C0/1AF6:	4A      	LSR A
C0/1AF7:	4A      	LSR A
C0/1AF8:	2903    	AND #$03
C0/1AFA:	8D4307  	STA $0743
C0/1AFD:	BF03BBDF	LDA $DFBB03,X
C0/1B01:	2908    	AND #$08
C0/1B03:	8D4507  	STA $0745      (set location name to appear when map loads)
C0/1B06:	A901    	LDA #$01
C0/1B08:	8D4407  	STA $0744
C0/1B0B:	BF03BBDF	LDA $DFBB03,X
C0/1B0F:	2904    	AND #$04
C0/1B11:	F004    	BEQ $1B17
C0/1B13:	4A      	LSR A
C0/1B14:	8D4407  	STA $0744
C0/1B17:	20560F  	JSR $0F56
C0/1B1A:	A980    	LDA #$80
C0/1B1C:	8DFA11  	STA $11FA
C0/1B1F:	A901    	LDA #$01
C0/1B21:	8584    	STA $84
C0/1B23:	20886E  	JSR $6E88      (JMP fool!)
C0/1B26:	60      	RTS
 
C0/1B27:	20461A  	JSR $1A46
C0/1B2A:	C220    	REP #$20      (16 bit accum./memory)
C0/1B2C:	BF02BBDF	LDA $DFBB02,X
C0/1B30:	2900FE  	AND #$FE00
C0/1B33:	0D691F  	ORA $1F69      (add in bits from the parent map)
C0/1B36:	8D641F  	STA $1F64      (set as the current map, flags and all)
C0/1B39:	7B      	TDC 
C0/1B3A:	E220    	SEP #$20      (8 bit accum./memory)
C0/1B3C:	AE691F  	LDX $1F69      (parent map)
C0/1B3F:	E00300  	CPX #$0003     (is parent map darkness or greater?)
C0/1B42:	B00E    	BCS $1B52      (branch if so)
C0/1B44:	AC6B1F  	LDY $1F6B
C0/1B47:	8C601F  	STY $1F60
C0/1B4A:	A901    	LDA #$01
C0/1B4C:	8584    	STA $84
C0/1B4E:	20560F  	JSR $0F56      (JMP fool!)
C0/1B51:	60      	RTS
 
C0/1B52:	AD681F  	LDA $1F68
C0/1B55:	8D4307  	STA $0743
C0/1B58:	AC6B1F  	LDY $1F6B
C0/1B5B:	8C661F  	STY $1F66
C0/1B5E:	BF03BBDF	LDA $DFBB03,X
C0/1B62:	2908    	AND #$08
C0/1B64:	8D4507  	STA $0745      (set location name to appear when map loads)
C0/1B67:	A980    	LDA #$80
C0/1B69:	8DFA11  	STA $11FA
C0/1B6C:	A901    	LDA #$01
C0/1B6E:	8584    	STA $84
C0/1B70:	20560F  	JSR $0F56
C0/1B73:	20886E  	JSR $6E88      (JMP fool!)
C0/1B76:	60      	RTS
 
C0/1B77:	7B      	TDC 
C0/1B78:	E220    	SEP #$20      (8 bit accum./memory)
C0/1B7A:	60      	RTS
 
C0/1B7B:	C220    	REP #$20      (from C0/BF76)(16 bit accum./memory)
C0/1B7D:	AD4105  	LDA $0541
C0/1B80:	29FF00  	AND #$00FF
C0/1B83:	38      	SEC 
C0/1B84:	E90700  	SBC #$0007
C0/1B87:	0A      	ASL A
C0/1B88:	0A      	ASL A
C0/1B89:	0A      	ASL A
C0/1B8A:	0A      	ASL A
C0/1B8B:	855C    	STA $5C
C0/1B8D:	AD4205  	LDA $0542
C0/1B90:	29FF00  	AND #$00FF
C0/1B93:	38      	SEC 
C0/1B94:	E90700  	SBC #$0007
C0/1B97:	0A      	ASL A
C0/1B98:	0A      	ASL A
C0/1B99:	0A      	ASL A
C0/1B9A:	0A      	ASL A
C0/1B9B:	8560    	STA $60
C0/1B9D:	7B      	TDC 
C0/1B9E:	E220    	SEP #$20      (8 bit accum./memory)
C0/1BA0:	AD5305  	LDA $0553
C0/1BA3:	8D0242  	STA $4202
C0/1BA6:	AD4105  	LDA $0541
C0/1BA9:	8D0342  	STA $4203
C0/1BAC:	A588    	LDA $88
C0/1BAE:	C220    	REP #$20      (16 bit accum./memory)
C0/1BB0:	0A      	ASL A
C0/1BB1:	0A      	ASL A
C0/1BB2:	0A      	ASL A
C0/1BB3:	0A      	ASL A
C0/1BB4:	090F00  	ORA #$000F
C0/1BB7:	851E    	STA $1E
C0/1BB9:	AD3205  	LDA $0532
C0/1BBC:	29FF00  	AND #$00FF
C0/1BBF:	0A      	ASL A
C0/1BC0:	0A      	ASL A
C0/1BC1:	0A      	ASL A
C0/1BC2:	0A      	ASL A
C0/1BC3:	18      	CLC
C0/1BC4:	6D1642  	ADC $4216
C0/1BC7:	8520    	STA $20
C0/1BC9:	4A      	LSR A
C0/1BCA:	4A      	LSR A
C0/1BCB:	4A      	LSR A
C0/1BCC:	4A      	LSR A
C0/1BCD:	E220    	SEP #$20      (8 bit accum./memory)
C0/1BCF:	2588    	AND $88
C0/1BD1:	8D4305  	STA $0543
C0/1BD4:	C220    	REP #$20      (16 bit accum./memory)
C0/1BD6:	A520    	LDA $20
C0/1BD8:	38      	SEC 
C0/1BD9:	E97000  	SBC #$0070
C0/1BDC:	251E    	AND $1E
C0/1BDE:	8564    	STA $64
C0/1BE0:	7B      	TDC 
C0/1BE1:	E220    	SEP #$20      (8 bit accum./memory)
C0/1BE3:	AD5405  	LDA $0554
C0/1BE6:	8D0242  	STA $4202
C0/1BE9:	AD4205  	LDA $0542
C0/1BEC:	8D0342  	STA $4203
C0/1BEF:	A589    	LDA $89
C0/1BF1:	C220    	REP #$20      (16 bit accum./memory)
C0/1BF3:	0A      	ASL A
C0/1BF4:	0A      	ASL A
C0/1BF5:	0A      	ASL A
C0/1BF6:	0A      	ASL A
C0/1BF7:	090F00  	ORA #$000F
C0/1BFA:	851E    	STA $1E
C0/1BFC:	AD3305  	LDA $0533
C0/1BFF:	29FF00  	AND #$00FF
C0/1C02:	0A      	ASL A
C0/1C03:	0A      	ASL A
C0/1C04:	0A      	ASL A
C0/1C05:	0A      	ASL A
C0/1C06:	18      	CLC
C0/1C07:	6D1642  	ADC $4216
C0/1C0A:	8520    	STA $20
C0/1C0C:	4A      	LSR A
C0/1C0D:	4A      	LSR A
C0/1C0E:	4A      	LSR A
C0/1C0F:	4A      	LSR A
C0/1C10:	E220    	SEP #$20      (8 bit accum./memory)
C0/1C12:	2589    	AND $89
C0/1C14:	8D4405  	STA $0544
C0/1C17:	C220    	REP #$20      (16 bit accum./memory)
C0/1C19:	A520    	LDA $20
C0/1C1B:	38      	SEC 
C0/1C1C:	E97000  	SBC #$0070
C0/1C1F:	251E    	AND $1E
C0/1C21:	8568    	STA $68
C0/1C23:	7B      	TDC 
C0/1C24:	E220    	SEP #$20      (8 bit accum./memory)
C0/1C26:	AD5505  	LDA $0555
C0/1C29:	8D0242  	STA $4202
C0/1C2C:	AD4105  	LDA $0541
C0/1C2F:	8D0342  	STA $4203
C0/1C32:	A58A    	LDA $8A
C0/1C34:	C220    	REP #$20      (16 bit accum./memory)
C0/1C36:	0A      	ASL A
C0/1C37:	0A      	ASL A
C0/1C38:	0A      	ASL A
C0/1C39:	0A      	ASL A
C0/1C3A:	090F00  	ORA #$000F
C0/1C3D:	851E    	STA $1E
C0/1C3F:	AD3405  	LDA $0534
C0/1C42:	29FF00  	AND #$00FF
C0/1C45:	0A      	ASL A
C0/1C46:	0A      	ASL A
C0/1C47:	0A      	ASL A
C0/1C48:	0A      	ASL A
C0/1C49:	18      	CLC
C0/1C4A:	6D1642  	ADC $4216
C0/1C4D:	8520    	STA $20
C0/1C4F:	4A      	LSR A
C0/1C50:	4A      	LSR A
C0/1C51:	4A      	LSR A
C0/1C52:	4A      	LSR A
C0/1C53:	E220    	SEP #$20      (8 bit accum./memory)
C0/1C55:	258A    	AND $8A
C0/1C57:	8D4505  	STA $0545
C0/1C5A:	C220    	REP #$20      (16 bit accum./memory)
C0/1C5C:	A520    	LDA $20
C0/1C5E:	38      	SEC 
C0/1C5F:	E97000  	SBC #$0070
C0/1C62:	251E    	AND $1E
C0/1C64:	856C    	STA $6C
C0/1C66:	7B      	TDC 
C0/1C67:	E220    	SEP #$20      (8 bit accum./memory)
C0/1C69:	AD5605  	LDA $0556
C0/1C6C:	8D0242  	STA $4202
C0/1C6F:	AD4205  	LDA $0542
C0/1C72:	8D0342  	STA $4203
C0/1C75:	A58B    	LDA $8B
C0/1C77:	C220    	REP #$20      (16 bit accum./memory)
C0/1C79:	0A      	ASL A
C0/1C7A:	0A      	ASL A
C0/1C7B:	0A      	ASL A
C0/1C7C:	0A      	ASL A
C0/1C7D:	090F00  	ORA #$000F
C0/1C80:	851E    	STA $1E
C0/1C82:	AD3505  	LDA $0535
C0/1C85:	29FF00  	AND #$00FF
C0/1C88:	0A      	ASL A
C0/1C89:	0A      	ASL A
C0/1C8A:	0A      	ASL A
C0/1C8B:	0A      	ASL A
C0/1C8C:	18      	CLC
C0/1C8D:	6D1642  	ADC $4216
C0/1C90:	8520    	STA $20
C0/1C92:	4A      	LSR A
C0/1C93:	4A      	LSR A
C0/1C94:	4A      	LSR A
C0/1C95:	4A      	LSR A
C0/1C96:	E220    	SEP #$20      (8 bit accum./memory)
C0/1C98:	258B    	AND $8B
C0/1C9A:	8D4605  	STA $0546
C0/1C9D:	C220    	REP #$20      (16 bit accum./memory)
C0/1C9F:	A520    	LDA $20
C0/1CA1:	38      	SEC 
C0/1CA2:	E97000  	SBC #$0070
C0/1CA5:	251E    	AND $1E
C0/1CA7:	8570    	STA $70
C0/1CA9:	7B      	TDC 
C0/1CAA:	E220    	SEP #$20      (8 bit accum./memory)
C0/1CAC:	60      	RTS

; Load map/location properties to buffer
C0/1CAD:	C220    	REP #$20       ; 16-bit A
C0/1CAF:	A582    	LDA $82        ; map ID
C0/1CB1:	0A      	ASL A
C0/1CB2:	0A      	ASL A
C0/1CB3:	0A      	ASL A
C0/1CB4:	0A      	ASL A
C0/1CB5:	0A      	ASL A          ; x32
C0/1CB6:	18      	CLC            ; clear carry
C0/1CB7:	6582    	ADC $82        ; x33
C0/1CB9:	AA      	TAX            ; offset to map properties
C0/1CBA:	7B      	TDC            ; zero A/B
C0/1CBB:	E220    	SEP #$20       ; 8-bit A
C0/1CBD:	A400    	LDY $00        ; zero Y
C0/1CBF:	BF008FED	LDA $ED8F00,X  ; map property data
C0/1CC3:	992005  	STA $0520,Y    ; copy to buffer (default bg at 0522)
C0/1CC6:	E8      	INX            ; next index
C0/1CC7:	C8      	INY            ; next index
C0/1CC8:	C02100  	CPY #$0021     ; move #33 bytes
C0/1CCB:	D0F2    	BNE $1CBF      ; loop till done
C0/1CCD:	60      	RTS
 
C0/1CCE:	AD2405  	LDA $0524	(from C0/BF73)
C0/1CD1:	0A      	ASL A
C0/1CD2:	AA      	TAX
C0/1CD3:	C221    	REP #$21
C0/1CD5:	BF10CDD9	LDA $D9CD10,X  (pointers to location tile properties)
C0/1CD9:	6900A8  	ADC #$A800
C0/1CDC:	85F3    	STA $F3
C0/1CDE:	7B      	TDC 
C0/1CDF:	E220    	SEP #$20      (8 bit accum./memory)
C0/1CE1:	A9D9    	LDA #$D9
C0/1CE3:	85F5    	STA $F5
C0/1CE5:	A20076  	LDX #$7600
C0/1CE8:	86F6    	STX $F6
C0/1CEA:	A97E    	LDA #$7E
C0/1CEC:	85F8    	STA $F8
C0/1CEE:	226C04C0	JSL $C0046C    (LZ decompression)
C0/1CF2:	60      	RTS
 
C0/1CF3:	9C0B42  	STZ $420B      (turn off DMA)
C0/1CF6:	A980    	LDA #$80
C0/1CF8:	8D1521  	STA $2115
C0/1CFB:	A691    	LDX $91
C0/1CFD:	8E1621  	STX $2116
C0/1D00:	A941    	LDA #$41
C0/1D02:	8D0043  	STA $4300
C0/1D05:	A918    	LDA #$18
C0/1D07:	8D0143  	STA $4301
C0/1D0A:	A2C0D9  	LDX #$D9C0
C0/1D0D:	8E0243  	STX $4302
C0/1D10:	A97F    	LDA #$7F
C0/1D12:	8D0443  	STA $4304
C0/1D15:	8D0743  	STA $4307
C0/1D18:	A20004  	LDX #$0400
C0/1D1B:	8E0543  	STX $4305
C0/1D1E:	A901    	LDA #$01
C0/1D20:	8D0B42  	STA $420B      (turn on channel 1 of DMA)
C0/1D23:	60      	RTS
 
C0/1D24:	9C0B42  	STZ $420B      (turn off DMA)
C0/1D27:	A980    	LDA #$80
C0/1D29:	8D1521  	STA $2115
C0/1D2C:	C220    	REP #$20      (16 bit accum./memory)
C0/1D2E:	AD9100  	LDA $0091
C0/1D31:	18      	CLC
C0/1D32:	690002  	ADC #$0200
C0/1D35:	8D1621  	STA $2116
C0/1D38:	7B      	TDC 
C0/1D39:	E220    	SEP #$20      (8 bit accum./memory)
C0/1D3B:	A941    	LDA #$41
C0/1D3D:	8D0043  	STA $4300
C0/1D40:	A918    	LDA #$18
C0/1D42:	8D0143  	STA $4301
C0/1D45:	A2C0DD  	LDX #$DDC0
C0/1D48:	8E0243  	STX $4302
C0/1D4B:	A97F    	LDA #$7F
C0/1D4D:	8D0443  	STA $4304
C0/1D50:	8D0743  	STA $4307
C0/1D53:	A20004  	LDX #$0400
C0/1D56:	8E0543  	STX $4305
C0/1D59:	A901    	LDA #$01
C0/1D5B:	8D0B42  	STA $420B
C0/1D5E:	60      	RTS
 
C0/1D5F:	9C0B42  	STZ $420B      (turn off DMA)
C0/1D62:	A980    	LDA #$80
C0/1D64:	8D1521  	STA $2115
C0/1D67:	A697    	LDX $97
C0/1D69:	8E1621  	STX $2116
C0/1D6C:	A941    	LDA #$41
C0/1D6E:	8D0043  	STA $4300
C0/1D71:	A918    	LDA #$18
C0/1D73:	8D0143  	STA $4301
C0/1D76:	A2C0E1  	LDX #$E1C0
C0/1D79:	8E0243  	STX $4302
C0/1D7C:	A97F    	LDA #$7F
C0/1D7E:	8D0443  	STA $4304
C0/1D81:	8D0743  	STA $4307
C0/1D84:	A20004  	LDX #$0400
C0/1D87:	8E0543  	STX $4305
C0/1D8A:	A901    	LDA #$01
C0/1D8C:	8D0B42  	STA $420B
C0/1D8F:	60      	RTS
 
C0/1D90:	9C0B42  	STZ $420B      (turn off DMA)
C0/1D93:	A980    	LDA #$80
C0/1D95:	8D1521  	STA $2115
C0/1D98:	C220    	REP #$20      (16 bit accum./memory)
C0/1D9A:	AD9700  	LDA $0097
C0/1D9D:	18      	CLC
C0/1D9E:	690002  	ADC #$0200
C0/1DA1:	8D1621  	STA $2116
C0/1DA4:	7B      	TDC 
C0/1DA5:	E220    	SEP #$20      (8 bit accum./memory)
C0/1DA7:	A941    	LDA #$41
C0/1DA9:	8D0043  	STA $4300
C0/1DAC:	A918    	LDA #$18
C0/1DAE:	8D0143  	STA $4301
C0/1DB1:	A2C0E5  	LDX #$E5C0
C0/1DB4:	8E0243  	STX $4302
C0/1DB7:	A97F    	LDA #$7F
C0/1DB9:	8D0443  	STA $4304
C0/1DBC:	8D0743  	STA $4307
C0/1DBF:	A20004  	LDX #$0400
C0/1DC2:	8E0543  	STX $4305
C0/1DC5:	A901    	LDA #$01
C0/1DC7:	8D0B42  	STA $420B
C0/1DCA:	60      	RTS
 
C0/1DCB:	9C0B42  	STZ $420B      (turn off DMA)
C0/1DCE:	A980    	LDA #$80
C0/1DD0:	8D1521  	STA $2115
C0/1DD3:	A69D    	LDX $9D
C0/1DD5:	8E1621  	STX $2116
C0/1DD8:	A941    	LDA #$41
C0/1DDA:	8D0043  	STA $4300
C0/1DDD:	A918    	LDA #$18
C0/1DDF:	8D0143  	STA $4301
C0/1DE2:	A2C0E9  	LDX #$E9C0
C0/1DE5:	8E0243  	STX $4302
C0/1DE8:	A97F    	LDA #$7F
C0/1DEA:	8D0443  	STA $4304
C0/1DED:	8D0743  	STA $4307
C0/1DF0:	A20004  	LDX #$0400
C0/1DF3:	8E0543  	STX $4305
C0/1DF6:	A901    	LDA #$01
C0/1DF8:	8D0B42  	STA $420B
C0/1DFB:	60      	RTS
 
C0/1DFC:	9C0B42  	STZ $420B      (turn off DMA)
C0/1DFF:	A980    	LDA #$80
C0/1E01:	8D1521  	STA $2115
C0/1E04:	C220    	REP #$20      (16 bit accum./memory)
C0/1E06:	AD9D00  	LDA $009D
C0/1E09:	18      	CLC
C0/1E0A:	690002  	ADC #$0200
C0/1E0D:	8D1621  	STA $2116
C0/1E10:	7B      	TDC 
C0/1E11:	E220    	SEP #$20      (8 bit accum./memory)
C0/1E13:	A941    	LDA #$41
C0/1E15:	8D0043  	STA $4300
C0/1E18:	A918    	LDA #$18
C0/1E1A:	8D0143  	STA $4301
C0/1E1D:	A2C0ED  	LDX #$EDC0
C0/1E20:	8E0243  	STX $4302
C0/1E23:	A97F    	LDA #$7F
C0/1E25:	8D0443  	STA $4304
C0/1E28:	8D0743  	STA $4307
C0/1E2B:	A20004  	LDX #$0400
C0/1E2E:	8E0543  	STX $4305
C0/1E31:	A901    	LDA #$01
C0/1E33:	8D0B42  	STA $420B
C0/1E36:	60      	RTS

; Handle pending BG updates [?]
C0/1E37:	AD5A05  	LDA $055A         ; BG1 map data update status
C0/1E3A:	F01D    	BEQ $1E59         ; branch if no changes
C0/1E3C:	C903    	CMP #$03          ; requires VRAM change
C0/1E3E:	B019    	BCS $1E59         ; branch if not ^
C0/1E40:	3A      	DEC A             ; decrement change type
C0/1E41:	D00E    	BNE $1E51         ; branch if "top->VRAM" change
C0/1E43:	20241D  	JSR $1D24
C0/1E46:	A55A    	LDA $5A
C0/1E48:	0901    	ORA #$01
C0/1E4A:	855A    	STA $5A           ; set BG1 needs flipping [?]
C0/1E4C:	9C5A05  	STZ $055A         ; clear "BG1 needs update"
C0/1E4F:	804A    	BRA $1E9B

C0/1E51:	20F31C  	JSR $1CF3
C0/1E54:	CE5A05  	DEC $055A
C0/1E57:	8042    	BRA $1E9B

C0/1E59:	AD5B05  	LDA $055B         ; BG2 map data update status
C0/1E5C:	F01D    	BEQ $1E7B         ; branch if no changes
C0/1E5E:	C903    	CMP #$03          ; requires VRAM change
C0/1E60:	B019    	BCS $1E7B         ; branch if not ^
C0/1E62:	3A      	DEC A             ; decrement change type
C0/1E63:	D00E    	BNE $1E73         ; branch if "top->VRAM" change
C0/1E65:	20901D  	JSR $1D90
C0/1E68:	A55A    	LDA $5A
C0/1E6A:	0902    	ORA #$02
C0/1E6C:	855A    	STA $5A           ; set BG2 needs flipping [?]
C0/1E6E:	9C5B05  	STZ $055B         ; clear "BG2 needs update"
C0/1E71:	8028    	BRA $1E9B

C0/1E73:	205F1D  	JSR $1D5F
C0/1E76:	CE5B05  	DEC $055B
C0/1E79:	8020    	BRA $1E9B

C0/1E7B:	AD5C05  	LDA $055C         ; BG3 map data update status
C0/1E7E:	F01B    	BEQ $1E9B         ; branch if no changes
C0/1E80:	C903    	CMP #$03          ; requires VRAM change
C0/1E82:	B017    	BCS $1E9B         ; branch if not ^
C0/1E84:	3A      	DEC A             ; decrement change type
C0/1E85:	D00E    	BNE $1E95         ; branch if "top->VRAM" change
C0/1E87:	20FC1D  	JSR $1DFC
C0/1E8A:	A55A    	LDA $5A
C0/1E8C:	0904    	ORA #$04
C0/1E8E:	855A    	STA $5A           ; set BG3 needs flipping [?]
C0/1E90:	9C5C05  	STZ $055C         ; clear "BG3 needs update"
C0/1E93:	8006    	BRA $1E9B

C0/1E95:	20CB1D  	JSR $1DCB
C0/1E98:	CE5C05  	DEC $055C

C0/1E9B:	AD5A05  	LDA $055A         ; BG1 map data update status
C0/1E9E:	0D5B05  	ORA $055B         ; BG2 map data update status
C0/1EA1:	0D5C05  	ORA $055C         ; BG3 map data update status
C0/1EA4:	D01D    	BNE $1EC3         ; exit if at least one change still

C0/1EA6:	A55A    	LDA $5A           ; maps needing flip
C0/1EA8:	2901    	AND #$01          ; BG1 needs flipping
C0/1EAA:	F003    	BEQ $1EAF         ; branch if not
C0/1EAC:	205E3F  	JSR $3F5E         ; flip BG1 [?]

C0/1EAF:	A55A    	LDA $5A
C0/1EB1:	2902    	AND #$02          ; BG2 needs flipping
C0/1EB3:	F003    	BEQ $1EB8         ; branch if not
C0/1EB5:	207E3F  	JSR $3F7E         ; flip BG2 [?]

C0/1EB8:	A55A    	LDA $5A
C0/1EBA:	2904    	AND #$04          ; BG3 needs flipping
C0/1EBC:	F003    	BEQ $1EC1         ; branch if not
C0/1EBE:	209E3F  	JSR $3F9E         ; flip BG3 [?]
C0/1EC1:	645A    	STZ $5A           ; clear "BG needs flipping"
C0/1EC3:	60      	RTS
 
C0/1EC4:	A97F    	LDA #$7F		(from C0/4D48)
C0/1EC6:	852F    	STA $2F
C0/1EC8:	A58F    	LDA $8F
C0/1ECA:	852A    	STA $2A
C0/1ECC:	A590    	LDA $90
C0/1ECE:	18      	CLC
C0/1ECF:	652B    	ADC $2B
C0/1ED1:	852B    	STA $2B
C0/1ED3:	852E    	STA $2E
C0/1ED5:	A400    	LDY $00
C0/1ED7:	B78C    	LDA [$8C],Y
C0/1ED9:	8526    	STA $26
C0/1EDB:	6427    	STZ $27
C0/1EDD:	C8      	INY 
C0/1EDE:	B78C    	LDA [$8C],Y
C0/1EE0:	8528    	STA $28
C0/1EE2:	8529    	STA $29
C0/1EE4:	C8      	INY 
C0/1EE5:	A626    	LDX $26
C0/1EE7:	A52A    	LDA $2A
C0/1EE9:	852D    	STA $2D
C0/1EEB:	B78C    	LDA [$8C],Y
C0/1EED:	872D    	STA [$2D]
C0/1EEF:	C8      	INY 
C0/1EF0:	E62D    	INC $2D
C0/1EF2:	CA      	DEX
C0/1EF3:	D0F6    	BNE $1EEB
C0/1EF5:	E62E    	INC $2E
C0/1EF7:	C629    	DEC $29
C0/1EF9:	D0EA    	BNE $1EE5
C0/1EFB:	C220    	REP #$20      (16 bit accum./memory)
C0/1EFD:	A52A    	LDA $2A
C0/1EFF:	29FF3F  	AND #$3FFF
C0/1F02:	852A    	STA $2A
C0/1F04:	7B      	TDC 
C0/1F05:	E220    	SEP #$20      (8 bit accum./memory)
C0/1F07:	60      	RTS
 
C0/1F08:	AD5A05  	LDA $055A
C0/1F0B:	C905    	CMP #$05
C0/1F0D:	F004    	BEQ $1F13
C0/1F0F:	C903    	CMP #$03
C0/1F11:	B001    	BCS $1F14      (branch if 3 or 4)
C0/1F13:	60      	RTS
 
C0/1F14:	C904    	CMP #$04
C0/1F16:	D008    	BNE $1F20
C0/1F18:	AD4205  	LDA $0542
C0/1F1B:	38      	SEC 
C0/1F1C:	E907    	SBC #$07
C0/1F1E:	8004    	BRA $1F24
C0/1F20:	AD4205  	LDA $0542
C0/1F23:	1A      	INC A
C0/1F24:	2587    	AND $87
C0/1F26:	852B    	STA $2B
C0/1F28:	AD4105  	LDA $0541
C0/1F2B:	38      	SEC 
C0/1F2C:	E907    	SBC #$07
C0/1F2E:	2586    	AND $86
C0/1F30:	852A    	STA $2A
C0/1F32:	8520    	STA $20
C0/1F34:	AD8C05  	LDA $058C
C0/1F37:	4904    	EOR #$04
C0/1F39:	8592    	STA $92
C0/1F3B:	6491    	STZ $91
C0/1F3D:	7B      	TDC 
C0/1F3E:	E220    	SEP #$20      (8 bit accum./memory)
C0/1F40:	A52A    	LDA $2A
C0/1F42:	290F    	AND #$0F
C0/1F44:	0A      	ASL A
C0/1F45:	0A      	ASL A
C0/1F46:	851E    	STA $1E
C0/1F48:	641F    	STZ $1F
C0/1F4A:	A52B    	LDA $2B
C0/1F4C:	290F    	AND #$0F
C0/1F4E:	EB      	XBA
C0/1F4F:	C220    	REP #$20      (16 bit accum./memory)
C0/1F51:	4A      	LSR A
C0/1F52:	051E    	ORA $1E
C0/1F54:	851E    	STA $1E
C0/1F56:	7B      	TDC 
C0/1F57:	E220    	SEP #$20      (8 bit accum./memory)
C0/1F59:	A908    	LDA #$08
C0/1F5B:	8528    	STA $28
C0/1F5D:	A97F    	LDA #$7F
C0/1F5F:	48      	PHA
C0/1F60:	AB      	PLB
C0/1F61:	A910    	LDA #$10
C0/1F63:	851B    	STA $1B
C0/1F65:	A41E    	LDY $1E
C0/1F67:	A520    	LDA $20
C0/1F69:	852A    	STA $2A
C0/1F6B:	B22A    	LDA ($2A)
C0/1F6D:	C220    	REP #$20      (16 bit accum./memory)
C0/1F6F:	0A      	ASL A
C0/1F70:	AA      	TAX
C0/1F71:	BD00C0  	LDA $C000,X
C0/1F74:	99C0D9  	STA $D9C0,Y
C0/1F77:	BD00C2  	LDA $C200,X
C0/1F7A:	99C2D9  	STA $D9C2,Y
C0/1F7D:	BD00C4  	LDA $C400,X
C0/1F80:	9900DA  	STA $DA00,Y
C0/1F83:	BD00C6  	LDA $C600,X
C0/1F86:	9902DA  	STA $DA02,Y
C0/1F89:	98      	TYA
C0/1F8A:	18      	CLC
C0/1F8B:	690400  	ADC #$0004
C0/1F8E:	29BFFF  	AND #$FFBF
C0/1F91:	A8      	TAY
C0/1F92:	7B      	TDC 
C0/1F93:	E220    	SEP #$20      (8 bit accum./memory)
C0/1F95:	A52A    	LDA $2A
C0/1F97:	1A      	INC A
C0/1F98:	2586    	AND $86
C0/1F9A:	852A    	STA $2A
C0/1F9C:	C61B    	DEC $1B
C0/1F9E:	D0CB    	BNE $1F6B
C0/1FA0:	A52B    	LDA $2B
C0/1FA2:	1A      	INC A
C0/1FA3:	2587    	AND $87
C0/1FA5:	852B    	STA $2B
C0/1FA7:	C221    	REP #$21
C0/1FA9:	A51E    	LDA $1E
C0/1FAB:	698000  	ADC #$0080
C0/1FAE:	29FF07  	AND #$07FF
C0/1FB1:	851E    	STA $1E
C0/1FB3:	7B      	TDC 
C0/1FB4:	E220    	SEP #$20      (8 bit accum./memory)
C0/1FB6:	C628    	DEC $28
C0/1FB8:	D0A7    	BNE $1F61
C0/1FBA:	A900    	LDA #$00
C0/1FBC:	48      	PHA
C0/1FBD:	AB      	PLB
C0/1FBE:	CE5A05  	DEC $055A
C0/1FC1:	60      	RTS
 
C0/1FC2:	AD5B05  	LDA $055B
C0/1FC5:	C905    	CMP #$05
C0/1FC7:	F004    	BEQ $1FCD
C0/1FC9:	C903    	CMP #$03
C0/1FCB:	B001    	BCS $1FCE
C0/1FCD:	60      	RTS
 
C0/1FCE:	C904    	CMP #$04
C0/1FD0:	D008    	BNE $1FDA
C0/1FD2:	AD4405  	LDA $0544
C0/1FD5:	38      	SEC 
C0/1FD6:	E907    	SBC #$07
C0/1FD8:	8004    	BRA $1FDE
C0/1FDA:	AD4405  	LDA $0544
C0/1FDD:	1A      	INC A
C0/1FDE:	2589    	AND $89
C0/1FE0:	18      	CLC
C0/1FE1:	6940    	ADC #$40
C0/1FE3:	852B    	STA $2B
C0/1FE5:	AD4305  	LDA $0543
C0/1FE8:	38      	SEC 
C0/1FE9:	E907    	SBC #$07
C0/1FEB:	2588    	AND $88
C0/1FED:	852A    	STA $2A
C0/1FEF:	8520    	STA $20
C0/1FF1:	AD8E05  	LDA $058E
C0/1FF4:	4904    	EOR #$04
C0/1FF6:	8598    	STA $98
C0/1FF8:	6497    	STZ $97
C0/1FFA:	7B      	TDC 
C0/1FFB:	E220    	SEP #$20      (8 bit accum./memory)
C0/1FFD:	A52A    	LDA $2A
C0/1FFF:	290F    	AND #$0F
C0/2001:	0A      	ASL A
C0/2002:	0A      	ASL A
C0/2003:	851E    	STA $1E
C0/2005:	641F    	STZ $1F
C0/2007:	A52B    	LDA $2B
C0/2009:	290F    	AND #$0F
C0/200B:	EB      	XBA
C0/200C:	C220    	REP #$20      (16 bit accum./memory)
C0/200E:	4A      	LSR A
C0/200F:	051E    	ORA $1E
C0/2011:	851E    	STA $1E
C0/2013:	7B      	TDC 
C0/2014:	E220    	SEP #$20      (8 bit accum./memory)
C0/2016:	A908    	LDA #$08
C0/2018:	8528    	STA $28
C0/201A:	A97F    	LDA #$7F
C0/201C:	48      	PHA
C0/201D:	AB      	PLB
C0/201E:	A910    	LDA #$10
C0/2020:	851B    	STA $1B
C0/2022:	A41E    	LDY $1E
C0/2024:	A520    	LDA $20
C0/2026:	852A    	STA $2A
C0/2028:	B22A    	LDA ($2A)
C0/202A:	C220    	REP #$20      (16 bit accum./memory)
C0/202C:	0A      	ASL A
C0/202D:	AA      	TAX
C0/202E:	BD00C8  	LDA $C800,X
C0/2031:	99C0E1  	STA $E1C0,Y
C0/2034:	BD00CA  	LDA $CA00,X
C0/2037:	99C2E1  	STA $E1C2,Y
C0/203A:	BD00CC  	LDA $CC00,X
C0/203D:	9900E2  	STA $E200,Y
C0/2040:	BD00CE  	LDA $CE00,X
C0/2043:	9902E2  	STA $E202,Y
C0/2046:	98      	TYA
C0/2047:	18      	CLC
C0/2048:	690400  	ADC #$0004
C0/204B:	29BFFF  	AND #$FFBF
C0/204E:	A8      	TAY
C0/204F:	7B      	TDC 
C0/2050:	E220    	SEP #$20      (8 bit accum./memory)
C0/2052:	A52A    	LDA $2A
C0/2054:	1A      	INC A
C0/2055:	2588    	AND $88
C0/2057:	852A    	STA $2A
C0/2059:	C61B    	DEC $1B
C0/205B:	D0CB    	BNE $2028
C0/205D:	A52B    	LDA $2B
C0/205F:	1A      	INC A
C0/2060:	2589    	AND $89
C0/2062:	0940    	ORA #$40
C0/2064:	852B    	STA $2B
C0/2066:	C221    	REP #$21
C0/2068:	A51E    	LDA $1E
C0/206A:	698000  	ADC #$0080
C0/206D:	29FF07  	AND #$07FF
C0/2070:	851E    	STA $1E
C0/2072:	7B      	TDC 
C0/2073:	E220    	SEP #$20      (8 bit accum./memory)
C0/2075:	C628    	DEC $28
C0/2077:	D0A5    	BNE $201E
C0/2079:	A900    	LDA #$00
C0/207B:	48      	PHA
C0/207C:	AB      	PLB
C0/207D:	CE5B05  	DEC $055B
C0/2080:	60      	RTS
 
C0/2081:	AD5C05  	LDA $055C
C0/2084:	C905    	CMP #$05
C0/2086:	F004    	BEQ $208C
C0/2088:	C903    	CMP #$03
C0/208A:	B001    	BCS $208D
C0/208C:	60      	RTS
 
C0/208D:	C904    	CMP #$04
C0/208F:	D008    	BNE $2099
C0/2091:	AD4605  	LDA $0546
C0/2094:	38      	SEC 
C0/2095:	E907    	SBC #$07
C0/2097:	8004    	BRA $209D
C0/2099:	AD4605  	LDA $0546
C0/209C:	1A      	INC A
C0/209D:	258B    	AND $8B
C0/209F:	18      	CLC
C0/20A0:	852B    	STA $2B
C0/20A2:	AD4505  	LDA $0545
C0/20A5:	38      	SEC 
C0/20A6:	E907    	SBC #$07
C0/20A8:	258A    	AND $8A
C0/20AA:	852A    	STA $2A
C0/20AC:	8524    	STA $24
C0/20AE:	AD9005  	LDA $0590
C0/20B1:	4904    	EOR #$04
C0/20B3:	859E    	STA $9E
C0/20B5:	649D    	STZ $9D
C0/20B7:	7B      	TDC 
C0/20B8:	E220    	SEP #$20      (8 bit accum./memory)
C0/20BA:	A52A    	LDA $2A
C0/20BC:	290F    	AND #$0F
C0/20BE:	0A      	ASL A
C0/20BF:	0A      	ASL A
C0/20C0:	851E    	STA $1E
C0/20C2:	641F    	STZ $1F
C0/20C4:	A52B    	LDA $2B
C0/20C6:	290F    	AND #$0F
C0/20C8:	EB      	XBA
C0/20C9:	C220    	REP #$20      (16 bit accum./memory)
C0/20CB:	4A      	LSR A
C0/20CC:	051E    	ORA $1E
C0/20CE:	851E    	STA $1E
C0/20D0:	7B      	TDC 
C0/20D1:	E220    	SEP #$20      (8 bit accum./memory)
C0/20D3:	A908    	LDA #$08
C0/20D5:	8528    	STA $28
C0/20D7:	A910    	LDA #$10
C0/20D9:	851B    	STA $1B
C0/20DB:	A41E    	LDY $1E
C0/20DD:	A524    	LDA $24
C0/20DF:	852A    	STA $2A
C0/20E1:	209A24  	JSR $249A
C0/20E4:	A52B    	LDA $2B
C0/20E6:	1A      	INC A
C0/20E7:	258B    	AND $8B
C0/20E9:	852B    	STA $2B
C0/20EB:	C221    	REP #$21
C0/20ED:	A51E    	LDA $1E
C0/20EF:	698000  	ADC #$0080
C0/20F2:	29FF07  	AND #$07FF
C0/20F5:	851E    	STA $1E
C0/20F7:	7B      	TDC 
C0/20F8:	E220    	SEP #$20      (8 bit accum./memory)
C0/20FA:	C628    	DEC $28
C0/20FC:	D0D9    	BNE $20D7
C0/20FE:	CE5C05  	DEC $055C
C0/2101:	60      	RTS
 
C0/2102:	AD8905  	LDA $0589		(from C0/0131)
C0/2105:	C901    	CMP #$01
C0/2107:	D008    	BNE $2111
C0/2109:	204E24  	JSR $244E
C0/210C:	EE8905  	INC $0589
C0/210F:	800D    	BRA $211E
C0/2111:	AD8A05  	LDA $058A
C0/2114:	C901    	CMP #$01
C0/2116:	D006    	BNE $211E
C0/2118:	205925  	JSR $2559
C0/211B:	EE8A05  	INC $058A
C0/211E:	AD8605  	LDA $0586
C0/2121:	C901    	CMP #$01
C0/2123:	D006    	BNE $212B
C0/2125:	201022  	JSR $2210
C0/2128:	EE8605  	INC $0586
C0/212B:	AD8805  	LDA $0588
C0/212E:	C901    	CMP #$01
C0/2130:	D007    	BNE $2139
C0/2132:	208B23  	JSR $238B
C0/2135:	EE8805  	INC $0588
C0/2138:	60      	RTS
 
C0/2139:	AD8505  	LDA $0585
C0/213C:	C901    	CMP #$01
C0/213E:	D006    	BNE $2146
C0/2140:	205421  	JSR $2154
C0/2143:	EE8505  	INC $0585
C0/2146:	AD8705  	LDA $0587
C0/2149:	C901    	CMP #$01
C0/214B:	D006    	BNE $2153
C0/214D:	20CF22  	JSR $22CF
C0/2150:	EE8705  	INC $0587
C0/2153:	60      	RTS
 
C0/2154:	C221    	REP #$21
C0/2156:	A575    	LDA $75
C0/2158:	6D4905  	ADC $0549
C0/215B:	300B    	BMI $2168

C0/215D:	7B      	TDC 			(from C0/187A)
C0/215E:	E220    	SEP #$20      (8 bit accum./memory)
C0/2160:	AD4205  	LDA $0542
C0/2163:	18      	CLC
C0/2164:	6908    	ADC #$08
C0/2166:	8009    	BRA $2171
C0/2168:	7B      	TDC 
C0/2169:	E220    	SEP #$20      (8 bit accum./memory)
C0/216B:	AD4205  	LDA $0542
C0/216E:	38      	SEC 
C0/216F:	E907    	SBC #$07
C0/2171:	2587    	AND $87
C0/2173:	18      	CLC
C0/2174:	6900    	ADC #$00
C0/2176:	852B    	STA $2B
C0/2178:	290F    	AND #$0F
C0/217A:	C220    	REP #$20      (16 bit accum./memory)
C0/217C:	EB      	XBA
C0/217D:	4A      	LSR A
C0/217E:	4A      	LSR A
C0/217F:	18      	CLC
C0/2180:	6D8B05  	ADC $058B
C0/2183:	8591    	STA $91
C0/2185:	7B      	TDC 
C0/2186:	E220    	SEP #$20      (8 bit accum./memory)
C0/2188:	AD4105  	LDA $0541
C0/218B:	38      	SEC 
C0/218C:	E907    	SBC #$07
C0/218E:	2586    	AND $86
C0/2190:	852A    	STA $2A
C0/2192:	A52A    	LDA $2A
C0/2194:	290F    	AND #$0F
C0/2196:	0A      	ASL A
C0/2197:	0A      	ASL A
C0/2198:	A8      	TAY
C0/2199:	E210    	SEP #$10      (8 bit index registers)
C0/219B:	A910    	LDA #$10
C0/219D:	851B    	STA $1B
C0/219F:	A97F    	LDA #$7F
C0/21A1:	48      	PHA
C0/21A2:	AB      	PLB
C0/21A3:	B22A    	LDA ($2A)
C0/21A5:	3032    	BMI $21D9
C0/21A7:	0A      	ASL A
C0/21A8:	AA      	TAX
C0/21A9:	C220    	REP #$20      (16 bit accum./memory)
C0/21AB:	BD00C0  	LDA $C000,X
C0/21AE:	99C0D9  	STA $D9C0,Y
C0/21B1:	BD00C2  	LDA $C200,X
C0/21B4:	99C2D9  	STA $D9C2,Y
C0/21B7:	BD00C4  	LDA $C400,X
C0/21BA:	9900DA  	STA $DA00,Y
C0/21BD:	BD00C6  	LDA $C600,X
C0/21C0:	9902DA  	STA $DA02,Y
C0/21C3:	7B      	TDC 
C0/21C4:	E221    	SEP #$21
C0/21C6:	98      	TYA
C0/21C7:	6903    	ADC #$03
C0/21C9:	29BF    	AND #$BF
C0/21CB:	A8      	TAY
C0/21CC:	A52A    	LDA $2A
C0/21CE:	1A      	INC A
C0/21CF:	2586    	AND $86
C0/21D1:	852A    	STA $2A
C0/21D3:	C61B    	DEC $1B
C0/21D5:	D0CC    	BNE $21A3
C0/21D7:	8030    	BRA $2209
C0/21D9:	0A      	ASL A
C0/21DA:	AA      	TAX
C0/21DB:	C220    	REP #$20      (16 bit accum./memory)
C0/21DD:	BD00C1  	LDA $C100,X
C0/21E0:	99C0D9  	STA $D9C0,Y
C0/21E3:	BD00C3  	LDA $C300,X
C0/21E6:	99C2D9  	STA $D9C2,Y
C0/21E9:	BD00C5  	LDA $C500,X
C0/21EC:	9900DA  	STA $DA00,Y
C0/21EF:	BD00C7  	LDA $C700,X
C0/21F2:	9902DA  	STA $DA02,Y
C0/21F5:	7B      	TDC 
C0/21F6:	E221    	SEP #$21
C0/21F8:	98      	TYA
C0/21F9:	6903    	ADC #$03
C0/21FB:	29BF    	AND #$BF
C0/21FD:	A8      	TAY
C0/21FE:	A52A    	LDA $2A
C0/2200:	1A      	INC A
C0/2201:	2586    	AND $86
C0/2203:	852A    	STA $2A
C0/2205:	C61B    	DEC $1B
C0/2207:	D09A    	BNE $21A3
C0/2209:	A900    	LDA #$00
C0/220B:	48      	PHA
C0/220C:	AB      	PLB
C0/220D:	C210    	REP #$10      (16 bit index registers)
C0/220F:	60      	RTS
 
C0/2210:	C221    	REP #$21
C0/2212:	A573    	LDA $73
C0/2214:	6D4705  	ADC $0547
C0/2217:	300B    	BMI $2224
C0/2219:	7B      	TDC 
C0/221A:	E220    	SEP #$20      (8 bit accum./memory)
C0/221C:	AD4105  	LDA $0541
C0/221F:	18      	CLC
C0/2220:	6908    	ADC #$08
C0/2222:	8009    	BRA $222D
C0/2224:	7B      	TDC 
C0/2225:	E220    	SEP #$20      (8 bit accum./memory)
C0/2227:	AD4105  	LDA $0541
C0/222A:	38      	SEC 
C0/222B:	E907    	SBC #$07
C0/222D:	2586    	AND $86
C0/222F:	852A    	STA $2A
C0/2231:	AD4205  	LDA $0542
C0/2234:	38      	SEC 
C0/2235:	E907    	SBC #$07
C0/2237:	2587    	AND $87
C0/2239:	18      	CLC
C0/223A:	6900    	ADC #$00
C0/223C:	852B    	STA $2B
C0/223E:	290F    	AND #$0F
C0/2240:	0A      	ASL A
C0/2241:	0A      	ASL A
C0/2242:	A8      	TAY
C0/2243:	A62A    	LDX $2A
C0/2245:	862D    	STX $2D
C0/2247:	E210    	SEP #$10      (8 bit index registers)
C0/2249:	A910    	LDA #$10
C0/224B:	851B    	STA $1B
C0/224D:	A97F    	LDA #$7F
C0/224F:	48      	PHA
C0/2250:	AB      	PLB
C0/2251:	B22A    	LDA ($2A)
C0/2253:	3032    	BMI $2287
C0/2255:	0A      	ASL A
C0/2256:	AA      	TAX
C0/2257:	C220    	REP #$20      (16 bit accum./memory)
C0/2259:	BD00C0  	LDA $C000,X
C0/225C:	9940D8  	STA $D840,Y
C0/225F:	BD00C4  	LDA $C400,X
C0/2262:	9942D8  	STA $D842,Y
C0/2265:	BD00C2  	LDA $C200,X
C0/2268:	9980D8  	STA $D880,Y
C0/226B:	BD00C6  	LDA $C600,X
C0/226E:	9982D8  	STA $D882,Y
C0/2271:	7B      	TDC 
C0/2272:	E221    	SEP #$21
C0/2274:	98      	TYA
C0/2275:	6903    	ADC #$03
C0/2277:	293F    	AND #$3F
C0/2279:	A8      	TAY
C0/227A:	A52B    	LDA $2B
C0/227C:	1A      	INC A
C0/227D:	2587    	AND $87
C0/227F:	852B    	STA $2B
C0/2281:	C61B    	DEC $1B
C0/2283:	D0CC    	BNE $2251
C0/2285:	8030    	BRA $22B7
C0/2287:	0A      	ASL A
C0/2288:	AA      	TAX
C0/2289:	C220    	REP #$20      (16 bit accum./memory)
C0/228B:	BD00C1  	LDA $C100,X
C0/228E:	9940D8  	STA $D840,Y
C0/2291:	BD00C5  	LDA $C500,X
C0/2294:	9942D8  	STA $D842,Y
C0/2297:	BD00C3  	LDA $C300,X
C0/229A:	9980D8  	STA $D880,Y
C0/229D:	BD00C7  	LDA $C700,X
C0/22A0:	9982D8  	STA $D882,Y
C0/22A3:	7B      	TDC 
C0/22A4:	E221    	SEP #$21
C0/22A6:	98      	TYA
C0/22A7:	6903    	ADC #$03
C0/22A9:	293F    	AND #$3F
C0/22AB:	A8      	TAY
C0/22AC:	A52B    	LDA $2B
C0/22AE:	1A      	INC A
C0/22AF:	2587    	AND $87
C0/22B1:	852B    	STA $2B
C0/22B3:	C61B    	DEC $1B
C0/22B5:	D09A    	BNE $2251
C0/22B7:	C210    	REP #$10      (16 bit index registers)
C0/22B9:	A900    	LDA #$00
C0/22BB:	48      	PHA
C0/22BC:	AB      	PLB
C0/22BD:	A52D    	LDA $2D
C0/22BF:	290F    	AND #$0F
C0/22C1:	0A      	ASL A
C0/22C2:	8593    	STA $93
C0/22C4:	1A      	INC A
C0/22C5:	8595    	STA $95
C0/22C7:	AD8C05  	LDA $058C
C0/22CA:	8594    	STA $94
C0/22CC:	8596    	STA $96
C0/22CE:	60      	RTS
 
C0/22CF:	C221    	REP #$21
C0/22D1:	A579    	LDA $79
C0/22D3:	6D4D05  	ADC $054D
C0/22D6:	300B    	BMI $22E3

C0/22D8:	7B      	TDC 			(from C0/1880)
C0/22D9:	E220    	SEP #$20      	(8 bit accum./memory)
C0/22DB:	AD4405  	LDA $0544
C0/22DE:	18      	CLC
C0/22DF:	6908    	ADC #$08
C0/22E1:	8009    	BRA $22EC
C0/22E3:	7B      	TDC 
C0/22E4:	E220    	SEP #$20      	(8 bit accum./memory)
C0/22E6:	AD4405  	LDA $0544
C0/22E9:	38      	SEC 
C0/22EA:	E907    	SBC #$07
C0/22EC:	2589    	AND $89
C0/22EE:	18      	CLC
C0/22EF:	6940    	ADC #$40
C0/22F1:	852B    	STA $2B
C0/22F3:	290F    	AND #$0F
C0/22F5:	C220    	REP #$20      	(16 bit accum./memory)
C0/22F7:	EB      	XBA
C0/22F8:	4A      	LSR A
C0/22F9:	4A      	LSR A
C0/22FA:	18      	CLC
C0/22FB:	6D8D05  	ADC $058D
C0/22FE:	8597    	STA $97
C0/2300:	7B      	TDC 
C0/2301:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2303:	AD4305  	LDA $0543
C0/2306:	38      	SEC 
C0/2307:	E907    	SBC #$07
C0/2309:	2588    	AND $88
C0/230B:	852A    	STA $2A
C0/230D:	A52A    	LDA $2A
C0/230F:	290F    	AND #$0F
C0/2311:	0A      	ASL A
C0/2312:	0A      	ASL A
C0/2313:	A8      	TAY
C0/2314:	E210    	SEP #$10      	(8 bit index registers)
C0/2316:	A910    	LDA #$10
C0/2318:	851B    	STA $1B
C0/231A:	A97F    	LDA #$7F
C0/231C:	48      	PHA
C0/231D:	AB      	PLB
C0/231E:	B22A    	LDA ($2A)
C0/2320:	3032    	BMI $2354
C0/2322:	0A      	ASL A
C0/2323:	AA      	TAX
C0/2324:	C220    	REP #$20      	(16 bit accum./memory)
C0/2326:	BD00C8  	LDA $C800,X
C0/2329:	99C0E1  	STA $E1C0,Y
C0/232C:	BD00CA  	LDA $CA00,X
C0/232F:	99C2E1  	STA $E1C2,Y
C0/2332:	BD00CC  	LDA $CC00,X
C0/2335:	9900E2  	STA $E200,Y
C0/2338:	BD00CE  	LDA $CE00,X
C0/233B:	9902E2  	STA $E202,Y
C0/233E:	7B      	TDC 
C0/233F:	E221    	SEP #$21
C0/2341:	98      	TYA
C0/2342:	6903    	ADC #$03
C0/2344:	29BF    	AND #$BF
C0/2346:	A8      	TAY
C0/2347:	A52A    	LDA $2A
C0/2349:	1A      	INC A
C0/234A:	2588    	AND $88
C0/234C:	852A    	STA $2A
C0/234E:	C61B    	DEC $1B
C0/2350:	D0CC    	BNE $231E
C0/2352:	8030    	BRA $2384
C0/2354:	0A      	ASL A
C0/2355:	AA      	TAX
C0/2356:	C220    	REP #$20      	(16 bit accum./memory)
C0/2358:	BD00C9  	LDA $C900,X
C0/235B:	99C0E1  	STA $E1C0,Y
C0/235E:	BD00CB  	LDA $CB00,X
C0/2361:	99C2E1  	STA $E1C2,Y
C0/2364:	BD00CD  	LDA $CD00,X
C0/2367:	9900E2  	STA $E200,Y
C0/236A:	BD00CF  	LDA $CF00,X
C0/236D:	9902E2  	STA $E202,Y
C0/2370:	7B      	TDC 
C0/2371:	E221    	SEP #$21
C0/2373:	98      	TYA
C0/2374:	6903    	ADC #$03
C0/2376:	29BF    	AND #$BF
C0/2378:	A8      	TAY
C0/2379:	A52A    	LDA $2A
C0/237B:	1A      	INC A
C0/237C:	2588    	AND $88
C0/237E:	852A    	STA $2A
C0/2380:	C61B    	DEC $1B
C0/2382:	D09A    	BNE $231E
C0/2384:	A900    	LDA #$00
C0/2386:	48      	PHA
C0/2387:	AB      	PLB
C0/2388:	C210    	REP #$10      	(16 bit index registers)
C0/238A:	60      	RTS
 
C0/238B:	C221    	REP #$21
C0/238D:	A577    	LDA $77
C0/238F:	6D4B05  	ADC $054B
C0/2392:	300B    	BMI $239F
C0/2394:	7B      	TDC 
C0/2395:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2397:	AD4305  	LDA $0543
C0/239A:	18      	CLC
C0/239B:	6908    	ADC #$08
C0/239D:	8009    	BRA $23A8
C0/239F:	7B      	TDC 
C0/23A0:	E220    	SEP #$20      	(8 bit accum./memory)
C0/23A2:	AD4305  	LDA $0543
C0/23A5:	38      	SEC 
C0/23A6:	E907    	SBC #$07
C0/23A8:	2588    	AND $88
C0/23AA:	852A    	STA $2A
C0/23AC:	AD4405  	LDA $0544
C0/23AF:	38      	SEC 
C0/23B0:	E907    	SBC #$07
C0/23B2:	2589    	AND $89
C0/23B4:	18      	CLC
C0/23B5:	6940    	ADC #$40
C0/23B7:	852B    	STA $2B
C0/23B9:	290F    	AND #$0F
C0/23BB:	0A      	ASL A
C0/23BC:	0A      	ASL A
C0/23BD:	A8      	TAY
C0/23BE:	A62A    	LDX $2A
C0/23C0:	862D    	STX $2D
C0/23C2:	E210    	SEP #$10      	(8 bit index registers)
C0/23C4:	A910    	LDA #$10
C0/23C6:	851B    	STA $1B
C0/23C8:	A97F    	LDA #$7F
C0/23CA:	48      	PHA
C0/23CB:	AB      	PLB
C0/23CC:	B22A    	LDA ($2A)
C0/23CE:	3034    	BMI $2404
C0/23D0:	0A      	ASL A
C0/23D1:	AA      	TAX
C0/23D2:	C220    	REP #$20      	(16 bit accum./memory)
C0/23D4:	BD00C8  	LDA $C800,X
C0/23D7:	99C0D8  	STA $D8C0,Y
C0/23DA:	BD00CC  	LDA $CC00,X
C0/23DD:	99C2D8  	STA $D8C2,Y
C0/23E0:	BD00CA  	LDA $CA00,X
C0/23E3:	9900D9  	STA $D900,Y
C0/23E6:	BD00CE  	LDA $CE00,X
C0/23E9:	9902D9  	STA $D902,Y
C0/23EC:	7B      	TDC 
C0/23ED:	E221    	SEP #$21
C0/23EF:	98      	TYA
C0/23F0:	6903    	ADC #$03
C0/23F2:	293F    	AND #$3F
C0/23F4:	A8      	TAY
C0/23F5:	A52B    	LDA $2B
C0/23F7:	1A      	INC A
C0/23F8:	2589    	AND $89
C0/23FA:	0940    	ORA #$40
C0/23FC:	852B    	STA $2B
C0/23FE:	C61B    	DEC $1B
C0/2400:	D0CA    	BNE $23CC
C0/2402:	8032    	BRA $2436
C0/2404:	0A      	ASL A
C0/2405:	AA      	TAX
C0/2406:	C220    	REP #$20      	(16 bit accum./memory)
C0/2408:	BD00C9  	LDA $C900,X
C0/240B:	99C0D8  	STA $D8C0,Y
C0/240E:	BD00CD  	LDA $CD00,X
C0/2411:	99C2D8  	STA $D8C2,Y
C0/2414:	BD00CB  	LDA $CB00,X
C0/2417:	9900D9  	STA $D900,Y
C0/241A:	BD00CF  	LDA $CF00,X
C0/241D:	9902D9  	STA $D902,Y
C0/2420:	7B      	TDC 
C0/2421:	E221    	SEP #$21
C0/2423:	98      	TYA
C0/2424:	6903    	ADC #$03
C0/2426:	293F    	AND #$3F
C0/2428:	A8      	TAY
C0/2429:	A52B    	LDA $2B
C0/242B:	1A      	INC A
C0/242C:	2589    	AND $89
C0/242E:	0940    	ORA #$40
C0/2430:	852B    	STA $2B
C0/2432:	C61B    	DEC $1B
C0/2434:	D096    	BNE $23CC
C0/2436:	C210    	REP #$10      	(16 bit index registers)
C0/2438:	A900    	LDA #$00
C0/243A:	48      	PHA
C0/243B:	AB      	PLB
C0/243C:	A52D    	LDA $2D
C0/243E:	290F    	AND #$0F
C0/2440:	0A      	ASL A
C0/2441:	8599    	STA $99
C0/2443:	1A      	INC A
C0/2444:	859B    	STA $9B
C0/2446:	AD8E05  	LDA $058E
C0/2449:	859A    	STA $9A
C0/244B:	859C    	STA $9C
C0/244D:	60      	RTS
 
C0/244E:	C221    	REP #$21
C0/2450:	A57D    	LDA $7D
C0/2452:	6D5105  	ADC $0551
C0/2455:	300F    	BMI $2466

C0/2457:	7B      	TDC 			(from C0/1886)
C0/2458:	E220    	SEP #$20      	(8 bit accum./memory)
C0/245A:	AD4605  	LDA $0546
C0/245D:	18      	CLC
C0/245E:	6908    	ADC #$08
C0/2460:	258B    	AND $8B
C0/2462:	852B    	STA $2B
C0/2464:	800D    	BRA $2473
C0/2466:	7B      	TDC 
C0/2467:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2469:	AD4605  	LDA $0546
C0/246C:	38      	SEC 
C0/246D:	E907    	SBC #$07
C0/246F:	258B    	AND $8B
C0/2471:	852B    	STA $2B
C0/2473:	AD4505  	LDA $0545
C0/2476:	38      	SEC 
C0/2477:	E907    	SBC #$07
C0/2479:	258A    	AND $8A
C0/247B:	852A    	STA $2A
C0/247D:	A52B    	LDA $2B
C0/247F:	290F    	AND #$0F
C0/2481:	C220    	REP #$20      	(16 bit accum./memory)
C0/2483:	EB      	XBA
C0/2484:	4A      	LSR A
C0/2485:	4A      	LSR A
C0/2486:	18      	CLC
C0/2487:	6D8F05  	ADC $058F
C0/248A:	859D    	STA $9D
C0/248C:	7B      	TDC 
C0/248D:	E220    	SEP #$20      	(8 bit accum./memory)
C0/248F:	A52A    	LDA $2A
C0/2491:	290F    	AND #$0F
C0/2493:	0A      	ASL A
C0/2494:	0A      	ASL A
C0/2495:	A8      	TAY
C0/2496:	209A24  	JSR $249A
C0/2499:	60      	RTS
 
C0/249A:	AD2205  	LDA $0522	  (Area default background index)		(from C0/2496)
C0/249D:	2980    	AND #$80
C0/249F:	4A      	LSR A
C0/24A0:	4A      	LSR A
C0/24A1:	8536    	STA $36
C0/24A3:	6437    	STZ $37
C0/24A5:	A62A    	LDX $2A
C0/24A7:	862D    	STX $2D
C0/24A9:	A910    	LDA #$10
C0/24AB:	851B    	STA $1B
C0/24AD:	A97F    	LDA #$7F
C0/24AF:	48      	PHA
C0/24B0:	AB      	PLB
C0/24B1:	A62A    	LDX $2A
C0/24B3:	BD0080  	LDA $8000,X
C0/24B6:	C220    	REP #$20      	(16 bit accum./memory)
C0/24B8:	8520    	STA $20
C0/24BA:	293F00  	AND #$003F
C0/24BD:	AA      	TAX
C0/24BE:	A520    	LDA $20
C0/24C0:	29C000  	AND #$00C0
C0/24C3:	0536    	ORA $36
C0/24C5:	8520    	STA $20
C0/24C7:	BD00D0  	LDA $D000,X
C0/24CA:	291C00  	AND #$001C
C0/24CD:	0520    	ORA $20
C0/24CF:	EB      	XBA
C0/24D0:	8522    	STA $22
C0/24D2:	2900C0  	AND #$C000
C0/24D5:	C90040  	CMP #$4000
C0/24D8:	F020    	BEQ $24FA
C0/24DA:	C90080  	CMP #$8000
C0/24DD:	F031    	BEQ $2510
C0/24DF:	C900C0  	CMP #$C000
C0/24E2:	F042    	BEQ $2526
C0/24E4:	8A      	TXA
C0/24E5:	0A      	ASL A
C0/24E6:	0A      	ASL A
C0/24E7:	0522    	ORA $22
C0/24E9:	99C0E9  	STA $E9C0,Y
C0/24EC:	1A      	INC A
C0/24ED:	99C2E9  	STA $E9C2,Y
C0/24F0:	1A      	INC A
C0/24F1:	9900EA  	STA $EA00,Y
C0/24F4:	1A      	INC A
C0/24F5:	9902EA  	STA $EA02,Y
C0/24F8:	8040    	BRA $253A
C0/24FA:	8A      	TXA
C0/24FB:	0A      	ASL A
C0/24FC:	0A      	ASL A
C0/24FD:	0522    	ORA $22
C0/24FF:	99C2E9  	STA $E9C2,Y
C0/2502:	1A      	INC A
C0/2503:	99C0E9  	STA $E9C0,Y
C0/2506:	1A      	INC A
C0/2507:	9902EA  	STA $EA02,Y
C0/250A:	1A      	INC A
C0/250B:	9900EA  	STA $EA00,Y
C0/250E:	802A    	BRA $253A
C0/2510:	8A      	TXA
C0/2511:	0A      	ASL A
C0/2512:	0A      	ASL A
C0/2513:	0522    	ORA $22
C0/2515:	9900EA  	STA $EA00,Y
C0/2518:	1A      	INC A
C0/2519:	9902EA  	STA $EA02,Y
C0/251C:	1A      	INC A
C0/251D:	99C0E9  	STA $E9C0,Y
C0/2520:	1A      	INC A
C0/2521:	99C2E9  	STA $E9C2,Y
C0/2524:	8014    	BRA $253A
C0/2526:	8A      	TXA
C0/2527:	0A      	ASL A
C0/2528:	0A      	ASL A
C0/2529:	0522    	ORA $22
C0/252B:	9902EA  	STA $EA02,Y
C0/252E:	1A      	INC A
C0/252F:	9900EA  	STA $EA00,Y
C0/2532:	1A      	INC A
C0/2533:	99C2E9  	STA $E9C2,Y
C0/2536:	1A      	INC A
C0/2537:	99C0E9  	STA $E9C0,Y
C0/253A:	98      	TYA
C0/253B:	1A      	INC A
C0/253C:	1A      	INC A
C0/253D:	1A      	INC A
C0/253E:	1A      	INC A
C0/253F:	29BFFF  	AND #$FFBF
C0/2542:	A8      	TAY
C0/2543:	7B      	TDC 
C0/2544:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2546:	A52A    	LDA $2A
C0/2548:	1A      	INC A
C0/2549:	258A    	AND $8A
C0/254B:	852A    	STA $2A
C0/254D:	C61B    	DEC $1B
C0/254F:	F003    	BEQ $2554
C0/2551:	4CB124  	JMP $24B1

C0/2554:	A900    	LDA #$00
C0/2556:	48      	PHA
C0/2557:	AB      	PLB
C0/2558:	60      	RTS
 
C0/2559:	C221    	REP #$21
C0/255B:	A57B    	LDA $7B
C0/255D:	6D4F05  	ADC $054F
C0/2560:	300F    	BMI $2571
C0/2562:	7B      	TDC 
C0/2563:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2565:	AD4505  	LDA $0545
C0/2568:	18      	CLC
C0/2569:	6908    	ADC #$08
C0/256B:	258A    	AND $8A
C0/256D:	852A    	STA $2A
C0/256F:	800D    	BRA $257E
C0/2571:	7B      	TDC 
C0/2572:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2574:	AD4505  	LDA $0545
C0/2577:	38      	SEC 
C0/2578:	E907    	SBC #$07
C0/257A:	258A    	AND $8A
C0/257C:	852A    	STA $2A
C0/257E:	AD4605  	LDA $0546
C0/2581:	38      	SEC 
C0/2582:	E907    	SBC #$07
C0/2584:	258B    	AND $8B
C0/2586:	852B    	STA $2B
C0/2588:	290F    	AND #$0F
C0/258A:	0A      	ASL A
C0/258B:	0A      	ASL A
C0/258C:	A8      	TAY
C0/258D:	AD2205  	LDA $0522	  (Area default background index)
C0/2590:	2980    	AND #$80
C0/2592:	4A      	LSR A
C0/2593:	4A      	LSR A
C0/2594:	8536    	STA $36
C0/2596:	6437    	STZ $37
C0/2598:	A62A    	LDX $2A
C0/259A:	862D    	STX $2D
C0/259C:	A910    	LDA #$10
C0/259E:	851B    	STA $1B
C0/25A0:	A97F    	LDA #$7F
C0/25A2:	48      	PHA
C0/25A3:	AB      	PLB
C0/25A4:	A62A    	LDX $2A
C0/25A6:	BD0080  	LDA $8000,X
C0/25A9:	C220    	REP #$20      	(16 bit accum./memory)
C0/25AB:	8520    	STA $20
C0/25AD:	293F00  	AND #$003F
C0/25B0:	AA      	TAX
C0/25B1:	A520    	LDA $20
C0/25B3:	29C000  	AND #$00C0
C0/25B6:	0536    	ORA $36
C0/25B8:	8520    	STA $20
C0/25BA:	BD00D0  	LDA $D000,X
C0/25BD:	291C00  	AND #$001C
C0/25C0:	0520    	ORA $20
C0/25C2:	EB      	XBA
C0/25C3:	8522    	STA $22
C0/25C5:	2900C0  	AND #$C000
C0/25C8:	C90040  	CMP #$4000
C0/25CB:	F020    	BEQ $25ED
C0/25CD:	C90080  	CMP #$8000
C0/25D0:	F031    	BEQ $2603
C0/25D2:	C900C0  	CMP #$C000
C0/25D5:	F042    	BEQ $2619
C0/25D7:	8A      	TXA
C0/25D8:	0A      	ASL A
C0/25D9:	0A      	ASL A
C0/25DA:	0522    	ORA $22
C0/25DC:	9940D9  	STA $D940,Y
C0/25DF:	1A      	INC A
C0/25E0:	9980D9  	STA $D980,Y
C0/25E3:	1A      	INC A
C0/25E4:	9942D9  	STA $D942,Y
C0/25E7:	1A      	INC A
C0/25E8:	9982D9  	STA $D982,Y
C0/25EB:	8040    	BRA $262D
C0/25ED:	8A      	TXA
C0/25EE:	0A      	ASL A
C0/25EF:	0A      	ASL A
C0/25F0:	0522    	ORA $22
C0/25F2:	9980D9  	STA $D980,Y
C0/25F5:	1A      	INC A
C0/25F6:	9940D9  	STA $D940,Y
C0/25F9:	1A      	INC A
C0/25FA:	9982D9  	STA $D982,Y
C0/25FD:	1A      	INC A
C0/25FE:	9942D9  	STA $D942,Y
C0/2601:	802A    	BRA $262D
C0/2603:	8A      	TXA
C0/2604:	0A      	ASL A
C0/2605:	0A      	ASL A
C0/2606:	0522    	ORA $22
C0/2608:	9942D9  	STA $D942,Y
C0/260B:	1A      	INC A
C0/260C:	9982D9  	STA $D982,Y
C0/260F:	1A      	INC A
C0/2610:	9940D9  	STA $D940,Y
C0/2613:	1A      	INC A
C0/2614:	9980D9  	STA $D980,Y
C0/2617:	8014    	BRA $262D
C0/2619:	8A      	TXA
C0/261A:	0A      	ASL A
C0/261B:	0A      	ASL A
C0/261C:	0522    	ORA $22
C0/261E:	9982D9  	STA $D982,Y
C0/2621:	1A      	INC A
C0/2622:	9942D9  	STA $D942,Y
C0/2625:	1A      	INC A
C0/2626:	9980D9  	STA $D980,Y
C0/2629:	1A      	INC A
C0/262A:	9940D9  	STA $D940,Y
C0/262D:	7B      	TDC 
C0/262E:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2630:	A52B    	LDA $2B
C0/2632:	1A      	INC A
C0/2633:	258B    	AND $8B
C0/2635:	852B    	STA $2B
C0/2637:	98      	TYA
C0/2638:	1A      	INC A
C0/2639:	1A      	INC A
C0/263A:	1A      	INC A
C0/263B:	1A      	INC A
C0/263C:	293F    	AND #$3F
C0/263E:	A8      	TAY
C0/263F:	C61B    	DEC $1B
C0/2641:	F003    	BEQ $2646
C0/2643:	4CA425  	JMP $25A4

C0/2646:	A900    	LDA #$00
C0/2648:	48      	PHA
C0/2649:	AB      	PLB
C0/264A:	A52D    	LDA $2D
C0/264C:	290F    	AND #$0F
C0/264E:	0A      	ASL A
C0/264F:	859F    	STA $9F
C0/2651:	1A      	INC A
C0/2652:	85A1    	STA $A1
C0/2654:	AD9005  	LDA $0590
C0/2657:	85A0    	STA $A0
C0/2659:	85A2    	STA $A2
C0/265B:	60      	RTS
 
C0/265C:	AD3905  	LDA $0539		(from C0/BF64)
C0/265F:	C220    	REP #$20      	(16 bit accum./memory)
C0/2661:	EB      	XBA
C0/2662:	AA      	TAX
C0/2663:	7B      	TDC 
C0/2664:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2666:	A97E    	LDA #$7E
C0/2668:	48      	PHA
C0/2669:	AB      	PLB
C0/266A:	A400    	LDY $00
C0/266C:	BF80C4ED	LDA $EDC480,X
C0/2670:	990072  	STA $7200,Y
C0/2673:	990074  	STA $7400,Y
C0/2676:	E8      	INX
C0/2677:	C8      	INY 
C0/2678:	C00001  	CPY #$0100
C0/267B:	D0EF    	BNE $266C
C0/267D:	9C0072  	STZ $7200
C0/2680:	9C0172  	STZ $7201
C0/2683:	9C0074  	STZ $7400
C0/2686:	9C0174  	STZ $7401
C0/2689:	7B      	TDC 
C0/268A:	48      	PHA
C0/268B:	AB      	PLB
C0/268C:	60      	RTS
 
C0/268D:	A00000  	LDY #$0000		(from C0/BF5E)
C0/2690:	AD2705  	LDA $0527
C0/2693:	297F    	AND #$7F
C0/2695:	20D826  	JSR $26D8
C0/2698:	A00010  	LDY #$1000
C0/269B:	C220    	REP #$20      	(16 bit accum./memory)
C0/269D:	AD2705  	LDA $0527
C0/26A0:	0A      	ASL A
C0/26A1:	29007F  	AND #$7F00
C0/26A4:	EB      	XBA
C0/26A5:	E220    	SEP #$20      	(8 bit accum./memory)
C0/26A7:	20D826  	JSR $26D8
C0/26AA:	A00018  	LDY #$1800
C0/26AD:	C220    	REP #$20      	(16 bit accum./memory)
C0/26AF:	AD2805  	LDA $0528
C0/26B2:	0A      	ASL A
C0/26B3:	0A      	ASL A
C0/26B4:	29007F  	AND #$7F00
C0/26B7:	EB      	XBA
C0/26B8:	E220    	SEP #$20      	(8 bit accum./memory)
C0/26BA:	851B    	STA $1B
C0/26BC:	20D826  	JSR $26D8
C0/26BF:	A00020  	LDY #$2000
C0/26C2:	C220    	REP #$20      	(16 bit accum./memory)
C0/26C4:	AD2905  	LDA $0529
C0/26C7:	0A      	ASL A
C0/26C8:	0A      	ASL A
C0/26C9:	0A      	ASL A
C0/26CA:	29007F  	AND #$7F00
C0/26CD:	EB      	XBA
C0/26CE:	E220    	SEP #$20      	(8 bit accum./memory)
C0/26D0:	C51B    	CMP $1B
C0/26D2:	F003    	BEQ $26D7
C0/26D4:	20D826  	JSR $26D8
C0/26D7:	60      	RTS
 
C0/26D8:	8C1621  	STY $2116		(from C0/2695, C0/26A7, C0/26BC, C0/26D4)
C0/26DB:	851A    	STA $1A
C0/26DD:	0A      	ASL A
C0/26DE:	18      	CLC
C0/26DF:	651A    	ADC $1A
C0/26E1:	AA      	TAX
C0/26E2:	9C0B42  	STZ $420B      (turn off DMA)
C0/26E5:	A980    	LDA #$80
C0/26E7:	8D1521  	STA $2115
C0/26EA:	A941    	LDA #$41
C0/26EC:	8D0043  	STA $4300
C0/26EF:	A918    	LDA #$18
C0/26F1:	8D0143  	STA $4301
C0/26F4:	C220    	REP #$20      	(16 bit accum./memory)
C0/26F6:	BF00DADF	LDA $DFDA00,X	(Town tile graphics)
C0/26FA:	18      	CLC
C0/26FB:	6900DB  	ADC #$DB00
C0/26FE:	852A    	STA $2A
C0/2700:	8D0243  	STA $4302
C0/2703:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2705:	BF02DADF	LDA $DFDA02,X
C0/2709:	69DF    	ADC #$DF
C0/270B:	852C    	STA $2C
C0/270D:	8D0443  	STA $4304
C0/2710:	8D0743  	STA $4307
C0/2713:	C220    	REP #$20      	(16 bit accum./memory)
C0/2715:	A52A    	LDA $2A
C0/2717:	F037    	BEQ $2750
C0/2719:	7B      	TDC 
C0/271A:	38      	SEC 
C0/271B:	E52A    	SBC $2A
C0/271D:	C90020  	CMP #$2000
C0/2720:	B02E    	BCS $2750
C0/2722:	8D0543  	STA $4305
C0/2725:	851E    	STA $1E
C0/2727:	A90020  	LDA #$2000
C0/272A:	38      	SEC 
C0/272B:	E51E    	SBC $1E
C0/272D:	851E    	STA $1E
C0/272F:	7B      	TDC 
C0/2730:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2732:	A901    	LDA #$01
C0/2734:	8D0B42  	STA $420B      (turn off DMA)
C0/2737:	A52C    	LDA $2C
C0/2739:	1A      	INC A
C0/273A:	8D0443  	STA $4304
C0/273D:	8D0743  	STA $4307
C0/2740:	A600    	LDX $00
C0/2742:	8E0243  	STX $4302
C0/2745:	A61E    	LDX $1E
C0/2747:	8E0543  	STX $4305
C0/274A:	A901    	LDA #$01
C0/274C:	8D0B42  	STA $420B      (turn on channel 1 of DMA)
C0/274F:	60      	RTS
 
C0/2750:	7B      	TDC 
C0/2751:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2753:	A20020  	LDX #$2000
C0/2756:	8E0543  	STX $4305
C0/2759:	A901    	LDA #$01
C0/275B:	8D0B42  	STA $420B      (turn on channel 1 of DMA)
C0/275E:	60      	RTS
 
C0/275F:	C220    	REP #$20      	(from C0/BF61)(16 bit accum./memory)
C0/2761:	AD2A05  	LDA $052A
C0/2764:	4A      	LSR A
C0/2765:	4A      	LSR A
C0/2766:	4A      	LSR A
C0/2767:	4A      	LSR A
C0/2768:	293F00  	AND #$003F
C0/276B:	E220    	SEP #$20      	(8 bit accum./memory)
C0/276D:	851A    	STA $1A
C0/276F:	0A      	ASL A
C0/2770:	18      	CLC
C0/2771:	651A    	ADC $1A
C0/2773:	AA      	TAX
C0/2774:	C221    	REP #$21
C0/2776:	BF60CDE6	LDA $E6CD60,X
C0/277A:	698087  	ADC #$8780
C0/277D:	85F3    	STA $F3
C0/277F:	7B      	TDC 
C0/2780:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2782:	A9E6    	LDA #$E6
C0/2784:	85F5    	STA $F5        (source is E6:8780 + E6CD60,X)
C0/2786:	A240D0  	LDX #$D040
C0/2789:	86F6    	STX $F6
C0/278B:	A97F    	LDA #$7F
C0/278D:	85F8    	STA $F8        (destination is 7F:D040)
C0/278F:	226C04C0	JSL $C0046C    (LZ decompression)
C0/2793:	A97F    	LDA #$7F
C0/2795:	48      	PHA
C0/2796:	AB      	PLB           (set bank to 7F)
C0/2797:	A600    	LDX $00
C0/2799:	BD40D0  	LDA $D040,X
C0/279C:	9D00D0  	STA $D000,X
C0/279F:	E8      	INX
C0/27A0:	E04000  	CPX #$0040
C0/27A3:	D0F4    	BNE $2799
C0/27A5:	7B      	TDC 
C0/27A6:	48      	PHA
C0/27A7:	AB      	PLB
C0/27A8:	9C0B42  	STZ $420B      (turn off DMA)
C0/27AB:	A980    	LDA #$80
C0/27AD:	8D1521  	STA $2115
C0/27B0:	A20030  	LDX #$3000
C0/27B3:	8E1621  	STX $2116
C0/27B6:	A941    	LDA #$41
C0/27B8:	8D0043  	STA $4300
C0/27BB:	A918    	LDA #$18
C0/27BD:	8D0143  	STA $4301
C0/27C0:	A280D0  	LDX #$D080
C0/27C3:	8E0243  	STX $4302
C0/27C6:	A97F    	LDA #$7F
C0/27C8:	8D0443  	STA $4304
C0/27CB:	8D0743  	STA $4307
C0/27CE:	A20010  	LDX #$1000
C0/27D1:	8E0543  	STX $4305
C0/27D4:	A901    	LDA #$01
C0/27D6:	8D0B42  	STA $420B      (turn on channel 1 of DMA)
C0/27D9:	60      	RTS
 
C0/27DA:	C220    	REP #$20      	(from C0/BF70)(16 bit accum./memory)
C0/27DC:	AD2B05  	LDA $052B
C0/27DF:	4A      	LSR A
C0/27E0:	4A      	LSR A
C0/27E1:	297F00  	AND #$007F
C0/27E4:	E220    	SEP #$20      	(8 bit accum./memory)
C0/27E6:	851A    	STA $1A
C0/27E8:	0A      	ASL A
C0/27E9:	18      	CLC
C0/27EA:	651A    	ADC $1A
C0/27EC:	AA      	TAX
C0/27ED:	C221    	REP #$21
C0/27EF:	BF00BADF	LDA $DFBA00,X  (Pointer to Location Tile Formation)
C0/27F3:	690000  	ADC #$0000     (...)
C0/27F6:	85F3    	STA $F3
C0/27F8:	7B      	TDC 
C0/27F9:	E220    	SEP #$20      	(8 bit accum./memory)
C0/27FB:	BF02BADF	LDA $DFBA02,X
C0/27FF:	69DE    	ADC #$DE
C0/2801:	85F5    	STA $F5
C0/2803:	A240D0  	LDX #$D040
C0/2806:	86F6    	STX $F6
C0/2808:	A97F    	LDA #$7F
C0/280A:	85F8    	STA $F8        (destination is 7F:D040)
C0/280C:	226C04C0	JSL $C0046C    (LZ decompression)
C0/2810:	A200C0  	LDX #$C000
C0/2813:	8E8121  	STX $2181
C0/2816:	A97F    	LDA #$7F
C0/2818:	8D8321  	STA $2183
C0/281B:	A600    	LDX $00
C0/281D:	BF40D07F	LDA $7FD040,X
C0/2821:	8D8021  	STA $2180
C0/2824:	BF40D47F	LDA $7FD440,X
C0/2828:	8D8021  	STA $2180
C0/282B:	E8      	INX
C0/282C:	E00004  	CPX #$0400
C0/282F:	D0EC    	BNE $281D
C0/2831:	AD2C05  	LDA $052C
C0/2834:	4A      	LSR A
C0/2835:	297F    	AND #$7F
C0/2837:	851A    	STA $1A
C0/2839:	0A      	ASL A
C0/283A:	18      	CLC
C0/283B:	651A    	ADC $1A
C0/283D:	AA      	TAX
C0/283E:	C221    	REP #$21
C0/2840:	BF00BADF	LDA $DFBA00,X  (Pointer to Location Tile Formation)
C0/2844:	690000  	ADC #$0000
C0/2847:	85F3    	STA $F3
C0/2849:	7B      	TDC 
C0/284A:	E220    	SEP #$20      	(8 bit accum./memory)
C0/284C:	BF02BADF	LDA $DFBA02,X
C0/2850:	69DE    	ADC #$DE
C0/2852:	85F5    	STA $F5
C0/2854:	A240D0  	LDX #$D040
C0/2857:	86F6    	STX $F6
C0/2859:	A97F    	LDA #$7F
C0/285B:	85F8    	STA $F8
C0/285D:	226C04C0	JSL $C0046C    (LZ decompression)
C0/2861:	A200C8  	LDX #$C800
C0/2864:	8E8121  	STX $2181
C0/2867:	A97F    	LDA #$7F
C0/2869:	8D8321  	STA $2183
C0/286C:	A600    	LDX $00
C0/286E:	BF40D07F	LDA $7FD040,X
C0/2872:	8D8021  	STA $2180
C0/2875:	BF40D47F	LDA $7FD440,X
C0/2879:	8D8021  	STA $2180
C0/287C:	E8      	INX
C0/287D:	E00004  	CPX #$0400
C0/2880:	D0EC    	BNE $286E
C0/2882:	60      	RTS
 
C0/2883:	C220    	REP #$20      	(from C0/BF67) (16 bit accum./memory)
C0/2885:	AD2D05  	LDA $052D
C0/2888:	29FF03  	AND #$03FF
C0/288B:	851E    	STA $1E
C0/288D:	0A      	ASL A
C0/288E:	18      	CLC
C0/288F:	651E    	ADC $1E
C0/2891:	AA      	TAX
C0/2892:	BF90CDD9	LDA $D9CD90,X  (load pointers to location map data)
C0/2896:	18      	CLC
C0/2897:	69B0D1  	ADC #$D1B0
C0/289A:	85F3    	STA $F3
C0/289C:	7B      	TDC 
C0/289D:	E220    	SEP #$20      (8 bit accum./memory)
C0/289F:	BF92CDD9	LDA $D9CD92,X
C0/28A3:	69D9    	ADC #$D9
C0/28A5:	85F5    	STA $F5
C0/28A7:	E400    	CPX $00
C0/28A9:	F017    	BEQ $28C2
C0/28AB:	A240D0  	LDX #$D040
C0/28AE:	86F6    	STX $F6
C0/28B0:	A97F    	LDA #$7F
C0/28B2:	85F8    	STA $F8
C0/28B4:	226C04C0	JSL $C0046C    (LZ decompression)
C0/28B8:	A20000  	LDX #$0000
C0/28BB:	A586    	LDA $86
C0/28BD:	208029  	JSR $2980
C0/28C0:	8014    	BRA $28D6
C0/28C2:	A20000  	LDX #$0000
C0/28C5:	8E8121  	STX $2181
C0/28C8:	A97F    	LDA #$7F
C0/28CA:	8D8321  	STA $2183
C0/28CD:	A20040  	LDX #$4000
C0/28D0:	9C8021  	STZ $2180
C0/28D3:	CA      	DEX
C0/28D4:	D0FA    	BNE $28D0
C0/28D6:	C220    	REP #$20      (16 bit accum./memory)
C0/28D8:	AD2E05  	LDA $052E
C0/28DB:	4A      	LSR A
C0/28DC:	29FE07  	AND #$07FE
C0/28DF:	851E    	STA $1E
C0/28E1:	4A      	LSR A
C0/28E2:	18      	CLC
C0/28E3:	651E    	ADC $1E
C0/28E5:	AA      	TAX
C0/28E6:	BF90CDD9	LDA $D9CD90,X	(Loads pointer to location map data)
C0/28EA:	18      	CLC
C0/28EB:	69B0D1  	ADC #$D1B0
C0/28EE:	85F3    	STA $F3
C0/28F0:	7B      	TDC 
C0/28F1:	E220    	SEP #$20      	(8 bit accum./memory)
C0/28F3:	BF92CDD9	LDA $D9CD92,X
C0/28F7:	69D9    	ADC #$D9
C0/28F9:	85F5    	STA $F5
C0/28FB:	E400    	CPX $00
C0/28FD:	F017    	BEQ $2916
C0/28FF:	A240D0  	LDX #$D040
C0/2902:	86F6    	STX $F6
C0/2904:	A97F    	LDA #$7F
C0/2906:	85F8    	STA $F8
C0/2908:	226C04C0	JSL $C0046C    (LZ decompression)
C0/290C:	A20040  	LDX #$4000
C0/290F:	A588    	LDA $88
C0/2911:	208029  	JSR $2980
C0/2914:	8014    	BRA $292A
C0/2916:	A20040  	LDX #$4000
C0/2919:	8E8121  	STX $2181
C0/291C:	A97F    	LDA #$7F
C0/291E:	8D8321  	STA $2183
C0/2921:	A20040  	LDX #$4000
C0/2924:	9C8021  	STZ $2180
C0/2927:	CA      	DEX
C0/2928:	D0FA    	BNE $2924
C0/292A:	C220    	REP #$20      	(16 bit accum./memory)
C0/292C:	AD2F05  	LDA $052F
C0/292F:	4A      	LSR A
C0/2930:	4A      	LSR A
C0/2931:	4A      	LSR A
C0/2932:	29FE07  	AND #$07FE
C0/2935:	851E    	STA $1E
C0/2937:	4A      	LSR A
C0/2938:	18      	CLC
C0/2939:	651E    	ADC $1E
C0/293B:	AA      	TAX
C0/293C:	BF90CDD9	LDA $D9CD90,X
C0/2940:	18      	CLC
C0/2941:	69B0D1  	ADC #$D1B0
C0/2944:	85F3    	STA $F3
C0/2946:	7B      	TDC 
C0/2947:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2949:	BF92CDD9	LDA $D9CD92,X
C0/294D:	69D9    	ADC #$D9
C0/294F:	85F5    	STA $F5
C0/2951:	E400    	CPX $00
C0/2953:	F016    	BEQ $296B
C0/2955:	A240D0  	LDX #$D040
C0/2958:	86F6    	STX $F6
C0/295A:	A97F    	LDA #$7F
C0/295C:	85F8    	STA $F8
C0/295E:	226C04C0	JSL $C0046C    (LZ decompression)
C0/2962:	A20080  	LDX #$8000
C0/2965:	A58A    	LDA $8A
C0/2967:	208029  	JSR $2980
C0/296A:	60      	RTS
 
C0/296B:	A20080  	LDX #$8000
C0/296E:	8E8121  	STX $2181
C0/2971:	A97F    	LDA #$7F
C0/2973:	8D8321  	STA $2183
C0/2976:	A20040  	LDX #$4000
C0/2979:	9C8021  	STZ $2180
C0/297C:	CA      	DEX
C0/297D:	D0FA    	BNE $2979
C0/297F:	60      	RTS
 
C0/2980:	C90F    	CMP #$0F
C0/2982:	D003    	BNE $2987
C0/2984:	4CF529  	JMP $29F5

C0/2987:	C91F    	CMP #$1F
C0/2989:	D003    	BNE $298E
C0/298B:	4CCC29  	JMP $29CC

C0/298E:	C93F    	CMP #$3F
C0/2990:	D003    	BNE $2995
C0/2992:	4CA329  	JMP $29A3

C0/2995:	4C1E2A  	JMP $2A1E

C0/2998:	A040D0  	LDY #$D040
C0/299B:	8C8121  	STY $2181
C0/299E:	A97F    	LDA #$7F
C0/29A0:	8D8321  	STA $2183
C0/29A3:	A040D0  	LDY #$D040
C0/29A6:	8C8121  	STY $2181
C0/29A9:	A97F    	LDA #$7F
C0/29AB:	8D8321  	STA $2183
C0/29AE:	7B      	TDC 
C0/29AF:	A04000  	LDY #$0040
C0/29B2:	AD8021  	LDA $2180
C0/29B5:	9F00007F	STA $7F0000,X
C0/29B9:	E8      	INX
C0/29BA:	88      	DEY 
C0/29BB:	D0F5    	BNE $29B2
C0/29BD:	C221    	REP #$21
C0/29BF:	8A      	TXA
C0/29C0:	69C000  	ADC #$00C0
C0/29C3:	AA      	TAX
C0/29C4:	EB      	XBA
C0/29C5:	E220    	SEP #$20      (8 bit accum./memory)
C0/29C7:	293F    	AND #$3F
C0/29C9:	D0E3    	BNE $29AE
C0/29CB:	60      	RTS
 
C0/29CC:	A040D0  	LDY #$D040
C0/29CF:	8C8121  	STY $2181
C0/29D2:	A97F    	LDA #$7F
C0/29D4:	8D8321  	STA $2183
C0/29D7:	7B      	TDC 
C0/29D8:	A02000  	LDY #$0020
C0/29DB:	AD8021  	LDA $2180
C0/29DE:	9F00007F	STA $7F0000,X
C0/29E2:	E8      	INX
C0/29E3:	88      	DEY 
C0/29E4:	D0F5    	BNE $29DB
C0/29E6:	C221    	REP #$21
C0/29E8:	8A      	TXA
C0/29E9:	69E000  	ADC #$00E0
C0/29EC:	AA      	TAX
C0/29ED:	EB      	XBA
C0/29EE:	E220    	SEP #$20      (8 bit accum./memory)
C0/29F0:	293F    	AND #$3F
C0/29F2:	D0E3    	BNE $29D7
C0/29F4:	60      	RTS
 
C0/29F5:	A040D0  	LDY #$D040
C0/29F8:	8C8121  	STY $2181
C0/29FB:	A97F    	LDA #$7F
C0/29FD:	8D8321  	STA $2183
C0/2A00:	7B      	TDC 
C0/2A01:	A01000  	LDY #$0010
C0/2A04:	AD8021  	LDA $2180
C0/2A07:	9F00007F	STA $7F0000,X
C0/2A0B:	E8      	INX
C0/2A0C:	88      	DEY 
C0/2A0D:	D0F5    	BNE $2A04
C0/2A0F:	C221    	REP #$21
C0/2A11:	8A      	TXA
C0/2A12:	69F000  	ADC #$00F0
C0/2A15:	AA      	TAX
C0/2A16:	EB      	XBA
C0/2A17:	E220    	SEP #$20      (8 bit accum./memory)
C0/2A19:	293F    	AND #$3F
C0/2A1B:	D0E3    	BNE $2A00
C0/2A1D:	60      	RTS
 
C0/2A1E:	A040D0  	LDY #$D040
C0/2A21:	8C8121  	STY $2181
C0/2A24:	A97F    	LDA #$7F
C0/2A26:	8D8321  	STA $2183
C0/2A29:	7B      	TDC 
C0/2A2A:	A08000  	LDY #$0080
C0/2A2D:	AD8021  	LDA $2180
C0/2A30:	9F00007F	STA $7F0000,X
C0/2A34:	E8      	INX
C0/2A35:	88      	DEY 
C0/2A36:	D0F5    	BNE $2A2D
C0/2A38:	C221    	REP #$21
C0/2A3A:	8A      	TXA
C0/2A3B:	698000  	ADC #$0080
C0/2A3E:	AA      	TAX
C0/2A3F:	EB      	XBA
C0/2A40:	E220    	SEP #$20      (8 bit accum./memory)
C0/2A42:	293F    	AND #$3F
C0/2A44:	D0E3    	BNE $2A29
C0/2A46:	60      	RTS
 
C0/2A47:	9C0B42  	STZ $420B		(from C0/187D)
C0/2A4A:	A980    	LDA #$80
C0/2A4C:	8D1521  	STA $2115
C0/2A4F:	A691    	LDX $91
C0/2A51:	8E1621  	STX $2116
C0/2A54:	A941    	LDA #$41
C0/2A56:	8D0043  	STA $4300
C0/2A59:	A918    	LDA #$18
C0/2A5B:	8D0143  	STA $4301
C0/2A5E:	A2C0D9  	LDX #$D9C0
C0/2A61:	8E0243  	STX $4302
C0/2A64:	A97F    	LDA #$7F
C0/2A66:	8D0443  	STA $4304
C0/2A69:	8D0743  	STA $4307
C0/2A6C:	A28000  	LDX #$0080
C0/2A6F:	8E0543  	STX $4305
C0/2A72:	A901    	LDA #$01
C0/2A74:	8D0B42  	STA $420B
C0/2A77:	60      	RTS
 
C0/2A78:	9C0B42  	STZ $420B		(from only C0/01B7)
C0/2A7B:	A981    	LDA #$81
C0/2A7D:	8D1521  	STA $2115
C0/2A80:	A918    	LDA #$18
C0/2A82:	8D0143  	STA $4301
C0/2A85:	A941    	LDA #$41
C0/2A87:	8D0043  	STA $4300
C0/2A8A:	A693    	LDX $93
C0/2A8C:	8E1621  	STX $2116
C0/2A8F:	A240D8  	LDX #$D840
C0/2A92:	8E0243  	STX $4302
C0/2A95:	A97F    	LDA #$7F
C0/2A97:	8D0443  	STA $4304
C0/2A9A:	8D0743  	STA $4307
C0/2A9D:	A24000  	LDX #$0040
C0/2AA0:	8E0543  	STX $4305
C0/2AA3:	A901    	LDA #$01
C0/2AA5:	8D0B42  	STA $420B
C0/2AA8:	9C0B42  	STZ $420B
C0/2AAB:	A695    	LDX $95
C0/2AAD:	8E1621  	STX $2116
C0/2AB0:	A280D8  	LDX #$D880
C0/2AB3:	8E0243  	STX $4302
C0/2AB6:	A97F    	LDA #$7F
C0/2AB8:	8D0443  	STA $4304
C0/2ABB:	8D0743  	STA $4307
C0/2ABE:	A24000  	LDX #$0040
C0/2AC1:	8E0543  	STX $4305
C0/2AC4:	A901    	LDA #$01
C0/2AC6:	8D0B42  	STA $420B
C0/2AC9:	60      	RTS
 
C0/2ACA:	9C0B42  	STZ $420B		(from only C0/1883)
C0/2ACD:	A980    	LDA #$80
C0/2ACF:	8D1521  	STA $2115
C0/2AD2:	A697    	LDX $97
C0/2AD4:	8E1621  	STX $2116
C0/2AD7:	A941    	LDA #$41
C0/2AD9:	8D0043  	STA $4300
C0/2ADC:	A918    	LDA #$18
C0/2ADE:	8D0143  	STA $4301
C0/2AE1:	A2C0E1  	LDX #$E1C0
C0/2AE4:	8E0243  	STX $4302
C0/2AE7:	A97F    	LDA #$7F
C0/2AE9:	8D0443  	STA $4304
C0/2AEC:	8D0743  	STA $4307
C0/2AEF:	A28000  	LDX #$0080
C0/2AF2:	8E0543  	STX $4305
C0/2AF5:	A901    	LDA #$01
C0/2AF7:	8D0B42  	STA $420B
C0/2AFA:	60      	RTS
 
C0/2AFB:	9C0B42  	STZ $420B		(from only C0/0C14)
C0/2AFE:	A981    	LDA #$81
C0/2B00:	8D1521  	STA $2115
C0/2B03:	A918    	LDA #$18
C0/2B05:	8D0143  	STA $4301
C0/2B08:	A941    	LDA #$41
C0/2B0A:	8D0043  	STA $4300
C0/2B0D:	A699    	LDX $99
C0/2B0F:	8E1621  	STX $2116
C0/2B12:	A2C0D8  	LDX #$D8C0
C0/2B15:	8E0243  	STX $4302
C0/2B18:	A97F    	LDA #$7F
C0/2B1A:	8D0443  	STA $4304
C0/2B1D:	8D0743  	STA $4307
C0/2B20:	A24000  	LDX #$0040
C0/2B23:	8E0543  	STX $4305
C0/2B26:	A901    	LDA #$01
C0/2B28:	8D0B42  	STA $420B
C0/2B2B:	9C0B42  	STZ $420B      (turn off DMA)
C0/2B2E:	A69B    	LDX $9B
C0/2B30:	8E1621  	STX $2116
C0/2B33:	A200D9  	LDX #$D900
C0/2B36:	8E0243  	STX $4302
C0/2B39:	A97F    	LDA #$7F
C0/2B3B:	8D0443  	STA $4304
C0/2B3E:	8D0743  	STA $4307
C0/2B41:	A24000  	LDX #$0040
C0/2B44:	8E0543  	STX $4305
C0/2B47:	A901    	LDA #$01
C0/2B49:	8D0B42  	STA $420B
C0/2B4C:	60      	RTS
 
C0/2B4D:	9C0B42  	STZ $420B		(from C0/01FE, C0/1889)
C0/2B50:	A980    	LDA #$80
C0/2B52:	8D1521  	STA $2115
C0/2B55:	A69D    	LDX $9D
C0/2B57:	8E1621  	STX $2116
C0/2B5A:	A941    	LDA #$41
C0/2B5C:	8D0043  	STA $4300
C0/2B5F:	A918    	LDA #$18
C0/2B61:	8D0143  	STA $4301
C0/2B64:	A2C0E9  	LDX #$E9C0
C0/2B67:	8E0243  	STX $4302
C0/2B6A:	A97F    	LDA #$7F
C0/2B6C:	8D0443  	STA $4304
C0/2B6F:	8D0743  	STA $4307
C0/2B72:	A28000  	LDX #$0080
C0/2B75:	8E0543  	STX $4305
C0/2B78:	A901    	LDA #$01
C0/2B7A:	8D0B42  	STA $420B
C0/2B7D:	60      	RTS
 
C0/2B7E:	9C0B42  	STZ $420B		(from only C0/01EF)
C0/2B81:	A981    	LDA #$81
C0/2B83:	8D1521  	STA $2115
C0/2B86:	A918    	LDA #$18
C0/2B88:	8D0143  	STA $4301
C0/2B8B:	A941    	LDA #$41
C0/2B8D:	8D0043  	STA $4300
C0/2B90:	A69F    	LDX $9F
C0/2B92:	8E1621  	STX $2116
C0/2B95:	A240D9  	LDX #$D940
C0/2B98:	8E0243  	STX $4302
C0/2B9B:	A97F    	LDA #$7F
C0/2B9D:	8D0443  	STA $4304
C0/2BA0:	8D0743  	STA $4307
C0/2BA3:	A24000  	LDX #$0040
C0/2BA6:	8E0543  	STX $4305
C0/2BA9:	A901    	LDA #$01
C0/2BAB:	8D0B42  	STA $420B
C0/2BAE:	9C0B42  	STZ $420B      (turn off DMA)
C0/2BB1:	A6A1    	LDX $A1
C0/2BB3:	8E1621  	STX $2116
C0/2BB6:	A280D9  	LDX #$D980
C0/2BB9:	8E0243  	STX $4302
C0/2BBC:	A97F    	LDA #$7F
C0/2BBE:	8D0443  	STA $4304
C0/2BC1:	8D0743  	STA $4307
C0/2BC4:	A24000  	LDX #$0040
C0/2BC7:	8E0543  	STX $4305
C0/2BCA:	A901    	LDA #$01
C0/2BCC:	8D0B42  	STA $420B
C0/2BCF:	60      	RTS
 
C0/2BD0:	C220    	REP #$20      (16 bit accum./memory)
C0/2BD2:	E210    	SEP #$10      (8 bit index registers)
C0/2BD4:	A001    	LDY #$01
C0/2BD6:	A573    	LDA $73
C0/2BD8:	18      	CLC
C0/2BD9:	6D4705  	ADC $0547
C0/2BDC:	851E    	STA $1E
C0/2BDE:	F04E    	BEQ $2C2E
C0/2BE0:	3026    	BMI $2C08
C0/2BE2:	A55B    	LDA $5B
C0/2BE4:	29FF0F  	AND #$0FFF
C0/2BE7:	0900F0  	ORA #$F000
C0/2BEA:	18      	CLC
C0/2BEB:	651E    	ADC $1E
C0/2BED:	900A    	BCC $2BF9
C0/2BEF:	8C8605  	STY $0586
C0/2BF2:	AE4105  	LDX $0541
C0/2BF5:	E8      	INX
C0/2BF6:	8E4105  	STX $0541
C0/2BF9:	A55B    	LDA $5B
C0/2BFB:	18      	CLC
C0/2BFC:	651E    	ADC $1E
C0/2BFE:	855B    	STA $5B
C0/2C00:	A55D    	LDA $5D
C0/2C02:	6500    	ADC $00
C0/2C04:	855D    	STA $5D
C0/2C06:	8026    	BRA $2C2E
C0/2C08:	4502    	EOR $02
C0/2C0A:	1A      	INC A
C0/2C0B:	851E    	STA $1E
C0/2C0D:	A55B    	LDA $5B
C0/2C0F:	29FF0F  	AND #$0FFF
C0/2C12:	38      	SEC 
C0/2C13:	E51E    	SBC $1E
C0/2C15:	B00A    	BCS $2C21
C0/2C17:	8C8605  	STY $0586
C0/2C1A:	AE4105  	LDX $0541
C0/2C1D:	CA      	DEX
C0/2C1E:	8E4105  	STX $0541
C0/2C21:	A55B    	LDA $5B
C0/2C23:	38      	SEC 
C0/2C24:	E51E    	SBC $1E
C0/2C26:	855B    	STA $5B
C0/2C28:	A55D    	LDA $5D
C0/2C2A:	E500    	SBC $00
C0/2C2C:	855D    	STA $5D
C0/2C2E:	A575    	LDA $75
C0/2C30:	18      	CLC
C0/2C31:	6D4905  	ADC $0549
C0/2C34:	851E    	STA $1E
C0/2C36:	3026    	BMI $2C5E
C0/2C38:	A55F    	LDA $5F
C0/2C3A:	29FF0F  	AND #$0FFF
C0/2C3D:	0900F0  	ORA #$F000
C0/2C40:	18      	CLC
C0/2C41:	651E    	ADC $1E
C0/2C43:	900A    	BCC $2C4F
C0/2C45:	8C8505  	STY $0585
C0/2C48:	AE4205  	LDX $0542
C0/2C4B:	E8      	INX
C0/2C4C:	8E4205  	STX $0542
C0/2C4F:	A55F    	LDA $5F
C0/2C51:	18      	CLC
C0/2C52:	651E    	ADC $1E
C0/2C54:	855F    	STA $5F
C0/2C56:	A561    	LDA $61
C0/2C58:	6500    	ADC $00
C0/2C5A:	8561    	STA $61
C0/2C5C:	8026    	BRA $2C84
C0/2C5E:	4502    	EOR $02
C0/2C60:	1A      	INC A
C0/2C61:	851E    	STA $1E
C0/2C63:	A55F    	LDA $5F
C0/2C65:	29FF0F  	AND #$0FFF
C0/2C68:	38      	SEC 
C0/2C69:	E51E    	SBC $1E
C0/2C6B:	B00A    	BCS $2C77
C0/2C6D:	8C8505  	STY $0585
C0/2C70:	AE4205  	LDX $0542
C0/2C73:	CA      	DEX
C0/2C74:	8E4205  	STX $0542
C0/2C77:	A55F    	LDA $5F
C0/2C79:	38      	SEC 
C0/2C7A:	E51E    	SBC $1E
C0/2C7C:	855F    	STA $5F
C0/2C7E:	A561    	LDA $61
C0/2C80:	E500    	SBC $00
C0/2C82:	8561    	STA $61
C0/2C84:	A577    	LDA $77
C0/2C86:	18      	CLC
C0/2C87:	6D4B05  	ADC $054B
C0/2C8A:	851E    	STA $1E
C0/2C8C:	F04E    	BEQ $2CDC
C0/2C8E:	3026    	BMI $2CB6
C0/2C90:	A563    	LDA $63
C0/2C92:	29FF0F  	AND #$0FFF
C0/2C95:	0900F0  	ORA #$F000
C0/2C98:	18      	CLC
C0/2C99:	651E    	ADC $1E
C0/2C9B:	900A    	BCC $2CA7
C0/2C9D:	8C8805  	STY $0588
C0/2CA0:	AE4305  	LDX $0543
C0/2CA3:	E8      	INX
C0/2CA4:	8E4305  	STX $0543
C0/2CA7:	A563    	LDA $63
C0/2CA9:	18      	CLC
C0/2CAA:	651E    	ADC $1E
C0/2CAC:	8563    	STA $63
C0/2CAE:	A565    	LDA $65
C0/2CB0:	6500    	ADC $00
C0/2CB2:	8565    	STA $65
C0/2CB4:	8026    	BRA $2CDC
C0/2CB6:	4502    	EOR $02
C0/2CB8:	1A      	INC A
C0/2CB9:	851E    	STA $1E
C0/2CBB:	A563    	LDA $63
C0/2CBD:	29FF0F  	AND #$0FFF
C0/2CC0:	38      	SEC 
C0/2CC1:	E51E    	SBC $1E
C0/2CC3:	B00A    	BCS $2CCF
C0/2CC5:	8C8805  	STY $0588
C0/2CC8:	AE4305  	LDX $0543
C0/2CCB:	CA      	DEX
C0/2CCC:	8E4305  	STX $0543
C0/2CCF:	A563    	LDA $63
C0/2CD1:	38      	SEC 
C0/2CD2:	E51E    	SBC $1E
C0/2CD4:	8563    	STA $63
C0/2CD6:	A565    	LDA $65
C0/2CD8:	E500    	SBC $00
C0/2CDA:	8565    	STA $65
C0/2CDC:	A579    	LDA $79
C0/2CDE:	18      	CLC
C0/2CDF:	6D4D05  	ADC $054D
C0/2CE2:	851E    	STA $1E
C0/2CE4:	3026    	BMI $2D0C
C0/2CE6:	A567    	LDA $67
C0/2CE8:	29FF0F  	AND #$0FFF
C0/2CEB:	0900F0  	ORA #$F000
C0/2CEE:	18      	CLC
C0/2CEF:	651E    	ADC $1E
C0/2CF1:	900A    	BCC $2CFD
C0/2CF3:	8C8705  	STY $0587
C0/2CF6:	AE4405  	LDX $0544
C0/2CF9:	E8      	INX
C0/2CFA:	8E4405  	STX $0544
C0/2CFD:	A567    	LDA $67
C0/2CFF:	18      	CLC
C0/2D00:	651E    	ADC $1E
C0/2D02:	8567    	STA $67
C0/2D04:	A569    	LDA $69
C0/2D06:	6500    	ADC $00
C0/2D08:	8569    	STA $69
C0/2D0A:	8026    	BRA $2D32
C0/2D0C:	4502    	EOR $02
C0/2D0E:	1A      	INC A
C0/2D0F:	851E    	STA $1E
C0/2D11:	A567    	LDA $67
C0/2D13:	29FF0F  	AND #$0FFF
C0/2D16:	38      	SEC 
C0/2D17:	E51E    	SBC $1E
C0/2D19:	B00A    	BCS $2D25
C0/2D1B:	8C8705  	STY $0587
C0/2D1E:	AE4405  	LDX $0544
C0/2D21:	CA      	DEX
C0/2D22:	8E4405  	STX $0544
C0/2D25:	A567    	LDA $67
C0/2D27:	38      	SEC 
C0/2D28:	E51E    	SBC $1E
C0/2D2A:	8567    	STA $67
C0/2D2C:	A569    	LDA $69
C0/2D2E:	E500    	SBC $00
C0/2D30:	8569    	STA $69
C0/2D32:	A57B    	LDA $7B
C0/2D34:	18      	CLC
C0/2D35:	6D4F05  	ADC $054F
C0/2D38:	851E    	STA $1E
C0/2D3A:	F04E    	BEQ $2D8A
C0/2D3C:	3026    	BMI $2D64
C0/2D3E:	A56B    	LDA $6B
C0/2D40:	29FF0F  	AND #$0FFF
C0/2D43:	0900F0  	ORA #$F000
C0/2D46:	18      	CLC
C0/2D47:	651E    	ADC $1E
C0/2D49:	900A    	BCC $2D55
C0/2D4B:	8C8A05  	STY $058A
C0/2D4E:	AE4505  	LDX $0545
C0/2D51:	E8      	INX
C0/2D52:	8E4505  	STX $0545
C0/2D55:	A56B    	LDA $6B
C0/2D57:	18      	CLC
C0/2D58:	651E    	ADC $1E
C0/2D5A:	856B    	STA $6B
C0/2D5C:	A56D    	LDA $6D
C0/2D5E:	6500    	ADC $00
C0/2D60:	856D    	STA $6D
C0/2D62:	8026    	BRA $2D8A
C0/2D64:	4502    	EOR $02
C0/2D66:	1A      	INC A
C0/2D67:	851E    	STA $1E
C0/2D69:	A56B    	LDA $6B
C0/2D6B:	29FF0F  	AND #$0FFF
C0/2D6E:	38      	SEC 
C0/2D6F:	E51E    	SBC $1E
C0/2D71:	B00A    	BCS $2D7D
C0/2D73:	8C8A05  	STY $058A
C0/2D76:	AE4505  	LDX $0545
C0/2D79:	CA      	DEX
C0/2D7A:	8E4505  	STX $0545
C0/2D7D:	A56B    	LDA $6B
C0/2D7F:	38      	SEC 
C0/2D80:	E51E    	SBC $1E
C0/2D82:	856B    	STA $6B
C0/2D84:	A56D    	LDA $6D
C0/2D86:	E500    	SBC $00
C0/2D88:	856D    	STA $6D
C0/2D8A:	A57D    	LDA $7D
C0/2D8C:	18      	CLC
C0/2D8D:	6D5105  	ADC $0551
C0/2D90:	851E    	STA $1E
C0/2D92:	3026    	BMI $2DBA
C0/2D94:	A56F    	LDA $6F
C0/2D96:	29FF0F  	AND #$0FFF
C0/2D99:	0900F0  	ORA #$F000
C0/2D9C:	18      	CLC
C0/2D9D:	651E    	ADC $1E
C0/2D9F:	900A    	BCC $2DAB
C0/2DA1:	8C8905  	STY $0589
C0/2DA4:	AE4605  	LDX $0546
C0/2DA7:	E8      	INX
C0/2DA8:	8E4605  	STX $0546
C0/2DAB:	A56F    	LDA $6F
C0/2DAD:	18      	CLC
C0/2DAE:	651E    	ADC $1E
C0/2DB0:	856F    	STA $6F
C0/2DB2:	A571    	LDA $71
C0/2DB4:	6500    	ADC $00
C0/2DB6:	8571    	STA $71
C0/2DB8:	8026    	BRA $2DE0
C0/2DBA:	4502    	EOR $02
C0/2DBC:	1A      	INC A
C0/2DBD:	851E    	STA $1E
C0/2DBF:	A56F    	LDA $6F
C0/2DC1:	29FF0F  	AND #$0FFF
C0/2DC4:	38      	SEC 
C0/2DC5:	E51E    	SBC $1E
C0/2DC7:	B00A    	BCS $2DD3
C0/2DC9:	8C8905  	STY $0589
C0/2DCC:	AE4605  	LDX $0546
C0/2DCF:	CA      	DEX
C0/2DD0:	8E4605  	STX $0546
C0/2DD3:	A56F    	LDA $6F
C0/2DD5:	38      	SEC 
C0/2DD6:	E51E    	SBC $1E
C0/2DD8:	856F    	STA $6F
C0/2DDA:	A571    	LDA $71
C0/2DDC:	E500    	SBC $00
C0/2DDE:	8571    	STA $71
C0/2DE0:	C210    	REP #$10      	(16 bit index registers)
C0/2DE2:	7B      	TDC 
C0/2DE3:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2DE5:	60      	RTS
 
C0/2DE6:	A980    	LDA #$80		(from C0/35FE)
C0/2DE8:	8D1521  	STA $2115
C0/2DEB:	A2002E  	LDX #$2E00
C0/2DEE:	8E1621  	STX $2116
C0/2DF1:	A01C00  	LDY #$001C
C0/2DF4:	AD6505  	LDA $0565
C0/2DF7:	0A      	ASL A
C0/2DF8:	AA      	TAX
C0/2DF9:	C220    	REP #$20      	(16 bit accum./memory)
C0/2DFB:	BF982EC0	LDA $C02E98,X	(Offset of Menu X graphics)
C0/2DFF:	AA      	TAX
C0/2E00:	BF0000ED	LDA $ED0000,X	(Menu X graphics)
C0/2E04:	8D1821  	STA $2118
C0/2E07:	BF0200ED	LDA $ED0002,X	(Menu X graphics)
C0/2E0B:	8D1821  	STA $2118
C0/2E0E:	BF0400ED	LDA $ED0004,X	(Menu X graphics)
C0/2E12:	8D1821  	STA $2118
C0/2E15:	BF0600ED	LDA $ED0006,X	(Menu X graphics)
C0/2E19:	8D1821  	STA $2118
C0/2E1C:	BF0800ED	LDA $ED0008,X	(Menu X graphics)
C0/2E20:	8D1821  	STA $2118
C0/2E23:	BF0A00ED	LDA $ED000A,X	(Menu X graphics)
C0/2E27:	8D1821  	STA $2118
C0/2E2A:	BF0C00ED	LDA $ED000C,X	(Menu X graphics)
C0/2E2E:	8D1821  	STA $2118
C0/2E31:	BF0E00ED	LDA $ED000E,X	(Menu X graphics)
C0/2E35:	8D1821  	STA $2118
C0/2E38:	BF1000ED	LDA $ED0010,X	(Menu X graphics)
C0/2E3C:	0900FF  	ORA #$FF00
C0/2E3F:	8D1821  	STA $2118
C0/2E42:	BF1200ED	LDA $ED0012,X	(Menu X graphics)
C0/2E46:	0900FF  	ORA #$FF00
C0/2E49:	8D1821  	STA $2118
C0/2E4C:	BF1400ED	LDA $ED0014,X	(Menu X graphics)
C0/2E50:	0900FF  	ORA #$FF00
C0/2E53:	8D1821  	STA $2118
C0/2E56:	BF1600ED	LDA $ED0016,X	(Menu X graphics)
C0/2E5A:	0900FF  	ORA #$FF00
C0/2E5D:	8D1821  	STA $2118
C0/2E60:	BF1800ED	LDA $ED0018,X	(Menu X graphics)
C0/2E64:	0900FF  	ORA #$FF00
C0/2E67:	8D1821  	STA $2118
C0/2E6A:	BF1A00ED	LDA $ED001A,X	(Menu X graphics)
C0/2E6E:	0900FF  	ORA #$FF00
C0/2E71:	8D1821  	STA $2118
C0/2E74:	BF1C00ED	LDA $ED001C,X	(Menu X graphics)
C0/2E78:	0900FF  	ORA #$FF00
C0/2E7B:	8D1821  	STA $2118
C0/2E7E:	BF1E00ED	LDA $ED001E,X	(Menu X graphics)
C0/2E82:	0900FF  	ORA #$FF00
C0/2E85:	8D1821  	STA $2118
C0/2E88:	8A      	TXA
C0/2E89:	18      	CLC
C0/2E8A:	692000  	ADC #$0020
C0/2E8D:	AA      	TAX
C0/2E8E:	88      	DEY 
C0/2E8F:	F003    	BEQ $2E94
C0/2E91:	4C002E  	JMP $2E00

C0/2E94:	7B      	TDC 
C0/2E95:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2E97:	60      	RTS
 
Data 
Starting offsets of Menu X graphics

C0/2E98:	00 00    		
C0/2E9A:	80 03    		
C0/2E9C:	00 07    		
C0/2E9E:	80 0A    		
C0/2EA0:	00 0E    		
C0/2EA2:	80 11    		
C0/2EA4:	00 15    		
C0/2EA6:	80 18    		

C0/2EA8:	A97E    	LDA #$7E
C0/2EAA:	48      	PHA		 	
C0/2EAB:	AB      	PLB			(made the data bank reg. hold #$7E)
C0/2EAC:	C220    	REP #$20      	(16 bit accum./memory)
C0/2EAE:	ADFA7B  	LDA $7BFA
C0/2EB1:	8DD17E  	STA $7ED1
C0/2EB4:	ADFD7B  	LDA $7BFD
C0/2EB7:	8DD47E  	STA $7ED4
C0/2EBA:	AD007C  	LDA $7C00
C0/2EBD:	8DD77E  	STA $7ED7
C0/2EC0:	AD037C  	LDA $7C03
C0/2EC3:	8DDA7E  	STA $7EDA
C0/2EC6:	ADB07C  	LDA $7CB0
C0/2EC9:	8D857F  	STA $7F85
C0/2ECC:	ADB37C  	LDA $7CB3
C0/2ECF:	8D887F  	STA $7F88
C0/2ED2:	ADB67C  	LDA $7CB6
C0/2ED5:	8D8B7F  	STA $7F8B
C0/2ED8:	ADB97C  	LDA $7CB9
C0/2EDB:	8D8E7F  	STA $7F8E
C0/2EDE:	AD667D  	LDA $7D66
C0/2EE1:	8D3980  	STA $8039
C0/2EE4:	AD697D  	LDA $7D69
C0/2EE7:	8D3C80  	STA $803C
C0/2EEA:	AD6C7D  	LDA $7D6C
C0/2EED:	8D3F80  	STA $803F
C0/2EF0:	AD6F7D  	LDA $7D6F
C0/2EF3:	8D4280  	STA $8042
C0/2EF6:	AD1C7E  	LDA $7E1C
C0/2EF9:	8DED80  	STA $80ED
C0/2EFC:	AD1F7E  	LDA $7E1F
C0/2EFF:	8DF080  	STA $80F0
C0/2F02:	AD227E  	LDA $7E22
C0/2F05:	8DF380  	STA $80F3
C0/2F08:	AD257E  	LDA $7E25
C0/2F0B:	8DF680  	STA $80F6
C0/2F0E:	AD9F7B  	LDA $7B9F
C0/2F11:	8D777E  	STA $7E77
C0/2F14:	ADA27B  	LDA $7BA2
C0/2F17:	8D7A7E  	STA $7E7A
C0/2F1A:	ADA57B  	LDA $7BA5
C0/2F1D:	8D7D7E  	STA $7E7D
C0/2F20:	ADA87B  	LDA $7BA8
C0/2F23:	8D807E  	STA $7E80
C0/2F26:	AD0B7D  	LDA $7D0B
C0/2F29:	8DDF7F  	STA $7FDF
C0/2F2C:	AD0E7D  	LDA $7D0E
C0/2F2F:	8DE27F  	STA $7FE2
C0/2F32:	AD117D  	LDA $7D11
C0/2F35:	8DE57F  	STA $7FE5
C0/2F38:	AD147D  	LDA $7D14
C0/2F3B:	8DE87F  	STA $7FE8
C0/2F3E:	ADC17D  	LDA $7DC1
C0/2F41:	8D9380  	STA $8093
C0/2F44:	ADC47D  	LDA $7DC4
C0/2F47:	8D9680  	STA $8096
C0/2F4A:	ADC77D  	LDA $7DC7
C0/2F4D:	8D9980  	STA $8099
C0/2F50:	ADCA7D  	LDA $7DCA
C0/2F53:	8D9C80  	STA $809C
C0/2F56:	A93385  	LDA #$8533
C0/2F59:	8DFA7B  	STA $7BFA
C0/2F5C:	8DFD7B  	STA $7BFD
C0/2F5F:	8D007C  	STA $7C00
C0/2F62:	A95385  	LDA #$8553
C0/2F65:	8D037C  	STA $7C03
C0/2F68:	A97385  	LDA #$8573
C0/2F6B:	8DB07C  	STA $7CB0
C0/2F6E:	A98385  	LDA #$8583
C0/2F71:	8DB37C  	STA $7CB3
C0/2F74:	A99385  	LDA #$8593
C0/2F77:	8DB67C  	STA $7CB6
C0/2F7A:	A9A385  	LDA #$85A3
C0/2F7D:	8DB97C  	STA $7CB9
C0/2F80:	A9A38C  	LDA #$8CA3
C0/2F83:	8D667D  	STA $7D66
C0/2F86:	A9A38C  	LDA #$8CA3
C0/2F89:	8D697D  	STA $7D69
C0/2F8C:	A9A38C  	LDA #$8CA3
C0/2F8F:	8D6C7D  	STA $7D6C
C0/2F92:	A9A38C  	LDA #$8CA3
C0/2F95:	8D6F7D  	STA $7D6F
C0/2F98:	A9D38B  	LDA #$8BD3
C0/2F9B:	8D1C7E  	STA $7E1C
C0/2F9E:	A9E38B  	LDA #$8BE3
C0/2FA1:	8D1F7E  	STA $7E1F
C0/2FA4:	A9F38B  	LDA #$8BF3
C0/2FA7:	8D227E  	STA $7E22
C0/2FAA:	A9038C  	LDA #$8C03
C0/2FAD:	8D257E  	STA $7E25
C0/2FB0:	A9B381  	LDA #$81B3
C0/2FB3:	8D9F7B  	STA $7B9F
C0/2FB6:	8DA27B  	STA $7BA2
C0/2FB9:	8DA57B  	STA $7BA5
C0/2FBC:	8DA87B  	STA $7BA8
C0/2FBF:	A9438A  	LDA #$8A43
C0/2FC2:	8D0B7D  	STA $7D0B
C0/2FC5:	A9538A  	LDA #$8A53
C0/2FC8:	8D0E7D  	STA $7D0E
C0/2FCB:	A9638A  	LDA #$8A63
C0/2FCE:	8D117D  	STA $7D11
C0/2FD1:	A9738A  	LDA #$8A73
C0/2FD4:	8D147D  	STA $7D14
C0/2FD7:	A98381  	LDA #$8183
C0/2FDA:	8DC17D  	STA $7DC1
C0/2FDD:	8DC47D  	STA $7DC4
C0/2FE0:	8DC77D  	STA $7DC7
C0/2FE3:	8DCA7D  	STA $7DCA
C0/2FE6:	7B      	TDC 
C0/2FE7:	E220    	SEP #$20      	(8 bit accum./memory)
C0/2FE9:	7B      	TDC 
C0/2FEA:	48      	PHA
C0/2FEB:	AB      	PLB
C0/2FEC:	60      	RTS
 
C0/2FED:	AD4507  	LDA $0745
C0/2FF0:	F04D    	BEQ $303F
C0/2FF2:	A97E    	LDA #$7E
C0/2FF4:	48      	PHA
C0/2FF5:	AB      	PLB           (make the data bank reg. hold #$7E)
C0/2FF6:	A600    	LDX $00
C0/2FF8:	C220    	REP #$20       (16 bit accum./memory)
C0/2FFA:	BDD17E  	LDA $7ED1,X
C0/2FFD:	9DFA7B  	STA $7BFA,X
C0/3000:	BD857F  	LDA $7F85,X
C0/3003:	9DB07C  	STA $7CB0,X
C0/3006:	BD3980  	LDA $8039,X
C0/3009:	9D667D  	STA $7D66,X
C0/300C:	BDED80  	LDA $80ED,X
C0/300F:	9D1C7E  	STA $7E1C,X
C0/3012:	BD777E  	LDA $7E77,X
C0/3015:	9D9F7B  	STA $7B9F,X
C0/3018:	BDDF7F  	LDA $7FDF,X
C0/301B:	9D0B7D  	STA $7D0B,X
C0/301E:	BD9380  	LDA $8093,X
C0/3021:	9DC17D  	STA $7DC1,X
C0/3024:	E8      	INX
C0/3025:	E8      	INX
C0/3026:	E8      	INX
C0/3027:	E00C00  	CPX #$000C
C0/302A:	D0CE    	BNE $2FFA
C0/302C:	7B      	TDC 
C0/302D:	E220    	SEP #$20      	(8 bit accum./memory)
C0/302F:	7B      	TDC 
C0/3030:	48      	PHA
C0/3031:	AB      	PLB
C0/3032:	9C4507  	STZ $0745      (location name now disappears)
C0/3035:	9C6705  	STZ $0567      (set the timer for the location names to 0)
C0/3038:	9C6805  	STZ $0568
C0/303B:	A909    	LDA #$09
C0/303D:	85CC    	STA $CC
C0/303F:	60      	RTS
 
C0/3040:	A97E    	LDA #$7E		(is this function ever called?)
C0/3042:	48      	PHA
C0/3043:	AB      	PLB			(made the data bank reg. hold #$7E)
C0/3044:	A5BC    	LDA $BC
C0/3046:	0A      	ASL A
C0/3047:	18      	CLC
C0/3048:	65BC    	ADC $BC
C0/304A:	AA      	TAX
C0/304B:	A00800  	LDY #$0008
C0/304E:	C220    	REP #$20      	(16 bit accum./memory)
C0/3050:	BD9C7B  	LDA $7B9C,X
C0/3053:	9D747E  	STA $7E74,X
C0/3056:	BDF77B  	LDA $7BF7,X
C0/3059:	9DCE7E  	STA $7ECE,X
C0/305C:	BDAD7C  	LDA $7CAD,X
C0/305F:	9D827F  	STA $7F82,X
C0/3062:	BD637D  	LDA $7D63,X
C0/3065:	9D3680  	STA $8036,X
C0/3068:	BD087D  	LDA $7D08,X
C0/306B:	9DDC7F  	STA $7FDC,X
C0/306E:	BD197E  	LDA $7E19,X
C0/3071:	9DEA80  	STA $80EA,X
C0/3074:	E8      	INX
C0/3075:	E8      	INX
C0/3076:	E8      	INX
C0/3077:	88      	DEY
C0/3078:	D0D6    	BNE $3050
C0/307A:	7B      	TDC
C0/307B:	E220    	SEP #$20      	(8 bit accum./memory)
C0/307D:	7B      	TDC
C0/307E:	48      	PHA
C0/307F:	AB      	PLB
C0/3080:	60      	RTS
 
C0/3081:	A5BA    	LDA $BA		(from only C0/011C)
C0/3083:	D001    	BNE $3086
C0/3085:	60      	RTS
 
C0/3086:	A5BC    	LDA $BC		(from C0/3083)
C0/3088:	0A      	ASL A
C0/3089:	18      	CLC
C0/308A:	65BC    	ADC $BC
C0/308C:	AA      	TAX
C0/308D:	A5BA    	LDA $BA
C0/308F:	1003    	BPL $3094
C0/3091:	4CBA31  	JMP $31BA

C0/3094:	A5BB    	LDA $BB
C0/3096:	C905    	CMP #$05
C0/3098:	F0EB    	BEQ $3085
C0/309A:	0A      	ASL A
C0/309B:	851A    	STA $1A
C0/309D:	0A      	ASL A
C0/309E:	0A      	ASL A
C0/309F:	0A      	ASL A
C0/30A0:	18      	CLC
C0/30A1:	651A    	ADC $1A
C0/30A3:	A8      	TAY
C0/30A4:	AD6405  	LDA $0564
C0/30A7:	F003    	BEQ $30AC
C0/30A9:	4C3931  	JMP $3139

C0/30AC:	A9C0    	LDA #$C0
C0/30AE:	48      	PHA
C0/30AF:	AB      	PLB           (make the data bank reg. hold #$C0)
C0/30B0:	C220    	REP #$20      	(16 bit accum./memory)
C0/30B2:	A90900  	LDA #$0009
C0/30B5:	851E    	STA $1E
C0/30B7:	B97A32  	LDA $327A,Y    (C0/327A,Y)
C0/30BA:	F038    	BEQ $30F4
C0/30BC:	BFF77B7E	LDA $7E7BF7,X
C0/30C0:	9FCE7E7E	STA $7E7ECE,X
C0/30C4:	BFAD7C7E	LDA $7E7CAD,X
C0/30C8:	9F827F7E	STA $7E7F82,X
C0/30CC:	BF637D7E	LDA $7E7D63,X
C0/30D0:	9F36807E	STA $7E8036,X
C0/30D4:	BF197E7E	LDA $7E7E19,X
C0/30D8:	9FEA807E	STA $7E80EA,X
C0/30DC:	BF9C7B7E	LDA $7E7B9C,X
C0/30E0:	9F747E7E	STA $7E7E74,X
C0/30E4:	BF087D7E	LDA $7E7D08,X
C0/30E8:	9FDC7F7E	STA $7E7FDC,X
C0/30EC:	BFBE7D7E	LDA $7E7DBE,X
C0/30F0:	9F90807E	STA $7E8090,X
C0/30F4:	B9D432  	LDA $32D4,Y    (C0/32D4,Y)
C0/30F7:	F02E    	BEQ $3127
C0/30F9:	9FF77B7E	STA $7E7BF7,X
C0/30FD:	B92E33  	LDA $332E,Y    (C0/332E,Y)
C0/3100:	9FAD7C7E	STA $7E7CAD,X
C0/3104:	B98833  	LDA $3388,Y    (C0/3388,Y)
C0/3107:	9F637D7E	STA $7E7D63,X
C0/310B:	B9E233  	LDA $33E2,Y    (C0/33E2,Y)
C0/310E:	9F197E7E	STA $7E7E19,X
C0/3112:	B93C34  	LDA $343C,Y    (C0/343C,Y)
C0/3115:	9F9C7B7E	STA $7E7B9C,X
C0/3119:	B9F034  	LDA $34F0,Y    (C0/34F0,Y)
C0/311C:	9F087D7E	STA $7E7D08,X
C0/3120:	B94A35  	LDA $354A,Y    (C0/354A,Y)
C0/3123:	9FBE7D7E	STA $7E7DBE,X
C0/3127:	C8      	INY
C0/3128:	C8      	INY
C0/3129:	E8      	INX
C0/312A:	E8      	INX
C0/312B:	E8      	INX
C0/312C:	C61E    	DEC $1E
C0/312E:	D087    	BNE $30B7
C0/3130:	7B      	TDC
C0/3131:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3133:	E6BB    	INC $BB
C0/3135:	7B      	TDC
C0/3136:	48      	PHA
C0/3137:	AB      	PLB
C0/3138:	60      	RTS
 
C0/3139:	A9C0    	LDA #$C0		(from C0/30A9)
C0/313B:	48      	PHA
C0/313C:	AB      	PLB           (make the data bank reg. hold #$C0)
C0/313D:	C220    	REP #$20      	(16 bit accum./memory)
C0/313F:	A90900  	LDA #$0009
C0/3142:	851E    	STA $1E
C0/3144:	B97A32  	LDA $327A,Y
C0/3147:	F028    	BEQ $3171
C0/3149:	BFAD7C7E	LDA $7E7CAD,X
C0/314D:	9F827F7E	STA $7E7F82,X
C0/3151:	BF637D7E	LDA $7E7D63,X
C0/3155:	9F36807E	STA $7E8036,X
C0/3159:	BF9C7B7E	LDA $7E7B9C,X
C0/315D:	9F747E7E	STA $7E7E74,X
C0/3161:	BF197E7E	LDA $7E7E19,X
C0/3165:	9FEA807E	STA $7E80EA,X
C0/3169:	BFBE7D7E	LDA $7E7DBE,X
C0/316D:	9F90807E	STA $7E8090,X
C0/3171:	B92E33  	LDA $332E,Y
C0/3174:	F032    	BEQ $31A8
C0/3176:	9FAD7C7E	STA $7E7CAD,X
C0/317A:	B98833  	LDA $3388,Y
C0/317D:	9F637D7E	STA $7E7D63,X
C0/3181:	B99634  	LDA $3496,Y
C0/3184:	9F9C7B7E	STA $7E7B9C,X
C0/3188:	AFD81E00	LDA $001ED8
C0/318C:	290100  	AND #$0001
C0/318F:	D010    	BNE $31A1
C0/3191:	A9738C  	LDA #$8C73
C0/3194:	9F197E7E	STA $7E7E19,X
C0/3198:	B9A435  	LDA $35A4,Y
C0/319B:	9FBE7D7E	STA $7E7DBE,X
C0/319F:	8007    	BRA $31A8
C0/31A1:	A9A381  	LDA #$81A3
C0/31A4:	9FBE7D7E	STA $7E7DBE,X
C0/31A8:	C8      	INY
C0/31A9:	C8      	INY
C0/31AA:	E8      	INX
C0/31AB:	E8      	INX
C0/31AC:	E8      	INX
C0/31AD:	C61E    	DEC $1E
C0/31AF:	D093    	BNE $3144
C0/31B1:	7B      	TDC 
C0/31B2:	E220    	SEP #$20      (8 bit accum./memory)
C0/31B4:	E6BB    	INC $BB
C0/31B6:	7B      	TDC
C0/31B7:	48      	PHA
C0/31B8:	AB      	PLB
C0/31B9:	60      	RTS
 
C0/31BA:	A5BB    	LDA $BB		(is this function ever called?)
C0/31BC:	D003    	BNE $31C1
C0/31BE:	4C7732  	JMP $3277

C0/31C1:	C6BB    	DEC $BB
C0/31C3:	A5BB    	LDA $BB
C0/31C5:	0A      	ASL A
C0/31C6:	851A    	STA $1A
C0/31C8:	0A      	ASL A
C0/31C9:	0A      	ASL A
C0/31CA:	0A      	ASL A
C0/31CB:	18      	CLC
C0/31CC:	651A    	ADC $1A
C0/31CE:	A8      	TAY
C0/31CF:	AD6405  	LDA $0564
C0/31D2:	F003    	BEQ $31D7
C0/31D4:	4C2F32  	JMP $322F

C0/31D7:	A9C0    	LDA #$C0
C0/31D9:	48      	PHA
C0/31DA:	AB      	PLB           (make the data bank reg. hold #$C0)
C0/31DB:	C220    	REP #$20       (16 bit accum./memory)
C0/31DD:	A90900  	LDA #$0009
C0/31E0:	851E    	STA $1E
C0/31E2:	B97A32  	LDA $327A,Y
C0/31E5:	F038    	BEQ $321F
C0/31E7:	BFCE7E7E	LDA $7E7ECE,X
C0/31EB:	9FF77B7E	STA $7E7BF7,X
C0/31EF:	BF827F7E	LDA $7E7F82,X
C0/31F3:	9FAD7C7E	STA $7E7CAD,X
C0/31F7:	BF36807E	LDA $7E8036,X
C0/31FB:	9F637D7E	STA $7E7D63,X
C0/31FF:	BFEA807E	LDA $7E80EA,X
C0/3203:	9F197E7E	STA $7E7E19,X
C0/3207:	BF747E7E	LDA $7E7E74,X
C0/320B:	9F9C7B7E	STA $7E7B9C,X
C0/320F:	BFDC7F7E	LDA $7E7FDC,X
C0/3213:	9F087D7E	STA $7E7D08,X
C0/3217:	BF90807E	LDA $7E8090,X
C0/321B:	9FBE7D7E	STA $7E7DBE,X
C0/321F:	C8      	INY
C0/3220:	C8      	INY
C0/3221:	E8      	INX
C0/3222:	E8      	INX
C0/3223:	E8      	INX
C0/3224:	C61E    	DEC $1E
C0/3226:	D0BA    	BNE $31E2
C0/3228:	7B      	TDC
C0/3229:	E220    	SEP #$20      	(8 bit accum./memory)
C0/322B:	7B      	TDC
C0/322C:	48      	PHA
C0/322D:	AB      	PLB
C0/322E:	60      	RTS
 
C0/322F:	A9C0    	LDA #$C0
C0/3231:	48      	PHA
C0/3232:	AB      	PLB           (make the data bank reg. hold #$C0)
C0/3233:	C220    	REP #$20       (16 bit accum./memory)
C0/3235:	A90900  	LDA #$0009
C0/3238:	851E    	STA $1E
C0/323A:	B97A32  	LDA $327A,Y
C0/323D:	F028    	BEQ $3267
C0/323F:	BF827F7E	LDA $7E7F82,X
C0/3243:	9FAD7C7E	STA $7E7CAD,X
C0/3247:	BF36807E	LDA $7E8036,X
C0/324B:	9F637D7E	STA $7E7D63,X
C0/324F:	BF747E7E	LDA $7E7E74,X
C0/3253:	9F9C7B7E	STA $7E7B9C,X
C0/3257:	BFEA807E	LDA $7E80EA,X
C0/325B:	9F197E7E	STA $7E7E19,X
C0/325F:	BF90807E	LDA $7E8090,X
C0/3263:	9FBE7D7E	STA $7E7DBE,X
C0/3267:	C8      	INY
C0/3268:	C8      	INY
C0/3269:	E8      	INX
C0/326A:	E8      	INX
C0/326B:	E8      	INX
C0/326C:	C61E    	DEC $1E
C0/326E:	D0CA    	BNE $323A
C0/3270:	7B      	TDC
C0/3271:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3273:	7B      	TDC
C0/3274:	48      	PHA
C0/3275:	AB      	PLB
C0/3276:	60      	RTS
 
C0/3277:	64BA    	STZ $BA
C0/3279:	60      	RTS
 
C0/327A:	0000    	BRK #$00
C0/327C:	0000    	BRK #$00
C0/327E:	0000    	BRK #$00
C0/3280:	0000    	BRK #$00
C0/3282:	0100    	ORA ($00,X)
C0/3284:	0000    	BRK #$00
C0/3286:	0000    	BRK #$00
C0/3288:	0000    	BRK #$00
C0/328A:	0000    	BRK #$00
C0/328C:	0000    	BRK #$00
C0/328E:	0000    	BRK #$00
C0/3290:	0000    	BRK #$00
C0/3292:	0100    	ORA ($00,X)
C0/3294:	0000    	BRK #$00
C0/3296:	0100    	ORA ($00,X)
C0/3298:	0000    	BRK #$00
C0/329A:	0000    	BRK #$00
C0/329C:	0000    	BRK #$00
C0/329E:	0000    	BRK #$00
C0/32A0:	0000    	BRK #$00
C0/32A2:	0100    	ORA ($00,X)
C0/32A4:	0000    	BRK #$00
C0/32A6:	0000    	BRK #$00
C0/32A8:	0000    	BRK #$00
C0/32AA:	0100    	ORA ($00,X)
C0/32AC:	0000    	BRK #$00
C0/32AE:	0000    	BRK #$00
C0/32B0:	0000    	BRK #$00
C0/32B2:	0100    	ORA ($00,X)
C0/32B4:	0000    	BRK #$00
C0/32B6:	0000    	BRK #$00
C0/32B8:	0000    	BRK #$00
C0/32BA:	0000    	BRK #$00
C0/32BC:	0000    	BRK #$00
C0/32BE:	0100    	ORA ($00,X)
C0/32C0:	0000    	BRK #$00
C0/32C2:	0100    	ORA ($00,X)
C0/32C4:	0000    	BRK #$00
C0/32C6:	0000    	BRK #$00
C0/32C8:	0000    	BRK #$00
C0/32CA:	0000    	BRK #$00
C0/32CC:	0000    	BRK #$00
C0/32CE:	0000    	BRK #$00
C0/32D0:	0000    	BRK #$00
C0/32D2:	0100    	ORA ($00,X)
C0/32D4:	0000    	BRK #$00
C0/32D6:	0000    	BRK #$00
C0/32D8:	0000    	BRK #$00
C0/32DA:	0000    	BRK #$00
C0/32DC:	1385    	ORA ($85,S),Y
C0/32DE:	0000    	BRK #$00
C0/32E0:	0000    	BRK #$00
C0/32E2:	0000    	BRK #$00
C0/32E4:	0000    	BRK #$00
C0/32E6:	0000    	BRK #$00
C0/32E8:	0000    	BRK #$00
C0/32EA:	0000    	BRK #$00
C0/32EC:	B384    	LDA ($84,S),Y
C0/32EE:	D384    	CMP ($84,S),Y
C0/32F0:	F384    	SBC ($84,S),Y
C0/32F2:	0000    	BRK #$00
C0/32F4:	0000    	BRK #$00
C0/32F6:	0000    	BRK #$00
C0/32F8:	0000    	BRK #$00
C0/32FA:	0000    	BRK #$00
C0/32FC:	1384    	ORA ($84,S),Y
C0/32FE:	3384    	AND ($84,S),Y
C0/3300:	5384    	EOR ($84,S),Y
C0/3302:	7384    	ADC ($84,S),Y
C0/3304:	9384    	STA ($84,S),Y
C0/3306:	0000    	BRK #$00
C0/3308:	0000    	BRK #$00
C0/330A:	0000    	BRK #$00
C0/330C:	3383    	AND ($83,S),Y
C0/330E:	5383    	EOR ($83,S),Y
C0/3310:	7383    	ADC ($83,S),Y
C0/3312:	9383    	STA ($83,S),Y
C0/3314:	B383    	LDA ($83,S),Y
C0/3316:	D383    	CMP ($83,S),Y
C0/3318:	F383    	SBC ($83,S),Y
C0/331A:	0000    	BRK #$00
C0/331C:	1383    	ORA ($83,S),Y
C0/331E:	1383    	ORA ($83,S),Y
C0/3320:	1383    	ORA ($83,S),Y
C0/3322:	1383    	ORA ($83,S),Y
C0/3324:	1383    	ORA ($83,S),Y
C0/3326:	1383    	ORA ($83,S),Y
C0/3328:	1383    	ORA ($83,S),Y
C0/332A:	1383    	ORA ($83,S),Y
C0/332C:	1383    	ORA ($83,S),Y
C0/332E:	0000    	BRK #$00
C0/3330:	0000    	BRK #$00
C0/3332:	0000    	BRK #$00
C0/3334:	0000    	BRK #$00
C0/3336:	F385    	SBC ($85,S),Y
C0/3338:	0000    	BRK #$00
C0/333A:	0000    	BRK #$00
C0/333C:	0000    	BRK #$00
C0/333E:	0000    	BRK #$00
C0/3340:	0000    	BRK #$00
C0/3342:	0000    	BRK #$00
C0/3344:	0000    	BRK #$00
C0/3346:	F385    	SBC ($85,S),Y
C0/3348:	F385    	SBC ($85,S),Y
C0/334A:	F385    	SBC ($85,S),Y
C0/334C:	0000    	BRK #$00
C0/334E:	0000    	BRK #$00
C0/3350:	0000    	BRK #$00
C0/3352:	0000    	BRK #$00
C0/3354:	0000    	BRK #$00
C0/3356:	F385    	SBC ($85,S),Y
C0/3358:	F385    	SBC ($85,S),Y
C0/335A:	F385    	SBC ($85,S),Y
C0/335C:	F385    	SBC ($85,S),Y
C0/335E:	F385    	SBC ($85,S),Y
C0/3360:	0000    	BRK #$00
C0/3362:	0000    	BRK #$00
C0/3364:	0000    	BRK #$00
C0/3366:	F385    	SBC ($85,S),Y
C0/3368:	F385    	SBC ($85,S),Y
C0/336A:	F385    	SBC ($85,S),Y
C0/336C:	F385    	SBC ($85,S),Y
C0/336E:	F385    	SBC ($85,S),Y
C0/3370:	F385    	SBC ($85,S),Y
C0/3372:	F385    	SBC ($85,S),Y
C0/3374:	0000    	BRK #$00
C0/3376:	F385    	SBC ($85,S),Y
C0/3378:	1386    	ORA ($86,S),Y
C0/337A:	3386    	AND ($86,S),Y
C0/337C:	5386    	EOR ($86,S),Y
C0/337E:	7386    	ADC ($86,S),Y
C0/3380:	9386    	STA ($86,S),Y
C0/3382:	B386    	LDA ($86,S),Y
C0/3384:	D386    	CMP ($86,S),Y
C0/3386:	F386    	SBC ($86,S),Y
C0/3388:	0000    	BRK #$00
C0/338A:	0000    	BRK #$00
C0/338C:	0000    	BRK #$00
C0/338E:	0000    	BRK #$00
C0/3390:	A38C    	LDA $8C,S
C0/3392:	0000    	BRK #$00
C0/3394:	0000    	BRK #$00
C0/3396:	0000    	BRK #$00
C0/3398:	0000    	BRK #$00
C0/339A:	0000    	BRK #$00
C0/339C:	0000    	BRK #$00
C0/339E:	0000    	BRK #$00
C0/33A0:	A38C    	LDA $8C,S
C0/33A2:	A38C    	LDA $8C,S
C0/33A4:	A38C    	LDA $8C,S
C0/33A6:	0000    	BRK #$00
C0/33A8:	0000    	BRK #$00
C0/33AA:	0000    	BRK #$00
C0/33AC:	0000    	BRK #$00
C0/33AE:	0000    	BRK #$00
C0/33B0:	A38C    	LDA $8C,S
C0/33B2:	A38C    	LDA $8C,S
C0/33B4:	A38C    	LDA $8C,S
C0/33B6:	A38C    	LDA $8C,S
C0/33B8:	A38C    	LDA $8C,S
C0/33BA:	0000    	BRK #$00
C0/33BC:	0000    	BRK #$00
C0/33BE:	0000    	BRK #$00
C0/33C0:	A38C    	LDA $8C,S
C0/33C2:	A38C    	LDA $8C,S
C0/33C4:	A38C    	LDA $8C,S
C0/33C6:	A38C    	LDA $8C,S
C0/33C8:	A38C    	LDA $8C,S
C0/33CA:	A38C    	LDA $8C,S
C0/33CC:	A38C    	LDA $8C,S
C0/33CE:	0000    	BRK #$00
C0/33D0:	A38C    	LDA $8C,S
C0/33D2:	A38C    	LDA $8C,S
C0/33D4:	A38C    	LDA $8C,S
C0/33D6:	A38C    	LDA $8C,S
C0/33D8:	A38C    	LDA $8C,S
C0/33DA:	A38C    	LDA $8C,S
C0/33DC:	A38C    	LDA $8C,S
C0/33DE:	A38C    	LDA $8C,S
C0/33E0:	A38C    	LDA $8C,S
C0/33E2:	0000    	BRK #$00
C0/33E4:	0000    	BRK #$00
C0/33E6:	0000    	BRK #$00
C0/33E8:	0000    	BRK #$00
C0/33EA:	538C    	EOR ($8C,S),Y
C0/33EC:	0000    	BRK #$00
C0/33EE:	0000    	BRK #$00
C0/33F0:	0000    	BRK #$00
C0/33F2:	0000    	BRK #$00
C0/33F4:	0000    	BRK #$00
C0/33F6:	0000    	BRK #$00
C0/33F8:	0000    	BRK #$00
C0/33FA:	238C    	AND $8C,S
C0/33FC:	338C    	AND ($8C,S),Y
C0/33FE:	438C    	EOR $8C,S
C0/3400:	0000    	BRK #$00
C0/3402:	0000    	BRK #$00
C0/3404:	0000    	BRK #$00
C0/3406:	0000    	BRK #$00
C0/3408:	0000    	BRK #$00
C0/340A:	D38B    	CMP ($8B,S),Y
C0/340C:	E38B    	SBC $8B,S
C0/340E:	F38B    	SBC ($8B,S),Y
C0/3410:	038C    	ORA $8C,S
C0/3412:	138C    	ORA ($8C,S),Y
C0/3414:	0000    	BRK #$00
C0/3416:	0000    	BRK #$00
C0/3418:	0000    	BRK #$00
C0/341A:	638B    	ADC $8B,S
C0/341C:	738B    	ADC ($8B,S),Y
C0/341E:	838B    	STA $8B,S
C0/3420:	938B    	STA ($8B,S),Y
C0/3422:	A38B    	LDA $8B,S
C0/3424:	B38B    	LDA ($8B,S),Y
C0/3426:	C38B    	CMP $8B,S
C0/3428:	0000    	BRK #$00
C0/342A:	D38A    	CMP ($8A,S),Y
C0/342C:	E38A    	SBC $8A,S
C0/342E:	F38A    	SBC ($8A,S),Y
C0/3430:	038B    	ORA $8B,S
C0/3432:	138B    	ORA ($8B,S),Y
C0/3434:	238B    	AND $8B,S
C0/3436:	338B    	AND ($8B,S),Y
C0/3438:	438B    	EOR $8B,S
C0/343A:	538B    	EOR ($8B,S),Y
C0/343C:	0000    	BRK #$00
C0/343E:	0000    	BRK #$00
C0/3440:	0000    	BRK #$00
C0/3442:	0000    	BRK #$00
C0/3444:	B381    	LDA ($81,S),Y
C0/3446:	0000    	BRK #$00
C0/3448:	0000    	BRK #$00
C0/344A:	0000    	BRK #$00
C0/344C:	0000    	BRK #$00
C0/344E:	0000    	BRK #$00
C0/3450:	0000    	BRK #$00
C0/3452:	0000    	BRK #$00
C0/3454:	B381    	LDA ($81,S),Y
C0/3456:	B381    	LDA ($81,S),Y
C0/3458:	B381    	LDA ($81,S),Y
C0/345A:	0000    	BRK #$00
C0/345C:	0000    	BRK #$00
C0/345E:	0000    	BRK #$00
C0/3460:	0000    	BRK #$00
C0/3462:	0000    	BRK #$00
C0/3464:	B381    	LDA ($81,S),Y
C0/3466:	B381    	LDA ($81,S),Y
C0/3468:	B381    	LDA ($81,S),Y
C0/346A:	B381    	LDA ($81,S),Y
C0/346C:	B381    	LDA ($81,S),Y
C0/346E:	0000    	BRK #$00
C0/3470:	0000    	BRK #$00
C0/3472:	0000    	BRK #$00
C0/3474:	B381    	LDA ($81,S),Y
C0/3476:	B381    	LDA ($81,S),Y
C0/3478:	B381    	LDA ($81,S),Y
C0/347A:	B381    	LDA ($81,S),Y
C0/347C:	B381    	LDA ($81,S),Y
C0/347E:	B381    	LDA ($81,S),Y
C0/3480:	B381    	LDA ($81,S),Y
C0/3482:	0000    	BRK #$00
C0/3484:	B381    	LDA ($81,S),Y
C0/3486:	B381    	LDA ($81,S),Y
C0/3488:	B381    	LDA ($81,S),Y
C0/348A:	B381    	LDA ($81,S),Y
C0/348C:	B381    	LDA ($81,S),Y
C0/348E:	B381    	LDA ($81,S),Y
C0/3490:	B381    	LDA ($81,S),Y
C0/3492:	B381    	LDA ($81,S),Y
C0/3494:	B381    	LDA ($81,S),Y
C0/3496:	0000    	BRK #$00
C0/3498:	0000    	BRK #$00
C0/349A:	0000    	BRK #$00
C0/349C:	0000    	BRK #$00
C0/349E:	D381    	CMP ($81,S),Y
C0/34A0:	0000    	BRK #$00
C0/34A2:	0000    	BRK #$00
C0/34A4:	0000    	BRK #$00
C0/34A6:	0000    	BRK #$00
C0/34A8:	0000    	BRK #$00
C0/34AA:	0000    	BRK #$00
C0/34AC:	0000    	BRK #$00
C0/34AE:	D381    	CMP ($81,S),Y
C0/34B0:	D381    	CMP ($81,S),Y
C0/34B2:	D381    	CMP ($81,S),Y
C0/34B4:	0000    	BRK #$00
C0/34B6:	0000    	BRK #$00
C0/34B8:	0000    	BRK #$00
C0/34BA:	0000    	BRK #$00
C0/34BC:	0000    	BRK #$00
C0/34BE:	D381    	CMP ($81,S),Y
C0/34C0:	D381    	CMP ($81,S),Y
C0/34C2:	D381    	CMP ($81,S),Y
C0/34C4:	D381    	CMP ($81,S),Y
C0/34C6:	D381    	CMP ($81,S),Y
C0/34C8:	0000    	BRK #$00
C0/34CA:	0000    	BRK #$00
C0/34CC:	0000    	BRK #$00
C0/34CE:	D381    	CMP ($81,S),Y
C0/34D0:	D381    	CMP ($81,S),Y
C0/34D2:	D381    	CMP ($81,S),Y
C0/34D4:	D381    	CMP ($81,S),Y
C0/34D6:	D381    	CMP ($81,S),Y
C0/34D8:	D381    	CMP ($81,S),Y
C0/34DA:	D381    	CMP ($81,S),Y
C0/34DC:	0000    	BRK #$00
C0/34DE:	D381    	CMP ($81,S),Y
C0/34E0:	D381    	CMP ($81,S),Y
C0/34E2:	D381    	CMP ($81,S),Y
C0/34E4:	D381    	CMP ($81,S),Y
C0/34E6:	D381    	CMP ($81,S),Y
C0/34E8:	D381    	CMP ($81,S),Y
C0/34EA:	D381    	CMP ($81,S),Y
C0/34EC:	D381    	CMP ($81,S),Y
C0/34EE:	D381    	CMP ($81,S),Y
C0/34F0:	0000    	BRK #$00
C0/34F2:	0000    	BRK #$00
C0/34F4:	0000    	BRK #$00
C0/34F6:	0000    	BRK #$00
C0/34F8:	C38A    	CMP $8A,S
C0/34FA:	0000    	BRK #$00
C0/34FC:	0000    	BRK #$00
C0/34FE:	0000    	BRK #$00
C0/3500:	0000    	BRK #$00
C0/3502:	0000    	BRK #$00
C0/3504:	0000    	BRK #$00
C0/3506:	0000    	BRK #$00
C0/3508:	938A    	STA ($8A,S),Y
C0/350A:	A38A    	LDA $8A,S
C0/350C:	B38A    	LDA ($8A,S),Y
C0/350E:	0000    	BRK #$00
C0/3510:	0000    	BRK #$00
C0/3512:	0000    	BRK #$00
C0/3514:	0000    	BRK #$00
C0/3516:	0000    	BRK #$00
C0/3518:	438A    	EOR $8A,S
C0/351A:	538A    	EOR ($8A,S),Y
C0/351C:	638A    	ADC $8A,S
C0/351E:	738A    	ADC ($8A,S),Y
C0/3520:	838A    	STA $8A,S
C0/3522:	0000    	BRK #$00
C0/3524:	0000    	BRK #$00
C0/3526:	0000    	BRK #$00
C0/3528:	D389    	CMP ($89,S),Y
C0/352A:	E389    	SBC $89,S
C0/352C:	F389    	SBC ($89,S),Y
C0/352E:	038A    	ORA $8A,S
C0/3530:	138A    	ORA ($8A,S),Y
C0/3532:	238A    	AND $8A,S
C0/3534:	338A    	AND ($8A,S),Y
C0/3536:	0000    	BRK #$00
C0/3538:	4389    	EOR $89,S
C0/353A:	5389    	EOR ($89,S),Y
C0/353C:	6389    	ADC $89,S
C0/353E:	7389    	ADC ($89,S),Y
C0/3540:	8389    	STA $89,S
C0/3542:	9389    	STA ($89,S),Y
C0/3544:	A389    	LDA $89,S
C0/3546:	B389    	LDA ($89,S),Y
C0/3548:	C389    	CMP $89,S
C0/354A:	0000    	BRK #$00
C0/354C:	0000    	BRK #$00
C0/354E:	0000    	BRK #$00
C0/3550:	0000    	BRK #$00
C0/3552:	8381    	STA $81,S
C0/3554:	0000    	BRK #$00
C0/3556:	0000    	BRK #$00
C0/3558:	0000    	BRK #$00
C0/355A:	0000    	BRK #$00
C0/355C:	0000    	BRK #$00
C0/355E:	0000    	BRK #$00
C0/3560:	0000    	BRK #$00
C0/3562:	8381    	STA $81,S
C0/3564:	8381    	STA $81,S
C0/3566:	8381    	STA $81,S
C0/3568:	0000    	BRK #$00
C0/356A:	0000    	BRK #$00
C0/356C:	0000    	BRK #$00
C0/356E:	0000    	BRK #$00
C0/3570:	0000    	BRK #$00
C0/3572:	8381    	STA $81,S
C0/3574:	8381    	STA $81,S
C0/3576:	8381    	STA $81,S
C0/3578:	8381    	STA $81,S
C0/357A:	8381    	STA $81,S
C0/357C:	0000    	BRK #$00
C0/357E:	0000    	BRK #$00
C0/3580:	0000    	BRK #$00
C0/3582:	8381    	STA $81,S
C0/3584:	8381    	STA $81,S
C0/3586:	8381    	STA $81,S
C0/3588:	8381    	STA $81,S
C0/358A:	8381    	STA $81,S
C0/358C:	8381    	STA $81,S
C0/358E:	8381    	STA $81,S
C0/3590:	0000    	BRK #$00
C0/3592:	8381    	STA $81,S
C0/3594:	8381    	STA $81,S
C0/3596:	8381    	STA $81,S
C0/3598:	8381    	STA $81,S
C0/359A:	8381    	STA $81,S
C0/359C:	8381    	STA $81,S
C0/359E:	8381    	STA $81,S
C0/35A0:	8381    	STA $81,S
C0/35A2:	8381    	STA $81,S
C0/35A4:	0000    	BRK #$00
C0/35A6:	0000    	BRK #$00
C0/35A8:	0000    	BRK #$00
C0/35AA:	0000    	BRK #$00
C0/35AC:	9381    	STA ($81,S),Y
C0/35AE:	0000    	BRK #$00
C0/35B0:	0000    	BRK #$00
C0/35B2:	0000    	BRK #$00
C0/35B4:	0000    	BRK #$00
C0/35B6:	0000    	BRK #$00
C0/35B8:	0000    	BRK #$00
C0/35BA:	0000    	BRK #$00
C0/35BC:	9381    	STA ($81,S),Y
C0/35BE:	9381    	STA ($81,S),Y
C0/35C0:	9381    	STA ($81,S),Y
C0/35C2:	0000    	BRK #$00
C0/35C4:	0000    	BRK #$00
C0/35C6:	0000    	BRK #$00
C0/35C8:	0000    	BRK #$00
C0/35CA:	0000    	BRK #$00
C0/35CC:	9381    	STA ($81,S),Y
C0/35CE:	9381    	STA ($81,S),Y
C0/35D0:	9381    	STA ($81,S),Y
C0/35D2:	9381    	STA ($81,S),Y
C0/35D4:	9381    	STA ($81,S),Y
C0/35D6:	0000    	BRK #$00
C0/35D8:	0000    	BRK #$00
C0/35DA:	0000    	BRK #$00
C0/35DC:	9381    	STA ($81,S),Y
C0/35DE:	9381    	STA ($81,S),Y
C0/35E0:	9381    	STA ($81,S),Y
C0/35E2:	9381    	STA ($81,S),Y
C0/35E4:	9381    	STA ($81,S),Y
C0/35E6:	9381    	STA ($81,S),Y
C0/35E8:	9381    	STA ($81,S),Y
C0/35EA:	0000    	BRK #$00
C0/35EC:	9381    	STA ($81,S),Y
C0/35EE:	9381    	STA ($81,S),Y
C0/35F0:	9381    	STA ($81,S),Y
C0/35F2:	9381    	STA ($81,S),Y
C0/35F4:	9381    	STA ($81,S),Y
C0/35F6:	9381    	STA ($81,S),Y
C0/35F8:	9381    	STA ($81,S),Y
C0/35FA:	9381    	STA ($81,S),Y
C0/35FC:	9381    	STA ($81,S),Y

C0/35FE:	20E62D  	JSR $2DE6		(from only C0/BF85)
C0/3601:	AD6505  	LDA $0565
C0/3604:	8D0242  	STA $4202
C0/3607:	A90E    	LDA #$0E
C0/3609:	8D0342  	STA $4203      (multiply by 14)
C0/360C:	EA      	NOP
C0/360D:	EA      	NOP
C0/360E:	A600    	LDX $00
C0/3610:	AC1642  	LDY $4216
C0/3613:	B9571D  	LDA $1D57,Y    (colors for the wallpaper)
C0/3616:	9FF2727E	STA $7E72F2,X
C0/361A:	9FF2747E	STA $7E74F2,X
C0/361E:	E8      	INX
C0/361F:	C8      	INY
C0/3620:	E00E00  	CPX #$000E
C0/3623:	D0EE    	BNE $3613
C0/3625:	A980    	LDA #$80
C0/3627:	8D1521  	STA $2115
C0/362A:	A22040  	LDX #$4020
C0/362D:	8E1621  	STX $2116
C0/3630:	A600    	LDX $00
C0/3632:	BF0137C0	LDA $C03701,X
C0/3636:	8D1821  	STA $2118
C0/3639:	A93E    	LDA #$3E
C0/363B:	8D1921  	STA $2119
C0/363E:	E8      	INX
C0/363F:	E02001  	CPX #$0120
C0/3642:	D0EE    	BNE $3632
C0/3644:	A24042  	LDX #$4240
C0/3647:	8E1621  	STX $2116
C0/364A:	A600    	LDX $00
C0/364C:	BF0137C0	LDA $C03701,X
C0/3650:	8D1821  	STA $2118
C0/3653:	A93E    	LDA #$3E
C0/3655:	8D1921  	STA $2119
C0/3658:	E8      	INX
C0/3659:	E02001  	CPX #$0120
C0/365C:	D0EE    	BNE $364C
C0/365E:	A20044  	LDX #$4400
C0/3661:	8E1621  	STX $2116
C0/3664:	A22000  	LDX #$0020
C0/3667:	A9FF    	LDA #$FF
C0/3669:	8D1821  	STA $2118
C0/366C:	A921    	LDA #$21
C0/366E:	8D1921  	STA $2119
C0/3671:	CA      	DEX
C0/3672:	D0F3    	BNE $3667
C0/3674:	209B36  	JSR $369B
C0/3677:	A22001  	LDX #$0120
C0/367A:	A9FF    	LDA #$FF
C0/367C:	8D1821  	STA $2118
C0/367F:	A921    	LDA #$21
C0/3681:	8D1921  	STA $2119
C0/3684:	CA      	DEX
C0/3685:	D0F3    	BNE $367A
C0/3687:	209B36  	JSR $369B
C0/368A:	A22000  	LDX #$0020
C0/368D:	A9FF    	LDA #$FF
C0/368F:	8D1821  	STA $2118
C0/3692:	A921    	LDA #$21
C0/3694:	8D1921  	STA $2119
C0/3697:	CA      	DEX
C0/3698:	D0F3    	BNE $368D
C0/369A:	60      	RTS
 
C0/369B:	A400    	LDY $00		(from C0/3674, C0/3687)
C0/369D:	A600    	LDX $00
C0/369F:	BFC136C0	LDA $C036C1,X
C0/36A3:	3006    	BMI $36AB
C0/36A5:	98      	TYA
C0/36A6:	18      	CLC
C0/36A7:	7FC136C0	ADC $C036C1,X
C0/36AB:	8D1821  	STA $2118
C0/36AE:	A921    	LDA #$21
C0/36B0:	8D1921  	STA $2119
C0/36B3:	E8      	INX
C0/36B4:	E04000  	CPX #$0040
C0/36B7:	D0E6    	BNE $369F
C0/36B9:	98      	TYA
C0/36BA:	18      	CLC
C0/36BB:	6940    	ADC #$40
C0/36BD:	A8      	TAY
C0/36BE:	D0DD    	BNE $369D
C0/36C0:	60      	RTS

Data loaded from C0/369F, added at C0/36A7
 
C0/36C1:	FFFF0002	SBC $0200FF,X
C0/36C5:	0406    	TSB $06
C0/36C7:	08      	PHP 
C0/36C8:	0A      	ASL A
C0/36C9:	0C0E10  	TSB $100E
C0/36CC:	1214    	ORA ($14)
C0/36CE:	1618    	ASL $18,X
C0/36D0:	1A      	INC A
C0/36D1:	1C1E20  	TRB $201E
C0/36D4:	22242628	JSR $282624
C0/36D8:	2A      	ROL A
C0/36D9:	2C2E30  	BIT $302E
C0/36DC:	3234    	AND ($34)
C0/36DE:	36FF    	ROL $FF,X
C0/36E0:	FFFFFF01	SBC $01FFFF,X
C0/36E4:	0305    	ORA $05,S
C0/36E6:	0709    	ORA [$09]
C0/36E8:	0B      	PHD
C0/36E9:	0D0F11  	ORA $110F
C0/36EC:	1315    	ORA ($15,S),Y
C0/36EE:	1719    	ORA [$19],Y
C0/36F0:	1B      	TCS 
C0/36F1:	1D1F21  	ORA $211F,X
C0/36F4:	2325    	AND $25,S
C0/36F6:	2729    	AND [$29]
C0/36F8:	2B      	PLD 
C0/36F9:	2D2F31  	AND $312F
C0/36FC:	3335    	AND ($35,S),Y
C0/36FE:	37FF    	AND [$FF],Y
C0/3700:	FFF0F0F1	SBC $F1F0F0,X
C0/3704:	F2F1    	SBC ($F1)
C0/3706:	F2F1    	SBC ($F1)
C0/3708:	F2F1    	SBC ($F1)
C0/370A:	F2F1    	SBC ($F1)
C0/370C:	F2F1    	SBC ($F1)
C0/370E:	F2F1    	SBC ($F1)
C0/3710:	F2F1    	SBC ($F1)
C0/3712:	F2F1    	SBC ($F1)
C0/3714:	F2F1    	SBC ($F1)
C0/3716:	F2F1    	SBC ($F1)
C0/3718:	F2F1    	SBC ($F1)
C0/371A:	F2F1    	SBC ($F1)
C0/371C:	F2F1    	SBC ($F1)
C0/371E:	F2F3    	SBC ($F3)
C0/3720:	F3F4    	SBC ($F4,S),Y
C0/3722:	F4E0E1  	PEA $E1E0
C0/3725:	E2E3    	SEP #$E3
C0/3727:	E0E1E2  	CPX #$E2E1
C0/372A:	E3E0    	SBC $E0,S
C0/372C:	E1E2    	SBC ($E2,X)
C0/372E:	E3E0    	SBC $E0,S
C0/3730:	E1E2    	SBC ($E2,X)
C0/3732:	E3E0    	SBC $E0,S
C0/3734:	E1E2    	SBC ($E2,X)
C0/3736:	E3E0    	SBC $E0,S
C0/3738:	E1E2    	SBC ($E2,X)
C0/373A:	E3E0    	SBC $E0,S
C0/373C:	E1E2    	SBC ($E2,X)
C0/373E:	E3F5    	SBC $F5,S
C0/3740:	F5F6    	SBC $F6,X
C0/3742:	F6E4    	INC $E4,X
C0/3744:	E5E6    	SBC $E6
C0/3746:	E7E4    	SBC [$E4]
C0/3748:	E5E6    	SBC $E6
C0/374A:	E7E4    	SBC [$E4]
C0/374C:	E5E6    	SBC $E6
C0/374E:	E7E4    	SBC [$E4]
C0/3750:	E5E6    	SBC $E6
C0/3752:	E7E4    	SBC [$E4]
C0/3754:	E5E6    	SBC $E6
C0/3756:	E7E4    	SBC [$E4]
C0/3758:	E5E6    	SBC $E6
C0/375A:	E7E4    	SBC [$E4]
C0/375C:	E5E6    	SBC $E6
C0/375E:	E7F7    	SBC [$F7]
C0/3760:	F7F4    	SBC [$F4],Y
C0/3762:	F4E8E9  	PEA $E9E8
C0/3765:	EA      	NOP
C0/3766:	EB      	XBA
C0/3767:	E8      	INX
C0/3768:	E9EA    	SBC #$EA
C0/376A:	EB      	XBA
C0/376B:	E8      	INX
C0/376C:	E9EA    	SBC #$EA
C0/376E:	EB      	XBA
C0/376F:	E8      	INX
C0/3770:	E9EA    	SBC #$EA
C0/3772:	EB      	XBA
C0/3773:	E8      	INX
C0/3774:	E9EA    	SBC #$EA
C0/3776:	EB      	XBA
C0/3777:	E8      	INX
C0/3778:	E9EA    	SBC #$EA
C0/377A:	EB      	XBA
C0/377B:	E8      	INX
C0/377C:	E9EA    	SBC #$EA
C0/377E:	EB      	XBA
C0/377F:	F5F5    	SBC $F5,X
C0/3781:	F6F6    	INC $F6,X
C0/3783:	ECEDEE  	CPX $EEED
C0/3786:	EFECEDEE	SBC $EEEDEC
C0/378A:	EFECEDEE	SBC $EEEDEC
C0/378E:	EFECEDEE	SBC $EEEDEC
C0/3792:	EFECEDEE	SBC $EEEDEC
C0/3796:	EFECEDEE	SBC $EEEDEC
C0/379A:	EFECEDEE	SBC $EEEDEC
C0/379E:	EFF7F7F4	SBC $F4F7F7
C0/37A2:	F4E0E1  	PEA $E1E0
C0/37A5:	E2E3    	SEP #$E3
C0/37A7:	E0E1E2  	CPX #$E2E1
C0/37AA:	E3E0    	SBC $E0,S
C0/37AC:	E1E2    	SBC ($E2,X)
C0/37AE:	E3E0    	SBC $E0,S
C0/37B0:	E1E2    	SBC ($E2,X)
C0/37B2:	E3E0    	SBC $E0,S
C0/37B4:	E1E2    	SBC ($E2,X)
C0/37B6:	E3E0    	SBC $E0,S
C0/37B8:	E1E2    	SBC ($E2,X)
C0/37BA:	E3E0    	SBC $E0,S
C0/37BC:	E1E2    	SBC ($E2,X)
C0/37BE:	E3F5    	SBC $F5,S
C0/37C0:	F5F6    	SBC $F6,X
C0/37C2:	F6E4    	INC $E4,X
C0/37C4:	E5E6    	SBC $E6
C0/37C6:	E7E4    	SBC [$E4]
C0/37C8:	E5E6    	SBC $E6
C0/37CA:	E7E4    	SBC [$E4]
C0/37CC:	E5E6    	SBC $E6
C0/37CE:	E7E4    	SBC [$E4]
C0/37D0:	E5E6    	SBC $E6
C0/37D2:	E7E4    	SBC [$E4]
C0/37D4:	E5E6    	SBC $E6
C0/37D6:	E7E4    	SBC [$E4]
C0/37D8:	E5E6    	SBC $E6
C0/37DA:	E7E4    	SBC [$E4]
C0/37DC:	E5E6    	SBC $E6
C0/37DE:	E7F7    	SBC [$F7]
C0/37E0:	F7F4    	SBC [$F4],Y
C0/37E2:	F4E8E9  	PEA $E9E8
C0/37E5:	EA      	NOP
C0/37E6:	EB      	XBA
C0/37E7:	E8      	INX
C0/37E8:	E9EA    	SBC #$EA
C0/37EA:	EB      	XBA
C0/37EB:	E8      	INX
C0/37EC:	E9EA    	SBC #$EA
C0/37EE:	EB      	XBA
C0/37EF:	E8      	INX
C0/37F0:	E9EA    	SBC #$EA
C0/37F2:	EB      	XBA
C0/37F3:	E8      	INX
C0/37F4:	E9EA    	SBC #$EA
C0/37F6:	EB      	XBA
C0/37F7:	E8      	INX
C0/37F8:	E9EA    	SBC #$EA
C0/37FA:	EB      	XBA
C0/37FB:	E8      	INX
C0/37FC:	E9EA    	SBC #$EA
C0/37FE:	EB      	XBA
C0/37FF:	F5F5    	SBC $F5,X
C0/3801:	F8      	SED 
C0/3802:	F8      	SED 
C0/3803:	F9FAF9  	SBC $F9FA,Y
C0/3806:	FA      	PLX
C0/3807:	F9FAF9  	SBC $F9FA,Y
C0/380A:	FA      	PLX
C0/380B:	F9FAF9  	SBC $F9FA,Y
C0/380E:	FA      	PLX
C0/380F:	F9FAF9  	SBC $F9FA,Y
C0/3812:	FA      	PLX
C0/3813:	F9FAF9  	SBC $F9FA,Y
C0/3816:	FA      	PLX
C0/3817:	F9FAF9  	SBC $F9FA,Y
C0/381A:	FA      	PLX
C0/381B:	F9FAF9  	SBC $F9FA,Y
C0/381E:	FA      	PLX
C0/381F:	FB      	XCE 
C0/3820:	FB      	XCE 

C0/3821:	A943    	LDA #$43		(from only C0/BF88)
C0/3823:	8D0043  	STA $4300
C0/3826:	A90F    	LDA #$0F
C0/3828:	8D0143  	STA $4301
C0/382B:	A2517C  	LDX #$7C51
C0/382E:	8E0243  	STX $4302
C0/3831:	A97E    	LDA #$7E
C0/3833:	8D0443  	STA $4304
C0/3836:	8D0743  	STA $4307
C0/3839:	A944    	LDA #$44
C0/383B:	8D7043  	STA $4370
C0/383E:	A906    	LDA #$06
C0/3840:	8D7143  	STA $4371
C0/3843:	A29B7B  	LDX #$7B9B
C0/3846:	8E7243  	STX $4372
C0/3849:	A97E    	LDA #$7E
C0/384B:	8D7443  	STA $4374
C0/384E:	8D7743  	STA $4377
C0/3851:	A943    	LDA #$43
C0/3853:	8D4043  	STA $4340
C0/3856:	A90D    	LDA #$0D
C0/3858:	8D4143  	STA $4341
C0/385B:	A2F67B  	LDX #$7BF6
C0/385E:	8E4243  	STX $4342
C0/3861:	A97E    	LDA #$7E
C0/3863:	8D4443  	STA $4344
C0/3866:	8D4743  	STA $4347
C0/3869:	A943    	LDA #$43
C0/386B:	8D3043  	STA $4330
C0/386E:	A911    	LDA #$11
C0/3870:	8D3143  	STA $4331
C0/3873:	A2AC7C  	LDX #$7CAC
C0/3876:	8E3243  	STX $4332
C0/3879:	A97E    	LDA #$7E
C0/387B:	8D3443  	STA $4334
C0/387E:	8D3743  	STA $4337
C0/3881:	A942    	LDA #$42
C0/3883:	8D2043  	STA $4320
C0/3886:	A932    	LDA #$32
C0/3888:	8D2143  	STA $4321
C0/388B:	A2077D  	LDX #$7D07
C0/388E:	8E2243  	STX $4322
C0/3891:	A97E    	LDA #$7E
C0/3893:	8D2443  	STA $4324
C0/3896:	8D2743  	STA $4327
C0/3899:	A941    	LDA #$41
C0/389B:	8D5043  	STA $4350
C0/389E:	A928    	LDA #$28
C0/38A0:	8D5143  	STA $4351
C0/38A3:	A2627D  	LDX #$7D62
C0/38A6:	8E5243  	STX $4352
C0/38A9:	A97E    	LDA #$7E
C0/38AB:	8D5443  	STA $4354
C0/38AE:	8D5743  	STA $4357
C0/38B1:	A941    	LDA #$41
C0/38B3:	8D6043  	STA $4360
C0/38B6:	A92C    	LDA #$2C
C0/38B8:	8D6143  	STA $4361
C0/38BB:	A2BD7D  	LDX #$7DBD
C0/38BE:	8E6243  	STX $4362
C0/38C1:	A97E    	LDA #$7E
C0/38C3:	8D6443  	STA $4364
C0/38C6:	8D6743  	STA $4367
C0/38C9:	A941    	LDA #$41
C0/38CB:	8D1043  	STA $4310
C0/38CE:	A930    	LDA #$30
C0/38D0:	8D1143  	STA $4311
C0/38D3:	A2187E  	LDX #$7E18
C0/38D6:	8E1243  	STX $4312
C0/38D9:	A97E    	LDA #$7E
C0/38DB:	8D1443  	STA $4314
C0/38DE:	8D1743  	STA $4317
C0/38E1:	A97E    	LDA #$7E
C0/38E3:	48      	PHA
C0/38E4:	AB      	PLB           (make the data bank reg. hold #$7E)
C0/38E5:	A600    	LDX $00
C0/38E7:	A988    	LDA #$88
C0/38E9:	9D407B  	STA $7B40,X
C0/38EC:	9D9B7B  	STA $7B9B,X
C0/38EF:	9DF67B  	STA $7BF6,X
C0/38F2:	9D517C  	STA $7C51,X
C0/38F5:	9DAC7C  	STA $7CAC,X
C0/38F8:	9D077D  	STA $7D07,X
C0/38FB:	9D627D  	STA $7D62,X
C0/38FE:	9DBD7D  	STA $7DBD,X
C0/3901:	9D187E  	STA $7E18,X
C0/3904:	E8      	INX
C0/3905:	E8      	INX
C0/3906:	E8      	INX
C0/3907:	E05100  	CPX #$0051
C0/390A:	D0DD    	BNE $38E9
C0/390C:	A987    	LDA #$87
C0/390E:	8D407B  	STA $7B40
C0/3911:	8D9B7B  	STA $7B9B
C0/3914:	8DF67B  	STA $7BF6
C0/3917:	8D517C  	STA $7C51
C0/391A:	8DAC7C  	STA $7CAC
C0/391D:	8D077D  	STA $7D07
C0/3920:	8D627D  	STA $7D62
C0/3923:	8DBD7D  	STA $7DBD
C0/3926:	8D187E  	STA $7E18
C0/3929:	A980    	LDA #$80
C0/392B:	9D407B  	STA $7B40,X
C0/392E:	9D9B7B  	STA $7B9B,X
C0/3931:	9DF67B  	STA $7BF6,X
C0/3934:	9D517C  	STA $7C51,X
C0/3937:	9DAC7C  	STA $7CAC,X
C0/393A:	9D077D  	STA $7D07,X
C0/393D:	9D627D  	STA $7D62,X
C0/3940:	9DBD7D  	STA $7DBD,X
C0/3943:	9D187E  	STA $7E18,X
C0/3946:	7B      	TDC 
C0/3947:	48      	PHA
C0/3948:	AB      	PLB
C0/3949:	206B39  	JSR $396B
C0/394C:	203240  	JSR $4032
C0/394F:	20E73E  	JSR $3EE7
C0/3952:	209F3D  	JSR $3D9F
C0/3955:	20BC3D  	JSR $3DBC
C0/3958:	209B3B  	JSR $3B9B
C0/395B:	20FF3B  	JSR $3BFF
C0/395E:	20053A  	JSR $3A05
C0/3961:	20283A  	JSR $3A28
C0/3964:	20333C  	JSR $3C33
C0/3967:	20503C  	JSR $3C50      (JMP fool!)
C0/396A:	60      	RTS
 
C0/396B:	A97E    	LDA #$7E		(from only C0/3949)
C0/396D:	48      	PHA
C0/396E:	AB      	PLB           (make the data bank reg. hold #$7E)
C0/396F:	C220    	REP #$20      	(16 bit accum./memory)
C0/3971:	A600    	LDX $00
C0/3973:	A94381  	LDA #$8143
C0/3976:	9D417B  	STA $7B41,X
C0/3979:	E8      	INX
C0/397A:	E8      	INX
C0/397B:	E8      	INX
C0/397C:	E05100  	CPX #$0051
C0/397F:	D0F2    	BNE $3973
C0/3981:	A600    	LDX $00
C0/3983:	BF9839C0	LDA $C03998,X
C0/3987:	9D4381  	STA $8143,X
C0/398A:	E8      	INX
C0/398B:	E8      	INX
C0/398C:	E02000  	CPX #$0020
C0/398F:	D0F2    	BNE $3983
C0/3991:	7B      	TDC 
C0/3992:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3994:	7B      	TDC 
C0/3995:	48      	PHA
C0/3996:	AB      	PLB
C0/3997:	60      	RTS
 
Data, loaded from C0/3983
Some sort of offset

C0/3998:	1042    	
C0/399A:	524A    	
C0/399C:	9452    	
C0/399E:	D65A    	
C0/39A0:	1863      	
C0/39A2:	5A6B    	
C0/39A4:	9C73      	
C0/39A6:	DE7B  	  

C0/39A8:	ADD81E  	LDA $1ED8		(from only C0/BF8B)
C0/39AB:	2901    	AND #$01
C0/39AD:	F055    	BEQ $3A04
C0/39AF:	A97E    	LDA #$7E
C0/39B1:	48      	PHA
C0/39B2:	AB      	PLB           (make the data bank reg. hold #$7E)
C0/39B3:	C220    	REP #$20      	(16 bit accum./memory)
C0/39B5:	A90389  	LDA #$8903
C0/39B8:	8D0B7D  	STA $7D0B
C0/39BB:	A91389  	LDA #$8913
C0/39BE:	8D0E7D  	STA $7D0E
C0/39C1:	A92389  	LDA #$8923
C0/39C4:	8D3B7D  	STA $7D3B
C0/39C7:	A93389  	LDA #$8933
C0/39CA:	8D3E7D  	STA $7D3E
C0/39CD:	A9938C  	LDA #$8C93
C0/39D0:	8D1C7E  	STA $7E1C
C0/39D3:	8D1F7E  	STA $7E1F
C0/39D6:	8D4C7E  	STA $7E4C
C0/39D9:	8D4F7E  	STA $7E4F
C0/39DC:	A600    	LDX $00
C0/39DE:	A9A381  	LDA #$81A3
C0/39E1:	9DF77D  	STA $7DF7,X
C0/39E4:	A93387  	LDA #$8733
C0/39E7:	9DE67C  	STA $7CE6,X
C0/39EA:	A95382  	LDA #$8253
C0/39ED:	9DD57B  	STA $7BD5,X
C0/39F0:	A9738C  	LDA #$8C73
C0/39F3:	9D527E  	STA $7E52,X
C0/39F6:	E8      	INX
C0/39F7:	E8      	INX
C0/39F8:	E8      	INX
C0/39F9:	E01800  	CPX #$0018
C0/39FC:	D0E0    	BNE $39DE
C0/39FE:	7B      	TDC
C0/39FF:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3A01:	7B      	TDC
C0/3A02:	48      	PHA
C0/3A03:	AB      	PLB
C0/3A04:	60      	RTS
 
C0/3A05:	A97E    	LDA #$7E		(from only C0/395E)
C0/3A07:	48      	PHA
C0/3A08:	AB      	PLB           (make the data bank reg. hold #$7E)
C0/3A09:	C220    	REP #$20      	(16 bit accum./memory)
C0/3A0B:	A600    	LDX $00
C0/3A0D:	A96381  	LDA #$8163
C0/3A10:	9DBE7D  	STA $7DBE,X
C0/3A13:	E8      	INX
C0/3A14:	E8      	INX
C0/3A15:	E8      	INX
C0/3A16:	E05100  	CPX #$0051
C0/3A19:	D0F2    	BNE $3A0D
C0/3A1B:	A97381  	LDA #$8173
C0/3A1E:	8DBE7D  	STA $7DBE
C0/3A21:	7B      	TDC
C0/3A22:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3A24:	7B      	TDC
C0/3A25:	48      	PHA
C0/3A26:	AB      	PLB
C0/3A27:	60      	RTS
 
C0/3A28:	A27381  	LDX #$8173		(from only C0/3961)
C0/3A2B:	8E8121  	STX $2181
C0/3A2E:	A97E    	LDA #$7E
C0/3A30:	8D8321  	STA $2183
C0/3A33:	7B      	TDC            (no need for this, unless the upper 8 bits aren't 0 here)
C0/3A34:	8D8021  	STA $2180      (because this can be STZ instead!)
C0/3A37:	8D8021  	STA $2180
C0/3A3A:	8D8021  	STA $2180
C0/3A3D:	8D8021  	STA $2180
C0/3A40:	8D8021  	STA $2180
C0/3A43:	8D8021  	STA $2180
C0/3A46:	8D8021  	STA $2180
C0/3A49:	8D8021  	STA $2180
C0/3A4C:	8D8021  	STA $2180
C0/3A4F:	8D8021  	STA $2180
C0/3A52:	8D8021  	STA $2180
C0/3A55:	8D8021  	STA $2180
C0/3A58:	8D8021  	STA $2180
C0/3A5B:	8D8021  	STA $2180
C0/3A5E:	8D8021  	STA $2180
C0/3A61:	8D8021  	STA $2180
C0/3A64:	A28381  	LDX #$8183
C0/3A67:	8E8121  	STX $2181
C0/3A6A:	A97E    	LDA #$7E
C0/3A6C:	8D8321  	STA $2183
C0/3A6F:	A905    	LDA #$05
C0/3A71:	8D8021  	STA $2180
C0/3A74:	EB      	XBA
C0/3A75:	8D8021  	STA $2180
C0/3A78:	EB      	XBA
C0/3A79:	8D8021  	STA $2180
C0/3A7C:	EB      	XBA
C0/3A7D:	8D8021  	STA $2180
C0/3A80:	EB      	XBA
C0/3A81:	8D8021  	STA $2180
C0/3A84:	EB      	XBA
C0/3A85:	8D8021  	STA $2180
C0/3A88:	EB      	XBA
C0/3A89:	8D8021  	STA $2180
C0/3A8C:	EB      	XBA
C0/3A8D:	8D8021  	STA $2180
C0/3A90:	EB      	XBA
C0/3A91:	8D8021  	STA $2180
C0/3A94:	EB      	XBA
C0/3A95:	8D8021  	STA $2180
C0/3A98:	EB      	XBA
C0/3A99:	8D8021  	STA $2180
C0/3A9C:	EB      	XBA
C0/3A9D:	8D8021  	STA $2180
C0/3AA0:	EB      	XBA
C0/3AA1:	8D8021  	STA $2180
C0/3AA4:	EB      	XBA
C0/3AA5:	8D8021  	STA $2180
C0/3AA8:	EB      	XBA
C0/3AA9:	8D8021  	STA $2180
C0/3AAC:	EB      	XBA
C0/3AAD:	8D8021  	STA $2180
C0/3AB0:	7B      	TDC 
C0/3AB1:	A29381  	LDX #$8193
C0/3AB4:	8E8121  	STX $2181
C0/3AB7:	A97E    	LDA #$7E
C0/3AB9:	8D8321  	STA $2183
C0/3ABC:	A91F    	LDA #$1F
C0/3ABE:	8D8021  	STA $2180
C0/3AC1:	EB      	XBA
C0/3AC2:	8D8021  	STA $2180
C0/3AC5:	EB      	XBA
C0/3AC6:	8D8021  	STA $2180
C0/3AC9:	EB      	XBA
C0/3ACA:	8D8021  	STA $2180
C0/3ACD:	EB      	XBA
C0/3ACE:	8D8021  	STA $2180
C0/3AD1:	EB      	XBA
C0/3AD2:	8D8021  	STA $2180
C0/3AD5:	EB      	XBA
C0/3AD6:	8D8021  	STA $2180
C0/3AD9:	EB      	XBA
C0/3ADA:	8D8021  	STA $2180
C0/3ADD:	EB      	XBA
C0/3ADE:	8D8021  	STA $2180
C0/3AE1:	EB      	XBA
C0/3AE2:	8D8021  	STA $2180
C0/3AE5:	EB      	XBA
C0/3AE6:	8D8021  	STA $2180
C0/3AE9:	EB      	XBA
C0/3AEA:	8D8021  	STA $2180
C0/3AED:	EB      	XBA
C0/3AEE:	8D8021  	STA $2180
C0/3AF1:	EB      	XBA
C0/3AF2:	8D8021  	STA $2180
C0/3AF5:	EB      	XBA
C0/3AF6:	8D8021  	STA $2180
C0/3AF9:	EB      	XBA
C0/3AFA:	8D8021  	STA $2180
C0/3AFD:	7B      	TDC 
C0/3AFE:	A26381  	LDX #$8163
C0/3B01:	8E8121  	STX $2181
C0/3B04:	A97E    	LDA #$7E
C0/3B06:	8D8321  	STA $2183
C0/3B09:	A551    	LDA $51
C0/3B0B:	8D8021  	STA $2180
C0/3B0E:	EB      	XBA
C0/3B0F:	A552    	LDA $52
C0/3B11:	8D8021  	STA $2180
C0/3B14:	EB      	XBA
C0/3B15:	8D8021  	STA $2180
C0/3B18:	EB      	XBA
C0/3B19:	8D8021  	STA $2180
C0/3B1C:	EB      	XBA
C0/3B1D:	8D8021  	STA $2180
C0/3B20:	EB      	XBA
C0/3B21:	8D8021  	STA $2180
C0/3B24:	EB      	XBA
C0/3B25:	8D8021  	STA $2180
C0/3B28:	EB      	XBA
C0/3B29:	8D8021  	STA $2180
C0/3B2C:	EB      	XBA
C0/3B2D:	8D8021  	STA $2180
C0/3B30:	EB      	XBA
C0/3B31:	8D8021  	STA $2180
C0/3B34:	EB      	XBA
C0/3B35:	8D8021  	STA $2180
C0/3B38:	EB      	XBA
C0/3B39:	8D8021  	STA $2180
C0/3B3C:	EB      	XBA
C0/3B3D:	8D8021  	STA $2180
C0/3B40:	EB      	XBA
C0/3B41:	8D8021  	STA $2180
C0/3B44:	EB      	XBA
C0/3B45:	8D8021  	STA $2180
C0/3B48:	EB      	XBA
C0/3B49:	8D8021  	STA $2180
C0/3B4C:	7B      	TDC 
C0/3B4D:	A2A381  	LDX #$81A3
C0/3B50:	8E8121  	STX $2181
C0/3B53:	A97E    	LDA #$7E
C0/3B55:	8D8321  	STA $2183
C0/3B58:	A904    	LDA #$04
C0/3B5A:	8D8021  	STA $2180
C0/3B5D:	EB      	XBA
C0/3B5E:	8D8021  	STA $2180
C0/3B61:	EB      	XBA
C0/3B62:	8D8021  	STA $2180
C0/3B65:	EB      	XBA
C0/3B66:	8D8021  	STA $2180
C0/3B69:	EB      	XBA
C0/3B6A:	8D8021  	STA $2180
C0/3B6D:	EB      	XBA
C0/3B6E:	8D8021  	STA $2180
C0/3B71:	EB      	XBA
C0/3B72:	8D8021  	STA $2180
C0/3B75:	EB      	XBA
C0/3B76:	8D8021  	STA $2180
C0/3B79:	EB      	XBA
C0/3B7A:	8D8021  	STA $2180
C0/3B7D:	EB      	XBA
C0/3B7E:	8D8021  	STA $2180
C0/3B81:	EB      	XBA
C0/3B82:	8D8021  	STA $2180
C0/3B85:	EB      	XBA
C0/3B86:	8D8021  	STA $2180
C0/3B89:	EB      	XBA
C0/3B8A:	8D8021  	STA $2180
C0/3B8D:	EB      	XBA
C0/3B8E:	8D8021  	STA $2180
C0/3B91:	EB      	XBA
C0/3B92:	8D8021  	STA $2180
C0/3B95:	EB      	XBA
C0/3B96:	8D8021  	STA $2180
C0/3B99:	7B      	TDC 
C0/3B9A:	60      	RTS
 
C0/3B9B:	AD6605  	LDA $0566	    ; window 2 frame counter [?]
C0/3B9E:	4A      	LSR A
C0/3B9F:	B02F    	BCS $3BD0
C0/3BA1:	A97E    	LDA #$7E
C0/3BA3:	48      	PHA
C0/3BA4:	AB      	PLB			(made the data bank reg. hold #$7E)
C0/3BA5:	C220    	REP #$20      	(16 bit accum./memory)
C0/3BA7:	A600    	LDX $00
C0/3BA9:	A9B38C  	LDA #$8CB3
C0/3BAC:	BC667D  	LDY $7D66,X
C0/3BAF:	C0A38C  	CPY #$8CA3
C0/3BB2:	F003    	BEQ $3BB7
C0/3BB4:	9D667D  	STA $7D66,X
C0/3BB7:	18      	CLC
C0/3BB8:	691000  	ADC #$0010
C0/3BBB:	E8      	INX
C0/3BBC:	E8      	INX
C0/3BBD:	E8      	INX
C0/3BBE:	E04E00  	CPX #$004E
C0/3BC1:	D0E9    	BNE $3BAC
C0/3BC3:	A9F38F  	LDA #$8FF3
C0/3BC6:	8D637D  	STA $7D63
C0/3BC9:	7B      	TDC 
C0/3BCA:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3BCC:	7B      	TDC 
C0/3BCD:	48      	PHA
C0/3BCE:	AB      	PLB
C0/3BCF:	60      	RTS
 
C0/3BD0:	A97E    	LDA #$7E
C0/3BD2:	48      	PHA
C0/3BD3:	AB      	PLB            (make the data bank reg. hold #$7E)
C0/3BD4:	C220    	REP #$20      	(16 bit accum./memory)
C0/3BD6:	A600    	LDX $00
C0/3BD8:	A9538E  	LDA #$8E53
C0/3BDB:	BC667D  	LDY $7D66,X
C0/3BDE:	C0A38C  	CPY #$8CA3
C0/3BE1:	F003    	BEQ $3BE6
C0/3BE3:	9D667D  	STA $7D66,X
C0/3BE6:	18      	CLC
C0/3BE7:	691000  	ADC #$0010
C0/3BEA:	E8      	INX
C0/3BEB:	E8      	INX
C0/3BEC:	E8      	INX
C0/3BED:	E04E00  	CPX #$004E
C0/3BF0:	D0E9    	BNE $3BDB
C0/3BF2:	A9F38F  	LDA #$8FF3
C0/3BF5:	8D637D  	STA $7D63
C0/3BF8:	7B      	TDC 
C0/3BF9:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3BFB:	7B      	TDC 
C0/3BFC:	48      	PHA
C0/3BFD:	AB      	PLB
C0/3BFE:	60      	RTS
 
C0/3BFF:	A97E    	LDA #$7E		(from only C0/395B)
C0/3C01:	48      	PHA
C0/3C02:	AB      	PLB            (make the data bank reg. hold #$7E)
C0/3C03:	C220    	REP #$20      	(16 bit accum./memory)
C0/3C05:	A600    	LDX $00
C0/3C07:	A9FF00  	LDA #$00FF
C0/3C0A:	9DF38F  	STA $8FF3,X
C0/3C0D:	A900FF  	LDA #$FF00
C0/3C10:	9DA38C  	STA $8CA3,X
C0/3C13:	E8      	INX
C0/3C14:	E8      	INX
C0/3C15:	E01000  	CPX #$0010
C0/3C18:	D0ED    	BNE $3C07
C0/3C1A:	A600    	LDX $00
C0/3C1C:	A900FF  	LDA #$FF00
C0/3C1F:	9DB38C  	STA $8CB3,X
C0/3C22:	9D538E  	STA $8E53,X
C0/3C25:	E8      	INX
C0/3C26:	E8      	INX
C0/3C27:	E0A001  	CPX #$01A0
C0/3C2A:	D0F0    	BNE $3C1C
C0/3C2C:	7B      	TDC 
C0/3C2D:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3C2F:	7B      	TDC 
C0/3C30:	48      	PHA
C0/3C31:	AB      	PLB
C0/3C32:	60      	RTS
 
C0/3C33:	A97E    	LDA #$7E		(from only C0/3964)
C0/3C35:	48      	PHA
C0/3C36:	AB      	PLB            (make the data bank reg. hold #$7E)
C0/3C37:	C220    	REP #$20      	(16 bit accum./memory)
C0/3C39:	A600    	LDX $00
C0/3C3B:	A95387  	LDA #$8753
C0/3C3E:	9D087D  	STA $7D08,X
C0/3C41:	E8      	INX
C0/3C42:	E8      	INX
C0/3C43:	E8      	INX
C0/3C44:	E05100  	CPX #$0051
C0/3C47:	D0F2    	BNE $3C3B
C0/3C49:	7B      	TDC 
C0/3C4A:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3C4C:	7B      	TDC 
C0/3C4D:	48      	PHA
C0/3C4E:	AB      	PLB            (make the data bank reg. hold #$00)
C0/3C4F:	60      	RTS
 
C0/3C50:	A25387  	LDX #$8753		(from only C0/3967)
C0/3C53:	8E8121  	STX $2181
C0/3C56:	A97E    	LDA #$7E
C0/3C58:	8D8321  	STA $2183
C0/3C5B:	A600    	LDX $00
C0/3C5D:	A9E0    	LDA #$E0
C0/3C5F:	8D8021  	STA $2180
C0/3C62:	A900    	LDA #$00
C0/3C64:	8D8021  	STA $2180
C0/3C67:	E8      	INX
C0/3C68:	E00800  	CPX #$0008
C0/3C6B:	D0F0    	BNE $3C5D
C0/3C6D:	A24389  	LDX #$8943
C0/3C70:	8E8121  	STX $2181
C0/3C73:	A97E    	LDA #$7E
C0/3C75:	8D8321  	STA $2183
C0/3C78:	A600    	LDX $00
C0/3C7A:	BFD73CC0	LDA $C03CD7,X
C0/3C7E:	8D8021  	STA $2180
C0/3C81:	BFD73CC0	LDA $C03CD7,X
C0/3C85:	8D8021  	STA $2180
C0/3C88:	E8      	INX
C0/3C89:	E0C800  	CPX #$00C8
C0/3C8C:	D0EC    	BNE $3C7A
C0/3C8E:	A20389  	LDX #$8903
C0/3C91:	8E8121  	STX $2181
C0/3C94:	A97E    	LDA #$7E
C0/3C96:	8D8321  	STA $2183
C0/3C99:	A600    	LDX $00
C0/3C9B:	BFC73CC0	LDA $C03CC7,X
C0/3C9F:	8D8021  	STA $2180
C0/3CA2:	8D8021  	STA $2180
C0/3CA5:	E8      	INX
C0/3CA6:	E01000  	CPX #$0010
C0/3CA9:	D0F0    	BNE $3C9B
C0/3CAB:	A22389  	LDX #$8923
C0/3CAE:	8E8121  	STX $2181
C0/3CB1:	A97E    	LDA #$7E
C0/3CB3:	8D8321  	STA $2183
C0/3CB6:	A21000  	LDX #$0010
C0/3CB9:	BFC63CC0	LDA $C03CC6,X
C0/3CBD:	8D8021  	STA $2180
C0/3CC0:	8D8021  	STA $2180
C0/3CC3:	CA      	DEX
C0/3CC4:	D0F3    	BNE $3CB9
C0/3CC6:	60      	RTS
 
Data 

C0/3CC7:	FCF8F4  	JSR ($F4F8,X)
C0/3CCA:	F0EE    	BEQ $3CBA
C0/3CCC:	ECEAE9  	CPX $E9EA
C0/3CCF:	E8      	INX
C0/3CD0:	E7E6    	SBC [$E6]
C0/3CD2:	E5E4    	SBC $E4
C0/3CD4:	E3E2    	SBC $E2,S
C0/3CD6:	E1E7    	SBC ($E7,X)
C0/3CD8:	E7E7    	SBC [$E7]
C0/3CDA:	E6E6    	INC $E6
C0/3CDC:	E6E6    	INC $E6
C0/3CDE:	E6E5    	INC $E5
C0/3CE0:	E5E5    	SBC $E5
C0/3CE2:	E5E5    	SBC $E5
C0/3CE4:	E4E4    	CPX $E4
C0/3CE6:	E4E4    	CPX $E4
C0/3CE8:	E4E3    	CPX $E3
C0/3CEA:	E3E3    	SBC $E3,S
C0/3CEC:	E3E3    	SBC $E3,S
C0/3CEE:	E2E2    	SEP #$E2
C0/3CF0:	E2E2    	SEP #$E2
C0/3CF2:	E2E1    	SEP #$E1
C0/3CF4:	E1E1    	SBC ($E1,X)
C0/3CF6:	E1E1    	SBC ($E1,X)
C0/3CF8:	E0E0E0  	CPX #$E0E0
C0/3CFB:	E0E0E1  	CPX #$E1E0
C0/3CFE:	E1E1    	SBC ($E1,X)
C0/3D00:	E1E1    	SBC ($E1,X)
C0/3D02:	E2E2    	SEP #$E2
C0/3D04:	E2E2    	SEP #$E2
C0/3D06:	E2E3    	SEP #$E3
C0/3D08:	E3E3    	SBC $E3,S
C0/3D0A:	E3E3    	SBC $E3,S
C0/3D0C:	E4E4    	CPX $E4
C0/3D0E:	E4E4    	CPX $E4
C0/3D10:	E4E5    	CPX $E5
C0/3D12:	E5E5    	SBC $E5
C0/3D14:	E5E5    	SBC $E5
C0/3D16:	E6E6    	INC $E6
C0/3D18:	E6E6    	INC $E6
C0/3D1A:	E6E7    	INC $E7
C0/3D1C:	E7E7    	SBC [$E7]
C0/3D1E:	E7E7    	SBC [$E7]
C0/3D20:	E7E6    	SBC [$E6]
C0/3D22:	E6E6    	INC $E6
C0/3D24:	E6E5    	INC $E5
C0/3D26:	E5E5    	SBC $E5
C0/3D28:	E5E4    	SBC $E4
C0/3D2A:	E4E4    	CPX $E4
C0/3D2C:	E4E3    	CPX $E3
C0/3D2E:	E3E3    	SBC $E3,S
C0/3D30:	E3E2    	SBC $E2,S
C0/3D32:	E2E2    	SEP #$E2
C0/3D34:	E2E1    	SEP #$E1
C0/3D36:	E1E1    	SBC ($E1,X)
C0/3D38:	E1E0    	SBC ($E0,X)
C0/3D3A:	E0E0E0  	CPX #$E0E0
C0/3D3D:	E1E1    	SBC ($E1,X)
C0/3D3F:	E1E1    	SBC ($E1,X)
C0/3D41:	E2E2    	SEP #$E2
C0/3D43:	E2E2    	SEP #$E2
C0/3D45:	E3E3    	SBC $E3,S
C0/3D47:	E3E3    	SBC $E3,S
C0/3D49:	E4E4    	CPX $E4
C0/3D4B:	E4E4    	CPX $E4
C0/3D4D:	E5E5    	SBC $E5
C0/3D4F:	E5E5    	SBC $E5
C0/3D51:	E6E6    	INC $E6
C0/3D53:	E6E6    	INC $E6
C0/3D55:	E7E7    	SBC [$E7]
C0/3D57:	E7E6    	SBC [$E6]
C0/3D59:	E6E6    	INC $E6
C0/3D5B:	E5E5    	SBC $E5
C0/3D5D:	E5E4    	SBC $E4
C0/3D5F:	E4E4    	CPX $E4
C0/3D61:	E3E3    	SBC $E3,S
C0/3D63:	E3E2    	SBC $E2,S
C0/3D65:	E2E2    	SEP #$E2
C0/3D67:	E1E1    	SBC ($E1,X)
C0/3D69:	E1E0    	SBC ($E0,X)
C0/3D6B:	E0E0E1  	CPX #$E1E0
C0/3D6E:	E1E1    	SBC ($E1,X)
C0/3D70:	E2E2    	SEP #$E2
C0/3D72:	E2E3    	SEP #$E3
C0/3D74:	E3E3    	SBC $E3,S
C0/3D76:	E4E4    	CPX $E4
C0/3D78:	E4E5    	CPX $E5
C0/3D7A:	E5E5    	SBC $E5
C0/3D7C:	E6E6    	INC $E6
C0/3D7E:	E6E6    	INC $E6
C0/3D80:	E5E5    	SBC $E5
C0/3D82:	E4E4    	CPX $E4
C0/3D84:	E3E3    	SBC $E3,S
C0/3D86:	E2E2    	SEP #$E2
C0/3D88:	E1E1    	SBC ($E1,X)
C0/3D8A:	E0E0E1  	CPX #$E1E0
C0/3D8D:	E1E2    	SBC ($E2,X)
C0/3D8F:	E2E3    	SEP #$E3
C0/3D91:	E3E4    	SBC $E4,S
C0/3D93:	E4E5    	CPX $E5
C0/3D95:	E5E6    	SBC $E6
C0/3D97:	E4E3    	CPX $E3
C0/3D99:	E2E1    	SEP #$E1
C0/3D9B:	E0E1E2  	CPX #$E2E1
C0/3D9E:	E3

C0/3D9F:	A97E    	LDA #$7E		(from only C0/3952)
C0/3DA1:	48		PHA
C0/3DA2:	AB  		PLB            (make the data bank reg. hold #$7E)
C0/3DA3:	C220    	REP #$20      	(16 bit accum./memory)
C0/3DA5:	A600    	LDX $00
C0/3DA7:	A9638C  	LDA #$8C63
C0/3DAA:	9D197E  	STA $7E19,X
C0/3DAD:	E8      	INX
C0/3DAE:	E8      	INX
C0/3DAF:	E8      	INX
C0/3DB0:	E05100  	CPX #$0051
C0/3DB3:	D0F2    	BNE $3DA7
C0/3DB5:	7B      	TDC 
C0/3DB6:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3DB8:	7B      	TDC 
C0/3DB9:	48      	PHA
C0/3DBA:	AB      	PLB
C0/3DBB:	60      	RTS
 
C0/3DBC:	A97E    	LDA #$7E		(from only C0/3955)
C0/3DBE:	48      	PHA
C0/3DBF:	AB      	PLB            (make the data bank reg. hold #$7E)
C0/3DC0:	A600    	LDX $00
C0/3DC2:	A550    	LDA $50
C0/3DC4:	9D638C  	STA $8C63,X
C0/3DC7:	9D738C  	STA $8C73,X
C0/3DCA:	A54E    	LDA $4E
C0/3DCC:	9D648C  	STA $8C64,X
C0/3DCF:	7B      	TDC 
C0/3DD0:	9D748C  	STA $8C74,X
C0/3DD3:	A920    	LDA #$20
C0/3DD5:	9DD38A  	STA $8AD3,X
C0/3DD8:	9DE38A  	STA $8AE3,X
C0/3DDB:	9DF38A  	STA $8AF3,X
C0/3DDE:	9D038B  	STA $8B03,X
C0/3DE1:	9D138B  	STA $8B13,X
C0/3DE4:	9D238B  	STA $8B23,X
C0/3DE7:	9D338B  	STA $8B33,X
C0/3DEA:	9D438B  	STA $8B43,X
C0/3DED:	9D538B  	STA $8B53,X
C0/3DF0:	9D638B  	STA $8B63,X
C0/3DF3:	9D738B  	STA $8B73,X
C0/3DF6:	9D838B  	STA $8B83,X
C0/3DF9:	9D938B  	STA $8B93,X
C0/3DFC:	9DA38B  	STA $8BA3,X
C0/3DFF:	9DB38B  	STA $8BB3,X
C0/3E02:	9DC38B  	STA $8BC3,X
C0/3E05:	9DD38B  	STA $8BD3,X
C0/3E08:	9DE38B  	STA $8BE3,X
C0/3E0B:	9DF38B  	STA $8BF3,X
C0/3E0E:	9D038C  	STA $8C03,X
C0/3E11:	9D138C  	STA $8C13,X
C0/3E14:	9D238C  	STA $8C23,X
C0/3E17:	9D338C  	STA $8C33,X
C0/3E1A:	9D438C  	STA $8C43,X
C0/3E1D:	9D538C  	STA $8C53,X
C0/3E20:	9D838C  	STA $8C83,X
C0/3E23:	9D938C  	STA $8C93,X
C0/3E26:	E8      	INX
C0/3E27:	E8      	INX
C0/3E28:	E01000  	CPX #$0010
C0/3E2B:	D095    	BNE $3DC2
C0/3E2D:	A600    	LDX $00
C0/3E2F:	A901    	LDA #$01
C0/3E31:	9DD48A  	STA $8AD4,X
C0/3E34:	9DDC8A  	STA $8ADC,X
C0/3E37:	9DE48A  	STA $8AE4,X
C0/3E3A:	9DEC8A  	STA $8AEC,X
C0/3E3D:	9DF48A  	STA $8AF4,X
C0/3E40:	9DFC8A  	STA $8AFC,X
C0/3E43:	9D048B  	STA $8B04,X
C0/3E46:	9D0C8B  	STA $8B0C,X
C0/3E49:	9D148B  	STA $8B14,X
C0/3E4C:	9D648B  	STA $8B64,X
C0/3E4F:	9D6C8B  	STA $8B6C,X
C0/3E52:	9D748B  	STA $8B74,X
C0/3E55:	9D7C8B  	STA $8B7C,X
C0/3E58:	9D848B  	STA $8B84,X
C0/3E5B:	9D8C8B  	STA $8B8C,X
C0/3E5E:	9D948B  	STA $8B94,X
C0/3E61:	9DD48B  	STA $8BD4,X
C0/3E64:	9DDC8B  	STA $8BDC,X
C0/3E67:	9DE48B  	STA $8BE4,X
C0/3E6A:	9DEC8B  	STA $8BEC,X
C0/3E6D:	9DF48B  	STA $8BF4,X
C0/3E70:	9D248C  	STA $8C24,X
C0/3E73:	9D2C8C  	STA $8C2C,X
C0/3E76:	9D348C  	STA $8C34,X
C0/3E79:	9D548C  	STA $8C54,X
C0/3E7C:	A91F    	LDA #$1F
C0/3E7E:	9D848C  	STA $8C84,X
C0/3E81:	9D8C8C  	STA $8C8C,X
C0/3E84:	A981    	LDA #$81
C0/3E86:	9D1C8B  	STA $8B1C,X
C0/3E89:	9D248B  	STA $8B24,X
C0/3E8C:	9D2C8B  	STA $8B2C,X
C0/3E8F:	9D348B  	STA $8B34,X
C0/3E92:	9D3C8B  	STA $8B3C,X
C0/3E95:	9D448B  	STA $8B44,X
C0/3E98:	9D4C8B  	STA $8B4C,X
C0/3E9B:	9D548B  	STA $8B54,X
C0/3E9E:	9D5C8B  	STA $8B5C,X
C0/3EA1:	9D9C8B  	STA $8B9C,X
C0/3EA4:	9DA48B  	STA $8BA4,X
C0/3EA7:	9DAC8B  	STA $8BAC,X
C0/3EAA:	9DB48B  	STA $8BB4,X
C0/3EAD:	9DBC8B  	STA $8BBC,X
C0/3EB0:	9DC48B  	STA $8BC4,X
C0/3EB3:	9DCC8B  	STA $8BCC,X
C0/3EB6:	9DFC8B  	STA $8BFC,X
C0/3EB9:	9D048C  	STA $8C04,X
C0/3EBC:	9D0C8C  	STA $8C0C,X
C0/3EBF:	9D148C  	STA $8C14,X
C0/3EC2:	9D1C8C  	STA $8C1C,X
C0/3EC5:	9D3C8C  	STA $8C3C,X
C0/3EC8:	9D448C  	STA $8C44,X
C0/3ECB:	9D4C8C  	STA $8C4C,X
C0/3ECE:	9D5C8C  	STA $8C5C,X
C0/3ED1:	A99F    	LDA #$9F
C0/3ED3:	9D948C  	STA $8C94,X
C0/3ED6:	9D9C8C  	STA $8C9C,X
C0/3ED9:	E8      	INX
C0/3EDA:	E8      	INX
C0/3EDB:	E00800  	CPX #$0008
C0/3EDE:	F003    	BEQ $3EE3
C0/3EE0:	4C2F3E  	JMP $3E2F

C0/3EE3:	7B      	TDC 
C0/3EE4:	48      	PHA
C0/3EE5:	AB      	PLB            (make the data bank reg. hold #$00)
C0/3EE6:	60      	RTS
 
C0/3EE7:	A600    	LDX $00		(from only C0/394F)
C0/3EE9:	A97E    	LDA #$7E
C0/3EEB:	48      	PHA
C0/3EEC:	AB      	PLB            (make the data bank reg. hold #$7E)
C0/3EED:	C220    	REP #$20      	(16 bit accum./memory)
C0/3EEF:	A93382  	LDA #$8233
C0/3EF2:	9D9C7B  	STA $7B9C,X
C0/3EF5:	E8      	INX
C0/3EF6:	E8      	INX
C0/3EF7:	E8      	INX
C0/3EF8:	E05100  	CPX #$0051
C0/3EFB:	D0F2    	BNE $3EEF
C0/3EFD:	7B      	TDC 
C0/3EFE:	E220    	SEP #$20      	(8 bit accum./memory)
C0/3F00:	A600    	LDX $00
C0/3F02:	7B      	TDC 
C0/3F03:	9DB381  	STA $81B3,X
C0/3F06:	9DD381  	STA $81D3,X
C0/3F09:	9D1382  	STA $8213,X
C0/3F0C:	9D5382  	STA $8253,X
C0/3F0F:	A90F    	LDA #$0F
C0/3F11:	9DF381  	STA $81F3,X
C0/3F14:	9D3382  	STA $8233,X
C0/3F17:	A940    	LDA #$40
C0/3F19:	9DB481  	STA $81B4,X
C0/3F1C:	9DF481  	STA $81F4,X
C0/3F1F:	A948    	LDA #$48
C0/3F21:	9D1482  	STA $8214,X
C0/3F24:	9D3482  	STA $8234,X
C0/3F27:	9DD481  	STA $81D4,X
C0/3F2A:	9D5482  	STA $8254,X
C0/3F2D:	A950    	LDA #$50
C0/3F2F:	9DD581  	STA $81D5,X
C0/3F32:	9D1582  	STA $8215,X
C0/3F35:	9D3582  	STA $8235,X
C0/3F38:	9D5582  	STA $8255,X
C0/3F3B:	A944    	LDA #$44
C0/3F3D:	9DB681  	STA $81B6,X
C0/3F40:	9DD681  	STA $81D6,X
C0/3F43:	9DF681  	STA $81F6,X
C0/3F46:	9D5682  	STA $8256,X
C0/3F49:	A958    	LDA #$58
C0/3F4B:	9D1682  	STA $8216,X
C0/3F4E:	9D3682  	STA $8236,X
C0/3F51:	E8      	INX
C0/3F52:	E8      	INX
C0/3F53:	E8      	INX
C0/3F54:	E8      	INX
C0/3F55:	E02000  	CPX #$0020
C0/3F58:	D0A8    	BNE $3F02
C0/3F5A:	7B      	TDC 
C0/3F5B:	48      	PHA
C0/3F5C:	AB      	PLB            (make the data bank reg. hold #$00)
C0/3F5D:	60      	RTS
 
C0/3F5E:	A600    	LDX $00		(from only C0/394F)
C0/3F60:	AD8C05  	LDA $058C
C0/3F63:	4904    	EOR #$04
C0/3F65:	8D8C05  	STA $058C
C0/3F68:	9F14827E	STA $7E8214,X
C0/3F6C:	9F34827E	STA $7E8234,X
C0/3F70:	9FD4817E	STA $7E81D4,X
C0/3F74:	E8      	INX
C0/3F75:	E8      	INX
C0/3F76:	E8      	INX
C0/3F77:	E8      	INX
C0/3F78:	E02000  	CPX #$0020
C0/3F7B:	D0EB    	BNE $3F68
C0/3F7D:	60      	RTS
 
C0/3F7E:	A600    	LDX $00		(from only C0/1EB5)
C0/3F80:	AD8E05  	LDA $058E
C0/3F83:	4904    	EOR #$04
C0/3F85:	8D8E05  	STA $058E
C0/3F88:	9FD5817E	STA $7E81D5,X
C0/3F8C:	9F15827E	STA $7E8215,X
C0/3F90:	9F35827E	STA $7E8235,X
C0/3F94:	E8      	INX
C0/3F95:	E8      	INX
C0/3F96:	E8      	INX
C0/3F97:	E8      	INX
C0/3F98:	E02000  	CPX #$0020
C0/3F9B:	D0EB    	BNE $3F88
C0/3F9D:	60      	RTS
 
C0/3F9E:	A600    	LDX $00		(from only C0/1EBE)
C0/3FA0:	AD9005  	LDA $0590
C0/3FA3:	4904    	EOR #$04
C0/3FA5:	8D9005  	STA $0590
C0/3FA8:	9F16827E	STA $7E8216,X
C0/3FAC:	9F36827E	STA $7E8236,X
C0/3FB0:	E8      	INX
C0/3FB1:	E8      	INX
C0/3FB2:	E8      	INX
C0/3FB3:	E8      	INX
C0/3FB4:	E02000  	CPX #$0020
C0/3FB7:	D0EF    	BNE $3FA8
C0/3FB9:	60      	RTS
 
C0/3FBA:	AD8C05  	LDA $058C		(is this function ever called?)
C0/3FBD:	4904    	EOR #$04
C0/3FBF:	8D8C05  	STA $058C
C0/3FC2:	AD8E05  	LDA $058E
C0/3FC5:	4904    	EOR #$04
C0/3FC7:	8D8E05  	STA $058E
C0/3FCA:	AD9005  	LDA $0590
C0/3FCD:	4904    	EOR #$04
C0/3FCF:	8D9005  	STA $0590
C0/3FD2:	A600    	LDX $00
C0/3FD4:	AD8C05  	LDA $058C
C0/3FD7:	9F14827E	STA $7E8214,X
C0/3FDB:	9F34827E	STA $7E8234,X
C0/3FDF:	9FD4817E	STA $7E81D4,X
C0/3FE3:	AD8E05  	LDA $058E
C0/3FE6:	9FD5817E	STA $7E81D5,X
C0/3FEA:	9F15827E	STA $7E8215,X
C0/3FEE:	9F35827E	STA $7E8235,X
C0/3FF2:	AD9005  	LDA $0590
C0/3FF5:	9F16827E	STA $7E8216,X
C0/3FF9:	9F36827E	STA $7E8236,X
C0/3FFD:	E8      	INX
C0/3FFE:	E8      	INX
C0/3FFF:	E8      	INX
C0/4000:	E8      	INX
C0/4001:	E02000  	CPX #$0020
C0/4004:	D0CE    	BNE $3FD4
C0/4006:	60      	RTS
 
C0/4007:	A97E    	LDA #$7E
C0/4009:	48      	PHA
C0/400A:	AB      	PLB            (make the data bank reg. hold #$7E)
C0/400B:	A546    	LDA $46
C0/400D:	0A      	ASL A
C0/400E:	0A      	ASL A
C0/400F:	AA      	TAX
C0/4010:	A400    	LDY $00
C0/4012:	BF00FDC0	LDA $C0FD00,X  (random number!)
C0/4016:	C9C0    	CMP #$C0
C0/4018:	9006    	BCC $4020
C0/401A:	2930    	AND #$30
C0/401C:	0904    	ORA #$04
C0/401E:	8001    	BRA $4021
C0/4020:	7B      	TDC 
C0/4021:	99D381  	STA $81D3,Y
C0/4024:	E8      	INX
C0/4025:	C8      	INY 
C0/4026:	C8      	INY 
C0/4027:	C8      	INY 
C0/4028:	C8      	INY 
C0/4029:	C02000  	CPY #$0020
C0/402C:	D0E4    	BNE $4012
C0/402E:	7B      	TDC 
C0/402F:	48      	PHA
C0/4030:	AB      	PLB            (make the data bank reg. hold #$00)
C0/4031:	60      	RTS
 
C0/4032:	A97E    	LDA #$7E		(from only C0/394C)
C0/4034:	48      	PHA
C0/4035:	AB      	PLB            (make the data bank reg. hold #$7E)
C0/4036:	C220    	REP #$20      	(16 bit accum./memory)
C0/4038:	A600    	LDX $00
C0/403A:	A97382  	LDA #$8273
C0/403D:	9DFA7B  	STA $7BFA,X
C0/4040:	A99382  	LDA #$8293
C0/4043:	9DFD7B  	STA $7BFD,X
C0/4046:	A9B382  	LDA #$82B3
C0/4049:	9D557C  	STA $7C55,X
C0/404C:	A9D382  	LDA #$82D3
C0/404F:	9D587C  	STA $7C58,X
C0/4052:	A9F382  	LDA #$82F3
C0/4055:	9DB07C  	STA $7CB0,X
C0/4058:	9DB37C  	STA $7CB3,X
C0/405B:	E8      	INX
C0/405C:	E8      	INX
C0/405D:	E8      	INX
C0/405E:	E8      	INX
C0/405F:	E8      	INX
C0/4060:	E8      	INX
C0/4061:	E04E00  	CPX #$004E
C0/4064:	D0D4    	BNE $403A
C0/4066:	A600    	LDX $00
C0/4068:	7B      	TDC 
C0/4069:	9D1383  	STA $8313,X
C0/406C:	E8      	INX
C0/406D:	E8      	INX
C0/406E:	E02002  	CPX #$0220
C0/4071:	D0F6    	BNE $4069
C0/4073:	A600    	LDX $00
C0/4075:	9B      	TXY
C0/4076:	BF3642C0	LDA $C04236,X
C0/407A:	29FF00  	AND #$00FF
C0/407D:	993583  	STA $8335,Y
C0/4080:	C8      	INY 
C0/4081:	C8      	INY 
C0/4082:	C8      	INY 
C0/4083:	C8      	INY 
C0/4084:	E8      	INX
C0/4085:	E08000  	CPX #$0080
C0/4088:	D0EC    	BNE $4076
C0/408A:	A600    	LDX $00
C0/408C:	9B      	TXY
C0/408D:	7B      	TDC 
C0/408E:	99F385  	STA $85F3,Y
C0/4091:	BF1641C0	LDA $C04116,X
C0/4095:	29FF00  	AND #$00FF
C0/4098:	99F585  	STA $85F5,Y
C0/409B:	E8      	INX
C0/409C:	E8      	INX
C0/409D:	C8      	INY 
C0/409E:	C8      	INY 
C0/409F:	C8      	INY 
C0/40A0:	C8      	INY 
C0/40A1:	C02001  	CPY #$0120
C0/40A4:	D0E7    	BNE $408D
C0/40A6:	A600    	LDX $00
C0/40A8:	9B      	TXY
C0/40A9:	7B      	TDC 
C0/40AA:	997385  	STA $8573,Y
C0/40AD:	BFF241C0	LDA $C041F2,X
C0/40B1:	29FF00  	AND #$00FF
C0/40B4:	997585  	STA $8575,Y
C0/40B7:	E8      	INX
C0/40B8:	E8      	INX
C0/40B9:	C8      	INY 
C0/40BA:	C8      	INY 
C0/40BB:	C8      	INY 
C0/40BC:	C8      	INY 
C0/40BD:	C08000  	CPY #$0080
C0/40C0:	D0E7    	BNE $40A9
C0/40C2:	A600    	LDX $00
C0/40C4:	7B      	TDC 
C0/40C5:	9D3385  	STA $8533,X
C0/40C8:	E8      	INX
C0/40C9:	E8      	INX
C0/40CA:	E02000  	CPX #$0020
C0/40CD:	D0F6    	BNE $40C5
C0/40CF:	A600    	LDX $00
C0/40D1:	7B      	TDC 
C0/40D2:	7B      	TDC 
C0/40D3:	9D5385  	STA $8553,X
C0/40D6:	A92800  	LDA #$0028
C0/40D9:	9D5585  	STA $8555,X
C0/40DC:	E8      	INX
C0/40DD:	E8      	INX
C0/40DE:	E8      	INX
C0/40DF:	E8      	INX
C0/40E0:	E02000  	CPX #$0020
C0/40E3:	D0ED    	BNE $40D2
C0/40E5:	A600    	LDX $00
C0/40E7:	A9B000  	LDA #$00B0
C0/40EA:	9D1587  	STA $8715,X
C0/40ED:	7B      	TDC 
C0/40EE:	9D1387  	STA $8713,X
C0/40F1:	E8      	INX
C0/40F2:	E8      	INX
C0/40F3:	E8      	INX
C0/40F4:	E8      	INX
C0/40F5:	E02000  	CPX #$0020
C0/40F8:	D0ED    	BNE $40E7
C0/40FA:	A600    	LDX $00
C0/40FC:	A9B800  	LDA #$00B8
C0/40FF:	9D3587  	STA $8735,X
C0/4102:	7B      	TDC 
C0/4103:	9D3387  	STA $8733,X
C0/4106:	E8      	INX
C0/4107:	E8      	INX
C0/4108:	E8      	INX
C0/4109:	E8      	INX
C0/410A:	E02000  	CPX #$0020
C0/410D:	D0ED    	BNE $40FC
C0/410F:	7B      	TDC 
C0/4110:	E220    	SEP #$20       (8 bit accum./memory)
C0/4112:	7B      	TDC 
C0/4113:	48      	PHA
C0/4114:	AB      	PLB            (make the data bank reg. hold #$00)
C0/4115:	60      	RTS
 
C0/4116:	FCFFFC  	JSR ($FCFF,X)
C0/4119:	FFFCFFFC	SBC $FCFFFC,X
C0/411D:	FFFCFFFC	SBC $FCFFFC,X
C0/4121:	FFFCFFFC	SBC $FCFFFC,X
C0/4125:	FFFCFFFC	SBC $FCFFFC,X
C0/4129:	FFFCFFFC	SBC $FCFFFC,X
C0/412D:	FFFCFFFC	SBC $FCFFFC,X
C0/4131:	FFFCFFFC	SBC $FCFFFC,X
C0/4135:	FFFCFFFC	SBC $FCFFFC,X
C0/4139:	FFFCFFFC	SBC $FCFFFC,X
C0/413D:	FFFDFFFD	SBC $FDFFFD,X
C0/4141:	FFFDFFFD	SBC $FDFFFD,X
C0/4145:	FFFDFFFD	SBC $FDFFFD,X
C0/4149:	FFFDFFFD	SBC $FDFFFD,X
C0/414D:	FFFDFFFD	SBC $FDFFFD,X
C0/4151:	FFFDFFFD	SBC $FDFFFD,X
C0/4155:	FFFDFFFD	SBC $FDFFFD,X
C0/4159:	FFFDFFFE	SBC $FEFFFD,X
C0/415D:	FFFEFFFE	SBC $FEFFFE,X
C0/4161:	FFFEFFFE	SBC $FEFFFE,X
C0/4165:	FFFEFFFE	SBC $FEFFFE,X
C0/4169:	FFFEFFFE	SBC $FEFFFE,X
C0/416D:	FFFEFFFE	SBC $FEFFFE,X
C0/4171:	FFFEFFFE	SBC $FEFFFE,X
C0/4175:	FFFEFFFE	SBC $FEFFFE,X
C0/4179:	FFFFFFFF	SBC $FFFFFF,X
C0/417D:	FFFFFFFF	SBC $FFFFFF,X
C0/4181:	FFFFFFFF	SBC $FFFFFF,X
C0/4185:	FFFFFFFF	SBC $FFFFFF,X
C0/4189:	FFFFFFFF	SBC $FFFFFF,X
C0/418D:	FFFFFFFF	SBC $FFFFFF,X
C0/4191:	FFFFFFFF	SBC $FFFFFF,X
C0/4195:	FFFFFF00	SBC $00FFFF,X
C0/4199:	0000    	BRK #$00
C0/419B:	0000    	BRK #$00
C0/419D:	0000    	BRK #$00
C0/419F:	0000    	BRK #$00
C0/41A1:	0000    	BRK #$00
C0/41A3:	0000    	BRK #$00
C0/41A5:	0000    	BRK #$00
C0/41A7:	0000    	BRK #$00
C0/41A9:	0000    	BRK #$00
C0/41AB:	0000    	BRK #$00
C0/41AD:	0000    	BRK #$00
C0/41AF:	0000    	BRK #$00
C0/41B1:	0000    	BRK #$00
C0/41B3:	0000    	BRK #$00
C0/41B5:	0001    	BRK #$01
C0/41B7:	0001    	BRK #$01
C0/41B9:	0001    	BRK #$01
C0/41BB:	0001    	BRK #$01
C0/41BD:	0001    	BRK #$01
C0/41BF:	0001    	BRK #$01
C0/41C1:	0001    	BRK #$01
C0/41C3:	0001    	BRK #$01
C0/41C5:	0001    	BRK #$01
C0/41C7:	0001    	BRK #$01
C0/41C9:	0001    	BRK #$01
C0/41CB:	0001    	BRK #$01
C0/41CD:	0001    	BRK #$01
C0/41CF:	0001    	BRK #$01
C0/41D1:	0001    	BRK #$01
C0/41D3:	0001    	BRK #$01
C0/41D5:	0001    	BRK #$01
C0/41D7:	0001    	BRK #$01
C0/41D9:	0001    	BRK #$01
C0/41DB:	0001    	BRK #$01
C0/41DD:	0001    	BRK #$01
C0/41DF:	0001    	BRK #$01
C0/41E1:	0001    	BRK #$01
C0/41E3:	0001    	BRK #$01
C0/41E5:	0001    	BRK #$01
C0/41E7:	0001    	BRK #$01
C0/41E9:	0001    	BRK #$01
C0/41EB:	0001    	BRK #$01
C0/41ED:	0001    	BRK #$01
C0/41EF:	0001    	BRK #$01
C0/41F1:	00FA    	BRK #$FA
C0/41F3:	FFFAFFFA	SBC $FAFFFA,X
C0/41F7:	FFFAFFFA	SBC $FAFFFA,X
C0/41FB:	FFFAFFFA	SBC $FAFFFA,X
C0/41FF:	FFFAFFFA	SBC $FAFFFA,X
C0/4203:	FFFAFFFA	SBC $FAFFFA,X
C0/4207:	FFFAFFFA	SBC $FAFFFA,X
C0/420B:	FFFAFFFA	SBC $FAFFFA,X
C0/420F:	FFFAFFFA	SBC $FAFFFA,X
C0/4213:	FFFAFFFA	SBC $FAFFFA,X
C0/4217:	FFFAFFFA	SBC $FAFFFA,X
C0/421B:	FFFAFF00	SBC $00FFFA,X
C0/421F:	0000    	BRK #$00
C0/4221:	0000    	BRK #$00
C0/4223:	0000    	BRK #$00
C0/4225:	0000    	BRK #$00
C0/4227:	0000    	BRK #$00
C0/4229:	0000    	BRK #$00
C0/422B:	0000    	BRK #$00
C0/422D:	0000    	BRK #$00
C0/422F:	0000    	BRK #$00
C0/4231:	0000    	BRK #$00
C0/4233:	0000    	BRK #$00
C0/4235:	00F8    	BRK #$F8
C0/4237:	F8      	SED 
C0/4238:	F9F9F9  	SBC $F9F9,Y
C0/423B:	F9FAFA  	SBC $FAFA,Y
C0/423E:	FA      	PLX
C0/423F:	FB      	XCE 
C0/4240:	FB      	XCE 
C0/4241:	FB      	XCE 
C0/4242:	FB      	XCE 
C0/4243:	FCFCFC  	JSR ($FCFC,X)
C0/4246:	FDFDFD  	SBC $FDFD,X
C0/4249:	FDFEFE  	SBC $FEFE,X
C0/424C:	FEFFFF  	INC $FFFF,X
C0/424F:	FFFF0000	SBC $0000FF,X
C0/4253:	0101    	ORA ($01,X)
C0/4255:	0101    	ORA ($01,X)
C0/4257:	0202    	COP #$02
C0/4259:	0203    	COP #$03
C0/425B:	0303    	ORA $03,S
C0/425D:	0304    	ORA $04,S
C0/425F:	0404    	TSB $04
C0/4261:	0505    	ORA $05
C0/4263:	0505    	ORA $05
C0/4265:	0606    	ASL $06
C0/4267:	0607    	ASL $07
C0/4269:	0707    	ORA [$07]
C0/426B:	0708    	ORA [$08]
C0/426D:	08      	PHP 
C0/426E:	F0F1    	BEQ $4261
C0/4270:	F2F2    	SBC ($F2)
C0/4272:	F3F4    	SBC ($F4,S),Y
C0/4274:	F5F6    	SBC $F6,X
C0/4276:	F6F7    	INC $F7,X
C0/4278:	F8      	SED 
C0/4279:	F9FAFA  	SBC $FAFA,Y
C0/427C:	FB      	XCE 
C0/427D:	FCFDFE  	JSR ($FEFD,X)
C0/4280:	FEFF01  	INC $01FF,X
C0/4283:	0202    	COP #$02
C0/4285:	0304    	ORA $04,S
C0/4287:	0506    	ORA $06
C0/4289:	0607    	ASL $07
C0/428B:	08      	PHP 
C0/428C:	090A    	ORA #$0A
C0/428E:	0A      	ASL A
C0/428F:	0B      	PHD
C0/4290:	0C0D0E  	TSB $0E0D
C0/4293:	0E0F10  	ASL $100F
C0/4296:	E8      	INX
C0/4297:	EA      	NOP
C0/4298:	ECEEF0  	CPX $F0EE
C0/429B:	F2F4    	SBC ($F4)
C0/429D:	F6F8    	INC $F8,X
C0/429F:	FA      	PLX
C0/42A0:	FCFE02  	JSR ($02FE,X)
C0/42A3:	0406    	TSB $06
C0/42A5:	08      	PHP 
C0/42A6:	0A      	ASL A
C0/42A7:	0C0E10  	TSB $100E
C0/42AA:	1214    	ORA ($14)
C0/42AC:	1618    	ASL $18,X
C0/42AE:	E0E8F0  	CPX #$F0E8
C0/42B1:	F8      	SED 
C0/42B2:	08      	PHP 
C0/42B3:	1018    	BPL $42CD
C0/42B5:	20

C0/42B6:	C220    	REP #$20      	(from C0/BFA0, 8 bit accum./memory)
C0/42B8:	A564    	LDA $64
C0/42BA:	38      	SEC 
C0/42BB:	E90800  	SBC #$0008
C0/42BE:	E220    	SEP #$20
C0/42C0:	8D0F21  	STA $210F
C0/42C3:	EB      	XBA
C0/42C4:	8D0F21  	STA $210F
C0/42C7:	C220    	REP #$20      	(16 bit accum./memory)
C0/42C9:	A568    	LDA $68
C0/42CB:	18      	CLC
C0/42CC:	6D4E07  	ADC $074E
C0/42CF:	E220    	SEP #$20      	(8 bit accum./memory)
C0/42D1:	8D1021  	STA $2110
C0/42D4:	EB      	XBA
C0/42D5:	8D1021  	STA $2110
C0/42D8:	7B      	TDC 
C0/42D9:	A97E    	LDA #$7E
C0/42DB:	48      	PHA
C0/42DC:	AB      	PLB            (make the data bank reg. hold #$7E)
C0/42DD:	C220    	REP #$20      	(16 bit accum./memory)
C0/42DF:	A55C    	LDA $5C
C0/42E1:	38      	SEC 
C0/42E2:	E90800  	SBC #$0008
C0/42E5:	8D7382  	STA $8273
C0/42E8:	8D7782  	STA $8277
C0/42EB:	8D7B82  	STA $827B
C0/42EE:	8D7F82  	STA $827F
C0/42F1:	8D8382  	STA $8283
C0/42F4:	8D8782  	STA $8287
C0/42F7:	8D8B82  	STA $828B
C0/42FA:	8D8F82  	STA $828F
C0/42FD:	8D9382  	STA $8293
C0/4300:	8D9782  	STA $8297
C0/4303:	8D9B82  	STA $829B
C0/4306:	8D9F82  	STA $829F
C0/4309:	8DA382  	STA $82A3
C0/430C:	8DA782  	STA $82A7
C0/430F:	8DAB82  	STA $82AB
C0/4312:	8DAF82  	STA $82AF
C0/4315:	A564    	LDA $64
C0/4317:	38      	SEC 
C0/4318:	E90800  	SBC #$0008
C0/431B:	8DB382  	STA $82B3
C0/431E:	8DB782  	STA $82B7
C0/4321:	8DBB82  	STA $82BB
C0/4324:	8DBF82  	STA $82BF
C0/4327:	8DC382  	STA $82C3
C0/432A:	8DC782  	STA $82C7
C0/432D:	8DCB82  	STA $82CB
C0/4330:	8DCF82  	STA $82CF
C0/4333:	8DD382  	STA $82D3
C0/4336:	8DD782  	STA $82D7
C0/4339:	8DDB82  	STA $82DB
C0/433C:	8DDF82  	STA $82DF
C0/433F:	8DE382  	STA $82E3
C0/4342:	8DE782  	STA $82E7
C0/4345:	8DEB82  	STA $82EB
C0/4348:	8DEF82  	STA $82EF
C0/434B:	A56C    	LDA $6C
C0/434D:	38      	SEC 
C0/434E:	E90800  	SBC #$0008
C0/4351:	8DF382  	STA $82F3
C0/4354:	8DF782  	STA $82F7
C0/4357:	8DFB82  	STA $82FB
C0/435A:	8DFF82  	STA $82FF
C0/435D:	8D0383  	STA $8303
C0/4360:	8D0783  	STA $8307
C0/4363:	8D0B83  	STA $830B
C0/4366:	8D0F83  	STA $830F
C0/4369:	A560    	LDA $60
C0/436B:	18      	CLC
C0/436C:	6D4C07  	ADC $074C
C0/436F:	8D7582  	STA $8275
C0/4372:	8D7982  	STA $8279
C0/4375:	8D7D82  	STA $827D
C0/4378:	8D8182  	STA $8281
C0/437B:	8D8582  	STA $8285
C0/437E:	8D8982  	STA $8289
C0/4381:	8D8D82  	STA $828D
C0/4384:	8D9182  	STA $8291
C0/4387:	8D9582  	STA $8295
C0/438A:	8D9982  	STA $8299
C0/438D:	8D9D82  	STA $829D
C0/4390:	8DA182  	STA $82A1
C0/4393:	8DA582  	STA $82A5
C0/4396:	8DA982  	STA $82A9
C0/4399:	8DAD82  	STA $82AD
C0/439C:	8DB182  	STA $82B1
C0/439F:	7B      	TDC 
C0/43A0:	E220    	SEP #$20      	(8 bit accum./memory)
C0/43A2:	AD2105  	LDA $0521
C0/43A5:	2910    	AND #$10
C0/43A7:	D003    	BNE $43AC
C0/43A9:	4C4A44  	JMP $444A

C0/43AC:	A546    	LDA $46
C0/43AE:	4A      	LSR A
C0/43AF:	18      	CLC
C0/43B0:	6560    	ADC $60
C0/43B2:	290F    	AND #$0F
C0/43B4:	0A      	ASL A
C0/43B5:	AA      	TAX
C0/43B6:	C220    	REP #$20      	(16 bit accum./memory)
C0/43B8:	A460    	LDY $60
C0/43BA:	98      	TYA
C0/43BB:	18      	CLC
C0/43BC:	7F6745C0	ADC $C04567,X
C0/43C0:	8D7582  	STA $8275
C0/43C3:	98      	TYA
C0/43C4:	18      	CLC
C0/43C5:	7F6945C0	ADC $C04569,X
C0/43C9:	8D7982  	STA $8279
C0/43CC:	98      	TYA
C0/43CD:	18      	CLC
C0/43CE:	7F6B45C0	ADC $C0456B,X
C0/43D2:	8D7D82  	STA $827D
C0/43D5:	98      	TYA
C0/43D6:	18      	CLC
C0/43D7:	7F6D45C0	ADC $C0456D,X
C0/43DB:	8D8182  	STA $8281
C0/43DE:	98      	TYA
C0/43DF:	18      	CLC
C0/43E0:	7F6F45C0	ADC $C0456F,X
C0/43E4:	8D8582  	STA $8285
C0/43E7:	98      	TYA
C0/43E8:	18      	CLC
C0/43E9:	7F7145C0	ADC $C04571,X
C0/43ED:	8D8982  	STA $8289
C0/43F0:	98      	TYA
C0/43F1:	18      	CLC
C0/43F2:	7F7345C0	ADC $C04573,X
C0/43F6:	8D8D82  	STA $828D
C0/43F9:	98      	TYA
C0/43FA:	18      	CLC
C0/43FB:	7F7545C0	ADC $C04575,X
C0/43FF:	8D9182  	STA $8291
C0/4402:	98      	TYA
C0/4403:	18      	CLC
C0/4404:	7F7745C0	ADC $C04577,X
C0/4408:	8D9582  	STA $8295
C0/440B:	98      	TYA
C0/440C:	18      	CLC
C0/440D:	7F7945C0	ADC $C04579,X
C0/4411:	8D9982  	STA $8299
C0/4414:	98      	TYA
C0/4415:	18      	CLC
C0/4416:	7F7B45C0	ADC $C0457B,X
C0/441A:	8D9D82  	STA $829D
C0/441D:	98      	TYA
C0/441E:	18      	CLC
C0/441F:	7F7D45C0	ADC $C0457D,X
C0/4423:	8DA182  	STA $82A1
C0/4426:	98      	TYA
C0/4427:	18      	CLC
C0/4428:	7F7F45C0	ADC $C0457F,X
C0/442C:	8DA582  	STA $82A5
C0/442F:	98      	TYA
C0/4430:	18      	CLC
C0/4431:	7F8145C0	ADC $C04581,X
C0/4435:	8DA982  	STA $82A9
C0/4438:	98      	TYA
C0/4439:	18      	CLC
C0/443A:	7F8345C0	ADC $C04583,X
C0/443E:	8DAD82  	STA $82AD
C0/4441:	98      	TYA
C0/4442:	18      	CLC
C0/4443:	7F8545C0	ADC $C04585,X
C0/4447:	8DB182  	STA $82B1
C0/444A:	7B      	TDC 
C0/444B:	E220    	SEP #$20      	(8 bit accum./memory)
C0/444D:	AD2105  	LDA $0521
C0/4450:	2908    	AND #$08
C0/4452:	D003    	BNE $4457
C0/4454:	4CF844  	JMP $44F8

C0/4457:	A546    	LDA $46
C0/4459:	4A      	LSR A
C0/445A:	18      	CLC
C0/445B:	6568    	ADC $68
C0/445D:	18      	CLC
C0/445E:	6908    	ADC #$08
C0/4460:	290F    	AND #$0F
C0/4462:	0A      	ASL A
C0/4463:	AA      	TAX
C0/4464:	C220    	REP #$20      	(16 bit accum./memory)
C0/4466:	A468    	LDY $68
C0/4468:	98      	TYA
C0/4469:	18      	CLC
C0/446A:	7F6745C0	ADC $C04567,X
C0/446E:	8DB582  	STA $82B5
C0/4471:	98      	TYA
C0/4472:	18      	CLC
C0/4473:	7F6945C0	ADC $C04569,X
C0/4477:	8DB982  	STA $82B9
C0/447A:	98      	TYA
C0/447B:	18      	CLC
C0/447C:	7F6B45C0	ADC $C0456B,X
C0/4480:	8DBD82  	STA $82BD
C0/4483:	98      	TYA
C0/4484:	18      	CLC
C0/4485:	7F6D45C0	ADC $C0456D,X
C0/4489:	8DC182  	STA $82C1
C0/448C:	98      	TYA
C0/448D:	18      	CLC
C0/448E:	7F6F45C0	ADC $C0456F,X
C0/4492:	8DC582  	STA $82C5
C0/4495:	98      	TYA
C0/4496:	18      	CLC
C0/4497:	7F7145C0	ADC $C04571,X
C0/449B:	8DC982  	STA $82C9
C0/449E:	98      	TYA
C0/449F:	18      	CLC
C0/44A0:	7F7345C0	ADC $C04573,X
C0/44A4:	8DCD82  	STA $82CD
C0/44A7:	98      	TYA
C0/44A8:	18      	CLC
C0/44A9:	7F7545C0	ADC $C04575,X
C0/44AD:	8DD182  	STA $82D1
C0/44B0:	98      	TYA
C0/44B1:	18      	CLC
C0/44B2:	7F7745C0	ADC $C04577,X
C0/44B6:	8DD582  	STA $82D5
C0/44B9:	98      	TYA
C0/44BA:	18      	CLC
C0/44BB:	7F7945C0	ADC $C04579,X
C0/44BF:	8DD982  	STA $82D9
C0/44C2:	98      	TYA
C0/44C3:	18      	CLC
C0/44C4:	7F7B45C0	ADC $C0457B,X
C0/44C8:	8DDD82  	STA $82DD
C0/44CB:	98      	TYA
C0/44CC:	18      	CLC
C0/44CD:	7F7D45C0	ADC $C0457D,X
C0/44D1:	8DE182  	STA $82E1
C0/44D4:	98      	TYA
C0/44D5:	18      	CLC
C0/44D6:	7F7F45C0	ADC $C0457F,X
C0/44DA:	8DE582  	STA $82E5
C0/44DD:	98      	TYA
C0/44DE:	18      	CLC
C0/44DF:	7F8145C0	ADC $C04581,X
C0/44E3:	8DE982  	STA $82E9
C0/44E6:	98      	TYA
C0/44E7:	18      	CLC
C0/44E8:	7F8345C0	ADC $C04583,X
C0/44EC:	8DED82  	STA $82ED
C0/44EF:	98      	TYA
C0/44F0:	18      	CLC
C0/44F1:	7F8545C0	ADC $C04585,X
C0/44F5:	8DF182  	STA $82F1
C0/44F8:	7B      	TDC 
C0/44F9:	E220    	SEP #$20      	(8 bit accum./memory)
C0/44FB:	A546    	LDA $46
C0/44FD:	4A      	LSR A
C0/44FE:	4A      	LSR A
C0/44FF:	4A      	LSR A
C0/4500:	18      	CLC
C0/4501:	6570    	ADC $70
C0/4503:	2907    	AND #$07
C0/4505:	0A      	ASL A
C0/4506:	AA      	TAX
C0/4507:	AD2105  	LDA $0521
C0/450A:	2904    	AND #$04
C0/450C:	D003    	BNE $4511
C0/450E:	A22000  	LDX #$0020
C0/4511:	C221    	REP #$21
C0/4513:	A570    	LDA $70
C0/4515:	6D5007  	ADC $0750
C0/4518:	A8      	TAY
C0/4519:	18      	CLC
C0/451A:	7FE745C0	ADC $C045E7,X
C0/451E:	8DF582  	STA $82F5
C0/4521:	98      	TYA
C0/4522:	18      	CLC
C0/4523:	7FE945C0	ADC $C045E9,X
C0/4527:	8DF982  	STA $82F9
C0/452A:	98      	TYA
C0/452B:	18      	CLC
C0/452C:	7FEB45C0	ADC $C045EB,X
C0/4530:	8DFD82  	STA $82FD
C0/4533:	98      	TYA
C0/4534:	18      	CLC
C0/4535:	7FED45C0	ADC $C045ED,X
C0/4539:	8D0183  	STA $8301
C0/453C:	98      	TYA
C0/453D:	18      	CLC
C0/453E:	7FEF45C0	ADC $C045EF,X
C0/4542:	8D0583  	STA $8305
C0/4545:	98      	TYA
C0/4546:	18      	CLC
C0/4547:	7FF145C0	ADC $C045F1,X
C0/454B:	8D0983  	STA $8309
C0/454E:	98      	TYA
C0/454F:	18      	CLC
C0/4550:	7FF345C0	ADC $C045F3,X
C0/4554:	8D0D83  	STA $830D
C0/4557:	98      	TYA
C0/4558:	18      	CLC
C0/4559:	7FF545C0	ADC $C045F5,X
C0/455D:	8D1183  	STA $8311
C0/4560:	7B      	TDC 
C0/4561:	E220    	SEP #$20      	(8 bit accum./memory)
C0/4563:	7B      	TDC 
C0/4564:	48      	PHA
C0/4565:	AB      	PLB            (make the data bank reg. hold #$00)
C0/4566:	60      	RTS
 
C0/4567:	0000    	BRK #$00
C0/4569:	0100    	ORA ($00,X)
C0/456B:	0100    	ORA ($00,X)
C0/456D:	0200    	COP #$00
C0/456F:	0200    	COP #$00
C0/4571:	0200    	COP #$00
C0/4573:	0100    	ORA ($00,X)
C0/4575:	0100    	ORA ($00,X)
C0/4577:	0000    	BRK #$00
C0/4579:	FFFFFFFF	SBC $FFFFFF,X
C0/457D:	FEFFFE  	INC $FEFF,X
C0/4580:	FFFEFFFF	SBC $FFFFFE,X
C0/4584:	FFFFFF00	SBC $00FFFF,X
C0/4588:	0001    	BRK #$01
C0/458A:	0001    	BRK #$01
C0/458C:	0002    	BRK #$02
C0/458E:	0002    	BRK #$02
C0/4590:	0002    	BRK #$02
C0/4592:	0001    	BRK #$01
C0/4594:	0001    	BRK #$01
C0/4596:	0000    	BRK #$00
C0/4598:	00FF    	BRK #$FF
C0/459A:	FFFFFFFE	SBC $FEFFFF,X
C0/459E:	FFFEFFFE	SBC $FEFFFE,X
C0/45A2:	FFFFFFFF	SBC $FFFFFF,X
C0/45A6:	FF000000	SBC $000000,X
C0/45AA:	0000    	BRK #$00
C0/45AC:	0000    	BRK #$00
C0/45AE:	0000    	BRK #$00
C0/45B0:	0000    	BRK #$00
C0/45B2:	0000    	BRK #$00
C0/45B4:	0000    	BRK #$00
C0/45B6:	0000    	BRK #$00
C0/45B8:	0000    	BRK #$00
C0/45BA:	0000    	BRK #$00
C0/45BC:	0000    	BRK #$00
C0/45BE:	0000    	BRK #$00
C0/45C0:	0000    	BRK #$00
C0/45C2:	0000    	BRK #$00
C0/45C4:	0000    	BRK #$00
C0/45C6:	0000    	BRK #$00
C0/45C8:	0000    	BRK #$00
C0/45CA:	0000    	BRK #$00
C0/45CC:	0000    	BRK #$00
C0/45CE:	0000    	BRK #$00
C0/45D0:	0000    	BRK #$00
C0/45D2:	0000    	BRK #$00
C0/45D4:	0000    	BRK #$00
C0/45D6:	0000    	BRK #$00
C0/45D8:	0000    	BRK #$00
C0/45DA:	0000    	BRK #$00
C0/45DC:	0000    	BRK #$00
C0/45DE:	0000    	BRK #$00
C0/45E0:	0000    	BRK #$00
C0/45E2:	0000    	BRK #$00
C0/45E4:	0000    	BRK #$00
C0/45E6:	0000    	BRK #$00
C0/45E8:	0001    	BRK #$01
C0/45EA:	0001    	BRK #$01
C0/45EC:	0001    	BRK #$01
C0/45EE:	0000    	BRK #$00
C0/45F0:	00FF    	BRK #$FF
C0/45F2:	FFFFFFFF	SBC $FFFFFF,X
C0/45F6:	FF000001	SBC $010000,X
C0/45FA:	0001    	BRK #$01
C0/45FC:	0001    	BRK #$01
C0/45FE:	0000    	BRK #$00
C0/4600:	00FF    	BRK #$FF
C0/4602:	FFFFFFFF	SBC $FFFFFF,X
C0/4606:	FF000000	SBC $000000,X
C0/460A:	0000    	BRK #$00
C0/460C:	0000    	BRK #$00
C0/460E:	0000    	BRK #$00
C0/4610:	0000    	BRK #$00
C0/4612:	0000    	BRK #$00
C0/4614:	0000    	BRK #$00
C0/4616:	0000    	BRK #$00
C0/4618:	0000    	BRK #$00
C0/461A:	0000    	BRK #$00
C0/461C:	0000    	BRK #$00
C0/461E:	0000    	BRK #$00
C0/4620:	0000    	BRK #$00
C0/4622:	0000    	BRK #$00
C0/4624:	0000    	BRK #$00
C0/4626:	00

C0/4627:	AC0308    	LDY $0803,Y		(from C0/BEFB)
C0/462A:	ADC01F  	LDA $1FC0
C0/462D:	C220    	REP #$20      (16 bit accum./memory)
C0/462F:	0A      	ASL A
C0/4630:	0A      	ASL A
C0/4631:	0A      	ASL A
C0/4632:	0A      	ASL A
C0/4633:	E220    	SEP #$20      (8 bit accum./memory)
C0/4635:	996A08  	STA $086A,Y
C0/4638:	EB      	XBA
C0/4639:	996B08  	STA $086B,Y
C0/463C:	7B      	TDC 
C0/463D:	ADC11F  	LDA $1FC1
C0/4640:	C220    	REP #$20      (16 bit accum./memory)
C0/4642:	0A      	ASL A
C0/4643:	0A      	ASL A
C0/4644:	0A      	ASL A
C0/4645:	0A      	ASL A
C0/4646:	E220    	SEP #$20      (8 bit accum./memory)
C0/4648:	996D08  	STA $086D,Y
C0/464B:	EB      	XBA
C0/464C:	996E08  	STA $086E,Y
C0/464F:	7B      	TDC 
C0/4650:	60      	RTS
 
C0/4651:	AC0308  	LDY $0803
C0/4654:	AD4307  	LDA $0743
C0/4657:	300E    	BMI $4667
C0/4659:	997F08  	STA $087F,Y
C0/465C:	AA      	TAX
C0/465D:	BF2D58C0	LDA $C0582D,X
C0/4661:	997608  	STA $0876,Y
C0/4664:	997708  	STA $0877,Y
C0/4667:	7B      	TDC 
C0/4668:	997E08  	STA $087E,Y
C0/466B:	998608  	STA $0886,Y
C0/466E:	C220    	REP #$20      (16 bit accum./memory)
C0/4670:	997108  	STA $0871,Y
C0/4673:	997308  	STA $0873,Y
C0/4676:	E220    	SEP #$20      (8 bit accum./memory)
C0/4678:	A902    	LDA #$02
C0/467A:	997508  	STA $0875,Y
C0/467D:	60      	RTS
 
C0/467E:	204450  	JSR $5044
C0/4681:	AC0308  	LDY $0803
C0/4684:	A5B8    	LDA $B8
C0/4686:	2904    	AND #$04
C0/4688:	F03B    	BEQ $46C5
C0/468A:	AD4407  	LDA $0744
C0/468D:	85B2    	STA $B2
C0/468F:	C902    	CMP #$02
C0/4691:	F018    	BEQ $46AB
C0/4693:	A2F800  	LDX #$00F8
C0/4696:	86B4    	STX $B4
C0/4698:	B98008  	LDA $0880,Y
C0/469B:	0930    	ORA #$30
C0/469D:	998008  	STA $0880,Y
C0/46A0:	B98108  	LDA $0881,Y
C0/46A3:	29CF    	AND #$CF
C0/46A5:	0920    	ORA #$20
C0/46A7:	998108  	STA $0881,Y
C0/46AA:	60      	RTS
 
C0/46AB:	A2B801  	LDX #$01B8
C0/46AE:	86B4    	STX $B4
C0/46B0:	B98008  	LDA $0880,Y
C0/46B3:	29CF    	AND #$CF
C0/46B5:	0920    	ORA #$20
C0/46B7:	998008  	STA $0880,Y
C0/46BA:	B98108  	LDA $0881,Y
C0/46BD:	29CF    	AND #$CF
C0/46BF:	0920    	ORA #$20
C0/46C1:	998108  	STA $0881,Y
C0/46C4:	60      	RTS
 
C0/46C5:	A5B8    	LDA $B8		(is this function ever called?)
C0/46C7:	2903    	AND #$03
C0/46C9:	8DB200  	STA $00B2
C0/46CC:	B98108  	LDA $0881,Y
C0/46CF:	29CF    	AND #$CF
C0/46D1:	0920    	ORA #$20
C0/46D3:	998108  	STA $0881,Y
C0/46D6:	A5B8    	LDA $B8
C0/46D8:	2908    	AND #$08
C0/46DA:	F004    	BEQ $46E0
C0/46DC:	A930    	LDA #$30
C0/46DE:	8002    	BRA $46E2
C0/46E0:	A920    	LDA #$20
C0/46E2:	851A    	STA $1A
C0/46E4:	B98008  	LDA $0880,Y
C0/46E7:	29CF    	AND #$CF
C0/46E9:	051A    	ORA $1A
C0/46EB:	998008  	STA $0880,Y
C0/46EE:	A2F800  	LDX #$00F8
C0/46F1:	86B4    	STX $B4
C0/46F3:	60      	RTS

; Handle pushing A on field [?]
C0/46F4:	A54C    	LDA $4C           ; "Screen brightness"
C0/46F6:	C9F0    	CMP #$F0          ; maximum brightness
C0/46F8:	D031    	BNE $472B         ; exit if not ^
C0/46FA:	A559    	LDA $59           ; "Menu Opening"
C0/46FC:	D02D    	BNE $472B         ; exit if ^
C0/46FE:	A584    	LDA $84           ; "Map Loading"
C0/4700:	D029    	BNE $472B         ; exit if ^
C0/4702:	AC0308  	LDY $0803         ; visible character object data offset
C0/4705:	8C0442  	STY $4204         ; set division dividend
C0/4708:	A929    	LDA #$29          ; 41 (size of object data block)
C0/470A:	8D0642  	STA $4206         ; set division divisor
C0/470D:	A6E5    	LDX $E5           ; "Event PC" [?]
C0/470F:	E00000  	CPX #$0000        ; is it zero (does nothing)
C0/4712:	D017    	BNE $472B         ; exit if we're in an event
C0/4714:	A5E7    	LDA $E7           ; "Event PC" bank [?]
C0/4716:	C9CA    	CMP #$CA          ; is it the first event bank
C0/4718:	D011    	BNE $472B         ; exit if we're in an event
C0/471A:	B97C08  	LDA $087C,Y       ; visible character's movement flags
C0/471D:	290F    	AND #$0F          ; isolate "Movement Type"
C0/471F:	C902    	CMP #$02          ; "User Controlled"
C0/4721:	D008    	BNE $472B         ; exit if not ^
C0/4723:	A5BA    	LDA $BA           ; "Dialogue Opening"
C0/4725:	D004    	BNE $472B         ; exit if ^
C0/4727:	A506    	LDA $06           ; "Buttons Pressed"
C0/4729:	3001    	BMI $472C         ; branch if pushing "A"
C0/472B:	60      	RTS

; Pushing A [?] (FOOBAR 1EDB $40)
C0/472C:	B97F08  	LDA $087F,Y       ; visible character's facing direction
C0/472F:	1A      	INC A             ; convert to "movement type" (0=none)
C0/4730:	20037D  	JSR $7D03         ; get tile to check coordinates
C0/4733:	A61E    	LDX $1E           ; inspect tile X and Y coordinates
C0/4735:	BF00207E	LDA $7E2000,X     ; load object ID (x2) at coordinates
C0/4739:	3053    	BMI $478E         ; branch if null

C0/473B:	4A      	LSR A             ; get object ID
C0/473C:	CD1442  	CMP $4214         ; compare to visible character's object id
C0/473F:	F04D    	BEQ $478E         ; branch if matches charcter's ID

C0/4741:	0A      	ASL A             ; object ID x2
C0/4742:	AA      	TAX               ; index it
C0/4743:	BC9907  	LDY $0799,X       ; pointer to this object's data
C0/4746:	B97C08  	LDA $087C,Y       ; inspected object movement type
C0/4749:	2940    	AND #$40          ; does event activate on collision
C0/474B:	D0DE    	BNE $472B         ; exit if so ^

C0/474D:	A5B8    	LDA $B8           ; current bottom tile properties
C0/474F:	2907    	AND #$07
C0/4751:	C901    	CMP #$01          ; "Passable on upper Z level" [?]
C0/4753:	F01C    	BEQ $4771         ; branch if not ^
C0/4755:	C902    	CMP #$02          ; "Passable on lower Z level" [?]
C0/4757:	F023    	BEQ $477C         ; branch if not ^
C0/4759:	C903    	CMP #$03          ; "Transition between upper and lower" [?]
C0/475B:	F028    	BEQ $4785         ; branch if not ^
C0/475D:	A5B2    	LDA $B2           ; party's Z level
C0/475F:	D98808  	CMP $0888,Y       ; compare to object's Z level
C0/4762:	F068    	BEQ $47CC         ; branch if match
C0/4764:	C901    	CMP #$01          ; "Upper Z level"
C0/4766:	D026    	BNE $478E         ; branch if not ^
C0/4768:	B98808  	LDA $0888,Y       ; object's Z level
C0/476B:	2904    	AND #$04
C0/476D:	D05D    	BNE $47CC
C0/476F:	801D    	BRA $478E

C0/4771:	B98808  	LDA $0888,Y
C0/4774:	2907    	AND #$07
C0/4776:	C902    	CMP #$02
C0/4778:	F014    	BEQ $478E
C0/477A:	8050    	BRA $47CC

C0/477C:	B98808  	LDA $0888,Y
C0/477F:	2902    	AND #$02
C0/4781:	D049    	BNE $47CC
C0/4783:	8009    	BRA $478E
C0/4785:	B98808  	LDA $0888,Y
C0/4788:	2904    	AND #$04
C0/478A:	D002    	BNE $478E
C0/478C:	803E    	BRA $47CC

; Inspecting empty tile [?]
C0/478E:	A61E    	LDX $1E           ; tile coordinates to inspect
C0/4790:	BF00007F	LDA $7F0000,X     ; map data at coordinate
C0/4794:	AA      	TAX               ; index it
C0/4795:	BF00767E	LDA $7E7600,X     ; tile properties [?]
C0/4799:	C9F7    	CMP #$F7
C0/479B:	F08E    	BEQ $472B
C0/479D:	2907    	AND #$07
C0/479F:	C907    	CMP #$07
C0/47A1:	D088    	BNE $472B
C0/47A3:	B97F08  	LDA $087F,Y
C0/47A6:	AA      	TAX
C0/47A7:	A51E    	LDA $1E
C0/47A9:	18      	CLC
C0/47AA:	7F5748C0	ADC $C04857,X
C0/47AE:	2586    	AND $86
C0/47B0:	851E    	STA $1E
C0/47B2:	A51F    	LDA $1F
C0/47B4:	18      	CLC
C0/47B5:	7F5B48C0	ADC $C0485B,X
C0/47B9:	2587    	AND $87
C0/47BB:	851F    	STA $1F
C0/47BD:	A61E    	LDX $1E
C0/47BF:	BF00207E	LDA $7E2000,X
C0/47C3:	3006    	BMI $47CB
C0/47C5:	AA      	TAX
C0/47C6:	BC9907  	LDY $0799,X
C0/47C9:	8001    	BRA $47CC
C0/47CB:	60      	RTS

; Inspecting adjacent object (NPC) [?]
C0/47CC:	B97C08  	LDA $087C,Y     ; object's movement type
C0/47CF:	290F    	AND #$0F        ; isolate ^
C0/47D1:	C904    	CMP #$04        ; "Activated" (facing something) [?]
C0/47D3:	F0F6    	BEQ $47CB       ; exit if already ^
C0/47D5:	997D08  	STA $087D,Y     ; backup movement type for NPC object
C0/47D8:	A4DA    	LDY $DA         ; pointer to character object data
C0/47DA:	B97F08  	LDA $087F,Y     ; character facing direction
C0/47DD:	1A      	INC A
C0/47DE:	1A      	INC A           ; +2
C0/47DF:	2903    	AND #$03        ; Up: 0>2, Right: 1>3, Down: 2>0, Left: 3>1
C0/47E1:	851A    	STA $1A         ; save inverted facing direction
C0/47E3:	BC9907  	LDY $0799,X     ; pointer to inspected object NPC data
C0/47E6:	B97F08  	LDA $087F,Y     ; object facing direction
C0/47E9:	0A      	ASL A
C0/47EA:	0A      	ASL A
C0/47EB:	0A      	ASL A           ; shift up << 3
C0/47EC:	851B    	STA $1B         ; save shifted facing direction
C0/47EE:	B96808  	LDA $0868,Y     ; object sprite settings (backup)
C0/47F1:	29E7    	AND #$E7        ; mask out previous facing direction
C0/47F3:	051B    	ORA $1B         ; replace with current facing direction
C0/47F5:	996808  	STA $0868,Y     ; update object sprite settings
C0/47F8:	B97C08  	LDA $087C,Y     ; object's movement type
C0/47FB:	2920    	AND #$20        ; "Don't face target when activated"
C0/47FD:	D00D    	BNE $480C       ; branch if ^

C0/47FF:	A51A    	LDA $1A         ; new facing direction (inverted party)
C0/4801:	997F08  	STA $087F,Y     ; update NPC facing direction
C0/4804:	AA      	TAX             ; index facing direction
C0/4805:	BF2D58C0	LDA $C0582D,X   ; sprite index for facing direction
C0/4809:	997708  	STA $0877,Y     ; update sprite index

C0/480C:	B97C08  	LDA $087C,Y     ; object's movement data
C0/480F:	29F0    	AND #$F0        ; mask out "Movement Mode"
C0/4811:	0904    	ORA #$04        ; replace with "Activated"
C0/4813:	997C08  	STA $087C,Y     ; update NPC movement data
C0/4816:	B98908  	LDA $0889,Y     ; NPC's event script pointer (lo)
C0/4819:	85E5    	STA $E5         ; save it in scratch
C0/481B:	8DF405  	STA $05F4       ; save it on event stack for loops
C0/481E:	B98A08  	LDA $088A,Y     ; NPC's event script pointer (hi)
C0/4821:	85E6    	STA $E6         ; save it in scratch
C0/4823:	8DF505  	STA $05F5       ; save it on event stack for loops
C0/4826:	B98B08  	LDA $088B,Y     ; NPC's event script pointer (bank)
C0/4829:	18      	CLC             ; clear carry
C0/482A:	69CA    	ADC #$CA        ; add to base event bank
C0/482C:	85E7    	STA $E7         ; save bank in scratch
C0/482E:	8DF605  	STA $05F6       ; save it on event stack for loops
C0/4831:	A20000  	LDX #$0000      ; null pointer
C0/4834:	8E9405  	STX $0594       ; set in event stack for subroutines
C0/4837:	A9CA    	LDA #$CA        ; first event bank
C0/4839:	8D9605  	STA $0596       ; set in event stack for subroutines
C0/483C:	A901    	LDA #$01        ; one loop count
C0/483E:	8DC705  	STA $05C7       ; set loop count for next event [?]
C0/4841:	A20300  	LDX #$0003      ;
C0/4844:	86E8    	STX $E8         ; [?]
C0/4846:	A4DA    	LDY $DA         ; pointer to character object data
C0/4848:	B97C08  	LDA $087C,Y     ; character object movement data
C0/484B:	997D08  	STA $087D,Y     ; backup
C0/484E:	A904    	LDA #$04        ; "Activated" movement mode
C0/4850:	997C08  	STA $087C,Y     ; set movement mode
C0/4853:	20ED2F  	JSR $2FED       ;
C0/4856:	60      	RTS
 
C0/4857:	000100FF
C0/485B:	FF000100

C0/485F:	204450  	JSR $5044
C0/4862:	A5B8    	LDA $B8         ; current tile properties
C0/4864:	2903    	AND #$03        ; isolate "Passable" bits
C0/4866:	85B1    	STA $B1         ; store them ^
C0/4868:	20144F  	JSR $4F14       ; maybe update party priority to "normal"
C0/486B:	209F4F  	JSR $4F9F       ; update visible character's sprite priority
C0/486E:	A4DA    	LDY $DA         ; pointer to current object data
C0/4870:	C220    	REP #$20        ; 16-bit A
C0/4872:	7B      	TDC             ; zero A/B
C0/4873:	997108  	STA $0871,Y     ; zero horizontal movement speed
C0/4876:	997308  	STA $0873,Y     ; zero vertical movement speed
C0/4879:	8573    	STA $73         ; zero BG1 X-scroll speed
C0/487B:	8575    	STA $75         ; zero BG1 Y-scroll speed
C0/487D:	8577    	STA $77         ; zero BG2 X-scroll speed
C0/487F:	8579    	STA $79         ; zero BG2 Y-scroll speed
C0/4881:	857B    	STA $7B         ; zero BG3 X-scroll speed
C0/4883:	857D    	STA $7D         ; zero BG3 Y-scroll speed
C0/4885:	E220    	SEP #$20      	; 8-bit A
C0/4887:	B96808  	LDA $0868,Y     ; lead character sprite settings
C0/488A:	0901    	ORA #$01        ; "Enable Walking Animation"
C0/488C:	996808  	STA $0868,Y     ; update sprite settings
C0/488F:	ADB91E  	LDA $1EB9       ; look at bit $80, "No player control"
C0/4892:	3028    	BMI $48BC       ; branch to skip direction buttons if ^
C0/4894:	A584    	LDA $84         ; "Map Loading"
C0/4896:	D024    	BNE $48BC       ; branch to skip direction buttons if ^
C0/4898:	A559    	LDA $59         ; "Menu Opening"
C0/489A:	D020    	BNE $48BC       ; branch to skip direction buttons if ^
C0/489C:	AD5E05  	LDA $055E       ; "Handling Collision"
C0/489F:	D01B    	BNE $48BC       ; branch to skip direction buttons if ^
C0/48A1:	AD5A05  	LDA $055A       ; BG1 Map Data update status
C0/48A4:	F004    	BEQ $48AA       ; branch if no pending changes ^
C0/48A6:	C905    	CMP #$05        ; check for specific Map status [?]
C0/48A8:	D012    	BNE $48BC       ; branch to skip direction buttons if not ^
C0/48AA:	AD5B05  	LDA $055B       ; BG2 Map Data update status
C0/48AD:	F004    	BEQ $48B3       ; branch if no pending changes ^
C0/48AF:	C905    	CMP #$05        ; check for specific Map status [?]
C0/48B1:	D009    	BNE $48BC       ; branch to skip direction buttons if not ^
C0/48B3:	AD5C05  	LDA $055C       ; BG3 Map Data update status
C0/48B6:	F007    	BEQ $48BF       ; branch if no pending changes ^
C0/48B8:	C905    	CMP #$05        ; check for specific Map status [?]
C0/48BA:	F003    	BEQ $48BF       ; branch to check direction buttons if ^
C0/48BC:	4CEF49  	JMP $49EF	      ; skip direction buttons
	
C0/48BF:	A5B8    	LDA $B8         ; current tile properties
C0/48C1:	2904    	AND #$04        ; isolate "On Bridge" property [?]
C0/48C3:	F006    	BEQ $48CB       ; branch if not ^
C0/48C5:	A5B2    	LDA $B2         ; party's Z level
C0/48C7:	C902    	CMP #$02        ; at max [?]
C0/48C9:	F006    	BEQ $48D1       ; continue if ^
C0/48CB:	A5B8    	LDA $B8         ; current tile properties
C0/48CD:	29C0    	AND #$C0        ; isolate stairs [?]
C0/48CF:	D003    	BNE $48D4       ; branch if ^
C0/48D1:	4C7849  	JMP $4978       ; continue handling button input

; Check pressing right
C0/48D4:	A507    	LDA $07
C0/48D6:	2901    	AND #$01
C0/48D8:	F030    	BEQ $490A       ; branch if not pressing right
C0/48DA:	A901    	LDA #$01        ; -1
C0/48DC:	997F08  	STA $087F,Y     ; set facing direction "right"
C0/48DF:	A5B8    	LDA $B8         ; visible character's bottom tile
C0/48E1:	3016    	BMI $48F9       ; branch if is up/left stairs
C0/48E3:	A5A8    	LDA $A8         ; tile to up/right of character [?]
C0/48E5:	AA      	TAX             ; index pointer
C0/48E6:	BF00767E	LDA $7E7600,X   ; get tile data
C0/48EA:	C9F7    	CMP #$F7        ; "Always impassable"
C0/48EC:	F008    	BEQ $48F6       ; branch if ^
C0/48EE:	2940    	AND #$40        ; "Up/Right Stairs"
C0/48F0:	F004    	BEQ $48F6       ; branch if not ^
C0/48F2:	A905    	LDA #$05        ; "move Up/Right"
C0/48F4:	8049    	BRA $493F

C0/48F6:	4C7849  	JMP $4978	      ; continue handling button input

; Up/Left stairs
C0/48F9:	A5AE    	LDA $AE
C0/48FB:	AA      	TAX
C0/48FC:	BF00767E	LDA $7E7600,X
C0/4900:	1076    	BPL $4978       ; continue handling button input
C0/4902:	C9F7    	CMP #$F7
C0/4904:	F072    	BEQ $4978       ; continue handling button input
C0/4906:	A906    	LDA #$06
C0/4908:	8035    	BRA $493F

; Check pressing left
C0/490A:	A507    	LDA $07
C0/490C:	2902    	AND #$02
C0/490E:	F068    	BEQ $4978       ; continue handling button input
C0/4910:	A903    	LDA #$03
C0/4912:	997F08  	STA $087F,Y
C0/4915:	A5B8    	LDA $B8
C0/4917:	1015    	BPL $492E
C0/4919:	A5B8    	LDA $B8
C0/491B:	1079    	BPL $4996
C0/491D:	A5A6    	LDA $A6
C0/491F:	AA      	TAX
C0/4920:	BF00767E	LDA $7E7600,X
C0/4924:	1052    	BPL $4978       ; continue handling button input
C0/4926:	C9F7    	CMP #$F7
C0/4928:	F04E    	BEQ $4978       ; continue handling button input
C0/492A:	A908    	LDA #$08
C0/492C:	8011    	BRA $493F

C0/492E:	A5AC    	LDA $AC
C0/4930:	AA      	TAX
C0/4931:	BF00767E	LDA $7E7600,X
C0/4935:	C9F7    	CMP #$F7
C0/4937:	F03F    	BEQ $4978       ; continue handling button input
C0/4939:	2940    	AND #$40
C0/493B:	F03B    	BEQ $4978       ; continue handling button input
C0/493D:	A907    	LDA #$07

; Stair Movement [?]
C0/493F:	997E08  	STA $087E,Y     ; set movement direction
C0/4942:	85B3    	STA $B3         ; backup movement direction
C0/4944:	A5B8    	LDA $B8         ; current tile properties
C0/4946:	2904    	AND #$04        ; "Bridge"
C0/4948:	D00A    	BNE $4954       ; branch if on "Bridge"
C0/494A:	A5B8    	LDA $B8         ; current tile properties
C0/494C:	2903    	AND #$03        ; passability by Z layer
C0/494E:	C903    	CMP #$03        ; passable on either Z layer
C0/4950:	F002    	BEQ $4954       ; branch if both set
C0/4952:	85B2    	STA $B2         ; update party's Z level

C0/4954:	202D4F  	JSR $4F2D       ; handle party priority and "bridge" tiles [?]
C0/4957:	20E64F  	JSR $4FE6       ; update sprite priority for visible character
C0/495A:	20777E  	JSR $7E77       ; update character's movement speeds
C0/495D:	20087E  	JSR $7E08       ; handle screen movement
C0/4960:	6485    	STZ $85         ; clear "Enable Entrance Triggers"
C0/4962:	A901    	LDA #$01        ; one step
C0/4964:	998608  	STA $0886,Y     ; take one step
C0/4967:	20A5C8  	JSR $C8A5       ; handle stairs [?]
C0/496A:	20604B  	JSR $4B60       ; increase step count [BNW changes to 4A03]
C0/496D:	20EC4A  	JSR $4AEC       ; clear active party's event bits [BNW removes]
C0/4970:	A901    	LDA #$01        ; "on"
C0/4972:	8557    	STA $57         ; "Battles Enabled"
C0/4974:	9C8E07  	STZ $078E       ; clear "Party on Trigger"
C0/4977:	60      	RTS

; Handle directional buttons on field (non-stair)
; Check Right
C0/4978:	A507    	LDA $07
C0/497A:	2901    	AND #$01       (are you pressing right?)
C0/497C:	F018    	BEQ $4996      (branch if not)
C0/497E:	A947    	LDA #$47
C0/4980:	997708  	STA $0877,Y    ; set next graphics position [?]
C0/4983:	A901    	LDA #$01
C0/4985:	997F08  	STA $087F,Y    ; set facing direction "right"
C0/4988:	20514D  	JSR $4D51      ; update facing direction
C0/498B:	D062    	BNE $49EF      ; branch if didn't move [?]
C0/498D:	A902    	LDA #$02
C0/498F:	20164E  	JSR $4E16      (set walking speed and other things)
C0/4992:	F05B    	BEQ $49EF      ; branch if didn't move [?]
C0/4994:	806D    	BRA $4A03      (now that you've taken a step, increase the count and deal with more)

; Check Left
C0/4996:	A507    	LDA $07
C0/4998:	2902    	AND #$02       (are you pressing left?)
C0/499A:	F018    	BEQ $49B4      (branch if not)
C0/499C:	A907    	LDA #$07
C0/499E:	997708  	STA $0877,Y    ; set next graphics position [?]
C0/49A1:	A903    	LDA #$03
C0/49A3:	997F08  	STA $087F,Y    ; set facing direction "left"
C0/49A6:	20514D  	JSR $4D51      ; update facing direction
C0/49A9:	D044    	BNE $49EF      ; branch if didn't move [?]
C0/49AB:	A904    	LDA #$04
C0/49AD:	20164E  	JSR $4E16      (set walking speed and other things)
C0/49B0:	F03D    	BEQ $49EF      ; branch if didn't move [?]
C0/49B2:	804F    	BRA $4A03      (now that you've taken a step, increase the count and deal with more)

; Check Up
C0/49B4:	A507    	LDA $07
C0/49B6:	2908    	AND #$08       (are you pressing up?)
C0/49B8:	F017    	BEQ $49D1      (branch if not)
C0/49BA:	A904    	LDA #$04
C0/49BC:	997708  	STA $0877,Y    ; set next graphics position [?]
C0/49BF:	7B      	TDC 
C0/49C0:	997F08  	STA $087F,Y    ; set facing direction "up"
C0/49C3:	20514D  	JSR $4D51      ; update facing direction
C0/49C6:	D027    	BNE $49EF      ; branch if didn't move [?]
C0/49C8:	A901    	LDA #$01
C0/49CA:	20164E  	JSR $4E16      (set walking speed and other things)
C0/49CD:	F020    	BEQ $49EF      ; branch if didn't move [?]
C0/49CF:	8032    	BRA $4A03      (now that you've taken a step, increase the count and deal with more)

; Check Down
C0/49D1:	A507    	LDA $07
C0/49D3:	2904    	AND #$04       (are you pressing down?)
C0/49D5:	F018    	BEQ $49EF      (branch if not)
C0/49D7:	A901    	LDA #$01
C0/49D9:	997708  	STA $0877,Y    ; set next graphics position [?]
C0/49DC:	A902    	LDA #$02
C0/49DE:	997F08  	STA $087F,Y    ; set facing direction "down"
C0/49E1:	20514D  	JSR $4D51      ; update facing direction
C0/49E4:	D009    	BNE $49EF      ; branch if didn't move [?]
C0/49E6:	A903    	LDA #$03
C0/49E8:	20164E  	JSR $4E16      (set walking speed and other things)
C0/49EB:	F002    	BEQ $49EF      ; branch if didn't move [?]
C0/49ED:	8014    	BRA $4A03      (now that you've taken a step, increase the count and deal with more)

; No direction
C0/49EF:	AC0308  	LDY $0803      ; visible character object data offset
C0/49F2:	7B      	TDC            ; clear A/B
C0/49F3:	997E08  	STA $087E,Y    ; clear moving direction for visible character
C0/49F6:	9C8608  	STZ $0886      ; zero steps pending                             [BUG - first char only?]
C0/49F9:	20A5C8  	JSR $C8A5      ; handle stairs [?]
C0/49FC:	20F446  	JSR $46F4      ; handle pressing A
C0/49FF:	20834B  	JSR $4B83      ; more handle pressing A (chest)
C0/4A02:	60      	RTS
 
C0/4A03:	20604B  	JSR $4B60      ; increase step count
C0/4A06:	223F4AC0	JSL $C04A3F    ; deal with tintinabar healing and poison damage
C0/4A0A:	AC0308  	LDY $0803      ; visible character's data offset
C0/4A0D:	20777E  	JSR $7E77      ; update character's movement speeds (vert/hori)
C0/4A10:	20087E  	JSR $7E08      ; handle screen movement
C0/4A13:	6485    	STZ $85        ; clear "Enable Entrance Triggers" [?]
C0/4A15:	A901    	LDA #$01       ; take one step
C0/4A17:	8D8608  	STA $0886      ; number of steps to take                        [BUG - first char only?]
C0/4A1A:	20EC4A  	JSR $4AEC      ; clear active party's event bits

C0/4A1D:	ADB61E  	LDA $1EB6      ; some movement event bits
C0/4A20:	29DF    	AND #$DF       ; clear "Tile Event" bit
C0/4A22:	8DB61E  	STA $1EB6      ; update movement event bits
C0/4A25:	ADB71E  	LDA $1EB7      ; some more movement bits
C0/4A28:	297F    	AND #$7F       ; clear "On a Save Point" bit
C0/4A2A:	8DB71E  	STA $1EB7      ; update bits

C0/4A2D:	20A5C8  	JSR $C8A5      ; handle stairs, step movement [?]
C0/4A30:	20F446  	JSR $46F4      ; handle pressing A button to inspect a tile
C0/4A33:	A901    	LDA #$01       ; prepare flag
C0/4A35:	8557    	STA $57        ; "Battles Enabled"
C0/4A37:	9C8E07  	STZ $078E      ; clear "Party on Trigger (disable randoms)"
C0/4A3A:	60      	RTS
 
C0/4A3B:	1008    	BPL $4A45
C0/4A3D:	0402    	TSB $02

C0/4A3F:	08      	PHP 
C0/4A40:	7B      	TDC 
C0/4A41:	E220    	SEP #$20      	(8 bit accum./memory)
C0/4A43:	C210    	REP #$10      	(16 bit index registers)
C0/4A45:	A61E    	LDX $1E
C0/4A47:	DA      	PHX
C0/4A48:	A620    	LDX $20
C0/4A4A:	DA      	PHX
C0/4A4B:	A622    	LDX $22
C0/4A4D:	DA      	PHX
C0/4A4E:	A624    	LDX $24
C0/4A50:	DA      	PHX
C0/4A51:	A600    	LDX $00
C0/4A53:	9B      	TXY
C0/4A54:	BD5018  	LDA $1850,X    (setup of current parties)
C0/4A57:	2940    	AND #$40       (BIT #$40...)
C0/4A59:	F070    	BEQ $4ACB
C0/4A5B:	BD5018  	LDA $1850,X    (if previous was BIT, this LDA is not needed)
C0/4A5E:	2907    	AND #$07       (then you can just AND like normal)
C0/4A60:	CD6D1A  	CMP $1A6D		(Compare to the active party)
C0/4A63:	D066    	BNE $4ACB

C0/4A65:	B91416  	LDA $1614,Y    (status byte 1)

C0/4A68:	29C2    	AND #$C2       (are any of the three terminal ailments set?)
C0/4A6A:	D027    	BNE $4A93      (branch if so)
C0/4A6C:	B92316  	LDA $1623,Y		(Load character's relic 1)
C0/4A6F:	C9E5    	CMP #$E5		(Is it Tintinabar?)
C0/4A71:	F007    	BEQ $4A7A		(Branch if it is)
C0/4A73:	B92416  	LDA $1624,Y		(Load character's relic 2)
C0/4A76:	C9E5    	CMP #$E5		(Is it Tintinabar?)
C0/4A78:	D019    	BNE $4A93		(Branch if it's not)
C0/4A7A:	20E8AE  	JSR $AEE8
C0/4A7D:	B91C16  	LDA $161C,Y		(Load character's stamina)
C0/4A80:	4A      	LSR A			(/ 2)
C0/4A81:	4A      	LSR A			(Now / 4)
C0/4A82:	C221    	REP #$21
C0/4A84:	790916  	ADC $1609,Y		(Add current HP to Stamina / 4)
C0/4A87:	C51E    	CMP $1E
C0/4A89:	9002    	BCC $4A8D
C0/4A8B:	A51E    	LDA $1E
C0/4A8D:	990916  	STA $1609,Y		(Store to current HP)
C0/4A90:	7B      	TDC 

C0/4A91:	E220    	SEP #$20       (8 bit accum./memory)

C0/4A93:	B91416  	LDA $1614,Y    (status byte 1)
C0/4A96:	2904    	AND #$04       (poison set?)
C0/4A98:	F031    	BEQ $4ACB      (branch if not)
C0/4A9A:	A90F    	LDA #$0F
C0/4A9C:	8DF011  	STA $11F0
C0/4A9F:	C220    	REP #$20      	(16 bit accum./memory)
C0/4AA1:	A9000F  	LDA #$0F00
C0/4AA4:	8D9607  	STA $0796
C0/4AA7:	7B      	TDC 
C0/4AA8:	E220    	SEP #$20      	(8 bit accum./memory)
C0/4AAA:	20E8AE  	JSR $AEE8
C0/4AAD:	C220    	REP #$20      	(16 bit accum./memory)
C0/4AAF:	A51E    	LDA $1E
C0/4AB1:	4A      	LSR A
C0/4AB2:	4A      	LSR A
C0/4AB3:	4A      	LSR A
C0/4AB4:	4A      	LSR A
C0/4AB5:	4A      	LSR A
C0/4AB6:	851E    	STA $1E
C0/4AB8:	B90916  	LDA $1609,Y		(Load current HP)
C0/4ABB:	38      	SEC 
C0/4ABC:	E51E    	SBC $1E
C0/4ABE:	F002    	BEQ $4AC2
C0/4AC0:	B003    	BCS $4AC5
C0/4AC2:	A90100  	LDA #$0001     (TDC INC A...)
C0/4AC5:	990916  	STA $1609,Y		(Store to current HP)
C0/4AC8:	7B      	TDC            (this seems pointless)
C0/4AC9:	E220    	SEP #$20      	(8 bit accum./memory)
C0/4ACB:	C221    	REP #$21       (er...)
C0/4ACD:	98      	TYA
C0/4ACE:	692500  	ADC #$0025		(Add 37 to get next character info block)
C0/4AD1:	A8      	TAY
C0/4AD2:	7B      	TDC 
C0/4AD3:	E220    	SEP #$20      	(8 bit accum./memory)
C0/4AD5:	E8      	INX
C0/4AD6:	E01000  	CPX #$0010
C0/4AD9:	F003    	BEQ $4ADE
C0/4ADB:	4C544A  	JMP $4A54		(could say 8276FF BRL $4A54)

C0/4ADE:	FA      	PLX
C0/4ADF:	8624    	STX $24
C0/4AE1:	FA      	PLX
C0/4AE2:	8622    	STX $22
C0/4AE4:	FA      	PLX
C0/4AE5:	8620    	STX $20
C0/4AE7:	FA      	PLX
C0/4AE8:	861E    	STX $1E
C0/4AEA:	28      	PLP 
C0/4AEB:	6B      	RTL
 
; Clear active party's event bits

C0/4AEC:	AD6D1A  	LDA $1A6D		(Load active party)
C0/4AEF:	C901    	CMP #$01		(Is party 1 the active one?)
C0/4AF1:	D022    	BNE $4B15		(Branch if not)
C0/4AF3:	ADD81E  	LDA $1ED8		; event bits (in high nibble)
C0/4AF6:	29EF    	AND #$EF    ; clear lowest event bit
C0/4AF8:	8DD81E  	STA $1ED8   ; update event bits
C0/4AFB:	ADD81E  	LDA $1ED8   ; get event bits
C0/4AFE:	29DF    	AND #$DF    ; clear 2nd lowest bit
C0/4B00:	8DD81E  	STA $1ED8   ; update
C0/4B03:	ADD81E  	LDA $1ED8   ; get again
C0/4B06:	29BF    	AND #$BF    ; clear 3rd lowest
C0/4B08:	8DD81E  	STA $1ED8   ; update
C0/4B0B:	ADD81E  	LDA $1ED8   ; get again
C0/4B0E:	297F    	AND #$7F    ; clear highest event bit
C0/4B10:	8DD81E  	STA $1ED8   ; update final
C0/4B13:	804A    	BRA $4B5F

C0/4B15:	C902    	CMP #$02		(Is party 2 the active party?)
C0/4B17:	D022    	BNE $4B3B		(Branch if not)
C0/4B19:	ADD91E  	LDA $1ED9
C0/4B1C:	29FE    	AND #$FE
C0/4B1E:	8DD91E  	STA $1ED9
C0/4B21:	ADD91E  	LDA $1ED9
C0/4B24:	29FD    	AND #$FD
C0/4B26:	8DD91E  	STA $1ED9
C0/4B29:	ADD91E  	LDA $1ED9
C0/4B2C:	29FB    	AND #$FB
C0/4B2E:	8DD91E  	STA $1ED9
C0/4B31:	ADD91E  	LDA $1ED9
C0/4B34:	29F7    	AND #$F7
C0/4B36:	8DD91E  	STA $1ED9      (LDA #$0F TRB $1ED9 covers everything up to C0/4B19)
C0/4B39:	8024    	BRA $4B5F

C0/4B3B:	C903    	CMP #$03		(Is party 3 the active party?)
C0/4B3D:	D020    	BNE $4B5F		(Branch if not)
C0/4B3F:	ADD91E  	LDA $1ED9
C0/4B42:	29EF    	AND #$EF
C0/4B44:	8DD91E  	STA $1ED9
C0/4B47:	ADD91E  	LDA $1ED9
C0/4B4A:	29DF    	AND #$DF
C0/4B4C:	8DD91E  	STA $1ED9
C0/4B4F:	ADD91E  	LDA $1ED9
C0/4B52:	29BF    	AND #$BF
C0/4B54:	8DD91E  	STA $1ED9
C0/4B57:	ADD91E  	LDA $1ED9
C0/4B5A:	297F    	AND #$7F
C0/4B5C:	8DD91E  	STA $1ED9      (LDA #$F0 TRB $1ED9 covers everything up to C0/4B3F)
C0/4B5F:	60      	RTS
 
Steps function - towns/dungeons (handles step count only)
C0/4B60:	AD6618  	LDA $1866
C0/4B63:	C97F    	CMP #$7F
C0/4B65:	D00E    	BNE $4B75
C0/4B67:	AD6718  	LDA $1867
C0/4B6A:	C996    	CMP #$96
C0/4B6C:	D007    	BNE $4B75
C0/4B6E:	AD6818  	LDA $1868
C0/4B71:	C998    	CMP #$98
C0/4B73:	F00D    	BEQ $4B82
C0/4B75:	EE6618  	INC $1866
C0/4B78:	D008    	BNE $4B82
C0/4B7A:	EE6718  	INC $1867
C0/4B7D:	D003    	BNE $4B82
C0/4B7F:	EE6818  	INC $1868
C0/4B82:	60      	RTS
 
C0/4B83:	A5BA    	LDA $BA          ; "Dialogue Opening"
C0/4B85:	D04C    	BNE $4BD3        ; exit if ^
C0/4B87:	A559    	LDA $59          ; "Menu Opening"
C0/4B89:	D048    	BNE $4BD3        ; exit if ^
C0/4B8B:	A584    	LDA $84          ; "Map Loading"
C0/4B8D:	D044    	BNE $4BD3        ; exit if ^
C0/4B8F:	A4E5    	LDY $E5          ; "Current Event Offset"
C0/4B91:	C00000  	CPY #$0000       ; empty event offset
C0/4B94:	D03D    	BNE $4BD3        ; exit if there's an event playing
C0/4B96:	A5E7    	LDA $E7          ; "Current Event Bank"
C0/4B98:	C9CA    	CMP #$CA         ; default bank
C0/4B9A:	D037    	BNE $4BD3        ; exit if there's an event playing
C0/4B9C:	A5B8    	LDA $B8          ; "Tile Properties"
C0/4B9E:	2904    	AND #$04         ; isolate "Bridge Tile"
C0/4BA0:	F006    	BEQ $4BA8        ; branch if not a bridge tile [?]
C0/4BA2:	A5B2    	LDA $B2          ; party's Z level
C0/4BA4:	C902    	CMP #$02         ; max [?]
C0/4BA6:	F02B    	BEQ $4BD3        ; exit if ^

C0/4BA8:	A506    	LDA $06          ; "Buttons Pressed"
C0/4BAA:	1027    	BPL $4BD3        ; exit if not pressing A
C0/4BAC:	AC0308  	LDY $0803        ; visible character object data offset
C0/4BAF:	B97F08  	LDA $087F,Y      ; visible character facing direction
C0/4BB2:	AA      	TAX              ; index it
C0/4BB3:	B97A08  	LDA $087A,Y      ; visible character X coordinate in map
C0/4BB6:	18      	CLC              ; clear carry
C0/4BB7:	7F0F4DC0	ADC $C04D0F,X    ; add facing direction X coord diff
C0/4BBB:	2586    	AND $86          ; ensure within map's tile width
C0/4BBD:	852A    	STA $2A          ; store examined tile X-coordinate
C0/4BBF:	B97B08  	LDA $087B,Y      ; visible character Y coordinate in map
C0/4BC2:	18      	CLC              ; clear carry
C0/4BC3:	7F134DC0	ADC $C04D13,X    ; add facing direction Y coord diff
C0/4BC7:	2587    	AND $87          ; ensure within map's tile height
C0/4BC9:	852B    	STA $2B          ; store examined tile Y-coordinate
C0/4BCB:	A62A    	LDX $2A          ; load full coordinates (index to tile)
C0/4BCD:	BF00207E	LDA $7E2000,X    ; get object at tile location
C0/4BD1:	3001    	BMI $4BD4        ; branch to process object if exists
C0/4BD3:	60      	RTS

; Check if Examining a Chest
C0/4BD4:	C220    	REP #$20         ; 16-bit A
C0/4BD6:	A582    	LDA $82          ; current map index
C0/4BD8:	0A      	ASL A            ; x2
C0/4BD9:	AA      	TAX              ; index it
C0/4BDA:	BFF682ED	LDA $ED82F6,X    ; end of chest data block
C0/4BDE:	851E    	STA $1E          ; save end of range
C0/4BE0:	BFF482ED	LDA $ED82F4,X    ; start of chest data block
C0/4BE4:	AA      	TAX              ; index it
C0/4BE5:	7B      	TDC              ; clear A/B
C0/4BE6:	E220    	SEP #$20         ; 8-bit A
C0/4BE8:	E41E    	CPX $1E          ; same as end of range
C0/4BEA:	F0E7    	BEQ $4BD3        ; exit if no treasure data for map
C0/4BEC:	BF3486ED	LDA $ED8634,X    ; chest tile location (X coord)
C0/4BF0:	C52A    	CMP $2A          ; check against examined tile
C0/4BF2:	D008    	BNE $4BFC        ; branch if no match
C0/4BF4:	BF3586ED	LDA $ED8635,X    ; chest tile location (Y coord)
C0/4BF8:	C52B    	CMP $2B          ; check against examined tile
C0/4BFA:	F00A    	BEQ $4C06        ; if match, decode treasure chest
C0/4BFC:	E8      	INX
C0/4BFD:	E8      	INX
C0/4BFE:	E8      	INX
C0/4BFF:	E8      	INX
C0/4C00:	E8      	INX              ; X += 5 (next chest data)
C0/4C01:	E41E    	CPX $1E          ; check if at end of range
C0/4C03:	D0E7    	BNE $4BEC        ; loop till all chests checked
C0/4C05:	60      	RTS
 
; Treasure chest decoding function
C0/4C06:	C220    	REP #$20      	(16 bit accum./memory)
C0/4C08:	BF3886ED	LDA $ED8638,X
C0/4C0C:	851A    	STA $1A        (now the contents of the chest)
C0/4C0E:	BF3686ED	LDA $ED8636,X    ; chest identifier and type
C0/4C12:	851E    	STA $1E          ; save chest id and type ($1F)

C0/4C14:	290700  	AND #$0007       ; isolate bit only
C0/4C17:	AA      	TAX              ; index it
C0/4C18:	A51E    	LDA $1E          ; chest ID
C0/4C1A:	29FF01  	AND #$01FF       ; isolate chest SRAM byte
C0/4C1D:	4A      	LSR A
C0/4C1E:	4A      	LSR A            ; TODO: This could use $BAED
C0/4C1F:	4A      	LSR A            ; shift down (/ 8)
C0/4C20:	A8      	TAY              ; index it
C0/4C21:	7B      	TDC              ; zero A/B
C0/4C22:	E220    	SEP #$20         ; 8-bit A

C0/4C24:	B9401E  	LDA $1E40,Y      ; this treasure chest byte
C0/4C27:	3FFCBAC0	AND $C0BAFC,X    ; check for this treasure bit
C0/4C2B:	D0A6    	BNE $4BD3        ; exit if chest already opened
C0/4C2D:	B9401E  	LDA $1E40,Y      ; this treasure chest byte
C0/4C30:	1FFCBAC0	ORA $C0BAFC,X    ; add bit for this chest
C0/4C34:	99401E  	STA $1E40,Y      ; update chest bits
C0/4C37:	A51F    	LDA $1F          ; chest type
C0/4C39:	1045    	BPL $4C80         (if high bit = 0 then it's not a GP chest)

; GP Treasure Chest
C0/4C3B:	A51A    	LDA $1A
C0/4C3D:	8D0242  	STA $4202
C0/4C40:	A964    	LDA #$64       (GP amount * 100)
C0/4C42:	8D0342  	STA $4203
C0/4C45:	EA      	NOP
C0/4C46:	EA      	NOP
C0/4C47:	EA      	NOP
C0/4C48:	AC1642  	LDY $4216
C0/4C4B:	8422    	STY $22
C0/4C4D:	6424    	STZ $24        (shame all 24-bits aren't used here)
C0/4C4F:	C221    	REP #$21
C0/4C51:	98      	TYA
C0/4C52:	6D6018  	ADC $1860      (add to current GP, low two bytes)
C0/4C55:	8D6018  	STA $1860      (and save)
C0/4C58:	7B      	TDC 
C0/4C59:	E220    	SEP #$20      	(8 bit accum./memory)
C0/4C5B:	6D6218  	ADC $1862      (wrap high byte if needed)
C0/4C5E:	8D6218  	STA $1862      (and save)
C0/4C61:	C998    	CMP #$98       (is high byte greater than 152? this check is not perfect... LDX $1861 CPX #$9896 may give more precision)
C0/4C63:	9013    	BCC $4C78      (branch if not, GP not maxed out)
C0/4C65:	AE6018  	LDX $1860
C0/4C68:	E07F96  	CPX #$967F
C0/4C6B:	900B    	BCC $4C78
C0/4C6D:	A27F96  	LDX #$967F
C0/4C70:	8E6018  	STX $1860
C0/4C73:	A998    	LDA #$98
C0/4C75:	8D6218  	STA $1862      (set max GP as 9999999, though why this is here is beyond me, as there's two max GP checks for the game already...)
C0/4C78:	20E502  	JSR $02E5      (get number grabbed ready for display purposes)
C0/4C7B:	A21000  	LDX #$0010     (set CA/0010, event for "Found x GP!")
C0/4C7E:	802C    	BRA $4CAC

C0/4C80:	A51F    	LDA $1F        (would've been better to BIT all of these checks, so A would be intact throughout)
C0/4C82:	2940    	AND #$40          (is it a item-containing chest?)
C0/4C84:	F00D    	BEQ $4C93		(branch if not)

; Item containing Chest
C0/4C86:	A51A    	LDA $1A
C0/4C88:	8D8305  	STA $0583		(item index)
C0/4C8B:	20FCAC  	JSR $ACFC
C0/4C8E:	A20800  	LDX #$0008     (set CA/0008, event for "Received x!")
C0/4C91:	8019    	BRA $4CAC

C0/4C93:	A51F    	LDA $1F
C0/4C95:	2920    	AND #$20		(is it a monster-in-a-box?)
C0/4C97:	F00A    	BEQ $4CA3		(branch if not)

; Monster-in-a-Box Chest
C0/4C99:	A51A    	LDA $1A		(load the "contents" byte)
C0/4C9B:	8D8907  	STA $0789		(store that to $0789; now this is the stored monster set to use with gen. act. 0x8E)
C0/4C9E:	A24000  	LDX #$0040     (set CA/0040, event for "Monster-in-a-box!")
C0/4CA1:	8009    	BRA $4CAC

C0/4CA3:	A51F    	LDA $1F
C0/4CA5:	2910    	AND #$10         	(is it something else???)
C0/4CA7:	F000    	BEQ $4CA9		(why check... this is a totally pointless line probably inserted in case they wanted to branch elsewhere to code for some other type of chest)
C0/4CA9:	A21400  	LDX #$0014     (set CA/0014, event for "Empty!")	
C0/4CAC:	86E5    	STX $E5        (many things branch here, so this actually sets a few events)
C0/4CAE:	8EF405  	STX $05F4
C0/4CB1:	A9CA    	LDA #$CA
C0/4CB3:	85E7    	STA $E7
C0/4CB5:	8DF605  	STA $05F6
C0/4CB8:	A20000  	LDX #$0000     (LDX $00...)
C0/4CBB:	8E9405  	STX $0594
C0/4CBE:	A9CA    	LDA #$CA
C0/4CC0:	8D9605  	STA $0596
C0/4CC3:	A901    	LDA #$01
C0/4CC5:	8DC705  	STA $05C7
C0/4CC8:	A20300  	LDX #$0003
C0/4CCB:	86E8    	STX $E8
C0/4CCD:	AC0308  	LDY $0803
C0/4CD0:	B97C08  	LDA $087C,Y
C0/4CD3:	997D08  	STA $087D,Y
C0/4CD6:	A904    	LDA #$04
C0/4CD8:	997C08  	STA $087C,Y
C0/4CDB:	20ED2F  	JSR $2FED
C0/4CDE:	A62A    	LDX $2A
C0/4CE0:	BF00007F	LDA $7F0000,X
C0/4CE4:	C913    	CMP #$13
C0/4CE6:	D01E    	BNE $4D06
C0/4CE8:	868F    	STX $8F
C0/4CEA:	A20C4D  	LDX #$4D0C
C0/4CED:	868C    	STX $8C
C0/4CEF:	A9C0    	LDA #$C0
C0/4CF1:	858E    	STA $8E        (C0/4D0C?)
C0/4CF3:	A20000  	LDX #$0000     (LDX $00...)
C0/4CF6:	862A    	STX $2A
C0/4CF8:	A904    	LDA #$04
C0/4CFA:	8D5A05  	STA $055A
C0/4CFD:	20C41E  	JSR $1EC4
C0/4D00:	A9A6    	LDA #$A6
C0/4D02:	20D302  	JSR $02D3      (JMP fool!)
C0/4D05:	60      	RTS
 
C0/4D06:	A91B    	LDA #$1B
C0/4D08:	20D302  	JSR $02D3		(could say BRA $4D02 here, saving two bytes)
C0/4D0B:	60      	RTS
 
C0/4D0C:	0101    	ORA ($01,X)
C0/4D0E:	12

; Offset for facing directions
C0/4D0F:  00    	; Up: X coord diff
C0/4D10:	01      ; Right: X coord diff
C0/4D11:	00      ; Down: X coord diff
C0/4D12:	FF      ; Left: X coord diff
C0/4D13:  FF      ; Up: Y coord diff
C0/4D14:  00      ; Right: Y coord diff
C0/4D15:  01      ; Down: Y coord diff
C0/4D16:	00      ; Left: Y coord diff

C0/4D17:	A400    	LDY $00		(from C0/BF6D)
C0/4D19:	CC2711    	CPY $2711
C0/4D1C:	F032    	BEQ $4D50
C0/4D1E:	5A      	PHY
C0/4D1F:	BE2911  	LDX $1129,Y
C0/4D22:	868F    	STX $8F
C0/4D24:	BF00007F	LDA $7F0000,X
C0/4D28:	C905    	CMP #$05
C0/4D2A:	D005    	BNE $4D31
C0/4D2C:	A2064E  	LDX #$4E06
C0/4D2F:	800C    	BRA $4D3D
C0/4D31:	C907    	CMP #$07
C0/4D33:	D005    	BNE $4D3A
C0/4D35:	A20A4E  	LDX #$4E0A
C0/4D38:	8003    	BRA $4D3D
C0/4D3A:	A20E4E  	LDX #$4E0E
C0/4D3D:	868C    	STX $8C
C0/4D3F:	A9C0    	LDA #$C0
C0/4D41:	858E    	STA $8E
C0/4D43:	A20000  	LDX #$0000
C0/4D46:	862A    	STX $2A
C0/4D48:	20C41E  	JSR $1EC4
C0/4D4B:	7A      	PLY
C0/4D4C:	C8      	INY 
C0/4D4D:	C8      	INY 
C0/4D4E:	80C9    	BRA $4D19
C0/4D50:	60      	RTS
 
C0/4D51:	A5B8    	LDA $B8         ; tile properties
C0/4D53:	2904    	AND #$04        ; "Bridge Tile" [?]
C0/4D55:	F009    	BEQ $4D60       ; branch if not ^
C0/4D57:	A5B2    	LDA $B2         ; party's Z level
C0/4D59:	C902    	CMP #$02        ; maximum [?]
C0/4D5B:	D003    	BNE $4D60       ; branch if not ^
C0/4D5D:	4C044E  	JMP $4E04			  ; exit with zero flag

C0/4D60:	B97F08  	LDA $087F,Y
C0/4D63:	4A      	LSR A
C0/4D64:	B0F7    	BCS $4D5D
C0/4D66:	D00A    	BNE $4D72
C0/4D68:	A5B0    	LDA $B0
C0/4D6A:	3A      	DEC A
C0/4D6B:	3A      	DEC A
C0/4D6C:	8590    	STA $90
C0/4D6E:	A5A7    	LDA $A7
C0/4D70:	8006    	BRA $4D78
C0/4D72:	A5B0    	LDA $B0
C0/4D74:	8590    	STA $90
C0/4D76:	A5AD    	LDA $AD
C0/4D78:	C915    	CMP #$15
C0/4D7A:	D015    	BNE $4D91
C0/4D7C:	AF15767E	LDA $7E7615
C0/4D80:	C9F7    	CMP #$F7
C0/4D82:	F0D9    	BEQ $4D5D
C0/4D84:	2920    	AND #$20
C0/4D86:	F0D5    	BEQ $4D5D
C0/4D88:	A5AF    	LDA $AF
C0/4D8A:	858F    	STA $8F
C0/4D8C:	A2064E  	LDX #$4E06
C0/4D8F:	8031    	BRA $4DC2
C0/4D91:	C917    	CMP #$17
C0/4D93:	D015    	BNE $4DAA
C0/4D95:	AF17767E	LDA $7E7617
C0/4D99:	C9F7    	CMP #$F7
C0/4D9B:	F067    	BEQ $4E04
C0/4D9D:	2920    	AND #$20
C0/4D9F:	F063    	BEQ $4E04
C0/4DA1:	A5AF    	LDA $AF
C0/4DA3:	858F    	STA $8F
C0/4DA5:	A20A4E  	LDX #$4E0A
C0/4DA8:	8018    	BRA $4DC2
C0/4DAA:	C91C    	CMP #$1C
C0/4DAC:	D056    	BNE $4E04
C0/4DAE:	AF1C767E	LDA $7E761C
C0/4DB2:	C9F7    	CMP #$F7
C0/4DB4:	F04E    	BEQ $4E04
C0/4DB6:	2920    	AND #$20
C0/4DB8:	F04A    	BEQ $4E04
C0/4DBA:	A5AF    	LDA $AF
C0/4DBC:	3A      	DEC A
C0/4DBD:	858F    	STA $8F
C0/4DBF:	A20E4E  	LDX #$4E0E
C0/4DC2:	868C    	STX $8C
C0/4DC4:	A590    	LDA $90
C0/4DC6:	1A      	INC A
C0/4DC7:	EB      	XBA
C0/4DC8:	A5AF    	LDA $AF
C0/4DCA:	AA      	TAX
C0/4DCB:	7B      	TDC 
C0/4DCC:	BF00207E	LDA $7E2000,X
C0/4DD0:	C9FF    	CMP #$FF
C0/4DD2:	D030    	BNE $4E04
C0/4DD4:	C221    	REP #$21
C0/4DD6:	AE2711  	LDX $1127
C0/4DD9:	A58F    	LDA $8F
C0/4DDB:	9D2911  	STA $1129,X
C0/4DDE:	E8      	INX
C0/4DDF:	E8      	INX
C0/4DE0:	E03000  	CPX #$0030
C0/4DE3:	B003    	BCS $4DE8
C0/4DE5:	8E2711  	STX $1127
C0/4DE8:	7B      	TDC 
C0/4DE9:	E220    	SEP #$20      (8 bit accum./memory)
C0/4DEB:	A9C0    	LDA #$C0
C0/4DED:	858E    	STA $8E
C0/4DEF:	A20000  	LDX #$0000
C0/4DF2:	862A    	STX $2A
C0/4DF4:	A904    	LDA #$04
C0/4DF6:	8D5A05  	STA $055A
C0/4DF9:	20C41E  	JSR $1EC4
C0/4DFC:	A92C    	LDA #$2C
C0/4DFE:	20D302  	JSR $02D3
C0/4E01:	A901    	LDA #$01
C0/4E03:	60      	RTS
 
C0/4E04:	7B      	TDC            ; zero flag
C0/4E05:	60      	RTS
 
C0/4E06:	0102    	
C0/4E08:	0414    	
C0/4E0A:	0102    	
C0/4E0C:	0616    	
C0/4E0E:	0302    
	
C0/4E10:	0809      	
C0/4E12:	0A18      	
C0/4E14:	191A

C0/4E16:	85B3    	STA $B3
C0/4E18:	AA      	TAX
C0/4E19:	BF8D4FC0	LDA $C04F8D,X
C0/4E1D:	AA      	TAX
C0/4E1E:	B5A3    	LDA $A3,X
C0/4E20:	AA      	TAX
C0/4E21:	ADB81E  	LDA $1EB8      (load event bits)
C0/4E24:	2902    	AND #$02       (is "disable sprinting" set?)
C0/4E26:	D00B    	BNE $4E33      (branch if so)
C0/4E28:	ADDF11  	LDA $11DF      (load party-wide byte)
C0/4E2B:	2920    	AND #$20       (are sprint shoes equipped?)
C0/4E2D:	F004    	BEQ $4E33      (branch if not)
C0/4E2F:	A903    	LDA #$03
C0/4E31:	8002    	BRA $4E35      (sprint shoes equipped, add to walking speed)
C0/4E33:	A902    	LDA #$02
C0/4E35:	997508  	STA $0875,Y    (store walking speed)
C0/4E38:	A97E    	LDA #$7E
C0/4E3A:	48      	PHA
C0/4E3B:	AB      	PLB           (set bank to #$7E)
C0/4E3C:	DA      	PHX
C0/4E3D:	A5B3    	LDA $B3
C0/4E3F:	3A      	DEC A
C0/4E40:	AA      	TAX
C0/4E41:	BF104FC0	LDA $C04F10,X  (load bitfield)
C0/4E45:	851A    	STA $1A
C0/4E47:	FA      	PLX
C0/4E48:	A5B9    	LDA $B9
C0/4E4A:	290F    	AND #$0F
C0/4E4C:	251A    	AND $1A
C0/4E4E:	F048    	BEQ $4E98
C0/4E50:	BD0076  	LDA $7600,X
C0/4E53:	2907    	AND #$07
C0/4E55:	C907    	CMP #$07
C0/4E57:	F03F    	BEQ $4E98
C0/4E59:	A5B8    	LDA $B8
C0/4E5B:	2904    	AND #$04
C0/4E5D:	F018    	BEQ $4E77
C0/4E5F:	A5B2    	LDA $B2
C0/4E61:	2901    	AND #$01
C0/4E63:	F009    	BEQ $4E6E
C0/4E65:	BD0076  	LDA $7600,X
C0/4E68:	2902    	AND #$02
C0/4E6A:	D02C    	BNE $4E98
C0/4E6C:	802F    	BRA $4E9D
C0/4E6E:	BD0076  	LDA $7600,X
C0/4E71:	2901    	AND #$01
C0/4E73:	D023    	BNE $4E98
C0/4E75:	8026    	BRA $4E9D
C0/4E77:	BD0076  	LDA $7600,X
C0/4E7A:	2903    	AND #$03
C0/4E7C:	C903    	CMP #$03
C0/4E7E:	F01D    	BEQ $4E9D
C0/4E80:	A5B8    	LDA $B8
C0/4E82:	2903    	AND #$03
C0/4E84:	C903    	CMP #$03
C0/4E86:	F009    	BEQ $4E91
C0/4E88:	4903    	EOR #$03
C0/4E8A:	3D0076  	AND $7600,X
C0/4E8D:	D009    	BNE $4E98
C0/4E8F:	800C    	BRA $4E9D
C0/4E91:	BD0076  	LDA $7600,X
C0/4E94:	2904    	AND #$04
C0/4E96:	F005    	BEQ $4E9D
C0/4E98:	7B      	TDC 
C0/4E99:	48      	PHA
C0/4E9A:	AB      	PLB
C0/4E9B:	7B      	TDC            (A is already 0 here)
C0/4E9C:	60      	RTS
 
C0/4E9D:	DA      	PHX			(from C0/4E75, C0/4E8F, C0/4E96)
C0/4E9E:	A5B3    	LDA $B3
C0/4EA0:	20037D  	JSR $7D03
C0/4EA3:	FA      	PLX
C0/4EA4:	A41E    	LDY $1E
C0/4EA6:	B90020  	LDA $2000,Y
C0/4EA9:	3019    	BMI $4EC4
C0/4EAB:	BD0076  	LDA $7600,X
C0/4EAE:	2904    	AND #$04
C0/4EB0:	F0E6    	BEQ $4E98
C0/4EB2:	A5B8    	LDA $B8
C0/4EB4:	2907    	AND #$07
C0/4EB6:	C901    	CMP #$01
C0/4EB8:	F0DE    	BEQ $4E98
C0/4EBA:	C902    	CMP #$02
C0/4EBC:	F006    	BEQ $4EC4
C0/4EBE:	A5B2    	LDA $B2
C0/4EC0:	C902    	CMP #$02
C0/4EC2:	D0D4    	BNE $4E98
C0/4EC4:	BD0076  	LDA $7600,X
C0/4EC7:	2904    	AND #$04
C0/4EC9:	F006    	BEQ $4ED1
C0/4ECB:	A5B2    	LDA $B2
C0/4ECD:	C902    	CMP #$02
C0/4ECF:	F01E    	BEQ $4EEF
C0/4ED1:	7B      	TDC 
C0/4ED2:	48      	PHA
C0/4ED3:	AB      	PLB
C0/4ED4:	AE0308  	LDX $0803
C0/4ED7:	8E0442  	STX $4204
C0/4EDA:	A929    	LDA #$29
C0/4EDC:	8D0642  	STA $4206
C0/4EDF:	EA      	NOP
C0/4EE0:	EA      	NOP
C0/4EE1:	EA      	NOP
C0/4EE2:	EA      	NOP
C0/4EE3:	A97E    	LDA #$7E
C0/4EE5:	48      	PHA
C0/4EE6:	AB      	PLB
C0/4EE7:	AF144200	LDA $004214
C0/4EEB:	0A      	ASL A
C0/4EEC:	990020  	STA $2000,Y
C0/4EEF:	A5B8    	LDA $B8
C0/4EF1:	2907    	AND #$07
C0/4EF3:	C903    	CMP #$03
C0/4EF5:	B006    	BCS $4EFD
C0/4EF7:	A5B8    	LDA $B8
C0/4EF9:	2903    	AND #$03
C0/4EFB:	85B2    	STA $B2
C0/4EFD:	202D4F  	JSR $4F2D
C0/4F00:	20E64F  	JSR $4FE6
C0/4F03:	7B      	TDC 
C0/4F04:	48      	PHA
C0/4F05:	AB      	PLB
C0/4F06:	A4DA    	LDY $DA
C0/4F08:	A5B3    	LDA $B3
C0/4F0A:	997E08  	STA $087E,Y
C0/4F0D:	A901    	LDA #$01
C0/4F0F:	60      	RTS
 
Yet another set of mystery data

C0/4F10:	0801      	
C0/4F12:	0402    	

; Update party object to "normal priority" if not on "Bridge Tile"

C0/4F14:	A6B4    	LDX $B4          ; party object data pointer
C0/4F16:	E0F800    CPX #$00F8       ; "normal priority" party data offset
C0/4F19:	F011    	BEQ $4F2C        ; exit if ^
C0/4F1B:	A5B8    	LDA $B8          ; current tile properties
C0/4F1D:	2904    	AND #$04         ; "Bridge Tile"
C0/4F1F:	D00B    	BNE $4F2C        ; exit if ^ [cannot be walked on?]
C0/4F21:	A5B6    	LDA $B6          ; current top tile properties
C0/4F23:	2904    	AND #$04         ; "Bridge Tile"
C0/4F25:	D005    	BNE $4F2C        ; exit if ^ [cannot be walked on?]
C0/4F27:	A2F800  	LDX #$00F8       ; "normal priority" party data offset
C0/4F2A:	86B4    	STX $B4          ; update party object data pointer
C0/4F2C:	60      	RTS
 
C0/4F2D:	A6B4    	LDX $B4          ; party object data pointer
C0/4F2F:	E0B801  	CPX #$01B8       ; low priority ?
C0/4F32:	F046    	BEQ $4F7A        ; exit if low priority
C0/4F34:	A5B3    	LDA $B3          ; movement direction
C0/4F36:	AA      	TAX              ; index it
C0/4F37:	BF8D4FC0	LDA $C04F8D,X    ; destination tile index
C0/4F3B:	AA      	TAX              ; index it
C0/4F3C:	B5A3    	LDA $A3,X        ; tile pointer for destination tile
C0/4F3E:	AA      	TAX              ; index it
C0/4F3F:	BF00767E	LDA $7E7600,X    ; tile properties for destination tile
C0/4F43:	851A    	STA $1A          ; store it
C0/4F45:	2904    	AND #$04         ; "Bridge" tile
C0/4F47:	F00D    	BEQ $4F56        ; branch if not ^
C0/4F49:	A5B2    	LDA $B2          ; party Z layer
C0/4F4B:	C902    	CMP #$02         ; max layer [?]
C0/4F4D:	D02B    	BNE $4F7A        ; exit if not ^
C0/4F4F:	A2B801  	LDX #$01B8       ; low priority
C0/4F52:	86B4    	STX $B4          ; set party to low priority
C0/4F54:	8024    	BRA $4F7A        ; exit

C0/4F56:	A5B3    	LDA $B3          ; movement direction
C0/4F58:	AA      	TAX              ; index it
C0/4F59:	BF7B4FC0	LDA $C04F7B,X
C0/4F5D:	AA      	TAX              ; index it
C0/4F5E:	B5A3    	LDA $A3,X
C0/4F60:	AA      	TAX
C0/4F61:	BF00767E	LDA $7E7600,X
C0/4F65:	C9F7    	CMP #$F7
C0/4F67:	F011    	BEQ $4F7A
C0/4F69:	2904    	AND #$04
C0/4F6B:	F00D    	BEQ $4F7A
C0/4F6D:	A5B6    	LDA $B6          ; actor's top tile properties
C0/4F6F:	2907    	AND #$07         ; isolate "Bridge" and layer props
C0/4F71:	C902    	CMP #$02         ; no "Bridge" and max layer
C0/4F73:	D005    	BNE $4F7A        ; exit if not
C0/4F75:	A2B801  	LDX #$01B8
C0/4F78:	86B4    	STX $B4          ; else set low priority
C0/4F7A:	60      	RTS
 
Data of some sort

C0/4F7B:	0401    	TSB $01
C0/4F7D:	0507    	ORA $07
C0/4F7F:	0302    	ORA $02,S
C0/4F81:	08      	PHP 
C0/4F82:	0600    	ASL $00
C0/4F84:	0401    	TSB $01
C0/4F86:	0205    	COP #$05
C0/4F88:	08      	PHP 
C0/4F89:	0706    	ORA [$06]
C0/4F8B:	0300    	ORA $00,S

C0/4F8D:	0704    	ORA [$04]
C0/4F8F:	08      	PHP 
C0/4F90:	0A      	ASL A
C0/4F91:	0605    	ASL $05
C0/4F93:	0B      	PHD
C0/4F94:	0903    	ORA #$03
C0/4F96:	0704    	ORA [$04]
C0/4F98:	0508    	ORA $08
C0/4F9A:	0B      	PHD
C0/4F9B:	0A      	ASL A
C0/4F9C:	0906    	ORA #$06
C0/4F9E:	03

; Update visible character sprite tiles priority

C0/4F9F:	AC0308   	LDY $0803           ; visible character object offset
C0/4FA2:	B96808  	LDA $0868,Y         ; visible character sprite settings
C0/4FA5:	2906    	AND #$06            ; isolate layer priority
C0/4FA7:	F003    	BEQ $4FAC           ; branch if default ^
C0/4FA9:	4C697C  	JMP $7C69           ; else, update flags to match priority

C0/4FAC:	A5B8    	LDA $B8             ; current tile properties
C0/4FAE:	2904    	AND #$04            ; isolate "Bridge Tile"
C0/4FB0:	F010    	BEQ $4FC2           ; branch if not ^
C0/4FB2:	A5B2    	LDA $B2             ; party Z-level bits
C0/4FB4:	C901    	CMP #$01            ; on "upper level"
C0/4FB6:	D02D    	BNE $4FE5           ; exit if ^
C0/4FB8:	B98008  	LDA $0880,Y         ; visible character upper sprite
C0/4FBB:	0930    	ORA #$30            ; set sprite tile priority to "3"
C0/4FBD:	998008  	STA $0880,Y         ; update visible character sprite
C0/4FC0:	8015    	BRA $4FD7           ; branch

C0/4FC2:	B98008  	LDA $0880,Y         ; visible character upper sprite
C0/4FC5:	2910    	AND #$10            ; check for "3" versus "2" [?]
C0/4FC7:	D00E    	BNE $4FD7           ; branch if "3"
C0/4FC9:	A5B8    	LDA $B8             ; current tile properties
C0/4FCB:	2908    	AND #$08            ; "top sprite shown above BG1" [?]
C0/4FCD:	F008    	BEQ $4FD7           ; branch if not ^
C0/4FCF:	B98008  	LDA $0880,Y         
C0/4FD2:	0930    	ORA #$30
C0/4FD4:	998008  	STA $0880,Y

C0/4FD7:	A5B8    	LDA $B8
C0/4FD9:	2910    	AND #$10
C0/4FDB:	F008    	BEQ $4FE5
C0/4FDD:	B98108  	LDA $0881,Y
C0/4FE0:	0930    	ORA #$30
C0/4FE2:	998108  	STA $0881,Y
C0/4FE5:	60      	RTS
 
C0/4FE6:	AC0308  	LDY $0803
C0/4FE9:	B96808  	LDA $0868,Y          ; visible character sprite settings
C0/4FEC:	2906    	AND #$06             ; isolate "Layer Priority"
C0/4FEE:	F003    	BEQ $4FF3            ; branch if "default" (based on BG tile)
C0/4FF0:	4C697C  	JMP $7C69            ; set sprite priority

; Determine sprite priority based on BG tile [?]
C0/4FF3:	A5B3    	LDA $B3
C0/4FF5:	AA      	TAX
C0/4FF6:	BF8D4FC0	LDA $C04F8D,X
C0/4FFA:	AA      	TAX
C0/4FFB:	B5A3    	LDA $A3,X
C0/4FFD:	AA      	TAX
C0/4FFE:	BF00767E	LDA $7E7600,X
C0/5002:	2904    	AND #$04
C0/5004:	F012    	BEQ $5018
C0/5006:	A5B2    	LDA $B2
C0/5008:	C902    	CMP #$02
C0/500A:	D025    	BNE $5031
C0/500C:	B98008  	LDA $0880,Y
C0/500F:	29CF    	AND #$CF
C0/5011:	0920    	ORA #$20
C0/5013:	998008  	STA $0880,Y
C0/5016:	8019    	BRA $5031
C0/5018:	B98008  	LDA $0880,Y
C0/501B:	2910    	AND #$10
C0/501D:	F012    	BEQ $5031
C0/501F:	BF00767E	LDA $7E7600,X
C0/5023:	2908    	AND #$08
C0/5025:	D00A    	BNE $5031
C0/5027:	B98008  	LDA $0880,Y
C0/502A:	29CF    	AND #$CF
C0/502C:	0920    	ORA #$20
C0/502E:	998008  	STA $0880,Y
C0/5031:	BF00767E	LDA $7E7600,X
C0/5035:	2910    	AND #$10
C0/5037:	D00A    	BNE $5043
C0/5039:	B98108  	LDA $0881,Y
C0/503C:	29CF    	AND #$CF
C0/503E:	0920    	ORA #$20
C0/5040:	998108  	STA $0881,Y
C0/5043:	60      	RTS
 
C0/5044:	AC0308  	LDY $0803         ; currently showing character offset
C0/5047:	C220    	REP #$20          ; 16-bit A
C0/5049:	B96D08  	LDA $086D,Y       ; currently showing character's [?]
C0/504C:	4A      	LSR A
C0/504D:	4A      	LSR A
C0/504E:	4A      	LSR A
C0/504F:	4A      	LSR A
C0/5050:	E220    	SEP #$20      (8 bit accum./memory)
C0/5052:	8523    	STA $23
C0/5054:	3A      	DEC A
C0/5055:	2587    	AND $87
C0/5057:	8521    	STA $21
C0/5059:	3A      	DEC A
C0/505A:	2587    	AND $87
C0/505C:	851F    	STA $1F
C0/505E:	A523    	LDA $23
C0/5060:	1A      	INC A
C0/5061:	2587    	AND $87
C0/5063:	8525    	STA $25
C0/5065:	641E    	STZ $1E
C0/5067:	6420    	STZ $20
C0/5069:	6422    	STZ $22
C0/506B:	6424    	STZ $24
C0/506D:	C220    	REP #$20      (16 bit accum./memory)
C0/506F:	B96A08  	LDA $086A,Y
C0/5072:	4A      	LSR A
C0/5073:	4A      	LSR A
C0/5074:	4A      	LSR A
C0/5075:	4A      	LSR A
C0/5076:	29FF00  	AND #$00FF
C0/5079:	E220    	SEP #$20      (8 bit accum./memory)
C0/507B:	3A      	DEC A
C0/507C:	2586    	AND $86
C0/507E:	851A    	STA $1A
C0/5080:	1A      	INC A
C0/5081:	2586    	AND $86
C0/5083:	851B    	STA $1B
C0/5085:	1A      	INC A
C0/5086:	2586    	AND $86
C0/5088:	851C    	STA $1C
C0/508A:	A97F    	LDA #$7F
C0/508C:	48      	PHA
C0/508D:	AB      	PLB
C0/508E:	7B      	TDC 
C0/508F:	AA      	TAX
C0/5090:	A8      	TAY
C0/5091:	E210    	SEP #$10      (8 bit index registers)
C0/5093:	A41A    	LDY $1A
C0/5095:	B11E    	LDA ($1E),Y
C0/5097:	85A3    	STA $A3
C0/5099:	B120    	LDA ($20),Y
C0/509B:	85A6    	STA $A6
C0/509D:	B122    	LDA ($22),Y
C0/509F:	85A9    	STA $A9
C0/50A1:	B124    	LDA ($24),Y
C0/50A3:	85AC    	STA $AC
C0/50A5:	A41B    	LDY $1B
C0/50A7:	B11E    	LDA ($1E),Y
C0/50A9:	85A4    	STA $A4
C0/50AB:	B120    	LDA ($20),Y
C0/50AD:	85A7    	STA $A7
C0/50AF:	B122    	LDA ($22),Y
C0/50B1:	85AA    	STA $AA
C0/50B3:	B124    	LDA ($24),Y
C0/50B5:	85AD    	STA $AD
C0/50B7:	A41C    	LDY $1C
C0/50B9:	B11E    	LDA ($1E),Y
C0/50BB:	85A5    	STA $A5
C0/50BD:	B120    	LDA ($20),Y
C0/50BF:	85A8    	STA $A8
C0/50C1:	B122    	LDA ($22),Y
C0/50C3:	85AB    	STA $AB
C0/50C5:	B124    	LDA ($24),Y
C0/50C7:	85AE    	STA $AE
C0/50C9:	A97E    	LDA #$7E
C0/50CB:	48      	PHA
C0/50CC:	AB      	PLB
C0/50CD:	A6A7    	LDX $A7
C0/50CF:	BD0076  	LDA $7600,X
C0/50D2:	85B6    	STA $B6
C0/50D4:	BD0077  	LDA $7700,X
C0/50D7:	85B7    	STA $B7
C0/50D9:	A6AA    	LDX $AA
C0/50DB:	BD0076  	LDA $7600,X
C0/50DE:	85B8    	STA $B8
C0/50E0:	BD0077  	LDA $7700,X
C0/50E3:	85B9    	STA $B9
C0/50E5:	C210    	REP #$10      	(16 bit index registers)
C0/50E7:	7B      	TDC 
C0/50E8:	48      	PHA
C0/50E9:	AB      	PLB
C0/50EA:	60      	RTS
 
C0/50EB:	A600    	LDX $00		(from C0/BF91)
C0/50ED:	BF0080E6	LDA $E68000,X  (character and townspeople palettes)
C0/50F1:	9F00737E	STA $7E7300,X
C0/50F5:	9F00757E	STA $7E7500,X
C0/50F9:	E8      	INX
C0/50FA:	E00001  	CPX #$0100
C0/50FD:	D0EE    	BNE $50ED
C0/50FF:	60      	RTS
 
C0/5100:	000C    	
C0/5102:	1824     

Set character portrait palette for display
C0/5104:	AFB81E00	LDA $001EB8    (load event bits)	
C0/5108:	2940    	AND #$40       (is bit needed to properly display character portraits set?)
C0/510A:	D001    	BNE $510D      (branch if so)
C0/510C:	60      	RTS
 
C0/510D:	AD9507  	LDA $0795
C0/5110:	C220    	REP #$20      (16 bit accum./memory)
C0/5112:	EB      	XBA
C0/5113:	4A      	LSR A
C0/5114:	4A      	LSR A
C0/5115:	4A      	LSR A
C0/5116:	AA      	TAX
C0/5117:	7B      	TDC 
C0/5118:	E220    	SEP #$20      (8 bit accum./memory)
C0/511A:	A97E    	LDA #$7E
C0/511C:	48      	PHA
C0/511D:	AB      	PLB            (bank = 7E)
C0/511E:	A400    	LDY $00
C0/5120:	BF6058ED	LDA $ED5860,X  (character portrait palettes)
C0/5124:	99E075  	STA $75E0,Y
C0/5127:	E8      	INX
C0/5128:	C8      	INY 
C0/5129:	C02000  	CPY #$0020
C0/512C:	D0F2    	BNE $5120
C0/512E:	7B      	TDC 
C0/512F:	48      	PHA
C0/5130:	AB      	PLB            (bank = 00)
C0/5131:	9C0B42  	STZ $420B      (turn off DMA)
C0/5134:	A20070  	LDX #$7000
C0/5137:	8E1621  	STX $2116
C0/513A:	A980    	LDA #$80
C0/513C:	8D1521  	STA $2115
C0/513F:	A909    	LDA #$09
C0/5141:	8D0043  	STA $4300
C0/5144:	A918    	LDA #$18
C0/5146:	8D0143  	STA $4301      (register address is $2118)
C0/5149:	A20000  	LDX #$0000     (LDX $00..., or even better, TDC TAX)
C0/514C:	8E0243  	STX $4302
C0/514F:	A900    	LDA #$00       (if previous was TDC TAX, A is already 00 here...)
C0/5151:	8D0443  	STA $4304      (source is 00/0000)
C0/5154:	8D0743  	STA $4307      (source is 00/1000)
C0/5157:	A20010  	LDX #$1000
C0/515A:	8E0543  	STX $4305
C0/515D:	A901    	LDA #$01       (INC A...)
C0/515F:	8D0B42  	STA $420B
C0/5162:	9C0B42  	STZ $420B      (turn off DMA)
C0/5165:	A941    	LDA #$41
C0/5167:	8D0043  	STA $4300
C0/516A:	AD9507  	LDA $0795
C0/516D:	0A      	ASL A
C0/516E:	AA      	TAX
C0/516F:	C221    	REP #$21
C0/5171:	BFBA51C0	LDA $C051BA,X
C0/5175:	852A    	STA $2A
C0/5177:	7B      	TDC 
C0/5178:	E220    	SEP #$20      (8 bit accum./memory)
C0/517A:	A600    	LDX $00
C0/517C:	BFDA51C0	LDA $C051DA,X
C0/5180:	C221    	REP #$21
C0/5182:	EB      	XBA
C0/5183:	4A      	LSR A
C0/5184:	4A      	LSR A
C0/5185:	4A      	LSR A
C0/5186:	18      	CLC
C0/5187:	652A    	ADC $2A
C0/5189:	8D0243  	STA $4302
C0/518C:	7B      	TDC 
C0/518D:	E220    	SEP #$20      (8 bit accum./memory)
C0/518F:	A9ED    	LDA #$ED
C0/5191:	8D0443  	STA $4304
C0/5194:	A02000  	LDY #$0020
C0/5197:	8C0543  	STY $4305      (source is ED/0020, #$20 bytes into menu graphics)
C0/519A:	BFF351C0	LDA $C051F3,X
C0/519E:	C221    	REP #$21
C0/51A0:	0A      	ASL A
C0/51A1:	0A      	ASL A
C0/51A2:	0A      	ASL A
C0/51A3:	0A      	ASL A
C0/51A4:	18      	CLC
C0/51A5:	690070  	ADC #$7000
C0/51A8:	8D1621  	STA $2116
C0/51AB:	7B      	TDC 
C0/51AC:	E220    	SEP #$20      (8 bit accum./memory)
C0/51AE:	A901    	LDA #$01
C0/51B0:	8D0B42  	STA $420B      (turn on channel 1 of DMA)
C0/51B3:	E8      	INX
C0/51B4:	E01900  	CPX #$0019
C0/51B7:	D0C3    	BNE $517C
C0/51B9:	60      	RTS
 
Data, loaded from C0/5171
C0/51BA:	00 1D    	
C0/51BC:	20 20   	
C0/51BE:	40 23     	
C0/51C0:	60 26     	
C0/51C2:	80 29    	
C0/51C4:	A0 2C 
C0/51C6: 	C0 2F  	
C0/51C8:	E0 32   	
C0/51CA:	00 36    	
C0/51CC:	20 39 
C0/51CE:	40 3C  
C0/51D0:	60 3F     	
C0/51D2:	80 42	
C0/51D4:	A0 45    	
C0/51D6:	C0 48      	
C0/51D8:	E0 4B  

Data, loaded from C0/517C
C0/51DA:	00 01 02 03 08    		    	
C0/51DF:	10 11 12 13 09 	
C0/51E4:	04 05 06 07 0A     	
C0/51E9:	14 15 16 17 0B	
C0/51EE:	0D 0E 0F 18 0C  	

Data, loaded from C0/519A
C0/51F3:	00 01 02 03 04  		
C0/51F8:	10 11 12 13 14    
C0/51FD:	20 21 22 23 24  	
C0/5202:	30 31 32 33 34  	
C0/5207:	40 41 42 43 44   	

C0/520C:	A400    	LDY $00
C0/520E:	B96808  	LDA $0868,Y
C0/5211:	29F8    	AND #$F8
C0/5213:	0901    	ORA #$01
C0/5215:	996808  	STA $0868,Y
C0/5218:	C221    	REP #$21
C0/521A:	98      	TYA
C0/521B:	692900  	ADC #$0029
C0/521E:	A8      	TAY
C0/521F:	7B      	TDC 
C0/5220:	E220    	SEP #$20      (8 bit accum./memory)
C0/5222:	C09002  	CPY #$0290
C0/5225:	D0E7    	BNE $520E
C0/5227:	60      	RTS
 
; Initialize NPC presence bits
C0/5228:	A600    	LDX $00          ; zero X
C0/522A:	BFA0E0C0	LDA $C0E0A0,X    ; load initial presence bit values
C0/522E:	9DE01E  	STA $1EE0,X      ; copy to SRAM
C0/5231:	E8      	INX              ; next presence byte
C0/5232:	E08000  	CPX #$0080       ; copy $80 (#128) bytes
C0/5235:	D0F3    	BNE $522A        ; loop till done
C0/5237:	60      	RTS
 
C0/5238:	A400    	LDY $00
C0/523A:	641B    	STZ $1B
C0/523C:	CC0308  	CPY $0803
C0/523F:	F02E    	BEQ $526F
C0/5241:	BE8D08  	LDX $088D,Y
C0/5244:	EC8200  	CPX $0082
C0/5247:	D026    	BNE $526F
C0/5249:	B96708  	LDA $0867,Y
C0/524C:	1021    	BPL $526F
C0/524E:	B97C08  	LDA $087C,Y
C0/5251:	301C    	BMI $526F
C0/5253:	B96808  	LDA $0868,Y
C0/5256:	29E0    	AND #$E0
C0/5258:	C980    	CMP #$80
C0/525A:	F013    	BEQ $526F
C0/525C:	B98C08  	LDA $088C,Y
C0/525F:	29C0    	AND #$C0
C0/5261:	D00C    	BNE $526F
C0/5263:	20E17C  	JSR $7CE1
C0/5266:	BE7A08  	LDX $087A,Y
C0/5269:	A51B    	LDA $1B
C0/526B:	9F00207E	STA $7E2000,X
C0/526F:	E61B    	INC $1B
C0/5271:	E61B    	INC $1B
C0/5273:	C221    	REP #$21
C0/5275:	98      	TYA
C0/5276:	692900  	ADC #$0029
C0/5279:	A8      	TAY
C0/527A:	7B      	TDC 
C0/527B:	E220    	SEP #$20      (8 bit accum./memory)
C0/527D:	C0B007  	CPY #$07B0
C0/5280:	D0BA    	BNE $523C
C0/5282:	AC0308  	LDY $0803
C0/5285:	8C0442  	STY $4204
C0/5288:	A929    	LDA #$29
C0/528A:	8D0642  	STA $4206
C0/528D:	A5B8    	LDA $B8
C0/528F:	2904    	AND #$04
C0/5291:	F006    	BEQ $5299
C0/5293:	A5B2    	LDA $B2
C0/5295:	C902    	CMP #$02
C0/5297:	F00E    	BEQ $52A7
C0/5299:	20E17C  	JSR $7CE1
C0/529C:	BE7A08  	LDX $087A,Y
C0/529F:	AD1442  	LDA $4214
C0/52A2:	0A      	ASL A
C0/52A3:	9F00207E	STA $7E2000,X
C0/52A7:	60      	RTS
 
; Load NPC data for map

C0/52A8:	A600    	LDX $00          ; zero X
C0/52AA:	9EF70A  	STZ $0AF7,X      ; clear some byte [?]
C0/52AD:	E8      	INX              ; next byte to clear
C0/52AE:	E0D803  	CPX #$03D8       ; clear 984 bytes
C0/52B1:	D0F7    	BNE $52AA        ; loop till all clear
C0/52B3:	9C8F07  	STZ $078F        ; zero number of active NPCs
C0/52B6:	C220    	REP #$20         ; 16-bit A
C0/52B8:	A582    	LDA $82          ; current map index
C0/52BA:	0A      	ASL A            ; x2
C0/52BB:	AA      	TAX              ; index it
C0/52BC:	BF121AC4	LDA $C41A12,X    ; pointer to end of map's NPC data
C0/52C0:	851E    	STA $1E          ; save end of range
C0/52C2:	BF101AC4	LDA $C41A10,X    ; pointer to start of NPC data
C0/52C6:	AA      	TAX              ; index it
C0/52C7:	7B      	TDC              ; zero A/B
C0/52C8:	E220    	SEP #$20         ; 8-bit A
C0/52CA:	A09002  	LDY #$0290       ; [?]
C0/52CD:	E41E    	CPX $1E          ; check for empty NPC data
C0/52CF:	D003    	BNE $52D4        ; branch if NPC data exists
C0/52D1:	4C3454  	JMP $5434        ; else jump past data unpacking

C0/52D4:	BF101AC4	LDA $C41A10,X    ; NPC data byte $00
C0/52D8:	998908  	STA $0889,Y      ; NPC event address lobyte
C0/52DB:	BF111AC4	LDA $C41A11,X    ; NPC data byte $01
C0/52DF:	998A08  	STA $088A,Y      ; NPC event address midbyte
C0/52E2:	BF121AC4	LDA $C41A12,X    ; NPC data byte $02
C0/52E6:	2903    	AND #$03         ; isolate event address hibyte
C0/52E8:	998B08  	STA $088B,Y      ; store it
C0/52EB:	BF121AC4	LDA $C41A12,X    ; NPC data byte $02
C0/52EF:	291C    	AND #$1C         ; isolate NPC palette
C0/52F1:	4A      	LSR A            ; shift down to (x2)
C0/52F2:	998008  	STA $0880,Y      ; save palette
C0/52F5:	998108  	STA $0881,Y      ; save palette backup
C0/52F8:	BF121AC4	LDA $C41A12,X    ; NPC data byte $02
C0/52FC:	2920    	AND #$20         ; background scrolls [?]
C0/52FE:	0A      	ASL A
C0/52FF:	0A      	ASL A            ; shift to N bit
C0/5300:	997C08  	STA $087C,Y      ; save it
C0/5303:	C220    	REP #$20         ; 16-bit A
C0/5305:	BF121AC4	LDA $C41A12,X    ; NPC data bytes $02-$03
C0/5309:	4A      	LSR A
C0/530A:	4A      	LSR A
C0/530B:	4A      	LSR A
C0/530C:	4A      	LSR A
C0/530D:	4A      	LSR A
C0/530E:	4A      	LSR A            ; shift down bit identifier
C0/530F:	E220    	SEP #$20         ; 8-bit A
C0/5311:	DA      	PHX              ; store X
C0/5312:	5A      	PHY              ; store Y
C0/5313:	20C1BA  	JSR $BAC1        ; check NPC event bit
C0/5316:	7A      	PLY              ; restore Y
C0/5317:	FA      	PLX              ; restore X
C0/5318:	C900    	CMP #$00         ; is bit unset
C0/531A:	F002    	BEQ $531E        ; branch if ^
C0/531C:	A9C0    	LDA #$C0         ; set NPC "enabled" and "visible"
C0/531E:	996708  	STA $0867,Y      ; set object settings
C0/5321:	BF141AC4	LDA $C41A14,X    ; NPC data byte $04
C0/5325:	2980    	AND #$80         ; "show in vehicle" [?]
C0/5327:	996808  	STA $0868,Y      ; save flag
C0/532A:	C220    	REP #$20         ; 16-bit A
C0/532C:	BF141AC4	LDA $C41A14,X    ; NPC data bytes $04-$05
C0/5330:	297F00  	AND #$007F       ; X coordinate (starting)
C0/5333:	0A      	ASL A
C0/5334:	0A      	ASL A
C0/5335:	0A      	ASL A
C0/5336:	0A      	ASL A            ; x16 (shift up)
C0/5337:	996A08  	STA $086A,Y      ; set object's initial X position (tiles)
C0/533A:	BF151AC4	LDA $C41A15,X    ; NPC data bytes $05-$06
C0/533E:	293F00  	AND #$003F       ; Y coordinate (starting)
C0/5341:	0A      	ASL A
C0/5342:	0A      	ASL A
C0/5343:	0A      	ASL A
C0/5344:	0A      	ASL A            ; x16 (shift up)
C0/5345:	996D08  	STA $086D,Y      ; set object's initial Y position (tiles)
C0/5348:	7B      	TDC              ; zero A/B
C0/5349:	E220    	SEP #$20         ; 8-bit A
C0/534B:	996908  	STA $0869,Y      ; zero X-pixels [?]
C0/534E:	996C08  	STA $086C,Y      ; zero Y-pixels [?]
C0/5351:	996F08  	STA $086F,Y      ; zero Y-shift for jumping
C0/5354:	997008  	STA $0870,Y
C0/5357:	998708  	STA $0887,Y      ; zero jump properties
C0/535A:	BF151AC4	LDA $C41A15,X    ; NPC data byte $05
C0/535E:	29C0    	AND #$C0         ; isolate movement speed
C0/5360:	4A      	LSR A
C0/5361:	4A      	LSR A
C0/5362:	4A      	LSR A
C0/5363:	4A      	LSR A
C0/5364:	4A      	LSR A
C0/5365:	4A      	LSR A            ; x64
C0/5366:	997508  	STA $0875,Y      ; save object velocity
C0/5369:	BF161AC4	LDA $C41A16,X    ; NPC data byte $06
C0/536D:	997808  	STA $0878,Y      ; actor index [?]
C0/5370:	997908  	STA $0879,Y      ; graphic index [?]
C0/5373:	BF171AC4	LDA $C41A17,X    ; NPC data byte $07
C0/5377:	290F    	AND #$0F         ; isolate movement type
C0/5379:	197C08  	ORA $087C,Y      ; set movement speed [why this way?]
C0/537C:	997C08  	STA $087C,Y
C0/537F:	BF171AC4	LDA $C41A17,X    ; NPC data byte $07
C0/5383:	2930    	AND #$30         ; sprite priority [?]
C0/5385:	0A      	ASL A
C0/5386:	0A      	ASL A            ; x4
C0/5387:	998C08  	STA $088C,Y      ; set sprite priority [?]
C0/538A:	BF171AC4	LDA $C41A17,X    ; NPC data byte $07
C0/538E:	29C0    	AND #$C0         ; vehicle
C0/5390:	4A      	LSR A            ; shift down
C0/5391:	196808  	ORA $0868,Y      ; set vehicle settings [why this way?]
C0/5394:	996808  	STA $0868,Y
C0/5397:	BF181AC4	LDA $C41A18,X    ; NPC data byte $08
C0/539B:	2903    	AND #$03         ; facing direction
C0/539D:	997F08  	STA $087F,Y      ; set facing direction
C0/53A0:	DA      	PHX              ; store NPC data offset
C0/53A1:	AA      	TAX              ; index facing direction
C0/53A2:	BF2D58C0	LDA $C0582D,X    ; sprite index for facing direction
C0/53A6:	997708  	STA $0877,Y      ; set initial graphic position
C0/53A9:	997608  	STA $0876,Y      ; set initial graphic position
C0/53AC:	FA      	PLX
C0/53AD:	BF181AC4	LDA $C41A18,X
C0/53B1:	2904    	AND #$04
C0/53B3:	0A      	ASL A
C0/53B4:	0A      	ASL A
C0/53B5:	0A      	ASL A
C0/53B6:	197C08  	ORA $087C,Y
C0/53B9:	997C08  	STA $087C,Y
C0/53BC:	BF181AC4	LDA $C41A18,X
C0/53C0:	2918    	AND #$18
C0/53C2:	4A      	LSR A
C0/53C3:	4A      	LSR A
C0/53C4:	851A    	STA $1A
C0/53C6:	B96808  	LDA $0868,Y
C0/53C9:	29F9    	AND #$F9
C0/53CB:	051A    	ORA $1A
C0/53CD:	996808  	STA $0868,Y
C0/53D0:	BF181AC4	LDA $C41A18,X
C0/53D4:	29E0    	AND #$E0
C0/53D6:	F01E    	BEQ $53F6
C0/53D8:	4A      	LSR A
C0/53D9:	4A      	LSR A
C0/53DA:	4A      	LSR A
C0/53DB:	4A      	LSR A
C0/53DC:	4A      	LSR A
C0/53DD:	198C08  	ORA $088C,Y
C0/53E0:	998C08  	STA $088C,Y
C0/53E3:	BF181AC4	LDA $C41A18,X
C0/53E7:	2903    	AND #$03
C0/53E9:	0A      	ASL A
C0/53EA:	0A      	ASL A
C0/53EB:	0A      	ASL A
C0/53EC:	198C08  	ORA $088C,Y
C0/53EF:	0920    	ORA #$20
C0/53F1:	998C08  	STA $088C,Y
C0/53F4:	8000    	BRA $53F6
C0/53F6:	C220    	REP #$20      (16 bit accum./memory)
C0/53F8:	A582    	LDA $82
C0/53FA:	998D08  	STA $088D,Y
C0/53FD:	7B      	TDC 
C0/53FE:	E220    	SEP #$20      (8 bit accum./memory)
C0/5400:	7B      	TDC 
C0/5401:	997E08  	STA $087E,Y
C0/5404:	998608  	STA $0886,Y
C0/5407:	998208  	STA $0882,Y
C0/540A:	B96808  	LDA $0868,Y
C0/540D:	0901    	ORA #$01
C0/540F:	996808  	STA $0868,Y
C0/5412:	DA      	PHX
C0/5413:	20E17C  	JSR $7CE1
C0/5416:	201756  	JSR $5617
C0/5419:	FA      	PLX
C0/541A:	EE8F07  	INC $078F       ; increment active NPC count
C0/541D:	C221    	REP #$21
C0/541F:	98      	TYA             ; this object buffer offset
C0/5420:	692900  	ADC #$0029      ; point to next object buffer
C0/5423:	A8      	TAY             ; index it
C0/5424:	8A      	TXA             ; this NPC's data offset
C0/5425:	18      	CLC             ; carry: clear
C0/5426:	690900  	ADC #$0009      ; point to next NPC data block
C0/5429:	AA      	TAX             ; index it
C0/542A:	7B      	TDC             ; zero A/B
C0/542B:	E220    	SEP #$20        ; 8-bit A
C0/542D:	E41E    	CPX $1E         ; end of map's NPC data range
C0/542F:	F003    	BEQ $5434       ; finish if ^
C0/5431:	4CD452  	JMP $52D4       ; unpack NPC object data

C0/5434:	C0B007  	CPY #$07B0
C0/5437:	F017    	BEQ $5450
C0/5439:	B96708  	LDA $0867,Y
C0/543C:	293F    	AND #$3F
C0/543E:	996708  	STA $0867,Y
C0/5441:	C221    	REP #$21
C0/5443:	98      	TYA
C0/5444:	692900  	ADC #$0029
C0/5447:	A8      	TAY
C0/5448:	7B      	TDC 
C0/5449:	E220    	SEP #$20      (8 bit accum./memory)
C0/544B:	C0B007  	CPY #$07B0
C0/544E:	D0E9    	BNE $5439
C0/5450:	204A71  	JSR $714A
C0/5453:	60      	RTS
 
C0/5454:	AD8F07  	LDA $078F
C0/5457:	F024    	BEQ $547D
C0/5459:	A09002  	LDY #$0290
C0/545C:	7B      	TDC 
C0/545D:	48      	PHA
C0/545E:	B96808  	LDA $0868,Y
C0/5461:	29E0    	AND #$E0
C0/5463:	C980    	CMP #$80
C0/5465:	D005    	BNE $546C
C0/5467:	5A      	PHY
C0/5468:	207E54  	JSR $547E
C0/546B:	7A      	PLY
C0/546C:	C221    	REP #$21
C0/546E:	98      	TYA
C0/546F:	692900  	ADC #$0029
C0/5472:	A8      	TAY
C0/5473:	7B      	TDC 
C0/5474:	E220    	SEP #$20      (8 bit accum./memory)
C0/5476:	68      	PLA
C0/5477:	1A      	INC A
C0/5478:	CD8F07  	CMP $078F
C0/547B:	D0E0    	BNE $545D
C0/547D:	60      	RTS
 
C0/547E:	B97C08  	LDA $087C,Y		(from C0/5468)
C0/5481:	0910    	ORA #$10
C0/5483:	997C08  	STA $087C,Y
C0/5486:	B97908  	LDA $0879,Y
C0/5489:	C220    	REP #$20      (16 bit accum./memory)
C0/548B:	0A      	ASL A
C0/548C:	AA      	TAX
C0/548D:	BFF2D0C0	LDA $C0D0F2,X
C0/5491:	852A    	STA $2A
C0/5493:	7B      	TDC 
C0/5494:	E220    	SEP #$20      (8 bit accum./memory)
C0/5496:	BF3CD2C0	LDA $C0D23C,X
C0/549A:	852C    	STA $2C
C0/549C:	B98908  	LDA $0889,Y
C0/549F:	0A      	ASL A
C0/54A0:	7B      	TDC 
C0/54A1:	2A      	ROL A
C0/54A2:	851B    	STA $1B
C0/54A4:	B96808  	LDA $0868,Y
C0/54A7:	29FE    	AND #$FE
C0/54A9:	051B    	ORA $1B
C0/54AB:	996808  	STA $0868,Y
C0/54AE:	B98908  	LDA $0889,Y
C0/54B1:	297F    	AND #$7F
C0/54B3:	EB      	XBA
C0/54B4:	C220    	REP #$20      (16 bit accum./memory)
C0/54B6:	4A      	LSR A
C0/54B7:	4A      	LSR A
C0/54B8:	4A      	LSR A
C0/54B9:	18      	CLC
C0/54BA:	690070  	ADC #$7000
C0/54BD:	853B    	STA $3B
C0/54BF:	7B      	TDC 
C0/54C0:	E220    	SEP #$20      (8 bit accum./memory)
C0/54C2:	B98C08  	LDA $088C,Y
C0/54C5:	2918    	AND #$18
C0/54C7:	4A      	LSR A
C0/54C8:	4A      	LSR A
C0/54C9:	4A      	LSR A
C0/54CA:	1A      	INC A
C0/54CB:	851B    	STA $1B
C0/54CD:	B97C08  	LDA $087C,Y
C0/54D0:	2920    	AND #$20
C0/54D2:	D05F    	BNE $5533
C0/54D4:	A941    	LDA #$41
C0/54D6:	8D0043  	STA $4300
C0/54D9:	A980    	LDA #$80
C0/54DB:	8D1521  	STA $2115
C0/54DE:	A918    	LDA #$18
C0/54E0:	8D0143  	STA $4301
C0/54E3:	A63B    	LDX $3B
C0/54E5:	862D    	STX $2D
C0/54E7:	A00200  	LDY #$0002
C0/54EA:	9C0B42  	STZ $420B      (turn off DMA)
C0/54ED:	A62D    	LDX $2D
C0/54EF:	8E1621  	STX $2116
C0/54F2:	A62A    	LDX $2A
C0/54F4:	8E0243  	STX $4302
C0/54F7:	A52C    	LDA $2C
C0/54F9:	8D0443  	STA $4304
C0/54FC:	A24000  	LDX #$0040
C0/54FF:	8E0543  	STX $4305
C0/5502:	A901    	LDA #$01
C0/5504:	8D0B42  	STA $420B
C0/5507:	C221    	REP #$21
C0/5509:	A52D    	LDA $2D
C0/550B:	690001  	ADC #$0100
C0/550E:	852D    	STA $2D
C0/5510:	A52A    	LDA $2A
C0/5512:	18      	CLC
C0/5513:	694000  	ADC #$0040
C0/5516:	852A    	STA $2A
C0/5518:	7B      	TDC 
C0/5519:	E220    	SEP #$20      (8 bit accum./memory)
C0/551B:	652C    	ADC $2C
C0/551D:	852C    	STA $2C
C0/551F:	88      	DEY 
C0/5520:	D0C8    	BNE $54EA
C0/5522:	C221    	REP #$21
C0/5524:	A53B    	LDA $3B
C0/5526:	692000  	ADC #$0020
C0/5529:	853B    	STA $3B
C0/552B:	7B      	TDC 
C0/552C:	E220    	SEP #$20      (8 bit accum./memory)
C0/552E:	C61B    	DEC $1B
C0/5530:	D0B1    	BNE $54E3
C0/5532:	60      	RTS
 
C0/5533:	A941    	LDA #$41		(is this function ever called?)
C0/5535:	8D0043  	STA $4300
C0/5538:	A980    	LDA #$80
C0/553A:	8D1521  	STA $2115
C0/553D:	A918    	LDA #$18
C0/553F:	8D0143  	STA $4301
C0/5542:	A63B    	LDX $3B
C0/5544:	862D    	STX $2D
C0/5546:	A00400  	LDY #$0004
C0/5549:	9C0B42  	STZ $420B      (turn off DMA)
C0/554C:	A62D    	LDX $2D
C0/554E:	8E1621  	STX $2116
C0/5551:	A62A    	LDX $2A
C0/5553:	8E0243  	STX $4302
C0/5556:	A52C    	LDA $2C
C0/5558:	8D0443  	STA $4304
C0/555B:	A28000  	LDX #$0080
C0/555E:	8E0543  	STX $4305
C0/5561:	A901    	LDA #$01
C0/5563:	8D0B42  	STA $420B
C0/5566:	C221    	REP #$21
C0/5568:	A52D    	LDA $2D
C0/556A:	690001  	ADC #$0100
C0/556D:	852D    	STA $2D
C0/556F:	A52A    	LDA $2A
C0/5571:	18      	CLC
C0/5572:	698000  	ADC #$0080
C0/5575:	852A    	STA $2A
C0/5577:	7B      	TDC 
C0/5578:	E220    	SEP #$20      	(8 bit accum./memory)
C0/557A:	652C    	ADC $2C
C0/557C:	852C    	STA $2C
C0/557E:	88      	DEY 
C0/557F:	D0C8    	BNE $5549
C0/5581:	C221    	REP #$21
C0/5583:	A53B    	LDA $3B
C0/5585:	694000  	ADC #$0040
C0/5588:	853B    	STA $3B
C0/558A:	7B      	TDC 
C0/558B:	E220    	SEP #$20      	(8 bit accum./memory)
C0/558D:	C61B    	DEC $1B
C0/558F:	D0B1    	BNE $5542
C0/5591:	60      	RTS
 
C0/5592:	A600    	LDX $00
C0/5594:	C220    	REP #$20      	(16 bit accum./memory)
C0/5596:	BDF710  	LDA $10F7,X
C0/5599:	C9B007  	CMP #$07B0
C0/559C:	F007    	BEQ $55A5
C0/559E:	E8      	INX
C0/559F:	E8      	INX
C0/55A0:	E02E00  	CPX #$002E
C0/55A3:	D0F1    	BNE $5596
C0/55A5:	98      	TYA
C0/55A6:	9DF710  	STA $10F7,X
C0/55A9:	7B      	TDC 
C0/55AA:	E220    	SEP #$20      	(8 bit accum./memory)
C0/55AC:	8A      	TXA
C0/55AD:	998F08  	STA $088F,Y
C0/55B0:	60      	RTS
 
C0/55B1:	B98F08  	LDA $088F,Y
C0/55B4:	AA      	TAX
C0/55B5:	C220    	REP #$20      	(16 bit accum./memory)
C0/55B7:	A9B007  	LDA #$07B0
C0/55BA:	9DF710  	STA $10F7,X
C0/55BD:	7B      	TDC 
C0/55BE:	E220    	SEP #$20      	(8 bit accum./memory)
C0/55C0:	60      	RTS
 
C0/55C1:	A400    	LDY $00
C0/55C3:	BB      	TYX
C0/55C4:	B96708  	LDA $0867,Y
C0/55C7:	2940    	AND #$40
C0/55C9:	F014    	BEQ $55DF
C0/55CB:	C220    	REP #$20      	(16 bit accum./memory)
C0/55CD:	98      	TYA
C0/55CE:	9DF710  	STA $10F7,X
C0/55D1:	7B      	TDC 
C0/55D2:	E220    	SEP #$20      	(8 bit accum./memory)
C0/55D4:	8A      	TXA
C0/55D5:	998F08  	STA $088F,Y
C0/55D8:	E8      	INX
C0/55D9:	E8      	INX
C0/55DA:	E03000  	CPX #$0030
C0/55DD:	F00F    	BEQ $55EE
C0/55DF:	C221    	REP #$21
C0/55E1:	98      	TYA
C0/55E2:	692900  	ADC #$0029
C0/55E5:	A8      	TAY
C0/55E6:	7B      	TDC 
C0/55E7:	E220    	SEP #$20      	(8 bit accum./memory)
C0/55E9:	C0B007  	CPY #$07B0
C0/55EC:	D0D6    	BNE $55C4
C0/55EE:	60      	RTS
 
C0/55EF:	C220    	REP #$20      	(from only C0/5613, 16 bit accum./memory)
C0/55F1:	9C4800  	STZ $0048
C0/55F4:	9C4900  	STZ $0049
C0/55F7:	A600    	LDX $00
C0/55F9:	A9B007  	LDA #$07B0
C0/55FC:	9DF710  	STA $10F7,X
C0/55FF:	E8      	INX
C0/5600:	E8      	INX
C0/5601:	E03000  	CPX #$0030						
C0/5604:	D0F6    	BNE $55FC
C0/5606:	7B      	TDC 
C0/5607:	E220    	SEP #$20      	(8 bit accum./memory)
C0/5609:	60      	RTS
 
C0/560A:	206A56  	JSR $566A		(from only C0/BF7F)
C0/560D:	20B156  	JSR $56B1
C0/5610:	207F56  	JSR $567F
C0/5613:	20EF55  	JSR $55EF      (JMP fool!)
C0/5616:	60      	RTS
 
C0/5617:	B98108  	LDA $0881,Y		(from C0/5416, C0/7A56, C0/7A8B)
C0/561A:	29CF    	AND #$CF
C0/561C:	0920    	ORA #$20
C0/561E:	998108  	STA $0881,Y
C0/5621:	BE7A08  	LDX $087A,Y
C0/5624:	BF00007F	LDA $7F0000,X
C0/5628:	AA      	TAX
C0/5629:	BF00767E	LDA $7E7600,X
C0/562D:	2907    	AND #$07
C0/562F:	998808  	STA $0888,Y
C0/5632:	C901    	CMP #$01
C0/5634:	F013    	BEQ $5649
C0/5636:	C902    	CMP #$02
C0/5638:	F01A    	BEQ $5654
C0/563A:	C903    	CMP #$03
C0/563C:	F021    	BEQ $565F
C0/563E:	B98008  	LDA $0880,Y
C0/5641:	29CF    	AND #$CF
C0/5643:	0930    	ORA #$30
C0/5645:	998008  	STA $0880,Y
C0/5648:	60      	RTS
 
C0/5649:	B98008  	LDA $0880,Y		(from C0/5634)
C0/564C:	29CF    	AND #$CF
C0/564E:	0920    	ORA #$20
C0/5650:	998008  	STA $0880,Y
C0/5653:	60      	RTS
 
C0/5654:	B98008  	LDA $0880,Y		(from C0/5638)
C0/5657:	29CF    	AND #$CF
C0/5659:	0920    	ORA #$20
C0/565B:	998008  	STA $0880,Y
C0/565E:	60      	RTS
 
C0/565F:	B98008  	LDA $0880,Y		(from C0/563C)
C0/5662:	29CF    	AND #$CF
C0/5664:	0920    	ORA #$20
C0/5666:	998008  	STA $0880,Y
C0/5669:	60      	RTS
 
C0/566A:	A20020  	LDX #$2000		(from C0/560A)
C0/566D:	8E8121  	STX $2181
C0/5670:	9C8321  	STZ $2183
C0/5673:	A20040  	LDX #$4000
C0/5676:	A9FF    	LDA #$FF
C0/5678:	8D8021  	STA $2180
C0/567B:	CA      	DEX
C0/567C:	D0FA    	BNE $5678
C0/567E:	60      	RTS
 
C0/567F:	9C0B42  	STZ $420B		(from C0/5610)
C0/5682:	A980    	LDA #$80
C0/5684:	8D1521  	STA $2115
C0/5687:	A20072  	LDX #$7200
C0/568A:	8E1621  	STX $2116
C0/568D:	A941    	LDA #$41
C0/568F:	8D0043  	STA $4300
C0/5692:	A918    	LDA #$18
C0/5694:	8D0143  	STA $4301
C0/5697:	A20030  	LDX #$3000
C0/569A:	8E0243  	STX $4302
C0/569D:	A9D8    	LDA #$D8
C0/569F:	8D0443  	STA $4304      (D8/3000)
C0/56A2:	8D0743  	STA $4307      (D8/1C00)
C0/56A5:	A2001C  	LDX #$1C00
C0/56A8:	8E0543  	STX $4305
C0/56AB:	A901    	LDA #$01
C0/56AD:	8D0B42  	STA $420B
C0/56B0:	60      	RTS
 
C0/56B1:	9C8100  	STZ $0081		(from C0/560D)
C0/56B4:	A980    	LDA #$80
C0/56B6:	8D1521  	STA $2115
C0/56B9:	A20060  	LDX #$6000
C0/56BC:	8E1621  	STX $2116
C0/56BF:	A909    	LDA #$09
C0/56C1:	8D0043  	STA $4300
C0/56C4:	A918    	LDA #$18
C0/56C6:	8D0143  	STA $4301
C0/56C9:	A28100  	LDX #$0081
C0/56CC:	8E0243  	STX $4302
C0/56CF:	A900    	LDA #$00
C0/56D1:	8D0443  	STA $4304      (00/0081)
C0/56D4:	8D0743  	STA $4307      (00/2000)
C0/56D7:	A20020  	LDX #$2000
C0/56DA:	8E0543  	STX $4305
C0/56DD:	A901    	LDA #$01
C0/56DF:	8D0B42  	STA $420B
C0/56E2:	60      	RTS
 
C0/56E3:	A97E    	LDA #$7E		(from C0/BF94)
C0/56E5:	48      	PHA
C0/56E6:	AB      	PLB
C0/56E7:	A400    	LDY $00
C0/56E9:	7B      	TDC 
C0/56EA:	A21000  	LDX #$0010
C0/56ED:	990078  	STA $7800,Y
C0/56F0:	C8      	INY 
C0/56F1:	CA      	DEX
C0/56F2:	D0F9    	BNE $56ED
C0/56F4:	1A      	INC A
C0/56F5:	C00001  	CPY #$0100
C0/56F8:	D0F0    	BNE $56EA
C0/56FA:	A400    	LDY $00
C0/56FC:	A600    	LDX $00
C0/56FE:	BF1C57C0	LDA $C0571C,X
C0/5702:	990079  	STA $7900,Y
C0/5705:	BF2C57C0	LDA $C0572C,X
C0/5709:	99007A  	STA $7A00,Y
C0/570C:	C8      	INY 
C0/570D:	E8      	INX
C0/570E:	E01000  	CPX #$0010
C0/5711:	D0EB    	BNE $56FE
C0/5713:	C00001  	CPY #$0100
C0/5716:	D0E4    	BNE $56FC
C0/5718:	7B      	TDC 
C0/5719:	48      	PHA
C0/571A:	AB      	PLB
C0/571B:	60      	RTS

Data of some kind
C0/571C:	FE
C0/571D:	FE
C0/571E:	FE
C0/571F:	FE
C0/5720:	FB
C0/5721:	FB
C0/5722:	FB
C0/5723:	FB
C0/5724:	EF
C0/5725:	EF
C0/5726:	EF
C0/5727:	EF
C0/5728:	BF
C0/5729:	BF
C0/572A:	BF
C0/572B:	BF

C0/572C:	01
C0/572D:	01
C0/572E:	01
C0/572F:	01
C0/5730:	04
C0/5731:	04
C0/5732:	04
C0/5733:	04
C0/5734:	10
C0/5735:	10
C0/5736:	10
C0/5737:	10
C0/5738:	40
C0/5739:	40
C0/573A:	40
C0/573B:	40
 
C0/573C:	64DC    	STZ $DC
C0/573E:	A918    	LDA #$18
C0/5740:	85DE    	STA $DE
C0/5742:	A5DC    	LDA $DC
C0/5744:	C5DD    	CMP $DD
C0/5746:	9003    	BCC $574B
C0/5748:	4C0158  	JMP $5801 	(could use brl)

C0/574B:	AA      	TAX
C0/574C:	C220    	REP #$20      (16 bit accum./memory)
C0/574E:	BD0308  	LDA $0803,X
C0/5751:	85DA    	STA $DA
C0/5753:	A8      	TAY
C0/5754:	B97108  	LDA $0871,Y
C0/5757:	3017    	BMI $5770
C0/5759:	B96908  	LDA $0869,Y
C0/575C:	18      	CLC
C0/575D:	797108  	ADC $0871,Y
C0/5760:	996908  	STA $0869,Y
C0/5763:	E220    	SEP #$20      (8 bit accum./memory)
C0/5765:	7B      	TDC 
C0/5766:	796B08  	ADC $086B,Y
C0/5769:	996B08  	STA $086B,Y
C0/576C:	C220    	REP #$20      (16 bit accum./memory)
C0/576E:	801C    	BRA $578C
C0/5770:	B97108  	LDA $0871,Y
C0/5773:	4502    	EOR $02
C0/5775:	851A    	STA $1A
C0/5777:	B96908  	LDA $0869,Y
C0/577A:	18      	CLC
C0/577B:	E51A    	SBC $1A
C0/577D:	996908  	STA $0869,Y
C0/5780:	E220    	SEP #$20      (8 bit accum./memory)
C0/5782:	B96B08  	LDA $086B,Y
C0/5785:	E500    	SBC $00
C0/5787:	996B08  	STA $086B,Y
C0/578A:	C220    	REP #$20      (16 bit accum./memory)
C0/578C:	B97308  	LDA $0873,Y
C0/578F:	3015    	BMI $57A6
C0/5791:	B96C08  	LDA $086C,Y
C0/5794:	18      	CLC
C0/5795:	797308  	ADC $0873,Y
C0/5798:	996C08  	STA $086C,Y
C0/579B:	E220    	SEP #$20      (8 bit accum./memory)
C0/579D:	7B      	TDC 
C0/579E:	796E08  	ADC $086E,Y
C0/57A1:	996E08  	STA $086E,Y
C0/57A4:	801A    	BRA $57C0
C0/57A6:	B97308  	LDA $0873,Y
C0/57A9:	4502    	EOR $02
C0/57AB:	851A    	STA $1A
C0/57AD:	B96C08  	LDA $086C,Y
C0/57B0:	18      	CLC
C0/57B1:	E51A    	SBC $1A
C0/57B3:	996C08  	STA $086C,Y
C0/57B6:	E220    	SEP #$20      (8 bit accum./memory)
C0/57B8:	B96E08  	LDA $086E,Y
C0/57BB:	E500    	SBC $00
C0/57BD:	996E08  	STA $086E,Y
C0/57C0:	7B      	TDC 
C0/57C1:	E220    	SEP #$20      (8 bit accum./memory)
C0/57C3:	B98708  	LDA $0887,Y
C0/57C6:	293F    	AND #$3F
C0/57C8:	F00C    	BEQ $57D6
C0/57CA:	B98708  	LDA $0887,Y
C0/57CD:	AA      	TAX
C0/57CE:	3A      	DEC A
C0/57CF:	998708  	STA $0887,Y
C0/57D2:	BFAD59C0	LDA $C059AD,X
C0/57D6:	996F08  	STA $086F,Y
C0/57D9:	203958  	JSR $5839
C0/57DC:	B96908  	LDA $0869,Y
C0/57DF:	D020    	BNE $5801
C0/57E1:	B96A08  	LDA $086A,Y
C0/57E4:	290F    	AND #$0F
C0/57E6:	D019    	BNE $5801
C0/57E8:	B96C08  	LDA $086C,Y
C0/57EB:	D014    	BNE $5801
C0/57ED:	B96D08  	LDA $086D,Y
C0/57F0:	290F    	AND #$0F
C0/57F2:	D00D    	BNE $5801
C0/57F4:	7B      	TDC 
C0/57F5:	997108  	STA $0871,Y
C0/57F8:	997208  	STA $0872,Y
C0/57FB:	997308  	STA $0873,Y
C0/57FE:	997408  	STA $0874,Y
C0/5801:	E6DC    	INC $DC
C0/5803:	E6DC    	INC $DC
C0/5805:	C6DE    	DEC $DE
C0/5807:	F003    	BEQ $580C
C0/5809:	4C4257  	JMP $5742	
C0/580C:	60      	RTS
 
C0/580D:	0405    	TSB $05
C0/580F:	0403    	TSB $03
C0/5811:	6E6F6E  	ROR $6E6F
C0/5814:	6F010201	ADC $010201
C0/5818:	002E    	BRK #$2E
C0/581A:	2F2E2F04	AND $042F2E
C0/581E:	0504    	ORA $04
C0/5820:	0347    	ORA $47,S
C0/5822:	48      	PHA
C0/5823:	4746    	EOR [$46]
C0/5825:	0102    	ORA ($02,X)
C0/5827:	0100    	ORA ($00,X)
C0/5829:	0708    	ORA [$08]
C0/582B:	0706    	ORA [$06]

; Facing direction sprite index
C0/582D:	0447                   ; up, right
C0/582F:	0107                   ; down, left

C0/5831:	0000    	BRK #$00
C0/5833:	3228    	AND ($28)
C0/5835:	0000    	BRK #$00
C0/5837:	0000    	BRK #$00
C0/5839:	B98C08  	LDA $088C,Y
C0/583C:	2920    	AND #$20
C0/583E:	F003    	BEQ $5843
C0/5840:	4CE458  	JMP $58E4
C0/5843:	CC0308  	CPY $0803
C0/5846:	D00D    	BNE $5855
C0/5848:	A5B9    	LDA $B9
C0/584A:	C9FF    	CMP #$FF
C0/584C:	F007    	BEQ $5855
C0/584E:	2940    	AND #$40
C0/5850:	F003    	BEQ $5855
C0/5852:	7B      	TDC 
C0/5853:	8003    	BRA $5858
C0/5855:	B97F08  	LDA $087F,Y
C0/5858:	0A      	ASL A
C0/5859:	0A      	ASL A
C0/585A:	851A    	STA $1A
C0/585C:	B96808  	LDA $0868,Y
C0/585F:	2960    	AND #$60
C0/5861:	F003    	BEQ $5866
C0/5863:	4CAD58  	JMP $58AD
C0/5866:	B96808  	LDA $0868,Y
C0/5869:	2901    	AND #$01
C0/586B:	F03D    	BEQ $58AA
C0/586D:	A5B8    	LDA $B8
C0/586F:	29C0    	AND #$C0
C0/5871:	F00A    	BEQ $587D
C0/5873:	BE7108  	LDX $0871,Y
C0/5876:	F012    	BEQ $588A
C0/5878:	BE7308  	LDX $0873,Y
C0/587B:	D01A    	BNE $5897
C0/587D:	BE7108  	LDX $0871,Y
C0/5880:	F008    	BEQ $588A
C0/5882:	B96A08  	LDA $086A,Y
C0/5885:	4A      	LSR A
C0/5886:	4A      	LSR A
C0/5887:	4A      	LSR A
C0/5888:	8013    	BRA $589D
C0/588A:	BE7308  	LDX $0873,Y
C0/588D:	F01B    	BEQ $58AA
C0/588F:	B96D08  	LDA $086D,Y
C0/5892:	4A      	LSR A
C0/5893:	4A      	LSR A
C0/5894:	4A      	LSR A
C0/5895:	8006    	BRA $589D
C0/5897:	A546    	LDA $46
C0/5899:	4A      	LSR A
C0/589A:	4A      	LSR A
C0/589B:	8000    	BRA $589D
C0/589D:	2903    	AND #$03
C0/589F:	18      	CLC
C0/58A0:	651A    	ADC $1A
C0/58A2:	AA      	TAX
C0/58A3:	BF1D58C0	LDA $C0581D,X
C0/58A7:	997708  	STA $0877,Y
C0/58AA:	4C3759  	JMP $5937
C0/58AD:	C960    	CMP #$60
C0/58AF:	F027    	BEQ $58D8
C0/58B1:	BE7108  	LDX $0871,Y
C0/58B4:	F008    	BEQ $58BE
C0/58B6:	B96A08  	LDA $086A,Y
C0/58B9:	4A      	LSR A
C0/58BA:	4A      	LSR A
C0/58BB:	4A      	LSR A
C0/58BC:	800B    	BRA $58C9
C0/58BE:	BE7308  	LDX $0873,Y
C0/58C1:	F006    	BEQ $58C9
C0/58C3:	B96D08  	LDA $086D,Y
C0/58C6:	4A      	LSR A
C0/58C7:	4A      	LSR A
C0/58C8:	4A      	LSR A
C0/58C9:	2903    	AND #$03
C0/58CB:	18      	CLC
C0/58CC:	651A    	ADC $1A
C0/58CE:	AA      	TAX
C0/58CF:	BF0D58C0	LDA $C0580D,X
C0/58D3:	997708  	STA $0877,Y
C0/58D6:	805F    	BRA $5937
C0/58D8:	A51A    	LDA $1A
C0/58DA:	AA      	TAX
C0/58DB:	BF1D58C0	LDA $C0581D,X
C0/58DF:	997708  	STA $0877,Y
C0/58E2:	8053    	BRA $5937
C0/58E4:	B96808  	LDA $0868,Y
C0/58E7:	2960    	AND #$60
C0/58E9:	4A      	LSR A
C0/58EA:	4A      	LSR A
C0/58EB:	4A      	LSR A
C0/58EC:	4A      	LSR A
C0/58ED:	4A      	LSR A
C0/58EE:	AA      	TAX
C0/58EF:	A545    	LDA $45
C0/58F1:	4A      	LSR A
C0/58F2:	4A      	LSR A
C0/58F3:	E00000  	CPX #$0000
C0/58F6:	F004    	BEQ $58FC
C0/58F8:	4A      	LSR A
C0/58F9:	CA      	DEX
C0/58FA:	80F7    	BRA $58F3
C0/58FC:	AA      	TAX
C0/58FD:	B98C08  	LDA $088C,Y
C0/5900:	2918    	AND #$18
C0/5902:	D004    	BNE $5908
C0/5904:	641B    	STZ $1B
C0/5906:	801F    	BRA $5927
C0/5908:	C908    	CMP #$08
C0/590A:	D00B    	BNE $5917
C0/590C:	8A      	TXA
C0/590D:	2901    	AND #$01
C0/590F:	F002    	BEQ $5913
C0/5911:	A940    	LDA #$40
C0/5913:	851B    	STA $1B
C0/5915:	8010    	BRA $5927
C0/5917:	C910    	CMP #$10
C0/5919:	D007    	BNE $5922
C0/591B:	8A      	TXA
C0/591C:	2901    	AND #$01
C0/591E:	851B    	STA $1B
C0/5920:	8005    	BRA $5927
C0/5922:	8A      	TXA
C0/5923:	2903    	AND #$03
C0/5925:	851B    	STA $1B
C0/5927:	B98C08  	LDA $088C,Y
C0/592A:	2907    	AND #$07
C0/592C:	AA      	TAX
C0/592D:	BF3158C0	LDA $C05831,X
C0/5931:	18      	CLC
C0/5932:	651B    	ADC $1B
C0/5934:	997708  	STA $0877,Y
C0/5937:	60      	RTS
 
C0/5938:	AC0308  	LDY $0803
C0/593B:	B96808  	LDA $0868,Y
C0/593E:	2960    	AND #$60
C0/5940:	D05C    	BNE $599E
C0/5942:	B96708  	LDA $0867,Y
C0/5945:	1057    	BPL $599E
C0/5947:	C220    	REP #$20      (16 bit accum./memory)
C0/5949:	A5B4    	LDA $B4
C0/594B:	C9F800  	CMP #$00F8
C0/594E:	D023    	BNE $5973
C0/5950:	ADDC03  	LDA $03DC
C0/5953:	8DF803  	STA $03F8
C0/5956:	ADDE03  	LDA $03DE
C0/5959:	8DFA03  	STA $03FA
C0/595C:	AD9C04  	LDA $049C
C0/595F:	8DBC04  	STA $04BC
C0/5962:	AD9E04  	LDA $049E
C0/5965:	8DBE04  	STA $04BE
C0/5968:	A9EFEF  	LDA #$EFEF
C0/596B:	8DB804  	STA $04B8
C0/596E:	8DFC03  	STA $03FC
C0/5971:	8021    	BRA $5994
C0/5973:	ADDC03  	LDA $03DC
C0/5976:	8DB804  	STA $04B8
C0/5979:	ADDE03  	LDA $03DE
C0/597C:	8DBA04  	STA $04BA
C0/597F:	AD9C04  	LDA $049C
C0/5982:	8DBC04  	STA $04BC
C0/5985:	AD9E04  	LDA $049E
C0/5988:	8DBE04  	STA $04BE
C0/598B:	A9EFEF  	LDA #$EFEF
C0/598E:	8DF803  	STA $03F8
C0/5991:	8DFC03  	STA $03FC
C0/5994:	8DDC03  	STA $03DC
C0/5997:	8D9C04  	STA $049C
C0/599A:	7B      	TDC 
C0/599B:	E220    	SEP #$20      (8 bit accum./memory)
C0/599D:	60      	RTS
 
C0/599E:	A9EF    	LDA #$EF
C0/59A0:	8DB904  	STA $04B9
C0/59A3:	8DBD04  	STA $04BD
C0/59A6:	8DF903  	STA $03F9
C0/59A9:	8DFD03  	STA $03FD
C0/59AC:	60      	RTS
 
C0/59AD:	0204    	COP #$04
C0/59AF:	0608    	ASL $08
C0/59B1:	090A    	ORA #$0A
C0/59B3:	0B      	PHD
C0/59B4:	0B      	PHD
C0/59B5:	0B      	PHD
C0/59B6:	0B      	PHD
C0/59B7:	0A      	ASL A
C0/59B8:	0908    	ORA #$08
C0/59BA:	0604    	ASL $04
C0/59BC:	0200    	COP #$00
C0/59BE:	0000    	BRK #$00
C0/59C0:	0000    	BRK #$00
C0/59C2:	0000    	BRK #$00
C0/59C4:	0000    	BRK #$00
C0/59C6:	0000    	BRK #$00
C0/59C8:	0000    	BRK #$00
C0/59CA:	0000    	BRK #$00
C0/59CC:	0000    	BRK #$00
C0/59CE:	0000    	BRK #$00
C0/59D0:	0000    	BRK #$00
C0/59D2:	0000    	BRK #$00
C0/59D4:	0000    	BRK #$00
C0/59D6:	0000    	BRK #$00
C0/59D8:	0000    	BRK #$00
C0/59DA:	0000    	BRK #$00
C0/59DC:	0000    	BRK #$00
C0/59DE:	0000    	BRK #$00
C0/59E0:	0000    	BRK #$00
C0/59E2:	0000    	BRK #$00
C0/59E4:	0000    	BRK #$00
C0/59E6:	0000    	BRK #$00
C0/59E8:	0000    	BRK #$00
C0/59EA:	0000    	BRK #$00
C0/59EC:	0005    	BRK #$05
C0/59EE:	090E    	ORA #$0E
C0/59F0:	1115    	ORA ($15),Y
C0/59F2:	18      	CLC
C0/59F3:	1B      	TCS 
C0/59F4:	1E2022  	ASL $2220,X
C0/59F7:	2426    	BIT $26
C0/59F9:	2728    	AND [$28]
C0/59FB:	2929    	AND #$29
C0/59FD:	2929    	AND #$29
C0/59FF:	28      	PLP 
C0/5A00:	2726    	AND [$26]
C0/5A02:	2422    	BIT $22
C0/5A04:	201E1B  	JSR $1B1E
C0/5A07:	18      	CLC
C0/5A08:	1511    	ORA $11,X
C0/5A0A:	0E0905  	ASL $0509
C0/5A0D:	0000    	BRK #$00
C0/5A0F:	0000    	BRK #$00
C0/5A11:	0000    	BRK #$00
C0/5A13:	0000    	BRK #$00
C0/5A15:	0000    	BRK #$00
C0/5A17:	0000    	BRK #$00
C0/5A19:	0000    	BRK #$00
C0/5A1B:	0000    	BRK #$00
C0/5A1D:	0000    	BRK #$00
C0/5A1F:	0000    	BRK #$00
C0/5A21:	0000    	BRK #$00
C0/5A23:	0000    	BRK #$00
C0/5A25:	0000    	BRK #$00
C0/5A27:	0000    	BRK #$00
C0/5A29:	0000    	BRK #$00
C0/5A2B:	0000    	BRK #$00
C0/5A2D:	A20021  	LDX #$2100
C0/5A30:	DA      	PHX
C0/5A31:	2B      	PLD 
C0/5A32:	A20003  	LDX #$0300
C0/5A35:	8681    	STX $81
C0/5A37:	6483    	STZ $83
C0/5A39:	A02000  	LDY #$0020
C0/5A3C:	A9EF    	LDA #$EF
C0/5A3E:	8580    	STA $80
C0/5A40:	8580    	STA $80
C0/5A42:	8580    	STA $80
C0/5A44:	8580    	STA $80
C0/5A46:	8580    	STA $80
C0/5A48:	8580    	STA $80
C0/5A4A:	8580    	STA $80
C0/5A4C:	8580    	STA $80
C0/5A4E:	8580    	STA $80
C0/5A50:	8580    	STA $80
C0/5A52:	8580    	STA $80
C0/5A54:	8580    	STA $80
C0/5A56:	8580    	STA $80
C0/5A58:	8580    	STA $80
C0/5A5A:	8580    	STA $80
C0/5A5C:	8580    	STA $80
C0/5A5E:	88      	DEY 
C0/5A5F:	D0DD    	BNE $5A3E
C0/5A61:	A20005  	LDX #$0500
C0/5A64:	8681    	STX $81
C0/5A66:	6483    	STZ $83
C0/5A68:	6480    	STZ $80
C0/5A6A:	6480    	STZ $80
C0/5A6C:	6480    	STZ $80
C0/5A6E:	6480    	STZ $80
C0/5A70:	6480    	STZ $80
C0/5A72:	6480    	STZ $80
C0/5A74:	6480    	STZ $80
C0/5A76:	6480    	STZ $80
C0/5A78:	6480    	STZ $80
C0/5A7A:	6480    	STZ $80
C0/5A7C:	6480    	STZ $80
C0/5A7E:	6480    	STZ $80
C0/5A80:	6480    	STZ $80
C0/5A82:	6480    	STZ $80
C0/5A84:	6480    	STZ $80
C0/5A86:	6480    	STZ $80
C0/5A88:	6480    	STZ $80
C0/5A8A:	6480    	STZ $80
C0/5A8C:	6480    	STZ $80
C0/5A8E:	6480    	STZ $80
C0/5A90:	6480    	STZ $80
C0/5A92:	6480    	STZ $80
C0/5A94:	6480    	STZ $80
C0/5A96:	6480    	STZ $80
C0/5A98:	6480    	STZ $80
C0/5A9A:	6480    	STZ $80
C0/5A9C:	6480    	STZ $80
C0/5A9E:	6480    	STZ $80
C0/5AA0:	6480    	STZ $80
C0/5AA2:	6480    	STZ $80
C0/5AA4:	6480    	STZ $80
C0/5AA6:	6480    	STZ $80

C0/5AA8:	A20000  	LDX #$0000
C0/5AAB:	DA      	PHX
C0/5AAC:	2B      	PLD 
C0/5AAD:	A97E    	LDA #$7E
C0/5AAF:	48      	PHA
C0/5AB0:	AB      	PLB
C0/5AB1:	A906    	LDA #$06
C0/5AB3:	85DE    	STA $DE
C0/5AB5:	A547    	LDA $47
C0/5AB7:	2903    	AND #$03
C0/5AB9:	AA      	TAX
C0/5ABA:	BF7767C0	LDA $C06777,X
C0/5ABE:	85DC    	STA $DC
C0/5AC0:	A5DC    	LDA $DC
C0/5AC2:	AA      	TAX
C0/5AC3:	BCF710  	LDY $10F7,X
C0/5AC6:	C0B007  	CPY #$07B0
C0/5AC9:	F006    	BEQ $5AD1
C0/5ACB:	B97708  	LDA $0877,Y
C0/5ACE:	997608  	STA $0876,Y
C0/5AD1:	E6DC    	INC $DC
C0/5AD3:	E6DC    	INC $DC
C0/5AD5:	C6DE    	DEC $DE
C0/5AD7:	D0E7    	BNE $5AC0
C0/5AD9:	A0A000  	LDY #$00A0
C0/5ADC:	84D4    	STY $D4
C0/5ADE:	A02000  	LDY #$0020
C0/5AE1:	84D6    	STY $D6
C0/5AE3:	84D8    	STY $D8
C0/5AE5:	A918    	LDA #$18
C0/5AE7:	85DE    	STA $DE
C0/5AE9:	64DC    	STZ $DC
C0/5AEB:	A5DC    	LDA $DC
C0/5AED:	C5DD    	CMP $DD
C0/5AEF:	9003    	BCC $5AF4
C0/5AF1:	4C345B  	JMP $5B34

C0/5AF4:	AA      	TAX
C0/5AF5:	BD0308  	LDA $0803,X
C0/5AF8:	85DA    	STA $DA
C0/5AFA:	BD0408  	LDA $0804,X
C0/5AFD:	85DB    	STA $DB
C0/5AFF:	A4DA    	LDY $DA
C0/5B01:	B96708  	LDA $0867,Y
C0/5B04:	3003    	BMI $5B09
C0/5B06:	4C345B  	JMP $5B34

C0/5B09:	B96808  	LDA $0868,Y
C0/5B0C:	29E0    	AND #$E0
C0/5B0E:	C980    	CMP #$80
C0/5B10:	D003    	BNE $5B15
C0/5B12:	4CF564  	JMP $64F5

C0/5B15:	B98C08  	LDA $088C,Y
C0/5B18:	2920    	AND #$20
C0/5B1A:	D06F    	BNE $5B8B
C0/5B1C:	B96808  	LDA $0868,Y
C0/5B1F:	2960    	AND #$60
C0/5B21:	F068    	BEQ $5B8B
C0/5B23:	C920    	CMP #$20
C0/5B25:	D003    	BNE $5B2A
C0/5B27:	4CBA60  	JMP $60BA

C0/5B2A:	C940    	CMP #$40
C0/5B2C:	D003    	BNE $5B31
C0/5B2E:	4C575D  	JMP $5D57

C0/5B31:	4C365F  	JMP $5F36

C0/5B34:	7B      	TDC 
C0/5B35:	E220    	SEP #$20      (8 bit accum./memory)
C0/5B37:	E6DC    	INC $DC
C0/5B39:	E6DC    	INC $DC
C0/5B3B:	C6DE    	DEC $DE
C0/5B3D:	F003    	BEQ $5B42
C0/5B3F:	4CEB5A  	JMP $5AEB

C0/5B42:	203859  	JSR $5938
C0/5B45:	7B      	TDC 
C0/5B46:	48      	PHA
C0/5B47:	AB      	PLB
C0/5B48:	60      	RTS
 
C0/5B49:	FEFBEF  	INC $EFFB,X
C0/5B4C:	BF010410	LDA $100401,X
C0/5B50:	40      	RTI
 
C0/5B51:	0000    	BRK #$00
C0/5B53:	F600    	INC $00,X
C0/5B55:	EC01E2  	CPX $E201
C0/5B58:	02D8    	COP #$D8
C0/5B5A:	0300    	ORA $00,S
C0/5B5C:	0004    	BRK #$04
C0/5B5E:	0008    	BRK #$08
C0/5B60:	000C    	BRK #$0C
C0/5B62:	0020    	BRK #$20
C0/5B64:	0024    	BRK #$24
C0/5B66:	0028    	BRK #$28
C0/5B68:	002C    	BRK #$2C
C0/5B6A:	0040    	BRK #$40
C0/5B6C:	0044    	BRK #$44
C0/5B6E:	0048    	BRK #$48
C0/5B70:	004C    	BRK #$4C
C0/5B72:	0060    	BRK #$60
C0/5B74:	0064    	BRK #$64
C0/5B76:	0068    	BRK #$68
C0/5B78:	006C    	BRK #$6C
C0/5B7A:	0080    	BRK #$80
C0/5B7C:	0084    	BRK #$84
C0/5B7E:	0088    	BRK #$88
C0/5B80:	008C    	BRK #$8C
C0/5B82:	00A0    	BRK #$A0
C0/5B84:	00A4    	BRK #$A4
C0/5B86:	00A8    	BRK #$A8
C0/5B88:	00AC    	BRK #$AC
C0/5B8A:	00B9    	BRK #$B9
C0/5B8C:	7C0830  	JMP ($3008,X)
C0/5B8F:	30C2    	BMI $5B53
C0/5B91:	21B9    	AND ($B9,X)
C0/5B93:	6D08E5  	ADC $E508
C0/5B96:	60      	RTS
 
C0/5B97:	38      	SEC 
C0/5B98:	E57F    	SBC $7F
C0/5B9A:	38      	SEC 
C0/5B9B:	F96F08  	SBC $086F,Y
C0/5B9E:	8524    	STA $24
C0/5BA0:	38      	SEC 
C0/5BA1:	E91000    	SBC #$0010
C0/5BA4:	8522    	STA $22
C0/5BA6:	18      	CLC
C0/5BA7:	692000  	ADC #$0020
C0/5BAA:	8526    	STA $26
C0/5BAC:	B96A08  	LDA $086A,Y
C0/5BAF:	38      	SEC 
C0/5BB0:	E55C    	SBC $5C
C0/5BB2:	18      	CLC
C0/5BB3:	690800    	ADC #$0008
C0/5BB6:	851E    	STA $1E
C0/5BB8:	18      	CLC
C0/5BB9:	690800  	ADC #$0008
C0/5BBC:	E220    	SEP #$20
C0/5BBE:	802E    	BRA $5BEE
C0/5BC0:	C221    	REP #$21
C0/5BC2:	B96D08  	LDA $086D,Y
C0/5BC5:	E568    	SBC $68
C0/5BC7:	38      	SEC 
C0/5BC8:	E57F    	SBC $7F
C0/5BCA:	38      	SEC 
C0/5BCB:	F96F08  	SBC $086F,Y
C0/5BCE:	8524    	STA $24
C0/5BD0:	38      	SEC 
C0/5BD1:	E91000  	SBC #$0010
C0/5BD4:	8522    	STA $22
C0/5BD6:	18      	CLC
C0/5BD7:	692000  	ADC #$0020
C0/5BDA:	8526    	STA $26
C0/5BDC:	B96A08  	LDA $086A,Y
C0/5BDF:	38      	SEC 
C0/5BE0:	E564    	SBC $64
C0/5BE2:	18      	CLC
C0/5BE3:	690800  	ADC #$0008
C0/5BE6:	851E    	STA $1E
C0/5BE8:	18      	CLC
C0/5BE9:	690800  	ADC #$0008
C0/5BEC:	E220    	SEP #$20      (8 bit accum./memory)
C0/5BEE:	EB      	XBA
C0/5BEF:	F003    	BEQ $5BF4
C0/5BF1:	4C345B  	JMP $5B34

C0/5BF4:	A527    	LDA $27
C0/5BF6:	F003    	BEQ $5BFB
C0/5BF8:	4C345B  	JMP $5B34

C0/5BFB:	7B      	TDC 
C0/5BFC:	B97608  	LDA $0876,Y
C0/5BFF:	AA      	TAX
C0/5C00:	BF3ACDC0	LDA $C0CD3A,X
C0/5C04:	198008  	ORA $0880,Y
C0/5C07:	851B    	STA $1B
C0/5C09:	BFBACDC0	LDA $C0CDBA,X
C0/5C0D:	198108  	ORA $0881,Y
C0/5C10:	851D    	STA $1D
C0/5C12:	B98F08  	LDA $088F,Y
C0/5C15:	AA      	TAX
C0/5C16:	BF5B5BC0	LDA $C05B5B,X
C0/5C1A:	851A    	STA $1A
C0/5C1C:	1A      	INC A
C0/5C1D:	1A      	INC A
C0/5C1E:	851C    	STA $1C
C0/5C20:	B98C08  	LDA $088C,Y
C0/5C23:	29C0    	AND #$C0
C0/5C25:	F00A    	BEQ $5C31
C0/5C27:	C940    	CMP #$40
C0/5C29:	D003    	BNE $5C2E
C0/5C2B:	4C935C  	JMP $5C93

C0/5C2E:	4CF55C  	JMP $5CF5

C0/5C31:	C220    	REP #$20      (16 bit accum./memory)
C0/5C33:	A5D4    	LDA $D4
C0/5C35:	38      	SEC 
C0/5C36:	E90400  	SBC #$0004
C0/5C39:	85D4    	STA $D4
C0/5C3B:	A8      	TAY
C0/5C3C:	A51A    	LDA $1A
C0/5C3E:	994203  	STA $0342,Y
C0/5C41:	A51C    	LDA $1C
C0/5C43:	990204  	STA $0402,Y
C0/5C46:	7B      	TDC 
C0/5C47:	E220    	SEP #$20      (8 bit accum./memory)
C0/5C49:	A51E    	LDA $1E
C0/5C4B:	994003  	STA $0340,Y
C0/5C4E:	990004  	STA $0400,Y
C0/5C51:	A522    	LDA $22
C0/5C53:	994103  	STA $0341,Y
C0/5C56:	A524    	LDA $24
C0/5C58:	990104  	STA $0401,Y
C0/5C5B:	B90078  	LDA $7800,Y
C0/5C5E:	AA      	TAX
C0/5C5F:	A51F    	LDA $1F
C0/5C61:	4A      	LSR A
C0/5C62:	B014    	BCS $5C78
C0/5C64:	BD0405  	LDA $0504,X
C0/5C67:	390079  	AND $7900,Y
C0/5C6A:	9D0405  	STA $0504,X
C0/5C6D:	BD1005  	LDA $0510,X
C0/5C70:	390079  	AND $7900,Y
C0/5C73:	9D1005  	STA $0510,X
C0/5C76:	8018    	BRA $5C90
C0/5C78:	BD0405  	LDA $0504,X
C0/5C7B:	390079  	AND $7900,Y
C0/5C7E:	19007A  	ORA $7A00,Y
C0/5C81:	9D0405  	STA $0504,X
C0/5C84:	BD1005  	LDA $0510,X
C0/5C87:	390079  	AND $7900,Y
C0/5C8A:	19007A  	ORA $7A00,Y
C0/5C8D:	9D1005  	STA $0510,X
C0/5C90:	4C345B  	JMP $5B34

C0/5C93:	C220    	REP #$20      (16 bit accum./memory)
C0/5C95:	A5D6    	LDA $D6
C0/5C97:	38      	SEC 
C0/5C98:	E90400  	SBC #$0004
C0/5C9B:	85D6    	STA $D6
C0/5C9D:	A8      	TAY
C0/5C9E:	A51A    	LDA $1A
C0/5CA0:	990203  	STA $0302,Y
C0/5CA3:	A51C    	LDA $1C
C0/5CA5:	992203  	STA $0322,Y
C0/5CA8:	7B      	TDC 
C0/5CA9:	E220    	SEP #$20      (8 bit accum./memory)
C0/5CAB:	A51E    	LDA $1E
C0/5CAD:	990003  	STA $0300,Y
C0/5CB0:	992003  	STA $0320,Y
C0/5CB3:	A522    	LDA $22
C0/5CB5:	990103  	STA $0301,Y
C0/5CB8:	A524    	LDA $24
C0/5CBA:	992103  	STA $0321,Y
C0/5CBD:	B90078  	LDA $7800,Y
C0/5CC0:	AA      	TAX
C0/5CC1:	A51F    	LDA $1F
C0/5CC3:	4A      	LSR A
C0/5CC4:	B014    	BCS $5CDA
C0/5CC6:	BD0005  	LDA $0500,X
C0/5CC9:	390079  	AND $7900,Y
C0/5CCC:	9D0005  	STA $0500,X
C0/5CCF:	BD0205  	LDA $0502,X
C0/5CD2:	390079  	AND $7900,Y
C0/5CD5:	9D0205  	STA $0502,X
C0/5CD8:	8018    	BRA $5CF2
C0/5CDA:	BD0005  	LDA $0500,X
C0/5CDD:	390079  	AND $7900,Y
C0/5CE0:	19007A  	ORA $7A00,Y
C0/5CE3:	9D0005  	STA $0500,X
C0/5CE6:	BD0205  	LDA $0502,X
C0/5CE9:	390079  	AND $7900,Y
C0/5CEC:	19007A  	ORA $7A00,Y
C0/5CEF:	9D0205  	STA $0502,X
C0/5CF2:	4C345B  	JMP $5B34

C0/5CF5:	C220    	REP #$20      (16 bit accum./memory)
C0/5CF7:	A5D8    	LDA $D8
C0/5CF9:	38      	SEC 
C0/5CFA:	E90400  	SBC #$0004
C0/5CFD:	85D8    	STA $D8
C0/5CFF:	A8      	TAY
C0/5D00:	A51A    	LDA $1A
C0/5D02:	99C204  	STA $04C2,Y
C0/5D05:	A51C    	LDA $1C
C0/5D07:	99E204  	STA $04E2,Y
C0/5D0A:	7B      	TDC 
C0/5D0B:	E220    	SEP #$20      (8 bit accum./memory)
C0/5D0D:	A51E    	LDA $1E
C0/5D0F:	99C004  	STA $04C0,Y
C0/5D12:	99E004  	STA $04E0,Y
C0/5D15:	A522    	LDA $22
C0/5D17:	99C104  	STA $04C1,Y
C0/5D1A:	A524    	LDA $24
C0/5D1C:	99E104  	STA $04E1,Y
C0/5D1F:	B90078  	LDA $7800,Y
C0/5D22:	AA      	TAX
C0/5D23:	A51F    	LDA $1F
C0/5D25:	4A      	LSR A
C0/5D26:	B014    	BCS $5D3C
C0/5D28:	BD1C05  	LDA $051C,X
C0/5D2B:	390079  	AND $7900,Y
C0/5D2E:	9D1C05  	STA $051C,X
C0/5D31:	BD1E05  	LDA $051E,X
C0/5D34:	390079  	AND $7900,Y
C0/5D37:	9D1E05  	STA $051E,X
C0/5D3A:	8018    	BRA $5D54
C0/5D3C:	BD1C05  	LDA $051C,X
C0/5D3F:	390079  	AND $7900,Y
C0/5D42:	19007A  	ORA $7A00,Y
C0/5D45:	9D1C05  	STA $051C,X
C0/5D48:	BD1E05  	LDA $051E,X
C0/5D4B:	390079  	AND $7900,Y
C0/5D4E:	19007A  	ORA $7A00,Y
C0/5D51:	9D1E05  	STA $051E,X
C0/5D54:	4C345B  	JMP $5B34

C0/5D57:	B98F08  	LDA $088F,Y
C0/5D5A:	AA      	TAX
C0/5D5B:	BF5B5BC0	LDA $C05B5B,X
C0/5D5F:	851A    	STA $1A
C0/5D61:	C220    	REP #$20      (16 bit accum./memory)
C0/5D63:	B96A08  	LDA $086A,Y
C0/5D66:	38      	SEC 
C0/5D67:	E55C    	SBC $5C
C0/5D69:	851E    	STA $1E
C0/5D6B:	18      	CLC
C0/5D6C:	691000  	ADC #$0010
C0/5D6F:	8520    	STA $20
C0/5D71:	B96D08  	LDA $086D,Y
C0/5D74:	18      	CLC
C0/5D75:	E560    	SBC $60
C0/5D77:	38      	SEC 
C0/5D78:	E57F    	SBC $7F
C0/5D7A:	38      	SEC 
C0/5D7B:	E90800  	SBC #$0008
C0/5D7E:	8526    	STA $26
C0/5D80:	E91000  	SBC #$0010
C0/5D83:	8524    	STA $24
C0/5D85:	E90600  	SBC #$0006
C0/5D88:	8522    	STA $22
C0/5D8A:	18      	CLC
C0/5D8B:	691E00  	ADC #$001E
C0/5D8E:	E220    	SEP #$20      (8 bit accum./memory)
C0/5D90:	EB      	XBA
C0/5D91:	F003    	BEQ $5D96
C0/5D93:	4C345B  	JMP $5B34

C0/5D96:	7B      	TDC 
C0/5D97:	A41E    	LDY $1E
C0/5D99:	C02001  	CPY #$0120
C0/5D9C:	9008    	BCC $5DA6
C0/5D9E:	C0E0FF  	CPY #$FFE0
C0/5DA1:	B003    	BCS $5DA6
C0/5DA3:	4C345B  	JMP $5B34

C0/5DA6:	C220    	REP #$20      (16 bit accum./memory)
C0/5DA8:	A5D4    	LDA $D4
C0/5DAA:	38      	SEC 
C0/5DAB:	E90C00  	SBC #$000C
C0/5DAE:	85D4    	STA $D4
C0/5DB0:	7B      	TDC 
C0/5DB1:	E220    	SEP #$20      (8 bit accum./memory)
C0/5DB3:	A4D4    	LDY $D4
C0/5DB5:	C220    	REP #$20      (16 bit accum./memory)
C0/5DB7:	A51E    	LDA $1E
C0/5DB9:	18      	CLC
C0/5DBA:	690800  	ADC #$0008
C0/5DBD:	852A    	STA $2A
C0/5DBF:	7B      	TDC 
C0/5DC0:	E220    	SEP #$20      (8 bit accum./memory)
C0/5DC2:	A52A    	LDA $2A
C0/5DC4:	994003  	STA $0340,Y
C0/5DC7:	202167  	JSR $6721
C0/5DCA:	C8      	INY 
C0/5DCB:	C8      	INY 
C0/5DCC:	C8      	INY 
C0/5DCD:	C8      	INY 
C0/5DCE:	C220    	REP #$20      (16 bit accum./memory)
C0/5DD0:	A51E    	LDA $1E
C0/5DD2:	852A    	STA $2A
C0/5DD4:	7B      	TDC 
C0/5DD5:	E220    	SEP #$20      (8 bit accum./memory)
C0/5DD7:	A52A    	LDA $2A
C0/5DD9:	994003  	STA $0340,Y
C0/5DDC:	202167  	JSR $6721
C0/5DDF:	C8      	INY 
C0/5DE0:	C8      	INY 
C0/5DE1:	C8      	INY 
C0/5DE2:	C8      	INY 
C0/5DE3:	C220    	REP #$20      (16 bit accum./memory)
C0/5DE5:	A520    	LDA $20
C0/5DE7:	852A    	STA $2A
C0/5DE9:	7B      	TDC 
C0/5DEA:	E220    	SEP #$20      (8 bit accum./memory)
C0/5DEC:	A52A    	LDA $2A
C0/5DEE:	994003  	STA $0340,Y
C0/5DF1:	202167  	JSR $6721
C0/5DF4:	A4D4    	LDY $D4
C0/5DF6:	C220    	REP #$20      (16 bit accum./memory)
C0/5DF8:	A51E    	LDA $1E
C0/5DFA:	852A    	STA $2A
C0/5DFC:	7B      	TDC 
C0/5DFD:	E220    	SEP #$20      (8 bit accum./memory)
C0/5DFF:	A52A    	LDA $2A
C0/5E01:	990004  	STA $0400,Y
C0/5E04:	204C67  	JSR $674C
C0/5E07:	C8      	INY 
C0/5E08:	C8      	INY 
C0/5E09:	C8      	INY 
C0/5E0A:	C8      	INY 
C0/5E0B:	C220    	REP #$20      (16 bit accum./memory)
C0/5E0D:	A520    	LDA $20
C0/5E0F:	852A    	STA $2A
C0/5E11:	7B      	TDC 
C0/5E12:	E220    	SEP #$20      (8 bit accum./memory)
C0/5E14:	A52A    	LDA $2A
C0/5E16:	990004  	STA $0400,Y
C0/5E19:	204C67  	JSR $674C
C0/5E1C:	A4D4    	LDY $D4
C0/5E1E:	A524    	LDA $24
C0/5E20:	994503  	STA $0345,Y
C0/5E23:	994903  	STA $0349,Y
C0/5E26:	A526    	LDA $26
C0/5E28:	990104  	STA $0401,Y
C0/5E2B:	990504  	STA $0405,Y
C0/5E2E:	A4DA    	LDY $DA
C0/5E30:	B97F08  	LDA $087F,Y
C0/5E33:	C901    	CMP #$01
C0/5E35:	F009    	BEQ $5E40
C0/5E37:	B98108  	LDA $0881,Y
C0/5E3A:	290E    	AND #$0E
C0/5E3C:	0920    	ORA #$20
C0/5E3E:	8007    	BRA $5E47
C0/5E40:	B98108  	LDA $0881,Y
C0/5E43:	290E    	AND #$0E
C0/5E45:	0960    	ORA #$60
C0/5E47:	A4D4    	LDY $D4
C0/5E49:	994303  	STA $0343,Y
C0/5E4C:	A51A    	LDA $1A
C0/5E4E:	994203  	STA $0342,Y
C0/5E51:	A4DA    	LDY $DA
C0/5E53:	B97F08  	LDA $087F,Y
C0/5E56:	0A      	ASL A
C0/5E57:	0A      	ASL A
C0/5E58:	0A      	ASL A
C0/5E59:	851A    	STA $1A
C0/5E5B:	BE7108  	LDX $0871,Y
C0/5E5E:	F005    	BEQ $5E65
C0/5E60:	B96A08  	LDA $086A,Y
C0/5E63:	8003    	BRA $5E68
C0/5E65:	B96D08  	LDA $086D,Y
C0/5E68:	4A      	LSR A
C0/5E69:	4A      	LSR A
C0/5E6A:	851B    	STA $1B
C0/5E6C:	2906    	AND #$06
C0/5E6E:	18      	CLC
C0/5E6F:	651A    	ADC $1A
C0/5E71:	AA      	TAX
C0/5E72:	A4D4    	LDY $D4
C0/5E74:	A51B    	LDA $1B
C0/5E76:	4A      	LSR A
C0/5E77:	2901    	AND #$01
C0/5E79:	18      	CLC
C0/5E7A:	6522    	ADC $22
C0/5E7C:	994103  	STA $0341,Y
C0/5E7F:	C220    	REP #$20      (16 bit accum./memory)
C0/5E81:	BFB65EC0	LDA $C05EB6,X
C0/5E85:	994603  	STA $0346,Y
C0/5E88:	BFD65EC0	LDA $C05ED6,X
C0/5E8C:	994A03  	STA $034A,Y
C0/5E8F:	BFF65EC0	LDA $C05EF6,X
C0/5E93:	990204  	STA $0402,Y
C0/5E96:	BF165FC0	LDA $C05F16,X
C0/5E9A:	990604  	STA $0406,Y
C0/5E9D:	7B      	TDC 
C0/5E9E:	E220    	SEP #$20      (8 bit accum./memory)
C0/5EA0:	A9EF    	LDA #$EF
C0/5EA2:	990904  	STA $0409,Y
C0/5EA5:	A4DA    	LDY $DA
C0/5EA7:	B96808  	LDA $0868,Y
C0/5EAA:	3007    	BMI $5EB3
C0/5EAC:	A4D4    	LDY $D4
C0/5EAE:	A9EF    	LDA #$EF
C0/5EB0:	994103  	STA $0341,Y
C0/5EB3:	4C345B  	JMP $5B34

C0/5EB6:	AC2FC0  	LDY $C02F
C0/5EB9:	2FAC2FC4	AND $C42FAC
C0/5EBD:	2FCA6FE2	AND $E26FCA
C0/5EC1:	6FCA6FEA	ADC $EA6FCA
C0/5EC5:	6FA02FA4	ADC $A42FA0
C0/5EC9:	2FA02FA8	AND $A82FA0
C0/5ECD:	2FC82FE0	AND $E02FC8
C0/5ED1:	2FC82FE8	AND $E82FC8
C0/5ED5:	2FAC6FC4	AND $C46FAC
C0/5ED9:	6FAC6FC0	ADC $C06FAC
C0/5EDD:	6FC86FE0	ADC $E06FC8
C0/5EE1:	6FC86FE8	ADC $E86FC8
C0/5EE5:	6FA06FA8	ADC $A86FA0
C0/5EE9:	6FA06FA4	ADC $A46FA0
C0/5EED:	6FCA2FE2	ADC $E22FCA
C0/5EF1:	2FCA2FEA	AND $EA2FCA
C0/5EF5:	2FAE2FC2	AND $C22FAE
C0/5EF9:	2FAE2FC6	AND $C62FAE
C0/5EFD:	2FCE6FE6	AND $E66FCE
C0/5F01:	6FCE6FEE	ADC $EE6FCE
C0/5F05:	6FA22FA6	ADC $A62FA2
C0/5F09:	2FA22FAA	AND $AA2FA2
C0/5F0D:	2FCC2FE4	AND $E42FCC
C0/5F11:	2FCC2FEC	AND $EC2FCC
C0/5F15:	2FAE6FC6	AND $C66FAE
C0/5F19:	6FAE6FC2	ADC $C26FAE
C0/5F1D:	6FCC6FE4	ADC $E46FCC
C0/5F21:	6FCC6FEC	ADC $EC6FCC
C0/5F25:	6FA26FAA	ADC $AA6FA2
C0/5F29:	6FA26FA6	ADC $A66FA2
C0/5F2D:	6FCE2FE6	ADC $E62FCE
C0/5F31:	2FCE2FEE	AND $EE2FCE
C0/5F35:	2FB98F08	AND $088FB9
C0/5F39:	AA      	TAX
C0/5F3A:	BF5B5BC0	LDA $C05B5B,X
C0/5F3E:	851A    	STA $1A
C0/5F40:	C220    	REP #$20      (16 bit accum./memory)
C0/5F42:	B96A08  	LDA $086A,Y
C0/5F45:	38      	SEC 
C0/5F46:	E55C    	SBC $5C
C0/5F48:	851E    	STA $1E
C0/5F4A:	18      	CLC
C0/5F4B:	691000  	ADC #$0010
C0/5F4E:	8520    	STA $20
C0/5F50:	B96D08  	LDA $086D,Y
C0/5F53:	18      	CLC
C0/5F54:	E560    	SBC $60
C0/5F56:	38      	SEC 
C0/5F57:	E57F    	SBC $7F
C0/5F59:	38      	SEC 
C0/5F5A:	E90800  	SBC #$0008
C0/5F5D:	8526    	STA $26
C0/5F5F:	E91000  	SBC #$0010
C0/5F62:	8524    	STA $24
C0/5F64:	E90800  	SBC #$0008
C0/5F67:	8522    	STA $22
C0/5F69:	18      	CLC
C0/5F6A:	691E00  	ADC #$001E
C0/5F6D:	E220    	SEP #$20      (8 bit accum./memory)
C0/5F6F:	EB      	XBA
C0/5F70:	F003    	BEQ $5F75
C0/5F72:	4C345B  	JMP $5B34

C0/5F75:	7B      	TDC 
C0/5F76:	A41E    	LDY $1E
C0/5F78:	C02001  	CPY #$0120
C0/5F7B:	9008    	BCC $5F85
C0/5F7D:	C0E0FF  	CPY #$FFE0
C0/5F80:	B003    	BCS $5F85
C0/5F82:	4C345B  	JMP $5B34

C0/5F85:	C220    	REP #$20      (16 bit accum./memory)
C0/5F87:	A5D4    	LDA $D4
C0/5F89:	38      	SEC 
C0/5F8A:	E90C00  	SBC #$000C
C0/5F8D:	85D4    	STA $D4
C0/5F8F:	7B      	TDC 
C0/5F90:	E220    	SEP #$20      (8 bit accum./memory)
C0/5F92:	A4D4    	LDY $D4
C0/5F94:	C220    	REP #$20      (16 bit accum./memory)
C0/5F96:	A51E    	LDA $1E
C0/5F98:	18      	CLC
C0/5F99:	690800  	ADC #$0008
C0/5F9C:	852A    	STA $2A
C0/5F9E:	7B      	TDC 
C0/5F9F:	E220    	SEP #$20      (8 bit accum./memory)
C0/5FA1:	A52A    	LDA $2A
C0/5FA3:	994003  	STA $0340,Y
C0/5FA6:	202167  	JSR $6721
C0/5FA9:	C8      	INY 
C0/5FAA:	C8      	INY 
C0/5FAB:	C8      	INY 
C0/5FAC:	C8      	INY 
C0/5FAD:	C220    	REP #$20      (16 bit accum./memory)
C0/5FAF:	A51E    	LDA $1E
C0/5FB1:	18      	CLC
C0/5FB2:	690800  	ADC #$0008
C0/5FB5:	852A    	STA $2A
C0/5FB7:	7B      	TDC 
C0/5FB8:	E220    	SEP #$20      (8 bit accum./memory)
C0/5FBA:	A52A    	LDA $2A
C0/5FBC:	994003  	STA $0340,Y
C0/5FBF:	202167  	JSR $6721
C0/5FC2:	C8      	INY 
C0/5FC3:	C8      	INY 
C0/5FC4:	C8      	INY 
C0/5FC5:	C8      	INY 
C0/5FC6:	C220    	REP #$20      (16 bit accum./memory)
C0/5FC8:	A51E    	LDA $1E
C0/5FCA:	852A    	STA $2A
C0/5FCC:	7B      	TDC 
C0/5FCD:	E220    	SEP #$20      (8 bit accum./memory)
C0/5FCF:	A52A    	LDA $2A
C0/5FD1:	994003  	STA $0340,Y
C0/5FD4:	202167  	JSR $6721
C0/5FD7:	A4D4    	LDY $D4
C0/5FD9:	C220    	REP #$20      (16 bit accum./memory)
C0/5FDB:	A520    	LDA $20
C0/5FDD:	852A    	STA $2A
C0/5FDF:	7B      	TDC 
C0/5FE0:	E220    	SEP #$20      (8 bit accum./memory)
C0/5FE2:	A52A    	LDA $2A
C0/5FE4:	990004  	STA $0400,Y
C0/5FE7:	204C67  	JSR $674C
C0/5FEA:	C8      	INY 
C0/5FEB:	C8      	INY 
C0/5FEC:	C8      	INY 
C0/5FED:	C8      	INY 
C0/5FEE:	C220    	REP #$20      (16 bit accum./memory)
C0/5FF0:	A51E    	LDA $1E
C0/5FF2:	852A    	STA $2A
C0/5FF4:	7B      	TDC 
C0/5FF5:	E220    	SEP #$20      (8 bit accum./memory)
C0/5FF7:	A52A    	LDA $2A
C0/5FF9:	990004  	STA $0400,Y
C0/5FFC:	204C67  	JSR $674C
C0/5FFF:	C8      	INY 
C0/6000:	C8      	INY 
C0/6001:	C8      	INY 
C0/6002:	C8      	INY 
C0/6003:	C220    	REP #$20      (16 bit accum./memory)
C0/6005:	A520    	LDA $20
C0/6007:	852A    	STA $2A
C0/6009:	7B      	TDC 
C0/600A:	E220    	SEP #$20      (8 bit accum./memory)
C0/600C:	A52A    	LDA $2A
C0/600E:	990004  	STA $0400,Y
C0/6011:	204C67  	JSR $674C
C0/6014:	A4D4    	LDY $D4
C0/6016:	A524    	LDA $24
C0/6018:	994903  	STA $0349,Y
C0/601B:	990104  	STA $0401,Y
C0/601E:	A526    	LDA $26
C0/6020:	990504  	STA $0405,Y
C0/6023:	990904  	STA $0409,Y
C0/6026:	A4DA    	LDY $DA
C0/6028:	B97F08  	LDA $087F,Y
C0/602B:	C901    	CMP #$01
C0/602D:	F009    	BEQ $6038
C0/602F:	B98108  	LDA $0881,Y
C0/6032:	290E    	AND #$0E
C0/6034:	0920    	ORA #$20
C0/6036:	8007    	BRA $603F
C0/6038:	B98108  	LDA $0881,Y
C0/603B:	290E    	AND #$0E
C0/603D:	0960    	ORA #$60
C0/603F:	A4D4    	LDY $D4
C0/6041:	994303  	STA $0343,Y
C0/6044:	994703  	STA $0347,Y
C0/6047:	A51A    	LDA $1A
C0/6049:	994203  	STA $0342,Y
C0/604C:	1A      	INC A
C0/604D:	1A      	INC A
C0/604E:	994603  	STA $0346,Y
C0/6051:	A4DA    	LDY $DA
C0/6053:	B97F08  	LDA $087F,Y
C0/6056:	0A      	ASL A
C0/6057:	AA      	TAX
C0/6058:	A4D4    	LDY $D4
C0/605A:	A522    	LDA $22
C0/605C:	994103  	STA $0341,Y
C0/605F:	18      	CLC
C0/6060:	6910    	ADC #$10
C0/6062:	994503  	STA $0345,Y
C0/6065:	C220    	REP #$20      (16 bit accum./memory)
C0/6067:	BF9A60C0	LDA $C0609A,X
C0/606B:	994A03  	STA $034A,Y
C0/606E:	BFA260C0	LDA $C060A2,X
C0/6072:	990204  	STA $0402,Y
C0/6075:	BFAA60C0	LDA $C060AA,X
C0/6079:	990604  	STA $0406,Y
C0/607C:	BFB260C0	LDA $C060B2,X
C0/6080:	990A04  	STA $040A,Y
C0/6083:	7B      	TDC 
C0/6084:	E220    	SEP #$20      (8 bit accum./memory)
C0/6086:	A4DA    	LDY $DA
C0/6088:	B96808  	LDA $0868,Y
C0/608B:	300A    	BMI $6097
C0/608D:	A4D4    	LDY $D4
C0/608F:	A9EF    	LDA #$EF
C0/6091:	994103  	STA $0341,Y
C0/6094:	994503  	STA $0345,Y
C0/6097:	4C345B  	JMP $5B34

C0/609A:	202F28  	JSR $282F
C0/609D:	2F202F28	AND $282F20
C0/60A1:	2F242F2C	AND $2C2F24
C0/60A5:	2F242F2C	AND $2C2F24
C0/60A9:	2F222F2A	AND $2A2F22
C0/60AD:	2F222F2A	AND $2A2F22
C0/60B1:	2F262F2E	AND $2E2F26
C0/60B5:	2F262F2E	AND $2E2F26
C0/60B9:	2FB98F08	AND $088FB9
C0/60BD:	AA      	TAX
C0/60BE:	BF5B5BC0	LDA $C05B5B,X
C0/60C2:	851A    	STA $1A
C0/60C4:	1A      	INC A
C0/60C5:	1A      	INC A
C0/60C6:	851C    	STA $1C
C0/60C8:	BE7108  	LDX $0871,Y
C0/60CB:	F005    	BEQ $60D2
C0/60CD:	B96A08  	LDA $086A,Y
C0/60D0:	8003    	BRA $60D5
C0/60D2:	B96D08  	LDA $086D,Y
C0/60D5:	4A      	LSR A
C0/60D6:	4A      	LSR A
C0/60D7:	2906    	AND #$06
C0/60D9:	AA      	TAX
C0/60DA:	C220    	REP #$20      (16 bit accum./memory)
C0/60DC:	B96A08  	LDA $086A,Y
C0/60DF:	38      	SEC 
C0/60E0:	E55C    	SBC $5C
C0/60E2:	8520    	STA $20
C0/60E4:	18      	CLC
C0/60E5:	690800  	ADC #$0008
C0/60E8:	851E    	STA $1E
C0/60EA:	B96D08  	LDA $086D,Y
C0/60ED:	18      	CLC
C0/60EE:	E560    	SBC $60
C0/60F0:	38      	SEC 
C0/60F1:	E57F    	SBC $7F
C0/60F3:	38      	SEC 
C0/60F4:	E90800  	SBC #$0008
C0/60F7:	8526    	STA $26
C0/60F9:	E91000  	SBC #$0010
C0/60FC:	8524    	STA $24
C0/60FE:	E90400  	SBC #$0004
C0/6101:	8522    	STA $22
C0/6103:	18      	CLC
C0/6104:	691C00  	ADC #$001C
C0/6107:	E220    	SEP #$20      (8 bit accum./memory)
C0/6109:	EB      	XBA
C0/610A:	F003    	BEQ $610F
C0/610C:	4C345B  	JMP $5B34

C0/610F:	7B      	TDC 
C0/6110:	A41E    	LDY $1E
C0/6112:	C02001  	CPY #$0120
C0/6115:	9008    	BCC $611F
C0/6117:	C0E0FF  	CPY #$FFE0
C0/611A:	B003    	BCS $611F
C0/611C:	4C345B  	JMP $5B34

C0/611F:	C220    	REP #$20      (16 bit accum./memory)
C0/6121:	A5D4    	LDA $D4
C0/6123:	38      	SEC 
C0/6124:	E90C00  	SBC #$000C
C0/6127:	85D4    	STA $D4
C0/6129:	7B      	TDC 
C0/612A:	E220    	SEP #$20      (8 bit accum./memory)
C0/612C:	A4DA    	LDY $DA
C0/612E:	B97F08  	LDA $087F,Y
C0/6131:	F00F    	BEQ $6142
C0/6133:	3A      	DEC A
C0/6134:	D003    	BNE $6139
C0/6136:	4CF162  	JMP $62F1

C0/6139:	3A      	DEC A
C0/613A:	D003    	BNE $613F
C0/613C:	4C1862  	JMP $6218

C0/613F:	4CED63  	JMP $63ED

C0/6142:	A41E    	LDY $1E
C0/6144:	842A    	STY $2A
C0/6146:	A4D4    	LDY $D4
C0/6148:	204C67  	JSR $674C
C0/614B:	C8      	INY 
C0/614C:	C8      	INY 
C0/614D:	C8      	INY 
C0/614E:	C8      	INY 
C0/614F:	202167  	JSR $6721
C0/6152:	C8      	INY 
C0/6153:	C8      	INY 
C0/6154:	C8      	INY 
C0/6155:	C8      	INY 
C0/6156:	202167  	JSR $6721
C0/6159:	A4D4    	LDY $D4
C0/615B:	C220    	REP #$20      (16 bit accum./memory)
C0/615D:	A51E    	LDA $1E
C0/615F:	18      	CLC
C0/6160:	7FE061C0	ADC $C061E0,X
C0/6164:	852A    	STA $2A
C0/6166:	E220    	SEP #$20      (8 bit accum./memory)
C0/6168:	994003  	STA $0340,Y
C0/616B:	7B      	TDC 
C0/616C:	202167  	JSR $6721
C0/616F:	A524    	LDA $24
C0/6171:	18      	CLC
C0/6172:	7FE861C0	ADC $C061E8,X
C0/6176:	994103  	STA $0341,Y
C0/6179:	C220    	REP #$20      (16 bit accum./memory)
C0/617B:	BFF861C0	LDA $C061F8,X
C0/617F:	994203  	STA $0342,Y
C0/6182:	BF0862C0	LDA $C06208,X
C0/6186:	994A03  	STA $034A,Y
C0/6189:	BF1062C0	LDA $C06210,X
C0/618D:	990204  	STA $0402,Y
C0/6190:	7B      	TDC 
C0/6191:	E220    	SEP #$20      (8 bit accum./memory)
C0/6193:	A4DA    	LDY $DA
C0/6195:	B98108  	LDA $0881,Y
C0/6198:	290E    	AND #$0E
C0/619A:	1F0162C0	ORA $C06201,X
C0/619E:	A4D4    	LDY $D4
C0/61A0:	994703  	STA $0347,Y
C0/61A3:	A51A    	LDA $1A
C0/61A5:	994603  	STA $0346,Y
C0/61A8:	A51E    	LDA $1E
C0/61AA:	994403  	STA $0344,Y
C0/61AD:	994803  	STA $0348,Y
C0/61B0:	990004  	STA $0400,Y
C0/61B3:	A522    	LDA $22
C0/61B5:	18      	CLC
C0/61B6:	7FF061C0	ADC $C061F0,X
C0/61BA:	994503  	STA $0345,Y
C0/61BD:	A524    	LDA $24
C0/61BF:	994903  	STA $0349,Y
C0/61C2:	A526    	LDA $26
C0/61C4:	990104  	STA $0401,Y
C0/61C7:	A9EF    	LDA #$EF
C0/61C9:	990504  	STA $0405,Y
C0/61CC:	990904  	STA $0409,Y
C0/61CF:	A4DA    	LDY $DA
C0/61D1:	B96808  	LDA $0868,Y
C0/61D4:	3007    	BMI $61DD
C0/61D6:	A4D4    	LDY $D4
C0/61D8:	A9EF    	LDA #$EF
C0/61DA:	994503  	STA $0345,Y
C0/61DD:	4CCA64  	JMP $64CA

C0/61E0:	0000    	BRK #$00
C0/61E2:	0100    	ORA ($00,X)
C0/61E4:	0000    	BRK #$00
C0/61E6:	FFFF0900	SBC $0009FF,X
C0/61EA:	0A      	ASL A
C0/61EB:	0009    	BRK #$09
C0/61ED:	000A    	BRK #$0A
C0/61EF:	0000    	BRK #$00
C0/61F1:	0001    	BRK #$01
C0/61F3:	0000    	BRK #$00
C0/61F5:	0001    	BRK #$01
C0/61F7:	004A    	BRK #$4A
C0/61F9:	2F4A6F4A	AND $4A6F4A
C0/61FD:	2F4A6F00	AND $006F4A
C0/6201:	200020  	JSR $2000
C0/6204:	0020    	BRK #$20
C0/6206:	0020    	BRK #$20
C0/6208:	4C2F60  	JMP $602F

C0/620B:	2F4C2F60	AND $602F4C
C0/620F:	6F4E2F62	ADC $622F4E
C0/6213:	2F4E2F62	AND $622F4E
C0/6217:	6FA41E84	ADC $841EA4
C0/621B:	2A      	ROL A
C0/621C:	A4D4    	LDY $D4
C0/621E:	202167  	JSR $6721
C0/6221:	204C67  	JSR $674C
C0/6224:	C8      	INY 
C0/6225:	C8      	INY 
C0/6226:	C8      	INY 
C0/6227:	C8      	INY 
C0/6228:	202167  	JSR $6721
C0/622B:	C8      	INY 
C0/622C:	C8      	INY 
C0/622D:	C8      	INY 
C0/622E:	C8      	INY 
C0/622F:	202167  	JSR $6721
C0/6232:	A4D4    	LDY $D4
C0/6234:	C220    	REP #$20      (16 bit accum./memory)
C0/6236:	A51E    	LDA $1E
C0/6238:	18      	CLC
C0/6239:	7FB962C0	ADC $C062B9,X
C0/623D:	852A    	STA $2A
C0/623F:	E220    	SEP #$20      (8 bit accum./memory)
C0/6241:	994003  	STA $0340,Y
C0/6244:	7B      	TDC 
C0/6245:	202167  	JSR $6721
C0/6248:	A524    	LDA $24
C0/624A:	18      	CLC
C0/624B:	7FC162C0	ADC $C062C1,X
C0/624F:	994103  	STA $0341,Y
C0/6252:	C220    	REP #$20      (16 bit accum./memory)
C0/6254:	BFD162C0	LDA $C062D1,X
C0/6258:	994203  	STA $0342,Y
C0/625B:	BFE162C0	LDA $C062E1,X
C0/625F:	994A03  	STA $034A,Y
C0/6262:	BFE962C0	LDA $C062E9,X
C0/6266:	990204  	STA $0402,Y
C0/6269:	7B      	TDC 
C0/626A:	E220    	SEP #$20      (8 bit accum./memory)
C0/626C:	A4DA    	LDY $DA
C0/626E:	B98108  	LDA $0881,Y
C0/6271:	290E    	AND #$0E
C0/6273:	1FDA62C0	ORA $C062DA,X
C0/6277:	A4D4    	LDY $D4
C0/6279:	994703  	STA $0347,Y
C0/627C:	A51A    	LDA $1A
C0/627E:	994603  	STA $0346,Y
C0/6281:	A51E    	LDA $1E
C0/6283:	994403  	STA $0344,Y
C0/6286:	994803  	STA $0348,Y
C0/6289:	990004  	STA $0400,Y
C0/628C:	A522    	LDA $22
C0/628E:	18      	CLC
C0/628F:	7FC962C0	ADC $C062C9,X
C0/6293:	994503  	STA $0345,Y
C0/6296:	A524    	LDA $24
C0/6298:	994903  	STA $0349,Y
C0/629B:	A526    	LDA $26
C0/629D:	990104  	STA $0401,Y
C0/62A0:	A9EF    	LDA #$EF
C0/62A2:	990504  	STA $0405,Y
C0/62A5:	990904  	STA $0409,Y
C0/62A8:	A4DA    	LDY $DA
C0/62AA:	B96808  	LDA $0868,Y
C0/62AD:	3007    	BMI $62B6
C0/62AF:	A4D4    	LDY $D4
C0/62B1:	A9EF    	LDA #$EF
C0/62B3:	994503  	STA $0345,Y
C0/62B6:	4CCA64  	JMP $64CA

C0/62B9:	0000    	BRK #$00
C0/62BB:	0100    	ORA ($00,X)
C0/62BD:	0000    	BRK #$00
C0/62BF:	FFFF0700	SBC $0007FF,X
C0/62C3:	08      	PHP 
C0/62C4:	0007    	BRK #$07
C0/62C6:	0008    	BRK #$08
C0/62C8:	00FF    	BRK #$FF
C0/62CA:	FF0100FF	SBC $FF0001,X
C0/62CE:	FF010040	SBC $400001,X
C0/62D2:	2F402F40	AND $402F40
C0/62D6:	2F402F00	AND $002F40
C0/62DA:	200020  	JSR $2000
C0/62DD:	0020    	BRK #$20
C0/62DF:	0020    	BRK #$20
C0/62E1:	422F    	WDM #$2F
C0/62E3:	462F    	LSR $2F
C0/62E5:	422F    	WDM #$2F
C0/62E7:	466F    	LSR $6F
C0/62E9:	442F48  	MVP $2F,$48
C0/62EC:	2F442F48	AND $482F44
C0/62F0:	6FA4D4C2	ADC $C2D4A4
C0/62F4:	20A51E  	JSR $1EA5
C0/62F7:	38      	SEC 
C0/62F8:	E903    	SBC #$03
C0/62FA:	0085    	BRK #$85
C0/62FC:	2A      	ROL A
C0/62FD:	7B      	TDC 
C0/62FE:	E220    	SEP #$20      (8 bit accum./memory)
C0/6300:	A52A    	LDA $2A
C0/6302:	994003  	STA $0340,Y
C0/6305:	202167  	JSR $6721
C0/6308:	C8      	INY 
C0/6309:	C8      	INY 
C0/630A:	C8      	INY 
C0/630B:	C8      	INY 
C0/630C:	994003  	STA $0340,Y
C0/630F:	202167  	JSR $6721
C0/6312:	C8      	INY 
C0/6313:	C8      	INY 
C0/6314:	C8      	INY 
C0/6315:	C8      	INY 
C0/6316:	C220    	REP #$20      (16 bit accum./memory)
C0/6318:	A520    	LDA $20
C0/631A:	18      	CLC
C0/631B:	691000  	ADC #$0010
C0/631E:	852A    	STA $2A
C0/6320:	7B      	TDC 
C0/6321:	E220    	SEP #$20      (8 bit accum./memory)
C0/6323:	A52A    	LDA $2A
C0/6325:	994003  	STA $0340,Y
C0/6328:	202167  	JSR $6721
C0/632B:	A4D4    	LDY $D4
C0/632D:	990004  	STA $0400,Y
C0/6330:	204C67  	JSR $674C
C0/6333:	C8      	INY 
C0/6334:	C8      	INY 
C0/6335:	C8      	INY 
C0/6336:	C8      	INY 
C0/6337:	C220    	REP #$20      (16 bit accum./memory)
C0/6339:	A520    	LDA $20
C0/633B:	852A    	STA $2A
C0/633D:	7B      	TDC 
C0/633E:	E220    	SEP #$20      (8 bit accum./memory)
C0/6340:	A52A    	LDA $2A
C0/6342:	990004  	STA $0400,Y
C0/6345:	204C67  	JSR $674C
C0/6348:	C8      	INY 
C0/6349:	C8      	INY 
C0/634A:	C8      	INY 
C0/634B:	C8      	INY 
C0/634C:	990004  	STA $0400,Y
C0/634F:	204C67  	JSR $674C
C0/6352:	A4D4    	LDY $D4
C0/6354:	A522    	LDA $22
C0/6356:	18      	CLC
C0/6357:	7FC563C0	ADC $C063C5,X
C0/635B:	994103  	STA $0341,Y
C0/635E:	18      	CLC
C0/635F:	6910    	ADC #$10
C0/6361:	994503  	STA $0345,Y
C0/6364:	A4DA    	LDY $DA
C0/6366:	B98108  	LDA $0881,Y
C0/6369:	290E    	AND #$0E
C0/636B:	0960    	ORA #$60
C0/636D:	A4D4    	LDY $D4
C0/636F:	994303  	STA $0343,Y
C0/6372:	994703  	STA $0347,Y
C0/6375:	A51A    	LDA $1A
C0/6377:	994203  	STA $0342,Y
C0/637A:	A51C    	LDA $1C
C0/637C:	994603  	STA $0346,Y
C0/637F:	A524    	LDA $24
C0/6381:	994903  	STA $0349,Y
C0/6384:	990904  	STA $0409,Y
C0/6387:	18      	CLC
C0/6388:	6910    	ADC #$10
C0/638A:	990104  	STA $0401,Y
C0/638D:	990504  	STA $0405,Y
C0/6390:	C220    	REP #$20      (16 bit accum./memory)
C0/6392:	BFCD63C0	LDA $C063CD,X
C0/6396:	994A03  	STA $034A,Y
C0/6399:	BFD563C0	LDA $C063D5,X
C0/639D:	990A04  	STA $040A,Y
C0/63A0:	BFDD63C0	LDA $C063DD,X
C0/63A4:	990204  	STA $0402,Y
C0/63A7:	BFE563C0	LDA $C063E5,X
C0/63AB:	990604  	STA $0406,Y
C0/63AE:	7B      	TDC 
C0/63AF:	E220    	SEP #$20      (8 bit accum./memory)
C0/63B1:	A4DA    	LDY $DA
C0/63B3:	B96808  	LDA $0868,Y
C0/63B6:	300A    	BMI $63C2
C0/63B8:	A4D4    	LDY $D4
C0/63BA:	A9EF    	LDA #$EF
C0/63BC:	994103  	STA $0341,Y
C0/63BF:	994503  	STA $0345,Y
C0/63C2:	4CCA64  	JMP $64CA
C0/63C5:	0000    	BRK #$00
C0/63C7:	FFFF0000	SBC $0000FF,X
C0/63CB:	FFFF646F	SBC $6F64FF,X
C0/63CF:	6C6F64  	JMP ($646F)
C0/63D2:	6F846F68	ADC $686F84
C0/63D6:	6F806F68	ADC $686F80
C0/63DA:	6F886F66	ADC $666F88
C0/63DE:	6F6E6F66	ADC $666F6E
C0/63E2:	6F866F6A	ADC $6A6F86
C0/63E6:	6F826F6A	ADC $6A6F82
C0/63EA:	6F8A6FA4	ADC $A46F8A
C0/63EE:	D4C2    	PEI ($C2)
C0/63F0:	20A51E  	JSR $1EA5
C0/63F3:	18      	CLC
C0/63F4:	6903    	ADC #$03
C0/63F6:	0085    	BRK #$85
C0/63F8:	2A      	ROL A
C0/63F9:	18      	CLC
C0/63FA:	6908    	ADC #$08
C0/63FC:	007B    	BRK #$7B
C0/63FE:	E220    	SEP #$20      (8 bit accum./memory)
C0/6400:	A52A    	LDA $2A
C0/6402:	994003  	STA $0340,Y
C0/6405:	202167  	JSR $6721
C0/6408:	C8      	INY 
C0/6409:	C8      	INY 
C0/640A:	C8      	INY 
C0/640B:	C8      	INY 
C0/640C:	994003  	STA $0340,Y
C0/640F:	202167  	JSR $6721
C0/6412:	C8      	INY 
C0/6413:	C8      	INY 
C0/6414:	C8      	INY 
C0/6415:	C8      	INY 
C0/6416:	C220    	REP #$20      (16 bit accum./memory)
C0/6418:	A520    	LDA $20
C0/641A:	18      	CLC
C0/641B:	691000  	ADC #$0010
C0/641E:	852A    	STA $2A
C0/6420:	18      	CLC
C0/6421:	690800  	ADC #$0008
C0/6424:	7B      	TDC 
C0/6425:	E220    	SEP #$20      (8 bit accum./memory)
C0/6427:	A52A    	LDA $2A
C0/6429:	994003  	STA $0340,Y
C0/642C:	202167  	JSR $6721
C0/642F:	A4D4    	LDY $D4
C0/6431:	990004  	STA $0400,Y
C0/6434:	204C67  	JSR $674C
C0/6437:	C8      	INY 
C0/6438:	C8      	INY 
C0/6439:	C8      	INY 
C0/643A:	C8      	INY 
C0/643B:	C220    	REP #$20      (16 bit accum./memory)
C0/643D:	A520    	LDA $20
C0/643F:	852A    	STA $2A
C0/6441:	18      	CLC
C0/6442:	690800  	ADC #$0008
C0/6445:	7B      	TDC 
C0/6446:	E220    	SEP #$20      (8 bit accum./memory)
C0/6448:	A52A    	LDA $2A
C0/644A:	990004  	STA $0400,Y
C0/644D:	204C67  	JSR $674C
C0/6450:	C8      	INY 
C0/6451:	C8      	INY 
C0/6452:	C8      	INY 
C0/6453:	C8      	INY 
C0/6454:	990004  	STA $0400,Y
C0/6457:	204C67  	JSR $674C
C0/645A:	A4D4    	LDY $D4
C0/645C:	A522    	LDA $22
C0/645E:	18      	CLC
C0/645F:	7FC563C0	ADC $C063C5,X
C0/6463:	994103  	STA $0341,Y
C0/6466:	18      	CLC
C0/6467:	6910    	ADC #$10
C0/6469:	994503  	STA $0345,Y
C0/646C:	A4DA    	LDY $DA
C0/646E:	B98108  	LDA $0881,Y
C0/6471:	290E    	AND #$0E
C0/6473:	0920    	ORA #$20
C0/6475:	A4D4    	LDY $D4
C0/6477:	994303  	STA $0343,Y
C0/647A:	994703  	STA $0347,Y
C0/647D:	A51A    	LDA $1A
C0/647F:	994203  	STA $0342,Y
C0/6482:	A51C    	LDA $1C
C0/6484:	994603  	STA $0346,Y
C0/6487:	A524    	LDA $24
C0/6489:	994903  	STA $0349,Y
C0/648C:	990904  	STA $0409,Y
C0/648F:	18      	CLC
C0/6490:	6910    	ADC #$10
C0/6492:	990104  	STA $0401,Y
C0/6495:	990504  	STA $0405,Y
C0/6498:	C220    	REP #$20      (16 bit accum./memory)
C0/649A:	BFD564C0	LDA $C064D5,X
C0/649E:	994A03  	STA $034A,Y
C0/64A1:	BFCD64C0	LDA $C064CD,X
C0/64A5:	990A04  	STA $040A,Y
C0/64A8:	BFE564C0	LDA $C064E5,X
C0/64AC:	990204  	STA $0402,Y
C0/64AF:	BFDD64C0	LDA $C064DD,X
C0/64B3:	990604  	STA $0406,Y
C0/64B6:	7B      	TDC 
C0/64B7:	E220    	SEP #$20      (8 bit accum./memory)
C0/64B9:	A4DA    	LDY $DA
C0/64BB:	B96808  	LDA $0868,Y
C0/64BE:	300A    	BMI $64CA
C0/64C0:	A4D4    	LDY $D4
C0/64C2:	A9EF    	LDA #$EF
C0/64C4:	994103  	STA $0341,Y
C0/64C7:	994503  	STA $0345,Y
C0/64CA:	4C345B  	JMP $5B34

C0/64CD:	642F    	STZ $2F
C0/64CF:	6C2F64  	JMP ($642F)
C0/64D2:	2F842F68	AND $682F84
C0/64D6:	2F802F68	AND $682F80
C0/64DA:	2F882F66	AND $662F88
C0/64DE:	2F6E2F66	AND $662F6E
C0/64E2:	2F862F6A	AND $6A2F86
C0/64E6:	2F822F6A	AND $6A2F82
C0/64EA:	2F8A2F00	AND $002F8A
C0/64EE:	0010    	BRK #$10
C0/64F0:	0020    	BRK #$20
C0/64F2:	0030    	BRK #$30
C0/64F4:	00A6    	BRK #$A6
C0/64F6:	0086    	BRK #$86
C0/64F8:	2486    	BIT $86
C0/64FA:	20B97C  	JSR $7CB9
C0/64FD:	08      	PHP 
C0/64FE:	851A    	STA $1A
C0/6500:	5A      	PHY
C0/6501:	B98B08  	LDA $088B,Y
C0/6504:	2902    	AND #$02
C0/6506:	F028    	BEQ $6530
C0/6508:	B98B08  	LDA $088B,Y
C0/650B:	2901    	AND #$01
C0/650D:	D00A    	BNE $6519
C0/650F:	B98A08  	LDA $088A,Y
C0/6512:	29E0    	AND #$E0
C0/6514:	4A      	LSR A
C0/6515:	8520    	STA $20
C0/6517:	8008    	BRA $6521
C0/6519:	B98A08  	LDA $088A,Y
C0/651C:	29E0    	AND #$E0
C0/651E:	4A      	LSR A
C0/651F:	8524    	STA $24
C0/6521:	B98A08  	LDA $088A,Y
C0/6524:	291F    	AND #$1F
C0/6526:	18      	CLC
C0/6527:	6910    	ADC #$10
C0/6529:	0A      	ASL A
C0/652A:	AA      	TAX
C0/652B:	BC9907  	LDY $0799,X
C0/652E:	801F    	BRA $654F
C0/6530:	B98B08  	LDA $088B,Y
C0/6533:	2901    	AND #$01
C0/6535:	D00D    	BNE $6544
C0/6537:	B98A08  	LDA $088A,Y
C0/653A:	29E0    	AND #$E0
C0/653C:	4A      	LSR A
C0/653D:	4A      	LSR A
C0/653E:	4A      	LSR A
C0/653F:	4A      	LSR A
C0/6540:	8520    	STA $20
C0/6542:	800B    	BRA $654F
C0/6544:	B98A08  	LDA $088A,Y
C0/6547:	29E0    	AND #$E0
C0/6549:	4A      	LSR A
C0/654A:	4A      	LSR A
C0/654B:	4A      	LSR A
C0/654C:	4A      	LSR A
C0/654D:	8524    	STA $24
C0/654F:	A51A    	LDA $1A
C0/6551:	3031    	BMI $6584
C0/6553:	C221    	REP #$21
C0/6555:	B96D08  	LDA $086D,Y
C0/6558:	6524    	ADC $24
C0/655A:	18      	CLC
C0/655B:	E560    	SBC $60
C0/655D:	38      	SEC 
C0/655E:	E57F    	SBC $7F
C0/6560:	38      	SEC 
C0/6561:	F96F08  	SBC $086F,Y
C0/6564:	38      	SEC 
C0/6565:	E90800  	SBC #$0008
C0/6568:	8522    	STA $22
C0/656A:	18      	CLC
C0/656B:	692000  	ADC #$0020
C0/656E:	8526    	STA $26
C0/6570:	B96A08  	LDA $086A,Y
C0/6573:	38      	SEC 
C0/6574:	E55C    	SBC $5C
C0/6576:	18      	CLC
C0/6577:	6520    	ADC $20
C0/6579:	18      	CLC
C0/657A:	690800  	ADC #$0008
C0/657D:	851E    	STA $1E
C0/657F:	7B      	TDC 
C0/6580:	E220    	SEP #$20      (8 bit accum./memory)
C0/6582:	802F    	BRA $65B3
C0/6584:	C221    	REP #$21
C0/6586:	B96D08  	LDA $086D,Y
C0/6589:	6524    	ADC $24
C0/658B:	18      	CLC
C0/658C:	E568    	SBC $68
C0/658E:	38      	SEC 
C0/658F:	E57F    	SBC $7F
C0/6591:	38      	SEC 
C0/6592:	F96F08  	SBC $086F,Y
C0/6595:	38      	SEC 
C0/6596:	E90800  	SBC #$0008
C0/6599:	8522    	STA $22
C0/659B:	18      	CLC
C0/659C:	692000  	ADC #$0020
C0/659F:	8526    	STA $26
C0/65A1:	B96A08  	LDA $086A,Y
C0/65A4:	38      	SEC 
C0/65A5:	E564    	SBC $64
C0/65A7:	18      	CLC
C0/65A8:	6520    	ADC $20
C0/65AA:	18      	CLC
C0/65AB:	690800  	ADC #$0008
C0/65AE:	851E    	STA $1E
C0/65B0:	7B      	TDC 
C0/65B1:	E220    	SEP #$20      (8 bit accum./memory)
C0/65B3:	7A      	PLY
C0/65B4:	A61E    	LDX $1E
C0/65B6:	E0E0FF  	CPX #$FFE0
C0/65B9:	B008    	BCS $65C3
C0/65BB:	E00001  	CPX #$0100
C0/65BE:	9003    	BCC $65C3
C0/65C0:	4C345B  	JMP $5B34

C0/65C3:	A527    	LDA $27
C0/65C5:	F003    	BEQ $65CA
C0/65C7:	4C345B  	JMP $5B34

C0/65CA:	7B      	TDC 
C0/65CB:	B96808  	LDA $0868,Y
C0/65CE:	2901    	AND #$01
C0/65D0:	4A      	LSR A
C0/65D1:	6A      	ROR A
C0/65D2:	6A      	ROR A
C0/65D3:	0901    	ORA #$01
C0/65D5:	198008  	ORA $0880,Y
C0/65D8:	851B    	STA $1B
C0/65DA:	B96808  	LDA $0868,Y
C0/65DD:	2960    	AND #$60
C0/65DF:	4A      	LSR A
C0/65E0:	4A      	LSR A
C0/65E1:	4A      	LSR A
C0/65E2:	4A      	LSR A
C0/65E3:	4A      	LSR A
C0/65E4:	AA      	TAX
C0/65E5:	A545    	LDA $45
C0/65E7:	4A      	LSR A
C0/65E8:	4A      	LSR A
C0/65E9:	E00000  	CPX #$0000
C0/65EC:	F004    	BEQ $65F2
C0/65EE:	4A      	LSR A
C0/65EF:	CA      	DEX
C0/65F0:	80F7    	BRA $65E9
C0/65F2:	851A    	STA $1A
C0/65F4:	B98C08  	LDA $088C,Y
C0/65F7:	2918    	AND #$18
C0/65F9:	4A      	LSR A
C0/65FA:	4A      	LSR A
C0/65FB:	4A      	LSR A
C0/65FC:	AA      	TAX
C0/65FD:	A51A    	LDA $1A
C0/65FF:	3F1D67C0	AND $C0671D,X
C0/6603:	0A      	ASL A
C0/6604:	851A    	STA $1A
C0/6606:	B97C08  	LDA $087C,Y
C0/6609:	2920    	AND #$20
C0/660B:	F002    	BEQ $660F
C0/660D:	061A    	ASL $1A
C0/660F:	B98908  	LDA $0889,Y
C0/6612:	0A      	ASL A
C0/6613:	18      	CLC
C0/6614:	651A    	ADC $1A
C0/6616:	851A    	STA $1A
C0/6618:	BB      	TYX
C0/6619:	B98C08  	LDA $088C,Y
C0/661C:	29C0    	AND #$C0
C0/661E:	F00A    	BEQ $662A
C0/6620:	C940    	CMP #$40
C0/6622:	D003    	BNE $6627
C0/6624:	4C7B66  	JMP $667B

C0/6627:	4CCC66  	JMP $66CC

C0/662A:	C220    	REP #$20      (16 bit accum./memory)
C0/662C:	A5D4    	LDA $D4
C0/662E:	38      	SEC 
C0/662F:	E90400  	SBC #$0004
C0/6632:	85D4    	STA $D4
C0/6634:	A8      	TAY
C0/6635:	A51A    	LDA $1A
C0/6637:	994203  	STA $0342,Y
C0/663A:	7B      	TDC 
C0/663B:	E220    	SEP #$20      (8 bit accum./memory)
C0/663D:	BD7C08  	LDA $087C,X
C0/6640:	2920    	AND #$20
C0/6642:	F004    	BEQ $6648
C0/6644:	B9007A  	LDA $7A00,Y
C0/6647:	0A      	ASL A
C0/6648:	851C    	STA $1C
C0/664A:	A51E    	LDA $1E
C0/664C:	994003  	STA $0340,Y
C0/664F:	A522    	LDA $22
C0/6651:	994103  	STA $0341,Y
C0/6654:	B90078  	LDA $7800,Y
C0/6657:	AA      	TAX
C0/6658:	A51F    	LDA $1F
C0/665A:	4A      	LSR A
C0/665B:	B00D    	BCS $666A
C0/665D:	BD0405  	LDA $0504,X
C0/6660:	390079  	AND $7900,Y
C0/6663:	051C    	ORA $1C
C0/6665:	9D0405  	STA $0504,X
C0/6668:	800E    	BRA $6678
C0/666A:	BD0405  	LDA $0504,X
C0/666D:	390079  	AND $7900,Y
C0/6670:	19007A  	ORA $7A00,Y
C0/6673:	051C    	ORA $1C
C0/6675:	9D0405  	STA $0504,X
C0/6678:	4C345B  	JMP $5B34

C0/667B:	C220    	REP #$20      (16 bit accum./memory)
C0/667D:	A5D6    	LDA $D6
C0/667F:	38      	SEC 
C0/6680:	E90400  	SBC #$0004
C0/6683:	85D6    	STA $D6
C0/6685:	A8      	TAY
C0/6686:	A51A    	LDA $1A
C0/6688:	990203  	STA $0302,Y
C0/668B:	7B      	TDC 
C0/668C:	E220    	SEP #$20      (8 bit accum./memory)
C0/668E:	BD7C08  	LDA $087C,X
C0/6691:	2920    	AND #$20
C0/6693:	F004    	BEQ $6699
C0/6695:	B9007A  	LDA $7A00,Y
C0/6698:	0A      	ASL A
C0/6699:	851C    	STA $1C
C0/669B:	A51E    	LDA $1E
C0/669D:	990003  	STA $0300,Y
C0/66A0:	A522    	LDA $22
C0/66A2:	990103  	STA $0301,Y
C0/66A5:	B90078  	LDA $7800,Y
C0/66A8:	AA      	TAX
C0/66A9:	A51F    	LDA $1F
C0/66AB:	4A      	LSR A
C0/66AC:	B00D    	BCS $66BB
C0/66AE:	BD0005  	LDA $0500,X
C0/66B1:	390079  	AND $7900,Y
C0/66B4:	051C    	ORA $1C
C0/66B6:	9D0005  	STA $0500,X
C0/66B9:	800E    	BRA $66C9
C0/66BB:	BD0005  	LDA $0500,X
C0/66BE:	390079  	AND $7900,Y
C0/66C1:	19007A  	ORA $7A00,Y
C0/66C4:	051C    	ORA $1C
C0/66C6:	9D0005  	STA $0500,X
C0/66C9:	4C345B  	JMP $5B34

C0/66CC:	C220    	REP #$20      (16 bit accum./memory)
C0/66CE:	A5D8    	LDA $D8
C0/66D0:	38      	SEC 
C0/66D1:	E90400  	SBC #$0004
C0/66D4:	85D8    	STA $D8
C0/66D6:	A8      	TAY
C0/66D7:	A51A    	LDA $1A
C0/66D9:	99C204  	STA $04C2,Y
C0/66DC:	7B      	TDC 
C0/66DD:	E220    	SEP #$20      (8 bit accum./memory)
C0/66DF:	BD7C08  	LDA $087C,X
C0/66E2:	2920    	AND #$20
C0/66E4:	F004    	BEQ $66EA
C0/66E6:	B9007A  	LDA $7A00,Y
C0/66E9:	0A      	ASL A
C0/66EA:	851C    	STA $1C
C0/66EC:	A51E    	LDA $1E
C0/66EE:	99C004  	STA $04C0,Y
C0/66F1:	A522    	LDA $22
C0/66F3:	99C104  	STA $04C1,Y
C0/66F6:	B90078  	LDA $7800,Y
C0/66F9:	AA      	TAX
C0/66FA:	A51F    	LDA $1F
C0/66FC:	4A      	LSR A
C0/66FD:	B00D    	BCS $670C
C0/66FF:	BD1C05  	LDA $051C,X
C0/6702:	390079  	AND $7900,Y
C0/6705:	051C    	ORA $1C
C0/6707:	9D1C05  	STA $051C,X
C0/670A:	800E    	BRA $671A
C0/670C:	BD1C05  	LDA $051C,X
C0/670F:	390079  	AND $7900,Y
C0/6712:	19007A  	ORA $7A00,Y
C0/6715:	051C    	ORA $1C
C0/6717:	9D1C05  	STA $051C,X
C0/671A:	4C345B  	JMP $5B34

C0/671D:	0000    	
C0/671F:	0103    	

C0/6721:	48      	PHA
C0/6722:	DA      	PHX
C0/6723:	5A      	PHY
C0/6724:	A52B    	LDA $2B
C0/6726:	4A      	LSR A
C0/6727:	B00F    	BCS $6738
C0/6729:	B90078  	LDA $7800,Y
C0/672C:	AA      	TAX
C0/672D:	BD0405  	LDA $0504,X
C0/6730:	390079  	AND $7900,Y
C0/6733:	9D0405  	STA $0504,X
C0/6736:	8010    	BRA $6748
C0/6738:	B90078  	LDA $7800,Y
C0/673B:	AA      	TAX
C0/673C:	BD0405  	LDA $0504,X
C0/673F:	390079  	AND $7900,Y
C0/6742:	19007A  	ORA $7A00,Y
C0/6745:	9D0405  	STA $0504,X
C0/6748:	7A      	PLY
C0/6749:	FA      	PLX
C0/674A:	68      	PLA
C0/674B:	60      	RTS
 
C0/674C:	48      	PHA
C0/674D:	DA      	PHX
C0/674E:	5A      	PHY
C0/674F:	A52B    	LDA $2B
C0/6751:	4A      	LSR A
C0/6752:	B00F    	BCS $6763
C0/6754:	B90078  	LDA $7800,Y
C0/6757:	AA      	TAX
C0/6758:	BD1005  	LDA $0510,X
C0/675B:	390079  	AND $7900,Y
C0/675E:	9D1005  	STA $0510,X
C0/6761:	8010    	BRA $6773
C0/6763:	B90078  	LDA $7800,Y
C0/6766:	AA      	TAX
C0/6767:	BD1005  	LDA $0510,X
C0/676A:	390079  	AND $7900,Y
C0/676D:	19007A  	ORA $7A00,Y
C0/6770:	9D1005  	STA $0510,X
C0/6773:	7A      	PLY
C0/6774:	FA      	PLX
C0/6775:	68      	PLA
C0/6776:	60      	RTS
 
; Data [?]
C0/6777:	00
          0C
C0/6779:	18
          24

; Handle object animations (max 6)
C0/677B:	9C0C42    STZ $420C       ; disable all HDMA channels
C0/677F:	A941    	LDA #$41        ; HDMA flags (2 registers write once)
C0/6781:	8D0043    STA $4300       ; set HDMA mode
C0/6783:	A980    	LDA #$80        ; "Increment after writing"
C0/6785:	8D1521  	STA $2115       ; set video port flags/mode [?]
C0/6788:	A918    	LDA #$18        ; destination register $2118
C0/678A:	8D0143  	STA $4301       ; set destination register (VRAM write)
C0/678D:	A547    	LDA $47         ; event counter [??]
C0/678F:	2903    	AND #$03        ; modulo 4
C0/6791:	AA      	TAX             ; index it
C0/6792:	BF7767C0	LDA $C06777,X   ; load data (offset) [?]
C0/6796:	8548    	STA $48         ; offset of current animation [?]
C0/6798:	6449    	STZ $49         ; offset of current animation [?] (hibyte)
C0/679A:	8A      	TXA             ; offset in A
C0/679B:	0A      	ASL A           ; x2
C0/679C:	AA      	TAX             ; index it
C0/679D:	C220    	REP #$20        ; 16-bit A
C0/679F:	BF3C69C0	LDA $C0693C,X   ; same offset as before, x256
C0/67A3:	8514    	STA $14         ; store temp
C0/67A5:	A90600  	LDA #$0006      ; allow 6 animations max
C0/67A8:	8518    	STA $18         ; set animation iterator

; Begin animation loop
C0/67AA:	9C0B42  	STZ $420B       ; disable all DMA channels
C0/67AD:	A648    	LDX $48         ; offset of current animation [?]
C0/67AF:	BCF710  	LDY $10F7,X     ; object animation - pointer to object data
C0/67B2:	C0B007  	CPY #$07B0      ; is object empty
C0/67B5:	D003    	BNE $67BA       ; perform animation if not
C0/67B7:	4C6668  	JMP $6866       ; else, advance loop

; Animate object [?]
C0/67BA:	B97908  	LDA $0879,Y     ; object sprite graphic index
C0/67BD:	29FF00  	AND #$00FF      ; isolate ^
C0/67C0:	0A      	ASL A           ; x2
C0/67C1:	AA      	TAX             ; index it
C0/67C2:	BFF2D0C0	LDA $C0D0F2,X   ; address containing graphic data
C0/67C6:	850E    	STA $0E         ; save address
C0/67C8:	BF3CD2C0	LDA $C0D23C,X
C0/67CC:	8510    	STA $10         ; save bank [?]
C0/67CE:	A614    	LDX $14
C0/67D0:	BF4469C0	LDA $C06944,X   ; VRAM read/write
C0/67D4:	8D1621  	STA $2116
C0/67D7:	18      	CLC
C0/67D8:	690001  	ADC #$0100
C0/67DB:	8516    	STA $16
C0/67DD:	B97608  	LDA $0876,Y
C0/67E0:	293F00  	AND #$003F
C0/67E3:	0A      	ASL A
C0/67E4:	0A      	ASL A
C0/67E5:	8512    	STA $12
C0/67E7:	0A      	ASL A
C0/67E8:	18      	CLC
C0/67E9:	6512    	ADC $12
C0/67EB:	AA      	TAX
C0/67EC:	A00100  	LDY #$0001
C0/67EF:	BF3ACEC0	LDA $C0CE3A,X
C0/67F3:	18      	CLC
C0/67F4:	650E    	ADC $0E
C0/67F6:	8D0243  	STA $4302
C0/67F9:	7B      	TDC 
C0/67FA:	6510    	ADC $10
C0/67FC:	8D0443  	STA $4304
C0/67FF:	8C0B42  	STY $420B
C0/6802:	BF3CCEC0	LDA $C0CE3C,X
C0/6806:	18      	CLC
C0/6807:	650E    	ADC $0E
C0/6809:	8D0243  	STA $4302
C0/680C:	7B      	TDC 
C0/680D:	6510    	ADC $10
C0/680F:	8D0443  	STA $4304
C0/6812:	8C0B42  	STY $420B
C0/6815:	BF42CEC0	LDA $C0CE42,X
C0/6819:	18      	CLC
C0/681A:	650E    	ADC $0E
C0/681C:	8D0243  	STA $4302
C0/681F:	7B      	TDC 
C0/6820:	6510    	ADC $10
C0/6822:	8D0443  	STA $4304
C0/6825:	8C0B42  	STY $420B
C0/6828:	BF44CEC0	LDA $C0CE44,X
C0/682C:	18      	CLC
C0/682D:	650E    	ADC $0E
C0/682F:	8D0243  	STA $4302
C0/6832:	7B      	TDC 
C0/6833:	6510    	ADC $10
C0/6835:	8D0443  	STA $4304
C0/6838:	8C0B42  	STY $420B
C0/683B:	A516    	LDA $16
C0/683D:	8D1621  	STA $2116
C0/6840:	BF3ECEC0	LDA $C0CE3E,X
C0/6844:	18      	CLC
C0/6845:	650E    	ADC $0E
C0/6847:	8D0243  	STA $4302
C0/684A:	7B      	TDC 
C0/684B:	6510    	ADC $10
C0/684D:	8D0443  	STA $4304
C0/6850:	8C0B42  	STY $420B
C0/6853:	BF40CEC0	LDA $C0CE40,X
C0/6857:	18      	CLC
C0/6858:	650E    	ADC $0E
C0/685A:	8D0243  	STA $4302
C0/685D:	7B      	TDC 
C0/685E:	6510    	ADC $10
C0/6860:	8D0443  	STA $4304
C0/6863:	8C0B42  	STY $420B

C0/6866:	E614    	INC $14         ; increment offsetx256
C0/6868:	E614    	INC $14         ; increment offsetx256
C0/686A:	E648    	INC $48         ; increment offset
C0/686C:	E648    	INC $48         ; increment offset
C0/686E:	C618    	DEC $18         ; decrement animations remaining
C0/6870:	F003    	BEQ $6875       ; exit if none left
C0/6872:	4CAA67  	JMP $67AA       ; else, loop for next animation

C0/6875:	7B      	TDC             ; clear A/B
C0/6876:	E220    	SEP #$20        ; 8-bit A
C0/6878:	60      	RTS
 
C0/6879:	9C0C42  	STZ $420C
C0/687C:	8E1621  	STX $2116
C0/687F:	C220    	REP #$20      (16 bit accum./memory)
C0/6881:	293F00  	AND #$003F
C0/6884:	0A      	ASL A
C0/6885:	0A      	ASL A
C0/6886:	8512    	STA $12
C0/6888:	0A      	ASL A
C0/6889:	18      	CLC
C0/688A:	6512    	ADC $12
C0/688C:	8512    	STA $12
C0/688E:	ADFB11  	LDA $11FB
C0/6891:	29FF00  	AND #$00FF
C0/6894:	0A      	ASL A
C0/6895:	AA      	TAX
C0/6896:	BFF2D0C0	LDA $C0D0F2,X
C0/689A:	850E    	STA $0E
C0/689C:	BF3CD2C0	LDA $C0D23C,X
C0/68A0:	8510    	STA $10
C0/68A2:	7B      	TDC 
C0/68A3:	E220    	SEP #$20      (8 bit accum./memory)
C0/68A5:	9C0B42  	STZ $420B      (turn off DMA)
C0/68A8:	A941    	LDA #$41
C0/68AA:	8D0043  	STA $4300
C0/68AD:	A980    	LDA #$80
C0/68AF:	8D1521  	STA $2115
C0/68B2:	A918    	LDA #$18
C0/68B4:	8D0143  	STA $4301
C0/68B7:	C220    	REP #$20      (16 bit accum./memory)
C0/68B9:	A612    	LDX $12
C0/68BB:	A00100  	LDY #$0001
C0/68BE:	BF3ACEC0	LDA $C0CE3A,X
C0/68C2:	18      	CLC
C0/68C3:	650E    	ADC $0E
C0/68C5:	8D0243  	STA $4302
C0/68C8:	7B      	TDC 
C0/68C9:	6510    	ADC $10
C0/68CB:	8D0443  	STA $4304
C0/68CE:	8C0B42  	STY $420B
C0/68D1:	BF3CCEC0	LDA $C0CE3C,X
C0/68D5:	18      	CLC
C0/68D6:	650E    	ADC $0E
C0/68D8:	8D0243  	STA $4302
C0/68DB:	7B      	TDC 
C0/68DC:	6510    	ADC $10
C0/68DE:	8D0443  	STA $4304
C0/68E1:	8C0B42  	STY $420B
C0/68E4:	BF3ECEC0	LDA $C0CE3E,X
C0/68E8:	18      	CLC
C0/68E9:	650E    	ADC $0E
C0/68EB:	8D0243  	STA $4302
C0/68EE:	7B      	TDC 
C0/68EF:	6510    	ADC $10
C0/68F1:	8D0443  	STA $4304
C0/68F4:	8C0B42  	STY $420B
C0/68F7:	BF40CEC0	LDA $C0CE40,X
C0/68FB:	18      	CLC
C0/68FC:	650E    	ADC $0E
C0/68FE:	8D0243  	STA $4302
C0/6901:	7B      	TDC 
C0/6902:	6510    	ADC $10
C0/6904:	8D0443  	STA $4304
C0/6907:	8C0B42  	STY $420B
C0/690A:	BF42CEC0	LDA $C0CE42,X
C0/690E:	18      	CLC
C0/690F:	650E    	ADC $0E
C0/6911:	8D0243  	STA $4302
C0/6914:	7B      	TDC 
C0/6915:	6510    	ADC $10
C0/6917:	8D0443  	STA $4304
C0/691A:	8C0B42  	STY $420B
C0/691D:	BF44CEC0	LDA $C0CE44,X
C0/6921:	18      	CLC
C0/6922:	650E    	ADC $0E
C0/6924:	8D0243  	STA $4302
C0/6927:	7B      	TDC 
C0/6928:	6510    	ADC $10
C0/692A:	8D0443  	STA $4304
C0/692D:	8C0B42  	STY $420B
C0/6930:	7B      	TDC 
C0/6931:	E220    	SEP #$20      (8 bit accum./memory)
C0/6933:	60      	RTS
 
C0/6934:	0000  
C0/6936:	F600  
C0/6938:	EC01E2
C0/693B:	02

C0/693C:  0000
C0/693E:	0C00
C0/6940:	1800
C0/6942:	2400

C0/6944:	0060     
C0/6946:	4060      
C0/6948:	8060  
C0/694A:	C060  	
C0/694C:	0062
C0/694E:	4062  
C0/6950:	8062 
C0/6952:	C062  	
C0/6954:	0064    	
C0/6956:	4064    
C0/6958:	8064    
C0/695A:	C064    
C0/695C:	0066    
C0/695E:	4066   
C0/6960:	8066   
C0/6962:	C066    
C0/6964:	0068   
C0/6966:	4068     
C0/6968:	8068    
C0/696A:	C068  
C0/696C:	006A   
C0/696E:	406A    
C0/6970:	806A    
C0/6972:	C06A  	

C0/6974:	A600		LDA #$00
C0/6976:	8A    	TXA
C0/6977:	9F00607E	STA $7E6000,X
C0/697B:	E8      	INX
C0/697C:	E0006C  	CPX #$6C00
C0/697F:	D0F6    	BNE $6977
C0/6981:	A600    	LDX $00
C0/6983:	861E    	STX $1E
C0/6985:	8622    	STX $22
C0/6987:	A20060  	LDX #$6000
C0/698A:	8636    	STX $36
C0/698C:	A97E    	LDA #$7E
C0/698E:	8538    	STA $38
C0/6990:	A61E    	LDX $1E
C0/6992:	BFF2D0C0	LDA $C0D0F2,X	(Loads pointer to Map character graphics)
C0/6996:	852A    	STA $2A
C0/6998:	1A      	INC A
C0/6999:	852D    	STA $2D
C0/699B:	18      	CLC
C0/699C:	690F    	ADC #$0F
C0/699E:	8530    	STA $30
C0/69A0:	1A      	INC A
C0/69A1:	8533    	STA $33
C0/69A3:	BFF3D0C0	LDA $C0D0F3,X	(Loads pointer to Map character graphcis)
C0/69A7:	852B    	STA $2B
C0/69A9:	852E    	STA $2E
C0/69AB:	8531    	STA $31
C0/69AD:	8534    	STA $34
C0/69AF:	BF3CD2C0	LDA $C0D23C,X	(Bank pointers and Number of Bytes to Copy per Tile for Map Char Gfx)
C0/69B3:	852C    	STA $2C
C0/69B5:	852F    	STA $2F
C0/69B7:	8532    	STA $32
C0/69B9:	8535    	STA $35
C0/69BB:	A600    	LDX $00
C0/69BD:	8620    	STX $20
C0/69BF:	C220    	REP #$20      	(16 bit accum./memory)
C0/69C1:	A620    	LDX $20
C0/69C3:	BF46CEC0	LDA $C0CE46,X
C0/69C7:	8524    	STA $24
C0/69C9:	7B      	TDC 
C0/69CA:	E220    	SEP #$20      	(8 bit accum./memory)
C0/69CC:	A908    	LDA #$08
C0/69CE:	851A    	STA $1A
C0/69D0:	A424    	LDY $24
C0/69D2:	B72D    	LDA [$2D],Y
C0/69D4:	1730    	ORA [$30],Y
C0/69D6:	1733    	ORA [$33],Y
C0/69D8:	4502    	EOR $02
C0/69DA:	372A    	AND [$2A],Y
C0/69DC:	C8      	INY 
C0/69DD:	C8      	INY 
C0/69DE:	8424    	STY $24
C0/69E0:	A422    	LDY $22
C0/69E2:	9736    	STA [$36],Y
C0/69E4:	C8      	INY 
C0/69E5:	C8      	INY 
C0/69E6:	8422    	STY $22
C0/69E8:	C61A    	DEC $1A
C0/69EA:	D0E4    	BNE $69D0
C0/69EC:	C221    	REP #$21
C0/69EE:	A522    	LDA $22
C0/69F0:	691000  	ADC #$0010
C0/69F3:	8522    	STA $22
C0/69F5:	7B      	TDC 
C0/69F6:	E220    	SEP #$20      (8 bit accum./memory)
C0/69F8:	A620    	LDX $20
C0/69FA:	E8      	INX
C0/69FB:	E8      	INX
C0/69FC:	8620    	STX $20
C0/69FE:	E06C00  	CPX #$006C
C0/6A01:	D0BC    	BNE $69BF
C0/6A03:	60      	RTS
 
C0/6A04:	AD8811  	LDA $1188     ; timer flags
C0/6A07:	2940    	AND #$40      ; timer is visible on field [?]
C0/6A09:	D001    	BNE $6A0C     ; branch if timer active
C0/6A0B:	60      	RTS
 
C0/6A0C:	AE8911  	LDX $1189
C0/6A0F:	8E0442  	STX $4204
C0/6A12:	A93C    	LDA #$3C
C0/6A14:	8D0642  	STA $4206
C0/6A17:	EA      	NOP
C0/6A18:	EA      	NOP
C0/6A19:	EA      	NOP
C0/6A1A:	EA      	NOP
C0/6A1B:	EA      	NOP
C0/6A1C:	EA      	NOP
C0/6A1D:	EA      	NOP
C0/6A1E:	AE1442  	LDX $4214
C0/6A21:	8E0442  	STX $4204
C0/6A24:	A90A    	LDA #$0A
C0/6A26:	8D0642  	STA $4206
C0/6A29:	EA      	NOP
C0/6A2A:	EA      	NOP
C0/6A2B:	EA      	NOP
C0/6A2C:	EA      	NOP
C0/6A2D:	EA      	NOP
C0/6A2E:	EA      	NOP
C0/6A2F:	EA      	NOP
C0/6A30:	AD1642  	LDA $4216
C0/6A33:	851D    	STA $1D
C0/6A35:	AE1442  	LDX $4214
C0/6A38:	8E0442  	STX $4204
C0/6A3B:	A906    	LDA #$06
C0/6A3D:	8D0642  	STA $4206
C0/6A40:	EA      	NOP
C0/6A41:	EA      	NOP
C0/6A42:	EA      	NOP
C0/6A43:	EA      	NOP
C0/6A44:	EA      	NOP
C0/6A45:	EA      	NOP
C0/6A46:	EA      	NOP
C0/6A47:	AD1642  	LDA $4216
C0/6A4A:	851C    	STA $1C
C0/6A4C:	AE1442  	LDX $4214
C0/6A4F:	8E0442  	STX $4204
C0/6A52:	A90A    	LDA #$0A
C0/6A54:	8D0642  	STA $4206
C0/6A57:	EA      	NOP
C0/6A58:	EA      	NOP
C0/6A59:	EA      	NOP
C0/6A5A:	EA      	NOP
C0/6A5B:	EA      	NOP
C0/6A5C:	EA      	NOP
C0/6A5D:	EA      	NOP
C0/6A5E:	AD1642  	LDA $4216
C0/6A61:	851B    	STA $1B
C0/6A63:	AD1442  	LDA $4214
C0/6A66:	851A    	STA $1A
C0/6A68:	A9CC    	LDA #$CC
C0/6A6A:	8D0D03  	STA $030D
C0/6A6D:	8D1103  	STA $0311
C0/6A70:	8D1503  	STA $0315
C0/6A73:	8D1903  	STA $0319
C0/6A76:	8D1D03  	STA $031D
C0/6A79:	A9C8    	LDA #$C8
C0/6A7B:	8D0C03  	STA $030C
C0/6A7E:	A9D0    	LDA #$D0
C0/6A80:	8D1003  	STA $0310
C0/6A83:	A9D8    	LDA #$D8
C0/6A85:	8D1C03  	STA $031C
C0/6A88:	A9E0    	LDA #$E0
C0/6A8A:	8D1403  	STA $0314
C0/6A8D:	A9E8    	LDA #$E8
C0/6A8F:	8D1803  	STA $0318
C0/6A92:	A931    	LDA #$31
C0/6A94:	8D0F03  	STA $030F
C0/6A97:	8D1303  	STA $0313
C0/6A9A:	8D1703  	STA $0317
C0/6A9D:	8D1B03  	STA $031B
C0/6AA0:	8D1F03  	STA $031F
C0/6AA3:	A984    	LDA #$84
C0/6AA5:	8D1E03  	STA $031E
C0/6AA8:	A51A    	LDA $1A
C0/6AAA:	AA      	TAX
C0/6AAB:	BFD16AC0	LDA $C06AD1,X
C0/6AAF:	8D0E03  	STA $030E
C0/6AB2:	A51B    	LDA $1B
C0/6AB4:	AA      	TAX
C0/6AB5:	BFD16AC0	LDA $C06AD1,X
C0/6AB9:	8D1203  	STA $0312
C0/6ABC:	A51C    	LDA $1C
C0/6ABE:	AA      	TAX
C0/6ABF:	BFD16AC0	LDA $C06AD1,X
C0/6AC3:	8D1603  	STA $0316
C0/6AC6:	A51D    	LDA $1D
C0/6AC8:	AA      	TAX
C0/6AC9:	BFD16AC0	LDA $C06AD1,X
C0/6ACD:	8D1A03  	STA $031A
C0/6AD0:	60      	RTS
 
Data of some sort:

C0/6AD1:	60      	
C0/6AD2:	62
C0/6AD3:	64
C0/6AD4:	66  	
C0/6AD5:	68      	 
C0/6AD6:	6A      	
C0/6AD7:	6C
C0/6AD8:	6E
C0/6AD9:	80  	
C0/6ADA:	82

C0/6ADB:	AD2105  	LDA $0521		(from C0/BFA3)
C0/6ADE:	3001    	BMI $6AE1 
C0/6AE0:	60      	RTS

SOMETHING with the fixed width font is being dealt with here...
C0/6AE1:	A980    	LDA #$80		(from C0/6ADE)
C0/6AE3:	8D1521  	STA $2115
C0/6AE6:	A20076  	LDX #$7600
C0/6AE9:	8E1621  	STX $2116
C0/6AEC:	A600    	LDX $00
C0/6AEE:	BF008BC4	LDA $C48B00,X
C0/6AF2:	5F018BC4	EOR $C48B01,X
C0/6AF6:	8D1821  	STA $2118
C0/6AF9:	BF018BC4	LDA $C48B01,X
C0/6AFD:	8D1921  	STA $2119
C0/6B00:	BF028BC4	LDA $C48B02,X
C0/6B04:	5F038BC4	EOR $C48B03,X
C0/6B08:	8D1821  	STA $2118
C0/6B0B:	BF038BC4	LDA $C48B03,X
C0/6B0F:	8D1921  	STA $2119
C0/6B12:	BF048BC4	LDA $C48B04,X
C0/6B16:	5F058BC4	EOR $C48B05,X
C0/6B1A:	8D1821  	STA $2118
C0/6B1D:	BF058BC4	LDA $C48B05,X
C0/6B21:	8D1921  	STA $2119
C0/6B24:	BF068BC4	LDA $C48B06,X
C0/6B28:	5F078BC4	EOR $C48B07,X
C0/6B2C:	8D1821  	STA $2118
C0/6B2F:	BF078BC4	LDA $C48B07,X
C0/6B33:	8D1921  	STA $2119
C0/6B36:	BF088BC4	LDA $C48B08,X
C0/6B3A:	5F098BC4	EOR $C48B09,X
C0/6B3E:	8D1821  	STA $2118
C0/6B41:	BF098BC4	LDA $C48B09,X
C0/6B45:	8D1921  	STA $2119
C0/6B48:	BF0A8BC4	LDA $C48B0A,X
C0/6B4C:	5F0B8BC4	EOR $C48B0B,X
C0/6B50:	8D1821  	STA $2118
C0/6B53:	BF0B8BC4	LDA $C48B0B,X
C0/6B57:	8D1921  	STA $2119
C0/6B5A:	BF0C8BC4	LDA $C48B0C,X
C0/6B5E:	5F0D8BC4	EOR $C48B0D,X
C0/6B62:	8D1821  	STA $2118
C0/6B65:	BF0D8BC4	LDA $C48B0D,X
C0/6B69:	8D1921  	STA $2119
C0/6B6C:	BF0E8BC4	LDA $C48B0E,X
C0/6B70:	5F0F8BC4	EOR $C48B0F,X
C0/6B74:	8D1821  	STA $2118
C0/6B77:	BF0F8BC4	LDA $C48B0F,X
C0/6B7B:	8D1921  	STA $2119
C0/6B7E:	A01800  	LDY #$0018
C0/6B81:	9C1821  	STZ $2118
C0/6B84:	9C1921  	STZ $2119
C0/6B87:	88      	DEY 
C0/6B88:	D0F7    	BNE $6B81
C0/6B8A:	C221    	REP #$21
C0/6B8C:	8A      	TXA
C0/6B8D:	691000  	ADC #$0010
C0/6B90:	AA      	TAX
C0/6B91:	7B      	TDC 
C0/6B92:	E220    	SEP #$20      (8 bit accum./memory)
C0/6B94:	E08000  	CPX #$0080
C0/6B97:	F003    	BEQ $6B9C
C0/6B99:	4CEE6A  	JMP $6AEE

C0/6B9C:	A00001  	LDY #$0100
C0/6B9F:	9C1821  	STZ $2118
C0/6BA2:	9C1921  	STZ $2119
C0/6BA5:	88      	DEY 
C0/6BA6:	D0F7    	BNE $6B9F
C0/6BA8:	BF008BC4	LDA $C48B00,X
C0/6BAC:	5F018BC4	EOR $C48B01,X
C0/6BB0:	8D1821  	STA $2118
C0/6BB3:	BF018BC4	LDA $C48B01,X
C0/6BB7:	8D1921  	STA $2119
C0/6BBA:	BF028BC4	LDA $C48B02,X
C0/6BBE:	5F038BC4	EOR $C48B03,X
C0/6BC2:	8D1821  	STA $2118
C0/6BC5:	BF038BC4	LDA $C48B03,X
C0/6BC9:	8D1921  	STA $2119
C0/6BCC:	BF048BC4	LDA $C48B04,X
C0/6BD0:	5F058BC4	EOR $C48B05,X
C0/6BD4:	8D1821  	STA $2118
C0/6BD7:	BF058BC4	LDA $C48B05,X
C0/6BDB:	8D1921  	STA $2119
C0/6BDE:	BF068BC4	LDA $C48B06,X
C0/6BE2:	5F078BC4	EOR $C48B07,X
C0/6BE6:	8D1821  	STA $2118
C0/6BE9:	BF078BC4	LDA $C48B07,X
C0/6BED:	8D1921  	STA $2119
C0/6BF0:	BF088BC4	LDA $C48B08,X
C0/6BF4:	5F098BC4	EOR $C48B09,X
C0/6BF8:	8D1821  	STA $2118
C0/6BFB:	BF098BC4	LDA $C48B09,X
C0/6BFF:	8D1921  	STA $2119
C0/6C02:	BF0A8BC4	LDA $C48B0A,X
C0/6C06:	5F0B8BC4	EOR $C48B0B,X
C0/6C0A:	8D1821  	STA $2118
C0/6C0D:	BF0B8BC4	LDA $C48B0B,X
C0/6C11:	8D1921  	STA $2119
C0/6C14:	BF0C8BC4	LDA $C48B0C,X
C0/6C18:	5F0D8BC4	EOR $C48B0D,X
C0/6C1C:	8D1821  	STA $2118
C0/6C1F:	BF0D8BC4	LDA $C48B0D,X
C0/6C23:	8D1921  	STA $2119
C0/6C26:	BF0E8BC4	LDA $C48B0E,X
C0/6C2A:	5F0F8BC4	EOR $C48B0F,X
C0/6C2E:	8D1821  	STA $2118
C0/6C31:	BF0F8BC4	LDA $C48B0F,X
C0/6C35:	8D1921  	STA $2119
C0/6C38:	A01800  	LDY #$0018
C0/6C3B:	9C1821  	STZ $2118
C0/6C3E:	9C1921  	STZ $2119
C0/6C41:	88      	DEY 
C0/6C42:	D0F7    	BNE $6C3B
C0/6C44:	C221    	REP #$21
C0/6C46:	8A      	TXA
C0/6C47:	691000  	ADC #$0010
C0/6C4A:	AA      	TAX
C0/6C4B:	7B      	TDC 
C0/6C4C:	E220    	SEP #$20      (8 bit accum./memory)
C0/6C4E:	E0A000  	CPX #$00A0
C0/6C51:	F003    	BEQ $6C56
C0/6C53:	4CA86B  	JMP $6BA8

C0/6C56:	AFD08BC4	LDA $C48BD0
C0/6C5A:	4FD18BC4	EOR $C48BD1
C0/6C5E:	8D1821  	STA $2118
C0/6C61:	AFD18BC4	LDA $C48BD1
C0/6C65:	8D1921  	STA $2119
C0/6C68:	AFD28BC4	LDA $C48BD2
C0/6C6C:	4FD38BC4	EOR $C48BD3
C0/6C70:	8D1821  	STA $2118
C0/6C73:	AFD38BC4	LDA $C48BD3
C0/6C77:	8D1921  	STA $2119
C0/6C7A:	AFD48BC4	LDA $C48BD4
C0/6C7E:	4FD58BC4	EOR $C48BD5
C0/6C82:	8D1821  	STA $2118
C0/6C85:	AFD58BC4	LDA $C48BD5
C0/6C89:	8D1921  	STA $2119
C0/6C8C:	AFD68BC4	LDA $C48BD6
C0/6C90:	4FD78BC4	EOR $C48BD7
C0/6C94:	8D1821  	STA $2118
C0/6C97:	AFD78BC4	LDA $C48BD7
C0/6C9B:	8D1921  	STA $2119
C0/6C9E:	AFD88BC4	LDA $C48BD8
C0/6CA2:	4FD98BC4	EOR $C48BD9
C0/6CA6:	8D1821  	STA $2118
C0/6CA9:	AFD98BC4	LDA $C48BD9
C0/6CAD:	8D1921  	STA $2119
C0/6CB0:	AFDA8BC4	LDA $C48BDA
C0/6CB4:	4FDB8BC4	EOR $C48BDB
C0/6CB8:	8D1821  	STA $2118
C0/6CBB:	AFDB8BC4	LDA $C48BDB
C0/6CBF:	8D1921  	STA $2119
C0/6CC2:	AFDC8BC4	LDA $C48BDC
C0/6CC6:	4FDD8BC4	EOR $C48BDD
C0/6CCA:	8D1821  	STA $2118
C0/6CCD:	AFDD8BC4	LDA $C48BDD
C0/6CD1:	8D1921  	STA $2119
C0/6CD4:	AFDE8BC4	LDA $C48BDE
C0/6CD8:	4FDF8BC4	EOR $C48BDF
C0/6CDC:	8D1821  	STA $2118
C0/6CDF:	AFDF8BC4	LDA $C48BDF
C0/6CE3:	8D1921  	STA $2119
C0/6CE6:	A0A001  	LDY #$01A0
C0/6CE9:	9C1821  	STZ $2118
C0/6CEC:	9C1921  	STZ $2119
C0/6CEF:	88      	DEY 
C0/6CF0:	D0F7    	BNE $6CE9
C0/6CF2:	60      	RTS
 
C0/6CF3:	9CDF11  	STZ $11DF      (from C0/A032, C0/B094, C0/BF97)
C0/6CF6:	A400    	LDY $00
C0/6CF8:	641B    	STZ $1B
C0/6CFA:	B96708  	LDA $0867,Y
C0/6CFD:	2940    	AND #$40
C0/6CFF:	F013    	BEQ $6D14
C0/6D01:	B96708  	LDA $0867,Y
C0/6D04:	2907    	AND #$07
C0/6D06:	CD6D1A  	CMP $1A6D      (Is this the active party?)
C0/6D09:	D009    	BNE $6D14
C0/6D0B:	5A      	PHY
C0/6D0C:	A51B    	LDA $1B        (load current character)
C0/6D0E:	220600C2	JSL $C20006    ("Equipment check function," enforces stat caps, etc)
C0/6D12:	7B      	TDC 
C0/6D13:	7A      	PLY
C0/6D14:	C221    	REP #$21
C0/6D16:	98      	TYA
C0/6D17:	692900  	ADC #$0029     (increment for next character)
C0/6D1A:	A8      	TAY
C0/6D1B:	7B      	TDC 
C0/6D1C:	E220    	SEP #$20       (8 bit accum./memory)
C0/6D1E:	E61B    	INC $1B
C0/6D20:	C09002  	CPY #$0290     (have we checked 16 characters?)
C0/6D23:	D0D5    	BNE $6CFA      (branch if not)
C0/6D25:	60      	RTS

; Handle party switching

C0/6D26:	ADB91E  	LDA $1EB9
C0/6D29:	2940    	AND #$40      ; "currently switching parties"
C0/6D2B:	F049    	BEQ $6D76     ; exit if ^
C0/6D2D:	AD8400  	LDA $0084     ; "enable map load" [?]
C0/6D30:	D044    	BNE $6D76     ; exit if ^ (no switching during map change)
C0/6D32:	AD5E05  	LDA $055E     ; collision status
C0/6D35:	D03F    	BNE $6D76     ; exit if collision being processed
C0/6D37:	A6E5    	LDX $E5       ; event PC [?]
C0/6D39:	E00000  	CPX #$0000     (CPX $00!)
C0/6D3C:	D038    	BNE $6D76     ; exit if not zero (no switching during event?)
C0/6D3E:	A5E7    	LDA $E7       ; event PC bank [?]
C0/6D40:	C9CA    	CMP #$CA      ; in bank CA
C0/6D42:	D032    	BNE $6D76     ; exit if not ^ [?]
C0/6D44:	AC0308  	LDY $0803     ; currently visible character [?]
C0/6D47:	B96908  	LDA $0869,Y
C0/6D4A:	D02A    	BNE $6D76
C0/6D4C:	B96A08  	LDA $086A,Y
C0/6D4F:	290F    	AND #$0F
C0/6D51:	D023    	BNE $6D76
C0/6D53:	B96C08  	LDA $086C,Y
C0/6D56:	D01E    	BNE $6D76
C0/6D58:	B96D08  	LDA $086D,Y
C0/6D5B:	290F    	AND #$0F
C0/6D5D:	D017    	BNE $6D76     ; exit if some position stuff for lead character [?] (currently moving?)
C0/6D5F:	A507    	LDA $07
C0/6D61:	2940    	AND #$40      ; pressing "Y" [?]
C0/6D63:	D007    	BNE $6D6C     ; branch if so
C0/6D65:	A901    	LDA #$01
C0/6D67:	8D6207  	STA $0762
C0/6D6A:	800A    	BRA $6D76

C0/6D6C:	AD6207  	LDA $0762     ; enable party change
C0/6D6F:	F005    	BEQ $6D76     ; exit if not
C0/6D71:	9C6207  	STZ $0762     ; temporarily disable party change
C0/6D74:	8001    	BRA $6D77
C0/6D76:	60      	RTS

; Execute party change

C0/6D77:	AD6D1A  	LDA $1A6D		  ; Load the active party
C0/6D7A:	A8      	TAY           ; index it
C0/6D7B:	A5B2    	LDA $B2       ; Z-level position [?]
C0/6D7D:	99F31F  	STA $1FF3,Y   ; save for active party
C0/6D80:	AD6D1A  	LDA $1A6D		  ; Load the active party again
C0/6D83:	1A      	INC A         ; get the next party (to swap to)
C0/6D84:	C904    	CMP #$04      ; 4th party [?]
C0/6D86:	D002    	BNE $6D8A     ; branch if not
C0/6D88:	A901    	LDA #$01      ; 4th party === 1st party (modulo 3)
C0/6D8A:	8D6D1A  	STA $1A6D		  ; Store this as the new active party
C0/6D8D:	A920    	LDA #$20
C0/6D8F:	851A    	STA $1A       ; set minimum (topmost) party position
C0/6D91:	A0D907  	LDY #$07D9    ; pointer to currently showing character [?]
C0/6D94:	8CFB07  	STY $07FB     ; set as first active object [?]
C0/6D97:	A400    	LDY $00       ; iterator for object loop below

; Find lead of next party

C0/6D99:	B96708  	LDA $0867,Y   ; settings for object Y
C0/6D9C:	2940    	AND #$40      ; "enabled"
C0/6D9E:	C940    	CMP #$40      ; "enabled"
C0/6DA0:	D018    	BNE $6DBA     ; skip if not enabled
C0/6DA2:	B96708  	LDA $0867,Y   ; settings for object Y
C0/6DA5:	2907    	AND #$07      ; party
C0/6DA7:	CD6D1A  	CMP $1A6D		  ; current active party
C0/6DAA:	D00E    	BNE $6DBA     ; skip if not in party
C0/6DAC:	B96708  	LDA $0867,Y   ; settings for object Y
C0/6DAF:	2918    	AND #$18      ; position in party
C0/6DB1:	C51A    	CMP $1A       ; compare to min position
C0/6DB3:	B005    	BCS $6DBA     ; branch if greater or equal
C0/6DB5:	851A    	STA $1A       ; else, set new minimum
C0/6DB7:	8CFB07  	STY $07FB     ; make this the active object (character to display on map)

C0/6DBA:	C221    	REP #$21      ; 16-bit A
C0/6DBC:	98      	TYA
C0/6DBD:	692900  	ADC #$0029    ; get next character object's data offset
C0/6DC0:	A8      	TAY           ; index it
C0/6DC1:	7B      	TDC           ; A = 0000
C0/6DC2:	E220    	SEP #$20      ; 8-bit A
C0/6DC4:	C09002  	CPY #$0290    ; checked 16 characters
C0/6DC7:	D0D0    	BNE $6D99     ; loop if not ^

C0/6DC9:	ACFB07  	LDY $07FB     ; get lead character's offset
C0/6DCC:	C0D907  	CPY #$07D9    ; no new party / lead found
C0/6DCF:	F0A6    	BEQ $6D77     ; branch and try next party if ^
C0/6DD1:	ACFB07  	LDY $07FB     ; offset to new lead
C0/6DD4:	CC0308  	CPY $0803     ; current lead's offset
C0/6DD7:	F06A    	BEQ $6E43     ; exit if they're the same
C0/6DD9:	A2D907  	LDX #$07D9    ; offset to lead character's data (holds old lead's data)
C0/6DDC:	8EFD07  	STX $07FD
C0/6DDF:	8EFF07  	STX $07FF
C0/6DE2:	8E0108  	STX $0801     ; set as offset for party members 2-4
C0/6DE5:	AE0308  	LDX $0803     ; old lead's home offset
C0/6DE8:	BD7C08  	LDA $087C,X   ; old lead's movement type
C0/6DEB:	997C08  	STA $087C,Y   ; set as new lead's movement type
C0/6DEE:	997D08  	STA $087D,Y   ; backup version here, too
C0/6DF1:	A900    	LDA #$00
C0/6DF3:	9D7C08  	STA $087C,X   ; clear old lead's movement type
C0/6DF6:	9D7D08  	STA $087D,X   ; clear old leads backup movement type
C0/6DF9:	BD7F08  	LDA $087F,X   ; old lead's facing direction
C0/6DFC:	0A      	ASL A
C0/6DFD:	0A      	ASL A
C0/6DFE:	0A      	ASL A         ; x8
C0/6DFF:	851A    	STA $1A       ; temp save
C0/6E01:	BD6808  	LDA $0868,X   ; old lead's sprite settings
C0/6E04:	29E7    	AND #$E7      ; mask saved facing direction
C0/6E06:	051A    	ORA $1A       ; replace with other facing direction
C0/6E08:	9D6808  	STA $0868,X   ; update saved facing direction
C0/6E0B:	BE8D08  	LDX $088D,Y   ; new lead's object map index
C0/6E0E:	E482    	CPX $82       ; compare to current map index
C0/6E10:	D032    	BNE $6E44     ; branch if new map needs to load

; Handle positioning changes

C0/6E12:	A901    	LDA #$01
C0/6E14:	8558    	STA $58       ; "reload current map"
C0/6E16:	A980    	LDA #$80
C0/6E18:	8DFA11  	STA $11FA     ; "enable map startup event"
C0/6E1B:	B97A08  	LDA $087A,Y   ; new lead's X location in map data
C0/6E1E:	8DC01F  	STA $1FC0     ; set as party's X location
C0/6E21:	8D661F  	STA $1F66     ; set as field X scroll position (center?)
C0/6E24:	B97B08  	LDA $087B,Y   ; new lead's Y location in map data
C0/6E27:	8DC11F  	STA $1FC1     ; set as party's Y location
C0/6E2A:	8D671F  	STA $1F67     ; set as field Y scroll position (center?)
C0/6E2D:	20560F  	JSR $0F56     ; set screen to fade out/update map[?]
C0/6E30:	A901    	LDA #$01
C0/6E32:	8584    	STA $84       ; "enable map load"
C0/6E34:	20886E  	JSR $6E88     ; load the map
C0/6E37:	AD6D1A  	LDA $1A6D		  ; new active party id
C0/6E3A:	A8      	TAY           ; index it
C0/6E3B:	B9F31F  	LDA $1FF3,Y   ; new party's Z level
C0/6E3E:	2903    	AND #$03      ; modulo 3
C0/6E40:	8D4407  	STA $0744     ; set as current sprite's Z level
C0/6E43:	60      	RTS

; Handle loading new map

C0/6E44:	A980    	LDA #$80
C0/6E46:	8DFA11  	STA $11FA     ; "enable map startup event"
C0/6E49:	C220    	REP #$20      ; 16-bit A
C0/6E4B:	B98D08  	LDA $088D,Y   ; new lead's map index
C0/6E4E:	8D641F  	STA $1F64     ; set as current map
C0/6E51:	B96A08  	LDA $086A,Y
C0/6E54:	4A      	LSR A
C0/6E55:	4A      	LSR A
C0/6E56:	4A      	LSR A
C0/6E57:	4A      	LSR A         ; new lead's X position in tiles
C0/6E58:	E220    	SEP #$20      ; 8-bit A
C0/6E5A:	8DC01F  	STA $1FC0     ; set as new party X position
C0/6E5D:	C220    	REP #$20      ; 16-bit A
C0/6E5F:	B96D08  	LDA $086D,Y
C0/6E62:	4A      	LSR A
C0/6E63:	4A      	LSR A
C0/6E64:	4A      	LSR A
C0/6E65:	4A      	LSR A         ; new lead's Y position in tiles
C0/6E66:	E220    	SEP #$20      ; 8-bit A
C0/6E68:	8DC11F  	STA $1FC1     ; set as new party Y position
C0/6E6B:	7B      	TDC           ; A = 0000
C0/6E6C:	20560F  	JSR $0F56     ; set screen fade-out
C0/6E6F:	A980    	LDA #$80
C0/6E71:	8D4307  	STA $0743     ; "don't update facing direction"
C0/6E74:	A901    	LDA #$01
C0/6E76:	8584    	STA $84       ; "enable map load"
C0/6E78:	20886E  	JSR $6E88     ; load the map
C0/6E7B:	AD6D1A  	LDA $1A6D		  ; new active party id
C0/6E7E:	A8      	TAY           ; index it
C0/6E7F:	B9F31F  	LDA $1FF3,Y   ; new party's Z level
C0/6E82:	2903    	AND #$03      ; modulo 3
C0/6E84:	8D4407  	STA $0744     ; set as current sprite's Z level
C0/6E87:	60      	RTS

; Load a map

C0/6E88:	A600    	LDX $00	(from C0/03C6, C0/1998, C0/19D4, C0/1A07, C0/1ADF, C0/1B23, C0/1B73, C0/6E78, C0/AB47, C0/AB55, C0/C6D3)
C0/6E8A:	9B      	TXY           ; X = 0000, Y = 0000
C0/6E8B:	C221    	REP #$21      ; 16-bit A
C0/6E8D:	BD8D08  	LDA $088D,X   ; character's map index
C0/6E90:	99811F  	STA $1F81,Y   ; backup character's map index
C0/6E93:	BD6A08  	LDA $086A,X
C0/6E96:	4A      	LSR A
C0/6E97:	4A      	LSR A
C0/6E98:	4A      	LSR A
C0/6E99:	4A      	LSR A         ; character's X position in tiles
C0/6E9A:	E220    	SEP #$20      ; 8-bit A
C0/6E9C:	99D31F  	STA $1FD3,Y   ; backup character's X position
C0/6E9F:	C220    	REP #$20      ; 16-bit A
C0/6EA1:	BD6D08  	LDA $086D,X
C0/6EA4:	4A      	LSR A
C0/6EA5:	4A      	LSR A
C0/6EA6:	4A      	LSR A
C0/6EA7:	4A      	LSR A         ; character's Y position in tiles
C0/6EA8:	E220    	SEP #$20      ; 8-bit A
C0/6EAA:	99D41F  	STA $1FD4,Y   ; backup character's Y position
C0/6EAD:	C221    	REP #$21      ; 16-bit A, carry clear
C0/6EAF:	8A      	TXA
C0/6EB0:	692900  	ADC #$0029
C0/6EB3:	AA      	TAX           ; get next character's data offset
C0/6EB4:	7B      	TDC           ; A = 0000
C0/6EB5:	E220    	SEP #$20      ; 8-bit A
C0/6EB7:	C8      	INY 
C0/6EB8:	C8      	INY           ; get next backup offset
C0/6EB9:	C02000  	CPY #$0020    ; checked all 16 characters
C0/6EBC:	D0CD    	BNE $6E8B     ; loop if not ^
C0/6EBE:	60      	RTS
 
C0/6EBF:	A600    	LDX $00       ; X = 0000
C0/6EC1:	9B      	TXY           ; Y = 0000
C0/6EC2:	C221    	REP #$21      ; 16-bit A, carry clear
C0/6EC4:	B9811F  	LDA $1F81,Y   ; saved object map indexes [?]
C0/6EC7:	9D8D08  	STA $088D,X   ; update in character object data block
C0/6ECA:	8A      	TXA
C0/6ECB:	692900  	ADC #$0029
C0/6ECE:	AA      	TAX           ; point to next character object data block
C0/6ECF:	7B      	TDC           ; A = 0000
C0/6ED0:	E220    	SEP #$20      ; 8-bit A
C0/6ED2:	C8      	INY 
C0/6ED3:	C8      	INY           ; point to next character's saved index
C0/6ED4:	C02000  	CPY #$0020    ; loop through all 16 characters
C0/6ED7:	D0E9    	BNE $6EC2
C0/6ED9:	60      	RTS
 
C0/6EDA:	A600    	LDX $00		(from C0/BEF5)
C0/6EDC:	9B      	TXY
C0/6EDD:	7B      	TDC 
C0/6EDE:	9D6908  	STA $0869,X
C0/6EE1:	9D6C08  	STA $086C,X
C0/6EE4:	BD8008  	LDA $0880,X
C0/6EE7:	0920    	ORA #$20
C0/6EE9:	9D8008  	STA $0880,X
C0/6EEC:	BD8108  	LDA $0881,X
C0/6EEF:	0920    	ORA #$20
C0/6EF1:	9D8108  	STA $0881,X
C0/6EF4:	C220    	REP #$20      ; 16-bit A
C0/6EF6:	B9D31F  	LDA $1FD3,Y
C0/6EF9:	29FF00  	AND #$00FF
C0/6EFC:	0A      	ASL A
C0/6EFD:	0A      	ASL A
C0/6EFE:	0A      	ASL A
C0/6EFF:	0A      	ASL A
C0/6F00:	9D6A08  	STA $086A,X
C0/6F03:	B9D41F  	LDA $1FD4,Y
C0/6F06:	29FF00  	AND #$00FF
C0/6F09:	0A      	ASL A
C0/6F0A:	0A      	ASL A
C0/6F0B:	0A      	ASL A
C0/6F0C:	0A      	ASL A
C0/6F0D:	9D6D08  	STA $086D,X
C0/6F10:	8A      	TXA
C0/6F11:	18      	CLC
C0/6F12:	692900  	ADC #$0029
C0/6F15:	AA      	TAX
C0/6F16:	7B      	TDC 
C0/6F17:	E220    	SEP #$20      (8 bit accum./memory)
C0/6F19:	C8      	INY 
C0/6F1A:	C8      	INY 
C0/6F1B:	C02000  	CPY #$0020
C0/6F1E:	D0BD    	BNE $6EDD
C0/6F20:	60      	RTS
 
C0/6F21:	A600    	LDX $00
C0/6F23:	9B      	TXY
C0/6F24:	BD8008  	LDA $0880,X
C0/6F27:	290E    	AND #$0E
C0/6F29:	99701F  	STA $1F70,Y
C0/6F2C:	C221    	REP #$21
C0/6F2E:	8A      	TXA
C0/6F2F:	692900  	ADC #$0029
C0/6F32:	AA      	TAX
C0/6F33:	7B      	TDC 
C0/6F34:	E220    	SEP #$20      (8 bit accum./memory)
C0/6F36:	C8      	INY 
C0/6F37:	C01000  	CPY #$0010
C0/6F3A:	D0E8    	BNE $6F24
C0/6F3C:	60      	RTS
 
C0/6F3D:	A600    	LDX $00		(from C0/BD6E)
C0/6F3F:	9B      	TXY
C0/6F40:	BD8008  	LDA $0880,X
C0/6F43:	29F1    	AND #$F1
C0/6F45:	19701F  	ORA $1F70,Y
C0/6F48:	9D8008  	STA $0880,X
C0/6F4B:	BD8108  	LDA $0881,X
C0/6F4E:	29F1    	AND #$F1
C0/6F50:	19701F  	ORA $1F70,Y
C0/6F53:	9D8108  	STA $0881,X
C0/6F56:	C221    	REP #$21
C0/6F58:	8A      	TXA
C0/6F59:	692900  	ADC #$0029
C0/6F5C:	AA      	TAX
C0/6F5D:	7B      	TDC 
C0/6F5E:	E220    	SEP #$20      (8 bit accum./memory)
C0/6F60:	C8      	INY 
C0/6F61:	C01000  	CPY #$0010
C0/6F64:	D0DA    	BNE $6F40
C0/6F66:	60      	RTS
 
C0/6F67:	AC0308  	LDY $0803		(from C0/BF33)
C0/6F6A:	841E    	STY $1E
C0/6F6C:	BE6A08  	LDX $086A,Y
C0/6F6F:	8626    	STX $26
C0/6F71:	BE6D08  	LDX $086D,Y
C0/6F74:	8628    	STX $28
C0/6F76:	A920    	LDA #$20
C0/6F78:	851A    	STA $1A
C0/6F7A:	A600    	LDX $00
C0/6F7C:	9B      	TXY
C0/6F7D:	B95018  	LDA $1850,Y
C0/6F80:	2907    	AND #$07
C0/6F82:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/6F85:	D032    	BNE $6FB9
C0/6F87:	C220    	REP #$20      (16 bit accum./memory)
C0/6F89:	A526    	LDA $26
C0/6F8B:	9D6A08  	STA $086A,X
C0/6F8E:	A528    	LDA $28
C0/6F90:	9D6D08  	STA $086D,X
C0/6F93:	BD7A08  	LDA $087A,X
C0/6F96:	8520    	STA $20
C0/6F98:	7B      	TDC 
C0/6F99:	E220    	SEP #$20      (8 bit accum./memory)
C0/6F9B:	9D6908  	STA $0869,X
C0/6F9E:	9D6C08  	STA $086C,X
C0/6FA1:	DA      	PHX
C0/6FA2:	A620    	LDX $20
C0/6FA4:	A9FF    	LDA #$FF
C0/6FA6:	9F00207E	STA $7E2000,X
C0/6FAA:	FA      	PLX
C0/6FAB:	B95018  	LDA $1850,Y
C0/6FAE:	2918    	AND #$18		(Isolate the character's position)
C0/6FB0:	C51A    	CMP $1A		
C0/6FB2:	B005    	BCS $6FB9
C0/6FB4:	851A    	STA $1A
C0/6FB6:	8EFB07  	STX $07FB
C0/6FB9:	C221    	REP #$21
C0/6FBB:	8A      	TXA
C0/6FBC:	692900  	ADC #$0029
C0/6FBF:	AA      	TAX
C0/6FC0:	7B      	TDC 
C0/6FC1:	E220    	SEP #$20      (8 bit accum./memory)
C0/6FC3:	C8      	INY 
C0/6FC4:	C01000  	CPY #$0010
C0/6FC7:	D0B4    	BNE $6F7D
C0/6FC9:	AEFB07  	LDX $07FB
C0/6FCC:	BD6708  	LDA $0867,X
C0/6FCF:	0980    	ORA #$80
C0/6FD1:	9D6708  	STA $0867,X
C0/6FD4:	E41E    	CPX $1E
C0/6FD6:	D003    	BNE $6FDB
C0/6FD8:	4C6570  	JMP $7065
C0/6FDB:	A41E    	LDY $1E
C0/6FDD:	C220    	REP #$20      (16 bit accum./memory)
C0/6FDF:	B97A08  	LDA $087A,Y
C0/6FE2:	9D7A08  	STA $087A,X
C0/6FE5:	7B      	TDC 
C0/6FE6:	E220    	SEP #$20      (8 bit accum./memory)
C0/6FE8:	B98008  	LDA $0880,Y
C0/6FEB:	2930    	AND #$30
C0/6FED:	851A    	STA $1A
C0/6FEF:	BD8008  	LDA $0880,X
C0/6FF2:	29CF    	AND #$CF
C0/6FF4:	051A    	ORA $1A
C0/6FF6:	9D8008  	STA $0880,X
C0/6FF9:	B98108  	LDA $0881,Y
C0/6FFC:	2930    	AND #$30
C0/6FFE:	851A    	STA $1A
C0/7000:	BD8108  	LDA $0881,X
C0/7003:	29CF    	AND #$CF
C0/7005:	051A    	ORA $1A
C0/7007:	9D8108  	STA $0881,X
C0/700A:	B96808  	LDA $0868,Y
C0/700D:	9D6808  	STA $0868,X
C0/7010:	B97E08  	LDA $087E,Y
C0/7013:	9D7E08  	STA $087E,X
C0/7016:	B97F08  	LDA $087F,Y
C0/7019:	9D7F08  	STA $087F,X
C0/701C:	B97708  	LDA $0877,Y
C0/701F:	9D7708  	STA $0877,X
C0/7022:	B97C08  	LDA $087C,Y
C0/7025:	9D7C08  	STA $087C,X
C0/7028:	9D7D08  	STA $087D,X
C0/702B:	A900    	LDA #$00
C0/702D:	997C08  	STA $087C,Y
C0/7030:	997D08  	STA $087D,Y
C0/7033:	8C0442  	STY $4204
C0/7036:	A929    	LDA #$29
C0/7038:	8D0642  	STA $4206
C0/703B:	B96708  	LDA $0867,Y
C0/703E:	297F    	AND #$7F
C0/7040:	996708  	STA $0867,Y
C0/7043:	EA      	NOP
C0/7044:	EA      	NOP
C0/7045:	EA      	NOP
C0/7046:	AC1442  	LDY $4214
C0/7049:	995018  	STA $1850,Y
C0/704C:	8E0442  	STX $4204
C0/704F:	A929    	LDA #$29
C0/7051:	8D0642  	STA $4206
C0/7054:	BD6708  	LDA $0867,X
C0/7057:	0980    	ORA #$80
C0/7059:	9D6708  	STA $0867,X
C0/705C:	EA      	NOP
C0/705D:	EA      	NOP
C0/705E:	EA      	NOP
C0/705F:	AC1442  	LDY $4214
C0/7062:	995018  	STA $1850,Y
C0/7065:	A0D907  	LDY #$07D9
C0/7068:	8CFD07  	STY $07FD
C0/706B:	8CFF07  	STY $07FF
C0/706E:	8C0108  	STY $0801
C0/7071:	A901    	LDA #$01
C0/7073:	8D9807  	STA $0798
C0/7076:	60      	RTS
 
C0/7077:	A600    	LDX $00         ; prep loop iterator
C0/7079:	9B      	TXY             ; X = 0000, Y = 0000
C0/707A:	B95018  	LDA $1850,Y     ; character flags (backrow/order/party/etc)
C0/707D:	9D6708  	STA $0867,X     ; update character's object data
C0/7080:	C221    	REP #$21        ; 16-bit A, carry clear
C0/7082:	8A      	TXA
C0/7083:	692900  	ADC #$0029
C0/7086:	AA      	TAX             ; point to next object data block
C0/7087:	7B      	TDC             ; A = 0000
C0/7088:	E220    	SEP #$20        ; 8-bit A
C0/708A:	C8      	INY             ; point to next character flag byte
C0/708B:	C01000  	CPY #$0010      ; update all 16 characters
C0/708E:	D0EA    	BNE $707A
C0/7090:	60      	RTS
 
C0/7091:	A600    	LDX $00
C0/7093:	9B      	TXY
C0/7094:	BD6708  	LDA $0867,X
C0/7097:	29E7    	AND #$E7
C0/7099:	851A    	STA $1A
C0/709B:	B95018  	LDA $1850,Y
C0/709E:	2918    	AND #$18
C0/70A0:	051A    	ORA $1A
C0/70A2:	995018  	STA $1850,Y
C0/70A5:	C221    	REP #$21
C0/70A7:	8A      	TXA
C0/70A8:	692900  	ADC #$0029
C0/70AB:	AA      	TAX
C0/70AC:	7B      	TDC 
C0/70AD:	E220    	SEP #$20      (8 bit accum./memory)
C0/70AF:	C8      	INY 
C0/70B0:	C01000  	CPY #$0010
C0/70B3:	D0DF    	BNE $7094
C0/70B5:	60      	RTS
 
C0/70B6:	A929    	LDA #$29	  (from C0/BE79, C0/BEE7)
C0/70B8:	8D0242  	STA $4202
C0/70BB:	A600    	LDX $00
C0/70BD:	8A      	TXA
C0/70BE:	4A      	LSR A
C0/70BF:	8D0342  	STA $4203
C0/70C2:	EA      	NOP
C0/70C3:	EA      	NOP
C0/70C4:	EA      	NOP
C0/70C5:	C220    	REP #$20      (16 bit accum./memory)
C0/70C7:	AD1642  	LDA $4216
C0/70CA:	9D9907  	STA $0799,X
C0/70CD:	7B      	TDC 
C0/70CE:	E220    	SEP #$20      (8 bit accum./memory)
C0/70D0:	E8      	INX
C0/70D1:	E8      	INX
C0/70D2:	E06200  	CPX #$0062
C0/70D5:	D0E6    	BNE $70BD
C0/70D7:	60      	RTS
 
C0/70D8:	CCFB07  	CPY $07FB
C0/70DB:	D011    	BNE $70EE
C0/70DD:	A0D907  	LDY #$07D9
C0/70E0:	8CFB07  	STY $07FB
C0/70E3:	8CFD07  	STY $07FD
C0/70E6:	8CFF07  	STY $07FF
C0/70E9:	8C0108  	STY $0801
C0/70EC:	802E    	BRA $711C
C0/70EE:	CCFD07  	CPY $07FD
C0/70F1:	D00E    	BNE $7101
C0/70F3:	A0D907  	LDY #$07D9
C0/70F6:	8CFD07  	STY $07FD
C0/70F9:	8CFF07  	STY $07FF
C0/70FC:	8C0108  	STY $0801
C0/70FF:	801B    	BRA $711C
C0/7101:	CCFF07  	CPY $07FF
C0/7104:	D00B    	BNE $7111
C0/7106:	A0D907  	LDY #$07D9
C0/7109:	8CFF07  	STY $07FF
C0/710C:	8C0108  	STY $0801
C0/710F:	800B    	BRA $711C
C0/7111:	CC0108  	CPY $0801
C0/7114:	D006    	BNE $711C
C0/7116:	A0D907  	LDY #$07D9
C0/7119:	8C0108  	STY $0801
C0/711C:	60      	RTS
 
C0/711D:	A400    	LDY $00
C0/711F:	B96708  	LDA $0867,Y
C0/7122:	2940    	AND #$40
C0/7124:	F014    	BEQ $713A
C0/7126:	B96708  	LDA $0867,Y
C0/7129:	2907    	AND #$07
C0/712B:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/712E:	D00A    	BNE $713A
C0/7130:	C220    	REP #$20      (16 bit accum./memory)
C0/7132:	A582    	LDA $82
C0/7134:	998D08  	STA $088D,Y
C0/7137:	7B      	TDC 
C0/7138:	E220    	SEP #$20      (8 bit accum./memory)
C0/713A:	C221    	REP #$21
C0/713C:	98      	TYA
C0/713D:	692900  	ADC #$0029
C0/7140:	A8      	TAY
C0/7141:	7B      	TDC 
C0/7142:	E220    	SEP #$20      (8 bit accum./memory)
C0/7144:	C09002  	CPY #$0290
C0/7147:	D0D6    	BNE $711F
C0/7149:	60      	RTS
 
C0/714A:	A20308  	LDX #$0803		   ; address of visible character data pointer
C0/714D:	8E8121  	STX $2181        ; set WRAM address
C0/7150:	A900    	LDA #$00         ; zero
C0/7152:	8D8321  	STA $2183        ; set WRAM bank
C0/7155:	641B    	STZ $1B          ; zero count of active objects
C0/7157:	ACFB07  	LDY $07FB        ; pointer to party character 1
C0/715A:	C0D907  	CPY #$07D9       ; is this character showing [?]
C0/715D:	F03B    	BEQ $719A		     ; branch if ^
C0/715F:	B96708  	LDA $0867,Y      ; this character's object settings
C0/7162:	2940    	AND #$40         ; isolate "Enabled"
C0/7164:	D012    	BNE $7178	       ; branch if ^
C0/7166:	A0D907  	LDY #$07D9       ; pointer to "showing character" data
C0/7169:	8CFB07  	STY $07FB        ; set character 1 as "showing" [?]
C0/716C:	8CFD07  	STY $07FD        ; set character 2 pointer to "showing" [?]
C0/716F:	8CFF07  	STY $07FF        ; set character 3 pointer to "showing" [?]
C0/7172:	8C0108  	STY $0801        ; set character 4 pointer to "showing" [?]
C0/7175:	4C4F72  	JMP $724F

C0/7178:	B96708  	LDA $0867,Y		->5
C0/717B:	2907    	AND #$07
C0/717D:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/7180:	D018    	BNE $719A		<-4
C0/7182:	A582    	LDA $82
C0/7184:	998D08  	STA $088D,Y
C0/7187:	A583    	LDA $83
C0/7189:	998E08  	STA $088E,Y
C0/718C:	ADFB07  	LDA $07FB
C0/718F:	8D8021  	STA $2180
C0/7192:	ADFC07  	LDA $07FC
C0/7195:	8D8021  	STA $2180
C0/7198:	E61B    	INC $1B          ; increment total # of active objects

C0/719A:	ACFD07  	LDY $07FD		     ; pointer to character 2 object data
C0/719D:	C0D907  	CPY #$07D9       ; is this character showing [?]
C0/71A0:	F038    	BEQ $71DA        ; branch if ^
C0/71A2:	B96708  	LDA $0867,Y
C0/71A5:	2940    	AND #$40
C0/71A7:	D00F    	BNE $71B8		<-8
C0/71A9:	A0D907  	LDY #$07D9
C0/71AC:	8CFD07  	STY $07FD
C0/71AF:	8CFF07  	STY $07FF
C0/71B2:	8C0108  	STY $0801
C0/71B5:	4C4F72  	JMP $724F		<-6

C0/71B8:	B96708  	LDA $0867,Y		->8
C0/71BB:	2907    	AND #$07
C0/71BD:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/71C0:	D018    	BNE $71DA		<-7
C0/71C2:	A582    	LDA $82
C0/71C4:	998D08  	STA $088D,Y
C0/71C7:	A583    	LDA $83
C0/71C9:	998E08  	STA $088E,Y
C0/71CC:	ADFD07  	LDA $07FD
C0/71CF:	8D8021  	STA $2180
C0/71D2:	ADFE07  	LDA $07FE
C0/71D5:	8D8021  	STA $2180
C0/71D8:	E61B    	INC $1B          ; increment total # of active objects

C0/71DA:	ACFF07  	LDY $07FF		     ; pointer to character 3 object data
C0/71DD:	C0D907  	CPY #$07D9       ; is this character showing [?]
C0/71E0:	F034    	BEQ $7216	       ; branch if ^
C0/71E2:	B96708  	LDA $0867,Y
C0/71E5:	2940    	AND #$40
C0/71E7:	D00B    	BNE $71F4		<-10
C0/71E9:	A0D907  	LDY #$07D9
C0/71EC:	8CFF07  	STY $07FF
C0/71EF:	8C0108  	STY $0801
C0/71F2:	805B    	BRA $724F		<-6
C0/71F4:	B96708  	LDA $0867,Y		->10
C0/71F7:	2907    	AND #$07
C0/71F9:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/71FC:	D018    	BNE $7216		<-9
C0/71FE:	A582    	LDA $82
C0/7200:	998D08  	STA $088D,Y
C0/7203:	A583    	LDA $83
C0/7205:	998E08  	STA $088E,Y
C0/7208:	ADFF07  	LDA $07FF
C0/720B:	8D8021  	STA $2180
C0/720E:	AD0008  	LDA $0800
C0/7211:	8D8021  	STA $2180
C0/7214:	E61B    	INC $1B          ; increment total # of active objects

C0/7216:	AC0108  	LDY $0801		     ; pointer to character 4 object data
C0/7219:	C0D907  	CPY #$07D9       ; is this character showing [?]
C0/721C:	F031    	BEQ $724F		     ; branch if ^
C0/721E:	B96708  	LDA $0867,Y
C0/7221:	2940    	AND #$40
C0/7223:	D008    	BNE $722D		<-11
C0/7225:	A0D907  	LDY #$07D9
C0/7228:	8C0108  	STY $0801
C0/722B:	8022    	BRA $724F		<-6
C0/722D:	B96708  	LDA $0867,Y		->11
C0/7230:	2907    	AND #$07
C0/7232:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/7235:	D018    	BNE $724F		<-6
C0/7237:	A582    	LDA $82
C0/7239:	998D08  	STA $088D,Y
C0/723C:	A583    	LDA $83
C0/723E:	998E08  	STA $088E,Y
C0/7241:	AD0108  	LDA $0801
C0/7244:	8D8021  	STA $2180
C0/7247:	AD0208  	LDA $0802
C0/724A:	8D8021  	STA $2180
C0/724D:	E61B    	INC $1B          ; increment total # of active objects

C0/724F:	A600    	LDX $00		       ; clear X
C0/7251:	BC9907  	LDY $0799,X		   ; first object data pointer
C0/7254:	CCFB07  	CPY $07FB        ; matches character 1
C0/7257:	F03C    	BEQ $7295		     ; branch to next if ^
C0/7259:	CCFD07  	CPY $07FD        ; matches character 2
C0/725C:	F037    	BEQ $7295		     ; branch to next if ^
C0/725E:	CCFF07  	CPY $07FF        ; matches character 3
C0/7261:	F032    	BEQ $7295	       ; branch to next if ^
C0/7263:	CC0108  	CPY $0801        ; matches character 4
C0/7266:	F02D    	BEQ $7295		     ; branch to next if ^
C0/7268:	B96708  	LDA $0867,Y      ; object data flags
C0/726B:	2940    	AND #$40         ; "Enabled/Active"
C0/726D:	F026    	BEQ $7295		     ; branch if not ^
C0/726F:	B96708  	LDA $0867,Y      ; object data flags
C0/7272:	2907    	AND #$07         ; which party
C0/7274:	CD6D1A  	CMP $1A6D		     ; in the active party
C0/7277:	D01C    	BNE $7295		     ; branch to next if not ^
C0/7279:	A582    	LDA $82          ; current map index (lo)
C0/727B:	998D08  	STA $088D,Y      ; set this character's map index
C0/727E:	A583    	LDA $83          ; current map index (hi)
C0/7280:	998E08  	STA $088E,Y      ; set this character's map index
C0/7283:	BD9907  	LDA $0799,X      ; this character's data offset (lo)
C0/7286:	8D8021  	STA $2180        ; write to WRAM (showing character)
C0/7289:	851C    	STA $1C          ; save it
C0/728B:	BD9A07  	LDA $079A,X      ; this character's data offset (hi)
C0/728E:	8D8021  	STA $2180        ; write to WRAM (showing character)
C0/7291:	851D    	STA $1D          ; save it
C0/7293:	E61B    	INC $1B          ; increment total # of active objects

C0/7295:	E8      	INX			-        ; point to next object
C0/7296:	E8      	INX              ; point to next object
C0/7297:	E02000  	CPX #$0020       ; checked 16 objects (all characters)
C0/729A:	D0B5    	BNE $7251		     ; loop until all checked

C0/729C:	A9B0    	LDA #$B0
C0/729E:	8D8021  	STA $2180
C0/72A1:	A907    	LDA #$07
C0/72A3:	8D8021  	STA $2180
C0/72A6:	E61B    	INC $1B          ; increment total # of active objects
C0/72A8:	A600    	LDX $00
C0/72AA:	BC9907  	LDY $0799,X		->16
C0/72AD:	B96708  	LDA $0867,Y
C0/72B0:	2940    	AND #$40
C0/72B2:	F024    	BEQ $72D8		<-14
C0/72B4:	B96708  	LDA $0867,Y
C0/72B7:	2907    	AND #$07
C0/72B9:	F00F    	BEQ $72CA		<-15
C0/72BB:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/72BE:	F018    	BEQ $72D8		<-14
C0/72C0:	DA      	PHX
C0/72C1:	BE8D08  	LDX $088D,Y
C0/72C4:	9B      	TXY
C0/72C5:	FA      	PLX
C0/72C6:	C482    	CPY $82
C0/72C8:	D00E    	BNE $72D8		<-14
C0/72CA:	BD9907  	LDA $0799,X		->15
C0/72CD:	8D8021  	STA $2180
C0/72D0:	BD9A07  	LDA $079A,X
C0/72D3:	8D8021  	STA $2180
C0/72D6:	E61B    	INC $1B          ; increment total # of active objects
C0/72D8:	E8      	INX			->14
C0/72D9:	E8      	INX
C0/72DA:	E02000  	CPX #$0020
C0/72DD:	D0CB    	BNE $72AA		<-16
C0/72DF:	A22000  	LDX #$0020
C0/72E2:	BC9907  	LDY $0799,X		->18
C0/72E5:	B96708  	LDA $0867,Y
C0/72E8:	2940    	AND #$40
C0/72EA:	F00E    	BEQ $72FA		<-17
C0/72EC:	BD9907  	LDA $0799,X
C0/72EF:	8D8021  	STA $2180
C0/72F2:	BD9A07  	LDA $079A,X
C0/72F5:	8D8021  	STA $2180
C0/72F8:	E61B    	INC $1B          ; increment total # of active objects
C0/72FA:	E8      	INX			->17
C0/72FB:	E8      	INX
C0/72FC:	E06000  	CPX #$0060
C0/72FF:	D0E1    	BNE $72E2		<-18
C0/7301:	A51B    	LDA $1B
C0/7303:	0A      	ASL A
C0/7304:	85DD    	STA $DD
C0/7306:	9C9807  	STZ $0798
C0/7309:	60      	RTS
 
C0/730A:	000C    	
C0/730C:	1824      	

C0/730E:	A559    	LDA $59
C0/730F:	D022  	BNE $7334
C0/7312:	B97C08  	LDA $087C,Y
C0/7315:	2940    	AND #$40
C0/7317:	F01B    	BEQ $7334
C0/7319:	A6E5    	LDX $E5
C0/731B:	E00000  	CPX #$0000
C0/731E:	D014    	BNE $7334
C0/7320:	A5E7    	LDA $E7
C0/7322:	C9CA    	CMP #$CA
C0/7324:	D00E    	BNE $7334
C0/7326:	A584    	LDA $84
C0/7328:	D00A    	BNE $7334
C0/732A:	AD5E05  	LDA $055E
C0/732D:	D005    	BNE $7334
C0/732F:	C09002  	CPY #$0290
C0/7332:	B001    	BCS $7335
C0/7334:	60      	RTS
 
C0/7335:	B97A08  	LDA $087A,Y
C0/7338:	851E    	STA $1E
C0/733A:	8522    	STA $22
C0/733C:	1A      	INC A
C0/733D:	2586    	AND $86
C0/733F:	8520    	STA $20
C0/7341:	A51E    	LDA $1E
C0/7343:	3A      	DEC A
C0/7344:	2586    	AND $86
C0/7346:	8524    	STA $24
C0/7348:	B97B08  	LDA $087B,Y
C0/734B:	18      	CLC
C0/734C:	6920    	ADC #$20
C0/734E:	8521    	STA $21
C0/7350:	8525    	STA $25
C0/7352:	B97B08  	LDA $087B,Y
C0/7355:	3A      	DEC A
C0/7356:	2587    	AND $87
C0/7358:	18      	CLC
C0/7359:	6920    	ADC #$20
C0/735B:	851F    	STA $1F
C0/735D:	B97B08  	LDA $087B,Y
C0/7360:	1A      	INC A
C0/7361:	2587    	AND $87
C0/7363:	18      	CLC
C0/7364:	6920    	ADC #$20
C0/7366:	8523    	STA $23
C0/7368:	A97E    	LDA #$7E
C0/736A:	48      	PHA
C0/736B:	AB      	PLB
C0/736C:	641B    	STZ $1B
C0/736E:	B21E    	LDA ($1E)
C0/7370:	C920    	CMP #$20
C0/7372:	901C    	BCC $7390
C0/7374:	E61B    	INC $1B
C0/7376:	B220    	LDA ($20)
C0/7378:	C920    	CMP #$20
C0/737A:	9014    	BCC $7390
C0/737C:	E61B    	INC $1B
C0/737E:	B222    	LDA ($22)
C0/7380:	C920    	CMP #$20
C0/7382:	900C    	BCC $7390
C0/7384:	E61B    	INC $1B
C0/7386:	B224    	LDA ($24)
C0/7388:	C920    	CMP #$20
C0/738A:	9004    	BCC $7390
C0/738C:	7B      	TDC 
C0/738D:	48      	PHA
C0/738E:	AB      	PLB
C0/738F:	60      	RTS
 
C0/7390:	851A    	STA $1A 		(from C0/7372, C0/737A, C0/7382, C0/738A)
C0/7392:	7B      	TDC 
C0/7393:	48      	PHA
C0/7394:	AB      	PLB
C0/7395:	8C6205  	STY $0562
C0/7398:	A51A    	LDA $1A
C0/739A:	AA      	TAX
C0/739B:	BC9907  	LDY $0799,X
C0/739E:	8C6005  	STY $0560
C0/73A1:	A51B    	LDA $1B
C0/73A3:	8D5F05  	STA $055F
C0/73A6:	A901    	LDA #$01
C0/73A8:	8D5E05  	STA $055E
C0/73AB:	60      	RTS
 
C0/73AC:	AD5E05  	LDA $055E		(from only C0/013D)
C0/73AF:	C901    	CMP #$01
C0/73B1:	D01B    	BNE $73CE
C0/73B3:	AC0308  	LDY $0803
C0/73B6:	B96908  	LDA $0869,Y
C0/73B9:	D013    	BNE $73CE
C0/73BB:	B96A08  	LDA $086A,Y
C0/73BE:	290F    	AND #$0F
C0/73C0:	D00C    	BNE $73CE
C0/73C2:	B96C08  	LDA $086C,Y
C0/73C5:	D007    	BNE $73CE
C0/73C7:	B96D08  	LDA $086D,Y
C0/73CA:	290F    	AND #$0F
C0/73CC:	F001    	BEQ $73CF
C0/73CE:	60      	RTS
 
C0/73CF:	A902    	LDA #$02		(from C0/73CC)
C0/73D1:	8D5E05  	STA $055E
C0/73D4:	AC6005  	LDY $0560
C0/73D7:	C220    	REP #$20      	(16 bit accum./memory)
C0/73D9:	B96A08  	LDA $086A,Y
C0/73DC:	4A      	LSR A
C0/73DD:	4A      	LSR A
C0/73DE:	4A      	LSR A
C0/73DF:	4A      	LSR A
C0/73E0:	8526    	STA $26
C0/73E2:	B96D08  	LDA $086D,Y
C0/73E5:	4A      	LSR A
C0/73E6:	4A      	LSR A
C0/73E7:	4A      	LSR A
C0/73E8:	4A      	LSR A
C0/73E9:	8528    	STA $28
C0/73EB:	7B      	TDC 
C0/73EC:	E220    	SEP #$20      	(8 bit accum./memory)
C0/73EE:	6427    	STZ $27
C0/73F0:	6429    	STZ $29
C0/73F2:	A526    	LDA $26
C0/73F4:	8D5705  	STA $0557
C0/73F7:	38      	SEC 
C0/73F8:	ED4105  	SBC $0541
C0/73FB:	1005    	BPL $7402
C0/73FD:	E627    	INC $27
C0/73FF:	4502    	EOR $02
C0/7401:	1A      	INC A
C0/7402:	8526    	STA $26
C0/7404:	A528    	LDA $28
C0/7406:	8D5805  	STA $0558
C0/7409:	38      	SEC 
C0/740A:	ED4205  	SBC $0542
C0/740D:	1005    	BPL $7414
C0/740F:	E629    	INC $29
C0/7411:	4502    	EOR $02
C0/7413:	1A      	INC A
C0/7414:	8528    	STA $28
C0/7416:	C902    	CMP #$02
C0/7418:	B009    	BCS $7423
C0/741A:	A526    	LDA $26
C0/741C:	C902    	CMP #$02
C0/741E:	B003    	BCS $7423
C0/7420:	4CBB74  	JMP $74BB	

C0/7423:	A528    	LDA $28
C0/7425:	C526    	CMP $26
C0/7427:	B024    	BCS $744D
C0/7429:	C220    	REP #$20      	(16 bit accum./memory)
C0/742B:	EB      	XBA
C0/742C:	0A      	ASL A
C0/742D:	8D0442  	STA $4204
C0/7430:	7B      	TDC 
C0/7431:	E220    	SEP #$20      (8 bit accum./memory)
C0/7433:	A526    	LDA $26
C0/7435:	8D0642  	STA $4206
C0/7438:	EA      	NOP
C0/7439:	EA      	NOP
C0/743A:	EA      	NOP
C0/743B:	EA      	NOP
C0/743C:	EA      	NOP
C0/743D:	EA      	NOP
C0/743E:	EA      	NOP
C0/743F:	AE1442  	LDX $4214
C0/7442:	8E4905  	STX $0549
C0/7445:	A20002  	LDX #$0200
C0/7448:	8E4705  	STX $0547
C0/744B:	8024    	BRA $7471
C0/744D:	A526    	LDA $26
C0/744F:	C220    	REP #$20      (16 bit accum./memory)
C0/7451:	EB      	XBA
C0/7452:	0A      	ASL A
C0/7453:	8D0442  	STA $4204
C0/7456:	7B      	TDC 
C0/7457:	E220    	SEP #$20      (8 bit accum./memory)
C0/7459:	A528    	LDA $28
C0/745B:	8D0642  	STA $4206
C0/745E:	EA      	NOP
C0/745F:	EA      	NOP
C0/7460:	EA      	NOP
C0/7461:	EA      	NOP
C0/7462:	EA      	NOP
C0/7463:	EA      	NOP
C0/7464:	EA      	NOP
C0/7465:	AE1442  	LDX $4214
C0/7468:	8E4705  	STX $0547
C0/746B:	A20002  	LDX #$0200
C0/746E:	8E4905  	STX $0549
C0/7471:	A527    	LDA $27
C0/7473:	F00E    	BEQ $7483
C0/7475:	C220    	REP #$20      (16 bit accum./memory)
C0/7477:	AD4705  	LDA $0547
C0/747A:	4502    	EOR $02
C0/747C:	1A      	INC A
C0/747D:	8D4705  	STA $0547
C0/7480:	7B      	TDC 
C0/7481:	E220    	SEP #$20      (8 bit accum./memory)
C0/7483:	A529    	LDA $29
C0/7485:	F00E    	BEQ $7495
C0/7487:	C220    	REP #$20      (16 bit accum./memory)
C0/7489:	AD4905  	LDA $0549
C0/748C:	4502    	EOR $02
C0/748E:	1A      	INC A
C0/748F:	8D4905  	STA $0549
C0/7492:	7B      	TDC 
C0/7493:	E220    	SEP #$20      (8 bit accum./memory)
C0/7495:	AE4705  	LDX $0547
C0/7498:	8E4B05  	STX $054B
C0/749B:	8E4F05  	STX $054F
C0/749E:	AE4905  	LDX $0549
C0/74A1:	8E4D05  	STX $054D
C0/74A4:	8E5105  	STX $0551
C0/74A7:	A600    	LDX $00
C0/74A9:	8E7300  	STX $0073
C0/74AC:	8E7500  	STX $0075
C0/74AF:	8E7700  	STX $0077
C0/74B2:	8E7900  	STX $0079
C0/74B5:	8E7B00  	STX $007B
C0/74B8:	8E7D00  	STX $007D
C0/74BB:	B97F08  	LDA $087F,Y
C0/74BE:	0A      	ASL A
C0/74BF:	0A      	ASL A
C0/74C0:	0A      	ASL A
C0/74C1:	851A    	STA $1A
C0/74C3:	B96808  	LDA $0868,Y
C0/74C6:	29E7    	AND #$E7
C0/74C8:	051A    	ORA $1A
C0/74CA:	996808  	STA $0868,Y
C0/74CD:	AD5F05  	LDA $055F
C0/74D0:	18      	CLC
C0/74D1:	6902    	ADC #$02
C0/74D3:	2903    	AND #$03
C0/74D5:	997F08  	STA $087F,Y
C0/74D8:	AA      	TAX
C0/74D9:	BF2D58C0	LDA $C0582D,X
C0/74DD:	997708  	STA $0877,Y
C0/74E0:	AD6D1A  	LDA $1A6D		(Load the active party)
C0/74E3:	8D5D05  	STA $055D
C0/74E6:	B96708  	LDA $0867,Y
C0/74E9:	2907    	AND #$07
C0/74EB:	8D6D1A  	STA $1A6D		(Store to the active party)
C0/74EE:	B97C08  	LDA $087C,Y
C0/74F1:	29F0    	AND #$F0
C0/74F3:	0904    	ORA #$04
C0/74F5:	997C08  	STA $087C,Y
C0/74F8:	997D08  	STA $087D,Y
C0/74FB:	A0D907  	LDY #$07D9
C0/74FE:	8CFD07  	STY $07FD
C0/7501:	8CFF07  	STY $07FF
C0/7504:	8C0108  	STY $0801
C0/7507:	AC6205  	LDY $0562
C0/750A:	7B      	TDC 
C0/750B:	998208  	STA $0882,Y
C0/750E:	AD5F05  	LDA $055F
C0/7511:	997F08  	STA $087F,Y
C0/7514:	AA      	TAX
C0/7515:	BF2D58C0	LDA $C0582D,X
C0/7519:	997708  	STA $0877,Y
C0/751C:	B97C08  	LDA $087C,Y
C0/751F:	997D08  	STA $087D,Y
C0/7522:	29F0    	AND #$F0
C0/7524:	0904    	ORA #$04
C0/7526:	997C08  	STA $087C,Y
C0/7529:	B98908  	LDA $0889,Y
C0/752C:	85E5    	STA $E5
C0/752E:	8DF405  	STA $05F4
C0/7531:	B98A08  	LDA $088A,Y
C0/7534:	85E6    	STA $E6
C0/7536:	8DF505  	STA $05F5
C0/7539:	B98B08  	LDA $088B,Y
C0/753C:	18      	CLC
C0/753D:	69CA    	ADC #$CA
C0/753F:	85E7    	STA $E7
C0/7541:	8DF605  	STA $05F6
C0/7544:	A20000  	LDX #$0000
C0/7547:	8E9405  	STX $0594
C0/754A:	A9CA    	LDA #$CA
C0/754C:	8D9605  	STA $0596
C0/754F:	A901    	LDA #$01
C0/7551:	8DC705  	STA $05C7
C0/7554:	A20300  	LDX #$0003
C0/7557:	86E8    	STX $E8
C0/7559:	AC0308  	LDY $0803
C0/755C:	B97C08  	LDA $087C,Y
C0/755F:	997D08  	STA $087D,Y
C0/7562:	29F0    	AND #$F0
C0/7564:	0904    	ORA #$04
C0/7566:	997C08  	STA $087C,Y
C0/7569:	A5E1    	LDA $E1
C0/756B:	0920    	ORA #$20
C0/756D:	85E1    	STA $E1
C0/756F:	A901    	LDA #$01
C0/7571:	8D9807  	STA $0798
C0/7574:	20ED2F  	JSR $2FED
C0/7577:	60      	RTS

 
C0/7578:	A547    	LDA $47
C0/757A:	2903    	AND #$03
C0/757C:	AA      	TAX
C0/757D:	BF0A73C0	LDA $C0730A,X
C0/7581:	85DC    	STA $DC
C0/7583:	A906    	LDA #$06
C0/7585:	85DE    	STA $DE

C0/7587:	7B      	TDC 
C0/7588:	E220    	SEP #$20      (8 bit accum./memory)
C0/758A:	A5DC    	LDA $DC
C0/758C:	AA      	TAX
C0/758D:	BC0308  	LDY $0803,X
C0/7590:	84DA    	STY $DA
C0/7592:	C5DD    	CMP $DD
C0/7594:	9003    	BCC $7599
C0/7596:	4C5676  	JMP $7656      ; continue execution without checking wait counter

C0/7599:	B96908  	LDA $0869,Y
C0/759C:	D0F8    	BNE $7596
C0/759E:	B96A08  	LDA $086A,Y
C0/75A1:	290F    	AND #$0F
C0/75A3:	D0F1    	BNE $7596
C0/75A5:	B96C08  	LDA $086C,Y
C0/75A8:	D0EC    	BNE $7596
C0/75AA:	B96D08  	LDA $086D,Y
C0/75AD:	290F    	AND #$0F
C0/75AF:	D0E5    	BNE $7596
C0/75B1:	B97C08  	LDA $087C,Y
C0/75B4:	307E    	BMI $7634
C0/75B6:	B96808  	LDA $0868,Y
C0/75B9:	29E0    	AND #$E0
C0/75BB:	C980    	CMP #$80
C0/75BD:	F075    	BEQ $7634
C0/75BF:	B98C08  	LDA $088C,Y
C0/75C2:	29C0    	AND #$C0
C0/75C4:	D06E    	BNE $7634
C0/75C6:	C0B007  	CPY #$07B0
C0/75C9:	F06F    	BEQ $763A
C0/75CB:	BE7A08  	LDX $087A,Y
C0/75CE:	8C0442  	STY $4204
C0/75D1:	A929    	LDA #$29
C0/75D3:	8D0642  	STA $4206
C0/75D6:	48      	PHA           (3 cycles)
C0/75D7:	68      	PLA           (4 cycles)
C0/75D8:	48      	PHA           (3 cycles)
C0/75D9:	68      	PLA           (4 cycles)
C0/75DA:	AD1442  	LDA $4214
C0/75DD:	0A      	ASL A
C0/75DE:	DF00207E	CMP $7E2000,X
C0/75E2:	D006    	BNE $75EA
C0/75E4:	A9FF    	LDA #$FF
C0/75E6:	9F00207E	STA $7E2000,X
C0/75EA:	B96708  	LDA $0867,Y
C0/75ED:	104B    	BPL $763A
C0/75EF:	20E17C  	JSR $7CE1
C0/75F2:	BE7A08  	LDX $087A,Y
C0/75F5:	BF00007F	LDA $7F0000,X
C0/75F9:	AA      	TAX
C0/75FA:	BF00767E	LDA $7E7600,X
C0/75FE:	2903    	AND #$03
C0/7600:	998808  	STA $0888,Y
C0/7603:	A5DC    	LDA $DC
C0/7605:	D022    	BNE $7629
C0/7607:	B97C08  	LDA $087C,Y
C0/760A:	290F    	AND #$0F
C0/760C:	C902    	CMP #$02
C0/760E:	D019    	BNE $7629
C0/7610:	A5B8    	LDA $B8
C0/7612:	2904    	AND #$04
C0/7614:	F006    	BEQ $761C
C0/7616:	A5B2    	LDA $B2
C0/7618:	C902    	CMP #$02
C0/761A:	F00B    	BEQ $7627
C0/761C:	BE7A08  	LDX $087A,Y
C0/761F:	AD1442  	LDA $4214
C0/7622:	0A      	ASL A
C0/7623:	9F00207E	STA $7E2000,X
C0/7627:	8011    	BRA $763A
C0/7629:	BE7A08  	LDX $087A,Y
C0/762C:	AD1442  	LDA $4214
C0/762F:	0A      	ASL A
C0/7630:	9F00207E	STA $7E2000,X
C0/7634:	202D7C  	JSR $7C2D
C0/7637:	200E73  	JSR $730E
C0/763A:	B97C08  	LDA $087C,Y
C0/763D:	290F    	AND #$0F
C0/763F:	3A      	DEC A
C0/7640:	D003    	BNE $7645
C0/7642:	4CE976  	JMP $76E9

C0/7645:	3A      	DEC A
C0/7646:	D003    	BNE $764B
C0/7648:	4CDE76  	JMP $76DE
C0/764B:	3A      	DEC A
C0/764C:	F014    	BEQ $7662
C0/764E:	3A      	DEC A
C0/764F:	F016    	BEQ $7667
C0/7651:	CC0308  	CPY $0803
C0/7654:	F011    	BEQ $7667

C0/7656:	E6DC    	INC $DC
C0/7658:	E6DC    	INC $DC
C0/765A:	C6DE    	DEC $DE
C0/765C:	F003    	BEQ $7661
C0/765E:	4C8775  	JMP $7587

C0/7661:	60      	RTS
 
C0/7662:	20B17B  	JSR $7BB1 		(from C0/764C)
C0/7665:	80EF    	BRA $7656
C0/7667:	C220    	REP #$20      (16 bit accum./memory)
C0/7669:	7B      	TDC 
C0/766A:	997108  	STA $0871,Y
C0/766D:	997308  	STA $0873,Y
C0/7670:	E220    	SEP #$20      (8 bit accum./memory)
C0/7672:	A5E5    	LDA $E5
C0/7674:	C900    	CMP #$00
C0/7676:	D063    	BNE $76DB
C0/7678:	A5E6    	LDA $E6
C0/767A:	C900    	CMP #$00
C0/767C:	D05D    	BNE $76DB
C0/767E:	A5E7    	LDA $E7
C0/7680:	C9CA    	CMP #$CA
C0/7682:	D057    	BNE $76DB
C0/7684:	B97D08  	LDA $087D,Y
C0/7687:	CC0308  	CPY $0803
C0/768A:	D00E    	BNE $769A
C0/768C:	B96708  	LDA $0867,Y
C0/768F:	2907    	AND #$07
C0/7691:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/7694:	D004    	BNE $769A
C0/7696:	A902    	LDA #$02
C0/7698:	8035    	BRA $76CF
C0/769A:	B97D08  	LDA $087D,Y
C0/769D:	290F    	AND #$0F
C0/769F:	C902    	CMP #$02
C0/76A1:	D004    	BNE $76A7
C0/76A3:	A900    	LDA #$00
C0/76A5:	8028    	BRA $76CF
C0/76A7:	851A    	STA $1A
C0/76A9:	B97C08  	LDA $087C,Y
C0/76AC:	29F0    	AND #$F0
C0/76AE:	051A    	ORA $1A
C0/76B0:	997C08  	STA $087C,Y
C0/76B3:	B97C08  	LDA $087C,Y
C0/76B6:	2920    	AND #$20
C0/76B8:	D013    	BNE $76CD
C0/76BA:	B96808  	LDA $0868,Y
C0/76BD:	2918    	AND #$18
C0/76BF:	4A      	LSR A
C0/76C0:	4A      	LSR A
C0/76C1:	4A      	LSR A
C0/76C2:	997F08  	STA $087F,Y
C0/76C5:	AA      	TAX
C0/76C6:	BF2D58C0	LDA $C0582D,X
C0/76CA:	997708  	STA $0877,Y
C0/76CD:	8087    	BRA $7656
C0/76CF:	851A    	STA $1A
C0/76D1:	B97C08  	LDA $087C,Y
C0/76D4:	29F0    	AND #$F0
C0/76D6:	051A    	ORA $1A
C0/76D8:	997C08  	STA $087C,Y
C0/76DB:	4C5676  	JMP $7656

C0/76DE:	ADB91E  	LDA $1EB9
C0/76E1:	3003    	BMI $76E6
C0/76E3:	205F48  	JSR $485F         ; handle sprite tiles, movement [?]
C0/76E6:	4C5676  	JMP $7656

C0/76E9:	B98208  	LDA $0882,Y       ; action queue wait counter
C0/76EC:	F00A    	BEQ $76F8         ; branch if zero ^
C0/76EE:	3A      	DEC A             ; else, decrement wait counter
C0/76EF:	998208  	STA $0882,Y       ; update wait counter
C0/76F2:	4C5676  	JMP $7656

C0/76F5:	4C8377  	JMP $7783

C0/76F8:	B98608  	LDA $0886,Y
C0/76FB:	F0F8    	BEQ $76F5
C0/76FD:	B97E08  	LDA $087E,Y
C0/7700:	F0F3    	BEQ $76F5
C0/7702:	C0B007  	CPY #$07B0
C0/7705:	F062    	BEQ $7769
C0/7707:	85B3    	STA $B3
C0/7709:	C905    	CMP #$05
C0/770B:	B05C    	BCS $7769
C0/770D:	20037D  	JSR $7D03
C0/7710:	A61E    	LDX $1E
C0/7712:	B97C08  	LDA $087C,Y
C0/7715:	3052    	BMI $7769
C0/7717:	2910    	AND #$10
C0/7719:	D021    	BNE $773C
C0/771B:	BF00207E	LDA $7E2000,X
C0/771F:	301B    	BMI $773C
C0/7721:	C220    	REP #$20      (16 bit accum./memory)
C0/7723:	7B      	TDC 
C0/7724:	997108  	STA $0871,Y
C0/7727:	997308  	STA $0873,Y
C0/772A:	E220    	SEP #$20      (8 bit accum./memory)
C0/772C:	C0B007  	CPY #$07B0
C0/772F:	F005    	BEQ $7736
C0/7731:	CC0308  	CPY $0803
C0/7734:	D003    	BNE $7739
C0/7736:	20087E  	JSR $7E08
C0/7739:	4C5676  	JMP $7656

C0/773C:	8C0442  	STY $4204
C0/773F:	A929    	LDA #$29
C0/7741:	8D0642  	STA $4206
C0/7744:	B97C08  	LDA $087C,Y
C0/7747:	3020    	BMI $7769
C0/7749:	B96808  	LDA $0868,Y
C0/774C:	29E0    	AND #$E0
C0/774E:	C980    	CMP #$80
C0/7750:	F017    	BEQ $7769
C0/7752:	B98C08  	LDA $088C,Y
C0/7755:	29C0    	AND #$C0
C0/7757:	D010    	BNE $7769
C0/7759:	AD1442  	LDA $4214
C0/775C:	0A      	ASL A
C0/775D:	9F00207E	STA $7E2000,X
C0/7761:	BF00007F	LDA $7F0000,X
C0/7765:	AA      	TAX
C0/7766:	20A97C  	JSR $7CA9
C0/7769:	20777E  	JSR $7E77
C0/776C:	C0B007  	CPY #$07B0
C0/776F:	F005    	BEQ $7776
C0/7771:	CC0308  	CPY $0803
C0/7774:	D003    	BNE $7779
C0/7776:	20087E  	JSR $7E08
C0/7779:	B98608  	LDA $0886,Y
C0/777C:	3A      	DEC A
C0/777D:	998608  	STA $0886,Y
C0/7780:	4C5676  	JMP $7656

; Execute pending action queue for object (if exists)

C0/7783:	C220    	REP #$20       ; 16-bit A
C0/7785:	B98308  	LDA $0883,Y    ; object pending action queue pointer
C0/7788:	852A    	STA $2A        ; save pointer
C0/778A:	7B      	TDC            ; zero A/B
C0/778B:	E220    	SEP #$20       ; 8-bit A
C0/778D:	B98508  	LDA $0885,Y    ; object pending action queue bank
C0/7790:	852C    	STA $2C        ; save bank
C0/7792:	A72A    	LDA [$2A]      ; get action op
C0/7794:	3006    	BMI $779C      ; branch if $80 set
C0/7796:	997708  	STA $0877,Y    ; set new object graphic index [?]
C0/7799:	4C0178  	JMP $7801      ; advance queue and continue

C0/779C:	C9A0    	CMP #$A0	     ; 0x80 <= op < 0xA0
C0/779E:	9003    	BCC $77A3      ; branch if ^
C0/77A0:	4CBF77  	JMP $77BF      ; else, jump

; Move {0x1C >> 2} steps in direction {0x03}
; Op >= 0x80 and < 0xA0
C0/77A3:	38      	SEC 		       ; set carry
C0/77A4:	E980    	SBC #$80       ; reduce op to 0x00-0x1F
C0/77A6:	851A    	STA $1A        ; save op
C0/77A8:	2903    	AND #$03       ; isolate "direction"
C0/77AA:	997F08  	STA $087F,Y    ; set facing direction
C0/77AD:	1A      	INC A          ; +1
C0/77AE:	997E08  	STA $087E,Y    ; set moving direction
C0/77B1:	A51A    	LDA $1A        ; get op
C0/77B3:	4A      	LSR A          ; >> 1
C0/77B4:	4A      	LSR A          ; >> 2
C0/77B5:	1A      	INC A          ; + 1
C0/77B6:	998608  	STA $0886,Y    ; number of steps
C0/77B9:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/77BC:	4CE976  	JMP $76E9      ; continue

; Op >= 0xA0
C0/77BF:	C9B0    	CMP #$B0       ; op >= 0xB0
C0/77C1:	B01E    	BCS $77E1      ; branch if so ^

; Move Diagonally one Step
C0/77C3:	38      	SEC            ; set carry
C0/77C4:	E99C    	SBC #$9C       ; reduce op to 0x04-0x13
C0/77C6:	851A    	STA $1A        ; save op
C0/77C8:	1A      	INC A          ; +1
C0/77C9:	997E08  	STA $087E,Y    ; set complex moving direction
C0/77CC:	A51A    	LDA $1A        ; get op
C0/77CE:	AA      	TAX            ; index it
C0/77CF:	BF547FC0	LDA $C07F54,X  ; facing direction based on movement
C0/77D3:	997F08  	STA $087F,Y    ; set facing direction
C0/77D6:	A901    	LDA #$01       ; one step
C0/77D8:	998608  	STA $0886,Y    ; set ^ steps to take
C0/77DB:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/77DE:	4CE976  	JMP $76E9      ; continue

; Op >= 0xB0
C0/77E1:	C9C6    	CMP #$C6
C0/77E3:	B009    	BCS $77EE

; Set object speed (negative moves backwards)
C0/77E5:	38      	SEC            ; set carry
C0/77E6:	E9C0    	SBC #$C0       ; reduce op to -0x10 - 0x06
C0/77E8:	997508  	STA $0875,Y    ; set object speed
C0/77EB:	4C0178  	JMP $7801      ; advance queue and continue

; Op >= 0xC6
C0/77EE:	38      	SEC            ; set carry
C0/77EF:	E9C6    	SBC #$C6       ; reduce to 0x00-0x39
C0/77F1:	0A      	ASL A          ; x2
C0/77F2:	AA      	TAX            ; index to jump table
C0/77F3:	C220    	REP #$20       ; 16-bit A
C0/77F5:	BF0778C0	LDA $C07807,X  ; command routine address
C0/77F9:	852D    	STA $2D        ; save address
C0/77FB:	7B      	TDC            ; zero A/B
C0/77FC:	E220    	SEP #$20       ; 8-bit A
C0/77FE:	6C2D00  	JMP ($002D)    ; jump to routine

C0/7801:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7804:	4CE976  	JMP $76E9      ; continue queue execution

; Object Action Queue Special Commands

C0/7807:	7B78 ; $C6 - $787B: Enable walking animation when moving
C0/7809:	8678 ; $C7 - $7886: Disable walking animation when moving
C0/780B:	9178 ; $C8 - $7891: Set entity layering priority to {A}
C0/780D:	057A ; $C9 - $7A05: Place entity on vehicle {A}
C0/780F:	0000 ; $CA - null
C0/7811:	0000 ; $CB - null
C0/7813:	AB78 ; $CC - $78AB: Face up
C0/7815:	B778 ; $CD - $78B7: Face right
C0/7817:	C478 ; $CE - $78C4: Face down
C0/7819:	D178 ; $CF - $78D1: Face left
C0/781B:	DE78 ; $D0 - $78DE: Unhide
C0/781D:	2879 ; $D1 - $7928: Hide
C0/781F:	0000 ; $D2 - null
C0/7821:	0000 ; $D3 - null
C0/7823:	0000 ; $D4 - null
C0/7825:	1E7A ; $D5 - $7A1E: Set position to X,Y {A,B}
C0/7827:	0000 ; $D6 - null
C0/7829:	657A ; $D7 - $7A65: Center entity on screen
C0/782B:	0000 ; $D8 - null
C0/782D:	0000 ; $D9 - null
C0/782F:	0000 ; $DA - null
C0/7831:	0000 ; $DB - null
C0/7833:	947A ; $DC - $7A94: Jump (low)
C0/7835:	9C7A ; $DD - $7A9C: Jump (high)
C0/7837:	0000 ; $DE - null
C0/7839:	0000 ; $DF - null
C0/783B:	A47A ; $E0 - $7AA4: Pause for {A} frames
C0/783D:	6979 ; $E1 - $7969: Set $1E80 event bit {A}
C0/783F:	8379 ; $E2 - $7983: Set $1EA0 event bit {A}
C0/7841:	9D79 ; $E3 - $799D: Set $1EC0 event bit {A}
C0/7843:	B779 ; $E4 - $79B7: Clear $1E80 event bit {A}
C0/7845:	D179 ; $E5 - $79D1: Clear $1EA0 event bit {A}
C0/7847:	EB79 ; $E6 - $79EB: Clear $1EC0 event bit {A}
C0/7849:	0000 ; $E7 - null
C0/784B:	0000 ; $E8 - null
C0/784D:	0000 ; $E9 - null
C0/784F:	0000 ; $EA - null
C0/7851:	0000 ; $EB - null
C0/7853:	0000 ; $EC - null
C0/7855:	0000 ; $ED - null
C0/7857:	0000 ; $EE - null
C0/7859:	0000 ; $EF - null
C0/785B:	0000 ; $F0 - null
C0/785D:	0000 ; $F1 - null
C0/785F:	0000 ; $F2 - null
C0/7861:	0000 ; $F3 - null
C0/7863:	0000 ; $F4 - null
C0/7865:	0000 ; $F5 - null
C0/7867:	0000 ; $F6 - null
C0/7869:	0000 ; $F7 - null
C0/786B:	0000 ; $F8 - null
C0/786D:	CF7A ; $F9 - $7ACF: Jump out of queue to subroutine ${C}/${B,A}
C0/786F:	0C7B ; $FA - $7B0C: 50% chance branch backwards {A} bytes
C0/7871:	197B ; $FB - $7B19: 50% chance branch forward {A} bytes
C0/7873:	267B ; $FC - $7B26: Branch backwards {A} bytes
C0/7875:	4B7B ; $FD - $7B4B: Branch forwards {A} bytes
C0/7877:	0000 ; $FE - null

C0/7879:	70


; Enable walking animation

C0/787B:	B96808  	LDA $0868,Y
C0/787E:	0901    	ORA #$01
C0/7880:	996808  	STA $0868,Y
C0/7883:	4C0178  	JMP $7801      ; advance queue and continue


; Disable walking animation

C0/7886:	B96808  	LDA $0868,Y
C0/7889:	29FE    	AND #$FE
C0/788B:	996808  	STA $0868,Y
C0/788E:	4C0178  	JMP $7801      ; advance queue and continue


; Set entity layering priority

C0/7891:	A00100  	LDY #$0001     ; first arg index
C0/7894:	B72A    	LDA [$2A],Y    ; load first arg
C0/7896:	0A      	ASL A
C0/7897:	851A    	STA $1A
C0/7899:	A4DA    	LDY $DA        ; pointer to object data
C0/789B:	B96808  	LDA $0868,Y    ; object sprite settings
C0/789E:	29F9    	AND #$F9       ; mask out layer priority
C0/78A0:	051A    	ORA $1A        ; add new priority
C0/78A2:	996808  	STA $0868,Y    ; update sprite settings
C0/78A5:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/78A8:	4C0178  	JMP $7801       ; advance queue and continue


; Face up

C0/78AB:	7B      	TDC 
C0/78AC:	997F08  	STA $087F,Y
C0/78AF:	A904    	LDA #$04
C0/78B1:	997708  	STA $0877,Y
C0/78B4:	4C0178  	JMP $7801      ; advance queue and continue


; Face right

C0/78B7:	A901    	LDA #$01
C0/78B9:	997F08  	STA $087F,Y
C0/78BC:	A947    	LDA #$47
C0/78BE:	997708  	STA $0877,Y
C0/78C1:	4C0178  	JMP $7801      ; advance queue and continue


; Face down

C0/78C4:	A902    	LDA #$02
C0/78C6:	997F08  	STA $087F,Y
C0/78C9:	A901    	LDA #$01
C0/78CB:	997708  	STA $0877,Y
C0/78CE:	4C0178  	JMP $7801      ; advance queue and continue


; Face left

C0/78D1:	A903    	LDA #$03
C0/78D3:	997F08  	STA $087F,Y
C0/78D6:	A907    	LDA #$07
C0/78D8:	997708  	STA $0877,Y
C0/78DB:	4C0178  	JMP $7801      ; advance queue and continue


; Unhide object ($D0)

C0/78DE:	B96708  	LDA $0867,Y     ; object settings
C0/78E1:	3041    	BMI $7924       ; branch if visible TODO BUG - Will corrupt stack. Should be BMI $7925
C0/78E3:	0980    	ORA #$80        ; set "Visible" flag
C0/78E5:	996708  	STA $0867,Y     ; update object settings
C0/78E8:	B96808  	LDA $0868,Y     ; sprite settings
C0/78EB:	29F9    	AND #$F9        ; set layer priority to "Default"
C0/78ED:	996808  	STA $0868,Y     ; update sprite settings
C0/78F0:	B98008  	LDA $0880,Y     ; upper sprite flags
C0/78F3:	29CF    	AND #$CF        ; mask out layer priority
C0/78F5:	0920    	ORA #$20        ; set priority to 2
C0/78F7:	998008  	STA $0880,Y     ; update upper sprite flags
C0/78FA:	B98108  	LDA $0881,Y     ; lower sprite flags
C0/78FD:	29CF    	AND #$CF        ; mask out layer priority
C0/78FF:	0920    	ORA #$20        ; set priority to 2
C0/7901:	998108  	STA $0881,Y     ; update lower sprite flags
C0/7904:	5A      	PHY             ; save object data offset
C0/7905:	8C0442  	STY $4204       ; set dividend
C0/7908:	A929    	LDA #$29        ; size of object data block
C0/790A:	8D0642  	STA $4206       ; set divisor
C0/790D:	EA      	NOP
C0/790E:	EA      	NOP
C0/790F:	EA      	NOP
C0/7910:	EA      	NOP
C0/7911:	EA      	NOP
C0/7912:	EA      	NOP
C0/7913:	EA      	NOP             ; wait for division
C0/7914:	AC1442  	LDY $4214       ; get object slot index
C0/7917:	C01000  	CPY #$0010      ; compare to "character" range
C0/791A:	B008    	BCS $7924       ; finish if not a character
C0/791C:	B95018  	LDA $1850,Y     ; character flags
C0/791F:	0980    	ORA #$80        ; set "Visible"
C0/7921:	995018  	STA $1850,Y     ; update character flags
C0/7924:	7A      	PLY             ; restore object data offset
C0/7925:	4C0178  	JMP $7801       ; advance queue and continue


; Hide current entity

C0/7928:	B96708  	LDA $0867,Y
C0/792B:	297F    	AND #$7F
C0/792D:	996708  	STA $0867,Y
C0/7930:	7B      	TDC 
C0/7931:	997D08  	STA $087D,Y
C0/7934:	B97C08  	LDA $087C,Y
C0/7937:	29F0    	AND #$F0
C0/7939:	997C08  	STA $087C,Y
C0/793C:	BE7A08  	LDX $087A,Y
C0/793F:	A9FF    	LDA #$FF
C0/7941:	9F00207E	STA $7E2000,X
C0/7945:	5A      	PHY
C0/7946:	8C0442  	STY $4204
C0/7949:	A929    	LDA #$29
C0/794B:	8D0642  	STA $4206
C0/794E:	EA      	NOP
C0/794F:	EA      	NOP
C0/7950:	EA      	NOP
C0/7951:	EA      	NOP
C0/7952:	EA      	NOP
C0/7953:	EA      	NOP
C0/7954:	EA      	NOP
C0/7955:	AC1442  	LDY $4214
C0/7958:	C01000  	CPY #$0010
C0/795B:	B008    	BCS $7965
C0/795D:	B95018  	LDA $1850,Y
C0/7960:	297F    	AND #$7F
C0/7962:	995018  	STA $1850,Y
C0/7965:	7A      	PLY
C0/7966:	4C0178  	JMP $7801      ; advance queue and continue


Set event bit $1E80 + xx ($1E80 + $0xx)

C0/7969:	5A      	PHY
C0/796A:	A00100  	LDY #$0001
C0/796D:	B72A    	LDA [$2A],Y
C0/796F:	20EDBA  	JSR $BAED
C0/7972:	B9801E  	LDA $1E80,Y
C0/7975:	1FFCBAC0	ORA $C0BAFC,X
C0/7979:	99801E  	STA $1E80,Y
C0/797C:	7A      	PLY
C0/797D:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7980:	4C0178  	JMP $7801      ; advance queue and continue


Set event bit $1EA0 + xx ($1E80 + $1xx)

C0/7983:	5A      	PHY
C0/7984:	A00100  	LDY #$0001
C0/7987:	B72A    	LDA [$2A],Y
C0/7989:	20EDBA  	JSR $BAED
C0/798C:	B9A01E  	LDA $1EA0,Y
C0/798F:	1FFCBAC0	ORA $C0BAFC,X
C0/7993:	99A01E  	STA $1EA0,Y
C0/7996:	7A      	PLY
C0/7997:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/799A:	4C0178  	JMP $7801      ; advance queue and continue


Set event bit $1EC0 + xx ($1E80 + $2xx)

C0/799D:	5A      	PHY
C0/799E:	A00100  	LDY #$0001
C0/79A1:	B72A    	LDA [$2A],Y
C0/79A3:	20EDBA  	JSR $BAED
C0/79A6:	B9C01E  	LDA $1EC0,Y
C0/79A9:	1FFCBAC0	ORA $C0BAFC,X
C0/79AD:	99C01E  	STA $1EC0,Y
C0/79B0:	7A      	PLY
C0/79B1:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/79B4:	4C0178  	JMP $7801      ; advance queue and continue


Clear event bit $1E80 + xx ($1E80 + $0xx)

C0/79B7:	5A      	PHY
C0/79B8:	A00100  	LDY #$0001
C0/79BB:	B72A    	LDA [$2A],Y
C0/79BD:	20EDBA  	JSR $BAED
C0/79C0:	B9801E  	LDA $1E80,Y
C0/79C3:	3F04BBC0	AND $C0BB04,X
C0/79C7:	99801E  	STA $1E80,Y
C0/79CA:	7A      	PLY
C0/79CB:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/79CE:	4C0178  	JMP $7801      ; advance queue and continue


Clear event bit $1EA0 + xx ($1E80 + $1xx)

C0/79D1:	5A      	PHY
C0/79D2:	A00100  	LDY #$0001
C0/79D5:	B72A    	LDA [$2A],Y
C0/79D7:	20EDBA  	JSR $BAED
C0/79DA:	B9A01E  	LDA $1EA0,Y
C0/79DD:	3F04BBC0	AND $C0BB04,X
C0/79E1:	99A01E  	STA $1EA0,Y
C0/79E4:	7A      	PLY
C0/79E5:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/79E8:	4C0178  	JMP $7801      ; advance queue and continue


Clear event bit $1EC0 + xx ($1E80 + $2xx)

C0/79EB:	5A      	PHY
C0/79EC:	A00100  	LDY #$0001
C0/79EF:	B72A    	LDA [$2A],Y
C0/79F1:	20EDBA  	JSR $BAED
C0/79F4:	B9C01E  	LDA $1EC0,Y
C0/79F7:	3F04BBC0	AND $C0BB04,X
C0/79FB:	99C01E  	STA $1EC0,Y
C0/79FE:	7A      	PLY
C0/79FF:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7A02:	4C0178  	JMP $7801      ; advance queue and continue


; Place entity on vehicle xx

C0/7A05:	A00100  	LDY #$0001
C0/7A08:	B72A    	LDA [$2A],Y
C0/7A0A:	29E0    	AND #$E0
C0/7A0C:	851A    	STA $1A
C0/7A0E:	A4DA    	LDY $DA
C0/7A10:	B96808  	LDA $0868,Y
C0/7A13:	051A    	ORA $1A
C0/7A15:	996808  	STA $0868,Y
C0/7A18:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7A1B:	4C0178  	JMP $7801      ; advance queue and continue


; Set position to (xx, yy)

C0/7A1E:	BE7A08  	LDX $087A,Y    ; pointer to current position in map data
C0/7A21:	A9FF    	LDA #$FF       ; null
C0/7A23:	9F00207E	STA $7E2000,X  ; set map data position to "null" (no obj)
C0/7A27:	A00100  	LDY #$0001     ; first arg
C0/7A2A:	B72A    	LDA [$2A],Y    ; X coord
C0/7A2C:	C220    	REP #$20       ; 16-bit A
C0/7A2E:	0A      	ASL A
C0/7A2F:	0A      	ASL A
C0/7A30:	0A      	ASL A
C0/7A31:	0A      	ASL A          ; << 4 (x16)
C0/7A32:	851E    	STA $1E        ; save
C0/7A34:	7B      	TDC            ; clear A/B
C0/7A35:	E220    	SEP #$20       ; 8-bit A
C0/7A37:	C8      	INY            ; second arg index
C0/7A38:	B72A    	LDA [$2A],Y    ; Y coord
C0/7A3A:	A4DA    	LDY $DA        ; object data offset
C0/7A3C:	C220    	REP #$20       ; 16-bit A
C0/7A3E:	0A      	ASL A
C0/7A3F:	0A      	ASL A
C0/7A40:	0A      	ASL A
C0/7A41:	0A      	ASL A          ; << 4 (x16)
C0/7A42:	996D08  	STA $086D,Y    ; set Y position
C0/7A45:	A51E    	LDA $1E        ; X coord * 16
C0/7A47:	996A08  	STA $086A,Y    ; set X position
C0/7A4A:	E220    	SEP #$20       ; 8-bit A
C0/7A4C:	7B      	TDC            ; clear A/B
C0/7A4D:	996C08  	STA $086C,Y    ; zero tile position (Y)
C0/7A50:	996908  	STA $0869,Y    ; zero tile position (X)
C0/7A53:	20E17C  	JSR $7CE1      ; set new pointer to map data position
C0/7A56:	201756  	JSR $5617      ; update sprite layer priorities [?]
C0/7A59:	209A7B  	JSR $7B9A      ; advance action queue pointer (skip arg1)
C0/7A5C:	209A7B  	JSR $7B9A      ; advance action queue pointer (skip arg2)
C0/7A5F:	209A7B  	JSR $7B9A      ; advance action queue pointer (for next op)
C0/7A62:	4C5676  	JMP $7656      ; continue execution without checking wait counter


; Center entity on screen

C0/7A65:	BE7A08  	LDX $087A,Y
C0/7A68:	A9FF    	LDA #$FF
C0/7A6A:	9F00207E	STA $7E2000,X
C0/7A6E:	C220    	REP #$20      (16 bit accum./memory)
C0/7A70:	AE0308  	LDX $0803
C0/7A73:	BD6A08  	LDA $086A,X
C0/7A76:	996A08  	STA $086A,Y
C0/7A79:	BD6D08  	LDA $086D,X
C0/7A7C:	996D08  	STA $086D,Y
C0/7A7F:	7B      	TDC 
C0/7A80:	E220    	SEP #$20      (8 bit accum./memory)
C0/7A82:	996C08  	STA $086C,Y
C0/7A85:	996908  	STA $0869,Y
C0/7A88:	20E17C  	JSR $7CE1    
C0/7A8B:	201756  	JSR $5617
C0/7A8E:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7A91:	4C5676  	JMP $7656      ; continue execution without checking wait counter


; Make entity jump (low)

C0/7A94:	A90F    	LDA #$0F
C0/7A96:	998708  	STA $0887,Y
C0/7A99:	4C0178  	JMP $7801      ; advance queue and continue


; Make entity jump (high)

C0/7A9C:	A95F    	LDA #$5F
C0/7A9E:	998708  	STA $0887,Y
C0/7AA1:	4C0178  	JMP $7801      ; advance queue and continue


Pause for xx/60 seconds

C0/7AA4:	C220    	REP #$20      (16 bit accum./memory)
C0/7AA6:	7B      	TDC 
C0/7AA7:	997108  	STA $0871,Y
C0/7AAA:	997308  	STA $0873,Y
C0/7AAD:	E220    	SEP #$20      (8 bit accum./memory)
C0/7AAF:	C0B007  	CPY #$07B0
C0/7AB2:	F005    	BEQ $7AB9
C0/7AB4:	CC0308  	CPY $0803
C0/7AB7:	D003    	BNE $7ABC
C0/7AB9:	20087E  	JSR $7E08
C0/7ABC:	5A      	PHY
C0/7ABD:	A00100  	LDY #$0001
C0/7AC0:	B72A    	LDA [$2A],Y
C0/7AC2:	7A      	PLY
C0/7AC3:	998208  	STA $0882,Y
C0/7AC6:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7AC9:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7ACC:	4C5676  	JMP $7656      ; continue execution without checking wait counter


; Jump out of the queue to $aaaaaa+$CA0000

C0/7ACF:	AD5E05  	LDA $055E
C0/7AD2:	D035    	BNE $7B09
C0/7AD4:	A6E5    	LDX $E5
C0/7AD6:	E00000  	CPX #$0000
C0/7AD9:	D02E    	BNE $7B09
C0/7ADB:	A5E7    	LDA $E7
C0/7ADD:	C9CA    	CMP #$CA
C0/7ADF:	D028    	BNE $7B09
C0/7AE1:	5A      	PHY
C0/7AE2:	A00100  	LDY #$0001
C0/7AE5:	B72A    	LDA [$2A],Y
C0/7AE7:	85E5    	STA $E5
C0/7AE9:	C8      	INY 
C0/7AEA:	B72A    	LDA [$2A],Y
C0/7AEC:	85E6    	STA $E6
C0/7AEE:	C8      	INY 
C0/7AEF:	B72A    	LDA [$2A],Y
C0/7AF1:	18      	CLC
C0/7AF2:	69CA    	ADC #$CA
C0/7AF4:	85E7    	STA $E7
C0/7AF6:	A00300  	LDY #$0003
C0/7AF9:	8CE800  	STY $00E8      ; add current thread to event stack [?]
C0/7AFC:	7A      	PLY
C0/7AFD:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7B00:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7B03:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7B06:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7B09:	4C5676  	JMP $7656      ; continue execution without checking wait counter


Randomly branch backward xx bytes in the queue

C0/7B0C:	202E06  	JSR $062E          (Random number generator)
C0/7B0F:	C980    	CMP #$80
C0/7B11:	B013    	BCS $7B26
C0/7B13:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7B16:	4C0178  	JMP $7801      ; advance queue and continue


Randomly branch forward xx bytes in the queue

C0/7B19:	202E06  	JSR $062E          (Random number generator)
C0/7B1C:	C980    	CMP #$80
C0/7B1E:	B02B    	BCS $7B4B
C0/7B20:	209A7B  	JSR $7B9A      ; advance action queue pointer
C0/7B23:	4C0178  	JMP $7801      ; advance queue and continue


Branch backward xx bytes in the queue

C0/7B26:	A00100  	LDY #$0001
C0/7B29:	B72A    	LDA [$2A],Y
C0/7B2B:	851A    	STA $1A
C0/7B2D:	A4DA    	LDY $DA
C0/7B2F:	B98308  	LDA $0883,Y
C0/7B32:	38      	SEC 
C0/7B33:	E51A    	SBC $1A
C0/7B35:	998308  	STA $0883,Y
C0/7B38:	B98408  	LDA $0884,Y
C0/7B3B:	E900    	SBC #$00
C0/7B3D:	998408  	STA $0884,Y
C0/7B40:	B98508  	LDA $0885,Y
C0/7B43:	E900    	SBC #$00
C0/7B45:	998508  	STA $0885,Y
C0/7B48:	4CE976  	JMP $76E9


Branch forward xx bytes in the queue

C0/7B4B:	A00100  	LDY #$0001
C0/7B4E:	B72A    	LDA [$2A],Y
C0/7B50:	851A    	STA $1A
C0/7B52:	A4DA    	LDY $DA
C0/7B54:	B98308  	LDA $0883,Y
C0/7B57:	18      	CLC
C0/7B58:	651A    	ADC $1A
C0/7B5A:	998308  	STA $0883,Y
C0/7B5D:	B98408  	LDA $0884,Y
C0/7B60:	6900    	ADC #$00
C0/7B62:	998408  	STA $0884,Y
C0/7B65:	B98508  	LDA $0885,Y
C0/7B68:	6900    	ADC #$00
C0/7B6A:	998508  	STA $0885,Y
C0/7B6D:	4CE976  	JMP $76E9


End queue

C0/7B70:	7B      	TDC 
C0/7B71:	998508  	STA $0885,Y
C0/7B74:	B97C08  	LDA $087C,Y
C0/7B77:	29F0    	AND #$F0
C0/7B79:	997C08  	STA $087C,Y
C0/7B7C:	C220    	REP #$20      (16 bit accum./memory)
C0/7B7E:	7B      	TDC 
C0/7B7F:	997108  	STA $0871,Y
C0/7B82:	997308  	STA $0873,Y
C0/7B85:	998308  	STA $0883,Y
C0/7B88:	E220    	SEP #$20      (8 bit accum./memory)
C0/7B8A:	C0B007  	CPY #$07B0
C0/7B8D:	F005    	BEQ $7B94
C0/7B8F:	CC0308  	CPY $0803
C0/7B92:	D003    	BNE $7B97
C0/7B94:	20087E  	JSR $7E08
C0/7B97:	4C5676  	JMP $7656      ; continue execution without checking wait counter


; Advance action queue pointer by 1

C0/7B9A:	C221    	REP #$21        ; 16-bit A, clear carry
C0/7B9C:	B98308  	LDA $0883,Y     ; action queue pointer
C0/7B9F:	690100  	ADC #$0001      ; add one
C0/7BA2:	998308  	STA $0883,Y     ; advance pointer
C0/7BA5:	7B      	TDC             ; zero A/B
C0/7BA6:	E220    	SEP #$20        ; 8-bit A
C0/7BA8:	B98508  	LDA $0885,Y     ; action queue bank
C0/7BAB:	6900    	ADC #$00        ; add overflow
C0/7BAD:	998508  	STA $0885,Y     ; update bank
C0/7BB0:	60      	RTS

 
C0/7BB1:	202E06  	JSR $062E    (Random number generator)  (from C0/7662)
C0/7BB4:	2903    	AND #$03
C0/7BB6:	1A      	INC A
C0/7BB7:	85B3    	STA $B3
C0/7BB9:	20037D  	JSR $7D03
C0/7BBC:	A61E    	LDX $1E
C0/7BBE:	BF00207E	LDA $7E2000,X
C0/7BC2:	105B    	BPL $7C1F
C0/7BC4:	BF00007F	LDA $7F0000,X
C0/7BC8:	AA      	TAX
C0/7BC9:	BF00777E	LDA $7E7700,X
C0/7BCD:	1050    	BPL $7C1F
C0/7BCF:	B98808  	LDA $0888,Y
C0/7BD2:	3A      	DEC A
C0/7BD3:	D016    	BNE $7BEB
C0/7BD5:	BF00767E	LDA $7E7600,X
C0/7BD9:	2907    	AND #$07
C0/7BDB:	C901    	CMP #$01
C0/7BDD:	F016    	BEQ $7BF5
C0/7BDF:	BF00767E	LDA $7E7600,X
C0/7BE3:	2907    	AND #$07
C0/7BE5:	C904    	CMP #$04
C0/7BE7:	F00C    	BEQ $7BF5
C0/7BE9:	8034    	BRA $7C1F
C0/7BEB:	BF00767E	LDA $7E7600,X
C0/7BEF:	2907    	AND #$07
C0/7BF1:	C902    	CMP #$02
C0/7BF3:	D02A    	BNE $7C1F
C0/7BF5:	20A97C  	JSR $7CA9
C0/7BF8:	8C0442  	STY $4204
C0/7BFB:	A929    	LDA #$29
C0/7BFD:	8D0642  	STA $4206
C0/7C00:	EA      	NOP
C0/7C01:	EA      	NOP
C0/7C02:	EA      	NOP
C0/7C03:	EA      	NOP
C0/7C04:	EA      	NOP
C0/7C05:	EA      	NOP
C0/7C06:	EA      	NOP
C0/7C07:	EA      	NOP
C0/7C08:	AD1442  	LDA $4214
C0/7C0B:	0A      	ASL A
C0/7C0C:	A61E    	LDX $1E
C0/7C0E:	9F00207E	STA $7E2000,X
C0/7C12:	A5B3    	LDA $B3
C0/7C14:	997E08  	STA $087E,Y
C0/7C17:	3A      	DEC A
C0/7C18:	997F08  	STA $087F,Y
C0/7C1B:	20777E  	JSR $7E77
C0/7C1E:	60      	RTS

 
C0/7C1F:	7B      	TDC 			(from C0/7BE9, C0/7BF3)
C0/7C20:	997108  	STA $0871,Y
C0/7C23:	997208  	STA $0872,Y
C0/7C26:	997308  	STA $0873,Y
C0/7C29:	997408  	STA $0874,Y
C0/7C2C:	60      	RTS
 

C0/7C2D:	B96808  	LDA $0868,Y		(from C0/7634)
C0/7C30:	2906    	AND #$06
C0/7C32:	D035    	BNE $7C69
C0/7C34:	BE7A08  	LDX $087A,Y
C0/7C37:	BF00007F	LDA $7F0000,X
C0/7C3B:	AA      	TAX
C0/7C3C:	BF00767E	LDA $7E7600,X
C0/7C40:	C9F7    	CMP #$F7
C0/7C42:	F050    	BEQ $7C94
C0/7C44:	2904    	AND #$04
C0/7C46:	D04C    	BNE $7C94
C0/7C48:	BF00767E	LDA $7E7600,X
C0/7C4C:	2908    	AND #$08
C0/7C4E:	F008    	BEQ $7C58
C0/7C50:	B98008  	LDA $0880,Y
C0/7C53:	0930    	ORA #$30
C0/7C55:	998008  	STA $0880,Y
C0/7C58:	BF00767E	LDA $7E7600,X
C0/7C5C:	2910    	AND #$10
C0/7C5E:	F008    	BEQ $7C68
C0/7C60:	B98108  	LDA $0881,Y
C0/7C63:	0930    	ORA #$30
C0/7C65:	998108  	STA $0881,Y
C0/7C68:	60      	RTS


; Set split sprite priority
C0/7C69:	4A      	LSR A			        ; sprite priority /2
C0/7C6A:	3A      	DEC A             ; -1
C0/7C6B:	D013    	BNE $7C80         ; branch if not split priority [?]
C0/7C6D:	B98008  	LDA $0880,Y       ; upper sprite flags
C0/7C70:	0930    	ORA #$30          ; set max priority
C0/7C72:	998008  	STA $0880,Y       ; update flags
C0/7C75:	B98108  	LDA $0881,Y       ; lower sprite flags
C0/7C78:	29CF    	AND #$CF          ; set min priority
C0/7C7A:	0920    	ORA #$20         
C0/7C7C:	998108  	STA $0881,Y       ; update flags
C0/7C7F:	60      	RTS

; Set max sprite priority
C0/7C80:	3A      	DEC A			(from C0/7C6B)
C0/7C81:	D011    	BNE $7C94
C0/7C83:	B98008  	LDA $0880,Y
C0/7C86:	0930    	ORA #$30
C0/7C88:	998008  	STA $0880,Y
C0/7C8B:	B98108  	LDA $0881,Y
C0/7C8E:	0930    	ORA #$30
C0/7C90:	998108  	STA $0881,Y
C0/7C93:	60      	RTS

; Set min sprite priority 
C0/7C94:	B98008  	LDA $0880,Y		(from C0/7C42, C0/7C46, C0/7C81)
C0/7C97:	29CF    	AND #$CF
C0/7C99:	0920    	ORA #$20
C0/7C9B:	998008  	STA $0880,Y
C0/7C9E:	B98108  	LDA $0881,Y
C0/7CA1:	29CF    	AND #$CF
C0/7CA3:	0920    	ORA #$20
C0/7CA5:	998108  	STA $0881,Y
C0/7CA8:	60      	RTS

 
C0/7CA9:	B96808  	LDA $0868,Y		(from C0/7766, C0/7BF5)
C0/7CAC:	2906    	AND #$06
C0/7CAE:	D0B9    	BNE $7C69
C0/7CB0:	BF00767E	LDA $7E7600,X
C0/7CB4:	C9F7    	CMP #$F7
C0/7CB6:	F0DC    	BEQ $7C94
C0/7CB8:	2904    	AND #$04
C0/7CBA:	D0D8    	BNE $7C94
C0/7CBC:	BF00767E	LDA $7E7600,X
C0/7CC0:	2908    	AND #$08
C0/7CC2:	D00A    	BNE $7CCE
C0/7CC4:	B98008  	LDA $0880,Y
C0/7CC7:	29CF    	AND #$CF
C0/7CC9:	0920    	ORA #$20
C0/7CCB:	998008  	STA $0880,Y
C0/7CCE:	BF00767E	LDA $7E7600,X
C0/7CD2:	2910    	AND #$10
C0/7CD4:	D00A    	BNE $7CE0
C0/7CD6:	B98108  	LDA $0881,Y
C0/7CD9:	29CF    	AND #$CF
C0/7CDB:	0920    	ORA #$20
C0/7CDD:	998108  	STA $0881,Y
C0/7CE0:	60      	RTS
 
; Update X/Y based on map BG-1 clip [?]

C0/7CE1:	C220    	REP #$20       ; 16-bit A
C0/7CE3:	B96A08  	LDA $086A,Y    ; X-position data [?]
C0/7CE6:	4A      	LSR A          ;
C0/7CE7:	4A      	LSR A          ;
C0/7CE8:	4A      	LSR A          ;
C0/7CE9:	4A      	LSR A          ; shift down upper nibble
C0/7CEA:	E220    	SEP #$20       ; 8-bit A
C0/7CEC:	2586    	AND $86        ; BG-1 horizontal clip
C0/7CEE:	997A08  	STA $087A,Y    ; set X-position [?]
C0/7CF1:	C220    	REP #$20       ; 16-bit A
C0/7CF3:	B96D08  	LDA $086D,Y    ; Y-position data [?]
C0/7CF6:	4A      	LSR A          ;
C0/7CF7:	4A      	LSR A          ;
C0/7CF8:	4A      	LSR A          ;
C0/7CF9:	4A      	LSR A          ; shift down upper nibble
C0/7CFA:	E220    	SEP #$20       ; 8-bit A
C0/7CFC:	2587    	AND $87        ; BG-2 vertical clip
C0/7CFE:	997B08  	STA $087B,Y    ; set Y-position [?]
C0/7D01:	7B      	TDC            ; zero A/B
C0/7D02:	60      	RTS
 
; Get coords of tile to check in $1E,$1F

C0/7D03:	AA      	TAX			       ; index movement type
C0/7D04:	20E17C  	JSR $7CE1      ; update X/Y position based on BG-1 clip [?]
C0/7D07:	B97A08  	LDA $087A,Y    ; X-position [?]
C0/7D0A:	18      	CLC            ; clear carry
C0/7D0B:	7F207DC0	ADC $C07D20,X  ; add or subtract 1 based on direction
C0/7D0F:	2586    	AND $86        ; mask by BG-1 horizontal clip [?]
C0/7D11:	851E    	STA $1E        ; save X-coord of tile to inspect
C0/7D13:	B97B08  	LDA $087B,Y    ; Y-position [?]
C0/7D16:	18      	CLC            ; clear carry
C0/7D17:	7F257DC0	ADC $C07D25,X  ; add or subtract 1 based on direction
C0/7D1B:	2587    	AND $87        ; mask by BG-1 vertical clip [?]
C0/7D1D:	851F    	STA $1F        ; save Y-coord of tile to inspect
C0/7D1F:	60      	RTS
 
; Some movement data

C0/7D20:	00 ; $00 - Not moving
C0/7D21:	00 ; $01 - Up
C0/7D22:	01 ; $02 - Right
C0/7D23:	00 ; $03 - Down
C0/7D24:	FF ; $04 - Left

C0/7D25:  00 ; $00 - Not moving
C0/7D26:	FF ; $01 - Up
C0/7D27:	00 ; $02 - Right
C0/7D28:	01 ; $03 - Down
C0/7D29:	00 ; $04 - Left

; Background Scroll Speeds

C0/7D2A:	A673    	LDX $73	      ; BG1 horizontal scroll speed
C0/7D2C:	3032    	BMI $7D60     ; branch if negative
C0/7D2E:	C220    	REP #$20      ; 16-bit A
C0/7D30:	8A      	TXA           ; horizontal scroll speed
C0/7D31:	4A      	LSR A
C0/7D32:	4A      	LSR A
C0/7D33:	4A      	LSR A
C0/7D34:	4A      	LSR A         ; x16
C0/7D35:	E220    	SEP #$20      ; 8-bit A
C0/7D37:	8D0242  	STA $4202     ; prep multiplication
C0/7D3A:	AD5305  	LDA $0553     ; BG2 scroll rate multiplier
C0/7D3D:	8D0342  	STA $4203     ; prep multiplication
C0/7D40:	EA      	NOP
C0/7D41:	EA      	NOP
C0/7D42:	C220    	REP #$20      ; 16-bit A
C0/7D44:	AD1642  	LDA $4216     ; BG2 horizontal speed (based on BG1)
C0/7D47:	8577    	STA $77       ; save it

C0/7D49:	7B      	TDC           ; clear A/B
C0/7D4A:	E220    	SEP #$20      ; 8-bit A
C0/7D4C:	AD5505  	LDA $0555     ; BG3 scroll rate multiplier
C0/7D4F:	8D0342  	STA $4203     ; prep multiplication
C0/7D52:	EA      	NOP
C0/7D53:	EA      	NOP
C0/7D54:	C220    	REP #$20      ; 16-bit A
C0/7D56:	AD1642  	LDA $4216     ; BG3 horizontal speed (based on BG1)
C0/7D59:	857B    	STA $7B       ; save it

C0/7D5B:	7B      	TDC           ; clear A/B
C0/7D5C:	E220    	SEP #$20      ; 8-bit A
C0/7D5E:	8039    	BRA $7D99     ; branch to vertical scroll handling

; Negative horizontal scroll
C0/7D60:	C220    	REP #$20      ; 16-bit A
C0/7D62:	8A      	TXA           ; scroll speed
C0/7D63:	4502    	EOR $02       ; invert with #$FFFF
C0/7D65:	1A      	INC A         ; finish * -1 logic
C0/7D66:	4A      	LSR A
C0/7D67:	4A      	LSR A
C0/7D68:	4A      	LSR A
C0/7D69:	4A      	LSR A         ; positive speed x16
C0/7D6A:	E220    	SEP #$20      ; 8-bit A
C0/7D6C:	8D0242  	STA $4202     ; prep multiplication
C0/7D6F:	AD5305  	LDA $0553     ; BG2 scroll rate multiplier
C0/7D72:	8D0342  	STA $4203     ; prep multiplication
C0/7D75:	EA      	NOP
C0/7D76:	EA      	NOP
C0/7D77:	C220    	REP #$20      ; 16-bit A
C0/7D79:	AD1642  	LDA $4216     ; BG2 horizontal speed (based on BG1)
C0/7D7C:	4502    	EOR $02       ; invert it (#$FFFF)
C0/7D7E:	1A      	INC A         ; finish * -1 logic
C0/7D7F:	8577    	STA $77       ; save it

C0/7D81:	7B      	TDC           ; clear A/B
C0/7D82:	E220    	SEP #$20      ; 8-bit A
C0/7D84:	AD5505  	LDA $0555     ; BG3 scroll rate multiplier
C0/7D87:	8D0342  	STA $4203     ; prep multiplication
C0/7D8A:	EA      	NOP
C0/7D8B:	EA      	NOP
C0/7D8C:	C220    	REP #$20      ; 16-bit A
C0/7D8E:	AD1642  	LDA $4216     ; BG3 horizontal speed (based on BG1)
C0/7D91:	4502    	EOR $02       ; invert it (#$FFFF)
C0/7D93:	1A      	INC A         ; finish * -1 logic
C0/7D94:	857B    	STA $7B       ; save it

C0/7D96:	7B      	TDC           ; clear A/B
C0/7D97:	E220    	SEP #$20      ; 8-bit A

; Vertical scroll (positive)
C0/7D99:	A675    	LDX $75
C0/7D9B:	3031    	BMI $7DCE
C0/7D9D:	C220    	REP #$20      ; 16-bit A
C0/7D9F:	8A      	TXA
C0/7DA0:	4A      	LSR A
C0/7DA1:	4A      	LSR A
C0/7DA2:	4A      	LSR A
C0/7DA3:	4A      	LSR A
C0/7DA4:	E220    	SEP #$20      ; 8-bit A
C0/7DA6:	8D0242  	STA $4202     ; prep multiplication
C0/7DA9:	AD5405  	LDA $0554
C0/7DAC:	8D0342  	STA $4203     ; prep multiplication
C0/7DAF:	EA      	NOP
C0/7DB0:	EA      	NOP
C0/7DB1:	C220    	REP #$20      ; 16-bit A
C0/7DB3:	AD1642  	LDA $4216
C0/7DB6:	8579    	STA $79
C0/7DB8:	7B      	TDC 
C0/7DB9:	E220    	SEP #$20      ; 8-bit A
C0/7DBB:	AD5605  	LDA $0556
C0/7DBE:	8D0342  	STA $4203     ; prep multiplication
C0/7DC1:	EA      	NOP
C0/7DC2:	EA      	NOP
C0/7DC3:	C220    	REP #$20      ; 16-bit A
C0/7DC5:	AD1642  	LDA $4216
C0/7DC8:	857D    	STA $7D
C0/7DCA:	7B      	TDC 
C0/7DCB:	E220    	SEP #$20      ; 8-bit A
C0/7DCD:	60      	RTS
 
; Vertical scroll (negative)
C0/7DCE:	C220    	REP #$20      (from C0/7D9B)(16 bit accum./memory)
C0/7DD0:	8A      	TXA
C0/7DD1:	4502    	EOR $02       ; invert it (#$FFFF)
C0/7DD3:	1A      	INC A         ; finish * -1 logic
C0/7DD4:	4A      	LSR A
C0/7DD5:	4A      	LSR A
C0/7DD6:	4A      	LSR A
C0/7DD7:	4A      	LSR A
C0/7DD8:	E220    	SEP #$20      ; 8-bit A
C0/7DDA:	8D0242  	STA $4202     ; prep multiplication
C0/7DDD:	AD5405  	LDA $0554
C0/7DE0:	8D0342  	STA $4203     ; prep multiplication
C0/7DE3:	EA      	NOP
C0/7DE4:	EA      	NOP
C0/7DE5:	C220    	REP #$20      ; 16-bit A
C0/7DE7:	AD1642  	LDA $4216
C0/7DEA:	4502    	EOR $02       ; invert it (#$FFFF)
C0/7DEC:	1A      	INC A         ; finish * -1 logic
C0/7DED:	8579    	STA $79
C0/7DEF:	7B      	TDC 
C0/7DF0:	E220    	SEP #$20      ; 8-bit A
C0/7DF2:	AD5605  	LDA $0556
C0/7DF5:	8D0342  	STA $4203     ; prep multiplication
C0/7DF8:	EA      	NOP
C0/7DF9:	EA      	NOP
C0/7DFA:	C220    	REP #$20      ; 16-bit A
C0/7DFC:	AD1642  	LDA $4216
C0/7DFF:	4502    	EOR $02       ; invert it (#$FFFF)
C0/7E01:	1A      	INC A         ; finish * -1 logic
C0/7E02:	857D    	STA $7D
C0/7E04:	7B      	TDC 
C0/7E05:	E220    	SEP #$20      ; 8-bit A
C0/7E07:	60      	RTS

; Handle Screen Movement
C0/7E08:	AD5905  	LDA $0559	    ; "Screen Locked" (when character moves)
C0/7E0B:	F013    	BEQ $7E20     ; branch if not locked
C0/7E0D:	C0B007  	CPY #$07B0    ; "Camera" object offset [?]
C0/7E10:	D00D    	BNE $7E1F     ; exit if not camera (character is moving)
C0/7E12:	AE2110  	LDX $1021     ; camera's horizontal mvmt speed
C0/7E15:	8673    	STX $73       ; update BG1 horizontal scroll speed
C0/7E17:	AE2310  	LDX $1023     ; camera's vertical mvmt speed
C0/7E1A:	8675    	STX $75       ; update BG1 vertical scroll speed
C0/7E1C:	202A7D  	JSR $7D2A     ; update BG2 and BG3 scroll speeds
C0/7E1F:	60      	RTS
 

C0/7E20:	AC0308  	LDY $0803
C0/7E23:	AD2D06  	LDA $062D
C0/7E26:	C9FF    	CMP #$FF
C0/7E28:	F012    	BEQ $7E3C
C0/7E2A:	A5AF    	LDA $AF
C0/7E2C:	BE7108  	LDX $0871,Y
C0/7E2F:	1001    	BPL $7E32
C0/7E31:	3A      	DEC A
C0/7E32:	CD2C06  	CMP $062C
C0/7E35:	900C    	BCC $7E43
C0/7E37:	CD2D06  	CMP $062D
C0/7E3A:	B007    	BCS $7E43
C0/7E3C:	BE7108  	LDX $0871,Y
C0/7E3F:	8673    	STX $73
C0/7E41:	8008    	BRA $7E4B
C0/7E43:	A600    	LDX $00
C0/7E45:	8673    	STX $73
C0/7E47:	8677    	STX $77
C0/7E49:	867B    	STX $7B
C0/7E4B:	AD2F06  	LDA $062F
C0/7E4E:	C9FF    	CMP #$FF
C0/7E50:	F012    	BEQ $7E64
C0/7E52:	A5B0    	LDA $B0
C0/7E54:	BE7308  	LDX $0873,Y
C0/7E57:	1001    	BPL $7E5A
C0/7E59:	3A      	DEC A
C0/7E5A:	CD2E06  	CMP $062E          
C0/7E5D:	900C    	BCC $7E6B
C0/7E5F:	CD2F06  	CMP $062F
C0/7E62:	B007    	BCS $7E6B
C0/7E64:	BE7308  	LDX $0873,Y
C0/7E67:	8675    	STX $75
C0/7E69:	8008    	BRA $7E73
C0/7E6B:	A600    	LDX $00
C0/7E6D:	8675    	STX $75
C0/7E6F:	8679    	STX $79
C0/7E71:	867D    	STX $7D
C0/7E73:	202A7D  	JSR $7D2A
C0/7E76:	60      	RTS
 
C0/7E77:	B97508  	LDA $0875,Y        ; visible character's speed
C0/7E7A:	AA      	TAX                ; index it
C0/7E7B:	BFCA7EC0	LDA $C07ECA,X      ; speed multiplier
C0/7E7F:	851B    	STA $1B            ; store
C0/7E81:	B97E08  	LDA $087E,Y        ; movement direction
C0/7E84:	3A      	DEC A              ; get index [?]
C0/7E85:	0A      	ASL A              ; different index [?]
C0/7E86:	AA      	TAX                ; index it
C0/7E87:	BFD47EC0	LDA $C07ED4,X      ; direction's horizontal speed
C0/7E8B:	8D0242  	STA $4202          ; prep multiply
C0/7E8E:	A51B    	LDA $1B            ; speed multiplier
C0/7E90:	8D0342  	STA $4203          ; prep multiply
C0/7E93:	EA      	NOP
C0/7E94:	EA      	NOP
C0/7E95:	EA      	NOP                ; wait for processor
C0/7E96:	C220    	REP #$20           ; 16-bit A
C0/7E98:	AD1642  	LDA $4216          ; horizontal speed
C0/7E9B:	5FF47EC0	EOR $C07EF4,X      ; based on direction, make negative
C0/7E9F:	1001    	BPL $7EA2          ; branch if positive
C0/7EA1:	1A      	INC A              ; finish * -1 logic if negative
C0/7EA2:	997108  	STA $0871,Y        ; visible character's horizontal speed

C0/7EA5:	7B      	TDC                ; clear A/B
C0/7EA6:	E220    	SEP #$20           ; 8-bit A
C0/7EA8:	BF147FC0	LDA $C07F14,X      ; direction's vertical speed
C0/7EAC:	8D0242  	STA $4202          ; prep multiplication
C0/7EAF:	A51B    	LDA $1B            ; speed multiplier
C0/7EB1:	8D0342  	STA $4203          ; prep multiplication
C0/7EB4:	EA      	NOP
C0/7EB5:	EA      	NOP
C0/7EB6:	EA      	NOP                ; wait for processor
C0/7EB7:	C220    	REP #$20           ; 16-bit A
C0/7EB9:	AD1642  	LDA $4216          ; vertical speed
C0/7EBC:	5F347FC0	EOR $C07F34,X      ; based on direction, make negative
C0/7EC0:	1001    	BPL $7EC3          ; branch if positive
C0/7EC2:	1A      	INC A              ; finish * -1 logic if negative
C0/7EC3:	997308  	STA $0873,Y        ; visible character's vertical speed

C0/7EC6:	7B      	TDC                ; clear A/B
C0/7EC7:	E220    	SEP #$20           ; 8-bit A
C0/7EC9:	60      	RTS

; Speed multipliers
C0/7ECA:	01 02    	
C0/7ECC:	04 08    	
C0/7ECE:	10 20    	
C0/7ED0:	10 08    	
C0/7ED2:	04 02    	

; Horizontal speeds (by direction) (2nd bytes unused)
C0/7ED4:	0000  ; $01 - "Up"
C0/7ED6:	4000  ; $02 - "Right"
C0/7ED8:	0000  ; $03 - "Down"
C0/7EDA:	4000  ; $04 - "Left"
C0/7EDC:	4000  ; $05 - "Up/Right"
C0/7EDE:	4000  ; $06 - "Down/Right"
C0/7EE0:	4000  ; $07 - "Down/Left"
C0/7EE2:	4000  ; $08 - "Up/Left"
C0/7EE4:	2000  ; $09 - "Right/Up 1x2"
C0/7EE6:	4000  ; $0A - "Right/Up 2x1"
C0/7EE8:	4000  ; $0B - "Right/Down 2x1"
C0/7EEA:	2000  ; $0C - "Right/Down 1x2"
C0/7EEC:	2000  ; $0D - "Left/Down 1x2"
C0/7EEE:	4000  ; $0E - "Left/Down 2x1"
C0/7EF0:	4000  ; $0F - "Left/Up 2x1"
C0/7EF2:	2000  ; $10 - "Left/Up 1x2"

; Horizontal negatives (by direction)
C0/7EF4:	0000  ; $01 - "Up"            
C0/7EF6:	0000  ; $02 - "Right"         
C0/7EF8:	0000  ; $03 - "Down"          
C0/7EFA:	FFFF  ; $04 - "Left"          
C0/7EFC:	0000  ; $05 - "Up/Right"      
C0/7EFE:	0000  ; $06 - "Down/Right"    
C0/7F00:	FFFF  ; $07 - "Down/Left"     
C0/7F02:  FFFF  ; $08 - "Up/Left"       
C0/7F04:	0000  ; $09 - "Right/Up 1x2"     	
C0/7F06:	0000  ; $0A - "Right/Up 2x1"     	
C0/7F08:	0000  ; $0B - "Right/Down 2x1"   	
C0/7F0A:	0000  ; $0C - "Right/Down 1x2"   	
C0/7F0C:	FFFF  ; $0D - "Left/Down 1x2" 
C0/7F0E:  FFFF  ; $0E - "Left/Down 2x1" 
C0/7F10:  FFFF  ; $0F - "Left/Up 2x1"   
C0/7F12:	FFFF  ; $10 - "Left/Up 1x2"   

; Vertical speeds (by direction)
C0/7F14:	4000  ; $01 - "Up"            
C0/7F16:  0000  ; $02 - "Right"           	
C0/7F18:	4000  ; $03 - "Down"            	
C0/7F1A:	0000  ; $04 - "Left"            	
C0/7F1C:	4000  ; $05 - "Up/Right"        	
C0/7F1E:	4000  ; $06 - "Down/Right"      	
C0/7F20:	4000  ; $07 - "Down/Left"       	
C0/7F22:	4000  ; $08 - "Up/Left"         	
C0/7F24:	4000  ; $09 - "Right/Up 1x2"    	
C0/7F26:	2000  ; $0A - "Right/Up 2x1"    	
C0/7F28:	2000  ; $0B - "Right/Down 2x1"  	
C0/7F2A:	4000  ; $0C - "Right/Down 1x2"  	
C0/7F2C:	4000  ; $0D - "Left/Down 1x2"   	
C0/7F2E:	2000  ; $0E - "Left/Down 2x1"   	
C0/7F30:	2000  ; $0F - "Left/Up 2x1"     	
C0/7F32:	4000  ; $10 - "Left/Up 1x2"     	

; Vertical negatives (by direction)
C0/7F34:	FFFF  ; $01 - "Up"            
C0/7F36:	0000  ; $02 - "Right"         
C0/7F38:  0000  ; $03 - "Down"          
C0/7F3A:	0000  ; $04 - "Left"           
C0/7F3C:	FFFF  ; $05 - "Up/Right"       
C0/7F3E:	0000  ; $06 - "Down/Right"    
C0/7F40:  0000  ; $07 - "Down/Left"     
C0/7F42:	FFFF  ; $08 - "Up/Left"        
C0/7F44:	FFFF  ; $09 - "Right/Up 1x2"  
C0/7F46:  FFFF  ; $0A - "Right/Up 2x1"  
C0/7F48:	0000  ; $0B - "Right/Down 2x1"
C0/7F4A:  0000  ; $0C - "Right/Down 1x2"
C0/7F4C:	0000  ; $0D - "Left/Down 1x2"  
C0/7F4E:	0000  ; $0E - "Left/Down 2x1"  
C0/7F50:	FFFF  ; $0F - "Left/Up 2x1"    
C0/7F52:	FFFF  ; $10 - "Left/Up 1x2"   

; Facing direction by moving direction
C0/7F54:  00 ; up, faces up
C0/7F55:  01 ; right, faces right
C0/7F56:	02 ; down, faces down
C0/7F57:	03 ; left, faces left
C0/7F58:	01 ; up/right, faces right
C0/7F59:	01 ; down/right, faces right
C0/7F5A:	03 ; down/left, faces left
C0/7F5B:	03 ; up/left, faces left
C0/7F5C:	00 ; right/up/up, faces up
C0/7F5D:	01 ; right/right/up, faces right
C0/7F5E:	01 ; right/right/down, faces right
C0/7F5F:	02 ; right/down/down, faces down
C0/7F60:	02 ; left/down/down, faces down
C0/7F61:	03 ; left/left/down, faces left
C0/7F62:	03 ; left/left/up, faces left
C0/7F63:	00 ; left/up/up, faces up

Dialogue initializing, this is called when a map is loaded/refreshed
C0/7F64:	9C6805    	STZ $0568      (from C0/BF7C)
C0/7F67:	64C5    	STZ $C5        (store #$00 to $C5)
C0/7F69:	64CC    	STZ $CC        (store #$00 to $CC)
C0/7F6B:	64D3    	STZ $D3        (store #$00 to $D3)
C0/7F6D:	64C9    	STZ $C9        (store #$00 to $C9)
C0/7F6F:	64CA    	STZ $CA        (store #$00 to $CA)
C0/7F71:	A9CD    	LDA #$CD
C0/7F73:	85CB    	STA $CB        (set bank byte of dialogue to CD)
C0/7F75:	9C6D05  	STZ $056D      (store #$00 to $056D)
C0/7F78:	9C6E05  	STZ $056E      (store #$00 to $056E)
C0/7F7B:	9C6F05  	STZ $056F      (store #$00 to $056F)
C0/7F7E:	9C8205  	STZ $0582      (store #$00 to $0582)
C0/7F81:	64D0    	STZ $D0        (store #$00 to $D0)
C0/7F83:	64D1    	STZ $D1        (store #$00 to $D1)
C0/7F85:	A980    	LDA #$80
C0/7F87:	85CF    	STA $CF
C0/7F89:	A600    	LDX $00
C0/7F8B:	86C1    	STX $C1        (store #$0000 to $C1)
C0/7F8D:	86C3    	STX $C3        (store #$0000 to $C3)
C0/7F8F:	8E6905  	STX $0569      (store #$0000 to $0569)
C0/7F92:	8E6B05  	STX $056B      (store #$0000 to $056B)
C0/7F95:	A20007  	LDX #$0700
C0/7F98:	86C6    	STX $C6
C0/7F9A:	A904    	LDA #$04
C0/7F9C:	85BF    	STA $BF        (set initial line position in pixels to 4?)
C0/7F9E:	64C0    	STZ $C0
C0/7FA0:	A9E0    	LDA #$E0
C0/7FA2:	85C8    	STA $C8        (set initial line length in pixels to 224, more accurately, how many pixels left until the next line)
C0/7FA4:	A20390  	LDX #$9003
C0/7FA7:	8E8121  	STX $2181
C0/7FAA:	A97E    	LDA #$7E
C0/7FAC:	8D8321  	STA $2183
C0/7FAF:	A28000  	LDX #$0080
C0/7FB2:	9C8021  	STZ $2180
C0/7FB5:	CA      	DEX
C0/7FB6:	D0FA    	BNE $7FB2
C0/7FB8:	20A988  	JSR $88A9      (clear some more stuff out)
C0/7FBB:	207E85  	JSR $857E      (JMP fool!, do some DMA stuff)
C0/7FBE:	60      	RTS

Dialogue Loading function:
C0/7FBF:	A9CD    	LDA #$CD       (Initial bank is CD)
C0/7FC1:	85CB    	STA $CB        (This is kept in location $CB)
C0/7FC3:	C220    	REP #$20       (16 bit accum./memory)
C0/7FC5:	A5D0    	LDA $D0        (get memory D0)
C0/7FC7:	0A      	ASL A          (times 2 since pointers are 2 bytes)
C0/7FC8:	AA      	TAX            (this gives us the index X)
C0/7FC9:	BF02E6CC	LDA $CCE602,X  (Loads pointer to dialogue X)
C0/7FCD:	85C9    	STA $C9        (The pointer goes in $C9)
C0/7FCF:	A5D0    	LDA $D0        (Which dialogue is this?)
C0/7FD1:	CF00E6CC	CMP $CCE600    (Checks to see whether bank byte needs is right or needs to be CE)
C0/7FD5:	9005    	BCC $7FDC      (Branch if less to the pointer above)
C0/7FD7:	7B      	TDC            (bank byte needs to be incremented, and this is pointless...)
C0/7FD8:	E220    	SEP #$20       (8 bit accum./memory)
C0/7FDA:	E6CB    	INC $CB        (Since it wasn't less, we increment the bank byte)
C0/7FDC:	7B      	TDC            (Either way it is correct now, so clear the accumulator)
C0/7FDD:	E220    	SEP #$20       (8 bit accum./memory)
C0/7FDF:	A901    	LDA #$01       (Put a 1 in the accumulator)
C0/7FE1:	8D6805  	STA $0568      (Store 1 into $0568)
C0/7FE4:	60      	RTS
 
Location name loading function:
C0/7FE5:	9C6705  	STZ $0567      (set the timer for location names to 0)
C0/7FE8:	ADB91E  	LDA $1EB9      (load an event byte)
C0/7FEB:	2940    	AND #$40
C0/7FED:	D005    	BNE $7FF4      (Branch if party switching with Y enabled, although there's no "first time" check, so Phoenix Cave's location will never display. BUG!)
C0/7FEF:	AD4507  	LDA $0745      (load location flag)
C0/7FF2:	D004    	BNE $7FF8      (branch if #$08 flag is set)
C0/7FF4:	9C4507  	STZ $0745
C0/7FF7:	60      	RTS
 
C0/7FF8:	A964    	LDA #$64       (from C0/7FF2)
C0/7FFA:	8D6705  	STA $0567      (set timer to 64 frames)
C0/7FFD:	A9CE    	LDA #$CE
C0/7FFF:	85CB    	STA $CB        (bank of location names)
C0/8001:	AD2005  	LDA $0520
C0/8004:	0A      	ASL A
C0/8005:	AA      	TAX
C0/8006:	C221    	REP #$21
C0/8008:	BF0084E6	LDA $E68400,X  (Pointer to location name)
C0/800C:	6900F1  	ADC #$F100     (they are relative, so add the offset)
C0/800F:	85C9    	STA $C9        (store location to look)
C0/8011:	7B      	TDC 
C0/8012:	E220    	SEP #$20       (8 bit accum./memory)
C0/8014:	64C0    	STZ $C0
C0/8016:	A400    	LDY $00
C0/8018:	B7C9    	LDA [$C9],Y    (load the location name)
C0/801A:	F00D    	BEQ $8029      (branch if hit a null terminator)
C0/801C:	AA      	TAX
C0/801D:	BFC08FC4	LDA $C48FC0,X  (load width for variable font cell)
C0/8021:	18      	CLC
C0/8022:	65C0    	ADC $C0
C0/8024:	85C0    	STA $C0
C0/8026:	C8      	INY 
C0/8027:	80EF    	BRA $8018      (loop and keep grabbing letters)
C0/8029:	A9E0    	LDA #$E0
C0/802B:	38      	SEC 
C0/802C:	E5C0    	SBC $C0
C0/802E:	4A      	LSR A
C0/802F:	85BF    	STA $BF
C0/8031:	A8      	TAY
C0/8032:	8C0442  	STY $4204      (whatever is left, store as to be divided)
C0/8035:	A910    	LDA #$10       (16...)
C0/8037:	8D0642  	STA $4206      (divide Y by 16)
C0/803A:	EA      	NOP
C0/803B:	EA      	NOP
C0/803C:	EA      	NOP
C0/803D:	EA      	NOP
C0/803E:	EA      	NOP
C0/803F:	EA      	NOP
C0/8040:	EA      	NOP
C0/8041:	AD1442  	LDA $4214      (load the division result)
C0/8044:	8D0242  	STA $4202      (store as a multiplier)
C0/8047:	A920    	LDA #$20       (32...)
C0/8049:	8D0342  	STA $4203      (multiply previous result by 32)
C0/804C:	EA      	NOP
C0/804D:	EA      	NOP
C0/804E:	EA      	NOP
C0/804F:	AC1642  	LDY $4216      (get the multiplication result)
C0/8052:	84C1    	STY $C1
C0/8054:	204D82  	JSR $824D
C0/8057:	200986  	JSR $8609
C0/805A:	AD6805  	LDA $0568
C0/805D:	10F5    	BPL $8054
C0/805F:	64D3    	STZ $D3
C0/8061:	64CC    	STZ $CC
C0/8063:	20A82E  	JSR $2EA8      (JMP!)
C0/8066:	60      	RTS

DTE character decoder/displayer:
C0/8067:	A5CF    	LDA $CF
C0/8069:	48      	PHA
C0/806A:	A5CB    	LDA $CB
C0/806C:	48      	PHA
C0/806D:	A6C9    	LDX $C9
C0/806F:	DA      	PHX
C0/8070:	64C0    	STZ $C0
C0/8072:	A400    	LDY $00
C0/8074:	B7C9    	LDA [$C9],Y
C0/8076:	1038    	BPL $80B0
C0/8078:	297F    	AND #$7F
C0/807A:	0A      	ASL A
C0/807B:	AA      	TAX
C0/807C:	A5CF    	LDA $CF
C0/807E:	C980    	CMP #$80
C0/8080:	F006    	BEQ $8088
C0/8082:	A980    	LDA #$80
C0/8084:	85CF    	STA $CF
C0/8086:	8014    	BRA $809C
C0/8088:	BFA0DFC0	LDA $C0DFA0,X  (load DTE character 1)
C0/808C:	C97F    	CMP #$7F
C0/808E:	F042    	BEQ $80D2
C0/8090:	DA      	PHX
C0/8091:	AA      	TAX
C0/8092:	BFC08FC4	LDA $C48FC0,X  (load width for variable font cell)
C0/8096:	18      	CLC
C0/8097:	65C0    	ADC $C0
C0/8099:	85C0    	STA $C0
C0/809B:	FA      	PLX
C0/809C:	BFA1DFC0	LDA $C0DFA1,X  (load DTE character 2)
C0/80A0:	C97F    	CMP #$7F
C0/80A2:	F02E    	BEQ $80D2
C0/80A4:	AA      	TAX
C0/80A5:	BFC08FC4	LDA $C48FC0,X  (load width for variable font cell)
C0/80A9:	18      	CLC
C0/80AA:	65C0    	ADC $C0
C0/80AC:	85C0    	STA $C0
C0/80AE:	8016    	BRA $80C6
C0/80B0:	A400    	LDY $00
C0/80B2:	B7C9    	LDA [$C9],Y
C0/80B4:	C920    	CMP #$20       (<-- THIS IS HOW IT KNOWS WHERE TO STOP LOOKING FOR CHARACTER NAMES!!!)
C0/80B6:	9024    	BCC $80DC
C0/80B8:	C97F    	CMP #$7F
C0/80BA:	F016    	BEQ $80D2
C0/80BC:	AA      	TAX
C0/80BD:	BFC08FC4	LDA $C48FC0,X  (load width for variable font cell)
C0/80C1:	18      	CLC
C0/80C2:	65C0    	ADC $C0
C0/80C4:	85C0    	STA $C0
C0/80C6:	E6C9    	INC $C9
C0/80C8:	D0A8    	BNE $8072
C0/80CA:	E6CA    	INC $CA
C0/80CC:	D0A4    	BNE $8072
C0/80CE:	E6CB    	INC $CB
C0/80D0:	80A0    	BRA $8072
C0/80D2:	FA      	PLX
C0/80D3:	86C9    	STX $C9
C0/80D5:	68      	PLA
C0/80D6:	85CB    	STA $CB
C0/80D8:	68      	PLA
C0/80D9:	85CF    	STA $CF
C0/80DB:	60      	RTS

Character name decoder/displayer:
C0/80DC:	C91A    	CMP #$1A       (Is it 26? <the item packing character>)
C0/80DE:	F038    	BEQ $8118      (If it is, go to the item area)
C0/80E0:	C902    	CMP #$02       (Is it less than 2? <not within the char. name range>)
C0/80E2:	90EE    	BCC $80D2      (If so, exit)
C0/80E4:	C910    	CMP #$10       (Is it greater than 16? <not within the char. name range>)
C0/80E6:	B0EA    	BCS $80D2      (If so, exit)
C0/80E8:	3A      	DEC A          (Subtract 1)
C0/80E9:	3A      	DEC A          (Subtract 1)
C0/80EA:	8D0242  	STA $4202      (Put A into the multiplier)
C0/80ED:	A925    	LDA #$25       (37 = width of character RAM struct)
C0/80EF:	8D0342  	STA $4203      (Multiply by 37)
C0/80F2:	A5CF    	LDA $CF        (Load mem. loc. $CF)
C0/80F4:	10DC    	BPL $80D2      (If positive, branch)
C0/80F6:	A906    	LDA #$06       (6 = length of character name)
C0/80F8:	851A    	STA $1A        (Store 6 into $1A)
C0/80FA:	AC1642  	LDY $4216      (Put the multiplication result into Y)
C0/80FD:	B90216  	LDA $1602,Y    (Load character name letter Y)
C0/8100:	C9FF    	CMP #$FF       (Is it a space?)
C0/8102:	F0CE    	BEQ $80D2      (If so, exit)
C0/8104:	38      	SEC            (Set the carry in case we need to borrow)
C0/8105:	E960    	SBC #$60       (Take away 60 hex)
C0/8107:	AA      	TAX            (Put the result into X)
C0/8108:	BFC08FC4	LDA $C48FC0,X  (load width for variable font cell)
C0/810C:	18      	CLC            (Clear the carry in case of addition)
C0/810D:	65C0    	ADC $C0        (Add the value of $C0)
C0/810F:	85C0    	STA $C0        (Store the result back into $C0)
C0/8111:	C8      	INY            (Add 1 to Y)
C0/8112:	C61A    	DEC $1A        (Decrement $1A, number of letters to write for the name)
C0/8114:	D0E7    	BNE $80FD      (If it is not 0, branch -> do it again)
C0/8116:	80BA    	BRA $80D2      (Otherwise, exit)

Something to do with getting an item name for treasure chests
C0/8118:	AD8305  	LDA $0583      (Item index?)
C0/811B:	8D0242  	STA $4202
C0/811E:	A90D    	LDA #$0D       (13)
C0/8120:	8D0342  	STA $4203
C0/8123:	A5CF    	LDA $CF
C0/8125:	10AB    	BPL $80D2
C0/8127:	A90C    	LDA #$0C       (12 = item name length)
C0/8129:	851A    	STA $1A
C0/812B:	AE1642  	LDX $4216
C0/812E:	9B      	TXY
C0/812F:	BF01B3D2	LDA $D2B301,X  (Item name)
C0/8133:	C9FF    	CMP #$FF       (Is it the empty item/hit a null terminator?)
C0/8135:	F09B    	BEQ $80D2      (If so, branch -> exit function)
C0/8137:	38      	SEC 
C0/8138:	E960    	SBC #$60
C0/813A:	AA      	TAX
C0/813B:	BFC08FC4	LDA $C48FC0,X  (load width for variable font cell)
C0/813F:	18      	CLC
C0/8140:	65C0    	ADC $C0
C0/8142:	85C0    	STA $C0
C0/8144:	BB      	TYX
C0/8145:	E8      	INX
C0/8146:	C61A    	DEC $1A
C0/8148:	D0E4    	BNE $812E
C0/814A:	8086    	BRA $80D2

C0/814C:	C220    	REP #$20      	(16 bit accum./memory)
C0/814E:	A500    	LDA $00
C0/8150:	8F04727E	STA $7E7204
C0/8154:	8F04747E	STA $7E7404
C0/8158:	AD551D  	LDA $1D55      (load font color)
C0/815B:	8F02727E	STA $7E7202
C0/815F:	8F02747E	STA $7E7402
C0/8163:	8F06727E	STA $7E7206
C0/8167:	8F06747E	STA $7E7406
C0/816B:	7B      	TDC 
C0/816C:	E220    	SEP #$20      	(8 bit accum./memory)
C0/816E:	AD6705  	LDA $0567
C0/8171:	F008    	BEQ $817B
C0/8173:	CE6705  	DEC $0567
C0/8176:	D003    	BNE $817B
C0/8178:	20ED2F  	JSR $2FED
C0/817B:	AD6805  	LDA $0568
C0/817E:	D001    	BNE $8181
C0/8180:	60      	RTS
 
C0/8181:	AE6905  	LDX $0569
C0/8184:	F005    	BEQ $818B
C0/8186:	CA      	DEX
C0/8187:	8E6905  	STX $0569
C0/818A:	60      	RTS
 
C0/818B:	AE6B05  	LDX $056B
C0/818E:	F01F    	BEQ $81AF
C0/8190:	C220    	REP #$20      	(16 bit accum./memory)
C0/8192:	8A      	TXA
C0/8193:	29FF7F  	AND #$7FFF
C0/8196:	AA      	TAX
C0/8197:	7B      	TDC 
C0/8198:	E220    	SEP #$20      	(8 bit accum./memory)
C0/819A:	E400    	CPX $00
C0/819C:	D00A    	BNE $81A8
C0/819E:	9C6C05  	STZ $056C
C0/81A1:	64D3    	STZ $D3
C0/81A3:	9C6F05  	STZ $056F
C0/81A6:	8007    	BRA $81AF
C0/81A8:	AE6B05  	LDX $056B
C0/81AB:	CA      	DEX
C0/81AC:	8E6B05  	STX $056B
C0/81AF:	A5D3    	LDA $D3
C0/81B1:	D003    	BNE $81B6
C0/81B3:	4C3B82  	JMP $823B

C0/81B6:	AD6F05  	LDA $056F
C0/81B9:	C902    	CMP #$02
C0/81BB:	9062    	BCC $821F
C0/81BD:	AD6E05  	LDA $056E
C0/81C0:	0A      	ASL A
C0/81C1:	AA      	TAX
C0/81C2:	C220    	REP #$20      	(16 bit accum./memory)
C0/81C4:	BD7005  	LDA $0570,X
C0/81C7:	85C3    	STA $C3
C0/81C9:	7B      	TDC 
C0/81CA:	E220    	SEP #$20      	(8 bit accum./memory)
C0/81CC:	A507    	LDA $07
C0/81CE:	290F    	AND #$0F
C0/81D0:	D005    	BNE $81D7
C0/81D2:	9C6D05  	STZ $056D
C0/81D5:	8032    	BRA $8209
C0/81D7:	AD6D05  	LDA $056D
C0/81DA:	D043    	BNE $821F
C0/81DC:	A507    	LDA $07
C0/81DE:	290A    	AND #$0A
C0/81E0:	F010    	BEQ $81F2
C0/81E2:	AD6E05  	LDA $056E
C0/81E5:	3A      	DEC A
C0/81E6:	3021    	BMI $8209
C0/81E8:	8D6E05  	STA $056E
C0/81EB:	A901    	LDA #$01
C0/81ED:	8D6D05  	STA $056D
C0/81F0:	8017    	BRA $8209
C0/81F2:	A507    	LDA $07
C0/81F4:	2905    	AND #$05
C0/81F6:	F011    	BEQ $8209
C0/81F8:	AD6E05  	LDA $056E
C0/81FB:	1A      	INC A
C0/81FC:	CD6F05  	CMP $056F
C0/81FF:	F008    	BEQ $8209
C0/8201:	8D6E05  	STA $056E
C0/8204:	A901    	LDA #$01
C0/8206:	8D6D05  	STA $056D
C0/8209:	209A87  	JSR $879A
C0/820C:	AD6E05  	LDA $056E
C0/820F:	0A      	ASL A
C0/8210:	AA      	TAX
C0/8211:	C220    	REP #$20      	(16 bit accum./memory)
C0/8213:	BD7005  	LDA $0570,X
C0/8216:	8D8005  	STA $0580
C0/8219:	7B      	TDC 
C0/821A:	E220    	SEP #$20      	(8 bit accum./memory)
C0/821C:	EE8205  	INC $0582
C0/821F:	A5D3    	LDA $D3
C0/8221:	C901    	CMP #$01
C0/8223:	F008    	BEQ $822D
C0/8225:	A506    	LDA $06
C0/8227:	3018    	BMI $8241
C0/8229:	C6D3    	DEC $D3
C0/822B:	8014    	BRA $8241
C0/822D:	A506    	LDA $06
C0/822F:	1010    	BPL $8241
C0/8231:	C6D3    	DEC $D3
C0/8233:	9C6F05  	STZ $056F
C0/8236:	9C6C05  	STZ $056C
C0/8239:	8006    	BRA $8241
C0/823B:	A5CC    	LDA $CC
C0/823D:	F003    	BEQ $8242
C0/823F:	C6CC    	DEC $CC
C0/8241:	60      	RTS
 
C0/8242:	AD6805  	LDA $0568  		(from C0/823D)
C0/8245:	1006    	BPL $824D
C0/8247:	85BA    	STA $BA
C0/8249:	9C6805  	STZ $0568
C0/824C:	60      	RTS
 
C0/824D:	206780  	JSR $8067		(from C0/8245)
C0/8250:	A5BF    	LDA $BF
C0/8252:	18      	CLC
C0/8253:	65C0    	ADC $C0
C0/8255:	B004    	BCS $825B
C0/8257:	C5C8    	CMP $C8        (compare it to line length in pixels)
C0/8259:	9004    	BCC $825F
C0/825B:	201A85  	JSR $851A      (JMP fool!)
C0/825E:	60      	RTS
 
C0/825F:	A5CF    	LDA $CF		(from C0/8259)
C0/8261:	3021    	BMI $8284
C0/8263:	A5CF    	LDA $CF
C0/8265:	AA      	TAX
C0/8266:	BF83917E	LDA $7E9183,X
C0/826A:	85CD    	STA $CD
C0/826C:	64CE    	STZ $CE
C0/826E:	BF84917E	LDA $7E9184,X
C0/8272:	F006    	BEQ $827A
C0/8274:	20D084  	JSR $84D0
C0/8277:	E6CF    	INC $CF
C0/8279:	60      	RTS
 
C0/827A:	A980    	LDA #$80		(from C0/8272)
C0/827C:	85CF    	STA $CF
C0/827E:	20D084  	JSR $84D0
C0/8281:	4C9D82  	JMP $829D      (BRA fool!)

C0/8284:	A400    	LDY $00        (from C0/8261)
C0/8286:	B7C9    	LDA [$C9],Y    (load a letter)
C0/8288:	85BD    	STA $BD        (save it to temp ram)
C0/828A:	C8      	INY 
C0/828B:	B7C9    	LDA [$C9],Y    (load the next letter, in cases of control codes, a parameter)
C0/828D:	85BE    	STA $BE        (save it)
C0/828F:	A5BD    	LDA $BD        (load letter)
C0/8291:	3007    	BMI $829A      (branch if DTE?)
C0/8293:	C920    	CMP #$20       (compare to the first letter)
C0/8295:	901E    	BCC $82B5      (branch if less than, which means to check for the control codes)
C0/8297:	4C5A84  	JMP $845A

C0/829A:	4C6684  	JMP $8466		(from C0/8291)

Advance the dialogue one byte
C0/829D:	A901    	LDA #$01		(from C0/8281)
C0/829F:	8002    	BRA $82A3

Advance the dialogue two bytes
C0/82A1:	A902    	LDA #$02
C0/82A3:	18      	CLC			(from C0/829F)
C0/82A4:	65C9    	ADC $C9
C0/82A6:	85C9    	STA $C9
C0/82A8:	A5CA    	LDA $CA
C0/82AA:	6900    	ADC #$00
C0/82AC:	85CA    	STA $CA
C0/82AE:	A5CB    	LDA $CB
C0/82B0:	6900    	ADC #$00
C0/82B2:	85CB    	STA $CB
C0/82B4:	60      	RTS
 
Control code checking, 00 is null termination
C0/82B5:	C900    	CMP #$00		(from C0/8295)
C0/82B7:	D009    	BNE $82C2
C0/82B9:	205485  	JSR $8554
C0/82BC:	A980    	LDA #$80
C0/82BE:	8D6805  	STA $0568      (flag dialogue box ok to close)
C0/82C1:	60      	RTS
 
New line's control code
C0/82C2:	C901    	CMP #$01		(from C0/82B7)
C0/82C4:	D006    	BNE $82CC
C0/82C6:	201A85  	JSR $851A
C0/82C9:	4C9D82  	JMP $829D

This is where they should've used a jump table for the control codes...
C0/82CC:	C910    	CMP #$10		(from C0/82C4)
C0/82CE:	B032    	BCS $8302
C0/82D0:	3A      	DEC A
C0/82D1:	3A      	DEC A
C0/82D2:	8D0242  	STA $4202
C0/82D5:	A925    	LDA #$25
C0/82D7:	8D0342  	STA $4203
C0/82DA:	EA      	NOP
C0/82DB:	EA      	NOP
C0/82DC:	EA      	NOP
C0/82DD:	EA      	NOP
C0/82DE:	AC1642  	LDY $4216
C0/82E1:	A600    	LDX $00
C0/82E3:	B90216  	LDA $1602,Y		(from C0/82F6)
C0/82E6:	38      	SEC 
C0/82E7:	E960    	SBC #$60
C0/82E9:	9F83917E	STA $7E9183,X
C0/82ED:	C99F    	CMP #$9F
C0/82EF:	F007    	BEQ $82F8
C0/82F1:	C8      	INY 
C0/82F2:	E8      	INX
C0/82F3:	E00600  	CPX #$0006
C0/82F6:	D0EB    	BNE $82E3
C0/82F8:	7B      	TDC 			(from C0/82EF)
C0/82F9:	9F83917E	STA $7E9183,X
C0/82FD:	64CF    	STZ $CF
C0/82FF:	4C6382  	JMP $8263

Pause for button input's control code
C0/8302:	C910    	CMP #$10		(from C0/82CE)
C0/8304:	D009    	BNE $830F
C0/8306:	A23C00  	LDX #$003C
C0/8309:	8E6905  	STX $0569      (time to wait before dialogue continues printing)
C0/830C:	4C9D82  	JMP $829D

Non-interruptable pause's control code
C0/830F:	C911    	CMP #$11		(from C0/8304)
C0/8311:	D017    	BNE $832A
C0/8313:	A5BE    	LDA $BE
C0/8315:	8D0242  	STA $4202
C0/8318:	A90F    	LDA #$0F
C0/831A:	8D0342  	STA $4203
C0/831D:	EA      	NOP
C0/831E:	EA      	NOP
C0/831F:	EA      	NOP
C0/8320:	EA      	NOP
C0/8321:	AE1642  	LDX $4216
C0/8324:	8E6905  	STX $0569      (time to wait before dialogue continues printing)
C0/8327:	4CA182  	JMP $82A1

End parameter's control code
C0/832A:	C912    	CMP #$12		(from C0/8311)
C0/832C:	D009    	BNE $8337
C0/832E:	A20180  	LDX #$8001
C0/8331:	8E6B05  	STX $056B
C0/8334:	4C9D82  	JMP $829D

New page's control code
C0/8337:	C913    	CMP #$13		(from C0/832C)
C0/8339:	D006    	BNE $8341
C0/833B:	205485  	JSR $8554
C0/833E:	4C9D82  	JMP $829D

Tab's control code
C0/8341:	C914    	CMP #$14		(from C0/8339)
C0/8343:	D01D    	BNE $8362
C0/8345:	A5BE    	LDA $BE
C0/8347:	851E    	STA $1E
C0/8349:	641F    	STZ $1F
C0/834B:	A600    	LDX $00
C0/834D:	A97F    	LDA #$7F
C0/834F:	9F83917E	STA $7E9183,X
C0/8353:	E8      	INX
C0/8354:	E41E    	CPX $1E
C0/8356:	D0F7    	BNE $834F
C0/8358:	7B      	TDC 
C0/8359:	9F83917E	STA $7E9183,X
C0/835D:	64CF    	STZ $CF
C0/835F:	4C9D82  	JMP $829D

Selectable option's control code
C0/8362:	C915    	CMP #$15		(from C0/8343)
C0/8364:	D019    	BNE $837F
C0/8366:	AD6F05  	LDA $056F
C0/8369:	0A      	ASL A
C0/836A:	A8      	TAY
C0/836B:	C220    	REP #$20      	(16 bit accum./memory)
C0/836D:	A5C1    	LDA $C1
C0/836F:	997005  	STA $0570,Y
C0/8372:	7B      	TDC 
C0/8373:	E220    	SEP #$20      	(8 bit accum./memory)
C0/8375:	A9FF    	LDA #$FF
C0/8377:	85BD    	STA $BD
C0/8379:	EE6F05  	INC $056F
C0/837C:	4C5A84  	JMP $845A

Interruptable pause's control code
C0/837F:	C916    	CMP #$16		(from C0/8364)
C0/8381:	D021    	BNE $83A4
C0/8383:	A5BE    	LDA $BE
C0/8385:	8D0242  	STA $4202
C0/8388:	A90F    	LDA #$0F
C0/838A:	8D0342  	STA $4203
C0/838D:	EA      	NOP
C0/838E:	EA      	NOP
C0/838F:	C220    	REP #$20      	(16 bit accum./memory)
C0/8391:	AD1642  	LDA $4216
C0/8394:	090080  	ORA #$8000
C0/8397:	8D6B05  	STA $056B
C0/839A:	7B      	TDC 
C0/839B:	E220    	SEP #$20      	(8 bit accum./memory)
C0/839D:	A901    	LDA #$01
C0/839F:	85D3    	STA $D3
C0/83A1:	4CA182  	JMP $82A1

Amount of GP found in treasure chests
C0/83A4:	C919    	CMP #$19		(from C0/8381)
C0/83A6:	D02B    	BNE $83D3
C0/83A8:	641A    	STZ $1A
C0/83AA:	A600    	LDX $00
C0/83AC:	9B      	TXY
C0/83AD:	A51A    	LDA $1A
C0/83AF:	D007    	BNE $83B8
C0/83B1:	B95507  	LDA $0755,Y
C0/83B4:	F00D    	BEQ $83C3
C0/83B6:	E61A    	INC $1A
C0/83B8:	B95507  	LDA $0755,Y
C0/83BB:	18      	CLC
C0/83BC:	6954    	ADC #$54
C0/83BE:	9F83917E	STA $7E9183,X
C0/83C2:	E8      	INX
C0/83C3:	C8      	INY 
C0/83C4:	C00700  	CPY #$0007
C0/83C7:	D0E4    	BNE $83AD
C0/83C9:	7B      	TDC 
C0/83CA:	9F83917E	STA $7E9183,X
C0/83CE:	64CF    	STZ $CF
C0/83D0:	4C6382  	JMP $8263

Something to do with getting the item name for treasure chests
C0/83D3:	C91A    	CMP #$1A		(from C0/83A6)
C0/83D5:	D038    	BNE $840F
C0/83D7:	AD8305  	LDA $0583		(Item index)
C0/83DA:	8D0242  	STA $4202
C0/83DD:	A90D    	LDA #$0D       (13 is the multiplier)
C0/83DF:	8D0342  	STA $4203
C0/83E2:	EA      	NOP
C0/83E3:	EA      	NOP
C0/83E4:	EA      	NOP
C0/83E5:	AE1642  	LDX $4216
C0/83E8:	A400    	LDY $00
C0/83EA:	A97E    	LDA #$7E
C0/83EC:	48      	PHA
C0/83ED:	AB      	PLB
C0/83EE:	BF01B3D2	LDA $D2B301,X  (Item name)
C0/83F2:	38      	SEC 
C0/83F3:	E960    	SBC #$60       (subtract 96 for the icon)
C0/83F5:	998391  	STA $9183,Y
C0/83F8:	C99F    	CMP #$9F
C0/83FA:	F007    	BEQ $8403      (branch if space, aka plain arse item?)
C0/83FC:	E8      	INX
C0/83FD:	C8      	INY 
C0/83FE:	C00C00  	CPY #$000C     (have we checked 12 letters?)
C0/8401:	D0EB    	BNE $83EE
C0/8403:	7B      	TDC 
C0/8404:	998391  	STA $9183,Y
C0/8407:	7B      	TDC 
C0/8408:	48      	PHA
C0/8409:	AB      	PLB
C0/840A:	64CF    	STZ $CF
C0/840C:	4C6382  	JMP $8263

Something to do with learning spells, but not used (see the multipliers)
C0/840F:	C91B    	CMP #$1B		(from C0/83D5)
C0/8411:	D038    	BNE $844B
C0/8413:	AD8405  	LDA $0584
C0/8416:	8D0242  	STA $4202
C0/8419:	A904    	LDA #$04       (4 letters, meaning for the original version)
C0/841B:	8D0342  	STA $4203
C0/841E:	EA      	NOP
C0/841F:	EA      	NOP
C0/8420:	EA      	NOP
C0/8421:	AE1642  	LDX $4216
C0/8424:	A400    	LDY $00
C0/8426:	A97E    	LDA #$7E
C0/8428:	48      	PHA
C0/8429:	AB      	PLB
C0/842A:	BF68F5E6	LDA $E6F568,X  (spell names, starting with black magic)
C0/842E:	38      	SEC 
C0/842F:	E960    	SBC #$60
C0/8431:	998391  	STA $9183,Y
C0/8434:	C99F    	CMP #$9F
C0/8436:	F007    	BEQ $843F
C0/8438:	E8      	INX
C0/8439:	C8      	INY 
C0/843A:	C00400  	CPY #$0004     (have we checked 4 letters?)
C0/843D:	D0EB    	BNE $842A      (branch if not)
C0/843F:	7B      	TDC 
C0/8440:	998391  	STA $9183,Y
C0/8443:	7B      	TDC 
C0/8444:	48      	PHA
C0/8445:	AB      	PLB
C0/8446:	64CF    	STZ $CF
C0/8448:	4C6382  	JMP $8263

C0/844B:	38      	SEC 			(from C0/8411)
C0/844C:	E91B    	SBC #$1B
C0/844E:	85CE    	STA $CE
C0/8450:	A5BE    	LDA $BE
C0/8452:	85CD    	STA $CD
C0/8454:	20D084  	JSR $84D0
C0/8457:	4CA182  	JMP $82A1

C0/845A:	A5BD    	LDA $BD
C0/845C:	85CD    	STA $CD
C0/845E:	64CE    	STZ $CE
C0/8460:	20D084  	JSR $84D0
C0/8463:	4C9D82  	JMP $829D

C0/8466:	297F    	AND #$7F
C0/8468:	0A      	ASL A
C0/8469:	A8      	TAY
C0/846A:	A2A0DF  	LDX #$DFA0
C0/846D:	862A    	STX $2A
C0/846F:	A9C0    	LDA #$C0
C0/8471:	852C    	STA $2C        (C0/DFA0 is the location of the DTE table...)
C0/8473:	B72A    	LDA [$2A],Y
C0/8475:	8F83917E	STA $7E9183
C0/8479:	C8      	INY 
C0/847A:	B72A    	LDA [$2A],Y
C0/847C:	8F84917E	STA $7E9184
C0/8480:	7B      	TDC 
C0/8481:	8F85917E	STA $7E9185
C0/8485:	64CF    	STZ $CF
C0/8487:	4C6382  	JMP $8263

C0/848A:	A97E    	LDA #$7E		(from C0/BEBF)
C0/848C:	8D8321  	STA $2183
C0/848F:	A2009E  	LDX #$9E00
C0/8492:	8E8121  	STX $2181
C0/8495:	A600    	LDX $00
C0/8497:	BFC08FC4	LDA $C48FC0,X	(load width for variable font cell)
C0/849B:	8D8021  	STA $2180
C0/849E:	E8      	INX
C0/849F:	E08000  	CPX #$0080
C0/84A2:	D0F3    	BNE $8497
C0/84A4:	A2A0DF  	LDX #$DFA0
C0/84A7:	862A    	STX $2A
C0/84A9:	A9C0    	LDA #$C0
C0/84AB:	852C    	STA $2C        (C0/DFA0 is the location of the DTE table...)
C0/84AD:	A600    	LDX $00
C0/84AF:	9B      	TXY
C0/84B0:	641A    	STZ $1A
C0/84B2:	B72A    	LDA [$2A],Y
C0/84B4:	AA      	TAX
C0/84B5:	BFC08FC4	LDA $C48FC0,X	(load width for variable font cell)
C0/84B9:	851A    	STA $1A
C0/84BB:	C8      	INY 
C0/84BC:	B72A    	LDA [$2A],Y
C0/84BE:	AA      	TAX
C0/84BF:	BFC08FC4	LDA $C48FC0,X	(load width for variable font cell)
C0/84C3:	18      	CLC
C0/84C4:	651A    	ADC $1A
C0/84C6:	8D8021  	STA $2180
C0/84C9:	C8      	INY 
C0/84CA:	C00001  	CPY #$0100
C0/84CD:	D0E1    	BNE $84B0
C0/84CF:	60      	RTS
 
C0/84D0:	A6CD    	LDX $CD		(from C0/8274, C0/827E, C0/8454, C0/8460)
C0/84D2:	BFC08FC4	LDA $C48FC0,X	(load width for variable font cell)
C0/84D6:	18      	CLC
C0/84D7:	65BF    	ADC $BF
C0/84D9:	C5C8    	CMP $C8        (compare it to line length in pixels)
C0/84DB:	9004    	BCC $84E1
C0/84DD:	201A85  	JSR $851A      (JMP fool!)
C0/84E0:	60      	RTS
 
C0/84E1:	208A89  	JSR $898A		(from C0/84DB)
C0/84E4:	20D388  	JSR $88D3
C0/84E7:	204286  	JSR $8642
C0/84EA:	A6C1    	LDX $C1
C0/84EC:	86C3    	STX $C3
C0/84EE:	E6C5    	INC $C5
C0/84F0:	A6CD    	LDX $CD
C0/84F2:	A5BF    	LDA $BF
C0/84F4:	290F    	AND #$0F
C0/84F6:	18      	CLC
C0/84F7:	7FC08FC4	ADC $C48FC0,X	(width for variable font cell)
C0/84FB:	29F0    	AND #$F0
C0/84FD:	F00F    	BEQ $850E
C0/84FF:	206789  	JSR $8967
C0/8502:	C221    	REP #$21
C0/8504:	A5C1    	LDA $C1
C0/8506:	692000  	ADC #$0020
C0/8509:	85C1    	STA $C1
C0/850B:	7B      	TDC 
C0/850C:	E220    	SEP #$20      	(8 bit accum./memory)
C0/850E:	A6CD    	LDX $CD
C0/8510:	A5BF    	LDA $BF
C0/8512:	18      	CLC
C0/8513:	7FC08FC4	ADC $C48FC0,X	(width for variable font cell)
C0/8517:	85BF    	STA $BF
C0/8519:	60      	RTS
 
C0/851A:	A9FF    	LDA #$FF		(from C0/825B, C0/82C6, C0/84DD)
C0/851C:	85CD    	STA $CD
C0/851E:	64CE    	STZ $CE
C0/8520:	208A89  	JSR $898A
C0/8523:	20D388  	JSR $88D3
C0/8526:	204286  	JSR $8642
C0/8529:	A904    	LDA #$04
C0/852B:	8DBF00  	STA $00BF
C0/852E:	C221    	REP #$21
C0/8530:	A5C1    	LDA $C1
C0/8532:	85C3    	STA $C3
C0/8534:	290006  	AND #$0600
C0/8537:	690002  	ADC #$0200
C0/853A:	29FF07  	AND #$07FF
C0/853D:	85C1    	STA $C1
C0/853F:	7B      	TDC 
C0/8540:	E220    	SEP #$20      (8 bit accum./memory)
C0/8542:	E6C5    	INC $C5
C0/8544:	20A988  	JSR $88A9
C0/8547:	A6C1    	LDX $C1
C0/8549:	D008    	BNE $8553
C0/854B:	A909    	LDA #$09
C0/854D:	85CC    	STA $CC
C0/854F:	A902    	LDA #$02
C0/8551:	85D3    	STA $D3
C0/8553:	60      	RTS
 
C0/8554:	A9FF    	LDA #$FF		(from C0/82B9, C0/833B)
C0/8556:	85CD    	STA $CD
C0/8558:	64CE    	STZ $CE
C0/855A:	208A89  	JSR $898A
C0/855D:	20D388  	JSR $88D3
C0/8560:	204286  	JSR $8642
C0/8563:	A904    	LDA #$04
C0/8565:	8DBF00  	STA $00BF
C0/8568:	A6C1    	LDX $C1
C0/856A:	86C3    	STX $C3
C0/856C:	E6C5    	INC $C5
C0/856E:	A600    	LDX $00
C0/8570:	86C1    	STX $C1
C0/8572:	20A988  	JSR $88A9
C0/8575:	A909    	LDA #$09
C0/8577:	85CC    	STA $CC
C0/8579:	A902    	LDA #$02
C0/857B:	85D3    	STA $D3
C0/857D:	60      	RTS
 
C0/857E:	9C0B42  	STZ $420B      (from C0/7FBB, turn off DMA)
C0/8581:	A20038  	LDX #$3800
C0/8584:	8E1621  	STX $2116
C0/8587:	A980    	LDA #$80
C0/8589:	8D1521  	STA $2115
C0/858C:	A909    	LDA #$09
C0/858E:	8D0043  	STA $4300
C0/8591:	A918    	LDA #$18
C0/8593:	8D0143  	STA $4301      (register to write to is $2118)
C0/8596:	A20000  	LDX #$0000
C0/8599:	8E0243  	STX $4302      (store DMA starting location)
C0/859C:	A900    	LDA #$00
C0/859E:	8D0443  	STA $4304      (store DMA bank)
C0/85A1:	8D0743  	STA $4307      (store indirect DMA bank)
C0/85A4:	A20010  	LDX #$1000
C0/85A7:	8E0543  	STX $4305
C0/85AA:	A901    	LDA #$01
C0/85AC:	8D0B42  	STA $420B      (turn on channel 1 of DMA)
C0/85AF:	60      	RTS
 
C0/85B0:	A5CC    	LDA $CC        ; region of dialogue window needed cleared
C0/85B2:	F03E    	BEQ $85F2      ; exit if no clear needed
C0/85B4:	C909    	CMP #$09
C0/85B6:	F03A    	BEQ $85F2
C0/85B8:	3A      	DEC A
C0/85B9:	0A      	ASL A
C0/85BA:	AA      	TAX
C0/85BB:	C220    	REP #$20       (16 bit accum./memory)
C0/85BD:	BFF385C0	LDA $C085F3,X
C0/85C1:	8D1621  	STA $2116
C0/85C4:	7B      	TDC 
C0/85C5:	E220    	SEP #$20       (8 bit accum./memory)
C0/85C7:	9C0B42  	STZ $420B      (turn off DMA)
C0/85CA:	A980    	LDA #$80
C0/85CC:	8D1521  	STA $2115
C0/85CF:	A909    	LDA #$09
C0/85D1:	8D0043  	STA $4300
C0/85D4:	A918    	LDA #$18
C0/85D6:	8D0143  	STA $4301      (register to write to is $2118)
C0/85D9:	A20000  	LDX #$0000
C0/85DC:	8E0243  	STX $4302      (store DMA starting location)
C0/85DF:	A900    	LDA #$00
C0/85E1:	8D0443  	STA $4304      (store DMA bank)
C0/85E4:	8D0743  	STA $4307      (store indirect DMA bank)
C0/85E7:	A2C001  	LDX #$01C0
C0/85EA:	8E0543  	STX $4305
C0/85ED:	A901    	LDA #$01
C0/85EF:	8D0B42  	STA $420B      (turn on channel 1 of DMA)
C0/85F2:	60      	RTS
 
Data (unknown length or function)

C0/85F3:	E03E
C0/85F5:	003E
C0/85F7:	E03C
C0/85F9:	003C
C0/85FB:	E03A
C0/85FD:	003A
C0/85FF:	E038
C0/8501:	0038

C0/8603:	A5C5    	LDA $C5       ; pending text graphics update
C0/8605:	F03A    	BEQ $8641     ; exit if none
C0/8607:	64C5    	STZ $C5       ; clear text graphics update flag
C0/8609:	9C0B42  	STZ $420B     ; disable all DMA channels
C0/860C:	A980    	LDA #$80
C0/860E:	8D1521  	STA $2115
C0/8611:	C221    	REP #$21
C0/8613:	A5C3    	LDA $C3
C0/8615:	690038  	ADC #$3800
C0/8618:	8D1621  	STA $2116
C0/861B:	7B      	TDC 
C0/861C:	E220    	SEP #$20      (8 bit accum./memory)
C0/861E:	A941    	LDA #$41
C0/8620:	8D0043  	STA $4300
C0/8623:	A918    	LDA #$18
C0/8625:	8D0143  	STA $4301
C0/8628:	A28390  	LDX #$9083
C0/862B:	8E0243  	STX $4302
C0/862E:	A97E    	LDA #$7E
C0/8630:	8D0443  	STA $4304
C0/8633:	8D0743  	STA $4307
C0/8636:	A24000  	LDX #$0040
C0/8639:	8E0543  	STX $4305
C0/863C:	A901    	LDA #$01
C0/863E:	8D0B42  	STA $420B
C0/8641:	60      	RTS
 
C0/8642:	A97E    	LDA #$7E		(from C0/84E7)
C0/8644:	48      	PHA
C0/8645:	AB      	PLB
C0/8646:	9C8390  	STZ $9083
C0/8649:	9C8490  	STZ $9084
C0/864C:	9C8590  	STZ $9085
C0/864F:	9C8690  	STZ $9086
C0/8652:	9C8790  	STZ $9087
C0/8655:	9C8890  	STZ $9088
C0/8658:	9C8990  	STZ $9089
C0/865B:	9C8A90  	STZ $908A
C0/865E:	AD0491  	LDA $9104
C0/8661:	8D8B90  	STA $908B
C0/8664:	AD4491  	LDA $9144
C0/8667:	8D8C90  	STA $908C
C0/866A:	AD0691  	LDA $9106
C0/866D:	8D8D90  	STA $908D
C0/8670:	AD4691  	LDA $9146
C0/8673:	8D8E90  	STA $908E
C0/8676:	AD0891  	LDA $9108
C0/8679:	8D8F90  	STA $908F
C0/867C:	AD4891  	LDA $9148
C0/867F:	8D9090  	STA $9090
C0/8682:	AD0A91  	LDA $910A
C0/8685:	8D9190  	STA $9091
C0/8688:	AD4A91  	LDA $914A
C0/868B:	8D9290  	STA $9092
C0/868E:	AD0C91  	LDA $910C
C0/8691:	8D9390  	STA $9093
C0/8694:	AD4C91  	LDA $914C
C0/8697:	8D9490  	STA $9094
C0/869A:	AD0E91  	LDA $910E
C0/869D:	8D9590  	STA $9095
C0/86A0:	AD4E91  	LDA $914E
C0/86A3:	8D9690  	STA $9096
C0/86A6:	AD1091  	LDA $9110
C0/86A9:	8D9790  	STA $9097
C0/86AC:	AD5091  	LDA $9150
C0/86AF:	8D9890  	STA $9098
C0/86B2:	AD1291  	LDA $9112
C0/86B5:	8D9990  	STA $9099
C0/86B8:	AD5291  	LDA $9152
C0/86BB:	8D9A90  	STA $909A
C0/86BE:	AD1491  	LDA $9114
C0/86C1:	8D9B90  	STA $909B
C0/86C4:	AD5491  	LDA $9154
C0/86C7:	8D9C90  	STA $909C
C0/86CA:	AD1691  	LDA $9116
C0/86CD:	8D9D90  	STA $909D
C0/86D0:	AD5691  	LDA $9156
C0/86D3:	8D9E90  	STA $909E
C0/86D6:	AD1891  	LDA $9118
C0/86D9:	8D9F90  	STA $909F
C0/86DC:	AD5891  	LDA $9158
C0/86DF:	8DA090  	STA $90A0
C0/86E2:	AD1A91  	LDA $911A
C0/86E5:	8DA190  	STA $90A1
C0/86E8:	AD5A91  	LDA $915A
C0/86EB:	8DA290  	STA $90A2
C0/86EE:	9CA390  	STZ $90A3
C0/86F1:	9CA490  	STZ $90A4
C0/86F4:	9CA590  	STZ $90A5
C0/86F7:	9CA690  	STZ $90A6
C0/86FA:	9CA790  	STZ $90A7
C0/86FD:	9CA890  	STZ $90A8
C0/8700:	9CA990  	STZ $90A9
C0/8703:	9CAA90  	STZ $90AA
C0/8706:	AD0391  	LDA $9103
C0/8709:	8DAB90  	STA $90AB
C0/870C:	AD4391  	LDA $9143
C0/870F:	8DAC90  	STA $90AC
C0/8712:	AD0591  	LDA $9105
C0/8715:	8DAD90  	STA $90AD
C0/8718:	AD4591  	LDA $9145
C0/871B:	8DAE90  	STA $90AE
C0/871E:	AD0791  	LDA $9107
C0/8721:	8DAF90  	STA $90AF
C0/8724:	AD4791  	LDA $9147
C0/8727:	8DB090  	STA $90B0
C0/872A:	AD0991  	LDA $9109
C0/872D:	8DB190  	STA $90B1
C0/8730:	AD4991  	LDA $9149
C0/8733:	8DB290  	STA $90B2
C0/8736:	AD0B91  	LDA $910B
C0/8739:	8DB390  	STA $90B3
C0/873C:	AD4B91  	LDA $914B
C0/873F:	8DB490  	STA $90B4
C0/8742:	AD0D91  	LDA $910D
C0/8745:	8DB590  	STA $90B5
C0/8748:	AD4D91  	LDA $914D
C0/874B:	8DB690  	STA $90B6
C0/874E:	AD0F91  	LDA $910F
C0/8751:	8DB790  	STA $90B7
C0/8754:	AD4F91  	LDA $914F
C0/8757:	8DB890  	STA $90B8
C0/875A:	AD1191  	LDA $9111
C0/875D:	8DB990  	STA $90B9
C0/8760:	AD5191  	LDA $9151
C0/8763:	8DBA90  	STA $90BA
C0/8766:	AD1391  	LDA $9113
C0/8769:	8DBB90  	STA $90BB
C0/876C:	AD5391  	LDA $9153
C0/876F:	8DBC90  	STA $90BC
C0/8772:	AD1591  	LDA $9115
C0/8775:	8DBD90  	STA $90BD
C0/8778:	AD5591  	LDA $9155
C0/877B:	8DBE90  	STA $90BE
C0/877E:	AD1791  	LDA $9117
C0/8781:	8DBF90  	STA $90BF
C0/8784:	AD5791  	LDA $9157
C0/8787:	8DC090  	STA $90C0
C0/878A:	AD1991  	LDA $9119
C0/878D:	8DC190  	STA $90C1
C0/8790:	AD5991  	LDA $9159
C0/8793:	8DC290  	STA $90C2
C0/8796:	7B      	TDC 
C0/8797:	48      	PHA
C0/8798:	AB      	PLB
C0/8799:	60      	RTS
 
C0/879A:	A28390  	LDX #$9083
C0/879D:	8E8121  	STX $2181
C0/87A0:	A97E    	LDA #$7E
C0/87A2:	8D8321  	STA $2183
C0/87A5:	9C8021  	STZ $2180
C0/87A8:	9C8021  	STZ $2180
C0/87AB:	9C8021  	STZ $2180
C0/87AE:	9C8021  	STZ $2180
C0/87B1:	9C8021  	STZ $2180
C0/87B4:	9C8021  	STZ $2180
C0/87B7:	9C8021  	STZ $2180
C0/87BA:	9C8021  	STZ $2180
C0/87BD:	A600    	LDX $00
C0/87BF:	9B      	TXY
C0/87C0:	BF3288C0	LDA $C08832,X
C0/87C4:	8D8021  	STA $2180
C0/87C7:	4A      	LSR A
C0/87C8:	8D8021  	STA $2180
C0/87CB:	E8      	INX
C0/87CC:	E00C00  	CPX #$000C
C0/87CF:	D0EF    	BNE $87C0
C0/87D1:	9C8021  	STZ $2180
C0/87D4:	9C8021  	STZ $2180
C0/87D7:	9C8021  	STZ $2180
C0/87DA:	9C8021  	STZ $2180
C0/87DD:	9C8021  	STZ $2180
C0/87E0:	9C8021  	STZ $2180
C0/87E3:	9C8021  	STZ $2180
C0/87E6:	9C8021  	STZ $2180
C0/87E9:	9C8021  	STZ $2180
C0/87EC:	9C8021  	STZ $2180
C0/87EF:	9C8021  	STZ $2180
C0/87F2:	9C8021  	STZ $2180
C0/87F5:	9C8021  	STZ $2180
C0/87F8:	9C8021  	STZ $2180
C0/87FB:	9C8021  	STZ $2180
C0/87FE:	9C8021  	STZ $2180
C0/8801:	9C8021  	STZ $2180
C0/8804:	9C8021  	STZ $2180
C0/8807:	9C8021  	STZ $2180
C0/880A:	9C8021  	STZ $2180
C0/880D:	9C8021  	STZ $2180
C0/8810:	9C8021  	STZ $2180
C0/8813:	9C8021  	STZ $2180
C0/8816:	9C8021  	STZ $2180
C0/8819:	9C8021  	STZ $2180
C0/881C:	9C8021  	STZ $2180
C0/881F:	9C8021  	STZ $2180
C0/8822:	9C8021  	STZ $2180
C0/8825:	9C8021  	STZ $2180
C0/8828:	9C8021  	STZ $2180
C0/882B:	9C8021  	STZ $2180
C0/882E:	9C8021  	STZ $2180
C0/8831:	60      	RTS
 
Data
C0/8832:	203038  	JSR $3830
C0/8835:	3C3E3F  	BIT $3F3E,X
C0/8838:	3E3C38  	ROL $383C,X
C0/883B:	3020    	BMI $885D
C0/883D:	00

; Handle dialogue window updates
C0/883E:	AD8205  	LDA $0582       ; "update dialogue"
C0/8841:	F065    	BEQ $88A8       ; exit if not ^
C0/8843:	9C8205    STZ $0582       ; clear "update dialogue" flag
C0/8844:	A980      LDA #$80        ; videoport address increment mode
C0/8847:	8D1521 	  STA $2115       ; set VMAIN video port mode

C0/884B:	9C0B42  	STZ $420B       ; disable all DMA channels
C0/884E:	C221    	REP #$21
C0/8850:	A5C3    	LDA $C3
C0/8852:	690038  	ADC #$3800
C0/8855:	8D1621  	STA $2116
C0/8858:	7B      	TDC 
C0/8859:	E220    	SEP #$20      (8 bit accum./memory)
C0/885B:	A941    	LDA #$41
C0/885D:	8D0043  	STA $4300
C0/8860:	A918    	LDA #$18
C0/8862:	8D0143  	STA $4301
C0/8865:	A2A390  	LDX #$90A3
C0/8868:	8E0243  	STX $4302
C0/886B:	A97E    	LDA #$7E
C0/886D:	8D0443  	STA $4304
C0/8870:	8D0743  	STA $4307
C0/8873:	A22000  	LDX #$0020
C0/8876:	8E0543  	STX $4305
C0/8879:	A901    	LDA #$01
C0/887B:	8D0B42  	STA $420B
C0/887E:	9C0B42  	STZ $420B      (turn off DMA)
C0/8881:	C221    	REP #$21
C0/8883:	AD8005  	LDA $0580
C0/8886:	690038  	ADC #$3800
C0/8889:	8D1621  	STA $2116
C0/888C:	7B      	TDC 
C0/888D:	E220    	SEP #$20      (8 bit accum./memory)
C0/888F:	A28390  	LDX #$9083
C0/8892:	8E0243  	STX $4302
C0/8895:	A97E    	LDA #$7E
C0/8897:	8D0443  	STA $4304
C0/889A:	8D0743  	STA $4307		
C0/889D:	A22000  	LDX #$0020
C0/88A0:	8E0543  	STX $4305
C0/88A3:	A901    	LDA #$01
C0/88A5:	8D0B42  	STA $420B
C0/88A8:	60      	RTS
 
C0/88A9:	A97E    	LDA #$7E		(from C0/7FB8, C0/8544, C0/8572)
C0/88AB:	8D8321  	STA $2183
C0/88AE:	A20391  	LDX #$9103
C0/88B1:	8E8121  	STX $2181
C0/88B4:	A21000  	LDX #$0010
C0/88B7:	9C8021  	STZ $2180
C0/88BA:	9C8021  	STZ $2180
C0/88BD:	9C8021  	STZ $2180
C0/88C0:	9C8021  	STZ $2180
C0/88C3:	9C8021  	STZ $2180
C0/88C6:	9C8021  	STZ $2180
C0/88C9:	9C8021  	STZ $2180
C0/88CC:	9C8021  	STZ $2180
C0/88CF:	CA      	DEX
C0/88D0:	D0E5    	BNE $88B7
C0/88D2:	60      	RTS
 
C0/88D3:	A97E    	LDA #$7E
C0/88D5:	48      	PHA
C0/88D6:	AB      	PLB
C0/88D7:	ADBF00  	LDA $00BF
C0/88DA:	2908    	AND #$08
C0/88DC:	F003    	BEQ $88E1
C0/88DE:	4C2489  	JMP $8924

C0/88E1:	A600    	LDX $00
C0/88E3:	BD0491  	LDA $9104,X
C0/88E6:	1D0490  	ORA $9004,X
C0/88E9:	9D0491  	STA $9104,X
C0/88EC:	BD0391  	LDA $9103,X
C0/88EF:	1D0390  	ORA $9003,X
C0/88F2:	9D0391  	STA $9103,X
C0/88F5:	BD2491  	LDA $9124,X
C0/88F8:	1D2490  	ORA $9024,X
C0/88FB:	9D2491  	STA $9124,X
C0/88FE:	BD4491  	LDA $9144,X
C0/8901:	1D4490  	ORA $9044,X
C0/8904:	9D4491  	STA $9144,X
C0/8907:	BD4391  	LDA $9143,X
C0/890A:	1D4390  	ORA $9043,X
C0/890D:	9D4391  	STA $9143,X
C0/8910:	BD6491  	LDA $9164,X
C0/8913:	1D6490  	ORA $9064,X
C0/8916:	9D6491  	STA $9164,X
C0/8919:	E8      	INX
C0/891A:	E8      	INX
C0/891B:	E02000  	CPX #$0020
C0/891E:	D0C3    	BNE $88E3
C0/8920:	7B      	TDC 
C0/8921:	48      	PHA
C0/8922:	AB      	PLB
C0/8923:	60      	RTS
 
C0/8924:	A600    	LDX $00
C0/8926:	BD0391  	LDA $9103,X
C0/8929:	1D0490  	ORA $9004,X
C0/892C:	9D0391  	STA $9103,X
C0/892F:	BD2491  	LDA $9124,X
C0/8932:	1D0390  	ORA $9003,X
C0/8935:	9D2491  	STA $9124,X
C0/8938:	BD2391  	LDA $9123,X
C0/893B:	1D2490  	ORA $9024,X
C0/893E:	9D2391  	STA $9123,X
C0/8941:	BD4391  	LDA $9143,X
C0/8944:	1D4490  	ORA $9044,X
C0/8947:	9D4391  	STA $9143,X
C0/894A:	BD6491  	LDA $9164,X
C0/894D:	1D4390  	ORA $9043,X
C0/8950:	9D6491  	STA $9164,X
C0/8953:	BD6391  	LDA $9163,X
C0/8956:	1D6490  	ORA $9064,X
C0/8959:	9D6391  	STA $9163,X
C0/895C:	E8      	INX
C0/895D:	E8      	INX
C0/895E:	E02000  	CPX #$0020
C0/8961:	D0C3    	BNE $8926
C0/8963:	7B      	TDC 
C0/8964:	48      	PHA
C0/8965:	AB      	PLB
C0/8966:	60      	RTS
 
C0/8967:	A97E    	LDA #$7E
C0/8969:	48      	PHA
C0/896A:	AB      	PLB
C0/896B:	A600    	LDX $00
C0/896D:	BD2391  	LDA $9123,X
C0/8970:	9D0391  	STA $9103,X
C0/8973:	BD6391  	LDA $9163,X
C0/8976:	9D4391  	STA $9143,X
C0/8979:	7B      	TDC 
C0/897A:	9D2391  	STA $9123,X
C0/897D:	9D6391  	STA $9163,X
C0/8980:	E8      	INX
C0/8981:	E02000  	CPX #$0020
C0/8984:	D0E7    	BNE $896D
C0/8986:	7B      	TDC 
C0/8987:	48      	PHA
C0/8988:	AB      	PLB
C0/8989:	60      	RTS
 
C0/898A:	A97E    	LDA #$7E			(from C0/84E1, C0/8520, C0/855A)
C0/898C:	8D8321  	STA $2183
C0/898F:	A22390  	LDX #$9023
C0/8992:	8E8121  	STX $2181
C0/8995:	9C8021  	STZ $2180
C0/8998:	9C8021  	STZ $2180
C0/899B:	9C8021  	STZ $2180
C0/899E:	9C8021  	STZ $2180
C0/89A1:	9C8021  	STZ $2180
C0/89A4:	9C8021  	STZ $2180
C0/89A7:	9C8021  	STZ $2180
C0/89AA:	9C8021  	STZ $2180
C0/89AD:	9C8021  	STZ $2180
C0/89B0:	9C8021  	STZ $2180
C0/89B3:	9C8021  	STZ $2180
C0/89B6:	9C8021  	STZ $2180
C0/89B9:	9C8021  	STZ $2180
C0/89BC:	9C8021  	STZ $2180
C0/89BF:	9C8021  	STZ $2180
C0/89C2:	9C8021  	STZ $2180
C0/89C5:	9C8021  	STZ $2180
C0/89C8:	9C8021  	STZ $2180
C0/89CB:	9C8021  	STZ $2180
C0/89CE:	9C8021  	STZ $2180
C0/89D1:	9C8021  	STZ $2180
C0/89D4:	9C8021  	STZ $2180
C0/89D7:	9C8021  	STZ $2180
C0/89DA:	9C8021  	STZ $2180
C0/89DD:	A26390  	LDX #$9063
C0/89E0:	8E8121  	STX $2181
C0/89E3:	9C8021  	STZ $2180
C0/89E6:	9C8021  	STZ $2180
C0/89E9:	9C8021  	STZ $2180
C0/89EC:	9C8021  	STZ $2180
C0/89EF:	9C8021  	STZ $2180
C0/89F2:	9C8021  	STZ $2180
C0/89F5:	9C8021  	STZ $2180
C0/89F8:	9C8021  	STZ $2180
C0/89FB:	9C8021  	STZ $2180
C0/89FE:	9C8021  	STZ $2180
C0/8A01:	9C8021  	STZ $2180
C0/8A04:	9C8021  	STZ $2180
C0/8A07:	9C8021  	STZ $2180
C0/8A0A:	9C8021  	STZ $2180
C0/8A0D:	9C8021  	STZ $2180
C0/8A10:	9C8021  	STZ $2180
C0/8A13:	9C8021  	STZ $2180
C0/8A16:	9C8021  	STZ $2180
C0/8A19:	9C8021  	STZ $2180
C0/8A1C:	9C8021  	STZ $2180
C0/8A1F:	9C8021  	STZ $2180
C0/8A22:	9C8021  	STZ $2180
C0/8A25:	9C8021  	STZ $2180
C0/8A28:	9C8021  	STZ $2180
C0/8A2B:	C220    	REP #$20      (16 bit accum./memory)
C0/8A2D:	A5CD    	LDA $CD
C0/8A2F:	0A      	ASL A
C0/8A30:	851E    	STA $1E
C0/8A32:	0A      	ASL A
C0/8A33:	8520    	STA $20
C0/8A35:	0A      	ASL A
C0/8A36:	0A      	ASL A
C0/8A37:	18      	CLC
C0/8A38:	651E    	ADC $1E
C0/8A3A:	18      	CLC
C0/8A3B:	6520    	ADC $20
C0/8A3D:	AA      	TAX
C0/8A3E:	7B      	TDC 
C0/8A3F:	E220    	SEP #$20      (8 bit accum./memory)
C0/8A41:	A97E    	LDA #$7E
C0/8A43:	48      	PHA
C0/8A44:	AB      	PLB
C0/8A45:	ADBF00  	LDA $00BF
C0/8A48:	2907    	AND #$07
C0/8A4A:	C904    	CMP #$04
C0/8A4C:	D003    	BNE $8A51
C0/8A4E:	4C238B  	JMP $8B23

C0/8A51:	9003    	BCC $8A56
C0/8A53:	4C428B  	JMP $8B42

C0/8A56:	4502    	EOR $02        (EOR #$FF?! cleverness?! what?!)
C0/8A58:	18      	CLC
C0/8A59:	6905    	ADC #$05
C0/8A5B:	851E    	STA $1E
C0/8A5D:	641F    	STZ $1F
C0/8A5F:	C220    	REP #$20      (16 bit accum./memory)
C0/8A61:	A41E    	LDY $1E
C0/8A63:	BF008EC4	LDA $C48E00,X  (this is actually loading VWF data)
C0/8A67:	0A      	ASL A
C0/8A68:	88      	DEY 
C0/8A69:	D0FC    	BNE $8A67
C0/8A6B:	8D0390  	STA $9003
C0/8A6E:	4A      	LSR A
C0/8A6F:	8D4590  	STA $9045
C0/8A72:	A41E    	LDY $1E
C0/8A74:	BF028EC4	LDA $C48E02,X  (this is actually loading VWF data)
C0/8A78:	0A      	ASL A
C0/8A79:	88      	DEY 
C0/8A7A:	D0FC    	BNE $8A78
C0/8A7C:	8D0590  	STA $9005
C0/8A7F:	4A      	LSR A
C0/8A80:	8D4790  	STA $9047
C0/8A83:	A41E    	LDY $1E
C0/8A85:	BF048EC4	LDA $C48E04,X  (this is actually loading VWF data)
C0/8A89:	0A      	ASL A
C0/8A8A:	88      	DEY 
C0/8A8B:	D0FC    	BNE $8A89
C0/8A8D:	8D0790  	STA $9007
C0/8A90:	4A      	LSR A
C0/8A91:	8D4990  	STA $9049
C0/8A94:	A41E    	LDY $1E
C0/8A96:	BF068EC4	LDA $C48E06,X  (this is actually loading VWF data)
C0/8A9A:	0A      	ASL A
C0/8A9B:	88      	DEY 
C0/8A9C:	D0FC    	BNE $8A9A
C0/8A9E:	8D0990  	STA $9009
C0/8AA1:	4A      	LSR A
C0/8AA2:	8D4B90  	STA $904B
C0/8AA5:	A41E    	LDY $1E
C0/8AA7:	BF088EC4	LDA $C48E08,X  (this is actually loading VWF data)
C0/8AAB:	0A      	ASL A
C0/8AAC:	88      	DEY 
C0/8AAD:	D0FC    	BNE $8AAB
C0/8AAF:	8D0B90  	STA $900B
C0/8AB2:	4A      	LSR A
C0/8AB3:	8D4D90  	STA $904D
C0/8AB6:	A41E    	LDY $1E
C0/8AB8:	BF0A8EC4	LDA $C48E0A,X  (this is actually loading VWF data)
C0/8ABC:	0A      	ASL A
C0/8ABD:	88      	DEY 
C0/8ABE:	D0FC    	BNE $8ABC
C0/8AC0:	8D0D90  	STA $900D
C0/8AC3:	4A      	LSR A
C0/8AC4:	8D4F90  	STA $904F
C0/8AC7:	A41E    	LDY $1E
C0/8AC9:	BF0C8EC4	LDA $C48E0C,X  (this is actually loading VWF data)
C0/8ACD:	0A      	ASL A
C0/8ACE:	88      	DEY 
C0/8ACF:	D0FC    	BNE $8ACD
C0/8AD1:	8D0F90  	STA $900F
C0/8AD4:	4A      	LSR A
C0/8AD5:	8D5190  	STA $9051
C0/8AD8:	A41E    	LDY $1E
C0/8ADA:	BF0E8EC4	LDA $C48E0E,X  (this is actually loading VWF data)
C0/8ADE:	0A      	ASL A
C0/8ADF:	88      	DEY 
C0/8AE0:	D0FC    	BNE $8ADE
C0/8AE2:	8D1190  	STA $9011
C0/8AE5:	4A      	LSR A
C0/8AE6:	8D5390  	STA $9053
C0/8AE9:	A41E    	LDY $1E
C0/8AEB:	BF108EC4	LDA $C48E10,X  (this is actually loading VWF data)
C0/8AEF:	0A      	ASL A
C0/8AF0:	88      	DEY 
C0/8AF1:	D0FC    	BNE $8AEF
C0/8AF3:	8D1390  	STA $9013
C0/8AF6:	4A      	LSR A
C0/8AF7:	8D5590  	STA $9055
C0/8AFA:	A41E    	LDY $1E
C0/8AFC:	BF128EC4	LDA $C48E12,X  (this is actually loading VWF data)
C0/8B00:	0A      	ASL A
C0/8B01:	88      	DEY 
C0/8B02:	D0FC    	BNE $8B00
C0/8B04:	8D1590  	STA $9015
C0/8B07:	4A      	LSR A
C0/8B08:	8D5790  	STA $9057
C0/8B0B:	A41E    	LDY $1E
C0/8B0D:	BF148EC4	LDA $C48E14,X  (this is actually loading VWF data)
C0/8B11:	0A      	ASL A
C0/8B12:	88      	DEY 
C0/8B13:	D0FC    	BNE $8B11
C0/8B15:	8D1790  	STA $9017
C0/8B18:	4A      	LSR A
C0/8B19:	8D5990  	STA $9059
C0/8B1C:	7B      	TDC 
C0/8B1D:	E220    	SEP #$20      (8 bit accum./memory)
C0/8B1F:	7B      	TDC            (no need for this)
C0/8B20:	48      	PHA
C0/8B21:	AB      	PLB           (set B to #$00)
C0/8B22:	60      	RTS
 
C0/8B23:	C220    	REP #$20      (16 bit accum./memory)
C0/8B25:	A400    	LDY $00
C0/8B27:	BF008EC4	LDA $C48E00,X  (this is actually loading VWF data)
C0/8B2B:	990390  	STA $9003,Y
C0/8B2E:	4A      	LSR A
C0/8B2F:	994590  	STA $9045,Y
C0/8B32:	E8      	INX
C0/8B33:	E8      	INX
C0/8B34:	C8      	INY 
C0/8B35:	C8      	INY 
C0/8B36:	C01600  	CPY #$0016
C0/8B39:	D0EC    	BNE $8B27
C0/8B3B:	7B      	TDC 
C0/8B3C:	E220    	SEP #$20      (8 bit accum./memory)
C0/8B3E:	7B      	TDC            (no need for this)
C0/8B3F:	48      	PHA
C0/8B40:	AB      	PLB           (set B to #$00)
C0/8B41:	60      	RTS
 
C0/8B42:	38      	SEC 
C0/8B43:	E904    	SBC #$04
C0/8B45:	851E    	STA $1E
C0/8B47:	641F    	STZ $1F
C0/8B49:	C220    	REP #$20      (16 bit accum./memory)
C0/8B4B:	A41E    	LDY $1E
C0/8B4D:	BF008EC4	LDA $C48E00,X  (this is actually loading VWF data)
C0/8B51:	4A      	LSR A
C0/8B52:	6E2390  	ROR $9023
C0/8B55:	88      	DEY 
C0/8B56:	D0F9    	BNE $8B51
C0/8B58:	8D0390  	STA $9003
C0/8B5B:	4A      	LSR A
C0/8B5C:	8D4590  	STA $9045
C0/8B5F:	AD2390  	LDA $9023
C0/8B62:	6A      	ROR A
C0/8B63:	8D6590  	STA $9065
C0/8B66:	A41E    	LDY $1E
C0/8B68:	BF028EC4	LDA $C48E02,X  (this is actually loading VWF data)
C0/8B6C:	4A      	LSR A
C0/8B6D:	6E2590  	ROR $9025
C0/8B70:	88      	DEY 
C0/8B71:	D0F9    	BNE $8B6C
C0/8B73:	8D0590  	STA $9005
C0/8B76:	4A      	LSR A
C0/8B77:	8D4790  	STA $9047
C0/8B7A:	AD2590  	LDA $9025
C0/8B7D:	6A      	ROR A
C0/8B7E:	8D6790  	STA $9067
C0/8B81:	A41E    	LDY $1E
C0/8B83:	BF048EC4	LDA $C48E04,X  (this is actually loading VWF data)
C0/8B87:	4A      	LSR A
C0/8B88:	6E2790  	ROR $9027
C0/8B8B:	88      	DEY 
C0/8B8C:	D0F9    	BNE $8B87
C0/8B8E:	8D0790  	STA $9007
C0/8B91:	4A      	LSR A
C0/8B92:	8D4990  	STA $9049
C0/8B95:	AD2790  	LDA $9027
C0/8B98:	6A      	ROR A
C0/8B99:	8D6990  	STA $9069
C0/8B9C:	A41E    	LDY $1E
C0/8B9E:	BF068EC4	LDA $C48E06,X  (this is actually loading VWF data)
C0/8BA2:	4A      	LSR A
C0/8BA3:	6E2990  	ROR $9029
C0/8BA6:	88      	DEY 
C0/8BA7:	D0F9    	BNE $8BA2
C0/8BA9:	8D0990  	STA $9009
C0/8BAC:	4A      	LSR A
C0/8BAD:	8D4B90  	STA $904B
C0/8BB0:	AD2990  	LDA $9029
C0/8BB3:	6A      	ROR A
C0/8BB4:	8D6B90  	STA $906B
C0/8BB7:	A41E    	LDY $1E
C0/8BB9:	BF088EC4	LDA $C48E08,X  (this is actually loading VWF data)
C0/8BBD:	4A      	LSR A
C0/8BBE:	6E2B90  	ROR $902B
C0/8BC1:	88      	DEY 
C0/8BC2:	D0F9    	BNE $8BBD
C0/8BC4:	8D0B90  	STA $900B
C0/8BC7:	4A      	LSR A
C0/8BC8:	8D4D90  	STA $904D
C0/8BCB:	AD2B90  	LDA $902B
C0/8BCE:	6A      	ROR A
C0/8BCF:	8D6D90  	STA $906D
C0/8BD2:	A41E    	LDY $1E
C0/8BD4:	BF0A8EC4	LDA $C48E0A,X  (this is actually loading VWF data)
C0/8BD8:	4A      	LSR A
C0/8BD9:	6E2D90  	ROR $902D
C0/8BDC:	88      	DEY 
C0/8BDD:	D0F9    	BNE $8BD8
C0/8BDF:	8D0D90  	STA $900D
C0/8BE2:	4A      	LSR A
C0/8BE3:	8D4F90  	STA $904F
C0/8BE6:	AD2D90  	LDA $902D
C0/8BE9:	6A      	ROR A
C0/8BEA:	8D6F90  	STA $906F
C0/8BED:	A41E    	LDY $1E
C0/8BEF:	BF0C8EC4	LDA $C48E0C,X  (this is actually loading VWF data)
C0/8BF3:	4A      	LSR A
C0/8BF4:	6E2F90  	ROR $902F
C0/8BF7:	88      	DEY 
C0/8BF8:	D0F9    	BNE $8BF3
C0/8BFA:	8D0F90  	STA $900F
C0/8BFD:	4A      	LSR A
C0/8BFE:	8D5190  	STA $9051
C0/8C01:	AD2F90  	LDA $902F
C0/8C04:	6A      	ROR A
C0/8C05:	8D7190  	STA $9071
C0/8C08:	A41E    	LDY $1E
C0/8C0A:	BF0E8EC4	LDA $C48E0E,X  (this is actually loading VWF data)
C0/8C0E:	4A      	LSR A
C0/8C0F:	6E3190  	ROR $9031
C0/8C12:	88      	DEY 
C0/8C13:	D0F9    	BNE $8C0E
C0/8C15:	8D1190  	STA $9011
C0/8C18:	4A      	LSR A
C0/8C19:	8D5390  	STA $9053
C0/8C1C:	AD3190  	LDA $9031
C0/8C1F:	6A      	ROR A
C0/8C20:	8D7390  	STA $9073
C0/8C23:	A41E    	LDY $1E
C0/8C25:	BF108EC4	LDA $C48E10,X  (this is actually loading VWF data)
C0/8C29:	4A      	LSR A
C0/8C2A:	6E3390  	ROR $9033
C0/8C2D:	88      	DEY 
C0/8C2E:	D0F9    	BNE $8C29
C0/8C30:	8D1390  	STA $9013
C0/8C33:	4A      	LSR A
C0/8C34:	8D5590  	STA $9055
C0/8C37:	AD3390  	LDA $9033
C0/8C3A:	6A      	ROR A
C0/8C3B:	8D7590  	STA $9075
C0/8C3E:	A41E    	LDY $1E
C0/8C40:	BF128EC4	LDA $C48E12,X  (this is actually loading VWF data)
C0/8C44:	4A      	LSR A
C0/8C45:	6E3590  	ROR $9035
C0/8C48:	88      	DEY 
C0/8C49:	D0F9    	BNE $8C44
C0/8C4B:	8D1590  	STA $9015
C0/8C4E:	4A      	LSR A
C0/8C4F:	8D5790  	STA $9057
C0/8C52:	AD3590  	LDA $9035
C0/8C55:	6A      	ROR A
C0/8C56:	8D7790  	STA $9077
C0/8C59:	A41E    	LDY $1E
C0/8C5B:	BF148EC4	LDA $C48E14,X  (this is actually loading VWF data)
C0/8C5F:	4A      	LSR A
C0/8C60:	6E3790  	ROR $9037
C0/8C63:	88      	DEY 
C0/8C64:	D0F9    	BNE $8C5F
C0/8C66:	8D1790  	STA $9017
C0/8C69:	4A      	LSR A
C0/8C6A:	8D5990  	STA $9059
C0/8C6D:	AD3790  	LDA $9037
C0/8C70:	6A      	ROR A
C0/8C71:	8D7990  	STA $9079
C0/8C74:	7B      	TDC 
C0/8C75:	E220    	SEP #$20      (8 bit accum./memory)
C0/8C77:	7B      	TDC 
C0/8C78:	48      	PHA
C0/8C79:	AB      	PLB
C0/8C7A:	60      	RTS
 
C0/8C7B:	AB      	PLB
C0/8C7C:	8CAE8C  	STY $8CAE
C0/8C7F:	B38C    	LDA ($8C,S),Y
C0/8C81:	B68C    	LDX $8C,Y
C0/8C83:	B98CBE  	LDA $BE8C,Y
C0/8C86:	8CC18C  	STY $8CC1
C0/8C89:	C48C    	CPY $8C
C0/8C8B:	C98C    	CMP #$8C
C0/8C8D:	CC8CD6  	CPY $D68C
C0/8C90:	8CDE8C  	STY $8CDE
C0/8C93:	E18C    	SBC ($8C,X)
C0/8C95:	E48C    	CPX $8C
C0/8C97:	E98C    	SBC #$8C
C0/8C99:	F18C    	SBC ($8C),Y
C0/8C9B:	F48CF9  	PEA $F98C
C0/8C9E:	8CFE8C  	STY $8CFE
C0/8CA1:	048D    	TSB $8D
C0/8CA3:	08      	PHP 
C0/8CA4:	8D0B8D  	STA $8D0B
C0/8CA7:	0F8D128D	ORA $8D128D
C0/8CAB:	C7C7    	CMP [$C7]
C0/8CAD:	001F    	BRK #$1F
C0/8CAF:	F91FF8  	SBC $F81F,Y
C0/8CB2:	00BD    	BRK #$BD
C0/8CB4:	8500    	STA $00
C0/8CB6:	BD7F00  	LDA $007F,X
C0/8CB9:	1E9F1E  	ASL $1E9F,X
C0/8CBC:	AF00938D	LDA $8D9300
C0/8CC0:	0077    	BRK #$77
C0/8CC2:	8500    	STA $00
C0/8CC4:	1C001D  	TRB $1D00
C0/8CC7:	ED0085  	SBC $8500
C0/8CCA:	8D001F  	STA $1F00
C0/8CCD:	2A      	ROL A
C0/8CCE:	1F781F86	ORA $861F78,X
C0/8CD2:	1FA6D000	ORA $00D0A6,X
C0/8CD6:	1F701F64	ORA $641F70,X
C0/8CDA:	1F6AD000	ORA $00D06A,X
C0/8CDE:	6B      	RTL
 
C0/8CDF:	A700    	LDA [$00]
C0/8CE1:	739B    	ADC ($9B,S),Y
C0/8CE3:	001E    	BRK #$1E
C0/8CE5:	DA      	PHX
C0/8CE6:	1C0300  	TRB $0003
C0/8CE9:	1F201F92	ORA $921F20,X
C0/8CED:	1FB8D000	ORA $00D0B8,X
C0/8CF1:	B93F00  	LDA $003F,Y
C0/8CF4:	1C041E  	TRB $1E04
C0/8CF7:	0D0045  	ORA $4500
C0/8CFA:	3335    	AND ($35,S),Y
C0/8CFC:	AB      	PLB
C0/8CFD:	001F    	BRK #$1F
C0/8CFF:	761F    	ROR $1F,X
C0/8D01:	46D0    	LSR $D0
C0/8D03:	009B    	BRK #$9B
C0/8D05:	1DE600  	ORA $00E6,X
C0/8D08:	37BF    	AND [$BF],Y
C0/8D0A:	0085    	BRK #$85
C0/8D0C:	6FAD003F	ADC $3F00AD
C0/8D10:	D200    	CMP ($00)
C0/8D12:	1E231E  	ASL $1E23,X
C0/8D15:	0100    	ORA ($00,X)

C0/8D17:	AD3A05  	LDA $053A		(from C0/BF97)
C0/8D1A:	D001    	BNE $8D1D
C0/8D1C:	60      	RTS
 
C0/8D1D:	3A      	DEC A			(from C0/8D1A)
C0/8D1E:	8D0242  	STA $4202
C0/8D21:	A90C    	LDA #$0C
C0/8D23:	8D0342  	STA $4203
C0/8D26:	EA      	NOP
C0/8D27:	EA      	NOP
C0/8D28:	EA      	NOP
C0/8D29:	AE1642  	LDX $4216
C0/8D2C:	A400    	LDY $00
C0/8D2E:	BF2598C0	LDA $C09825,X
C0/8D32:	99EA10  	STA $10EA,Y
C0/8D35:	BF2698C0	LDA $C09826,X
C0/8D39:	99E810  	STA $10E8,Y
C0/8D3C:	BF2798C0	LDA $C09827,X
C0/8D40:	99EB10  	STA $10EB,Y
C0/8D43:	BF2898C0	LDA $C09828,X
C0/8D47:	99EC10  	STA $10EC,Y
C0/8D4A:	BF2998C0	LDA $C09829,X
C0/8D4E:	99ED10  	STA $10ED,Y
C0/8D51:	BF2A98C0	LDA $C0982A,X
C0/8D55:	99EE10  	STA $10EE,Y
C0/8D58:	A900    	LDA #$00
C0/8D5A:	99E710  	STA $10E7,Y
C0/8D5D:	99E910  	STA $10E9,Y
C0/8D60:	C221    	REP #$21
C0/8D62:	8A      	TXA
C0/8D63:	690600  	ADC #$0006
C0/8D66:	AA      	TAX
C0/8D67:	7B      	TDC 
C0/8D68:	E220    	SEP #$20      (8 bit accum./memory)
C0/8D6A:	98      	TYA
C0/8D6B:	18      	CLC
C0/8D6C:	6908    	ADC #$08
C0/8D6E:	A8      	TAY
C0/8D6F:	C910    	CMP #$10
C0/8D71:	D0BB    	BNE $8D2E
C0/8D73:	60      	RTS
 
C0/8D74:	AD3A05  	LDA $053A	  	(from C0/00B0)
C0/8D77:	F04E    	BEQ $8DC7
C0/8D79:	A400    	LDY $00
C0/8D7B:	B9EA10  	LDA $10EA,Y
C0/8D7E:	303B    	BMI $8DBB
C0/8D80:	29F0    	AND #$F0
C0/8D82:	4A      	LSR A
C0/8D83:	4A      	LSR A
C0/8D84:	4A      	LSR A
C0/8D85:	4A      	LSR A
C0/8D86:	D00A    	BNE $8D92
C0/8D88:	20C88D  	JSR $8DC8
C0/8D8B:	C900    	CMP #$00
C0/8D8D:	D02C    	BNE $8DBB
C0/8D8F:	4CBB8D  	JMP $8DBB

C0/8D92:	3A      	DEC A
C0/8D93:	D00D    	BNE $8DA2
C0/8D95:	20C88D  	JSR $8DC8
C0/8D98:	C900    	CMP #$00
C0/8D9A:	D01F    	BNE $8DBB
C0/8D9C:	20A98E  	JSR $8EA9
C0/8D9F:	4CBB8D  	JMP $8DBB

C0/8DA2:	3A      	DEC A
C0/8DA3:	D00B    	BNE $8DB0
C0/8DA5:	20C88D  	JSR $8DC8
C0/8DA8:	5A      	PHY
C0/8DA9:	206B8E  	JSR $8E6B
C0/8DAC:	7A      	PLY
C0/8DAD:	4CBB8D  	JMP $8DBB

C0/8DB0:	3A      	DEC A
C0/8DB1:	D008    	BNE $8DBB
C0/8DB3:	20C88D  	JSR $8DC8
C0/8DB6:	5A      	PHY
C0/8DB7:	20048E  	JSR $8E04
C0/8DBA:	7A      	PLY
C0/8DBB:	98      	TYA
C0/8DBC:	18      	CLC
C0/8DBD:	6908    	ADC #$08
C0/8DBF:	A8      	TAY
C0/8DC0:	C910    	CMP #$10
C0/8DC2:	F003    	BEQ $8DC7
C0/8DC4:	4C7B8D  	JMP $8D7B
C0/8DC7:	60      	RTS
 
C0/8DC8:	B9E710  	LDA $10E7,Y		(from C0/8D88)
C0/8DCB:	1A      	INC A
C0/8DCC:	99E710  	STA $10E7,Y
C0/8DCF:	D9E810  	CMP $10E8,Y
C0/8DD2:	D01B    	BNE $8DEF
C0/8DD4:	A900    	LDA #$00
C0/8DD6:	99E710  	STA $10E7,Y
C0/8DD9:	B9E910  	LDA $10E9,Y
C0/8DDC:	1A      	INC A
C0/8DDD:	99E910  	STA $10E9,Y
C0/8DE0:	B9EA10  	LDA $10EA,Y
C0/8DE3:	290F    	AND #$0F
C0/8DE5:	D9E910  	CMP $10E9,Y
C0/8DE8:	D005    	BNE $8DEF
C0/8DEA:	7B      	TDC 
C0/8DEB:	99E910  	STA $10E9,Y
C0/8DEE:	60      	RTS
 
C0/8DEF:	A901    	LDA #$01		(from C0/8DD2, C0/8DE8)
C0/8DF1:	60      	RTS
 
Data of some sort

C0/8DF2:	7080    	
C0/8DF4:	90A0    	
C0/8DF6:	B0C0    	
C0/8DF8:	D0E0    	
C0/8DFA:	F0E0    	
C0/8DFC:	D0C0    	
C0/8DFE:	B0A0    	
C0/8E00:	9080    	
C0/8E02:	7060    	

C0/8E04:	B9E910  	LDA $10E9,Y
C0/8E07:	AA      	TAX
C0/8E08:	BFF28DC0	LDA $C08DF2,X
C0/8E0C:	8D0242  	STA $4202
C0/8E0F:	B9EB10  	LDA $10EB,Y
C0/8E12:	AA      	TAX
C0/8E13:	B9EC10  	LDA $10EC,Y
C0/8E16:	1A      	INC A
C0/8E17:	1A      	INC A
C0/8E18:	A8      	TAY
C0/8E19:	BF00727E	LDA $7E7200,X
C0/8E1D:	291F    	AND #$1F
C0/8E1F:	8D0342  	STA $4203
C0/8E22:	EA      	NOP
C0/8E23:	EA      	NOP
C0/8E24:	EA      	NOP
C0/8E25:	AD1742  	LDA $4217
C0/8E28:	291F    	AND #$1F
C0/8E2A:	851E    	STA $1E
C0/8E2C:	BF01727E	LDA $7E7201,X
C0/8E30:	297C    	AND #$7C
C0/8E32:	8D0342  	STA $4203
C0/8E35:	EA      	NOP
C0/8E36:	EA      	NOP
C0/8E37:	EA      	NOP
C0/8E38:	AD1742  	LDA $4217
C0/8E3B:	297C    	AND #$7C
C0/8E3D:	851F    	STA $1F
C0/8E3F:	C220    	REP #$20      (16 bit accum./memory)
C0/8E41:	BF00727E	LDA $7E7200,X
C0/8E45:	29E003  	AND #$03E0
C0/8E48:	4A      	LSR A
C0/8E49:	4A      	LSR A
C0/8E4A:	E220    	SEP #$20      (8 bit accum./memory)
C0/8E4C:	8D0342  	STA $4203
C0/8E4F:	EA      	NOP
C0/8E50:	EA      	NOP
C0/8E51:	EA      	NOP
C0/8E52:	AD1742  	LDA $4217
C0/8E55:	29F8    	AND #$F8
C0/8E57:	C220    	REP #$20      (16 bit accum./memory)
C0/8E59:	0A      	ASL A
C0/8E5A:	0A      	ASL A
C0/8E5B:	051E    	ORA $1E
C0/8E5D:	9F00747E	STA $7E7400,X
C0/8E61:	7B      	TDC 
C0/8E62:	E220    	SEP #$20      (8 bit accum./memory)
C0/8E64:	E8      	INX
C0/8E65:	E8      	INX
C0/8E66:	88      	DEY 
C0/8E67:	88      	DEY 
C0/8E68:	D0AF    	BNE $8E19
C0/8E6A:	60      	RTS
 
C0/8E6B:	B9EB10  	LDA $10EB,Y		(from C0/8DA9)
C0/8E6E:	18      	CLC
C0/8E6F:	6900    	ADC #$00
C0/8E71:	852A    	STA $2A
C0/8E73:	A974    	LDA #$74
C0/8E75:	852B    	STA $2B
C0/8E77:	A97E    	LDA #$7E
C0/8E79:	852C    	STA $2C
C0/8E7B:	B9E910  	LDA $10E9,Y
C0/8E7E:	C220    	REP #$20      (16 bit accum./memory)
C0/8E80:	0A      	ASL A
C0/8E81:	0A      	ASL A
C0/8E82:	0A      	ASL A
C0/8E83:	0A      	ASL A
C0/8E84:	0A      	ASL A
C0/8E85:	18      	CLC
C0/8E86:	79ED10  	ADC $10ED,Y
C0/8E89:	AA      	TAX
C0/8E8A:	7B      	TDC 
C0/8E8B:	E220    	SEP #$20      (8 bit accum./memory)
C0/8E8D:	B9EC10  	LDA $10EC,Y
C0/8E90:	A8      	TAY
C0/8E91:	C8      	INY 
C0/8E92:	C8      	INY 
C0/8E93:	C220    	REP #$20      (16 bit accum./memory)
C0/8E95:	BF00F2E6	LDA $E6F200,X
C0/8E99:	872A    	STA [$2A]
C0/8E9B:	E62A    	INC $2A
C0/8E9D:	E62A    	INC $2A
C0/8E9F:	E8      	INX
C0/8EA0:	E8      	INX
C0/8EA1:	88      	DEY 
C0/8EA2:	88      	DEY 
C0/8EA3:	D0F0    	BNE $8E95
C0/8EA5:	7B      	TDC 
C0/8EA6:	E220    	SEP #$20      (8 bit accum./memory)
C0/8EA8:	60      	RTS
 
C0/8EA9:	B9EB10  	LDA $10EB,Y
C0/8EAC:	AA      	TAX
C0/8EAD:	18      	CLC
C0/8EAE:	79EC10  	ADC $10EC,Y
C0/8EB1:	8520    	STA $20
C0/8EB3:	6421    	STZ $21
C0/8EB5:	C220    	REP #$20      (16 bit accum./memory)
C0/8EB7:	BF00747E	LDA $7E7400,X
C0/8EBB:	851E    	STA $1E
C0/8EBD:	BF02747E	LDA $7E7402,X
C0/8EC1:	9F00747E	STA $7E7400,X
C0/8EC5:	E8      	INX
C0/8EC6:	E8      	INX
C0/8EC7:	E420    	CPX $20
C0/8EC9:	D0F2    	BNE $8EBD
C0/8ECB:	A51E    	LDA $1E
C0/8ECD:	9F00747E	STA $7E7400,X
C0/8ED1:	7B      	TDC 
C0/8ED2:	E220    	SEP #$20      (8 bit accum./memory)
C0/8ED4:	60      	RTS
 
C0/8ED5:	20DC8E  	JSR $8EDC		(from C0/BF97)
C0/8ED8:	20B18F  	JSR $8FB1
C0/8EDB:	60      	RTS
 
C0/8EDC:	AD3B05  	LDA $053B		(from C0/8ED5)
C0/8EDF:	291F    	AND #$1F
C0/8EE1:	0A      	ASL A
C0/8EE2:	AA      	TAX
C0/8EE3:	C220    	REP #$20      (16 bit accum./memory)
C0/8EE5:	BFD591C0	LDA $C091D5,X  (load a pointer)
C0/8EE9:	AA      	TAX
C0/8EEA:	7B      	TDC 
C0/8EEB:	E220    	SEP #$20      (8 bit accum./memory)
C0/8EED:	A400    	LDY $00
C0/8EEF:	A9E6    	LDA #$E6
C0/8EF1:	996D10  	STA $106D,Y
C0/8EF4:	C221    	REP #$21
C0/8EF6:	7B      	TDC 
C0/8EF7:	996910  	STA $1069,Y
C0/8EFA:	BFFF91C0	LDA $C091FF,X
C0/8EFE:	996B10  	STA $106B,Y
C0/8F01:	BF0192C0	LDA $C09201,X
C0/8F05:	996E10  	STA $106E,Y
C0/8F08:	BF0392C0	LDA $C09203,X
C0/8F0C:	997010  	STA $1070,Y
C0/8F0F:	BF0592C0	LDA $C09205,X
C0/8F13:	997210  	STA $1072,Y
C0/8F16:	BF0792C0	LDA $C09207,X
C0/8F1A:	997410  	STA $1074,Y
C0/8F1D:	8A      	TXA
C0/8F1E:	690A00  	ADC #$000A
C0/8F21:	AA      	TAX
C0/8F22:	98      	TYA
C0/8F23:	690D00  	ADC #$000D
C0/8F26:	A8      	TAY
C0/8F27:	7B      	TDC 
C0/8F28:	E220    	SEP #$20      (8 bit accum./memory)
C0/8F2A:	C06800  	CPY #$0068
C0/8F2D:	D0C0    	BNE $8EEF
C0/8F2F:	A910    	LDA #$10
C0/8F31:	851A    	STA $1A
C0/8F33:	A0009F  	LDY #$9F00
C0/8F36:	8C8121  	STY $2181
C0/8F39:	A97E    	LDA #$7E
C0/8F3B:	8D8321  	STA $2183
C0/8F3E:	AD3B05  	LDA $053B
C0/8F41:	291F    	AND #$1F
C0/8F43:	0A      	ASL A
C0/8F44:	AA      	TAX
C0/8F45:	C220    	REP #$20      (16 bit accum./memory)
C0/8F47:	BFD591C0	LDA $C091D5,X
C0/8F4B:	A8      	TAY
C0/8F4C:	7B      	TDC 
C0/8F4D:	E220    	SEP #$20      (8 bit accum./memory)
C0/8F4F:	BB      	TYX
C0/8F50:	C221    	REP #$21
C0/8F52:	BF0192C0	LDA $C09201,X
C0/8F56:	AA      	TAX
C0/8F57:	7B      	TDC 
C0/8F58:	E220    	SEP #$20      (8 bit accum./memory)
C0/8F5A:	A980    	LDA #$80
C0/8F5C:	851B    	STA $1B
C0/8F5E:	BF0000E6	LDA $E60000,X
C0/8F62:	8D8021  	STA $2180
C0/8F65:	E8      	INX
C0/8F66:	C61B    	DEC $1B
C0/8F68:	D0F4    	BNE $8F5E
C0/8F6A:	C220    	REP #$20      (16 bit accum./memory)
C0/8F6C:	98      	TYA
C0/8F6D:	18      	CLC
C0/8F6E:	690A00  	ADC #$000A
C0/8F71:	A8      	TAY
C0/8F72:	7B      	TDC 
C0/8F73:	E220    	SEP #$20      (8 bit accum./memory)
C0/8F75:	C61A    	DEC $1A
C0/8F77:	D0D6    	BNE $8F4F
C0/8F79:	9C0C42  	STZ $420C      (turn off HDMA)
C0/8F7C:	9C0B42  	STZ $420B      (turn off DMA)
C0/8F7F:	A980    	LDA #$80
C0/8F81:	8D1521  	STA $2115
C0/8F84:	A20028  	LDX #$2800
C0/8F87:	8E1621  	STX $2116
C0/8F8A:	A941    	LDA #$41
C0/8F8C:	8D0043  	STA $4300
C0/8F8F:	A918    	LDA #$18
C0/8F91:	8D0143  	STA $4301
C0/8F94:	A2009F  	LDX #$9F00
C0/8F97:	8E0243  	STX $4302
C0/8F9A:	A97E    	LDA #$7E
C0/8F9C:	8D0443  	STA $4304
C0/8F9F:	8D0743  	STA $4307
C0/8FA2:	A20008  	LDX #$0800
C0/8FA5:	8E0543  	STX $4305
C0/8FA8:	A901    	LDA #$01
C0/8FAA:	8D0B42  	STA $420B
C0/8FAD:	9C0B42  	STZ $420B      (turn off DMA)
C0/8FB0:	60      	RTS
 
C0/8FB1:	AD3B05  	LDA $053B		(from C0/8ED8)
C0/8FB4:	29E0    	AND #$E0
C0/8FB6:	4A      	LSR A
C0/8FB7:	4A      	LSR A
C0/8FB8:	4A      	LSR A
C0/8FB9:	4A      	LSR A
C0/8FBA:	4A      	LSR A
C0/8FBB:	D001    	BNE $8FBE
C0/8FBD:	60      	RTS
 
C0/8FBE:	3A      	DEC A			(from C0/8FBB)	
C0/8FBF:	A8      	TAY
C0/8FC0:	0A      	ASL A
C0/8FC1:	AA      	TAX
C0/8FC2:	C220    	REP #$20      (16 bit accum./memory)
C0/8FC4:	BF9F97C0	LDA $C0979F,X
C0/8FC8:	AA      	TAX
C0/8FC9:	7B      	TDC 
C0/8FCA:	8DD110  	STA $10D1
C0/8FCD:	BFAD97C0	LDA $C097AD,X
C0/8FD1:	8DD310  	STA $10D3
C0/8FD4:	BFAF97C0	LDA $C097AF,X
C0/8FD8:	8DD510  	STA $10D5
C0/8FDB:	BFB197C0	LDA $C097B1,X
C0/8FDF:	8DD710  	STA $10D7
C0/8FE2:	BFB397C0	LDA $C097B3,X
C0/8FE6:	8DD910  	STA $10D9
C0/8FE9:	BFB597C0	LDA $C097B5,X
C0/8FED:	8DDB10  	STA $10DB
C0/8FF0:	BFB797C0	LDA $C097B7,X
C0/8FF4:	8DDD10  	STA $10DD
C0/8FF7:	BFB997C0	LDA $C097B9,X
C0/8FFB:	8DDF10  	STA $10DF
C0/8FFE:	BFBB97C0	LDA $C097BB,X
C0/9002:	8DE110  	STA $10E1
C0/9005:	BFBD97C0	LDA $C097BD,X
C0/9009:	8DE310  	STA $10E3
C0/900C:	BFBF97C0	LDA $C097BF,X
C0/9010:	8DE510  	STA $10E5
C0/9013:	7B      	TDC 
C0/9014:	E220    	SEP #$20      (8 bit accum./memory)
C0/9016:	98      	TYA
C0/9017:	851A    	STA $1A
C0/9019:	0A      	ASL A
C0/901A:	18      	CLC
C0/901B:	651A    	ADC $1A
C0/901D:	AA      	TAX
C0/901E:	C221    	REP #$21
C0/9020:	BFA0CDE6	LDA $E6CDA0,X
C0/9024:	18      	CLC
C0/9025:	69C0CD  	ADC #$CDC0
C0/9028:	85F3    	STA $F3
C0/902A:	7B      	TDC 
C0/902B:	E220    	SEP #$20      (8 bit accum./memory)
C0/902D:	A9E6    	LDA #$E6
C0/902F:	85F5    	STA $F5
C0/9031:	A200BF  	LDX #$BF00
C0/9034:	86F6    	STX $F6
C0/9036:	A97E    	LDA #$7E
C0/9038:	85F8    	STA $F8
C0/903A:	226C04C0	JSL $C0046C    (LZ decompression)
C0/903E:	60      	RTS

; Every other IRQ
C0/903F:	AD3B05  	LDA $053B      ; BG1/2/3 animation index [?]
C0/9042:	D00C    	BNE $9050      ; branch if set
C0/9044:	A20800  	LDX #$0008     ;
C0/9047:	CA      	DEX            ; decrement loop
C0/9048:	D0FD    	BNE $9047      ; loop 8 times (why?)
C0/904A:	A980    	LDA #$80
C0/904C:	8D0021  	STA $2100      ; set "Force Blank"
C0/904F:	60      	RTS
 
C0/9050:	9C0B42  	STZ $420B		(from C0/9042)
C0/9053:	A980    	LDA #$80
C0/9055:	8D1521  	STA $2115
C0/9058:	A20028  	LDX #$2800
C0/905B:	8E1621  	STX $2116
C0/905E:	A941    	LDA #$41
C0/9060:	8D0043  	STA $4300
C0/9063:	A918    	LDA #$18
C0/9065:	8D0143  	STA $4301
C0/9068:	A20010  	LDX #$1000
C0/906B:	DA      	PHX
C0/906C:	2B      	PLD 
C0/906D:	E210    	SEP #$10      (8 bit index registers)
C0/906F:	C221    	REP #$21
C0/9071:	A001    	LDY #$01
C0/9073:	EA      	NOP
C0/9074:	EA      	NOP
C0/9075:	EA      	NOP
C0/9076:	EA      	NOP
C0/9077:	EA      	NOP
C0/9078:	A280    	LDX #$80
C0/907A:	8E0021  	STX $2100
C0/907D:	A569    	LDA $69
C0/907F:	18      	CLC
C0/9080:	656B    	ADC $6B
C0/9082:	8569    	STA $69
C0/9084:	290006  	AND #$0600
C0/9087:	EB      	XBA
C0/9088:	AA      	TAX
C0/9089:	B56E    	LDA $6E,X
C0/908B:	8D0243  	STA $4302
C0/908E:	A66D    	LDX $6D
C0/9090:	8E0443  	STX $4304
C0/9093:	A280    	LDX #$80
C0/9095:	8E0543  	STX $4305
C0/9098:	8C0B42  	STY $420B
C0/909B:	A576    	LDA $76
C0/909D:	18      	CLC
C0/909E:	6578    	ADC $78
C0/90A0:	8576    	STA $76
C0/90A2:	290006  	AND #$0600
C0/90A5:	EB      	XBA
C0/90A6:	AA      	TAX
C0/90A7:	B57B    	LDA $7B,X
C0/90A9:	8D0243  	STA $4302
C0/90AC:	A67A    	LDX $7A
C0/90AE:	8E0443  	STX $4304
C0/90B1:	A280    	LDX #$80
C0/90B3:	8E0543  	STX $4305
C0/90B6:	8C0B42  	STY $420B
C0/90B9:	A583    	LDA $83
C0/90BB:	18      	CLC
C0/90BC:	6585    	ADC $85
C0/90BE:	8583    	STA $83
C0/90C0:	290006  	AND #$0600
C0/90C3:	EB      	XBA
C0/90C4:	AA      	TAX
C0/90C5:	B588    	LDA $88,X
C0/90C7:	8D0243  	STA $4302
C0/90CA:	A687    	LDX $87
C0/90CC:	8E0443  	STX $4304
C0/90CF:	A280    	LDX #$80
C0/90D1:	8E0543  	STX $4305
C0/90D4:	8C0B42  	STY $420B
C0/90D7:	A590    	LDA $90
C0/90D9:	18      	CLC
C0/90DA:	6592    	ADC $92
C0/90DC:	8590    	STA $90
C0/90DE:	290006  	AND #$0600
C0/90E1:	EB      	XBA
C0/90E2:	AA      	TAX
C0/90E3:	B595    	LDA $95,X
C0/90E5:	8D0243  	STA $4302
C0/90E8:	A694    	LDX $94
C0/90EA:	8E0443  	STX $4304
C0/90ED:	A280    	LDX #$80
C0/90EF:	8E0543  	STX $4305
C0/90F2:	8C0B42  	STY $420B
C0/90F5:	A59D    	LDA $9D
C0/90F7:	18      	CLC
C0/90F8:	659F    	ADC $9F
C0/90FA:	859D    	STA $9D
C0/90FC:	290006  	AND #$0600
C0/90FF:	EB      	XBA
C0/9100:	AA      	TAX
C0/9101:	B5A2    	LDA $A2,X
C0/9103:	8D0243  	STA $4302
C0/9106:	A6A1    	LDX $A1
C0/9108:	8E0443  	STX $4304
C0/910B:	A280    	LDX #$80
C0/910D:	8E0543  	STX $4305
C0/9110:	8C0B42  	STY $420B
C0/9113:	A5AA    	LDA $AA
C0/9115:	18      	CLC
C0/9116:	65AC    	ADC $AC
C0/9118:	85AA    	STA $AA
C0/911A:	290006  	AND #$0600
C0/911D:	EB      	XBA
C0/911E:	AA      	TAX
C0/911F:	B5AF    	LDA $AF,X
C0/9121:	8D0243  	STA $4302
C0/9124:	A6AE    	LDX $AE
C0/9126:	8E0443  	STX $4304
C0/9129:	A280    	LDX #$80
C0/912B:	8E0543  	STX $4305
C0/912E:	8C0B42  	STY $420B
C0/9131:	A5B7    	LDA $B7
C0/9133:	18      	CLC
C0/9134:	65B9    	ADC $B9
C0/9136:	85B7    	STA $B7
C0/9138:	290006  	AND #$0600
C0/913B:	EB      	XBA
C0/913C:	AA      	TAX
C0/913D:	B5BC    	LDA $BC,X
C0/913F:	8D0243  	STA $4302
C0/9142:	A6BB    	LDX $BB
C0/9144:	8E0443  	STX $4304
C0/9147:	A280    	LDX #$80
C0/9149:	8E0543  	STX $4305
C0/914C:	8C0B42  	STY $420B
C0/914F:	A5C4    	LDA $C4
C0/9151:	18      	CLC
C0/9152:	65C6    	ADC $C6
C0/9154:	85C4    	STA $C4
C0/9156:	290006  	AND #$0600
C0/9159:	EB      	XBA
C0/915A:	AA      	TAX
C0/915B:	B5C9    	LDA $C9,X
C0/915D:	8D0243  	STA $4302
C0/9160:	A6C8    	LDX $C8
C0/9162:	8E0443  	STX $4304
C0/9165:	A280    	LDX #$80
C0/9167:	8E0543  	STX $4305
C0/916A:	8C0B42  	STY $420B
C0/916D:	E220    	SEP #$20      (8 bit accum./memory)
C0/916F:	C210    	REP #$10      (16 bit index registers)
C0/9171:	A20000  	LDX #$0000
C0/9174:	DA      	PHX
C0/9175:	2B      	PLD 
C0/9176:	7B      	TDC 
C0/9177:	60      	RTS
 
C0/9178:	9C0B42  	STZ $420B      ; diaable all DMA channels
C0/917B:	A980    	LDA #$80
C0/917D:	8D1521  	STA $2115      ; set VDATA address increment mode
C0/9180:	A20030  	LDX #$3000
C0/9183:	8E1621  	STX $2116      ; VRAM address
C0/9186:	A941    	LDA #$41
C0/9188:	8D0043  	STA $4300      ; HDMA mode: 2 registers, write 1
C0/918B:	A918    	LDA #$18
C0/918D:	8D0143  	STA $4301      ; HDMA destination $2118
C0/9190:	A20500  	LDX #$0005
C0/9193:	CA      	DEX
C0/9194:	D0FD    	BNE $9193      ; 5 loops (why?)
C0/9196:	A980    	LDA #$80
C0/9198:	8D0021  	STA $2100      ; force blank [?]
C0/919B:	AD3B05  	LDA $053B      ; BG animation index
C0/919E:	29E0    	AND #$E0
C0/91A0:	F032    	BEQ $91D4      ; exit if empty [?]
C0/91A2:	C221    	REP #$21
C0/91A4:	ADD510  	LDA $10D5      ; animation data size
C0/91A7:	8D0543  	STA $4305      ; HDMA number of bytes to transfer
C0/91AA:	ADD110  	LDA $10D1      ; animation counter
C0/91AD:	6DD310  	ADC $10D3      ; add animation speed
C0/91B0:	8DD110  	STA $10D1      ; store new counter
C0/91B3:	7B      	TDC            ; clear A/B
C0/91B4:	E220    	SEP #$20       ; 8-bit A
C0/91B6:	ADD210  	LDA $10D2
C0/91B9:	290E    	AND #$0E
C0/91BB:	AA      	TAX
C0/91BC:	C221    	REP #$21
C0/91BE:	BDD710  	LDA $10D7,X    ; frame pointer
C0/91C1:	6900BF  	ADC #$BF00
C0/91C4:	8D0243  	STA $4302      ; set HDMA source address
C0/91C7:	7B      	TDC            ; clear A/B
C0/91C8:	E220    	SEP #$20       ; 8-bit A
C0/91CA:	A97E    	LDA #$7E
C0/91CC:	8D0443  	STA $4304      ; set HDMA source bank
C0/91CF:	A901    	LDA #$01
C0/91D1:	8D0B42  	STA $420B      ; enable DMA channel 1
C0/91D4:	60      	RTS
 
Data, pointers for the block of data below this
C0/91D5:	0000
C0/91D7:	5000
C0/91D9:	A000
C0/91DB:	F000
C0/91DC:	4001
C0/91DE:	9001
C0/91E0:	E001
C0/91E2:	3002
C0/91E4:	4402
C0/91E6:	9402
C0/91E8:	E402
C0/91EA:	3403
C0/91EC:	3403
C0/91EE:	8403
C0/91F0:	2404
C0/91F2:	9204
C0/91F4:	E204
C0/91F6:	3403
C0/91F8:	5005
C0/91FA:	3403
C0/91FC:	A005

Data
C0/91FF:	0001 0000 8000 0001 8001 
C0/9209:	0001 0028 8028 0029 8029 
C0/9213:	0001 002A 802A 002B 802B 
C0/921D:	0001 002C 802C 002D 802D 
C0/9227:	0001 002E 802E 002F 802F 
C0/9231:	0001 0030 8030 0031 8031
C0/923B:	0001 0032 8032 0033 8033 
C0/9245:	0001 0002 8002 0003 8003
C0/924F:	0001 0004 8004 0005 8005
C0/9259:	0001 0006 8006 0007 8007
C0/9263:	0001 0008 8008 0009 8009 
C0/926D:	0001 000A 800A 000B 800B
C0/9277:	0001 000C 800C 000D 800D 

C0/9281:	0000    	BRK #$00
C0/9283:	0000    	BRK #$00
C0/9285:	0000    	BRK #$00
C0/9287:	0000    	BRK #$00
C0/9289:	0000    	BRK #$00
C0/928B:	0000    	BRK #$00
C0/928D:	0000    	BRK #$00
C0/928F:	0000    	BRK #$00
C0/9291:	0000    	BRK #$00
C0/9293:	0000    	BRK #$00
C0/9295:	0000    	BRK #$00
C0/9297:	0000    	BRK #$00
C0/9299:	0000    	BRK #$00
C0/929B:	0000    	BRK #$00
C0/929D:	0000    	BRK #$00
C0/929F:	0001    	BRK #$01
C0/92A1:	0010    	BRK #$10
C0/92A3:	8010    	BRA $92B5
C0/92A5:	0010    	BRK #$10
C0/92A7:	8010    	BRA $92B9
C0/92A9:	0000    	BRK #$00
C0/92AB:	0000    	BRK #$00
C0/92AD:	0000    	BRK #$00
C0/92AF:	0000    	BRK #$00
C0/92B1:	0000    	BRK #$00
C0/92B3:	0000    	BRK #$00
C0/92B5:	0000    	BRK #$00
C0/92B7:	0000    	BRK #$00
C0/92B9:	0000    	BRK #$00
C0/92BB:	0000    	BRK #$00
C0/92BD:	0000    	BRK #$00
C0/92BF:	0000    	BRK #$00
C0/92C1:	0000    	BRK #$00
C0/92C3:	0000    	BRK #$00
C0/92C5:	0000    	BRK #$00
C0/92C7:	0000    	BRK #$00
C0/92C9:	0000    	BRK #$00
C0/92CB:	0000    	BRK #$00
C0/92CD:	0000    	BRK #$00
C0/92CF:	0000    	BRK #$00
C0/92D1:	0000    	BRK #$00
C0/92D3:	0000    	BRK #$00
C0/92D5:	0000    	BRK #$00
C0/92D7:	0000    	BRK #$00
C0/92D9:	0000    	BRK #$00
C0/92DB:	0000    	BRK #$00
C0/92DD:	0000    	BRK #$00
C0/92DF:	0000    	BRK #$00
C0/92E1:	0000    	BRK #$00
C0/92E3:	0000    	BRK #$00
C0/92E5:	0000    	BRK #$00
C0/92E7:	0000    	BRK #$00
C0/92E9:	0000    	BRK #$00
C0/92EB:	0000    	BRK #$00
C0/92ED:	0000    	BRK #$00
C0/92EF:	0001    	BRK #$01
C0/92F1:	0034    	BRK #$34
C0/92F3:	8034    	BRA $9329
C0/92F5:	0035    	BRK #$35
C0/92F7:	8035    	BRA $932E
C0/92F9:	0001    	BRK #$01
C0/92FB:	0028    	BRK #$28
C0/92FD:	8028    	BRA $9327
C0/92FF:	0029    	BRK #$29
C0/9301:	8029    	BRA $932C
C0/9303:	0001    	BRK #$01
C0/9305:	002A    	BRK #$2A
C0/9307:	802A    	BRA $9333
C0/9309:	002B    	BRK #$2B
C0/930B:	802B    	BRA $9338
C0/930D:	0001    	BRK #$01
C0/930F:	002C    	BRK #$2C
C0/9311:	802C    	BRA $933F
C0/9313:	002D    	BRK #$2D
C0/9315:	802D    	BRA $9344
C0/9317:	0001    	BRK #$01
C0/9319:	002E    	BRK #$2E
C0/931B:	802E    	BRA $934B
C0/931D:	002F    	BRK #$2F
C0/931F:	802F    	BRA $9350
C0/9321:	0001    	BRK #$01
C0/9323:	0030    	BRK #$30
C0/9325:	8030    	BRA $9357
C0/9327:	0031    	BRK #$31
C0/9329:	8031    	BRA $935C
C0/932B:	0001    	BRK #$01
C0/932D:	0032    	BRK #$32
C0/932F:	8032    	BRA $9363
C0/9331:	0033    	BRK #$33
C0/9333:	8033    	BRA $9368
C0/9335:	0001    	BRK #$01
C0/9337:	0036    	BRK #$36
C0/9339:	8036    	BRA $9371
C0/933B:	0037    	BRK #$37
C0/933D:	8037    	BRA $9376
C0/933F:	0004    	BRK #$04
C0/9341:	001B    	BRK #$1B
C0/9343:	001B    	BRK #$1B
C0/9345:	001B    	BRK #$1B
C0/9347:	001B    	BRK #$1B
C0/9349:	0004    	BRK #$04
C0/934B:	801B    	BRA $9368
C0/934D:	801B    	BRA $936A
C0/934F:	801B    	BRA $936C
C0/9351:	801B    	BRA $936E
C0/9353:	8000    	BRA $9355
C0/9355:	001C    	BRK #$1C
C0/9357:	801C    	BRA $9375
C0/9359:	001D    	BRK #$1D
C0/935B:	801D    	BRA $937A
C0/935D:	8000    	BRA $935F
C0/935F:	001E    	BRK #$1E
C0/9361:	801E    	BRA $9381
C0/9363:	001F    	BRK #$1F
C0/9365:	801F    	BRA $9386
C0/9367:	8000    	BRA $9369
C0/9369:	0020    	BRK #$20
C0/936B:	8020    	BRA $938D
C0/936D:	0021    	BRK #$21
C0/936F:	8021    	BRA $9392
C0/9371:	8000    	BRA $9373
C0/9373:	0022    	BRK #$22
C0/9375:	8022    	BRA $9399
C0/9377:	0023    	BRK #$23
C0/9379:	8023    	BRA $939E
C0/937B:	8000    	BRA $937D
C0/937D:	0024    	BRK #$24
C0/937F:	8024    	BRA $93A5
C0/9381:	0025    	BRK #$25
C0/9383:	8025    	BRA $93AA
C0/9385:	8000    	BRA $9387
C0/9387:	0026    	BRK #$26
C0/9389:	8026    	BRA $93B1
C0/938B:	0027    	BRK #$27
C0/938D:	8027    	BRA $93B6
C0/938F:	0002    	BRK #$02
C0/9391:	005E    	BRK #$5E
C0/9393:	805E    	BRA $93F3
C0/9395:	005E    	BRK #$5E
C0/9397:	805E    	BRA $93F7
C0/9399:	0002    	BRK #$02
C0/939B:	005F    	BRK #$5F
C0/939D:	805F    	BRA $93FE
C0/939F:	005F    	BRK #$5F
C0/93A1:	805F    	BRA $9402
C0/93A3:	0002    	BRK #$02
C0/93A5:	0060    	BRK #$60
C0/93A7:	8060    	BRA $9409
C0/93A9:	0060    	BRK #$60
C0/93AB:	8060    	BRA $940D
C0/93AD:	0002    	BRK #$02
C0/93AF:	0061    	BRK #$61
C0/93B1:	8061    	BRA $9414
C0/93B3:	0061    	BRK #$61
C0/93B5:	8061    	BRA $9418
C0/93B7:	0002    	BRK #$02
C0/93B9:	0062    	BRK #$62
C0/93BB:	8062    	BRA $941F
C0/93BD:	0062    	BRK #$62
C0/93BF:	8062    	BRA $9423
C0/93C1:	0002    	BRK #$02
C0/93C3:	0063    	BRK #$63
C0/93C5:	8063    	BRA $942A
C0/93C7:	0063    	BRK #$63
C0/93C9:	8063    	BRA $942E
C0/93CB:	0002    	BRK #$02
C0/93CD:	0064    	BRK #$64
C0/93CF:	60      	RTS
 
C0/93D0:	6400    	STZ $00
C0/93D2:	6460    	STZ $60
C0/93D4:	6400    	STZ $00
C0/93D6:	0000    	BRK #$00
C0/93D8:	0000    	BRK #$00
C0/93DA:	0000    	BRK #$00
C0/93DC:	0000    	BRK #$00
C0/93DE:	0000    	BRK #$00
C0/93E0:	0100    	ORA ($00,X)
C0/93E2:	68      	PLA
C0/93E3:	8068    	BRA $944D
C0/93E5:	0069    	BRK #$69
C0/93E7:	8069    	BRA $9452
C0/93E9:	0001    	BRK #$01
C0/93EB:	006A    	BRK #$6A
C0/93ED:	806A    	BRA $9459
C0/93EF:	006B    	BRK #$6B
C0/93F1:	806B    	BRA $945E
C0/93F3:	0001    	BRK #$01
C0/93F5:	006C    	BRK #$6C
C0/93F7:	806C    	BRA $9465
C0/93F9:	006D    	BRK #$6D
C0/93FB:	806D    	BRA $946A
C0/93FD:	0001    	BRK #$01
C0/93FF:	006E    	BRK #$6E
C0/9401:	806E    	BRA $9471
C0/9403:	006F    	BRK #$6F
C0/9405:	806F    	BRA $9476
C0/9407:	0001    	BRK #$01
C0/9409:	000E    	BRK #$0E
C0/940B:	800E    	BRA $941B
C0/940D:	000F    	BRK #$0F
C0/940F:	800F    	BRA $9420
C0/9411:	0000    	BRK #$00
C0/9413:	0000    	BRK #$00
C0/9415:	0000    	BRK #$00
C0/9417:	0000    	BRK #$00
C0/9419:	0000    	BRK #$00
C0/941B:	0000    	BRK #$00
C0/941D:	0000    	BRK #$00
C0/941F:	0000    	BRK #$00
C0/9421:	0000    	BRK #$00
C0/9423:	0000    	BRK #$00
C0/9425:	0000    	BRK #$00
C0/9427:	0000    	BRK #$00
C0/9429:	0000    	BRK #$00
C0/942B:	0000    	BRK #$00
C0/942D:	0000    	BRK #$00
C0/942F:	0100    	ORA ($00,X)
C0/9431:	0038    	BRK #$38
C0/9433:	0038    	BRK #$38
C0/9435:	0038    	BRK #$38
C0/9437:	0038    	BRK #$38
C0/9439:	0100    	ORA ($00,X)
C0/943B:	8038    	BRA $9475
C0/943D:	8038    	BRA $9477
C0/943F:	8038    	BRA $9479
C0/9441:	8038    	BRA $947B
C0/9443:	0002    	BRK #$02
C0/9445:	0056    	BRK #$56
C0/9447:	8056    	BRA $949F
C0/9449:	0056    	BRK #$56
C0/944B:	8056    	BRA $94A3
C0/944D:	0002    	BRK #$02
C0/944F:	0057    	BRK #$57
C0/9451:	8057    	BRA $94AA
C0/9453:	0057    	BRK #$57
C0/9455:	8057    	BRA $94AE
C0/9457:	0002    	BRK #$02
C0/9459:	0058    	BRK #$58
C0/945B:	8058    	BRA $94B5
C0/945D:	0058    	BRK #$58
C0/945F:	8058    	BRA $94B9
C0/9461:	0002    	BRK #$02
C0/9463:	0059    	BRK #$59
C0/9465:	8059    	BRA $94C0
C0/9467:	0059    	BRK #$59
C0/9469:	8059    	BRA $94C4
C0/946B:	0002    	BRK #$02
C0/946D:	005A    	BRK #$5A
C0/946F:	805A    	BRA $94CB
C0/9471:	005A    	BRK #$5A
C0/9473:	805A    	BRA $94CF
C0/9475:	0002    	BRK #$02
C0/9477:	005B    	BRK #$5B
C0/9479:	805B    	BRA $94D6
C0/947B:	005B    	BRK #$5B
C0/947D:	805B    	BRA $94DA
C0/947F:	0002    	BRK #$02
C0/9481:	005C    	BRK #$5C
C0/9483:	805C    	BRA $94E1
C0/9485:	005C    	BRK #$5C
C0/9487:	805C    	BRA $94E5
C0/9489:	0002    	BRK #$02
C0/948B:	005D    	BRK #$5D
C0/948D:	805D    	BRA $94EC
C0/948F:	005D    	BRK #$5D
C0/9491:	805D    	BRA $94F0
C0/9493:	0001    	BRK #$01
C0/9495:	004E    	BRK #$4E
C0/9497:	804E    	BRA $94E7
C0/9499:	004F    	BRK #$4F
C0/949B:	804F    	BRA $94EC
C0/949D:	0001    	BRK #$01
C0/949F:	0050    	BRK #$50
C0/94A1:	8050    	BRA $94F3
C0/94A3:	0051    	BRK #$51
C0/94A5:	8051    	BRA $94F8
C0/94A7:	0001    	BRK #$01
C0/94A9:	0052    	BRK #$52
C0/94AB:	8052    	BRA $94FF
C0/94AD:	0053    	BRK #$53
C0/94AF:	8053    	BRA $9504
C0/94B1:	0001    	BRK #$01
C0/94B3:	0054    	BRK #$54
C0/94B5:	8054    	BRA $950B
C0/94B7:	0055    	BRK #$55
C0/94B9:	8055    	BRA $9510
C0/94BB:	0001    	BRK #$01
C0/94BD:	C03800  	CPY #$0038
C0/94C0:	394039  	AND $3940,Y
C0/94C3:	8039    	BRA $94FE
C0/94C5:	0000    	BRK #$00
C0/94C7:	0000    	BRK #$00
C0/94C9:	0000    	BRK #$00
C0/94CB:	0000    	BRK #$00
C0/94CD:	0000    	BRK #$00
C0/94CF:	0000    	BRK #$00
C0/94D1:	0000    	BRK #$00
C0/94D3:	0000    	BRK #$00
C0/94D5:	0000    	BRK #$00
C0/94D7:	0000    	BRK #$00
C0/94D9:	0000    	BRK #$00
C0/94DB:	0000    	BRK #$00
C0/94DD:	0000    	BRK #$00
C0/94DF:	0000    	BRK #$00
C0/94E1:	0000    	BRK #$00
C0/94E3:	0002    	BRK #$02
C0/94E5:	0046    	BRK #$46
C0/94E7:	8046    	BRA $952F
C0/94E9:	0047    	BRK #$47
C0/94EB:	8047    	BRA $9534
C0/94ED:	0002    	BRK #$02
C0/94EF:	0048    	BRK #$48
C0/94F1:	8048    	BRA $953B
C0/94F3:	0049    	BRK #$49
C0/94F5:	8049    	BRA $9540
C0/94F7:	0002    	BRK #$02
C0/94F9:	004A    	BRK #$4A
C0/94FB:	804A    	BRA $9547
C0/94FD:	004B    	BRK #$4B
C0/94FF:	804B    	BRA $954C
C0/9501:	0000    	BRK #$00
C0/9503:	0000    	BRK #$00
C0/9505:	0000    	BRK #$00
C0/9507:	0000    	BRK #$00
C0/9509:	0000    	BRK #$00
C0/950B:	0000    	BRK #$00
C0/950D:	0000    	BRK #$00
C0/950F:	0000    	BRK #$00
C0/9511:	0000    	BRK #$00
C0/9513:	0000    	BRK #$00
C0/9515:	0000    	BRK #$00
C0/9517:	0000    	BRK #$00
C0/9519:	0000    	BRK #$00
C0/951B:	0000    	BRK #$00
C0/951D:	0000    	BRK #$00
C0/951F:	0000    	BRK #$00
C0/9521:	0000    	BRK #$00
C0/9523:	0000    	BRK #$00
C0/9525:	0000    	BRK #$00
C0/9527:	0000    	BRK #$00
C0/9529:	0000    	BRK #$00
C0/952B:	0000    	BRK #$00
C0/952D:	0000    	BRK #$00
C0/952F:	0000    	BRK #$00
C0/9531:	0000    	BRK #$00
C0/9533:	0004    	BRK #$04
C0/9535:	003A    	BRK #$3A
C0/9537:	003A    	BRK #$3A
C0/9539:	003A    	BRK #$3A
C0/953B:	003A    	BRK #$3A
C0/953D:	0004    	BRK #$04
C0/953F:	803A    	BRA $957B
C0/9541:	803A    	BRA $957D
C0/9543:	803A    	BRA $957F
C0/9545:	803A    	BRA $9581
C0/9547:	0004    	BRK #$04
C0/9549:	003B    	BRK #$3B
C0/954B:	003B    	BRK #$3B
C0/954D:	003B    	BRK #$3B
C0/954F:	003B    	BRK #$3B
C0/9551:	0000    	BRK #$00
C0/9553:	0000    	BRK #$00
C0/9555:	0000    	BRK #$00
C0/9557:	0000    	BRK #$00
C0/9559:	0000    	BRK #$00
C0/955B:	8000    	BRA $955D
C0/955D:	003C    	BRK #$3C
C0/955F:	803C    	BRA $959D
C0/9561:	003D    	BRK #$3D
C0/9563:	803D    	BRA $95A2
C0/9565:	0001    	BRK #$01
C0/9567:	0000    	BRK #$00
C0/9569:	8000    	BRA $956B
C0/956B:	0001    	BRK #$01
C0/956D:	8001    	BRA $9570
C0/956F:	0002    	BRK #$02
C0/9571:	0066    	BRK #$66
C0/9573:	8066    	BRA $95DB
C0/9575:	0066    	BRK #$66
C0/9577:	8066    	BRA $95DF
C0/9579:	0002    	BRK #$02
C0/957B:	0067    	BRK #$67
C0/957D:	8067    	BRA $95E6
C0/957F:	0067    	BRK #$67
C0/9581:	8067    	BRA $95EA
C0/9583:	0004    	BRK #$04
C0/9585:	003E    	BRK #$3E
C0/9587:	003E    	BRK #$3E
C0/9589:	003E    	BRK #$3E
C0/958B:	003E    	BRK #$3E
C0/958D:	0004    	BRK #$04
C0/958F:	803E    	BRA $95CF
C0/9591:	803E    	BRA $95D1
C0/9593:	803E    	BRA $95D3
C0/9595:	803E    	BRA $95D5
C0/9597:	0004    	BRK #$04
C0/9599:	003F    	BRK #$3F
C0/959B:	003F    	BRK #$3F
C0/959D:	003F    	BRK #$3F
C0/959F:	003F    	BRK #$3F
C0/95A1:	0004    	BRK #$04
C0/95A3:	803F    	BRA $95E4
C0/95A5:	803F    	BRA $95E6
C0/95A7:	803F    	BRA $95E8
C0/95A9:	803F    	BRA $95EA
C0/95AB:	0004    	BRK #$04
C0/95AD:	0040    	BRK #$40
C0/95AF:	0040    	BRK #$40
C0/95B1:	0040    	BRK #$40
C0/95B3:	0040    	BRK #$40
C0/95B5:	0004    	BRK #$04
C0/95B7:	8040    	BRA $95F9
C0/95B9:	8040    	BRA $95FB
C0/95BB:	8040    	BRA $95FD
C0/95BD:	8040    	BRA $95FF
C0/95BF:	0004    	BRK #$04
C0/95C1:	0041    	BRK #$41
C0/95C3:	0041    	BRK #$41
C0/95C5:	0041    	BRK #$41
C0/95C7:	0041    	BRK #$41
C0/95C9:	0004    	BRK #$04
C0/95CB:	8041    	BRA $960E
C0/95CD:	8041    	BRA $9610
C0/95CF:	8041    	BRA $9612
C0/95D1:	8041    	BRA $9614
C0/95D3:	0004    	BRK #$04
C0/95D5:	0042    	BRK #$42
C0/95D7:	0042    	BRK #$42
C0/95D9:	0042    	BRK #$42
C0/95DB:	0042    	BRK #$42
C0/95DD:	0004    	BRK #$04
C0/95DF:	8042    	BRA $9623
C0/95E1:	8042    	BRA $9625
C0/95E3:	8042    	BRA $9627
C0/95E5:	8042    	BRA $9629
C0/95E7:	0004    	BRK #$04
C0/95E9:	0043    	BRK #$43
C0/95EB:	0043    	BRK #$43
C0/95ED:	0043    	BRK #$43
C0/95EF:	0043    	BRK #$43
C0/95F1:	0004    	BRK #$04
C0/95F3:	8043    	BRA $9638
C0/95F5:	8043    	BRA $963A
C0/95F7:	8043    	BRA $963C
C0/95F9:	8043    	BRA $963E
C0/95FB:	0004    	BRK #$04
C0/95FD:	0044    	BRK #$44
C0/95FF:	0044    	BRK #$44
C0/9601:	0044    	BRK #$44
C0/9603:	0044    	BRK #$44
C0/9605:	0004    	BRK #$04
C0/9607:	8044    	BRA $964D
C0/9609:	8044    	BRA $964F
C0/960B:	8044    	BRA $9651
C0/960D:	8044    	BRA $9653
C0/960F:	0004    	BRK #$04
C0/9611:	0045    	BRK #$45
C0/9613:	0045    	BRK #$45
C0/9615:	0045    	BRK #$45
C0/9617:	0045    	BRK #$45
C0/9619:	0004    	BRK #$04
C0/961B:	8045    	BRA $9662
C0/961D:	8045    	BRA $9664
C0/961F:	8045    	BRA $9666
C0/9621:	8045    	BRA $9668
C0/9623:	0001    	BRK #$01
C0/9625:	0012    	BRK #$12
C0/9627:	8012    	BRA $963B
C0/9629:	0013    	BRK #$13
C0/962B:	8013    	BRA $9640
C0/962D:	0001    	BRK #$01
C0/962F:	0014    	BRK #$14
C0/9631:	8014    	BRA $9647
C0/9633:	0015    	BRK #$15
C0/9635:	8015    	BRA $964C
C0/9637:	8000    	BRA $9639
C0/9639:	8079    	BRA $96B4
C0/963B:	0079    	BRK #$79
C0/963D:	8078    	BRA $96B7
C0/963F:	0078    	BRK #$78
C0/9641:	8000    	BRA $9643
C0/9643:	007A    	BRK #$7A
C0/9645:	807A    	BRA $96C1
C0/9647:	007B    	BRK #$7B
C0/9649:	807B    	BRA $96C6
C0/964B:	0001    	BRK #$01
C0/964D:	0016    	BRK #$16
C0/964F:	8016    	BRA $9667
C0/9651:	0017    	BRK #$17
C0/9653:	8017    	BRA $966C
C0/9655:	0001    	BRK #$01
C0/9657:	0018    	BRK #$18
C0/9659:	40      	RTI
 
C0/965A:	18      	CLC
C0/965B:	8018    	BRA $9675
C0/965D:	C01800  	CPY #$0018
C0/9660:	0140    	ORA ($40,X)
C0/9662:	1A      	INC A
C0/9663:	801A    	BRA $967F
C0/9665:	40      	RTI
 
C0/9666:	1A      	INC A
C0/9667:	801A    	BRA $9683
C0/9669:	8000    	BRA $966B
C0/966B:	007C    	BRK #$7C
C0/966D:	207C40  	JSR $407C
C0/9670:	7C607C  	JMP ($7C60,X)
C0/9673:	0004    	BRK #$04
C0/9675:	0019    	BRK #$19
C0/9677:	0019    	BRK #$19
C0/9679:	0019    	BRK #$19
C0/967B:	0019    	BRK #$19
C0/967D:	0004    	BRK #$04
C0/967F:	8019    	BRA $969A
C0/9681:	8019    	BRA $969C
C0/9683:	8019    	BRA $969E
C0/9685:	8019    	BRA $96A0
C0/9687:	0004    	BRK #$04
C0/9689:	001A    	BRK #$1A
C0/968B:	001A    	BRK #$1A
C0/968D:	001A    	BRK #$1A
C0/968F:	001A    	BRK #$1A
C0/9691:	8000    	BRA $9693
C0/9693:	0070    	BRK #$70
C0/9695:	8070    	BRA $9707
C0/9697:	0070    	BRK #$70
C0/9699:	8070    	BRA $970B
C0/969B:	8000    	BRA $969D
C0/969D:	0071    	BRK #$71
C0/969F:	8071    	BRA $9712
C0/96A1:	0071    	BRK #$71
C0/96A3:	8071    	BRA $9716
C0/96A5:	8000    	BRA $96A7
C0/96A7:	0072    	BRK #$72
C0/96A9:	8072    	BRA $971D
C0/96AB:	0072    	BRK #$72
C0/96AD:	8072    	BRA $9721
C0/96AF:	8000    	BRA $96B1
C0/96B1:	0073    	BRK #$73
C0/96B3:	8073    	BRA $9728
C0/96B5:	0073    	BRK #$73
C0/96B7:	8073    	BRA $972C
C0/96B9:	8000    	BRA $96BB
C0/96BB:	807C    	BRA $9739
C0/96BD:	E07C80  	CPX #$807C
C0/96C0:	7CE07C  	JMP ($7CE0,X)
C0/96C3:	0000    	BRK #$00
C0/96C5:	0000    	BRK #$00
C0/96C7:	0000    	BRK #$00
C0/96C9:	0000    	BRK #$00
C0/96CB:	0000    	BRK #$00
C0/96CD:	0000    	BRK #$00
C0/96CF:	0000    	BRK #$00
C0/96D1:	0000    	BRK #$00
C0/96D3:	0000    	BRK #$00
C0/96D5:	0000    	BRK #$00
C0/96D7:	0000    	BRK #$00
C0/96D9:	0000    	BRK #$00
C0/96DB:	0000    	BRK #$00
C0/96DD:	0000    	BRK #$00
C0/96DF:	0000    	BRK #$00
C0/96E1:	0004    	BRK #$04
C0/96E3:	0074    	BRK #$74
C0/96E5:	0074    	BRK #$74
C0/96E7:	0074    	BRK #$74
C0/96E9:	0074    	BRK #$74
C0/96EB:	0004    	BRK #$04
C0/96ED:	8074    	BRA $9763
C0/96EF:	8074    	BRA $9765
C0/96F1:	8074    	BRA $9767
C0/96F3:	8074    	BRA $9769
C0/96F5:	0004    	BRK #$04
C0/96F7:	0075    	BRK #$75
C0/96F9:	0075    	BRK #$75
C0/96FB:	0075    	BRK #$75
C0/96FD:	0075    	BRK #$75
C0/96FF:	0004    	BRK #$04
C0/9701:	8075    	BRA $9778
C0/9703:	8075    	BRA $977A
C0/9705:	8075    	BRA $977C
C0/9707:	8075    	BRA $977E
C0/9709:	0004    	BRK #$04
C0/970B:	0076    	BRK #$76
C0/970D:	0076    	BRK #$76
C0/970F:	0076    	BRK #$76
C0/9711:	0076    	BRK #$76
C0/9713:	0004    	BRK #$04
C0/9715:	8076    	BRA $978D
C0/9717:	8076    	BRA $978F
C0/9719:	8076    	BRA $9791
C0/971B:	8076    	BRA $9793
C0/971D:	0004    	BRK #$04
C0/971F:	0077    	BRK #$77
C0/9721:	0077    	BRK #$77
C0/9723:	0077    	BRK #$77
C0/9725:	0077    	BRK #$77
C0/9727:	0004    	BRK #$04
C0/9729:	8077    	BRA $97A2
C0/972B:	8077    	BRA $97A4
C0/972D:	8077    	BRA $97A6
C0/972F:	8077    	BRA $97A8
C0/9731:	0004    	BRK #$04
C0/9733:	C064C0  	CPY #$C064
C0/9736:	64C0    	STZ $C0
C0/9738:	64C0    	STZ $C0
C0/973A:	6400    	STZ $00
C0/973C:	0440    	TSB $40
C0/973E:	6540    	ADC $40
C0/9740:	6540    	ADC $40
C0/9742:	6540    	ADC $40
C0/9744:	6500    	ADC $00
C0/9746:	04C0    	TSB $C0
C0/9748:	65C0    	ADC $C0
C0/974A:	65C0    	ADC $C0
C0/974C:	65C0    	ADC $C0
C0/974E:	6580    	ADC $80
C0/9750:	0000    	BRK #$00
C0/9752:	7E807E  	ROR $7E80,X
C0/9755:	007F    	BRK #$7F
C0/9757:	807F    	BRA $97D8
C0/9759:	8000    	BRA $975B
C0/975B:	004C    	BRK #$4C
C0/975D:	804C    	BRA $97AB
C0/975F:	004D    	BRK #$4D
C0/9761:	804D    	BRA $97B0
C0/9763:	8000    	BRA $9765
C0/9765:	807F    	BRA $97E6
C0/9767:	007F    	BRK #$7F
C0/9769:	807E    	BRA $97E9
C0/976B:	007E    	BRK #$7E
C0/976D:	8000    	BRA $976F
C0/976F:	804D    	BRA $97BE
C0/9771:	004D    	BRK #$4D
C0/9773:	804C    	BRA $97C1
C0/9775:	004C    	BRK #$4C
C0/9777:	0000    	BRK #$00
C0/9779:	0000    	BRK #$00
C0/977B:	0000    	BRK #$00
C0/977D:	0000    	BRK #$00
C0/977F:	0000    	BRK #$00
C0/9781:	0000    	BRK #$00
C0/9783:	0000    	BRK #$00
C0/9785:	0000    	BRK #$00
C0/9787:	0000    	BRK #$00
C0/9789:	0000    	BRK #$00
C0/978B:	0000    	BRK #$00
C0/978D:	0000    	BRK #$00
C0/978F:	0000    	BRK #$00
C0/9791:	0000    	BRK #$00
C0/9793:	0000    	BRK #$00
C0/9795:	0000    	BRK #$00
C0/9797:	0000    	BRK #$00
C0/9799:	0000    	BRK #$00
C0/979B:	0000    	BRK #$00
C0/979D:	0000    	BRK #$00

C0/979F:	0000 
C0/97A1:	1400    	
C0/97A3:	2800    
C0/97A5:	3C00   
C0/97A7:	5000  
C0/97A9:	6400    	
C0/97AB:	7800  

C0/97AD:	0001 8003 0000 8003 0007 800A 0000 8003 0007 800A 
C0/97C1:	0001 8001 0000 8001 0003 8004 0000 8001 0003 8004 
C0/97D5:	0001 C000 0000 C000 8001 4002 0003 C003 8004 4005 
C0/97E9:	0002 8002 0000 8002 0000 8002 0000 8002 0000 8002 
C0/97FD:	4000 8001 0000 8001 0003 8004 0006 8007 0009 800A
C0/9811:	8000 C003 0000 C003 8007 400B 0000 C003 8007 400B
C0/9825:	1104 8804 0000 1104 1204 0000 1108 C20E 0000 8000 

C0/9839:	0000    	BRK #$00
C0/983B:	0000    	BRK #$00
C0/983D:	1108    	ORA ($08),Y
C0/983F:	7A      	PLY
C0/9840:	0400    	TSB $00
C0/9842:	0080    	BRK #$80
C0/9844:	0000    	BRK #$00
C0/9846:	0000    	BRK #$00
C0/9848:	0028    	BRK #$28
C0/984A:	10C0    	BPL $980C
C0/984C:	1E0000  	ASL $0000,X
C0/984F:	8000    	BRA $9851
C0/9851:	0000    	BRK #$00
C0/9853:	0000    	BRK #$00
C0/9855:	8000    	BRA $9857
C0/9857:	0000    	BRK #$00
C0/9859:	0000    	BRK #$00
C0/985B:	8000    	BRA $985D
C0/985D:	0000    	BRK #$00
C0/985F:	0000    	BRK #$00
C0/9861:	2418    	BIT $18
C0/9863:	A01E00  	LDY #$001E
C0/9866:	0124    	ORA ($24,X)
C0/9868:	18      	CLC
C0/9869:	E00E80  	CPX #$800E
C0/986C:	0111    	ORA ($11,X)
C0/986E:	08      	PHP 
C0/986F:	1204    	ORA ($04)
C0/9871:	0000    	BRK #$00
C0/9873:	8000    	BRA $9875
C0/9875:	0000    	BRK #$00
C0/9877:	0000    	BRK #$00
C0/9879:	3F04BA00	AND $00BA04,X
C0/987D:	0000    	BRK #$00
C0/987F:	8000    	BRA $9881
C0/9881:	0000    	BRK #$00
C0/9883:	0000    	BRK #$00
C0/9885:	3F10A210	AND $10A210,X
C0/9889:	0000    	BRK #$00
C0/988B:	3F082200	AND $002208,X
C0/988F:	0000    	BRK #$00
C0/9891:	3F103E00	AND $003E10,X
C0/9895:	0000    	BRK #$00
C0/9897:	8000    	BRA $9899
C0/9899:	0000    	BRK #$00
C0/989B:	0000    	BRK #$00

C0/989D:	A600    	LDX $00	  (from C0/BE7F)
C0/989F:	86E3    	STX $E3
C0/98A1:	86E8    	STX $E8
C0/98A3:	A20000  	LDX #$0000
C0/98A6:	86E5    	STX $E5
C0/98A8:	A9CA    	LDA #$CA
C0/98AA:	85E7    	STA $E7
C0/98AC:	A20000  	LDX #$0000
C0/98AF:	8E9405  	STX $0594
C0/98B2:	A9CA    	LDA #$CA
C0/98B4:	8D9605  	STA $0596
C0/98B7:	A901    	LDA #$01
C0/98B9:	8FC40500	STA $0005C4
C0/98BD:	A980    	LDA #$80
C0/98BF:	85E2    	STA $E2
C0/98C1:	64E1    	STZ $E1
C0/98C3:	60      	RTS

General Actions' Jump Table:
C0/98C4:	449C    	(gen. act. 35)
C0/98C6:	6F9C    	(gen. act. 36)
C0/98C8:	8F9C    	(gen. act. 37)
C0/98CA:	0E9D    	(gen. act. 38)
C0/98CC:	169D    	(gen. act. 39)
C0/98CE:	1E9D    	(gen. act. 3A)
C0/98D0:	2E9D    	(gen. act. 3B)
C0/98D2:	6D9D    	(gen. act. 3C)
C0/98D4:	3C9E    	(gen. act. 3D)
C0/98D6:	679E    	(gen. act. 3E)
C0/98D8:	3B9D    	(gen. act. 3F)
C0/98DA:	7CA0    	(gen. act. 40)
C0/98DC:	FAA2    	(gen. act. 41)
C0/98DE:	36A3    	(gen. act. 42)
C0/98E0:	A99C    	(gen. act. 43)
C0/98E2:	CA9C    	(gen. act. 44)
C0/98E4:	E29C    	(gen. act. 45)
C0/98E6:	EA9C    	(gen. act. 46)
C0/98E8:	039D    	(gen. act. 47)
C0/98EA:	75A4    	(gen. act. 48)
C0/98EC:	A6A4    	(gen. act. 49)
C0/98EE:	B0A4    	(gen. act. 4A)
C0/98F0:	BCA4    	(gen. act. 4B) ; Display dialogue
C0/98F2:	91A5    	(gen. act. 4C)
C0/98F4:	78A5    	(gen. act. 4D) ; Invoke battle
C0/98F6:	F9A4    	(gen. act. 4E)
C0/98F8:	F3A5    	(gen. act. 4F)
C0/98FA:	FDA5    	(gen. act. 50)
C0/98FC:	40A6    	(gen. act. 51)
C0/98FE:	86A6    	(gen. act. 52)
C0/9900:	C5A6    	(gen. act. 53)
C0/9902:	84A7    	(gen. act. 54)
C0/9904:	95A7    	(gen. act. 55)
C0/9906:	BAA7    	(gen. act. 56)
C0/9908:	D0A7    	(gen. act. 57)
C0/990A:	E6A7    	(gen. act. 58)
C0/990C:	0AA8    	(gen. act. 59)
C0/990E:	17A8    	(gen. act. 5A)
C0/9910:	26A8    	(gen. act. 5B)
C0/9912:	2DA8    	(gen. act. 5C)
C0/9914:	38A8    	(gen. act. 5D)
C0/9916:	CEA8    	(gen. act. 5E)
C0/9918:	64A9    	(gen. act. 5F)
C0/991A:	FAA9    	(gen. act. 60)
C0/991C:	3DAA    	(gen. act. 61)
C0/991E:	CBAA    	(gen. act. 62)
C0/9920:	DBAA    	(gen. act. 63)
C0/9922:	E9AA    	(gen. act. 64)
C0/9924:	09AB    	(gen. act. 65)

C0/9926:	1AB9    	(gen. act. 66)
C0/9928:	1AB9    	(gen. act. 67)

C0/992A:	1AB9    	(gen. act. 68)
C0/992C:	1AB9    	(gen. act. 69)
C0/992E:	47AB    	(gen. act. 6A) ; Load map after fade
C0/9930:	55AB    	(gen. act. 6B) ; Loap map instantly
C0/9932:	0BAC    	(gen. act. 6C) ; Load parent map
C0/9934:	1AB9    	(gen. act. 6D)
C0/9936:	1AB9    	(gen. act. 6E)
C0/9938:	1AB9    	(gen. act. 6F)
C0/993A:	81A8    	(gen. act. 70)
C0/993C:	17A9    	(gen. act. 71)
C0/993E:	ADA9    	(gen. act. 72)
C0/9940:	45AC    	(gen. act. 73)
C0/9942:	62AC    	(gen. act. 74)
C0/9944:	1FAC    	(gen. act. 75)
C0/9946:	1AB9    	(gen. act. 76)
C0/9948:	329F    	(gen. act. 77)
C0/994A:	7F9C    	(gen. act. 78)
C0/994C:	6AA3    	(gen. act. 79)
C0/994E:	2AA4    	(gen. act. 7A)
C0/9950:	41A4    	(gen. act. 7B)
C0/9952:	55A4    	(gen. act. 7C)
C0/9954:	65A4    	(gen. act. 7D)
C0/9956:	9AA3    	(gen. act. 7E)
C0/9958:	3AA0    	(gen. act. 7F)
C0/995A:	F0AC    	(gen. act. 80)
C0/995C:	2DAD    	(gen. act. 81)
C0/995E:	70A5    	(gen. act. 82)
C0/9960:	1AB9    	(gen. act. 83)
C0/9962:	50AD    	(gen. act. 84)
C0/9964:	7FAD    	(gen. act. 85)
C0/9966:	B8AD    	(gen. act. 86)
C0/9968:	D7AD    	(gen. act. 87)
C0/996A:	2DAE    	(gen. act. 88)
C0/996C:	47AE    	(gen. act. 89)
C0/996E:	61AE    	(gen. act. 8A)
C0/9970:	7BAE    	(gen. act. 8B)
C0/9972:	3EAF    	(gen. act. 8C)
C0/9974:	CE9F    	(gen. act. 8D)
C0/9976:	4EA5    	(gen. act. 8E)      ; Monster in a box ($A54E)
C0/9978:	F8AF    	(gen. act. 8F)
C0/997A:	02B0    	(gen. act. 90)
C0/997C:	3FB2    	(gen. act. 91)
C0/997E:	49B2    	(gen. act. 92)
C0/9980:	53B2    	(gen. act. 93)
C0/9982:	5DB2    	(gen. act. 94)
C0/9984:	67B2    	(gen. act. 95)
C0/9986:	F0A7    	(gen. act. 96)
C0/9988:	FDA7    	(gen. act. 97)
C0/998A:	0FB0    	(gen. act. 98)
C0/998C:	35B0    	(gen. act. 99)      (Invoke party selection screen (X groups), force characters YY)
C0/998E:	B2B0    	(gen. act. 9A)      (Invoke Colliseum item selection)
C0/9990:	6DB0    	(gen. act. 9B)      (Invoke shop XX)
C0/9992:	8CB0    	(gen. act. 9C)      (Optimum equip character XX)
C0/9994:	9CB0    	(gen. act. 9D)      (Invoke party selection for final battle)
C0/9996:	1AB9    	(gen. act. 9E)
C0/9998:	1AB9    	(gen. act. 9F)
C0/999A:	E0B0    	(gen. act. A0)
C0/999C:	0EB1    	(gen. act. A1)
C0/999E:	30B1    	(gen. act. A2)
C0/99A0:	1AB9    	(gen. act. A3)
C0/99A2:	1AB9    	(gen. act. A4)
C0/99A4:	1AB9    	(gen. act. A5)
C0/99A6:	09BA    	(gen. act. A6)
C0/99A8:	14BA    	(gen. act. A7)
C0/99AA:	51BA    	(gen. act. A8)     ; show floating continent rise ($BA51)
C0/99AC:	66B9    	(gen. act. A9)
C0/99AE:	92B9    	(gen. act. AA)
C0/99B0:	1BB9    	(gen. act. AB)
C0/99B2:	5EB9    	(gen. act. AC)
C0/99B4:	69BA    	(gen. act. AD)     ; show world getting torn apart ($BA69)
C0/99B6:	C5B9    	(gen. act. AE)
C0/99B8:	03A5    	(gen. act. AF)
C0/99BA:	38B1    	(gen. act. B0)
C0/99BC:	45B1    	(gen. act. B1)
C0/99BE:	A1B1    	(gen. act. B2)
C0/99C0:	DFB1    	(gen. act. B3)
C0/99C2:	1DB2    	(gen. act. B4)
C0/99C4:	27B2    	(gen. act. B5)
C0/99C6:	D3B6    	(gen. act. B6)
C0/99C8:	99B2    	(gen. act. B7)
C0/99CA:	ABB6    	(gen. act. B8)
C0/99CC:	BFB6    	(gen. act. B9)
C0/99CE:	31BA    	(gen. act. BA)
C0/99D0:	BEB9    	(gen. act. BB)
C0/99D2:	6FB1    	(gen. act. BC)
C0/99D4:	71B2    	(gen. act. BD)
C0/99D6:	F7B6    	(gen. act. BE)
C0/99D8:	E7B9    	(gen. act. BF)
C0/99DA:	C8B2    	(gen. act. C0)    ; if event bit set... ($B2C8)
C0/99DC:	C8B2    	(gen. act. C1)
C0/99DE:	C8B2    	(gen. act. C2)
C0/99E0:	C8B2    	(gen. act. C3)
C0/99E2:	C8B2    	(gen. act. C4)
C0/99E4:	C8B2    	(gen. act. C5)
C0/99E6:	C8B2    	(gen. act. C6)
C0/99E8:	C8B2    	(gen. act. C7)
C0/99EA:	2DB3    	(gen. act. C8)
C0/99EC:	2DB3    	(gen. act. C9)
C0/99EE:	2DB3    	(gen. act. CA)
C0/99F0:	2DB3    	(gen. act. CB)
C0/99F2:	2DB3    	(gen. act. CC)
C0/99F4:	2DB3    	(gen. act. CD)
C0/99F6:	2DB3    	(gen. act. CE)
C0/99F8:	2DB3    	(gen. act. CF)
C0/99FA:	93B5    	(gen. act. D0)    ; set event bit ($B593)
C0/99FC:	CFB5    	(gen. act. D1)
C0/99FE:	A7B5    	(gen. act. D2)
C0/9A00:	E3B5    	(gen. act. D3)
C0/9A02:	BBB5    	(gen. act. D4)
C0/9A04:	F7B5    	(gen. act. D5)
C0/9A06:	0BB6    	(gen. act. D6)
C0/9A08:	5BB6    	(gen. act. D7)
C0/9A0A:	1FB6    	(gen. act. D8)
C0/9A0C:	6FB6    	(gen. act. D9)
C0/9A0E:	33B6    	(gen. act. DA)
C0/9A10:	83B6    	(gen. act. DB)
C0/9A12:	47B6    	(gen. act. DC)
C0/9A14:	97B6    	(gen. act. DD)
C0/9A16:	0BB4    	(gen. act. DE)
C0/9A18:	65B4    	(gen. act. DF)
C0/9A1A:	13B5    	(gen. act. E0)
C0/9A1C:	1EB5    	(gen. act. E1)
C0/9A1E:	B9B4    	(gen. act. E2)
C0/9A20:	B7B3    	(gen. act. E3)
C0/9A22:	9EB3    	(gen. act. E4)
C0/9A24:	1AB9    	(gen. act. E5)
C0/9A26:	1AB9    	(gen. act. E6)
C0/9A28:	94B3    	(gen. act. E7)
C0/9A2A:	29B5    	(gen. act. E8)
C0/9A2C:	3CB5    	(gen. act. E9)
C0/9A2E:	56B5    	(gen. act. EA)
C0/9A30:	71B5    	(gen. act. EB)
C0/9A32:	1AB9    	(gen. act. EC)
C0/9A34:	1AB9    	(gen. act. ED)
C0/9A36:	1AB9    	(gen. act. EE)
C0/9A38:	AAB7    	(gen. act. EF) (Play song $EB at volume $EC)
C0/9A3A:	80B7    	(gen. act. F0) (Play song $EB)
C0/9A3C:	D4B7    	(gen. act. F1) (Fade in song $EB at speed $EC)
C0/9A3E:	11B8    	(gen. act. F2) (Fade out song at speed $EB)
C0/9A40:	27B8    	(gen. act. F3) (Continue song previously paused)
C0/9A42:	54B8        	(gen. act. F4) (Play sound effect $EB)
C0/9A44:	5EB8    	(gen. act. F5)
C0/9A46:	89B8    	(gen. act. F6)
C0/9A48:	A1B8    	(gen. act. F7)
C0/9A4A:	AFB8    	(gen. act. F8)
C0/9A4C:	BAB8    	(gen. act. F9)
C0/9A4E:	C7B8    	(gen. act. FA) (Pause event queue until song playing finishes or fades out)
C0/9A50:	D2B8    	(gen. act. FB)
C0/9A52:	1AB9    	(gen. act. FC)
C0/9A54:	D2B8    	(gen. act. FD)
C0/9A56:	D7B8    	(gen. act. FE)
C0/9A58:	1AB9    	(gen. act. FF)
(End of General Actions' pointers)

; General actions TODO

C0/9A5A:	E647    	INC $47	         ; increment event counter
C0/9A5C:	A584    	LDA $84          ; "new map loading"
C0/9A5E:	D00D    	BNE $9A6D        ; branch if ^
C0/9A60:	A558    	LDA $58          ; "reloading map"
C0/9A62:	D006    	BNE $9A6A        ; branch if ^
C0/9A64:	A547    	LDA $47          ; event counter
C0/9A66:	2903    	AND #$03         ; 0-3
C0/9A68:	D003    	BNE $9A6D        ; branch 75% of the time
C0/9A6A:	204A71  	JSR $714A        ; [?] runs when reloading map or 25% of time

; Execute next general action

C0/9A6D:	A6E3    	LDX $E3	         ; event pause wait
C0/9A6F:	F004    	BEQ $9A75        ; branch if zero
C0/9A71:	CA      	DEX              ; decrement pause wait
C0/9A72:	86E3    	STX $E3          ; save new wait count
C0/9A74:	60      	RTS
 
C0/9A75:	AD9807  	LDA $0798		     ; waiting for character object update
C0/9A78:	F001    	BEQ $9A7B        ; branch if zero wait count
C0/9A7A:	60      	RTS
 
C0/9A7B:	AD5A05  	LDA $055A	       ; BG1 Map Data update status
C0/9A7E:	F004    	BEQ $9A84        ; branch if no changes
C0/9A80:	C905    	CMP #$05         ; "Needs Update, but Waiting"
C0/9A82:	D0F6    	BNE $9A7A	       ; exit if not ^
C0/9A84:	AD5B05  	LDA $055B	       ; BG2 Map Data update status
C0/9A87:	F004    	BEQ $9A8D        ; branch if no changes
C0/9A89:	C905    	CMP #$05         ; "Needs Update, but Waiting"
C0/9A8B:	D0ED    	BNE $9A7A	       ; exit if not ^
C0/9A8D:	AD5C05  	LDA $055C	       ; BG3 Map Data update status
C0/9A90:	F004    	BEQ $9A96        ; branch if no changes
C0/9A92:	C905    	CMP #$05         ; "Needs Update, but Waiting"
C0/9A94:	D0E4    	BNE $9A7A		     ; exit if not ^
C0/9A96:	2081BA  	JSR $BA81        ; update facing direction and pressing A bits
C0/9A99:	A5E1    	LDA $E1          ; event flags
C0/9A9B:	1021    	BPL $9ABE        ; branch if not waiting for an object script to finish

C0/9A9D:	A5E2    	LDA $E2          ; object to wait for
C0/9A9F:	8D0242  	STA $4202        ; prep multiplication
C0/9AA2:	A929    	LDA #$29         ; size of object data block
C0/9AA4:	8D0342  	STA $4203        ; prep multiplication
C0/9AA7:	EA      	NOP
C0/9AA8:	EA      	NOP
C0/9AA9:	EA      	NOP
C0/9AAA:	EA      	NOP
C0/9AAB:	AC1642  	LDY $4216        ; object data offset
C0/9AAE:	B97C08  	LDA $087C,Y      ; movement flags
C0/9AB1:	290F    	AND #$0F         ; isolate "Movement Type"
C0/9AB3:	F001    	BEQ $9AB6        ; branch if not moving
C0/9AB5:	60      	RTS
 
C0/9AB6:	A5E1    	LDA $E1          ; event flags
C0/9AB8:	297F    	AND #$7F         ; mask "waiting for script to finish"
C0/9ABA:	85E1    	STA $E1          ; update event flags
C0/9ABC:	805D    	BRA $9B1B        ; branch

C0/9ABE:	A5E1    	LDA $E1	         ; event flags
C0/9AC0:	2940    	AND #$40         ; waiting for fade to finish
C0/9AC2:	F00C    	BEQ $9AD0        ; branch if not ^
C0/9AC4:	A54A    	LDA $4A          ; fading data
C0/9AC6:	F001    	BEQ $9AC9        ; branch if none [?]
C0/9AC8:	60      	RTS
 
C0/9AC9:	A5E1    	LDA $E1          ; event flags
C0/9ACB:	29BF    	AND #$BF         ; mask "waiting for fade"
C0/9ACD:	85E1    	STA $E1          ; update event flags
C0/9ACF:	60      	RTS
 
C0/9AD0:	A5E1    	LDA $E1          ; event flags
C0/9AD2:	2920    	AND #$20         ; waiting for scroll to finish
C0/9AD4:	F045    	BEQ $9B1B        ; branch if not waiting
C0/9AD6:	AD4105  	LDA $0541        ; BG1 X Center current
C0/9AD9:	CD5705  	CMP $0557        ; BG1 X Center destination
C0/9ADC:	F00D    	BEQ $9AEB        ; branch if scroll done
C0/9ADE:	1A      	INC A            ; get next tick X coord
C0/9ADF:	CD5705  	CMP $0557        ; BG1 X center destination
C0/9AE2:	F007    	BEQ $9AEB        ; branch if will be done next tick
C0/9AE4:	3A      	DEC A
C0/9AE5:	3A      	DEC A            ; get prev tick X coord
C0/9AE6:	CD5705  	CMP $0557        ; BG1 X center destination
C0/9AE9:	D015    	BNE $9B00        ; exit if wasn't done last tick

C0/9AEB:	AD4205  	LDA $0542        ; BG1 Y center coord current
C0/9AEE:	CD5805  	CMP $0558        ; BG1 Y center coord destination
C0/9AF1:	F00E    	BEQ $9B01        ; branch if scroll done
C0/9AF3:	1A      	INC A            ; next Y coord tick
C0/9AF4:	CD5805  	CMP $0558        ; finished next tick
C0/9AF7:	F008    	BEQ $9B01        ; branch if ^
C0/9AF9:	3A      	DEC A            ; previous Y coord tick
C0/9AFA:	3A      	DEC A
C0/9AFB:	CD5805  	CMP $0558        ; just finished on last tick
C0/9AFE:	F001    	BEQ $9B01        ; branch if finished
C0/9B00:	60      	RTS

; X and Y scrolls finished

C0/9B01:	A5E1    	LDA $E1		       ; event flags
C0/9B03:	29DF    	AND #$DF         ; mask "waiting for scroll"
C0/9B05:	85E1    	STA $E1          ; update event flags
C0/9B07:	A600    	LDX $00          ; X = 0000
C0/9B09:	8E4705  	STX $0547
C0/9B0C:	8E4905  	STX $0549
C0/9B0F:	8E4B05  	STX $054B
C0/9B12:	8E4D05  	STX $054D
C0/9B15:	8E4F05  	STX $054F
C0/9B18:	8E5105  	STX $0551        ; zero all BG scroll speeds

C0/9B1B:	A00500  	LDY #$0005       ; prepare loop through event args
C0/9B1E:	B7E5    	LDA [$E5],Y      ; 5th event arg
C0/9B20:	85EF    	STA $EF          ; save it
C0/9B22:	88      	DEY
C0/9B23:	B7E5    	LDA [$E5],Y      ; 4th event arg
C0/9B25:	85EE    	STA $EE          ; save it
C0/9B27:	88      	DEY
C0/9B28:	B7E5    	LDA [$E5],Y      ; 3rd event arg
C0/9B2A:	85ED    	STA $ED          ; save it
C0/9B2C:	88      	DEY 
C0/9B2D:	B7E5    	LDA [$E5],Y      ; 2nd event arg
C0/9B2F:	85EC    	STA $EC          ; save it
C0/9B31:	88      	DEY 
C0/9B32:	B7E5    	LDA [$E5],Y      ; 1st event arg
C0/9B34:	85EB    	STA $EB          ; save it
C0/9B36:	88      	DEY 
C0/9B37:	B7E5    	LDA [$E5],Y      ; event opcode
C0/9B39:	85EA    	STA $EA          ; save it
C0/9B3B:	C931    	CMP #$31         ; object event range (NPCs)
C0/9B3D:	B003    	BCS $9B42        ; branch if not an NPC event
C0/9B3F:	4CA59B  	JMP $9BA5        ; process NPC object event

C0/9B42:	C935    	CMP #$35         ; object event range (Party Characters)
C0/9B44:	B003    	BCS $9B49        ; branch if not an object event
C0/9B46:	4C0B9C  	JMP $9C0B

C0/9B49:	38      	SEC 		         ; set carry
C0/9B4A:	E935    	SBC #$35         ; get 0-based index for command ops
C0/9B4C:	C220    	REP #$20      	 ; 16-bit A
C0/9B4E:	0A      	ASL A            ; index x2
C0/9B4F:	AA      	TAX
C0/9B50:	BFC498C0	LDA $C098C4,X    ; pointer for general action
C0/9B54:	852A    	STA $2A	         ; save it
C0/9B56:	7B      	TDC              ; clear A/B
C0/9B57:	E220    	SEP #$20         ; 8-bit A
C0/9B59:	6C2A00  	JMP ($002A)      ; execute general action

; Advance the event queue by various bytes, A holds the amount coming in

C0/9B5C:	18      	CLC	             ; clear carry
C0/9B5D:	65E5    	ADC $E5          ; add to event pointer (low)
C0/9B5F:	85E5    	STA $E5
C0/9B61:	A5E6    	LDA $E6
C0/9B63:	6900    	ADC #$00
C0/9B65:	85E6    	STA $E6          ; carry overflow to (hi)
C0/9B67:	A5E7    	LDA $E7
C0/9B69:	6900    	ADC #$00
C0/9B6B:	85E7    	STA $E7          ; carry overflow to (bank)
C0/9B6D:	4C6D9A  	JMP $9A6D        ; execute next general action

; Advance the event queue by various bytes, A holds the amount coming in

C0/9B70:	18      	CLC		(Called from various, below)
C0/9B71:	65E5    	ADC $E5
C0/9B73:	85E5    	STA $E5
C0/9B75:	A5E6    	LDA $E6
C0/9B77:	6900    	ADC #$00
C0/9B79:	85E6    	STA $E6
C0/9B7B:	A5E7    	LDA $E7
C0/9B7D:	6900    	ADC #$00
C0/9B7F:	85E7    	STA $E7
C0/9B81:	60      	RTS
 
C0/9B82:	A6E8    	LDX $E8
C0/9B84:	18      	CLC
C0/9B85:	65E5    	ADC $E5
C0/9B87:	85E5    	STA $E5
C0/9B89:	9DF405  	STA $05F4,X
C0/9B8C:	A5E6    	LDA $E6
C0/9B8E:	6900    	ADC #$00
C0/9B90:	85E6    	STA $E6
C0/9B92:	9DF505  	STA $05F5,X
C0/9B95:	A5E7    	LDA $E7
C0/9B97:	6900    	ADC #$00
C0/9B99:	85E7    	STA $E7
C0/9B9B:	9FF60500	STA $0005F6,X
C0/9B9F:	E8      	INX
C0/9BA0:	E8      	INX
C0/9BA1:	E8      	INX
C0/9BA2:	86E8    	STX $E8
C0/9BA4:	60      	RTS
 
; Handle object event (general action)
C0/9BA5:	8D0242  	STA $4202
C0/9BA8:	A929    	LDA #$29
C0/9BAA:	8D0342  	STA $4203
C0/9BAD:	EA      	NOP
C0/9BAE:	EA      	NOP
C0/9BAF:	EA      	NOP
C0/9BB0:	EA      	NOP
C0/9BB1:	AC1642  	LDY $4216

; Read object action queue

C0/9BB4:	B97C08  	LDA $087C,Y
C0/9BB7:	29F0    	AND #$F0
C0/9BB9:	0901    	ORA #$01
C0/9BBB:	997C08  	STA $087C,Y
C0/9BBE:	7B      	TDC 
C0/9BBF:	998608  	STA $0886,Y
C0/9BC2:	A5E5    	LDA $E5          ; this event address
C0/9BC4:	18      	CLC
C0/9BC5:	6902    	ADC #$02         ; skip object ID and control (length)
C0/9BC7:	998308  	STA $0883,Y      ; set pointer low-byte (pending action queue)
C0/9BCA:	A5E6    	LDA $E6
C0/9BCC:	6900    	ADC #$00
C0/9BCE:	998408  	STA $0884,Y      ; set pointer mid-byte (pending action queue)
C0/9BD1:	A5E7    	LDA $E7
C0/9BD3:	6900    	ADC #$00
C0/9BD5:	998508  	STA $0885,Y      ; set pointer top-byte (pending action queue)
C0/9BD8:	A5EB    	LDA $EB          ; action queue control byte
C0/9BDA:	1026    	BPL $9C02        ; branch if "asynchronous" execution

C0/9BDC:	A5EA    	LDA $EA          ; object ID
C0/9BDE:	C931    	CMP #$31
C0/9BE0:	901A    	BCC $9BFC
C0/9BE2:	38      	SEC 
C0/9BE3:	E931    	SBC #$31
C0/9BE5:	0A      	ASL A
C0/9BE6:	A8      	TAY
C0/9BE7:	BE0308  	LDX $0803,Y
C0/9BEA:	8E0442  	STX $4204
C0/9BED:	A929    	LDA #$29
C0/9BEF:	8D0642  	STA $4206
C0/9BF2:	EA      	NOP
C0/9BF3:	EA      	NOP
C0/9BF4:	EA      	NOP
C0/9BF5:	EA      	NOP
C0/9BF6:	EA      	NOP
C0/9BF7:	EA      	NOP
C0/9BF8:	EA      	NOP
C0/9BF9:	AD1442  	LDA $4214
C0/9BFC:	85E2    	STA $E2
C0/9BFE:	A980    	LDA #$80
C0/9C00:	85E1    	STA $E1

C0/9C02:	A5EB    	LDA $EB          ; action queue control byte
C0/9C04:	297F    	AND #$7F         ; isolate "Queue Length"
C0/9C06:	1A      	INC A            ; +1
C0/9C07:	1A      	INC A            ; +2
C0/9C08:	4C5C9B  	JMP $9B5C

; Party Character Object Event
C0/9C0B:	38      	SEC 		(from C0/9B46) 
C0/9C0C:	E931    	SBC #$31
C0/9C0E:	0A      	ASL A
C0/9C0F:	AA      	TAX
C0/9C10:	BC0308  	LDY $0803,X
C0/9C13:	C0B007  	CPY #$07B0
C0/9C16:	F022    	BEQ $9C3A
C0/9C18:	B96708  	LDA $0867,Y
C0/9C1B:	2907    	AND #$07
C0/9C1D:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/9C20:	D018    	BNE $9C3A
C0/9C22:	8C0442  	STY $4204
C0/9C25:	A929    	LDA #$29
C0/9C27:	8D0642  	STA $4206
C0/9C2A:	EA      	NOP
C0/9C2B:	EA      	NOP
C0/9C2C:	EA      	NOP
C0/9C2D:	EA      	NOP
C0/9C2E:	EA      	NOP
C0/9C2F:	EA      	NOP
C0/9C30:	EA      	NOP
C0/9C31:	EA      	NOP
C0/9C32:	AD1442  	LDA $4214
C0/9C35:	85EA    	STA $EA
C0/9C37:	4CB49B  	JMP $9BB4

C0/9C3A:	A931    	LDA #$31
C0/9C3C:	85EA    	STA $EA
C0/9C3E:	A0D907  	LDY #$07D9
C0/9C41:	4CB49B  	JMP $9BB4


(gen. act. 35)

C0/9C44:	A5EB    	LDA $EB	
C0/9C46:	C931    	CMP #$31       (is this a party character?)
C0/9C48:	901A    	BCC $9C64      (branch if not)
C0/9C4A:	38      	SEC 
C0/9C4B:	E931    	SBC #$31
C0/9C4D:	0A      	ASL A
C0/9C4E:	A8      	TAY
C0/9C4F:	BE0308  	LDX $0803,Y
C0/9C52:	8E0442  	STX $4204
C0/9C55:	A929    	LDA #$29       (Set to divide by 41)
C0/9C57:	8D0642  	STA $4206
C0/9C5A:	EA      	NOP
C0/9C5B:	EA      	NOP
C0/9C5C:	EA      	NOP
C0/9C5D:	EA      	NOP
C0/9C5E:	EA      	NOP
C0/9C5F:	EA      	NOP
C0/9C60:	EA      	NOP
C0/9C61:	AD1442  	LDA $4214
C0/9C64:	85E2    	STA $E2
C0/9C66:	A980    	LDA #$80
C0/9C68:	85E1    	STA $E1
C0/9C6A:	A902    	LDA #$02
C0/9C6C:	4C5C9B  	JMP $9B5C


(gen. act. 36)

C0/9C6F:	20F09D  	JSR $9DF0	
C0/9C72:	B97C08  	LDA $087C,Y
C0/9C75:	29EF    	AND #$EF
C0/9C77:	997C08  	STA $087C,Y
C0/9C7A:	A902    	LDA #$02
C0/9C7C:	4C5C9B  	JMP $9B5C


(gen. act. 78)

C0/9C7F:	20F09D  	JSR $9DF0	
C0/9C82:	B97C08  	LDA $087C,Y
C0/9C85:	0910    	ORA #$10
C0/9C87:	997C08  	STA $087C,Y
C0/9C8A:	A902    	LDA #$02
C0/9C8C:	4C5C9B  	JMP $9B5C


Assign graphic set YY to object XX
(gen. act. 37)

C0/9C8F:	20F09D  	JSR $9DF0	
C0/9C92:	A5EC    	LDA $EC
C0/9C94:	997908  	STA $0879,Y
C0/9C97:	20AD9D  	JSR $9DAD
C0/9C9A:	C05002  	CPY #$0250
C0/9C9D:	B005    	BCS $9CA4
C0/9C9F:	A5EC    	LDA $EC
C0/9CA1:	990116  	STA $1601,Y
C0/9CA4:	A903    	LDA #$03
C0/9CA6:	4C5C9B  	JMP $9B5C


Assign pallete YY to object XX
(gen. act. 43)

C0/9CA9:	20F09D  	JSR $9DF0	
C0/9CAC:	A5EC    	LDA $EC
C0/9CAE:	0A      	ASL A
C0/9CAF:	851A    	STA $1A
C0/9CB1:	B98008  	LDA $0880,Y
C0/9CB4:	29F1    	AND #$F1
C0/9CB6:	051A    	ORA $1A
C0/9CB8:	998008  	STA $0880,Y
C0/9CBB:	B98108  	LDA $0881,Y
C0/9CBE:	29F1    	AND #$F1
C0/9CC0:	051A    	ORA $1A
C0/9CC2:	998108  	STA $0881,Y
C0/9CC5:	A903    	LDA #$03
C0/9CC7:	4C5C9B  	JMP $9B5C


Place object xx on vehicle yy
 	00: No vehicle         40: Magitek Armor        80: Object visible
	20: Chocobo            60: Raft
(gen. act. 44)

C0/9CCA:	20F09D  	JSR $9DF0	
C0/9CCD:	A5EC    	LDA $EC
C0/9CCF:	29E0    	AND #$E0
C0/9CD1:	851A    	STA $1A
C0/9CD3:	B96808  	LDA $0868,Y
C0/9CD6:	291F    	AND #$1F
C0/9CD8:	051A    	ORA $1A
C0/9CDA:	996808  	STA $0868,Y
C0/9CDD:	A903    	LDA #$03
C0/9CDF:	4C5C9B  	JMP $9B5C


Refresh objects
(gen. act. 45)

C0/9CE2:	A901    	LDA #$01
C0/9CE4:	8D9807  	STA $0798
C0/9CE7:	4C5C9B  	JMP $9B5C


Make XX the current party
(gen. act. 46)

C0/9CEA:	A5EB    	LDA $EB
C0/9CEC:	8D6D1A  	STA $1A6D		(Store to active party)
C0/9CEF:	A0D907  	LDY #$07D9
C0/9CF2:	8CFB07  	STY $07FB
C0/9CF5:	8CFD07  	STY $07FD
C0/9CF8:	8CFF07  	STY $07FF
C0/9CFB:	8C0108  	STY $0801
C0/9CFE:	A902    	LDA #$02
C0/9D00:	4C5C9B  	JMP $9B5C


(gen. act. 47)

C0/9D03:	20676F  	JSR $6F67
C0/9D06:	209170  	JSR $7091
C0/9D09:	A901    	LDA #$01
C0/9D0B:	4C5C9B  	JMP $9B5C

C0/9D0E:	A901    	LDA #$01
C0/9D10:	8D5905  	STA $0559
C0/9D13:	4C5C9B  	JMP $9B5C

C0/9D16:	9C5905  	STZ $0559
C0/9D19:	A901    	LDA #$01
C0/9D1B:	4C5C9B  	JMP $9B5C


(gen. act. 3A)

C0/9D1E:	AC0308  	LDY $0803
C0/9D21:	A902    	LDA #$02
C0/9D23:	997C08  	STA $087C,Y
C0/9D26:	997D08  	STA $087D,Y
C0/9D29:	A901    	LDA #$01	
C0/9D2B:	4C5C9B  	JMP $9B5C


Position character in "ready-to-go" stance
(gen. act. 3B)

C0/9D2E:	AC0308  	LDY $0803	
C0/9D31:	A901    	LDA #$01	(swapping lines /9D23 and /9D26 and changing /9D33 to BRA would work)
C0/9D33:	997C08  	STA $087C,Y
C0/9D36:	A901    	LDA #$01	(this is unnecessary)
C0/9D38:	4C5C9B  	JMP $9B5C


Assign character XX in party YY
(if yy == 0, remove character from party)
(gen. act. 3F)

C0/9D3B:	207770  	JSR $7077		
C0/9D3E:	A5EC    	LDA $EC
C0/9D40:	20A29E  	JSR $9EA2
C0/9D43:	05EC    	ORA $EC
C0/9D45:	851A    	STA $1A
C0/9D47:	20F09D  	JSR $9DF0
C0/9D4A:	B96708  	LDA $0867,Y
C0/9D4D:	29E0    	AND #$E0
C0/9D4F:	051A    	ORA $1A
C0/9D51:	996708  	STA $0867,Y
C0/9D54:	851A    	STA $1A
C0/9D56:	7B      	TDC 
C0/9D57:	997D08  	STA $087D,Y
C0/9D5A:	20D870  	JSR $70D8
C0/9D5D:	A5EB    	LDA $EB
C0/9D5F:	A8      	TAY
C0/9D60:	A51A    	LDA $1A
C0/9D62:	995018  	STA $1850,Y
C0/9D65:	20F36C  	JSR $6CF3
C0/9D68:	A903    	LDA #$03
C0/9D6A:	4C5C9B  	JMP $9B5C


Set up party as follows: A, B, C, D.
(gen. act. 3C)

C0/9D6D:	A0D907  	LDY #$07D9
C0/9D70:	8CFD07  	STY $07FD      (vacate slot 2)
C0/9D73:	8CFF07  	STY $07FF      (vacate slot 3)
C0/9D76:	8C0108  	STY $0801      (vacate slot 4)
                                               (this is misleading, since those not touched by the re-arranging
                                                are tacked on at the end...)
C0/9D79:	20F09D  	JSR $9DF0      (assign first character parameter as leader)
C0/9D7C:	8CFB07  	STY $07FB      (set slot 1)
C0/9D7F:	A5EC    	LDA $EC        (load second parameter)
C0/9D81:	3020    	BMI $9DA3      (branch if no character defined)
C0/9D83:	85EB    	STA $EB        (save to set character in slot 2)
C0/9D85:	20F09D  	JSR $9DF0
C0/9D88:	8CFD07  	STY $07FD      (set slot 2)
C0/9D8B:	A5ED    	LDA $ED        (load third parameter)
C0/9D8D:	3014    	BMI $9DA3      (branch if no character defined)
C0/9D8F:	85EB    	STA $EB        (save to set character in slot 3)
C0/9D91:	20F09D  	JSR $9DF0
C0/9D94:	8CFF07  	STY $07FF      (set slot 3)
C0/9D97:	A5EE    	LDA $EE        (load fourth parameter)
C0/9D99:	3008    	BMI $9DA3      (branch if no character defined)
C0/9D9B:	85EB    	STA $EB        (save to set character in slot 4)
C0/9D9D:	20F09D  	JSR $9DF0
C0/9DA0:	8C0108  	STY $0801      (set slot 4)
C0/9DA3:	A901    	LDA #$01
C0/9DA5:	8D9807  	STA $0798
C0/9DA8:	A905    	LDA #$05
C0/9DAA:	4C5C9B  	JMP $9B5C

C0/9DAD:	A5EB    	LDA $EB
C0/9DAF:	C931    	CMP #$31       (are we checking party characters?)
C0/9DB1:	902D    	BCC $9DE0      (branch if not)
C0/9DB3:	38      	SEC 
C0/9DB4:	E931    	SBC #$31
C0/9DB6:	0A      	ASL A
C0/9DB7:	AA      	TAX
C0/9DB8:	BC0308  	LDY $0803,X    (load room's entities)
C0/9DBB:	C0B007  	CPY #$07B0     (is it the camera?)
C0/9DBE:	F01E    	BEQ $9DDE      (branch if so)
C0/9DC0:	B96708  	LDA $0867,Y
C0/9DC3:	2907    	AND #$07
C0/9DC5:	CD6D1A  	CMP $1A6D      (Is this the active party?)
C0/9DC8:	D014    	BNE $9DDE      (branch if not)
C0/9DCA:	8C0442  	STY $4204      (save Y's index)
C0/9DCD:	A929    	LDA #$29
C0/9DCF:	8D0642  	STA $4206      (divide Y by 41)
C0/9DD2:	EA      	NOP
C0/9DD3:	EA      	NOP
C0/9DD4:	EA      	NOP
C0/9DD5:	EA      	NOP
C0/9DD6:	EA      	NOP
C0/9DD7:	EA      	NOP
C0/9DD8:	EA      	NOP
C0/9DD9:	AD1442  	LDA $4214      (load the dividing result)
C0/9DDC:	8002    	BRA $9DE0      (store that as the multiplier)
C0/9DDE:	A911    	LDA #$11       (you reach this point if it's not the active party, 17 * 37 = #$0275, which is in the items owned data...)
C0/9DE0:	8D0242  	STA $4202
C0/9DE3:	A925    	LDA #$25       (character data is 37 bytes in length)
C0/9DE5:	8D0342  	STA $4203
C0/9DE8:	EA      	NOP
C0/9DE9:	EA      	NOP
C0/9DEA:	EA      	NOP
C0/9DEB:	EA      	NOP
C0/9DEC:	AC1642  	LDY $4216      (load current character)
C0/9DEF:	60      	RTS
 
C0/9DF0:	A5EB    	LDA $EB        (from C0/9D47, C0/9D79, C0/9D85, C0/9D91, C0/9D9D)
C0/9DF2:	C931    	CMP #$31       (are we checking party characters?)
C0/9DF4:	9035    	BCC $9E2B      (branch if not)
C0/9DF6:	38      	SEC 
C0/9DF7:	E931    	SBC #$31
C0/9DF9:	0A      	ASL A
C0/9DFA:	AA      	TAX
C0/9DFB:	BC0308  	LDY $0803,X    (load room's entities)
C0/9DFE:	C0B007  	CPY #$07B0     (is it the camera?)
C0/9E01:	F020    	BEQ $9E23      (branch if so)
C0/9E03:	B96708  	LDA $0867,Y
C0/9E06:	2907    	AND #$07
C0/9E08:	CD6D1A  	CMP $1A6D      (Is this the active party?)
C0/9E0B:	D016    	BNE $9E23      (branch if not)
C0/9E0D:	8C0442  	STY $4204      (save Y's index)
C0/9E10:	A929    	LDA #$29
C0/9E12:	8D0642  	STA $4206      (divide Y by 41)
C0/9E15:	EA      	NOP
C0/9E16:	EA      	NOP
C0/9E17:	EA      	NOP
C0/9E18:	EA      	NOP
C0/9E19:	EA      	NOP
C0/9E1A:	EA      	NOP
C0/9E1B:	EA      	NOP
C0/9E1C:	EA      	NOP
C0/9E1D:	AD1442  	LDA $4214
C0/9E20:	85EB    	STA $EB
C0/9E22:	60      	RTS
 
C0/9E23:	A0D907  	LDY #$07D9     (from C0/9E01, C0/9E0B)
C0/9E26:	A931    	LDA #$31
C0/9E28:	85EB    	STA $EB
C0/9E2A:	60      	RTS
 
C0/9E2B:	A5EB    	LDA $EB        (from C0/9DF4, load character ID)
C0/9E2D:	8D0242  	STA $4202
C0/9E30:	A929    	LDA #$29
C0/9E32:	8D0342  	STA $4203      (multiply by 41)
C0/9E35:	EA      	NOP
C0/9E36:	EA      	NOP
C0/9E37:	EA      	NOP
C0/9E38:	AC1642  	LDY $4216
C0/9E3B:	60      	RTS


Create object XX
(gen. act. 3D)

C0/9E3C:	20F09D  	JSR $9DF0	
C0/9E3F:	B96708  	LDA $0867,Y    (load...?)
C0/9E42:	2940    	AND #$40       (does object already exist?)
C0/9E44:	D01C    	BNE $9E62      (branch if so)
C0/9E46:	B96708  	LDA $0867,Y    (load...?)
C0/9E49:	293F    	AND #$3F       (mask...?)
C0/9E4B:	0940    	ORA #$40       (set to be present)
C0/9E4D:	996708  	STA $0867,Y    (and save)
C0/9E50:	209255  	JSR $5592
C0/9E53:	A5EB    	LDA $EB        (load parameter, likely map NPCs)
C0/9E55:	C910    	CMP #$10       (is it an NPC?)
C0/9E57:	B009    	BCS $9E62      (branch if so)
C0/9E59:	A8      	TAY           (we're here if trying to create a character)
C0/9E5A:	B95018  	LDA $1850,Y
C0/9E5D:	0940    	ORA #$40
C0/9E5F:	995018  	STA $1850,Y
C0/9E62:	A902    	LDA #$02
C0/9E64:	4C5C9B  	JMP $9B5C


Delete object XX
(gen. act. 3E)

C0/9E67:	20F09D  	JSR $9DF0
C0/9E6A:	B96708  	LDA $0867,Y
C0/9E6D:	2940    	AND #$40
C0/9E6F:	F02C    	BEQ $9E9D
C0/9E71:	B96708  	LDA $0867,Y
C0/9E74:	293F    	AND #$3F
C0/9E76:	996708  	STA $0867,Y
C0/9E79:	7B      	TDC 
C0/9E7A:	997D08  	STA $087D,Y
C0/9E7D:	20B155  	JSR $55B1
C0/9E80:	5A      	PHY
C0/9E81:	20D870  	JSR $70D8
C0/9E84:	7A      	PLY
C0/9E85:	BE7A08  	LDX $087A,Y
C0/9E88:	A9FF    	LDA #$FF
C0/9E8A:	9F00207E	STA $7E2000,X
C0/9E8E:	A5EB    	LDA $EB
C0/9E90:	C910    	CMP #$10
C0/9E92:	B009    	BCS $9E9D
C0/9E94:	A8      	TAY
C0/9E95:	B95018  	LDA $1850,Y
C0/9E98:	293F    	AND #$3F
C0/9E9A:	995018  	STA $1850,Y
C0/9E9D:	A902    	LDA #$02
C0/9E9F:	4C5C9B  	JMP $9B5C


C0/9EA2:	851A    	STA $1A
C0/9EA4:	C900    	CMP #$00
C0/9EA6:	F02C    	BEQ $9ED4
C0/9EA8:	A400    	LDY $00
C0/9EAA:	B96708  	LDA $0867,Y
C0/9EAD:	2940    	AND #$40
C0/9EAF:	F012    	BEQ $9EC3
C0/9EB1:	B96708  	LDA $0867,Y
C0/9EB4:	2907    	AND #$07
C0/9EB6:	C51A    	CMP $1A
C0/9EB8:	D009    	BNE $9EC3
C0/9EBA:	B96708  	LDA $0867,Y
C0/9EBD:	2918    	AND #$18
C0/9EBF:	C900    	CMP #$00
C0/9EC1:	F012    	BEQ $9ED5
C0/9EC3:	C220    	REP #$20      (16 bit accum./memory)
C0/9EC5:	98      	TYA
C0/9EC6:	18      	CLC
C0/9EC7:	692900  	ADC #$0029
C0/9ECA:	A8      	TAY
C0/9ECB:	7B      	TDC 
C0/9ECC:	E220    	SEP #$20      (8 bit accum./memory)
C0/9ECE:	C09002  	CPY #$0290
C0/9ED1:	D0D7    	BNE $9EAA
C0/9ED3:	7B      	TDC 
C0/9ED4:	60      	RTS
 
C0/9ED5:	A400    	LDY $00
C0/9ED7:	B96708  	LDA $0867,Y
C0/9EDA:	2940    	AND #$40
C0/9EDC:	F012    	BEQ $9EF0
C0/9EDE:	B96708  	LDA $0867,Y
C0/9EE1:	2907    	AND #$07
C0/9EE3:	C51A    	CMP $1A
C0/9EE5:	D009    	BNE $9EF0
C0/9EE7:	B96708  	LDA $0867,Y
C0/9EEA:	2918    	AND #$18
C0/9EEC:	C908    	CMP #$08
C0/9EEE:	F012    	BEQ $9F02
C0/9EF0:	C221    	REP #$21
C0/9EF2:	98      	TYA
C0/9EF3:	692900  	ADC #$0029
C0/9EF6:	A8      	TAY
C0/9EF7:	7B      	TDC 
C0/9EF8:	E220    	SEP #$20      (8 bit accum./memory)
C0/9EFA:	C09002  	CPY #$0290
C0/9EFD:	D0D8    	BNE $9ED7
C0/9EFF:	A908    	LDA #$08
C0/9F01:	60      	RTS
 
C0/9F02:	A400    	LDY $00
C0/9F04:	B96708  	LDA $0867,Y
C0/9F07:	2940    	AND #$40
C0/9F09:	F012    	BEQ $9F1D
C0/9F0B:	B96708  	LDA $0867,Y
C0/9F0E:	2907    	AND #$07
C0/9F10:	C51A    	CMP $1A
C0/9F12:	D009    	BNE $9F1D
C0/9F14:	B96708  	LDA $0867,Y
C0/9F17:	2918    	AND #$18
C0/9F19:	C910    	CMP #$10
C0/9F1B:	F012    	BEQ $9F2F
C0/9F1D:	C221    	REP #$21
C0/9F1F:	98      	TYA
C0/9F20:	692900  	ADC #$0029
C0/9F23:	A8      	TAY
C0/9F24:	7B      	TDC 
C0/9F25:	E220    	SEP #$20      (8 bit accum./memory)
C0/9F27:	C09002  	CPY #$0290
C0/9F2A:	D0D8    	BNE $9F04
C0/9F2C:	A910    	LDA #$10
C0/9F2E:	60      	RTS
 
C0/9F2F:	A918    	LDA #$18
C0/9F31:	60      	RTS


"Restore character xx HP and MP to full"
Perform level averaging on character XX
(gen. act. 77)

C0/9F32:	20789F  	JSR $9F78      (get the average of every member's level)
C0/9F35:	48      	PHA            (save it for now)
C0/9F36:	20AD9D  	JSR $9DAD      (determine which character ($EB) to perform on)
C0/9F39:	B90816  	LDA $1608,Y    (load character's level)
C0/9F3C:	3A      	DEC A          (subtract 1)
C0/9F3D:	8520    	STA $20        (save it for now)
C0/9F3F:	6421    	STZ $21        (this is done for the two JSRs)
C0/9F41:	68      	PLA            (get the average level)
C0/9F42:	D90816  	CMP $1608,Y    (compare it to our level we currently have)
C0/9F45:	9029    	BCC $9F70      (if it's less, don't change it, HP, MP, or stats)
C0/9F47:	990816  	STA $1608,Y    (otherwise set new level)

C0/9F4A:	3A      	DEC A          (subtract 1)
C0/9F4B:	8522    	STA $22        (save it for now)
C0/9F4D:	6423    	STZ $23        (this is done for the two JSRs)
C0/9F4F:	2062C5  	JSR $C562      (set new max HP)
C0/9F52:	209BC5  	JSR $C59B      (set new max MP)
C0/9F55:	B90B16  	LDA $160B,Y    (max HP, low byte)
C0/9F58:	990916  	STA $1609,Y    (now current HP, low byte)
C0/9F5B:	B90C16  	LDA $160C,Y    (max MP, high byte)
C0/9F5E:	990A16  	STA $160A,Y    (now current HP, high byte)
C0/9F61:	B90F16  	LDA $160F,Y    (max MP, low byte)
C0/9F64:	990D16  	STA $160D,Y    (now current MP, low byte)
C0/9F67:	B91016  	LDA $1610,Y    (max MP, high byte)
C0/9F6A:	990E16  	STA $160E,Y    (now current MP, high byte)
C0/9F6D:	207FA1  	JSR $A17F      (Check Natural Abilities)
C0/9F70:	2035A2  	JSR $A235      (set experience needed for the next level
                                                keep in mind levels not touched still jump here, so experience is reset...)
C0/9F73:	A902    	LDA #$02
C0/9F75:	4C5C9B  	JMP $9B5C

Determine character's starting level
C0/9F78:	AEDE1E  	LDX $1EDE      (load every character recruited)
C0/9F7B:	8620    	STX $20        (save it to $20)
C0/9F7D:	A600    	LDX $00        (X = #$0000)
C0/9F7F:	9B      	TXY           (Y = #$0000)
C0/9F80:	861E    	STX $1E        ($1E = #$0000, which will be the total of all recruited characters' levels)
C0/9F82:	641B    	STZ $1B        ($1B = #$00, which will be used to determine how many characters we checked)
C0/9F84:	C221    	REP #$21       (16 bit accum./memory + clear carry)
C0/9F86:	4620    	LSR $20        (characters recruited, shifted right for carry)
C0/9F88:	7B      	TDC            (A = #$0000)
C0/9F89:	E220    	SEP #$20       (8 bit accum./memory)
C0/9F8B:	9010    	BCC $9F9D      (branch if the party didn't find this character)
C0/9F8D:	A51E    	LDA $1E        (load the level total, low byte)
C0/9F8F:	18      	CLC
C0/9F90:	7D0816  	ADC $1608,X    (add it with this character's level)
C0/9F93:	851E    	STA $1E        (save it)
C0/9F95:	A51F    	LDA $1F        (load the level total, high byte)
C0/9F97:	6900    	ADC #$00       (incremented if the previous ADC wrapped)
C0/9F99:	851F    	STA $1F        (save it)
C0/9F9B:	E61B    	INC $1B        (increment number of characters we have checked)
C0/9F9D:	C8      	INY 
C0/9F9E:	C221    	REP #$21       (16 bit accum./memory + clear carry)
C0/9FA0:	8A      	TXA
C0/9FA1:	692500  	ADC #$0025     (add 37 to check the next character)
C0/9FA4:	AA      	TAX           (index it again)
C0/9FA5:	7B      	TDC            (A = #$0000)
C0/9FA6:	E220    	SEP #$20       (8 bit accum./memory)
C0/9FA8:	C00E00  	CPY #$000E     (have we done 14 characters yet?)
C0/9FAB:	D0D7    	BNE $9F84      (branch if not)
C0/9FAD:	A61E    	LDX $1E        (load the total of all recruited characters' levels)
C0/9FAF:	8E0442  	STX $4204
C0/9FB2:	A51B    	LDA $1B        (load the number of characters we checked)
C0/9FB4:	F00F    	BEQ $9FC5      (if this is 0, branch; dividing by 0 will destroy the universe)
C0/9FB6:	8D0642  	STA $4206
C0/9FB9:	EA      	NOP
C0/9FBA:	EA      	NOP
C0/9FBB:	EA      	NOP
C0/9FBC:	EA      	NOP
C0/9FBD:	EA      	NOP
C0/9FBE:	EA      	NOP
C0/9FBF:	EA      	NOP
C0/9FC0:	AD1442  	LDA $4214      (load the average level, rounded down)
C0/9FC3:	8002    	BRA $9FC7
C0/9FC5:	A903    	LDA #$03       (this is apparently only used for Terra at start-up)
C0/9FC7:	C963    	CMP #$63       (compare level to 99)
C0/9FC9:	9002    	BCC $9FCD      (Branch if it's less)
C0/9FCB:	A963    	LDA #$63       (Otherwise, set it to 99)
C0/9FCD:	60      	RTS


Remove all equipment from character XX and place it in the inventory
(gen. action 8D)
 
C0/9FCE:	A5EB    	LDA $EB		(Grab the character's index)
C0/9FD0:	8D0242  	STA $4202		(Get ready to multiply it)
C0/9FD3:	A925    	LDA #$25		(There's 37 character RAM bytes)
C0/9FD5:	8D0342  	STA $4203		(Get ready to multipy by char. index)
C0/9FD8:	EA      	NOP
C0/9FD9:	EA      	NOP
C0/9FDA:	A00600  	LDY #$0006		(There's 6 slots)
C0/9FDD:	AE1642  	LDX $4216		(X <- index * 37) 
C0/9FE0:	A9FF    	LDA #$FF		(Get "empty")
C0/9FE2:	9D1E16  	STA $161E,X		(Put it in esper)
C0/9FE5:	5A      	PHY			(Push slot #)
C0/9FE6:	DA      	PHX			(Push 37 * char. index offset)
C0/9FE7:	BD1F16  	LDA $161F,X		(Character's items)
C0/9FEA:	C9FF    	CMP #$FF		(already empty?)
C0/9FEC:	F03E    	BEQ $A02C		(if so, branch -> go to the next one)
C0/9FEE:	851A    	STA $1A		(otherwise, stick it in $1A)
C0/9FF0:	A9FF    	LDA #$FF		(Load an empty item and store it in that slot)
C0/9FF2:	9D1F16  	STA $161F,X		(now it is empty)
C0/9FF5:	A600    	LDX $00		(Load X with $00)
C0/9FF7:	BD6918  	LDA $1869,X		(Items currently in inventory)
C0/9FFA:	C51A    	CMP $1A		(Is this removed item at $1A the same as one we have in inventory?)
C0/9FFC:	F023    	BEQ $A021		(If so, branch -> increment its quantity)
C0/9FFE:	E8      	INX			(otherwise, move on to the next one)
C0/9FFF:	E00001  	CPX #$0100		(Is X over 256?)
C0/A002:	D0F3    	BNE $9FF7		(If not, branch -> go to the next item)
C0/A004:	A600    	LDX $00		(otherwise, load X with $00)
C0/A006:	BD6918  	LDA $1869,X		(check item currently in inventory at X)
C0/A009:	C9FF    	CMP #$FF		(Is it the "empty" item?)
C0/A00B:	F008    	BEQ $A015		(If so, branch -> grab the removed item)
C0/A00D:	E8      	INX			(Otherwise, increment to next item)
C0/A00E:	E00001  	CPX #$0100		(Now are we over 256?)
C0/A011:	D0F3    	BNE $A006		(If not, branch -> check item currently in inventory at X)
C0/A013:	8017    	BRA $A02C		(Otherwise, exit the function, we're done)
C0/A015:	A51A    	LDA $1A		(Get the removed item from $1A)
C0/A017:	9D6918  	STA $1869,X		(Put it in inventory)
C0/A01A:	A901    	LDA #$01		(Get 1)
C0/A01C:	9D6919  	STA $1969,X 	(Put it in quantity of that item)
C0/A01F:	800B    	BRA $A02C		(Go to the exit, we're done with this item)
C0/A021:	BD6919  	LDA $1969,X 	(Check quantity of item X)
C0/A024:	C963    	CMP #$63		(Is it 99)
C0/A026:	F004    	BEQ $A02C		(If it is, go to the exit, we're done with this item)
C0/A028:	1A      	INC A			(Otherwise, add 1)
C0/A029:	9D6919  	STA $1969,X 	(Store it in the quantity of items)
C0/A02C:	FA      	PLX			(Pull 37 * char. index offset)
C0/A02D:	7A      	PLY			(Pull slot #)
C0/A02E:	E8      	INX			(Increment X = char. index offset)
C0/A02F:	88      	DEY 			(Decrement Y = slot #)
C0/A030:	D0B3    	BNE $9FE5		(If Slot != 0, Do the next item)
C0/A032:	20F36C  	JSR $6CF3		(Otherwise, go to this function)
C0/A035:	A902    	LDA #$02		(Load A with 2)
C0/A037:	4C5C9B  	JMP $9B5C		(Exit to Jump address)


Change character XX's name to YY
(gen. act. 7F)

C0/A03A:	20AD9D  	JSR $9DAD		
C0/A03D:	A906    	LDA #$06
C0/A03F:	8D0242  	STA $4202
C0/A042:	A5EC    	LDA $EC
C0/A044:	8D0342  	STA $4203
C0/A047:	EA      	NOP
C0/A048:	EA      	NOP
C0/A049:	EA      	NOP
C0/A04A:	AE1642  	LDX $4216
C0/A04D:	BFC078C4	LDA $C478C0,X
C0/A051:	990216  	STA $1602,Y
C0/A054:	BFC178C4	LDA $C478C1,X
C0/A058:	990316  	STA $1603,Y
C0/A05B:	BFC278C4	LDA $C478C2,X
C0/A05F:	990416  	STA $1604,Y
C0/A062:	BFC378C4	LDA $C478C3,X
C0/A066:	990516  	STA $1605,Y
C0/A069:	BFC478C4	LDA $C478C4,X
C0/A06D:	990616  	STA $1606,Y
C0/A070:	BFC578C4	LDA $C478C5,X
C0/A074:	990716  	STA $1607,Y
C0/A077:	A903    	LDA #$03
C0/A079:	4C5C9B  	JMP $9B5C


Assign properties YY to character XX
(gen. act. 40)

C0/A07C:	20AD9D  	JSR $9DAD		
C0/A07F:	A916    	LDA #$16
C0/A081:	8D0242  	STA $4202
C0/A084:	A5EC    	LDA $EC
C0/A086:	8D0342  	STA $4203
C0/A089:	EA      	NOP
C0/A08A:	EA      	NOP
C0/A08B:	EA      	NOP
C0/A08C:	AE1642  	LDX $4216
C0/A08F:	BFA27CED	LDA $ED7CA2,X	(command 1)
C0/A093:	991616  	STA $1616,Y
C0/A096:	BFA37CED	LDA $ED7CA3,X	(command 2)
C0/A09A:	991716  	STA $1617,Y
C0/A09D:	BFA47CED	LDA $ED7CA4,X	(command 3)
C0/A0A1:	991816  	STA $1618,Y
C0/A0A4:	BFA57CED	LDA $ED7CA5,X	(command 4)
C0/A0A8:	991916  	STA $1619,Y
C0/A0AB:	BFA67CED	LDA $ED7CA6,X	(vigor)
C0/A0AF:	991A16  	STA $161A,Y
C0/A0B2:	BFA77CED	LDA $ED7CA7,X	(speed)
C0/A0B6:	991B16  	STA $161B,Y
C0/A0B9:	BFA87CED	LDA $ED7CA8,X	(stamina)
C0/A0BD:	991C16  	STA $161C,Y
C0/A0C0:	BFA97CED	LDA $ED7CA9,X	(mag. pwr.)
C0/A0C4:	991D16  	STA $161D,Y
C0/A0C7:	A9FF    	LDA #$FF
C0/A0C9:	991E16  	STA $161E,Y
C0/A0CC:	BFAF7CED	LDA $ED7CAF,X	(R-hand)
C0/A0D0:	991F16  	STA $161F,Y
C0/A0D3:	BFB07CED	LDA $ED7CB0,X	(L-hand)
C0/A0D7:	992016  	STA $1620,Y
C0/A0DA:	BFB17CED	LDA $ED7CB1,X	(Body)
C0/A0DE:	992116  	STA $1621,Y
C0/A0E1:	BFB27CED	LDA $ED7CB2,X	(Head)
C0/A0E5:	992216  	STA $1622,Y
C0/A0E8:	BFB37CED	LDA $ED7CB3,X	(Relic 1)
C0/A0EC:	992316  	STA $1623,Y
C0/A0EF:	BFB47CED	LDA $ED7CB4,X	(Relic 2)
C0/A0F3:	992416  	STA $1624,Y
C0/A0F6:	BFA07CED	LDA $ED7CA0,X	(Level 1 HP)
C0/A0FA:	990B16  	STA $160B,Y
C0/A0FD:	BFA17CED	LDA $ED7CA1,X	(Level 1 MP)
C0/A101:	990F16  	STA $160F,Y
C0/A104:	7B      	TDC 
C0/A105:	990C16  	STA $160C,Y    (max HP, high byte = 0)
C0/A108:	991016  	STA $1610,Y    (max MP, high byte = 0)
C0/A10B:	DA      	PHX
C0/A10C:	5A      	PHY
C0/A10D:	A5EC    	LDA $EC        (load parameter)
C0/A10F:	990016  	STA $1600,Y    (save character ID)
C0/A112:	20789F  	JSR $9F78      (determine starting level)
C0/A115:	7A      	PLY
C0/A116:	FA      	PLX
C0/A117:	990816  	STA $1608,Y    (Store to the level)
C0/A11A:	BFB57CED	LDA $ED7CB5,X  ("Level factor")
C0/A11E:	290C    	AND #$0C		(Isolate bits 2 and 3)
C0/A120:	4A      	LSR A			(Divide by 2)
C0/A121:	4A      	LSR A			(Divide by 2 again, now 4)
C0/A122:	AA      	TAX			(Put that into X)
C0/A123:	BF28A2C0	LDA $C0A228,X  (Load one of 4 constants, depending on the above isolation of bits)
C0/A127:	18      	CLC           (Clear the carry)
C0/A128:	790816  	ADC $1608,Y    (Add the level and this variable amount [0, 2, 5, or -3])
C0/A12B:	F002    	BEQ $A12F      (branch if level was 0)
C0/A12D:	1002    	BPL $A131      (branch if level is less than 128, note that if it is higher, it will wrap back to 0)
C0/A12F:	A901    	LDA #$01       (Min. Lev. 1)
C0/A131:	C963    	CMP #$63       (is the current level 99?)
C0/A133:	9002    	BCC $A137      (branch if less than 99)
C0/A135:	A963    	LDA #$63       (Trunc at 99)
C0/A137:	990816  	STA $1608,Y    (save as level)
C0/A13A:	207EA2  	JSR $A27E
C0/A13D:	B90B16  	LDA $160B,Y    (max HP, low byte)
C0/A140:	990916  	STA $1609,Y    (save as current HP, low byte)
C0/A143:	B90C16  	LDA $160C,Y    (max HP, high byte)
C0/A146:	990A16  	STA $160A,Y    (save as current HP, high byte)
C0/A149:	20BCA2  	JSR $A2BC
C0/A14C:	B90F16  	LDA $160F,Y    (max MP, low byte)
C0/A14F:	990D16  	STA $160D,Y    (save as current MP, low byte)
C0/A152:	B91016  	LDA $1610,Y    (max MP, high byte)
C0/A155:	990E16  	STA $160E,Y    (save as current MP, low byte)
C0/A158:	2035A2  	JSR $A235
C0/A15B:	BB      	TYX
C0/A15C:	20F09D  	JSR $9DF0
C0/A15F:	B97C08  	LDA $087C,Y
C0/A162:	29F0    	AND #$F0
C0/A164:	0901    	ORA #$01
C0/A166:	997C08  	STA $087C,Y
C0/A169:	B96808  	LDA $0868,Y
C0/A16C:	0901    	ORA #$01
C0/A16E:	996808  	STA $0868,Y
C0/A171:	A900    	LDA #$00
C0/A173:	996708  	STA $0867,Y
C0/A176:	9B      	TXY
C0/A177:	207FA1  	JSR $A17F		(Check Natural Abilities)
C0/A17A:	A903    	LDA #$03
C0/A17C:	4C5C9B  	JMP $9B5C


Teach Natural Abilities learned via Automatic Level-Up
C0/A17F:	B90016  	LDA $1600,Y    (character ID)
C0/A182:	C900    	CMP #$00       (is character Terra? note there's no need for this CMP here)
C0/A184:	F010    	BEQ $A196      (branch if so)
C0/A186:	C906    	CMP #$06       (is character Celes?)
C0/A188:	F02E    	BEQ $A1B8      (branch if so)
C0/A18A:	C902    	CMP #$02       (is character Cyan?)
C0/A18C:	F04C    	BEQ $A1DA      (branch if so)
C0/A18E:	C905    	CMP #$05       (is character Sabin?)
C0/A190:	D003    	BNE $A195      (branch if not)
C0/A192:	4C01A2  	JMP $A201
C0/A195:	60      	RTS
 
Fork: Terra's Spell list
C0/A196:	A600    	LDX $00
C0/A198:	BFC1E3EC	LDA $ECE3C1,X  (Natural Magic Level)
C0/A19C:	D90816  	CMP $1608,Y    (compare it to her current level)
C0/A19F:	F002    	BEQ $A1A3      (branch if they are the same)
C0/A1A1:	B0F2    	BCS $A195      (branch if her level is lower)
C0/A1A3:	5A      	PHY	
C0/A1A4:	BFC0E3EC	LDA $ECE3C0,X  (Natural Magic Spell)
C0/A1A8:	A8      	TAY
C0/A1A9:	A9FF    	LDA #$FF
C0/A1AB:	996E1A  	STA $1A6E,Y    (set spell as learned)
C0/A1AE:	7A      	PLY
C0/A1AF:	E8      	INX
C0/A1B0:	E8      	INX
C0/A1B1:	E02000  	CPX #$0020     (have we checked 16 spells yet?)
C0/A1B4:	F0DF    	BEQ $A195      (branch if so)
C0/A1B6:	80E0    	BRA $A198      (otherwise loop and keep learning)

Fork: Celes's Spell list
C0/A1B8:	A600    	LDX $00
C0/A1BA:	BFE1E3EC	LDA $ECE3E1,X  (Natural Magic Level)
C0/A1BE:	D90816  	CMP $1608,Y    (compare it to her current level)
C0/A1C1:	F002    	BEQ $A1C5      (branch if they are the same)
C0/A1C3:	B0D0    	BCS $A195      (branch if her level is lower)
C0/A1C5:	5A      	PHY
C0/A1C6:	BFE0E3EC	LDA $ECE3E0,X  (Natural Magic Spell)
C0/A1CA:	A8      	TAY
C0/A1CB:	A9FF    	LDA #$FF
C0/A1CD:	99B21B  	STA $1BB2,Y    (set spell as learned)
C0/A1D0:	7A      	PLY
C0/A1D1:	E8      	INX
C0/A1D2:	E8      	INX
C0/A1D3:	E02000  	CPX #$0020     (have we checked 16 spells yet?)
C0/A1D6:	F0BD    	BEQ $A195      (branch if so)
C0/A1D8:	80E0    	BRA $A1BA      (otherwise loop and keep learning)

Fork: Cyan's SwdTech list
C0/A1DA:	641B    	STZ $1B
C0/A1DC:	A600    	LDX $00
C0/A1DE:	BF90F4E6	LDA $E6F490,X	(Natural SwdTechs)
C0/A1E2:	D90816  	CMP $1608,Y
C0/A1E5:	F002    	BEQ $A1E9
C0/A1E7:	B00A    	BCS $A1F3
C0/A1E9:	E61B    	INC $1B
C0/A1EB:	E8      	INX
C0/A1EC:	E00800  	CPX #$0008
C0/A1EF:	F002    	BEQ $A1F3
C0/A1F1:	80EB    	BRA $A1DE
C0/A1F3:	A51B    	LDA $1B
C0/A1F5:	AA      	TAX
C0/A1F6:	ADF71C  	LDA $1CF7      (known SwdTech's)
C0/A1F9:	1F2CA2C0	ORA $C0A22C,X
C0/A1FD:	8DF71C  	STA $1CF7      (new known SwdTech's)
C0/A200:	60      	RTS
 
Fork: Sabin's Blitz list
C0/A201:	641B    	STZ $1B
C0/A203:	A600    	LDX $00
C0/A205:	BF98F4E6	LDA $E6F498,X  (Natural Blitzes)
C0/A209:	D90816  	CMP $1608,Y
C0/A20C:	F002    	BEQ $A210
C0/A20E:	B00A    	BCS $A21A
C0/A210:	E61B    	INC $1B
C0/A212:	E8      	INX
C0/A213:	E00800  	CPX #$0008
C0/A216:	F002    	BEQ $A21A
C0/A218:	80EB    	BRA $A205
C0/A21A:	A51B    	LDA $1B
C0/A21C:	AA      	TAX
C0/A21D:	AD281D  	LDA $1D28      (known Blitzes)
C0/A220:	1F2CA2C0	ORA $C0A22C,X
C0/A224:	8D281D  	STA $1D28      (new known Blitzes)
C0/A227:	60      	RTS
 
Data: Level factor adjustment from average
C0/A228:	00      	(add 0)
C0/A229:	02      	(add 2)
C0/A22A:	05      	(add 5)
C0/A22B:	FD      	(subtract 3)

Data: Bitfields to add SwdTechs/Blitzes
C0/A22C:	00      	(none)
C0/A22D:	01      	(Pummel/Dispatch)
C0/A22E:	03      	(Aura Bolt/Retort + above)
C0/A22F:	07      	(Suplex/Slash + above)
C0/A230:	0F      	(Fire Dance/Quadra Slam + above)
C0/A231:	1F      	(Mantra/Empowerer + above)
C0/A232:	3F      	(Air Blade/Stunner + above)
C0/A233:	7F      	(Spiraler/Quadra Slice + above)
C0/A234:	FF      	(Bum Rush/Cleave + above)

Determine new experience needed for the next level up
C0/A235:	B90816  	LDA $1608,Y    (level)
C0/A238:	851B    	STA $1B        (save it for now)
C0/A23A:	A600    	LDX $00        (#$0000)
C0/A23C:	862A    	STX $2A        ($2A = #$0000)
C0/A23E:	642C    	STZ $2C        ($2C = #$00)
C0/A240:	C61B    	DEC $1B        (decrement saved level)
C0/A242:	F018    	BEQ $A25C      (branch if it hit zero)
C0/A244:	C220    	REP #$20       (16 bit accum./memory)
C0/A246:	BF2082ED	LDA $ED8220,X  (Experience Needed for level up)
C0/A24A:	18      	CLC
C0/A24B:	652A    	ADC $2A        (add it)
C0/A24D:	852A    	STA $2A        (save it)
C0/A24F:	7B      	TDC 
C0/A250:	E220    	SEP #$20      	(8 bit accum./memory)
C0/A252:	A52C    	LDA $2C
C0/A254:	6900    	ADC #$00       (increment on the previous ADC's wrap)
C0/A256:	852C    	STA $2C        (save it)
C0/A258:	E8      	INX
C0/A259:	E8      	INX
C0/A25A:	80E4    	BRA $A240      (loop for every level needed to do, up to 98 in all)
C0/A25C:	062A    	ASL $2A        (low byte * 2)
C0/A25E:	262B    	ROL $2B        (rotate middle byte left 1 one, add in carry's status)
C0/A260:	262C    	ROL $2C        (rotate high byte left 1 one, add in carry's status)
C0/A262:	062A    	ASL $2A        (low byte * 2)
C0/A264:	262B    	ROL $2B        (rotate middle byte left 1 one, add in carry's status)
C0/A266:	262C    	ROL $2C        (rotate high byte left 1 one, add in carry's status)
C0/A268:	062A    	ASL $2A        (low byte * 2)
C0/A26A:	262B    	ROL $2B        (rotate middle byte left 1 one, add in carry's status)
C0/A26C:	262C    	ROL $2C        (rotate high byte left 1 one, add in carry's status)
                                               (what the above did was essentially multiply experience needed by 8)
C0/A26E:	A52A    	LDA $2A        (load experience needed, low byte)
C0/A270:	991116  	STA $1611,Y    (save new experience needed for level up, low byte)
C0/A273:	A52B    	LDA $2B        (load experience needed, middle byte)
C0/A275:	991216  	STA $1612,Y    (save new experience needed for level up, middle byte)
C0/A278:	A52C    	LDA $2C        (load experience needed, high byte)
C0/A27A:	991316  	STA $1613,Y    (save new experience needed for level up, high byte)
C0/A27D:	60      	RTS
 
C0/A27E:	A916    	LDA #$16       (22 = width of character startup struct)
C0/A280:	8D0242  	STA $4202
C0/A283:	B90016  	LDA $1600,Y    (character ID)
C0/A286:	8D0342  	STA $4203      (save as a multiplier)
C0/A289:	B90816  	LDA $1608,Y    (character level)
C0/A28C:	851B    	STA $1B        (save it for now)
C0/A28E:	641F    	STZ $1F        (zero out upper HP byte)
C0/A290:	AE1642  	LDX $4216
C0/A293:	BFA07CED	LDA $ED7CA0,X  (Initial HP)
C0/A297:	851E    	STA $1E        (save initial HP)
C0/A299:	A600    	LDX $00        (X = #$0000)
C0/A29B:	C61B    	DEC $1B        (decrement levels to do)
C0/A29D:	F012    	BEQ $A2B1      (branch if none left)
C0/A29F:	BFA0F4E6	LDA $E6F4A0,X  (HP mod. by level)
C0/A2A3:	18      	CLC
C0/A2A4:	651E    	ADC $1E        (add it with current HP)
C0/A2A6:	851E    	STA $1E        (save it)
C0/A2A8:	A51F    	LDA $1F        (load upper HP byte)
C0/A2AA:	6900    	ADC #$00       (incremented based on previous ADC)
C0/A2AC:	851F    	STA $1F        (save it)
C0/A2AE:	E8      	INX            (increment next level's value)
C0/A2AF:	80EA    	BRA $A29B      (...and loop)
C0/A2B1:	C221    	REP #$21
C0/A2B3:	A51E    	LDA $1E        (load HP)
C0/A2B5:	990B16  	STA $160B,Y    (save as max HP)
C0/A2B8:	7B      	TDC            (A = #$0000)
C0/A2B9:	E220    	SEP #$20      	(8 bit accum./memory)
C0/A2BB:	60      	RTS
 
C0/A2BC:	A916    	LDA #$16       (22 = width of character startup struct)
C0/A2BE:	8D0242  	STA $4202
C0/A2C1:	B90016  	LDA $1600,Y    (character ID)
C0/A2C4:	8D0342  	STA $4203      (save as a multiplier)
C0/A2C7:	B90816  	LDA $1608,Y    (character level)
C0/A2CA:	851B    	STA $1B        (save it for now)
C0/A2CC:	641F    	STZ $1F        (zero out upper MP byte)
C0/A2CE:	AE1642  	LDX $4216
C0/A2D1:	BFA17CED	LDA $ED7CA1,X  (Initial MP)
C0/A2D5:	851E    	STA $1E        (save initial HP)
C0/A2D7:	A600    	LDX $00        (X = #$0000)
C0/A2D9:	C61B    	DEC $1B
C0/A2DB:	F012    	BEQ $A2EF
C0/A2DD:	BF02F5E6	LDA $E6F502,X	(MP mod. by level)
C0/A2E1:	18      	CLC
C0/A2E2:	651E    	ADC $1E        (add it with current MP)
C0/A2E4:	851E    	STA $1E        (save it)
C0/A2E6:	A51F    	LDA $1F        (load upper MP byte)
C0/A2E8:	6900    	ADC #$00       (incremented based on previous ADC)
C0/A2EA:	851F    	STA $1F        (save it)
C0/A2EC:	E8      	INX           (increment next level's value)
C0/A2ED:	80EA    	BRA $A2D9      (...and loop)
C0/A2EF:	C221    	REP #$21
C0/A2F1:	A51E    	LDA $1E        (load MP)
C0/A2F3:	990F16  	STA $160F,Y    (save as max MP)
C0/A2F6:	7B      	TDC            (A = #$0000)
C0/A2F7:	E220    	SEP #$20      (8 bit accum./memory)
C0/A2F9:	60      	RTS
 

Show object XX
(gen. act. 41)

C0/A2FA:	20F09D  	JSR $9DF0	
C0/A2FD:	B96708  	LDA $0867,Y
C0/A300:	2940    	AND #$40
C0/A302:	F02D    	BEQ $A331
C0/A304:	B96708  	LDA $0867,Y
C0/A307:	3028    	BMI $A331
C0/A309:	0980    	ORA #$80
C0/A30B:	996708  	STA $0867,Y
C0/A30E:	B98008  	LDA $0880,Y
C0/A311:	29CF    	AND #$CF
C0/A313:	0920    	ORA #$20
C0/A315:	998008  	STA $0880,Y
C0/A318:	B98108  	LDA $0881,Y
C0/A31B:	29CF    	AND #$CF
C0/A31D:	0920    	ORA #$20
C0/A31F:	998108  	STA $0881,Y
C0/A322:	A5EB    	LDA $EB
C0/A324:	C910    	CMP #$10
C0/A326:	B009    	BCS $A331
C0/A328:	A8      	TAY
C0/A329:	B95018  	LDA $1850,Y
C0/A32C:	0980    	ORA #$80
C0/A32E:	995018  	STA $1850,Y
C0/A331:	A902    	LDA #$02
C0/A333:	4C5C9B  	JMP $9B5C


Hide object XX
(gen. act. 42)

C0/A336:	20F09D  	JSR $9DF0
C0/A339:	B96708  	LDA $0867,Y
C0/A33C:	297F    	AND #$7F
C0/A33E:	996708  	STA $0867,Y
C0/A341:	7B      	TDC 
C0/A342:	997D08  	STA $087D,Y
C0/A345:	BE7A08  	LDX $087A,Y
C0/A348:	A9FF    	LDA #$FF
C0/A34A:	9F00207E	STA $7E2000,X
C0/A34E:	B97C08  	LDA $087C,Y
C0/A351:	29F0    	AND #$F0
C0/A353:	997C08  	STA $087C,Y
C0/A356:	A5EB    	LDA $EB
C0/A358:	C910    	CMP #$10
C0/A35A:	B009    	BCS $A365
C0/A35C:	A8      	TAY
C0/A35D:	B95018  	LDA $1850,Y
C0/A360:	297F    	AND #$7F
C0/A362:	995018  	STA $1850,Y
C0/A365:	A902    	LDA #$02
C0/A367:	4C5C9B  	JMP $9B5C


(gen. act. 79)

C0/A36A:	A400    	LDY $00	
C0/A36C:	B96708  	LDA $0867,Y
C0/A36F:	2940    	AND #$40
C0/A371:	F013    	BEQ $A386
C0/A373:	B96708  	LDA $0867,Y
C0/A376:	2907    	AND #$07
C0/A378:	C5EB    	CMP $EB
C0/A37A:	D00A    	BNE $A386
C0/A37C:	C220    	REP #$20      (16 bit accum./memory)
C0/A37E:	A5EC    	LDA $EC
C0/A380:	998D08  	STA $088D,Y
C0/A383:	7B      	TDC 
C0/A384:	E220    	SEP #$20      (8 bit accum./memory)
C0/A386:	C221    	REP #$21
C0/A388:	98      	TYA
C0/A389:	692900  	ADC #$0029
C0/A38C:	A8      	TAY
C0/A38D:	7B      	TDC 
C0/A38E:	E220    	SEP #$20      (8 bit accum./memory)
C0/A390:	C09002  	CPY #$0290
C0/A393:	D0D7    	BNE $A36C
C0/A395:	A904    	LDA #$04
C0/A397:	4C5C9B  	JMP $9B5C

Move the characters to (xx, yy) on the current map
(gen. act. 7E)
C0/A39A:	C220    	REP #$20      (16 bit accum./memory)
C0/A39C:	A5EB    	LDA $EB
C0/A39E:	29FF00  	AND #$00FF
C0/A3A1:	0A      	ASL A
C0/A3A2:	0A      	ASL A
C0/A3A3:	0A      	ASL A
C0/A3A4:	0A      	ASL A
C0/A3A5:	8526    	STA $26
C0/A3A7:	A5EC    	LDA $EC
C0/A3A9:	29FF00  	AND #$00FF
C0/A3AC:	0A      	ASL A
C0/A3AD:	0A      	ASL A
C0/A3AE:	0A      	ASL A
C0/A3AF:	0A      	ASL A
C0/A3B0:	8528    	STA $28
C0/A3B2:	7B      	TDC 
C0/A3B3:	E220    	SEP #$20      (8 bit accum./memory)
C0/A3B5:	A400    	LDY $00
C0/A3B7:	641B    	STZ $1B
C0/A3B9:	B96708  	LDA $0867,Y
C0/A3BC:	2940    	AND #$40
C0/A3BE:	F03A    	BEQ $A3FA
C0/A3C0:	B96708  	LDA $0867,Y
C0/A3C3:	2907    	AND #$07
C0/A3C5:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/A3C8:	D030    	BNE $A3FA
C0/A3CA:	BE7A08  	LDX $087A,Y
C0/A3CD:	BF00207E	LDA $7E2000,X
C0/A3D1:	C51B    	CMP $1B
C0/A3D3:	D006    	BNE $A3DB
C0/A3D5:	A9FF    	LDA #$FF
C0/A3D7:	9F00207E	STA $7E2000,X
C0/A3DB:	C220    	REP #$20      (16 bit accum./memory)
C0/A3DD:	A526    	LDA $26
C0/A3DF:	996A08  	STA $086A,Y
C0/A3E2:	A528    	LDA $28
C0/A3E4:	996D08  	STA $086D,Y
C0/A3E7:	7B      	TDC 
C0/A3E8:	E220    	SEP #$20      (8 bit accum./memory)
C0/A3EA:	996908  	STA $0869,Y
C0/A3ED:	996C08  	STA $086C,Y
C0/A3F0:	A5EB    	LDA $EB
C0/A3F2:	997A08  	STA $087A,Y
C0/A3F5:	A5EC    	LDA $EC
C0/A3F7:	997B08  	STA $087B,Y
C0/A3FA:	C221    	REP #$21
C0/A3FC:	98      	TYA
C0/A3FD:	692900  	ADC #$0029
C0/A400:	A8      	TAY
C0/A401:	7B      	TDC 
C0/A402:	E220    	SEP #$20      (8 bit accum./memory)
C0/A404:	E61B    	INC $1B
C0/A406:	E61B    	INC $1B
C0/A408:	C09002  	CPY #$0290
C0/A40B:	D0AC    	BNE $A3B9
C0/A40D:	A901    	LDA #$01
C0/A40F:	8558    	STA $58
C0/A411:	A5EB    	LDA $EB
C0/A413:	8DC01F  	STA $1FC0
C0/A416:	8D661F  	STA $1F66
C0/A419:	A5EC    	LDA $EC
C0/A41B:	8DC11F  	STA $1FC1
C0/A41E:	8D671F  	STA $1F67
C0/A421:	A901    	LDA #$01
C0/A423:	8584    	STA $84
C0/A425:	A903    	LDA #$03
C0/A427:	4C709B  	JMP $9B70

Modify entity event--call $aaaaaa+$CA0000 when triggered
(gen. act. 7A)
C0/A42A:	20F09D  	JSR $9DF0
C0/A42D:	A5EC    	LDA $EC
C0/A42F:	998908  	STA $0889,Y
C0/A432:	A5ED    	LDA $ED
C0/A434:	998A08  	STA $088A,Y
C0/A437:	A5EE    	LDA $EE
C0/A439:	998B08  	STA $088B,Y
C0/A43C:	A905    	LDA #$05
C0/A43E:	4C5C9B  	JMP $9B5C

C0/A441:	AD5D05  	LDA $055D
C0/A444:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/A447:	F007    	BEQ $A450
C0/A449:	3A      	DEC A
C0/A44A:	8D6D1A  	STA $1A6D		(Store to active party)
C0/A44D:	20776D  	JSR $6D77
C0/A450:	A901    	LDA #$01
C0/A452:	4C5C9B  	JMP $9B5C

C0/A455:	20F09D  	JSR $9DF0
C0/A458:	B97C08  	LDA $087C,Y
C0/A45B:	0940    	ORA #$40
C0/A45D:	997C08  	STA $087C,Y
C0/A460:	A902    	LDA #$02
C0/A462:	4C5C9B  	JMP $9B5C

C0/A465:	20F09D  	JSR $9DF0
C0/A468:	B97C08  	LDA $087C,Y
C0/A46B:	29BF    	AND #$BF
C0/A46D:	997C08  	STA $087C,Y
C0/A470:	A902    	LDA #$02
C0/A472:	4C5C9B  	JMP $9B5C

Display dialogue message xxxx, continue executing commands 
(gen. act. 48)
C0/A475:	C220    	REP #$20      (16 bit accum./memory)
C0/A477:	A5EB    	LDA $EB
C0/A479:	29FF1F  	AND #$1FFF
C0/A47C:	85D0    	STA $D0
C0/A47E:	7B      	TDC 
C0/A47F:	E220    	SEP #$20      (8 bit accum./memory)
C0/A481:	A5EC    	LDA $EC
C0/A483:	3004    	BMI $A489
C0/A485:	A901    	LDA #$01
C0/A487:	8002    	BRA $A48B
C0/A489:	A912    	LDA #$12
C0/A48B:	85BC    	STA $BC
C0/A48D:	A5EC    	LDA $EC
C0/A48F:	2940    	AND #$40
C0/A491:	4A      	LSR A
C0/A492:	4A      	LSR A
C0/A493:	4A      	LSR A
C0/A494:	4A      	LSR A
C0/A495:	4A      	LSR A
C0/A496:	4A      	LSR A
C0/A497:	8D6405  	STA $0564
C0/A49A:	20BF7F  	JSR $7FBF	(Dialogue message loading function)
C0/A49D:	A901    	LDA #$01
C0/A49F:	85BA    	STA $BA	(Dialogue box open = true)
C0/A4A1:	A903    	LDA #$03
C0/A4A3:	4C5C9B  	JMP $9B5C

If dialogue window is up, wait for keypress then dismiss
(gen. act. 49)
C0/A4A6:	A5BA    	LDA $BA	 
C0/A4A8:	F001    	BEQ $A4AB
C0/A4AA:	60      	RTS
 
C0/A4AB:	A901    	LDA #$01	(from C0/A4A8)
C0/A4AD:	4C5C9B  	JMP $9B5C


(gen. act. 4A)
C0/A4B0:	A5D3    	LDA $D3
C0/A4B2:	C901    	CMP #$01
C0/A4B4:	F001    	BEQ $A4B7
C0/A4B6:	60      	RTS
 
C0/A4B7:	A901    	LDA #$01	(from C0/A4B4)
C0/A4B9:	4C5C9B  	JMP $9B5C


Display dialogue message xxxx, halt execution until gone
      If xxxx & 0x4000, only the text will be shown (no dialogue window)
      If xxxx & 0x8000, the text will be shown at the bottom of the screen
(gen. act. 4B)
C0/A4BC:	C220    	REP #$20      (16 bit accum./memory)
C0/A4BE:	A5EB    	LDA $EB
C0/A4C0:	29FF1F  	AND #$1FFF
C0/A4C3:	85D0    	STA $D0
C0/A4C5:	7B      	TDC 
C0/A4C6:	E220    	SEP #$20      (8 bit accum./memory)
C0/A4C8:	A5EC    	LDA $EC
C0/A4CA:	3004    	BMI $A4D0
C0/A4CC:	A901    	LDA #$01
C0/A4CE:	8002    	BRA $A4D2
C0/A4D0:	A912    	LDA #$12
C0/A4D2:	85BC    	STA $BC
C0/A4D4:	A5EC    	LDA $EC
C0/A4D6:	2940    	AND #$40
C0/A4D8:	4A      	LSR A
C0/A4D9:	4A      	LSR A
C0/A4DA:	4A      	LSR A
C0/A4DB:	4A      	LSR A
C0/A4DC:	4A      	LSR A
C0/A4DD:	4A      	LSR A
C0/A4DE:	8D6405  	STA $0564
C0/A4E1:	20BF7F  	JSR $7FBF      (Dialogue message loading function)
C0/A4E4:	A901    	LDA #$01
C0/A4E6:	85BA    	STA $BA        (Dialogue box open = true)
C0/A4E8:	A901    	LDA #$01
C0/A4EA:	85EB    	STA $EB
C0/A4EC:	A900    	LDA #$00
C0/A4EE:	85EC    	STA $EC
C0/A4F0:	A900    	LDA #$00
C0/A4F2:	85ED    	STA $ED
C0/A4F4:	A903    	LDA #$03
C0/A4F6:	4CA3B1  	JMP $B1A3

Invoke random battle, used for dungeons/towns, etc
(gen. act. 4E)
C0/A4F9:	E656    	INC $56	
C0/A4FB:	9C8A07  	STZ $078A
C0/A4FE:	A901    	LDA #$01
C0/A500:	4C709B  	JMP $9B70

Invoke Colosseum battle
(gen. act. AF)
C0/A503:	AD0102  	LDA $0201      (load usage bits, tent, warp stone, etc)
C0/A506:	D00D    	BNE $A515      (branch if not 0)
C0/A508:	A23F02  	LDX #$023F     (formation 575)
C0/A50B:	ADD71E  	LDA $1ED7
C0/A50E:	29F7    	AND #$F7
C0/A510:	8DD71E  	STA $1ED7
C0/A513:	800B    	BRA $A520
C0/A515:	A23E02  	LDX #$023E     (formation 574, used for the Shadow Colosseum battle)
C0/A518:	ADD71E  	LDA $1ED7      (load event bits)
C0/A51B:	0908    	ORA #$08
C0/A51D:	8DD71E  	STA $1ED7
C0/A520:	C220    	REP #$20      (16 bit accum./memory)
C0/A522:	8A      	TXA
C0/A523:	8FE01100	STA $0011E0    (save formation)
C0/A527:	A91C00  	LDA #$001C
C0/A52A:	8FE21100	STA $0011E2    (save background)
C0/A52E:	7B      	TDC 
C0/A52F:	E220    	SEP #$20      (8 bit accum./memory)
C0/A531:	A9C0    	LDA #$C0
C0/A533:	8DFA11  	STA $11FA
C0/A536:	ADD71E  	LDA $1ED7      (load event bits)
C0/A539:	2910    	AND #$10       (filter out all bits except bit 4)
C0/A53B:	4A      	LSR A          (move it to bit 3)
C0/A53C:	8FE41100	STA $0011E4
C0/A540:	A901    	LDA #$01
C0/A542:	8556    	STA $56
C0/A544:	A9C0    	LDA #$C0
C0/A546:	8D8A07  	STA $078A
C0/A549:	A901    	LDA #$01
C0/A54B:	4C709B  	JMP $9B70

Invoke Battle: Enemy formation set obtained by a MiaB chest, Background is area default
(gen. act. 8E)
C0/A54E:	AD8907  	LDA $0789	
C0/A551:	85EB    	STA $EB
C0/A553:	A93F    	LDA #$3F
C0/A555:	85EC    	STA $EC      (background is area default?)
C0/A557:	20A7A5  	JSR $A5A7
C0/A55A:	AE4105  	LDX $0541
C0/A55D:	8E661F  	STX $1F66
C0/A560:	AEAF00  	LDX $00AF
C0/A563:	8EC01F  	STX $1FC0
C0/A566:	A9C0    	LDA #$C0
C0/A568:	8DFA11  	STA $11FA
C0/A56B:	A901    	LDA #$01
C0/A56D:	4C709B  	JMP $9B70


(gen. act. 82)
C0/A570:	A901    	LDA #$01	
C0/A572:	8D5D05  	STA $055D
C0/A575:	4C5C9B  	JMP $9B5C

Invoke Battle: Enemy Formation Set xx, Background bb
(gen. act. 4D)
C0/A578:	20A7A5  	JSR $A5A7	
C0/A57B:	AE4105  	LDX $0541
C0/A57E:	8E661F  	STX $1F66
C0/A581:	AEAF00  	LDX $00AF
C0/A584:	8EC01F  	STX $1FC0
C0/A587:	A9E0    	LDA #$E0
C0/A589:	8DFA11  	STA $11FA
C0/A58C:	A903    	LDA #$03
C0/A58E:	4C709B  	JMP $9B70

Invoke Battle: Enemy Formation Set xx, Background bb, center camera on party
(gen. act. 4C)
C0/A591:	20A7A5  	JSR $A5A7	
C0/A594:	AE5705  	LDX $0557
C0/A597:	8E661F  	STX $1F66
C0/A59A:	8EC01F  	STX $1FC0
C0/A59D:	A9C0    	LDA #$C0
C0/A59F:	8DFA11  	STA $11FA
C0/A5A2:	A903    	LDA #$03
C0/A5A4:	4C709B  	JMP $9B70


C0/A5A7:	A5EB    	LDA $EB
C0/A5A9:	C220    	REP #$20       (16 bit accum./memory)
C0/A5AB:	0A      	ASL A
C0/A5AC:	0A      	ASL A
C0/A5AD:	AA      	TAX
C0/A5AE:	7B      	TDC 
C0/A5AF:	E220    	SEP #$20       (8 bit accum./memory)
C0/A5B1:	2096C4  	JSR $C496
C0/A5B4:	C9C0    	CMP #$C0
C0/A5B6:	9002    	BCC $A5BA
C0/A5B8:	E8      	INX
C0/A5B9:	E8      	INX
C0/A5BA:	C220    	REP #$20       (16 bit accum./memory)
C0/A5BC:	BF0050CF	LDA $CF5000,X  (Monster formations used in event scripts)
C0/A5C0:	8FE01100	STA $0011E0    (save formation)
C0/A5C4:	7B      	TDC 
C0/A5C5:	E220    	SEP #$20       (8 bit accum./memory)
C0/A5C7:	A5EC    	LDA $EC        ; background type, props
C0/A5C9:	29C0    	AND #$C0       ; isolate "Disable Blur", "Disable SFX"
C0/A5CB:	8D8A07  	STA $078A      ; set ^
C0/A5CE:	A5EC    	LDA $EC        (Load the background parameter)
C0/A5D0:	293F    	AND #$3F       (Zero out the upper A bits)
C0/A5D2:	C93F    	CMP #$3F       (Is it #$3F [the area default]?)
C0/A5D4:	D005    	BNE $A5DB      (Branch if not)
C0/A5D6:	AD2205  	LDA $0522      (Apparently this holds the area default background index)
C0/A5D9:	297F    	AND #$7F       (Zero out bit 7)
C0/A5DB:	8FE21100	STA $0011E2    (save background)
C0/A5DF:	7B      	TDC 
C0/A5E0:	8FE31100	STA $0011E3
C0/A5E4:	ADD71E  	LDA $1ED7
C0/A5E7:	2910    	AND #$10
C0/A5E9:	4A      	LSR A
C0/A5EA:	8FE41100	STA $0011E4
C0/A5EE:	A901    	LDA #$01
C0/A5F0:	8556    	STA $56
C0/A5F2:	60      	RTS
 

Exit current location
(gen. act. 4F)

C0/A5F3:	A901    	LDA #$01
C0/A5F5:	8DF111  	STA $11F1
C0/A5F8:	A901    	LDA #$01       (A already holds this!)
C0/A5FA:	4C709B  	JMP $9B70


Tint screen (cumulative)
(gen. act. 50)

C0/A5FD:	A908    	LDA #$08	
C0/A5FF:	85DF    	STA $DF
C0/A601:	A9F0    	LDA #$F0
C0/A603:	85E0    	STA $E0
C0/A605:	200BA7  	JSR $A70B
C0/A608:	3A      	DEC A
C0/A609:	D005    	BNE $A610
C0/A60B:	204711  	JSR $1147
C0/A60E:	802B    	BRA $A63B
C0/A610:	3A      	DEC A
C0/A611:	D005    	BNE $A618
C0/A613:	208912  	JSR $1289
C0/A616:	8023    	BRA $A63B
C0/A618:	3A      	DEC A
C0/A619:	D005    	BNE $A620
C0/A61B:	208B11  	JSR $118B
C0/A61E:	801B    	BRA $A63B
C0/A620:	3A      	DEC A
C0/A621:	D005    	BNE $A628
C0/A623:	20E511  	JSR $11E5
C0/A626:	8013    	BRA $A63B
C0/A628:	3A      	DEC A
C0/A629:	D005    	BNE $A630
C0/A62B:	20E512  	JSR $12E5
C0/A62E:	800B    	BRA $A63B
C0/A630:	3A      	DEC A
C0/A631:	D005    	BNE $A638
C0/A633:	202F12  	JSR $122F
C0/A636:	8003    	BRA $A63B
C0/A638:	204413  	JSR $1344
C0/A63B:	A902    	LDA #$02
C0/A63D:	4C709B  	JMP $9B70


Modify BG color range from [pb, pe]
(gen. act. 51)

C0/A640:	A5EC    	LDA $EC	
C0/A642:	0A      	ASL A
C0/A643:	85DF    	STA $DF
C0/A645:	A5ED    	LDA $ED
C0/A647:	1A      	INC A
C0/A648:	0A      	ASL A
C0/A649:	85E0    	STA $E0
C0/A64B:	200BA7  	JSR $A70B
C0/A64E:	3A      	DEC A
C0/A64F:	D005    	BNE $A656
C0/A651:	204711  	JSR $1147
C0/A654:	802B    	BRA $A681
C0/A656:	3A      	DEC A
C0/A657:	D005    	BNE $A65E
C0/A659:	208912  	JSR $1289
C0/A65C:	8023    	BRA $A681
C0/A65E:	3A      	DEC A
C0/A65F:	D005    	BNE $A666
C0/A661:	208B11  	JSR $118B
C0/A664:	801B    	BRA $A681
C0/A666:	3A      	DEC A
C0/A667:	D005    	BNE $A66E
C0/A669:	20E511  	JSR $11E5
C0/A66C:	8013    	BRA $A681
C0/A66E:	3A      	DEC A
C0/A66F:	D005    	BNE $A676
C0/A671:	20E512  	JSR $12E5
C0/A674:	800B    	BRA $A681
C0/A676:	3A      	DEC A
C0/A677:	D005    	BNE $A67E
C0/A679:	202F12  	JSR $122F
C0/A67C:	8003    	BRA $A681
C0/A67E:	204413  	JSR $1344
C0/A681:	A904    	LDA #$04
C0/A683:	4C709B  	JMP $9B70


Tint objects (cumulative)
(gen. act. 52)

C0/A686:	64DF    	STZ $DF	
C0/A688:	64E0    	STZ $E0
C0/A68A:	200BA7  	JSR $A70B
C0/A68D:	3A      	DEC A
C0/A68E:	D005    	BNE $A695
C0/A690:	208F13  	JSR $138F
C0/A693:	802B    	BRA $A6C0
C0/A695:	3A      	DEC A
C0/A696:	D005    	BNE $A69D
C0/A698:	20D114  	JSR $14D1
C0/A69B:	8023    	BRA $A6C0
C0/A69D:	3A      	DEC A
C0/A69E:	D005    	BNE $A6A5
C0/A6A0:	20D313  	JSR $13D3
C0/A6A3:	801B    	BRA $A6C0
C0/A6A5:	3A      	DEC A
C0/A6A6:	D005    	BNE $A6AD
C0/A6A8:	202D14  	JSR $142D
C0/A6AB:	8013    	BRA $A6C0
C0/A6AD:	3A      	DEC A
C0/A6AE:	D005    	BNE $A6B5
C0/A6B0:	202D15  	JSR $152D
C0/A6B3:	800B    	BRA $A6C0
C0/A6B5:	3A      	DEC A
C0/A6B6:	D005    	BNE $A6BD
C0/A6B8:	207714  	JSR $1477
C0/A6BB:	8003    	BRA $A6C0
C0/A6BD:	208C15  	JSR $158C
C0/A6C0:	A902    	LDA #$02
C0/A6C2:	4C709B  	JMP $9B70


Modify Object color range [pb, pe]
(gen. act. 53)

C0/A6C5:	A5EC    	LDA $EC	
C0/A6C7:	0A      	ASL A
C0/A6C8:	85DF    	STA $DF
C0/A6CA:	A5ED    	LDA $ED
C0/A6CC:	1A      	INC A
C0/A6CD:	0A      	ASL A
C0/A6CE:	85E0    	STA $E0
C0/A6D0:	200BA7  	JSR $A70B
C0/A6D3:	3A      	DEC A
C0/A6D4:	D005    	BNE $A6DB
C0/A6D6:	208F13  	JSR $138F
C0/A6D9:	802B    	BRA $A706
C0/A6DB:	3A      	DEC A
C0/A6DC:	D005    	BNE $A6E3
C0/A6DE:	20D114  	JSR $14D1
C0/A6E1:	8023    	BRA $A706
C0/A6E3:	3A      	DEC A
C0/A6E4:	D005    	BNE $A6EB
C0/A6E6:	20D313  	JSR $13D3
C0/A6E9:	801B    	BRA $A706
C0/A6EB:	3A      	DEC A
C0/A6EC:	D005    	BNE $A6F3
C0/A6EE:	202D14  	JSR $142D
C0/A6F1:	8013    	BRA $A706
C0/A6F3:	3A      	DEC A
C0/A6F4:	D005    	BNE $A6FB
C0/A6F6:	202D15  	JSR $152D
C0/A6F9:	800B    	BRA $A706
C0/A6FB:	3A      	DEC A
C0/A6FC:	D005    	BNE $A703
C0/A6FE:	207714  	JSR $1477
C0/A701:	8003    	BRA $A706
C0/A703:	208C15  	JSR $158C
C0/A706:	A904    	LDA #$04
C0/A708:	4C709B  	JMP $9B70


C0/A70B:	641A    	STZ $1A
C0/A70D:	641B    	STZ $1B
C0/A70F:	6420    	STZ $20
C0/A711:	6421    	STZ $21
C0/A713:	A5EB    	LDA $EB
C0/A715:	2903    	AND #$03
C0/A717:	0A      	ASL A
C0/A718:	AA      	TAX
C0/A719:	A5EB    	LDA $EB
C0/A71B:	2910    	AND #$10
C0/A71D:	F006    	BEQ $A725
C0/A71F:	BF6CA7C0	LDA $C0A76C,X
C0/A723:	851A    	STA $1A
C0/A725:	A5EB    	LDA $EB
C0/A727:	2908    	AND #$08
C0/A729:	F00B    	BEQ $A736
C0/A72B:	C220    	REP #$20      (16 bit accum./memory)
C0/A72D:	BF7CA7C0	LDA $C0A77C,X
C0/A731:	8520    	STA $20
C0/A733:	7B      	TDC 
C0/A734:	E220    	SEP #$20      (8 bit accum./memory)
C0/A736:	A5EB    	LDA $EB
C0/A738:	2904    	AND #$04
C0/A73A:	F006    	BEQ $A742
C0/A73C:	BF74A7C0	LDA $C0A774,X
C0/A740:	851B    	STA $1B
C0/A742:	A5EB    	LDA $EB
C0/A744:	101E    	BPL $A764
C0/A746:	A51A    	LDA $1A
C0/A748:	4502    	EOR $02
C0/A74A:	291F    	AND #$1F
C0/A74C:	851A    	STA $1A
C0/A74E:	A51B    	LDA $1B
C0/A750:	4502    	EOR $02
C0/A752:	297C    	AND #$7C
C0/A754:	851B    	STA $1B
C0/A756:	C220    	REP #$20      (16 bit accum./memory)
C0/A758:	A520    	LDA $20
C0/A75A:	4502    	EOR $02
C0/A75C:	29E003  	AND #$03E0
C0/A75F:	8520    	STA $20
C0/A761:	7B      	TDC 
C0/A762:	E220    	SEP #$20      (8 bit accum./memory)
C0/A764:	A5EB    	LDA $EB
C0/A766:	4A      	LSR A
C0/A767:	4A      	LSR A
C0/A768:	4A      	LSR A
C0/A769:	4A      	LSR A
C0/A76A:	4A      	LSR A
C0/A76B:	60      	RTS
 

C0/A76C:	0400    	TSB $00
C0/A76E:	08      	PHP 
C0/A76F:	0010    	BRK #$10
C0/A771:	001F    	BRK #$1F
C0/A773:	0010    	BRK #$10
C0/A775:	0020    	BRK #$20
C0/A777:	0040    	BRK #$40
C0/A779:	007C    	BRK #$7C
C0/A77B:	0080    	BRK #$80
C0/A77D:	0000    	BRK #$00
C0/A77F:	0100    	ORA ($00,X)
C0/A781:	02E0    	COP #$E0
C0/A783:	03	


(gen. act. 54)

C0/A784:	644D		STZ $4D	
C0/A786:	644B    	STZ $4B
C0/A788:	A54F    	LDA $4F
C0/A78A:	854E    	STA $4E
C0/A78C:	A553    	LDA $53
C0/A78E:	8552    	STA $52
C0/A790:	A901    	LDA #$01
C0/A792:	4C5C9B  	JMP $9B5C

Color components are: (used below)
2: Red                      A: Red + Blue (Magenta)
4: Green                    C: Green + Blue (Cyan)
6: Red + Green (Yellow)     E: Red + Green + Blue (White)
8: Blue


Flash screen with color component(s) c, intensity i, each a nibble
(gen. act. 55)

C0/A795:	A54D    	LDA $4D	
C0/A797:	D00A    	BNE $A7A3
C0/A799:	A54E    	LDA $4E
C0/A79B:	854F    	STA $4F
C0/A79D:	A552    	LDA $52
C0/A79F:	8553    	STA $53
C0/A7A1:	6452    	STZ $52
C0/A7A3:	A907    	LDA #$07
C0/A7A5:	854E    	STA $4E
C0/A7A7:	A5EB    	LDA $EB
C0/A7A9:	29E0    	AND #$E0
C0/A7AB:	8554    	STA $54
C0/A7AD:	A9F8    	LDA #$F8
C0/A7AF:	854D    	STA $4D
C0/A7B1:	A908    	LDA #$08
C0/A7B3:	854B    	STA $4B
C0/A7B5:	A902    	LDA #$02
C0/A7B7:	4C5C9B  	JMP $9B5C


Increase color component(s) c, intensity i, each a nibble
(gen. act. 56)

C0/A7BA:	A54D    	LDA $4D	
C0/A7BC:	D007    	BNE $A7C5
C0/A7BE:	A5EB    	LDA $EB
C0/A7C0:	202B10  	JSR $102B
C0/A7C3:	8006    	BRA $A7CB
C0/A7C5:	A54B    	LDA $4B
C0/A7C7:	297F    	AND #$7F
C0/A7C9:	854B    	STA $4B
C0/A7CB:	A902    	LDA #$02
C0/A7CD:	4C5C9B  	JMP $9B5C


Decrease color component(s) c, intensity i, each a nibble
(gen. act. 57)

C0/A7D0:	A54D    	LDA $4D	
C0/A7D2:	D007    	BNE $A7DB
C0/A7D4:	A5EB    	LDA $EB
C0/A7D6:	203D10  	JSR $103D
C0/A7D9:	8006    	BRA $A7E1
C0/A7DB:	A54B    	LDA $4B
C0/A7DD:	297F    	AND #$7F
C0/A7DF:	854B    	STA $4B
C0/A7E1:	A902    	LDA #$02
C0/A7E3:	4C5C9B  	JMP $9B5C


Shake the screen (xx?)
(gen. act. 58)

C0/A7E6:	A5EB    	LDA $EB	
C0/A7E8:	8D4A07  	STA $074A
C0/A7EB:	A902    	LDA #$02
C0/A7ED:	4C5C9B  	JMP $9B5C


Refresh Screen
(gen. act. 96)

C0/A7F0:	A910    	LDA #$10	
C0/A7F2:	854A    	STA $4A
C0/A7F4:	A910    	LDA #$10
C0/A7F6:	854C    	STA $4C
C0/A7F8:	A901    	LDA #$01
C0/A7FA:	4C5C9B  	JMP $9B5C


Fade Screen Full
(gen. act. 97)

C0/A7FD:	A990    	LDA #$90
C0/A7FF:	854A    	STA $4A
C0/A801:	A9F0    	LDA #$F0
C0/A803:	854C    	STA $4C
C0/A805:	A901    	LDA #$01
C0/A807:	4C5C9B  	JMP $9B5C


Unfade the screen at speed x
(gen. act. 59)

C0/A80A:	A5EB    	LDA $EB	
C0/A80C:	854A    	STA $4A
C0/A80E:	A910    	LDA #$10
C0/A810:	854C    	STA $4C
C0/A812:	A902    	LDA #$02
C0/A814:	4C5C9B  	JMP $9B5C


Fade the screen at speed x
(gen. act. 5A)

C0/A817:	A5EB    	LDA $EB	
C0/A819:	0980    	ORA #$80
C0/A81B:	854A    	STA $4A
C0/A81D:	A9F0    	LDA #$F0
C0/A81F:	854C    	STA $4C
C0/A821:	A902    	LDA #$02
C0/A823:	4C5C9B  	JMP $9B5C


(gen. act. 5B)

C0/A826:	644A    	STZ $4A	
C0/A828:	A901    	LDA #$01
C0/A82A:	4C5C9B  	JMP $9B5C


(gen. act. 5C)

C0/A82D:	A5E1    	LDA $E1	
C0/A82F:	0940    	ORA #$40
C0/A831:	85E1    	STA $E1
C0/A833:	A901    	LDA #$01
C0/A835:	4C5C9B  	JMP $9B5C


Scroll BG0, speed xx x yy (00 --> 7F left/up, 80 <-- FF right/down)
(gen. act. 5D)

C0/A838:	A5EB    	LDA $EB
C0/A83A:	300E    	BMI $A84A
C0/A83C:	C220    	REP #$20      (16 bit accum./memory)
C0/A83E:	0A      	ASL A
C0/A83F:	0A      	ASL A
C0/A840:	0A      	ASL A
C0/A841:	0A      	ASL A
C0/A842:	8D4705  	STA $0547
C0/A845:	7B      	TDC 
C0/A846:	E220    	SEP #$20      (8 bit accum./memory)
C0/A848:	8010    	BRA $A85A
C0/A84A:	4502    	EOR $02
C0/A84C:	C220    	REP #$20      (16 bit accum./memory)
C0/A84E:	0A      	ASL A
C0/A84F:	0A      	ASL A
C0/A850:	0A      	ASL A
C0/A851:	0A      	ASL A
C0/A852:	4502    	EOR $02
C0/A854:	8D4705  	STA $0547
C0/A857:	7B      	TDC 
C0/A858:	E220    	SEP #$20      (8 bit accum./memory)
C0/A85A:	A5EC    	LDA $EC
C0/A85C:	300E    	BMI $A86C
C0/A85E:	C220    	REP #$20      (16 bit accum./memory)
C0/A860:	0A      	ASL A
C0/A861:	0A      	ASL A
C0/A862:	0A      	ASL A
C0/A863:	0A      	ASL A
C0/A864:	8D4905  	STA $0549
C0/A867:	7B      	TDC 
C0/A868:	E220    	SEP #$20      (8 bit accum./memory)
C0/A86A:	8010    	BRA $A87C
C0/A86C:	4502    	EOR $02
C0/A86E:	C220    	REP #$20      (16 bit accum./memory)
C0/A870:	0A      	ASL A
C0/A871:	0A      	ASL A
C0/A872:	0A      	ASL A
C0/A873:	0A      	ASL A
C0/A874:	4502    	EOR $02
C0/A876:	8D4905  	STA $0549
C0/A879:	7B      	TDC 
C0/A87A:	E220    	SEP #$20      (8 bit accum./memory)
C0/A87C:	A903    	LDA #$03
C0/A87E:	4C5C9B  	JMP $9B5C


Scroll Background 0
(gen. act. 70)

C0/A881:	A5EB    	LDA $EB
C0/A883:	300E    	BMI $A893
C0/A885:	C220    	REP #$20      (16 bit accum./memory)
C0/A887:	0A      	ASL A
C0/A888:	0A      	ASL A
C0/A889:	0A      	ASL A
C0/A88A:	0A      	ASL A
C0/A88B:	8D4705  	STA $0547
C0/A88E:	7B      	TDC 
C0/A88F:	E220    	SEP #$20      (8 bit accum./memory)
C0/A891:	8012    	BRA $A8A5
C0/A893:	4502    	EOR $02
C0/A895:	1A      	INC A
C0/A896:	C220    	REP #$20      (16 bit accum./memory)
C0/A898:	0A      	ASL A
C0/A899:	0A      	ASL A
C0/A89A:	0A      	ASL A
C0/A89B:	0A      	ASL A
C0/A89C:	4502    	EOR $02
C0/A89E:	1A      	INC A
C0/A89F:	8D4705  	STA $0547
C0/A8A2:	7B      	TDC 
C0/A8A3:	E220    	SEP #$20      (8 bit accum./memory)
C0/A8A5:	A5EC    	LDA $EC
C0/A8A7:	300E    	BMI $A8B7
C0/A8A9:	C220    	REP #$20      (16 bit accum./memory)
C0/A8AB:	0A      	ASL A
C0/A8AC:	0A      	ASL A
C0/A8AD:	0A      	ASL A
C0/A8AE:	0A      	ASL A
C0/A8AF:	8D4905  	STA $0549
C0/A8B2:	7B      	TDC 
C0/A8B3:	E220    	SEP #$20      (8 bit accum./memory)
C0/A8B5:	8012    	BRA $A8C9
C0/A8B7:	4502    	EOR $02
C0/A8B9:	1A      	INC A
C0/A8BA:	C220    	REP #$20      (16 bit accum./memory)
C0/A8BC:	0A      	ASL A
C0/A8BD:	0A      	ASL A
C0/A8BE:	0A      	ASL A
C0/A8BF:	0A      	ASL A
C0/A8C0:	4502    	EOR $02
C0/A8C2:	1A      	INC A
C0/A8C3:	8D4905  	STA $0549
C0/A8C6:	7B      	TDC 
C0/A8C7:	E220    	SEP #$20      (8 bit accum./memory)
C0/A8C9:	A903    	LDA #$03
C0/A8CB:	4C5C9B  	JMP $9B5C


Scroll BG1, speed xx x yy (00 --> 7F left/up, 80 <-- FF right/down)
(gen. act. 5E)

C0/A8CE:	A5EB    	LDA $EB
C0/A8D0:	300E    	BMI $A8E0
C0/A8D2:	C220    	REP #$20      (16 bit accum./memory)
C0/A8D4:	0A      	ASL A
C0/A8D5:	0A      	ASL A
C0/A8D6:	0A      	ASL A
C0/A8D7:	0A      	ASL A
C0/A8D8:	8D4B05  	STA $054B
C0/A8DB:	7B      	TDC 
C0/A8DC:	E220    	SEP #$20      (8 bit accum./memory)
C0/A8DE:	8010    	BRA $A8F0
C0/A8E0:	4502    	EOR $02
C0/A8E2:	C220    	REP #$20      (16 bit accum./memory)
C0/A8E4:	0A      	ASL A
C0/A8E5:	0A      	ASL A
C0/A8E6:	0A      	ASL A
C0/A8E7:	0A      	ASL A
C0/A8E8:	4502    	EOR $02
C0/A8EA:	8D4B05  	STA $054B
C0/A8ED:	7B      	TDC 
C0/A8EE:	E220    	SEP #$20      (8 bit accum./memory)
C0/A8F0:	A5EC    	LDA $EC
C0/A8F2:	300E    	BMI $A902
C0/A8F4:	C220    	REP #$20      (16 bit accum./memory)
C0/A8F6:	0A      	ASL A
C0/A8F7:	0A      	ASL A
C0/A8F8:	0A      	ASL A
C0/A8F9:	0A      	ASL A
C0/A8FA:	8D4D05  	STA $054D
C0/A8FD:	7B      	TDC 
C0/A8FE:	E220    	SEP #$20      (8 bit accum./memory)
C0/A900:	8010    	BRA $A912
C0/A902:	4502    	EOR $02
C0/A904:	C220    	REP #$20      (16 bit accum./memory)
C0/A906:	0A      	ASL A
C0/A907:	0A      	ASL A
C0/A908:	0A      	ASL A
C0/A909:	0A      	ASL A
C0/A90A:	4502    	EOR $02
C0/A90C:	8D4D05  	STA $054D
C0/A90F:	7B      	TDC 
C0/A910:	E220    	SEP #$20      (8 bit accum./memory)
C0/A912:	A903    	LDA #$03
C0/A914:	4C5C9B  	JMP $9B5C


Scroll Background 1
(gen. act. 71)

C0/A917:	A5EB    	LDA $EB
C0/A919:	300E    	BMI $A929
C0/A91B:	C220    	REP #$20      (16 bit accum./memory)
C0/A91D:	0A      	ASL A
C0/A91E:	0A      	ASL A
C0/A91F:	0A      	ASL A
C0/A920:	0A      	ASL A
C0/A921:	8D4B05  	STA $054B
C0/A924:	7B      	TDC 
C0/A925:	E220    	SEP #$20      (8 bit accum./memory)
C0/A927:	8012    	BRA $A93B
C0/A929:	4502    	EOR $02
C0/A92B:	1A      	INC A
C0/A92C:	C220    	REP #$20      (16 bit accum./memory)
C0/A92E:	0A      	ASL A
C0/A92F:	0A      	ASL A
C0/A930:	0A      	ASL A
C0/A931:	0A      	ASL A
C0/A932:	4502    	EOR $02
C0/A934:	1A      	INC A
C0/A935:	8D4B05  	STA $054B
C0/A938:	7B      	TDC 
C0/A939:	E220    	SEP #$20      (8 bit accum./memory)
C0/A93B:	A5EC    	LDA $EC
C0/A93D:	300E    	BMI $A94D
C0/A93F:	C220    	REP #$20      (16 bit accum./memory)
C0/A941:	0A      	ASL A
C0/A942:	0A      	ASL A
C0/A943:	0A      	ASL A
C0/A944:	0A      	ASL A
C0/A945:	8D4D05  	STA $054D
C0/A948:	7B      	TDC 
C0/A949:	E220    	SEP #$20      (8 bit accum./memory)
C0/A94B:	8012    	BRA $A95F
C0/A94D:	4502    	EOR $02
C0/A94F:	1A      	INC A
C0/A950:	C220    	REP #$20      (16 bit accum./memory)
C0/A952:	0A      	ASL A
C0/A953:	0A      	ASL A
C0/A954:	0A      	ASL A
C0/A955:	0A      	ASL A
C0/A956:	4502    	EOR $02
C0/A958:	1A      	INC A
C0/A959:	8D4D05  	STA $054D
C0/A95C:	7B      	TDC 
C0/A95D:	E220    	SEP #$20      (8 bit accum./memory)
C0/A95F:	A903    	LDA #$03
C0/A961:	4C5C9B  	JMP $9B5C


Scroll BG2, speed xx x yy (00 --> 7F left/up, 80 <-- FF right/down)
(gen. act. 5F)

C0/A964:	A5EB    	LDA $EB
C0/A966:	300E    	BMI $A976
C0/A968:	C220    	REP #$20      (16 bit accum./memory)
C0/A96A:	0A      	ASL A
C0/A96B:	0A      	ASL A
C0/A96C:	0A      	ASL A
C0/A96D:	0A      	ASL A
C0/A96E:	8D4F05  	STA $054F
C0/A971:	7B      	TDC 
C0/A972:	E220    	SEP #$20      (8 bit accum./memory)
C0/A974:	8010    	BRA $A986
C0/A976:	4502    	EOR $02
C0/A978:	C220    	REP #$20      (16 bit accum./memory)
C0/A97A:	0A      	ASL A
C0/A97B:	0A      	ASL A
C0/A97C:	0A      	ASL A
C0/A97D:	0A      	ASL A
C0/A97E:	4502    	EOR $02
C0/A980:	8D4F05  	STA $054F
C0/A983:	7B      	TDC 
C0/A984:	E220    	SEP #$20      (8 bit accum./memory)
C0/A986:	A5EC    	LDA $EC
C0/A988:	300E    	BMI $A998
C0/A98A:	C220    	REP #$20      (16 bit accum./memory)
C0/A98C:	0A      	ASL A
C0/A98D:	0A      	ASL A
C0/A98E:	0A      	ASL A
C0/A98F:	0A      	ASL A
C0/A990:	8D5105  	STA $0551
C0/A993:	7B      	TDC 
C0/A994:	E220    	SEP #$20      (8 bit accum./memory)
C0/A996:	8010    	BRA $A9A8
C0/A998:	4502    	EOR $02
C0/A99A:	C220    	REP #$20      (16 bit accum./memory)
C0/A99C:	0A      	ASL A
C0/A99D:	0A      	ASL A
C0/A99E:	0A      	ASL A
C0/A99F:	0A      	ASL A
C0/A9A0:	4502    	EOR $02
C0/A9A2:	8D5105  	STA $0551
C0/A9A5:	7B      	TDC 
C0/A9A6:	E220    	SEP #$20      (8 bit accum./memory)
C0/A9A8:	A903    	LDA #$03
C0/A9AA:	4C5C9B  	JMP $9B5C


Scroll Background 2
(gen. act. 72)

C0/A9AD:	A5EB    	LDA $EB
C0/A9AF:	300E    	BMI $A9BF
C0/A9B1:	C220    	REP #$20      (16 bit accum./memory)
C0/A9B3:	0A      	ASL A
C0/A9B4:	0A      	ASL A
C0/A9B5:	0A      	ASL A
C0/A9B6:	0A      	ASL A
C0/A9B7:	8D4F05  	STA $054F
C0/A9BA:	7B      	TDC 
C0/A9BB:	E220    	SEP #$20      (8 bit accum./memory)
C0/A9BD:	8012    	BRA $A9D1
C0/A9BF:	4502    	EOR $02
C0/A9C1:	1A      	INC A
C0/A9C2:	C220    	REP #$20      (16 bit accum./memory)
C0/A9C4:	0A      	ASL A
C0/A9C5:	0A      	ASL A
C0/A9C6:	0A      	ASL A
C0/A9C7:	0A      	ASL A
C0/A9C8:	4502    	EOR $02
C0/A9CA:	1A      	INC A
C0/A9CB:	8D4F05  	STA $054F
C0/A9CE:	7B      	TDC 
C0/A9CF:	E220    	SEP #$20      (8 bit accum./memory)
C0/A9D1:	A5EC    	LDA $EC
C0/A9D3:	300E    	BMI $A9E3
C0/A9D5:	C220    	REP #$20      (16 bit accum./memory)
C0/A9D7:	0A      	ASL A
C0/A9D8:	0A      	ASL A
C0/A9D9:	0A      	ASL A
C0/A9DA:	0A      	ASL A
C0/A9DB:	8D5105  	STA $0551
C0/A9DE:	7B      	TDC 
C0/A9DF:	E220    	SEP #$20      (8 bit accum./memory)
C0/A9E1:	8012    	BRA $A9F5
C0/A9E3:	4502    	EOR $02
C0/A9E5:	1A      	INC A
C0/A9E6:	C220    	REP #$20      (16 bit accum./memory)
C0/A9E8:	0A      	ASL A
C0/A9E9:	0A      	ASL A
C0/A9EA:	0A      	ASL A
C0/A9EB:	0A      	ASL A
C0/A9EC:	4502    	EOR $02
C0/A9EE:	1A      	INC A
C0/A9EF:	8D5105  	STA $0551
C0/A9F2:	7B      	TDC 
C0/A9F3:	E220    	SEP #$20      (8 bit accum./memory)
C0/A9F5:	A903    	LDA #$03
C0/A9F7:	4C5C9B  	JMP $9B5C


Change background layer xx palette to yy
(gen. act. 60)

C0/A9FA:	C220    	REP #$20      (16 bit accum./memory)
C0/A9FC:	A5EB    	LDA $EB
C0/A9FE:	29FF00  	AND #$00FF
C0/AA01:	0A      	ASL A
C0/AA02:	0A      	ASL A
C0/AA03:	0A      	ASL A
C0/AA04:	0A      	ASL A
C0/AA05:	0A      	ASL A
C0/AA06:	A8      	TAY
C0/AA07:	A5EC    	LDA $EC
C0/AA09:	29FF00  	AND #$00FF
C0/AA0C:	0A      	ASL A
C0/AA0D:	0A      	ASL A
C0/AA0E:	0A      	ASL A
C0/AA0F:	0A      	ASL A
C0/AA10:	0A      	ASL A
C0/AA11:	AA      	TAX
C0/AA12:	7B      	TDC 
C0/AA13:	E220    	SEP #$20      (8 bit accum./memory)
C0/AA15:	A97E    	LDA #$7E
C0/AA17:	48      	PHA
C0/AA18:	AB      	PLB
C0/AA19:	C220    	REP #$20      (16 bit accum./memory)
C0/AA1B:	A91000  	LDA #$0010
C0/AA1E:	851E    	STA $1E
C0/AA20:	BF0080E6	LDA $E68000,X	(Map character and townsperson sprite palettes)
C0/AA24:	990072  	STA $7200,Y
C0/AA27:	990074  	STA $7400,Y
C0/AA2A:	E8      	INX
C0/AA2B:	E8      	INX
C0/AA2C:	C8      	INY 
C0/AA2D:	C8      	INY 
C0/AA2E:	C61E    	DEC $1E
C0/AA30:	D0EE    	BNE $AA20
C0/AA32:	7B      	TDC 
C0/AA33:	E220    	SEP #$20      (8 bit accum./memory)
C0/AA35:	7B      	TDC 
C0/AA36:	48      	PHA
C0/AA37:	AB      	PLB
C0/AA38:	A903    	LDA #$03
C0/AA3A:	4C5C9B  	JMP $9B5C


Colorize color range [pb, pe] to color c
(gen. act. 61)

C0/AA3D:	A5EB    	LDA $EB
C0/AA3F:	0A      	ASL A
C0/AA40:	AA      	TAX
C0/AA41:	C220    	REP #$20      (16 bit accum./memory)
C0/AA43:	BFBBAAC0	LDA $C0AABB,X
C0/AA47:	8520    	STA $20
C0/AA49:	7B      	TDC 
C0/AA4A:	E220    	SEP #$20      (8 bit accum./memory)
C0/AA4C:	A5ED    	LDA $ED
C0/AA4E:	1A      	INC A
C0/AA4F:	38      	SEC 
C0/AA50:	E5EC    	SBC $EC
C0/AA52:	A8      	TAY
C0/AA53:	A5EC    	LDA $EC
C0/AA55:	C220    	REP #$20      (16 bit accum./memory)
C0/AA57:	0A      	ASL A
C0/AA58:	AA      	TAX
C0/AA59:	7B      	TDC 
C0/AA5A:	E220    	SEP #$20      (8 bit accum./memory)
C0/AA5C:	BF00727E	LDA $7E7200,X
C0/AA60:	291F    	AND #$1F
C0/AA62:	851E    	STA $1E
C0/AA64:	BF01727E	LDA $7E7201,X
C0/AA68:	4A      	LSR A
C0/AA69:	4A      	LSR A
C0/AA6A:	291F    	AND #$1F
C0/AA6C:	18      	CLC
C0/AA6D:	651E    	ADC $1E
C0/AA6F:	851E    	STA $1E
C0/AA71:	641F    	STZ $1F
C0/AA73:	C220    	REP #$20      (16 bit accum./memory)
C0/AA75:	BF00727E	LDA $7E7200,X
C0/AA79:	0A      	ASL A
C0/AA7A:	0A      	ASL A
C0/AA7B:	0A      	ASL A
C0/AA7C:	EB      	XBA
C0/AA7D:	291F00  	AND #$001F
C0/AA80:	18      	CLC
C0/AA81:	651E    	ADC $1E
C0/AA83:	8D0442  	STA $4204
C0/AA86:	E220    	SEP #$20      (8 bit accum./memory)
C0/AA88:	A903    	LDA #$03
C0/AA8A:	8D0642  	STA $4206
C0/AA8D:	EA      	NOP
C0/AA8E:	EA      	NOP
C0/AA8F:	EA      	NOP
C0/AA90:	EA      	NOP
C0/AA91:	EA      	NOP
C0/AA92:	E8      	INX
C0/AA93:	E8      	INX
C0/AA94:	AD1442  	LDA $4214
C0/AA97:	0A      	ASL A
C0/AA98:	0A      	ASL A
C0/AA99:	EB      	XBA
C0/AA9A:	AD1442  	LDA $4214
C0/AA9D:	C220    	REP #$20      (16 bit accum./memory)
C0/AA9F:	851E    	STA $1E
C0/AAA1:	AD1442  	LDA $4214
C0/AAA4:	EB      	XBA
C0/AAA5:	4A      	LSR A
C0/AAA6:	4A      	LSR A
C0/AAA7:	4A      	LSR A
C0/AAA8:	051E    	ORA $1E
C0/AAAA:	2520    	AND $20
C0/AAAC:	9FFE737E	STA $7E73FE,X
C0/AAB0:	7B      	TDC 
C0/AAB1:	E220    	SEP #$20      (8 bit accum./memory)
C0/AAB3:	88      	DEY 
C0/AAB4:	D0A6    	BNE $AA5C
C0/AAB6:	A904    	LDA #$04
C0/AAB8:	4C5C9B  	JMP $9B5C

C0/AABB:	0000    	BRK #$00
C0/AABD:	1F00E003	ORA $03E000,X
C0/AAC1:	FF03007C	SBC $7C0003,X
C0/AAC5:	1F7CE07F	ORA $7FE07C,X
C0/AAC9:	FF7F


Mosaic screen with speed xx (lower == slower)
(gen. act. 62)

C0/AACB:	A5EB		LDA $EB	
C0/AACD:	8DF011  	STA $11F0
C0/AAD0:	A2001E  	LDX #$1E00
C0/AAD3:	8E9607  	STX $0796
C0/AAD6:	A902    	LDA #$02
C0/AAD8:	4C5C9B  	JMP $9B5C

Create a spotlight effect around character 0 with a radius of xx
(gen. act. 63)

C0/AADB:	A5EB    	LDA $EB
C0/AADD:	291F    	AND #$1F
C0/AADF:	0980    	ORA #$80
C0/AAE1:	8D7B07  	STA $077B
C0/AAE4:	A902    	LDA #$02
C0/AAE6:	4C5C9B  	JMP $9B5C


(something to do with locations)
(gen. act. 64)

C0/AAE9:	A5EB    	LDA $EB
C0/AAEB:	8D0242  	STA $4202
C0/AAEE:	A90D    	LDA #$0D
C0/AAF0:	8D0342  	STA $4203
C0/AAF3:	EA      	NOP
C0/AAF4:	EA      	NOP
C0/AAF5:	EA      	NOP
C0/AAF6:	AE1642  	LDX $4216
C0/AAF9:	A5EC    	LDA $EC
C0/AAFB:	2903    	AND #$03
C0/AAFD:	0A      	ASL A
C0/AAFE:	9D6910  	STA $1069,X
C0/AB01:	9E6A10  	STZ $106A,X
C0/AB04:	A903    	LDA #$03
C0/AB06:	4C5C9B  	JMP $9B5C


(something to do with locations)
(gen. act. 65)

C0/AB09:	A5EB    	LDA $EB
C0/AB0B:	8D0242  	STA $4202
C0/AB0E:	A90D    	LDA #$0D	  (13)
C0/AB10:	8D0342  	STA $4203
C0/AB13:	EA      	NOP
C0/AB14:	EA      	NOP
C0/AB15:	EA      	NOP
C0/AB16:	AE1642  	LDX $4216
C0/AB19:	A5EC    	LDA $EC
C0/AB1B:	297F    	AND #$7F
C0/AB1D:	C220    	REP #$20      (16 bit accum./memory)
C0/AB1F:	0A      	ASL A
C0/AB20:	0A      	ASL A
C0/AB21:	0A      	ASL A
C0/AB22:	0A      	ASL A
C0/AB23:	851E    	STA $1E
C0/AB25:	7B      	TDC 
C0/AB26:	E220    	SEP #$20      (8 bit accum./memory)
C0/AB28:	A5EC    	LDA $EC
C0/AB2A:	100C    	BPL $AB38
C0/AB2C:	C220    	REP #$20      (16 bit accum./memory)
C0/AB2E:	A51E    	LDA $1E
C0/AB30:	4502    	EOR $02        (#$FF...)
C0/AB32:	1A      	INC A          (subtract 255 and add 1...)
C0/AB33:	851E    	STA $1E
C0/AB35:	7B      	TDC            (pointless?)
C0/AB36:	E220    	SEP #$20       (and pointless again?)
C0/AB38:	C220    	REP #$20      (16 bit accum./memory)
C0/AB3A:	A51E    	LDA $1E
C0/AB3C:	9D6B10  	STA $106B,X
C0/AB3F:	7B      	TDC 
C0/AB40:	E220    	SEP #$20      (8 bit accum./memory)
C0/AB42:	A903    	LDA #$03
C0/AB44:	4C5C9B  	JMP $9B5C


Loads map nnnn, positions party at (xx, yy) in vehicle ff
ff = 01:     Party is in airship
ff = 02:	 Party is on Chocobo
(gen. act. 6A)

C0/AB47:	20886E  	JSR $6E88	
C0/AB4A:	20560F  	JSR $0F56	
C0/AB4D:	A5E1    	LDA $E1	
C0/AB4F:	0940    	ORA #$40
C0/AB51:	85E1    	STA $E1
C0/AB53:	8005    	BRA $AB5A


; Loads map nnnn, positions party at (xx, yy)
; (gen. act. 6B)

C0/AB55:	20886E  	JSR $6E88	    ; handle character positions [?]
C0/AB58:	644A    	STZ $4A

C0/AB5A:	A901    	LDA #$01
C0/AB5C:	8584    	STA $84
C0/AB5E:	A5EF    	LDA $EF       ; special map loading flags
C0/AB60:	8DFA11  	STA $11FA     ; save ^
C0/AB63:	C220    	REP #$20      ; 16-bit A
C0/AB65:	A5EB    	LDA $EB       ; map ID + flags
C0/AB67:	290002  	AND #$0200    ; isolate "Parent Map" flag
C0/AB6A:	F00D    	BEQ $AB79     ; branch if no ^
C0/AB6C:	A5EB    	LDA $EB       ; map ID + flags
C0/AB6E:	29FF01  	AND #$01FF    ; isolate "Map ID"
C0/AB71:	8D691F  	STA $1F69     ; save as parent map
C0/AB74:	A5ED    	LDA $ED       ; party coordinates
C0/AB76:	8D6B1F  	STA $1F6B     ; save as parent map coordinates

C0/AB79:	A5EB    	LDA $EB       ; map ID + flags
C0/AB7B:	8D641F  	STA $1F64     ; save current map and flags ^
C0/AB7E:	29FF01  	AND #$01FF    ; isolate "Map ID"
C0/AB81:	C9FF01  	CMP #$01FF    ; "World Map"
C0/AB84:	F047    	BEQ $ABCD     ; branch if ^
C0/AB86:	C9FE01  	CMP #$01FE    ; "Previous World Map"
C0/AB89:	F047    	BEQ $ABD2     ; branch if ^
C0/AB8B:	AA      	TAX           ; index map ID
C0/AB8C:	7B      	TDC           ; zero A/B
C0/AB8D:	E220    	SEP #$20      ; 8-bit A
C0/AB8F:	E00300  	CPX #$0003    ; Map ID >= 3 (non-overworld)
C0/AB92:	B01B    	BCS $ABAF     ; branch if ^

; World of Balance, World of Ruin, and Serpent Trench

C0/AB94:	A6ED    	LDX $ED       ; party coordinates
C0/AB96:	8E601F  	STX $1F60     ; save ^

C0/AB99:	C221    	REP #$21      ; 16-bit A, clear carry
C0/AB9B:	A5E5    	LDA $E5       ; event address
C0/AB9D:	690600  	ADC #$0006    ; skip op and args
C0/ABA0:	8DFD11  	STA $11FD     ; save as map event pointer
C0/ABA3:	E220    	SEP #$20      ; 8-bit A
C0/ABA5:	A5E7    	LDA $E7       ; event bank
C0/ABA7:	6900    	ADC #$00      ; add overflow
C0/ABA9:	8DFF11  	STA $11FF     ; save as map event bank
C0/ABAC:	7B      	TDC           ; zero A/B
C0/ABAD:	8057    	BRA $AC06     ; finish and advance event queue

; All other maps (not 1FF or 1FE)

C0/ABAF:	A5ED    	LDA $ED       ; party X coordinate
C0/ABB1:	8DC01F  	STA $1FC0     ; save ^
C0/ABB4:	A5EE    	LDA $EE       ; party Y coordinate
C0/ABB6:	8DC11F  	STA $1FC1     ; save ^

C0/ABB9:	A5EC    	LDA $EC       ; map properties
C0/ABBB:	2930    	AND #$30      ; isolate "Facing Direction"
C0/ABBD:	4A      	LSR A
C0/ABBE:	4A      	LSR A
C0/ABBF:	4A      	LSR A
C0/ABC0:	4A      	LSR A         ; >> 4 (0-3)
C0/ABC1:	8D4307  	STA $0743     ; set party facing direction
C0/ABC4:	A5EC    	LDA $EC       ; map properties
C0/ABC6:	2908    	AND #$08      ; isolate "Display Location Name"
C0/ABC8:	8D4507  	STA $0745     ; set location name to appear when map loads
C0/ABCB:	8039    	BRA $AC06     ; finish and advance event queue

Fork: Map #$01FF jumps here

C0/ABCD:	20461A  	JSR $1A46     ; some facing direction handling [?]
C0/ABD0:	8009    	BRA $ABDB     ; branch

Fork: Map #$01FE jumps here

C0/ABD2:	7B      	TDC           ; zero A/B
C0/ABD3:	E220    	SEP #$20      ; 8-bit A
C0/ABD5:	ADD21F  	LDA $1FD2     ; parent facing direction
C0/ABD8:	8D681F  	STA $1F68     ; set facing direction

C0/ABDB:	C220    	REP #$20      ; 16-bit A
C0/ABDD:	A5EB    	LDA $EB       ; map ID and properties
C0/ABDF:	2900FE  	AND #$FE00    ; mask out map ID
C0/ABE2:	0D691F  	ORA $1F69     ; replace with parent map ID
C0/ABE5:	8D641F  	STA $1F64     ; save current map ID + props
C0/ABE8:	29FF01  	AND #$01FF    ; isolate map ID
C0/ABEB:	C90300  	CMP #$0003    ; overworld map range
C0/ABEE:	B00B    	BCS $ABFB     ; branch if not ^

C0/ABF0:	AD6B1F  	LDA $1F6B     ; parent XY position
C0/ABF3:	8D601F  	STA $1F60     ; set world XY position
C0/ABF6:	7B      	TDC           ; zero A/B
C0/ABF7:	E220    	SEP #$20      ; 8-bit A
C0/ABF9:	809E    	BRA $AB99     ; set event script address

C0/ABFB:	AD6B1F  	LDA $1F6B     ; parent XY
C0/ABFE:	8DC01F  	STA $1FC0     ; set party XY
C0/AC01:	7B      	TDC           ; zero A/B
C0/AC02:	E220    	SEP #$20      ; 8-bit A
C0/AC04:	80B3    	BRA $ABB9     ; finish up facing direction, etc

C0/AC06:	A906    	LDA #$06      ; length of map op and args
C0/AC08:	4C709B  	JMP $9B70     ; advance event queue by 6 bytes

; Set parent map to nnnn, position (xx, yy), flags z
; (gen. act. 6C)

C0/AC0B:	A4EB    	LDY $EB
C0/AC0D:	8C691F  	STY $1F69
C0/AC10:	A4ED    	LDY $ED
C0/AC12:	8C6B1F  	STY $1F6B
C0/AC15:	A5EF    	LDA $EF
C0/AC17:	8DD21F  	STA $1FD2
C0/AC1A:	A906    	LDA #$06
C0/AC1C:	4C5C9B  	JMP $9B5C


Refresh background after map has been changed
(gen. act. 75)

C0/AC1F:	AD5A05  	LDA $055A
C0/AC22:	C905    	CMP #$05
C0/AC24:	D004    	BNE $AC2A
C0/AC26:	3A      	DEC A
C0/AC27:	8D5A05  	STA $055A
C0/AC2A:	AD5B05  	LDA $055B
C0/AC2D:	C905    	CMP #$05
C0/AC2F:	D004    	BNE $AC35
C0/AC31:	3A      	DEC A
C0/AC32:	8D5B05  	STA $055B
C0/AC35:	AD5C05  	LDA $055C
C0/AC38:	C905    	CMP #$05
C0/AC3A:	D004    	BNE $AC40
C0/AC3C:	3A      	DEC A
C0/AC3D:	8D5C05  	STA $055C
C0/AC40:	A901    	LDA #$01
C0/AC42:	4C709B  	JMP $9B70


Copy data of size rr*cc to current map's BG0 at (xx, yy) and refresh background
(gen. act. 73)

C0/AC45:	A5EC    	LDA $EC
C0/AC47:	29C0    	AND #$C0
C0/AC49:	D007    	BNE $AC52
C0/AC4B:	A904    	LDA #$04
C0/AC4D:	8D5A05  	STA $055A
C0/AC50:	8010    	BRA $AC62
C0/AC52:	C940    	CMP #$40
C0/AC54:	D007    	BNE $AC5D
C0/AC56:	A904    	LDA #$04
C0/AC58:	8D5B05  	STA $055B
C0/AC5B:	8005    	BRA $AC62
C0/AC5D:	A904    	LDA #$04
C0/AC5F:	8D5C05  	STA $055C


Copy data of size rr*cc to current map's BG0 at (xx, yy)
(gen. act. 74)

C0/AC62:	A5EC    	LDA $EC
C0/AC64:	29C0    	AND #$C0
C0/AC66:	D00E    	BNE $AC76
C0/AC68:	AD5A05  	LDA $055A
C0/AC6B:	C904    	CMP #$04
C0/AC6D:	F025    	BEQ $AC94
C0/AC6F:	A905    	LDA #$05
C0/AC71:	8D5A05  	STA $055A
C0/AC74:	801E    	BRA $AC94
C0/AC76:	C940    	CMP #$40
C0/AC78:	D00E    	BNE $AC88
C0/AC7A:	AD5B05  	LDA $055B
C0/AC7D:	C904    	CMP #$04
C0/AC7F:	F013    	BEQ $AC94
C0/AC81:	A905    	LDA #$05
C0/AC83:	8D5B05  	STA $055B
C0/AC86:	800C    	BRA $AC94
C0/AC88:	AD5C05  	LDA $055C
C0/AC8B:	C904    	CMP #$04
C0/AC8D:	F005    	BEQ $AC94
C0/AC8F:	A905    	LDA #$05
C0/AC91:	8D5C05  	STA $055C
C0/AC94:	A5EB    	LDA $EB
C0/AC96:	858F    	STA $8F
C0/AC98:	A5EC    	LDA $EC
C0/AC9A:	293F    	AND #$3F
C0/AC9C:	8590    	STA $90
C0/AC9E:	C221    	REP #$21
C0/ACA0:	A5E5    	LDA $E5
C0/ACA2:	690300  	ADC #$0003
C0/ACA5:	858C    	STA $8C
C0/ACA7:	E220    	SEP #$20      (8 bit accum./memory)
C0/ACA9:	A5E7    	LDA $E7
C0/ACAB:	6900    	ADC #$00
C0/ACAD:	858E    	STA $8E
C0/ACAF:	A5ED    	LDA $ED
C0/ACB1:	8D0242  	STA $4202
C0/ACB4:	A5EE    	LDA $EE
C0/ACB6:	8D0342  	STA $4203
C0/ACB9:	EA      	NOP
C0/ACBA:	EA      	NOP
C0/ACBB:	C221    	REP #$21
C0/ACBD:	AD1642  	LDA $4216
C0/ACC0:	690200  	ADC #$0002
C0/ACC3:	658C    	ADC $8C
C0/ACC5:	85E5    	STA $E5
C0/ACC7:	E220    	SEP #$20      (8 bit accum./memory)
C0/ACC9:	A58E    	LDA $8E
C0/ACCB:	6900    	ADC #$00
C0/ACCD:	85E7    	STA $E7
C0/ACCF:	7B      	TDC 
C0/ACD0:	A5EC    	LDA $EC
C0/ACD2:	29C0    	AND #$C0
C0/ACD4:	D008    	BNE $ACDE
C0/ACD6:	A20000  	LDX #$0000
C0/ACD9:	862A    	STX $2A
C0/ACDB:	4CC41E  	JMP $1EC4

C0/ACDE:	3008    	BMI $ACE8
C0/ACE0:	A20040  	LDX #$4000
C0/ACE3:	862A    	STX $2A	(branching to ACD9 would save 3 bytes)
C0/ACE5:	4CC41E  	JMP $1EC4	

C0/ACE8:	A20080  	LDX #$8000
C0/ACEB:	862A    	STX $2A	(branching to ACD9 would save 3 bytes)
C0/ACED:	4CC41E  	JMP $1EC4	


Place item $1A in inventory
(gen. act. 80)

C0/ACF0:	A5EB    	LDA $EB		(Get the item's index)
C0/ACF2:	851A    	STA $1A		(Store it in $1A temporarily)
C0/ACF4:	20FCAC  	JSR $ACFC		(Go to below function)
C0/ACF7:	A902    	LDA #$02		(Advance the pointer this far)
C0/ACF9:	4C5C9B  	JMP $9B5C

C0/ACFC:	A600    	LDX $00		(Load X with $00)
C0/ACFE:	BD6918  	LDA $1869,X 	(Get item currently in inventory at X)
C0/AD01:	C51A    	CMP $1A		(Is it the same as the candidate (temporary one at $1A)?)
C0/AD03:	F01D    	BEQ $AD22		(If so, branch -> check quantity of items (we already have one))
C0/AD05:	E8      	INX			(Increment X)
C0/AD06:	E00001  	CPX #$0100		(Is X over 256?)
C0/AD09:	D0F3    	BNE $ACFE		(If not, branch -> get next item)
C0/AD0B:	A600    	LDX $00		(Otherwise, load X with $00)
C0/AD0D:	BD6918  	LDA $1869,X 	(Get item currently in inventory at X)
C0/AD10:	C9FF    	CMP #$FF		(Is it currently an "empty" item?)
C0/AD12:	F003    	BEQ $AD17		(If so, branch -> get the item out of temporary location)
C0/AD14:	E8      	INX			(Otherwise, increment X)
C0/AD15:	80F6    	BRA $AD0D		(Go to the next item)
C0/AD17:	A51A    	LDA $1A		(Get the item in temp. location $1A (we don't already have one))
C0/AD19:	9D6918  	STA $1869,X 	(Put it in inventory at X)
C0/AD1C:	A901    	LDA #$01		(Load 1)
C0/AD1E:	9D6919  	STA $1969,X 	(Put it in for quantity of item X)
C0/AD21:	60      	RTS			(Exit)
 
Fork:  Adding another item already in the list

C0/AD22:	BD6919  	LDA $1969,X 	(check quantity of item X)
C0/AD25:	C963    	CMP #$63		(Is it 99?)
C0/AD27:	F003    	BEQ $AD2C		(If so, exit)
C0/AD29:	FE6919  	INC $1969,X 	(Otherwise increment quantity of items)
C0/AD2C:	60      	RTS			(Exit)
 

Remove item $EB from inventory
(gen. act. 81)

C0/AD2D:	A600    	LDX $00		(Load X with $00)
C0/AD2F:	BD6918  	LDA $1869,X 	(Get item X (currently in inventory))
C0/AD32:	C5EB    	CMP $EB		(Is this the candidate (at $EB) for removal?)
C0/AD34:	F008    	BEQ $AD3E		(If so, branch -> decrement quantity)
C0/AD36:	E8      	INX			(Otherwise, increment X)
C0/AD37:	E00001  	CPX #$0100		(Is X over 256?)
C0/AD3A:	D0F3    	BNE $AD2F		(If not, branch -> get the next item)
C0/AD3C:	800D    	BRA $AD4B		(Otherwise, exit the function)
C0/AD3E:	DE6919  	DEC $1969,X 	(Decremtne the quantity of item X)
C0/AD41:	BD6919  	LDA $1969,X 	(Get the quantity of item X)
C0/AD44:	D005    	BNE $AD4B		(If over 0, exit the function)
C0/AD46:	A9FF    	LDA #$FF		(Otherwise, get an "empty" item)
C0/AD48:	9D6918  	STA $1869,X 	(Put it in inventory at X)
C0/AD4B:	A902    	LDA #$02		(How many bytes advanced this was (one for op and one for param))
C0/AD4D:	4C5C9B  	JMP $9B5C


Give XXXX amount of GP to party
(gen. act. 84)

C0/AD50:	C221    	REP #$21		(16 bit accum./memory)
C0/AD52:	AD6018  	LDA $1860		(Load the amount of gold variable)
C0/AD55:	65EB    	ADC $EB		(Add the parameter ($EB) amount of gold)
C0/AD57:	8D6018  	STA $1860		(Store it back to the gold variable)
C0/AD5A:	7B      	TDC 			(Clear the accumulator)
C0/AD5B:	E220    	SEP #$20      	(8 bit accum./memory)
C0/AD5D:	6D6218  	ADC $1862		(Add accumulator to $1862)
C0/AD60:	8D6218  	STA $1862		(Store the result back into 1862)
C0/AD63:	C998    	CMP #$98		(Is it less than 152 (98 hex)?)
C0/AD65:	9013    	BCC $AD7A		(If so, we're ok, branch to the end)	
C0/AD67:	AE6018  	LDX $1860		(Otherwise, check the low 2 bytes with X)
C0/AD6A:	E07F96  	CPX #$967F		(Is it less than 38527 (967F hex)?)
C0/AD6D:	900B    	BCC $AD7A		(If so, we're ok, branch to the end)
C0/AD6F:	A27F96  	LDX #$967F		(Otherwise, load X with the max value for the low bytes)
C0/AD72:	8E6018  	STX $1860		(Store it into the low bytes of gold)
C0/AD75:	A998    	LDA #$98		(Load A with the max for the high byte)
C0/AD77:	8D6218  	STA $1862		(Store it into the high byte)
C0/AD7A:	A903    	LDA #$03		(Advance the script 3 places)
C0/AD7C:	4C5C9B  	JMP $9B5C


Take XXXX amount of GP from party
(gen. act. 85)

C0/AD7F:	ADB71E  	LDA $1EB7	
C0/AD82:	29BF    	AND #$BF
C0/AD84:	8DB71E  	STA $1EB7
C0/AD87:	C220    	REP #$20      	(16 bit accum./memory)
C0/AD89:	AD6018  	LDA $1860
C0/AD8C:	38      	SEC 
C0/AD8D:	E5EB    	SBC $EB
C0/AD8F:	852A    	STA $2A
C0/AD91:	7B      	TDC 
C0/AD92:	E220    	SEP #$20      	(8 bit accum./memory)
C0/AD94:	AD6218  	LDA $1862
C0/AD97:	E900    	SBC #$00
C0/AD99:	852C    	STA $2C
C0/AD9B:	C9A0    	CMP #$A0
C0/AD9D:	900A    	BCC $ADA9
C0/AD9F:	ADB71E  	LDA $1EB7
C0/ADA2:	0940    	ORA #$40
C0/ADA4:	8DB71E  	STA $1EB7
C0/ADA7:	800A    	BRA $ADB3
C0/ADA9:	A62A    	LDX $2A
C0/ADAB:	8E6018  	STX $1860
C0/ADAE:	A52C    	LDA $2C
C0/ADB0:	8D6218  	STA $1862
C0/ADB3:	A903    	LDA #$03
C0/ADB5:	4C5C9B  	JMP $9B5C


Give Esper $EB to party
(gen. act. 86)

C0/ADB8:	A5EB    	LDA $EB		(Load A with the index of the Esper to add)
C0/ADBA:	38      	SEC 			(Clear the carry)
C0/ADBB:	E936    	SBC #$36		(Subtract 54 from the index)
C0/ADBD:	85EB    	STA $EB		(Put (index - 54) into $EB)
C0/ADBF:	2907    	AND #$07		(Zero out upper nibble)
C0/ADC1:	AA      	TAX			(Put result into X)
C0/ADC2:	A5EB    	LDA $EB		(A = (index - 54))
C0/ADC4:	4A      	LSR A			(Divide by 2)
C0/ADC5:	4A      	LSR A			(Divide by 2)
C0/ADC6:	4A      	LSR A			(Divide by 2, now 8 total)
C0/ADC7:	A8      	TAY			(Put result into Y)
C0/ADC8:	B9691A  	LDA $1A69,Y		(Load A with $1A69 + (index - 54)/8 (locates the correct byte))
C0/ADCB:	1FFCBAC0	ORA $C0BAFC,X	(Mask to update the held Espers byte)
C0/ADCF:	99691A  	STA $1A69,Y		(Store the updated held Espers byte)
C0/ADD2:	A902    	LDA #$02		(How many bytes advanced this was (one for op and one for param))
C0/ADD4:	4C5C9B  	JMP $9B5C


Take Esper XX from party
(gen. act. 87)

C0/ADD7:	A5EB    	LDA $EB        (Load A with the index from the Esper to remove)
C0/ADD9:	38      	SEC            (Set the borrow in case it's needed)
C0/ADDA:	E936    	SBC #$36       (Subtract 54 from the index)
C0/ADDC:	85EB    	STA $EB        (Put (index -54) into $EB)
C0/ADDE:	20EDBA  	JSR $BAED      (updated A = X index; clears out upper 9 bits, Y = A shifted right 3 times)
C0/ADE1:	B9691A  	LDA $1A69,Y    (espers owned)
C0/ADE4:	3F04BBC0	AND $C0BB04,X  (remove the one set in the parameter)
C0/ADE8:	99691A  	STA $1A69,Y    (new espers owned)
C0/ADEB:	A400    	LDY $00        (Y = 0)
C0/ADED:	B91E16  	LDA $161E,Y    (esper equipped)
C0/ADF0:	C5EB    	CMP $EB        (does it match the one to remove?)
C0/ADF2:	D005    	BNE $ADF9      (branch if not)
C0/ADF4:	A9FF    	LDA #$FF       (empty slot)
C0/ADF6:	991E16  	STA $161E,Y    (since it was removed, unequip it also)
C0/ADF9:	C221    	REP #$21
C0/ADFB:	98      	TYA           (Y = A)
C0/ADFC:	692500  	ADC #$0025     (add 37 to check next character)
C0/ADFF:	A8      	TAY           (transfer the +37 to Y)
C0/AE00:	7B      	TDC            (A = 0)
C0/AE01:	E220    	SEP #$20       (8 bit accum./memory)
C0/AE03:	C05002  	CPY #$0250     (did we check all characters?)
C0/AE06:	D0E5    	BNE $ADED      (branch if not)
C0/AE08:	A902    	LDA #$02       (Advance the script pointer by 2)
C0/AE0A:	4C5C9B  	JMP $9B5C

Learn a spell, though this looks like unused code
C0/AE0D:	A5EB    	LDA $EB        (load parameter, character)
C0/AE0F:	8D0242  	STA $4202      (save as a multiplier)
C0/AE12:	A936    	LDA #$36       (54...)
C0/AE14:	8D0342  	STA $4203      (save as the other multiplier)
C0/AE17:	A5EC    	LDA $EC        (load another parameter, the spell number)
C0/AE19:	C221    	REP #$21
C0/AE1B:	EA      	NOP
C0/AE1C:	6D1642  	ADC $4216      (add the result of the multiplication)
C0/AE1F:	AA      	TAX           (new index)
C0/AE20:	7B      	TDC 
C0/AE21:	E220    	SEP #$20       (8 bit accum./memory)
C0/AE23:	A9FF    	LDA #$FF       (empty slot in most cases, but for this...)
C0/AE25:	9D6E1A  	STA $1A6E,X    (set spell as learned)
C0/AE28:	A903    	LDA #$03       (Advance the script pointer by 3)
C0/AE2A:	4C5C9B  	JMP $9B5C


Remove all but status conditions C1, C2 from character XX
(gen. act. 88)

C0/AE2D:	20AD9D  	JSR $9DAD
C0/AE30:	C05002  	CPY #$0250
C0/AE33:	B00D    	BCS $AE42
C0/AE35:	C220    	REP #$20      (16 bit accum./memory)
C0/AE37:	B91416  	LDA $1614,Y    (load status bytes 1 & 4)
C0/AE3A:	25EC    	AND $EC        (keep those only in the parameter)
C0/AE3C:	991416  	STA $1614,Y    (save new status)
C0/AE3F:	7B      	TDC 
C0/AE40:	E220    	SEP #$20      (8 bit accum./memory)
C0/AE42:	A904    	LDA #$04
C0/AE44:	4C5C9B  	JMP $9B5C


Inflict status conditions C1, C2 on character XX
(gen. act. 89)

C0/AE47:	20AD9D  	JSR $9DAD
C0/AE4A:	C05002  	CPY #$0250
C0/AE4D:	B00D    	BCS $AE5C
C0/AE4F:	C220    	REP #$20      (16 bit accum./memory)
C0/AE51:	B91416  	LDA $1614,Y    (load status bytes 1 & 4)
C0/AE54:	05EC    	ORA $EC        (set those in the parameter)
C0/AE56:	991416  	STA $1614,Y    (save new status)
C0/AE59:	7B      	TDC 
C0/AE5A:	E220    	SEP #$20      (8 bit accum./memory)
C0/AE5C:	A904    	LDA #$04
C0/AE5E:	4C5C9B  	JMP $9B5C


Toggle status conditions C1, C2 for character XX
(gen. act. 8A)

C0/AE61:	20AD9D  	JSR $9DAD
C0/AE64:	C05002  	CPY #$0250
C0/AE67:	B00D    	BCS $AE76
C0/AE69:	C220    	REP #$20      (16 bit accum./memory)
C0/AE6B:	B91416  	LDA $1614,Y    (load status bytes 1 & 4)
C0/AE6E:	45EC    	EOR $EC        (toggle those in the parameter)
C0/AE70:	991416  	STA $1614,Y    (save new status)
C0/AE73:	7B      	TDC 
C0/AE74:	E220    	SEP #$20      (8 bit accum./memory)
C0/AE76:	A904    	LDA #$04
C0/AE78:	4C5C9B  	JMP $9B5C

Add/Subtract HP from characters
XX "character number"
YY flags--7F = Set to max,
	  --8x = subtract 2^x
	  --0x = add 2^x
Note that if subtraction would drop it below 1, it will be set to 1.
(gen. act. 8B)

C0/AE7B:	20AD9D  	JSR $9DAD	(Point Y at character XX's data struct)
C0/AE7E:	C05002  	CPY #$0250	(Is Y > (37 * 16)? )
C0/AE81:	9003    	BCC $AE86	(Continue if it's less)
C0/AE83:	4CD3AE  	JMP $AED3	(If it's outside the range, exit)
C0/AE86:	20E8AE  	JSR $AEE8	(various, but it store Max HP to $1E)
C0/AE89:	A5EC    	LDA $EC	(Load the operation parameter)
C0/AE8B:	297F    	AND #$7F	(Zero out bit 7)
C0/AE8D:	C97F    	CMP #$7F	(Is it now #7F?)
C0/AE8F:	F038    	BEQ $AEC9	(If so, branch to maximize HP)
C0/AE91:	0A      	ASL A		(Otherwise, it'll be a # 0-7 (or it'll break), so double it for a pointer)
C0/AE92:	AA      	TAX		(Store it to X)
C0/AE93:	A5EC    	LDA $EC	(Again, load the operation parameter)
C0/AE95:	3017    	BMI $AEAE	(If bit 7 set, branch to subtraction code)
C0/AE97:	C221    	REP #$21	(Otherwise, we'll add; set carry bit and 16 bit A/mem.)
C0/AE99:	B90916  	LDA $1609,Y	(Load current HP)
C0/AE9C:	7FD8AEC0	ADC $C0AED8,X	(Add 2^X as loaded from the data table (X was calculated above))
C0/AEA0:	C51E    	CMP $1E	(Compare to Max HP)
C0/AEA2:	9002    	BCC $AEA6	(If it's less, branch)
C0/AEA4:	A51E    	LDA $1E	(If it's more, load Max HP (note that a BRA here could save 8 bytes))
C0/AEA6:	990916  	STA $1609,Y	(And store it to the current HP)
C0/AEA9:	7B      	TDC 		(Clear A)
C0/AEAA:	E220    	SEP #$20    (8 bit A/mem)
C0/AEAC:	8025    	BRA $AED3	(Branch to exit)
C0/AEAE:	C220    	REP #$20    (16 bit A/mem; subtraction code starts here)
C0/AEB0:	B90916  	LDA $1609,Y (Load A with the current HP)
C0/AEB3:	F00C    	BEQ $AEC1	(Branch if it's 0 (this destination could be moved as well))
C0/AEB5:	38      	SEC 		(Set carry in anticipation of subtraction)
C0/AEB6:	FFD8AEC0	SBC $C0AED8,X	(Subtract 2^x as loaded from the data table)
C0/AEBA:	F002    	BEQ $AEBE	(If it's now 0, branch to "set it to 1")
C0/AEBC:	1003    	BPL $AEC1	(If it's postive, we're done)
C0/AEBE:	A90100  	LDA #$0001	(Load A with 1 if subtraction did or would've set it to 0)
C0/AEC1:	990916  	STA $1609,Y	(Store A to current HP)
C0/AEC4:	7B      	TDC 		(Store 0 to A)
C0/AEC5:	E220    	SEP #$20    (8 bit A/mem)
C0/AEC7:	800A    	BRA $AED3	(Branch to exit)
C0/AEC9:	C220    	REP #$20    (16 bit A/mem; maximization code starts here)
C0/AECB:	A51E    	LDA $1E	(Load Max HP)
C0/AECD:	990916  	STA $1609,Y	(Store it to Current HP)
C0/AED0:	7B      	TDC 		(Clear A)
C0/AED1:	E220    	SEP #$20    (8 bit A/mem)
C0/AED3:	A903    	LDA #$03	(//this is to advance the script pointer 3 bytes)
C0/AED5:	4C5C9B  	JMP $9B5C	

Data for use in above segment, HP to add or subtract.

C0/AED8:	0100
C0/AEDA:	0200
C0/AEDC:	0400
C0/AEDE:	0800	
C0/AEE0:	1000
C0/AEE2:	2000
C0/AEE4:	4000
C0/AEE6:	8000

(I don't feel like commenting this whole thing, just know that it set $1E to character Y's 
Max HP.  All the other stuff is just a check for the two high bits which indicate equipment-
based temporary Max HP raises.)


C0/AEE8:	DA 		PHX
C0/AEE9:	C220    	REP #$20      (16 bit accum./memory)
C0/AEEB:	B90B16  	LDA $160B,Y
C0/AEEE:	29FF3F  	AND #$3FFF
C0/AEF1:	851E    	STA $1E
C0/AEF3:	4A      	LSR A
C0/AEF4:	8520    	STA $20
C0/AEF6:	4A      	LSR A
C0/AEF7:	8522    	STA $22
C0/AEF9:	4A      	LSR A
C0/AEFA:	8524    	STA $24
C0/AEFC:	7B      	TDC 
C0/AEFD:	E220    	SEP #$20      (8 bit accum./memory)
C0/AEFF:	B90C16  	LDA $160C,Y
C0/AF02:	29C0    	AND #$C0
C0/AF04:	F02D    	BEQ $AF33
C0/AF06:	C940    	CMP #$40
C0/AF08:	F01E    	BEQ $AF28
C0/AF0A:	C980    	CMP #$80
C0/AF0C:	F00D    	BEQ $AF1B
C0/AF0E:	C221    	REP #$21
C0/AF10:	A51E    	LDA $1E
C0/AF12:	6524    	ADC $24
C0/AF14:	851E    	STA $1E
C0/AF16:	7B      	TDC 
C0/AF17:	E220    	SEP #$20      (8 bit accum./memory)
C0/AF19:	8018    	BRA $AF33
C0/AF1B:	C221    	REP #$21
C0/AF1D:	A51E    	LDA $1E
C0/AF1F:	6520    	ADC $20
C0/AF21:	851E    	STA $1E
C0/AF23:	7B      	TDC 
C0/AF24:	E220    	SEP #$20      (8 bit accum./memory)
C0/AF26:	800B    	BRA $AF33
C0/AF28:	C221    	REP #$21
C0/AF2A:	A51E    	LDA $1E
C0/AF2C:	6522    	ADC $22
C0/AF2E:	851E    	STA $1E
C0/AF30:	7B      	TDC 
C0/AF31:	E220    	SEP #$20      (8 bit accum./memory)
C0/AF33:	A20F27  	LDX #$270F	  (Cap at 9999)
C0/AF36:	E41E    	CPX $1E
C0/AF38:	B002    	BCS $AF3C
C0/AF3A:	861E    	STX $1E
C0/AF3C:	FA      	PLX
C0/AF3D:	60      	RTS

Add/Subtract MP from characters
XX "character number"
YY flags--7F = Set to max
	  --8x = subtract 2^x
	  --0x = add 2^x
(gen. act. 8C)

C0/AF3E:	20AD9D  	JSR $9DAD	(Point Y at character XX's data struct)
C0/AF41:	C05002  	CPY #$0250	(Is Y > (37 * 16)? )
C0/AF44:	9003    	BCC $AF49	(Continue if it is)
C0/AF46:	4C90AF  	JMP $AF90	(Otherwise, jump to the exit)
C0/AF49:	20A3AF  	JSR $AFA3	(various, but it stores Max MP to $1E)
C0/AF4C:	A5EC    	LDA $EC	(Load the operation parameter)
C0/AF4E:	297F    	AND #$7F	(Zero out bit 7)
C0/AF50:	C97F    	CMP #$7F	(Compare it to #7F)
C0/AF52:	F032    	BEQ $AF86	(If it's equal, branch to maximize code)
C0/AF54:	0A      	ASL A		(Double it for a 2 byte data pointer value)
C0/AF55:	AA      	TAX		(Store the data pointer to X)
C0/AF56:	A5EC    	LDA $EC	(Load the operation parameter)
C0/AF58:	3017    	BMI $AF71	(If bit 7 set, branch to the subtraction code)
C0/AF5A:	C221    	REP #$21	(16 bit A/mem and clear carry for addition)
C0/AF5C:	B90D16  	LDA $160D,Y	(Load current MP)
C0/AF5F:	7F95AFC0	ADC $C0AF95,X	(Add data from table (unfortunately all 0's))
C0/AF63:	C51E    	CMP $1E	(Compare to Max MP)
C0/AF65:	9002    	BCC $AF69	(If it's less than Max, just store it as-is)
C0/AF67:	A51E    	LDA $1E	(Otherwise, load Max MP)
C0/AF69:	990D16  	STA $160D,Y	(And store to current MP)
C0/AF6C:	7B      	TDC 		(Clear A)
C0/AF6D:	E220    	SEP #$20    (8 bit A/mem)
C0/AF6F:	801F    	BRA $AF90	(Branch to exit)
C0/AF71:	C220    	REP #$20    (16 bit A/mem)
C0/AF73:	B90D16  	LDA $160D,Y	(Load current MP)
C0/AF76:	38      	SEC 		(Set carry for subtraction)
C0/AF77:	FF95AFC0	SBC $C0AF95,X	(Subtract data from table (unfortunately all 0's))
C0/AF7B:	1001    	BPL $AF7E	(If positive, keep it as-is)
C0/AF7D:	7B      	TDC 		(Otherwise, clear A to 0)
C0/AF7E:	990D16  	STA $160D,Y	(Store to current MP)
C0/AF81:	7B      	TDC 		(Clear A)
C0/AF82:	E220    	SEP #$20    (8 bit A/mem)
C0/AF84:	800A    	BRA $AF90	(Branch to the exit)
C0/AF86:	C220    	REP #$20    (16 bit A/mem)
C0/AF88:	A51E    	LDA $1E	(Load Max MP)
C0/AF8A:	990D16  	STA $160D,Y	(Store to current MP)
C0/AF8D:	7B      	TDC 		(Clear A)
C0/AF8E:	E220    	SEP #$20    (8 bit A/mem)
C0/AF90:	A903    	LDA #$03	(//advance the script pointer by 3 bytes...)
C0/AF92:	4C5C9B  	JMP $9B5C

Data for use in above code segment 
(Obviously, this just never made it into the final revision.  If it did, then they 
would NEVER have bothered to write a whole function to add/subtract 0.  Also, if the
added/subtracted value were meant to be a linear function of the parameter, then they 
would not do it this way, since there are simple adding and multiplying functions.  I 
can only conclude that this was meant to work just like the HP version above, but it 
never made it.  So the question is, why have separate data tables?  Because they are 
sloppy coders, I tell ya!)

C0/AF95:	0000    
C0/AF97:	0000    
C0/AF99:	0000    
C0/AF9B:	0000    
C0/AF9D:	0000    
C0/AF9F:	0000    
C0/AFA1:	0000    

(I don't feel like commenting this whole thing, just know that it set $1E to character Y's 
Max MP.  All the other stuff is just a check for the two high bits which indicate equipment-
based temporary Max MP raises.)

C0/AFA3:	DA      	PHX
C0/AFA4:	C220    	REP #$20      (16 bit accum./memory)
C0/AFA6:	B90F16  	LDA $160F,Y
C0/AFA9:	29FF3F  	AND #$3FFF
C0/AFAC:	851E    	STA $1E
C0/AFAE:	4A      	LSR A
C0/AFAF:	8520    	STA $20
C0/AFB1:	4A      	LSR A
C0/AFB2:	8522    	STA $22
C0/AFB4:	4A      	LSR A
C0/AFB5:	8524    	STA $24
C0/AFB7:	7B      	TDC 
C0/AFB8:	E220    	SEP #$20      (8 bit accum./memory)
C0/AFBA:	B91016  	LDA $1610,Y
C0/AFBD:	29C0    	AND #$C0
C0/AFBF:	F02C    	BEQ $AFED
C0/AFC1:	C940    	CMP #$40
C0/AFC3:	F01D    	BEQ $AFE2
C0/AFC5:	C980    	CMP #$80
C0/AFC7:	F00C    	BEQ $AFD5
C0/AFC9:	C221    	REP #$21
C0/AFCB:	A51E    	LDA $1E
C0/AFCD:	6524    	ADC $24
C0/AFCF:	851E    	STA $1E
C0/AFD1:	E220    	SEP #$20      (8 bit accum./memory)
C0/AFD3:	8018    	BRA $AFED
C0/AFD5:	C221    	REP #$21
C0/AFD7:	A51E    	LDA $1E
C0/AFD9:	6520    	ADC $20
C0/AFDB:	851E    	STA $1E
C0/AFDD:	7B      	TDC 
C0/AFDE:	E220    	SEP #$20      (8 bit accum./memory)
C0/AFE0:	800B    	BRA $AFED
C0/AFE2:	C221    	REP #$21
C0/AFE4:	A51E    	LDA $1E
C0/AFE6:	6522    	ADC $22
C0/AFE8:	851E    	STA $1E
C0/AFEA:	7B      	TDC 
C0/AFEB:	E220    	SEP #$20    (8 bit accum./memory)
C0/AFED:	A2E703  	LDX #$03E7	(Cap at 999)	 
C0/AFF0:	E41E    	CPX $1E
C0/AFF2:	B002    	BCS $AFF6
C0/AFF4:	861E    	STX $1E
C0/AFF6:	FA      	PLX
C0/AFF7:	60      	RTS


Unlock all of Cyan's SwdTechs 
(gen. act. 8F)

C0/AFF8:	A9FF    	LDA #$FF	
C0/AFFA:	8DF71C  	STA $1CF7
C0/AFFD:	A901    	LDA #$01
C0/AFFF:	4C5C9B  	JMP $9B5C


Grant Sabin the Bum Rush
(gen. act. 90)

C0/B002:	AD281D  	LDA $1D28	
C0/B005:	0980    	ORA #$80
C0/B007:	8D281D  	STA $1D28
C0/B00A:	A901    	LDA #$01
C0/B00C:	4C5C9B  	JMP $9B5C


Invoke name change screen for character xx
(gen. act. 98)

C0/B00F:	20AD9D  	JSR $9DAD	
C0/B012:	C220    	REP #$20      (16 bit accum./memory)
C0/B014:	98      	TYA
C0/B015:	18      	CLC
C0/B016:	690016  	ADC #$1600
C0/B019:	8D0102  	STA $0201
C0/B01C:	7B      	TDC 
C0/B01D:	E220    	SEP #$20      (8 bit accum./memory)
C0/B01F:	A901    	LDA #$01
C0/B021:	8D0002  	STA $0200
C0/B024:	20CAC6  	JSR $C6CA      (make a call to the menu, invoke name changing screen)
C0/B027:	A901    	LDA #$01
C0/B029:	8584    	STA $84
C0/B02B:	A9E0    	LDA #$E0
C0/B02D:	8DFA11  	STA $11FA
C0/B030:	A902    	LDA #$02
C0/B032:	4C709B  	JMP $9B70


Invoke party selection screen:  xx = number of groups
(gen. act. 99)

C0/B035:	AC0308  	LDY $0803	
C0/B038:	8CFB07  	STY $07FB
C0/B03B:	A0D907  	LDY #$07D9
C0/B03E:	8CFD07  	STY $07FD
C0/B041:	8CFF07  	STY $07FF
C0/B044:	8C0108  	STY $0801
C0/B047:	A5EB    	LDA $EB        (load number of groups)
C0/B049:	8D0102  	STA $0201      (save)
C0/B04C:	A6EC    	LDX $EC        (load characters to force into party)
C0/B04E:	8E0202  	STX $0202      (save)
C0/B051:	A904    	LDA #$04
C0/B053:	8D0002  	STA $0200      (queue up C3/012B->C3/70E7)
C0/B056:	20CAC6  	JSR $C6CA      (make a call to the menu, invoke party selection screen at above)
C0/B059:	204A71  	JSR $714A
C0/B05C:	20676F  	JSR $6F67
C0/B05F:	A901    	LDA #$01
C0/B061:	8584    	STA $84
C0/B063:	A9C0    	LDA #$C0
C0/B065:	8DFA11  	STA $11FA
C0/B068:	A904    	LDA #$04
C0/B06A:	4C709B  	JMP $9B70

Invoke Shop XX
(gen. act. 9B)

C0/B06D:	A5EB    	LDA $EB
C0/B06F:	8D0102  	STA $0201
C0/B072:	AC0308  	LDY $0803
C0/B075:	B97908  	LDA $0879,Y
C0/B078:	8D0202  	STA $0202
C0/B07B:	A903    	LDA #$03
C0/B07D:	8D0002  	STA $0200
C0/B080:	20CAC6  	JSR $C6CA      (make a call to the menu, invoke a shop)
C0/B083:	A901    	LDA #$01
C0/B085:	8584    	STA $84
C0/B087:	A902    	LDA #$02
C0/B089:	4C709B  	JMP $9B70


Optimum equip character XX
(gen. act. 9C)

C0/B08C:	A5EB    	LDA $EB        (load parameter)
C0/B08E:	8D0102  	STA $0201      (store as character to equip)
C0/B091:	20B3C6  	JSR $C6B3      (equip the character in $0201)
C0/B094:	20F36C  	JSR $6CF3      (perform "equipment check" on the current party)
C0/B097:	A902    	LDA #$02
C0/B099:	4C5C9B  	JMP $9B5C

Invoke Party Order screen for final battle
(gen. act. 9D)

C0/B09C:	A908    	LDA #$08
C0/B09E:	8D0002  	STA $0200
C0/B0A1:	20CAC6  	JSR $C6CA      (make a call to the menu, invoke party selection for final battle)
C0/B0A4:	A901    	LDA #$01
C0/B0A6:	8584    	STA $84
C0/B0A8:	A9E0    	LDA #$E0
C0/B0AA:	8DFA11  	STA $11FA
C0/B0AD:	A901    	LDA #$01
C0/B0AF:	4C709B  	JMP $9B70


Invoke Colosseum Item Screen
(gen. act. 9A)
C0/B0B2:	A907    	LDA #$07	
C0/B0B4:	8D0002  	STA $0200
C0/B0B7:	20CAC6  	JSR $C6CA      (make a call to the menu, invoke Colliseum)
C0/B0BA:	AD0502  	LDA $0205      (load item bet)
C0/B0BD:	C9FF    	CMP #$FF       (is it nothing?)
C0/B0BF:	F004    	BEQ $B0C5      (branch if so)
C0/B0C1:	A940    	LDA #$40
C0/B0C3:	8001    	BRA $B0C6
C0/B0C5:	7B      	TDC 
C0/B0C6:	851A    	STA $1A
C0/B0C8:	ADBD1E  	LDA $1EBD
C0/B0CB:	29BF    	AND #$BF
C0/B0CD:	051A    	ORA $1A
C0/B0CF:	8DBD1E  	STA $1EBD
C0/B0D2:	A9C0    	LDA #$C0
C0/B0D4:	8DFA11  	STA $11FA
C0/B0D7:	A901    	LDA #$01
C0/B0D9:	8584    	STA $84
C0/B0DB:	A901    	LDA #$01
C0/B0DD:	4C709B  	JMP $9B70

Set timer to XXXX jiffies, jump to YYYY on expiration, flags ZZ (includes index, etc.)
(gen. act. A0) (5 params)
bytes 1 & 2 (0 being gen. act. A0) is the time
For bytes 3, 4, & 5:
bits 0-17 (0x03FFFF) is the event to jump to when the timer expires
bits 18-19 (0x0C0000) is the timer to set
bit 20 (0x100000) makes the timer override the game clock
bit 21 (0x200000) is unknown
bit 22 (0x400000) sets the timer to display on maps (if the tileset supports it)
bit 23 (0x800000) will pause the timer during battle and menu execution
C0/B0E0:	A5EF    	LDA $EF	
C0/B0E2:	290C    	AND #$0C
C0/B0E4:	851A    	STA $1A
C0/B0E6:	4A      	LSR A
C0/B0E7:	18      	CLC
C0/B0E8:	651A    	ADC $1A
C0/B0EA:	A8      	TAY
C0/B0EB:	A5EB    	LDA $EB
C0/B0ED:	998911  	STA $1189,Y
C0/B0F0:	A5EC    	LDA $EC
C0/B0F2:	998A11  	STA $118A,Y
C0/B0F5:	A5ED    	LDA $ED
C0/B0F7:	998B11  	STA $118B,Y
C0/B0FA:	A5EE    	LDA $EE
C0/B0FC:	998C11  	STA $118C,Y
C0/B0FF:	A5EF    	LDA $EF
C0/B101:	998811  	STA $1188,Y
C0/B104:	2903    	AND #$03
C0/B106:	998D11  	STA $118D,Y
C0/B109:	A906    	LDA #$06
C0/B10B:	4C5C9B  	JMP $9B5C


Reset timer XX
(gen. act. A1)(1 param)
(param * 6 = Y)

C0/B10E:	A5EB    	LDA $EB	
C0/B110:	0A      	ASL A
C0/B111:	851A    	STA $1A
C0/B113:	0A      	ASL A
C0/B114:	18      	CLC
C0/B115:	651A    	ADC $1A
C0/B117:	A8      	TAY
C0/B118:	7B      	TDC 
C0/B119:	998811  	STA $1188,Y
C0/B11C:	998911  	STA $1189,Y
C0/B11F:	998A11  	STA $118A,Y
C0/B122:	998B11  	STA $118B,Y
C0/B125:	998C11  	STA $118C,Y
C0/B128:	998D11  	STA $118D,Y
C0/B12B:	A902    	LDA #$02
C0/B12D:	4C5C9B  	JMP $9B5C


(gen. act. A2)

C0/B130:	202CCD  	JSR $CD2C	
C0/B133:	A901    	LDA #$01
C0/B135:	4C5C9B  	JMP $9B5C


Repeat the the following commands (until B1 is encountered) xx times
(gen. act. B0)

C0/B138:	A902    	LDA #$02	
C0/B13A:	20829B  	JSR $9B82
C0/B13D:	A5EB    	LDA $EB
C0/B13F:	9DC405  	STA $05C4,X
C0/B142:	4C6D9A  	JMP $9A6D       ; execute next general action


End block of commands to repeat (ends repeat)
(gen. act. B1)

C0/B145:	A6E8    	LDX $E8	
C0/B147:	BDC405  	LDA $05C4,X
C0/B14A:	3A      	DEC A
C0/B14B:	9DC405  	STA $05C4,X
C0/B14E:	F012    	BEQ $B162
C0/B150:	BDF105  	LDA $05F1,X
C0/B153:	85E5    	STA $E5
C0/B155:	BDF205  	LDA $05F2,X
C0/B158:	85E6    	STA $E6
C0/B15A:	BDF305  	LDA $05F3,X
C0/B15D:	85E7    	STA $E7
C0/B15F:	4C6D9A  	JMP $9A6D       ; execute next general action

C0/B162:	A6E8    	LDX $E8		
C0/B164:	CA      	DEX
C0/B165:	CA      	DEX
C0/B166:	CA      	DEX
C0/B167:	86E8    	STX $E8
C0/B169:	A901    	LDA #$01
C0/B16B:	4C5C9B  	JMP $9B5C
C0/B16E:	60      	RTS
 

Return if bit $1E80 + $xx is clear
(gen. act. BC)

C0/B16F:	A5EC    	LDA $EC	
C0/B171:	EB      	XBA
C0/B172:	A5EB    	LDA $EB
C0/B174:	20EDBA  	JSR $BAED
C0/B177:	B9801E  	LDA $1E80,Y
C0/B17A:	3FFCBAC0	AND $C0BAFC,X
C0/B17E:	D014    	BNE $B194
C0/B180:	A6E8    	LDX $E8
C0/B182:	BDF105  	LDA $05F1,X
C0/B185:	85E5    	STA $E5
C0/B187:	BDF205  	LDA $05F2,X
C0/B18A:	85E6    	STA $E6
C0/B18C:	BDF305  	LDA $05F3,X
C0/B18F:	85E7    	STA $E7
C0/B191:	4C6D9A  	JMP $9A6D       ; execute next general action

C0/B194:	A6E8    	LDX $E8
C0/B196:	CA      	DEX
C0/B197:	CA      	DEX
C0/B198:	CA      	DEX
C0/B199:	86E8    	STX $E8
C0/B19B:	A903    	LDA #$03
C0/B19D:	4C5C9B  	JMP $9B5C

C0/B1A0:	60      	RTS
 

Call subroutine aaaaaa (+$CA0000/$0A0200)
(gen. act. B2)

C0/B1A1:	A904    	LDA #$04	
C0/B1A3:	A6E8    	LDX $E8
C0/B1A5:	18      	CLC
C0/B1A6:	65E5    	ADC $E5
C0/B1A8:	9D9405  	STA $0594,X
C0/B1AB:	A5E6    	LDA $E6
C0/B1AD:	6900    	ADC #$00
C0/B1AF:	9D9505  	STA $0595,X
C0/B1B2:	A5E7    	LDA $E7
C0/B1B4:	6900    	ADC #$00
C0/B1B6:	9D9605  	STA $0596,X
C0/B1B9:	A5EB    	LDA $EB
C0/B1BB:	85E5    	STA $E5        ; set pointer to graphic index data [?]
C0/B1BD:	9DF405  	STA $05F4,X
C0/B1C0:	A5EC    	LDA $EC
C0/B1C2:	85E6    	STA $E6
C0/B1C4:	9DF505  	STA $05F5,X
C0/B1C7:	A5ED    	LDA $ED
C0/B1C9:	18      	CLC
C0/B1CA:	69CA    	ADC #$CA
C0/B1CC:	85E7    	STA $E7
C0/B1CE:	9FF60500	STA $0005F6,X
C0/B1D2:	E8      	INX
C0/B1D3:	E8      	INX
C0/B1D4:	E8      	INX
C0/B1D5:	86E8    	STX $E8
C0/B1D7:	A901    	LDA #$01
C0/B1D9:	9DC405  	STA $05C4,X
C0/B1DC:	4C6D9A  	JMP $9A6D       ; execute next general action

Jump to subroutine aaaaaa (+$CA0000/$0A0200), repeat XX times
(gen. act. B3)

C0/B1DF:	A6E8    	LDX $E8	
C0/B1E1:	A5E5    	LDA $E5
C0/B1E3:	18      	CLC
C0/B1E4:	6905    	ADC #$05
C0/B1E6:	9D9405  	STA $0594,X
C0/B1E9:	A5E6    	LDA $E6
C0/B1EB:	6900    	ADC #$00
C0/B1ED:	9D9505  	STA $0595,X
C0/B1F0:	A5E7    	LDA $E7
C0/B1F2:	6900    	ADC #$00
C0/B1F4:	9D9605  	STA $0596,X
C0/B1F7:	A5EC    	LDA $EC
C0/B1F9:	85E5    	STA $E5
C0/B1FB:	9DF405  	STA $05F4,X
C0/B1FE:	A5ED    	LDA $ED
C0/B200:	85E6    	STA $E6
C0/B202:	9DF505  	STA $05F5,X
C0/B205:	A5EE    	LDA $EE
C0/B207:	18      	CLC
C0/B208:	69CA    	ADC #$CA
C0/B20A:	85E7    	STA $E7
C0/B20C:	9FF60500	STA $0005F6,X
C0/B210:	E8      	INX
C0/B211:	E8      	INX
C0/B212:	E8      	INX
C0/B213:	86E8    	STX $E8
C0/B215:	A5EB    	LDA $EB
C0/B217:	9DC405  	STA $05C4,X
C0/B21A:	4C6D9A  	JMP $9A6D       ; execute next general action


Pause for xx units
(gen. act. B4)

C0/B21D:	A5EB    	LDA $EB        (LDX $EB?)
C0/B21F:	AA      	TAX
C0/B220:	86E3    	STX $E3
C0/B222:	A902    	LDA #$02
C0/B224:	4C5C9B  	JMP $9B5C


Pause for 15 * xx units
(gen. act. B5)

C0/B227:	A5EB    	LDA $EB	
C0/B229:	8D0242  	STA $4202
C0/B22C:	A90F    	LDA #$0F
C0/B22E:	8D0342  	STA $4203
C0/B231:	EA      	NOP
C0/B232:	EA      	NOP
C0/B233:	EA      	NOP
C0/B234:	EA      	NOP
C0/B235:	AE1642  	LDX $4216
C0/B238:	86E3    	STX $E3
C0/B23A:	A902    	LDA #$02
C0/B23C:	4C5C9B  	JMP $9B5C


Pause for 15 units
(gen. act. 91)

C0/B23F:	A20F00  	LDX #$000F	
C0/B242:	86E3    	STX $E3
C0/B244:	A901    	LDA #$01
C0/B246:	4C5C9B  	JMP $9B5C


Pause for 30 units
(gen. act. 92)

C0/B249:	A21E00  	LDX #$001E	
C0/B24C:	86E3    	STX $E3
C0/B24E:	A901    	LDA #$01
C0/B250:	4C5C9B  	JMP $9B5C


Pause for 45 units
(gen. act. 93)

C0/B253:	A22D00  	LDX #$002D	
C0/B256:	86E3    	STX $E3
C0/B258:	A901    	LDA #$01
C0/B25A:	4C5C9B  	JMP $9B5C


Pause for 60 units
(gen. act. 94)

C0/B25D:	A23C00  	LDX #$003C	
C0/B260:	86E3    	STX $E3
C0/B262:	A901    	LDA #$01
C0/B264:	4C5C9B  	JMP $9B5C


Pause for 120 units
(gen. act. 95)

C0/B267:	A27800  	LDX #$0078	
C0/B26A:	86E3    	STX $E3
C0/B26C:	A901    	LDA #$01
C0/B26E:	4C5C9B  	JMP $9B5C


Increment $1F6D, if ($C0FD00 + ($1F6D)) >= $80, branch to aaaaaa + $CA0000/$0A0200
50% of the time, branch to aaaaaa
(gen. act. BD)

C0/B271:	202E06  	JSR $062E     (Random number generator)	
C0/B274:	C980    	CMP #$80
C0/B276:	B013    	BCS $B28B
C0/B278:	C221    	REP #$21
C0/B27A:	A5E5    	LDA $E5
C0/B27C:	690400  	ADC #$0004
C0/B27F:	85E5    	STA $E5
C0/B281:	7B      	TDC 
C0/B282:	E220    	SEP #$20      (8 bit accum./memory)
C0/B284:	65E7    	ADC $E7
C0/B286:	85E7    	STA $E7
C0/B288:	4C6D9A  	JMP $9A6D       ; execute next general action

C0/B28B:	A6EB    	LDX $EB
C0/B28D:	86E5    	STX $E5
C0/B28F:	A5ED    	LDA $ED
C0/B291:	18      	CLC
C0/B292:	69CA    	ADC #$CA
C0/B294:	85E7    	STA $E7
C0/B296:	4C6D9A  	JMP $9A6D       ; execute next general action


Branch to aaaaaa (+$CA0000/$0A0200) if bit $1DC9 + $xx is clear
(gen. act. B7)

C0/B299:	A5EB    	LDA $EB	
C0/B29B:	20EDBA  	JSR $BAED
C0/B29E:	B9C91D  	LDA $1DC9,Y
C0/B2A1:	3FFCBAC0	AND $C0BAFC,X
C0/B2A5:	F013    	BEQ $B2BA
C0/B2A7:	C221    	REP #$21
C0/B2A9:	A5E5    	LDA $E5
C0/B2AB:	690500  	ADC #$0005
C0/B2AE:	85E5    	STA $E5
C0/B2B0:	7B      	TDC 
C0/B2B1:	E220    	SEP #$20      (8 bit accum./memory)
C0/B2B3:	65E7    	ADC $E7
C0/B2B5:	85E7    	STA $E7
C0/B2B7:	4C6D9A  	JMP $9A6D       ; execute next general action

C0/B2BA:	A6EC    	LDX $EC
C0/B2BC:	86E5    	STX $E5
C0/B2BE:	A5EE    	LDA $EE
C0/B2C0:	18      	CLC
C0/B2C1:	69CA    	ADC #$CA
C0/B2C3:	85E7    	STA $E7
C0/B2C5:	4C6D9A  	JMP $9A6D       ; execute next general action


If (t1 || t2 || ... || t8) branch; else continue
(gen. act. C0-C7)

C0/B2C8:	A5EA    	LDA $EA
C0/B2CA:	38      	SEC 
C0/B2CB:	E9BF    	SBC #$BF
C0/B2CD:	0A      	ASL A
C0/B2CE:	1A      	INC A
C0/B2CF:	A8      	TAY
C0/B2D0:	8420    	STY $20
C0/B2D2:	A00100  	LDY #$0001
C0/B2D5:	841E    	STY $1E
C0/B2D7:	A41E    	LDY $1E
C0/B2D9:	C220    	REP #$20      (16 bit accum./memory)
C0/B2DB:	B7E5    	LDA [$E5],Y
C0/B2DD:	3009    	BMI $B2E8
C0/B2DF:	E220    	SEP #$20      (8 bit accum./memory)
C0/B2E1:	20ABBA  	JSR $BAAB
C0/B2E4:	F02C    	BEQ $B312
C0/B2E6:	800A    	BRA $B2F2
C0/B2E8:	29FF7F    	AND #$7FFF
C0/B2EB:	E220    	SEP #$20
C0/B2ED:	20ABBA  	JSR $BAAB
C0/B2F0:	D020    	BNE $B312
C0/B2F2:	A41E    	LDY $1E
C0/B2F4:	C8      	INY 
C0/B2F5:	C8      	INY 
C0/B2F6:	841E    	STY $1E
C0/B2F8:	C420    	CPY $20
C0/B2FA:	D0DB    	BNE $B2D7
C0/B2FC:	C8      	INY 
C0/B2FD:	C8      	INY 
C0/B2FE:	C8      	INY 
C0/B2FF:	C221    	REP #$21
C0/B301:	98      	TYA
C0/B302:	65E5    	ADC $E5
C0/B304:	85E5    	STA $E5
C0/B306:	E220    	SEP #$20      (8 bit accum./memory)
C0/B308:	A5E7    	LDA $E7
C0/B30A:	6900    	ADC #$00
C0/B30C:	85E7    	STA $E7
C0/B30E:	7B      	TDC 
C0/B30F:	4C6D9A  	JMP $9A6D       ; execute next general action

C0/B312:	A420    	LDY $20
C0/B314:	C220    	REP #$20      (16 bit accum./memory)
C0/B316:	B7E5    	LDA [$E5],Y
C0/B318:	852A    	STA $2A
C0/B31A:	7B      	TDC 
C0/B31B:	E220    	SEP #$20      (8 bit accum./memory)
C0/B31D:	C8      	INY 
C0/B31E:	C8      	INY 
C0/B31F:	B7E5    	LDA [$E5],Y
C0/B321:	18      	CLC
C0/B322:	69CA    	ADC #$CA
C0/B324:	85E7    	STA $E7
C0/B326:	A42A    	LDY $2A
C0/B328:	84E5    	STY $E5
C0/B32A:	4C6D9A  	JMP $9A6D       ; execute next general action


If (t1 && t2 && ... && t8) branch; else continue
(gen. act. C8-CF)

C0/B32D:	A5EA    	LDA $EA
C0/B32F:	38      	SEC 
C0/B330:	E9C7    	SBC #$C7
C0/B332:	0A      	ASL A
C0/B333:	1A      	INC A
C0/B334:	A8      	TAY
C0/B335:	8420    	STY $20
C0/B337:	A00100  	LDY #$0001
C0/B33A:	841E    	STY $1E
C0/B33C:	A41E    	LDY $1E
C0/B33E:	C220    	REP #$20      (16 bit accum./memory)
C0/B340:	B7E5    	LDA [$E5],Y
C0/B342:	3009    	BMI $B34D
C0/B344:	E220    	SEP #$20      (8 bit accum./memory)
C0/B346:	20ABBA  	JSR $BAAB
C0/B349:	D031    	BNE $B37C
C0/B34B:	800A    	BRA $B357
C0/B34D:	29FF7F    	AND #$7FFF
C0/B350:	E220    	SEP #$20
C0/B352:	20ABBA  	JSR $BAAB
C0/B355:	F025    	BEQ $B37C
C0/B357:	A41E    	LDY $1E
C0/B359:	C8      	INY 
C0/B35A:	C8      	INY 
C0/B35B:	841E    	STY $1E
C0/B35D:	C420    	CPY $20
C0/B35F:	D0DB    	BNE $B33C
C0/B361:	A420    	LDY $20
C0/B363:	C220    	REP #$20      (16 bit accum./memory)
C0/B365:	B7E5    	LDA [$E5],Y
C0/B367:	852A    	STA $2A
C0/B369:	7B      	TDC 
C0/B36A:	E220    	SEP #$20      (8 bit accum./memory)
C0/B36C:	C8      	INY 
C0/B36D:	C8      	INY 
C0/B36E:	B7E5    	LDA [$E5],Y
C0/B370:	18      	CLC
C0/B371:	69CA    	ADC #$CA
C0/B373:	85E7    	STA $E7
C0/B375:	A42A    	LDY $2A
C0/B377:	84E5    	STY $E5
C0/B379:	4C6D9A  	JMP $9A6D       ; execute next general action

C0/B37C:	A420    	LDY $20
C0/B37E:	C8      	INY 
C0/B37F:	C8      	INY 
C0/B380:	C8      	INY 
C0/B381:	C221    	REP #$21
C0/B383:	98      	TYA
C0/B384:	65E5    	ADC $E5
C0/B386:	85E5    	STA $E5
C0/B388:	E220    	SEP #$20      (8 bit accum./memory)
C0/B38A:	A5E7    	LDA $E7
C0/B38C:	6900    	ADC #$00
C0/B38E:	85E7    	STA $E7
C0/B390:	7B      	TDC 
C0/B391:	4C6D9A  	JMP $9A6D       ; execute next general action

Display character portrait
(gen. act. E7)
C0/B394:	A5EB    	LDA $EB
C0/B396:	8D9507  	STA $0795
C0/B399:	A902    	LDA #$02
C0/B39B:	4C5C9B  	JMP $9B5C


Load CaseWord with currently active party
(gen. act. E4)

C0/B39E:	7B      	TDC 
C0/B39F:	8DB51E  	STA $1EB5
C0/B3A2:	AD6D1A  	LDA $1A6D		(Load the active party)
C0/B3A5:	1A      	INC A
C0/B3A6:	AA      	TAX
C0/B3A7:	A901    	LDA #$01
C0/B3A9:	CA      	DEX
C0/B3AA:	F003    	BEQ $B3AF
C0/B3AC:	0A      	ASL A
C0/B3AD:	80FA    	BRA $B3A9
C0/B3AF:	8DB41E  	STA $1EB4
C0/B3B2:	A901    	LDA #$01
C0/B3B4:	4C5C9B  	JMP $9B5C


Load CaseWord with available characters
(gen. act. E3)

C0/B3B7:	7B      	TDC 
C0/B3B8:	8DB41E  	STA $1EB4
C0/B3BB:	8DB51E  	STA $1EB5
C0/B3BE:	A600    	LDX $00
C0/B3C0:	9B      	TXY
C0/B3C1:	B96708  	LDA $0867,Y
C0/B3C4:	2907    	AND #$07
C0/B3C6:	F00A    	BEQ $B3D2
C0/B3C8:	ADB41E  	LDA $1EB4
C0/B3CB:	1FFCBAC0	ORA $C0BAFC,X
C0/B3CF:	8DB41E  	STA $1EB4
C0/B3D2:	C221    	REP #$21
C0/B3D4:	98      	TYA
C0/B3D5:	692900  	ADC #$0029
C0/B3D8:	A8      	TAY
C0/B3D9:	7B      	TDC 
C0/B3DA:	E220    	SEP #$20      (8 bit accum./memory)
C0/B3DC:	E8      	INX
C0/B3DD:	E00800  	CPX #$0008
C0/B3E0:	D0DF    	BNE $B3C1
C0/B3E2:	A600    	LDX $00
C0/B3E4:	9B      	TXY
C0/B3E5:	B9AF09  	LDA $09AF,Y
C0/B3E8:	2907    	AND #$07
C0/B3EA:	F00A    	BEQ $B3F6
C0/B3EC:	ADB51E  	LDA $1EB5
C0/B3EF:	1FFCBAC0	ORA $C0BAFC,X
C0/B3F3:	8DB51E  	STA $1EB5
C0/B3F6:	C221    	REP #$21
C0/B3F8:	98      	TYA
C0/B3F9:	692900  	ADC #$0029
C0/B3FC:	A8      	TAY
C0/B3FD:	7B      	TDC 
C0/B3FE:	E220    	SEP #$20      (8 bit accum./memory)
C0/B400:	E8      	INX
C0/B401:	E00800  	CPX #$0008
C0/B404:	D0DF    	BNE $B3E5
C0/B406:	A901    	LDA #$01
C0/B408:	4C5C9B  	JMP $9B5C


Load CaseWord with the characters in the active party
(gen. act. DE)

C0/B40B:	7B      	TDC 
C0/B40C:	8DB41E  	STA $1EB4      (since A is still 8 bit, two STZ commands would work here)
C0/B40F:	8DB51E  	STA $1EB5
C0/B412:	A600    	LDX $00
C0/B414:	9B      	TXY
C0/B415:	B96708  	LDA $0867,Y
C0/B418:	2907    	AND #$07
C0/B41A:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/B41D:	D00A    	BNE $B429
C0/B41F:	ADB41E  	LDA $1EB4
C0/B422:	1FFCBAC0	ORA $C0BAFC,X
C0/B426:	8DB41E  	STA $1EB4
C0/B429:	C221    	REP #$21
C0/B42B:	98      	TYA
C0/B42C:	692900  	ADC #$0029
C0/B42F:	A8      	TAY
C0/B430:	7B      	TDC 
C0/B431:	E220    	SEP #$20      (8 bit accum./memory)
C0/B433:	E8      	INX
C0/B434:	E00800  	CPX #$0008
C0/B437:	D0DC    	BNE $B415
C0/B439:	A600    	LDX $00
C0/B43B:	9B      	TXY
C0/B43C:	B9AF09  	LDA $09AF,Y
C0/B43F:	2907    	AND #$07
C0/B441:	CD6D1A  	CMP $1A6D		(Is this the active party?)
C0/B444:	D00A    	BNE $B450
C0/B446:	ADB51E  	LDA $1EB5
C0/B449:	1FFCBAC0	ORA $C0BAFC,X
C0/B44D:	8DB51E  	STA $1EB5
C0/B450:	C221    	REP #$21
C0/B452:	98      	TYA
C0/B453:	692900  	ADC #$0029
C0/B456:	A8      	TAY
C0/B457:	7B      	TDC 
C0/B458:	E220    	SEP #$20      (8 bit accum./memory)
C0/B45A:	E8      	INX
C0/B45B:	E00800  	CPX #$0008
C0/B45E:	D0DC    	BNE $B43C
C0/B460:	A901    	LDA #$01
C0/B462:	4C5C9B  	JMP $9B5C


(gen. act. DF)

C0/B465:	7B      	TDC 
C0/B466:	8DB41E  	STA $1EB4      (LDX $00, STX $1EB4...)
C0/B469:	8DB51E  	STA $1EB5      (clear the caseword)
C0/B46C:	A600    	LDX $00
C0/B46E:	9B      	TXY
C0/B46F:	B96708  	LDA $0867,Y
C0/B472:	2940    	AND #$40
C0/B474:	F00A    	BEQ $B480
C0/B476:	ADB41E  	LDA $1EB4      (load caseword)
C0/B479:	1FFCBAC0	ORA $C0BAFC,X  (set a bit)
C0/B47D:	8DB41E  	STA $1EB4      (save caseword)
C0/B480:	C221    	REP #$21
C0/B482:	98      	TYA
C0/B483:	692900  	ADC #$0029
C0/B486:	A8      	TAY
C0/B487:	7B      	TDC 
C0/B488:	E220    	SEP #$20      (8 bit accum./memory)
C0/B48A:	E8      	INX
C0/B48B:	E00800  	CPX #$0008     (have we done 8 characters yet?)
C0/B48E:	D0DF    	BNE $B46F      (branch if not)
C0/B490:	A600    	LDX $00
C0/B492:	9B      	TXY
C0/B493:	B9AF09  	LDA $09AF,Y
C0/B496:	2940    	AND #$40
C0/B498:	F00A    	BEQ $B4A4
C0/B49A:	ADB51E  	LDA $1EB5      (load caseword)
C0/B49D:	1FFCBAC0	ORA $C0BAFC,X  (set a bit)
C0/B4A1:	8DB51E  	STA $1EB5      (save caseword)
C0/B4A4:	C221    	REP #$21
C0/B4A6:	98      	TYA
C0/B4A7:	692900  	ADC #$0029
C0/B4AA:	A8      	TAY
C0/B4AB:	7B      	TDC 
C0/B4AC:	E220    	SEP #$20      (8 bit accum./memory)
C0/B4AE:	E8      	INX
C0/B4AF:	E00800  	CPX #$0008     (have we done 8 characters yet?)
C0/B4B2:	D0DF    	BNE $B493      (branch if not)
C0/B4B4:	A901    	LDA #$01
C0/B4B6:	4C5C9B  	JMP $9B5C      (advance event queue 1 byte)


(gen. act. E2)

C0/B4B9:	A920    	LDA #$20
C0/B4BB:	851A    	STA $1A			(Store #$20 in $1A)
C0/B4BD:	A400    	LDY $00			(Load $00 in Y, probably #$00)
C0/B4BF:	BB      	TYX				(Transfer Y to X, probably to zero X)
C0/B4C0:	B95018  	LDA $1850,Y		(Load place of the Actor Y in the parties (value: either E1, E9, F1 or F9 for 1 party))
										 (E2, EA, F2 or FA for party #2 and E3, EB, F3 or FB for party 3)
C0/B4C3:	2907    	AND #$07		(Bitwise #$07 AND  A, the result will always be 1, 2 or 3 (party number of character Y))
C0/B4C5:	CD6D1A  	CMP $1A6D		(compare with active party number)
C0/B4C8:	D00D    	BNE $B4D7		(Branch if not equal)
C0/B4CA:	B95018  	LDA $1850,Y		(Load place of the Actor Y in the active party)						
C0/B4CD:	2918    	AND #$18		(A = 0, 8, 16 or 24 dependig in which slot is the character)
C0/B4CF:	C51A    	CMP $1A			(compare A with $1A)
C0/B4D1:	B004    	BCS $B4D7		(Branch on Carry set so when equals to 0?) 
										 (I'm not sure but this would only happend only if $1A already equals 0 
										  so once $1E would already hold character number in slot 0???)										
C0/B4D3:	851A    	STA $1A			(Store A (the position in party) in $1A)
C0/B4D5:	861E    	STX $1E			(Store X (character number) to $1E)
C0/B4D7:	E8      	INX				(increment X by 1)
C0/B4D8:	C8      	INY 			(Increment Y by 1)
C0/B4D9:	C01000  	CPY #$0010		(Y - 16)
C0/B4DC:	D0E2    	BNE $B4C0		(branch if we didn't looped 16 times)


C0/B4DE:	C220    	REP #$20      	(16 bit accum./memory)
C0/B4E0:	A51E    	LDA $1E			(Load $1E (the party Leader in the accumulator) (A number from 0 to 15)


***This part is not really useful for what I want to make***
C0/B4E2:	0A      	ASL A			(multiply by two the actor number (now a even number from 0 to 30))
C0/B4E3:	AA      	TAX				(Transfer A to X)
C0/B4E4:	BFF3B4C0	LDA $C0B4F3,X	(load caseword (2 bytes, binary encoding?))
C0/B4E8:	8DB41E  	STA $1EB4		(save CaseWord)
C0/B4EB:	7B      	TDC 			(Transfer D to C, zero A)			
C0/B4EC:	E220    	SEP #$20      (8 bit accum./memory)
C0/B4EE:	A901    	LDA #$01
C0/B4F0:	4C5C9B  	JMP $9B5C

Data (binary encoding)

C0/B4F3:	0100    	
C0/B4F5:	0200    	
C0/B4F7:	0400    	
C0/B4F9:	0800      	
C0/B4FB:	1000    	
C0/B4FD:	2000    	
C0/B4FF:	4000    	
C0/B501:	8000    	
C0/B503:	0001    	
C0/B505:	0002    	
C0/B507:	0004    	
C0/B509:	0008      	
C0/B50B:	0010    	
C0/B50D:	0020    	
C0/B50F:	0040    	
C0/B511:	0080    	


Load CaseWord with event bits $2E0-$2EF (characters encountered so far?)
(gen. act. E0)

C0/B513:	AEDC1E  	LDX $1EDC	
C0/B516:	8EB41E  	STX $1EB4
C0/B519:	A901    	LDA #$01
C0/B51B:	4C5C9B  	JMP $9B5C


Load CaseWord with event bits $2F0-$2FF (characters on the roster?)
(gen. act. E1)

C0/B51E:	AEDE1E  	LDX $1EDE	
C0/B521:	8EB41E  	STX $1EB4
C0/B524:	A901    	LDA #$01
C0/B526:	4C5C9B  	JMP $9B5C


Set word ($1FC2 + XX) to YYYY
(gen. act. E8)

C0/B529:	A5EB    	LDA $EB	
C0/B52B:	0A      	ASL A
C0/B52C:	A8      	TAY
C0/B52D:	C220    	REP #$20      (16 bit accum./memory)
C0/B52F:	A5EC    	LDA $EC
C0/B531:	99C21F  	STA $1FC2,Y
C0/B534:	7B      	TDC 
C0/B535:	E220    	SEP #$20      (8 bit accum./memory)
C0/B537:	A904    	LDA #$04
C0/B539:	4C5C9B  	JMP $9B5C


Take word ($1FC2 + XX) and add YYYY
(gen. act. E9)

C0/B53C:	A5EB    	LDA $EB	
C0/B53E:	0A      	ASL A
C0/B53F:	A8      	TAY
C0/B540:	C221    	REP #$21
C0/B542:	B9C21F  	LDA $1FC2,Y
C0/B545:	65EC    	ADC $EC
C0/B547:	9002    	BCC $B54B
C0/B549:	A502    	LDA $02
C0/B54B:	99C21F  	STA $1FC2,Y
C0/B54E:	7B      	TDC 
C0/B54F:	E220    	SEP #$20      (8 bit accum./memory)
C0/B551:	A904    	LDA #$04
C0/B553:	4C5C9B  	JMP $9B5C


Take word ($1FC2 + XX) and subtract YYYY
(gen. act. EA)

C0/B556:	A5EB    	LDA $EB	
C0/B558:	0A      	ASL A
C0/B559:	A8      	TAY
C0/B55A:	C220    	REP #$20      (16 bit accum./memory)
C0/B55C:	B9C21F  	LDA $1FC2,Y
C0/B55F:	38      	SEC 
C0/B560:	E5EC    	SBC $EC
C0/B562:	B002    	BCS $B566
C0/B564:	A500    	LDA $00
C0/B566:	99C21F  	STA $1FC2,Y
C0/B569:	7B      	TDC 
C0/B56A:	E220    	SEP #$20      (8 bit accum./memory)
C0/B56C:	A904    	LDA #$04
C0/B56E:	4C5C9B  	JMP $9B5C


Compare word ($1FC2 + XX) to YYYY
(gen. act. EB)

C0/B571:	A5EB    	LDA $EB	
C0/B573:	0A      	ASL A
C0/B574:	A8      	TAY
C0/B575:	BEC21F  	LDX $1FC2,Y
C0/B578:	E4EC    	CPX $EC
C0/B57A:	9006    	BCC $B582
C0/B57C:	F008    	BEQ $B586
C0/B57E:	A902    	LDA #$02
C0/B580:	8006    	BRA $B588
C0/B582:	A904    	LDA #$04
C0/B584:	8002    	BRA $B588
C0/B586:	A901    	LDA #$01
C0/B588:	8DB41E  	STA $1EB4	(A = 4 for "less", = 1 for "equal", and = 2 for "greater")
C0/B58B:	9CB51E  	STZ $1EB5
C0/B58E:	A904    	LDA #$04
C0/B590:	4C5C9B  	JMP $9B5C


Set Event Bit 0
(gen. act. D0)

C0/B593:	A5EB    	LDA $EB		
C0/B595:	20EDBA  	JSR $BAED
C0/B598:	B9801E  	LDA $1E80,Y
C0/B59B:	1FFCBAC0	ORA $C0BAFC,X
C0/B59F:	99801E  	STA $1E80,Y
C0/B5A2:	A902    	LDA #$02
C0/B5A4:	4C5C9B  	JMP $9B5C


Set Event Bit 1
(gen. act. D2)

C0/B5A7:	A5EB    	LDA $EB		
C0/B5A9:	20EDBA  	JSR $BAED
C0/B5AC:	B9A01E  	LDA $1EA0,Y
C0/B5AF:	1FFCBAC0	ORA $C0BAFC,X
C0/B5B3:	99A01E  	STA $1EA0,Y
C0/B5B6:	A902    	LDA #$02
C0/B5B8:	4C5C9B  	JMP $9B5C


Set Event Bit 3
(gen. act. D4)

C0/B5BB:	A5EB    	LDA $EB		
C0/B5BD:	20EDBA  	JSR $BAED
C0/B5C0:	B9C01E  	LDA $1EC0,Y
C0/B5C3:	1FFCBAC0	ORA $C0BAFC,X
C0/B5C7:	99C01E  	STA $1EC0,Y
C0/B5CA:	A902    	LDA #$02
C0/B5CC:	4C5C9B  	JMP $9B5C


Clear Event Bit 0
(gen. act. D1)

C0/B5CF:	A5EB    	LDA $EB		
C0/B5D1:	20EDBA  	JSR $BAED
C0/B5D4:	B9801E  	LDA $1E80,Y
C0/B5D7:	3F04BBC0	AND $C0BB04,X
C0/B5DB:	99801E  	STA $1E80,Y
C0/B5DE:	A902    	LDA #$02
C0/B5E0:	4C5C9B  	JMP $9B5C


Clear Event Bit 1
(gen. act. D3)

C0/B5E3:	A5EB    	LDA $EB		
C0/B5E5:	20EDBA  	JSR $BAED
C0/B5E8:	B9A01E  	LDA $1EA0,Y
C0/B5EB:	3F04BBC0	AND $C0BB04,X
C0/B5EF:	99A01E  	STA $1EA0,Y
C0/B5F2:	A902    	LDA #$02
C0/B5F4:	4C5C9B  	JMP $9B5C


Clear Event Bit 2
(gen. act. D5)

C0/B5F7:	A5EB    	LDA $EB		
C0/B5F9:	20EDBA  	JSR $BAED
C0/B5FC:	B9C01E  	LDA $1EC0,Y
C0/B5FF:	3F04BBC0	AND $C0BB04,X
C0/B603:	99C01E  	STA $1EC0,Y
C0/B606:	A902    	LDA #$02
C0/B608:	4C5C9B  	JMP $9B5C


Set Event Bit 3
(gen. act. D6)

C0/B60B:	A5EB    	LDA $EB		
C0/B60D:	20EDBA  	JSR $BAED
C0/B610:	B9E01E  	LDA $1EE0,Y
C0/B613:	1FFCBAC0	ORA $C0BAFC,X
C0/B617:	99E01E  	STA $1EE0,Y
C0/B61A:	A902    	LDA #$02
C0/B61C:	4C5C9B  	JMP $9B5C


Set Event Bit 4
(gen. act. D8)

C0/B61F:	A5EB    	LDA $EB		
C0/B621:	20EDBA  	JSR $BAED
C0/B624:	B9001F  	LDA $1F00,Y
C0/B627:	1FFCBAC0	ORA $C0BAFC,X
C0/B62B:	99001F  	STA $1F00,Y
C0/B62E:	A902    	LDA #$02
C0/B630:	4C5C9B  	JMP $9B5C


Set Event Bit 5
(gen. act. DA)

C0/B633:	A5EB    	LDA $EB		
C0/B635:	20EDBA  	JSR $BAED
C0/B638:	B9201F  	LDA $1F20,Y
C0/B63B:	1FFCBAC0	ORA $C0BAFC,X
C0/B63F:	99201F  	STA $1F20,Y
C0/B642:	A902    	LDA #$02
C0/B644:	4C5C9B  	JMP $9B5C


Set Event Bit 6
(gen. act. DC)

C0/B647:	A5EB    	LDA $EB		
C0/B649:	20EDBA  	JSR $BAED
C0/B64C:	B9401F  	LDA $1F40,Y
C0/B64F:	1FFCBAC0	ORA $C0BAFC,X
C0/B653:	99401F  	STA $1F40,Y
C0/B656:	A902    	LDA #$02
C0/B658:	4C5C9B  	JMP $9B5C


Clear Event Bit 3
(gen. act. D7)

C0/B65B:	A5EB    	LDA $EB		
C0/B65D:	20EDBA  	JSR $BAED
C0/B660:	B9E01E  	LDA $1EE0,Y
C0/B663:	3F04BBC0	AND $C0BB04,X
C0/B667:	99E01E  	STA $1EE0,Y
C0/B66A:	A902    	LDA #$02
C0/B66C:	4C5C9B  	JMP $9B5C


Clear Event Bit 4
(gen. act. D9)

C0/B66F:	A5EB    	LDA $EB		
C0/B671:	20EDBA  	JSR $BAED
C0/B674:	B9001F  	LDA $1F00,Y
C0/B677:	3F04BBC0	AND $C0BB04,X
C0/B67B:	99001F  	STA $1F00,Y
C0/B67E:	A902    	LDA #$02
C0/B680:	4C5C9B  	JMP $9B5C


Clear Event Bit 5
(gen. act. DB)

C0/B683:	A5EB    	LDA $EB		
C0/B685:	20EDBA  	JSR $BAED
C0/B688:	B9201F  	LDA $1F20,Y
C0/B68B:	3F04BBC0	AND $C0BB04,X
C0/B68F:	99201F  	STA $1F20,Y
C0/B692:	A902    	LDA #$02
C0/B694:	4C5C9B  	JMP $9B5C


Clear Event Bit 6
(gen. act. DD)

C0/B697:	A5EB    	LDA $EB		
C0/B699:	20EDBA  	JSR $BAED
C0/B69C:	B9401F  	LDA $1F40,Y
C0/B69F:	3F04BBC0	AND $C0BB04,X
C0/B6A3:	99401F  	STA $1F40,Y
C0/B6A6:	A902    	LDA #$02
C0/B6A8:	4C5C9B  	JMP $9B5C


Set bit $1DC9 + $xx
(gen. act. B8)

C0/B6AB:	A5EB    	LDA $EB		
C0/B6AD:	20EDBA  	JSR $BAED
C0/B6B0:	B9C91D  	LDA $1DC9,Y
C0/B6B3:	1FFCBAC0	ORA $C0BAFC,X
C0/B6B7:	99C91D  	STA $1DC9,Y
C0/B6BA:	A902    	LDA #$02
C0/B6BC:	4C5C9B  	JMP $9B5C


Clear bit $1DC9 + $xx
(gen. act. B9)

C0/B6BF:	A5EB    	LDA $EB		
C0/B6C1:	20EDBA  	JSR $BAED
C0/B6C4:	B9C91D  	LDA $1DC9,Y
C0/B6C7:	3F04BBC0	AND $C0BB04,X
C0/B6CB:	99C91D  	STA $1DC9,Y
C0/B6CE:	A902    	LDA #$02
C0/B6D0:	4C5C9B  	JMP $9B5C


Branch to the nth address following B6, where n is the last item selected from a
multiple-choice dialogue window.  Each address is 3 bytes, added to $CA0000/$0A0200.
(gen. act. B6)

C0/B6D3:	AD6E05  	LDA $056E		                                    	
C0/B6D6:	0A      	ASL A
C0/B6D7:	38      	SEC 
C0/B6D8:	6D6E05  	ADC $056E
C0/B6DB:	A8      	TAY
C0/B6DC:	B7E5    	LDA [$E5],Y
C0/B6DE:	851E    	STA $1E
C0/B6E0:	C8      	INY 
C0/B6E1:	B7E5    	LDA [$E5],Y
C0/B6E3:	851F    	STA $1F
C0/B6E5:	C8      	INY 
C0/B6E6:	B7E5    	LDA [$E5],Y
C0/B6E8:	18      	CLC
C0/B6E9:	69CA    	ADC #$CA
C0/B6EB:	85E7    	STA $E7
C0/B6ED:	A41E    	LDY $1E
C0/B6EF:	84E5    	STY $E5
C0/B6F1:	9C6E05  	STZ $056E
C0/B6F4:	4C6D9A  	JMP $9A6D       ; execute next general action


Jump to indexed subroutine based on the state of bit $1EB4(x)
Number of parameters = (nn * 3) + 1 (+1 accounts for the nn)
(gen. act. BE)

C0/B6F7:	A5EB    	LDA $EB	                                    
C0/B6F9:	0A      	ASL A
C0/B6FA:	38      	SEC 
C0/B6FB:	65EB    	ADC $EB
C0/B6FD:	1A      	INC A
C0/B6FE:	851E    	STA $1E
C0/B700:	641F    	STZ $1F
C0/B702:	A00200  	LDY #$0002
C0/B705:	B7E5    	LDA [$E5],Y
C0/B707:	852A    	STA $2A
C0/B709:	C8      	INY 
C0/B70A:	B7E5    	LDA [$E5],Y
C0/B70C:	852B    	STA $2B
C0/B70E:	C8      	INY 
C0/B70F:	B7E5    	LDA [$E5],Y
C0/B711:	852C    	STA $2C
C0/B713:	C8      	INY 
C0/B714:	4A      	LSR A
C0/B715:	4A      	LSR A
C0/B716:	4A      	LSR A
C0/B717:	4A      	LSR A
C0/B718:	C221    	REP #$21
C0/B71A:	69A001  	ADC #$01A0
C0/B71D:	5A      	PHY
C0/B71E:	20ABBA  	JSR $BAAB
C0/B721:	7A      	PLY
C0/B722:	E220    	SEP #$20      (8 bit accum./memory)
C0/B724:	C900    	CMP #$00
C0/B726:	D018    	BNE $B740
C0/B728:	C41E    	CPY $1E
C0/B72A:	D0D9    	BNE $B705
C0/B72C:	C221    	REP #$21
C0/B72E:	A5E5    	LDA $E5
C0/B730:	651E    	ADC $1E
C0/B732:	85E5    	STA $E5
C0/B734:	E220    	SEP #$20      (8 bit accum./memory)
C0/B736:	A5E7    	LDA $E7
C0/B738:	6900    	ADC #$00
C0/B73A:	85E7    	STA $E7
C0/B73C:	7B      	TDC 
C0/B73D:	4C6D9A  	JMP $9A6D       ; execute next general action

C0/B740:	A6E8    	LDX $E8		(from C0/B726)
C0/B742:	A51E    	LDA $1E
C0/B744:	18      	CLC
C0/B745:	65E5    	ADC $E5
C0/B747:	9D9405  	STA $0594,X
C0/B74A:	A5E6    	LDA $E6
C0/B74C:	651F    	ADC $1F
C0/B74E:	9D9505  	STA $0595,X
C0/B751:	A5E7    	LDA $E7
C0/B753:	6900    	ADC #$00
C0/B755:	9D9605  	STA $0596,X
C0/B758:	A52A    	LDA $2A
C0/B75A:	85E5    	STA $E5
C0/B75C:	9DF405  	STA $05F4,X
C0/B75F:	A52B    	LDA $2B
C0/B761:	85E6    	STA $E6
C0/B763:	9DF505  	STA $05F5,X
C0/B766:	A52C    	LDA $2C
C0/B768:	2903    	AND #$03
C0/B76A:	18      	CLC
C0/B76B:	69CA    	ADC #$CA
C0/B76D:	85E7    	STA $E7
C0/B76F:	9FF60500	STA $0005F6,X
C0/B773:	E8      	INX
C0/B774:	E8      	INX
C0/B775:	E8      	INX
C0/B776:	86E8    	STX $E8
C0/B778:	A901    	LDA #$01
C0/B77A:	9DC405  	STA $05C4,X
C0/B77D:	4C6D9A  	JMP $9A6D       ; execute next general action


Play song xx
(gen. act. F0)

C0/B780:	A5EB    	LDA $EB	
C0/B782:	297F    	AND #$7F
C0/B784:	8D0113  	STA $1301
C0/B787:	8D801F  	STA $1F80
C0/B78A:	A9FF    	LDA #$FF
C0/B78C:	8D0213  	STA $1302		(Set volume to FF (normal))
C0/B78F:	A5EB    	LDA $EB
C0/B791:	1004    	BPL $B797
C0/B793:	A914    	LDA #$14
C0/B795:	8002    	BRA $B799
C0/B797:	A910    	LDA #$10
C0/B799:	8D0013  	STA $1300
C0/B79C:	220400C5	JSL $C50004
C0/B7A0:	AD1042  	LDA $4210
C0/B7A3:	10FB    	BPL $B7A0
C0/B7A5:	A902    	LDA #$02
C0/B7A7:	4C5C9B  	JMP $9B5C

Play song xx, volume yy
(gen. act. EF)

C0/B7AA:	A5EB    	LDA $EB	
C0/B7AC:	297F    	AND #$7F
C0/B7AE:	8D0113  	STA $1301
C0/B7B1:	8D801F  	STA $1F80
C0/B7B4:	A5EC    	LDA $EC
C0/B7B6:	8D0213  	STA $1302
C0/B7B9:	A5EB    	LDA $EB
C0/B7BB:	1004    	BPL $B7C1
C0/B7BD:	A914    	LDA #$14
C0/B7BF:	8002    	BRA $B7C3
C0/B7C1:	A910    	LDA #$10
C0/B7C3:	8D0013  	STA $1300
C0/B7C6:	220400C5	JSL $C50004
C0/B7CA:	AD1042  	LDA $4210
C0/B7CD:	10FB    	BPL $B7CA
C0/B7CF:	A903    	LDA #$03
C0/B7D1:	4C5C9B  	JMP $9B5C

Fade in song xx with speed yy (higher == slower)
(gen. act. F1)
C0/B7D4:	A5EB    	LDA $EB	
C0/B7D6:	297F    	AND #$7F
C0/B7D8:	8D0113  	STA $1301
C0/B7DB:	8D801F  	STA $1F80
C0/B7DE:	A920    	LDA #$20
C0/B7E0:	8D0213  	STA $1302
C0/B7E3:	A5EB    	LDA $EB
C0/B7E5:	1004    	BPL $B7EB
C0/B7E7:	A914    	LDA #$14
C0/B7E9:	8002    	BRA $B7ED
C0/B7EB:	A910    	LDA #$10
C0/B7ED:	8D0013  	STA $1300
C0/B7F0:	220400C5	JSL $C50004
C0/B7F4:	A981    	LDA #$81
C0/B7F6:	8D0013  	STA $1300
C0/B7F9:	A5EC    	LDA $EC
C0/B7FB:	8D0113  	STA $1301
C0/B7FE:	A9FF    	LDA #$FF
C0/B800:	8D0213  	STA $1302
C0/B803:	220400C5	JSL $C50004
C0/B807:	AD1042  	LDA $4210
C0/B80A:	10FB    	BPL $B807
C0/B80C:	A903    	LDA #$03
C0/B80E:	4C5C9B  	JMP $9B5C

Fade out current song with speed xx (higher == slower)
(gen. act. F2)
C0/B811:	A981    	LDA #$81	
C0/B813:	8D0013  	STA $1300
C0/B816:	A5EB    	LDA $EB
C0/B818:	8D0113  	STA $1301
C0/B81B:	9C0213  	STZ $1302
C0/B81E:	220400C5	JSL $C50004
C0/B822:	A902    	LDA #$02
C0/B824:	4C5C9B  	JMP $9B5C

Continue song that was previously paused, xx is unknown
(gen. act. F3)
C0/B827:	A910    	LDA #$10	
C0/B829:	8D0013  	STA $1300
C0/B82C:	AD0913  	LDA $1309
C0/B82F:	8D0113  	STA $1301
C0/B832:	8D801F  	STA $1F80
C0/B835:	9C0213  	STZ $1302      (set volume to 0)
C0/B838:	220400C5	JSL $C50004
C0/B83C:	A981    	LDA #$81
C0/B83E:	8D0013  	STA $1300
C0/B841:	A5EB    	LDA $EB
C0/B843:	8D0113  	STA $1301
C0/B846:	A9FF    	LDA #$FF
C0/B848:	8D0213  	STA $1302      (set volume to FF (normal))
C0/B84B:	220400C5	JSL $C50004
C0/B84F:	A902    	LDA #$02
C0/B851:	4C5C9B  	JMP $9B5C

Play sound effect $EB
(gen. act. F4)
C0/B854:	A5EB    	LDA $EB	
C0/B856:	20D302  	JSR $02D3
C0/B859:	A902    	LDA #$02
C0/B85B:	4C5C9B  	JMP $9B5C

(gen. act. F5)
C0/B85E:	A918    	LDA #$18	
C0/B860:	8D0013  	STA $1300
C0/B863:	A5EB    	LDA $EB
C0/B865:	8D0113  	STA $1301
C0/B868:	A980    	LDA #$80
C0/B86A:	8D0213  	STA $1302
C0/B86D:	220400C5	JSL $C50004
C0/B871:	A983    	LDA #$83
C0/B873:	8D0013  	STA $1300
C0/B876:	A5EC    	LDA $EC
C0/B878:	8D0113  	STA $1301
C0/B87B:	A5ED    	LDA $ED
C0/B87D:	8D0213  	STA $1302
C0/B880:	220400C5	JSL $C50004
C0/B884:	A904    	LDA #$04
C0/B886:	4C5C9B  	JMP $9B5C

(gen. act. F6)
C0/B889:	A5EB    	LDA $EB	
C0/B88B:	8D0013  	STA $1300
C0/B88E:	A5EC    	LDA $EC
C0/B890:	8D0113  	STA $1301
C0/B893:	A5ED    	LDA $ED
C0/B895:	8D0213  	STA $1302
C0/B898:	220400C5	JSL $C50004
C0/B89C:	A904    	LDA #$04
C0/B89E:	4C5C9B  	JMP $9B5C

(gen. act. F7)
C0/B8A1:	A989    	LDA #$89	
C0/B8A3:	8D0013  	STA $1300
C0/B8A6:	220400C5	JSL $C50004
C0/B8AA:	A901    	LDA #$01
C0/B8AC:	4C5C9B  	JMP $9B5C

Pauses event queue, when it starts again is unknown, but it is APU-related
(gen. act. F8)
C0/B8AF:	AD4221  	LDA $2142	
C0/B8B2:	F001    	BEQ $B8B5
C0/B8B4:	60      	RTS
 
C0/B8B5:	A901    	LDA #$01       (from C0/B8B2)
C0/B8B7:	4C5C9B  	JMP $9B5C

Pauses event queue, resume when APU matches parameter
(gen. act. F9)
C0/B8BA:	A5EB    	LDA $EB
C0/B8BC:	CD4121  	CMP $2141
C0/B8BF:	F001    	BEQ $B8C2
C0/B8C1:	60      	RTS
 
C0/B8C2:	A902    	LDA #$02       (from C0/B8BF)
C0/B8C4:	4C5C9B  	JMP $9B5C

Pause event queue until song that is playing finishes (this is probably bad if a song that plays never ends)
(gen. act. FA)
C0/B8C7:	AD4321  	LDA $2143	
C0/B8CA:	F001    	BEQ $B8CD
C0/B8CC:	60      	RTS
 
C0/B8CD:	A901    	LDA #$01       (from C0/B8CA)
C0/B8CF:	4C5C9B  	JMP $9B5C

Advance event queue one byte, assembly version of NOP
(gen. act. FD)
C0/B8D2:	A901    	LDA #$01
C0/B8D4:	4C709B  	JMP $9B70

(gen. act. FE)
C0/B8D7:	A6E8    	LDX $E8         ; event stack pointer
C0/B8D9:	BDC405  	LDA $05C4,X
C0/B8DC:	3A      	DEC A
C0/B8DD:	9DC405  	STA $05C4,X     ; decrease loop count for current event
C0/B8E0:	F012    	BEQ $B8F4       ; branch if no more loops
C0/B8E2:	BDF105  	LDA $05F1,X
C0/B8E5:	85E5    	STA $E5
C0/B8E7:	BDF205  	LDA $05F2,X
C0/B8EA:	85E6    	STA $E6
C0/B8EC:	BDF305  	LDA $05F3,X
C0/B8EF:	85E7    	STA $E7         ; set event PC [?]
C0/B8F1:	4C6D9A  	JMP $9A6D       ; execute next general action

C0/B8F4:	A6E8    	LDX $E8         ; event stack pointer
C0/B8F6:	CA      	DEX
C0/B8F7:	CA      	DEX
C0/B8F8:	CA      	DEX             ; point to last event on stack
C0/B8F9:	86E8    	STX $E8         ; save reduced pointer position
C0/B8FB:	BD9405  	LDA $0594,X     ; previous event pointer
C0/B8FE:	85E5    	STA $E5         ; save for next general action
C0/B900:	BD9505  	LDA $0595,X
C0/B903:	85E6    	STA $E6
C0/B905:	BD9605  	LDA $0596,X
C0/B908:	85E7    	STA $E7
C0/B90A:	E400    	CPX $00         ; is this a subevent [?]
C0/B90C:	D009    	BNE $B917       ; branch if so
C0/B90E:	AC0308  	LDY $0803       ; visible character object's data offset
C0/B911:	B97D08  	LDA $087D,Y     ; backup movement type for character
C0/B914:	997C08  	STA $087C,Y     ; restore character mvmt type
C0/B917:	4C6D9A  	JMP $9A6D       ; execute next general action

(gen. act. 66)
(gen. act. 67)
(gen. act. 68)
(gen. act. 69)
(gen. act. 6D)
(gen. act. 6E)
(gen. act. 6F)
(gen. act. 76)
(gen. act. 83)
(gen. act. 9E)
(gen. act. 9F)
(gen. act. A3)
(gen. act. A4)
(gen. act. A5)
(gen. act. E5)
(gen. act. E6)
(gen. act. EC)
(gen. act. ED)
(gen. act. EE)
(gen. act. FC)
(gen. act. FF)
C0/B91A:	60      	RTS


Invoke game loading screen
(gen. act. AB)

C0/B91B:	A902    	LDA #$02		
C0/B91D:	8D0002  	STA $0200
C0/B920:	20CAC6  	JSR $C6CA      (jump to C3/0000->C3/001B)
C0/B923:	AFF17F30	LDA $307FF1
C0/B927:	18      	CLC
C0/B928:	690D    	ADC #$0D
C0/B92A:	8FF17F30	STA $307FF1
C0/B92E:	8D6D1F  	STA $1F6D      (RNG index)
C0/B931:	8DA11F  	STA $1FA1      (index when overworld encounter will occur)
C0/B934:	8DA21F  	STA $1FA2      (index when town/dungeon encounter will occur)
C0/B937:	8DA41F  	STA $1FA4      (overworld addition for encounter rate)
C0/B93A:	8DA31F  	STA $1FA3      (town/dungeon addition for encounter rate)
C0/B93D:	8DA51F  	STA $1FA5      (Veldt pack #, obviously $1FA1-$1FA5 will be the same at load up)
C0/B940:	AD0502  	LDA $0205
C0/B943:	2980    	AND #$80
C0/B945:	851A    	STA $1A
C0/B947:	ADDF1E  	LDA $1EDF
C0/B94A:	297F    	AND #$7F
C0/B94C:	051A    	ORA $1A
C0/B94E:	8DDF1E  	STA $1EDF
C0/B951:	6458    	STZ $58
C0/B953:	20F36C  	JSR $6CF3      (calls equipment check function)
C0/B956:	208603  	JSR $0386
C0/B959:	A901    	LDA #$01
C0/B95B:	4C5C9B  	JMP $9B5C


(gen. act. AC)

C0/B95E:	2020BD  	JSR $BD20		
C0/B961:	A901    	LDA #$01
C0/B963:	4C5C9B  	JMP $9B5C


Show world tearing apart
(gen. act. A9)

C0/B966:	200505  	JSR $0505		
C0/B969:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/B96C:	220368C2	JSL $C26803
C0/B970:	201505  	JSR $0515
C0/B973:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/B976:	207305  	JSR $0573
C0/B979:	AD0002  	LDA $0200
C0/B97C:	2980    	AND #$80
C0/B97E:	851A    	STA $1A
C0/B980:	ADDF1E  	LDA $1EDF
C0/B983:	297F    	AND #$7F
C0/B985:	051A    	ORA $1A
C0/B987:	8DDF1E  	STA $1EDF
C0/B98A:	208603  	JSR $0386
C0/B98D:	A901    	LDA #$01
C0/B98F:	4C5C9B  	JMP $9B5C


Show intro scene with Magiteks in the snowfield
(gen. act. AA)

C0/B992:	200505  	JSR $0505		
C0/B995:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/B998:	220068C2	JSL $C26800
C0/B99C:	201505  	JSR $0515      (BRA $B970... >_>)
C0/B99F:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/B9A2:	207305  	JSR $0573
C0/B9A5:	AD0002  	LDA $0200
C0/B9A8:	2980    	AND #$80
C0/B9AA:	851A    	STA $1A
C0/B9AC:	ADDF1E  	LDA $1EDF
C0/B9AF:	297F    	AND #$7F
C0/B9B1:	051A    	ORA $1A
C0/B9B3:	8DDF1E  	STA $1EDF
C0/B9B6:	208603  	JSR $0386
C0/B9B9:	A901    	LDA #$01
C0/B9BB:	4C5C9B  	JMP $9B5C

Show "The End" after a certain point in "Ending Theme #2," then play "The Prelude" afterwards
(gen. act. BB)

C0/B9BE:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/B9C1:	5C00F4E5	JMP $E5F400


Show train car ride out of the Magitek Factory
(gen. act. AE)

C0/B9C5:	200505  	JSR $0505		
C0/B9C8:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/B9CB:	0B      	PHD
C0/B9CC:	8B      	PHB
C0/B9CD:	08      	PHP 
C0/B9CE:	221200EE	JSL $EE0012
C0/B9D2:	28      	PLP 
C0/B9D3:	AB      	PLB
C0/B9D4:	2B      	PLD 
C0/B9D5:	7B      	TDC 
C0/B9D6:	201505  	JSR $0515
C0/B9D9:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/B9DC:	207305  	JSR $0573
C0/B9DF:	208603  	JSR $0386
C0/B9E2:	A901    	LDA #$01
C0/B9E4:	4C5C9B  	JMP $9B5C


Show airship scene from the ending
(gen. act. BF)

C0/B9E7:	200505  	JSR $0505		
C0/B9EA:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/B9ED:	0B      	PHD
C0/B9EE:	8B      	PHB
C0/B9EF:	08      	PHP 
C0/B9F0:	221500EE	JSL $EE0015
C0/B9F4:	28      	PLP 
C0/B9F5:	AB      	PLB
C0/B9F6:	2B      	PLD 
C0/B9F7:	7B      	TDC 
C0/B9F8:	201505  	JSR $0515
C0/B9FB:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/B9FE:	207305  	JSR $0573
C0/BA01:	208603  	JSR $0386
C0/BA04:	A901    	LDA #$01
C0/BA06:	4C5C9B  	JMP $9B5C

Delete all layer 3 rotating pyramids
(gen. act. A6)

C0/BA09:	9C8107  	STZ $0781		
C0/BA0C:	208D06  	JSR $068D
C0/BA0F:	A901    	LDA #$01
C0/BA11:	4C5C9B  	JMP $9B5C

Create layer 3 rotating pyramid around NPC X
(gen. act. A7)

C0/BA14:	A901    	LDA #$01		
C0/BA16:	8D8107  	STA $0781
C0/BA19:	A5EB    	LDA $EB
C0/BA1B:	8D0242  	STA $4202
C0/BA1E:	A929    	LDA #$29
C0/BA20:	8D0342  	STA $4203
C0/BA23:	EA      	NOP
C0/BA24:	EA      	NOP
C0/BA25:	EA      	NOP
C0/BA26:	AE1642  	LDX $4216
C0/BA29:	8E7F07  	STX $077F
C0/BA2C:	A902    	LDA #$02
C0/BA2E:	4C5C9B  	JMP $9B5C


(gen. act. BA)

C0/BA31:	A5EB    	LDA $EB		
C0/BA33:	8D0102  	STA $0201
C0/BA36:	200505  	JSR $0505
C0/BA39:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/BA3C:	221200C3	JSL $C30012
C0/BA40:	201505  	JSR $0515
C0/BA43:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/BA46:	207305  	JSR $0573
C0/BA49:	208603  	JSR $0386
C0/BA4C:	A902    	LDA #$02
C0/BA4E:	4C5C9B  	JMP $9B5C


; Show Floating Island Rise (General Action $A8)

C0/BA51:	200505  	JSR $0505		
C0/BA54:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/BA57:	220668C2	JSL $C26806
C0/BA5B:	201505  	JSR $0515
C0/BA5E:	207403  	JSR $0374      (turn off H/DMA, auto joypad read, NMI, and the screen)
C0/BA61:	207305  	JSR $0573
C0/BA64:	A901    	LDA #$01
C0/BA66:	4C5C9B  	JMP $9B5C


; Show World Getting Torn Apart (General Action $AD)

C0/BA69:	200505  	JSR $0505		     ; backup direct page bytes to $7E1200
C0/BA6C:	207403  	JSR $0374        ; turn off H/DMA, joypad read, NMI, screen
C0/BA6F:	220968C2	JSL $C26809
C0/BA73:	201505  	JSR $0515        ; restore direct page bytes from $7E1200
C0/BA76:	207403  	JSR $0374        ; turn off H/DMA, joypad read, NMI, screen
C0/BA79:	207305  	JSR $0573        ; set/enable NMI, IRQ
C0/BA7C:	A901    	LDA #$01         ; advance by one byte
C0/BA7E:	4C5C9B  	JMP $9B5C        ; advance event queue by one byte

; Update facing direction

C0/BA81:	AC0308  	LDY $0803        ; visible character's object data offset
C0/BA84:	B97F08  	LDA $087F,Y      ; facing direction
C0/BA87:	AA      	TAX              ; index it
C0/BA88:	ADB61E  	LDA $1EB6        ; field event bits
C0/BA8B:	29F0    	AND #$F0         ; remove facing direction
C0/BA8D:	1FFCBAC0	ORA $C0BAFC,X    ; bit for facing direction
C0/BA91:	8DB61E  	STA $1EB6        ; update event byte with facing direction
C0/BA94:	A506    	LDA $06          ; pressing buttons
C0/BA96:	100A    	BPL $BAA2        ; branch if not pressing A
C0/BA98:	ADB61E  	LDA $1EB6
C0/BA9B:	0910    	ORA #$10
C0/BA9D:	8DB61E  	STA $1EB6        ; set "pressing A" bit
C0/BAA0:	8008    	BRA $BAAA
C0/BAA2:	ADB61E  	LDA $1EB6
C0/BAA5:	29EF    	AND #$EF
C0/BAA7:	8DB61E  	STA $1EB6        ; else, remove "pressing A" bit
C0/BAAA:	60      	RTS
 
C0/BAAB:	20EDBA  	JSR $BAED		(from C0/B2E1, C0/B346, C0/B71E)
C0/BAAE:	B9801E  	LDA $1E80,Y
C0/BAB1:	3FFCBAC0	AND $C0BAFC,X
C0/BAB5:	60      	RTS
 
C0/BAB6:	20EDBA  	JSR $BAED
C0/BAB9:	B9A01E  	LDA $1EA0,Y
C0/BABC:	3FFCBAC0	AND $C0BAFC,X
C0/BAC0:	60      	RTS
 
; Check n-th NPC event bit
C0/BAC1:	20EDBA  	JSR $BAED         ; Y: byte index, X: bit index
C0/BAC4:	B9E01E  	LDA $1EE0,Y       ; NPC event byte
C0/BAC7:	3FFCBAC0	AND $C0BAFC,X     ; isolate X-th event bit
C0/BACB:	60      	RTS
 
C0/BACC:	20EDBA  	JSR $BAED
C0/BACF:	B9001F  	LDA $1F00,Y
C0/BAD2:	3FFCBAC0	AND $C0BAFC,X
C0/BAD6:	60      	RTS
 
C0/BAD7:	20EDBA  	JSR $BAED
C0/BADA:	B9201F  	LDA $1F20,Y
C0/BADD:	3FFCBAC0	AND $C0BAFC,X
C0/BAE1:	60      	RTS
 
C0/BAE2:	20EDBA  	JSR $BAED
C0/BAE5:	B9401F  	LDA $1F40,Y
C0/BAE8:	3FFCBAC0	AND $C0BAFC,X
C0/BAEC:	60      	RTS

; Get byte and bit indexes for Nth item
C0/BAED:	C220    	REP #$20          ; 16-bit A
C0/BAEF:	AA      	TAX               ; bit number
C0/BAF0:	4A      	LSR A
C0/BAF1:	4A      	LSR A
C0/BAF2:	4A      	LSR A             ; / 8 (8 bits per byte)
C0/BAF3:	A8      	TAY               ; index byte
C0/BAF4:	7B      	TDC               ; zero A/B
C0/BAF5:	E220    	SEP #$20          ; 8-bit A
C0/BAF7:	8A      	TXA               ; bit number
C0/BAF8:	2907    	AND #$07          ; modulo 8
C0/BAFA:	AA      	TAX               ; index bit
C0/BAFB:	60      	RTS
 
Data: bit LUT used by many, many things
C0/BAFC:	0102    	
C0/BAFE:	0408    	
C0/BB00:	1020    	
C0/BB02:	4080 
    
C0/BB04:	FEFD 
C0/BB05:	FBF7  	
C0/BB08:	EFDF
C0/BB0A:	BF7F	

C0/BB0C:	A600    	LDX $00        (from C0/BE87)
C0/BB0E:	9E801E  	STZ $1E80,X    (clear all event bits)
C0/BB11:	E8      	INX
C0/BB12:	E06000  	CPX #$0060
C0/BB15:	D0F7    	BNE $BB0E
C0/BB17:	60      	RTS
 
C0/BB18:	A600    	LDX $00        (from C0/BE8D)
C0/BB1A:	9E401E  	STZ $1E40,X    (set all treasure chests as not opened)
C0/BB1D:	E8      	INX
C0/BB1E:	E03000  	CPX #$0030
C0/BB21:	D0F7    	BNE $BB1A
C0/BB23:	60      	RTS

C0/BB24:	48      	PHA           (from C0/0015)
C0/BB25:	DA      	PHX
C0/BB26:	5A      	PHY
C0/BB27:	8B      	PHB
C0/BB28:	0B      	PHD
C0/BB29:	08      	PHP 
C0/BB2A:	7B      	TDC 
C0/BB2B:	E220    	SEP #$20      (8 bit accum./memory)
C0/BB2D:	C210    	REP #$10      (16 bit index registers)
C0/BB2F:	7B      	TDC 
C0/BB30:	48      	PHA
C0/BB31:	AB      	PLB
C0/BB32:	ADD11D  	LDA $1DD1      (load battle bits)
C0/BB35:	299F    	AND #$9F       (mask out event timers elapsing in battle and displaying event timers)
C0/BB37:	8DD11D  	STA $1DD1      (save battle bits)
C0/BB3A:	AD8811  	LDA $1188
C0/BB3D:	2910    	AND #$10
C0/BB3F:	F008    	BEQ $BB49
C0/BB41:	ADD11D  	LDA $1DD1      (load battle bits)
C0/BB44:	0940    	ORA #$40       (set  displaying of event timers)
C0/BB46:	8DD11D  	STA $1DD1      (save battle bits)
C0/BB49:	AD8811  	LDA $1188
C0/BB4C:	301A    	BMI $BB68
C0/BB4E:	AE8911  	LDX $1189
C0/BB51:	F006    	BEQ $BB59
C0/BB53:	CA      	DEX
C0/BB54:	8E8911  	STX $1189
C0/BB57:	800F    	BRA $BB68
C0/BB59:	AD8811  	LDA $1188
C0/BB5C:	2920    	AND #$20
C0/BB5E:	F008    	BEQ $BB68
C0/BB60:	ADD11D  	LDA $1DD1      (load battle bits)
C0/BB63:	0920    	ORA #$20       (set event timer elapsed in battle)
C0/BB65:	8DD11D  	STA $1DD1      (save battle bits)
C0/BB68:	AD8E11  	LDA $118E
C0/BB6B:	301A    	BMI $BB87
C0/BB6D:	AE8F11  	LDX $118F
C0/BB70:	F006    	BEQ $BB78
C0/BB72:	CA      	DEX
C0/BB73:	8E8F11  	STX $118F
C0/BB76:	800F    	BRA $BB87
C0/BB78:	AD8E11  	LDA $118E
C0/BB7B:	2920    	AND #$20
C0/BB7D:	F008    	BEQ $BB87
C0/BB7F:	ADD11D  	LDA $1DD1      (load battle bits)
C0/BB82:	0920    	ORA #$20       (set event timer elapsed in battle)
C0/BB84:	8DD11D  	STA $1DD1      (save battle bits)
C0/BB87:	AD9411  	LDA $1194
C0/BB8A:	301A    	BMI $BBA6
C0/BB8C:	AE9511  	LDX $1195
C0/BB8F:	F006    	BEQ $BB97
C0/BB91:	CA      	DEX
C0/BB92:	8E9511  	STX $1195
C0/BB95:	800F    	BRA $BBA6
C0/BB97:	AD9411  	LDA $1194
C0/BB9A:	2920    	AND #$20
C0/BB9C:	F008    	BEQ $BBA6
C0/BB9E:	ADD11D  	LDA $1DD1      (load battle bits)
C0/BBA1:	0920    	ORA #$20       (set event timer elapsed in battle)
C0/BBA3:	8DD11D  	STA $1DD1      (save battle bits)
C0/BBA6:	AD9A11  	LDA $119A
C0/BBA9:	301A    	BMI $BBC5
C0/BBAB:	AE9B11  	LDX $119B
C0/BBAE:	F006    	BEQ $BBB6
C0/BBB0:	CA      	DEX
C0/BBB1:	8E9B11  	STX $119B
C0/BBB4:	800F    	BRA $BBC5
C0/BBB6:	AD9A11  	LDA $119A
C0/BBB9:	2920    	AND #$20
C0/BBBB:	F008    	BEQ $BBC5
C0/BBBD:	ADD11D  	LDA $1DD1      (load battle bits)
C0/BBC0:	0920    	ORA #$20       (set event timer elapsed in battle)
C0/BBC2:	8DD11D  	STA $1DD1      (save battle bits)
C0/BBC5:	28      	PLP 
C0/BBC6:	2B      	PLD 
C0/BBC7:	AB      	PLB
C0/BBC8:	7A      	PLY
C0/BBC9:	FA      	PLX
C0/BBCA:	68      	PLA
C0/BBCB:	60      	RTS
 
C0/BBCC:	AE8911  	LDX $1189      (from C0/00D7)
C0/BBCF:	F004    	BEQ $BBD5
C0/BBD1:	CA      	DEX
C0/BBD2:	8E8911  	STX $1189
C0/BBD5:	AE8F11  	LDX $118F
C0/BBD8:	F004    	BEQ $BBDE
C0/BBDA:	CA      	DEX
C0/BBDB:	8E8F11  	STX $118F
C0/BBDE:	AE9511  	LDX $1195
C0/BBE1:	F004    	BEQ $BBE7
C0/BBE3:	CA      	DEX
C0/BBE4:	8E9511  	STX $1195
C0/BBE7:	AE9B11  	LDX $119B
C0/BBEA:	F004    	BEQ $BBF0
C0/BBEC:	CA      	DEX
C0/BBED:	8E9B11  	STX $119B
C0/BBF0:	60      	RTS
 
C0/BBF1:	A400    	LDY $00        (from C0/00D1)
C0/BBF3:	BE8911  	LDX $1189,Y
C0/BBF6:	D06B    	BNE $BC63
C0/BBF8:	BE8B11  	LDX $118B,Y
C0/BBFB:	D005    	BNE $BC02
C0/BBFD:	B98D11  	LDA $118D,Y
C0/BC00:	F061    	BEQ $BC63
C0/BC02:	A6E5    	LDX $E5
C0/BC04:	E00000  	CPX #$0000
C0/BC07:	D05A    	BNE $BC63
C0/BC09:	A5E7    	LDA $E7
C0/BC0B:	C9CA    	CMP #$CA
C0/BC0D:	D054    	BNE $BC63
C0/BC0F:	AE0308  	LDX $0803
C0/BC12:	BD6A08  	LDA $086A,X
C0/BC15:	290F    	AND #$0F
C0/BC17:	D04A    	BNE $BC63
C0/BC19:	BD6D08  	LDA $086D,X
C0/BC1C:	290F    	AND #$0F
C0/BC1E:	D043    	BNE $BC63
C0/BC20:	BE8B11  	LDX $118B,Y
C0/BC23:	86E5    	STX $E5
C0/BC25:	8EF405  	STX $05F4
C0/BC28:	B98D11  	LDA $118D,Y
C0/BC2B:	18      	CLC
C0/BC2C:	69CA    	ADC #$CA
C0/BC2E:	85E7    	STA $E7
C0/BC30:	8DF605  	STA $05F6
C0/BC33:	A20000  	LDX #$0000
C0/BC36:	8E9405  	STX $0594
C0/BC39:	A9CA    	LDA #$CA
C0/BC3B:	8D9605  	STA $0596
C0/BC3E:	A901    	LDA #$01
C0/BC40:	8DC705  	STA $05C7
C0/BC43:	A20300  	LDX #$0003
C0/BC46:	86E8    	STX $E8
C0/BC48:	A6DA    	LDX $DA
C0/BC4A:	BD7C08  	LDA $087C,X
C0/BC4D:	9D7D08  	STA $087D,X
C0/BC50:	A904    	LDA #$04
C0/BC52:	9D7C08  	STA $087C,X
C0/BC55:	7B      	TDC 
C0/BC56:	998B11  	STA $118B,Y
C0/BC59:	998C11  	STA $118C,Y
C0/BC5C:	998D11  	STA $118D,Y
C0/BC5F:	20ED2F  	JSR $2FED
C0/BC62:	60      	RTS
 
C0/BC63:	C8      	INY 
C0/BC64:	C8      	INY 
C0/BC65:	C8      	INY 
C0/BC66:	C8      	INY 
C0/BC67:	C8      	INY 
C0/BC68:	C8      	INY 
C0/BC69:	C01800  	CPY #$0018
C0/BC6C:	D085    	BNE $BBF3
C0/BC6E:	60      	RTS

; Check current tile for events (runs in main loop)

C0/BC6F:	A584    	LDA $84           ; "Map Loading"
C0/BC71:	D05C    	BNE $BCCF         ; exit if ^
C0/BC73:	A559    	LDA $59           ; "Menu Opening"
C0/BC75:	D058    	BNE $BCCF         ; exit if ^
C0/BC77:	AC0308  	LDY $0803         ; showing character's object data offset
C0/BC7A:	B96A08  	LDA $086A,Y       ; x coords
C0/BC7D:	290F    	AND #$0F          ; isolate pixel coords
C0/BC7F:	D04E    	BNE $BCCF         ; exit if null
C0/BC81:	B96908  	LDA $0869,Y       ; x coords (pixels/4096)
C0/BC84:	D049    	BNE $BCCF         ; exit if null
C0/BC86:	B96D08  	LDA $086D,Y       ; y coords
C0/BC89:	290F    	AND #$0F          ; isolate pixel coords
C0/BC8B:	D042    	BNE $BCCF         ; exit if null
C0/BC8D:	B96C08  	LDA $086C,Y       ; y coords (pixels/4096)
C0/BC90:	D03D    	BNE $BCCF         ; exit if null
C0/BC92:	A6E5    	LDX $E5           ; event stack pointer
C0/BC94:	E00000  	CPX #$0000        ; empty
C0/BC97:	D036    	BNE $BCCF         ; exit if event executing already
C0/BC99:	A5E7    	LDA $E7           ; event stack pointer bank
C0/BC9B:	C9CA    	CMP #$CA          ; base
C0/BC9D:	D030    	BNE $BCCF         ; exit if event executing already
C0/BC9F:	B97C08  	LDA $087C,Y       ; movement flags
C0/BCA2:	290F    	AND #$0F          ; isolate "Movement Type"
C0/BCA4:	C902    	CMP #$02          ; "User Controlled"
C0/BCA6:	D027    	BNE $BCCF         ; exit if not ^
C0/BCA8:	C220    	REP #$20          ; 16-bit A
C0/BCAA:	A582    	LDA $82           ; current map id
C0/BCAC:	0A      	ASL A             ; x2
C0/BCAD:	AA      	TAX               ; index it
C0/BCAE:	BF0200C4	LDA $C40002,X     ; get address of next map's tile data
C0/BCB2:	851E    	STA $1E           ; save it
C0/BCB4:	BF0000C4	LDA $C40000,X     ; get address of this map's tile data
C0/BCB8:	C51E    	CMP $1E           ; are they the same (no tile data)
C0/BCBA:	F013    	BEQ $BCCF         ; exit if ^
C0/BCBC:	AA      	TAX               ; index starting tile offset

C0/BCBD:	BF0000C4	LDA $C40000,X     ; tile XY position
C0/BCC1:	C5AF    	CMP $AF           ; compare to party's XY position
C0/BCC3:	F00E    	BEQ $BCD3         ; if match, branch and add tile event
C0/BCC5:	8A      	TXA               ; prepare increment
C0/BCC6:	18      	CLC               ; clear carry
C0/BCC7:	690500  	ADC #$0005        ; +5 (size of event tile struct)
C0/BCCA:	AA      	TAX               ; index it
C0/BCCB:	E41E    	CPX $1E           ; have we reached the next map's tiles
C0/BCCD:	D0EE    	BNE $BCBD         ; loop until end of this map's tiles
C0/BCCF:	7B      	TDC               ; clear A/B
C0/BCD0:	E220    	SEP #$20          ; 8-bit A
C0/BCD2:	60      	RTS

; Add Event to Stack (Tile event)

C0/BCD3:	BF0200C4	LDA $C40002,X     ; event pointer
C0/BCD7:	85E5    	STA $E5           ; set event address
C0/BCD9:	8DF405  	STA $05F4         ; add to event loops
C0/BCDC:	7B      	TDC               ; clear A/B
C0/BCDD:	997108  	STA $0871,Y       ; clear horizontal mvmt speed
C0/BCE0:	997308  	STA $0873,Y       ; clear vertical mvmt speed
C0/BCE3:	E220    	SEP #$20          ; 8-bit A
C0/BCE5:	997E08  	STA $087E,Y       ; clear mvmt direction
C0/BCE8:	A901    	LDA #$01          ; "on"
C0/BCEA:	8D8E07  	STA $078E         ; party is on a trigger
C0/BCED:	BF0400C4	LDA $C40004,X     ; event bank
C0/BCF1:	18      	CLC               ; clear carry
C0/BCF2:	69CA    	ADC #$CA          ; add to base event bank
C0/BCF4:	85E7    	STA $E7           ; set event bank
C0/BCF6:	8DF605  	STA $05F6         ; add to event loops
C0/BCF9:	A20000  	LDX #$0000        ; clear X
C0/BCFC:	8E9405  	STX $0594         ; zero event stack
C0/BCFF:	A9CA    	LDA #$CA          ; base event bank
C0/BD01:	8D9605  	STA $0596         ; zero event stack (treated as empty)
C0/BD04:	A901    	LDA #$01          ; one loop
C0/BD06:	8DC705  	STA $05C7         ; set event loop count [?]
C0/BD09:	A20300  	LDX #$0003        ; 3 bytes
C0/BD0C:	86E8    	STX $E8           ; set event stack pointer
C0/BD0E:	B97C08  	LDA $087C,Y       ; current movement flags
C0/BD11:	997D08  	STA $087D,Y       ; back them up
C0/BD14:	A904    	LDA #$04          ; "Facing Something" (user-controlled)
C0/BD16:	997C08  	STA $087C,Y       ; set movement type
C0/BD19:	20087E  	JSR $7E08         ; handle screen movement
C0/BD1C:	20ED2F  	JSR $2FED         ; [?]
C0/BD1F:	60      	RTS
 
C0/BD20:	6458    	STZ $58
C0/BD22:	AC0308  	LDY $0803
C0/BD25:	A901    	LDA #$01
C0/BD27:	996808  	STA $0868,Y
C0/BD2A:	207770  	JSR $7077
C0/BD2D:	A600    	LDX $00
C0/BD2F:	9B      	TXY
C0/BD30:	B90016  	LDA $1600,Y
C0/BD33:	9D7808  	STA $0878,X
C0/BD36:	B90116  	LDA $1601,Y
C0/BD39:	9D7908  	STA $0879,X
C0/BD3C:	7B      	TDC 
C0/BD3D:	9D7C08  	STA $087C,X
C0/BD40:	9D7D08  	STA $087D,X
C0/BD43:	A901    	LDA #$01
C0/BD45:	9D6808  	STA $0868,X
C0/BD48:	C221    	REP #$21
C0/BD4A:	8A      	TXA
C0/BD4B:	692900  	ADC #$0029
C0/BD4E:	AA      	TAX
C0/BD4F:	98      	TYA
C0/BD50:	18      	CLC
C0/BD51:	692500  	ADC #$0025
C0/BD54:	A8      	TAY
C0/BD55:	7B      	TDC 
C0/BD56:	E220    	SEP #$20      (8 bit accum./memory)
C0/BD58:	C05002  	CPY #$0250
C0/BD5B:	D0D3    	BNE $BD30
C0/BD5D:	AEA61F  	LDX $1FA6
C0/BD60:	8EFB07  	STX $07FB
C0/BD63:	A902    	LDA #$02
C0/BD65:	9D7C08  	STA $087C,X
C0/BD68:	AD681F  	LDA $1F68
C0/BD6B:	8D4307  	STA $0743
C0/BD6E:	203D6F  	JSR $6F3D
C0/BD71:	A0D907  	LDY #$07D9
C0/BD74:	8CFD07  	STY $07FD
C0/BD77:	8CFF07  	STY $07FF
C0/BD7A:	8C0108  	STY $0801
C0/BD7D:	204A71  	JSR $714A
C0/BD80:	200C52  	JSR $520C
C0/BD83:	A980    	LDA #$80
C0/BD85:	8DFA11  	STA $11FA
C0/BD88:	A901    	LDA #$01
C0/BD8A:	8584    	STA $84
C0/BD8C:	60      	RTS
 
Working SRAM initializing, ie 7E/1600 - 7E/1FFF:
C0/BD8D:	A600    	LDX $00        (from C0/007C)
C0/BD8F:	9E0016  	STZ $1600,X    (set character stats to 0)
C0/BD92:	E8      	INX
C0/BD93:	E05002  	CPX #$0250
C0/BD96:	D0F7    	BNE $BD8F
C0/BD98:	A600    	LDX $00
C0/BD9A:	A9FF    	LDA #$FF
C0/BD9C:	9D0016  	STA $1600,X    (set sprite to nothing)
C0/BD9F:	9D1E16  	STA $161E,X    (set esper equipped to nothing)
C0/BDA2:	C221    	REP #$21
C0/BDA4:	8A      	TXA
C0/BDA5:	692500  	ADC #$0025
C0/BDA8:	AA      	TAX
C0/BDA9:	7B      	TDC 
C0/BDAA:	E220    	SEP #$20       (8 bit accum./memory)
C0/BDAC:	E05002  	CPX #$0250
C0/BDAF:	D0E9    	BNE $BD9A
C0/BDB1:	A600    	LDX $00
C0/BDB3:	9E5018  	STZ $1850,X    (set setup of current parties to 0)
C0/BDB6:	E8      	INX
C0/BDB7:	E01000  	CPX #$0010
C0/BDBA:	D0F7    	BNE $BDB3
C0/BDBC:	A600    	LDX $00
C0/BDBE:	A502    	LDA $02
C0/BDC0:	9E6919  	STZ $1969,X    (set quantity of all items to 0)
C0/BDC3:	9D6918  	STA $1869,X    ($02 holds #$FF, which for items is nothing)
C0/BDC6:	E8      	INX
C0/BDC7:	E00001  	CPX #$0100
C0/BDCA:	D0F4    	BNE $BDC0
C0/BDCC:	A600    	LDX $00
C0/BDCE:	9E6E1A  	STZ $1A6E,X    (set current spell learned % to 0)
C0/BDD1:	E8      	INX
C0/BDD2:	E08802  	CPX #$0288     (have we done all spells for all characters yet?)
C0/BDD5:	D0F7    	BNE $BDCE      (branch if not)
C0/BDD7:	A600    	LDX $00
C0/BDD9:	9EF61C  	STZ $1CF6,X    (set morph time, and many other things to 0)
C0/BDDC:	E8      	INX
C0/BDDD:	E05700  	CPX #$0057
C0/BDE0:	D0F7    	BNE $BDD9

C0/BDE2:	A600    	LDX $00
C0/BDE4:	BF403CCF	LDA $CF3C40,X  (SwdTech names)
C0/BDE8:	9DF81C  	STA $1CF8,X    (store to SRAM)
C0/BDEB:	E8      	INX
C0/BDEC:	E03000  	CPX #$0030     (have we done 48 letters yet?)
C0/BDEF:	D0F3    	BNE $BDE4      (branch if not. Note, this renaming feature was never used in the US version, so this area of SRAM is free for other use)
C0/BDF1:	9C691A  	STZ $1A69      (set esper's collected byte 1 to 0)
C0/BDF4:	9C6A1A  	STZ $1A6A      (set esper's collected byte 2 to 0)
C0/BDF7:	9C6B1A  	STZ $1A6B      (set esper's collected byte 3 to 0)
C0/BDFA:	9C6C1A  	STZ $1A6C      (set esper's collected byte 4 to 0)
C0/BDFD:	A600    	LDX $00
C0/BDFF:	9EC91D  	STZ $1DC9,X    (set all battle variables, and formations that will appear on the veldt to 0)
C0/BE02:	E8      	INX
C0/BE03:	E05400  	CPX #$0054

C0/BE06:	D0F7    	BNE $BDFF
C0/BE08:	A600    	LDX $00
C0/BE0A:	BFA07AC4	LDA $C47AA0,X
C0/BE0E:	9D2C1D  	STA $1D2C,X    (set Gau's learned rages)
C0/BE11:	E8      	INX
C0/BE12:	E02000  	CPX #$0020     (have we done all 32 bytes yet?)
C0/BE15:	D0F3    	BNE $BE0A      (branch if not)
C0/BE17:	AF64F5E6	LDA $E6F564    
C0/BE1B:	8D291D  	STA $1D29      (set Strago's known lores, byte 1)
C0/BE1E:	AF65F5E6	LDA $E6F565
C0/BE22:	8D2A1D  	STA $1D2A      (set Strago's known lores, byte 2)
C0/BE25:	AF66F5E6	LDA $E6F566
C0/BE29:	8D2B1D  	STA $1D2B      (set Strago's known lores, byte 3)
C0/BE2C:	9C6505  	STZ $0565
C0/BE2F:	A2FF7F  	LDX #$7FFF
C0/BE32:	8E551D  	STX $1D55      (set R, G, and B for font to 31, aka white, although this is done in C3 already!)
C0/BE35:	A600    	LDX $00
C0/BE37:	BF021CED	LDA $ED1C02,X  
C0/BE3B:	9D571D  	STA $1D57,X    (set colors for wallpaper 1, or so it seems)
C0/BE3E:	E8      	INX
C0/BE3F:	E00E00  	CPX #$000E
C0/BE42:	D0F3    	BNE $BE37
C0/BE44:	A901    	LDA #$01
C0/BE46:	8DF31F  	STA $1FF3
C0/BE49:	8DF41F  	STA $1FF4
C0/BE4C:	8DF51F  	STA $1FF5
C0/BE4F:	8DF61F  	STA $1FF6
C0/BE52:	A600    	LDX $00
C0/BE54:	8E8911  	STX $1189
C0/BE57:	8E8F11  	STX $118F
C0/BE5A:	8E9511  	STX $1195
C0/BE5D:	8E9B11  	STX $119B
C0/BE60:	8E8B11  	STX $118B
C0/BE63:	8E9111  	STX $1191
C0/BE66:	8E9711  	STX $1197
C0/BE69:	8E9D11  	STX $119D
C0/BE6C:	7B      	TDC 
C0/BE6D:	8D8D11  	STA $118D
C0/BE70:	8D9311  	STA $1193
C0/BE73:	8D9911  	STA $1199
C0/BE76:	8D9F11  	STA $119F
C0/BE79:	20B670  	JSR $70B6
C0/BE7C:	9CF111  	STZ $11F1
C0/BE7F:	209D98  	JSR $989D
C0/BE82:	6458    	STZ $58
C0/BE84:	9C5905  	STZ $0559
C0/BE87:	200CBB  	JSR $BB0C      (clear all event bits)
C0/BE8A:	202852  	JSR $5228      (set all presence bits)
C0/BE8D:	2018BB  	JSR $BB18      (close all treasure chests)
C0/BE90:	A20300  	LDX #$0003
C0/BE93:	86E5    	STX $E5
C0/BE95:	8EF405  	STX $05F4
C0/BE98:	A9CA    	LDA #$CA
C0/BE9A:	85E7    	STA $E7
C0/BE9C:	8DF605  	STA $05F6      (CA/0003, which jumps to CA/5E33, which starts a new game)
C0/BE9F:	A20000  	LDX #$0000
C0/BEA2:	8E9405  	STX $0594      (hmmmm)
C0/BEA5:	A9CA    	LDA #$CA
C0/BEA7:	8D9605  	STA $0596      (this makes CA/0000, which is where the event code starts...)
C0/BEAA:	A901    	LDA #$01
C0/BEAC:	8DC705  	STA $05C7
C0/BEAF:	A20300  	LDX #$0003
C0/BEB2:	86E8    	STX $E8
C0/BEB4:	A902    	LDA #$02
C0/BEB6:	8D7D08  	STA $087D
C0/BEB9:	6447    	STZ $47
C0/BEBB:	60      	RTS
 
; "Do everything when a map is loaded"
C0/BEBC:	207403  	JSR $0374     (from C0/00A4)
C0/BEBF:	208A84  	JSR $848A
C0/BEC2:	A558    	LDA $58
C0/BEC4:	D032    	BNE $BEF8
C0/BEC6:	C220    	REP #$20       ; 16-bit A
C0/BEC8:	AD641F  	LDA $1F64      ; current map id, settings
C0/BECB:	29FF01  	AND #$01FF     ; isolate map id (index)
C0/BECE:	8D641F  	STA $1F64      ; update to only map index
C0/BED1:	8582    	STA $82        ; store index for encounters, chests [?]
C0/BED3:	7B      	TDC            ; zero A/B
C0/BED4:	E220    	SEP #$20       ; 8-bit A
C0/BED6:	20AD1C  	JSR $1CAD      ; load map properties to 0520 buffer
C0/BED9:	6447    	STZ $47
C0/BEDB:	9C7B07  	STZ $077B
C0/BEDE:	A901    	LDA #$01
C0/BEE0:	8585    	STA $85
C0/BEE2:	A600    	LDX $00
C0/BEE4:	8E2711  	STX $1127
C0/BEE7:	20B670  	JSR $70B6
C0/BEEA:	207F17  	JSR $177F
C0/BEED:	A600    	LDX $00
C0/BEEF:	8E8C07  	STX $078C      ; zero number of steps taken [?]
C0/BEF2:	9C8B07  	STZ $078B      ; zero number of battles encountered
C0/BEF5:	20DA6E  	JSR $6EDA
C0/BEF8:	204A71  	JSR $714A
C0/BEFB:	202746  	JSR $4627
C0/BEFE:	ADFA11  	LDA $11FA
C0/BF01:	2920    	AND #$20
C0/BF03:	D003    	BNE $BF08
C0/BF05:	202917  	JSR $1729
C0/BF08:	AD661F  	LDA $1F66
C0/BF0B:	8D4105  	STA $0541
C0/BF0E:	AD671F  	LDA $1F67
C0/BF11:	8D4205  	STA $0542
C0/BF14:	206D16  	JSR $166D
C0/BF17:	A20048  	LDX #$4800
C0/BF1A:	8E8B05  	STX $058B
C0/BF1D:	A20050  	LDX #$5000
C0/BF20:	8E8D05  	STX $058D
C0/BF23:	A20058  	LDX #$5800
C0/BF26:	8E8F05  	STX $058F
C0/BF29:	A6E5    	LDX $E5
C0/BF2B:	D009    	BNE $BF36
C0/BF2D:	A5E7    	LDA $E7
C0/BF2F:	C9CA    	CMP #$CA
C0/BF31:	D003    	BNE $BF36
C0/BF33:	20676F  	JSR $6F67
C0/BF36:	6484    	STZ $84
C0/BF38:	6457    	STZ $57
C0/BF3A:	6456    	STZ $56
C0/BF3C:	644C    	STZ $4C
C0/BF3E:	9C5E05  	STZ $055E
C0/BF41:	9C6705  	STZ $0567
C0/BF44:	645A    	STZ $5A
C0/BF46:	9C5A05  	STZ $055A
C0/BF49:	9C5B05  	STZ $055B
C0/BF4C:	9C5C05  	STZ $055C
C0/BF4F:	64BB    	STZ $BB
C0/BF51:	64BA    	STZ $BA
C0/BF53:	A901    	LDA #$01
C0/BF55:	8D9807  	STA $0798
C0/BF58:	203816  	JSR $1638      (get tile's layer properties)
C0/BF5B:	209205  	JSR $0592
C0/BF5E:	208D26  	JSR $268D
C0/BF61:	205F27  	JSR $275F
C0/BF64:	205C26  	JSR $265C
C0/BF67:	208328  	JSR $2883
C0/BF6A:	20D715  	JSR $15D7
C0/BF6D:	20174D  	JSR $4D17
C0/BF70:	20DA27  	JSR $27DA
C0/BF73:	20CE1C  	JSR $1CCE
C0/BF76:	207B1B  	JSR $1B7B
C0/BF79:	205C18  	JSR $185C
C0/BF7C:	20647F  	JSR $7F64
C0/BF7F:	200A56  	JSR $560A
C0/BF82:	2023C7  	JSR $C723
C0/BF85:	20FE35  	JSR $35FE
C0/BF88:	202138  	JSR $3821
C0/BF8B:	20A839  	JSR $39A8
C0/BF8E:	20E90F  	JSR $0FE9
C0/BF91:	20EB50  	JSR $50EB
C0/BF94:	20E356  	JSR $56E3
C0/BF97:	20D58E  	JSR $8ED5
C0/BF9A:	20178D  	JSR $8D17
C0/BF9D:	20F36C  	JSR $6CF3
C0/BFA0:	20B642  	JSR $42B6
C0/BFA3:	20DB6A  	JSR $6ADB
C0/BFA6:	ADB61E  	LDA $1EB6
C0/BFA9:	0940    	ORA #$40
C0/BFAB:	8DB61E  	STA $1EB6      (Set bit 6 of $1EB6 (event bit $1B6))
C0/BFAE:	A558    	LDA $58
C0/BFB0:	D014    	BNE $BFC6
C0/BFB2:	9CBE1E  	STZ $1EBE
C0/BFB5:	9CBF1E  	STZ $1EBF
C0/BFB8:	20A852  	JSR $52A8      (Load NPC data)
C0/BFBB:	205146  	JSR $4651
C0/BFBE:	ADB61E  	LDA $1EB6
C0/BFC1:	29BF    	AND #$BF
C0/BFC3:	8DB61E  	STA $1EB6      (Clear bit 6 of $1EB6 (event bit $1B6))
C0/BFC6:	20C155  	JSR $55C1
C0/BFC9:	205454  	JSR $5454
C0/BFCC:	200451  	JSR $5104
C0/BFCF:	203852  	JSR $5238
C0/BFD2:	ADFA11  	LDA $11FA      ; map flags
C0/BFD5:	3003    	BMI $BFDA      ; branch if "Enable startup"
C0/BFD7:	4CA4C0  	JMP $C0A4

Map is loaded, trigger an event (most of the time it's CA/5EB3)
C0/BFDA:	C220    	REP #$20      (16 bit accum./memory)
C0/BFDC:	AD641F  	LDA $1F64      ; map properties
C0/BFDF:	29FF01  	AND #$01FF     ; isolate map index
C0/BFE2:	851E    	STA $1E        ; store
C0/BFE4:	0A      	ASL A          ; x2
C0/BFE5:	18      	CLC
C0/BFE6:	651E    	ADC $1E        ; +index
C0/BFE8:	AA      	TAX            ; index by map ID * 3
C0/BFE9:	7B      	TDC            ; clear A/B
C0/BFEA:	E220    	SEP #$20       ; 8-bit A
C0/BFEC:	A9B2    	LDA #$B2
C0/BFEE:	8D2406  	STA $0624      (B2 = "call subroutine" for events)
C0/BFF1:	BF00FAD1	LDA $D1FA00,X  (event pointer, low byte)
C0/BFF5:	8D2506  	STA $0625
C0/BFF8:	852A    	STA $2A
C0/BFFA:	BF01FAD1	LDA $D1FA01,X  (event pointer, middle byte)
C0/BFFE:	8D2606  	STA $0626
C0/C001:	852B    	STA $2B
C0/C003:	BF02FAD1	LDA $D1FA02,X  (event pointer, high byte)
C0/C007:	8D2706  	STA $0627
C0/C00A:	18      	CLC
C0/C00B:	69CA    	ADC #$CA
C0/C00D:	852C    	STA $2C
C0/C00F:	A72A    	LDA [$2A]
C0/C011:	C9FE    	CMP #$FE       (is it the "end event" command?)
C0/C013:	D003    	BNE $C018      (branch if not)
C0/C015:	4CA4C0  	JMP $C0A4

C0/C018:	A9D3    	LDA #$D3
C0/C01A:	8D2806  	STA $0628
C0/C01D:	A9CF    	LDA #$CF
C0/C01F:	8D2906  	STA $0629
C0/C022:	A9FD    	LDA #$FD
C0/C024:	8D2A06  	STA $062A
C0/C027:	A9FE    	LDA #$FE
C0/C029:	8D2B06  	STA $062B
C0/C02C:	ADB91E  	LDA $1EB9      (load event bits)
C0/C02F:	0980    	ORA #$80       (set bit that disables buttons and tweaks map display in multiparty areas)
C0/C031:	8DB91E  	STA $1EB9
C0/C034:	A6E8    	LDX $E8
C0/C036:	A5E5    	LDA $E5
C0/C038:	9D9405  	STA $0594,X
C0/C03B:	A5E6    	LDA $E6
C0/C03D:	9D9505  	STA $0595,X
C0/C040:	A5E7    	LDA $E7
C0/C042:	9D9605  	STA $0596,X
C0/C045:	A924    	LDA #$24
C0/C047:	85E5    	STA $E5
C0/C049:	9DF405  	STA $05F4,X
C0/C04C:	A906    	LDA #$06
C0/C04E:	85E6    	STA $E6
C0/C050:	9DF505  	STA $05F5,X
C0/C053:	A900    	LDA #$00
C0/C055:	85E7    	STA $E7
C0/C057:	9FF60500	STA $0005F6,X
C0/C05B:	E8      	INX
C0/C05C:	E8      	INX
C0/C05D:	E8      	INX
C0/C05E:	86E8    	STX $E8
C0/C060:	A901    	LDA #$01
C0/C062:	9DC405  	STA $05C4,X
C0/C065:	AC0308  	LDY $0803
C0/C068:	B97C08  	LDA $087C,Y
C0/C06B:	997D08  	STA $087D,Y
C0/C06E:	205A9A  	JSR $9A5A
C0/C071:	ADB91E  	LDA $1EB9
C0/C074:	1014    	BPL $C08A
C0/C076:	207875  	JSR $7578
C0/C079:	203C57  	JSR $573C
C0/C07C:	20081F  	JSR $1F08
C0/C07F:	20C21F  	JSR $1FC2
C0/C082:	208120  	JSR $2081
C0/C085:	20371E  	JSR $1E37
C0/C088:	80E4    	BRA $C06E
C0/C08A:	A7E5    	LDA [$E5]
C0/C08C:	C9FE    	CMP #$FE       (is it the "end event" command?)
C0/C08E:	D014    	BNE $C0A4      (branch if not)
C0/C090:	A6E8    	LDX $E8
C0/C092:	CA      	DEX
C0/C093:	CA      	DEX
C0/C094:	CA      	DEX
C0/C095:	BC9405  	LDY $0594,X
C0/C098:	D00A    	BNE $C0A4
C0/C09A:	BD9605  	LDA $0596,X
C0/C09D:	C9CA    	CMP #$CA
C0/C09F:	D003    	BNE $C0A4
C0/C0A1:	205A9A  	JSR $9A5A
C0/C0A4:	ADFA11  	LDA $11FA
C0/C0A7:	2940    	AND #$40
C0/C0A9:	D003    	BNE $C0AE
C0/C0AB:	204D0F  	JSR $0F4D
C0/C0AE:	207E46  	JSR $467E
C0/C0B1:	20A5C8  	JSR $C8A5
C0/C0B4:	204E03  	JSR $034E
C0/C0B7:	9CFA11  	STZ $11FA
C0/C0BA:	6458    	STZ $58
C0/C0BC:	20E57F  	JSR $7FE5		(? Location name loading function)
C0/C0BF:	64DC    	STZ $DC
C0/C0C1:	A5DC    	LDA $DC
C0/C0C3:	C5DD    	CMP $DD
C0/C0C5:	F013    	BEQ $C0DA
C0/C0C7:	AA      	TAX
C0/C0C8:	BC0308  	LDY $0803,X
C0/C0CB:	203958  	JSR $5839
C0/C0CE:	B97708  	LDA $0877,Y
C0/C0D1:	997608  	STA $0876,Y
C0/C0D4:	E6DC    	INC $DC
C0/C0D6:	E6DC    	INC $DC
C0/C0D8:	80E7    	BRA $C0C1
C0/C0DA:	6447    	STZ $47
C0/C0DC:	207B67  	JSR $677B
C0/C0DF:	E647    	INC $47
C0/C0E1:	207B67  	JSR $677B
C0/C0E4:	E647    	INC $47
C0/C0E6:	207B67  	JSR $677B
C0/C0E9:	E647    	INC $47
C0/C0EB:	207B67  	JSR $677B      (JMP fool!)
C0/C0EE:	60      	RTS
 
C0/C0EF:	AD8A07  	LDA $078A       ; "Disable Battle Blur/SFX"
C0/C0F2:	2940    	AND #$40        ; isolate "Disable Battle SFX"
C0/C0F4:	D005    	BNE $C0FB       ; branch if ^
C0/C0F6:	A9C1    	LDA #$C1        ; encounter sound effect
C0/C0F8:	20D302  	JSR $02D3       ; play sound effect

C0/C0FB:	AD8A07  	LDA $078A       ; "Disable Battle Blur/SFX"
C0/C0FE:	303D    	BMI $C13D       ; exit if blur disabled
C0/C100:	6446    	STZ $46         ; zero frame counter
C0/C102:	206405  	JSR $0564       ; wait until after next NMI
C0/C105:	A546    	LDA $46         ; how many frames waited
C0/C107:	C910    	CMP #$10        ; waited 16 frames
C0/C109:	B004    	BCS $C10F       ; branch if 16+ frames (NMIs)
C0/C10B:	2907    	AND #$07
C0/C10D:	8002    	BRA $C111
C0/C10F:	290F    	AND #$0F
C0/C111:	0A      	ASL A
C0/C112:	0A      	ASL A
C0/C113:	0A      	ASL A
C0/C114:	0A      	ASL A           ; x16
C0/C115:	090F    	ORA #$0F
C0/C117:	8F33827E	STA $7E8233
C0/C11B:	8F37827E	STA $7E8237
C0/C11F:	8F3B827E	STA $7E823B
C0/C123:	8F3F827E	STA $7E823F
C0/C127:	8F43827E	STA $7E8243
C0/C12B:	8F47827E	STA $7E8247
C0/C12F:	8F4B827E	STA $7E824B
C0/C133:	8F4F827E	STA $7E824F
C0/C137:	A546    	LDA $46
C0/C139:	C920    	CMP #$20
C0/C13B:	D0C5    	BNE $C102
C0/C13D:	60      	RTS
 
C0/C13E:	20EFC0  	JSR $C0EF		(from C0/0113)
C0/C141:	207403  	JSR $0374
C0/C144:	200505  	JSR $0505
C0/C147:	209170  	JSR $7091
C0/C14A:	AE0308  	LDX $0803
C0/C14D:	8EA61F  	STX $1FA6      ; backup current showing object data offset
C0/C150:	BD7F08  	LDA $087F,X
C0/C153:	8D681F  	STA $1F68      ; backup party facing direction
C0/C156:	A5B2    	LDA $B2
C0/C158:	8D4407  	STA $0744      ; backup party Z-level
C0/C15B:	08      	PHP            ; store flags
C0/C15C:	8B      	PHB            ; store Bank
C0/C15D:	0B      	PHD            ; store Direct Page
C0/C15E:	220000C2	JSR $C20000    ; enter battle
C0/C162:	2B      	PLD            ; restore Direct Page
C0/C163:	AB      	PLB            ; restore Bank
C0/C164:	28      	PLP            ; restore flags
C0/C165:	207403  	JSR $0374
C0/C168:	201505  	JSR $0515
C0/C16B:	207770  	JSR $7077
C0/C16E:	A901    	LDA #$01
C0/C170:	8558    	STA $58
C0/C172:	207305  	JSR $0573
C0/C175:	60      	RTS

; Overworld Encounter Check

C0/C176:	7B      	TDC            ; zero A/B
C0/C177:	201505  	JSR $0515      ; restore field direct page from $1200-$12FF
C0/C17A:	AD641F  	LDA $1F64      ; current map index
C0/C17D:	0A      	ASL A          ; x2
C0/C17E:	0A      	ASL A          ; x4
C0/C17F:	0A      	ASL A          ; x8
C0/C180:	851A    	STA $1A        ; (0 for WoB Overworld, 8 for WoR Overworld)
C0/C182:	ADF911  	LDA $11F9      ; world map terrain type [?]
C0/C185:	2907    	AND #$07       ; isolate background index
C0/C187:	051A    	ORA $1A        ; add map index to top bits
C0/C189:	AA      	TAX            ; index it
C0/C18A:	BF7FC2C0	LDA $C0C27F,X  ; battle background for map
C0/C18E:	8FE21100	STA $0011E2    ; save (for dance check in C2)
C0/C192:	7B      	TDC            ; zero A/B
C0/C193:	8FE31100	STA $0011E3    ; allows reading background in 16-bit [?]
C0/C197:	8A      	TXA            ; get index again
C0/C198:	2907    	AND #$07       ; isolate "background index"
C0/C19A:	AA      	TAX            ; index it
C0/C19B:	BF8FC2C0	LDA $C0C28F,X  ; encounter danger for terrain [?]
C0/C19F:	8522    	STA $22        ; save it
C0/C1A1:	6423    	STZ $23        ; zero top byte
C0/C1A3:	BF97C2C0	LDA $C0C297,X  ; enemy pack(s) group for terrain
C0/C1A7:	8520    	STA $20        ; save it
C0/C1A9:	6421    	STZ $21        ; zero top byte
C0/C1AB:	AD641F  	LDA $1F64      ; current map index
C0/C1AE:	851F    	STA $1F        ; save it (0 for WoB, 1 for WoR)
C0/C1B0:	641E    	STZ $1E        ; [?] not necessary (see below)
C0/C1B2:	AD611F  	LDA $1F61      ; Y position on world map (at map load time)
C0/C1B5:	29E0    	AND #$E0       ; which group of 32
C0/C1B7:	851E    	STA $1E        ; save it
C0/C1B9:	AD601F  	LDA $1F60      ; X position on world map (at map load time)
C0/C1BC:	4A      	LSR A          ; / 2
C0/C1BD:	4A      	LSR A          ; / 4
C0/C1BE:	4A      	LSR A          ; / 8
C0/C1BF:	291C    	AND #$1C       ; which group of 32 (shifted down)
C0/C1C1:	051E    	ORA $1E        ; combine with Y group
C0/C1C3:	851E    	STA $1E        ; this is which 32x32 region we're in
C0/C1C5:	C220    	REP #$20       ; 16-bit A
C0/C1C7:	A51E    	LDA $1E        ; full region index (WoB/WoR) [x4]
C0/C1C9:	0520    	ORA $20        ; add offset based on terrain type
C0/C1CB:	AA      	TAX            ; index it
C0/C1CC:	7B      	TDC            ; zero A/B
C0/C1CD:	E220    	SEP #$20       ; 8-bit A
C0/C1CF:	BF0054CF	LDA $CF5400,X  ; load enemy pack(s) for region + terrain
C0/C1D3:	8524    	STA $24        ; save
C0/C1D5:	C9FF    	CMP #$FF       ; is it a Veldt pack
C0/C1D7:	D006    	BNE $C1DF      ; branch if not ^
C0/C1D9:	A90F    	LDA #$0F       ; "Leap Command", "Gau can return", etc
C0/C1DB:	8FE41100	STA $0011E4    ; set Veldt flags (leap, gau, music)

C0/C1DF:	C220    	REP #$20       ; 16-bit A
C0/C1E1:	A51E    	LDA $1E        ; region index (x4)
C0/C1E3:	4A      	LSR A          ; / 2
C0/C1E4:	4A      	LSR A          ; / 4
C0/C1E5:	AA      	TAX            ; plain region index (32x32 tile section)
C0/C1E6:	7B      	TDC            ; zero A/B
C0/C1E7:	E220    	SEP #$20       ; 8-bit A
C0/C1E9:	BF0058CF	LDA $CF5800,X  ; encounter rate for this region
C0/C1ED:	A422    	LDY $22        ; encounter rate for terrain type
C0/C1EF:	F005    	BEQ $C1F6      ; branch if zero (used bottom two bits)
C0/C1F1:	4A      	LSR A          ; >> 1
C0/C1F2:	4A      	LSR A          ; >> 2 (get next two bits)
C0/C1F3:	88      	DEY            ; decrement counter
C0/C1F4:	D0FB    	BNE $C1F1      ; loop till this terrain's encounter rate

C0/C1F6:	2903    	AND #$03       ; isolate rate for this region/terrain
C0/C1F8:	C903    	CMP #$03       ; "null" rate (no encounters)
C0/C1FA:	F07C    	BEQ $C278      ; exit if ^
C0/C1FC:	851A    	STA $1A        ; save rate
C0/C1FE:	ADDF11  	LDA $11DF      ; field effects (from equipment, etc)
C0/C201:	2903    	AND #$03       ; isolate "Moogle Charm", "Charm Bangle"
C0/C203:	0A      	ASL A          ; << 1
C0/C204:	0A      	ASL A          ; << 2
C0/C205:	051A    	ORA $1A        ; add to encounter rate index
C0/C207:	0A      	ASL A          ; x2
C0/C208:	AA      	TAX            ; index to rate for terrain/region/effects
C0/C209:	BF9FC2C0	LDA $C0C29F,X  ; low byte of rate
C0/C20D:	1FA0C2C0	ORA $C0C2A0,X  ; hi byte of rate
C0/C211:	F065    	BEQ $C278      ; exit if no encounters
C0/C213:	C220    	REP #$20       ; 16-bit A
C0/C215:	AD6E1F  	LDA $1F6E      ; encounter counter
C0/C218:	18      	CLC            ; clear carry
C0/C219:	7F9FC2C0	ADC $C0C29F,X  ; add full encounter rate
C0/C21D:	9003    	BCC $C222      ; branch if no overflow
C0/C21F:	A900FF  	LDA #$FF00     ; else, load max
C0/C222:	8D6E1F  	STA $1F6E      ; save updated counter value
C0/C225:	7B      	TDC            ; zero A/B
C0/C226:	E220    	SEP #$20       ; 8-bit A
C0/C228:	2079C4  	JSR $C479      ; special random(255) getter
C0/C22B:	CD6F1F  	CMP $1F6F      ; compare to hibyte of counter
C0/C22E:	B048    	BCS $C278      ; exit if higher than counter (no encounter)

C0/C230:	9C6E1F  	STZ $1F6E      ; else, zero counter
C0/C233:	9C6F1F  	STZ $1F6F      ; else, zero counter
C0/C236:	A524    	LDA $24        ; enemy pack(s) index
C0/C238:	C9FF    	CMP #$FF       ; Veldt pack [?]
C0/C23A:	D003    	BNE $C23F      ; branch if not ^
C0/C23C:	4CDFC2  	JMP $C2DF      ; else, pick a Veldt formation

C0/C23F:	C220    	REP #$20       ; 16-bit A
C0/C241:	0A      	ASL A          ; x2
C0/C242:	0A      	ASL A          ; x4
C0/C243:	0A      	ASL A          ; x8
C0/C244:	AA      	TAX            ; index to first formation
C0/C245:	7B      	TDC            ; zero A/B
C0/C246:	E220    	SEP #$20       ; 8-bit A
C0/C248:	2096C4  	JSR $C496      ; another special random(255) getter
C0/C24B:	C950    	CMP #$50       ; 31%
C0/C24D:	900E    	BCC $C25D      ; branch if in first 31%
C0/C24F:	E8      	INX
C0/C250:	E8      	INX            ; point to next formation
C0/C251:	C9A0    	CMP #$A0       ; next 31%
C0/C253:	9008    	BCC $C25D      ; branch if in next 31%
C0/C255:	E8      	INX
C0/C256:	E8      	INX            ; point to next formation
C0/C257:	C9F0    	CMP #$F0       ; next 31%
C0/C259:	9002    	BCC $C25D      ; branch if in next 31%
C0/C25B:	E8      	INX
C0/C25C:	E8      	INX            ; point to next formation

C0/C25D:	C220    	REP #$20       ; 16-bit A
C0/C25F:	BF0048CF	LDA $CF4800,X  ; load formation ID
C0/C263:	8FE01100	STA $0011E0    ; save formation ID
C0/C267:	7B      	TDC            ; zero A/B
C0/C268:	E220    	SEP #$20       ; 8-bit A
C0/C26A:	ADD71E  	LDA $1ED7      ; some field effects
C0/C26D:	2910    	AND #$10       ; "continue current music"
C0/C26F:	4A      	LSR A          ; shift to new bit
C0/C270:	8FE41100	STA $0011E4    ; save ^ flag
C0/C274:	A901    	LDA #$01       ; flag that encounter should happen
C0/C276:	8001    	BRA $C279      ; finish

C0/C278:	7B      	TDC            ; zero A/B (no encounter)

C0/C279:	48      	PHA            ; store whether encounter happens
C0/C27A:	200505  	JSR $0505      ; backup field direct page to $1200-$12FF
C0/C27D:	68      	PLA            ; restore whether encounter happens
C0/C27E:	6B      	RTL
 
; Battle Backgrounds for Balance Overworld

C0/C27F:	00      (WoB grass, nice blue sky)
C2/C280:	01      (WoR forest, brownish cast)   
C0/C281:	02      (WoB desert, blue sky)
C0/C282:	03      (WoB forest, lush green)
C0/C283:	04      (town background.. tint seems to correspond to FF3usME's "Zozo - Inside buildings", rather than "Fanatics' Tower - Rooms" )
C0/C284:	05      (WoR dry land.. pinkish sky)
C0/C285:	06      (WoB Veldt.. dry land, blue sky.. believe I've seen this for WoR Veldt, too)
C0/C286:	07      (falling sky en route to Floating Continent)

; Battle Backgrounds for Ruin Overworld

C0/C287:	00      (WoB grass, nice blue sky)
C0/C288:	01      (WoR forest, brownish cast)
C0/C289:	2F      (WoR desert, pinkish sky)
C0/C28A:	03      (WoB forest, lush green)
C0/C28B:	05      (WoR dry land.. pinkish sky)
C0/C28C:	05      (WoR dry land.. pinkish sky)
C0/C28D:	06      (WoB Veldt.. dry land, blue sky.. believe I've seen this for WoR Veldt, too)
C0/C28E:	07      (falling sky en route to Floating Continent)

; Encounter Rate Offset for Terrain Type
; Full region encounter rates pack 4 rates into 8 bits
; ggffddww (eg: grass, forest, desert, wasteland)

C0/C28F:	03    ; grass             
C0/C290:	02    ; ruin forest
C0/C291:	01    ; desert
C0/C292:	02    ; good forest
C0/C293:	03    ; wasteland/town [?]
C0/C294:	00    ; wasteland
C0/C295:	03    ; veldt
C0/C296:	03    ; sky fall
 
; Enemy Pack Groups for Terrain Type

C0/C297:	00    ; grass             
C0/C298:	01    ; ruin forest
C0/C299:	02    ; desert
C0/C29A:	01    ; good forest
C0/C29B:	00    ; wasteland/town [?]
C0/C29C:	03    ; wasteland
C0/C29D:	00    ; veldt
C0/C29E:	00    ; sky fall

; Normal Encounter Rates (Overworld)
 
C0/C29F:	C000  ; normal encounter frequency
C0/C2A1:	6000  ; fewer encounters
C0/C2A3:	8001  ; more encounters
C0/C2A5:	0000  ; no encounters
 
; Encounter Rates w/ Charm Bangle (Overworld)
 
C0/C2A7:	6000  ; normal encounter frequency
C0/C2A9:	3000  ; fewer encounters
C0/C2AB:	C000  ; more encounters
C0/C2AD:	0000  ; no encounters
 
; Encounter Rates w/ Moogle Charm (Overworld)
 
C0/C2AF:	0000
C0/C2B1:	0000
C0/C2B3:	0000
C0/C2B5:	0000
 
; Encounter Rates w/ Moogle Charm and Charm Bangle (Overworld)
 
C0/C2B7:	0000
C0/C2B9:	0000
C0/C2BB:	0000
C0/C2BD:	0000
 
; Normal Encounter Rates (Dungeon)
 
C0/C2BF:	7000  ; normal encounters
C0/C2C1:	4000  ; fewer encounters
C0/C2C3:	6001  ; more encounters
C0/C2C5:	0002  ; most encounters [?]
 
; Encounter Rates w/ Charm Bangle (Dungeon)
 
C0/C2C7:	3800  ; normal encounters
C0/C2C9:	2000  ; fewer encounters
C0/C2CB:	B000  ; more encounters
C0/C2CD:	0001  ; most encounters [?]
 
; Encounter Rates w/ Moogle Charm (Dungeon)
 
C0/C2CF:	0000
C0/C2D1:	0000
C0/C2D3:	0000
C0/C2D5:	0000
 
; Encounter Rates w/ Moogle Charm and Charm Bangle (Dungeon)
 
C0/C2D7:	0000
C0/C2D9:	0000
C0/C2DB:	0000
C0/C2DD:	0000

; Pick a Veldt Enemy Pack Formation

C0/C2DF:	EEA51F  	INC $1FA5      (increment Veldt pack #)
C0/C2E2:	ADA51F  	LDA $1FA5      (load Veldt pack #)
C0/C2E5:	293F    	AND #$3F
C0/C2E7:	AA      	TAX
C0/C2E8:	BDDD1D  	LDA $1DDD,X    (load formations seen so they appear on the Veldt)
C0/C2EB:	D007    	BNE $C2F4      (branch if seen at least one formation on this set)
C0/C2ED:	8A      	TXA
C0/C2EE:	1A      	INC A          (check next byte)
C0/C2EF:	293F    	AND #$3F       (keep it within range)
C0/C2F1:	AA      	TAX
C0/C2F2:	80F4    	BRA $C2E8      (and try again, this would loop infinitely if no formations were ever seen)
C0/C2F4:	851A    	STA $1A
C0/C2F6:	8A      	TXA
C0/C2F7:	8DA51F  	STA $1FA5      (store as next Veldt pack encounter)
C0/C2FA:	C220    	REP #$20      (16 bit accum./memory)
C0/C2FC:	0A      	ASL A
C0/C2FD:	0A      	ASL A
C0/C2FE:	0A      	ASL A
C0/C2FF:	851E    	STA $1E        (save (group# * 8) AND #$FFF8)
C0/C301:	7B      	TDC 
C0/C302:	E220    	SEP #$20      (8 bit accum./memory)
C0/C304:	2096C4  	JSR $C496      (use $1FA2 and $1FA3 to get a random number)
C0/C307:	2907    	AND #$07       (keep only the lowest 3 bits)
C0/C309:	AA      	TAX
C0/C30A:	A51A    	LDA $1A
C0/C30C:	3FFCBAC0	AND $C0BAFC,X  (get 01,02,04,08,10,20,40,80 based on value in X)
C0/C310:	D007    	BNE $C319      (if this formation was fought, proceed)
C0/C312:	8A      	TXA           (if not, check next formation)
C0/C313:	1A      	INC A
C0/C314:	2907    	AND #$07       (shave bits, formation 7 wraps to formation 0)
C0/C316:	AA      	TAX
C0/C317:	80F1    	BRA $C30A      (loop until we found some group we've fought)
C0/C319:	C221    	REP #$21
C0/C31B:	8A      	TXA
C0/C31C:	651E    	ADC $1E        (add X to (group # * 8) AND FFF8)
C0/C31E:	8FE01100	STA $0011E0    (store as formation to encounter)
C0/C322:	7B      	TDC 
C0/C323:	E220    	SEP #$20      (8 bit accum./memory)
C0/C325:	48      	PHA
C0/C326:	200505  	JSR $0505      (Copy 256 bytes..  from $0000-$00FF to $1200-12FF)
C0/C329:	68      	PLA
C0/C32A:	A901    	LDA #$01
C0/C32C:	6B      	RTL
 
C0/C32D:	A584    	LDA $84		(from C0/00F0)
C0/C32F:	D03A    	BNE $C36B
C0/C331:	AD8E07  	LDA $078E
C0/C334:	D035    	BNE $C36B
C0/C336:	ADB91E  	LDA $1EB9
C0/C339:	2920    	AND #$20       (encounters disabled?)
C0/C33B:	D02E    	BNE $C36B      (branch if so)
C0/C33D:	A6E5    	LDX $E5
C0/C33F:	D02A    	BNE $C36B
C0/C341:	A5E7    	LDA $E7
C0/C343:	C9CA    	CMP #$CA
C0/C345:	D024    	BNE $C36B
C0/C347:	AD2505  	LDA $0525
C0/C34A:	101F    	BPL $C36B
C0/C34C:	AC0308  	LDY $0803
C0/C34F:	B96908  	LDA $0869,Y
C0/C352:	D017    	BNE $C36B
C0/C354:	B96A08  	LDA $086A,Y
C0/C357:	290F    	AND #$0F
C0/C359:	D010    	BNE $C36B
C0/C35B:	B96C08  	LDA $086C,Y
C0/C35E:	D00B    	BNE $C36B
C0/C360:	B96D08  	LDA $086D,Y
C0/C363:	290F    	AND #$0F
C0/C365:	D004    	BNE $C36B
C0/C367:	A557    	LDA $57
C0/C369:	D001    	BNE $C36C
C0/C36B:	60      	RTS

; Check encounter in dungeon (per step)

C0/C36C:	6457    	STZ $57
C0/C36E:	AE8C07  	LDX $078C       ; number of encounter-checked steps
C0/C371:	E8      	INX             ; +1
C0/C372:	8E8C07  	STX $078C       ; update number of steps
C0/C375:	AD8200  	LDA $0082       ; current map index
C0/C378:	2903    	AND #$03        ; modulo 8
C0/C37A:	A8      	TAY             ; index it
C0/C37B:	C220    	REP #$20        ; 16-bit A
C0/C37D:	AD8200  	LDA $0082       ; current map index
C0/C380:	4A      	LSR A           ; / 2
C0/C381:	4A      	LSR A           ; / 4
C0/C382:	AA      	TAX             ; index to byte for map rate
C0/C383:	7B      	TDC             ; zero A/B
C0/C384:	E220    	SEP #$20        ; 8-bit A
C0/C386:	BF8058CF	LDA $CF5880,X   ; encounter rates for 4 maps
C0/C38A:	C400    	CPY $00         ; use bits 1+2
C0/C38C:	F005    	BEQ $C393       ; branch if ^
C0/C38E:	4A      	LSR A           ; >> 1
C0/C38F:	4A      	LSR A           ; >> 2
C0/C390:	88      	DEY             ; get next encounter rate on this byte
C0/C391:	D0FB    	BNE $C38E       ; loop till correct rate is found

C0/C393:	2903    	AND #$03        ; isolate encounter rate type
C0/C395:	851A    	STA $1A         ; save ^
C0/C397:	ADDF11  	LDA $11DF       ; field effect (from equips, etc)
C0/C39A:	2903    	AND #$03        ; "Moogle Charm", "Charm Bangle"
C0/C39C:	0A      	ASL A           ; << 1
C0/C39D:	0A      	ASL A           ; << 2
C0/C39E:	051A    	ORA $1A         ; add to rate type
C0/C3A0:	0A      	ASL A           ; x2
C0/C3A1:	AA      	TAX             ; index to encounter rate
C0/C3A2:	BFBFC2C0	LDA $C0C2BF,X   ; lobyte rate
C0/C3A6:	1FC0C2C0	ORA $C0C2C0,X   ; hibyte rate
C0/C3AA:	D003    	BNE $C3AF       ; branch if not zero
C0/C3AC:	4C78C4  	JMP $C478       ; else, exit

C0/C3AF:	C221    	REP #$21        ; 16-bit A, carry clear
C0/C3B1:	AD6E1F  	LDA $1F6E       ; encounter counter
C0/C3B4:	7FBFC2C0	ADC $C0C2BF,X   ; add encounter rate
C0/C3B8:	9003    	BCC $C3BD       ; branch if no overflow
C0/C3BA:	A900FF  	LDA #$FF00      ; else use max counter
C0/C3BD:	8D6E1F  	STA $1F6E       ; update counter
C0/C3C0:	7B      	TDC             ; zero A/B
C0/C3C1:	E220    	SEP #$20        ; 8-bit A
C0/C3C3:	2079C4  	JSR $C479       ; special random(255)
C0/C3C6:	CD6F1F  	CMP $1F6F       ; compare to counter
C0/C3C9:	B0A0    	BCS $C36B       ; exit if greater (no encounter)

C0/C3CB:	9C6E1F  	STZ $1F6E       ; zero counter
C0/C3CE:	9C6F1F  	STZ $1F6F       ; zero counter
C0/C3D1:	AE8200  	LDX $0082       ; current map ID
C0/C3D4:	BF0056CF	LDA $CF5600,X   ; load formation group index map
C0/C3D8:	C220    	REP #$20        ; 16-bit A
C0/C3DA:	0A      	ASL A           ; x2
C0/C3DB:	0A      	ASL A           ; x4
C0/C3DC:	0A      	ASL A           ; x8
C0/C3DD:	AA      	TAX             ; index it
C0/C3DE:	7B      	TDC             ; zero A/B
C0/C3DF:	E220    	SEP #$20        ; 8-bit A
C0/C3E1:	2096C4  	JSR $C496       ; another special random(255)
C0/C3E4:	C950    	CMP #$50        ; 31%
C0/C3E6:	900E    	BCC $C3F6       ; branch if using first formation
C0/C3E8:	E8      	INX
C0/C3E9:	E8      	INX             ; next formation
C0/C3EA:	C9A0    	CMP #$A0        ; 31%
C0/C3EC:	9008    	BCC $C3F6       ; branch if using second formation
C0/C3EE:	E8      	INX
C0/C3EF:	E8      	INX             ; next formation
C0/C3F0:	C9F0    	CMP #$F0        ; 31%
C0/C3F2:	9002    	BCC $C3F6       ; branch if using third formation
C0/C3F4:	E8      	INX
C0/C3F5:	E8      	INX             ; next formation

C0/C3F6:	C220    	REP #$20        ; 16-bit A
C0/C3F8:	BF0048CF	LDA $CF4800,X   ; load formation ID
C0/C3FC:	8FE01100	STA $0011E0     ; save formation ID
C0/C400:	7B      	TDC             ; zero A/B
C0/C401:	E220    	SEP #$20        ; 8-bit A
C0/C403:	AD2205  	LDA $0522	      ; default background index
C0/C406:	297F    	AND #$7F        ; isolate ^
C0/C408:	8FE21100	STA $0011E2     ; save background index
C0/C40C:	7B      	TDC             ; zero A/B
C0/C40D:	8FE31100	STA $0011E3     ; allow reading index in 16-bit

C0/C411:	AE4105  	LDX $0541       ; field XY scroll position
C0/C414:	8E661F  	STX $1F66       ; save backup
C0/C417:	AEAF00  	LDX $00AF       ; party's XY position
C0/C41A:	8EC01F  	STX $1FC0       ; save backup
C0/C41D:	ADD71E  	LDA $1ED7       ; some area/event flags
C0/C420:	2910    	AND #$10        ; continue current music
C0/C422:	4A      	LSR A           ; shift to new bit
C0/C423:	8FE41100	STA $0011E4     ; save special battle flags
C0/C427:	EE8B07  	INC $078B       ; number of battles encountered on map

C0/C42A:	C220    	REP #$20        ; 16-bit A
C0/C42C:	7B      	TDC             ; zero A/B
C0/C42D:	997108  	STA $0871,Y     ; zero horizontal movement speed
C0/C430:	997308  	STA $0873,Y     ; zero vertical movement speed
C0/C433:	8573    	STA $73         ; zero background scroll speed
C0/C435:	8575    	STA $75         ; zero background scroll speed
C0/C437:	8577    	STA $77         ; zero background scroll speed
C0/C439:	8579    	STA $79         ; zero background scroll speed
C0/C43B:	857B    	STA $7B         ; zero background scroll speed
C0/C43D:	857D    	STA $7D         ; zero background scroll speed
C0/C43F:	E220    	SEP #$20        ; 8-bit A
C0/C441:	A21800  	LDX #$0018      ; event address (for random battle)
C0/C444:	86E5    	STX $E5         ; set ^
C0/C446:	8EF405  	STX $05F4       ; and save to event stack
C0/C449:	A9CA    	LDA #$CA        ; event bank (for random battle)
C0/C44B:	85E7    	STA $E7         ; set ^
C0/C44D:	8DF605  	STA $05F6       ; and save to event stack
C0/C450:	A20000  	LDX #$0000      ; zero
C0/C453:	8E9405  	STX $0594       ; zero subroutine address
C0/C456:	A9CA    	LDA #$CA        ; bank
C0/C458:	8D9605  	STA $0596       ; set lowest event bank
C0/C45B:	A901    	LDA #$01
C0/C45D:	8DC705  	STA $05C7
C0/C460:	A20300  	LDX #$0003
C0/C463:	86E8    	STX $E8
C0/C465:	AC0308  	LDY $0803
C0/C468:	B97C08  	LDA $087C,Y
C0/C46B:	997D08  	STA $087D,Y
C0/C46E:	A904    	LDA #$04
C0/C470:	997C08  	STA $087C,Y
C0/C473:	A980    	LDA #$80
C0/C475:	8DFA11  	STA $11FA
C0/C478:	60      	RTS
 
Get a random number 0-255.  I think the purpose of $1FA4 is to stop you from
 getting the same number every 256 times you call this function.  Every time
 after we go through all 256 values, $1FA4 shifts us over by 17.  And since
 256 and 17 don't share any factors, we're talking a full 17 times through
 the table [or 4352 random numbers returned by the function] before we fall
 into the same pattern.)
C0/C479:	DA      	PHX
C0/C47A:	EEA11F  	INC $1FA1      (increment index when overworld encounter will occur)
C0/C47D:	D009    	BNE $C488
C0/C47F:	ADA41F  	LDA $1FA4
C0/C482:	18      	CLC
C0/C483:	6911    	ADC #$11
C0/C485:	8DA41F  	STA $1FA4
C0/C488:	ADA11F  	LDA $1FA1      (load index when overworld encounter will occur)
C0/C48B:	AA      	TAX
C0/C48C:	BF00FDC0	LDA $C0FD00,X  (load a random number)
C0/C490:	18      	CLC
C0/C491:	6DA41F  	ADC $1FA4
C0/C494:	FA      	PLX
C0/C495:	60      	RTS
 
(Get a random number 0-255.  I think the purpose of $1FA3 is to stop you from
 getting the same number every 256 times you call this function.  Every time
 after we go through all 256 values, $1FA3 shifts us over by 23.  And since
 256 and 23 don't share any factors, we're talking a full 23 times through
 the table [or 5888 random numbers returned by the function] before we fall
 into the same pattern.)
C0/C496:	DA      	PHX
C0/C497:	EEA21F  	INC $1FA2      (increment index when town/dungeon encounter will occur)
C0/C49A:	D009    	BNE $C4A5
C0/C49C:	ADA31F  	LDA $1FA3
C0/C49F:	18      	CLC
C0/C4A0:	6917    	ADC #$17
C0/C4A2:	8DA31F  	STA $1FA3
C0/C4A5:	ADA21F  	LDA $1FA2      (load index when town/dungeon encounter will occur)
C0/C4A8:	AA      	TAX
C0/C4A9:	BF00FDC0	LDA $C0FD00,X  (load a random number)
C0/C4AD:	18      	CLC
C0/C4AE:	6DA31F  	ADC $1FA3
C0/C4B1:	FA      	PLX
C0/C4B2:	60      	RTS
 
C0/C4B3:	A600    	LDX $00        (from C0/0104)
C0/C4B5:	9B      	TXY
C0/C4B6:	7B      	TDC 
C0/C4B7:	B90016  	LDA $1600,Y
C0/C4BA:	9FC0F17F	STA $7FF1C0,X  (store character ID)
C0/C4BE:	B90816  	LDA $1608,Y
C0/C4C1:	9FD0F17F	STA $7FF1D0,X
C0/C4C5:	B91116  	LDA $1611,Y
C0/C4C8:	9FE0F17F	STA $7FF1E0,X
C0/C4CC:	B91216  	LDA $1612,Y
C0/C4CF:	9FF0F17F	STA $7FF1F0,X
C0/C4D3:	B91316  	LDA $1613,Y
C0/C4D6:	9F00F27F	STA $7FF200,X
C0/C4DA:	C221    	REP #$21
C0/C4DC:	98      	TYA
C0/C4DD:	692500  	ADC #$0025
C0/C4E0:	A8      	TAY
C0/C4E1:	7B      	TDC 
C0/C4E2:	E220    	SEP #$20      (8 bit accum./memory)
C0/C4E4:	E8      	INX
C0/C4E5:	E01000  	CPX #$0010     (have we done 16 characters?)
C0/C4E8:	D0CD    	BNE $C4B7      (branch if not)
C0/C4EA:	200505  	JSR $0505
C0/C4ED:	8B      	PHB
C0/C4EE:	0B      	PHD
C0/C4EF:	08      	PHP 
C0/C4F0:	220F00C3	JSL $C3000F
C0/C4F4:	28      	PLP 
C0/C4F5:	2B      	PLD 
C0/C4F6:	AB      	PLB
C0/C4F7:	201505  	JSR $0515
C0/C4FA:	20BF6E  	JSR $6EBF
C0/C4FD:	7B      	TDC 
C0/C4FE:	AD0502  	LDA $0205
C0/C501:	F003    	BEQ $C506      (if it isn't 0 here, go back to the title screen)
C0/C503:	4C00FF  	JMP $FF00

C0/C506:	A600    	LDX $00
C0/C508:	9B      	TXY
C0/C509:	B90016  	LDA $1600,Y
C0/C50C:	DFC0F17F	CMP $7FF1C0,X
C0/C510:	F003    	BEQ $C515
C0/C512:	4C4BC5  	JMP $C54B      (BRA people!)

C0/C515:	DA      	PHX
C0/C516:	B90816  	LDA $1608,Y
C0/C519:	3A      	DEC A
C0/C51A:	8520    	STA $20
C0/C51C:	6421    	STZ $21
C0/C51E:	BFD0F17F	LDA $7FF1D0,X
C0/C522:	990816  	STA $1608,Y
C0/C525:	3A      	DEC A
C0/C526:	8522    	STA $22
C0/C528:	6423    	STZ $23
C0/C52A:	2062C5  	JSR $C562
C0/C52D:	209BC5  	JSR $C59B
C0/C530:	FA      	PLX
C0/C531:	BFE0F17F	LDA $7FF1E0,X
C0/C535:	991116  	STA $1611,Y
C0/C538:	BFF0F17F	LDA $7FF1F0,X
C0/C53C:	991216  	STA $1612,Y
C0/C53F:	BF00F27F	LDA $7FF200,X
C0/C543:	991316  	STA $1613,Y
C0/C546:	DA      	PHX
C0/C547:	207FA1  	JSR $A17F
C0/C54A:	FA      	PLX
C0/C54B:	C221    	REP #$21
C0/C54D:	98      	TYA
C0/C54E:	692500  	ADC #$0025
C0/C551:	A8      	TAY
C0/C552:	7B      	TDC 
C0/C553:	E220    	SEP #$20      (8 bit accum./memory)
C0/C555:	E8      	INX
C0/C556:	E01000  	CPX #$0010
C0/C559:	F003    	BEQ $C55E
C0/C55B:	4C09C5  	JMP $C509
C0/C55E:	20F36C  	JSR $6CF3
C0/C561:	60      	RTS
 
Determine and set new max HP
C0/C562:	C220    	REP #$20      (16 bit accum./memory)
C0/C564:	B90B16  	LDA $160B,Y    (load max HP)
C0/C567:	29FF3F  	AND #$3FFF     (mask out the HP modifiers)
C0/C56A:	851E    	STA $1E        (save it for now)
C0/C56C:	7B      	TDC 
C0/C56D:	E220    	SEP #$20      (8 bit accum./memory)
C0/C56F:	A620    	LDX $20        (load the saved level)
C0/C571:	E422    	CPX $22        (compare it to the new level)
C0/C573:	F012    	BEQ $C587      (branch if they are equal)
C0/C575:	BFA0F4E6	LDA $E6F4A0,X  (load HP gained on level up)
C0/C579:	18      	CLC
C0/C57A:	651E    	ADC $1E        (add it with the current max HP, low byte)
C0/C57C:	851E    	STA $1E        (save it)
C0/C57E:	A51F    	LDA $1F        (load current max HP, high byte)
C0/C580:	6900    	ADC #$00       (incremented if the previous ADC wrapped)
C0/C582:	851F    	STA $1F        (save it)
C0/C584:	E8      	INX            (increment level)
C0/C585:	80EA    	BRA $C571      (loop and keep adding HP)
C0/C587:	A20F27  	LDX #$270F     (9999)
C0/C58A:	E41E    	CPX $1E        (compare that to new max HP)
C0/C58C:	B002    	BCS $C590      (branch if the max HP is less than that)
C0/C58E:	861E    	STX $1E        (save it)
C0/C590:	C220    	REP #$20      (16 bit accum./memory)
C0/C592:	A51E    	LDA $1E        (load new max HP)
C0/C594:	990B16  	STA $160B,Y    (save it)
C0/C597:	7B      	TDC            (A = #$0000)
C0/C598:	E220    	SEP #$20      (8 bit accum./memory)
C0/C59A:	60      	RTS
 
Determine and set new max MP
C0/C59B:	C220    	REP #$20      (16 bit accum./memory)
C0/C59D:	B90F16  	LDA $160F,Y    (load max MP)
C0/C5A0:	29FF3F  	AND #$3FFF     (mask out the MP modifiers)
C0/C5A3:	851E    	STA $1E        (save it for now)
C0/C5A5:	7B      	TDC 
C0/C5A6:	E220    	SEP #$20      (8 bit accum./memory)
C0/C5A8:	A620    	LDX $20        (load the saved level)
C0/C5AA:	E422    	CPX $22        (compare it to the new level)
C0/C5AC:	F012    	BEQ $C5C0      (branch if they are equal)
C0/C5AE:	BF02F5E6	LDA $E6F502,X  (load MP gained on level up)
C0/C5B2:	18      	CLC
C0/C5B3:	651E    	ADC $1E        (add it with the current max MP, low byte)
C0/C5B5:	851E    	STA $1E        (save it)
C0/C5B7:	A51F    	LDA $1F        (load current max MP, high byte)
C0/C5B9:	6900    	ADC #$00       (incremented if the previous ADC wrapped)
C0/C5BB:	851F    	STA $1F        (save it)
C0/C5BD:	E8      	INX           (increment level)
C0/C5BE:	80EA    	BRA $C5AA      (loop and keep adding MP)
C0/C5C0:	A2E703  	LDX #$03E7     (999)
C0/C5C3:	E41E    	CPX $1E        (compare that to new max MP)
C0/C5C5:	B002    	BCS $C5C9      (branch if the max MP is less than that)
C0/C5C7:	861E    	STX $1E        (save it)
C0/C5C9:	C220    	REP #$20      (16 bit accum./memory)
C0/C5CB:	A51E    	LDA $1E        (load new max MP)
C0/C5CD:	990F16  	STA $160F,Y    (save it)
C0/C5D0:	7B      	TDC            (A = #$0000)
C0/C5D1:	E220    	SEP #$20      (8 bit accum./memory)
C0/C5D3:	60      	RTS

; Handle pushing X

C0/C5D4:	A559    	LDA $59		(from C0/0173) ; opening menu
C0/C5D6:	D052    	BNE $C62A     ; exit if already opening
C0/C5D8:	A506    	LDA $06       ; pushed keys
C0/C5DA:	2940    	AND #$40      ; pushing X
C0/C5DC:	F04C    	BEQ $C62A     ; exit if not
C0/C5DE:	A556    	LDA $56       ; battle enabled
C0/C5E0:	D048    	BNE $C62A     ; exit if so
C0/C5E2:	A584    	LDA $84
C0/C5E4:	D044    	BNE $C62A
C0/C5E6:	A54A    	LDA $4A
C0/C5E8:	D040    	BNE $C62A
C0/C5EA:	AD5E05  	LDA $055E
C0/C5ED:	D03B    	BNE $C62A
C0/C5EF:	A6E5    	LDX $E5
C0/C5F1:	E00000  	CPX #$0000
C0/C5F4:	D034    	BNE $C62A
C0/C5F6:	A5E7    	LDA $E7
C0/C5F8:	C9CA    	CMP #$CA      ; check if a specific event?
C0/C5FA:	D02E    	BNE $C62A
C0/C5FC:	AC0308  	LDY $0803
C0/C5FF:	B97E08  	LDA $087E,Y
C0/C602:	D026    	BNE $C62A
C0/C604:	B96908  	LDA $0869,Y
C0/C607:	D021    	BNE $C62A
C0/C609:	B96A08  	LDA $086A,Y
C0/C60C:	290F    	AND #$0F
C0/C60E:	D01A    	BNE $C62A
C0/C610:	B96C08  	LDA $086C,Y
C0/C613:	D015    	BNE $C62A
C0/C615:	B96D08  	LDA $086D,Y
C0/C618:	290F    	AND #$0F
C0/C61A:	D00E    	BNE $C62A
C0/C61C:	ADB81E  	LDA $1EB8
C0/C61F:	2904    	AND #$04      ; "disable main menu"
C0/C621:	D007    	BNE $C62A     ; exit if ^
C0/C623:	A901    	LDA #$01
C0/C625:	8559    	STA $59       ; set menu to open
C0/C627:	20560F  	JSR $0F56     ; set fade out [?]
C0/C62A:	60      	RTS
 
C0/C62B:	A54A    	LDA $4A       ; fading in/out [?]
C0/C62D:	D004    	BNE $C633     ; branch if so
C0/C62F:	A559    	LDA $59       ; opening the menu [?]
C0/C631:	D003    	BNE $C636     ; branch if so
C0/C633:	4C7901  	JMP $0179

; Open main menu (from field?)

C0/C636:	6459    	STZ $59
C0/C638:	A900    	LDA #$00
C0/C63A:	8D0002  	STA $0200
C0/C63D:	ADB71E  	LDA $1EB7
C0/C640:	2980    	AND #$80      ; on a save point [?]
C0/C642:	851A    	STA $1A
C0/C644:	AD2105  	LDA $0521
C0/C647:	2903    	AND #$03      ; enable warp and xzone
C0/C649:	051A    	ORA $1A
C0/C64B:	8D0102  	STA $0201     ; some flags for the menu
C0/C64E:	20CAC6  	JSR $C6CA     ; open the menu
C0/C651:	AD0502  	LDA $0205     ; close handler
C0/C654:	C902    	CMP #$02       (is it a tent?)
C0/C656:	F007    	BEQ $C65F
C0/C658:	C903    	CMP #$03       (is it a warp stone?)
C0/C65A:	F014    	BEQ $C670
C0/C65C:	4C7F00  	JMP $007F

C0/C65F:	A23400  	LDX #$0034
C0/C662:	86E5    	STX $E5        (event that restores HP/MP to full, used by a tent)
C0/C664:	8EF405  	STX $05F4
C0/C667:	A9CA    	LDA #$CA
C0/C669:	85E7    	STA $E7
C0/C66B:	8DF605  	STA $05F6
C0/C66E:	800F    	BRA $C67F

C0/C670:	A23900  	LDX #$0039
C0/C673:	86E5    	STX $E5        (event that warps you out of a dungeon, used by warp stone)
C0/C675:	8EF405  	STX $05F4
C0/C678:	A9CA    	LDA #$CA
C0/C67A:	85E7    	STA $E7
C0/C67C:	8DF605  	STA $05F6
C0/C67F:	AC0308  	LDY $0803
C0/C682:	B97C08  	LDA $087C,Y
C0/C685:	29F0    	AND #$F0
C0/C687:	0904    	ORA #$04
C0/C689:	997C08  	STA $087C,Y
C0/C68C:	A20000  	LDX #$0000
C0/C68F:	8E9405  	STX $0594
C0/C692:	A9CA    	LDA #$CA
C0/C694:	8D9605  	STA $0596
C0/C697:	A901    	LDA #$01
C0/C699:	8DC705  	STA $05C7
C0/C69C:	A20300  	LDX #$0003
C0/C69F:	86E8    	STX $E8
C0/C6A1:	A4DA    	LDY $DA
C0/C6A3:	B97C08  	LDA $087C,Y
C0/C6A6:	997D08  	STA $087D,Y
C0/C6A9:	A904    	LDA #$04
C0/C6AB:	997C08  	STA $087C,Y
C0/C6AE:	6458    	STZ $58
C0/C6B0:	4C7F00  	JMP $007F

C0/C6B3:	209170  	JSR $7091
C0/C6B6:	200505  	JSR $0505       (Copies RAM from 0000-00FF to 1200-12FF)
C0/C6B9:	08      	PHP 
C0/C6BA:	8B      	PHB
C0/C6BB:	0B      	PHD
C0/C6BC:	221500C3	JSL $C30015     (Eventually empties and then fully equips a character)
C0/C6C0:	2B      	PLD 
C0/C6C1:	AB      	PLB
C0/C6C2:	28      	PLP 
C0/C6C3:	201505  	JSR $0515       (Copies RAM from 1200-12FF to 0000-00FF)
C0/C6C6:	207770  	JSR $7077
C0/C6C9:	60      	RTS
 
Make a call to the menu
C0/C6CA:	207403  	JSR $0374	(from C0/B024, C0/B056, C0/B080, C0/B0A1, C0/B0B7, C0/B920, C0/C64E)
C0/C6CD:	209170  	JSR $7091
C0/C6D0:	20216F  	JSR $6F21
C0/C6D3:	20886E  	JSR $6E88
C0/C6D6:	200505  	JSR $0505
C0/C6D9:	AE4105  	LDX $0541
C0/C6DC:	8E661F  	STX $1F66
C0/C6DF:	AEAF00  	LDX $00AF
C0/C6E2:	8EC01F  	STX $1FC0
C0/C6E5:	AE0308  	LDX $0803
C0/C6E8:	8EA61F  	STX $1FA6
C0/C6EB:	BD7F08  	LDA $087F,X
C0/C6EE:	8D681F  	STA $1F68
C0/C6F1:	A5B2    	LDA $B2
C0/C6F3:	8D4407  	STA $0744
C0/C6F6:	08      	PHP 
C0/C6F7:	8B      	PHB
C0/C6F8:	0B      	PHD
C0/C6F9:	220000C3	JSL $C30000
C0/C6FD:	2B      	PLD 
C0/C6FE:	AB      	PLB
C0/C6FF:	28      	PLP 
C0/C700:	207403  	JSR $0374       ; disable NMI, turn off screen, etc
C0/C703:	201505  	JSR $0515       ; restore field direct page data $00-$FF
C0/C706:	207770  	JSR $7077       ; update character flags (row,order,party)
C0/C709:	20BF6E  	JSR $6EBF       ; update/restore character map indexes [?]
C0/C70C:	AD4E1D  	LDA $1D4E       ; config data
C0/C70F:	2907    	AND #$07        ; wallpaper
C0/C711:	8D6505  	STA $0565       ; set wallpaper index
C0/C714:	A901    	LDA #$01
C0/C716:	8558    	STA $58         ; reload the current map [?]
C0/C718:	A980    	LDA #$80        ; enable map startup
C0/C71A:	8DFA11  	STA $11FA
C0/C71D:	207305  	JSR $0573       ; set NMI and IRQ [?]
C0/C720:	644C    	STZ $4C         ; current screen brightness?
C0/C722:	60      	RTS
 
C0/C723:	2080C8  	JSR $C880		(from C0/BF82)
C0/C726:	202AC7  	JSR $C72A
C0/C729:	60      	RTS
 
C0/C72A:	A980    	LDA #$80		(from C0/C726)
C0/C72C:	8D1521  	STA $2115
C0/C72F:	A200C8  	LDX #$C800
C0/C732:	862D    	STX $2D
C0/C734:	A9C0    	LDA #$C0
C0/C736:	852F    	STA $2F
C0/C738:	A400    	LDY $00
C0/C73A:	5A      	PHY
C0/C73B:	B93306  	LDA $0633,Y
C0/C73E:	C220    	REP #$20      (16 bit accum./memory)
C0/C740:	0A      	ASL A
C0/C741:	0A      	ASL A
C0/C742:	0A      	ASL A
C0/C743:	18      	CLC
C0/C744:	69A0EE  	ADC #$EEA0
C0/C747:	852A    	STA $2A
C0/C749:	7B      	TDC 
C0/C74A:	E220    	SEP #$20      (8 bit accum./memory)
C0/C74C:	A9C0    	LDA #$C0
C0/C74E:	852C    	STA $2C
C0/C750:	A400    	LDY $00
C0/C752:	C221    	REP #$21
C0/C754:	A72D    	LDA [$2D]
C0/C756:	8D1621  	STA $2116
C0/C759:	B72A    	LDA [$2A],Y
C0/C75B:	AA      	TAX
C0/C75C:	7B      	TDC 
C0/C75D:	E220    	SEP #$20      (8 bit accum./memory)
C0/C75F:	BFA0E2C0	LDA $C0E2A0,X
C0/C763:	8D1821  	STA $2118
C0/C766:	9C1921  	STZ $2119
C0/C769:	BFA1E2C0	LDA $C0E2A1,X
C0/C76D:	8D1821  	STA $2118
C0/C770:	9C1921  	STZ $2119
C0/C773:	BFA2E2C0	LDA $C0E2A2,X
C0/C777:	8D1821  	STA $2118
C0/C77A:	9C1921  	STZ $2119
C0/C77D:	BFA3E2C0	LDA $C0E2A3,X
C0/C781:	8D1821  	STA $2118
C0/C784:	9C1921  	STZ $2119
C0/C787:	BFA4E2C0	LDA $C0E2A4,X
C0/C78B:	8D1821  	STA $2118
C0/C78E:	9C1921  	STZ $2119
C0/C791:	BFA5E2C0	LDA $C0E2A5,X
C0/C795:	8D1821  	STA $2118
C0/C798:	9C1921  	STZ $2119
C0/C79B:	BFA6E2C0	LDA $C0E2A6,X
C0/C79F:	8D1821  	STA $2118
C0/C7A2:	9C1921  	STZ $2119
C0/C7A5:	BFA7E2C0	LDA $C0E2A7,X
C0/C7A9:	8D1821  	STA $2118
C0/C7AC:	9C1921  	STZ $2119
C0/C7AF:	9C1821  	STZ $2118
C0/C7B2:	9C1921  	STZ $2119
C0/C7B5:	9C1821  	STZ $2118
C0/C7B8:	9C1921  	STZ $2119
C0/C7BB:	9C1821  	STZ $2118
C0/C7BE:	9C1921  	STZ $2119
C0/C7C1:	9C1821  	STZ $2118
C0/C7C4:	9C1921  	STZ $2119
C0/C7C7:	9C1821  	STZ $2118
C0/C7CA:	9C1921  	STZ $2119
C0/C7CD:	9C1821  	STZ $2118
C0/C7D0:	9C1921  	STZ $2119
C0/C7D3:	9C1821  	STZ $2118
C0/C7D6:	9C1921  	STZ $2119
C0/C7D9:	9C1821  	STZ $2118
C0/C7DC:	9C1921  	STZ $2119
C0/C7DF:	C221    	REP #$21
C0/C7E1:	A52D    	LDA $2D
C0/C7E3:	690200  	ADC #$0002
C0/C7E6:	852D    	STA $2D
C0/C7E8:	7B      	TDC 
C0/C7E9:	E220    	SEP #$20      (8 bit accum./memory)
C0/C7EB:	C8      	INY 
C0/C7EC:	C8      	INY 
C0/C7ED:	C00800  	CPY #$0008
C0/C7F0:	F003    	BEQ $C7F5
C0/C7F2:	4C52C7  	JMP $C752
C0/C7F5:	7A      	PLY
C0/C7F6:	C8      	INY 
C0/C7F7:	C01000  	CPY #$0010
C0/C7FA:	F003    	BEQ $C7FF
C0/C7FC:	4C3AC7  	JMP $C73A
C0/C7FF:	60      	RTS
 
C0/C800:	006C    	BRK #$6C
C0/C802:	106C    	BPL $C870
C0/C804:	006D    	BRK #$6D
C0/C806:	106D    	BPL $C875
C0/C808:	206C30  	JSR $306C
C0/C80B:	6C206D  	JMP ($6D20)
C0/C80E:	306D    	BMI $C87D
C0/C810:	40      	RTI
 
C0/C811:	6C506C  	JMP ($6C50)
C0/C814:	40      	RTI
 
C0/C815:	6D506D  	ADC $6D50
C0/C818:	60      	RTS
 
C0/C819:	6C706C  	JMP ($6C70)
C0/C81C:	60      	RTS
 
C0/C81D:	6D706D  	ADC $6D70
C0/C820:	806C    	BRA $C88E
C0/C822:	906C    	BCC $C890
C0/C824:	806D    	BRA $C893
C0/C826:	906D    	BCC $C895
C0/C828:	A06CB0  	LDY #$B06C
C0/C82B:	6CA06D  	JMP ($6DA0)
C0/C82E:	B06D    	BCS $C89D
C0/C830:	C06CD0  	CPY #$D06C
C0/C833:	6CC06D  	JMP ($6DC0)
C0/C836:	D06D    	BNE $C8A5
C0/C838:	E06CF0  	CPX #$F06C
C0/C83B:	6CE06D  	JMP ($6DE0)
C0/C83E:	F06D    	BEQ $C8AD
C0/C840:	006E    	BRK #$6E
C0/C842:	106E    	BPL $C8B2
C0/C844:	006F    	BRK #$6F
C0/C846:	106F    	BPL $C8B7
C0/C848:	206E30  	JSR $306E
C0/C84B:	6E206F  	ROR $6F20
C0/C84E:	306F    	BMI $C8BF
C0/C850:	40      	RTI
 
C0/C851:	6E506E  	ROR $6E50
C0/C854:	40      	RTI
 
C0/C855:	6F506F60	ADC $606F50
C0/C859:	6E706E  	ROR $6E70
C0/C85C:	60      	RTS
 
C0/C85D:	6F706F80	ADC $806F70
C0/C861:	6E906E  	ROR $6E90
C0/C864:	806F    	BRA $C8D5
C0/C866:	906F    	BCC $C8D7
C0/C868:	A06EB0  	LDY #$B06E
C0/C86B:	6EA06F  	ROR $6FA0
C0/C86E:	B06F    	BCS $C8DF
C0/C870:	C06ED0  	CPY #$D06E
C0/C873:	6EC06F  	ROR $6FC0
C0/C876:	D06F    	BNE $C8E7
C0/C878:	E06EF0  	CPX #$F06E
C0/C87B:	6EE06F  	ROR $6FE0
C0/C87E:	F06F    	BEQ $C8EF

C0/C880:	AD3105  	LDA $0531		(from C0/C723)
C0/C883:	0A      	ASL A
C0/C884:	AA      	TAX
C0/C885:	C221    	REP #$21
C0/C887:	BFA0F4C0	LDA $C0F4A0,X
C0/C88B:	6900F5  	ADC #$F500
C0/C88E:	85F3    	STA $F3
C0/C890:	7B      	TDC 
C0/C891:	E220    	SEP #$20      (8 bit accum./memory)
C0/C893:	A9C0    	LDA #$C0
C0/C895:	85F5    	STA $F5
C0/C897:	A23306  	LDX #$0633
C0/C89A:	86F6    	STX $F6
C0/C89C:	A900    	LDA #$00
C0/C89E:	85F8    	STA $F8
C0/C8A0:	226C04C0	JSL $C0046C    (LZ decompression)
C0/C8A4:	60      	RTS
 
C0/C8A5:	AC0308  	LDY $0803       ; visible character's object data offset
C0/C8A8:	B97C08  	LDA $087C,Y     ; character's movement flags
C0/C8AB:	290F    	AND #$0F        ; isolate "Movement Type"
C0/C8AD:	C902    	CMP #$02        ; "User Controlled"
C0/C8AF:	F001    	BEQ $C8B2       ; branch if ^
C0/C8B1:	60      	RTS
 
C0/C8B2:	C220    	REP #$20      (16 bit accum./memory)
C0/C8B4:	B96D08  	LDA $086D,Y     ; character's Y position in tiles
C0/C8B7:	18      	CLC             ; clear carry [BUG?]
C0/C8B8:	E560    	SBC $60         ; subtract BG1 Y scroll in tiles
C0/C8BA:	8528    	STA $28         ; store it
C0/C8BC:	B96A08  	LDA $086A,Y     ; character's X position in tiles
C0/C8BF:	38      	SEC             ; set carry
C0/C8C0:	E55C    	SBC $5C         ; subtract BG1 X scroll in tiles
C0/C8C2:	18      	CLC             ; clear carry
C0/C8C3:	690800  	ADC #$0008      ; add 8
C0/C8C6:	8526    	STA $26         ; store it

C0/C8C8:	7B      	TDC             ; clear A/B
C0/C8C9:	E220    	SEP #$20      (8 bit accum./memory)
C0/C8CB:	A527    	LDA $27         ; why[?]
C0/C8CD:	A529    	LDA $29         ; why[?]
C0/C8CF:	A97E    	LDA #$7E
C0/C8D1:	8D8321  	STA $2183       ; set WRAM bank
C0/C8D4:	A26307  	LDX #$0763      ; "Active Overlay Data" location
C0/C8D7:	8E8121  	STX $2181       ; set WRAM buffer
C0/C8DA:	A5B8    	LDA $B8         ; tile properties [?]
C0/C8DC:	29C0    	AND #$C0        ; isolate "On Stairs"
C0/C8DE:	F00C    	BEQ $C8EC       ; branch if not on stairs [?]
C0/C8E0:	A5B8    	LDA $B8
C0/C8E2:	2904    	AND #$04        ; isolate "Bridge Tile"
C0/C8E4:	F009    	BEQ $C8EF       ; branch if not on bridge [?]
C0/C8E6:	A5B2    	LDA $B2         ; party Z level
C0/C8E8:	C901    	CMP #$01        ; set carry if party's Z is > 0
C0/C8EA:	F000    	BEQ $C8EC       ; does nothing
C0/C8EC:	4C1ACA  	JMP $CA1A

; On stairs (not bridge)
C0/C8EF:	B97E08  	LDA $087E,Y
C0/C8F2:	F00A    	BEQ $C8FE
C0/C8F4:	C905    	CMP #$05
C0/C8F6:	B003    	BCS $C8FB
C0/C8F8:	4C1ACA  	JMP $CA1A
C0/C8FB:	38      	SEC 
C0/C8FC:	E904    	SBC #$04
C0/C8FE:	851A    	STA $1A
C0/C900:	0A      	ASL A
C0/C901:	0A      	ASL A
C0/C902:	0A      	ASL A
C0/C903:	18      	CLC
C0/C904:	651A    	ADC $1A
C0/C906:	851A    	STA $1A
C0/C908:	AA      	TAX
C0/C909:	A526    	LDA $26
C0/C90B:	18      	CLC
C0/C90C:	7FEDC9C0	ADC $C0C9ED,X
C0/C910:	8D8021  	STA $2180
C0/C913:	A528    	LDA $28
C0/C915:	18      	CLC
C0/C916:	7FEEC9C0	ADC $C0C9EE,X
C0/C91A:	8D8021  	STA $2180
C0/C91D:	BFEFC9C0	LDA $C0C9EF,X
C0/C921:	A8      	TAY
C0/C922:	DA      	PHX
C0/C923:	B9A300  	LDA $00A3,Y
C0/C926:	AA      	TAX
C0/C927:	A8      	TAY
C0/C928:	BF00767E	LDA $7E7600,X
C0/C92C:	FA      	PLX
C0/C92D:	2904    	AND #$04
C0/C92F:	F005    	BEQ $C936
C0/C931:	A5B2    	LDA $B2
C0/C933:	3A      	DEC A
C0/C934:	F00E    	BEQ $C944
C0/C936:	B94306  	LDA $0643,Y
C0/C939:	C9FF    	CMP #$FF
C0/C93B:	F007    	BEQ $C944
C0/C93D:	293F    	AND #$3F
C0/C93F:	18      	CLC
C0/C940:	69C0    	ADC #$C0
C0/C942:	8001    	BRA $C945
C0/C944:	7B      	TDC 
C0/C945:	8D8021  	STA $2180
C0/C948:	B94306  	LDA $0643,Y
C0/C94B:	29C0    	AND #$C0
C0/C94D:	8D8021  	STA $2180
C0/C950:	A526    	LDA $26
C0/C952:	18      	CLC
C0/C953:	7FF0C9C0	ADC $C0C9F0,X
C0/C957:	8D8021  	STA $2180
C0/C95A:	A528    	LDA $28
C0/C95C:	18      	CLC
C0/C95D:	7FF1C9C0	ADC $C0C9F1,X
C0/C961:	8D8021  	STA $2180
C0/C964:	BFF2C9C0	LDA $C0C9F2,X
C0/C968:	A8      	TAY
C0/C969:	DA      	PHX
C0/C96A:	B9A300  	LDA $00A3,Y
C0/C96D:	AA      	TAX
C0/C96E:	A8      	TAY
C0/C96F:	BF00767E	LDA $7E7600,X
C0/C973:	FA      	PLX
C0/C974:	2904    	AND #$04
C0/C976:	F005    	BEQ $C97D
C0/C978:	A5B2    	LDA $B2
C0/C97A:	3A      	DEC A
C0/C97B:	F00E    	BEQ $C98B
C0/C97D:	B94306  	LDA $0643,Y
C0/C980:	C9FF    	CMP #$FF
C0/C982:	F007    	BEQ $C98B
C0/C984:	293F    	AND #$3F
C0/C986:	18      	CLC
C0/C987:	69C0    	ADC #$C0
C0/C989:	8001    	BRA $C98C
C0/C98B:	7B      	TDC 
C0/C98C:	8D8021  	STA $2180
C0/C98F:	B94306  	LDA $0643,Y
C0/C992:	29C0    	AND #$C0
C0/C994:	8D8021  	STA $2180
C0/C997:	A526    	LDA $26
C0/C999:	18      	CLC
C0/C99A:	7FF3C9C0	ADC $C0C9F3,X
C0/C99E:	8D8021  	STA $2180
C0/C9A1:	A528    	LDA $28
C0/C9A3:	18      	CLC
C0/C9A4:	7FF4C9C0	ADC $C0C9F4,X
C0/C9A8:	8D8021  	STA $2180
C0/C9AB:	BFF5C9C0	LDA $C0C9F5,X
C0/C9AF:	A8      	TAY
C0/C9B0:	DA      	PHX
C0/C9B1:	B9A300  	LDA $00A3,Y
C0/C9B4:	AA      	TAX
C0/C9B5:	A8      	TAY
C0/C9B6:	BF00767E	LDA $7E7600,X
C0/C9BA:	FA      	PLX
C0/C9BB:	2904    	AND #$04
C0/C9BD:	F005    	BEQ $C9C4
C0/C9BF:	A5B2    	LDA $B2
C0/C9C1:	3A      	DEC A
C0/C9C2:	F00E    	BEQ $C9D2
C0/C9C4:	B94306  	LDA $0643,Y
C0/C9C7:	C9FF    	CMP #$FF
C0/C9C9:	F007    	BEQ $C9D2
C0/C9CB:	293F    	AND #$3F
C0/C9CD:	18      	CLC
C0/C9CE:	69C0    	ADC #$C0
C0/C9D0:	8001    	BRA $C9D3
C0/C9D2:	7B      	TDC 
C0/C9D3:	8D8021  	STA $2180
C0/C9D6:	B94306  	LDA $0643,Y
C0/C9D9:	29C0    	AND #$C0
C0/C9DB:	8D8021  	STA $2180
C0/C9DE:	A9EF    	LDA #$EF
C0/C9E0:	8D8021  	STA $2180
C0/C9E3:	8D8021  	STA $2180
C0/C9E6:	8D8021  	STA $2180
C0/C9E9:	8D8021  	STA $2180
C0/C9EC:	60      	RTS
 
C0/C9ED:	0000    	BRK #$00
C0/C9EF:	0710    	ORA [$10]
C0/C9F1:	F005    	BEQ $C9F8
C0/C9F3:	1000    	BPL $C9F5
C0/C9F5:	08      	PHP 
C0/C9F6:	1000    	BPL $C9F8
C0/C9F8:	0500    	ORA $00
C0/C9FA:	1007    	BPL $CA03
C0/C9FC:	1010    	BPL $CA0E
C0/C9FE:	08      	PHP 
C0/C9FF:	0000    	BRK #$00
C0/CA01:	0700    	ORA [$00]
C0/CA03:	100A    	BPL $CA0F
C0/CA05:	1010    	BPL $CA17
C0/CA07:	0B      	PHD
C0/CA08:	1000    	BPL $CA0A
C0/CA0A:	0710    	ORA [$10]
C0/CA0C:	100A    	BPL $CA18
C0/CA0E:	0010    	BRK #$10
C0/CA10:	0910    	ORA #$10
C0/CA12:	1007    	BPL $CA1B
C0/CA14:	0000    	BRK #$00
C0/CA16:	0300    	ORA $00,S
C0/CA18:	1006    	BPL $CA20

C0/CA1A:	A5B8    	LDA $B8
C0/CA1C:	2904    	AND #$04
C0/CA1E:	F007    	BEQ $CA27
C0/CA20:	A5B2    	LDA $B2
C0/CA22:	3A      	DEC A
C0/CA23:	F039    	BEQ $CA5E
C0/CA25:	801B    	BRA $CA42
C0/CA27:	A5AA    	LDA $AA
C0/CA29:	A8      	TAY
C0/CA2A:	B94306  	LDA $0643,Y
C0/CA2D:	C9FF    	CMP #$FF
C0/CA2F:	F02D    	BEQ $CA5E
C0/CA31:	851A    	STA $1A
C0/CA33:	293F    	AND #$3F
C0/CA35:	18      	CLC
C0/CA36:	69C0    	ADC #$C0
C0/CA38:	851B    	STA $1B
C0/CA3A:	A51A    	LDA $1A
C0/CA3C:	29C0    	AND #$C0
C0/CA3E:	851A    	STA $1A
C0/CA40:	8022    	BRA $CA64
C0/CA42:	A5AA    	LDA $AA
C0/CA44:	A8      	TAY
C0/CA45:	B94306  	LDA $0643,Y
C0/CA48:	C9FF    	CMP #$FF
C0/CA4A:	F012    	BEQ $CA5E
C0/CA4C:	851A    	STA $1A
C0/CA4E:	293F    	AND #$3F
C0/CA50:	18      	CLC
C0/CA51:	69C0    	ADC #$C0
C0/CA53:	851B    	STA $1B
C0/CA55:	A51A    	LDA $1A
C0/CA57:	29C0    	AND #$C0
C0/CA59:	1A      	INC A
C0/CA5A:	851A    	STA $1A
C0/CA5C:	8006    	BRA $CA64
C0/CA5E:	A901    	LDA #$01
C0/CA60:	851A    	STA $1A
C0/CA62:	641B    	STZ $1B
C0/CA64:	AD7400  	LDA $0074
C0/CA67:	1007    	BPL $CA70
C0/CA69:	A526    	LDA $26
C0/CA6B:	18      	CLC
C0/CA6C:	6910    	ADC #$10
C0/CA6E:	8526    	STA $26
C0/CA70:	A526    	LDA $26
C0/CA72:	8D8021  	STA $2180
C0/CA75:	AD7600  	LDA $0076
C0/CA78:	1007    	BPL $CA81
C0/CA7A:	A528    	LDA $28
C0/CA7C:	18      	CLC
C0/CA7D:	6910    	ADC #$10
C0/CA7F:	8528    	STA $28
C0/CA81:	A528    	LDA $28
C0/CA83:	8D8021  	STA $2180
C0/CA86:	A51B    	LDA $1B
C0/CA88:	8D8021  	STA $2180
C0/CA8B:	A51A    	LDA $1A
C0/CA8D:	8D8021  	STA $2180
C0/CA90:	A5B8    	LDA $B8
C0/CA92:	2904    	AND #$04
C0/CA94:	F007    	BEQ $CA9D
C0/CA96:	A5B2    	LDA $B2
C0/CA98:	3A      	DEC A
C0/CA99:	F068    	BEQ $CB03
C0/CA9B:	804A    	BRA $CAE7
C0/CA9D:	A5B8    	LDA $B8
C0/CA9F:	2903    	AND #$03
C0/CAA1:	C902    	CMP #$02
C0/CAA3:	F011    	BEQ $CAB6
C0/CAA5:	C903    	CMP #$03
C0/CAA7:	F017    	BEQ $CAC0
C0/CAA9:	A5B6    	LDA $B6
C0/CAAB:	C9F7    	CMP #$F7
C0/CAAD:	F01D    	BEQ $CACC
C0/CAAF:	2907    	AND #$07
C0/CAB1:	3A      	DEC A
C0/CAB2:	F018    	BEQ $CACC
C0/CAB4:	804D    	BRA $CB03
C0/CAB6:	A5B6    	LDA $B6
C0/CAB8:	2907    	AND #$07
C0/CABA:	C901    	CMP #$01
C0/CABC:	F045    	BEQ $CB03
C0/CABE:	800C    	BRA $CACC
C0/CAC0:	A5B6    	LDA $B6
C0/CAC2:	C9F7    	CMP #$F7
C0/CAC4:	F006    	BEQ $CACC
C0/CAC6:	2902    	AND #$02
C0/CAC8:	D002    	BNE $CACC
C0/CACA:	8037    	BRA $CB03
C0/CACC:	A5A7    	LDA $A7
C0/CACE:	A8      	TAY
C0/CACF:	B94306  	LDA $0643,Y
C0/CAD2:	C9FF    	CMP #$FF
C0/CAD4:	F02D    	BEQ $CB03
C0/CAD6:	851A    	STA $1A
C0/CAD8:	293F    	AND #$3F
C0/CADA:	18      	CLC
C0/CADB:	69C0    	ADC #$C0
C0/CADD:	851B    	STA $1B
C0/CADF:	A51A    	LDA $1A
C0/CAE1:	29C0    	AND #$C0
C0/CAE3:	851A    	STA $1A
C0/CAE5:	8022    	BRA $CB09
C0/CAE7:	A5A7    	LDA $A7
C0/CAE9:	A8      	TAY
C0/CAEA:	B94306  	LDA $0643,Y
C0/CAED:	C9FF    	CMP #$FF
C0/CAEF:	F012    	BEQ $CB03
C0/CAF1:	851A    	STA $1A
C0/CAF3:	293F    	AND #$3F
C0/CAF5:	18      	CLC
C0/CAF6:	69C0    	ADC #$C0
C0/CAF8:	851B    	STA $1B
C0/CAFA:	A51A    	LDA $1A
C0/CAFC:	29C0    	AND #$C0
C0/CAFE:	1A      	INC A
C0/CAFF:	851A    	STA $1A
C0/CB01:	8006    	BRA $CB09
C0/CB03:	A901    	LDA #$01
C0/CB05:	851A    	STA $1A
C0/CB07:	641B    	STZ $1B
C0/CB09:	A526    	LDA $26
C0/CB0B:	8D8021  	STA $2180
C0/CB0E:	A528    	LDA $28
C0/CB10:	38      	SEC 
C0/CB11:	E910    	SBC #$10
C0/CB13:	8D8021  	STA $2180
C0/CB16:	A51B    	LDA $1B
C0/CB18:	8D8021  	STA $2180
C0/CB1B:	A51A    	LDA $1A
C0/CB1D:	8D8021  	STA $2180
C0/CB20:	AC0308  	LDY $0803
C0/CB23:	B97E08  	LDA $087E,Y
C0/CB26:	AA      	TAX
C0/CB27:	BF73CCC0	LDA $C0CC73,X
C0/CB2B:	AA      	TAX
C0/CB2C:	862A    	STX $2A
C0/CB2E:	B97E08  	LDA $087E,Y
C0/CB31:	F061    	BEQ $CB94
C0/CB33:	BF7FCCC0	LDA $C0CC7F,X
C0/CB37:	AA      	TAX
C0/CB38:	B5A3    	LDA $A3,X
C0/CB3A:	AA      	TAX
C0/CB3B:	BF00767E	LDA $7E7600,X
C0/CB3F:	851E    	STA $1E
C0/CB41:	2904    	AND #$04
C0/CB43:	F016    	BEQ $CB5B
C0/CB45:	A5B8    	LDA $B8
C0/CB47:	2904    	AND #$04
C0/CB49:	F007    	BEQ $CB52
C0/CB4B:	A5B2    	LDA $B2
C0/CB4D:	3A      	DEC A
C0/CB4E:	F044    	BEQ $CB94
C0/CB50:	8029    	BRA $CB7B
C0/CB52:	A5B8    	LDA $B8
C0/CB54:	2903    	AND #$03
C0/CB56:	3A      	DEC A
C0/CB57:	F03B    	BEQ $CB94
C0/CB59:	8020    	BRA $CB7B
C0/CB5B:	A5B8    	LDA $B8
C0/CB5D:	2904    	AND #$04
C0/CB5F:	8002    	BRA $CB63
C0/CB61:	80E8    	BRA $CB4B
C0/CB63:	BD4306  	LDA $0643,X
C0/CB66:	C9FF    	CMP #$FF
C0/CB68:	F02A    	BEQ $CB94
C0/CB6A:	851A    	STA $1A
C0/CB6C:	293F    	AND #$3F
C0/CB6E:	18      	CLC
C0/CB6F:	69C0    	ADC #$C0
C0/CB71:	851B    	STA $1B
C0/CB73:	A51A    	LDA $1A
C0/CB75:	29C0    	AND #$C0
C0/CB77:	851A    	STA $1A
C0/CB79:	801F    	BRA $CB9A
C0/CB7B:	BD4306  	LDA $0643,X
C0/CB7E:	C9FF    	CMP #$FF
C0/CB80:	F012    	BEQ $CB94
C0/CB82:	851A    	STA $1A
C0/CB84:	293F    	AND #$3F
C0/CB86:	18      	CLC
C0/CB87:	69C0    	ADC #$C0
C0/CB89:	851B    	STA $1B
C0/CB8B:	A51A    	LDA $1A
C0/CB8D:	29C0    	AND #$C0
C0/CB8F:	1A      	INC A
C0/CB90:	851A    	STA $1A
C0/CB92:	8006    	BRA $CB9A
C0/CB94:	A901    	LDA #$01
C0/CB96:	851A    	STA $1A
C0/CB98:	641B    	STZ $1B
C0/CB9A:	A62A    	LDX $2A
C0/CB9C:	A526    	LDA $26
C0/CB9E:	18      	CLC
C0/CB9F:	7F7DCCC0	ADC $C0CC7D,X
C0/CBA3:	8D8021  	STA $2180
C0/CBA6:	A528    	LDA $28
C0/CBA8:	18      	CLC
C0/CBA9:	7F7ECCC0	ADC $C0CC7E,X
C0/CBAD:	8D8021  	STA $2180
C0/CBB0:	A51B    	LDA $1B
C0/CBB2:	8D8021  	STA $2180
C0/CBB5:	A51A    	LDA $1A
C0/CBB7:	8D8021  	STA $2180
C0/CBBA:	AC0308  	LDY $0803
C0/CBBD:	B97E08  	LDA $087E,Y
C0/CBC0:	D003    	BNE $CBC5
C0/CBC2:	4C4CCC  	JMP $CC4C
C0/CBC5:	BF82CCC0	LDA $C0CC82,X
C0/CBC9:	AA      	TAX
C0/CBCA:	B5A3    	LDA $A3,X
C0/CBCC:	AA      	TAX
C0/CBCD:	A51E    	LDA $1E
C0/CBCF:	2904    	AND #$04
C0/CBD1:	F013    	BEQ $CBE6
C0/CBD3:	A5B8    	LDA $B8
C0/CBD5:	2907    	AND #$07
C0/CBD7:	C901    	CMP #$01
C0/CBD9:	F071    	BEQ $CC4C
C0/CBDB:	C902    	CMP #$02
C0/CBDD:	F054    	BEQ $CC33
C0/CBDF:	A5B2    	LDA $B2
C0/CBE1:	3A      	DEC A
C0/CBE2:	F068    	BEQ $CC4C
C0/CBE4:	804D    	BRA $CC33
C0/CBE6:	A51E    	LDA $1E
C0/CBE8:	2903    	AND #$03
C0/CBEA:	C902    	CMP #$02
C0/CBEC:	F013    	BEQ $CC01
C0/CBEE:	C903    	CMP #$03
C0/CBF0:	F01B    	BEQ $CC0D
C0/CBF2:	BF00767E	LDA $7E7600,X
C0/CBF6:	C9F7    	CMP #$F7
C0/CBF8:	F021    	BEQ $CC1B
C0/CBFA:	2907    	AND #$07
C0/CBFC:	3A      	DEC A
C0/CBFD:	F01C    	BEQ $CC1B
C0/CBFF:	804B    	BRA $CC4C
C0/CC01:	BF00767E	LDA $7E7600,X
C0/CC05:	2907    	AND #$07
C0/CC07:	C901    	CMP #$01
C0/CC09:	F041    	BEQ $CC4C
C0/CC0B:	800E    	BRA $CC1B
C0/CC0D:	BF00767E	LDA $7E7600,X
C0/CC11:	C9F7    	CMP #$F7
C0/CC13:	F006    	BEQ $CC1B
C0/CC15:	2902    	AND #$02
C0/CC17:	D002    	BNE $CC1B
C0/CC19:	8031    	BRA $CC4C
C0/CC1B:	BD4306  	LDA $0643,X
C0/CC1E:	C9FF    	CMP #$FF
C0/CC20:	F02A    	BEQ $CC4C
C0/CC22:	851A    	STA $1A
C0/CC24:	293F    	AND #$3F
C0/CC26:	18      	CLC
C0/CC27:	69C0    	ADC #$C0
C0/CC29:	851B    	STA $1B
C0/CC2B:	A51A    	LDA $1A
C0/CC2D:	29C0    	AND #$C0
C0/CC2F:	851A    	STA $1A
C0/CC31:	801F    	BRA $CC52
C0/CC33:	BD4306  	LDA $0643,X
C0/CC36:	C9FF    	CMP #$FF
C0/CC38:	F012    	BEQ $CC4C
C0/CC3A:	851A    	STA $1A
C0/CC3C:	293F    	AND #$3F
C0/CC3E:	18      	CLC
C0/CC3F:	69C0    	ADC #$C0
C0/CC41:	851B    	STA $1B
C0/CC43:	A51A    	LDA $1A
C0/CC45:	29C0    	AND #$C0
C0/CC47:	1A      	INC A
C0/CC48:	851A    	STA $1A
C0/CC4A:	8006    	BRA $CC52
C0/CC4C:	A901    	LDA #$01
C0/CC4E:	851A    	STA $1A
C0/CC50:	641B    	STZ $1B
C0/CC52:	A62A    	LDX $2A
C0/CC54:	A526    	LDA $26
C0/CC56:	18      	CLC
C0/CC57:	7F80CCC0	ADC $C0CC80,X
C0/CC5B:	8D8021  	STA $2180
C0/CC5E:	A528    	LDA $28
C0/CC60:	18      	CLC
C0/CC61:	7F81CCC0	ADC $C0CC81,X
C0/CC65:	8D8021  	STA $2180
C0/CC68:	A51B    	LDA $1B
C0/CC6A:	8D8021  	STA $2180
C0/CC6D:	A51A    	LDA $1A
C0/CC6F:	8D8021  	STA $2180
C0/CC72:	60      	RTS
 
C0/CC73:	0000    	BRK #$00
C0/CC75:	060C    	ASL $0C
C0/CC77:	1218    	ORA ($18)
C0/CC79:	1E242A  	ASL $2A24,X
C0/CC7C:	3000    	BMI $CC7E
C0/CC7E:	F004    	BEQ $CC84
C0/CC80:	00E0    	BRK #$E0
C0/CC82:	0110    	ORA ($10,X)
C0/CC84:	0008    	BRK #$08
C0/CC86:	10F0    	BPL $CC78
C0/CC88:	0500    	ORA $00
C0/CC8A:	100A    	BPL $CC96
C0/CC8C:	0000    	BRK #$00
C0/CC8E:	07F0    	ORA [$F0]
C0/CC90:	0006    	BRK #$06
C0/CC92:	F0F0    	BEQ $CC84
C0/CC94:	03A6    	ORA $A6,S
C0/CC96:	009B    	BRK #$9B
C0/CC98:	A574    	LDA $74
C0/CC9A:	F00C    	BEQ $CCA8
C0/CC9C:	300A    	BMI $CCA8
C0/CC9E:	A55C    	LDA $5C
C0/CCA0:	3A      	DEC A
C0/CCA1:	290F    	AND #$0F
C0/CCA3:	1A      	INC A
C0/CCA4:	49FF    	EOR #$FF
C0/CCA6:	8006    	BRA $CCAE
C0/CCA8:	A55C    	LDA $5C
C0/CCAA:	290F    	AND #$0F
C0/CCAC:	49FF    	EOR #$FF
C0/CCAE:	38      	SEC 
C0/CCAF:	7D6307  	ADC $0763,X
C0/CCB2:	851A    	STA $1A
C0/CCB4:	A576    	LDA $76
C0/CCB6:	F00C    	BEQ $CCC4
C0/CCB8:	300A    	BMI $CCC4
C0/CCBA:	A560    	LDA $60
C0/CCBC:	3A      	DEC A
C0/CCBD:	290F    	AND #$0F
C0/CCBF:	1A      	INC A
C0/CCC0:	49FF    	EOR #$FF
C0/CCC2:	8006    	BRA $CCCA
C0/CCC4:	A560    	LDA $60
C0/CCC6:	290F    	AND #$0F
C0/CCC8:	49FF    	EOR #$FF
C0/CCCA:	38      	SEC 
C0/CCCB:	7D6407  	ADC $0764,X
C0/CCCE:	38      	SEC 
C0/CCCF:	E57F    	SBC $7F
C0/CCD1:	851B    	STA $1B
C0/CCD3:	BD6507  	LDA $0765,X
C0/CCD6:	F043    	BEQ $CD1B
C0/CCD8:	BD6607  	LDA $0766,X
C0/CCDB:	2901    	AND #$01
C0/CCDD:	D01F    	BNE $CCFE
C0/CCDF:	A51A    	LDA $1A
C0/CCE1:	99E003  	STA $03E0,Y
C0/CCE4:	A51B    	LDA $1B
C0/CCE6:	99E103  	STA $03E1,Y
C0/CCE9:	BD6507  	LDA $0765,X
C0/CCEC:	99E203  	STA $03E2,Y
C0/CCEF:	BD6607  	LDA $0766,X
C0/CCF2:	29CE    	AND #$CE
C0/CCF4:	99E303  	STA $03E3,Y
C0/CCF7:	A9EF    	LDA #$EF
C0/CCF9:	99A104  	STA $04A1,Y
C0/CCFC:	801D    	BRA $CD1B
C0/CCFE:	A51A    	LDA $1A
C0/CD00:	99A004  	STA $04A0,Y
C0/CD03:	A51B    	LDA $1B
C0/CD05:	99A104  	STA $04A1,Y
C0/CD08:	BD6507  	LDA $0765,X
C0/CD0B:	99A204  	STA $04A2,Y
C0/CD0E:	BD6607  	LDA $0766,X
C0/CD11:	29CE    	AND #$CE
C0/CD13:	99A304  	STA $04A3,Y
C0/CD16:	A9EF    	LDA #$EF
C0/CD18:	99E103  	STA $03E1,Y
C0/CD1B:	C8      	INY 
C0/CD1C:	C8      	INY 
C0/CD1D:	C8      	INY 
C0/CD1E:	C8      	INY 
C0/CD1F:	E8      	INX
C0/CD20:	E8      	INX
C0/CD21:	E8      	INX
C0/CD22:	E8      	INX
C0/CD23:	E01000  	CPX #$0010
C0/CD26:	F003    	BEQ $CD2B
C0/CD28:	4C98CC  	JMP $CC98
C0/CD2B:	60      	RTS
 
C0/CD2C:	7B      	TDC 
C0/CD2D:	8D6507  	STA $0765
C0/CD30:	8D6907  	STA $0769
C0/CD33:	8D6D07  	STA $076D
C0/CD36:	8D7107  	STA $0771
C0/CD39:	60      	RTS
 
C0/CD3A:	0000    	BRK #$00
C0/CD3C:	0000    	BRK #$00
C0/CD3E:	0000    	BRK #$00
C0/CD40:	0000    	BRK #$00
C0/CD42:	0000    	BRK #$00
C0/CD44:	0000    	BRK #$00
C0/CD46:	0000    	BRK #$00
C0/CD48:	0000    	BRK #$00
C0/CD4A:	0000    	BRK #$00
C0/CD4C:	0000    	BRK #$00
C0/CD4E:	0000    	BRK #$00
C0/CD50:	0000    	BRK #$00
C0/CD52:	0000    	BRK #$00
C0/CD54:	0000    	BRK #$00
C0/CD56:	0000    	BRK #$00
C0/CD58:	0000    	BRK #$00
C0/CD5A:	0000    	BRK #$00
C0/CD5C:	0000    	BRK #$00
C0/CD5E:	0000    	BRK #$00
C0/CD60:	0000    	BRK #$00
C0/CD62:	0000    	BRK #$00
C0/CD64:	0000    	BRK #$00
C0/CD66:	0000    	BRK #$00
C0/CD68:	0000    	BRK #$00
C0/CD6A:	0000    	BRK #$00
C0/CD6C:	0000    	BRK #$00
C0/CD6E:	0000    	BRK #$00
C0/CD70:	0000    	BRK #$00
C0/CD72:	0000    	BRK #$00
C0/CD74:	0000    	BRK #$00
C0/CD76:	0000    	BRK #$00
C0/CD78:	0000    	BRK #$00
C0/CD7A:	40      	RTI
 
C0/CD7B:	40      	RTI
 
C0/CD7C:	40      	RTI
 
C0/CD7D:	40      	RTI
 
C0/CD7E:	40      	RTI
 
C0/CD7F:	40      	RTI
 
C0/CD80:	40      	RTI
 
C0/CD81:	40      	RTI
 
C0/CD82:	40      	RTI
 
C0/CD83:	40      	RTI
 
C0/CD84:	40      	RTI
 
C0/CD85:	40      	RTI
 
C0/CD86:	40      	RTI
 
C0/CD87:	40      	RTI
 
C0/CD88:	40      	RTI
 
C0/CD89:	40      	RTI
 
C0/CD8A:	40      	RTI
 
C0/CD8B:	40      	RTI
 
C0/CD8C:	40      	RTI
 
C0/CD8D:	40      	RTI
 
C0/CD8E:	40      	RTI
 
C0/CD8F:	40      	RTI
 
C0/CD90:	40      	RTI
 
C0/CD91:	40      	RTI
 
C0/CD92:	40      	RTI
 
C0/CD93:	40      	RTI
 
C0/CD94:	40      	RTI
 
C0/CD95:	40      	RTI
 
C0/CD96:	40      	RTI
 
C0/CD97:	40      	RTI
 
C0/CD98:	40      	RTI
 
C0/CD99:	40      	RTI
 
C0/CD9A:	40      	RTI
 
C0/CD9B:	40      	RTI
 
C0/CD9C:	40      	RTI
 
C0/CD9D:	40      	RTI
 
C0/CD9E:	40      	RTI
 
C0/CD9F:	40      	RTI
 
C0/CDA0:	40      	RTI
 
C0/CDA1:	40      	RTI
 
C0/CDA2:	40      	RTI
 
C0/CDA3:	40      	RTI
 
C0/CDA4:	40      	RTI
 
C0/CDA5:	40      	RTI
 
C0/CDA6:	40      	RTI
 
C0/CDA7:	40      	RTI
 
C0/CDA8:	40      	RTI
 
C0/CDA9:	40      	RTI
 
C0/CDAA:	40      	RTI
 
C0/CDAB:	40      	RTI
 
C0/CDAC:	40      	RTI
 
C0/CDAD:	40      	RTI
 
C0/CDAE:	40      	RTI
 
C0/CDAF:	40      	RTI
 
C0/CDB0:	40      	RTI
 
C0/CDB1:	40      	RTI
 
C0/CDB2:	40      	RTI
 
C0/CDB3:	40      	RTI
 
C0/CDB4:	40      	RTI
 
C0/CDB5:	40      	RTI
 
C0/CDB6:	40      	RTI
 
C0/CDB7:	40      	RTI
 
C0/CDB8:	40      	RTI
 
C0/CDB9:	40      	RTI
 
C0/CDBA:	0000    	BRK #$00
C0/CDBC:	40      	RTI
 
C0/CDBD:	0000    	BRK #$00
C0/CDBF:	40      	RTI
 
C0/CDC0:	0000    	BRK #$00
C0/CDC2:	0000    	BRK #$00
C0/CDC4:	0000    	BRK #$00
C0/CDC6:	0000    	BRK #$00
C0/CDC8:	0000    	BRK #$00
C0/CDCA:	0000    	BRK #$00
C0/CDCC:	0000    	BRK #$00
C0/CDCE:	0000    	BRK #$00
C0/CDD0:	0000    	BRK #$00
C0/CDD2:	0000    	BRK #$00
C0/CDD4:	0000    	BRK #$00
C0/CDD6:	0000    	BRK #$00
C0/CDD8:	0000    	BRK #$00
C0/CDDA:	0000    	BRK #$00
C0/CDDC:	0000    	BRK #$00
C0/CDDE:	0000    	BRK #$00
C0/CDE0:	0000    	BRK #$00
C0/CDE2:	0000    	BRK #$00
C0/CDE4:	0000    	BRK #$00
C0/CDE6:	0000    	BRK #$00
C0/CDE8:	0000    	BRK #$00
C0/CDEA:	0000    	BRK #$00
C0/CDEC:	0000    	BRK #$00
C0/CDEE:	0000    	BRK #$00
C0/CDF0:	0000    	BRK #$00
C0/CDF2:	0000    	BRK #$00
C0/CDF4:	0000    	BRK #$00
C0/CDF6:	0000    	BRK #$00
C0/CDF8:	0000    	BRK #$00
C0/CDFA:	40      	RTI
 
C0/CDFB:	40      	RTI
 
C0/CDFC:	40      	RTI
 
C0/CDFD:	0040    	BRK #$40
C0/CDFF:	0040    	BRK #$40
C0/CE01:	40      	RTI
 
C0/CE02:	40      	RTI
 
C0/CE03:	40      	RTI
 
C0/CE04:	40      	RTI
 
C0/CE05:	40      	RTI
 
C0/CE06:	40      	RTI
 
C0/CE07:	40      	RTI
 
C0/CE08:	40      	RTI
 
C0/CE09:	40      	RTI
 
C0/CE0A:	40      	RTI
 
C0/CE0B:	40      	RTI
 
C0/CE0C:	40      	RTI
 
C0/CE0D:	40      	RTI
 
C0/CE0E:	40      	RTI
 
C0/CE0F:	40      	RTI
 
C0/CE10:	40      	RTI
 
C0/CE11:	40      	RTI
 
C0/CE12:	40      	RTI
 
C0/CE13:	40      	RTI
 
C0/CE14:	40      	RTI
 
C0/CE15:	40      	RTI
 
C0/CE16:	40      	RTI
 
C0/CE17:	40      	RTI
 
C0/CE18:	40      	RTI
 
C0/CE19:	40      	RTI
 
C0/CE1A:	40      	RTI
 
C0/CE1B:	40      	RTI
 
C0/CE1C:	40      	RTI
 
C0/CE1D:	40      	RTI
 
C0/CE1E:	40      	RTI
 
C0/CE1F:	40      	RTI
 
C0/CE20:	40      	RTI
 
C0/CE21:	40      	RTI
 
C0/CE22:	40      	RTI
 
C0/CE23:	40      	RTI
 
C0/CE24:	40      	RTI
 
C0/CE25:	40      	RTI
 
C0/CE26:	40      	RTI
 
C0/CE27:	40      	RTI
 
C0/CE28:	40      	RTI
 
C0/CE29:	40      	RTI
 
C0/CE2A:	40      	RTI
 
C0/CE2B:	40      	RTI
 
C0/CE2C:	40      	RTI
 
C0/CE2D:	40      	RTI
 
C0/CE2E:	40      	RTI
 
C0/CE2F:	40      	RTI
 
C0/CE30:	40      	RTI
 
C0/CE31:	40      	RTI
 
C0/CE32:	40      	RTI
 
C0/CE33:	40      	RTI
 
C0/CE34:	40      	RTI
 
C0/CE35:	40      	RTI
 
C0/CE36:	40      	RTI
 
C0/CE37:	40      	RTI
 
C0/CE38:	40      	RTI
 
C0/CE39:	40      	RTI


Offsets of Map Character Sprite Parts 
   
C0/CE3A:	00 00 20 00 40 00
C0/CE40:	60 00 80 00 A0 00
C0/CE46:	00 00 20 00 C0 00
C0/CE4C:	E0 00 00 01 20 01
C0/CE52:	00 00 20 00 40 01
C0/CE58:	60 01 80 00 A0 00
C0/CE5E:	80 01 A0 01 C0 01
C0/CE64:	E0 01 00 02 20 02
C0/CE6A:	80 01 A0 01 40 02
C0/CE70:	60 02 80 02 A0 02
C0/CE76:	80 01 A0 01 C0 02
C0/CE7C:	E0 02 00 02 20 02
C0/CE82:	00 03 20 03 40 03
C0/CE88:	60 03 80 03 A0 03
C0/CE8E:	C0 03 E0 03 00 04
C0/CE94:	20 04 40 04 60 04
C0/CE9A:	00 03 20 03 80 04
C0/CEA0:	A0 04 C0 04 E0 04
C0/CEA6:	00 07 20 07 40 07
C0/CEAC:	60 07 80 07 A0 07
C0/CEB2:	C0 07 E0 07 00 08
C0/CEB8:	20 08 40 08 60 08
C0/CEBE:	80 08 A0 08 C0 08
C0/CEC4:	E0 08 00 09 20 09
C0/CECA:	C0 03 E0 03 00 05
C0/CED0:	20 05 40 05 60 05
C0/CED6:	00 03 20 03 80 05
C0/CEDC:	60 03 A0 05 A0 03
C0/CEE2:	00 03 C0 05 E0 05
C0/CEE8:	00 06 20 06 40 06
C0/CEEE:	C0 03 60 06 80 06
C0/CEF4:	A0 06 C0 06 E0 06
C0/CEFA:	40 09 60 09 80 09
C0/CF00:	A0 09 C0 09 E0 09
C0/CF06:	40 09 60 09 00 0A
C0/CF0C:	A0 09 C0 09 E0 09
C0/CF12:	20 0A 40 0A 60 0A
C0/CF18:	80 0A A0 0A C0 0A
C0/CF1E:	00 00 20 00 A0 0B
C0/CF24:	C0 0B 00 01 20 01
C0/CF2A:	00 00 20 00 C0 00
C0/CF30:	E0 0B 00 01 20 01
C0/CF36:	C0 12 E0 03 E0 12
C0/CF3C:	20 04 40 04 60 04
C0/CF42:	40 0D 60 0D 80 0D
C0/CF48:	A0 0D C0 0D E0 0D
C0/CF4E:	00 0E 20 0E 40 0E
C0/CF54:	60 0E 80 0E A0 0E
C0/CF5A:	C0 0E E0 0E 00 0F
C0/CF60:	20 0F 40 0F 60 0F
C0/CF66:	40 0D 20 00 80 0D
C0/CF6C:	E0 00 C0 0D 20 01
C0/CF72:	40 10 20 00 60 10
C0/CF78:	E0 00 C0 0D 20 01
C0/CF7E:	80 01 20 0E 40 02
C0/CF84:	60 0E 80 02 A0 0E
C0/CF8A:	80 01 80 10 40 02
C0/CF90:	A0 10 80 02 A0 0E
C0/CF96:	00 0C 20 0C 40 0C
C0/CF9C:	60 0C 80 0C A0 0C
C0/CFA2:	C0 0C E0 0C 00 0D
C0/CFA8:	20 0D 80 0C A0 0C
C0/CFAE:	80 0F A0 0F C0 0F
C0/CFB4:	E0 0F 00 10 20 10
C0/CFBA:	C0 10 E0 10 00 11
C0/CFC0:	20 11 00 01 20 01
C0/CFC6:	40 11 60 11 80 11
C0/CFCC:	A0 11 80 02 A0 02
C0/CFD2:	C0 11 E0 11 00 12
C0/CFD8:	20 12 40 04 60 04
C0/CFDE:	40 12 60 12 80 12
C0/CFE4:	A0 12 00 01 20 01
C0/CFEA:	60 14 80 14 00 13
C0/CFF0:	20 13 40 13 60 13
C0/CFF6:	60 14 80 14 80 13
C0/CFFC:	20 13 40 13 60 13
C0/D002:	A0 13 C0 13 E0 13
C0/D008:	00 14 20 14 40 14
C0/D00E:	A0 14 C0 14 E0 14
C0/D014:	00 15 20 15 40 15
C0/D01A:	20 0A 40 0A 60 0A
C0/D020:	80 0A A0 0A C0 0A
C0/D026:	20 06 40 06 60 06
C0/D02C:	80 06 A0 06 C0 06
C0/D032:	00 05 20 00 20 05
C0/D038:	E0 00 40 05 20 01
C0/D03E:	60 05 20 00 80 05
C0/D044:	E0 00 40 05 20 01
C0/D04A:	A0 05 C0 05 E0 05
C0/D050:	00 06 00 01 20 01
C0/D056:	00 05 20 05 40 05
C0/D05C:	60 05 80 05 A0 05
C0/D062:	20 16 40 16 60 16
C0/D068:	80 16 E0 15 00 16
C0/D06E:	60 15 80 15 A0 15
C0/D074:	C0 15 E0 15 00 16
C0/D07A:	C0 00 20 00 E0 00
C0/D080:	60 00 00 01 A0 00
C0/D086:	20 01 40 01 40 00
C0/D08C:	60 00 80 00 A0 00
C0/D092:	00 00 00 00 20 00
C0/D098:	40 00 60 00 80 00
C0/D09E:	00 00 00 00 A0 00
C0/D0A4:	C0 00 E0 00 00 01
C0/D0AA:	00 00 00 00 20 01
C0/D0B0:	40 01 60 01 80 01
C0/D0B6:	00 00 00 00 A0 01
C0/D0BC:	C0 01 E0 01 00 02
C0/D0C2:	C0 05 E0 05 00 06
C0/D0C8:	20 06 40 06 60 06
C0/D0CE:	80 06 A0 06 C0 06
C0/D0D4:	E0 06 40 06 60 06
C0/D0DA:	80 06 A0 06 C0 06
C0/D0E0:	E0 06 40 06 60 06
C0/D0E6:	00 00 20 00 40 00
C0/D0EC:	40 00 40 00 40 00

Pointers to Map Character Graphics (2 bytes each)

C0/D0F2:	0000    	
C0/D0F4:	A016    	
C0/D0F6:	402D    	
C0/D0F8:	E043  	
C0/D0FA:	805A    	
C0/D0FC:	2071  	
C0/D0FE:	C087    	
C0/D100:	609E
C0/D102:	00B5  	
C0/D104:	A0CB  
C0/D106:	40E2 
C0/D108:	E0F8   

C0/D10A:	800F    	BRA $D11B
C0/D10C:	2026C0  	JSR $C026
C0/D10F:	3C60  	
C0/D112:	53006A    	
C0/D114:	60      	RTS
 
C0/D115:	7FC09420	ADC $2094C0,X
C0/D119:	AA      	TAX
C0/D11A:	80BF    	BRA $D0DB
C0/D11C:	E0D440  	CPX #$40D4
C0/D11F:	EA      	NOP
C0/D120:	20F100  	JSR $00F1
C0/D123:	F8      	SED 
C0/D124:	E0FEC0  	CPX #$C0FE
C0/D127:	05C0    	ORA $C0
C0/D129:	0CC013  	TSB $13C0
C0/D12C:	C01A80  	CPY #$801A
C0/D12F:	204026  	JSR $2640
C0/D132:	002C    	BRK #$2C
C0/D134:	C03180  	CPY #$8031
C0/D137:	3740    	AND [$40],Y
C0/D139:	3D0043  	AND $4300,X
C0/D13C:	C04880  	CPY #$8048
C0/D13F:	4E4054  	LSR $5440
C0/D142:	005A    	BRK #$5A
C0/D144:	C05F80  	CPY #$805F
C0/D147:	6540    	ADC $40
C0/D149:	6B      	RTL
 
C0/D14A:	0071    	BRK #$71
C0/D14C:	C07680  	CPY #$8076
C0/D14F:	7C4082  	JMP ($8240,X)
C0/D152:	0088    	BRK #$88
C0/D154:	C08DC0  	CPY #$C08D
C0/D157:	92C0    	STA ($C0)
C0/D159:	97C0    	STA [$C0],Y
C0/D15B:	9CC0A1  	STZ $A1C0
C0/D15E:	C0A6C0  	CPY #$C0A6
C0/D161:	AB      	PLB
C0/D162:	C0B0C0  	CPY #$C0B0
C0/D165:	B5C0    	LDA $C0,X
C0/D167:	BA      	TSX 
C0/D168:	C0BFC0  	CPY #$C0BF
C0/D16B:	C4C0    	CPY $C0
C0/D16D:	C9C0    	CMP #$C0
C0/D16F:	CEC0D3  	DEC $D3C0
C0/D172:	20D560  	JSR $60D5
C0/D175:	D620    	DEC $20,X
C0/D177:	D7E0    	CMP [$E0],Y
C0/D179:	D7A0    	CMP [$A0],Y
C0/D17B:	D8      	CLD 
C0/D17C:	60      	RTS
 
C0/D17D:	D920DA  	CMP $DA20,Y
C0/D180:	E0DAA0  	CPX #$A0DA
C0/D183:	DB      	STP 
C0/D184:	60      	RTS
 
C0/D185:	DC20DD  	JMP [$DD20]
C0/D188:	E0DDA0  	CPX #$A0DD
C0/D18B:	DE60DF  	DEC $DF60,X
C0/D18E:	20E0E0  	JSR $E0E0
C0/D191:	E0A0E1  	CPX #$E1A0
C0/D194:	60      	RTS
 
C0/D195:	E220    	SEP #$20      (8 bit accum./memory)
C0/D197:	E3E0    	SBC $E0,S
C0/D199:	E3A0    	SBC $A0,S
C0/D19B:	E460    	CPX $60
C0/D19D:	E520    	SBC $20
C0/D19F:	E6E0    	INC $E0
C0/D1A1:	E680    	INC $80
C0/D1A3:	E720    	SBC [$20]
C0/D1A5:	E8      	INX
C0/D1A6:	C0E860  	CPY #$60E8
C0/D1A9:	E900    	SBC #$00
C0/D1AB:	EA      	NOP
C0/D1AC:	A0EA40  	LDY #$40EA
C0/D1AF:	EB      	XBA
C0/D1B0:	E0EB80  	CPX #$80EB
C0/D1B3:	EC20ED  	CPX $ED20
C0/D1B6:	C0ED60  	CPY #$60ED
C0/D1B9:	EE00EF  	INC $EF00
C0/D1BC:	A0EF40  	LDY #$40EF
C0/D1BF:	F060    	BEQ $D221
C0/D1C1:	F180    	SBC ($80),Y
C0/D1C3:	F2A0    	SBC ($A0)
C0/D1C5:	F3C0    	SBC ($C0,S),Y
C0/D1C7:	F4E0F5  	PEA $F5E0
C0/D1CA:	00F7    	BRK #$F7
C0/D1CC:	20F840  	JSR $40F8
C0/D1CF:	F960FA  	SBC $FA60,Y
C0/D1D2:	80FC    	BRA $D1D0
C0/D1D4:	A0FEC0  	LDY #$C0FE
C0/D1D7:	00E0    	BRK #$E0
C0/D1D9:	0200    	COP #$00
C0/D1DB:	0580    	ORA $80
C0/D1DD:	0500    	ORA $00
C0/D1DF:	0680    	ASL $80
C0/D1E1:	0600    	ASL $00
C0/D1E3:	0700    	ORA [$00]
C0/D1E5:	0980    	ORA #$80
C0/D1E7:	0900    	ORA #$00
C0/D1E9:	0A      	ASL A
C0/D1EA:	800A    	BRA $D1F6
C0/D1EC:	000B    	BRK #$0B
C0/D1EE:	800B    	BRA $D1FB
C0/D1F0:	000C    	BRK #$0C
C0/D1F2:	800C    	BRA $D200
C0/D1F4:	000D    	BRK #$0D
C0/D1F6:	800D    	BRA $D205
C0/D1F8:	000E    	BRK #$0E
C0/D1FA:	800E    	BRA $D20A
C0/D1FC:	000F    	BRK #$0F
C0/D1FE:	0011    	BRK #$11
C0/D200:	0013    	BRK #$13
C0/D202:	8013    	BRA $D217
C0/D204:	0014    	BRK #$14
C0/D206:	8014    	BRA $D21C
C0/D208:	0015    	BRK #$15
C0/D20A:	8015    	BRA $D221
C0/D20C:	0016    	BRK #$16
C0/D20E:	8016    	BRA $D226
C0/D210:	0017    	BRK #$17
C0/D212:	0019    	BRK #$19
C0/D214:	8019    	BRA $D22F
C0/D216:	001A    	BRK #$1A
C0/D218:	801A    	BRA $D234
C0/D21A:	001B    	BRK #$1B
C0/D21C:	001D    	BRK #$1D
C0/D21E:	001F    	BRK #$1F
C0/D220:	801F    	BRA $D241
C0/D222:	0020    	BRK #$20
C0/D224:	0021    	BRK #$21
C0/D226:	0023    	BRK #$23
C0/D228:	0025    	BRK #$25
C0/D22A:	0027    	BRK #$27
C0/D22C:	0029    	BRK #$29
C0/D22E:	002B    	BRK #$2B
C0/D230:	802B    	BRA $D25D
C0/D232:	002C    	BRK #$2C
C0/D234:	802C    	BRA $D262
C0/D236:	002D    	BRK #$2D
C0/D238:	002E    	BRK #$2E
C0/D23A:	002F    	BRK #$2F

Bank pointers and Number of Bytes to Copy for Map Character Gfx (2 bytes each)

C0/D23C:	D520    	
C0/D23E:	D520    	
C0/D240:	D520    	
C0/D242:	D520    	
C0/D244:	D520    	
C0/D246:	D520    	
C0/D248:	D520    	
C0/D24A:	D520    	
C0/D24C:	D520    	
C0/D24E:	D520    	
C0/D250:	D520    	
C0/D252:	D520    	
C0/D254:	D620    	
C0/D256:	D620    	
C0/D258:	D620    	
C0/D25A:	D620    	
C0/D25C:	D620    	
C0/D25E:	D620    	
C0/D260:	D620    	
C0/D262:	D620    	
C0/D264:	D620    	
C0/D266:	D620    
C0/D268:	D620    
C0/D26A:	D620    
C0/D26C:	D620    
C0/D26E:	D620    
C0/D270:	D720    	
C0/D272:	D720    	
C0/D274:	D720    	
C0/D276:	D720    	
C0/D278:	D720    	
C0/D27A:	D720    	
C0/D27C:	D720    	
C0/D27E:	D720    	
C0/D280:	D720    	
C0/D282:	D720    	
C0/D284:	D720    	
C0/D286:	D720    	
C0/D288:	D720    	
C0/D28A:	D720    	
C0/D28C:	D720    
C0/D28E:	D720    	
C0/D290:	D720    
C0/D292:	D720    	
C0/D294:	D720    	
C0/D296:	D720    	
C0/D298:	D720    	
C0/D29A:	D720    	
C0/D29C:	D720    	
C0/D29E:	D720    	
C0/D2A0:	D720    	
C0/D2A2:	D720    	
C0/D2A4:	D720    	
C0/D2A6:	D720    	
C0/D2A8:	D720    	
C0/D2AA:	D720    	
C0/D2AC:	D720    
C0/D2AE:	D720    	
C0/D2B0:	D720    	
C0/D2B2:	D720    	
C0/D2B4:	D720    	
C0/D2B6:	D720    	
C0/D2B8:	D720    	
C0/D2BA:	D720    
C0/D2BC:	D720    	
C0/D2BE:	D720    	
C0/D2C0:	D720    
C0/D2C2:	D720    	
C0/D2C4:	D720    	
C0/D2C6:	D720    	
C0/D2C8:	D720    	
C0/D2CA:	D720    	
C0/D2CC:	D720    	
C0/D2CE:	D720 
C0/D2D0:	D720    	
C0/D2D2:	D720    	
C0/D2D4:	D720    	
C0/D2D6:	D720    
C0/D2D8:	D720    	
C0/D2DA:	D720    	
C0/D2DC:	D720    	
C0/D2DE:	D720    	
C0/D2E0:	D720    	
C0/D2E2:	D720    	
C0/D2E4:	D720    	
C0/D2E6:	D720    
C0/D2E8:	D720    	
C0/D2EA:	D720    
C0/D2EC:	D720    	
C0/D2EE:	D720    	
C0/D2F0:	D720    	
C0/D2F2:	D720    	
C0/D2F4:	D720    
C0/D2F6:	D720    	
C0/D2F8:	D720    	
C0/D2FA:	D720    	
C0/D2FC:	D720    	
C0/D2FE:	D720    	
C0/D300:	D720    	
C0/D302:	D720    	
C0/D304:	D720    	
C0/D306:	D720    	
C0/D308:	D720    	
C0/D30A:	D720    	
C0/D30C:	D720    	
C0/D30E:	D720    	
C0/D310:	D720    	
C0/D312:	D720    	
C0/D314:	D720    	
C0/D316:	D720    	
C0/D318:	D720    	
C0/D31A:	D720    
C0/D31C:	D720    
C0/D31E:	D720    	
C0/D320:	D820      
C0/D322:	D820  
C0/D324:	D820      	
C0/D326:	D820  	
C0/D328:	D820      
C0/D32A:	D820  
C0/D32C:	D820 
C0/D32E:	D820 
C0/D330:	D820 
C0/D332:	D820 
C0/D334:	D820
C0/D336:	D820
C0/D338:	D820
C0/D33A:	D820  	
C0/D33C:	D820      	
C0/D33E:	D820  
C0/D340:	D820
C0/D342:	D820  
C0/D344:	D820 
C0/D346:	D820 
C0/D348:	D820 
C0/D34A:	D820  
C0/D34C:	D820      
C0/D34E:	D820  	
C0/D350:	D820      
C0/D352:	D820  	
C0/D354:	D820      
C0/D356:	D820 
C0/D358:	D820 
C0/D35A:	D820  
C0/D35C:	D820 
C0/D35E:	D820 
C0/D360:	D820 
C0/D362:	D820  
C0/D364:	D820 
C0/D366:	D820  
C0/D368:	D820 
C0/D36A:	D820 
C0/D36C:	D820 
C0/D36E:	D820 
C0/D370:	D820 
C0/D372:	D820  	
C0/D374:	D820      	
C0/D376:	D820  	
C0/D378:	D820      	 
C0/D37A:	D820  	
C0/D37C:	D820      	 
C0/D37E:	D820  	
C0/D380:	D820      	 
C0/D382:	D820  	
C0/D384:	D820

Data of some sort

C0/D386:	38
C0/D387:	39  	
C0/D388:	3A      	
C0/D389:	3B      	 
C0/D38A:	3C
C0/D38B:	3D
C0/D38C:	3E		(etc.)  
C0/D38D:	3F78797A	AND $7A7978,X
C0/D391:	7B      	TDC 
C0/D392:	7C7D7E  	JMP ($7E7D,X)
C0/D395:	7FFFA6E5	ADC $E5A6FF,X
C0/D399:	E00000  	CPX #$0000
C0/D39C:	D03F    	BNE $D3DD
C0/D39E:	A5E7    	LDA $E7
C0/D3A0:	C9CA    	CMP #$CA
C0/D3A2:	D039    	BNE $D3DD
C0/D3A4:	AD6818  	LDA $1868
C0/D3A7:	C910    	CMP #$10
C0/D3A9:	9032    	BCC $D3DD
C0/D3AB:	A24A00  	LDX #$004A
C0/D3AE:	86E5    	STX $E5
C0/D3B0:	8EF405  	STX $05F4
C0/D3B3:	A9CA    	LDA #$CA
C0/D3B5:	85E7    	STA $E7
C0/D3B7:	8DF605  	STA $05F6
C0/D3BA:	A20000  	LDX #$0000
C0/D3BD:	8E9405  	STX $0594
C0/D3C0:	A9CA    	LDA #$CA
C0/D3C2:	8D9605  	STA $0596
C0/D3C5:	A901    	LDA #$01
C0/D3C7:	8DC705  	STA $05C7
C0/D3CA:	A20300  	LDX #$0003
C0/D3CD:	86E8    	STX $E8
C0/D3CF:	AC0308  	LDY $0803
C0/D3D2:	B97C08  	LDA $087C,Y
C0/D3D5:	997D08  	STA $087D,Y
C0/D3D8:	A904    	LDA #$04
C0/D3DA:	997C08  	STA $087C,Y
C0/D3DD:	60      	RTS
 
C0/D3DE:	9C0B42  	STZ $420B      (turn off DMA)
C0/D3E1:	A980    	LDA #$80
C0/D3E3:	8D1521  	STA $2115
C0/D3E6:	A918    	LDA #$18
C0/D3E8:	8D0143  	STA $4301
C0/D3EB:	A941    	LDA #$41
C0/D3ED:	8D0043  	STA $4300
C0/D3F0:	A2C039  	LDX #$39C0
C0/D3F3:	8E1621  	STX $2116
C0/D3F6:	A220E1  	LDX #$E120
C0/D3F9:	8E0243  	STX $4302
C0/D3FC:	A9C0    	LDA #$C0
C0/D3FE:	8D0443  	STA $4304
C0/D401:	8D0743  	STA $4307
C0/D404:	A28000  	LDX #$0080
C0/D407:	8E0543  	STX $4305
C0/D40A:	A901    	LDA #$01
C0/D40C:	8D0B42  	STA $420B
C0/D40F:	A2C03B  	LDX #$3BC0
C0/D412:	8E1621  	STX $2116
C0/D415:	A2A0E1  	LDX #$E1A0
C0/D418:	8E0243  	STX $4302
C0/D41B:	A9C0    	LDA #$C0
C0/D41D:	8D0443  	STA $4304
C0/D420:	8D0743  	STA $4307
C0/D423:	A28000  	LDX #$0080
C0/D426:	8E0543  	STX $4305
C0/D429:	A901    	LDA #$01
C0/D42B:	8D0B42  	STA $420B
C0/D42E:	A2C03D  	LDX #$3DC0
C0/D431:	8E1621  	STX $2116
C0/D434:	A220E2  	LDX #$E220
C0/D437:	8E0243  	STX $4302
C0/D43A:	A9C0    	LDA #$C0
C0/D43C:	8D0443  	STA $4304
C0/D43F:	8D0743  	STA $4307
C0/D442:	A28000  	LDX #$0080
C0/D445:	8E0543  	STX $4305
C0/D448:	A901    	LDA #$01
C0/D44A:	8D0B42  	STA $420B
C0/D44D:	60      	RTS
 
C0/D44E:	60      	RTS
 
C0/D44F:	AD6805  	LDA $0568
C0/D452:	D04A    	BNE $D49E
C0/D454:	A546    	LDA $46
C0/D456:	2907    	AND #$07
C0/D458:	D044    	BNE $D49E
C0/D45A:	A505    	LDA $05
C0/D45C:	2910    	AND #$10
C0/D45E:	F009    	BEQ $D469
C0/D460:	AED000  	LDX $00D0
C0/D463:	E8      	INX
C0/D464:	8ED000  	STX $00D0
C0/D467:	800D    	BRA $D476
C0/D469:	A505    	LDA $05
C0/D46B:	2920    	AND #$20
C0/D46D:	F02F    	BEQ $D49E
C0/D46F:	AED000  	LDX $00D0
C0/D472:	CA      	DEX
C0/D473:	8ED000  	STX $00D0
C0/D476:	AED000  	LDX $00D0
C0/D479:	861E    	STX $1E
C0/D47B:	2029D5  	JSR $D529
C0/D47E:	AE6905  	LDX $0569
C0/D481:	861E    	STX $1E
C0/D483:	2029D5  	JSR $D529
C0/D486:	AE6B05  	LDX $056B
C0/D489:	861E    	STX $1E
C0/D48B:	2029D5  	JSR $D529
C0/D48E:	A931    	LDA #$31
C0/D490:	209FD4  	JSR $D49F
C0/D493:	20BF7F  	JSR $7FBF		(Dialogue message loading function)
C0/D496:	A901    	LDA #$01
C0/D498:	85BC    	STA $BC
C0/D49A:	A901    	LDA #$01
C0/D49C:	85BA    	STA $BA
C0/D49E:	60      	RTS
 
C0/D49F:	A8      	TAY
C0/D4A0:	A9FF    	LDA #$FF
C0/D4A2:	8D8021  	STA $2180
C0/D4A5:	A921    	LDA #$21
C0/D4A7:	8D8021  	STA $2180
C0/D4AA:	88      	DEY 
C0/D4AB:	D0F3    	BNE $D4A0
C0/D4AD:	60      	RTS
 
C0/D4AE:	A9FF    	LDA #$FF
C0/D4B0:	8D8021  	STA $2180
C0/D4B3:	A921    	LDA #$21
C0/D4B5:	8D8021  	STA $2180
C0/D4B8:	A00800  	LDY #$0008
C0/D4BB:	7B      	TDC 
C0/D4BC:	061E    	ASL $1E
C0/D4BE:	6938    	ADC #$38
C0/D4C0:	8D8021  	STA $2180
C0/D4C3:	A921    	LDA #$21
C0/D4C5:	8D8021  	STA $2180
C0/D4C8:	88      	DEY 
C0/D4C9:	D0F0    	BNE $D4BB
C0/D4CB:	60      	RTS
 
C0/D4CC:	A9FF    	LDA #$FF
C0/D4CE:	8D8021  	STA $2180
C0/D4D1:	A921    	LDA #$21
C0/D4D3:	8D8021  	STA $2180
C0/D4D6:	A00800  	LDY #$0008
C0/D4D9:	7B      	TDC 
C0/D4DA:	461E    	LSR $1E
C0/D4DC:	6938    	ADC #$38
C0/D4DE:	8D8021  	STA $2180
C0/D4E1:	A921    	LDA #$21
C0/D4E3:	8D8021  	STA $2180
C0/D4E6:	88      	DEY 
C0/D4E7:	D0F0    	BNE $D4D9
C0/D4E9:	60      	RTS
 
C0/D4EA:	A51E    	LDA $1E
C0/D4EC:	AA      	TAX
C0/D4ED:	BF86D3C0	LDA $C0D386,X
C0/D4F1:	8D8021  	STA $2180
C0/D4F4:	A921    	LDA #$21
C0/D4F6:	8D8021  	STA $2180
C0/D4F9:	60      	RTS
 
C0/D4FA:	A9FF    	LDA #$FF
C0/D4FC:	8D8021  	STA $2180
C0/D4FF:	A921    	LDA #$21
C0/D501:	8D8021  	STA $2180
C0/D504:	A51E    	LDA $1E
C0/D506:	4A      	LSR A
C0/D507:	4A      	LSR A
C0/D508:	4A      	LSR A
C0/D509:	4A      	LSR A
C0/D50A:	AA      	TAX
C0/D50B:	BF86D3C0	LDA $C0D386,X
C0/D50F:	8D8021  	STA $2180
C0/D512:	A921    	LDA #$21
C0/D514:	8D8021  	STA $2180
C0/D517:	A51E    	LDA $1E
C0/D519:	290F    	AND #$0F
C0/D51B:	AA      	TAX
C0/D51C:	BF86D3C0	LDA $C0D386,X
C0/D520:	8D8021  	STA $2180
C0/D523:	A921    	LDA #$21
C0/D525:	8D8021  	STA $2180
C0/D528:	60      	RTS
 
C0/D529:	A9FF    	LDA #$FF
C0/D52B:	8D8021  	STA $2180
C0/D52E:	A921    	LDA #$21
C0/D530:	8D8021  	STA $2180
C0/D533:	A51F    	LDA $1F
C0/D535:	4A      	LSR A
C0/D536:	4A      	LSR A
C0/D537:	4A      	LSR A
C0/D538:	4A      	LSR A
C0/D539:	AA      	TAX
C0/D53A:	BF86D3C0	LDA $C0D386,X
C0/D53E:	8D8021  	STA $2180
C0/D541:	A921    	LDA #$21
C0/D543:	8D8021  	STA $2180
C0/D546:	A51F    	LDA $1F
C0/D548:	290F    	AND #$0F
C0/D54A:	AA      	TAX
C0/D54B:	BF86D3C0	LDA $C0D386,X
C0/D54F:	8D8021  	STA $2180
C0/D552:	A921    	LDA #$21
C0/D554:	8D8021  	STA $2180
C0/D557:	A51E    	LDA $1E
C0/D559:	4A      	LSR A
C0/D55A:	4A      	LSR A
C0/D55B:	4A      	LSR A
C0/D55C:	4A      	LSR A
C0/D55D:	AA      	TAX
C0/D55E:	BF86D3C0	LDA $C0D386,X
C0/D562:	8D8021  	STA $2180
C0/D565:	A921    	LDA #$21
C0/D567:	8D8021  	STA $2180
C0/D56A:	A51E    	LDA $1E
C0/D56C:	290F    	AND #$0F
C0/D56E:	AA      	TAX
C0/D56F:	BF86D3C0	LDA $C0D386,X
C0/D573:	8D8021  	STA $2180
C0/D576:	A921    	LDA #$21
C0/D578:	8D8021  	STA $2180
C0/D57B:	60      	RTS
 
C0/D57C:	A546    	LDA $46
C0/D57E:	2903    	AND #$03
C0/D580:	D02C    	BNE $D5AE
C0/D582:	A505    	LDA $05
C0/D584:	2910    	AND #$10
C0/D586:	F011    	BEQ $D599
C0/D588:	C220    	REP #$20      (16 bit accum./memory)
C0/D58A:	AD5B11  	LDA $115B
C0/D58D:	18      	CLC
C0/D58E:	691000  	ADC #$0010
C0/D591:	8D5B11  	STA $115B
C0/D594:	7B      	TDC 
C0/D595:	E220    	SEP #$20      (8 bit accum./memory)
C0/D597:	8015    	BRA $D5AE
C0/D599:	A505    	LDA $05
C0/D59B:	2920    	AND #$20
C0/D59D:	F00F    	BEQ $D5AE
C0/D59F:	C220    	REP #$20      (16 bit accum./memory)
C0/D5A1:	AD5B11  	LDA $115B
C0/D5A4:	38      	SEC 
C0/D5A5:	E91000  	SBC #$0010
C0/D5A8:	8D5B11  	STA $115B
C0/D5AB:	7B      	TDC 
C0/D5AC:	E220    	SEP #$20      (8 bit accum./memory)
C0/D5AE:	A907    	LDA #$07
C0/D5B0:	209FD4  	JSR $D49F
C0/D5B3:	AE5B11  	LDX $115B
C0/D5B6:	861E    	STX $1E
C0/D5B8:	2029D5  	JSR $D529
C0/D5BB:	C220    	REP #$20      (16 bit accum./memory)
C0/D5BD:	AD5B11  	LDA $115B
C0/D5C0:	4A      	LSR A
C0/D5C1:	4A      	LSR A
C0/D5C2:	4A      	LSR A
C0/D5C3:	AA      	TAX
C0/D5C4:	7B      	TDC 
C0/D5C5:	E220    	SEP #$20      (8 bit accum./memory)
C0/D5C7:	BD801E  	LDA $1E80,X
C0/D5CA:	851E    	STA $1E
C0/D5CC:	20CCD4  	JSR $D4CC
C0/D5CF:	BD811E  	LDA $1E81,X
C0/D5D2:	851E    	STA $1E
C0/D5D4:	20CCD4  	JSR $D4CC
C0/D5D7:	A902    	LDA #$02
C0/D5D9:	209FD4  	JSR $D49F
C0/D5DC:	A907    	LDA #$07
C0/D5DE:	209FD4  	JSR $D49F
C0/D5E1:	C221    	REP #$21
C0/D5E3:	AD5B11  	LDA $115B
C0/D5E6:	691000  	ADC #$0010
C0/D5E9:	851E    	STA $1E
C0/D5EB:	7B      	TDC 
C0/D5EC:	E220    	SEP #$20      (8 bit accum./memory)
C0/D5EE:	2029D5  	JSR $D529
C0/D5F1:	C220    	REP #$20      (16 bit accum./memory)
C0/D5F3:	AD5B11  	LDA $115B
C0/D5F6:	4A      	LSR A
C0/D5F7:	4A      	LSR A
C0/D5F8:	4A      	LSR A
C0/D5F9:	AA      	TAX
C0/D5FA:	7B      	TDC 
C0/D5FB:	E220    	SEP #$20      (8 bit accum./memory)
C0/D5FD:	BD821E  	LDA $1E82,X
C0/D600:	851E    	STA $1E
C0/D602:	20CCD4  	JSR $D4CC
C0/D605:	BD831E  	LDA $1E83,X
C0/D608:	851E    	STA $1E
C0/D60A:	20CCD4  	JSR $D4CC
C0/D60D:	A902    	LDA #$02
C0/D60F:	209FD4  	JSR $D49F
C0/D612:	60      	RTS
 
C0/D613:	FFFFFFFF	SBC $FFFFFF,X
C0/D617:	FFFFFFFF	SBC $FFFFFF,X
C0/D61B:	FFFFFFFF	SBC $FFFFFF,X
C0/D61F:	FFFFFFFF	SBC $FFFFFF,X
C0/D623:	FFFFFFFF	SBC $FFFFFF,X
C0/D627:	FFFFFFFF	SBC $FFFFFF,X
C0/D62B:	FFFFFFFF	SBC $FFFFFF,X
C0/D62F:	FFFFFFFF	SBC $FFFFFF,X
C0/D633:	FFFFFFFF	SBC $FFFFFF,X
C0/D637:	FFFFFFFF	SBC $FFFFFF,X
C0/D63B:	FFFFFFFF	SBC $FFFFFF,X
C0/D63F:	FFFFFFFF	SBC $FFFFFF,X
C0/D643:	FFFFFFFF	SBC $FFFFFF,X
C0/D647:	FFFFFFFF	SBC $FFFFFF,X
C0/D64B:	FFFFFFFF	SBC $FFFFFF,X
C0/D64F:	FFFFFFFF	SBC $FFFFFF,X
C0/D653:	FFFFFFFF	SBC $FFFFFF,X
C0/D657:	FFFFFFFF	SBC $FFFFFF,X
C0/D65B:	FFFFFFFF	SBC $FFFFFF,X
C0/D65F:	FFFFFFFF	SBC $FFFFFF,X
C0/D663:	FFFFFFFF	SBC $FFFFFF,X
C0/D667:	FFFFFFFF	SBC $FFFFFF,X
C0/D66B:	FFFFFFFF	SBC $FFFFFF,X
C0/D66F:	FFFFFFFF	SBC $FFFFFF,X
C0/D673:	FFFFFFFF	SBC $FFFFFF,X
C0/D677:	FFFFFFFF	SBC $FFFFFF,X
C0/D67B:	FFFFFFFF	SBC $FFFFFF,X
C0/D67F:	FFFFFFFF	SBC $FFFFFF,X
C0/D683:	FFFFFFFF	SBC $FFFFFF,X
C0/D687:	FFFFFFFF	SBC $FFFFFF,X
C0/D68B:	FFFFFFFF	SBC $FFFFFF,X
C0/D68F:	FFFFFFFF	SBC $FFFFFF,X
C0/D693:	FFFFFFFF	SBC $FFFFFF,X
C0/D697:	FFFFFFFF	SBC $FFFFFF,X
C0/D69B:	FFFFFFFF	SBC $FFFFFF,X
C0/D69F:	FFFFFFFF	SBC $FFFFFF,X
C0/D6A3:	FFFFFFFF	SBC $FFFFFF,X
C0/D6A7:	FFFFFFFF	SBC $FFFFFF,X
C0/D6AB:	FFFFFFFF	SBC $FFFFFF,X
C0/D6AF:	FFFFFFFF	SBC $FFFFFF,X
C0/D6B3:	FFFFFFFF	SBC $FFFFFF,X
C0/D6B7:	FFFFFFFF	SBC $FFFFFF,X
C0/D6BB:	FFFFFFFF	SBC $FFFFFF,X
C0/D6BF:	FFFFFFFF	SBC $FFFFFF,X
C0/D6C3:	FFFFFFFF	SBC $FFFFFF,X
C0/D6C7:	FFFFFFFF	SBC $FFFFFF,X
C0/D6CB:	FFFFFFFF	SBC $FFFFFF,X
C0/D6CF:	FFFFFFFF	SBC $FFFFFF,X
C0/D6D3:	FFFFFFFF	SBC $FFFFFF,X
C0/D6D7:	FFFFFFFF	SBC $FFFFFF,X
C0/D6DB:	FFFFFFFF	SBC $FFFFFF,X
C0/D6DF:	FFFFFFFF	SBC $FFFFFF,X
C0/D6E3:	FFFFFFFF	SBC $FFFFFF,X
C0/D6E7:	FFFFFFFF	SBC $FFFFFF,X
C0/D6EB:	FFFFFFFF	SBC $FFFFFF,X
C0/D6EF:	FFFFFFFF	SBC $FFFFFF,X
C0/D6F3:	FFFFFFFF	SBC $FFFFFF,X
C0/D6F7:	FFFFFFFF	SBC $FFFFFF,X
C0/D6FB:	FFFFFFFF	SBC $FFFFFF,X
C0/D6FF:	FFFFFFFF	SBC $FFFFFF,X
C0/D703:	FFFFFFFF	SBC $FFFFFF,X
C0/D707:	FFFFFFFF	SBC $FFFFFF,X
C0/D70B:	FFFFFFFF	SBC $FFFFFF,X
C0/D70F:	FFFFFFFF	SBC $FFFFFF,X
C0/D713:	FFFFFFFF	SBC $FFFFFF,X
C0/D717:	FFFFFFFF	SBC $FFFFFF,X
C0/D71B:	FFFFFFFF	SBC $FFFFFF,X
C0/D71F:	FFFFFFFF	SBC $FFFFFF,X
C0/D723:	FFFFFFFF	SBC $FFFFFF,X
C0/D727:	FFFFFFFF	SBC $FFFFFF,X
C0/D72B:	FFFFFFFF	SBC $FFFFFF,X
C0/D72F:	FFFFFFFF	SBC $FFFFFF,X
C0/D733:	FFFFFFFF	SBC $FFFFFF,X
C0/D737:	FFFFFFFF	SBC $FFFFFF,X
C0/D73B:	FFFFFFFF	SBC $FFFFFF,X
C0/D73F:	FFFFFFFF	SBC $FFFFFF,X
C0/D743:	FFFFFFFF	SBC $FFFFFF,X
C0/D747:	FFFFFFFF	SBC $FFFFFF,X
C0/D74B:	FFFFFFFF	SBC $FFFFFF,X
C0/D74F:	FFFFFFFF	SBC $FFFFFF,X
C0/D753:	FFFFFFFF	SBC $FFFFFF,X
C0/D757:	FFFFFFFF	SBC $FFFFFF,X
C0/D75B:	FFFFFFFF	SBC $FFFFFF,X
C0/D75F:	FFFFFFFF	SBC $FFFFFF,X
C0/D763:	FFFFFFFF	SBC $FFFFFF,X
C0/D767:	FFFFFFFF	SBC $FFFFFF,X
C0/D76B:	FFFFFFFF	SBC $FFFFFF,X
C0/D76F:	FFFFFFFF	SBC $FFFFFF,X
C0/D773:	FFFFFFFF	SBC $FFFFFF,X
C0/D777:	FFFFFFFF	SBC $FFFFFF,X
C0/D77B:	FFFFFFFF	SBC $FFFFFF,X
C0/D77F:	FFFFFFFF	SBC $FFFFFF,X
C0/D783:	FFFFFFFF	SBC $FFFFFF,X
C0/D787:	FFFFFFFF	SBC $FFFFFF,X
C0/D78B:	FFFFFFFF	SBC $FFFFFF,X
C0/D78F:	FFFFFFFF	SBC $FFFFFF,X
C0/D793:	FFFFFFFF	SBC $FFFFFF,X
C0/D797:	FFFFFFFF	SBC $FFFFFF,X
C0/D79B:	FFFFFFFF	SBC $FFFFFF,X
C0/D79F:	FFFFFFFF	SBC $FFFFFF,X
C0/D7A3:	FFFFFFFF	SBC $FFFFFF,X
C0/D7A7:	FFFFFFFF	SBC $FFFFFF,X
C0/D7AB:	FFFFFFFF	SBC $FFFFFF,X
C0/D7AF:	FFFFFFFF	SBC $FFFFFF,X
C0/D7B3:	FFFFFFFF	SBC $FFFFFF,X
C0/D7B7:	FFFFFFFF	SBC $FFFFFF,X
C0/D7BB:	FFFFFFFF	SBC $FFFFFF,X
C0/D7BF:	FFFFFFFF	SBC $FFFFFF,X
C0/D7C3:	FFFFFFFF	SBC $FFFFFF,X
C0/D7C7:	FFFFFFFF	SBC $FFFFFF,X
C0/D7CB:	FFFFFFFF	SBC $FFFFFF,X
C0/D7CF:	FFFFFFFF	SBC $FFFFFF,X
C0/D7D3:	FFFFFFFF	SBC $FFFFFF,X
C0/D7D7:	FFFFFFFF	SBC $FFFFFF,X
C0/D7DB:	FFFFFFFF	SBC $FFFFFF,X
C0/D7DF:	FFFFFFFF	SBC $FFFFFF,X
C0/D7E3:	FFFFFFFF	SBC $FFFFFF,X
C0/D7E7:	FFFFFFFF	SBC $FFFFFF,X
C0/D7EB:	FFFFFFFF	SBC $FFFFFF,X
C0/D7EF:	FFFFFFFF	SBC $FFFFFF,X
C0/D7F3:	FFFFFFFF	SBC $FFFFFF,X
C0/D7F7:	FFFFFFFF	SBC $FFFFFF,X
C0/D7FB:	FFFFFFFF	SBC $FFFFFF,X
C0/D7FF:	FFFFFFFF	SBC $FFFFFF,X
C0/D803:	FFFFFFFF	SBC $FFFFFF,X
C0/D807:	FFFFFFFF	SBC $FFFFFF,X
C0/D80B:	FFFFFFFF	SBC $FFFFFF,X
C0/D80F:	FFFFFFFF	SBC $FFFFFF,X
C0/D813:	FFFFFFFF	SBC $FFFFFF,X
C0/D817:	FFFFFFFF	SBC $FFFFFF,X
C0/D81B:	FFFFFFFF	SBC $FFFFFF,X
C0/D81F:	FFFFFFFF	SBC $FFFFFF,X
C0/D823:	FFFFFFFF	SBC $FFFFFF,X
C0/D827:	FFFFFFFF	SBC $FFFFFF,X
C0/D82B:	FFFFFFFF	SBC $FFFFFF,X
C0/D82F:	FFFFFFFF	SBC $FFFFFF,X
C0/D833:	FFFFFFFF	SBC $FFFFFF,X
C0/D837:	FFFFFFFF	SBC $FFFFFF,X
C0/D83B:	FFFFFFFF	SBC $FFFFFF,X
C0/D83F:	FFFFFFFF	SBC $FFFFFF,X
C0/D843:	FFFFFFFF	SBC $FFFFFF,X
C0/D847:	FFFFFFFF	SBC $FFFFFF,X
C0/D84B:	FFFFFFFF	SBC $FFFFFF,X
C0/D84F:	FFFFFFFF	SBC $FFFFFF,X
C0/D853:	FFFFFFFF	SBC $FFFFFF,X
C0/D857:	FFFFFFFF	SBC $FFFFFF,X
C0/D85B:	FFFFFFFF	SBC $FFFFFF,X
C0/D85F:	FFFFFFFF	SBC $FFFFFF,X
C0/D863:	FFFFFFFF	SBC $FFFFFF,X
C0/D867:	FFFFFFFF	SBC $FFFFFF,X
C0/D86B:	FFFFFFFF	SBC $FFFFFF,X
C0/D86F:	FFFFFFFF	SBC $FFFFFF,X
C0/D873:	FFFFFFFF	SBC $FFFFFF,X
C0/D877:	FFFFFFFF	SBC $FFFFFF,X
C0/D87B:	FFFFFFFF	SBC $FFFFFF,X
C0/D87F:	FFFFFFFF	SBC $FFFFFF,X
C0/D883:	FFFFFFFF	SBC $FFFFFF,X
C0/D887:	FFFFFFFF	SBC $FFFFFF,X
C0/D88B:	FFFFFFFF	SBC $FFFFFF,X
C0/D88F:	FFFFFFFF	SBC $FFFFFF,X
C0/D893:	FFFFFFFF	SBC $FFFFFF,X
C0/D897:	FFFFFFFF	SBC $FFFFFF,X
C0/D89B:	FFFFFFFF	SBC $FFFFFF,X
C0/D89F:	FFFFFFFF	SBC $FFFFFF,X
C0/D8A3:	FFFFFFFF	SBC $FFFFFF,X
C0/D8A7:	FFFFFFFF	SBC $FFFFFF,X
C0/D8AB:	FFFFFFFF	SBC $FFFFFF,X
C0/D8AF:	FFFFFFFF	SBC $FFFFFF,X
C0/D8B3:	FFFFFFFF	SBC $FFFFFF,X
C0/D8B7:	FFFFFFFF	SBC $FFFFFF,X
C0/D8BB:	FFFFFFFF	SBC $FFFFFF,X
C0/D8BF:	FFFFFFFF	SBC $FFFFFF,X
C0/D8C3:	FFFFFFFF	SBC $FFFFFF,X
C0/D8C7:	FFFFFFFF	SBC $FFFFFF,X
C0/D8CB:	FFFFFFFF	SBC $FFFFFF,X
C0/D8CF:	FFFFFFFF	SBC $FFFFFF,X
C0/D8D3:	FFFFFFFF	SBC $FFFFFF,X
C0/D8D7:	FFFFFFFF	SBC $FFFFFF,X
C0/D8DB:	FFFFFFFF	SBC $FFFFFF,X
C0/D8DF:	FFFFFFFF	SBC $FFFFFF,X
C0/D8E3:	FFFFFFFF	SBC $FFFFFF,X
C0/D8E7:	FFFFFFFF	SBC $FFFFFF,X
C0/D8EB:	FFFFFFFF	SBC $FFFFFF,X
C0/D8EF:	FFFFFFFF	SBC $FFFFFF,X
C0/D8F3:	FFFFFFFF	SBC $FFFFFF,X
C0/D8F7:	FFFFFFFF	SBC $FFFFFF,X
C0/D8FB:	FFFFFFFF	SBC $FFFFFF,X
C0/D8FF:	FFFFFFFF	SBC $FFFFFF,X
C0/D903:	FFFFFFFF	SBC $FFFFFF,X
C0/D907:	FFFFFFFF	SBC $FFFFFF,X
C0/D90B:	FFFFFFFF	SBC $FFFFFF,X
C0/D90F:	FFFFFFFF	SBC $FFFFFF,X
C0/D913:	FFFFFFFF	SBC $FFFFFF,X
C0/D917:	FFFFFFFF	SBC $FFFFFF,X
C0/D91B:	FFFFFFFF	SBC $FFFFFF,X
C0/D91F:	FFFFFFFF	SBC $FFFFFF,X
C0/D923:	FFFFFFFF	SBC $FFFFFF,X
C0/D927:	FFFFFFFF	SBC $FFFFFF,X
C0/D92B:	FFFFFFFF	SBC $FFFFFF,X
C0/D92F:	FFFFFFFF	SBC $FFFFFF,X
C0/D933:	FFFFFFFF	SBC $FFFFFF,X
C0/D937:	FFFFFFFF	SBC $FFFFFF,X
C0/D93B:	FFFFFFFF	SBC $FFFFFF,X
C0/D93F:	FFFFFFFF	SBC $FFFFFF,X
C0/D943:	FFFFFFFF	SBC $FFFFFF,X
C0/D947:	FFFFFFFF	SBC $FFFFFF,X
C0/D94B:	FFFFFFFF	SBC $FFFFFF,X
C0/D94F:	FFFFFFFF	SBC $FFFFFF,X
C0/D953:	FFFFFFFF	SBC $FFFFFF,X
C0/D957:	FFFFFFFF	SBC $FFFFFF,X
C0/D95B:	FFFFFFFF	SBC $FFFFFF,X
C0/D95F:	FFFFFFFF	SBC $FFFFFF,X
C0/D963:	FFFFFFFF	SBC $FFFFFF,X
C0/D967:	FFFFFFFF	SBC $FFFFFF,X
C0/D96B:	FFFFFFFF	SBC $FFFFFF,X
C0/D96F:	FFFFFFFF	SBC $FFFFFF,X
C0/D973:	FFFFFFFF	SBC $FFFFFF,X
C0/D977:	FFFFFFFF	SBC $FFFFFF,X
C0/D97B:	FFFFFFFF	SBC $FFFFFF,X
C0/D97F:	FFFFFFFF	SBC $FFFFFF,X
C0/D983:	FFFFFFFF	SBC $FFFFFF,X
C0/D987:	FFFFFFFF	SBC $FFFFFF,X
C0/D98B:	FFFFFFFF	SBC $FFFFFF,X
C0/D98F:	FFFFFFFF	SBC $FFFFFF,X
C0/D993:	FFFFFFFF	SBC $FFFFFF,X
C0/D997:	FFFFFFFF	SBC $FFFFFF,X
C0/D99B:	FFFFFFFF	SBC $FFFFFF,X
C0/D99F:	FFFFFFFF	SBC $FFFFFF,X
C0/D9A3:	FFFFFFFF	SBC $FFFFFF,X
C0/D9A7:	FFFFFFFF	SBC $FFFFFF,X
C0/D9AB:	FFFFFFFF	SBC $FFFFFF,X
C0/D9AF:	FFFFFFFF	SBC $FFFFFF,X
C0/D9B3:	FFFFFFFF	SBC $FFFFFF,X
C0/D9B7:	FFFFFFFF	SBC $FFFFFF,X
C0/D9BB:	FFFFFFFF	SBC $FFFFFF,X
C0/D9BF:	FFFFFFFF	SBC $FFFFFF,X
C0/D9C3:	FFFFFFFF	SBC $FFFFFF,X
C0/D9C7:	FFFFFFFF	SBC $FFFFFF,X
C0/D9CB:	FFFFFFFF	SBC $FFFFFF,X
C0/D9CF:	FFFFFFFF	SBC $FFFFFF,X
C0/D9D3:	FFFFFFFF	SBC $FFFFFF,X
C0/D9D7:	FFFFFFFF	SBC $FFFFFF,X
C0/D9DB:	FFFFFFFF	SBC $FFFFFF,X
C0/D9DF:	FFFFFFFF	SBC $FFFFFF,X
C0/D9E3:	FFFFFFFF	SBC $FFFFFF,X
C0/D9E7:	FFFFFFFF	SBC $FFFFFF,X
C0/D9EB:	FFFFFFFF	SBC $FFFFFF,X
C0/D9EF:	FFFFFFFF	SBC $FFFFFF,X
C0/D9F3:	FFFFFFFF	SBC $FFFFFF,X
C0/D9F7:	FFFFFFFF	SBC $FFFFFF,X
C0/D9FB:	FFFFFFFF	SBC $FFFFFF,X
C0/D9FF:	FFFFFFFF	SBC $FFFFFF,X
C0/DA03:	FFFFFFFF	SBC $FFFFFF,X
C0/DA07:	FFFFFFFF	SBC $FFFFFF,X
C0/DA0B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA0F:	FFFFFFFF	SBC $FFFFFF,X
C0/DA13:	FFFFFFFF	SBC $FFFFFF,X
C0/DA17:	FFFFFFFF	SBC $FFFFFF,X
C0/DA1B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA1F:	FFFFFFFF	SBC $FFFFFF,X
C0/DA23:	FFFFFFFF	SBC $FFFFFF,X
C0/DA27:	FFFFFFFF	SBC $FFFFFF,X
C0/DA2B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA2F:	FFFFFFFF	SBC $FFFFFF,X
C0/DA33:	FFFFFFFF	SBC $FFFFFF,X
C0/DA37:	FFFFFFFF	SBC $FFFFFF,X
C0/DA3B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA3F:	FFFFFFFF	SBC $FFFFFF,X
C0/DA43:	FFFFFFFF	SBC $FFFFFF,X
C0/DA47:	FFFFFFFF	SBC $FFFFFF,X
C0/DA4B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA4F:	FFFFFFFF	SBC $FFFFFF,X
C0/DA53:	FFFFFFFF	SBC $FFFFFF,X
C0/DA57:	FFFFFFFF	SBC $FFFFFF,X
C0/DA5B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA5F:	FFFFFFFF	SBC $FFFFFF,X
C0/DA63:	FFFFFFFF	SBC $FFFFFF,X
C0/DA67:	FFFFFFFF	SBC $FFFFFF,X
C0/DA6B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA6F:	FFFFFFFF	SBC $FFFFFF,X
C0/DA73:	FFFFFFFF	SBC $FFFFFF,X
C0/DA77:	FFFFFFFF	SBC $FFFFFF,X
C0/DA7B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA7F:	FFFFFFFF	SBC $FFFFFF,X
C0/DA83:	FFFFFFFF	SBC $FFFFFF,X
C0/DA87:	FFFFFFFF	SBC $FFFFFF,X
C0/DA8B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA8F:	FFFFFFFF	SBC $FFFFFF,X
C0/DA93:	FFFFFFFF	SBC $FFFFFF,X
C0/DA97:	FFFFFFFF	SBC $FFFFFF,X
C0/DA9B:	FFFFFFFF	SBC $FFFFFF,X
C0/DA9F:	FFFFFFFF	SBC $FFFFFF,X
C0/DAA3:	FFFFFFFF	SBC $FFFFFF,X
C0/DAA7:	FFFFFFFF	SBC $FFFFFF,X
C0/DAAB:	FFFFFFFF	SBC $FFFFFF,X
C0/DAAF:	FFFFFFFF	SBC $FFFFFF,X
C0/DAB3:	FFFFFFFF	SBC $FFFFFF,X
C0/DAB7:	FFFFFFFF	SBC $FFFFFF,X
C0/DABB:	FFFFFFFF	SBC $FFFFFF,X
C0/DABF:	FFFFFFFF	SBC $FFFFFF,X
C0/DAC3:	FFFFFFFF	SBC $FFFFFF,X
C0/DAC7:	FFFFFFFF	SBC $FFFFFF,X
C0/DACB:	FFFFFFFF	SBC $FFFFFF,X
C0/DACF:	FFFFFFFF	SBC $FFFFFF,X
C0/DAD3:	FFFFFFFF	SBC $FFFFFF,X
C0/DAD7:	FFFFFFFF	SBC $FFFFFF,X
C0/DADB:	FFFFFFFF	SBC $FFFFFF,X
C0/DADF:	FFFFFFFF	SBC $FFFFFF,X
C0/DAE3:	FFFFFFFF	SBC $FFFFFF,X
C0/DAE7:	FFFFFFFF	SBC $FFFFFF,X
C0/DAEB:	FFFFFFFF	SBC $FFFFFF,X
C0/DAEF:	FFFFFFFF	SBC $FFFFFF,X
C0/DAF3:	FFFFFFFF	SBC $FFFFFF,X
C0/DAF7:	FFFFFFFF	SBC $FFFFFF,X
C0/DAFB:	FFFFFFFF	SBC $FFFFFF,X
C0/DAFF:	FFFFFFFF	SBC $FFFFFF,X
C0/DB03:	FFFFFFFF	SBC $FFFFFF,X
C0/DB07:	FFFFFFFF	SBC $FFFFFF,X
C0/DB0B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB0F:	FFFFFFFF	SBC $FFFFFF,X
C0/DB13:	FFFFFFFF	SBC $FFFFFF,X
C0/DB17:	FFFFFFFF	SBC $FFFFFF,X
C0/DB1B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB1F:	FFFFFFFF	SBC $FFFFFF,X
C0/DB23:	FFFFFFFF	SBC $FFFFFF,X
C0/DB27:	FFFFFFFF	SBC $FFFFFF,X
C0/DB2B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB2F:	FFFFFFFF	SBC $FFFFFF,X
C0/DB33:	FFFFFFFF	SBC $FFFFFF,X
C0/DB37:	FFFFFFFF	SBC $FFFFFF,X
C0/DB3B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB3F:	FFFFFFFF	SBC $FFFFFF,X
C0/DB43:	FFFFFFFF	SBC $FFFFFF,X
C0/DB47:	FFFFFFFF	SBC $FFFFFF,X
C0/DB4B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB4F:	FFFFFFFF	SBC $FFFFFF,X
C0/DB53:	FFFFFFFF	SBC $FFFFFF,X
C0/DB57:	FFFFFFFF	SBC $FFFFFF,X
C0/DB5B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB5F:	FFFFFFFF	SBC $FFFFFF,X
C0/DB63:	FFFFFFFF	SBC $FFFFFF,X
C0/DB67:	FFFFFFFF	SBC $FFFFFF,X
C0/DB6B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB6F:	FFFFFFFF	SBC $FFFFFF,X
C0/DB73:	FFFFFFFF	SBC $FFFFFF,X
C0/DB77:	FFFFFFFF	SBC $FFFFFF,X
C0/DB7B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB7F:	FFFFFFFF	SBC $FFFFFF,X
C0/DB83:	FFFFFFFF	SBC $FFFFFF,X
C0/DB87:	FFFFFFFF	SBC $FFFFFF,X
C0/DB8B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB8F:	FFFFFFFF	SBC $FFFFFF,X
C0/DB93:	FFFFFFFF	SBC $FFFFFF,X
C0/DB97:	FFFFFFFF	SBC $FFFFFF,X
C0/DB9B:	FFFFFFFF	SBC $FFFFFF,X
C0/DB9F:	FFFFFFFF	SBC $FFFFFF,X
C0/DBA3:	FFFFFFFF	SBC $FFFFFF,X
C0/DBA7:	FFFFFFFF	SBC $FFFFFF,X
C0/DBAB:	FFFFFFFF	SBC $FFFFFF,X
C0/DBAF:	FFFFFFFF	SBC $FFFFFF,X
C0/DBB3:	FFFFFFFF	SBC $FFFFFF,X
C0/DBB7:	FFFFFFFF	SBC $FFFFFF,X
C0/DBBB:	FFFFFFFF	SBC $FFFFFF,X
C0/DBBF:	FFFFFFFF	SBC $FFFFFF,X
C0/DBC3:	FFFFFFFF	SBC $FFFFFF,X
C0/DBC7:	FFFFFFFF	SBC $FFFFFF,X
C0/DBCB:	FFFFFFFF	SBC $FFFFFF,X
C0/DBCF:	FFFFFFFF	SBC $FFFFFF,X
C0/DBD3:	FFFFFFFF	SBC $FFFFFF,X
C0/DBD7:	FFFFFFFF	SBC $FFFFFF,X
C0/DBDB:	FFFFFFFF	SBC $FFFFFF,X
C0/DBDF:	FFFFFFFF	SBC $FFFFFF,X
C0/DBE3:	FFFFFFFF	SBC $FFFFFF,X
C0/DBE7:	FFFFFFFF	SBC $FFFFFF,X
C0/DBEB:	FFFFFFFF	SBC $FFFFFF,X
C0/DBEF:	FFFFFFFF	SBC $FFFFFF,X
C0/DBF3:	FFFFFFFF	SBC $FFFFFF,X
C0/DBF7:	FFFFFFFF	SBC $FFFFFF,X
C0/DBFB:	FFFFFFFF	SBC $FFFFFF,X
C0/DBFF:	FFFFFFFF	SBC $FFFFFF,X
C0/DC03:	FFFFFFFF	SBC $FFFFFF,X
C0/DC07:	FFFFFFFF	SBC $FFFFFF,X
C0/DC0B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC0F:	FFFFFFFF	SBC $FFFFFF,X
C0/DC13:	FFFFFFFF	SBC $FFFFFF,X
C0/DC17:	FFFFFFFF	SBC $FFFFFF,X
C0/DC1B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC1F:	FFFFFFFF	SBC $FFFFFF,X
C0/DC23:	FFFFFFFF	SBC $FFFFFF,X
C0/DC27:	FFFFFFFF	SBC $FFFFFF,X
C0/DC2B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC2F:	FFFFFFFF	SBC $FFFFFF,X
C0/DC33:	FFFFFFFF	SBC $FFFFFF,X
C0/DC37:	FFFFFFFF	SBC $FFFFFF,X
C0/DC3B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC3F:	FFFFFFFF	SBC $FFFFFF,X
C0/DC43:	FFFFFFFF	SBC $FFFFFF,X
C0/DC47:	FFFFFFFF	SBC $FFFFFF,X
C0/DC4B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC4F:	FFFFFFFF	SBC $FFFFFF,X
C0/DC53:	FFFFFFFF	SBC $FFFFFF,X
C0/DC57:	FFFFFFFF	SBC $FFFFFF,X
C0/DC5B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC5F:	FFFFFFFF	SBC $FFFFFF,X
C0/DC63:	FFFFFFFF	SBC $FFFFFF,X
C0/DC67:	FFFFFFFF	SBC $FFFFFF,X
C0/DC6B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC6F:	FFFFFFFF	SBC $FFFFFF,X
C0/DC73:	FFFFFFFF	SBC $FFFFFF,X
C0/DC77:	FFFFFFFF	SBC $FFFFFF,X
C0/DC7B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC7F:	FFFFFFFF	SBC $FFFFFF,X
C0/DC83:	FFFFFFFF	SBC $FFFFFF,X
C0/DC87:	FFFFFFFF	SBC $FFFFFF,X
C0/DC8B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC8F:	FFFFFFFF	SBC $FFFFFF,X
C0/DC93:	FFFFFFFF	SBC $FFFFFF,X
C0/DC97:	FFFFFFFF	SBC $FFFFFF,X
C0/DC9B:	FFFFFFFF	SBC $FFFFFF,X
C0/DC9F:	FFFFFFFF	SBC $FFFFFF,X
C0/DCA3:	FFFFFFFF	SBC $FFFFFF,X
C0/DCA7:	FFFFFFFF	SBC $FFFFFF,X
C0/DCAB:	FFFFFFFF	SBC $FFFFFF,X
C0/DCAF:	FFFFFFFF	SBC $FFFFFF,X
C0/DCB3:	FFFFFFFF	SBC $FFFFFF,X
C0/DCB7:	FFFFFFFF	SBC $FFFFFF,X
C0/DCBB:	FFFFFFFF	SBC $FFFFFF,X
C0/DCBF:	FFFFFFFF	SBC $FFFFFF,X
C0/DCC3:	FFFFFFFF	SBC $FFFFFF,X
C0/DCC7:	FFFFFFFF	SBC $FFFFFF,X
C0/DCCB:	FFFFFFFF	SBC $FFFFFF,X
C0/DCCF:	FFFFFFFF	SBC $FFFFFF,X
C0/DCD3:	FFFFFFFF	SBC $FFFFFF,X
C0/DCD7:	FFFFFFFF	SBC $FFFFFF,X
C0/DCDB:	FFFFFFFF	SBC $FFFFFF,X
C0/DCDF:	FFFFFFFF	SBC $FFFFFF,X
C0/DCE3:	FFFFFFFF	SBC $FFFFFF,X
C0/DCE7:	FFFFFFFF	SBC $FFFFFF,X
C0/DCEB:	FFFFFFFF	SBC $FFFFFF,X
C0/DCEF:	FFFFFFFF	SBC $FFFFFF,X
C0/DCF3:	FFFFFFFF	SBC $FFFFFF,X
C0/DCF7:	FFFFFFFF	SBC $FFFFFF,X
C0/DCFB:	FFFFFFFF	SBC $FFFFFF,X
C0/DCFF:	FFFFFFFF	SBC $FFFFFF,X
C0/DD03:	FFFFFFFF	SBC $FFFFFF,X
C0/DD07:	FFFFFFFF	SBC $FFFFFF,X
C0/DD0B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD0F:	FFFFFFFF	SBC $FFFFFF,X
C0/DD13:	FFFFFFFF	SBC $FFFFFF,X
C0/DD17:	FFFFFFFF	SBC $FFFFFF,X
C0/DD1B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD1F:	FFFFFFFF	SBC $FFFFFF,X
C0/DD23:	FFFFFFFF	SBC $FFFFFF,X
C0/DD27:	FFFFFFFF	SBC $FFFFFF,X
C0/DD2B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD2F:	FFFFFFFF	SBC $FFFFFF,X
C0/DD33:	FFFFFFFF	SBC $FFFFFF,X
C0/DD37:	FFFFFFFF	SBC $FFFFFF,X
C0/DD3B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD3F:	FFFFFFFF	SBC $FFFFFF,X
C0/DD43:	FFFFFFFF	SBC $FFFFFF,X
C0/DD47:	FFFFFFFF	SBC $FFFFFF,X
C0/DD4B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD4F:	FFFFFFFF	SBC $FFFFFF,X
C0/DD53:	FFFFFFFF	SBC $FFFFFF,X
C0/DD57:	FFFFFFFF	SBC $FFFFFF,X
C0/DD5B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD5F:	FFFFFFFF	SBC $FFFFFF,X
C0/DD63:	FFFFFFFF	SBC $FFFFFF,X
C0/DD67:	FFFFFFFF	SBC $FFFFFF,X
C0/DD6B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD6F:	FFFFFFFF	SBC $FFFFFF,X
C0/DD73:	FFFFFFFF	SBC $FFFFFF,X
C0/DD77:	FFFFFFFF	SBC $FFFFFF,X
C0/DD7B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD7F:	FFFFFFFF	SBC $FFFFFF,X
C0/DD83:	FFFFFFFF	SBC $FFFFFF,X
C0/DD87:	FFFFFFFF	SBC $FFFFFF,X
C0/DD8B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD8F:	FFFFFFFF	SBC $FFFFFF,X
C0/DD93:	FFFFFFFF	SBC $FFFFFF,X
C0/DD97:	FFFFFFFF	SBC $FFFFFF,X
C0/DD9B:	FFFFFFFF	SBC $FFFFFF,X
C0/DD9F:	FFFFFFFF	SBC $FFFFFF,X
C0/DDA3:	FFFFFFFF	SBC $FFFFFF,X
C0/DDA7:	FFFFFFFF	SBC $FFFFFF,X
C0/DDAB:	FFFFFFFF	SBC $FFFFFF,X
C0/DDAF:	FFFFFFFF	SBC $FFFFFF,X
C0/DDB3:	FFFFFFFF	SBC $FFFFFF,X
C0/DDB7:	FFFFFFFF	SBC $FFFFFF,X
C0/DDBB:	FFFFFFFF	SBC $FFFFFF,X
C0/DDBF:	FFFFFFFF	SBC $FFFFFF,X
C0/DDC3:	FFFFFFFF	SBC $FFFFFF,X
C0/DDC7:	FFFFFFFF	SBC $FFFFFF,X
C0/DDCB:	FFFFFFFF	SBC $FFFFFF,X
C0/DDCF:	FFFFFFFF	SBC $FFFFFF,X
C0/DDD3:	FFFFFFFF	SBC $FFFFFF,X
C0/DDD7:	FFFFFFFF	SBC $FFFFFF,X
C0/DDDB:	FFFFFFFF	SBC $FFFFFF,X
C0/DDDF:	FFFFFFFF	SBC $FFFFFF,X
C0/DDE3:	FFFFFFFF	SBC $FFFFFF,X
C0/DDE7:	FFFFFFFF	SBC $FFFFFF,X
C0/DDEB:	FFFFFFFF	SBC $FFFFFF,X
C0/DDEF:	FFFFFFFF	SBC $FFFFFF,X
C0/DDF3:	FFFFFFFF	SBC $FFFFFF,X
C0/DDF7:	FFFFFFFF	SBC $FFFFFF,X
C0/DDFB:	FFFFFFFF	SBC $FFFFFF,X
C0/DDFF:	FFFFFFFF	SBC $FFFFFF,X
C0/DE03:	FFFFFFFF	SBC $FFFFFF,X
C0/DE07:	FFFFFFFF	SBC $FFFFFF,X
C0/DE0B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE0F:	FFFFFFFF	SBC $FFFFFF,X
C0/DE13:	FFFFFFFF	SBC $FFFFFF,X
C0/DE17:	FFFFFFFF	SBC $FFFFFF,X
C0/DE1B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE1F:	FFFFFFFF	SBC $FFFFFF,X
C0/DE23:	FFFFFFFF	SBC $FFFFFF,X
C0/DE27:	FFFFFFFF	SBC $FFFFFF,X
C0/DE2B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE2F:	FFFFFFFF	SBC $FFFFFF,X
C0/DE33:	FFFFFFFF	SBC $FFFFFF,X
C0/DE37:	FFFFFFFF	SBC $FFFFFF,X
C0/DE3B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE3F:	FFFFFFFF	SBC $FFFFFF,X
C0/DE43:	FFFFFFFF	SBC $FFFFFF,X
C0/DE47:	FFFFFFFF	SBC $FFFFFF,X
C0/DE4B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE4F:	FFFFFFFF	SBC $FFFFFF,X
C0/DE53:	FFFFFFFF	SBC $FFFFFF,X
C0/DE57:	FFFFFFFF	SBC $FFFFFF,X
C0/DE5B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE5F:	FFFFFFFF	SBC $FFFFFF,X
C0/DE63:	FFFFFFFF	SBC $FFFFFF,X
C0/DE67:	FFFFFFFF	SBC $FFFFFF,X
C0/DE6B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE6F:	FFFFFFFF	SBC $FFFFFF,X
C0/DE73:	FFFFFFFF	SBC $FFFFFF,X
C0/DE77:	FFFFFFFF	SBC $FFFFFF,X
C0/DE7B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE7F:	FFFFFFFF	SBC $FFFFFF,X
C0/DE83:	FFFFFFFF	SBC $FFFFFF,X
C0/DE87:	FFFFFFFF	SBC $FFFFFF,X
C0/DE8B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE8F:	FFFFFFFF	SBC $FFFFFF,X
C0/DE93:	FFFFFFFF	SBC $FFFFFF,X
C0/DE97:	FFFFFFFF	SBC $FFFFFF,X
C0/DE9B:	FFFFFFFF	SBC $FFFFFF,X
C0/DE9F:	FFFFFFFF	SBC $FFFFFF,X
C0/DEA3:	FFFFFFFF	SBC $FFFFFF,X
C0/DEA7:	FFFFFFFF	SBC $FFFFFF,X
C0/DEAB:	FFFFFFFF	SBC $FFFFFF,X
C0/DEAF:	FFFFFFFF	SBC $FFFFFF,X
C0/DEB3:	FFFFFFFF	SBC $FFFFFF,X
C0/DEB7:	FFFFFFFF	SBC $FFFFFF,X
C0/DEBB:	FFFFFFFF	SBC $FFFFFF,X
C0/DEBF:	FFFFFFFF	SBC $FFFFFF,X
C0/DEC3:	FFFFFFFF	SBC $FFFFFF,X
C0/DEC7:	FFFFFFFF	SBC $FFFFFF,X
C0/DECB:	FFFFFFFF	SBC $FFFFFF,X
C0/DECF:	FFFFFFFF	SBC $FFFFFF,X
C0/DED3:	FFFFFFFF	SBC $FFFFFF,X
C0/DED7:	FFFFFFFF	SBC $FFFFFF,X
C0/DEDB:	FFFFFFFF	SBC $FFFFFF,X
C0/DEDF:	FFFFFFFF	SBC $FFFFFF,X
C0/DEE3:	FFFFFFFF	SBC $FFFFFF,X
C0/DEE7:	FFFFFFFF	SBC $FFFFFF,X
C0/DEEB:	FFFFFFFF	SBC $FFFFFF,X
C0/DEEF:	FFFFFFFF	SBC $FFFFFF,X
C0/DEF3:	FFFFFFFF	SBC $FFFFFF,X
C0/DEF7:	FFFFFFFF	SBC $FFFFFF,X
C0/DEFB:	FFFFFFFF	SBC $FFFFFF,X
C0/DEFF:	FFFFFFFF	SBC $FFFFFF,X
C0/DF03:	FFFFFFFF	SBC $FFFFFF,X
C0/DF07:	FFFFFFFF	SBC $FFFFFF,X
C0/DF0B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF0F:	FFFFFFFF	SBC $FFFFFF,X
C0/DF13:	FFFFFFFF	SBC $FFFFFF,X
C0/DF17:	FFFFFFFF	SBC $FFFFFF,X
C0/DF1B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF1F:	FFFFFFFF	SBC $FFFFFF,X
C0/DF23:	FFFFFFFF	SBC $FFFFFF,X
C0/DF27:	FFFFFFFF	SBC $FFFFFF,X
C0/DF2B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF2F:	FFFFFFFF	SBC $FFFFFF,X
C0/DF33:	FFFFFFFF	SBC $FFFFFF,X
C0/DF37:	FFFFFFFF	SBC $FFFFFF,X
C0/DF3B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF3F:	FFFFFFFF	SBC $FFFFFF,X
C0/DF43:	FFFFFFFF	SBC $FFFFFF,X
C0/DF47:	FFFFFFFF	SBC $FFFFFF,X
C0/DF4B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF4F:	FFFFFFFF	SBC $FFFFFF,X
C0/DF53:	FFFFFFFF	SBC $FFFFFF,X
C0/DF57:	FFFFFFFF	SBC $FFFFFF,X
C0/DF5B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF5F:	FFFFFFFF	SBC $FFFFFF,X
C0/DF63:	FFFFFFFF	SBC $FFFFFF,X
C0/DF67:	FFFFFFFF	SBC $FFFFFF,X
C0/DF6B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF6F:	FFFFFFFF	SBC $FFFFFF,X
C0/DF73:	FFFFFFFF	SBC $FFFFFF,X
C0/DF77:	FFFFFFFF	SBC $FFFFFF,X
C0/DF7B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF7F:	FFFFFFFF	SBC $FFFFFF,X
C0/DF83:	FFFFFFFF	SBC $FFFFFF,X
C0/DF87:	FFFFFFFF	SBC $FFFFFF,X
C0/DF8B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF8F:	FFFFFFFF	SBC $FFFFFF,X
C0/DF93:	FFFFFFFF	SBC $FFFFFF,X
C0/DF97:	FFFFFFFF	SBC $FFFFFF,X
C0/DF9B:	FFFFFFFF	SBC $FFFFFF,X
C0/DF9F:	FF


DTE Table (2 bytes each)

C0/DFA0:	3E7F	
C0/DFA2:	7F4D
C0/DFA4:	617F  	
C0/DFA6:	4D41  	
C0/DFA8:	4D7F
C0/DFAA:	413E	
C0/DFAC:	4C7F	
C0/DFAE:	3E4B
C0/DFB0:	7F3A      
C0/DFB2:	4B3E    
C0/DFB4:	4247  
C0/DFB6:	484E     
C0/DFB8:	3D7F  	
C0/DFBA:	7F50
C0/DFBC:	7F4C	
C0/DFBE:	3A47      
C0/DFC0:	487F    	
C0/DFC2:	7F41	
C0/DFC4:	7F48      	
C0/DFC6:	4B7F      	
C0/DFC8:	477F
C0/DFCA:	3A4D
C0/DFCC:	4D48  	
C0/DFCE:	7F42
C0/DFD0:	667F	
C0/DFD2:	4F3E
C0/DFD4:	4740	
C0/DFD6:	413A 
C0/DFD8:	7F463341	ADC $413346,X
C0/DFDC:	4C4D48  	JMP $484D
C0/DFDF:	4752    	EOR [$52]
C0/DFE1:	48      	PHA
C0/DFE2:	7F3B463E	ADC $3E463B,X
C0/DFE6:	527F    	EOR ($7F)
C0/DFE8:	3E4742  	ROL $4247,X
C0/DFEB:	4D3A4B  	EOR $4B3A
C0/DFEE:	4545    	EOR $45
C0/DFF0:	3E3A28  	ROL $283A,X
C0/DFF3:	7F3E3D7F	ADC $7F3D3E,X
C0/DFF7:	3F7F5241	AND $41527F,X
C0/DFFB:	4242    	WDM #$42
C0/DFFD:	4C3E4C  	JMP $4C3E
C0/E000:	48      	PHA
C0/E001:	4B      	PHK 
C0/E002:	457F    	EOR $7F
C0/E004:	7F3C473E	ADC $3E473C,X
C0/E008:	634C    	ADC $4C,S
C0/E00A:	473D    	EOR [$3D]
C0/E00C:	453E    	EOR $3E
C0/E00E:	4C3E7F  	JMP $7F3E
C0/E011:	28      	PLP 
C0/E012:	3A      	DEC A
C0/E013:	7F4D3E7F	ADC $7F3E4D,X
C0/E017:	4549    	EOR $49
C0/E019:	3E3A4C  	ROL $4C3A,X
C0/E01C:	4E4B4E  	LSR $4E4B
C0/E01F:	7F3A457F	ADC $7F453A,X
C0/E023:	4940    	EOR #$40
C0/E025:	7F48467F	ADC $7F4648,X
C0/E029:	3D3F7F  	AND $7F3F,X
C0/E02C:	7F404850	ADC $504840,X
C0/E030:	4B      	PHK 
C0/E031:	4C3B3E  	JMP $3E3B
C0/E034:	4B      	PHK 
C0/E035:	48      	PHA
C0/E036:	4E4C4B  	LSR $4B4C
C0/E039:	4250    	WDM #$50
C0/E03B:	3A      	DEC A
C0/E03C:	503E    	BVC $E07C
C0/E03E:	3641    	ROL $41,X
C0/E040:	3E4D7F  	ROL $7F4D,X
C0/E043:	4B      	PHK 
C0/E044:	474D    	EOR [$4D]
C0/E046:	467F    	LSR $7F
C0/E048:	463A    	LSR $3A
C0/E04A:	28      	PLP 
C0/E04B:	6345    	ADC $45,S
C0/E04D:	4241    	WDM #$41
C0/E04F:	48      	PHA
C0/E050:	48      	PHA
C0/E051:	3F384841	AND $414838,X
C0/E055:	7F7F473E	ADC $3E477F,X
C0/E059:	3E3D3E  	ROL $3E3D,X
C0/E05C:	4C4840  	JMP $4048
C0/E05F:	413C    	EOR ($3C,X)
C0/E061:	3A      	DEC A
C0/E062:	4B      	PHK 
C0/E063:	3A      	DEC A
C0/E064:	4763    	EOR [$63]
C0/E066:	4D3A4E  	EOR $4E3A
C0/E069:	4D3E45  	EOR $453E
C0/E06C:	5E7F3F  	LSR $3F7F,X
C0/E06F:	48      	PHA
C0/E070:	4D4236  	EOR $3642
C0/E073:	3E4548  	ROL $4845,X
C0/E076:	3E5E45  	ROL $455E,X
C0/E079:	3D4748  	AND $4847,X
C0/E07C:	3A      	DEC A
C0/E07D:	3C3C3E  	BIT $3E3C,X
C0/E080:	447F7F  	MVP $7F,$7F
C0/E083:	4E4848  	LSR $4848
C0/E086:	443E3A  	MVP $3E,$3A
C0/E089:	5250    	EOR ($50)
C0/E08B:	7F5E5E	ADC $3A5E5E,X
C0/E08E:	3A40      
C0/E090:	4245    	
C0/E092:	4552    	
C0/E094:	3C48  	
C0/E096:	657F
C0/E098:	3C41	
C0/E09A:	4048      
C0/E09C:	403E      
C0/E09E:	3E67  	
DTE Table End

; Data: presence bits for NPCs
C0/E0A0:	BB  ; $1EE0 7-543-10
C0/E0A1:	AB  ; $1EE1 7-5-3-10
C0/E0A2:	35  ; $1EE2 --54-2-0
C0/E0A3:	00  ; $1EE3 --------
C0/E0A4:	00  ; $1EE4 --------
C0/E0A5:	7E  ; $1EE5 -654321-
C0/E0A6:	84  ; $1EE6 7----2--
C0/E0A7:	18  ; $1EE7 ---43---
C0/E0A8:	4E  ; $1EE8 -6--321-
C0/E0A9:	FF  ; $1EE9 76543210
C0/E0AA:	E1  ; $1EEA 765----0
C0/E0AB:	C3  ; $1EEB 76----10
              ;  0: Sprint shoes guy in S.Figaro Relic Shop
C0/E0AC:	82  ; $1EEC 7-----1-
C0/E0AD:	21  ; $1EED --5----0
C0/E0AE:	0A  ; $1EEE ----3-1-
C0/E0AF:	1A  ; $1EEF ---43-1-
C0/E0B0:	03  ; $1EF0 ------10
C0/E0B1:	00
C0/E0B2:	00
C0/E0B3:	00
C0/E0B4:	00
C0/E0B5:	00
C0/E0B6:	00
C0/E0B7:	00
C0/E0B8:	00
C0/E0B9:	00
C0/E0BA:	00
C0/E0BB:	FF
C0/E0BC:	FF
C0/E0BD:	FF
C0/E0BE:	FF
C0/E0BF:	20
C0/E0C0:	8F
C0/E0C1:	17
C0/E0C2:	38  ; $1F02 --543---
              ;  4: Some NPC(s) in returner hideout before Terra wakes up [?]
C0/E0C3:	60  ; $1F03 -65-----
              ;  5: Some NPC(s) in returner hideout before Terra wakes up [?]
C0/E0C4:	E4
C0/E0C5:	0E
C0/E0C6:	D0
C0/E0C7:	7C
C0/E0C8:	FE
C0/E0C9:	FF
C0/E0CA:	57
C0/E0CB:	EC
C0/E0CC:	FF
C0/E0CD:	3F
C0/E0CE:	00
C0/E0CF:	00
C0/E0D0:	00
C0/E0D1:	00
C0/E0D2:	08
C0/E0D3:	00
C0/E0D4:	00
C0/E0D5:	E0
C0/E0D6:	01
C0/E0D7:	00
C0/E0D8:	00
C0/E0D9:	00
C0/E0DA:	00
C0/E0DB:	00
C0/E0DC:	00
C0/E0DD:	80
C0/E0DE:	44
C0/E0DF:	07
C0/E0E0:	03
C0/E0E1:	20
C0/E0E2:	D2
C0/E0E3:	19
C0/E0E4:	01
C0/E0E5:	00
C0/E0E6:	00
C0/E0E7:	C0
C0/E0E8:	06
C0/E0E9:	1C
C0/E0EA:	30
C0/E0EB:	61
C0/E0EC:	00
C0/E0ED:	00
C0/E0EE:	00
C0/E0EF:	00
C0/E0F0:	00
C0/E0F1:	00
C0/E0F2:	00
C0/E0F3:	00
C0/E0F4:	00
C0/E0F5:	00
C0/E0F6:	00
C0/E0F7:	00
C0/E0F8:	00
C0/E0F9:	00
C0/E0FA:	00
C0/E0FB:	00
C0/E0FC:	00
C0/E0FD:	00
C0/E0FE:	00
C0/E0FF:	00
C0/E100:	61
C0/E101:	00
C0/E102:	08
C0/E103:	08
C0/E104:	00
C0/E105:	68
C0/E106:	0D
C0/E107:	38
C0/E108:	5C
C0/E109:	86
C0/E10A:	5E
C0/E10B:	D3
C0/E10C:	2E
C0/E10D:	91
C0/E10E:	2E
C0/E10F:	07
C0/E110:	12
C0/E111:	7B
C0/E112:	FD
C0/E113:	00
C0/E114:	FF
C0/E115:	80
C0/E116:	FB
C0/E117:	38
C0/E118:	FF
C0/E119:	00
C0/E11A:	00
C0/E11B:	00
C0/E11C:	00
C0/E11D:	00
C0/E11E:	00
C0/E11F:	00

C0/E120:	7C7EC6  	JMP ($C67E,X)
C0/E123:	FFC6E7C6	SBC $C6E7C6,X
C0/E127:	E7C6    	SBC [$C6]
C0/E129:	E7C6    	SBC [$C6]
C0/E12B:	E77C    	SBC [$7C]
C0/E12D:	FE007C  	INC $7C00,X
C0/E130:	3038    	BMI $E16A
C0/E132:	7078    	BVS $E1AC
C0/E134:	3078    	BMI $E1AE
C0/E136:	3038    	BMI $E170
C0/E138:	3038    	BMI $E172
C0/E13A:	3038    	BMI $E174
C0/E13C:	78      	SEI 
C0/E13D:	7C007C  	JMP ($7C00,X)
C0/E140:	7C7EC6  	JMP ($C67E,X)
C0/E143:	FFC6E70C	SBC $0CE7C6,X
C0/E147:	EE303C  	INC $3C30
C0/E14A:	60      	RTS
 
C0/E14B:	70FE    	BVS $E14B
C0/E14D:	FF00FF7C	SBC $7CFF00,X
C0/E151:	7EC6FF  	ROR $FFC6,X
C0/E154:	06C7    	ASL $C7
C0/E156:	3C3E06  	BIT $063E,X
C0/E159:	3FC6C77C	AND $7CC7C6,X
C0/E15D:	FE007C  	INC $7C00,X
C0/E160:	1C1E3C  	TRB $3C1E
C0/E163:	3E6C7E  	ROL $7E6C,X
C0/E166:	4C6ECC  	JMP $CC6E
C0/E169:	EEFEFF  	INC $FFFE
C0/E16C:	0CFF00  	TSB $00FF
C0/E16F:	0CFEFF  	TSB $FFFE
C0/E172:	C0FEFC  	CPY #$FCFE
C0/E175:	FEC6FF  	INC $FFC6,X
C0/E178:	06C7    	ASL $C7
C0/E17A:	C6E7    	DEC $E7
C0/E17C:	7C7E00  	JMP ($007E,X)
C0/E17F:	7C7C7E  	JMP ($7E7C,X)
C0/E182:	C6FF    	DEC $FF
C0/E184:	C0E0FC  	CPY #$FCE0
C0/E187:	FEC6FF  	INC $FFC6,X
C0/E18A:	C6E7    	DEC $E7
C0/E18C:	7C7E00  	JMP ($007E,X)
C0/E18F:	7CFEFF  	JMP ($FFFE,X)
C0/E192:	C6FF    	DEC $FF
C0/E194:	0CEE18  	TSB $18EE
C0/E197:	1C181C  	TRB $1C18
C0/E19A:	3038    	BMI $E1D4
C0/E19C:	3038    	BMI $E1D6
C0/E19E:	0038    	BRK #$38

C0/E1A0:	7C7EC6  	JMP ($C67E,X)
C0/E1A3:	FFC6E77C	SBC $7CE7C6,X
C0/E1A7:	7EC6FF  	ROR $FFC6,X
C0/E1AA:	C6E7    	DEC $E7
C0/E1AC:	7CFE00  	JMP ($00FE,X)
C0/E1AF:	7C7C7E  	JMP ($7E7C,X)
C0/E1B2:	C6FF    	DEC $FF
C0/E1B4:	C6E7    	DEC $E7
C0/E1B6:	7E7F06  	ROR $067F,X
C0/E1B9:	7FC6C77C	ADC $7CC7C6,X
C0/E1BD:	FE007C  	INC $7C00,X
C0/E1C0:	38      	SEC 
C0/E1C1:	3C6C7E  	BIT $7E6C,X
C0/E1C4:	4466C6  	MVP $66,$C6
C0/E1C7:	E7FE    	SBC [$FE]
C0/E1C9:	FFC6FFC6	SBC $C6FFC6,X
C0/E1CD:	E700    	SBC [$00]
C0/E1CF:	E7FC    	SBC [$FC]
C0/E1D1:	FEC2FF  	INC $FFC2,X
C0/E1D4:	C2E3    	REP #$E3
C0/E1D6:	FCFEC2  	JSR ($C2FE,X)
C0/E1D9:	FFC2E3FC	SBC $FCE3C2,X
C0/E1DD:	FE00FC  	INC $FC00,X
C0/E1E0:	7C7EC2  	JMP ($C27E,X)
C0/E1E3:	FFC0E0C0	SBC $C0E0C0,X
C0/E1E7:	E0C0E0  	CPX #$E0C0
C0/E1EA:	C2E3    	REP #$E3
C0/E1EC:	7CFE00  	JMP ($00FE,X)
C0/E1EF:	7CFCFE  	JMP ($FEFC,X)
C0/E1F2:	C2FF    	REP #$FF
C0/E1F4:	C2E3    	REP #$E3
C0/E1F6:	C2E3    	REP #$E3
C0/E1F8:	C2E3    	REP #$E3
C0/E1FA:	C2E3    	REP #$E3
C0/E1FC:	FCFE00  	JSR ($00FE,X)
C0/E1FF:	FCFEFF  	JSR ($FFFE,X)
C0/E202:	C0FFC0  	CPY #$C0FF
C0/E205:	E0FCFE  	CPX #$FEFC
C0/E208:	C0FEC0  	CPY #$C0FE
C0/E20B:	E0FEFF  	CPX #$FFFE
C0/E20E:	00FF    	BRK #$FF
C0/E210:	FEFFC0  	INC $C0FF,X
C0/E213:	FFC0E0FC	SBC $FCE0C0,X
C0/E217:	FEC0FE  	INC $FEC0,X
C0/E21A:	C0E0C0  	CPY #$C0E0
C0/E21D:	E000E0  	CPX #$E000
C0/E220:	C2E3    	REP #$E3
C0/E222:	C2E3    	REP #$E3
C0/E224:	C2E3    	REP #$E3
C0/E226:	FEFFC2  	INC $C2FF,X
C0/E229:	FFC2E3C2	SBC $C2E3C2,X
C0/E22D:	E300    	SBC $00,S
C0/E22F:	E3FC    	SBC $FC,S
C0/E231:	FEC2FF  	INC $FFC2,X
C0/E234:	C2E3    	REP #$E3
C0/E236:	FCFEC0  	JSR ($C0FE,X)
C0/E239:	FCC0E0  	JSR ($E0C0,X)
C0/E23C:	C0E000  	CPY #$00E0
C0/E23F:	E0C6C7  	CPX #$C7C6
C0/E242:	EEEFFE  	INC $FEEF
C0/E245:	FFD6FFC6	SBC $C6FFD6,X
C0/E249:	F7C6    	SBC [$C6],Y
C0/E24B:	E7C6    	SBC [$C6]
C0/E24D:	E700    	SBC [$00]
C0/E24F:	E7C6    	SBC [$C6]
C0/E251:	E7C6    	SBC [$C6]
C0/E253:	E76C    	SBC [$6C]
C0/E255:	7E383C  	ROR $3C38,X
C0/E258:	6C7EC6  	JMP ($C67E)
C0/E25B:	E7C6    	SBC [$C6]
C0/E25D:	E700    	SBC [$00]
C0/E25F:	E7C0    	SBC [$C0]
C0/E261:	E0C0E0  	CPX #$E0C0
C0/E264:	C0E0C0  	CPY #$C0E0
C0/E267:	E0C0E0  	CPX #$E0C0
C0/E26A:	C0E0FE  	CPY #$FEE0
C0/E26D:	FF00FFC6	SBC $C6FF00,X
C0/E271:	E7C6    	SBC [$C6]
C0/E273:	E7C6    	SBC [$C6]
C0/E275:	E7C6    	SBC [$C6]
C0/E277:	E76C    	SBC [$6C]
C0/E279:	7E6C7E  	ROR $7E6C,X
C0/E27C:	38      	SEC 
C0/E27D:	3C0038  	BIT $3800,X
C0/E280:	0000    	BRK #$00
C0/E282:	0000    	BRK #$00
C0/E284:	0000    	BRK #$00
C0/E286:	7E7F00  	ROR $007F,X
C0/E289:	7F000000	ADC $000000,X
C0/E28D:	0000    	BRK #$00
C0/E28F:	0000    	BRK #$00
C0/E291:	0000    	BRK #$00
C0/E293:	0000    	BRK #$00
C0/E295:	0000    	BRK #$00
C0/E297:	0000    	BRK #$00
C0/E299:	0000    	BRK #$00
C0/E29B:	0000    	BRK #$00
C0/E29D:	0000    	BRK #$00
C0/E29F:	00FF    	BRK #$FF
C0/E2A1:	FFFFFFFF	SBC $FFFFFF,X
C0/E2A5:	FFFFFF00	SBC $00FFFF,X
C0/E2A9:	0000    	BRK #$00
C0/E2AB:	0000    	BRK #$00
C0/E2AD:	0000    	BRK #$00
C0/E2AF:	0000    	BRK #$00
C0/E2B1:	0000    	BRK #$00
C0/E2B3:	0000    	BRK #$00
C0/E2B5:	000F    	BRK #$0F
C0/E2B7:	7F000000	ADC $000000,X
C0/E2BB:	0000    	BRK #$00
C0/E2BD:	00F8    	BRK #$F8
C0/E2BF:	FE0000  	INC $0000,X
C0/E2C2:	0000    	BRK #$00
C0/E2C4:	010F    	ORA ($0F,X)
C0/E2C6:	3F7F0C1F	AND $1F0C7F,X
C0/E2CA:	3FFFFFFF	AND $FFFFFF,X
C0/E2CE:	FFFFF0FF	SBC $FFF0FF,X
C0/E2D2:	FFFFFFFF	SBC $FFFFFF,X
C0/E2D6:	FFFF0FFF	SBC $FF0FFF,X
C0/E2DA:	FFFFFFFF	SBC $FFFFFF,X
C0/E2DE:	FFFF030F	SBC $0F03FF,X
C0/E2E2:	7F7FFFFF	ADC $FFFF7F,X
C0/E2E6:	FFFF0F0F	SBC $0F0FFF,X
C0/E2EA:	0F0F0F0F	ORA $0F0F0F
C0/E2EE:	0F07FFFF	ORA $FFFF07
C0/E2F2:	FFFFFFFE	SBC $FEFFFF,X
C0/E2F6:	FEFEFF  	INC $FFFE,X
C0/E2F9:	FFFFFFFF	SBC $FFFFFF,X
C0/E2FD:	6666    	ROR $66
C0/E2FF:	EE0000  	INC $0000
C0/E302:	00FF    	BRK #$FF
C0/E304:	FFFFFFFF	SBC $FFFFFF,X
C0/E308:	0307    	ORA $07,S
C0/E30A:	0F0F1F1F	ORA $1F1F0F
C0/E30E:	7F7F0707	ADC $07077F,X
C0/E312:	3F7FFFFF	AND $FFFF7F,X
C0/E316:	FFFFFEFF	SBC $FFFEFF,X
C0/E31A:	FFFFFFFF	SBC $FFFFFF,X
C0/E31E:	FFFFEEFF	SBC $FFEEFF,X
C0/E322:	FFFFFFFF	SBC $FFFFFF,X
C0/E326:	FFFF0103	SBC $0301FF,X
C0/E32A:	070F    	ORA [$0F]
C0/E32C:	1F3F7FFE	ORA $FE7F3F,X
C0/E330:	FCF8F0  	JSR ($F0F8,X)
C0/E333:	E0C080  	CPX #$80C0
C0/E336:	0000    	BRK #$00
C0/E338:	0000    	BRK #$00
C0/E33A:	0000    	BRK #$00
C0/E33C:	0307    	ORA $07,S
C0/E33E:	0F3F0303	ORA $03033F
C0/E342:	CFDFFFFF	CMP $FFFFDF
C0/E346:	FFFFF8FB	SBC $FBF8FF,X
C0/E34A:	FFFFFFFF	SBC $FFFFFF,X
C0/E34E:	FFFF039B	SBC $9B03FF,X
C0/E352:	FFFFFFFF	SBC $FFFFFF,X
C0/E356:	FFFF0000	SBC $0000FF,X
C0/E35A:	0000    	BRK #$00
C0/E35C:	0303    	ORA $03,S
C0/E35E:	030F    	ORA $0F,S
C0/E360:	0707    	ORA [$07]
C0/E362:	1F1FFFFF	ORA $FFFF1F,X
C0/E366:	FFFF0001	SBC $0100FF,X
C0/E36A:	0307    	ORA $07,S
C0/E36C:	0F9EBCF8	ORA $F8BC9E
C0/E370:	F0E0    	BEQ $E352
C0/E372:	C08000  	CPY #$0080
C0/E375:	0000    	BRK #$00
C0/E377:	0007    	BRK #$07
C0/E379:	0F0F0F1F	ORA $1F0F0F
C0/E37D:	3F7FFF0F	AND $0FFF7F,X
C0/E381:	3F7F7F7F	AND $7F7F7F,X
C0/E385:	7FFFFFF0	ADC $F0FFFF,X
C0/E389:	E0E0F0  	CPX #$F0E0
C0/E38C:	F078    	BEQ $E406
C0/E38E:	78      	SEI 
C0/E38F:	0001    	BRK #$01
C0/E391:	7F7F7F0F	ADC $0F7F7F,X
C0/E395:	1E3C78  	ASL $783C,X
C0/E398:	F0F0    	BEQ $E38A
C0/E39A:	F0F0    	BEQ $E38C
C0/E39C:	F0F0    	BEQ $E38E
C0/E39E:	F0F0    	BEQ $E390
C0/E3A0:	0F0F0F0F	ORA $0F0F0F
C0/E3A4:	0F0F0F0F	ORA $0F0F0F
C0/E3A8:	8080    	BRA $E32A
C0/E3AA:	8080    	BRA $E32C
C0/E3AC:	8080    	BRA $E32E
C0/E3AE:	C0E0FF  	CPY #$FFE0
C0/E3B1:	FFFFFFFF	SBC $FFFFFF,X
C0/E3B5:	1C0001  	TRB $0100
C0/E3B8:	FFFFFFFF	SBC $FFFFFF,X
C0/E3BC:	FF78F0E0	SBC $E0F078,X
C0/E3C0:	FF6F0000	SBC $00006F,X
C0/E3C4:	0000    	BRK #$00
C0/E3C6:	0000    	BRK #$00
C0/E3C8:	FFDB0000	SBC $0000DB,X
C0/E3CC:	0000    	BRK #$00
C0/E3CE:	0000    	BRK #$00
C0/E3D0:	FFFF0000	SBC $0000FF,X
C0/E3D4:	0000    	BRK #$00
C0/E3D6:	0000    	BRK #$00
C0/E3D8:	FFF60000	SBC $0000F6,X
C0/E3DC:	0000    	BRK #$00
C0/E3DE:	0000    	BRK #$00
C0/E3E0:	0707    	ORA [$07]
C0/E3E2:	0707    	ORA [$07]
C0/E3E4:	0707    	ORA [$07]
C0/E3E6:	0707    	ORA [$07]
C0/E3E8:	0000    	BRK #$00
C0/E3EA:	0000    	BRK #$00
C0/E3EC:	0000    	BRK #$00
C0/E3EE:	FFFF9795	SBC $9597FF,X
C0/E3F2:	9595    	STA $95,X
C0/E3F4:	9595    	STA $95,X
C0/E3F6:	9595    	STA $95,X
C0/E3F8:	00FF    	BRK #$FF
C0/E3FA:	5555    	EOR $55,X
C0/E3FC:	5555    	EOR $55,X
C0/E3FE:	5555    	EOR $55,X
C0/E400:	FEFEFE  	INC $FEFE,X
C0/E403:	FFFFFFFF	SBC $FFFFFF,X
C0/E407:	FF7F7F7F	SBC $7F7F7F,X
C0/E40B:	FFFFFFFF	SBC $FFFFFF,X
C0/E40F:	FFE0E0E0	SBC $E0E0E0,X
C0/E413:	E0E0E0  	CPX #$E0E0
C0/E416:	E0E007  	CPX #$07E0
C0/E419:	FFFFFF00	SBC $00FFFF,X
C0/E41D:	0000    	BRK #$00
C0/E41F:	00C0    	BRK #$C0
C0/E421:	FFFFFF00	SBC $00FFFF,X
C0/E425:	0000    	BRK #$00
C0/E427:	0055    	BRK #$55
C0/E429:	D5F7    	CMP $F7,X
C0/E42B:	FFFFFFFF	SBC $FFFFFF,X
C0/E42F:	FFE9A9A9	SBC $A9A9E9,X
C0/E433:	A9A9A9  	LDA #$A9A9
C0/E436:	A9A901  	LDA #$01A9
C0/E439:	0101    	ORA ($01,X)
C0/E43B:	0000    	BRK #$00
C0/E43D:	0000    	BRK #$00
C0/E43F:	0018    	BRK #$18
C0/E441:	18      	CLC
C0/E442:	98      	TYA
C0/E443:	98      	TYA
C0/E444:	98      	TYA
C0/E445:	98      	TYA
C0/E446:	18      	CLC
C0/E447:	18      	CLC
C0/E448:	0000    	BRK #$00
C0/E44A:	0000    	BRK #$00
C0/E44C:	0107    	ORA ($07,X)
C0/E44E:	1E7C0A  	ASL $0A7C,X
C0/E451:	1A      	INC A
C0/E452:	3A      	DEC A
C0/E453:	6A      	ROR A
C0/E454:	CA      	DEX
C0/E455:	8A      	TXA
C0/E456:	8A      	TXA
C0/E457:	8A      	TXA
C0/E458:	0000    	BRK #$00
C0/E45A:	00FF    	BRK #$FF
C0/E45C:	8080    	BRA $E3DE
C0/E45E:	8080    	BRA $E3E0
C0/E460:	08      	PHP 
C0/E461:	18      	CLC
C0/E462:	E8      	INX
C0/E463:	48      	PHA
C0/E464:	48      	PHA
C0/E465:	48      	PHA
C0/E466:	48      	PHA
C0/E467:	58      	CLI 
C0/E468:	0000    	BRK #$00
C0/E46A:	007F    	BRK #$7F
C0/E46C:	8080    	BRA $E3EE
C0/E46E:	8080    	BRA $E3F0
C0/E470:	0000    	BRK #$00
C0/E472:	00FF    	BRK #$FF
C0/E474:	0202    	COP #$02
C0/E476:	0202    	COP #$02
C0/E478:	5557    	EOR $57,X
C0/E47A:	7FFFFFFF	ADC $FFFFFF,X
C0/E47E:	FFFF0007	SBC $0700FF,X
C0/E482:	0A      	ASL A
C0/E483:	0A      	ASL A
C0/E484:	0702    	ORA [$02]
C0/E486:	0202    	COP #$02
C0/E488:	03FC    	ORA $FC,S
C0/E48A:	08      	PHP 
C0/E48B:	0B      	PHD
C0/E48C:	FC1010  	JSR ($1010,X)
C0/E48F:	10FF    	BPL $E490
C0/E491:	FFFFFFFE	SBC $FEFFFF,X
C0/E495:	FCF0E0  	JSR ($E0F0,X)
C0/E498:	FFFFC000	SBC $00C0FF,X
C0/E49C:	0000    	BRK #$00
C0/E49E:	0000    	BRK #$00
C0/E4A0:	E8      	INX
C0/E4A1:	88      	DEY 
C0/E4A2:	98      	TYA
C0/E4A3:	91DF    	STA ($DF),Y
C0/E4A5:	5050    	BVC $E4F7
C0/E4A7:	D68A    	DEC $8A,X
C0/E4A9:	9A      	TXS 
C0/E4AA:	9A      	TXS 
C0/E4AB:	9FD75654	STA $5456D7,X
C0/E4AF:	5480FF  	MVN $80,$FF
C0/E4B2:	8080    	BRA $E434
C0/E4B4:	80FF    	BRA $E4B5
C0/E4B6:	8080    	BRA $E438
C0/E4B8:	E8      	INX
C0/E4B9:	48      	PHA
C0/E4BA:	48      	PHA
C0/E4BB:	58      	CLI 
C0/E4BC:	E04040  	CPX #$4040
C0/E4BF:	48      	PHA
C0/E4C0:	02FF    	COP #$FF
C0/E4C2:	0202    	COP #$02
C0/E4C4:	02FF    	COP #$FF
C0/E4C6:	0202    	COP #$02
C0/E4C8:	0F0F0F0F	ORA $0F0F0F
C0/E4CC:	FFFFFFFF	SBC $FFFFFF,X
C0/E4D0:	1F1F1F1F	ORA $1F1F1F,X
C0/E4D4:	FFFFFFFF	SBC $FFFFFF,X
C0/E4D8:	FFFFFCF8	SBC $F8FCFF,X
C0/E4DC:	F0F0    	BEQ $E4CE
C0/E4DE:	C08000  	CPY #$0080
C0/E4E1:	C3FF    	CMP $FF,S
C0/E4E3:	FFFFFFFF	SBC $FFFFFF,X
C0/E4E7:	FF00E3EF	SBC $EFE300,X
C0/E4EB:	FFFFFFFF	SBC $FFFFFF,X
C0/E4EF:	FF000080	SBC $800000,X
C0/E4F3:	80C0    	BRA $E4B5
C0/E4F5:	E0E0F0  	CPX #$F0E0
C0/E4F8:	0000    	BRK #$00
C0/E4FA:	0001    	BRK #$01
C0/E4FC:	071F    	ORA [$1F]
C0/E4FE:	7FFFF0F8	ADC $F8F0FF,X
C0/E502:	F8      	SED 
C0/E503:	FCFCFE  	JSR ($FEFC,X)
C0/E506:	FEFF07  	INC $07FF,X
C0/E509:	1F7FFFFF	ORA $FFFF7F,X
C0/E50D:	FFFFFFE0	SBC $E0FFFF,X
C0/E511:	F8      	SED 
C0/E512:	FEFFFF  	INC $FFFF,X
C0/E515:	FFFFFF01	SBC $01FFFF,X
C0/E519:	0303    	ORA $03,S
C0/E51B:	070F    	ORA [$0F]
C0/E51D:	3F7FFFFF	AND $FFFF7F,X
C0/E521:	FFFCFCF9	SBC $F9FCFC,X
C0/E525:	F3EF    	SBC ($EF,S),Y
C0/E527:	FF000C1C	SBC $1C0C00,X
C0/E52B:	38      	SEC 
C0/E52C:	F0F8    	BEQ $E526
C0/E52E:	FEFF00  	INC $00FF,X
C0/E531:	0000    	BRK #$00
C0/E533:	0000    	BRK #$00
C0/E535:	0100    	ORA ($00,X)
C0/E537:	0000    	BRK #$00
C0/E539:	0000    	BRK #$00
C0/E53B:	0000    	BRK #$00
C0/E53D:	C7EF    	CMP [$EF]
C0/E53F:	EF001B1F	SBC $1F1B00
C0/E543:	3E3F31  	ROL $313F,X
C0/E546:	A1E0    	LDA ($E0,X)
C0/E548:	C0E0E0  	CPY #$E0E0
C0/E54B:	0002    	BRK #$02
C0/E54D:	3EBFBF  	ROL $BFBF,X
C0/E550:	00F0    	BRK #$F0
C0/E552:	F8      	SED 
C0/E553:	FFFFFFFF	SBC $FFFFFF,X
C0/E557:	FF000000	SBC $000000,X
C0/E55B:	80E0    	BRA $E53D
C0/E55D:	F8      	SED 
C0/E55E:	FEFFFF  	INC $FFFF,X
C0/E561:	3F0F1F3F	AND $3F1F0F,X
C0/E565:	BFF7F7FF	LDA $FFF7F7,X
C0/E569:	FFFFFFFF	SBC $FFFFFF,X
C0/E56D:	FF1F0FF0	SBC $F00F1F,X
C0/E571:	FCFCFC  	JSR ($FCFC,X)
C0/E574:	FEF0FC  	INC $FCF0,X
C0/E577:	FE8080  	INC $8080,X
C0/E57A:	8080    	BRA $E4FC
C0/E57C:	60      	RTS
 
C0/E57D:	E0C0C0  	CPX #$C0C0
C0/E580:	003D    	BRK #$3D
C0/E582:	7E3F3F  	ROR $3F3F,X
C0/E585:	3FFFFFFF	AND $FFFFFF,X
C0/E589:	FF3F7FFF	SBC $FF7F3F,X
C0/E58D:	FFFFFFFF	SBC $FFFFFF,X
C0/E591:	FFFFDF0F	SBC $0FDFFF,X
C0/E595:	9FFFFFB7	STA $B7FFFF,X
C0/E599:	E7FF    	SBC [$FF]
C0/E59B:	FFFFFFFF	SBC $FFFFFF,X
C0/E59F:	FFFFFFFE	SBC $FEFFFF,X
C0/E5A3:	FEFDFF  	INC $FFFD,X
C0/E5A6:	FFFF00BC	SBC $BC00FF,X
C0/E5AA:	7EFCFC  	ROR $FCFC,X
C0/E5AD:	FCFFFF  	JSR ($FFFF,X)
C0/E5B0:	FEF8FC  	INC $FCF8,X
C0/E5B3:	F8      	SED 
C0/E5B4:	FEFEFF  	INC $FFFE,X
C0/E5B7:	FF133B1F	SBC $1F3B13,X
C0/E5BB:	3F3F3FFF	AND $FF3F3F,X
C0/E5BF:	FF3F7FFF	SBC $FF7F3F,X
C0/E5C3:	FFFFFFFF	SBC $FFFFFF,X
C0/E5C7:	FFFEFCFE	SBC $FEFCFE,X
C0/E5CB:	FCFEFE  	JSR ($FEFE,X)
C0/E5CE:	FFFFC0F0	SBC $F0C0FF,X
C0/E5D2:	E0F0F2  	CPX #$F2F0
C0/E5D5:	F6FF    	INC $FF,X
C0/E5D7:	FF3F1F0F	SBC $0F1F3F,X
C0/E5DB:	0703    	ORA [$03]
C0/E5DD:	0100    	ORA ($00,X)
C0/E5DF:	0003    	BRK #$03
C0/E5E1:	0303    	ORA $03,S
C0/E5E3:	0303    	ORA $03,S
C0/E5E5:	0303    	ORA $03,S
C0/E5E7:	0700    	ORA [$00]
C0/E5E9:	0040    	BRK #$40
C0/E5EB:	60      	RTS
 
C0/E5EC:	60      	RTS
 
C0/E5ED:	737F    	ADC ($7F,S),Y
C0/E5EF:	7F000000	ADC $000000,X
C0/E5F3:	0080    	BRK #$80
C0/E5F5:	C0E0C0  	CPY #$C0E0
C0/E5F8:	0000    	BRK #$00
C0/E5FA:	40      	RTI
 
C0/E5FB:	60      	RTS
 
C0/E5FC:	6377    	ADC $77,S
C0/E5FE:	777F    	ADC [$7F],Y
C0/E600:	E0FEFE  	CPX #$FEFE
C0/E603:	FFFFFFFF	SBC $FFFFFF,X
C0/E607:	FF0F1F3F	SBC $3F1F0F,X
C0/E60B:	FFFFFFFF	SBC $FFFFFF,X
C0/E60F:	FF7F7F7F	SBC $7F7F7F,X
C0/E613:	7F7F7F7F	ADC $7F7F7F,X
C0/E617:	7F0000E0	ADC $E00000,X
C0/E61B:	F0F8    	BEQ $E615
C0/E61D:	FCFEFF  	JSR ($FFFE,X)
C0/E620:	80C0    	BRA $E5E2
C0/E622:	E0F0F8  	CPX #$F8F0
C0/E625:	FCFEFF  	JSR ($FFFE,X)
C0/E628:	C0C0C0  	CPY #$C0C0
C0/E62B:	C0C0E0  	CPY #$E0C0
C0/E62E:	FFFF0303	SBC $0303FF,X
C0/E632:	0303    	ORA $03,S
C0/E634:	0307    	ORA $07,S
C0/E636:	FFFF0000	SBC $0000FF,X
C0/E63A:	0307    	ORA $07,S
C0/E63C:	0C1830  	TSB $3018
C0/E63F:	61F0    	ADC ($F0,X)
C0/E641:	F0FF    	BEQ $E642
C0/E643:	FFF0F0FF	SBC $FFF0F0,X
C0/E647:	FF0000E0	SBC $E00000,X
C0/E64B:	F0F8    	BEQ $E645
C0/E64D:	FCFEFE  	JSR ($FEFE,X)
C0/E650:	F0E0    	BEQ $E632
C0/E652:	E0E0E0  	CPX #$E0E0
C0/E655:	E0E0E0  	CPX #$E0E0
C0/E658:	0000    	BRK #$00
C0/E65A:	FFFFF0F0	SBC $F0F0FF,X
C0/E65E:	FFF00303	SBC $0303F0,X
C0/E662:	0707    	ORA [$07]
C0/E664:	0F1B3363	ORA $63331B
C0/E668:	C386    	CMP $86,S
C0/E66A:	8C1933  	STY $3319
C0/E66D:	67CF    	ADC [$CF]
C0/E66F:	9F000103	STA $030100,X
C0/E673:	060C    	ASL $0C
C0/E675:	18      	CLC
C0/E676:	3061    	BMI $E6D9
C0/E678:	C787    	CMP [$87]
C0/E67A:	0F1B3367	ORA $67331B
C0/E67E:	CF9FFCFE	CMP $FEFC9F
C0/E682:	FCFCFC  	JSR ($FCFC,X)
C0/E685:	FCFCFC  	JSR ($FCFC,X)
C0/E688:	FCF8F0  	JSR ($F0F8,X)
C0/E68B:	F0FC    	BEQ $E689
C0/E68D:	FCFCFC  	JSR ($FCFC,X)
C0/E690:	F0F0    	BEQ $E682
C0/E692:	FCFCFC  	JSR ($FCFC,X)
C0/E695:	FEFFFF  	INC $FFFF,X
C0/E698:	0000    	BRK #$00
C0/E69A:	0000    	BRK #$00
C0/E69C:	000E    	BRK #$0E
C0/E69E:	FFFF0F3F	SBC $3F0FFF,X
C0/E6A2:	3F3F7FFF	AND $FF7F3F,X
C0/E6A6:	FFFF030F	SBC $0F03FF,X
C0/E6AA:	3F7FF9F9	AND $F9F97F,X
C0/E6AE:	D9DFFF  	CMP $FFDF,Y
C0/E6B1:	FFF8F070	SBC $70F0F8,X
C0/E6B5:	279F    	AND [$9F]
C0/E6B7:	FFFFF337	SBC $37F3FF,X
C0/E6BB:	37FE    	AND [$FE],Y
C0/E6BD:	BCFFFF  	LDY $FFFF,X
C0/E6C0:	FFC78909	SBC $0989C7,X
C0/E6C4:	1121    	ORA ($21),Y
C0/E6C6:	FFFF1010	SBC $1010FF,X
C0/E6CA:	FFFF1010	SBC $1010FF,X
C0/E6CE:	FFFF3838	SBC $3838FF,X
C0/E6D2:	FFFFB8B8	SBC $B8B8FF,X
C0/E6D6:	FFFFC386	SBC $86C3FF,X
C0/E6DA:	0C1933  	TSB $3319
C0/E6DD:	67CF    	ADC [$CF]
C0/E6DF:	9FFCFCFC	STA $FCFCFC,X
C0/E6E3:	FEFCFC  	INC $FCFC,X
C0/E6E6:	FCFCDF  	JSR ($DFFC,X)
C0/E6E9:	FFFFF9DF	SBC $DFF9FF,X
C0/E6ED:	BFB7A7FD	LDA $FDA7B7,X
C0/E6F1:	6D6D6D  	ADC $6D6D
C0/E6F4:	6D6FFE  	ADC $FE6F
C0/E6F7:	D8      	CLD 
C0/E6F8:	A7AF    	LDA [$AF]
C0/E6FA:	BF9BB3E5	LDA $E5B39B,X
C0/E6FE:	FC78FD  	JSR ($FD78,X)
C0/E701:	FDFDF9  	SBC $F9FD,X
C0/E704:	ED677F  	SBC $7F67
C0/E707:	0000    	BRK #$00
C0/E709:	00C0    	BRK #$C0
C0/E70B:	C0E0E0  	CPY #$E0E0
C0/E70E:	FCFCC2  	JSR ($C2FC,X)
C0/E711:	FF000000	SBC $000000,X
C0/E715:	0000    	BRK #$00
C0/E717:	000F    	BRK #$0F
C0/E719:	FF030707	SBC $070703,X
C0/E71D:	0000    	BRK #$00
C0/E71F:	000E    	BRK #$0E
C0/E721:	0FFFFF0F	ORA $0FFFFF
C0/E725:	0EFFFF  	ASL $FFFF
C0/E728:	F6FE    	INC $FE,X
C0/E72A:	FFFFFEFE	SBC $FEFEFF,X
C0/E72E:	FFFF0000	SBC $0000FF,X
C0/E732:	0307    	ORA $07,S
C0/E734:	0F1F3F3F	ORA $3F3F1F
C0/E738:	0F0F8FCF	ORA $CF8F0F
C0/E73C:	CFEFFFFF	CMP $FFFFEF
C0/E740:	F8      	SED 
C0/E741:	F8      	SED 
C0/E742:	F8      	SED 
C0/E743:	F8      	SED 
C0/E744:	FFFFFFFF	SBC $FFFFFF,X
C0/E748:	FE3E3F  	INC $3F3E,X
C0/E74B:	3F7F7F79	AND $797F7F,X
C0/E74F:	003F    	BRK #$3F
C0/E751:	3F3F3FFF	AND $FF3F3F,X
C0/E755:	FFFFFFFF	SBC $FFFFFF,X
C0/E759:	FFFFFF38	SBC $38FFFF,X
C0/E75D:	38      	SEC 
C0/E75E:	FFFFFFFF	SBC $FFFFFF,X
C0/E762:	FFFF3C38	SBC $383CFF,X
C0/E766:	38      	SEC 
C0/E767:	FFFFFFFF	SBC $FFFFFF,X
C0/E76B:	FF1F3FFF	SBC $FF3F1F,X
C0/E76F:	FFFCFEFF	SBC $FFFEFC,X
C0/E773:	FFFFFFFF	SBC $FFFFFF,X
C0/E777:	FFFFFFFE	SBC $FEFFFF,X
C0/E77B:	FCF0C0  	JSR ($C0F0,X)
C0/E77E:	C080C0  	CPY #$C080
C0/E781:	E0F0F8  	CPX #$F8F0
C0/E784:	FCFEFF  	JSR ($FFFE,X)
C0/E787:	7FFF3838	ADC $3838FF,X
C0/E78B:	FFFF3C3C	SBC $3C3CFF,X
C0/E78F:	FFFEFCF8	SBC $F8FCFE,X
C0/E793:	F0F0    	BEQ $E785
C0/E795:	F0F0    	BEQ $E787
C0/E797:	F8      	SED 
C0/E798:	0000    	BRK #$00
C0/E79A:	003C    	BRK #$3C
C0/E79C:	7E7E7E  	ROR $7E7E,X
C0/E79F:	7FFF3838	ADC $3838FF,X
C0/E7A3:	38      	SEC 
C0/E7A4:	38      	SEC 
C0/E7A5:	3CFCFF  	BIT $FFFC,X
C0/E7A8:	FF1F1F1F	SBC $1F1F1F,X
C0/E7AC:	3F7FFFFF	AND $FFFF7F,X
C0/E7B0:	0F0F0F0F	ORA $0F0F0F
C0/E7B4:	1F1F3FFF	ORA $FF3F1F,X
C0/E7B8:	0000    	BRK #$00
C0/E7BA:	0000    	BRK #$00
C0/E7BC:	0003    	BRK #$03
C0/E7BE:	0F1F0000	ORA $00001F
C0/E7C2:	0000    	BRK #$00
C0/E7C4:	00FF    	BRK #$FF
C0/E7C6:	FFFF0000	SBC $0000FF,X
C0/E7CA:	0000    	BRK #$00
C0/E7CC:	00C0    	BRK #$C0
C0/E7CE:	F0F8    	BEQ $E7C8
C0/E7D0:	0707    	ORA [$07]
C0/E7D2:	071F    	ORA [$1F]
C0/E7D4:	3F3F3FFF	AND $FF3F3F,X
C0/E7D8:	F0F0    	BEQ $E7CA
C0/E7DA:	F0F0    	BEQ $E7CC
C0/E7DC:	F8      	SED 
C0/E7DD:	F8      	SED 
C0/E7DE:	F8      	SED 
C0/E7DF:	FF008080	SBC $808000,X
C0/E7E3:	C0C0E0  	CPY #$E0C0
C0/E7E6:	E0F000  	CPX #$00F0
C0/E7E9:	000C    	BRK #$0C
C0/E7EB:	4677    	LSR $77
C0/E7ED:	71F8    	ADC ($F8),Y
C0/E7EF:	F8      	SED 
C0/E7F0:	0000    	BRK #$00
C0/E7F2:	0003    	BRK #$03
C0/E7F4:	0F1F1303	ORA $03131F
C0/E7F8:	F7EF    	SBC [$EF],Y
C0/E7FA:	FCFBF7  	JSR ($F7FB,X)
C0/E7FD:	EFEFFF3C	SBC $3CFFEF
C0/E801:	3CFFFF  	BIT $FFFF,X
C0/E804:	FFFFFFFF	SBC $FFFFFF,X
C0/E808:	3F7F7EFC	AND $FC7E7F,X
C0/E80C:	F1F7    	SBC ($F7),Y
C0/E80E:	FFFCFF18	SBC $18FFFC,X
C0/E812:	18      	CLC
C0/E813:	18      	CLC
C0/E814:	FFFF18FF	SBC $FF18FF,X
C0/E818:	FCFE7E  	JSR ($7EFE,X)
C0/E81B:	1F8FEF7F	ORA $7FEF8F,X
C0/E81F:	3FFFFFFF	AND $FFFFFF,X
C0/E823:	FFF9F9F9	SBC $F9F9F9,X
C0/E827:	FFFFFFFF	SBC $FFFFFF,X
C0/E82B:	FF1F1F7F	SBC $7F1F1F,X
C0/E82F:	FFFFFFFF	SBC $FFFFFF,X
C0/E833:	FFF8F8FF	SBC $FFF8F8,X
C0/E837:	FFF0F8F8	SBC $F8F8F0,X
C0/E83B:	FCFCFC  	JSR ($FCFC,X)
C0/E83E:	F8      	SED 
C0/E83F:	F8      	SED 
C0/E840:	F8      	SED 
C0/E841:	E0E0FC  	CPX #$FCE0
C0/E844:	FFFFFFFF	SBC $FFFFFF,X
C0/E848:	337F    	AND ($7F,S),Y
C0/E84A:	7FFFFFFF	ADC $FFFFFF,X
C0/E84E:	FFFF0000	SBC $0000FF,X
C0/E852:	00C0    	BRK #$C0
C0/E854:	E0F8FC  	CPX #$FCF8
C0/E857:	FE3F3F  	INC $3F3F,X
C0/E85A:	1F1F0F0F	ORA $0F0F1F,X
C0/E85E:	0F0F0000	ORA $00000F
C0/E862:	0038    	BRK #$38
C0/E864:	7CFCFC  	JMP ($FCFC,X)
C0/E867:	FEFFFF  	INC $FFFF,X
C0/E86A:	FFFFFCFC	SBC $FCFCFF,X
C0/E86E:	FCFFFF  	JSR ($FFFF,X)
C0/E871:	FFFFFF38	SBC $38FFFF,X
C0/E875:	38      	SEC 
C0/E876:	38      	SEC 
C0/E877:	FF000000	SBC $000000,X
C0/E87B:	3078    	BMI $E8F5
C0/E87D:	78      	SEI 
C0/E87E:	78      	SEI 
C0/E87F:	38      	SEC 
C0/E880:	0080    	BRK #$80
C0/E882:	C0E0F0  	CPY #$F0E0
C0/E885:	F8      	SED 
C0/E886:	FCFF0F  	JSR ($0FFF,X)
C0/E889:	0F1F1F0F	ORA $0F1F1F
C0/E88D:	0F0F1FFF	ORA $FF1F0F
C0/E891:	FFFFFFF8	SBC $F8FFFF,X
C0/E895:	FCFFFF  	JSR ($FFFF,X)
C0/E898:	FFFFFFFF	SBC $FFFFFF,X
C0/E89C:	3C1C1C  	BIT $1C1C,X
C0/E89F:	FFFFF8F8	SBC $F8F8FF,X
C0/E8A3:	F8      	SED 
C0/E8A4:	FCFEFF  	JSR ($FFFE,X)
C0/E8A7:	FFFF3838	SBC $3838FF,X
C0/E8AB:	38      	SEC 
C0/E8AC:	38      	SEC 
C0/E8AD:	38      	SEC 
C0/E8AE:	F8      	SED 
C0/E8AF:	FFFFFEFC	SBC $FCFEFF,X
C0/E8B3:	F8      	SED 
C0/E8B4:	F080    	BEQ $E836
C0/E8B6:	0000    	BRK #$00
C0/E8B8:	FF7F3F1F	SBC $1F3F7F,X
C0/E8BC:	0F010000	ORA $000001
C0/E8C0:	38      	SEC 
C0/E8C1:	38      	SEC 
C0/E8C2:	38      	SEC 
C0/E8C3:	78      	SEI 
C0/E8C4:	78      	SEI 
C0/E8C5:	78      	SEI 
C0/E8C6:	78      	SEI 
C0/E8C7:	78      	SEI 
C0/E8C8:	0103    	ORA ($03,X)
C0/E8CA:	070F    	ORA [$0F]
C0/E8CC:	1B      	TCS 
C0/E8CD:	3363    	AND ($63,S),Y
C0/E8CF:	E701    	SBC [$01]
C0/E8D1:	0307    	ORA $07,S
C0/E8D3:	0707    	ORA [$07]
C0/E8D5:	070F    	ORA [$0F]
C0/E8D7:	0FFCFEFE	ORA $FEFEFC
C0/E8DB:	FEFFFF  	INC $FFFF,X
C0/E8DE:	FFFF0000	SBC $0000FF,X
C0/E8E2:	0000    	BRK #$00
C0/E8E4:	80FC    	BRA $E8E2
C0/E8E6:	FCFC7C  	JSR ($7CFC,X)
C0/E8E9:	FEFFFE  	INC $FEFF,X
C0/E8EC:	FEFFFF  	INC $FFFF,X
C0/E8EF:	FF070307	SBC $070307,X
C0/E8F3:	17FF    	ORA [$FF],Y
C0/E8F5:	FFFFFF00	SBC $00FFFF,X
C0/E8F9:	0000    	BRK #$00
C0/E8FB:	0000    	BRK #$00
C0/E8FD:	02C7    	COP #$C7
C0/E8FF:	8300    	STA $00,S
C0/E901:	0000    	BRK #$00
C0/E903:	0000    	BRK #$00
C0/E905:	0080    	BRK #$80
C0/E907:	8007    	BRA $E910
C0/E909:	EFFFFFFF	SBC $FFFFFF
C0/E90D:	FFFFFFFC	SBC $FCFFFF,X
C0/E911:	FFFFFFFF	SBC $FFFFFF,X
C0/E915:	FFFFFF07	SBC $07FFFF,X
C0/E919:	0707    	ORA [$07]
C0/E91B:	0F1F1F3F	ORA $3F1F1F
C0/E91F:	3F000000	AND $000000,X
C0/E923:	0307    	ORA $07,S
C0/E925:	0F1F3F00	ORA $003F1F
C0/E929:	F8      	SED 
C0/E92A:	FCFFFF  	JSR ($FFFF,X)
C0/E92D:	FFFFFF00	SBC $00FFFF,X
C0/E931:	1FFFFFFF	ORA $FFFFFF,X
C0/E935:	FFFFFFFC	SBC $FCFFFF,X
C0/E939:	FCFCFC  	JSR ($FCFC,X)
C0/E93C:	FCFCFC  	JSR ($FCFC,X)
C0/E93F:	FCC0C3  	JSR ($C3C0,X)
C0/E942:	E1F5    	SBC ($F5,X)
C0/E944:	FFFFFFFF	SBC $FFFFFF,X
C0/E948:	E0E0F8  	CPX #$F8E0
C0/E94B:	F8      	SED 
C0/E94C:	F8      	SED 
C0/E94D:	F8      	SED 
C0/E94E:	F9F900  	SBC $00F9,Y
C0/E951:	0001    	BRK #$01
C0/E953:	1F3F7FFF	ORA $FF7F3F,X
C0/E957:	FF000080	SBC $800000,X
C0/E95B:	E0FFFF  	CPX #$FFFF
C0/E95E:	FFFF0000	SBC $0000FF,X
C0/E962:	7FFFFFFF	ADC $FFFFFF,X
C0/E966:	FFFFF0FC	SBC $FCF0FF,X
C0/E96A:	FEFFFF  	INC $FFFF,X
C0/E96D:	FFFFFF00	SBC $00FFFF,X
C0/E971:	0000    	BRK #$00
C0/E973:	F0F8    	BEQ $E96D
C0/E975:	FEFEFF  	INC $FFFE,X
C0/E978:	0307    	ORA $07,S
C0/E97A:	070F    	ORA [$0F]
C0/E97C:	1F3F3F3F	ORA $3F3F3F,X
C0/E980:	C0E0FC  	CPY #$FCE0
C0/E983:	FFFFFFFF	SBC $FFFFFF,X
C0/E987:	FF070FBF	SBC $BF0F07,X
C0/E98B:	FFFFFFFF	SBC $FFFFFF,X
C0/E98F:	FF000000	SBC $000000,X
C0/E993:	0001    	BRK #$01
C0/E995:	0307    	ORA $07,S
C0/E997:	0F01033F	ORA $3F0301
C0/E99B:	7FFFFFFF	ADC $FFFFFF,X
C0/E99F:	FF78FDFF	SBC $FFFD78,X
C0/E9A3:	FFFFFFFF	SBC $FFFFFF,X
C0/E9A7:	FF30FCFF	SBC $FFFC30,X
C0/E9AB:	FFFFFFFF	SBC $FFFFFF,X
C0/E9AF:	FFFFFFFF	SBC $FFFFFF,X
C0/E9B3:	FFFF0303	SBC $0303FF,X
C0/E9B7:	0303    	ORA $03,S
C0/E9B9:	0303    	ORA $03,S
C0/E9BB:	03FF    	ORA $FF,S
C0/E9BD:	0303    	ORA $03,S
C0/E9BF:	0300    	ORA $00,S
C0/E9C1:	0000    	BRK #$00
C0/E9C3:	1F3F7FFF	ORA $FF7F3F,X
C0/E9C7:	FF000000	SBC $000000,X
C0/E9CB:	F8      	SED 
C0/E9CC:	FCFEFF  	JSR ($FFFE,X)
C0/E9CF:	FF000000	SBC $000000,X
C0/E9D3:	0F3F7FFF	ORA $FF7F3F
C0/E9D7:	FF1F3F7F	SBC $7F3F1F,X
C0/E9DB:	7F7F7FFF	ADC $FF7F7F,X
C0/E9DF:	FF020202	SBC $020202,X
C0/E9E3:	02FF    	COP #$FF
C0/E9E5:	0202    	COP #$02
C0/E9E7:	021F    	COP #$1F
C0/E9E9:	1F1F1F1F	ORA $1F1F1F,X
C0/E9ED:	1F1F3FC0	ORA $C03F1F,X
C0/E9F1:	F0F8    	BEQ $E9EB
C0/E9F3:	F8      	SED 
C0/E9F4:	F9FFFF  	SBC $FFFF,Y
C0/E9F7:	FF000000	SBC $000000,X
C0/E9FB:	00F0    	BRK #$F0
C0/E9FD:	F8      	SED 
C0/E9FE:	FFFF3F07	SBC $073FFF,X
C0/EA02:	0F0F3F3F	ORA $3F3F0F
C0/EA06:	3F1F0000	AND $00001F,X
C0/EA0A:	0000    	BRK #$00
C0/EA0C:	0707    	ORA [$07]
C0/EA0E:	0703    	ORA [$03]
C0/EA10:	0001    	BRK #$01
C0/EA12:	0307    	ORA $07,S
C0/EA14:	0F9EFCF8	ORA $F8FC9E
C0/EA18:	E0FFFF  	CPX #$FFFF
C0/EA1B:	FFF8FCFE	SBC $FEFCF8,X
C0/EA1F:	EF38FFFF	SBC $FFFF38
C0/EA23:	FF000000	SBC $000000,X
C0/EA27:	0000    	BRK #$00
C0/EA29:	0030    	BRK #$30
C0/EA2B:	707C    	BVS $EAA9
C0/EA2D:	FFFFFF7F	SBC $7FFFFF,X
C0/EA31:	FFFFFFFF	SBC $FFFFFF,X
C0/EA35:	FFFFFF03	SBC $03FFFF,X
C0/EA39:	0303    	ORA $03,S
C0/EA3B:	0303    	ORA $03,S
C0/EA3D:	070F    	ORA [$0F]
C0/EA3F:	0703    	ORA [$03]
C0/EA41:	0103    	ORA ($03,X)
C0/EA43:	070F    	ORA [$0F]
C0/EA45:	1E3C38  	ASL $383C,X
C0/EA48:	F0F0    	BEQ $EA3A
C0/EA4A:	E0F0F0  	CPX #$F0F0
C0/EA4D:	78      	SEI 
C0/EA4E:	38      	SEC 
C0/EA4F:	38      	SEC 
C0/EA50:	E0FEFE  	CPX #$FEFE
C0/EA53:	FEFEFF  	INC $FFFE,X
C0/EA56:	FFFF077F	SBC $7F07FF,X
C0/EA5A:	7F7F7FFF	ADC $FF7F7F,X
C0/EA5E:	FFFFE7FF	SBC $FFE7FF,X
C0/EA62:	FFFFFEFE	SBC $FEFEFF,X
C0/EA66:	EFEFE0FF	SBC $FFE0EF
C0/EA6A:	FFFF0000	SBC $0000FF,X
C0/EA6E:	0000    	BRK #$00
C0/EA70:	0000    	BRK #$00
C0/EA72:	0003    	BRK #$03
C0/EA74:	0307    	ORA $07,S
C0/EA76:	0F3F0000	ORA $00003F
C0/EA7A:	7EFFFF  	ROR $FFFF,X
C0/EA7D:	FFFFFF80	SBC $80FFFF,X
C0/EA81:	FFFFFF00	SBC $00FFFF,X
C0/EA85:	0000    	BRK #$00
C0/EA87:	001C    	BRK #$1C
C0/EA89:	FFFFFF00	SBC $00FFFF,X
C0/EA8D:	0000    	BRK #$00
C0/EA8F:	000F    	BRK #$0F
C0/EA91:	0F0F1E3E	ORA $3E1E0F
C0/EA95:	3F7F3F07	AND $073F7F,X
C0/EA99:	0F0F0F0F	ORA $0F0F0F
C0/EA9D:	0F0F1F3F	ORA $3F1F0F
C0/EAA1:	3F3F3F7F	AND $7F3F3F,X
C0/EAA5:	FFFFFF0F	SBC $0FFFFF,X
C0/EAA9:	0F1F3EFE	ORA $FE3E1F
C0/EAAD:	BF7F3F7F	LDA $7F3F7F,X
C0/EAB1:	7FFFFFFF	ADC $FFFFFF,X
C0/EAB5:	FFFFFF00	SBC $00FFFF,X
C0/EAB9:	FFFFFF00	SBC $00FFFF,X
C0/EABD:	1C1C1C  	TRB $1C1C
C0/EAC0:	0000    	BRK #$00
C0/EAC2:	0103    	ORA ($03,X)
C0/EAC4:	0F2E78E1	ORA $E1782E
C0/EAC8:	7F7FFFBF	ADC $BFFF7F,X
C0/EACC:	3F7D78F8	AND $F8787D,X
C0/EAD0:	0000    	BRK #$00
C0/EAD2:	0000    	BRK #$00
C0/EAD4:	C0780F  	CPY #$0F78
C0/EAD7:	0000    	BRK #$00
C0/EAD9:	0000    	BRK #$00
C0/EADB:	0000    	BRK #$00
C0/EADD:	0080    	BRK #$80
C0/EADF:	F01F    	BEQ $EB00
C0/EAE1:	1F1F1F1F	ORA $1F1F1F,X
C0/EAE5:	3F3F3F00	AND $003F3F,X
C0/EAE9:	0101    	ORA ($01,X)
C0/EAEB:	0101    	ORA ($01,X)
C0/EAED:	0101    	ORA ($01,X)
C0/EAEF:	0300    	ORA $00,S
C0/EAF1:	0000    	BRK #$00
C0/EAF3:	0000    	BRK #$00
C0/EAF5:	0107    	ORA ($07,X)
C0/EAF7:	1E0307  	ASL $0703,X
C0/EAFA:	0E7EF0  	ASL $F07E
C0/EAFD:	E04000  	CPX #$0040
C0/EB00:	C381    	CMP $81,S
C0/EB02:	0103    	ORA ($03,X)
C0/EB04:	0303    	ORA $03,S
C0/EB06:	011D    	ORA ($1D,X)
C0/EB08:	F8      	SED 
C0/EB09:	F8      	SED 
C0/EB0A:	F8      	SED 
C0/EB0B:	F8      	SED 
C0/EB0C:	FEE7E3  	INC $E3E7,X
C0/EB0F:	F12C    	SBC ($2C),Y
C0/EB11:	2C2C04  	BIT $042C
C0/EB14:	0484    	TSB $84
C0/EB16:	C4E5    	CPY $E5
C0/EB18:	2666    	ROL $66
C0/EB1A:	6464    	STZ $64
C0/EB1C:	6CCCC8  	JMP ($C8CC)
C0/EB1F:	88      	DEY 
C0/EB20:	3F0F1212	AND $12120F,X
C0/EB24:	2464    	BIT $64
C0/EB26:	448400  	MVP $84,$00
C0/EB29:	E03E23  	CPX #$233E
C0/EB2C:	202041  	JSR $4120
C0/EB2F:	4100    	EOR ($00,X)
C0/EB31:	0000    	BRK #$00
C0/EB33:	E0FCAF  	CPX #$AFFC
C0/EB36:	A3A2    	LDA $A2,S
C0/EB38:	0000    	BRK #$00
C0/EB3A:	0000    	BRK #$00
C0/EB3C:	0000    	BRK #$00
C0/EB3E:	C7FC    	CMP [$FC]
C0/EB40:	0000    	BRK #$00
C0/EB42:	0000    	BRK #$00
C0/EB44:	0000    	BRK #$00
C0/EB46:	F71F    	SBC [$1F],Y
C0/EB48:	07FF    	ORA [$FF]
C0/EB4A:	FFFF1F3F	SBC $3F1FFF,X
C0/EB4E:	7FF70080	ADC $8000F7,X
C0/EB52:	C0E0F0  	CPY #$F0E0
C0/EB55:	78      	SEI 
C0/EB56:	3C1E00  	BIT $001E,X
C0/EB59:	80C0    	BRA $EB1B
C0/EB5B:	302F    	BMI $EB8C
C0/EB5D:	242C    	BIT $2C
C0/EB5F:	28      	PLP 
C0/EB60:	0000    	BRK #$00
C0/EB62:	0000    	BRK #$00
C0/EB64:	C0785F  	CPY #$5F78
C0/EB67:	217C    	AND ($7C,X)
C0/EB69:	F0E0    	BEQ $EB4B
C0/EB6B:	80C0    	BRA $EB2D
C0/EB6D:	8000    	BRA $EB6F
C0/EB6F:	003D    	BRK #$3D
C0/EB71:	3707    	AND [$07],Y
C0/EB73:	0F0F0F0F	ORA $0F0F0F
C0/EB77:	0FFCFEFF	ORA $FFFEFC
C0/EB7B:	FFFFFCFC	SBC $FCFCFF,X
C0/EB7F:	BEF57D  	LDX $7DF5,Y
C0/EB82:	BDDFF3  	LDA $F3DF,X
C0/EB85:	FC3F03  	JSR ($033F,X)
C0/EB88:	890909  	BIT #$0909
C0/EB8B:	9A      	TXS 
C0/EB8C:	9EDE38  	STZ $38DE,X
C0/EB8F:	EE0801  	INC $0108
C0/EB92:	0102    	ORA ($02,X)
C0/EB94:	040C    	TSB $0C
C0/EB96:	18      	CLC
C0/EB97:	208181  	JSR $8181
C0/EB9A:	0101    	ORA ($01,X)
C0/EB9C:	0202    	COP #$02
C0/EB9E:	0202    	COP #$02
C0/EBA0:	A22223  	LDX #$2322
C0/EBA3:	1313    	ORA ($13,S),Y
C0/EBA5:	1111    	ORA ($11),Y
C0/EBA7:	119C    	ORA ($9C),Y
C0/EBA9:	1A      	INC A
C0/EBAA:	CB      	WAI 
C0/EBAB:	2321    	AND $21,S
C0/EBAD:	392505  	AND $0525,Y
C0/EBB0:	1212    	ORA ($12)
C0/EBB2:	3321    	AND ($21,S),Y
C0/EBB4:	2141    	AND ($41,X)
C0/EBB6:	4141    	EOR ($41,X)
C0/EBB8:	1212    	ORA ($12)
C0/EBBA:	3321    	AND ($21,S),Y
C0/EBBC:	2163    	AND ($63,X)
C0/EBBE:	4243    	WDM #$43
C0/EBC0:	E7FF    	SBC [$FF]
C0/EBC2:	FFFF7F7F	SBC $7F7FFF,X
C0/EBC6:	F7F7    	SBC [$F7],Y
C0/EBC8:	EFFFFFFF	SBC $FFFFFF
C0/EBCC:	E0FCFC  	CPX #$FCFC
C0/EBCF:	FCF8FF  	JSR ($FFF8,X)
C0/EBD2:	FFFFFFFF	SBC $FFFFFF,X
C0/EBD6:	FFFF0000	SBC $0000FF,X
C0/EBDA:	0001    	BRK #$01
C0/EBDC:	0307    	ORA $07,S
C0/EBDE:	0F3F0307	ORA $07033F
C0/EBE2:	CFFFFFFF	CMP $FFFFFF
C0/EBE6:	FFFF01FF	SBC $FF01FF,X
C0/EBEA:	FFFFFFFF	SBC $FFFFFF,X
C0/EBEE:	FFFF0080	SBC $8000FF,X
C0/EBF2:	F0F8    	BEQ $EBEC
C0/EBF4:	F8      	SED 
C0/EBF5:	F8      	SED 
C0/EBF6:	FCFCFF  	JSR ($FFFC,X)
C0/EBF9:	FFD0F8F8	SBC $F8F8D0,X
C0/EBFD:	E8      	INX
C0/EBFE:	E8      	INX
C0/EBFF:	E8      	INX
C0/EC00:	E0E0F8  	CPX #$F8E0
C0/EC03:	F8      	SED 
C0/EC04:	FFFFFFFF	SBC $FFFFFF,X
C0/EC08:	0000    	BRK #$00
C0/EC0A:	0000    	BRK #$00
C0/EC0C:	C0C0C0  	CPY #$C0C0
C0/EC0F:	F0FF    	BEQ $EC10
C0/EC11:	FFFFFFFF	SBC $FFFFFF,X
C0/EC15:	7F7C18FF	ADC $FF187C,X
C0/EC19:	FFFFFFFF	SBC $FFFFFF,X
C0/EC1D:	FEFC30  	INC $30FC,X
C0/EC20:	FFFFFFFF	SBC $FFFFFF,X
C0/EC24:	FFFFFFFF	SBC $FFFFFF,X
C0/EC28:	FFFFFFFF	SBC $FFFFFF,X
C0/EC2C:	FFFFFFFF	SBC $FFFFFF,X
C0/EC30:	FFFFFFFF	SBC $FFFFFF,X
C0/EC34:	FFFFFFFF	SBC $FFFFFF,X
C0/EC38:	FFFFFFFF	SBC $FFFFFF,X
C0/EC3C:	FFFFFFFF	SBC $FFFFFF,X
C0/EC40:	FFFFFFFF	SBC $FFFFFF,X
C0/EC44:	FFFFFFFF	SBC $FFFFFF,X
C0/EC48:	FFFFFFFF	SBC $FFFFFF,X
C0/EC4C:	FFFFFFFF	SBC $FFFFFF,X
C0/EC50:	FFFFFFFF	SBC $FFFFFF,X
C0/EC54:	FFFFFFFF	SBC $FFFFFF,X
C0/EC58:	FFFFFFFF	SBC $FFFFFF,X
C0/EC5C:	FFFFFFFF	SBC $FFFFFF,X
C0/EC60:	FFFFFFFF	SBC $FFFFFF,X
C0/EC64:	FFFFFFFF	SBC $FFFFFF,X
C0/EC68:	FFFFFFFF	SBC $FFFFFF,X
C0/EC6C:	FFFFFFFF	SBC $FFFFFF,X
C0/EC70:	FFFFFFFF	SBC $FFFFFF,X
C0/EC74:	FFFFFFFF	SBC $FFFFFF,X
C0/EC78:	FFFFFFFF	SBC $FFFFFF,X
C0/EC7C:	FFFFFFFF	SBC $FFFFFF,X
C0/EC80:	FFFFFFFF	SBC $FFFFFF,X
C0/EC84:	FFFFFFFF	SBC $FFFFFF,X
C0/EC88:	FFFFFFFF	SBC $FFFFFF,X
C0/EC8C:	FFFFFFFF	SBC $FFFFFF,X
C0/EC90:	FFFFFFFF	SBC $FFFFFF,X
C0/EC94:	FFFFFFFF	SBC $FFFFFF,X
C0/EC98:	FFFFFFFF	SBC $FFFFFF,X
C0/EC9C:	FFFFFFFF	SBC $FFFFFF,X
C0/ECA0:	FFFFFFFF	SBC $FFFFFF,X
C0/ECA4:	FFFFFFFF	SBC $FFFFFF,X
C0/ECA8:	FFFFFFFF	SBC $FFFFFF,X
C0/ECAC:	FFFFFFFF	SBC $FFFFFF,X
C0/ECB0:	FFFFFFFF	SBC $FFFFFF,X
C0/ECB4:	FFFFFFFF	SBC $FFFFFF,X
C0/ECB8:	FFFFFFFF	SBC $FFFFFF,X
C0/ECBC:	FFFFFFFF	SBC $FFFFFF,X
C0/ECC0:	FFFFFFFF	SBC $FFFFFF,X
C0/ECC4:	FFFFFFFF	SBC $FFFFFF,X
C0/ECC8:	FFFFFFFF	SBC $FFFFFF,X
C0/ECCC:	FFFFFFFF	SBC $FFFFFF,X
C0/ECD0:	FFFFFFFF	SBC $FFFFFF,X
C0/ECD4:	FFFFFFFF	SBC $FFFFFF,X
C0/ECD8:	FFFFFFFF	SBC $FFFFFF,X
C0/ECDC:	FFFFFFFF	SBC $FFFFFF,X
C0/ECE0:	FFFFFFFF	SBC $FFFFFF,X
C0/ECE4:	FFFFFFFF	SBC $FFFFFF,X
C0/ECE8:	FFFFFFFF	SBC $FFFFFF,X
C0/ECEC:	FFFFFFFF	SBC $FFFFFF,X
C0/ECF0:	FFFFFFFF	SBC $FFFFFF,X
C0/ECF4:	FFFFFFFF	SBC $FFFFFF,X
C0/ECF8:	FFFFFFFF	SBC $FFFFFF,X
C0/ECFC:	FFFFFFFF	SBC $FFFFFF,X
C0/ED00:	FFFFFFFF	SBC $FFFFFF,X
C0/ED04:	FFFFFFFF	SBC $FFFFFF,X
C0/ED08:	FFFFFFFF	SBC $FFFFFF,X
C0/ED0C:	FFFFFFFF	SBC $FFFFFF,X
C0/ED10:	FFFFFFFF	SBC $FFFFFF,X
C0/ED14:	FFFFFFFF	SBC $FFFFFF,X
C0/ED18:	FFFFFFFF	SBC $FFFFFF,X
C0/ED1C:	FFFFFFFF	SBC $FFFFFF,X
C0/ED20:	FFFFFFFF	SBC $FFFFFF,X
C0/ED24:	FFFFFFFF	SBC $FFFFFF,X
C0/ED28:	FFFFFFFF	SBC $FFFFFF,X
C0/ED2C:	FFFFFFFF	SBC $FFFFFF,X
C0/ED30:	FFFFFFFF	SBC $FFFFFF,X
C0/ED34:	FFFFFFFF	SBC $FFFFFF,X
C0/ED38:	FFFFFFFF	SBC $FFFFFF,X
C0/ED3C:	FFFFFFFF	SBC $FFFFFF,X
C0/ED40:	FFFFFFFF	SBC $FFFFFF,X
C0/ED44:	FFFFFFFF	SBC $FFFFFF,X
C0/ED48:	FFFFFFFF	SBC $FFFFFF,X
C0/ED4C:	FFFFFFFF	SBC $FFFFFF,X
C0/ED50:	FFFFFFFF	SBC $FFFFFF,X
C0/ED54:	FFFFFFFF	SBC $FFFFFF,X
C0/ED58:	FFFFFFFF	SBC $FFFFFF,X
C0/ED5C:	FFFFFFFF	SBC $FFFFFF,X
C0/ED60:	FFFFFFFF	SBC $FFFFFF,X
C0/ED64:	FFFFFFFF	SBC $FFFFFF,X
C0/ED68:	FFFFFFFF	SBC $FFFFFF,X
C0/ED6C:	FFFFFFFF	SBC $FFFFFF,X
C0/ED70:	FFFFFFFF	SBC $FFFFFF,X
C0/ED74:	FFFFFFFF	SBC $FFFFFF,X
C0/ED78:	FFFFFFFF	SBC $FFFFFF,X
C0/ED7C:	FFFFFFFF	SBC $FFFFFF,X
C0/ED80:	FFFFFFFF	SBC $FFFFFF,X
C0/ED84:	FFFFFFFF	SBC $FFFFFF,X
C0/ED88:	FFFFFFFF	SBC $FFFFFF,X
C0/ED8C:	FFFFFFFF	SBC $FFFFFF,X
C0/ED90:	FFFFFFFF	SBC $FFFFFF,X
C0/ED94:	FFFFFFFF	SBC $FFFFFF,X
C0/ED98:	FFFFFFFF	SBC $FFFFFF,X
C0/ED9C:	FFFFFFFF	SBC $FFFFFF,X
C0/EDA0:	FFFFFFFF	SBC $FFFFFF,X
C0/EDA4:	FFFFFFFF	SBC $FFFFFF,X
C0/EDA8:	FFFFFFFF	SBC $FFFFFF,X
C0/EDAC:	FFFFFFFF	SBC $FFFFFF,X
C0/EDB0:	FFFFFFFF	SBC $FFFFFF,X
C0/EDB4:	FFFFFFFF	SBC $FFFFFF,X
C0/EDB8:	FFFFFFFF	SBC $FFFFFF,X
C0/EDBC:	FFFFFFFF	SBC $FFFFFF,X
C0/EDC0:	FFFFFFFF	SBC $FFFFFF,X
C0/EDC4:	FFFFFFFF	SBC $FFFFFF,X
C0/EDC8:	FFFFFFFF	SBC $FFFFFF,X
C0/EDCC:	FFFFFFFF	SBC $FFFFFF,X
C0/EDD0:	FFFFFFFF	SBC $FFFFFF,X
C0/EDD4:	FFFFFFFF	SBC $FFFFFF,X
C0/EDD8:	FFFFFFFF	SBC $FFFFFF,X
C0/EDDC:	FFFFFFFF	SBC $FFFFFF,X
C0/EDE0:	FFFFFFFF	SBC $FFFFFF,X
C0/EDE4:	FFFFFFFF	SBC $FFFFFF,X
C0/EDE8:	FFFFFFFF	SBC $FFFFFF,X
C0/EDEC:	FFFFFFFF	SBC $FFFFFF,X
C0/EDF0:	FFFFFFFF	SBC $FFFFFF,X
C0/EDF4:	FFFFFFFF	SBC $FFFFFF,X
C0/EDF8:	FFFFFFFF	SBC $FFFFFF,X
C0/EDFC:	FFFFFFFF	SBC $FFFFFF,X
C0/EE00:	FFFFFFFF	SBC $FFFFFF,X
C0/EE04:	FFFFFFFF	SBC $FFFFFF,X
C0/EE08:	FFFFFFFF	SBC $FFFFFF,X
C0/EE0C:	FFFFFFFF	SBC $FFFFFF,X
C0/EE10:	FFFFFFFF	SBC $FFFFFF,X
C0/EE14:	FFFFFFFF	SBC $FFFFFF,X
C0/EE18:	FFFFFFFF	SBC $FFFFFF,X
C0/EE1C:	FFFFFFFF	SBC $FFFFFF,X
C0/EE20:	FFFFFFFF	SBC $FFFFFF,X
C0/EE24:	FFFFFFFF	SBC $FFFFFF,X
C0/EE28:	FFFFFFFF	SBC $FFFFFF,X
C0/EE2C:	FFFFFFFF	SBC $FFFFFF,X
C0/EE30:	FFFFFFFF	SBC $FFFFFF,X
C0/EE34:	FFFFFFFF	SBC $FFFFFF,X
C0/EE38:	FFFFFFFF	SBC $FFFFFF,X
C0/EE3C:	FFFFFFFF	SBC $FFFFFF,X
C0/EE40:	FFFFFFFF	SBC $FFFFFF,X
C0/EE44:	FFFFFFFF	SBC $FFFFFF,X
C0/EE48:	FFFFFFFF	SBC $FFFFFF,X
C0/EE4C:	FFFFFFFF	SBC $FFFFFF,X
C0/EE50:	FFFFFFFF	SBC $FFFFFF,X
C0/EE54:	FFFFFFFF	SBC $FFFFFF,X
C0/EE58:	FFFFFFFF	SBC $FFFFFF,X
C0/EE5C:	FFFFFFFF	SBC $FFFFFF,X
C0/EE60:	FFFFFFFF	SBC $FFFFFF,X
C0/EE64:	FFFFFFFF	SBC $FFFFFF,X
C0/EE68:	FFFFFFFF	SBC $FFFFFF,X
C0/EE6C:	FFFFFFFF	SBC $FFFFFF,X
C0/EE70:	FFFFFFFF	SBC $FFFFFF,X
C0/EE74:	FFFFFFFF	SBC $FFFFFF,X
C0/EE78:	FFFFFFFF	SBC $FFFFFF,X
C0/EE7C:	FFFFFFFF	SBC $FFFFFF,X
C0/EE80:	FFFFFFFF	SBC $FFFFFF,X
C0/EE84:	FFFFFFFF	SBC $FFFFFF,X
C0/EE88:	FFFFFFFF	SBC $FFFFFF,X
C0/EE8C:	FFFFFFFF	SBC $FFFFFF,X
C0/EE90:	FFFFFFFF	SBC $FFFFFF,X
C0/EE94:	FFFFFFFF	SBC $FFFFFF,X
C0/EE98:	FFFFFFFF	SBC $FFFFFF,X
C0/EE9C:	FFFFFFFF	SBC $FFFFFF,X
C0/EEA0:	0000    	BRK #$00
C0/EEA2:	0000    	BRK #$00
C0/EEA4:	0000    	BRK #$00
C0/EEA6:	0000    	BRK #$00
C0/EEA8:	08      	PHP 
C0/EEA9:	0008    	BRK #$08
C0/EEAB:	0000    	BRK #$00
C0/EEAD:	0060    	BRK #$60
C0/EEAF:	0010    	BRK #$10
C0/EEB1:	0018    	BRK #$18
C0/EEB3:	0000    	BRK #$00
C0/EEB5:	0000    	BRK #$00
C0/EEB7:	0020    	BRK #$20
C0/EEB9:	0028    	BRK #$28
C0/EEBB:	0000    	BRK #$00
C0/EEBD:	0000    	BRK #$00
C0/EEBF:	0030    	BRK #$30
C0/EEC1:	0038    	BRK #$38
C0/EEC3:	0000    	BRK #$00
C0/EEC5:	0000    	BRK #$00
C0/EEC7:	0008    	BRK #$08
C0/EEC9:	0040    	BRK #$40
C0/EECB:	0068    	BRK #$68
C0/EECD:	0000    	BRK #$00
C0/EECF:	0048    	BRK #$48
C0/EED1:	0050    	BRK #$50
C0/EED3:	0070    	BRK #$70
C0/EED5:	0078    	BRK #$78
C0/EED7:	0058    	BRK #$58
C0/EED9:	0058    	BRK #$58
C0/EEDB:	0080    	BRK #$80
C0/EEDD:	0080    	BRK #$80
C0/EEDF:	0008    	BRK #$08
C0/EEE1:	0008    	BRK #$08
C0/EEE3:	00D8    	BRK #$D8
C0/EEE5:	0008    	BRK #$08
C0/EEE7:	0008    	BRK #$08
C0/EEE9:	0088    	BRK #$88
C0/EEEB:	0088    	BRK #$88
C0/EEED:	0090    	BRK #$90
C0/EEEF:	0008    	BRK #$08
C0/EEF1:	0088    	BRK #$88
C0/EEF3:	0008    	BRK #$08
C0/EEF5:	0090    	BRK #$90
C0/EEF7:	0090    	BRK #$90
C0/EEF9:	0008    	BRK #$08
C0/EEFB:	0008    	BRK #$08
C0/EEFD:	0008    	BRK #$08
C0/EEFF:	0098    	BRK #$98
C0/EF01:	00A0    	BRK #$A0
C0/EF03:	0000    	BRK #$00
C0/EF05:	0000    	BRK #$00
C0/EF07:	00A8    	BRK #$A8
C0/EF09:	00B0    	BRK #$B0
C0/EF0B:	0000    	BRK #$00
C0/EF0D:	0000    	BRK #$00
C0/EF0F:	00B8    	BRK #$B8
C0/EF11:	00C0    	BRK #$C0
C0/EF13:	00E0    	BRK #$E0
C0/EF15:	0000    	BRK #$00
C0/EF17:	00C8    	BRK #$C8
C0/EF19:	00D0    	BRK #$D0
C0/EF1B:	00E8    	BRK #$E8
C0/EF1D:	00F0    	BRK #$F0
C0/EF1F:	00F8    	BRK #$F8
C0/EF21:	0008    	BRK #$08
C0/EF23:	0060    	BRK #$60
C0/EF25:	0108    	ORA ($08,X)
C0/EF27:	0000    	BRK #$00
C0/EF29:	0108    	ORA ($08,X)
C0/EF2B:	0168    	ORA ($68,X)
C0/EF2D:	0170    	ORA ($70,X)
C0/EF2F:	0110    	ORA ($10,X)
C0/EF31:	0118    	ORA ($18,X)
C0/EF33:	0178    	ORA ($78,X)
C0/EF35:	0180    	ORA ($80,X)
C0/EF37:	0120    	ORA ($20,X)
C0/EF39:	0128    	ORA ($28,X)
C0/EF3B:	0108    	ORA ($08,X)
C0/EF3D:	0008    	BRK #$08
C0/EF3F:	0030    	BRK #$30
C0/EF41:	0138    	ORA ($38,X)
C0/EF43:	0108    	ORA ($08,X)
C0/EF45:	0008    	BRK #$08
C0/EF47:	0040    	BRK #$40
C0/EF49:	0108    	ORA ($08,X)
C0/EF4B:	0040    	BRK #$40
C0/EF4D:	0108    	ORA ($08,X)
C0/EF4F:	0048    	BRK #$48
C0/EF51:	0148    	ORA ($48,X)
C0/EF53:	0100    	ORA ($00,X)
C0/EF55:	0000    	BRK #$00
C0/EF57:	0050    	BRK #$50
C0/EF59:	0158    	ORA ($58,X)
C0/EF5B:	0100    	ORA ($00,X)
C0/EF5D:	0088    	BRK #$88
C0/EF5F:	0158    	ORA ($58,X)
C0/EF61:	0190    	ORA ($90,X)
C0/EF63:	01D8    	ORA ($D8,X)
C0/EF65:	0100    	ORA ($00,X)
C0/EF67:	0008    	BRK #$08
C0/EF69:	0008    	BRK #$08
C0/EF6B:	00E0    	BRK #$E0
C0/EF6D:	01E8    	ORA ($E8,X)
C0/EF6F:	0198    	ORA ($98,X)
C0/EF71:	01A0    	ORA ($A0,X)
C0/EF73:	0108    	ORA ($08,X)
C0/EF75:	0008    	BRK #$08
C0/EF77:	0000    	BRK #$00
C0/EF79:	0000    	BRK #$00
C0/EF7B:	00F0    	BRK #$F0
C0/EF7D:	01F8    	ORA ($F8,X)
C0/EF7F:	01A8    	ORA ($A8,X)
C0/EF81:	01B0    	ORA ($B0,X)
C0/EF83:	0100    	ORA ($00,X)
C0/EF85:	0208    	COP #$08
C0/EF87:	02B8    	COP #$B8
C0/EF89:	01C0    	ORA ($C0,X)
C0/EF8B:	0110    	ORA ($10,X)
C0/EF8D:	0218    	COP #$18
C0/EF8F:	02C8    	COP #$C8
C0/EF91:	01D0    	ORA ($D0,X)
C0/EF93:	0110    	ORA ($10,X)
C0/EF95:	0220    	COP #$20
C0/EF97:	0208    	COP #$08
C0/EF99:	0008    	BRK #$08
C0/EF9B:	0008    	BRK #$08
C0/EF9D:	0028    	BRK #$28
C0/EF9F:	0230    	COP #$30
C0/EFA1:	0200    	COP #$00
C0/EFA3:	0000    	BRK #$00
C0/EFA5:	0000    	BRK #$00
C0/EFA7:	0000    	BRK #$00
C0/EFA9:	0038    	BRK #$38
C0/EFAB:	0238    	COP #$38
C0/EFAD:	0208    	COP #$08
C0/EFAF:	0000    	BRK #$00
C0/EFB1:	0000    	BRK #$00
C0/EFB3:	0038    	BRK #$38
C0/EFB5:	0208    	COP #$08
C0/EFB7:	0040    	BRK #$40
C0/EFB9:	0248    	COP #$48
C0/EFBB:	0208    	COP #$08
C0/EFBD:	0008    	BRK #$08
C0/EFBF:	0000    	BRK #$00
C0/EFC1:	0000    	BRK #$00
C0/EFC3:	0008    	BRK #$08
C0/EFC5:	0008    	BRK #$08
C0/EFC7:	0000    	BRK #$00
C0/EFC9:	0038    	BRK #$38
C0/EFCB:	0208    	COP #$08
C0/EFCD:	0008    	BRK #$08
C0/EFCF:	0050    	BRK #$50
C0/EFD1:	0208    	COP #$08
C0/EFD3:	0060    	BRK #$60
C0/EFD5:	0208    	COP #$08
C0/EFD7:	0008    	BRK #$08
C0/EFD9:	0058    	BRK #$58
C0/EFDB:	0268    	COP #$68
C0/EFDD:	0200    	COP #$00
C0/EFDF:	0068    	BRK #$68
C0/EFE1:	0270    	COP #$70
C0/EFE3:	0200    	COP #$00
C0/EFE5:	0000    	BRK #$00
C0/EFE7:	0078    	BRK #$78
C0/EFE9:	0280    	COP #$80
C0/EFEB:	0200    	COP #$00
C0/EFED:	0000    	BRK #$00
C0/EFEF:	0088    	BRK #$88
C0/EFF1:	0208    	COP #$08
C0/EFF3:	0000    	BRK #$00
C0/EFF5:	00D8    	BRK #$D8
C0/EFF7:	0290    	COP #$90
C0/EFF9:	0298    	COP #$98
C0/EFFB:	02E0    	COP #$E0
C0/EFFD:	02E8    	COP #$E8
C0/EFFF:	02A0    	COP #$A0
C0/F001:	02A8    	COP #$A8
C0/F003:	02F0    	COP #$F0
C0/F005:	02F8    	COP #$F8
C0/F007:	02B0    	COP #$B0
C0/F009:	02B8    	COP #$B8
C0/F00B:	0200    	COP #$00
C0/F00D:	0000    	BRK #$00
C0/F00F:	00C0    	BRK #$C0
C0/F011:	02C8    	COP #$C8
C0/F013:	0200    	COP #$00
C0/F015:	0308    	ORA $08,S
C0/F017:	0300    	ORA $00,S
C0/F019:	00D0    	BRK #$D0
C0/F01B:	0200    	COP #$00
C0/F01D:	0010    	BRK #$10
C0/F01F:	0318    	ORA $18,S
C0/F021:	0300    	ORA $00,S
C0/F023:	0000    	BRK #$00
C0/F025:	0000    	BRK #$00
C0/F027:	0020    	BRK #$20
C0/F029:	0300    	ORA $00,S
C0/F02B:	0000    	BRK #$00
C0/F02D:	0000    	BRK #$00
C0/F02F:	0000    	BRK #$00
C0/F031:	0028    	BRK #$28
C0/F033:	0300    	ORA $00,S
C0/F035:	0000    	BRK #$00
C0/F037:	0000    	BRK #$00
C0/F039:	0030    	BRK #$30
C0/F03B:	0300    	ORA $00,S
C0/F03D:	0000    	BRK #$00
C0/F03F:	0090    	BRK #$90
C0/F041:	0038    	BRK #$38
C0/F043:	0308    	ORA $08,S
C0/F045:	0008    	BRK #$08
C0/F047:	0008    	BRK #$08
C0/F049:	0040    	BRK #$40
C0/F04B:	0360    	ORA $60,S
C0/F04D:	0368    	ORA $68,S
C0/F04F:	0348    	ORA $48,S
C0/F051:	0350    	ORA $50,S
C0/F053:	0370    	ORA $70,S
C0/F055:	0378    	ORA $78,S
C0/F057:	0308    	ORA $08,S
C0/F059:	0058    	BRK #$58
C0/F05B:	0308    	ORA $08,S
C0/F05D:	0070    	BRK #$70
C0/F05F:	0380    	ORA $80,S
C0/F061:	0308    	ORA $08,S
C0/F063:	0000    	BRK #$00
C0/F065:	0080    	BRK #$80
C0/F067:	0388    	ORA $88,S
C0/F069:	0390    	ORA $90,S
C0/F06B:	0300    	ORA $00,S
C0/F06D:	0000    	BRK #$00
C0/F06F:	0050    	BRK #$50
C0/F071:	0308    	ORA $08,S
C0/F073:	00A8    	BRK #$A8
C0/F075:	0308    	ORA $08,S
C0/F077:	0060    	BRK #$60
C0/F079:	0060    	BRK #$60
C0/F07B:	0000    	BRK #$00
C0/F07D:	0000    	BRK #$00
C0/F07F:	00F8    	BRK #$F8
C0/F081:	0008    	BRK #$08
C0/F083:	00B0    	BRK #$B0
C0/F085:	0308    	ORA $08,S
C0/F087:	0008    	BRK #$08
C0/F089:	0008    	BRK #$08
C0/F08B:	0008    	BRK #$08
C0/F08D:	00B8    	BRK #$B8
C0/F08F:	0308    	ORA $08,S
C0/F091:	0008    	BRK #$08
C0/F093:	0008    	BRK #$08
C0/F095:	00C0    	BRK #$C0
C0/F097:	0398    	ORA $98,S
C0/F099:	03A0    	ORA $A0,S
C0/F09B:	03C8    	ORA $C8,S
C0/F09D:	0300    	ORA $00,S
C0/F09F:	00D0    	BRK #$D0
C0/F0A1:	03D8    	ORA $D8,S
C0/F0A3:	0338    	ORA $38,S
C0/F0A5:	0420    	TSB $20
C0/F0A7:	0300    	ORA $00,S
C0/F0A9:	00E0    	BRK #$E0
C0/F0AB:	0300    	ORA $00,S
C0/F0AD:	0040    	BRK #$40
C0/F0AF:	0400    	TSB $00
C0/F0B1:	00E8    	BRK #$E8
C0/F0B3:	0300    	ORA $00,S
C0/F0B5:	0000    	BRK #$00
C0/F0B7:	00F0    	BRK #$F0
C0/F0B9:	03F8    	ORA $F8,S
C0/F0BB:	0300    	ORA $00,S
C0/F0BD:	0000    	BRK #$00
C0/F0BF:	0000    	BRK #$00
C0/F0C1:	0400    	TSB $00
C0/F0C3:	0000    	BRK #$00
C0/F0C5:	0000    	BRK #$00
C0/F0C7:	0008    	BRK #$08
C0/F0C9:	0410    	TSB $10
C0/F0CB:	0448    	TSB $48
C0/F0CD:	0450    	TSB $50
C0/F0CF:	0418    	TSB $18
C0/F0D1:	0420    	TSB $20
C0/F0D3:	0458    	TSB $58
C0/F0D5:	0460    	TSB $60
C0/F0D7:	0428    	TSB $28
C0/F0D9:	0430    	TSB $30
C0/F0DB:	0400    	TSB $00
C0/F0DD:	0000    	BRK #$00
C0/F0DF:	0068    	BRK #$68
C0/F0E1:	0408    	TSB $08
C0/F0E3:	00A8    	BRK #$A8
C0/F0E5:	0468    	TSB $68
C0/F0E7:	0408    	TSB $08
C0/F0E9:	0008    	BRK #$08
C0/F0EB:	0008    	BRK #$08
C0/F0ED:	0068    	BRK #$68
C0/F0EF:	0470    	TSB $70
C0/F0F1:	0478    	TSB $78
C0/F0F3:	0408    	TSB $08
C0/F0F5:	0008    	BRK #$08
C0/F0F7:	0080    	BRK #$80
C0/F0F9:	0488    	TSB $88
C0/F0FB:	0400    	TSB $00
C0/F0FD:	0000    	BRK #$00
C0/F0FF:	0090    	BRK #$90
C0/F101:	0498    	TSB $98
C0/F103:	04B0    	TSB $B0
C0/F105:	0400    	TSB $00
C0/F107:	0000    	BRK #$00
C0/F109:	0000    	BRK #$00
C0/F10B:	0008    	BRK #$08
C0/F10D:	0008    	BRK #$08
C0/F10F:	0028    	BRK #$28
C0/F111:	0208    	COP #$08
C0/F113:	0008    	BRK #$08
C0/F115:	0008    	BRK #$08
C0/F117:	0028    	BRK #$28
C0/F119:	02A0    	COP #$A0
C0/F11B:	0408    	TSB $08
C0/F11D:	0008    	BRK #$08
C0/F11F:	0008    	BRK #$08
C0/F121:	0008    	BRK #$08
C0/F123:	0008    	BRK #$08
C0/F125:	00E0    	BRK #$E0
C0/F127:	0400    	TSB $00
C0/F129:	00B8    	BRK #$B8
C0/F12B:	0400    	TSB $00
C0/F12D:	00E8    	BRK #$E8
C0/F12F:	0400    	TSB $00
C0/F131:	0000    	BRK #$00
C0/F133:	0000    	BRK #$00
C0/F135:	00F0    	BRK #$F0
C0/F137:	0408    	TSB $08
C0/F139:	0008    	BRK #$08
C0/F13B:	0008    	BRK #$08
C0/F13D:	00F8    	BRK #$F8
C0/F13F:	04C0    	TSB $C0
C0/F141:	04C8    	TSB $C8
C0/F143:	0400    	TSB $00
C0/F145:	0508    	ORA $08
C0/F147:	0500    	ORA $00
C0/F149:	00D0    	BRK #$D0
C0/F14B:	0400    	TSB $00
C0/F14D:	0000    	BRK #$00
C0/F14F:	00D8    	BRK #$D8
C0/F151:	0408    	TSB $08
C0/F153:	0008    	BRK #$08
C0/F155:	0008    	BRK #$08
C0/F157:	0008    	BRK #$08
C0/F159:	0000    	BRK #$00
C0/F15B:	0108    	ORA ($08,X)
C0/F15D:	0010    	BRK #$10
C0/F15F:	0518    	ORA $18
C0/F161:	0520    	ORA $20
C0/F163:	0568    	ORA $68
C0/F165:	0570    	ORA $70
C0/F167:	0528    	ORA $28
C0/F169:	0508    	ORA $08
C0/F16B:	0078    	BRK #$78
C0/F16D:	0508    	ORA $08
C0/F16F:	0008    	BRK #$08
C0/F171:	0030    	BRK #$30
C0/F173:	0580    	ORA $80
C0/F175:	0588    	ORA $88
C0/F177:	05B8    	ORA $B8
C0/F179:	04B8    	TSB $B8
C0/F17B:	04E8    	TSB $E8
C0/F17D:	04E8    	TSB $E8
C0/F17F:	04B8    	TSB $B8
C0/F181:	0438    	TSB $38
C0/F183:	05E8    	ORA $E8
C0/F185:	0490    	TSB $90
C0/F187:	0500    	ORA $00
C0/F189:	0040    	BRK #$40
C0/F18B:	0500    	ORA $00
C0/F18D:	0098    	BRK #$98
C0/F18F:	0548    	ORA $48
C0/F191:	0550    	ORA $50
C0/F193:	05A0    	ORA $A0
C0/F195:	05A8    	ORA $A8
C0/F197:	0558    	ORA $58
C0/F199:	0560    	ORA $60
C0/F19B:	0500    	ORA $00
C0/F19D:	0000    	BRK #$00
C0/F19F:	00B0    	BRK #$B0
C0/F1A1:	0508    	ORA $08
C0/F1A3:	0000    	BRK #$00
C0/F1A5:	00E0    	BRK #$E0
C0/F1A7:	0508    	ORA $08
C0/F1A9:	00B8    	BRK #$B8
C0/F1AB:	0508    	ORA $08
C0/F1AD:	00E8    	BRK #$E8
C0/F1AF:	05C0    	ORA $C0
C0/F1B1:	0508    	ORA $08
C0/F1B3:	00F0    	BRK #$F0
C0/F1B5:	05F8    	ORA $F8
C0/F1B7:	05C8    	ORA $C8
C0/F1B9:	05D0    	ORA $D0
C0/F1BB:	0500    	ORA $00
C0/F1BD:	0608    	ASL $08
C0/F1BF:	06D0    	ASL $D0
C0/F1C1:	05D0    	ORA $D0
C0/F1C3:	0508    	ORA $08
C0/F1C5:	0608    	ASL $08
C0/F1C7:	0600    	ASL $00
C0/F1C9:	0000    	BRK #$00
C0/F1CB:	0010    	BRK #$10
C0/F1CD:	0618    	ASL $18
C0/F1CF:	06D8    	ASL $D8
C0/F1D1:	0508    	ORA $08
C0/F1D3:	0020    	BRK #$20
C0/F1D5:	0608    	ASL $08
C0/F1D7:	0008    	BRK #$08
C0/F1D9:	0008    	BRK #$08
C0/F1DB:	0008    	BRK #$08
C0/F1DD:	0028    	BRK #$28
C0/F1DF:	0608    	ASL $08
C0/F1E1:	0030    	BRK #$30
C0/F1E3:	0608    	ASL $08
C0/F1E5:	0000    	BRK #$00
C0/F1E7:	0138    	ORA ($38,X)
C0/F1E9:	0640    	ASL $40
C0/F1EB:	0600    	ASL $00
C0/F1ED:	0098    	BRK #$98
C0/F1EF:	0648    	ASL $48
C0/F1F1:	0650    	ASL $50
C0/F1F3:	0600    	ASL $00
C0/F1F5:	0000    	BRK #$00
C0/F1F7:	0058    	BRK #$58
C0/F1F9:	0660    	ASL $60
C0/F1FB:	06A0    	ASL $A0
C0/F1FD:	06A8    	ASL $A8
C0/F1FF:	0668    	ASL $68
C0/F201:	0670    	ASL $70
C0/F203:	0600    	ASL $00
C0/F205:	0000    	BRK #$00
C0/F207:	0008    	BRK #$08
C0/F209:	0078    	BRK #$78
C0/F20B:	06B0    	ASL $B0
C0/F20D:	0600    	ASL $00
C0/F20F:	0008    	BRK #$08
C0/F211:	0080    	BRK #$80
C0/F213:	0680    	ASL $80
C0/F215:	0620    	ASL $20
C0/F217:	0388    	ORA $88,S
C0/F219:	0690    	ASL $90
C0/F21B:	0600    	ASL $00
C0/F21D:	0000    	BRK #$00
C0/F21F:	00B8    	BRK #$B8
C0/F221:	06C0    	ASL $C0
C0/F223:	0600    	ASL $00
C0/F225:	0000    	BRK #$00
C0/F227:	0008    	BRK #$08
C0/F229:	0008    	BRK #$08
C0/F22B:	0020    	BRK #$20
C0/F22D:	0728    	ORA [$28]
C0/F22F:	07C8    	ORA [$C8]
C0/F231:	06D0    	ASL $D0
C0/F233:	0600    	ASL $00
C0/F235:	0000    	BRK #$00
C0/F237:	0008    	BRK #$08
C0/F239:	00D8    	BRK #$D8
C0/F23B:	0630    	ASL $30
C0/F23D:	0720    	ORA [$20]
C0/F23F:	03E0    	ORA $E0,S
C0/F241:	06E8    	ASL $E8
C0/F243:	0600    	ASL $00
C0/F245:	0000    	BRK #$00
C0/F247:	00F0    	BRK #$F0
C0/F249:	06F8    	ASL $F8
C0/F24B:	0638    	ASL $38
C0/F24D:	0700    	ORA [$00]
C0/F24F:	0000    	BRK #$00
C0/F251:	0708    	ORA [$08]
C0/F253:	0700    	ORA [$00]
C0/F255:	0000    	BRK #$00
C0/F257:	0010    	BRK #$10
C0/F259:	0718    	ORA [$18]
C0/F25B:	0740    	ORA [$40]
C0/F25D:	0718    	ORA [$18]
C0/F25F:	0708    	ORA [$08]
C0/F261:	0048    	BRK #$48
C0/F263:	0788    	ORA [$88]
C0/F265:	0790    	ORA [$90]
C0/F267:	0750    	ORA [$50]
C0/F269:	0758    	ORA [$58]
C0/F26B:	0700    	ORA [$00]
C0/F26D:	0000    	BRK #$00
C0/F26F:	0008    	BRK #$08
C0/F271:	0060    	BRK #$60
C0/F273:	0708    	ORA [$08]
C0/F275:	0098    	BRK #$98
C0/F277:	0708    	ORA [$08]
C0/F279:	0068    	BRK #$68
C0/F27B:	0708    	ORA [$08]
C0/F27D:	00A0    	BRK #$A0
C0/F27F:	0770    	ORA [$70]
C0/F281:	07D0    	ORA [$D0]
C0/F283:	00A8    	BRK #$A8
C0/F285:	0708    	ORA [$08]
C0/F287:	0070    	BRK #$70
C0/F289:	0108    	ORA ($08,X)
C0/F28B:	00B0    	BRK #$B0
C0/F28D:	0708    	ORA [$08]
C0/F28F:	0040    	BRK #$40
C0/F291:	0108    	ORA ($08,X)
C0/F293:	01B8    	ORA ($B8,X)
C0/F295:	0770    	ORA [$70]
C0/F297:	0178    	ORA ($78,X)
C0/F299:	0780    	ORA [$80]
C0/F29B:	07C0    	ORA [$C0]
C0/F29D:	07C8    	ORA [$C8]
C0/F29F:	07D0    	ORA [$D0]
C0/F2A1:	07D8    	ORA [$D8]
C0/F2A3:	0710    	ORA [$10]
C0/F2A5:	08      	PHP 
C0/F2A6:	0000    	BRK #$00
C0/F2A8:	E007E8  	CPX #$E807
C0/F2AB:	0718    	ORA [$18]
C0/F2AD:	08      	PHP 
C0/F2AE:	78      	SEI 
C0/F2AF:	0108    	ORA ($08,X)
C0/F2B1:	0008    	BRK #$08
C0/F2B3:	0008    	BRK #$08
C0/F2B5:	00F0    	BRK #$F0
C0/F2B7:	0708    	ORA [$08]
C0/F2B9:	00F0    	BRK #$F0
C0/F2BB:	0720    	ORA [$20]
C0/F2BD:	08      	PHP 
C0/F2BE:	28      	PLP 
C0/F2BF:	08      	PHP 
C0/F2C0:	08      	PHP 
C0/F2C1:	0008    	BRK #$08
C0/F2C3:	0030    	BRK #$30
C0/F2C5:	08      	PHP 
C0/F2C6:	38      	SEC 
C0/F2C7:	08      	PHP 
C0/F2C8:	08      	PHP 
C0/F2C9:	00F8    	BRK #$F8
C0/F2CB:	0708    	ORA [$08]
C0/F2CD:	0040    	BRK #$40
C0/F2CF:	08      	PHP 
C0/F2D0:	08      	PHP 
C0/F2D1:	0000    	BRK #$00
C0/F2D3:	08      	PHP 
C0/F2D4:	48      	PHA
C0/F2D5:	08      	PHP 
C0/F2D6:	0000    	BRK #$00
C0/F2D8:	08      	PHP 
C0/F2D9:	0008    	BRK #$08
C0/F2DB:	08      	PHP 
C0/F2DC:	200828  	JSR $2808
C0/F2DF:	08      	PHP 
C0/F2E0:	08      	PHP 
C0/F2E1:	0008    	BRK #$08
C0/F2E3:	00B8    	BRK #$B8
C0/F2E5:	08      	PHP 
C0/F2E6:	C00850  	CPY #$5008
C0/F2E9:	08      	PHP 
C0/F2EA:	58      	CLI 
C0/F2EB:	08      	PHP 
C0/F2EC:	C8      	INY 
C0/F2ED:	08      	PHP 
C0/F2EE:	08      	PHP 
C0/F2EF:	0060    	BRK #$60
C0/F2F1:	08      	PHP 
C0/F2F2:	68      	PLA
C0/F2F3:	08      	PHP 
C0/F2F4:	D008    	BNE $F2FE
C0/F2F6:	D8      	CLD 
C0/F2F7:	08      	PHP 
C0/F2F8:	7008    	BVS $F302
C0/F2FA:	78      	SEI 
C0/F2FB:	08      	PHP 
C0/F2FC:	E008E8  	CPX #$E808
C0/F2FF:	08      	PHP 
C0/F300:	8008    	BRA $F30A
C0/F302:	88      	DEY 
C0/F303:	08      	PHP 
C0/F304:	F008    	BEQ $F30E
C0/F306:	F8      	SED 
C0/F307:	08      	PHP 
C0/F308:	9008    	BCC $F312
C0/F30A:	98      	TYA
C0/F30B:	08      	PHP 
C0/F30C:	0009    	BRK #$09
C0/F30E:	08      	PHP 
C0/F30F:	09A008  	ORA #$08A0
C0/F312:	A00810  	LDY #$1008
C0/F315:	091809  	ORA #$0918
C0/F318:	A8      	TAY
C0/F319:	08      	PHP 
C0/F31A:	B008    	BCS $F324
C0/F31C:	200928  	JSR $2809
C0/F31F:	090800  	ORA #$0008
C0/F322:	08      	PHP 
C0/F323:	0050    	BRK #$50
C0/F325:	090800  	ORA #$0008
C0/F328:	3009    	BMI $F333
C0/F32A:	9007    	BCC $F333
C0/F32C:	0000    	BRK #$00
C0/F32E:	0000    	BRK #$00
C0/F330:	0000    	BRK #$00
C0/F332:	0000    	BRK #$00
C0/F334:	0000    	BRK #$00
C0/F336:	1007    	BPL $F33F
C0/F338:	08      	PHP 
C0/F339:	0000    	BRK #$00
C0/F33B:	0108    	ORA ($08,X)
C0/F33D:	0040    	BRK #$40
C0/F33F:	0100    	ORA ($00,X)
C0/F341:	0000    	BRK #$00
C0/F343:	0058    	BRK #$58
C0/F345:	090000  	ORA #$0000
C0/F348:	38      	SEC 
C0/F349:	094009  	ORA #$0940
C0/F34C:	0000    	BRK #$00
C0/F34E:	0000    	BRK #$00
C0/F350:	3000    	BMI $F352
C0/F352:	48      	PHA
C0/F353:	090000  	ORA #$0000
C0/F356:	0000    	BRK #$00
C0/F358:	08      	PHP 
C0/F359:	0008    	BRK #$08
C0/F35B:	0060    	BRK #$60
C0/F35D:	096809  	ORA #$0968
C0/F360:	08      	PHP 
C0/F361:	0008    	BRK #$08
C0/F363:	0008    	BRK #$08
C0/F365:	00F0    	BRK #$F0
C0/F367:	0010    	BRK #$10
C0/F369:	0118    	ORA ($18,X)
C0/F36B:	0178    	ORA ($78,X)
C0/F36D:	0180    	ORA ($80,X)
C0/F36F:	0108    	ORA ($08,X)
C0/F371:	0040    	BRK #$40
C0/F373:	0108    	ORA ($08,X)
C0/F375:	0040    	BRK #$40
C0/F377:	0108    	ORA ($08,X)
C0/F379:	00A8    	BRK #$A8
C0/F37B:	0408    	TSB $08
C0/F37D:	0008    	BRK #$08
C0/F37F:	0070    	BRK #$70
C0/F381:	097809  	ORA #$0978
C0/F384:	08      	PHP 
C0/F385:	0008    	BRK #$08
C0/F387:	0008    	BRK #$08
C0/F389:	0008    	BRK #$08
C0/F38B:	0008    	BRK #$08
C0/F38D:	0008    	BRK #$08
C0/F38F:	0008    	BRK #$08
C0/F391:	0008    	BRK #$08
C0/F393:	0008    	BRK #$08
C0/F395:	0008    	BRK #$08
C0/F397:	0008    	BRK #$08
C0/F399:	0008    	BRK #$08
C0/F39B:	0008    	BRK #$08
C0/F39D:	0008    	BRK #$08
C0/F39F:	0008    	BRK #$08
C0/F3A1:	0008    	BRK #$08
C0/F3A3:	0008    	BRK #$08
C0/F3A5:	0008    	BRK #$08
C0/F3A7:	0008    	BRK #$08
C0/F3A9:	0008    	BRK #$08
C0/F3AB:	0008    	BRK #$08
C0/F3AD:	0008    	BRK #$08
C0/F3AF:	0008    	BRK #$08
C0/F3B1:	0008    	BRK #$08
C0/F3B3:	0008    	BRK #$08
C0/F3B5:	0008    	BRK #$08
C0/F3B7:	0008    	BRK #$08
C0/F3B9:	0008    	BRK #$08
C0/F3BB:	0008    	BRK #$08
C0/F3BD:	0008    	BRK #$08
C0/F3BF:	0008    	BRK #$08
C0/F3C1:	0008    	BRK #$08
C0/F3C3:	0008    	BRK #$08
C0/F3C5:	0008    	BRK #$08
C0/F3C7:	0008    	BRK #$08
C0/F3C9:	0008    	BRK #$08
C0/F3CB:	0008    	BRK #$08
C0/F3CD:	0008    	BRK #$08
C0/F3CF:	0008    	BRK #$08
C0/F3D1:	0008    	BRK #$08
C0/F3D3:	0008    	BRK #$08
C0/F3D5:	0008    	BRK #$08
C0/F3D7:	0008    	BRK #$08
C0/F3D9:	0008    	BRK #$08
C0/F3DB:	0008    	BRK #$08
C0/F3DD:	0008    	BRK #$08
C0/F3DF:	0008    	BRK #$08
C0/F3E1:	0008    	BRK #$08
C0/F3E3:	0008    	BRK #$08
C0/F3E5:	0008    	BRK #$08
C0/F3E7:	0008    	BRK #$08
C0/F3E9:	0008    	BRK #$08
C0/F3EB:	0008    	BRK #$08
C0/F3ED:	0008    	BRK #$08
C0/F3EF:	0008    	BRK #$08
C0/F3F1:	0008    	BRK #$08
C0/F3F3:	0008    	BRK #$08
C0/F3F5:	0008    	BRK #$08
C0/F3F7:	0008    	BRK #$08
C0/F3F9:	0008    	BRK #$08
C0/F3FB:	0008    	BRK #$08
C0/F3FD:	0008    	BRK #$08
C0/F3FF:	0008    	BRK #$08
C0/F401:	0008    	BRK #$08
C0/F403:	0008    	BRK #$08
C0/F405:	0008    	BRK #$08
C0/F407:	0008    	BRK #$08
C0/F409:	0008    	BRK #$08
C0/F40B:	0008    	BRK #$08
C0/F40D:	0008    	BRK #$08
C0/F40F:	0008    	BRK #$08
C0/F411:	0008    	BRK #$08
C0/F413:	0008    	BRK #$08
C0/F415:	0008    	BRK #$08
C0/F417:	0008    	BRK #$08
C0/F419:	0008    	BRK #$08
C0/F41B:	0008    	BRK #$08
C0/F41D:	0008    	BRK #$08
C0/F41F:	0008    	BRK #$08
C0/F421:	0008    	BRK #$08
C0/F423:	0008    	BRK #$08
C0/F425:	0008    	BRK #$08
C0/F427:	0008    	BRK #$08
C0/F429:	0008    	BRK #$08
C0/F42B:	0008    	BRK #$08
C0/F42D:	0008    	BRK #$08
C0/F42F:	0008    	BRK #$08
C0/F431:	0008    	BRK #$08
C0/F433:	0008    	BRK #$08
C0/F435:	0008    	BRK #$08
C0/F437:	0008    	BRK #$08
C0/F439:	0008    	BRK #$08
C0/F43B:	0008    	BRK #$08
C0/F43D:	0008    	BRK #$08
C0/F43F:	0008    	BRK #$08
C0/F441:	0008    	BRK #$08
C0/F443:	0008    	BRK #$08
C0/F445:	0008    	BRK #$08
C0/F447:	0008    	BRK #$08
C0/F449:	0008    	BRK #$08
C0/F44B:	0008    	BRK #$08
C0/F44D:	0008    	BRK #$08
C0/F44F:	0008    	BRK #$08
C0/F451:	0008    	BRK #$08
C0/F453:	0008    	BRK #$08
C0/F455:	0008    	BRK #$08
C0/F457:	0008    	BRK #$08
C0/F459:	0008    	BRK #$08
C0/F45B:	0008    	BRK #$08
C0/F45D:	0008    	BRK #$08
C0/F45F:	0008    	BRK #$08
C0/F461:	0008    	BRK #$08
C0/F463:	0008    	BRK #$08
C0/F465:	0008    	BRK #$08
C0/F467:	0008    	BRK #$08
C0/F469:	0008    	BRK #$08
C0/F46B:	0008    	BRK #$08
C0/F46D:	0008    	BRK #$08
C0/F46F:	0008    	BRK #$08
C0/F471:	0008    	BRK #$08
C0/F473:	0008    	BRK #$08
C0/F475:	0008    	BRK #$08
C0/F477:	0008    	BRK #$08
C0/F479:	0008    	BRK #$08
C0/F47B:	0008    	BRK #$08
C0/F47D:	0008    	BRK #$08
C0/F47F:	0008    	BRK #$08
C0/F481:	0008    	BRK #$08
C0/F483:	0008    	BRK #$08
C0/F485:	0008    	BRK #$08
C0/F487:	0008    	BRK #$08
C0/F489:	0008    	BRK #$08
C0/F48B:	0008    	BRK #$08
C0/F48D:	0008    	BRK #$08
C0/F48F:	0008    	BRK #$08
C0/F491:	0008    	BRK #$08
C0/F493:	0008    	BRK #$08
C0/F495:	0008    	BRK #$08
C0/F497:	0008    	BRK #$08
C0/F499:	0008    	BRK #$08
C0/F49B:	0008    	BRK #$08
C0/F49D:	0008    	BRK #$08
C0/F49F:	0000    	BRK #$00
C0/F4A1:	0015    	BRK #$15
C0/F4A3:	0037    	BRK #$37
C0/F4A5:	0067    	BRK #$67
C0/F4A7:	009F    	BRK #$9F
C0/F4A9:	00F5    	BRK #$F5
C0/F4AB:	001D    	BRK #$1D
C0/F4AD:	016E    	ORA ($6E,X)
C0/F4AF:	01BB    	ORA ($BB,X)
C0/F4B1:	01F2    	ORA ($F2,X)
C0/F4B3:	010A    	ORA ($0A,X)
C0/F4B5:	022A    	COP #$2A
C0/F4B7:	026D    	COP #$6D
C0/F4B9:	02BC    	COP #$BC
C0/F4BB:	02D8    	COP #$D8
C0/F4BD:	0235    	COP #$35
C0/F4BF:	0366    	ORA $66,S
C0/F4C1:	037E    	ORA $7E,S
C0/F4C3:	03A0    	ORA $A0,S
C0/F4C5:	03D3    	ORA $D3,S
C0/F4C7:	0302    	ORA $02,S
C0/F4C9:	041F    	TSB $1F
C0/F4CB:	045D    	TSB $5D
C0/F4CD:	04A6    	TSB $A6
C0/F4CF:	04DE    	TSB $DE
C0/F4D1:	0401    	TSB $01
C0/F4D3:	0529    	ORA $29
C0/F4D5:	0548    	ORA $48
C0/F4D7:	0574    	ORA $74
C0/F4D9:	05BF    	ORA $BF
C0/F4DB:	05EF    	ORA $EF
C0/F4DD:	051A    	ORA $1A
C0/F4DF:	0642    	ASL $42
C0/F4E1:	0667    	ASL $67
C0/F4E3:	06BD    	ASL $BD
C0/F4E5:	06D9    	ASL $D9
C0/F4E7:	06EE    	ASL $EE
C0/F4E9:	0603    	ASL $03
C0/F4EB:	0718    	ORA [$18]
C0/F4ED:	072D    	ORA [$2D]
C0/F4EF:	0742    	ORA [$42]
C0/F4F1:	0757    	ORA [$57]
C0/F4F3:	076C    	ORA [$6C]
C0/F4F5:	0781    	ORA [$81]
C0/F4F7:	0796    	ORA [$96]
C0/F4F9:	07FF    	ORA [$FF]
C0/F4FB:	FFFFFFFF	SBC $FFFFFF,X
C0/F4FF:	FF150001	SBC $010015,X
C0/F503:	FFDEFF00	SBC $00FFDE,X
C0/F507:	F8      	SED 
C0/F508:	22F844F8	JSR $F844F8
C0/F50C:	66F8    	ROR $F8
C0/F50E:	88      	DEY 
C0/F50F:	F8      	SED 
C0/F510:	AA      	TAX
C0/F511:	F8      	SED 
C0/F512:	00CC    	BRK #$CC
C0/F514:	F022    	BEQ $F538
C0/F516:	002F    	BRK #$2F
C0/F518:	0006    	BRK #$06
C0/F51A:	07FF    	ORA [$FF]
C0/F51C:	E1CF    	SBC ($CF,X)
C0/F51E:	00F8    	BRK #$F8
C0/F520:	57EE    	EOR [$EE],Y
C0/F522:	A714    	LDA [$14]
C0/F524:	22F8E167	JSR $67E1F8
C0/F528:	02E1    	COP #$E1
C0/F52A:	7F0432F8	ADC $F83204,X
C0/F52E:	89F8FC  	BIT #$FCF8
C0/F531:	0700    	ORA [$00]
C0/F533:	1CF891  	TRB $91F8
C0/F536:	D030    	BNE $F568
C0/F538:	007F    	BRK #$7F
C0/F53A:	0001    	BRK #$01
C0/F53C:	0203    	COP #$03
C0/F53E:	0405    	TSB $05
C0/F540:	FFE4FF5C	SBC $5CFFE4,X
C0/F544:	06F8    	ASL $F8
C0/F546:	1660    	ASL $60,X
C0/F548:	0608    	ASL $08
C0/F54A:	4616    	LSR $16
C0/F54C:	100A    	BPL $F558
C0/F54E:	1600    	ASL $00,X
C0/F550:	854A    	STA $4A
C0/F552:	1618    	ASL $18,X
C0/F554:	0A      	ASL A
C0/F555:	442052  	MVP $20,$52
C0/F558:	F8      	SED 
C0/F559:	74F8    	STZ $F8,X
C0/F55B:	7B      	TDC 
C0/F55C:	18      	CLC
C0/F55D:	0000    	BRK #$00
C0/F55F:	18      	CLC
C0/F560:	F03A    	BEQ $F59C
C0/F562:	18      	CLC
C0/F563:	C4F8    	CPY $F8
C0/F565:	9620    	STX $20,Y
C0/F567:	38      	SEC 
C0/F568:	00FF    	BRK #$FF
C0/F56A:	0008    	BRK #$08
C0/F56C:	090A0B  	ORA #$0B0A
C0/F56F:	933C    	STA ($3C,S),Y
C0/F571:	FF02E597	SBC $97E502,X
C0/F575:	00E5    	BRK #$E5
C0/F577:	9F11F833	STA $33F811,X
C0/F57B:	F8      	SED 
C0/F57C:	EFAFFBFF	SBC $FFFBAF
C0/F580:	6578    	ADC $78
C0/F582:	F542    	SBC $42,X
C0/F584:	4C2002  	JMP $0220
C0/F587:	4C2048  	JMP $4820
C0/F58A:	44FFFF  	MVP $FF,$FF
C0/F58D:	F6B3    	INC $B3,X
C0/F58F:	0004    	BRK #$04
C0/F591:	08      	PHP 
C0/F592:	4C2848  	JMP $4828
C0/F595:	4648    	LSR $48
C0/F597:	0403    	TSB $03
C0/F599:	08      	PHP 
C0/F59A:	06BA    	ASL $BA
C0/F59C:	307D    	BMI $F61B
C0/F59E:	C8      	INY 
C0/F59F:	5600    	LSR $00,X
C0/F5A1:	FF009596	SBC $969500,X
C0/F5A5:	9798    	STA [$98],Y
C0/F5A7:	999A7B  	STA $7B9A,Y
C0/F5AA:	7F7C7D7E	ADC $7E7D7C,X
C0/F5AE:	7F818FFF	ADC $FF8F81,X
C0/F5B2:	EC0739  	CPX $3907
C0/F5B5:	02EC    	COP #$EC
C0/F5B7:	0FF11F42	ORA $421FF1
C0/F5BB:	FF00F13F	SBC $3FF100,X
C0/F5BF:	07F8    	ORA [$F8]
C0/F5C1:	4FFFFF26	EOR $26FFFF
C0/F5C5:	28      	PLP 
C0/F5C6:	F13F    	SBC ($3F),Y
C0/F5C8:	FD172A  	SBC $2A17,X
C0/F5CB:	0A      	ASL A
C0/F5CC:	F8      	SED 
C0/F5CD:	2FFF0204	AND $0402FF
C0/F5D1:	4256    	WDM #$56
C0/F5D3:	58      	CLI 
C0/F5D4:	063F    	ASL $3F
C0/F5D6:	80FD    	BRA $F5D5
C0/F5D8:	5FF508EC	EOR $EC08F5,X
C0/F5DC:	0748    	ORA [$48]
C0/F5DE:	3F402000	AND $002040,X
C0/F5E2:	0024    	BRK #$24
C0/F5E4:	FD603F  	SBC $3F60,X
C0/F5E7:	500A    	BVC $F5F3
C0/F5E9:	FF000022	SBC $220000,X
C0/F5ED:	0C0075  	TSB $7500
C0/F5F0:	E08460  	CPX #$6084
C0/F5F3:	FD0F28  	SBC $280F,X
C0/F5F6:	001F    	BRK #$1F
C0/F5F8:	0003    	BRK #$03
C0/F5FA:	0405    	TSB $05
C0/F5FC:	FFE2FF04	SBC $04FFE2,X
C0/F600:	F8      	SED 
C0/F601:	1250    	ORA ($50)
C0/F603:	A702    	LDA [$02]
C0/F605:	0442    	TSB $42
C0/F607:	3310    	AND ($10,S),Y
C0/F609:	1208    	ORA ($08)
C0/F60B:	0612    	ASL $12
C0/F60D:	0046    	BRK #$46
C0/F60F:	2012F8  	JSR $F812
C0/F612:	66F8    	ROR $F8
C0/F614:	88      	DEY 
C0/F615:	F8      	SED 
C0/F616:	AA      	TAX
C0/F617:	F8      	SED 
C0/F618:	C4B0    	CPY $B0
C0/F61A:	00DF    	BRK #$DF
C0/F61C:	205100  	JSR $0051
C0/F61F:	FF008089	SBC $898000,X
C0/F623:	828384  	BRL $7AA9
C0/F626:	8586    	STA $86
C0/F628:	FF8788FF	SBC $FF8887,X
C0/F62C:	8A      	TXA
C0/F62D:	8B      	PHB
C0/F62E:	8C8D8E  	STY $8E8D
C0/F631:	09FFEE  	ORA #$EEFF
C0/F634:	FF028002	SBC $028002,X
C0/F638:	02F8    	COP #$F8
C0/F63A:	46F8    	LSR $F8
C0/F63C:	68      	PLA
C0/F63D:	F8      	SED 
C0/F63E:	7B      	TDC 
C0/F63F:	78      	SEI 
C0/F640:	FD007B  	SBC $7B00,X
C0/F643:	78      	SEI 
C0/F644:	0608    	ASL $08
C0/F646:	0A      	ASL A
C0/F647:	FF0C0EFD	SBC $FD0E0C,X
C0/F64B:	4E7B00  	LSR $007B
C0/F64E:	4A      	LSR A
C0/F64F:	48      	PHA
C0/F650:	464C    	LSR $4C
C0/F652:	FFFFFB20	SBC $20FBFF,X
C0/F656:	227B3062	JSR $62307B
C0/F65A:	60      	RTS
 
C0/F65B:	FFFF04DF	SBC $DF04FF,X
C0/F65F:	2628    	ROL $28
C0/F661:	2A      	ROL A
C0/F662:	2C2E7B  	BIT $7B2E
C0/F665:	08      	PHP 
C0/F666:	6C6A07  	JMP ($076A)
C0/F669:	68      	PLA
C0/F66A:	6644    	ROR $44
C0/F66C:	8D684D  	STA $4D68
C0/F66F:	00FF    	BRK #$FF
C0/F671:	0016    	BRK #$16
C0/F673:	1718    	ORA [$18],Y
C0/F675:	191A1B  	ORA $1B1A,Y
C0/F678:	1CD71D  	TRB $1DD7
C0/F67B:	1EFFE8  	ASL $E8FF,X
C0/F67E:	3700    	AND [$00],Y
C0/F680:	E8      	INX
C0/F681:	3FFF00CC	AND $CC00FF,X
C0/F685:	F207    	SBC ($07)
C0/F687:	FE0FFF  	INC $FF0F,X
C0/F68A:	02F3    	COP #$F3
C0/F68C:	47E8    	EOR [$E8]
C0/F68E:	3704    	AND [$04],Y
C0/F690:	0694    	ASL $94
C0/F692:	08      	PHP 
C0/F693:	88      	DEY 
C0/F694:	27A0    	AND [$A0]
C0/F696:	08      	PHP 
C0/F697:	08      	PHP 
C0/F698:	60      	RTS
 
C0/F699:	0A      	ASL A
C0/F69A:	27F8    	AND [$F8]
C0/F69C:	08      	PHP 
C0/F69D:	78      	SEI 
C0/F69E:	0C7AE8  	TSB $E87A
C0/F6A1:	1F4C6CB8	ORA $B86C4C,X
C0/F6A5:	0EFFFF  	ASL $FFFF
C0/F6A8:	4EE827  	LSR $27E8
C0/F6AB:	6F2060FF	ADC $FF6020
C0/F6AF:	62E81F  	PER $169A
C0/F6B2:	2262C500	JSR $00C562
C0/F6B6:	066C    	ASL $6C
C0/F6B8:	F8      	SED 
C0/F6B9:	FFFF3700	SBC $0037FF,X
C0/F6BD:	FF001F20	SBC $201F00,X
C0/F6C1:	22242521	JSR $212524
C0/F6C5:	38      	SEC 
C0/F6C6:	2B      	PLD 
C0/F6C7:	4DFFE7  	EOR $E7FF
C0/F6CA:	3F20E73F	AND $3FE720,X
C0/F6CE:	02E7    	COP #$E7
C0/F6D0:	47FE    	EOR [$FE]
C0/F6D2:	571F    	EOR [$1F],Y
C0/F6D4:	4E0000  	LSR $0000
C0/F6D7:	FF0EFEAF	SBC $AFFE0E,X
C0/F6DB:	32F8    	AND ($F8)
C0/F6DD:	54F858  	MVN $F8,$58
C0/F6E0:	76F8    	ROR $F8,X
C0/F6E2:	FEA7FD  	INC $FDA7,X
C0/F6E5:	6F0406FE	ADC $FE0604
C0/F6E9:	5F0CFE57	EOR $57FE0C,X
C0/F6ED:	0308    	ORA $08,S
C0/F6EF:	0A      	ASL A
C0/F6F0:	FE5F18  	INC $185F,X
C0/F6F3:	0003    	BRK #$03
C0/F6F5:	00FF    	BRK #$FF
C0/F6F7:	DF8FDE9F	CMP $9FDE8F,X
C0/F6FB:	09F82B  	ORA #$2BF8
C0/F6FE:	F8      	SED 
C0/F6FF:	4DF86F  	EOR $6FF8
C0/F702:	F8      	SED 
C0/F703:	0091    	BRK #$91
C0/F705:	F8      	SED 
C0/F706:	B3F8    	LDA ($F8,S),Y
C0/F708:	CCA820  	CPY $20A8
C0/F70B:	00BF    	BRK #$BF
C0/F70D:	0026    	BRK #$26
C0/F70F:	2728    	AND [$28]
C0/F711:	23FF    	AND $FF,S
C0/F713:	E3FF    	SBC $FF,S
C0/F715:	FFC100E5	SBC $E500C1,X
C0/F719:	FF29F84B	SBC $4BF829,X
C0/F71D:	F8      	SED 
C0/F71E:	6DF888  	ADC $88F8
C0/F721:	B8      	CLV 
C0/F722:	0406    	TSB $06
C0/F724:	0144    	ORA ($44,X)
C0/F726:	88      	DEY 
C0/F727:	F8      	SED 
C0/F728:	E8      	INX
C0/F729:	E743    	SBC [$43]
C0/F72B:	00FF    	BRK #$FF
C0/F72D:	0029    	BRK #$29
C0/F72F:	2A      	ROL A
C0/F730:	2B      	PLD 
C0/F731:	2C2F30  	BIT $302F
C0/F734:	31BF    	AND ($BF),Y
C0/F736:	322D    	AND ($2D)
C0/F738:	2E335E  	ROL $5E33
C0/F73B:	FFEB6F02	SBC $026FEB,X
C0/F73F:	1904EB  	ORA $EB04,Y
C0/F742:	7708    	ADC [$08],Y
C0/F744:	C04442  	CPY #$4244
C0/F747:	08      	PHP 
C0/F748:	F8      	SED 
C0/F749:	4DF8EB  	EOR $EBF8
C0/F74C:	1FCF0646	ORA $4606CF,X
C0/F750:	08      	PHP 
C0/F751:	28      	PLP 
C0/F752:	54F8EB  	MVN $F8,$EB
C0/F755:	570A    	EOR [$0A],Y
C0/F757:	4A      	LSR A
C0/F758:	7F0C0E20	ADC $200E0C,X
C0/F75C:	FFFF2262	SBC $6222FF,X
C0/F760:	EB      	XBA
C0/F761:	3736    	AND [$36],Y
C0/F763:	AB      	PLB
C0/F764:	1024    	BPL $F78A
C0/F766:	648D    	STZ $8D
C0/F768:	D8      	CLD 
C0/F769:	FF26EB4F	SBC $4FEB26,X
C0/F76D:	4F00FF00	EOR $00FF00
C0/F771:	3435    	BIT $35,X
C0/F773:	3637    	ROL $37,X
C0/F775:	38      	SEC 
C0/F776:	393ADF  	AND $DF3A,Y
C0/F779:	5255    	EOR ($55)
C0/F77B:	60      	RTS
 
C0/F77C:	4DFFEA  	EOR $EAFF
C0/F77F:	4F20FFFB	EOR $FBFF20
C0/F783:	FF60EA3F	SBC $3FEA60,X
C0/F787:	00FF    	BRK #$FF
C0/F789:	22246445	JSR $456424
C0/F78D:	62EA3F  	PER $377A
C0/F790:	020F    	COP #$0F
C0/F792:	5022    	BVC $F7B6
C0/F794:	F8      	SED 
C0/F795:	3CB004  	BIT $04B0,X
C0/F798:	EA      	NOP
C0/F799:	0785    	ORA [$85]
C0/F79B:	44EA47  	MVP $EA,$47
C0/F79E:	006B    	BRK #$6B
C0/F7A0:	2075F8  	JSR $F875
C0/F7A3:	97F8    	STA [$F8],Y
C0/F7A5:	FD3706  	SBC $0637,X
C0/F7A8:	6F084800	ADC $004808
C0/F7AC:	46EA    	LSR $EA
C0/F7AE:	0F0A4AA0	ORA $A04A0A
C0/F7B2:	68      	PLA
C0/F7B3:	050C    	ORA $0C
C0/F7B5:	EA      	NOP
C0/F7B6:	1706    	ORA [$06],Y
C0/F7B8:	C710    	CMP [$10]
C0/F7BA:	0108    	ORA ($08,X)
C0/F7BC:	1C0003  	TRB $0300
C0/F7BF:	00FF    	BRK #$FF
C0/F7C1:	DFDFDE27	CMP $27DEDF,X
C0/F7C5:	DEA7DE  	DEC $DEA7,X
C0/F7C8:	EF3BF85D	SBC $5DF83B
C0/F7CC:	F8      	SED 
C0/F7CD:	007F    	BRK #$7F
C0/F7CF:	F8      	SED 
C0/F7D0:	0350    	ORA $50,S
C0/F7D2:	DE87DD  	DEC $DD87,X
C0/F7D5:	6FDDCF5D	ADC $5DCFDD
C0/F7D9:	00FF    	BRK #$FF
C0/F7DB:	003D    	BRK #$3D
C0/F7DD:	3E3F40  	ROL $403F,X
C0/F7E0:	449248  	MVP $92,$48
C0/F7E3:	5F494A93	EOR $934A49,X
C0/F7E7:	94FF    	STY $FF,X
C0/F7E9:	EA      	NOP
C0/F7EA:	7F02EA5F	ADC $5FEA02,X
C0/F7EE:	5B      	TCD 
C0/F7EF:	0406    	TSB $06
C0/F7F1:	EA      	NOP
C0/F7F2:	5F0800EA	EOR $EA0008,X
C0/F7F6:	3F001D00	AND $001D00,X
C0/F7FA:	FC2808  	JSR ($0828,X)
C0/F7FD:	EA      	NOP
C0/F7FE:	270A    	AND [$0A]
C0/F800:	0000    	BRK #$00
C0/F802:	4A      	LSR A
C0/F803:	FF0CBCEA	SBC $EABC0C,X
C0/F807:	4F2C1000	EOR $00102C
C0/F80B:	0008    	BRK #$08
C0/F80D:	08      	PHP 
C0/F80E:	EA      	NOP
C0/F80F:	3742    	AND [$42],Y
C0/F811:	6C1D40  	JMP ($401D)
C0/F814:	EA      	NOP
C0/F815:	0F4644EA	ORA $EA4446
C0/F819:	5F00486E	EOR $6E4800,X
C0/F81D:	58      	CLI 
C0/F81E:	102C    	BPL $F84C
C0/F820:	40      	RTI
 
C0/F821:	8DA81D  	STA $1DA8
C0/F824:	108C    	BPL $F7B2
C0/F826:	68      	PLA
C0/F827:	26A9    	ROL $A9
C0/F829:	28      	PLP 
C0/F82A:	1D38C9  	ORA $C938,X
C0/F82D:	18      	CLC
C0/F82E:	0029    	BRK #$29
C0/F830:	101D    	BPL $F84F
C0/F832:	28      	PLP 
C0/F833:	AE1031  	LDX $3110
C0/F836:	00BF    	BRK #$BF
C0/F838:	004C    	BRK #$4C
C0/F83A:	4D4E4F  	EOR $4F4E
C0/F83D:	FFE3AF00	SBC $00AFE3,X
C0/F841:	68      	PLA
C0/F842:	F52F    	SBC $2F,X
C0/F844:	FC2F09  	JSR ($092F,X)
C0/F847:	D8      	CLD 
C0/F848:	00FB    	BRK #$FB
C0/F84A:	3702    	AND [$02],Y
C0/F84C:	4209    	WDM #$09
C0/F84E:	F8      	SED 
C0/F84F:	50E4    	BVC $F835
C0/F851:	B705    	LDA [$05],Y
C0/F853:	38      	SEC 
C0/F854:	0430    	TSB $30
C0/F856:	FC0704  	JSR ($0407,X)
C0/F859:	E34F    	SBC $4F,S
C0/F85B:	064F    	ASL $4F
C0/F85D:	E00108  	CPX #$0801
C0/F860:	696005  	ADC #$0560
C0/F863:	F8      	SED 
C0/F864:	FD2718  	SBC $1827,X
C0/F867:	0003    	BRK #$03
C0/F869:	00FF    	BRK #$FF
C0/F86B:	DFFFFBC7	CMP $C7FBFF,X
C0/F86F:	DEFF3E  	DEC $3EFF,X
C0/F872:	F8      	SED 
C0/F873:	60      	RTS
 
C0/F874:	F8      	SED 
C0/F875:	82F800  	BRL $F970
C0/F878:	A4F8    	LDY $F8
C0/F87A:	C6F8    	DEC $F8
C0/F87C:	18      	CLC
C0/F87D:	1022    	BPL $F8A1
C0/F87F:	002F    	BRK #$2F
C0/F881:	0005    	BRK #$05
C0/F883:	04FF    	TSB $FF
C0/F885:	E1CF    	SBC ($CF,X)
C0/F887:	00E1    	BRK #$E1
C0/F889:	D71B    	CMP [$1B],Y
C0/F88B:	F8      	SED 
C0/F88C:	48      	PHA
C0/F88D:	3DF8F2  	AND $F2F8,X
C0/F890:	57FE    	EOR [$FE],Y
C0/F892:	6F02E167	ADC $67E102
C0/F896:	E06742  	CPX #$4267
C0/F899:	4A      	LSR A
C0/F89A:	F8      	SED 
C0/F89B:	00BE    	BRK #$BE
C0/F89D:	F8      	SED 
C0/F89E:	5F503300	EOR $003350,X
C0/F8A2:	BF005009	LDA $095000,X
C0/F8A6:	0A      	ASL A
C0/F8A7:	0B      	PHD
C0/F8A8:	FFE34F00	SBC $004FE3,X
C0/F8AC:	A8      	TAY
C0/F8AD:	E357    	SBC $57,S
C0/F8AF:	FDFF14  	SBC $14FF,X
C0/F8B2:	98      	TYA
C0/F8B3:	02E3    	COP #$E3
C0/F8B5:	1742    	ORA [$42],Y
C0/F8B7:	E337    	SBC $37,S
C0/F8B9:	48      	PHA
C0/F8BA:	ED44E3  	SBC $E344
C0/F8BD:	0704    	ORA [$04]
C0/F8BF:	08      	PHP 
C0/F8C0:	E33F    	SBC $3F,S
C0/F8C2:	48      	PHA
C0/F8C3:	46FF    	LSR $FF
C0/F8C5:	0106    	ORA ($06,X)
C0/F8C7:	4C4065  	JMP $6540
C0/F8CA:	F8      	SED 
C0/F8CB:	87F8    	STA [$F8]
C0/F8CD:	9A      	TXS 
C0/F8CE:	78      	SEI 
C0/F8CF:	F0FF    	BEQ $F8D0
C0/F8D1:	AC682F  	LDY $2F68
C0/F8D4:	003F    	BRK #$3F
C0/F8D6:	0050    	BRK #$50
C0/F8D8:	090A0B  	ORA #$0B0A
C0/F8DB:	FFE3FF05	SBC $05FFE3,X
C0/F8DF:	F8      	SED 
C0/F8E0:	EA      	NOP
C0/F8E1:	1458    	TRB $58
C0/F8E3:	0214    	COP #$14
C0/F8E5:	1042    	BPL $F929
C0/F8E7:	1430    	TRB $30
C0/F8E9:	48      	PHA
C0/F8EA:	4444EF  	MVP $44,$EF
C0/F8ED:	FF040408	SBC $080404,X
C0/F8F1:	1438    	TRB $38
C0/F8F3:	48      	PHA
C0/F8F4:	4600    	LSR $00
C0/F8F6:	0106    	ORA ($06,X)
C0/F8F8:	4C4065  	JMP $6540
C0/F8FB:	F8      	SED 
C0/F8FC:	87F8    	STA [$F8]
C0/F8FE:	A9F8CB  	LDA #$CBF8
C0/F901:	F8      	SED 
C0/F902:	1D002F  	ORA $2F00,X
C0/F905:	0056    	BRK #$56
C0/F907:	04FF    	TSB $FF
C0/F909:	E1CF    	SBC ($CF,X)
C0/F90B:	00E1    	BRK #$E1
C0/F90D:	D71B    	CMP [$1B],Y
C0/F90F:	F8      	SED 
C0/F910:	00F2    	BRK #$F2
C0/F912:	57FE    	EOR [$FE],Y
C0/F914:	FF6CF8E1	SBC $E1F86C,X
C0/F918:	3FE0DFB6	AND $B6DFE0,X
C0/F91C:	F8      	SED 
C0/F91D:	3590    	AND $90,X
C0/F91F:	3E00FF  	ROL $FF00,X
C0/F922:	006D    	BRK #$6D
C0/F924:	6E6F70  	ROR $706F
C0/F927:	7271    	ADC ($71)
C0/F929:	73EB    	ADC ($EB,S),Y
C0/F92B:	74FF    	STZ $FF,X
C0/F92D:	E7A7    	SBC [$A7]
C0/F92F:	02E7    	COP #$E7
C0/F931:	1704    	ORA [$04],Y
C0/F933:	0608    	ASL $08
C0/F935:	9B      	TXY
C0/F936:	4644    	LSR $44
C0/F938:	E737    	SBC [$37]
C0/F93A:	0A      	ASL A
C0/F93B:	4A      	LSR A
C0/F93C:	E7AF    	SBC [$AF]
C0/F93E:	E76F    	SBC [$6F]
C0/F940:	42EA    	WDM #$EA
C0/F942:	E71F    	SBC [$1F]
C0/F944:	0C0CD0  	TSB $D00C
C0/F947:	08      	PHP 
C0/F948:	E717    	SBC [$17]
C0/F94A:	0E204E  	ASL $4E20
C0/F94D:	1000    	BPL $F94F
C0/F94F:	18      	CLC
C0/F950:	E707    	SBC [$07]
C0/F952:	0938E7  	ORA #$E738
C0/F955:	6F001BF8	ADC $F81B00
C0/F959:	B0F8    	BCS $F953
C0/F95B:	CCC049  	CPY $49C0
C0/F95E:	00FF    	BRK #$FF
C0/F960:	0057    	BRK #$57
C0/F962:	58      	CLI 
C0/F963:	59FF5B  	EOR $5BFF,Y
C0/F966:	5C5A7F61	JMP $617F5A
C0/F96A:	FFFFFF53	SBC $53FFFF,X
C0/F96E:	5154    	EOR ($54),Y
C0/F970:	E707    	SBC [$07]
C0/F972:	DEED3F  	DEC $3FED,X
C0/F975:	0EFFFF  	ASL $FFFF
C0/F978:	00ED    	BRK #$ED
C0/F97A:	3F28028C	AND $8C0228,X
C0/F97E:	FD47E7  	SBC $E747,X
C0/F981:	0704    	ORA [$04]
C0/F983:	06ED    	ASL $ED
C0/F985:	5705    	EOR [$05],Y
C0/F987:	08      	PHP 
C0/F988:	ED1F0A  	SBC $0A1F
C0/F98B:	FFFFFF0C	SBC $0CFFFF,X
C0/F98F:	FF4C0AFF	SBC $FF0A4C,X
C0/F993:	2A      	ROL A
C0/F994:	812C    	STA ($2C,X)
C0/F996:	1A      	INC A
C0/F997:	68      	PLA
C0/F998:	4A      	LSR A
C0/F999:	F8      	SED 
C0/F99A:	6CF88E  	JMP ($8EF8)
C0/F99D:	F8      	SED 
C0/F99E:	B0F8    	BCS $F998
C0/F9A0:	ED2F20  	SBC $202F
C0/F9A3:	00B9    	BRK #$B9
C0/F9A5:	78      	SEI 
C0/F9A6:	38      	SEC 
C0/F9A7:	00FF    	BRK #$FF
C0/F9A9:	0062    	BRK #$62
C0/F9AB:	635C    	ADC $5C,S
C0/F9AD:	6453    	STZ $53
C0/F9AF:	5FFFC2E5	EOR $E5C2FF,X
C0/F9B3:	A700    	LDA [$00]
C0/F9B5:	E5AF    	SBC $AF
C0/F9B7:	15F8    	ORA $F8,X
C0/F9B9:	37F8    	AND [$F8],Y
C0/F9BB:	E547    	SBC $47
C0/F9BD:	4A      	LSR A
C0/F9BE:	0A      	ASL A
C0/F9BF:	1643    	ASL $43,X
C0/F9C1:	B00C    	BCS $F9CF
C0/F9C3:	4CE57F  	JMP $7FE5		(? Location name loading function)

C0/F9C6:	025C    	COP #$5C
C0/F9C8:	38      	SEC 
C0/F9C9:	E50F    	SBC $0F
C0/F9CB:	6618    	ROR $18
C0/F9CD:	FD42E5  	SBC $E542,X
C0/F9D0:	0F0406FF	ORA $FF0604
C0/F9D4:	4608    	LSR $08
C0/F9D6:	440043  	MVP $00,$43
C0/F9D9:	B066    	BCS $FA41
C0/F9DB:	B8      	CLV 
C0/F9DC:	F627    	INC $27,X
C0/F9DE:	2300    	AND $00,S
C0/F9E0:	4F006602	EOR $026600
C0/F9E4:	FFE1FFF1	SBC $F1FFE1,X
C0/F9E8:	6700    	ADC [$00]
C0/F9EA:	F1FF    	SBC ($FF),Y
C0/F9EC:	33FF    	AND ($FF,S),Y
C0/F9EE:	0013    	BRK #$13
C0/F9F0:	F8      	SED 
C0/F9F1:	4A      	LSR A
C0/F9F2:	78      	SEI 
C0/F9F3:	0242    	COP #$42
C0/F9F5:	4A      	LSR A
C0/F9F6:	F8      	SED 
C0/F9F7:	8FF802A5	STA $A502F8
C0/F9FB:	9004    	BCC $FA01
C0/F9FD:	0FF83308	ORA $0833F8
C0/FA01:	28      	PLP 
C0/FA02:	009F    	BRK #$9F
C0/FA04:	000F    	BRK #$0F
C0/FA06:	265D    	ROL $5D
C0/FA08:	FFE2FFFA	SBC $FAFFE2,X
C0/FA0C:	A700    	LDA [$00]
C0/FA0E:	2A      	ROL A
C0/FA0F:	FA      	PLX
C0/FA10:	6704    	ADC [$04]
C0/FA12:	1460    	TRB $60
C0/FA14:	0613    	ASL $13
C0/FA16:	38      	SEC 
C0/FA17:	001C    	BRK #$1C
C0/FA19:	68      	PLA
C0/FA1A:	4A      	LSR A
C0/FA1B:	88      	DEY 
C0/FA1C:	0544    	ORA $44
C0/FA1E:	4A      	LSR A
C0/FA1F:	60      	RTS
 
C0/FA20:	464A    	LSR $4A
C0/FA22:	F8      	SED 
C0/FA23:	9EF8FF  	STZ $FFF8,X
C0/FA26:	FF11401F	SBC $1F4011,X
C0/FA2A:	00EF    	BRK #$EF
C0/FA2C:	0004    	BRK #$04
C0/FA2E:	03FF    	ORA $FF,S
C0/FA30:	E1A7    	SBC ($A7,X)
C0/FA32:	4244    	WDM #$44
C0/FA34:	0401    	TSB $01
C0/FA36:	02E1    	COP #$E1
C0/FA38:	AF14F836	LDA $36F814
C0/FA3C:	F8      	SED 
C0/FA3D:	58      	CLI 
C0/FA3E:	F8      	SED 
C0/FA3F:	7A      	PLY
C0/FA40:	F8      	SED 
C0/FA41:	9CF8BE  	STZ $BEF8
C0/FA44:	F8      	SED 
C0/FA45:	00E1    	BRK #$E1
C0/FA47:	572C    	EOR [$2C],Y
C0/FA49:	00BF    	BRK #$BF
C0/FA4B:	006C    	BRK #$6C
C0/FA4D:	7576    	ADC $76,X
C0/FA4F:	9CFFE3  	STZ $E3FF
C0/FA52:	5F08A0E3	EOR $E3A008,X
C0/FA56:	6701    	ADC [$01]
C0/FA58:	F8      	SED 
C0/FA59:	23F8    	AND $F8,S
C0/FA5B:	45F8    	EOR $F8
C0/FA5D:	E30F    	SBC $0F,S
C0/FA5F:	04E3    	TSB $E3
C0/FA61:	6706    	ADC [$06]
C0/FA63:	52E3    	EOR ($E3)
C0/FA65:	6744    	ADC [$44]
C0/FA67:	4A      	LSR A
C0/FA68:	F8      	SED 
C0/FA69:	E31F    	SBC $1F,S
C0/FA6B:	0093    	BRK #$93
C0/FA6D:	8002    	BRA $FA71
C0/FA6F:	93F8    	STA ($F8,S),Y
C0/FA71:	03FF    	ORA $FF,S
C0/FA73:	FF4B00FF	SBC $FF004B,X
C0/FA77:	003D    	BRK #$3D
C0/FA79:	3E3F40  	ROL $403F,X
C0/FA7C:	449248  	MVP $92,$48
C0/FA7F:	5F494A93	EOR $934A49,X
C0/FA83:	94FF    	STY $FF,X
C0/FA85:	EA      	NOP
C0/FA86:	7F02EA5F	ADC $5FEA02,X
C0/FA8A:	9B      	TXY
C0/FA8B:	0406    	TSB $06
C0/FA8D:	EA      	NOP
C0/FA8E:	5F0800EA	EOR $EA0008,X
C0/FA92:	3F1D0800	AND $00081D,X
C0/FA96:	D01D    	BNE $FAB5
C0/FA98:	48      	PHA
C0/FA99:	1D4023  	ORA $2340,X
C0/FA9C:	30EA    	BMI $FA88
C0/FA9E:	5F423960	EOR $603942,X
C0/FAA2:	4644    	LSR $44
C0/FAA4:	0A      	ASL A
C0/FAA5:	3B      	TSC 
C0/FAA6:	60      	RTS
 
C0/FAA7:	48      	PHA
C0/FAA8:	0050    	BRK #$50
C0/FAAA:	443870  	MVP $38,$70
C0/FAAD:	EA      	NOP
C0/FAAE:	7F1D1039	ADC $39101D,X
C0/FAB2:	68      	PLA
C0/FAB3:	0126    	ORA ($26,X)
C0/FAB5:	44781D  	MVP $78,$1D
C0/FAB8:	001D    	BRK #$1D
C0/FABA:	18      	CLC
C0/FABB:	1D38AE  	ORA $AE38,X
C0/FABE:	1030    	BPL $FAF0
C0/FAC0:	005F    	BRK #$5F
C0/FAC2:	003C    	BRK #$3C
C0/FAC4:	40      	RTI
 
C0/FAC5:	41FF    	EOR ($FF,X)
C0/FAC7:	E28F    	SEP #$8F
C0/FAC9:	00E2    	BRK #$E2
C0/FACB:	9792    	STA [$92],Y
C0/FACD:	E26F    	SEP #$6F
C0/FACF:	06ED    	ASL $ED
C0/FAD1:	47F7    	EOR [$F7]
C0/FAD3:	0704    	ORA [$04]
C0/FAD5:	EC4FF7  	CPX $F74F
C0/FAD8:	1F00A8F6	ORA $F6A800,X
C0/FADC:	673F    	ADC [$3F]
C0/FADE:	68      	PLA
C0/FADF:	59C846  	EOR $46C8,Y
C0/FAE2:	E26F    	SEP #$6F
C0/FAE4:	44E26F  	MVP $E2,$6F
C0/FAE7:	0200    	COP #$00
C0/FAE9:	59F8BF  	EOR $BFF8,Y
C0/FAEC:	F8      	SED 
C0/FAED:	EB      	XBA
C0/FAEE:	4F2B007F	EOR $7F002B
C0/FAF2:	0001    	BRK #$01
C0/FAF4:	4948    	EOR #$48
C0/FAF6:	4C9BFF  	JMP $FF9B
C0/FAF9:	E4FF    	CPX $FF
C0/FAFB:	3606    	ROL $06,X
C0/FAFD:	F8      	SED 
C0/FAFE:	FF0808B8	SBC $B80808,X
C0/FB02:	0200    	COP #$00
C0/FB04:	08      	PHP 
C0/FB05:	F8      	SED 
C0/FB06:	68      	PLA
C0/FB07:	F8      	SED 
C0/FB08:	168A    	ASL $8A,X
C0/FB0A:	F8      	SED 
C0/FB0B:	FF048C60	SBC $608C04,X
C0/FB0F:	0A      	ASL A
C0/FB10:	8C68BE  	STY $BE68
C0/FB13:	708C    	BVS $FAA1
C0/FB15:	28      	PLP 
C0/FB16:	0106    	ORA ($06,X)
C0/FB18:	E510    	SBC $10
C0/FB1A:	28      	PLP 
C0/FB1B:	00FF    	BRK #$FF
C0/FB1D:	0041    	BRK #$41
C0/FB1F:	4245    	WDM #$45
C0/FB21:	4668    	LSR $68
C0/FB23:	6943    	ADC #$43
C0/FB25:	7F616A6B	ADC $6B6A61,X
C0/FB29:	78      	SEI 
C0/FB2A:	797AFF  	ADC $FF7A,Y
C0/FB2D:	ECFF04  	CPX $04FF
C0/FB30:	0EF81A  	ASL $1AF8
C0/FB33:	40      	RTI
 
C0/FB34:	0032    	BRK #$32
C0/FB36:	9051    	BCC $FB89
C0/FB38:	F8      	SED 
C0/FB39:	73F8    	ADC ($F8,S),Y
C0/FB3B:	95F8    	STA $F8,X
C0/FB3D:	B7F8    	LDA [$F8],Y
C0/FB3F:	0028    	BRK #$28
C0/FB41:	88      	DEY 
C0/FB42:	2500    	AND $00
C0/FB44:	2F004142	AND $424100
C0/FB48:	FFE1F700	SBC $00F7E1,X
C0/FB4C:	E13F    	SBC ($3F,X)
C0/FB4E:	E02F52  	CPX #$522F
C0/FB51:	0328    	ORA $28,S
C0/FB53:	440340  	MVP $03,$40
C0/FB56:	E197    	SBC ($97,X)
C0/FB58:	02E1    	COP #$E1
C0/FB5A:	6704    	ADC [$04]
C0/FB5C:	E1FF    	SBC ($FF,X)
C0/FB5E:	0071    	BRK #$71
C0/FB60:	F8      	SED 
C0/FB61:	93F8    	STA ($F8,S),Y
C0/FB63:	B5F8    	LDA $F8,X
C0/FB65:	ED9F56  	SBC $569F
C0/FB68:	00FF    	BRK #$FF
C0/FB6A:	0080    	BRK #$80
C0/FB6C:	8982    	BIT #$82
C0/FB6E:	8384    	STA $84,S
C0/FB70:	8586    	STA $86
C0/FB72:	FF879190	SBC $909187,X
C0/FB76:	798B8C  	ADC $8C8B,Y
C0/FB79:	8D8E27  	STA $278E
C0/FB7C:	FF26FFF0	SBC $F0FF26,X
C0/FB80:	FF027002	SBC $027002,X
C0/FB84:	02F8    	COP #$F8
C0/FB86:	46F8    	LSR $F8
C0/FB88:	D668    	DEC $68,X
C0/FB8A:	F8      	SED 
C0/FB8B:	22626968	JSR $686962
C0/FB8F:	0069    	BRK #$69
C0/FB91:	78      	SEI 
C0/FB92:	0608    	ASL $08
C0/FB94:	DF0AFF0C	CMP $0CFF0A,X
C0/FB98:	0E4E69  	ASL $694E
C0/FB9B:	004A    	BRK #$4A
C0/FB9D:	48      	PHA
C0/FB9E:	9F464CFF	STA $FF4C46,X
C0/FBA2:	FF208428	SBC $288420,X
C0/FBA6:	6900    	ADC #$00
C0/FBA8:	60      	RTS
 
C0/FBA9:	FFFFFF04	SBC $04FFFF,X
C0/FBAD:	2628    	ROL $28
C0/FBAF:	2A      	ROL A
C0/FBB0:	2C2EBE  	BIT $BE2E
C0/FBB3:	6900    	ADC #$00
C0/FBB5:	246C    	BIT $6C
C0/FBB7:	6A      	ROR A
C0/FBB8:	68      	PLA
C0/FBB9:	6692    	ROR $92
C0/FBBB:	68      	PLA
C0/FBBC:	441C00  	MVP $1C,$00
C0/FBBF:	0700    	ORA [$00]
C0/FBC1:	95FF    	STA $FF,X
C0/FBC3:	E0FF02  	CPX #$02FF
C0/FBC6:	F8      	SED 
C0/FBC7:	24F8    	BIT $F8
C0/FBC9:	46F8    	LSR $F8
C0/FBCB:	68      	PLA
C0/FBCC:	F8      	SED 
C0/FBCD:	0E81A8  	ASL $A881
C0/FBD0:	02FF    	COP #$FF
C0/FBD2:	4281    	WDM #$81
C0/FBD4:	F8      	SED 
C0/FBD5:	C7F8    	CMP [$F8]
C0/FBD7:	CC0815  	CPY $1508
C0/FBDA:	0001    	BRK #$01
C0/FBDC:	FFDEFF00	SBC $00FFDE,X
C0/FBE0:	F8      	SED 
C0/FBE1:	22F844F8	JSR $F844F8
C0/FBE5:	66F8    	ROR $F8
C0/FBE7:	88      	DEY 
C0/FBE8:	F8      	SED 
C0/FBE9:	AA      	TAX
C0/FBEA:	F8      	SED 
C0/FBEB:	00CC    	BRK #$CC
C0/FBED:	F015    	BEQ $FC04
C0/FBEF:	0001    	BRK #$01
C0/FBF1:	FFDEFF00	SBC $00FFDE,X
C0/FBF5:	F8      	SED 
C0/FBF6:	22F844F8	JSR $F844F8
C0/FBFA:	66F8    	ROR $F8
C0/FBFC:	88      	DEY 
C0/FBFD:	F8      	SED 
C0/FBFE:	AA      	TAX
C0/FBFF:	F8      	SED 
C0/FC00:	00CC    	BRK #$CC
C0/FC02:	F015    	BEQ $FC19
C0/FC04:	0001    	BRK #$01
C0/FC06:	FFDEFF00	SBC $00FFDE,X
C0/FC0A:	F8      	SED 
C0/FC0B:	22F844F8	JSR $F844F8
C0/FC0F:	66F8    	ROR $F8
C0/FC11:	88      	DEY 
C0/FC12:	F8      	SED 
C0/FC13:	AA      	TAX
C0/FC14:	F8      	SED 
C0/FC15:	00CC    	BRK #$CC
C0/FC17:	F015    	BEQ $FC2E
C0/FC19:	0001    	BRK #$01
C0/FC1B:	FFDEFF00	SBC $00FFDE,X
C0/FC1F:	F8      	SED 
C0/FC20:	22F844F8	JSR $F844F8
C0/FC24:	66F8    	ROR $F8
C0/FC26:	88      	DEY 
C0/FC27:	F8      	SED 
C0/FC28:	AA      	TAX
C0/FC29:	F8      	SED 
C0/FC2A:	00CC    	BRK #$CC
C0/FC2C:	F015    	BEQ $FC43
C0/FC2E:	0001    	BRK #$01
C0/FC30:	FFDEFF00	SBC $00FFDE,X
C0/FC34:	F8      	SED 
C0/FC35:	22F844F8	JSR $F844F8
C0/FC39:	66F8    	ROR $F8
C0/FC3B:	88      	DEY 
C0/FC3C:	F8      	SED 
C0/FC3D:	AA      	TAX
C0/FC3E:	F8      	SED 
C0/FC3F:	00CC    	BRK #$CC
C0/FC41:	F015    	BEQ $FC58
C0/FC43:	0001    	BRK #$01
C0/FC45:	FFDEFF00	SBC $00FFDE,X
C0/FC49:	F8      	SED 
C0/FC4A:	22F844F8	JSR $F844F8
C0/FC4E:	66F8    	ROR $F8
C0/FC50:	88      	DEY 
C0/FC51:	F8      	SED 
C0/FC52:	AA      	TAX
C0/FC53:	F8      	SED 
C0/FC54:	00CC    	BRK #$CC
C0/FC56:	F015    	BEQ $FC6D
C0/FC58:	0001    	BRK #$01
C0/FC5A:	FFDEFF00	SBC $00FFDE,X
C0/FC5E:	F8      	SED 
C0/FC5F:	22F844F8	JSR $F844F8
C0/FC63:	66F8    	ROR $F8
C0/FC65:	88      	DEY 
C0/FC66:	F8      	SED 
C0/FC67:	AA      	TAX
C0/FC68:	F8      	SED 
C0/FC69:	00CC    	BRK #$CC
C0/FC6B:	F015    	BEQ $FC82
C0/FC6D:	0001    	BRK #$01
C0/FC6F:	FFDEFF00	SBC $00FFDE,X
C0/FC73:	F8      	SED 
C0/FC74:	22F844F8	JSR $F844F8
C0/FC78:	66F8    	ROR $F8
C0/FC7A:	88      	DEY 
C0/FC7B:	F8      	SED 
C0/FC7C:	AA      	TAX
C0/FC7D:	F8      	SED 
C0/FC7E:	00CC    	BRK #$CC
C0/FC80:	F015    	BEQ $FC97
C0/FC82:	0001    	BRK #$01
C0/FC84:	FFDEFF00	SBC $00FFDE,X
C0/FC88:	F8      	SED 
C0/FC89:	22F844F8	JSR $F844F8
C0/FC8D:	66F8    	ROR $F8
C0/FC8F:	88      	DEY 
C0/FC90:	F8      	SED 
C0/FC91:	AA      	TAX
C0/FC92:	F8      	SED 
C0/FC93:	00CC    	BRK #$CC
C0/FC95:	F015    	BEQ $FCAC
C0/FC97:	0001    	BRK #$01
C0/FC99:	FFDEFF00	SBC $00FFDE,X
C0/FC9D:	F8      	SED 
C0/FC9E:	22F844F8	JSR $F844F8
C0/FCA2:	66F8    	ROR $F8
C0/FCA4:	88      	DEY 
C0/FCA5:	F8      	SED 
C0/FCA6:	AA      	TAX
C0/FCA7:	F8      	SED 
C0/FCA8:	00CC    	BRK #$CC
C0/FCAA:	F0FF    	BEQ $FCAB
C0/FCAC:	FFFFFFFF	SBC $FFFFFF,X
C0/FCB0:	FFFFFFFF	SBC $FFFFFF,X
C0/FCB4:	FFFFFFFF	SBC $FFFFFF,X
C0/FCB8:	FFFFFFFF	SBC $FFFFFF,X
C0/FCBC:	FFFFFFFF	SBC $FFFFFF,X
C0/FCC0:	FFFFFFFF	SBC $FFFFFF,X
C0/FCC4:	FFFFFFFF	SBC $FFFFFF,X
C0/FCC8:	FFFFFFFF	SBC $FFFFFF,X
C0/FCCC:	FFFFFFFF	SBC $FFFFFF,X
C0/FCD0:	FFFFFFFF	SBC $FFFFFF,X
C0/FCD4:	FFFFFFFF	SBC $FFFFFF,X
C0/FCD8:	FFFFFFFF	SBC $FFFFFF,X
C0/FCDC:	FFFFFFFF	SBC $FFFFFF,X
C0/FCE0:	FFFFFFFF	SBC $FFFFFF,X
C0/FCE4:	FFFFFFFF	SBC $FFFFFF,X
C0/FCE8:	FFFFFFFF	SBC $FFFFFF,X
C0/FCEC:	FFFFFFFF	SBC $FFFFFF,X
C0/FCF0:	FFFFFFFF	SBC $FFFFFF,X
C0/FCF4:	FFFFFFFF	SBC $FFFFFF,X
C0/FCF8:	FFFFFFFF	SBC $FFFFFF,X
C0/FCFC:	FFFFFFFF	SBC $FFFFFF,X


Random Number Table

C0/FD00:	07 B6 F0 1F 55 5B 37 E3 AE 4F B2 5E 99 F6 77 CB
C0/FD10:	60 8F 43 3E A7 4C 2D 88 C7 68 D7 D1 C2 F2 C1 DD
C0/FD20:	AA 93 16 F7 26 04 36 A1 46 4E 56 BE 6C 6E 80 D5
C0/FD30:	B5 8E A4 9E E7 CA CE 21 FF 0F D4 8C E6 D3 98 47
C0/FD40:	F4 0D 15 ED C4 E4 35 78 BA DA 27 61 AB B9 C3 7D
C0/FD50:	85 FC 95 6B 30 AD 86 00 8D CD 7E 9F E5 EF DB 59
C0/FD60:	EB 05 14 C9 24 2C A0 3C 44 69 40 71 64 3A 74 7C
C0/FD70:	84 13 94 9C 96 AC B4 BC 03 DE 54 DC C5 D8 0C B7
C0/FD80:	25 0B 01 1C 23 2B 33 3B 97 1B 62 2F B0 E0 73 CC
C0/FD90:	02 4A FE 9B A3 6D 19 38 75 BD 66 87 3F AF F3 FB
C0/FDA0:	83 0A 12 1A 22 53 90 CF 7A 8B 52 5A 49 6A 72 28
C0/FDB0:	58 8A BF 0E 06 A2 FD FA 41 65 D2 4D E2 5C 1D 45
C0/FDC0:	1E 09 11 B3 5F 29 79 39 2E 2A 51 D9 5D A6 EA 31
C0/FDD0:	81 89 10 67 F5 A9 42 82 70 9D 92 57 E1 3D F1 F9
C0/FDE0:	EE 08 91 18 20 B1 A5 BB C6 48 50 9A D6 7F 7B E9
C0/FDF0:	76 DF 32 6F 34 A8 D0 B8 63 C8 C0 EC 4B E8 17 F8


C0/FE00:	00 17 00    	
C0/FE03:	44 17 13    
C0/FE06:	13 13 04   	
C0/FE09:	02 13 04  
C0/FE0C:	42 13 17   
C0/FE0F:	04 17 13    
C0/FE12:	4117    	EOR ($17,X)
C0/FE14:	1643    	ASL $43,X
C0/FE16:	1317    	ORA ($17,S),Y
C0/FE18:	4113    	EOR ($13,X)
C0/FE1A:	1781    	ORA [$81],Y
C0/FE1C:	1304    	ORA ($04,S),Y
C0/FE1E:	5113    	EOR ($13),Y
C0/FE20:	1782    	ORA [$82],Y
C0/FE22:	1304    	ORA ($04,S),Y
C0/FE24:	60      	RTS
C0/FE25:	1314    	ORA ($14,S),Y
C0/FE27:	8313    	STA $13,S
C0/FE29:	0451    	TSB $51
C0/FE2B:	1304    	ORA ($04,S),Y
C0/FE2D:	621713  	PER $1147
C0/FE30:	8413    	STY $13
C0/FE32:	0486    	TSB $86
C0/FE34:	1502    	ORA $02,X
C0/FE36:	541711  	MVN $17,$11
C0/FE39:	FFFFFFFF	SBC $FFFFFF,X
C0/FE3D:	FFFFFF

Data of some sort

C0/FE40:	00 00 00 00 10 10 10 10
C0/FE48:	00 00 00 00 08 00 20 00
C0/FE50:	00 00 08 08 04 04 10 10    	
C0/FE58:	D0 00 00 00 08 10 10 10
C0/FE60: 	00 00 00 00 04 04 10 10
C0/FE68:	00 00 00 00 10 0C 10 10
C0/FE70:	00 04 08 08 08 10 10 10
C0/FE78: 	00 00 40 40 10 10 10 10

C0/FE80:	F8      	SED 
C0/FE81:	0000    	BRK #$00
C0/FE83:	0010    	BRK #$10
C0/FE85:	1010    	BPL $FE97
C0/FE87:	1000    	BPL $FE89
C0/FE89:	0020    	BRK #$20
C0/FE8B:	0010    	BRK #$10
C0/FE8D:	0C1010  	TSB $1010
C0/FE90:	0000    	BRK #$00
C0/FE92:	08      	PHP 
C0/FE93:	08      	PHP 
C0/FE94:	1010    	BPL $FEA6
C0/FE96:	1010    	BPL $FEA8
C0/FE98:	0000    	BRK #$00
C0/FE9A:	D0D0    	BNE $FE6C
C0/FE9C:	1010    	BPL $FEAE
C0/FE9E:	1010    	BPL $FEB0
C0/FEA0:	0000    	BRK #$00
C0/FEA2:	0008    	BRK #$08
C0/FEA4:	1010    	BPL $FEB6
C0/FEA6:	1010    	BPL $FEB8
C0/FEA8:	0000    	BRK #$00
C0/FEAA:	0204    	COP #$04
C0/FEAC:	1010    	BPL $FEBE
C0/FEAE:	1010    	BPL $FEC0
C0/FEB0:	0000    	BRK #$00
C0/FEB2:	20FE10  	JSR $10FE
C0/FEB5:	1008    	BPL $FEBF
C0/FEB7:	08      	PHP 
C0/FEB8:	0000    	BRK #$00
C0/FEBA:	20F800  	JSR $00F8
C0/FEBD:	0C0000  	TSB $0000
C0/FEC0:	0000    	BRK #$00
C0/FEC2:	0000    	BRK #$00
C0/FEC4:	000C    	BRK #$0C
C0/FEC6:	1010    	BPL $FED8
C0/FEC8:	0000    	BRK #$00
C0/FECA:	0000    	BRK #$00
C0/FECC:	08      	PHP 
C0/FECD:	08      	PHP 
C0/FECE:	08      	PHP 
C0/FECF:	08      	PHP 
C0/FED0:	0000    	BRK #$00
C0/FED2:	08      	PHP 
C0/FED3:	0010    	BRK #$10
C0/FED5:	1008    	BPL $FEDF
C0/FED7:	00F0    	BRK #$F0
C0/FED9:	0000    	BRK #$00
C0/FEDB:	0010    	BRK #$10
C0/FEDD:	1010    	BPL $FEEF
C0/FEDF:	1000    	BPL $FEE1
C0/FEE1:	0008    	BRK #$08
C0/FEE3:	08      	PHP 
C0/FEE4:	1010    	BPL $FEF6
C0/FEE6:	1010    	BPL $FEF8
C0/FEE8:	FFFFFFFF	SBC $FFFFFF,X
C0/FEEC:	FFFFFFFF	SBC $FFFFFF,X
C0/FEF0:	FFFFFFFF	SBC $FFFFFF,X
C0/FEF4:	FFFFFFFF	SBC $FFFFFF,X
C0/FEF8:	FFFFFFFF	SBC $FFFFFF,X
C0/FEFC:	FFFFFFFF	SBC $FFFFFF,X

Reset vector (CPU address is 00/FF00)
C0/FF00:	78      	SEI            (This is the actual entry point)
C0/FF01:	18      	CLC           (Clear the carry)
C0/FF02:	FB      	XCE            (Swap that 0 carry into the emulation bit; aka native mode)
C0/FF03:	5C1900C0	JMP $C00019    (get the game started!)

C0/FF07:	FFFFFFFF	SBC $FFFFFF,X
C0/FF0B:	FFFFFFFF	SBC $FFFFFF,X
C0/FF0F:	FF

NMI  (CPU address is 00/FF10)
C0/FF10:	5C001500	JMP $001500    (possible places to jump to are: C0/0182, C1/0BA7, C3/1387, EE/A509, EE/A728, EE/A94D, EE/AD4D)

IRQ  (CPU address is 00/FF14)
C0/FF14:	5C041500	JMP $001504    (possible places to jump to are: C0/0262, C1/0D4A (RTI), C3/13C7 (RTI), EE/A6B7, EE/A6CF, EE/A707, EE/A93A, EE/AA35)

C0/FF18:	FFFFFFFF	SBC $FFFFFF,X
C0/FF1C:	FFFFFFFF	SBC $FFFFFF,X
C0/FF20:	FFFFFFFF	SBC $FFFFFF,X
C0/FF24:	FFFFFFFF	SBC $FFFFFF,X
C0/FF28:	FFFFFFFF	SBC $FFFFFF,X
C0/FF2C:	FFFFFFFF	SBC $FFFFFF,X
C0/FF30:	FFFFFFFF	SBC $FFFFFF,X
C0/FF34:	FFFFFFFF	SBC $FFFFFF,X
C0/FF38:	FFFFFFFF	SBC $FFFFFF,X
C0/FF3C:	FFFFFFFF	SBC $FFFFFF,X
C0/FF40:	FFFFFFFF	SBC $FFFFFF,X
C0/FF44:	FFFFFFFF	SBC $FFFFFF,X
C0/FF48:	FFFFFFFF	SBC $FFFFFF,X
C0/FF4C:	FFFFFFFF	SBC $FFFFFF,X
C0/FF50:	FFFFFFFF	SBC $FFFFFF,X
C0/FF54:	FFFFFFFF	SBC $FFFFFF,X
C0/FF58:	FFFFFFFF	SBC $FFFFFF,X
C0/FF5C:	FFFFFFFF	SBC $FFFFFF,X
C0/FF60:	FFFFFFFF	SBC $FFFFFF,X
C0/FF64:	FFFFFFFF	SBC $FFFFFF,X
C0/FF68:	FFFFFFFF	SBC $FFFFFF,X
C0/FF6C:	FFFFFFFF	SBC $FFFFFF,X
C0/FF70:	FFFFFFFF	SBC $FFFFFF,X
C0/FF74:	FFFFFFFF	SBC $FFFFFF,X
C0/FF78:	FFFFFFFF	SBC $FFFFFF,X
C0/FF7C:	FFFFFFFF	SBC $FFFFFF,X
C0/FF80:	FFFFFFFF	SBC $FFFFFF,X
C0/FF84:	FFFFFFFF	SBC $FFFFFF,X
C0/FF88:	FFFFFFFF	SBC $FFFFFF,X
C0/FF8C:	FFFFFFFF	SBC $FFFFFF,X
C0/FF90:	FFFFFFFF	SBC $FFFFFF,X
C0/FF94:	FFFFFFFF	SBC $FFFFFF,X
C0/FF98:	FFFFFFFF	SBC $FFFFFF,X
C0/FF9C:	FFFFFFFF	SBC $FFFFFF,X
C0/FFA0:	FFFFFFFF	SBC $FFFFFF,X
C0/FFA4:	FFFFFFFF	SBC $FFFFFF,X
C0/FFA8:	FFFFFFFF	SBC $FFFFFF,X
C0/FFAC:	FFFFFFFF	SBC $FFFFFF,X

Looks like data
C0/FFB0:	43 33 46 36 20 20 00 00 00 00 00 00 00 00 00 00
		(C  3  F  6                                   )

						(Game title in ASCII)
C0/FFC0:	46 49 4E 41 4C 20 46 41 4E 54 41 53 59 20 33 20 20 20 20 20 20
		(F  I  N  A  L     F  A  N  T  A  S  Y     3                 )

C0/FFD5:	31      	(ROM makeup: Low nibble (0/1) 1 = HiROM; High nibble (0/3) 3 = FastROM)
C0/FFD6:	02      	(ROM type 2 = ROM and Save RAM)
C0/FFD7:	0C      	(ROM size 12 = 32 Mbits [8 = 2 Mbits, 9 = 4 Mbits , A = 8 Mbits, B = 16 Mbits])
C0/FFD8:	03      	(SRAM size 3 = 64 Kbits [0 = None, 1 = 16 Kbits, 2 = 32 Kbits])		
C0/FFD9:	01      	(Country Code 1 = USA [NTSC country])
C0/FFDA:	33      	(Licence 51 = Nintendo?)
C0/FFDB:	00      	(Game version is 1.0)

C0/FFDC:	CDA0    	(Inverse Checksum)
C0/FFDE:	325F    	(Checksum)

C0/FFE0:	FFFF
C0/FFE2:	FFFF
C0/FFE4:	FFFF    	(native mode COP location)
C0/FFE6:	FFFF    	(native mode BRK location)
C0/FFE8:	FFFF    	(native mode abort location, non-existent hardware feature)
C0/FFEA:	10FF    	(native mode NMI location, 00/FF10)
C0/FFEC:	FFFF
C0/FFEE:	14FF    	(native mode IRQ location, 00/FF14)
C0/FFF0:	FFFF
C0/FFF2:	FFFF
C0/FFF4:	FFFF    	(emulation mode COP location)
C0/FFF6:	FFFF
C0/FFF8:	FFFF    	(emulation mode abort location, non-existent hardware feature)
C0/FFFA:	FFFF    	(emulation mode NMI location)
C0/FFFC:	00FF    	(Reset vector, 00/FF00)
C0/FFFE:	FFFF    	(emulation mode IRQ/BRK location)
