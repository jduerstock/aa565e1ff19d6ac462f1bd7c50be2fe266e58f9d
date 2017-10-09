
.macro	_Read
	.short	0xa002
.endm

.macro	_GetEOF
	.short	0xa011
.endm

.macro	_SetZone
	.short	0xa01b
.endm

.macro	_DisposePtr
	.short	0xa01f
.endm

.macro	_GetPtrSize
	.short	0xa021
.endm

.macro	_DisposeHandle
	.short	0xa023
.endm

.macro	_HUnlock
	.short	0xa02a
.endm

.macro	_BlockMove
	.short	0xa02e
.endm

.macro	_SetFPos
	.short	0xa044
.endm

.macro	_MemoryDispatch
	.short	0xa05c
.endm

.macro	_HoldMemory
	moveq	#0,%d0
	_MemoryDispatch
.endm

.macro	_UnholdMemory
	moveq	#1,%d0
	_MemoryDispatch
.endm

.macro	_HWPriv
	.short	0xa098
.endm

.macro	_FlushInstructionCache
	moveq	#1,%d0
	_HWPriv
.endm

.macro	_GetZone
	.short	0xa11a
.endm

.macro	_NewPtr
	.short	0xa11e
.endm

.macro	_Gestalt
	.short	0xa1ad
.endm

.macro	_PBHGetVInfoSync
	.short	0xa207
.endm

.macro	_BlockMoveData
	.short	0xa22e
.endm

.macro	_HFSDispatch
	.short	0xa260
.endm

.macro	_PBGetFCBInfoSync
	moveq	#8,%d0
	_HFSDispatch
.endm

.macro	_PBGetCatInfoSync
	moveq	#9,%d0
	_HFSDispatch
.endm

.macro	_PBHOpenDFSync
	moveq	#26,%d0
	_HFSDispatch
.endm

.macro	_NewPtrSys
	.short	0xa51e
.endm

.macro	_NewPtrSysClear
	.short	0xa71e
.endm

.macro	_HOpenResFile
	.short	0xa81a
.endm

.macro	_AliasDispatch
	.short	0xa823
.endm

.macro	_OSDispatch
	.short	0xa88f
.endm

.macro	_TempNewHandle
	movew	#29,%sp@-
	_OSDispatch
.endm

.macro	_GetCurrentProcess
	movew	#55,%sp@-
	_OSDispatch
.endm

.macro	_GetProcessInformation
	movew	#58,%sp@-
	_OSDispatch
.endm

.macro	_SetResLoad
	.short	0xa99b
.endm

.macro	_GetResource
	.short	0xa9a0
.endm

.macro	_Pack7
	.short	0xa9ee
.endm

.macro	_NumToString
	clrw	%sp@-
	_Pack7
.endm

.macro	_HighLevelFSDispatch
	.short	0xaa52
.endm

.macro	_CodeFragmentDispatch
	.short	0xaa5a
.endm

	nop
	subal	%a0,%a0
	braw	.L10000110

	.byte	0x01,0x03,0x80,0x00
	.string	"!CFM68K"

sub_10000014:
	clrw	%sp@-
	movew	%d0,%sp@-
	movew	%sp@(8),%d0
	movel	%sp@(4),%sp@(6)
	cmpiw	#68,%d0
	beqw	.L100000ca
	addiw	#23,%d0
	bmis	.L10000048
	cmpiw	#30,%d0
	bgts	.L10000048
	aslw	#2,%d0
	pea	%pc@(off_1000004e,%d0:w)
	movew	%sp@(4),%d0
	movel	%sp@,%sp@(6)
	addqw	#6,%sp
	rts

.L10000048:
	addqw	#6,%sp
	moveq	#-50,%d0
	rts

off_1000004e:
	jmp	%pc@(FragRegisterLocalAllocator)
	jmp	%pc@(FragRegisterSpecialLibs)
	jmp	%pc@(FragGetFileRegistryInfo)
	jmp	%pc@(FragRegisterFileLibs)
	jmp	%pc@(FragGetAppLocator)
	jmp	%pc@(FragFindOwnerOfPC)
	jmp	%pc@(FragApplyUpdate)
	jmp	%pc@(FragReloadAccRsrc)
	jmp	%pc@(FragPrepareAccRsrc)
	jmp	%pc@(FragGetSectionInfo)
	jmp	%pc@(FragGetConnectionInfo)
	jmp	%pc@(FragGetClosureInfo)
	jmp	%pc@(FragGetContextInfo)
	jmp	%pc@(FragResolveSymbol)
	jmp	%pc@(FragGetMemRegistryInfo)
	jmp	%pc@(FragRemoveNotifyProc)
	jmp	%pc@(FragAddNotifyProc)
	jmp	%pc@(FragRemoveSearchProc)
	jmp	%pc@(FragAddSearchProc)
	jmp	%pc@(FragRegisterMemLib)
	jmp	%pc@(FragRelease)
	jmp	%pc@(FragPrepare)
	jmp	%pc@(FragCreateContext)
	jmp	%pc@(.L10000048)
	jmp	%pc@(GetSharedLibrary)
	jmp	%pc@(GetDiskFragment)
	jmp	%pc@(GetMemFragment)
	jmp	%pc@(CloseConnection)
	jmp	%pc@(FindSymbol)
	jmp	%pc@(CountSymbols)
	jmp	%pc@(GetIndSymbol)

.L100000ca:
	addqw	#6,%sp
	jmp	%pc@(sub_1000027c)

sub_100000d0:
	moveal	0x904,%a0
	movel	%a0@(40),%d0
	cmpil	#-973406211,%d0
	bnes	.L100000f6
	movel	%a0@(44),%d0
	moveq	#1,%d1
	bsrs	sub_100000fc
	beqs	.L100000f6
	moveq	#0,%d1
	moveal	0x904,%a0
	movel	%a0@(44),%d0
	bsrs	sub_100000fc

.L100000f6:
	moveal	%pc@(.L10000110),%a0
	jmp	%a0@

sub_100000fc:
	subql	#2,%sp
	movel	%d0,%sp@-
	moveq	#0,%d0
	movel	%d0,%sp@-
	moveb	%d1,%sp@-
	movew	#-3,%sp@-
	_CodeFragmentDispatch
	movew	%sp@+,%d0
	rts

.L10000110:
	lea	%pc@(dword_100001e8),%a1
	movel	%a0,%a1@
	lea	%pc@(sub_10000014),%a0
	movew	#0xaa5a,%d0
	.short	0xa647
	linkw	%fp,#-80
	subql	#2,%sp
	moveq	#1,%d0
	movel	%d0,%sp@-
	clrw	%sp@-
	pea	%fp@(-80)
	movew	#-11,%sp@-
	_CodeFragmentDispatch
	movew	%sp@+,%d0
	bnes	.L100001aa
	subql	#4,%sp
	movel	#1667656992,%sp@-
	movew	#1,%sp@-
	_GetResource
	movel	%sp@+,%d2
	beqs	.L10000154
	movew	0xa60,%d0
	bnes	.L10000158
	bras	.L1000015a

.L10000154:
	movew	#-192,%d0

.L10000158:
	bras	.L100001aa

.L1000015a:
	movel	%d2,%sp@-
	.short	0xa992
	moveal	%d2,%a0
	.short	0xa029
	movel	%a0@,%d0
	.short	0xa055
	moveal	%d0,%a1
	lea	%pc@(sub_1000744c),%a0
	movel	%a0,%sp@-
	jsr	%a1@
	tstl	%d0
	bnes	.L1000017a
	movew	#-2818,%d0
	bras	.L100001aa

.L1000017a:
	clrw	%sp@-
	movel	%d0,%sp@-
	jsr	%pc@(sub_10007448)
	tstw	%d0
	beqs	.L10000188
	bras	.L100001aa

.L10000188:
	bras	.L100001a6
	moveq	#0,%d0
	movew	#0xaafb,%d0
	.short	0xa746
	movel	%a0,%d0
	lea	%pc@(.L10000110),%a0
	movel	%d0,%a0@
	moveq	#0,%d0
	lea	%pc@(sub_100000d0),%a0
	movew	#0xaafb,%d0
	.short	0xa647

.L100001a6:
	moveq	#0,%d0
	bras	.L100001ba

.L100001aa:
	movew	%d0,%d1
	movew	#0xa89f,%d0
	.short	0xa746
	movew	#0xaa5a,%d0
	.short	0xa647
	movew	%d1,%d0

.L100001ba:
	unlk	%fp
	rts

	.ascii	"CFLAddLoader of RSEGLoader Failed: Err=D0"
	.byte	0x00

dword_100001e8:
	.byte	0x00,0x00,0x00,0x00

sub_100001ec:
	movel	%pc@(dword_100001e8),%d0
	rts

sub_100001f2:
	linkw	%fp,#0
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(12),%a3
	moveal	%fp@(8),%a2
	moveb	%a2@,%d0
	moveq	#0,%d3
	moveb	%d0,%d3
	moveal	%a2,%a4
	addqw	#1,%a4
	bras	.L10000218

.L1000020e:
	moveb	%a4@+,%a3@+
	subql	#1,%d3
	moveal	%fp@(16),%a0
	addql	#1,%a0@

.L10000218:
	tstl	%d3
	bnes	.L1000020e
	moveal	%a3,%a0
	subqw	#1,%a0
	movel	%a0,%d0
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_1000022a:
	linkw	%fp,#0
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	moveal	%fp@(12),%a2
	moveal	%a2,%a4
	addqw	#2,%a4
	movel	%a3@,%d0
	movew	%d0,%d3
	movew	%a2@,%d0
	cmpw	%d0,%d3
	bges	.L1000024c
	tstw	%d3
	bnes	.L10000262

.L1000024c:
	moveq	#0,%d0
	movel	%d0,%a3@
	movel	%a4,%d0
	bras	.L10000274

.L10000254:
	moveb	%a4@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addqw	#1,%d0
	extl	%d0
	addal	%d0,%a4
	subqw	#1,%d3

.L10000262:
	tstw	%d3
	bnes	.L10000254
	tstb	%a4@
	bnes	.L10000272
	moveal	%a2,%a4
	addqw	#2,%a4
	moveq	#0,%d0
	movel	%d0,%a3@

.L10000272:
	movel	%a4,%d0

.L10000274:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_1000027c:
	linkw	%fp,#-40
	moveml	%d3-%d5/%a2-%a4,%sp@-
	movew	%fp@(16),%d4
	moveal	%fp@(12),%a4
	cmpiw	#-2803,%d4
	bges	.L100002a8
	cmpiw	#-2899,%d4
	bles	.L100002a8
	movel	#-2803,%d0
	movew	%d4,%d3
	movew	%d3,%d1
	extl	%d1
	subl	%d1,%d0
	bras	.L100002aa

.L100002a8:
	moveq	#0,%d0

.L100002aa:
	movel	%d0,%fp@(-36)
	jsr	%pc@(sub_100001ec)
	moveal	%d0,%a3
	movel	%a3,%d0
	beqw	.L1000035a
	movel	%a3,%sp@-
	pea	%fp@(-36)
	jsr	%pc@(sub_1000022a)
	addqw	#8,%sp
	moveal	%d0,%a2
	movel	%fp@(-36),%d0
	bnes	.L100002e2
	movew	%d4,%d0
	movew	%d0,%d1
	extl	%d1
	movel	%d1,%sp@-
	pea	%fp@(-32)
	jsr	%pc@(j_local_numtostring)
	lea	%fp@(-32),%a4

.L100002e2:
	moveal	%fp@(8),%a3
	addqw	#1,%a3
	moveq	#0,%d0
	movel	%d0,%fp@(-40)
	moveb	%a2@,%d0
	moveq	#0,%d5
	moveb	%d0,%d5
	addqw	#1,%a2
	moveq	#1,%d4
	bras	.L1000034e

.L100002fa:
	moveb	%a2@,%d3
	moveq	#94,%d0
	cmpb	%d0,%d3
	beqs	.L1000030a
	moveb	%d3,%a3@
	addql	#1,%fp@(-40)
	bras	.L10000348

.L1000030a:
	addqw	#1,%a2
	addql	#1,%d4
	moveb	%a2@,%d0
	moveq	#48,%d1
	cmpb	%d1,%d0
	bnes	.L1000032e
	pea	%fp@(-40)
	movel	%a3,%sp@-
	movel	#2320,%sp@-
	jsr	%pc@(sub_100001f2)
	lea	%sp@(12),%sp
	moveal	%d0,%a3
	bras	.L10000348

.L1000032e:
	moveb	%a2@,%d0
	moveq	#49,%d1
	cmpb	%d1,%d0
	bnes	.L10000348
	pea	%fp@(-40)
	movel	%a3,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_100001f2)
	lea	%sp@(12),%sp
	moveal	%d0,%a3

.L10000348:
	addql	#1,%d4
	addqw	#1,%a3
	addqw	#1,%a2

.L1000034e:
	cmpl	%d5,%d4
	bles	.L100002fa
	moveal	%fp@(8),%a0
	moveb	%fp@(-37),%a0@

.L1000035a:
	clrw	%d0
	movew	%d0,%fp@(18)
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(10),%sp
	jmp	%a0@

sub_1000036e:
	linkw	%fp,#-48
	moveml	%d3/%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	_GetZone
	moveal	%a0,%a3
	moveb	%fp@(8),%d0
	beqs	.L10000396
	subqw	#4,%sp
	movel	0x2a6,%sp@
	moveal	%sp@+,%a0
	cmpal	%a3,%a0
	bnes	.L10000396
	moveq	#0,%d0
	bras	.L100003f8

.L10000396:
	moveq	#0,%d0
	moveal	%d0,%a2

.L1000039a:
	subqw	#2,%sp
	movel	%a2,%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	pea	%fp@(-48)
	jsr	%pc@(FragGetContextInfo)
	movew	%sp@+,%d3
	bnes	.L100003ba
	moveal	%fp@(-48),%a2
	cmpal	%fp@(-44),%a3
	bnes	.L1000039a
	bras	.L100003f6

.L100003ba:
	moveal	#694,%a0
	moveal	%a0@,%a0
	tstw	%a0@(296)
	beqs	.L100003da
	moveal	%a4@(36),%a0
	moveal	%a4@(40),%a1
	cmpal	%a1,%a0
	beqs	.L100003da
	moveq	#0,%d0
	moveal	%d0,%a2
	bras	.L100003f6

.L100003da:
	subqw	#2,%sp
	moveq	#1,%d3
	movel	%d3,%sp@-
	clrb	%sp@-
	pea	%fp@(-48)
	jsr	%pc@(FragGetContextInfo)
	movew	%sp@+,%d0
	bnes	.L100003f2
	moveal	%d3,%a2
	bras	.L100003f6

.L100003f2:
	moveq	#0,%d0
	moveal	%d0,%a2

.L100003f6:
	movel	%a2,%d0

.L100003f8:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10000400:
	linkw	%fp,#0
	moveml	%a2-%a3,%sp@-
	lea	%pc@(.L1000040e),%a0
	bras	.L10000452

.L1000040e:
	jmp	%pc@(.L1000041a)


.L10000412:
	.byte	0x00,0x00,0x00,0x00

.L10000416:
	.byte	0x00,0x00,0x00,0x00

.L1000041a:
	movel	%pc@(.L10000412),%sp@-
	movel	%pc@(.L10000416),%d0
	movel	%d0,%sp@-
	subql	#2,%sp
	movel	%d0,%sp@-
	clrl	%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	movew	#-3,%sp@-
	_CodeFragmentDispatch
	movew	%sp@+,%d0
	bnes	.L1000043c
	addql	#4,%sp
	rts

.L1000043c:
	subql	#2,%sp
	movel	%sp@(2),%sp@-
	clrl	%sp@-
	moveq	#0,%d0
	moveb	%d0,%sp@-
	movew	#-3,%sp@-
	_CodeFragmentDispatch
	addql	#6,%sp
	rts

.L10000452:
	movel	%a0,%d0
	moveal	%d0,%a3
	moveq	#80,%d0
	_NewPtr
	moveal	%a0,%a2
	moveal	%a3,%a0
	moveal	%a2,%a1
	moveq	#80,%d0
	_BlockMoveData
	movel	%fp@(8),%a2@(4)
	movel	%fp@(12),%a2@(8)
	movel	%a2,%sp@-
	movew	#0xa9f4,%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	jsr	%pc@(sub_1000797a)
	moveml	%sp@+,%a2-%a3
	unlk	%fp
	rts

sub_10000486:
	linkw	%fp,#-324
	moveml	%d3-%d4/%a2,%sp@-
	moveq	#0,%d0
	moveal	%fp@(8),%a0
	movel	%d0,%a0@
	subqw	#4,%sp
	movel	0x904,%sp@
	moveal	%sp@+,%a2
	movew	%a2@(42),%d0
	cmpiw	#-3,%d0
	bnes	.L100004b0
	movew	#-2800,%d0
	jmp	%pc@(.L1000053e)

.L100004b0:
	subqw	#2,%sp
	movew	0x900,%sp@
	movew	%sp@+,%d0
	movew	%d0,%fp@(-40)
	lea	%fp@(-324),%a0
	movel	%a0,%fp@(-46)
	moveq	#0,%d0
	movel	%d0,%fp@(-52)
	clrw	%d3
	movew	%d3,%fp@(-36)
	movew	%d3,%fp@(-42)
	moveq	#0,%d0
	movel	%d0,%fp@(-6)
	subqw	#2,%sp
	movew	%fp@(-40),%sp@-
	pea	%fp@(-42)
	jsr	%pc@(sub_1000797e)
	movew	%sp@+,%d4
	bnes	.L10000514
	lea	%fp@(-64),%a0
	_PBGetFCBInfoSync
	movew	%d0,%d4
	bnes	.L10000514
	subqw	#2,%sp
	pea	%fp@(-68)
	_GetZone
	movel	%a0,%sp@-
	clrl	%sp@-
	movew	%fp@(-42),%sp@-
	movel	%fp@(-6),%sp@-
	jsr	%pc@(FragCreateContext)
	movew	%sp@+,%d4
	beqs	.L10000518

.L10000514:
	movew	%d4,%d0
	bras	.L1000053e

.L10000518:
	moveal	%fp@(8),%a0
	movel	%fp@(-68),%a0@
	movel	%fp@(-68),%sp@-
	subqw	#4,%sp
	movew	#-22028,%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	jsr	%pc@(sub_10007a36)
	movel	%sp@+,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10000400)
	addqw	#8,%sp
	movew	%d3,%d0

.L1000053e:
	moveml	%sp@+,%d3-%d4/%a2
	unlk	%fp
	rts

GetSharedLibrary:
	linkw	%fp,#-16
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(12),%a2
	moveal	%fp@(16),%a3
	moveal	%fp@(28),%a4
	clrb	%sp@-
	jsr	%pc@(sub_1000036e)
	addqw	#2,%sp
	movel	%d0,%fp@(-16)
	movel	%a3,%d0
	bnes	.L1000056e
	lea	%fp@(-8),%a3

.L1000056e:
	movel	%a2,%d0
	bnes	.L10000576
	lea	%fp@(-4),%a2

.L10000576:
	movel	%fp@(-16),%d0
	bnes	.L10000594
	pea	%fp@(-16)
	jsr	%pc@(sub_10000486)
	addqw	#4,%sp
	tstw	%d0
	beqs	.L10000594
	movew	#-2800,%d0
	movew	%d0,%fp@(32)
	bras	.L100005dc

.L10000594:
	movel	%a4,%d0
	beqs	.L100005ac
	moveb	%a4@,%d0
	moveq	#63,%d1
	cmpb	%d1,%d0
	bhis	.L100005ac
	movel	%fp@(20),%d3
	andil	#-376,%d3
	beqs	.L100005b4

.L100005ac:
	moveq	#-50,%d0
	movew	%d0,%fp@(32)
	bras	.L100005dc

.L100005b4:
	subqw	#2,%sp
	movel	%fp@(-16),%sp@-
	clrl	%sp@-
	movel	%a4,%sp@-
	movel	%fp@(20),%sp@-
	movel	%fp@(24),%sp@-
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	pea	%fp@(-12)
	movel	%fp@(8),%sp@-
	jsr	%pc@(FragPrepare)
	movew	%sp@+,%d0
	movew	%d0,%fp@(32)

.L100005dc:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(24),%sp
	jmp	%a0@

GetDiskFragment:
	linkw	%fp,#-32
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(12),%a2
	moveal	%fp@(16),%a3
	moveal	%fp@(24),%a4
	clrb	%sp@-
	jsr	%pc@(sub_1000036e)
	addqw	#2,%sp
	movel	%d0,%fp@(-32)
	movel	%a3,%d0
	bnes	.L10000612
	lea	%fp@(-8),%a3

.L10000612:
	movel	%a2,%d0
	bnes	.L1000061a
	lea	%fp@(-4),%a2

.L1000061a:
	movel	%fp@(-32),%d0
	bnes	.L10000638
	pea	%fp@(-32)
	jsr	%pc@(sub_10000486)
	addqw	#4,%sp
	tstw	%d0
	beqs	.L10000638
	movew	#-2800,%d0
	movew	%d0,%fp@(40)
	bras	.L100006a2

.L10000638:
	movel	%fp@(36),%d0
	beqs	.L10000656
	movel	%a4,%d0
	beqs	.L1000064a
	moveb	%a4@,%d0
	moveq	#63,%d1
	cmpb	%d1,%d0
	bhis	.L10000656

.L1000064a:
	movel	%fp@(20),%d3
	andil	#-376,%d3
	beqs	.L1000065e

.L10000656:
	moveq	#-50,%d0
	movew	%d0,%fp@(40)
	bras	.L100006a2

.L1000065e:
	moveq	#1,%d0
	movel	%d0,%fp@(-28)
	movel	%fp@(36),%fp@(-24)
	movel	%fp@(32),%fp@(-20)
	movel	%fp@(28),%fp@(-16)
	subqw	#2,%sp
	movel	%fp@(-32),%sp@-
	pea	%fp@(-28)
	movel	%a4,%sp@-
	movel	%fp@(20),%sp@-
	movel	#1061109567,%sp@-
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	pea	%fp@(-12)
	movel	%fp@(8),%sp@-
	jsr	%pc@(FragPrepare)
	movew	%sp@+,%d0
	movew	%d0,%fp@(40)

.L100006a2:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(32),%sp
	jmp	%a0@

GetMemFragment:
	linkw	%fp,#-32
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(12),%a2
	moveal	%fp@(16),%a3
	moveal	%fp@(24),%a4
	clrb	%sp@-
	jsr	%pc@(sub_1000036e)
	addqw	#2,%sp
	movel	%d0,%fp@(-32)
	movel	%fp@(20),%d3
	andil	#-376,%d3
	movel	%a3,%d0
	bnes	.L100006e2
	lea	%fp@(-8),%a3

.L100006e2:
	movel	%a2,%d0
	bnes	.L100006ea
	lea	%fp@(-4),%a2

.L100006ea:
	movel	%fp@(-32),%d0
	bnes	.L1000070a
	pea	%fp@(-32)
	jsr	%pc@(sub_10000486)
	addqw	#4,%sp
	tstw	%d0
	beqs	.L1000070a
	movew	#-2800,%d0
	movew	%d0,%fp@(36)
	jmp	%pc@(.L1000078a)

.L1000070a:
	movel	%fp@(32),%d0
	beqs	.L10000726
	movel	%a4,%d0
	beqs	.L1000071c
	moveb	%a4@,%d0
	moveq	#63,%d1
	cmpb	%d1,%d0
	bhis	.L10000726

.L1000071c:
	movel	%d3,%d0
	andil	#-129,%d0
	beqs	.L1000072e

.L10000726:
	moveq	#-50,%d0
	movew	%d0,%fp@(36)
	bras	.L1000078a

.L1000072e:
	andil	#375,%fp@(20)
	moveq	#0,%d0
	movel	%d0,%fp@(-28)
	movel	%fp@(32),%fp@(-24)
	movel	%fp@(28),%fp@(-20)
	movew	%fp@(22),%d0
	andiw	#128,%d0
	tstw	%d0
	sne	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveb	%d0,%fp@(-16)
	subqw	#2,%sp
	movel	%fp@(-32),%sp@-
	pea	%fp@(-28)
	movel	%a4,%sp@-
	movel	%fp@(20),%sp@-
	movel	#1061109567,%sp@-
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	pea	%fp@(-12)
	movel	%fp@(8),%sp@-
	jsr	%pc@(FragPrepare)
	movew	%sp@+,%d0
	movew	%d0,%fp@(36)

.L1000078a:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(28),%sp
	jmp	%a0@

CloseConnection:
	linkw	%fp,#0
	moveml	%d3/%a3-%a4,%sp@-
	moveal	%fp@(8),%a3
	clrb	%sp@-
	jsr	%pc@(sub_1000036e)
	addqw	#2,%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L100007bc
	movew	#-2800,%d0
	movew	%d0,%fp@(12)
	bras	.L100007ee

.L100007bc:
	movel	%a3,%d0
	bnes	.L100007c8
	moveq	#-50,%d0
	movew	%d0,%fp@(12)
	bras	.L100007ee

.L100007c8:
	tstl	%a3@
	bnes	.L100007d4
	clrw	%d0
	movew	%d0,%fp@(12)
	bras	.L100007ee

.L100007d4:
	subqw	#2,%sp
	movel	%a4,%sp@-
	movel	%a3@,%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	jsr	%pc@(FragRelease)
	movew	%sp@+,%d3
	moveq	#0,%d0
	movel	%d0,%a3@
	movew	%d3,%d0
	movew	%d0,%fp@(12)

.L100007ee:
	moveml	%sp@+,%d3/%a3-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#4,%sp
	jmp	%a0@

FindSymbol:
	linkw	%fp,#-12
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	moveal	%fp@(12),%a3
	clrb	%sp@-
	jsr	%pc@(sub_1000036e)
	addqw	#2,%sp
	moveal	%d0,%a4
	movel	%a3,%d0
	bnes	.L1000081c
	lea	%fp@(-8),%a3

.L1000081c:
	movel	%a2,%d0
	bnes	.L10000824
	lea	%fp@(-4),%a2

.L10000824:
	movel	%a4,%d0
	bnes	.L10000832
	movew	#-2800,%d0
	movew	%d0,%fp@(24)
	bras	.L10000864

.L10000832:
	movel	%fp@(20),%d0
	beqs	.L1000083e
	movel	%fp@(16),%d0
	bnes	.L10000846

.L1000083e:
	moveq	#-50,%d0
	movew	%d0,%fp@(24)
	bras	.L10000864

.L10000846:
	subqw	#2,%sp
	movel	%a4,%sp@-
	movel	%fp@(20),%sp@-
	movel	%fp@(16),%sp@-
	movel	%a2,%sp@-
	pea	%fp@(-12)
	movel	%a3,%sp@-
	jsr	%pc@(FragResolveSymbol)
	movew	%sp@+,%d0
	movew	%d0,%fp@(24)

.L10000864:
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(16),%sp
	jmp	%a0@

CountSymbols:
	linkw	%fp,#-212
	moveml	%d3/%a2,%sp@-
	clrb	%sp@-
	jsr	%pc@(sub_1000036e)
	addqw	#2,%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	bnes	.L10000892
	movew	#-2800,%d0
	movew	%d0,%fp@(16)
	bras	.L100008d2

.L10000892:
	movel	%fp@(12),%d0
	beqs	.L1000089e
	movel	%fp@(8),%d0
	bnes	.L100008a6

.L1000089e:
	moveq	#-50,%d0
	movew	%d0,%fp@(16)
	bras	.L100008d2

.L100008a6:
	lea	%fp@(-72),%a0
	movel	%a0,%fp@(-188)
	subqw	#2,%sp
	movel	%a2,%sp@-
	movel	%fp@(12),%sp@-
	clrb	%sp@-
	pea	%fp@(-212)
	jsr	%pc@(FragGetConnectionInfo)
	movew	%sp@+,%d3
	bnes	.L100008cc
	moveal	%fp@(8),%a0
	movel	%fp@(-156),%a0@

.L100008cc:
	movew	%d3,%d0
	movew	%d0,%fp@(16)

.L100008d2:
	moveml	%sp@+,%d3/%a2
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#8,%sp
	jmp	%a0@

GetIndSymbol:
	linkw	%fp,#-8
	movel	%a2,%sp@-
	clrb	%sp@-
	jsr	%pc@(sub_1000036e)
	addqw	#2,%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	bnes	.L100008fc
	movew	#-2800,%d0
	movew	%d0,%fp@(28)
	bras	.L10000966

.L100008fc:
	movel	%fp@(24),%d0
	beqs	.L10000914
	movel	%fp@(16),%d0
	bnes	.L1000091c
	movel	%fp@(12),%d0
	bnes	.L1000091c
	movel	%fp@(8),%d0
	bnes	.L1000091c

.L10000914:
	moveq	#-50,%d0
	movew	%d0,%fp@(28)
	bras	.L10000966

.L1000091c:
	movel	%fp@(12),%d0
	bnes	.L1000092a
	lea	%fp@(-8),%a0
	movel	%a0,%fp@(12)

.L1000092a:
	movel	%fp@(8),%d0
	bnes	.L10000938
	lea	%fp@(-4),%a0
	movel	%a0,%fp@(8)

.L10000938:
	movel	%fp@(16),%d0
	beqs	.L10000944
	moveal	%fp@(16),%a0
	clrb	%a0@

.L10000944:
	subqw	#2,%sp
	movel	%a2,%sp@-
	movel	%fp@(24),%sp@-
	movel	%fp@(16),%sp@-
	movel	%fp@(8),%sp@-
	pea	%fp@(20)
	movel	%fp@(12),%sp@-
	jsr	%pc@(FragResolveSymbol)
	movew	%sp@+,%d0
	movew	%d0,%fp@(28)

.L10000966:
	moveal	%sp@+,%a2
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(20),%sp
	jmp	%a0@

FragCreateContext:
	linkw	%fp,#-16
	moveml	%d3/%a2-%a4,%sp@-
	pea	%fp@(-16)
	moveq	#1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	movel	%a4,%d0
	beqs	.L100009d8
	jsr	%pc@(sub_10002d36)
	moveal	%fp@(22),%a0
	movel	%d0,%a0@
	tstl	%d0
	bnes	.L100009ac
	movew	#-2811,%d0
	movew	%d0,%fp@(26)
	jmp	%pc@(.L10000ab6)

.L100009ac:
	movel	#1869815840,%d0
	lea	%fp@(-12),%a1
	_Gestalt
	movel	%a0,%a1@
	movew	%d0,%fp@(-16)
	tstw	%d0
	bnes	.L100009e4
	subqw	#2,%sp
	pea	%fp@(-8)
	_GetCurrentProcess
	movew	%sp@+,%d0
	movew	%d0,%fp@(-16)
	tstw	%d0
	beqs	.L100009f2

.L100009d8:
	movew	%fp@(-16),%d0
	movew	%d0,%fp@(26)
	jmp	%pc@(.L10000ab6)

.L100009e4:
	moveq	#8,%d0
	movel	%d0,%sp@-
	pea	%fp@(-8)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp

.L100009f2:
	moveq	#112,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	bnes	.L10000a0e
	movew	#-2809,%d0
	movew	%d0,%fp@(26)
	jmp	%pc@(.L10000ab6)

.L10000a0e:
	moveq	#28,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	movel	%d0,%a3@(108)
	tstl	%d0
	bnes	.L10000a34
	movel	%a3,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	movew	#-2809,%d0
	movew	%d0,%fp@(26)
	jmp	%pc@(.L10000ab6)

.L10000a34:
	moveal	%a3@(108),%a2
	movel	%a2@,%d0
	andil	#16777215,%d0
	oril	#16777216,%d0
	movel	%d0,%a2@
	moveal	%fp@(22),%a0
	movel	%a0@,%d0
	movel	%d0,%a3@(8)
	moveq	#1,%d3
	movel	%d3,%a3@(44)
	movel	%fp@(14),%a3@(72)
	movel	%d3,%a3@(16)
	movel	%d3,%a3@(20)
	movel	%fp@(18),%a3@(40)
	movew	%fp@(12),%a3@(26)
	movel	%fp@(8),%a3@(32)
	lea	%fp@(-8),%a0
	moveal	%a3,%a1
	moveq	#96,%d0
	addal	%d0,%a1
	movel	%a0@+,%a1@+
	movel	%a0@+,%a1@+
	moveb	#3,%a3@(64)
	moveal	%a4,%a0
	moveq	#36,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	moveb	%d3,%d0
	moveb	%d0,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_100031b0)
	lea	%sp@(10),%sp
	clrl	%sp@-
	clrl	%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_1000370c)
	lea	%sp@(12),%sp
	clrw	%d0
	movew	%d0,%fp@(26)

.L10000ab6:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(18),%sp
	jmp	%a0@

FragPrepare:
	linkw	%fp,#-84
	moveml	%d3-%d7/%a2-%a4,%sp@-
	movel	%fp@(28),%d6
	moveq	#-1,%d5
	clrb	%fp@(-8)
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-4)
	movel	%fp@(32),%d1
	beqs	.L10000b12
	moveal	%fp@(32),%a0
	moveb	%a0@,%d1
	moveq	#63,%d2
	cmpb	%d2,%d1
	blss	.L10000b12
	lea	%pc@(str_10000df6),%a0
	moveal	%d0,%a1
	movel	%a0,%a1@(624)
	moveal	%fp@(8),%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData
	moveq	#-50,%d0
	movew	%d0,%fp@(-20)
	braw	.L10000dbe

.L10000b12:
	movel	%fp@(20),%d0
	bnes	.L10000b20
	lea	%fp@(-16),%a0
	movel	%a0,%fp@(20)

.L10000b20:
	movel	%fp@(16),%d0
	bnes	.L10000b2e
	lea	%fp@(-12),%a0
	movel	%a0,%fp@(16)

.L10000b2e:
	moveq	#0,%d3
	moveal	%fp@(20),%a0
	movel	%d3,%a0@
	moveal	%fp@(16),%a0
	movel	%d3,%a0@
	clrb	%d3
	moveal	%fp@(8),%a2
	moveb	%d3,%a2@
	moveb	%d3,%a2@(1)
	pea	%fp@(-20)
	movel	%fp@(40),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	movel	%d0,%fp@(-84)
	tstl	%d0
	beqw	.L10000dbe
	movel	%fp@(36),%d0
	bnes	.L10000b8e
	movel	%fp@(32),%d0
	bnes	.L10000b8e
	lea	%pc@(str_10000e1a),%a0
	moveal	%fp@(-4),%a1
	movel	%a0,%a1@(624)
	moveal	%a2,%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData
	moveq	#-50,%d0
	movew	%d0,%fp@(-20)
	braw	.L10000dbe

.L10000b8e:
	moveq	#44,%d0
	movel	%d0,%sp@-
	pea	%fp@(-80)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movel	%fp@(36),%d0
	beqs	.L10000bb4
	movel	%fp@(32),%d0
	beqs	.L10000bb4
	movel	%fp@(32),%fp@(-76)
	moveq	#0,%d0
	movel	%d0,%fp@(32)

.L10000bb4:
	movel	%fp@(36),%d0
	beqs	.L10000bc0
	moveal	%fp@(36),%a0
	movel	%a0@,%d5

.L10000bc0:
	moveq	#1,%d3
	cmpl	%d3,%d5
	beqs	.L10000bce
	moveq	#2,%d0
	cmpl	%d0,%d5
	bnew	.L10000c78

.L10000bce:
	moveal	%fp@(36),%a0
	moveal	%a0@(4),%a2
	tstw	%a2@
	beqs	.L10000be0
	tstl	%a2@(2)
	bnes	.L10000c04

.L10000be0:
	lea	%pc@(str_10000e3e),%a0
	moveal	%fp@(-4),%a1
	movel	%a0,%a1@(624)
	moveal	%fp@(8),%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData
	moveq	#-50,%d0
	movew	%d0,%fp@(-20)
	braw	.L10000dbe

.L10000c04:
	movel	%d6,%d0
	moveq	#64,%d1
	andl	%d1,%d0
	beqs	.L10000c38
	moveal	%fp@(36),%a0
	moveal	%a0@(4),%a0
	addqw	#6,%a0
	moveal	%fp@(-84),%a2
	movel	%a0,%a2@(92)
	moveal	%a2@(108),%a0
	movel	%a0@,%d0
	moveq	#23,%d1
	lsrl	%d1,%d0
	moveq	#1,%d1
	andl	%d1,%d0
	bnes	.L10000c78
	movel	%a2,%sp@-
	jsr	%pc@(sub_100087ca)
	addqw	#4,%sp
	bras	.L10000c78

.L10000c38:
	moveal	%fp@(-84),%a2
	movew	%a2@(26),%d0
	moveal	%fp@(36),%a3
	moveal	%a3@(4),%a4
	movew	%a4@,%d3
	cmpw	%d3,%d0
	bnes	.L10000c5a
	movel	%a2@(32),%d0
	movel	%a4@(2),%d1
	cmpl	%d1,%d0
	beqs	.L10000c78

.L10000c5a:
	moveb	#1,%fp@(-8)
	movew	%a2@(24),%d7
	movel	%a2@(28),%d4
	movew	%d3,%a2@(24)
	moveal	%a3@(4),%a0
	movel	%a0@(2),%d0
	movel	%d0,%a2@(28)

.L10000c78:
	movel	%fp@(32),%d0
	beqs	.L10000c94
	moveal	%fp@(32),%a0
	tstb	%a0@
	beqs	.L10000c94
	movel	%fp@(32),%fp@(-80)
	movel	%fp@(32),%fp@(-76)
	bras	.L10000cbe

.L10000c94:
	tstl	%d5
	bnes	.L10000cbe
	moveb	#9,%fp@(-36)
	moveb	#94,%fp@(-35)
	pea	%fp@(-34)
	moveal	%fp@(36),%a0
	movel	%a0@(4),%sp@-
	jsr	%pc@(sub_1000338e)
	addqw	#8,%sp
	lea	%fp@(-36),%a0
	movel	%a0,%fp@(-80)

.L10000cbe:
	movel	%fp@(36),%d0
	beqs	.L10000cfe
	moveb	#1,%fp@(-46)
	moveal	%fp@(36),%a0
	lea	%fp@(-72),%a1
	movel	%a0@+,%a1@+
	movel	%a0@+,%a1@+
	movel	%a0@+,%a1@+
	movel	%a0@+,%a1@+
	moveal	%fp@(36),%a0
	movel	%a0@,%d3
	moveq	#1,%d0
	cmpl	%d0,%d3
	beqs	.L10000cec
	moveq	#2,%d0
	cmpl	%d0,%d3
	bnes	.L10000cf6

.L10000cec:
	moveal	%a0@(4),%a0
	addqw	#6,%a0
	movel	%a0,%fp@(-80)

.L10000cf6:
	moveb	#1,%fp@(-48)
	bras	.L10000d0c

.L10000cfe:
	clrb	%fp@(-46)
	moveq	#-1,%d3
	movel	%d3,%fp@(-44)
	movel	%d3,%fp@(-40)

.L10000d0c:
	movel	%fp@(24),%fp@(-56)
	movel	%fp@(8),%sp@-
	movel	%d6,%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(16),%sp@-
	pea	%fp@(-80)
	movel	%fp@(20),%sp@-
	movel	%fp@(-84),%sp@-
	jsr	%pc@(sub_100034b0)
	lea	%sp@(28),%sp
	movew	%d0,%fp@(-20)
	moveb	%fp@(-8),%d0
	beqs	.L10000d4a
	moveal	%fp@(-84),%a0
	movew	%d7,%a0@(24)
	movel	%d4,%a0@(28)

.L10000d4a:
	movel	%d6,%d0
	moveq	#64,%d1
	andl	%d1,%d0
	beqs	.L10000d80
	moveq	#0,%d0
	moveal	%fp@(-84),%a2
	movel	%d0,%a2@(92)
	moveal	%a2@(36),%a3
	movel	%a3,%d0
	beqs	.L10000d80
	movel	%a3@(20),%d0
	asll	#2,%d0
	moveq	#32,%d1
	addal	%d1,%a3
	addl	%a3,%d0
	moveal	%d0,%a0
	moveal	%a0@,%a0
	moveal	%a0@(12),%a0
	movel	%a0@(12),%d0
	movel	%d0,%a2@(92)

.L10000d80:
	movew	%fp@(-20),%d0
	bnes	.L10000dbe
	moveal	%fp@(12),%a0
	tstb	%a0@
	bnes	.L10000dbe
	movel	%d6,%d0
	moveq	#8,%d1
	andl	%d1,%d0
	beqs	.L10000dbe
	moveal	%fp@(20),%a0
	movel	%a0@,%sp@-
	movel	%fp@(-84),%sp@-
	jsr	%pc@(sub_10003172)
	addqw	#8,%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	bnes	.L10000db4
	movew	#-2801,%fp@(-20)
	bras	.L10000dbe

.L10000db4:
	movel	%a2@(8),%d0
	moveal	%fp@(20),%a0
	movel	%d0,%a0@

.L10000dbe:
	movew	%fp@(-20),%d0
	bnes	.L10000dd0
	moveq	#0,%d0
	moveal	%fp@(-4),%a0
	movel	%d0,%a0@(624)
	bras	.L10000dde

.L10000dd0:
	movew	%fp@(-20),%d0
	extl	%d0
	moveal	%fp@(-4),%a0
	movel	%d0,%a0@(628)

.L10000dde:
	movew	%fp@(-20),%d0
	movew	%d0,%fp@(44)
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(36),%sp
	jmp	%a0@

	.byte	0x00,0x68

str_10000df6:
	.byte	0x21
	.ascii	"FragPrepare: regLibName too long."
	.byte	0x00,0x00

str_10000e1a:
	.byte	0x22
	.ascii	"FragPrepare: need locator or name."
	.byte	0x00

str_10000e3e:
	.byte	0x1e
	.ascii	"FragPrepare: need real FSSpec."
	.byte	0x00

FragPrepareAccRsrc:
	linkw	%fp,#-44
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(20),%a4
	pea	%fp@(-12)
	movel	%a4,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	movel	%d0,%fp@(-44)
	tstl	%d0
	beqs	.L10000eca
	moveq	#0,%d1
	movel	%d1,%fp@(-40)
	movel	%fp@(16),%fp@(-36)
	moveq	#0,%d1
	movel	%d1,%fp@(-32)
	moveb	#0x80,%fp@(-28)
	subqw	#2,%sp
	movel	%a4,%sp@-
	pea	%fp@(-40)
	pea	%pc@(str_10001024)
	moveq	#1,%d1
	movel	%d1,%sp@-
	movel	#1886875747,%sp@-
	pea	%fp@(-20)
	movel	%fp@(12),%sp@-
	pea	%fp@(-24)
	movel	%fp@(8),%sp@-
	jsr	%pc@(FragPrepare)
	movew	%sp@+,%d0
	movew	%d0,%fp@(-12)
	tstw	%d0
	beqs	.L10000ed6

.L10000eca:
	movew	%fp@(-12),%d0
	movew	%d0,%fp@(24)
	jmp	%pc@(.L10001014)

.L10000ed6:
	pea	%fp@(-12)
	movel	%fp@(-20),%sp@-
	movel	%fp@(-44),%sp@-
	jsr	%pc@(sub_10003138)
	lea	%sp@(12),%sp
	movel	%d0,%fp@(-16)
	tstl	%d0
	bnes	.L10000efe
	movew	#-2819,%d0
	movew	%d0,%fp@(24)
	jmp	%pc@(.L10001014)

.L10000efe:
	moveal	%fp@(-16),%a2
	movel	%a2@(20),%d0
	asll	#2,%d0
	addl	%a2,%d0
	moveal	%d0,%a0
	moveal	%a0@(32),%a3
	moveal	%fp@(12),%a0
	tstl	%a0@
	bnes	.L10000f20
	movew	#-2824,%fp@(-12)
	bras	.L10000f50

.L10000f20:
	pea	%fp@(-8)
	moveq	#2,%d0
	movel	%d0,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10004b5a)
	lea	%sp@(12),%sp
	movew	%d0,%fp@(-12)
	tstw	%d0
	bnes	.L10000f42
	movew	#-2824,%fp@(-12)
	bras	.L10000f50

.L10000f42:
	cmpiw	#-2802,%fp@(-12)
	bnes	.L10000f50
	clrw	%d0
	movew	%d0,%fp@(-12)

.L10000f50:
	movew	%fp@(-12),%d0
	beqs	.L10000f74
	subqw	#2,%sp
	movel	%a4,%sp@-
	movel	%fp@(-20),%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	jsr	%pc@(FragRelease)
	addqw	#2,%sp
	movew	%fp@(-12),%d0
	movew	%d0,%fp@(24)
	jmp	%pc@(.L10001014)

.L10000f74:
	moveq	#4,%d0
	movel	%d0,%sp@-
	movel	%fp@(-20),%sp@-
	movel	%fp@(-44),%sp@-
	jsr	%pc@(sub_1000370c)
	lea	%sp@(12),%sp
	moveal	%fp@(-16),%a2
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-4)
	moveal	%fp@(-16),%a3
	moveq	#32,%d0
	addal	%d0,%a3
	moveq	#0,%d4
	moveal	%a3,%a4
	bras	.L10000fc6

.L10000fa2:
	moveal	%a4@,%a3
	moveal	%a3@(40),%a2
	movel	%a2,%d0
	beqs	.L10000fbc
	movel	%fp@(-44),%sp@-
	movel	%a2,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10001030)
	lea	%sp@(12),%sp

.L10000fbc:
	movel	%fp@(-16),%a3@(40)
	addqw	#4,%a4
	addql	#4,%d4

.L10000fc6:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	moveq	#2,%d3
	asll	%d3,%d0
	cmpl	%d4,%d0
	bgts	.L10000fa2
	moveal	%fp@(-16),%a2
	movel	%a2@(20),%d0
	asll	%d3,%d0
	addl	%a2,%d0
	moveal	%d0,%a0
	moveal	%a0@(32),%a3
	moveq	#-1,%d0
	movel	%d0,%a2@(20)
	movel	%fp@(-44),%sp@-
	movel	%a2,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10001030)
	lea	%sp@(12),%sp
	clrl	%sp@-
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	movel	%fp@(-44),%sp@-
	jsr	%pc@(sub_100054ec)
	lea	%sp@(16),%sp
	clrw	%d0
	movew	%d0,%fp@(24)

.L10001014:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(16),%sp
	jmp	%a0@

	.byte	0x00,0x0c

str_10001024:
	.byte	0x09
	.ascii	"<AccRsrc>"
	.byte	0x00,0x00

sub_10001030:
	linkw	%fp,#-12
	moveml	%d3-%d5/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	subql	#1,%a4@(44)
	moveq	#0,%d0
	movel	%d0,%a4@(40)
	moveal	%fp@(12),%a2
	subql	#1,%a2@(16)
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-12)
	moveal	%fp@(12),%a0
	moveq	#32,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveq	#0,%d5
	moveal	%a0,%a3
	bras	.L1000107e

.L10001068:
	moveal	%a3@,%a0
	cmpal	%a4,%a0
	bnes	.L1000107a
	movel	%d5,%d4
	divsll	#4,%d4,%d4
	bras	.L10001094

.L1000107a:
	addqw	#4,%a3
	addql	#4,%d5

.L1000107e:
	moveal	%fp@(-12),%a0
	movel	%a0@,%d0
	asll	#2,%d0
	cmpl	%d5,%d0
	bgts	.L10001068
	movel	%d5,%d4
	divsll	#4,%d4,%d4

.L10001094:
	moveal	%fp@(12),%a2
	movel	%a2@(20),%d0
	cmpl	%d4,%d0
	bnes	.L100010a8
	moveq	#-1,%d0
	movel	%d0,%a2@(20)
	bras	.L100010c6

.L100010a8:
	moveal	%fp@(12),%a2
	movel	%a2@(20),%d0
	cmpl	%d4,%d0
	bles	.L100010c6
	subql	#1,%a2@(20)
	bras	.L100010c6

.L100010ba:
	movel	%a3@,%d0
	movel	%d0,%a4@
	addqw	#4,%a3
	addqw	#4,%a4
	addql	#1,%d4
	bras	.L100010e6

.L100010c6:
	moveal	%fp@(12),%a2
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-4)
	movel	%d4,%d3
	asll	#2,%d3
	addl	%fp@(12),%d3
	moveal	%d3,%a3
	moveq	#36,%d0
	addal	%d0,%a3
	moveal	%d3,%a4
	moveq	#32,%d0
	addal	%d0,%a4

.L100010e6:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	cmpl	%d4,%d0
	bgts	.L100010ba
	moveal	%fp@(12),%a2
	movel	%a2@(16),%d0
	bgts	.L10001106
	movel	%fp@(16),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003abe)
	addqw	#8,%sp

.L10001106:
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

FragReloadAccRsrc:
	linkw	%fp,#-100
	moveml	%d3-%d5/%a2,%sp@-
	moveal	%fp@(12),%a2
	pea	%pc@(sub_100086be)
	pea	%pc@(sub_100086ae)
	moveb	#0x80,%sp@-
	pea	%pc@(byte_100012de)
	movel	%a2,%sp@-
	clrl	%sp@-
	pea	%fp@(-96)
	pea	%fp@(-100)
	jsr	%pc@(sub_10008dfc)
	lea	%sp@(30),%sp
	movew	%d0,%d4
	beqs	.L1000114c
	movew	%d4,%d0
	movew	%d0,%fp@(16)
	jmp	%pc@(.L100012d0)

.L1000114c:
	movel	%fp@(-96),%sp@-
	moveal	%fp@(-100),%a0
	moveal	%a0@(20),%a0
	jsr	%a0@
	addqw	#4,%sp
	movel	%d0,%d5
	moveq	#0,%d3
	bras	.L10001198

.L10001162:
	pea	%fp@(-92)
	movel	%d3,%sp@-
	movel	%fp@(-96),%sp@-
	moveal	%fp@(-100),%a0
	moveal	%a0@(24),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movel	%fp@(-90),%d0
	addl	%a2,%d0
	movel	%d0,%sp@-
	movel	%d3,%sp@-
	movel	%fp@(-96),%sp@-
	moveal	%fp@(-100),%a0
	moveal	%a0@(28),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	addql	#1,%d3

.L10001198:
	cmpl	%d5,%d3
	blts	.L10001162
	moveq	#0,%d3
	bras	.L1000120a

.L100011a0:
	pea	%fp@(-92)
	movel	%d3,%sp@-
	movel	%fp@(-96),%sp@-
	moveal	%fp@(-100),%a0
	moveal	%a0@(24),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d4
	bnew	.L100012b0
	moveb	%fp@(-92),%d0
	moveq	#2,%d1
	andb	%d1,%d0
	beqs	.L100011e6
	movel	%fp@(-78),%sp@-
	movel	%d3,%sp@-
	movel	%fp@(-96),%sp@-
	moveal	%fp@(-100),%a0
	moveal	%a0@(64),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d4
	bnew	.L100012b0

.L100011e6:
	moveb	%fp@(-92),%d0
	moveq	#1,%d1
	andb	%d1,%d0
	beqs	.L10001208
	movel	%fp@(-86),%d0
	beqs	.L10001208
	movel	#1886875747,%sp@-
	movel	%fp@(-78),%sp@-
	movel	%fp@(-86),%sp@-
	jsr	%pc@(sub_10008db2)

.L10001208:
	addql	#1,%d3

.L1000120a:
	cmpl	%d5,%d3
	blts	.L100011a0
	pea	%fp@(-24)
	pea	%fp@(-48)
	pea	%fp@(-72)
	movel	%fp@(-96),%sp@-
	moveal	%fp@(-100),%a0
	moveal	%a0@(44),%a0
	jsr	%a0@
	lea	%sp@(16),%sp
	movew	%d0,%d4
	bnew	.L100012b0
	movel	%fp@(-72),%d0
	moveq	#-3,%d1
	cmpl	%d1,%d0
	beqs	.L1000124a
	moveq	#-2,%d1
	cmpl	%d1,%d0
	beqs	.L1000124a
	moveq	#-1,%d1
	cmpl	%d1,%d0
	beqs	.L1000124a
	bras	.L1000125c

.L1000124a:
	moveq	#0,%d0
	moveal	%fp@(8),%a0
	movel	%d0,%a0@
	movew	#-2802,%d0
	movew	%d0,%fp@(16)
	bras	.L100012d0

.L1000125c:
	pea	%fp@(-92)
	movel	%fp@(-72),%sp@-
	movel	%fp@(-96),%sp@-
	moveal	%fp@(-100),%a0
	moveal	%a0@(24),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	moveal	%fp@(-78),%a0
	addal	%fp@(-68),%a0
	moveal	%fp@(8),%a1
	movel	%a0,%a1@
	movel	#1886875747,%sp@-
	jsr	%pc@(sub_10008dc0)
	moveq	#1,%d0
	moveb	%d0,%sp@-
	pea	%pc@(sub_100086be)
	pea	%fp@(-96)
	moveal	%fp@(-100),%a0
	moveal	%a0@(12),%a0
	jsr	%a0@
	lea	%sp@(10),%sp
	clrw	%d0
	movew	%d0,%fp@(16)
	bras	.L100012d0

.L100012b0:
	moveq	#1,%d0
	moveb	%d0,%sp@-
	pea	%pc@(sub_100086be)
	pea	%fp@(-96)
	moveal	%fp@(-100),%a0
	moveal	%a0@(12),%a0
	jsr	%a0@
	lea	%sp@(10),%sp
	movew	%d4,%d0
	movew	%d0,%fp@(16)

.L100012d0:
	moveml	%sp@+,%d3-%d5/%a2
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#8,%sp
	jmp	%a0@

	.byte	0x00,0x02

byte_100012de:
	.byte	0x00,0x00

FragApplyUpdate:
	linkw	%fp,#-12
	moveml	%d3/%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	pea	%fp@(-4)
	movel	%fp@(16),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	beqw	.L100013ac
	pea	%fp@(-4)
	movel	%fp@(12),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_100030fe)
	lea	%sp@(12),%sp
	movel	%d0,%fp@(-12)
	tstl	%d0
	bnes	.L1000134e
	pea	%fp@(-4)
	movel	%fp@(12),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003138)
	lea	%sp@(12),%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L1000134e
	movel	%a3@(20),%d0
	bmis	.L1000134e
	movel	%a3@(20),%d0
	asll	#2,%d0
	addl	%a3,%d0
	moveal	%d0,%a0
	movel	%a0@(32),%d0
	movel	%d0,%fp@(-12)

.L1000134e:
	movel	%fp@(-12),%d0
	beqs	.L100013ac
	pea	%fp@(-4)
	movel	%fp@(8),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003138)
	lea	%sp@(12),%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L10001392
	movel	%a3@(20),%d0
	bpls	.L1000137e
	movew	#-2801,%d0
	movew	%d0,%fp@(20)
	jmp	%pc@(.L10001432)

.L1000137e:
	movel	%a3@(20),%d0
	asll	#2,%d0
	addl	%a3,%d0
	moveal	%d0,%a0
	movel	%a0@(32),%d0
	movel	%d0,%fp@(-8)
	bras	.L100013b6

.L10001392:
	pea	%fp@(-4)
	movel	%fp@(8),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_100030fe)
	lea	%sp@(12),%sp
	movel	%d0,%fp@(-8)
	tstl	%d0
	bnes	.L100013b6

.L100013ac:
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(20)
	bras	.L10001432

.L100013b6:
	moveal	%fp@(-8),%a2
	movel	%a2@(44),%d0
	moveq	#1,%d3
	cmpl	%d3,%d0
	bgts	.L100013d6
	moveal	%a2@(12),%a0
	movel	%a0@(100),%d0
	cmpl	%d3,%d0
	bgts	.L100013d6
	tstl	%a2@(52)
	beqs	.L100013e6

.L100013d6:
	lea	%pc@(str_10001442),%a0
	movel	%a0,%a4@(624)
	moveq	#-50,%d0
	movew	%d0,%fp@(20)
	bras	.L10001432

.L100013e6:
	moveal	%fp@(-12),%a4
	bras	.L100013f0

.L100013ec:
	moveal	%a4@(52),%a4

.L100013f0:
	tstl	%a4@(52)
	bnes	.L100013ec
	moveal	%a4@(12),%a0
	movel	%a0@(40),%d0
	addql	#1,%d0
	moveal	%fp@(-8),%a2
	moveal	%a2@(12),%a0
	movel	%d0,%a0@(40)
	movel	%a2,%a4@(52)
	movel	%a2@(12),%d0
	moveal	%a4@(12),%a0
	movel	%d0,%a0@(124)
	moveq	#1,%d0
	moveb	%d0,%sp@-
	movel	%fp@(-12),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003edc)
	lea	%sp@(10),%sp
	movew	%d0,%fp@(20)

.L10001432:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(12),%sp
	jmp	%a0@

	.byte	0x00,0x36

str_10001442:
	.byte	0x34
	.ascii	"FragApplyUpdate: updating connection already in use."
	.byte	0x00

FragResolveSymbol:
	linkw	%fp,#-48
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(20),%a4
	jsr	%pc@(sub_100033dc)
	movel	%fp@(16),%d0
	bnes	.L10001496
	lea	%fp@(-12),%a0
	movel	%a0,%fp@(16)

.L10001496:
	movel	%fp@(12),%d0
	bnes	.L100014a4
	lea	%fp@(-8),%a0
	movel	%a0,%fp@(12)

.L100014a4:
	movel	%fp@(8),%d0
	bnes	.L100014b2
	lea	%fp@(-4),%a0
	movel	%a0,%fp@(8)

.L100014b2:
	pea	%fp@(-44)
	movel	%fp@(28),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	beqw	.L100015fe
	pea	%fp@(-44)
	movel	%fp@(24),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003138)
	lea	%sp@(12),%sp
	movel	%d0,%fp@(-48)
	tstl	%d0
	beqs	.L1000150a
	moveal	%d0,%a0
	movel	%a0@(20),%d0
	bpls	.L100014f6
	movew	#-2801,%d0
	movew	%d0,%fp@(32)
	jmp	%pc@(.L10001606)

.L100014f6:
	moveal	%fp@(-48),%a2
	movel	%a2@(20),%d0
	asll	#2,%d0
	addl	%a2,%d0
	moveal	%d0,%a0
	moveal	%a0@(32),%a3
	bras	.L10001524

.L1000150a:
	pea	%fp@(-44)
	movel	%fp@(24),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_100030fe)
	lea	%sp@(12),%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqw	.L100015fe

.L10001524:
	movel	%a4,%d0
	beqs	.L10001558
	tstb	%a4@
	beqs	.L10001558
	movel	%fp@(8),%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(16),%sp@-
	moveb	%a4@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	movel	%d0,%sp@-
	moveal	%a4,%a0
	addqw	#1,%a0
	movel	%a0,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10004be2)
	lea	%sp@(24),%sp
	movew	%d0,%fp@(-44)
	braw	.L100015fe

.L10001558:
	moveal	%fp@(12),%a0
	movel	%a0@,%d3
	bras	.L1000156e

.L10001560:
	moveal	%a3@(12),%a0
	movel	%a0@(116),%d0
	subl	%d0,%d3
	moveal	%a3@(52),%a3

.L1000156e:
	movel	%a3,%d0
	beqs	.L1000157e
	moveal	%a3@(12),%a0
	movel	%a0@(116),%d0
	cmpl	%d3,%d0
	bles	.L10001560

.L1000157e:
	movel	%a3,%d0
	bnes	.L1000158c
	movew	#-2802,%d0
	movew	%d0,%fp@(32)
	bras	.L10001606

.L1000158c:
	pea	%fp@(-40)
	movel	%d3,%sp@-
	moveal	%a3@(12),%a2
	movel	%a2@(72),%sp@-
	moveal	%a2@(68),%a0
	moveal	%a0@(36),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%fp@(-44)
	movel	%a4,%d0
	beqs	.L100015e0
	movel	%fp@(-32),%d0
	moveq	#16,%d1
	lsrl	%d1,%d0
	movel	%d0,%fp@(-16)
	cmpil	#256,%fp@(-16)
	bccs	.L100015ca
	movel	%d0,%d3
	bras	.L100015d0

.L100015ca:
	movel	#255,%d3

.L100015d0:
	moveal	%fp@(-28),%a0
	moveal	%a4,%a1
	addqw	#1,%a1
	movel	%d3,%d0
	_BlockMoveData
	moveb	%fp@(-13),%a4@

.L100015e0:
	moveal	%fp@(16),%a0
	moveb	%fp@(-24),%a0@
	movel	%fp@(8),%sp@-
	pea	%fp@(-40)
	movel	%a3,%sp@-
	jsr	%pc@(sub_10004c9c)
	lea	%sp@(12),%sp
	movew	%d0,%fp@(-44)

.L100015fe:
	movew	%fp@(-44),%d0
	movew	%d0,%fp@(32)

.L10001606:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(24),%sp
	jmp	%a0@

FragRelease:
	linkw	%fp,#-4
	moveml	%a2-%a4,%sp@-
	pea	%fp@(-4)
	movel	%fp@(14),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	beqw	.L100016d0
	movel	%fp@(10),%d0
	bnew	.L100016b8
	moveb	#0xff,%a4@(64)
	cmpib	#2,%fp@(8)
	bnes	.L10001672
	moveal	%a4@(84),%a3
	bras	.L10001664

.L1000164e:
	moveq	#1,%d0
	movel	%d0,%sp@-
	moveb	%fp@(8),%sp@-
	movel	%a3,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_100038de)
	lea	%sp@(14),%sp
	moveal	%a3@,%a3

.L10001664:
	movel	%a3,%d0
	bnes	.L1000164e
	clrw	%d0
	movew	%d0,%fp@(18)
	jmp	%pc@(.L10001708)

.L10001672:
	moveal	%a4@(84),%a3
	moveal	%a4,%a2
	moveq	#84,%d0
	addal	%d0,%a2
	bras	.L10001694

.L1000167e:
	moveq	#1,%d0
	movel	%d0,%sp@-
	moveb	%fp@(8),%sp@-
	movel	%a3,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_100038de)
	lea	%sp@(14),%sp
	moveal	%a2@,%a3

.L10001694:
	movel	%a3,%d0
	bnes	.L1000167e
	moveq	#3,%d0
	movel	%d0,%sp@-
	clrl	%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_1000370c)
	lea	%sp@(12),%sp
	movel	%a4,%sp@-
	jsr	%pc@(sub_10002e94)
	addqw	#4,%sp
	clrw	%d0
	movew	%d0,%fp@(18)
	bras	.L10001708

.L100016b8:
	pea	%fp@(-4)
	movel	%fp@(10),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10003138)
	lea	%sp@(12),%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	bnes	.L100016da

.L100016d0:
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(18)
	bras	.L10001708

.L100016da:
	tstb	%a3@(14)
	beqs	.L100016f0
	moveb	%fp@(8),%d0
	beqs	.L100016f0
	movew	#-2801,%d0
	movew	%d0,%fp@(18)
	bras	.L10001708

.L100016f0:
	clrl	%sp@-
	moveb	%fp@(8),%sp@-
	movel	%a3,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_100038de)
	lea	%sp@(14),%sp
	clrw	%d0
	movew	%d0,%fp@(18)

.L10001708:
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(10),%sp
	jmp	%a0@

FragRegisterMemLib:
	linkw	%fp,#-12
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(10),%a3
	movel	%fp@(14),%d4
	pea	%fp@(-12)
	moveq	#1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a2
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-4)
	movel	%a3,%d1
	beqs	.L1000175e
	moveb	%a3@,%d1
	moveq	#63,%d2
	cmpb	%d2,%d1
	blss	.L1000175e
	lea	%pc@(str_100018c4),%a0
	moveal	%d0,%a1
	movel	%a0,%a1@(624)
	moveq	#-50,%d0
	movew	%d0,%fp@(22)
	jmp	%pc@(.L100018b4)

.L1000175e:
	movel	%a2,%d0
	bnes	.L1000176e
	movew	%fp@(-12),%d0
	movew	%d0,%fp@(22)
	jmp	%pc@(.L100018b4)

.L1000176e:
	moveal	%fp@(18),%a0
	tstl	%a0@
	beqs	.L1000178c
	lea	%pc@(str_100018ec),%a0
	moveal	%fp@(-4),%a1
	movel	%a0,%a1@(624)
	moveq	#-50,%d0
	movew	%d0,%fp@(22)
	jmp	%pc@(.L100018b4)

.L1000178c:
	moveb	%a3@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	movel	%d0,%fp@(-8)
	cmpil	#64,%fp@(-8)
	bcss	.L100017b6
	lea	%pc@(str_10001930),%a0
	moveal	%fp@(-4),%a1
	movel	%a0,%a1@(624)
	moveq	#-50,%d0
	movew	%d0,%fp@(22)
	jmp	%pc@(.L100018b4)

.L100017b6:
	moveal	%fp@(-4),%a0
	moveal	%a0@(20),%a4
	bras	.L100017f4

.L100017c0:
	movel	%a4@(8),%d0
	cmpl	%d4,%d0
	bnes	.L100017f2
	movew	%a4@(24),%d0
	extl	%d0
	movel	%fp@(-8),%d3
	cmpl	%d3,%d0
	bnes	.L100017f2
	movel	%d3,%sp@-
	moveal	%a4,%a0
	moveq	#27,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	moveal	%a3,%a0
	addqw	#1,%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_100057aa)
	lea	%sp@(12),%sp
	tstl	%d0
	bnes	.L100017f8

.L100017f2:
	moveal	%a4@,%a4

.L100017f4:
	movel	%a4,%d0
	bnes	.L100017c0

.L100017f8:
	moveb	%fp@(8),%d0
	beqs	.L10001832
	movel	%a4,%d0
	bnes	.L1000180e
	movew	#-2804,%d0
	movew	%d0,%fp@(22)
	jmp	%pc@(.L100018b4)

.L1000180e:
	moveal	%fp@(-4),%a0
	moveq	#20,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10003200)
	addqw	#8,%sp
	movel	%a4,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	clrw	%d0
	movew	%d0,%fp@(22)
	jmp	%pc@(.L100018b4)

.L10001832:
	movel	%a4,%d0
	beqs	.L10001840
	movew	#-2805,%d0
	movew	%d0,%fp@(22)
	bras	.L100018b4

.L10001840:
	movel	%fp@(-8),%d0
	moveq	#28,%d1
	addl	%d1,%d0
	addql	#1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L10001862
	movew	#-2809,%d0
	movew	%d0,%fp@(22)
	bras	.L100018b4

.L10001862:
	movel	%d4,%a4@(8)
	moveq	#1,%d3
	movel	%d3,%a4@(12)
	moveal	%fp@(18),%a2
	movel	%a2@(4),%d0
	movel	%d0,%a4@(16)
	movel	%a2@(8),%d0
	movel	%d0,%a4@(20)
	movew	%fp@(-6),%a4@(24)
	moveal	%a3,%a0
	addqw	#1,%a0
	moveal	%a4,%a1
	moveq	#27,%d0
	addal	%d0,%a1
	movel	%fp@(-8),%d0
	_BlockMoveData
	moveal	%fp@(-4),%a0
	moveq	#20,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	moveb	%d3,%d0
	moveb	%d0,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_100031b0)
	lea	%sp@(10),%sp
	clrw	%d0
	movew	%d0,%fp@(22)

.L100018b4:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(14),%sp
	jmp	%a0@

	.byte	0x00,0x90

str_100018c4:
	.byte	0x25
	.ascii	"FragRegisterMemLib: libName too long."
	.byte	0x00,0x00

str_100018ec:
	.byte	0x41
	.ascii	"FragRegisterMemLib: locator not to kMemoryCFragLocator container."
	.byte	0x00,0x00

str_10001930:
	.byte	0x22
	.ascii	"FragRegisterMemLib: name too long."
	.byte	0x00

FragAddSearchProc:
	linkw	%fp,#-4
	moveml	%a3-%a4,%sp@-
	pea	%fp@(-4)
	moveq	#1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L1000197e
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(14)
	bras	.L100019ba

.L1000197e:
	moveq	#12,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	bnes	.L10001998
	movew	#-2809,%d0
	movew	%d0,%fp@(14)
	bras	.L100019ba

.L10001998:
	movel	%fp@(10),%a3@(8)
	moveal	%a4,%a0
	moveq	#52,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	moveb	%fp@(8),%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_100031b0)
	lea	%sp@(10),%sp
	clrw	%d0
	movew	%d0,%fp@(14)

.L100019ba:
	moveml	%sp@+,%a3-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#6,%sp
	jmp	%a0@

FragRemoveSearchProc:
	linkw	%fp,#-4
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	pea	%fp@(-4)
	moveq	#1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L100019f4
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(12)
	bras	.L10001a34

.L100019f4:
	moveal	%a4@(52),%a2
	bras	.L10001a04

.L100019fa:
	moveal	%a2@(8),%a0
	cmpal	%a3,%a0
	beqs	.L10001a08
	moveal	%a2@,%a2

.L10001a04:
	movel	%a2,%d0
	bnes	.L100019fa

.L10001a08:
	movel	%a2,%d0
	bnes	.L10001a16
	movew	#-2804,%d0
	movew	%d0,%fp@(12)
	bras	.L10001a34

.L10001a16:
	moveal	%a4,%a0
	moveq	#52,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003200)
	addqw	#8,%sp
	movel	%a2,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	clrw	%d0
	movew	%d0,%fp@(12)

.L10001a34:
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#4,%sp
	jmp	%a0@

FragAddNotifyProc:
	linkw	%fp,#-4
	moveml	%a2-%a4,%sp@-
	pea	%fp@(-4)
	moveq	#1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a2
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	movel	%a2,%d0
	bnes	.L10001a6c
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(12)
	bras	.L10001aa8

.L10001a6c:
	moveq	#12,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	bnes	.L10001a86
	movew	#-2809,%d0
	movew	%d0,%fp@(12)
	bras	.L10001aa8

.L10001a86:
	movel	%fp@(8),%a3@(8)
	moveal	%a4,%a0
	moveq	#44,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_100031b0)
	lea	%sp@(10),%sp
	clrw	%d0
	movew	%d0,%fp@(12)

.L10001aa8:
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#4,%sp
	jmp	%a0@

FragRemoveNotifyProc:
	linkw	%fp,#-4
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	pea	%fp@(-4)
	moveq	#1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a2
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	movel	%a2,%d0
	bnes	.L10001ae4
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(12)
	bras	.L10001b24

.L10001ae4:
	moveal	%a4@(44),%a2
	bras	.L10001af4

.L10001aea:
	moveal	%a2@(8),%a0
	cmpal	%a3,%a0
	beqs	.L10001af8
	moveal	%a2@,%a2

.L10001af4:
	movel	%a2,%d0
	bnes	.L10001aea

.L10001af8:
	movel	%a2,%d0
	bnes	.L10001b06
	movew	#-2804,%d0
	movew	%d0,%fp@(12)
	bras	.L10001b24

.L10001b06:
	moveal	%a4,%a0
	moveq	#44,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003200)
	addqw	#8,%sp
	movel	%a2,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	clrw	%d0
	movew	%d0,%fp@(12)

.L10001b24:
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#4,%sp
	jmp	%a0@

sub_10001b30:
	linkw	%fp,#-8
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	movel	%fp@(12),%d4
	pea	%fp@(-8)
	moveq	#1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a2
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-4)
	movel	%a2,%d0
	bnes	.L10001b66
	movew	%fp@(-8),%d0
	movew	%d0,%fp@(16)
	bras	.L10001bc8

.L10001b66:
	moveal	%fp@(-4),%a0
	moveal	%a0@(20),%a3
	moveq	#0,%d3
	bras	.L10001b76

.L10001b72:
	moveal	%a3@,%a3
	addql	#1,%d3

.L10001b76:
	movel	%a3,%d0
	beqs	.L10001b7e
	cmpl	%d4,%d3
	blts	.L10001b72

.L10001b7e:
	movel	%a3,%d0
	bnes	.L10001b8c
	movew	#-2804,%d0
	movew	%d0,%fp@(16)
	bras	.L10001bc8

.L10001b8c:
	moveal	%a3,%a0
	moveq	#27,%d0
	addal	%d0,%a0
	moveal	%a4,%a1
	addqw	#1,%a1
	movew	%a3@(24),%d0
	extl	%d0
	_BlockMoveData
	movew	%a3@(24),%d0
	moveb	%d0,%a4@
	moveq	#0,%d0
	movel	%d0,%a4@(64)
	movel	%a3@(16),%d0
	movel	%d0,%a4@(68)
	movel	%a3@(20),%d0
	movel	%d0,%a4@(72)
	moveb	%a3@(26),%d0
	moveb	%d0,%a4@(76)
	clrw	%d0
	movew	%d0,%fp@(16)

.L10001bc8:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#8,%sp
	jmp	%a0@

FragGetMemRegistryInfo:
	linkw	%fp,#0
	subqw	#2,%sp
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10001b30)
	movew	%sp@+,%d0
	movew	%d0,%fp@(16)
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#8,%sp
	jmp	%a0@

FragGetContextInfo:
	linkw	%fp,#-4
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	pea	%fp@(-4)
	moveq	#1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a4
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a2
	movel	%a4,%d0
	bnes	.L10001c26
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(18)
	jmp	%pc@(.L10001cb6)

.L10001c26:
	movel	%fp@(14),%d0
	bnes	.L10001c36
	moveal	%a2@(36),%a4
	clrb	%fp@(12)
	bras	.L10001c46

.L10001c36:
	pea	%fp@(-4)
	movel	%fp@(14),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a4

.L10001c46:
	movel	%a4,%d0
	beqs	.L10001c56
	moveb	%fp@(12),%d0
	beqs	.L10001c52
	moveal	%a4@,%a4

.L10001c52:
	movel	%a4,%d0
	bnes	.L10001c60

.L10001c56:
	movew	#-2800,%d0
	movew	%d0,%fp@(18)
	bras	.L10001cb6

.L10001c60:
	movel	%a4@(8),%d0
	movel	%d0,%a3@
	movel	%a4@(40),%d0
	movel	%d0,%a3@(4)
	movel	%a4@(44),%d0
	movel	%d0,%a3@(8)
	tstl	%a4@(36)
	bnes	.L10001c84
	moveq	#0,%d0
	movel	%d0,%a3@(12)
	bras	.L10001c90

.L10001c84:
	moveal	%a4@(36),%a0
	movel	%a0@(8),%d0
	movel	%d0,%a3@(12)

.L10001c90:
	movel	%a4@(32),%d0
	movel	%d0,%a3@(16)
	movew	%a4@(26),%d0
	movew	%d0,%a3@(20)
	moveal	%a4,%a0
	moveq	#96,%d0
	addal	%d0,%a0
	moveal	%a3,%a1
	moveq	#24,%d0
	addal	%d0,%a1
	movel	%a0@+,%a1@+
	movel	%a0@+,%a1@+
	clrw	%d0
	movew	%d0,%fp@(18)

.L10001cb6:
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(10),%sp
	jmp	%a0@

FragGetClosureInfo:
	linkw	%fp,#-4
	moveml	%d3-%d6/%a2-%a4,%sp@-
	movel	%fp@(12),%d4
	movel	%fp@(16),%d5
	pea	%fp@(-4)
	movel	%fp@(30),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	bnes	.L10001cf4
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(34)
	jmp	%pc@(.L10001db8)

.L10001cf4:
	movel	%fp@(26),%d0
	bnes	.L10001d04
	moveal	%a2@(84),%a3
	clrb	%fp@(24)
	bras	.L10001d18

.L10001d04:
	pea	%fp@(-4)
	movel	%fp@(26),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003138)
	lea	%sp@(12),%sp
	moveal	%d0,%a3

.L10001d18:
	movel	%a3,%d0
	beqs	.L10001d28
	moveb	%fp@(24),%d0
	beqs	.L10001d24
	moveal	%a3@,%a3

.L10001d24:
	movel	%a3,%d0
	bnes	.L10001d34

.L10001d28:
	movew	#-2801,%d0
	movew	%d0,%fp@(34)
	jmp	%pc@(.L10001db8)

.L10001d34:
	movel	%a3@(8),%d0
	moveal	%fp@(20),%a2
	movel	%d0,%a2@
	movel	%a3@(20),%d0
	bpls	.L10001d4c
	moveq	#0,%d0
	movel	%d0,%a2@(4)
	bras	.L10001d66

.L10001d4c:
	movel	%a3@(20),%d0
	asll	#2,%d0
	addl	%a3,%d0
	moveal	%d0,%a0
	moveal	%a0@(32),%a0
	movel	%a0@(36),%d0
	moveal	%fp@(20),%a0
	movel	%d0,%a0@(4)

.L10001d66:
	movel	%a3@(16),%d0
	moveal	%fp@(20),%a0
	movel	%d0,%a0@(8)
	moveq	#0,%d6
	moveal	%a3,%a4
	moveq	#16,%d0
	addal	%d0,%a4
	moveal	%a3,%a2
	moveq	#32,%d0
	addal	%d0,%a2
	bras	.L10001da8

.L10001d82:
	movel	%a4@,%d0
	cmpl	%d5,%d0
	bles	.L10001db2
	movel	%d5,%d0
	addql	#1,%d5
	moveq	#2,%d3
	asll	%d3,%d0
	addl	%a2,%d0
	moveal	%d0,%a0
	moveal	%a0@,%a0
	movel	%a0@(36),%d0
	movel	%d6,%d1
	addql	#1,%d6
	asll	%d3,%d1
	addl	%fp@(8),%d1
	moveal	%d1,%a0
	movel	%d0,%a0@

.L10001da8:
	subql	#1,%d4
	cmpil	#0,%d4
	bpls	.L10001d82

.L10001db2:
	clrw	%d0
	movew	%d0,%fp@(34)

.L10001db8:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(26),%sp
	jmp	%a0@

FragGetConnectionInfo:
	linkw	%fp,#-12
	moveml	%d3/%a2-%a4,%sp@-
	movel	%fp@(8),%d0
	beqs	.L10001dde
	moveal	%fp@(8),%a0
	tstl	%a0@(24)
	bnes	.L10001de8

.L10001dde:
	moveq	#-50,%d0
	movew	%d0,%fp@(22)
	jmp	%pc@(.L10001ff8)

.L10001de8:
	pea	%fp@(-4)
	movel	%fp@(18),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	bnes	.L10001e08
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(22)
	jmp	%pc@(.L10001ff8)

.L10001e08:
	movel	%fp@(14),%d0
	bnes	.L10001e18
	moveal	%a2@(76),%a4
	clrb	%fp@(12)
	bras	.L10001e5c

.L10001e18:
	pea	%fp@(-4)
	movel	%fp@(14),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_100030fe)
	lea	%sp@(12),%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L10001e5c
	pea	%fp@(-4)
	movel	%fp@(14),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003138)
	lea	%sp@(12),%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L10001e5c
	movel	%a3@(20),%d0
	bmis	.L10001e5c
	movel	%a3@(20),%d0
	asll	#2,%d0
	addl	%a3,%d0
	moveal	%d0,%a0
	moveal	%a0@(32),%a4

.L10001e5c:
	movel	%a4,%d0
	beqs	.L10001e6c
	moveb	%fp@(12),%d0
	beqs	.L10001e68
	moveal	%a4@,%a4

.L10001e68:
	movel	%a4,%d0
	bnes	.L10001e78

.L10001e6c:
	movew	#-2801,%d0
	movew	%d0,%fp@(22)
	jmp	%pc@(.L10001ff8)

.L10001e78:
	movel	%a4@(12),%d0
	movel	%d0,%fp@(-12)
	moveq	#0,%d3
	moveal	%fp@(8),%a2
	movel	%d3,%a2@(48)
	movel	%a4@(36),%d1
	movel	%d1,%a2@
	movew	%a4@(60),%d1
	movew	%d1,%a2@(4)
	movel	%a4@(44),%d1
	movel	%d1,%a2@(8)
	moveal	%d0,%a0
	moveal	%a0@(68),%a1
	movel	%a1@(4),%d1
	movel	%d1,%a2@(12)
	movel	%a0@(36),%d1
	movel	%d1,%a2@(16)
	movel	%a0@(68),%d1
	movel	%d1,%a2@(60)
	movel	%a0@(72),%d1
	movel	%d1,%a2@(64)
	movel	%d3,%a2@(68)
	movel	%d3,%a2@(72)
	movel	%a2@(24),%d1
	movel	%d1,%fp@(-8)
	moveq	#20,%d3
	addal	%d3,%a0
	addal	%d3,%a2
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	moveal	%d0,%a0
	movel	%a0@(20),%d0
	beqs	.L10001efc
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10001f0e
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10001f0e
	braw	.L10001f7a

.L10001efc:
	moveal	%fp@(-12),%a0
	movel	%a0@(28),%d0
	moveal	%fp@(8),%a0
	movel	%d0,%a0@(40)
	bras	.L10001f82

.L10001f0e:
	moveal	%fp@(8),%a2
	moveal	%a2@(24),%a0
	moveal	%fp@(-8),%a3
	moveq	#16,%d0

.L10001f1c:
	movel	%a0@+,%a3@+
	dbf	%d0,.L10001f1c
	movew	%a0@,%a3@
	movel	%fp@(-8),%a2@(24)
	moveal	%fp@(-12),%a3
	movel	%a3@(20),%d0
	moveq	#2,%d1
	cmpl	%d1,%d0
	bnes	.L10001f42
	movel	%a3@(128),%d0
	movel	%d0,%a2@(40)
	bras	.L10001f82

.L10001f42:
	moveal	%fp@(8),%a2
	moveal	%fp@(-12),%a3
	moveb	%a3@(84),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	asll	#4,%d0
	orl	%d0,%a2@(48)
	movel	%a3@(32),%d0
	movel	%d0,%a2@(40)
	tstb	%a3@(79)
	beqs	.L10001f82
	moveb	%a3@(84),%d0
	moveq	#1,%d1
	cmpb	%d1,%d0
	bnes	.L10001f82
	oril	#1,%a2@(48)

	bras	.L10001f82

.L10001f7a:
	moveq	#-4,%d0
	movew	%d0,%fp@(22)
	bras	.L10001ff8

.L10001f82:
	movel	%a4@(24),%d0
	moveal	%fp@(8),%a2
	movel	%d0,%a2@(36)
	moveal	%fp@(-12),%a3
	movel	%a3@(40),%d0
	movel	%d0,%a2@(44)
	movel	%a3@(104),%d0
	movel	%d0,%a2@(52)
	movel	%a3@(116),%d0
	movel	%d0,%a2@(56)
	moveal	%a3@(16),%a0
	moveb	%a0@,%d0
	moveq	#0,%d3
	moveb	%d0,%d3
	addql	#2,%d3
	cmpil	#64,%d3
	blss	.L10001fc0
	moveq	#64,%d3

.L10001fc0:
	moveal	%fp@(-12),%a0
	moveal	%a0@(16),%a0
	moveal	%fp@(8),%a1
	moveq	#76,%d0
	addal	%d0,%a1
	movel	%d3,%d0
	_BlockMoveData
	moveal	%fp@(8),%a2
	moveq	#56,%d0
	addal	%d0,%a2
	bras	.L10001fec

.L10001fde:
	moveal	%a4@(52),%a4
	moveal	%a4@(12),%a0
	movel	%a0@(116),%d0
	addl	%d0,%a2@

.L10001fec:
	tstl	%a4@(52)
	bnes	.L10001fde
	clrw	%d0
	movew	%d0,%fp@(22)

.L10001ff8:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(14),%sp
	jmp	%a0@

FragGetSectionInfo:
	linkw	%fp,#-36
	moveml	%d3-%d6/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	movel	%fp@(12),%d5
	pea	%fp@(-32)
	movel	%fp@(24),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	beqs	.L10002042
	pea	%fp@(-32)
	movel	%fp@(20),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_100030fe)
	lea	%sp@(12),%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L1000204e

.L10002042:
	movew	%fp@(-32),%d0
	movew	%d0,%fp@(28)
	jmp	%pc@(.L1000212c)

.L1000204e:
	movel	%a4@(12),%d0
	movel	%d0,%fp@(-36)
	moveal	%d0,%a0
	moveq	#104,%d1
	addal	%d1,%a0
	movel	%a0,%fp@(-28)
	moveal	%d0,%a0
	lea	%a0@(136),%a0
	movel	%a0,%fp@(-24)
	moveal	%a4,%a1
	moveq	#72,%d0
	addal	%d0,%a1
	movel	%a1,%fp@(-20)
	movel	%fp@(16),%d6
	asll	#2,%d6
	movel	%fp@(16),%d4
	asll	#5,%d4
	movel	%d4,%d0
	addl	%a0,%d0
	moveal	%d0,%a2
	movel	%d6,%d0
	addl	%a1,%d0
	movel	%d0,%fp@(-16)
	moveal	%a2,%a0
	moveq	#20,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-12)
	moveal	%a2,%a0
	moveq	#21,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveal	%a2,%a0
	addqw	#8,%a0
	movel	%a0,%fp@(-4)
	bras	.L1000211c

.L100020ac:
	moveal	%fp@(-28),%a0
	movel	%a0@,%d0
	asll	#5,%d0
	cmpl	%d4,%d0
	bgts	.L100020c2
	movew	#-2803,%d0
	movew	%d0,%fp@(28)
	bras	.L1000212c

.L100020c2:
	moveal	%fp@(-16),%a0
	moveal	%a0@,%a4
	movel	%a4,%d3
	beqs	.L100020d2
	movel	%a4@(36),%d0
	bras	.L100020d4

.L100020d2:
	moveq	#0,%d0

.L100020d4:
	movel	%d0,%a3@
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	movel	%d0,%a3@(4)
	moveal	%fp@(-8),%a0
	moveb	%a0@,%d0
	moveb	%d0,%a3@(8)
	moveal	%fp@(-12),%a0
	moveb	%a0@,%d0
	moveb	%d0,%a3@(9)
	tstl	%d3
	beqs	.L100020fe
	movel	%a4@(8),%d0
	bras	.L10002100

.L100020fe:
	moveq	#0,%d0

.L10002100:
	movel	%d0,%a3@(12)
	addql	#4,%fp@(-16)
	moveq	#32,%d3
	addl	%d3,%fp@(-12)
	addl	%d3,%fp@(-8)
	addl	%d3,%fp@(-4)
	addl	%d3,%d4
	moveq	#16,%d0
	addal	%d0,%a3

.L1000211c:
	subql	#1,%d5
	cmpil	#0,%d5
	bpls	.L100020ac
	clrw	%d0
	movew	%d0,%fp@(28)

.L1000212c:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(20),%sp
	jmp	%a0@

FragFindOwnerOfPC:
	linkw	%fp,#-24
	moveml	%d3-%d4/%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a2
	moveal	%a2,%a3
	lea	%a3@(368),%a3
	movel	%a3,%fp@(-12)
	moveal	%a3,%a0
	lea	%a0@(256),%a0
	movel	%a0,%fp@(-4)
	braw	.L10002238

.L10002160:
	moveal	%fp@(-12),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-24)
	braw	.L1000222c

.L1000216e:
	moveal	%fp@(-24),%a2
	moveq	#104,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-16)
	moveal	%fp@(-24),%a3
	lea	%a3@(136),%a3
	moveq	#0,%d4
	movel	%a3,%fp@(-8)
	braw	.L10002214

.L1000218c:
	moveal	%fp@(-8),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-20)
	bras	.L10002206

.L10002198:
	moveal	%fp@(-20),%a2
	moveal	%a2@(36),%a3
	moveal	%fp@(12),%a4
	cmpal	%a4,%a3
	bhis	.L100021fc
	moveal	%fp@(-8),%a0
	addal	%a0@(8),%a3
	cmpal	%a4,%a3
	blss	.L100021fc
	movel	%d4,%d3
	divsll	#32,%d3,%d3
	moveal	%fp@(-24),%a3
	movel	%a3@(80),%d0
	moveal	%fp@(8),%a4
	movel	%d0,%a4@
	movel	%a3@(68),%d0
	movel	%d0,%a4@(4)
	movel	%a3@(72),%d0
	movel	%d0,%a4@(8)
	movel	%d3,%a4@(12)
	movel	%a2@(36),%d0
	movel	%d0,%a4@(16)
	moveal	%fp@(-8),%a0
	movel	%a0@(8),%d0
	movel	%d0,%a4@(20)
	clrw	%d0
	movew	%d0,%fp@(16)
	bras	.L1000224a

.L100021fc:
	moveal	%fp@(-20),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-20)

.L10002206:
	movel	%fp@(-20),%d0
	bnes	.L10002198
	moveq	#32,%d3
	addl	%d3,%fp@(-8)
	addl	%d3,%d4

.L10002214:
	moveal	%fp@(-16),%a0
	movel	%a0@,%d0
	asll	#5,%d0
	cmpl	%d4,%d0
	bgtw	.L1000218c
	moveal	%fp@(-24),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-24)

.L1000222c:
	movel	%fp@(-24),%d0
	bnew	.L1000216e
	addql	#4,%fp@(-12)

.L10002238:
	moveal	%fp@(-4),%a0
	cmpal	%fp@(-12),%a0
	bhiw	.L10002160
	moveq	#-43,%d0
	movew	%d0,%fp@(16)

.L1000224a:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#8,%sp
	jmp	%a0@

FragGetAppLocator:
	linkw	%fp,#0
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(20),%a2
	moveal	%a2,%a3
	moveq	#32,%d0
	addal	%d0,%a3
	movel	%a2,%d0
	beqs	.L1000227e
	movel	%fp@(16),%d0
	beqs	.L1000227e
	movel	%fp@(12),%d0
	beqs	.L1000227e
	movel	%fp@(8),%d0
	bnes	.L10002288

.L1000227e:
	moveq	#-50,%d0
	movew	%d0,%fp@(24)
	jmp	%pc@(.L1000238a)

.L10002288:
	moveq	#0,%d0
	moveal	%d0,%a4
	moveq	#16,%d0
	movel	%d0,%sp@-
	movel	%fp@(12),%sp@-
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movel	%a2@(28),%d3
	bras	.L100022ce

.L100022a0:
	moveb	%a3@(22),%d0
	moveq	#1,%d1
	cmpb	%d1,%d0
	bnes	.L100022c4
	movel	%a3@,%d0
	cmpil	#1832269931,%d0
	bnes	.L100022b8
	moveal	%a3,%a4
	bras	.L100022d6

.L100022b8:
	movel	%a3@,%d0
	cmpil	#1832269931,%d0
	bnes	.L100022c4
	moveal	%a3,%a4

.L100022c4:
	movew	%a3@(40),%d0
	extl	%d0
	addal	%d0,%a3
	subql	#1,%d3

.L100022ce:
	cmpil	#0,%d3
	bgts	.L100022a0

.L100022d6:
	movel	%a4,%d0
	bnes	.L100022e6
	movew	#-2822,%d0
	movew	%d0,%fp@(24)
	jmp	%pc@(.L1000238a)

.L100022e6:
	moveb	%a4@(23),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	moveal	%fp@(12),%a2
	movel	%d0,%a2@
	moveb	%a4@(23),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L1000230e
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L1000230e
	tstl	%d0
	beqs	.L1000234a
	bras	.L10002376

.L1000230e:
	moveal	%fp@(12),%a2
	movel	%fp@(16),%a2@(4)
	moveb	%a4@(23),%d0
	moveq	#1,%d1
	cmpb	%d1,%d0
	bnes	.L10002334
	movel	%a4@(24),%d0
	movel	%d0,%a2@(8)
	movel	%a4@(28),%d0
	movel	%d0,%a2@(12)
	bras	.L1000237e

.L10002334:
	movel	%a4@(24),%d0
	moveal	%fp@(12),%a2
	movel	%d0,%a2@(8)
	movel	%a4@(28),%d0
	movew	%d0,%a2@(12)
	bras	.L1000237e

.L1000234a:
	movel	%a4@(24),%d0
	movel	%d0,%a2@(4)
	movel	%a4@(28),%d0
	andil	#2147483647,%d0
	movel	%d0,%a2@(8)
	movel	%a4@(28),%d0
	andil	#-2147483648,%d0
	negl	%d0
	subxl	%d0,%d0
	negl	%d0
	moveb	%d0,%a2@(12)
	bras	.L1000237e

.L10002376:
	moveq	#-4,%d0
	movew	%d0,%fp@(24)
	bras	.L1000238a

.L1000237e:
	moveal	%fp@(8),%a0
	movel	%a4,%a0@
	clrw	%d0
	movew	%d0,%fp@(24)

.L1000238a:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(16),%sp
	jmp	%a0@

sub_10002398:
	linkw	%fp,#-136
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	movew	%a4@(10),%d3
	subqw	#4,%sp
	movel	#776,%sp@
	movel	%sp@+,%d0
	movel	%d0,%fp@(-8)
	moveal	%d0,%a0
	moveal	%a0@(2),%a3
	moveal	%a4,%a2
	moveq	#12,%d0
	addal	%d0,%a2
	moveal	%a4,%a0
	moveq	#10,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)
	bras	.L10002414

.L100023ce:
	subqw	#2,%sp
	movew	%a3@(6),%sp@-
	movel	%a2,%sp@-
	movel	%fp@(-4),%sp@-
	pea	%fp@(-136)
	jsr	%pc@(sub_1000a3ba)
	movew	%sp@+,%d0
	bnes	.L10002412
	movew	%a4@(10),%d0
	cmpw	%d3,%d0
	bnes	.L10002412
	moveq	#122,%d0
	movel	%d0,%sp@-
	pea	%fp@(-132)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movew	%d3,%fp@(-110)
	lea	%fp@(-132),%a0
	_PBHGetVInfoSync
	movew	%d0,%d4
	bnes	.L1000241a
	movel	%fp@(-102),%a4@(44)
	bras	.L1000242a

.L10002412:
	moveal	%a3@,%a3

.L10002414:
	moveal	%a4,%a0
	movel	%a3,%d0
	bnes	.L100023ce

.L1000241a:
	clrw	%d0
	movew	%d0,%a4@(10)
	clrb	%a4@(12)
	moveq	#0,%d0
	movel	%d0,%a4@(44)

.L1000242a:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10002432:
	linkw	%fp,#-184
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	moveq	#0,%d0
	movel	%d0,%fp@(-148)
	clrw	%d4
	clrb	%fp@(-144)
	subqw	#4,%sp
	movel	#776,%sp@
	movel	%sp@+,%d0
	movel	%d0,%fp@(-12)
	moveal	%d0,%a0
	moveal	%a0@(2),%a3
	moveal	%a4,%a2
	moveq	#44,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-8)
	moveal	%a4,%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)
	braw	.L100024f8

.L10002476:
	subqw	#2,%sp
	movew	%a3@(6),%sp@-
	pea	%fp@(-184)
	pea	%fp@(-152)
	pea	%fp@(-140)
	jsr	%pc@(sub_1000a3ba)
	movew	%sp@+,%d3
	bnes	.L100024f6
	moveq	#122,%d0
	movel	%d0,%sp@-
	pea	%fp@(-136)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movew	%fp@(-152),%fp@(-114)
	lea	%fp@(-136),%a0
	_PBHGetVInfoSync
	movew	%d0,%d3
	bnes	.L100024fe
	moveal	%fp@(-8),%a0
	movel	%a0@,%d0
	cmpl	%fp@(-106),%d0
	bnes	.L100024f6
	movel	%a3,%fp@(-148)
	movew	%fp@(-152),%d4
	moveal	%fp@(-4),%a0
	moveb	%a0@,%d0
	moveb	%fp@(-184),%d3
	cmpb	%d3,%d0
	bnes	.L100024f6
	moveq	#0,%d0
	moveb	%d3,%d0
	movel	%d0,%sp@-
	moveal	%a4,%a0
	moveq	#13,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	pea	%fp@(-183)
	jsr	%pc@(sub_100057aa)
	lea	%sp@(12),%sp
	tstl	%d0
	beqs	.L100024f6
	moveb	#1,%fp@(-144)
	bras	.L100024fe

.L100024f6:
	moveal	%a3@,%a3

.L100024f8:
	movel	%a3,%d0
	bnew	.L10002476

.L100024fe:
	movew	%d4,%a4@(10)
	moveb	%fp@(-144),%d0
	bnes	.L1000252e
	movel	%fp@(-148),%d0
	beqs	.L1000252e
	subqw	#2,%sp
	moveal	%fp@(-148),%a0
	movew	%a0@(6),%sp@-
	moveal	%a4,%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	pea	%fp@(-152)
	pea	%fp@(-140)
	jsr	%pc@(sub_1000a3ba)
	addqw	#2,%sp

.L1000252e:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10002536:
	linkw	%fp,#-156
	moveml	%d3/%a2-%a4,%sp@-
	clrb	%fp@(-10)
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-8)
	moveal	%d0,%a0
	moveal	%a0@(28),%a4
	braw	.L10002604

.L10002554:
	moveal	%a4@(48),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-152)
	moveq	#122,%d0
	movel	%d0,%sp@-
	pea	%fp@(-132)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movew	%a4@(10),%d0
	movew	%d0,%fp@(-110)
	lea	%fp@(-132),%a0
	_PBHGetVInfoSync
	tstw	%d0
	bnes	.L10002588
	movel	%a4@(44),%d0
	cmpl	%fp@(-102),%d0
	beqs	.L10002600

.L10002588:
	orib	#1,%fp@(-10)
	movel	%a4,%sp@-
	jsr	%pc@(sub_10002432)
	addqw	#4,%sp
	movew	%a4@(10),%d0
	extl	%d0
	movel	%d0,%fp@(-156)
	moveal	%a4@,%a3
	bras	.L100025fa

.L100025a4:
	movew	%fp@(-154),%a3@(10)
	moveal	%a3,%a0
	moveq	#52,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_100066b4)
	addqw	#4,%sp
	moveb	%a3@(8),%d0
	moveq	#1,%d1
	cmpb	%d1,%d0
	bnes	.L100025cc
	moveq	#0,%d0
	moveal	%d0,%a4
	movel	%a3@(48),%d3
	bras	.L100025d6

.L100025cc:
	moveal	%a3,%a4
	moveq	#12,%d0
	addal	%d0,%a4
	movel	%a3@(44),%d3

.L100025d6:
	moveb	%a3@(9),%d0
	extw	%d0
	movew	%d0,%sp@-
	movel	%a4,%sp@-
	clrl	%sp@-
	movel	%d3,%sp@-
	movew	%a3@(10),%sp@-
	moveal	%a3,%a0
	moveq	#52,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_10006630)
	lea	%sp@(20),%sp
	moveal	%a3@,%a3

.L100025fa:
	cmpal	%fp@(-152),%a3
	bnes	.L100025a4

.L10002600:
	moveal	%fp@(-152),%a4

.L10002604:
	movel	%a4,%d0
	bnew	.L10002554
	moveb	%fp@(-10),%d0
	beqw	.L100026b0
	moveal	%fp@(-8),%a2
	moveq	#28,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-4)
	lea	%fp@(-148),%a0
	movel	%a2@+,%a0@+
	movel	%a2@+,%a0@+
	moveq	#0,%d3
	moveal	%fp@(-4),%a0
	movel	%d3,%a0@
	moveal	%fp@(-8),%a1
	movel	%d3,%a1@(32)
	moveal	%fp@(-148),%a4
	moveal	%a0,%a3
	bras	.L100026ac

.L1000263e:
	moveal	%a4@(48),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-152)
	movel	%a4,%fp@(-140)
	movel	%a4@(48),%d0
	movel	%d0,%fp@(-136)
	pea	%fp@(-148)
	pea	%fp@(-140)
	jsr	%pc@(sub_10003326)
	addqw	#8,%sp
	moveal	%a3@,%a2
	bras	.L1000266c

.L10002666:
	moveal	%a2@(48),%a0
	moveal	%a0@,%a2

.L1000266c:
	movel	%a2,%d0
	beqs	.L1000267c
	movew	%a2@(10),%d0
	movew	%a4@(10),%d1
	cmpw	%d1,%d0
	blts	.L10002666

.L1000267c:
	movel	%a2,%d0
	bnes	.L10002694
	clrl	%sp@-
	movel	%a3,%sp@-
	clrb	%sp@-
	pea	%fp@(-140)
	jsr	%pc@(sub_10003246)
	lea	%sp@(14),%sp
	bras	.L100026a8

.L10002694:
	movel	%a2,%sp@-
	movel	%a3,%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	pea	%fp@(-140)
	jsr	%pc@(sub_10003246)
	lea	%sp@(14),%sp

.L100026a8:
	moveal	%fp@(-152),%a4

.L100026ac:
	movel	%a4,%d0
	bnes	.L1000263e

.L100026b0:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_100026b8:
	linkw	%fp,#-12
	moveml	%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	cmpil	#0,%fp@(8)
	bmis	.L100026d6
	moveq	#0,%d0
	jmp	%pc@(.L1000278a)

.L100026d6:
	moveal	%a4@(28),%a3
	bras	.L100026e2

.L100026dc:
	moveal	%a3@(48),%a0
	moveal	%a0@,%a3

.L100026e2:
	movel	%a3,%d0
	beqs	.L100026f2
	movew	%a3@(10),%d0
	extl	%d0
	cmpl	%fp@(8),%d0
	blts	.L100026dc

.L100026f2:
	movel	%a3,%d0
	beqs	.L10002704
	movew	%a3@(10),%d0
	extl	%d0
	cmpl	%fp@(8),%d0
	beqw	.L10002788

.L10002704:
	movel	%a3,%fp@(-12)
	moveq	#68,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L10002788
	clrb	%a3@(8)
	movew	%fp@(10),%a3@(10)
	moveal	%a3,%a0
	movel	%a3,%a0@(48)
	movel	%a0,%sp@-
	jsr	%pc@(sub_10002398)
	addqw	#4,%sp
	tstw	%a3@(10)
	bnes	.L10002744
	movel	%a3,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	moveq	#0,%d0
	moveal	%d0,%a3
	bras	.L10002788

.L10002744:
	movel	%a3,%fp@(-8)
	movel	%a3,%fp@(-4)
	moveal	%a4,%a2
	moveq	#28,%d0
	addal	%d0,%a2
	movel	%fp@(-12),%d0
	bnes	.L1000276c
	clrl	%sp@-
	movel	%a2,%sp@-
	clrb	%sp@-
	pea	%fp@(-8)
	jsr	%pc@(sub_10003246)
	lea	%sp@(14),%sp
	bras	.L10002788

.L1000276c:
	movel	%fp@(-12),%sp@-
	moveal	%a4,%a0
	moveq	#28,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	pea	%fp@(-8)
	jsr	%pc@(sub_10003246)
	lea	%sp@(14),%sp

.L10002788:
	movel	%a3,%d0

.L1000278a:
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	rts

sub_10002792:
	linkw	%fp,#-4
	moveml	%d4-%d6/%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	movel	%fp@(14),%d4
	movel	%fp@(18),%d5
	movew	%fp@(22),%d6
	movel	%a2,%fp@(-4)
	moveal	%a2@,%a4
	moveal	%a2@(48),%a0
	moveal	%a0@,%a3
	bras	.L100027be

.L100027b8:
	movel	%a4,%fp@(-4)
	moveal	%a4@,%a4

.L100027be:
	cmpal	%a3,%a4
	beqs	.L100027ca
	movel	%a4@(44),%d0
	cmpl	%d4,%d0
	blts	.L100027b8

.L100027ca:
	cmpal	%a3,%a4
	beqs	.L100027f4
	movel	%a4@(44),%d0
	cmpl	%d4,%d0
	bnes	.L100027f4
	bras	.L100027de

.L100027d8:
	movel	%a4,%fp@(-4)
	moveal	%a4@,%a4

.L100027de:
	cmpal	%a3,%a4
	beqs	.L100027f4
	movel	%a4@(44),%d0
	cmpl	%d4,%d0
	bnes	.L100027f4
	moveb	%a4@(8),%d0
	cmpb	%fp@(12),%d0
	bcss	.L100027d8

.L100027f4:
	cmpal	%a3,%a4
	beqs	.L1000283a
	movel	%a4@(44),%d0
	cmpl	%d4,%d0
	bnes	.L1000283a
	moveb	%a4@(8),%d0
	cmpb	%fp@(12),%d0
	bnes	.L1000283a
	bras	.L10002812

.L1000280c:
	movel	%a4,%fp@(-4)
	moveal	%a4@,%a4

.L10002812:
	cmpal	%a3,%a4
	beqs	.L1000283a
	movel	%a4@(44),%d0
	cmpl	%d4,%d0
	bnes	.L1000283a
	moveb	%a4@(8),%d0
	cmpb	%fp@(12),%d0
	bnes	.L1000283a
	movel	%a4@(48),%d0
	cmpl	%d5,%d0
	bges	.L1000283a
	moveb	%a4@(9),%d0
	extw	%d0
	cmpw	%d6,%d0
	bnes	.L1000280c

.L1000283a:
	moveal	%fp@(24),%a0
	movel	%fp@(-4),%a0@
	cmpal	%a3,%a4
	beqs	.L1000286a
	movel	%a4@(44),%d0
	cmpl	%d4,%d0
	bnes	.L1000286a
	moveb	%a4@(8),%d0
	cmpb	%fp@(12),%d0
	bnes	.L1000286a
	movel	%a4@(48),%d0
	cmpl	%d5,%d0
	bnes	.L1000286a
	moveb	%a4@(9),%d0
	extw	%d0
	cmpw	%d6,%d0
	beqs	.L1000286e

.L1000286a:
	moveq	#0,%d0
	bras	.L10002870

.L1000286e:
	moveq	#1,%d0

.L10002870:
	moveml	%sp@+,%d4-%d6/%a2-%a4
	unlk	%fp
	rts

sub_10002878:
	linkw	%fp,#-76
	moveml	%d3/%a3,%sp@-
	moveal	%fp@(8),%a3
	movew	%a3@(40),%d0
	andiw	#-32768,%d0
	bnes	.L10002892
	clrw	%d0
	bras	.L100028fc

.L10002892:
	subqw	#2,%sp
	movew	%a3@(22),%sp@-
	movel	%a3@(100),%sp@-
	movel	%a3@(18),%sp@-
	pea	%fp@(-72)
	moveq	#1,%d0
	_HighLevelFSDispatch
	movew	%sp@+,%d3
	bnes	.L100028ca
	clrb	%sp@-
	pea	%fp@(-75)
	pea	%fp@(-76)
	moveq	#1,%d0
	moveb	%d0,%sp@-
	pea	%fp@(-72)
	jsr	%pc@(sub_10005a16)
	lea	%sp@(16),%sp
	movew	%d0,%d3
	beqs	.L100028ce

.L100028ca:
	movew	%d3,%d0
	bras	.L100028fc

.L100028ce:
	moveb	%fp@(-66),%d0
	moveq	#0,%d3
	moveb	%d0,%d3
	addql	#1,%d3
	lea	%fp@(-66),%a0
	moveal	%a3@(18),%a1
	movel	%d3,%d0
	_BlockMoveData
	movew	%fp@(-72),%a3@(22)
	movel	%fp@(-70),%a3@(48)
	clrw	%d0
	movew	%d0,%a3@(28)
	moveal	%a3,%a0
	_PBGetCatInfoSync

.L100028fc:
	moveml	%sp@+,%d3/%a3
	unlk	%fp
	rts

sub_10002904:
	linkw	%fp,#-24
	moveml	%d3/%d5-%d7/%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-4)
	movew	%fp@(12),%d3
	moveq	#-128,%d0
	cmpw	%d0,%d3
	blts	.L1000293e
	moveq	#127,%d0
	cmpw	%d0,%d3
	bgts	.L1000293e
	moveal	%fp@(8),%a0
	movew	%a0@(22),%d0
	extl	%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_100026b8)
	addqw	#4,%sp
	movel	%d0,%fp@(-24)
	tstl	%d0
	bnes	.L10002944

.L1000293e:
	moveq	#-50,%d0
	jmp	%pc@(.L10002a5a)

.L10002944:
	moveq	#68,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L1000295c
	movew	#-2809,%d0
	jmp	%pc@(.L10002a5a)

.L1000295c:
	moveal	%fp@(8),%a2
	movel	%a2@(100),%d6
	movew	%a2@(22),%d0
	movew	%d0,%a4@(10)
	movel	%d6,%a4@(44)
	movel	%a2@(18),%d3
	moveal	%d3,%a0
	moveal	%a4,%a1
	moveq	#12,%d0
	addal	%d0,%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData
	moveb	%a2@(30),%d0
	moveq	#16,%d1
	andb	%d1,%d0
	beqs	.L100029a2
	moveb	#1,%fp@(-8)
	movel	%a2@(48),%d5
	moveq	#0,%d0
	moveal	%d0,%a3
	movel	%d5,%d7
	bras	.L100029b6

.L100029a2:
	moveb	#2,%fp@(-8)
	moveal	%fp@(8),%a2
	movel	%a2@(48),%d5
	moveal	%a2@(18),%a3
	movel	%d6,%d7

.L100029b6:
	moveb	%fp@(13),%a4@(9)
	moveb	%fp@(-8),%d3
	moveb	%d3,%a4@(8)
	movel	%d5,%a4@(48)
	pea	%fp@(-20)
	movew	%fp@(12),%sp@-
	movel	%d5,%sp@-
	movel	%d6,%sp@-
	moveb	%d3,%sp@-
	movel	%fp@(-24),%sp@-
	jsr	%pc@(sub_10002792)
	lea	%sp@(20),%sp
	tstb	%d0
	beqs	.L100029f4
	movel	%a4,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	movew	#-2805,%d0
	bras	.L10002a5a

.L100029f4:
	movel	%a4,%fp@(-16)
	movel	%a4,%fp@(-12)
	movel	%fp@(-20),%sp@-
	moveal	%fp@(-4),%a0
	moveq	#28,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	clrb	%sp@-
	pea	%fp@(-16)
	jsr	%pc@(sub_10003246)
	lea	%sp@(14),%sp
	moveal	%fp@(-24),%a2
	moveal	%a2@(48),%a0
	cmpal	%fp@(-20),%a0
	bnes	.L10002a2a
	movel	%a4,%a2@(48)

.L10002a2a:
	moveb	%a4@(9),%d0
	extw	%d0
	movew	%d0,%sp@-
	movel	%a3,%sp@-
	clrl	%sp@-
	movel	%d7,%sp@-
	movew	%a4@(10),%sp@-
	moveal	%a4,%a0
	moveq	#52,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_10006630)
	lea	%sp@(20),%sp
	movew	%d0,%d3
	beqs	.L10002a58
	movel	%a4,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp

.L10002a58:
	movew	%d3,%d0

.L10002a5a:
	moveml	%sp@+,%d3/%d5-%d7/%a2-%a4
	unlk	%fp
	rts

sub_10002a62:
	linkw	%fp,#-20
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-4)
	movew	%a3@(22),%d0
	extl	%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_100026b8)
	addqw	#4,%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L10002a90
	moveq	#-50,%d0
	jmp	%pc@(.L10002b2a)

.L10002a90:
	movel	%a3@(100),%d4
	moveb	%a3@(30),%d0
	moveq	#16,%d1
	andb	%d1,%d0
	beqs	.L10002aaa
	moveb	#1,%fp@(-8)
	movel	%a3@(48),%d3
	bras	.L10002ab4

.L10002aaa:
	moveb	#2,%fp@(-8)
	movel	%a3@(48),%d3

.L10002ab4:
	pea	%fp@(-20)
	movew	%fp@(12),%sp@-
	movel	%d3,%sp@-
	movel	%d4,%sp@-
	moveb	%fp@(-8),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10002792)
	lea	%sp@(20),%sp
	moveb	%d0,%fp@(-7)
	tstb	%d0
	bnes	.L10002adc
	movew	#-2804,%d3
	bras	.L10002b28

.L10002adc:
	clrw	%d3
	moveal	%fp@(-20),%a2
	movel	%a2@,%d0
	movel	%d0,%fp@(-16)
	movel	%d0,%fp@(-12)
	moveal	%a4@(48),%a0
	cmpal	%fp@(-16),%a0
	bnes	.L10002afa
	movel	%a2,%a4@(48)

.L10002afa:
	moveal	%fp@(-4),%a0
	moveq	#28,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	pea	%fp@(-16)
	jsr	%pc@(sub_10003326)
	addqw	#8,%sp
	moveal	%fp@(-16),%a0
	moveq	#52,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_100066b4)
	addqw	#4,%sp
	movel	%fp@(-16),%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp

.L10002b28:
	movew	%d3,%d0

.L10002b2a:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

FragRegisterSpecialLibs:
	linkw	%fp,#-172
	moveml	%d3/%a2/%a4,%sp@-
	moveal	%fp@(12),%a4
	movew	%a4@,%d0
	bpls	.L10002b54
	movel	%a4@(2),%d0
	bles	.L10002b54
	moveb	%a4@(6),%d3
	beqs	.L10002b54
	moveq	#63,%d0
	cmpb	%d0,%d3
	blss	.L10002b5e

.L10002b54:
	moveq	#-50,%d0
	movew	%d0,%fp@(16)
	jmp	%pc@(.L10002bf0)

.L10002b5e:
	movew	%a4@,%d0
	movew	%d0,%fp@(-150)
	movel	%a4@(2),%d0
	movel	%d0,%fp@(-124)
	clrw	%d0
	movew	%d0,%fp@(-144)
	lea	%fp@(-64),%a2
	movel	%a2,%fp@(-154)
	moveal	%a4,%a0
	addqw	#6,%a0
	moveal	%a2,%a1
	moveb	%a4@(6),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData
	lea	%fp@(-172),%a0
	_PBGetCatInfoSync
	movew	%d0,%d3
	bnes	.L10002bb8
	cmpib	#31,%fp@(-64)
	blss	.L10002baa
	movew	#-2819,%d0
	movew	%d0,%fp@(16)
	bras	.L10002bf0

.L10002baa:
	pea	%fp@(-172)
	jsr	%pc@(sub_10002878)
	addqw	#4,%sp
	movew	%d0,%d3
	beqs	.L10002bc0

.L10002bb8:
	movew	%d3,%d0
	movew	%d0,%fp@(16)
	bras	.L10002bf0

.L10002bc0:
	jsr	%pc@(sub_10002536)
	moveb	%fp@(8),%d0
	beqs	.L10002bde
	movew	%fp@(10),%sp@-
	pea	%fp@(-172)
	jsr	%pc@(sub_10002a62)
	addqw	#6,%sp
	movew	%d0,%fp@(16)
	bras	.L10002bf0

.L10002bde:
	movew	%fp@(10),%sp@-
	pea	%fp@(-172)
	jsr	%pc@(sub_10002904)
	addqw	#6,%sp
	movew	%d0,%fp@(16)

.L10002bf0:
	moveml	%sp@+,%d3/%a2/%a4
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#8,%sp
	jmp	%a0@

FragRegisterFileLibs:
	linkw	%fp,#0
	subqw	#2,%sp
	movel	%fp@(10),%sp@-
	clrw	%sp@-
	moveb	%fp@(8),%sp@-
	jsr	%pc@(FragRegisterSpecialLibs)
	movew	%sp@+,%d0
	movew	%d0,%fp@(14)
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#6,%sp
	jmp	%a0@

FragGetFileRegistryInfo:
	linkw	%fp,#0
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	movel	%fp@(12),%d4
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a2
	cmpil	#0,%d4
	bmis	.L10002c40
	movel	%a3,%d0
	bnes	.L10002c48

.L10002c40:
	moveq	#-50,%d0
	movew	%d0,%fp@(16)
	bras	.L10002ca0

.L10002c48:
	jsr	%pc@(sub_10002536)
	moveq	#0,%d3
	moveal	%a2@(28),%a4
	bras	.L10002c66

.L10002c54:
	tstb	%a4@(8)
	bnes	.L10002c5e
	moveal	%a4@,%a4
	bras	.L10002c66

.L10002c5e:
	cmpl	%d4,%d3
	beqs	.L10002c6a
	addql	#1,%d3
	moveal	%a4@,%a4

.L10002c66:
	movel	%a4,%d0
	bnes	.L10002c54

.L10002c6a:
	movel	%a4,%d0
	bnes	.L10002c74
	movew	#-2804,%d3
	bras	.L10002c9a

.L10002c74:
	clrw	%d3
	movew	%a4@(10),%d0
	movew	%d0,%a3@
	movel	%a4@(44),%d0
	movel	%d0,%a3@(2)
	moveal	%a4,%a0
	moveq	#12,%d0
	addal	%d0,%a0
	moveal	%a3,%a1
	addqw	#6,%a1
	moveb	%a4@(12),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData

.L10002c9a:
	movew	%d3,%d0
	movew	%d0,%fp@(16)

.L10002ca0:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#8,%sp
	jmp	%a0@

FragRegisterLocalAllocator:
	linkw	%fp,#-4
	moveml	%d3/%a2-%a3,%sp@-
	movel	%fp@(18),%d0
	beqs	.L10002d20
	moveb	%fp@(8),%d0
	bnes	.L10002ccc
	movel	%fp@(14),%d0
	beqs	.L10002d20
	movel	%fp@(10),%d0
	beqs	.L10002d20

.L10002ccc:
	pea	%fp@(-4)
	movel	%fp@(18),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L10002d16
	moveal	%a3,%a2
	moveq	#108,%d0
	addal	%d0,%a2
	moveb	%fp@(8),%d0
	beqs	.L10002cfc
	moveq	#0,%d3
	moveal	%a2@,%a0
	movel	%d3,%a0@(12)
	moveal	%a2@,%a0
	movel	%d3,%a0@(16)
	bras	.L10002d10

.L10002cfc:
	moveal	%a3@(108),%a0
	movel	%fp@(14),%a0@(12)
	moveal	%a3@(108),%a0
	movel	%fp@(10),%a0@(16)

.L10002d10:
	clrw	%d0
	movew	%d0,%fp@(-4)

.L10002d16:
	movew	%fp@(-4),%d0
	movew	%d0,%fp@(22)
	bras	.L10002d28

.L10002d20:
	moveq	#-50,%d0
	movew	%d0,%fp@(-4)
	bras	.L10002d16

.L10002d28:
	moveml	%sp@+,%d3/%a2-%a3
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(14),%sp
	jmp	%a0@

sub_10002d36:
	linkw	%fp,#-4
	moveml	%d3/%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	moveq	#1,%d3
	moveal	%a4,%a3
	moveq	#16,%d0
	addal	%d0,%a3

.L10002d4c:
	movel	%a3@,%d0
	addql	#1,%d0
	movel	%d0,%a3@
	movel	%a3@,%d0
	bmis	.L10002d62
	movel	%a4@(16),%d0
	cmpil	#32767,%d0
	bles	.L10002d66

.L10002d62:
	moveq	#1,%d0
	movel	%d0,%a3@

.L10002d66:
	moveal	%a3@,%a2
	pea	%fp@(-4)
	movel	%a2,%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	tstl	%d0
	beqs	.L10002d86
	addql	#1,%d3
	cmpil	#32767,%d3
	bles	.L10002d4c
	moveq	#0,%d0
	bras	.L10002d88

.L10002d86:
	movel	%a2,%d0

.L10002d88:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10002d90:
	linkw	%fp,#-4
	moveml	%d3-%d5/%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2@,%d0
	addql	#1,%d0
	tstl	%d0
	bles	.L10002db0
	addql	#1,%a2@
	moveal	%a2@,%a3
	braw	.L10002e5c

.L10002db0:
	moveal	%fp@(8),%a2
	moveq	#20,%d0
	addal	%d0,%a2
	movel	%a2@,%d0
	subql	#1,%d0
	tstl	%d0
	bles	.L10002dc8
	subql	#1,%a2@
	moveal	%a2@,%a3
	braw	.L10002e5c

.L10002dc8:
	moveq	#1,%d0
	moveal	%d0,%a3
	moveq	#0,%d4
	moveq	#-1,%d5
	moveal	%fp@(8),%a4
	moveq	#84,%d0
	addal	%d0,%a4
	moveal	%fp@(8),%a0
	moveq	#76,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)

.L10002de4:
	moveal	%a4@,%a2
	bras	.L10002e0e

.L10002de8:
	movel	%a2@(8),%d3
	cmpl	%d4,%d3
	bles	.L10002df2
	movel	%d3,%d4

.L10002df2:
	movel	%a2@(8),%d3
	cmpl	%d5,%d3
	bccs	.L10002dfc
	movel	%d3,%d5

.L10002dfc:
	moveal	%a2@(8),%a0
	cmpal	%a3,%a0
	bnes	.L10002e0c
	movel	%a3,%d0
	addql	#1,%d0
	moveal	%d0,%a3
	bras	.L10002de4

.L10002e0c:
	moveal	%a2@,%a2

.L10002e0e:
	movel	%a2,%d0
	bnes	.L10002de8
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a2
	bras	.L10002e40

.L10002e1a:
	movel	%a2@(36),%d3
	cmpl	%d4,%d3
	bles	.L10002e24
	movel	%d3,%d4

.L10002e24:
	movel	%a2@(36),%d3
	cmpl	%d5,%d3
	bccs	.L10002e2e
	movel	%d3,%d5

.L10002e2e:
	moveal	%a2@(36),%a0
	cmpal	%a3,%a0
	bnes	.L10002e3e
	movel	%a3,%d0
	addql	#1,%d0
	moveal	%d0,%a3
	bras	.L10002de4

.L10002e3e:
	moveal	%a2@,%a2

.L10002e40:
	movel	%a2,%d0
	bnes	.L10002e1a
	cmpal	%d4,%a3
	bles	.L10002e4a
	movel	%a3,%d4

.L10002e4a:
	cmpal	%d5,%a3
	bccs	.L10002e50
	movel	%a3,%d5

.L10002e50:
	moveal	%fp@(8),%a2
	movel	%d4,%a2@(16)
	movel	%d5,%a2@(20)

.L10002e5c:
	movel	%a3,%d0
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10002e66:
	linkw	%fp,#0
	movel	%a3,%sp@-
	moveal	%fp@(8),%a3
	moveal	%a3@(20),%a0
	cmpal	%fp@(12),%a0
	bnes	.L10002e7e
	addql	#1,%a3@(20)

.L10002e7e:
	moveal	%a3@(12),%a0
	cmpal	%fp@(12),%a0
	bnes	.L10002e8e
	moveq	#0,%d0
	movel	%d0,%a3@(12)

.L10002e8e:
	moveal	%sp@+,%a3
	unlk	%fp
	rts

sub_10002e94:
	linkw	%fp,#0
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	moveal	%a3,%a2
	moveq	#48,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	jsr	%pc@(sub_100066b4)
	addqw	#4,%sp
	moveal	%a4,%a0
	moveq	#36,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10003200)
	addqw	#8,%sp
	moveal	%a3@(108),%a2
	movel	%a2,%d0
	beqs	.L10002ed4
	movel	%a2,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp

.L10002ed4:
	movel	%a3,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	rts

sub_10002ee4:
	linkw	%fp,#-4
	movel	%a2,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a2
	movel	%a2,%d0
	bnes	.L10002f42
	movel	#644,%d0
	_NewPtrSysClear
	moveal	%a0,%a2
	movel	%a2,%d0
	beqs	.L10002f22
	movel	#17858560,%a2@(8)
	movel	%a2,%sp@-
	jsr	%pc@(sub_100033fe)
	addqw	#4,%sp
	movel	#24576,%sp@-
	jsr	%pc@(sub_10005c32)
	addqw	#4,%sp
	tstw	%d0
	beqs	.L10002f26

.L10002f22:
	moveq	#0,%d0
	bras	.L10002f44

.L10002f26:
	subqw	#2,%sp
	pea	%fp@(-4)
	subqw	#4,%sp
	movel	0x2a6,%sp@
	movel	%sp@+,%d0
	movel	%d0,%sp@-
	clrl	%sp@-
	clrw	%sp@-
	clrl	%sp@-
	jsr	%pc@(FragCreateContext)
	addqw	#2,%sp

.L10002f42:
	movel	%a2,%d0

.L10002f44:
	moveal	%sp@+,%a2
	unlk	%fp
	rts

sub_10002f4a:
	linkw	%fp,#-16
	moveml	%d3/%a2,%sp@-
	movew	#8287,%fp@(-16)
	movew	#8799,%fp@(-14)
	movew	#28673,%fp@(-12)
	movew	#8832,%fp@(-10)
	movew	#22671,%fp@(-8)
	movew	#20176,%fp@(-6)
	clrb	%sp@-
	moveq	#12,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005e42)
	addqw	#6,%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	bnes	.L10002f8c
	moveq	#-108,%d0
	bras	.L10002fc0

.L10002f8c:
	lea	%fp@(-16),%a0
	moveal	%a2,%a1
	moveq	#12,%d0
	_BlockMove
	movel	#1667658343,%d0
	moveal	%a2,%a0
	.short	0xa3ad
	movew	%d0,%d3
	cmpiw	#-5552,%d3
	bnes	.L10002fbe
	movel	#1667658343,%d0
	moveal	%a2,%a0
	lea	%fp@(-4),%a1
	movel	%a1,%sp@-
	.short	0xa5ad
	moveal	%sp@+,%a1
	movel	%a0,%a1@
	movew	%d0,%d3

.L10002fbe:
	movew	%d3,%d0

.L10002fc0:
	moveml	%sp@+,%d3/%a2
	unlk	%fp
	rts

sub_10002fc8:
	linkw	%fp,#-16
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	moveal	%fp@(12),%a4
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-16)
	clrw	%d1
	movew	%d1,%a4@
	tstl	%d0
	bnes	.L10002ffe
	jsr	%pc@(sub_10002ee4)
	movel	%d0,%fp@(-16)
	tstl	%d0
	bnes	.L10002ffe
	movew	#-2800,%a4@
	moveq	#0,%d0
	jmp	%pc@(.L100030b4)

.L10002ffe:
	moveal	%fp@(-16),%a2
	tstb	%a2@(13)
	bnew	.L10003092
	moveq	#1,%d3
	moveb	%d3,%a2@(13)
	subqw	#2,%sp
	pea	%pc@(local_SearchProc)
	moveb	%d3,%sp@-
	jsr	%pc@(FragAddSearchProc)
	addqw	#2,%sp
	clrl	%sp@-
	clrl	%sp@-
	clrb	%sp@-
	clrl	%sp@-
	clrl	%sp@-
	clrl	%sp@-
	clrl	%sp@-
	pea	%fp@(-12)
	jsr	%pc@(sub_10009d02)
	lea	%sp@(30),%sp
	moveb	%d3,%sp@-
	movel	%fp@(-12),%sp@-
	jsr	%pc@(sub_10008e6e)
	addqw	#6,%sp
	movel	#1986863136,%d0
	lea	%fp@(-8),%a1
	_Gestalt
	movel	%a0,%a1@
	movew	%d0,%a4@
	tstw	%d0
	bnes	.L10003074
	movel	%fp@(-8),%d0
	moveq	#8,%d1
	andl	%d1,%d0
	beqs	.L10003074
	lea	%a2@(632),%a2
	movel	%a2,%fp@(-4)
	movel	%a2@,%d0
	oril	#-2147483648,%d0
	movel	%d0,%a2@

.L10003074:
	jsr	%pc@(sub_10002f4a)
	movew	%d0,%a4@
	tstw	%d0
	beqs	.L10003092
	movew	#-2818,%a4@
	lea	%pc@(str_100030be),%a0
	moveal	%fp@(-16),%a1
	movel	%a0,%a1@(624)
	moveq	#0,%d0
	bras	.L100030b4

.L10003092:
	moveal	%fp@(-16),%a0
	moveal	%a0@(36),%a2
	bras	.L100030a6

.L1000309c:
	moveal	%a2@(8),%a0
	cmpal	%a3,%a0
	beqs	.L100030aa
	moveal	%a2@,%a2

.L100030a6:
	movel	%a2,%d0
	bnes	.L1000309c

.L100030aa:
	movel	%a2,%d0
	bnes	.L100030b2
	movew	#-2800,%a4@

.L100030b2:
	movel	%a2,%d0

.L100030b4:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

	.byte	0x00,0x40

str_100030be:
	.byte	0x3d
	.ascii	"FindContextListEntry: Can't register public Gestalt function."
	.byte	0x00,0x00

sub_100030fe:
	linkw	%fp,#0
	moveml	%a2-%a3,%sp@-
	moveal	%fp@(12),%a3
	moveal	%fp@(8),%a0
	moveal	%a0@(76),%a2
	bras	.L1000311e

.L10003114:
	moveal	%a2@(36),%a0
	cmpal	%a3,%a0
	beqs	.L10003122
	moveal	%a2@,%a2

.L1000311e:
	movel	%a2,%d0
	bnes	.L10003114

.L10003122:
	movel	%a2,%d0
	bnes	.L1000312e
	moveal	%fp@(16),%a0
	movew	#-2801,%a0@

.L1000312e:
	movel	%a2,%d0
	moveml	%sp@+,%a2-%a3
	unlk	%fp
	rts

sub_10003138:
	linkw	%fp,#0
	moveml	%a2-%a3,%sp@-
	moveal	%fp@(12),%a3
	moveal	%fp@(8),%a0
	moveal	%a0@(84),%a2
	bras	.L10003158

.L1000314e:
	moveal	%a2@(8),%a0
	cmpal	%a3,%a0
	beqs	.L1000315c
	moveal	%a2@,%a2

.L10003158:
	movel	%a2,%d0
	bnes	.L1000314e

.L1000315c:
	movel	%a2,%d0
	bnes	.L10003168
	moveal	%fp@(16),%a0
	movew	#-2801,%a0@

.L10003168:
	movel	%a2,%d0
	moveml	%sp@+,%a2-%a3
	unlk	%fp
	rts

sub_10003172:
	linkw	%fp,#0
	moveml	%d3/%a2-%a3,%sp@-
	moveal	%fp@(12),%a3
	moveal	%fp@(8),%a0
	moveal	%a0@(84),%a2
	bras	.L100031a2

.L10003188:
	movel	%a2@(20),%d3
	bmis	.L100031a0
	asll	#2,%d3
	addl	%a2,%d3
	moveal	%d3,%a0
	moveal	%a0@(32),%a0
	moveal	%a0@(36),%a0
	cmpal	%a3,%a0
	beqs	.L100031a6

.L100031a0:
	moveal	%a2@,%a2

.L100031a2:
	movel	%a2,%d0
	bnes	.L10003188

.L100031a6:
	movel	%a2,%d0
	moveml	%sp@+,%d3/%a2-%a3
	unlk	%fp
	rts

sub_100031b0:
	linkw	%fp,#0
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(14),%a4
	tstl	%a4@
	bnes	.L100031cc
	movel	%fp@(8),%d3
	movel	%d3,%a4@
	movel	%d3,%a4@(4)
	bras	.L100031f8

.L100031cc:
	moveb	%fp@(12),%d0
	beqs	.L100031e4
	movel	%a4@,%d0
	moveal	%fp@(8),%a2
	movel	%d0,%a2@
	moveal	%a4@,%a0
	movel	%a2,%a0@(4)
	movel	%a2,%a4@
	bras	.L100031f8

.L100031e4:
	moveal	%a4,%a2
	addqw	#4,%a2
	movel	%a2@,%d0
	moveal	%fp@(8),%a3
	movel	%d0,%a3@(4)
	moveal	%a2@,%a0
	movel	%a3,%a0@
	movel	%a3,%a2@

.L100031f8:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10003200:
	linkw	%fp,#0
	moveml	%a2/%a4,%sp@-
	moveal	%fp@(8),%a4
	moveal	%a4@(4),%a2
	movel	%a2,%d0
	beqs	.L1000321a
	movel	%a4@,%d0
	movel	%d0,%a2@
	bras	.L10003222

.L1000321a:
	movel	%a4@,%d0
	moveal	%fp@(12),%a0
	movel	%d0,%a0@

.L10003222:
	moveal	%a4@,%a2
	movel	%a2,%d0
	beqs	.L10003232
	movel	%a4@(4),%d0
	movel	%d0,%a2@(4)
	bras	.L1000323e

.L10003232:
	movel	%a4@(4),%d0
	moveal	%fp@(12),%a0
	movel	%d0,%a0@(4)

.L1000323e:
	moveml	%sp@+,%a2/%a4
	unlk	%fp
	rts

sub_10003246:
	linkw	%fp,#-16
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(14),%a2
	movel	%a2@,%d0
	movel	%d0,%fp@(-16)
	movel	%a2@(4),%d1
	movel	%d1,%fp@(-12)
	moveal	%fp@(8),%a3
	moveal	%a3@,%a4
	movel	%a3@(4),%d1
	movel	%d1,%fp@(-8)
	movel	%a4,%d2
	beqw	.L1000331e
	movel	%fp@(18),%d2
	bnes	.L100032be
	tstl	%d0
	bnes	.L10003288
	movel	%a4,%a2@
	movel	%d1,%a2@(4)
	braw	.L1000331e

.L10003288:
	moveb	%fp@(12),%d0
	beqs	.L100032a6
	movel	%fp@(-16),%d3
	moveal	%fp@(-8),%a2
	movel	%d3,%a2@
	moveal	%d3,%a0
	movel	%a2,%a0@(4)
	moveal	%fp@(14),%a0
	movel	%a4,%a0@
	bras	.L1000331e

.L100032a6:
	movel	%fp@(-12),%d3
	movel	%d3,%a4@(4)
	moveal	%d3,%a0
	movel	%a4,%a0@
	moveal	%fp@(14),%a0
	movel	%fp@(-8),%a0@(4)
	bras	.L1000331e

.L100032be:
	moveb	%fp@(12),%d0
	beqs	.L100032f4
	moveal	%fp@(18),%a2
	movel	%a2@(4),%d0
	movel	%d0,%fp@(-4)
	moveal	%fp@(-8),%a3
	movel	%a2,%a3@
	movel	%a3,%a2@(4)
	cmpal	%fp@(-16),%a2
	bnes	.L100032e8
	moveal	%fp@(14),%a0
	movel	%a4,%a0@
	bras	.L1000331e

.L100032e8:
	moveal	%fp@(-4),%a2
	movel	%a4,%a2@
	movel	%a2,%a4@(4)
	bras	.L1000331e

.L100032f4:
	moveal	%fp@(18),%a2
	moveal	%a2@,%a3
	movel	%a2,%a4@(4)
	movel	%a4,%a2@
	cmpal	%fp@(-12),%a2
	bnes	.L10003312
	moveal	%fp@(14),%a0
	movel	%fp@(-8),%a0@(4)
	bras	.L1000331e

.L10003312:
	movel	%fp@(-8),%d3
	movel	%d3,%a3@(4)
	moveal	%d3,%a0
	movel	%a3,%a0@

.L1000331e:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10003326:
	linkw	%fp,#-8
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(12),%a3
	moveal	%fp@(8),%a2
	moveal	%a2@,%a4
	movel	%a2@(4),%d0
	movel	%d0,%fp@(-8)
	movel	%a4,%d0
	bnes	.L10003346
	bras	.L10003386

.L10003346:
	moveal	%a4@(4),%a2
	moveal	%fp@(-8),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-4)
	moveal	%a3@,%a0
	cmpal	%a4,%a0
	bnes	.L1000335e
	movel	%d0,%a3@
	bras	.L10003362

.L1000335e:
	movel	%fp@(-4),%a2@

.L10003362:
	moveal	%a3@(4),%a0
	cmpal	%fp@(-8),%a0
	bnes	.L10003372
	movel	%a2,%a3@(4)
	bras	.L1000337a

.L10003372:
	moveal	%fp@(-4),%a0
	movel	%a2,%a0@(4)

.L1000337a:
	moveq	#0,%d3
	movel	%d3,%a4@(4)
	moveal	%fp@(-8),%a0
	movel	%d3,%a0@

.L10003386:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_1000338e:
	linkw	%fp,#-4
	moveml	%d3-%d4/%a2,%sp@-
	movel	%fp@(8),%d4
	moveal	%fp@(12),%a2
	moveq	#28,%d3
	bras	.L100033ca

.L100033a2:
	movel	%d4,%d0
	movel	%d3,%d1
	lsrl	%d1,%d0
	moveq	#15,%d1
	andb	%d1,%d0
	moveb	%d0,%fp@(-4)
	moveq	#10,%d1
	cmpb	%d1,%d0
	bcss	.L100033be
	addib	#55,%fp@(-4)
	bras	.L100033c4

.L100033be:
	addib	#48,%fp@(-4)

.L100033c4:
	moveb	%fp@(-4),%a2@+
	subql	#4,%d3

.L100033ca:
	cmpil	#0,%d3
	bpls	.L100033a2
	clrb	%a2@
	moveml	%sp@+,%d3-%d4/%a2
	unlk	%fp
	rts

sub_100033dc:
	linkw	%fp,#-4
	movel	#1667657063,%d0
	lea	%fp@(-4),%a1
	_Gestalt
	movel	%a0,%a1@
	tstw	%d0
	beqs	.L100033f6
	moveq	#0,%d0
	bras	.L100033fa

.L100033f6:
	movel	%fp@(-4),%d0

.L100033fa:
	unlk	%fp
	rts

sub_100033fe:
	linkw	%fp,#-32
	moveml	%d3/%a2,%sp@-
	movew	#20054,%fp@(-32)
	clrw	%d0
	movew	%d0,%fp@(-30)
	movew	#8302,%fp@(-28)
	moveq	#8,%d0
	movew	%d0,%fp@(-26)
	movew	#8380,%fp@(-24)
	movew	#4369,%fp@(-22)
	movew	#-1,%fp@(-20)
	movew	#17006,%fp@(-18)
	moveq	#16,%d0
	movew	%d0,%fp@(-16)
	movew	#20062,%fp@(-14)
	movew	#8287,%fp@(-12)
	movew	#20559,%fp@(-10)
	movew	#20176,%fp@(-8)
	moveq	#26,%d0
	_NewPtrSysClear
	moveal	%a0,%a2
	movel	%a2,%d0
	bnes	.L10003462
	moveq	#-108,%d0
	bras	.L100034a8

.L10003462:
	movel	%fp@(8),%d0
	moveq	#16,%d1
	asrl	%d1,%d0
	movew	%d0,%fp@(-22)
	movew	%fp@(10),%fp@(-20)
	lea	%fp@(-32),%a0
	moveal	%a2,%a1
	moveq	#26,%d0
	_BlockMove
	movel	#1667657063,%d0
	moveal	%a2,%a0
	.short	0xa3ad
	movew	%d0,%d3
	cmpiw	#-5552,%d3
	bnes	.L100034a6
	movel	#1667657063,%d0
	moveal	%a2,%a0
	lea	%fp@(-4),%a1
	movel	%a1,%sp@-
	.short	0xa5ad
	moveal	%sp@+,%a1
	movel	%a0,%a1@
	movew	%d0,%d3

.L100034a6:
	movew	%d3,%d0

.L100034a8:
	moveml	%sp@+,%d3/%a2
	unlk	%fp
	rts

sub_100034b0:
	linkw	%fp,#-12
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	moveal	%fp@(24),%a4
	movel	%fp@(28),%d3
	movel	%a3,%sp@-
	jsr	%pc@(sub_10002d90)
	addqw	#4,%sp
	movel	%d0,%fp@(-12)
	movel	%fp@(-12),%a3@(12)
	movel	%fp@(32),%sp@-
	clrb	%sp@-
	movel	%d3,%sp@-
	movel	%fp@(16),%sp@-
	movel	%d0,%sp@-
	movel	%a3,%sp@-
	pea	%fp@(-8)
	jsr	%pc@(sub_1000437c)
	lea	%sp@(26),%sp
	movew	%d0,%fp@(-4)
	tstw	%d0
	bpls	.L10003528
	movel	%fp@(-12),%sp@-
	clrl	%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10003800)
	lea	%sp@(12),%sp
	cmpiw	#-2804,%fp@(-4)
	bnew	.L1000363a
	movel	%d3,%d0
	moveq	#1,%d1
	andl	%d1,%d0
	bnew	.L1000363a
	movew	#-2817,%fp@(-4)
	braw	.L1000363a

.L10003528:
	movel	%d3,%d0
	moveq	#2,%d1
	andl	%d1,%d0
	beqs	.L10003586
	cmpiw	#2,%fp@(-4)
	bnes	.L10003586
	movel	%fp@(-12),%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10002e66)
	addqw	#8,%sp
	moveal	%fp@(-8),%a0
	movel	%a0@(36),%d0
	moveal	%fp@(12),%a0
	movel	%d0,%a0@
	movel	%fp@(20),%sp@-
	clrl	%sp@-
	movel	%fp@(-8),%sp@-
	jsr	%pc@(sub_10004b5a)
	lea	%sp@(12),%sp
	movew	%d0,%fp@(-4)
	moveal	%fp@(-8),%a0
	moveal	%a0@(64),%a2
	movel	%a2,%d0
	beqs	.L1000357a
	moveal	%fp@(20),%a0
	movel	%a2,%a0@

.L1000357a:
	movel	%a4,%d0
	beqs	.L10003580
	clrb	%a4@

.L10003580:
	clrw	%d0
	jmp	%pc@(.L10003704)

.L10003586:
	movel	%a4,%d0
	beqs	.L1000358e
	moveb	#1,%a4@

.L1000358e:
	pea	%fp@(-4)
	movel	%fp@(-12),%sp@-
	movel	%fp@(-8),%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10003746)
	lea	%sp@(16),%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L100035c2
	movel	%fp@(-12),%sp@-
	movel	%a4,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10003800)
	lea	%sp@(12),%sp
	movew	%fp@(-4),%d0
	jmp	%pc@(.L10003704)

.L100035c2:
	movel	%d3,%d0
	andil	#256,%d0
	beqs	.L100035d2
	moveb	#1,%a4@(15)

.L100035d2:
	moveal	%a3,%a2
	moveq	#84,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	clrb	%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_100031b0)
	lea	%sp@(10),%sp
	movel	%fp@(32),%sp@-
	movel	%d3,%sp@-
	movel	%a4,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10003b1c)
	lea	%sp@(16),%sp
	movew	%d0,%fp@(-4)
	tstw	%d0
	bnew	.L100036ee
	movel	%fp@(32),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10003c84)
	addqw	#8,%sp
	movew	%d0,%fp@(-4)
	moveq	#3,%d1
	cmpw	%d1,%d0
	bnes	.L1000361e
	clrw	%d0
	movew	%d0,%fp@(-4)

.L1000361e:
	movew	%fp@(-4),%d0
	bnew	.L100036ee
	movel	%fp@(32),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10003e6a)
	addqw	#8,%sp
	movew	%d0,%fp@(-4)
	tstw	%d0
	beqs	.L10003642

.L1000363a:
	movew	%fp@(-4),%d0
	jmp	%pc@(.L10003704)

.L10003642:
	moveal	%fp@(16),%a0
	movel	%a0@(24),%sp@-
	jsr	%pc@(sub_10008dc0)
	movel	%fp@(20),%sp@-
	clrl	%sp@-
	movel	%fp@(-8),%sp@-
	jsr	%pc@(sub_10004b5a)
	lea	%sp@(12),%sp
	movew	%d0,%fp@(-4)
	tstw	%d0
	beqs	.L10003678
	movel	%d3,%d0
	moveq	#64,%d1
	andl	%d1,%d0
	beqs	.L10003678
	movew	#-2824,%fp@(-4)
	bras	.L100036ee

.L10003678:
	tstl	%a3@(36)
	bnes	.L10003682
	movel	%a4,%a3@(36)

.L10003682:
	movel	%d3,%d0
	moveq	#64,%d1
	andl	%d1,%d0
	beqs	.L100036a6
	movel	%fp@(20),%sp@-
	movel	%fp@(-8),%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10004a92)
	lea	%sp@(12),%sp
	movew	%d0,%fp@(-4)
	tstw	%d0
	beqs	.L100036b8
	bras	.L100036ee

.L100036a6:
	moveal	%fp@(-8),%a0
	moveal	%a0@(64),%a2
	movel	%a2,%d0
	beqs	.L100036b8
	moveal	%fp@(20),%a0
	movel	%a2,%a0@

.L100036b8:
	moveq	#1,%d0
	movel	%d0,%sp@-
	movel	%fp@(-12),%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_1000370c)
	lea	%sp@(12),%sp
	movel	%fp@(32),%sp@-
	movel	%a4,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10003ff4)
	lea	%sp@(12),%sp
	movew	%d0,%fp@(-4)
	tstw	%d0
	bnes	.L100036ee
	moveal	%fp@(12),%a0
	movel	%fp@(-12),%a0@
	clrw	%d0
	bras	.L10003704

.L100036ee:
	clrl	%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	movel	%a4,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_100038de)
	lea	%sp@(14),%sp
	movew	%fp@(-4),%d0

.L10003704:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_1000370c:
	linkw	%fp,#0
	moveml	%d3/%a2-%a4,%sp@-
	movel	%fp@(16),%d3
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a2
	moveal	%a2@(44),%a3
	moveal	%fp@(8),%a4
	addqw	#8,%a4
	bras	.L1000373a

.L1000372a:
	movel	%a4@,%sp@-
	movel	%fp@(12),%sp@-
	movel	%d3,%sp@-
	moveal	%a3@(8),%a0
	jsr	%a0@
	moveal	%a3@,%a3

.L1000373a:
	movel	%a3,%d0
	bnes	.L1000372a
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10003746:
	linkw	%fp,#-16
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(16),%a4
	moveq	#0,%d4
	moveal	%fp@(8),%a0
	moveal	%a0@(76),%a3
	bras	.L1000376a

.L1000375e:
	moveal	%a3@(8),%a0
	cmpal	%a4,%a0
	bnes	.L10003768
	addql	#1,%d4

.L10003768:
	moveal	%a3@,%a3

.L1000376a:
	movel	%a3,%d0
	bnes	.L1000375e
	movel	%d4,%d0
	lsll	#2,%d0
	moveq	#32,%d1
	addl	%d1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	movel	%d0,%fp@(-16)
	tstl	%d0
	bnes	.L10003792
	moveal	%fp@(20),%a0
	movew	#-2809,%a0@
	moveq	#0,%d0
	bras	.L100037f8

.L10003792:
	moveal	%fp@(-16),%a2
	movel	%a4,%a2@(8)
	clrw	%d0
	movew	%d0,%a2@(12)
	movel	%d4,%a2@(16)
	moveq	#0,%d3
	movel	%d3,%a2@(20)
	movel	%d3,%d4
	moveal	%fp@(8),%a0
	moveal	%a0@(76),%a3
	moveq	#32,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-12)
	moveal	%fp@(-16),%a0
	moveq	#20,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	movel	%a2,%fp@(-4)
	bras	.L100037f0

.L100037ce:
	moveal	%a3@(8),%a0
	cmpal	%a4,%a0
	bnes	.L100037ee
	moveal	%fp@(-4),%a0
	movel	%a3,%a0@
	cmpal	%fp@(12),%a3
	bnes	.L100037e8
	moveal	%fp@(-8),%a0
	movel	%d4,%a0@

.L100037e8:
	addql	#4,%fp@(-4)
	addql	#1,%d4

.L100037ee:
	moveal	%a3@,%a3

.L100037f0:
	movel	%a3,%d0
	bnes	.L100037ce
	movel	%fp@(-16),%d0

.L100037f8:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10003800:
	linkw	%fp,#0
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	moveal	%a2@(76),%a3
	bras	.L1000383c

.L10003812:
	moveal	%a3@,%a4
	moveal	%a3@(8),%a0
	cmpal	%fp@(16),%a0
	bnes	.L1000383a
	subql	#1,%a3@(44)
	movel	%a3@(44),%d0
	bgts	.L1000383a
	clrl	%sp@-
	movel	%a3,%sp@-
	movel	%fp@(12),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_100054ec)
	lea	%sp@(16),%sp

.L1000383a:
	moveal	%a4,%a3

.L1000383c:
	movel	%a3,%d0
	bnes	.L10003812
	movel	%fp@(16),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10002e66)
	addqw	#8,%sp
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	rts

sub_10003854:
	linkw	%fp,#-4
	moveml	%d3-%d4/%a2-%a4,%sp@-
	movel	%fp@(8),%d4
	moveal	%fp@(16),%a2
	subql	#1,%a2@(16)
	moveal	%fp@(12),%a3
	moveal	%a3@(40),%a0
	cmpal	%a2,%a0
	bnes	.L1000387a
	moveq	#0,%d0
	movel	%d0,%a3@(40)

.L1000387a:
	moveal	%fp@(16),%a2
	movel	%a2@(20),%d0
	cmpl	%d4,%d0
	bnes	.L1000388e
	moveq	#-1,%d0
	movel	%d0,%a2@(20)
	bras	.L100038ac

.L1000388e:
	moveal	%fp@(16),%a2
	movel	%a2@(20),%d0
	cmpl	%d4,%d0
	bles	.L100038ac
	subql	#1,%a2@(20)
	bras	.L100038ac

.L100038a0:
	movel	%a3@,%d0
	movel	%d0,%a4@
	addqw	#4,%a3
	addqw	#4,%a4
	addql	#1,%d4
	bras	.L100038cc

.L100038ac:
	moveal	%fp@(16),%a2
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-4)
	movel	%d4,%d3
	asll	#2,%d3
	addl	%fp@(16),%d3
	moveal	%d3,%a3
	moveq	#36,%d0
	addal	%d0,%a3
	moveal	%d3,%a4
	moveq	#32,%d0
	addal	%d0,%a4

.L100038cc:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	cmpl	%d4,%d0
	bgts	.L100038a0
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_100038de:
	linkw	%fp,#-20
	moveml	%d3-%d6/%a2-%a4,%sp@-
	movel	%fp@(18),%d6
	moveal	%fp@(12),%a2
	tstb	%a2@(14)
	bnew	.L100039be
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-12)
	moveal	%fp@(12),%a3
	moveq	#32,%d0
	addal	%d0,%a3
	moveq	#0,%d5
	movel	%a3,%fp@(-4)
	braw	.L100039a6

.L10003910:
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a3
	addql	#1,%a3@(48)
	subql	#1,%a3@(44)
	movel	%a3@(44),%d0
	bgts	.L100039a0
	movew	%a3@(60),%d0
	extl	%d0
	moveq	#3,%d1
	cmpl	%d1,%d0
	beqs	.L1000394e
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10003952
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10003952
	tstl	%d0
	beqs	.L10003952
	moveq	#-1,%d1
	cmpl	%d1,%d0
	beqs	.L10003952
	moveq	#-2,%d1
	cmpl	%d1,%d0
	beqs	.L10003952
	bras	.L10003952

.L1000394e:
	moveq	#-1,%d4
	bras	.L10003954

.L10003952:
	moveq	#-2,%d4

.L10003954:
	movew	%d4,%a3@(60)
	moveal	%a3,%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-20)
	moveal	%a3,%a0
	moveq	#72,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-16)
	moveq	#0,%d3
	moveal	%a0,%a4
	bras	.L10003990

.L10003972:
	moveal	%a4@,%a2
	movel	%a2,%d0
	beqs	.L1000398c
	addql	#1,%a2@(12)
	subql	#1,%a2@(8)
	movel	%a2@(8),%d0
	bgts	.L1000398c
	moveq	#-2,%d0
	movew	%d0,%a2@(24)

.L1000398c:
	addqw	#4,%a4
	addql	#4,%d3

.L10003990:
	moveal	%fp@(-20),%a0
	moveal	%a0@,%a0
	movel	%a0@(104),%d0
	asll	#2,%d0
	cmpl	%d3,%d0
	bgts	.L10003972

.L100039a0:
	addql	#4,%fp@(-4)
	addql	#4,%d5

.L100039a6:
	moveal	%fp@(-12),%a0
	movel	%a0@,%d0
	asll	#2,%d0
	cmpl	%d5,%d0
	bgtw	.L10003910
	moveal	%fp@(12),%a0
	moveb	#1,%a0@(14)

.L100039be:
	moveb	%fp@(16),%d0
	beqs	.L100039d2
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10004266)
	addqw	#8,%sp

.L100039d2:
	cmpib	#2,%fp@(16)
	beqs	.L100039f2
	moveq	#2,%d0
	movel	%d0,%sp@-
	moveal	%fp@(12),%a0
	movel	%a0@(8),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_1000370c)
	lea	%sp@(12),%sp

.L100039f2:
	moveq	#0,%d4
	moveal	%fp@(12),%a2
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-8)
	moveal	%fp@(12),%a4
	moveq	#32,%d0
	addal	%d0,%a4
	braw	.L10003a94

.L10003a0c:
	movel	%d4,%d0
	asll	#2,%d0
	addl	%a4,%d0
	moveal	%d0,%a0
	moveal	%a0@,%a3
	movel	%a3@(48),%d0
	bles	.L10003a20
	subql	#1,%a3@(48)

.L10003a20:
	moveal	%a3,%a0
	cmpib	#2,%fp@(16)
	beqs	.L10003a6e
	moveal	%a3@(40),%a1
	cmpal	%fp@(12),%a1
	bnes	.L10003a3a
	moveq	#0,%d0
	movel	%d0,%a3@(40)

.L10003a3a:
	movel	%a3@(44),%d0
	moveq	#0,%d3
	cmpl	%d3,%d0
	bgts	.L10003a92
	movel	%a3@(48),%d0
	cmpl	%d3,%d0
	bgts	.L10003a92
	movel	%d6,%sp@-
	movel	%a3,%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_100054ec)
	lea	%sp@(16),%sp
	moveq	#0,%d0
	movel	%d4,%d1
	asll	#2,%d1
	addl	%a4,%d1
	moveal	%d1,%a0
	movel	%d0,%a0@
	bras	.L10003a92

.L10003a6e:
	movel	%a3@(44),%d0
	moveq	#0,%d3
	cmpl	%d3,%d0
	bgts	.L10003a80
	movel	%a3@(48),%d0
	cmpl	%d3,%d0
	bles	.L10003a92

.L10003a80:
	movel	%fp@(12),%sp@-
	movel	%a3,%sp@-
	movel	%d4,%sp@-
	jsr	%pc@(sub_10003854)
	lea	%sp@(12),%sp
	subql	#1,%d4

.L10003a92:
	addql	#1,%d4

.L10003a94:
	moveal	%fp@(-8),%a0
	movel	%a0@,%d0
	cmpl	%d4,%d0
	bgtw	.L10003a0c
	cmpib	#2,%fp@(16)
	beqs	.L10003ab6
	movel	%fp@(8),%sp@-
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_10003abe)
	addqw	#8,%sp

.L10003ab6:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_10003abe:
	linkw	%fp,#0
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	moveal	%fp@(12),%a4
	moveal	%a4@(36),%a0
	cmpal	%a3,%a0
	bnes	.L10003ae0
	moveq	#0,%d3
	movel	%d3,%a4@(36)
	movel	%d3,%a4@(92)

.L10003ae0:
	moveal	%a4,%a2
	moveq	#84,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10003200)
	addqw	#8,%sp
	movel	%a3@(8),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10002e66)
	addqw	#8,%sp
	moveal	%a3@(28),%a2
	movel	%a2,%d0
	beqs	.L10003b0c
	movel	%a2,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp

.L10003b0c:
	movel	%a3,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10003b1c:
	linkw	%fp,#-36
	moveml	%d3-%d7/%a2-%a4,%sp@-
	moveal	%fp@(12),%a2
	movel	%a2@(16),%d0
	movel	%d0,%fp@(-36)
	moveal	%a2,%a3
	moveq	#32,%d1
	addal	%d1,%a3
	movel	%fp@(16),%d1
	moveq	#4,%d2
	andl	%d2,%d1
	movel	%d1,%fp@(-20)
	addqw	#8,%a2
	movel	%a2,%fp@(-16)
	moveal	%fp@(12),%a0
	moveq	#15,%d1
	addal	%d1,%a0
	movel	%a0,%fp@(-12)
	movel	%d0,%d3
	asll	#2,%d3
	movel	%d3,%d0
	addl	%a3,%d0
	movel	%d0,%fp@(-4)
	braw	.L10003c66

.L10003b64:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-32)
	moveal	%d0,%a0
	tstw	%a0@(60)
	bnew	.L10003c66
	clrb	%fp@(-28)
	movel	%fp@(-20),%d0
	beqs	.L10003b96
	moveal	%fp@(12),%a0
	movel	%a0@(20),%d0
	cmpl	%fp@(-36),%d0
	bnes	.L10003b96
	moveb	#1,%fp@(-28)

.L10003b96:
	moveq	#0,%d5
	moveal	%fp@(-32),%a3
	moveq	#12,%d0
	addal	%d0,%a3
	moveal	%fp@(-32),%a4
	moveq	#72,%d0
	addal	%d0,%a4
	moveal	%fp@(-32),%a0
	moveq	#16,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveq	#0,%d6
	moveq	#0,%d7
	braw	.L10003c5a

.L10003bbc:
	movel	%d6,%d0
	addl	%a4,%d0
	moveal	%d0,%a0
	tstl	%a0@
	bnew	.L10003c50
	movel	%fp@(-8),%sp@-
	moveb	%fp@(-28),%sp@-
	movel	%d5,%sp@-
	movel	%fp@(-32),%sp@-
	moveal	%fp@(-16),%a0
	movel	%a0@,%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10004d70)
	lea	%sp@(22),%sp
	movew	%d0,%d4
	beqs	.L10003c12
	moveq	#-2,%d0
	moveal	%fp@(-32),%a0
	movew	%d0,%a0@(60)
	moveal	%a0@(12),%a0
	movel	%a0@(16),%d3
	moveal	%d3,%a0
	moveal	%fp@(20),%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData
	movew	%d4,%d0
	bras	.L10003c7c

.L10003c12:
	moveal	%fp@(-12),%a0
	tstb	%a0@
	beqs	.L10003c50
	moveal	%a3@,%a2
	addal	%d7,%a2
	lea	%a2@(136),%a2
	movel	%d6,%d0
	addl	%a4,%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-24)
	movel	%a2@(8),%d1
	bles	.L10003c50
	moveal	%d0,%a0
	moveal	%a0@(36),%a0
	moveal	%a2@(8),%a1
	_HoldMemory
	movew	%d0,%d4
	beqs	.L10003c50
	moveq	#-50,%d0
	cmpw	%d0,%d4
	beqs	.L10003c50
	movew	%d4,%d0
	bras	.L10003c7c

.L10003c50:
	addql	#4,%d6
	addil	#32,%d7
	addql	#1,%d5

.L10003c5a:
	moveal	%a3@,%a0
	movel	%a0@(104),%d0
	cmpl	%d5,%d0
	bgtw	.L10003bbc

.L10003c66:
	subql	#4,%fp@(-4)
	subql	#1,%fp@(-36)
	cmpil	#0,%fp@(-36)
	bplw	.L10003b64
	clrw	%d0

.L10003c7c:
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	rts

sub_10003c84:
	linkw	%fp,#-8
	moveml	%d3-%d5/%a2-%a4,%sp@-
	clrw	%d4
	moveal	%fp@(8),%a2
	movel	%a2@(16),%d5
	moveq	#32,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-8)
	movel	%d5,%d3
	asll	#2,%d3
	movel	%d3,%d0
	addl	%a2,%d0
	moveal	%d0,%a3
	bras	.L10003cee

.L10003caa:
	moveal	%a3@,%a4
	tstw	%a4@(60)
	bnes	.L10003cee
	movel	%fp@(12),%sp@-
	moveal	%a4,%a0
	moveq	#16,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_1000491e)
	lea	%sp@(12),%sp
	movew	%d0,%d4
	moveq	#3,%d0
	cmpw	%d0,%d4
	beqs	.L10003cd4
	tstw	%d4
	bmis	.L10003cfa

.L10003cd4:
	moveal	%a4,%a2
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10003d68)
	addqw	#8,%sp
	movew	%d0,%d4
	bnes	.L10003cfa
	moveq	#1,%d0
	movew	%d0,%a4@(60)

.L10003cee:
	subqw	#4,%a3
	subql	#4,%d3
	cmpil	#0,%d3
	bpls	.L10003caa

.L10003cfa:
	moveal	%fp@(8),%a2
	movel	%a2@(16),%d5
	moveq	#32,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-4)
	movel	%d5,%d3
	asll	#2,%d3
	movel	%d3,%d0
	addl	%a2,%d0
	moveal	%d0,%a3
	bras	.L10003d26

.L10003d16:
	moveal	%a3@,%a4
	moveal	%a4,%a0
	moveq	#16,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_10007d5e)
	addqw	#4,%sp

.L10003d26:
	subqw	#4,%a3
	subql	#4,%d3
	cmpil	#0,%d3
	bpls	.L10003d16
	tstw	%d4
	beqs	.L10003d5e
	moveq	#-2,%d0
	movew	%d0,%a4@(60)
	moveal	%fp@(12),%a2
	tstb	%a2@
	bnes	.L10003d5a
	moveal	%a4@(12),%a0
	movel	%a0@(16),%d3
	moveal	%d3,%a0
	moveal	%a2,%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData

.L10003d5a:
	movew	%d4,%d0
	bras	.L10003d60

.L10003d5e:
	clrw	%d0

.L10003d60:
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10003d68:
	linkw	%fp,#-12
	moveml	%d3/%d5-%d6/%a2-%a4,%sp@-
	moveq	#0,%d5
	moveal	%fp@(8),%a2
	moveq	#12,%d3
	addal	%d3,%a2
	movel	%a2,%fp@(-12)
	moveal	%fp@(8),%a3
	moveq	#72,%d0
	addal	%d0,%a3
	moveal	%fp@(12),%a0
	addal	%d3,%a0
	movel	%a0,%fp@(-8)
	moveq	#0,%d6
	movel	%a3,%fp@(-4)
	braw	.L10003e50

.L10003d9a:
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a4
	moveal	%fp@(-12),%a0
	moveal	%a0@,%a3
	addal	%d6,%a3
	lea	%a3@(136),%a3
	tstb	%a3@(23)
	bnew	.L10003e44
	tstb	%a3@(20)
	bnes	.L10003dc2
	tstb	%a3@(24)
	bnew	.L10003e44

.L10003dc2:
	movew	%a4@(24),%d0
	extl	%d0
	moveq	#3,%d1
	cmpl	%d1,%d0
	beqs	.L10003e44
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10003e44
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10003e44
	tstl	%d0
	beqs	.L10003df2
	moveq	#-1,%d1
	cmpl	%d1,%d0
	beqs	.L10003dec
	moveq	#-2,%d1
	cmpl	%d1,%d0
	beqs	.L10003dec
	bras	.L10003df2

.L10003dec:
	movew	#-2817,%d0
	bras	.L10003e62

.L10003df2:
	movel	%a4@(36),%sp@-
	movel	%d5,%sp@-
	moveal	%fp@(12),%a0
	movel	%a0@,%sp@-
	moveal	%fp@(-8),%a0
	moveal	%a0@,%a0
	moveal	%a0@(64),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d3
	beqs	.L10003e1c
	moveq	#-2,%d0
	movew	%d0,%a4@(24)
	movew	%d3,%d0
	bras	.L10003e62

.L10003e1c:
	tstb	%a3@(21)
	beqs	.L10003e3e
	tstl	%a3@(8)
	beqs	.L10003e3e
	moveal	%fp@(-12),%a0
	moveal	%a0@,%a0
	movel	%a0@(36),%sp@-
	movel	%a4@(36),%sp@-
	movel	%a3@(8),%sp@-
	jsr	%pc@(sub_10008db2)

.L10003e3e:
	moveq	#1,%d0
	movew	%d0,%a4@(24)

.L10003e44:
	addil	#32,%d6
	addql	#4,%fp@(-4)
	addql	#1,%d5

.L10003e50:
	moveal	%fp@(-12),%a0
	moveal	%a0@,%a0
	movel	%a0@(104),%d0
	cmpl	%d5,%d0
	bgtw	.L10003d9a
	clrw	%d0

.L10003e62:
	moveml	%sp@+,%d3/%d5-%d6/%a2-%a4
	unlk	%fp
	rts

sub_10003e6a:
	linkw	%fp,#0
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	movel	%a2@(16),%d3
	moveal	%a2,%a3
	moveq	#32,%d0
	addal	%d0,%a3
	movel	%d3,%d4
	asll	#2,%d4
	movel	%d4,%d0
	addl	%a3,%d0
	moveal	%d0,%a4
	bras	.L10003ec6

.L10003e8c:
	moveal	%a4@,%a3
	movew	%a3@(60),%d0
	moveq	#1,%d1
	cmpw	%d1,%d0
	bnes	.L10003ec6
	moveal	%a3@(12),%a0
	tstl	%a0@(40)
	bnes	.L10003ec6
	moveal	%a3@(52),%a2
	bras	.L10003ec2

.L10003ea8:
	clrb	%sp@-
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003edc)
	lea	%sp@(10),%sp
	movew	%d0,%d3
	beqs	.L10003ebe
	movew	%d3,%d0
	bras	.L10003ed4

.L10003ebe:
	moveal	%a2@(52),%a2

.L10003ec2:
	movel	%a2,%d0
	bnes	.L10003ea8

.L10003ec6:
	subqw	#4,%a4
	subql	#4,%d4
	cmpil	#0,%d4
	bpls	.L10003e8c
	clrw	%d0

.L10003ed4:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10003edc:
	linkw	%fp,#-324
	moveml	%d3-%d7/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	moveal	%a4@(12),%a2
	movel	%a2@(116),%d6
	moveal	%a2@(68),%a0
	movel	%a0@(36),%d0
	movel	%d0,%fp@(-324)
	movel	%a2@(72),%d0
	movel	%d0,%fp@(-320)
	moveq	#0,%d5
	moveb	%fp@(16),%d7
	seq	%d7
	negb	%d7
	extw	%d7
	extl	%d7
	braw	.L10003fe4

.L10003f16:
	pea	%fp@(-316)
	movel	%d5,%sp@-
	movel	%fp@(-320),%sp@-
	moveal	%fp@(-324),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	tstw	%d0
	bnew	.L10003fe2
	moveb	%fp@(-300),%d0
	moveq	#2,%d3
	cmpb	%d3,%d0
	bnew	.L10003fe2
	movel	%fp@(-308),%d4
	moveq	#16,%d0
	lsrl	%d0,%d4
	moveal	%fp@(-304),%a0
	lea	%fp@(-268),%a1
	movel	%d4,%d0
	_BlockMoveData
	pea	%fp@(-292)
	pea	%fp@(-4)
	movel	%d4,%sp@-
	pea	%fp@(-268)
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_10004c2c)
	lea	%sp@(20),%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L10003fe2
	cmpal	%a4,%a3
	beqs	.L10003fe2
	movel	%fp@(-292),%d4
	bmis	.L10003fe2
	tstl	%d7
	beqs	.L10003f92
	asll	#2,%d4
	addl	%a3,%d4
	moveal	%d4,%a0
	moveal	%a0@(72),%a0
	movew	%a0@(24),%d0
	moveq	#1,%d1
	cmpw	%d1,%d0
	bnes	.L10003fe2

.L10003f92:
	moveb	%fp@(-276),%d0
	cmpb	%d3,%d0
	bnes	.L10003fe2
	pea	%fp@(-12)
	pea	%fp@(-292)
	movel	%a3,%sp@-
	jsr	%pc@(sub_10004c9c)
	lea	%sp@(12),%sp
	tstw	%d0
	bnes	.L10003fe2
	pea	%fp@(-8)
	pea	%fp@(-316)
	movel	%a4,%sp@-
	jsr	%pc@(sub_10004c9c)
	lea	%sp@(12),%sp
	tstw	%d0
	bnes	.L10003fe2
	moveal	%fp@(-8),%a0
	movel	%a0@,%d0
	moveal	%fp@(-12),%a0
	movel	%d0,%a0@
	moveal	%fp@(-8),%a0
	movel	%a0@(4),%d0
	moveal	%fp@(-12),%a0
	movel	%d0,%a0@(4)

.L10003fe2:
	addql	#1,%d5

.L10003fe4:
	cmpl	%d6,%d5
	bltw	.L10003f16
	clrw	%d0
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	rts

sub_10003ff4:
	linkw	%fp,#-20
	moveml	%d3-%d7/%a2-%a4,%sp@-
	clrw	%d6
	moveal	%fp@(12),%a2
	movel	%a2@(16),%d3
	moveal	%a2,%a3
	moveq	#32,%d0
	addal	%d0,%a3
	movel	%d3,%d7
	asll	#2,%d7
	movel	%d7,%d0
	addl	%a3,%d0
	movel	%d0,%fp@(-4)
	braw	.L10004184

.L1000401c:
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a4
	movew	%a4@(60),%d0
	extl	%d0
	moveq	#3,%d1
	cmpl	%d1,%d0
	beqw	.L10004184
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqw	.L10004184
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L1000405c
	tstl	%d0
	beqs	.L10004054
	moveq	#-1,%d1
	cmpl	%d1,%d0
	beqw	.L100040e2
	moveq	#-2,%d1
	cmpl	%d1,%d0
	beqw	.L100040e2
	bras	.L1000405c

.L10004054:
	movew	#-2819,%d6
	braw	.L10004198

.L1000405c:
	movel	%a4,%sp@-
	jsr	%pc@(sub_10004206)
	addqw	#4,%sp
	movew	%d0,%d6
	bnew	.L10004198
	clrb	%fp@(-20)
	moveal	%a4@(12),%a0
	movel	%a0@(104),%d5
	moveal	%a4,%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-16)
	moveal	%a4,%a2
	moveq	#72,%d0
	addal	%d0,%a2
	moveq	#0,%d3
	movel	%d5,%d4
	asll	#5,%d4
	moveal	%a2,%a3
	bras	.L100040f2

.L10004090:
	moveal	%fp@(-16),%a0
	moveal	%a0@,%a2
	addal	%d3,%a2
	lea	%a2@(136),%a2
	tstb	%a2@(23)
	bnes	.L100040ea
	tstb	%a2@(20)
	beqs	.L100040ea
	moveal	%a3@,%a2
	movew	%a2@(24),%d0
	extl	%d0
	moveq	#3,%d1
	cmpl	%d1,%d0
	beqs	.L100040ea
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L100040ea
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L100040d4
	tstl	%d0
	beqs	.L100040d4
	moveq	#-1,%d1
	cmpl	%d1,%d0
	beqs	.L100040e2
	moveq	#-2,%d1
	cmpl	%d1,%d0
	beqs	.L100040e2
	bras	.L100040ea

.L100040d4:
	moveb	#1,%fp@(-20)
	moveq	#2,%d0
	movew	%d0,%a2@(24)
	bras	.L100040ea

.L100040e2:
	movew	#-2817,%d0
	jmp	%pc@(.L100041f4)

.L100040ea:
	addqw	#4,%a3
	addil	#32,%d3

.L100040f2:
	cmpl	%d3,%d4
	bgts	.L10004090
	moveq	#2,%d0
	movew	%d0,%a4@(60)
	moveb	%fp@(-20),%d0
	beqs	.L10004122
	moveq	#1,%d0
	movel	%d0,%sp@-
	movel	%a4,%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_100053b8)
	lea	%sp@(16),%sp
	movew	%d0,%d6
	beqs	.L10004122
	movew	#-2821,%d6
	bras	.L10004198

.L10004122:
	moveal	%a4@(12),%a0
	movel	%a0@(104),%d5
	moveal	%a4,%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-12)
	moveal	%a4,%a0
	moveq	#72,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveq	#0,%d3
	movel	%d5,%d4
	asll	#5,%d4
	moveal	%a0,%a3
	bras	.L1000417a

.L10004148:
	moveal	%fp@(-12),%a0
	moveal	%a0@,%a2
	addal	%d3,%a2
	lea	%a2@(136),%a2
	tstb	%a2@(23)
	bnes	.L10004172
	tstb	%a2@(20)
	beqs	.L10004172
	moveal	%a3@,%a2
	movew	%a2@(24),%d0
	moveq	#2,%d1
	cmpw	%d1,%d0
	bnes	.L10004172
	moveq	#3,%d0
	movew	%d0,%a2@(24)

.L10004172:
	addqw	#4,%a3
	addil	#32,%d3

.L1000417a:
	cmpl	%d3,%d4
	bgts	.L10004148
	moveq	#3,%d0
	movew	%d0,%a4@(60)

.L10004184:
	subql	#4,%fp@(-4)
	subql	#4,%d7
	cmpil	#0,%d7
	bplw	.L1000401c
	movew	%d6,%d0
	bras	.L100041f4

.L10004198:
	moveq	#-2,%d0
	movew	%d0,%a4@(60)
	lea	%pc@(str_10004202),%a0
	moveal	%fp@(16),%a1
	moveq	#4,%d0
	_BlockMoveData
	moveal	%a4@(12),%a0
	movel	%a0@(16),%d3
	moveal	%d3,%a0
	addqw	#1,%a0
	moveal	%fp@(16),%a1
	addqw	#3,%a1
	moveal	%d3,%a2
	moveb	%a2@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	_BlockMoveData
	moveal	%fp@(16),%a0
	moveal	%a4@(12),%a1
	moveal	%a1@(16),%a1
	moveb	%a1@,%d0
	addb	%d0,%a0@
	moveb	%a0@,%d0
	lea	%pc@(str_100041fe),%a0
	moveq	#0,%d1
	moveb	%d0,%d1
	addl	%fp@(16),%d1
	moveal	%d1,%a1
	addqw	#1,%a1
	moveq	#3,%d0
	_BlockMoveData
	moveal	%fp@(16),%a0
	addqb	#2,%a0@
	movew	%d6,%d0

.L100041f4:
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	rts

	.byte	0x00,0x08

str_100041fe:
	.byte	0x3c,0x3c
	.byte	0x00,0x00

str_10004202:
	.byte	0x02,0x3e,0x3e,0x00

sub_10004206:
	linkw	%fp,#0
	moveml	%d4-%d5/%a2-%a4,%sp@-
	moveq	#0,%d4
	moveal	%fp@(8),%a3
	moveq	#12,%d0
	addal	%d0,%a3
	moveal	%fp@(8),%a4
	moveq	#56,%d0
	addal	%d0,%a4
	moveq	#0,%d5
	bras	.L10004252

.L10004224:
	moveal	%a3@,%a0
	moveal	%a0@(108),%a0
	addal	%d4,%a0
	moveb	%a0@,%d0
	andib	#0x80,%d0
	beqs	.L1000424e
	moveal	%a4@,%a0
	addal	%d5,%a0
	moveal	%a0@,%a2
	movel	%a2,%d0
	beqs	.L1000424e
	movew	%a2@(60),%d0
	moveq	#2,%d1
	cmpw	%d1,%d0
	bges	.L1000424e
	movew	#-2812,%d0
	bras	.L1000425e

.L1000424e:
	addql	#4,%d5
	addql	#1,%d4

.L10004252:
	moveal	%a3@,%a0
	movel	%a0@(120),%d0
	cmpl	%d4,%d0
	bgts	.L10004224
	clrw	%d0

.L1000425e:
	moveml	%sp@+,%d4-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10004266:
	linkw	%fp,#-24
	moveml	%d3-%d5/%a2-%a4,%sp@-
	_GetZone
	movel	%a0,%fp@(-16)
	moveq	#0,%d3
	moveal	%fp@(12),%a2
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-12)
	moveal	%fp@(12),%a0
	moveq	#32,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveal	%fp@(8),%a0
	moveq	#40,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)
	braw	.L10004360

.L1000429e:
	movel	%d3,%d0
	asll	#2,%d0
	addl	%fp@(-8),%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-24)
	moveal	%d0,%a0
	movew	%a0@(60),%d1
	moveq	#-1,%d2
	cmpw	%d2,%d1
	bnew	.L1000435e
	movel	%a0@(44),%d1
	bgtw	.L1000435e
	movel	%a0@(48),%d1
	moveq	#1,%d2
	cmpl	%d2,%d1
	bgtw	.L1000435e
	moveq	#-2,%d1
	movew	%d1,%a0@(60)
	clrb	%fp@(-20)
	moveal	%a0@(12),%a1
	movel	%a1@(104),%d3
	moveal	%a0,%a4
	moveq	#12,%d1
	addal	%d1,%a4
	moveal	%a0,%a2
	moveq	#72,%d0
	addal	%d0,%a2
	moveq	#0,%d4
	movel	%d3,%d5
	asll	#5,%d5
	moveal	%a2,%a3
	bras	.L10004332

.L100042f8:
	moveal	%a4@,%a2
	addal	%d4,%a2
	lea	%a2@(136),%a2
	tstb	%a2@(23)
	bnes	.L1000432a
	tstb	%a2@(20)
	beqs	.L1000432a
	moveal	%a3@,%a2
	movew	%a2@(24),%d0
	moveq	#-2,%d1
	cmpw	%d1,%d0
	bnes	.L1000432a
	movel	%a2@(12),%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnes	.L1000432a
	moveb	#1,%fp@(-20)
	bras	.L10004336

.L1000432a:
	addqw	#4,%a3
	addil	#32,%d4

.L10004332:
	cmpl	%d4,%d5
	bgts	.L100042f8

.L10004336:
	moveb	%fp@(-20),%d0
	beqs	.L1000435c
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a0
	_SetZone
	moveq	#2,%d0
	movel	%d0,%sp@-
	movel	%fp@(-24),%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_100053b8)
	lea	%sp@(16),%sp

.L1000435c:
	moveq	#-1,%d3

.L1000435e:
	addql	#1,%d3

.L10004360:
	moveal	%fp@(-12),%a0
	movel	%a0@,%d0
	cmpl	%d3,%d0
	bgtw	.L1000429e
	moveal	%fp@(-16),%a0
	_SetZone
	clrw	%d0
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_1000437c:
	linkw	%fp,#-52
	moveml	%d3-%d6/%a2-%a4,%sp@-
	movel	%fp@(24),%d5
	moveq	#0,%d3
	movel	%d3,%fp@(-32)
	moveal	%d3,%a4
	moveal	%fp@(8),%a0
	movel	%d3,%a0@
	moveal	%fp@(30),%a0
	clrb	%a0@
	moveal	%fp@(20),%a2
	tstb	%a2@(34)
	bnes	.L100043e8
	movel	%d5,%d0
	moveq	#4,%d1
	andl	%d1,%d0
	bnes	.L100043e8
	moveal	%fp@(12),%a0
	moveq	#76,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	movel	%a2@(24),%sp@-
	movel	%a2@(28),%sp@-
	movel	%a2@(4),%sp@-
	jsr	%pc@(sub_10005680)
	lea	%sp@(16),%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	beqs	.L100043e8
	movel	%a2,%sp@-
	movel	%a4@(12),%sp@-
	jsr	%pc@(sub_10007dce)
	addqw	#8,%sp
	movew	%d0,%fp@(-28)
	tstw	%d0
	bnew	.L100046b4

.L100043e8:
	movel	%a4,%d0
	bnes	.L1000442c
	pea	%fp@(-28)
	movel	%d5,%sp@-
	pea	%fp@(-52)
	movel	%fp@(20),%sp@-
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_10007982)
	lea	%sp@(20),%sp
	movel	%d0,%fp@(-32)
	tstl	%d0
	beqw	.L100046b4
	movel	%d5,%d1
	moveq	#4,%d2
	andl	%d2,%d1
	bnes	.L1000442c
	moveal	%fp@(12),%a0
	moveq	#76,%d1
	addal	%d1,%a0
	movel	%a0,%sp@-
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005644)
	addqw	#8,%sp
	moveal	%d0,%a4

.L1000442c:
	movel	%a4,%d0
	beqs	.L10004492
	moveal	%fp@(8),%a0
	movel	%a4,%a0@
	movel	%d5,%d0
	moveq	#2,%d1
	andl	%d1,%d0
	bnes	.L1000448c
	moveal	%a4@(8),%a0
	moveal	%fp@(16),%a2
	cmpal	%a2,%a0
	beqs	.L1000445e
	movel	%a2,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_100046dc)
	addqw	#8,%sp
	movew	%d0,%fp@(-28)
	tstw	%d0
	bnew	.L10004682

.L1000445e:
	movew	%a4@(60),%d0
	moveq	#3,%d1
	cmpw	%d1,%d0
	beqs	.L1000448c
	moveb	%fp@(28),%d0
	andib	#0x80,%d0
	beqs	.L1000448c
	movel	%fp@(12),%sp@-
	movel	%a4,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_1000486c)
	lea	%sp@(12),%sp
	movew	%d0,%fp@(-28)
	tstw	%d0
	bnew	.L10004682

.L1000448c:
	moveq	#2,%d0
	jmp	%pc@(.L100046d4)

.L10004492:
	movel	%d5,%d0
	moveq	#1,%d1
	andl	%d1,%d0
	bnes	.L100044a4
	movew	#-2817,%fp@(-28)
	braw	.L10004682

.L100044a4:
	moveq	#0,%d0
	moveal	%d0,%a3
	movel	%d5,%d6
	moveq	#4,%d0
	andl	%d0,%d6
	moveal	%fp@(12),%a0
	moveq	#76,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-24)
	moveal	%fp@(20),%a2
	moveq	#34,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-20)
	moveal	%fp@(20),%a0
	moveq	#28,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-16)
	moveal	%fp@(20),%a0
	moveq	#33,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-12)
	moveal	%fp@(20),%a0
	moveq	#36,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveal	%fp@(20),%a0
	moveq	#40,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)

.L100044f6:
	movel	%fp@(-52),%d0
	bnes	.L1000451c
	pea	%fp@(-52)
	movel	%d5,%sp@-
	movel	%fp@(-32),%sp@-
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_10007ab4)
	lea	%sp@(16),%sp
	movew	%d0,%fp@(-28)
	tstw	%d0
	bnew	.L10004682

.L1000451c:
	moveal	%fp@(-32),%a2
	movel	%a2@(104),%d4
	movel	%a2@(120),%d0
	moveq	#2,%d3
	lsll	%d3,%d0
	movel	%d4,%d1
	lsll	%d3,%d1
	addl	%d1,%d0
	moveq	#72,%d1
	addl	%d1,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L1000454e
	movew	#-2809,%fp@(-28)
	braw	.L10004682

.L1000454e:
	movel	%fp@(-32),%d3
	movel	%d3,%a4@(12)
	movel	%fp@(16),%a4@(8)
	moveq	#1,%d0
	movel	%d0,%a4@(44)
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_10002d90)
	addqw	#4,%sp
	movel	%d0,%a4@(36)
	lea	%fp@(-52),%a0
	moveal	%a4,%a1
	moveq	#16,%d0
	addal	%d0,%a1
	moveq	#20,%d0
	_BlockMoveData
	tstl	%d6
	bnes	.L1000458a
	moveal	%d3,%a0
	tstb	%a0@(78)
	beqs	.L10004590

.L1000458a:
	clrb	%a4@(62)
	bras	.L10004596

.L10004590:
	moveb	#1,%a4@(62)

.L10004596:
	movel	%d4,%d0
	asll	#2,%d0
	addl	%a4,%d0
	moveal	%d0,%a0
	moveq	#72,%d0
	addal	%d0,%a0
	movel	%a0,%a4@(56)
	movel	%a3,%d0
	beqs	.L100045ae
	movel	%a4,%a3@(52)

.L100045ae:
	moveal	%fp@(8),%a2
	tstl	%a2@
	bnes	.L100045b8
	movel	%a4,%a2@

.L100045b8:
	moveal	%fp@(-32),%a2
	addql	#1,%a2@(100)
	movel	%fp@(-24),%sp@-
	moveal	%fp@(8),%a0
	movel	%a0@,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10005580)
	lea	%sp@(12),%sp
	movel	%fp@(30),%sp@-
	moveal	%a4,%a0
	moveq	#16,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	movel	%a4,%sp@-
	movel	%fp@(16),%sp@-
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_1000475a)
	lea	%sp@(20),%sp
	movew	%d0,%fp@(-28)
	tstw	%d0
	bnew	.L10004682
	moveal	%a2@(124),%a2
	movel	%a2,%d0
	beqs	.L1000461c
	movel	%a2,%fp@(-32)
	moveal	%a4,%a3
	moveq	#20,%d0
	movel	%d0,%sp@-
	pea	%fp@(-52)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	braw	.L100044f6

.L1000461c:
	moveal	%fp@(-20),%a2
	tstb	%a2@
	bnes	.L1000467e
	moveal	%fp@(-16),%a3
	addql	#1,%a3@
	clrb	%a2@
	moveal	%fp@(-12),%a0
	moveb	#1,%a0@
	movel	%a3@,%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnes	.L10004654
	moveal	%fp@(-32),%a2
	movel	%a2@(56),%d0
	moveal	%fp@(-8),%a0
	movel	%d0,%a0@
	movel	%a2@(56),%d0
	moveal	%fp@(-4),%a0
	movel	%d0,%a0@

.L10004654:
	pea	%fp@(-28)
	moveq	#3,%d0
	movel	%d0,%sp@-
	pea	%fp@(-52)
	movel	%fp@(20),%sp@-
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_10007982)
	lea	%sp@(20),%sp
	movel	%d0,%fp@(-32)
	tstl	%d0
	beqs	.L1000467e
	moveal	%a4,%a3
	braw	.L100044f6

.L1000467e:
	clrw	%d0
	bras	.L100046d4

.L10004682:
	movel	%a4,%d0
	beqs	.L1000468e
	moveq	#-2,%d0
	movew	%d0,%a4@(60)
	bras	.L100046b4

.L1000468e:
	movel	%fp@(-52),%d0
	beqs	.L1000469e
	pea	%fp@(-52)
	jsr	%pc@(sub_10007d5e)
	addqw	#4,%sp

.L1000469e:
	moveal	%fp@(-32),%a2
	movel	%a2@(100),%d0
	bgts	.L100046b4
	movel	%a2,%sp@-
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_10008612)
	addqw	#8,%sp

.L100046b4:
	moveal	%fp@(30),%a2
	tstb	%a2@
	bnes	.L100046d0
	moveal	%fp@(20),%a0
	movel	%a0@,%d3
	moveal	%d3,%a0
	moveal	%a2,%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#2,%d0
	_BlockMoveData

.L100046d0:
	movew	%fp@(-28),%d0

.L100046d4:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_100046dc:
	linkw	%fp,#0
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(12),%a3
	movel	%fp@(8),%d0
	beqs	.L10004750
	moveal	%fp@(8),%a0
	moveal	%a0@(8),%a1
	cmpal	%a3,%a1
	beqs	.L10004750
	addql	#1,%a0@(44)
	movel	%a3,%a0@(8)
	moveal	%a0,%a4
	moveq	#12,%d0
	addal	%d0,%a4
	moveal	%a0,%a2
	moveq	#56,%d0
	addal	%d0,%a2
	moveq	#0,%d3
	bras	.L10004726

.L10004712:
	movel	%a3,%sp@-
	moveal	%a2@,%a0
	addal	%d3,%a0
	movel	%a0@,%sp@-
	jsr	%pc@(sub_100046dc)
	addqw	#8,%sp
	movew	%d0,%d4
	bnes	.L1000474c
	addql	#4,%d3

.L10004726:
	moveal	%a4@,%a0
	movel	%a0@(120),%d0
	asll	#2,%d0
	cmpl	%d3,%d0
	bgts	.L10004712
	moveal	%fp@(8),%a0
	moveal	%a0@(52),%a2
	movel	%a2,%d0
	beqs	.L10004750
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_100046dc)
	addqw	#8,%sp
	movew	%d0,%d4
	beqs	.L10004750

.L1000474c:
	movew	%d4,%d0
	bras	.L10004752

.L10004750:
	clrw	%d0

.L10004752:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_1000475a:
	linkw	%fp,#-132
	moveml	%d3-%d6/%a2-%a4,%sp@-
	moveq	#0,%d5
	moveal	%fp@(16),%a3
	moveq	#12,%d3
	addal	%d3,%a3
	moveal	%fp@(20),%a0
	addal	%d3,%a0
	movel	%a0,%fp@(-4)
	moveal	%fp@(16),%a4
	moveq	#56,%d0
	addal	%d0,%a4
	moveq	#0,%d6
	braw	.L10004856

.L10004784:
	moveq	#44,%d0
	movel	%d0,%sp@-
	pea	%fp@(-132)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	pea	%fp@(-24)
	movel	%d5,%sp@-
	moveal	%fp@(20),%a0
	movel	%a0@,%sp@-
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a0
	moveal	%a0@(52),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d4
	bnew	.L1000484e
	cmpil	#63,%fp@(-16)
	bles	.L100047c6
	movew	#-2820,%d0
	jmp	%pc@(.L10004864)

.L100047c6:
	moveal	%fp@(-12),%a0
	lea	%fp@(-87),%a1
	movel	%fp@(-16),%d0
	_BlockMoveData
	moveb	%fp@(-13),%fp@(-88)
	lea	%fp@(-88),%a2
	movel	%a2,%fp@(-128)
	movel	%a2,%fp@(-132)
	clrb	%fp@(-98)
	moveq	#1,%d3
	moveb	%d3,%fp@(-99)
	moveb	%d3,%fp@(-100)
	movel	%fp@(-24),%fp@(-96)
	movel	%fp@(-20),%fp@(-92)
	moveal	%a3@,%a0
	movel	%a0@(36),%d0
	movel	%d0,%fp@(-108)
	movel	%fp@(24),%sp@-
	moveb	%fp@(-8),%sp@-
	moveq	#1,%d0
	movel	%d0,%sp@-
	pea	%fp@(-132)
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	moveal	%a4@,%a0
	addal	%d6,%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_1000437c)
	lea	%sp@(26),%sp
	movew	%d0,%d4
	bpls	.L10004852
	cmpiw	#-2804,%d4
	bnes	.L1000484e
	moveb	%fp@(-8),%d0
	moveq	#64,%d1
	andb	%d1,%d0
	beqs	.L1000484e
	moveq	#0,%d0
	moveal	%a4@,%a0
	addal	%d6,%a0
	movel	%d0,%a0@
	bras	.L10004852

.L1000484e:
	movew	%d4,%d0
	bras	.L10004864

.L10004852:
	addql	#4,%d6
	addql	#1,%d5

.L10004856:
	moveal	%a3@,%a0
	movel	%a0@(120),%d0
	cmpl	%d5,%d0
	bgtw	.L10004784
	clrw	%d0

.L10004864:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_1000486c:
	linkw	%fp,#-12
	moveml	%d3-%d6/%a2-%a4,%sp@-
	moveal	%fp@(12),%a4
	moveal	%fp@(8),%a2
	movel	%a2@(12),%d0
	movel	%d0,%fp@(-12)
	moveal	%d0,%a0
	movel	%a0@(120),%d6
	moveal	%fp@(16),%a3
	moveq	#76,%d1
	addal	%d1,%a3
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10003200)
	addqw	#8,%sp
	moveq	#0,%d3
	movel	%d3,%a2@
	movel	%d3,%a2@(4)
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10005580)
	lea	%sp@(12),%sp
	moveq	#0,%d4
	moveal	%fp@(-12),%a0
	moveq	#108,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveq	#56,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-4)
	moveq	#0,%d5
	bras	.L10004910

.L100048cc:
	moveal	%fp@(-8),%a0
	moveal	%a0@,%a0
	addal	%d4,%a0
	moveb	%a0@,%d0
	andib	#0x80,%d0
	beqs	.L1000490c
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a0
	addal	%d5,%a0
	moveal	%a0@,%a2
	movel	%a2,%d0
	beqs	.L1000490c
	cmpal	%a4,%a2
	bnes	.L100048f4
	movew	#-2815,%d0
	bras	.L10004916

.L100048f4:
	movel	%fp@(16),%sp@-
	movel	%a4,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_1000486c)
	lea	%sp@(12),%sp
	movew	%d0,%d3
	beqs	.L1000490c
	movew	%d3,%d0
	bras	.L10004916

.L1000490c:
	addql	#4,%d5
	addql	#1,%d4

.L10004910:
	cmpl	%d6,%d4
	blts	.L100048cc
	clrw	%d0

.L10004916:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_1000491e:
	linkw	%fp,#-68
	moveml	%d3-%d5/%a2-%a4,%sp@-
	moveal	%fp@(12),%a3
	moveal	%fp@(8),%a2
	movel	%a2@(12),%d0
	movel	%d0,%fp@(-68)
	moveq	#0,%d5
	moveal	%d0,%a0
	moveq	#112,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-12)
	moveal	%a3,%a4
	moveq	#12,%d0
	addal	%d0,%a4
	moveq	#56,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-8)
	braw	.L10004a0a

.L10004954:
	pea	%fp@(-64)
	movel	%d5,%sp@-
	movel	%a3@,%sp@-
	moveal	%a4@,%a0
	moveal	%a0@(56),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d4
	beqs	.L10004972
	movew	%d4,%d0
	jmp	%pc@(.L10004a8a)

.L10004972:
	movel	%fp@(-64),%d0
	asll	#2,%d0
	moveal	%fp@(-8),%a0
	addl	%a0@,%d0
	moveal	%d0,%a0
	moveal	%a0@,%a2
	movel	%a2,%d0
	bnes	.L10004990
	moveq	#0,%d0
	movel	%d0,%fp@(-40)
	moveq	#3,%d4
	bras	.L100049b0

.L10004990:
	pea	%fp@(-40)
	pea	%fp@(-44)
	pea	%fp@(-48)
	movel	%fp@(-60),%sp@-
	movel	%fp@(-56),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10004be2)
	lea	%sp@(24),%sp
	movew	%d0,%d4

.L100049b0:
	tstw	%d4
	bpls	.L100049f4
	cmpiw	#-2802,%d4
	bnes	.L10004a1a
	moveb	%fp@(-52),%d0
	andib	#0x80,%d0
	bnes	.L10004a08
	pea	%fp@(-32)
	movel	%fp@(-64),%sp@-
	movel	%a3@,%sp@-
	moveal	%a4@,%a0
	moveal	%a0@(52),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d4
	beqs	.L100049e4
	movew	#-2819,%d4
	bras	.L10004a1a

.L100049e4:
	moveb	%fp@(-16),%d0
	moveq	#64,%d1
	andb	%d1,%d0
	bnes	.L10004a08
	movew	#-2807,%d4
	bras	.L10004a1a

.L100049f4:
	movel	%fp@(-40),%sp@-
	movel	%d5,%sp@-
	movel	%a3@,%sp@-
	moveal	%a4@,%a0
	moveal	%a0@(60),%a0
	jsr	%a0@
	lea	%sp@(12),%sp

.L10004a08:
	addql	#1,%d5

.L10004a0a:
	moveal	%fp@(-12),%a0
	movel	%a0@,%d0
	cmpl	%d5,%d0
	bgtw	.L10004954
	clrw	%d0
	bras	.L10004a8a

.L10004a1a:
	movel	%a2,%d0
	beqs	.L10004a22
	movel	%a2,%fp@(8)

.L10004a22:
	moveal	%fp@(8),%a0
	moveal	%a0@(12),%a0
	moveal	%a0@(16),%a2
	moveb	%a2@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	movel	%d0,%fp@(-36)
	moveal	%a2,%a0
	addqw	#1,%a0
	moveal	%fp@(16),%a2
	addqw	#1,%a2
	moveal	%a2,%a1
	movel	%a1,%fp@(-4)
	_BlockMoveData
	moveq	#45,%d3
	movel	%fp@(-36),%d0
	addql	#1,%fp@(-36)
	addal	%d0,%a2
	moveb	%d3,%a2@
	moveal	%fp@(-4),%a0
	movel	%fp@(-36),%d0
	addql	#1,%fp@(-36)
	addal	%d0,%a0
	moveb	%d3,%a0@
	moveal	%fp@(-56),%a0
	moveal	%fp@(-4),%a1
	addal	%fp@(-36),%a1
	movel	%fp@(-60),%d0
	_BlockMoveData
	moveb	%fp@(-33),%d0
	addb	%fp@(-57),%d0
	moveal	%fp@(16),%a0
	moveb	%d0,%a0@
	movew	%d4,%d0

.L10004a8a:
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10004a92:
	linkw	%fp,#0
	moveml	%d3-%d4/%a2-%a4,%sp@-
	movel	%fp@(16),%d0
	bnes	.L10004aa8
	movew	#-2819,%d0
	jmp	%pc@(.L10004b52)

.L10004aa8:
	moveal	%fp@(12),%a0
	tstl	%a0@(64)
	bnew	.L10004b42
	_GetZone
	moveal	%a0,%a3
	moveal	%fp@(8),%a0
	moveal	%a0@(40),%a2
	movel	%a2,%d0
	beqs	.L10004ac8
	moveal	%a2,%a0
	_SetZone

.L10004ac8:
	moveq	#40,%d0
	.short	0xa31e
	moveal	%a0,%a4
	moveal	%a3,%a0
	_SetZone
	movel	%a4,%d0
	bnes	.L10004ada
	moveq	#-108,%d0
	bras	.L10004b52

.L10004ada:
	movew	#0xaafe,%a4@(8)
	moveb	#7,%a4@(10)
	clrb	%d3
	moveb	%d3,%a4@(11)
	moveq	#0,%d4
	movel	%d4,%a4@(12)
	moveb	%d3,%a4@(16)
	moveb	%d3,%a4@(17)
	clrw	%d0
	movew	%d0,%a4@(18)
	moveq	#1,%d0
	movel	%d0,%a4@(20)
	clrb	%a4@(24)
	moveb	#16,%a4@(25)
	moveq	#4,%d0
	movew	%d0,%a4@(26)
	moveal	%fp@(16),%a2
	movel	%a2@,%d0
	movel	%d0,%a4@(28)
	movel	%d4,%a4@(32)
	movel	%d4,%a4@(36)
	moveal	%a2@,%a0
	addqw	#4,%a0
	movel	%a0,%a4@(4)
	moveal	%a4,%a0
	addqw	#8,%a0
	movel	%a0,%a4@
	_FlushInstructionCache
	moveal	%fp@(12),%a0
	movel	%a4,%a0@(64)

.L10004b42:
	moveal	%fp@(12),%a0
	movel	%a0@(64),%d0
	moveal	%fp@(16),%a0
	movel	%d0,%a0@
	clrw	%d0

.L10004b52:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10004b5a:
	linkw	%fp,#-72
	moveml	%d3/%a2-%a3,%sp@-
	moveal	%fp@(8),%a3
	moveq	#0,%d0
	moveal	%fp@(16),%a0
	movel	%d0,%a0@
	pea	%fp@(-24)
	pea	%fp@(-48)
	pea	%fp@(-72)
	moveal	%a3@(12),%a2
	movel	%a2@(72),%sp@-
	moveal	%a2@(68),%a0
	moveal	%a0@(44),%a0
	jsr	%a0@
	lea	%sp@(16),%sp
	movew	%d0,%d3
	beqs	.L10004b98
	movew	%d3,%d0
	bras	.L10004bda

.L10004b98:
	movel	%fp@(12),%d0
	mulul	#24,%d0
	lea	%fp@(-72),%a0
	movel	%a0@(%d0:w),%d0
	moveq	#-1,%d1
	cmpl	%d1,%d0
	bnes	.L10004bb8
	movew	#-2802,%d0
	bras	.L10004bda

.L10004bb8:
	movel	%fp@(16),%sp@-
	movel	%fp@(12),%d0
	mulul	#24,%d0
	lea	%fp@(-72),%a0
	addl	%a0,%d0
	movel	%d0,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10004c9c)
	lea	%sp@(12),%sp

.L10004bda:
	moveml	%sp@+,%d3/%a2-%a3
	unlk	%fp
	rts

sub_10004be2:
	linkw	%fp,#-24
	movel	%a2,%sp@-
	moveal	%fp@(8),%a2
	pea	%fp@(-24)
	movel	%fp@(24),%sp@-
	movel	%fp@(16),%sp@-
	movel	%fp@(12),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10004c2c)
	lea	%sp@(20),%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	beqs	.L10004c14
	moveal	%fp@(20),%a0
	moveb	%fp@(-8),%a0@

.L10004c14:
	movel	%fp@(28),%sp@-
	pea	%fp@(-24)
	movel	%a2,%sp@-
	jsr	%pc@(sub_10004c9c)
	lea	%sp@(12),%sp
	moveal	%sp@+,%a2
	unlk	%fp
	rts

sub_10004c2c:
	linkw	%fp,#0
	moveml	%d3-%d5/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	moveal	%fp@(24),%a3
	moveq	#0,%d4
	movel	%fp@(16),%sp@-
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_100086ce)
	addqw	#8,%sp
	movel	%d0,%d5

.L10004c4e:
	movel	%a3,%sp@-
	movel	%d5,%sp@-
	movel	%fp@(12),%sp@-
	moveal	%a4@(12),%a2
	movel	%a2@(72),%sp@-
	moveal	%a2@(68),%a0
	moveal	%a0@(40),%a0
	jsr	%a0@
	lea	%sp@(16),%sp
	movew	%d0,%d3
	beqs	.L10004c82
	moveal	%a4@(12),%a0
	movel	%a0@(116),%d0
	addl	%d0,%d4
	moveal	%a4@(52),%a4
	movel	%a4,%d0
	bnes	.L10004c4e

.L10004c82:
	movel	%a3,%d0
	beqs	.L10004c8c
	movel	%a3@(20),%d0
	addl	%d0,%d4

.L10004c8c:
	moveal	%fp@(20),%a0
	movel	%d4,%a0@
	movel	%a4,%d0
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10004c9c:
	linkw	%fp,#-28
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	moveal	%fp@(12),%a4
	moveq	#0,%d4
	moveal	%a4,%a0
	addqw	#4,%a0
	movel	%a0,%fp@(-4)

.L10004cb6:
	movel	%a3,%d0
	beqs	.L10004d2a
	movel	%a4@,%d0
	moveq	#-3,%d1
	cmpl	%d1,%d0
	bnes	.L10004d2a
	moveal	%a3@(12),%a2
	moveal	%a2@(68),%a0
	movel	%a0@(56),%d0
	movel	%d0,%fp@(-8)
	pea	%fp@(-24)
	moveal	%fp@(-4),%a0
	movel	%a0@,%sp@-
	movel	%a2@(72),%sp@-
	moveal	%d0,%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d3
	beqs	.L10004cf0
	movew	%d3,%d0
	bras	.L10004d68

.L10004cf0:
	movel	%fp@(-24),%d0
	asll	#2,%d0
	addl	%a3@(56),%d0
	moveal	%d0,%a0
	moveal	%a0@,%a3
	movel	%a3,%d0
	beqs	.L10004d1c
	movel	%a4,%sp@-
	pea	%fp@(-28)
	movel	%fp@(-20),%sp@-
	movel	%fp@(-16),%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10004c2c)
	lea	%sp@(20),%sp
	moveal	%d0,%a3

.L10004d1c:
	addql	#1,%d4
	cmpil	#1000,%d4
	bles	.L10004cb6
	moveq	#0,%d0
	moveal	%d0,%a3

.L10004d2a:
	movel	%a3,%d0
	bnes	.L10004d3c
	moveq	#0,%d0
	moveal	%fp@(16),%a0
	movel	%d0,%a0@
	movew	#-2802,%d0
	bras	.L10004d68

.L10004d3c:
	movel	%a4@,%d0
	bpls	.L10004d4c
	movel	%a4@(4),%d0
	moveal	%fp@(16),%a0
	movel	%d0,%a0@
	bras	.L10004d66

.L10004d4c:
	movel	%a4@,%d0
	asll	#2,%d0
	addl	%a3,%d0
	moveal	%d0,%a0
	moveal	%a0@(72),%a2
	moveal	%a2@(36),%a0
	addal	%a4@(4),%a0
	moveal	%fp@(16),%a1
	movel	%a0,%a1@

.L10004d66:
	clrw	%d0

.L10004d68:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10004d70:
	linkw	%fp,#-12
	moveml	%d3-%d4/%a2-%a4,%sp@-
	movel	%fp@(20),%d4
	movel	%d4,%d0
	asll	#5,%d0
	moveal	%fp@(16),%a0
	addl	%a0@(12),%d0
	moveal	%d0,%a4
	lea	%a4@(136),%a4
	tstb	%a4@(23)
	beqs	.L10004d9a
	clrw	%d0
	jmp	%pc@(.L10004e9e)

.L10004d9a:
	moveal	%fp@(8),%a0
	movel	%a0@(72),%d0
	moveq	#4,%d1
	andl	%d1,%d0
	beqs	.L10004dae
	clrb	%fp@(-8)
	bras	.L10004db4

.L10004dae:
	moveb	#3,%fp@(-8)

.L10004db4:
	moveq	#0,%d0
	moveal	%d0,%a3
	tstb	%a4@(20)
	bnes	.L10004df2
	cmpib	#3,%fp@(-8)
	bnes	.L10004dcc
	moveb	#2,%fp@(-8)

.L10004dcc:
	moveal	%fp@(8),%a2
	movel	%a2@(72),%d0
	moveq	#2,%d1
	andl	%d1,%d0
	bnes	.L10004e24
	moveq	#4,%d0
	movel	%d0,%sp@-
	movel	%a4,%sp@-
	movel	%fp@(12),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10004ea6)
	lea	%sp@(16),%sp
	moveal	%d0,%a3
	bras	.L10004e24

.L10004df2:
	moveb	%a4@(22),%d0
	moveq	#4,%d1
	cmpb	%d1,%d0
	bnes	.L10004e00
	clrb	%fp@(-8)

.L10004e00:
	moveb	%fp@(24),%d0
	bnes	.L10004e24
	moveb	%a4@(22),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	movel	%d0,%sp@-
	movel	%a4,%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10004ea6)
	lea	%sp@(16),%sp
	moveal	%d0,%a3

.L10004e24:
	movel	%a3,%d0
	beqs	.L10004e30
	movel	%a3@(36),%d0
	movel	%d0,%fp@(-12)

.L10004e30:
	movel	%a3,%d0
	bnes	.L10004e70
	pea	%fp@(-4)
	movel	%fp@(26),%sp@-
	moveb	%fp@(-8),%sp@-
	movel	%d4,%sp@-
	movel	%a4,%sp@-
	moveal	%fp@(16),%a0
	movel	%a0@(12),%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10004efe)
	lea	%sp@(30),%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	bnes	.L10004e68
	movew	%fp@(-4),%d0
	bras	.L10004e9e

.L10004e68:
	movel	%a3@(36),%d0
	movel	%d0,%fp@(-12)

.L10004e70:
	addql	#1,%a3@(8)
	movel	%d4,%d3
	asll	#2,%d3
	addl	%fp@(16),%d3
	moveal	%d3,%a0
	movel	%a3,%a0@(72)
	movel	%fp@(-12),%sp@-
	movel	%d4,%sp@-
	moveal	%fp@(26),%a2
	movel	%a2@,%sp@-
	moveal	%a2@(12),%a0
	moveal	%a0@(28),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	clrw	%d0

.L10004e9e:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10004ea6:
	linkw	%fp,#0
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(12),%a4
	movel	%fp@(20),%d3
	moveal	%fp@(16),%a0
	moveal	%a0@,%a2
	moveal	%fp@(8),%a3
	addqw	#8,%a3
	bras	.L10004ef0

.L10004ec4:
	movew	%a2@(24),%d0
	bmis	.L10004eee
	tstl	%d3
	beqs	.L10004edc
	moveq	#1,%d0
	cmpl	%d0,%d3
	beqs	.L10004ee4
	moveq	#4,%d0
	cmpl	%d0,%d3
	beqs	.L10004ef4
	bras	.L10004eee

.L10004edc:
	moveal	%a2@(20),%a0
	cmpal	%a4,%a0
	bnes	.L10004eee

.L10004ee4:
	moveal	%a3@,%a0
	moveal	%a2@(16),%a1
	cmpal	%a1,%a0
	beqs	.L10004ef4

.L10004eee:
	moveal	%a2@,%a2

.L10004ef0:
	movel	%a2,%d0
	bnes	.L10004ec4

.L10004ef4:
	movel	%a2,%d0
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10004efe:
	linkw	%fp,#-48
	moveml	%d3-%d6/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	movel	%fp@(24),%d3
	clrb	%fp@(-40)
	clrb	%fp@(-39)
	clrb	%fp@(-38)
	moveal	%fp@(16),%a0
	movel	%a0@(36),%d0
	movel	%d0,%d6
	moveal	%a4,%a0
	moveal	%a0@(108),%a0
	movel	%a0@(12),%d0
	movel	%d0,%fp@(-36)
	moveq	#48,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	movel	%d0,%fp@(-48)
	tstl	%d0
	bnes	.L10004f52
	moveal	%fp@(34),%a0
	movew	#-2809,%a0@
	moveq	#0,%d0
	jmp	%pc@(.L10005200)

.L10004f52:
	moveal	%fp@(-48),%a2
	movel	%fp@(12),%a2@(20)
	moveal	%a4,%a0
	movel	%a0@(8),%d0
	movel	%d0,%a2@(16)
	clrb	%a2@(27)
	moveal	%fp@(30),%a2
	moveal	%a2@(8),%a0
	moveal	%fp@(20),%a3
	addal	%a3@(12),%a0
	movel	%a0,%fp@(-44)
	tstb	%a3@(24)
	bnes	.L10004fa0
	tstb	%a2@(5)
	beqs	.L10004f92
	movew	#-2824,%d5
	braw	.L100051ee

.L10004f92:
	moveb	#1,%fp@(-40)
	moveb	#1,%fp@(-38)
	bras	.L10004fda

.L10004fa0:
	moveal	%fp@(20),%a2
	tstb	%a2@(20)
	beqs	.L10004fda
	moveal	%fp@(30),%a0
	tstb	%a0@(5)
	beqs	.L10004fc8
	movel	%a2@(16),%d0
	movel	%a2@(8),%d1
	cmpl	%d1,%d0
	beqs	.L10004fda
	movew	#-2824,%d5
	braw	.L100051ee

.L10004fc8:
	moveb	#1,%fp@(-40)
	moveb	#1,%fp@(-39)
	moveb	#1,%fp@(-38)

.L10004fda:
	moveb	%fp@(-40),%d0
	beqw	.L1000511c
	moveal	%fp@(30),%a2
	moveal	%a2@(12),%a0
	tstl	%a0@(72)
	beqs	.L1000501c
	moveal	%fp@(-48),%a0
	moveb	#1,%a0@(27)
	pea	%fp@(-44)
	movel	%d3,%sp@-
	movel	%a2@,%sp@-
	moveal	%a2@(12),%a0
	moveal	%a0@(72),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d5
	tstw	%d0
	beqw	.L1000510e
	braw	.L100051ee

.L1000501c:
	moveal	%fp@(20),%a0
	movel	%a0@(8),%d0
	addql	#3,%d0
	moveq	#-4,%d1
	andl	%d1,%d0
	moveq	#12,%d1
	addl	%d1,%d0
	movel	%d0,%d4
	movel	%fp@(-36),%d0
	bnes	.L1000507a
	moveal	%fp@(-48),%a2
	moveb	#3,%a2@(27)
	moveb	%fp@(28),%d0
	bnes	.L10005054
	subqw	#4,%sp
	movel	0x2a6,%sp@
	movel	%sp@+,%d0
	movel	%d0,%a2@(28)
	bras	.L10005062

.L10005054:
	moveal	%a4,%a0
	movel	%a0@(40),%d0
	moveal	%fp@(-48),%a0
	movel	%d0,%a0@(28)

.L10005062:
	moveal	%fp@(-48),%a2
	movel	%a2@(28),%sp@-
	movel	%d4,%sp@-
	jsr	%pc@(sub_10005716)
	addqw	#8,%sp
	movel	%d0,%a2@(32)
	braw	.L100050fa

.L1000507a:
	moveal	%fp@(-48),%a2
	moveb	#5,%a2@(27)
	moveal	%a4,%a0
	moveal	%a0@(108),%a0
	movel	%a0@(16),%d0
	movel	%d0,%a2@(28)
	movew	#-21762,%fp@(-32)
	moveb	#7,%fp@(-30)
	clrb	%fp@(-29)
	moveq	#0,%d0
	movel	%d0,%fp@(-28)
	clrb	%fp@(-24)
	clrb	%fp@(-23)
	clrw	%d0
	movew	%d0,%fp@(-22)
	clrb	%fp@(-16)
	moveq	#4,%d0
	movew	%d0,%fp@(-14)
	moveq	#0,%d0
	movel	%d0,%fp@(-8)
	moveq	#0,%d0
	movel	%d0,%fp@(-4)
	movel	#241,%fp@(-20)
	moveb	#16,%fp@(-15)
	movel	%fp@(-36),%fp@(-12)
	lea	%fp@(-32),%a0
	movel	%a0,%fp@(-36)
	_FlushInstructionCache
	movel	%d4,%sp@-
	moveal	%fp@(-36),%a0
	jsr	%a0@
	addqw	#4,%sp
	movel	%d0,%a2@(32)

.L100050fa:
	moveal	%fp@(-48),%a0
	movel	%a0@(32),%d0
	moveq	#15,%d1
	addl	%d1,%d0
	moveq	#-16,%d1
	andl	%d1,%d0
	movel	%d0,%fp@(-44)

.L1000510e:
	movel	%fp@(-44),%d0
	bnes	.L1000511c
	movew	#-2810,%d5
	braw	.L100051ee

.L1000511c:
	moveb	%fp@(-39),%d0
	beqs	.L1000513c
	moveal	%fp@(30),%a0
	moveal	%a0@(8),%a0
	moveal	%fp@(20),%a2
	addal	%a2@(12),%a0
	moveal	%fp@(-44),%a1
	movel	%a2@(16),%d0
	_BlockMoveData

.L1000513c:
	moveb	%fp@(-38),%d0
	beqs	.L1000517a
	moveal	%fp@(20),%a0
	tstb	%a0@(20)
	beqs	.L1000517a
	moveal	%fp@(20),%a2
	movel	%a2@(16),%d0
	movel	%a2@(8),%d1
	cmpl	%d1,%d0
	bges	.L1000517a
	moveal	%fp@(20),%a2
	movel	%a2@(8),%d0
	subl	%a2@(16),%d0
	movel	%d0,%sp@-
	movel	%a2@(16),%d0
	addl	%fp@(-44),%d0
	movel	%d0,%sp@-
	jsr	%pc@(local_bzero)
	addqw	#8,%sp

.L1000517a:
	moveal	%fp@(20),%a2
	tstb	%a2@(21)
	beqs	.L100051bc
	tstb	%a2@(20)
	bnes	.L100051bc
	tstb	%a2@(24)
	beqs	.L100051bc
	moveal	%fp@(-48),%a0
	tstb	%a0@(27)
	bnes	.L100051a8
	moveal	%fp@(16),%a0
	moveb	%a0@(84),%d0
	moveq	#1,%d1
	cmpb	%d1,%d0
	beqs	.L100051bc

.L100051a8:
	tstl	%a2@(8)
	beqs	.L100051bc
	movel	%d6,%sp@-
	movel	%fp@(-44),%sp@-
	movel	%a2@(8),%sp@-
	jsr	%pc@(sub_10008db2)

.L100051bc:
	moveal	%fp@(20),%a0
	tstb	%a0@(20)
	bnes	.L100051d0
	moveq	#3,%d0
	moveal	%fp@(-48),%a0
	movew	%d0,%a0@(24)

.L100051d0:
	moveal	%fp@(-48),%a2
	movel	%fp@(-44),%a2@(36)
	movel	%fp@(20),%sp@-
	clrb	%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_100031b0)
	lea	%sp@(10),%sp
	movel	%a2,%d0
	bras	.L10005200

.L100051ee:
	movel	%fp@(-48),%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	moveal	%fp@(34),%a0
	movew	%d5,%a0@
	moveq	#0,%d0

.L10005200:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_10005208:
	linkw	%fp,#-44
	moveml	%d3-%d6/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	moveal	%fp@(12),%a4
	movel	%fp@(20),%d4
	movel	%fp@(24),%d5
	movel	%d4,%d3
	asll	#5,%d3
	moveal	%fp@(16),%a2
	moveal	%a2@(12),%a0
	lea	%a0@(136),%a0
	addl	%a0,%d3
	movel	%d3,%fp@(-44)
	movel	%d4,%d0
	asll	#2,%d0
	moveq	#72,%d1
	addal	%d1,%a2
	addl	%a2,%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-40)
	tstl	%d0
	bnes	.L10005250
	jmp	%pc@(.L100053b0)

.L10005250:
	moveal	%fp@(-44),%a0
	tstb	%a0@(23)
	beqs	.L1000525e
	jmp	%pc@(.L100053b0)

.L1000525e:
	movel	%d5,%d0
	moveq	#1,%d1
	andl	%d1,%d0
	beqs	.L1000527e
	moveal	%fp@(-40),%a2
	moveal	%a2@(16),%a0
	moveal	%a3,%a1
	moveal	%a1@(8),%a1
	cmpal	%a1,%a0
	bnes	.L1000527e
	moveq	#0,%d0
	movel	%d0,%a2@(16)

.L1000527e:
	moveal	%fp@(-40),%a2
	subql	#1,%a2@(12)
	movel	%a4,%d0
	beqs	.L100052ae
	moveal	%a4,%a0
	tstb	%a0@(15)
	beqs	.L100052ae
	moveal	%fp@(-44),%a0
	movel	%a0@(8),%d0
	bles	.L100052ae
	moveal	%a2@(36),%a0
	moveal	%fp@(-44),%a1
	moveal	%a1@(8),%a1
	_UnholdMemory
	movew	%d0,%d6

.L100052ae:
	moveal	%fp@(-40),%a2
	movel	%a2@(12),%d0
	bgtw	.L100053b0
	movel	%a2@(8),%d0
	bgtw	.L100053b0
	moveb	%a2@(27),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	moveq	#3,%d1
	cmpl	%d1,%d0
	beqs	.L100052e0
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L100052f6
	moveq	#5,%d1
	cmpl	%d1,%d0
	beqs	.L10005328
	braw	.L10005398

.L100052e0:
	moveal	%fp@(-40),%a2
	movel	%a2@(28),%sp@-
	movel	%a2@(32),%sp@-
	jsr	%pc@(zone_disposeptr)
	addqw	#8,%sp
	braw	.L10005398

.L100052f6:
	moveal	%fp@(-40),%a0
	movel	%a0@(36),%sp@-
	movel	%d4,%sp@-
	moveal	%a3,%a0
	movel	%a0@(8),%sp@-
	moveal	%fp@(16),%a2
	moveal	%a2@(12),%a0
	movel	%a0@(72),%sp@-
	moveal	%a2@(12),%a0
	moveal	%a0@(68),%a0
	moveal	%a0@(76),%a0
	jsr	%a0@
	lea	%sp@(16),%sp
	movew	%d0,%d6
	bras	.L10005398

.L10005328:
	moveal	%fp@(-40),%a2
	movel	%a2@(28),%d0
	movel	%d0,%fp@(-36)
	movew	#-21762,%fp@(-32)
	moveb	#7,%fp@(-30)
	clrb	%fp@(-29)
	moveq	#0,%d1
	movel	%d1,%fp@(-28)
	clrb	%fp@(-24)
	clrb	%fp@(-23)
	clrw	%d1
	movew	%d1,%fp@(-22)
	clrb	%fp@(-16)
	moveq	#4,%d1
	movew	%d1,%fp@(-14)
	moveq	#0,%d1
	movel	%d1,%fp@(-8)
	moveq	#0,%d1
	movel	%d1,%fp@(-4)
	movel	%d0,%fp@(-12)
	movel	#193,%fp@(-20)
	moveb	#16,%fp@(-15)
	lea	%fp@(-32),%a0
	movel	%a0,%fp@(-36)
	_FlushInstructionCache
	movel	%a2@(32),%sp@-
	moveal	%fp@(-36),%a0
	jsr	%a0@
	addqw	#4,%sp

.L10005398:
	movel	%fp@(-44),%sp@-
	movel	%fp@(-40),%sp@-
	jsr	%pc@(sub_10003200)
	addqw	#8,%sp
	movel	%fp@(-40),%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp

.L100053b0:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_100053b8:
	linkw	%fp,#-72
	moveml	%d3-%d5/%a2-%a3,%sp@-
	moveal	%fp@(16),%a3
	movel	%fp@(20),%d5
	pea	%fp@(-72)
	movel	%d5,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10004b5a)
	lea	%sp@(12),%sp
	tstw	%d0
	beqs	.L100053e2
	clrw	%d0
	jmp	%pc@(.L100054e4)

.L100053e2:
	moveal	%a3,%a2
	moveq	#12,%d0
	addal	%d0,%a2
	cmpil	#1,%d5
	bnes	.L1000543a
	moveq	#36,%d0
	movel	%d0,%sp@-
	pea	%fp@(-68)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveal	%fp@(8),%a0
	movel	%a0@(8),%d0
	movel	%d0,%fp@(-68)
	moveal	%fp@(12),%a0
	movel	%a0@(8),%d0
	movel	%d0,%fp@(-64)
	movel	%a3@(36),%d0
	movel	%d0,%fp@(-60)
	moveal	%a2@,%a0
	moveq	#20,%d0
	addal	%d0,%a0
	lea	%fp@(-56),%a1
	movel	%a0@+,%a1@+
	movel	%a0@+,%a1@+
	movel	%a0@+,%a1@+
	movel	%a0@+,%a1@+
	moveal	%a2@,%a0
	movel	%a0@(16),%d0
	movel	%d0,%fp@(-40)

.L1000543a:
	moveal	%a3@(12),%a0
	movel	%a0@(36),%d0
	cmpil	#1832269931,%d0
	beqs	.L10005452
	movew	#-2819,%d4
	braw	.L100054e2

.L10005452:
	movew	#-21762,%fp@(-32)
	moveb	#7,%fp@(-30)
	clrb	%d3
	moveb	%d3,%fp@(-29)
	moveq	#0,%d4
	movel	%d4,%fp@(-28)
	moveb	%d3,%fp@(-24)
	moveb	%d3,%fp@(-23)
	clrw	%d0
	movew	%d0,%fp@(-22)
	movel	%d4,%fp@(-20)
	clrb	%fp@(-16)
	moveq	#4,%d0
	movew	%d0,%fp@(-14)
	movel	%d4,%fp@(-8)
	movel	%d4,%fp@(-4)
	moveq	#16,%d3
	moveb	%d3,%fp@(-15)
	movel	%fp@(-72),%fp@(-12)
	lea	%fp@(-32),%a0
	movel	%a0,%fp@(-72)
	cmpil	#1,%d5
	bnes	.L100054ca
	movel	#225,%fp@(-20)
	moveb	%d3,%fp@(-15)
	_FlushInstructionCache
	pea	%fp@(-68)
	moveal	%fp@(-72),%a0
	jsr	%a0@
	addqw	#4,%sp
	movew	%d0,%d4
	bras	.L100054e2

.L100054ca:
	moveq	#1,%d0
	movel	%d0,%fp@(-20)
	moveb	#16,%fp@(-15)
	clrw	%d4
	_FlushInstructionCache
	moveal	%fp@(-72),%a0
	jsr	%a0@

.L100054e2:
	movew	%d4,%d0

.L100054e4:
	moveml	%sp@+,%d3-%d5/%a2-%a3
	unlk	%fp
	rts

sub_100054ec:
	linkw	%fp,#-4
	moveml	%d3-%d5/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	moveal	%fp@(12),%a2
	moveal	%fp@(16),%a3
	movel	%fp@(20),%d5
	movel	%a3@(12),%d0
	movel	%d0,%fp@(-4)
	moveal	%d0,%a0
	movel	%a0@(104),%d4
	moveal	%a3,%a0
	moveq	#16,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_10007d5e)
	addqw	#4,%sp
	moveq	#0,%d3
	bras	.L10005538

.L10005524:
	movel	%d5,%sp@-
	movel	%d3,%sp@-
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10005208)
	lea	%sp@(20),%sp
	addql	#1,%d3

.L10005538:
	cmpl	%d4,%d3
	blts	.L10005524
	moveal	%a4,%a2
	moveq	#76,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10003200)
	addqw	#8,%sp
	movel	%a3@(36),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10002e66)
	addqw	#8,%sp
	movel	%a3,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	moveal	%fp@(-4),%a2
	subql	#1,%a2@(100)
	movel	%a2@(100),%d0
	bgts	.L10005578
	movel	%a2,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10008612)
	addqw	#8,%sp

.L10005578:
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10005580:
	linkw	%fp,#0
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	moveal	%fp@(12),%a2
	moveal	%fp@(16),%a0
	moveal	%a0@(4),%a3
	bras	.L100055ac

.L1000559a:
	movel	%a2,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10005600)
	addqw	#8,%sp
	tstb	%d0
	bnes	.L100055b0
	moveal	%a3@(4),%a3

.L100055ac:
	movel	%a3,%d0
	bnes	.L1000559a

.L100055b0:
	movel	%a3,%d0
	bnes	.L100055d4
	moveal	%fp@(16),%a2
	movel	%a2@,%d0
	movel	%d0,%a4@
	moveal	%a2@,%a2
	movel	%a2,%d0
	beqs	.L100055c6
	movel	%a4,%a2@(4)

.L100055c6:
	moveq	#0,%d0
	movel	%d0,%a4@(4)
	moveal	%fp@(16),%a0
	movel	%a4,%a0@
	bras	.L100055e8

.L100055d4:
	movel	%a3,%a4@(4)
	movel	%a3@,%d0
	movel	%d0,%a4@
	tstl	%d0
	beqs	.L100055e6
	moveal	%d0,%a0
	movel	%a4,%a0@(4)

.L100055e6:
	movel	%a4,%a3@

.L100055e8:
	moveal	%fp@(16),%a2
	moveal	%a2@(4),%a0
	cmpal	%a3,%a0
	bnes	.L100055f8
	movel	%a4,%a2@(4)

.L100055f8:
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	rts

sub_10005600:
	linkw	%fp,#0
	moveml	%d3-%d5/%a2-%a4,%sp@-
	moveal	%fp@(12),%a4
	moveal	%fp@(8),%a2
	moveal	%a2@(12),%a0
	movel	%a0@(120),%d5
	moveal	%a2,%a3
	moveq	#56,%d0
	addal	%d0,%a3
	moveq	#0,%d3
	movel	%d5,%d4
	asll	#2,%d4
	bras	.L10005636

.L10005626:
	moveal	%a3@,%a0
	addal	%d3,%a0
	moveal	%a0@,%a0
	cmpal	%a4,%a0
	bnes	.L10005634
	moveq	#1,%d0
	bras	.L1000563c

.L10005634:
	addql	#4,%d3

.L10005636:
	cmpl	%d3,%d4
	bgts	.L10005626
	clrb	%d0

.L1000563c:
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10005644:
	linkw	%fp,#0
	moveml	%a3-%a4,%sp@-
	moveal	%fp@(8),%a4
	moveal	%fp@(12),%a0
	moveal	%a0@,%a3
	bras	.L10005672

.L10005658:
	moveal	%a3@(12),%a0
	cmpal	%a4,%a0
	bnes	.L10005670
	movew	%a3@(60),%d0
	bmis	.L10005670
	tstb	%a3@(62)
	beqs	.L10005670
	movel	%a3,%d0
	bras	.L10005678

.L10005670:
	moveal	%a3@,%a3

.L10005672:
	movel	%a3,%d0
	bnes	.L10005658
	moveq	#0,%d0

.L10005678:
	moveml	%sp@+,%a3-%a4
	unlk	%fp
	rts

sub_10005680:
	linkw	%fp,#-4
	moveml	%d4-%d6/%a2-%a4,%sp@-
	movel	%fp@(12),%d5
	movel	%fp@(16),%d6
	moveal	%fp@(8),%a0
	moveb	%a0@,%d0
	moveq	#0,%d4
	moveb	%d0,%d4
	moveal	%fp@(20),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-4)
	bras	.L10005706

.L100056a6:
	moveal	%fp@(-4),%a2
	moveal	%a2@(12),%a3
	tstb	%a3@(54)
	beqs	.L100056fc
	moveal	%a3@(16),%a4
	moveb	%a4@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	cmpl	%d4,%d0
	bnes	.L100056fc
	movel	%a3@(40),%d0
	cmpl	%d5,%d0
	bnes	.L100056fc
	movel	%a3@(36),%d0
	cmpl	%d6,%d0
	bnes	.L100056fc
	movew	%a2@(60),%d0
	bmis	.L100056fc
	tstb	%a2@(62)
	beqs	.L100056fc
	movel	%d4,%sp@-
	moveal	%fp@(8),%a0
	addqw	#1,%a0
	movel	%a0,%sp@-
	addqw	#1,%a4
	movel	%a4,%sp@-
	jsr	%pc@(sub_100057aa)
	lea	%sp@(12),%sp
	tstl	%d0
	beqs	.L100056fc
	movel	%a2,%d0
	bras	.L1000570e

.L100056fc:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-4)

.L10005706:
	movel	%fp@(-4),%d0
	bnes	.L100056a6
	moveq	#0,%d0

.L1000570e:
	moveml	%sp@+,%d4-%d6/%a2-%a4
	unlk	%fp
	rts

sub_10005716:
	linkw	%fp,#0
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(12),%a4
	_GetZone
	moveal	%a0,%a3
	cmpal	%a4,%a3
	beqs	.L1000572e
	moveal	%a4,%a0
	_SetZone

.L1000572e:
	movel	%fp@(8),%d0
	_NewPtr
	moveal	%a0,%a2
	cmpal	%a4,%a3
	beqs	.L1000573e
	moveal	%a3,%a0
	_SetZone

.L1000573e:
	movel	%a2,%d0
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	rts

zone_disposeptr:
	linkw	%fp,#0
	moveml	%a3-%a4,%sp@-
	moveal	%fp@(12),%a4
	_GetZone
	moveal	%a0,%a3
	cmpal	%a4,%a3
	beqs	.L10005760
	moveal	%a4,%a0
	_SetZone

.L10005760:
	moveal	%fp@(8),%a0
	_DisposePtr
	cmpal	%a4,%a3
	beqs	.L1000576e
	moveal	%a3,%a0
	_SetZone

.L1000576e:
	moveml	%sp@+,%a3-%a4
	unlk	%fp
	rts

sub_10005776:
	linkw	%fp,#0
	moveml	%a3-%a4,%sp@-
	moveal	%fp@(12),%a4
	_GetZone
	moveal	%a0,%a3
	cmpal	%a4,%a3
	beqs	.L1000578e
	moveal	%a4,%a0
	_SetZone

.L1000578e:
	moveal	%fp@(8),%a0
	_HUnlock
	moveal	%fp@(8),%a0
	_DisposeHandle
	cmpal	%a4,%a3
	beqs	.L100057a2
	moveal	%a3,%a0
	_SetZone

.L100057a2:
	moveml	%sp@+,%a3-%a4
	unlk	%fp
	rts

sub_100057aa:
	linkw	%fp,#0
	moveml	%d3-%d4/%a2-%a3,%sp@-
	moveal	%fp@(8),%a2
	moveal	%fp@(12),%a3
	movel	%fp@(16),%d4

.L100057be:
	subql	#1,%d4
	moveq	#0,%d3
	cmpl	%d3,%d4
	bmis	.L100057d2
	moveb	%a2@+,%d0
	moveb	%a3@+,%d1
	cmpb	%d1,%d0
	beqs	.L100057be
	movel	%d3,%d0
	bras	.L100057d4

.L100057d2:
	moveq	#1,%d0

.L100057d4:
	moveml	%sp@+,%d3-%d4/%a2-%a3
	unlk	%fp
	rts

local_bzero:
	linkw	%fp,#0
	moveml	%d3/%a2,%sp@-
	movel	%fp@(12),%d3
	moveal	%fp@(8),%a2
	bras	.L100057f2

.L100057ee:
	clrb	%a2@+
	subql	#1,%d3

.L100057f2:
	cmpil	#0,%d3
	bgts	.L100057ee
	moveml	%sp@+,%d3/%a2
	unlk	%fp
	rts

sub_10005802:
	linkw	%fp,#-108
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(16),%a4
	movel	%a4,%d0
	beqs	.L1000581e
	movel	%fp@(12),%d0
	beqs	.L1000581e
	movel	%fp@(8),%d0
	bnes	.L10005826

.L1000581e:
	moveq	#-50,%d0
	movew	%d0,%fp@(20)
	bras	.L1000588e

.L10005826:
	clrb	%d0
	moveal	%fp@(8),%a2
	moveb	%d0,%a2@
	moveal	%fp@(12),%a0
	moveb	%d0,%a0@
	moveq	#0,%d0
	movel	%d0,%fp@(-96)
	moveal	%a4,%a3
	addqw	#6,%a3
	movel	%a3,%fp@(-90)
	movew	%a4@,%d0
	movew	%d0,%fp@(-86)
	movel	%a4@(2),%d0
	movel	%d0,%fp@(-60)
	clrb	%fp@(-82)
	clrw	%d0
	movew	%d0,%fp@(-80)
	lea	%fp@(-108),%a0
	_PBGetCatInfoSync
	movew	%d0,%d3
	bnes	.L10005888
	moveb	%fp@(-78),%d0
	moveq	#16,%d1
	andb	%d1,%d0
	beqs	.L10005876
	moveb	#1,%a2@
	bras	.L10005888

.L10005876:
	movew	%fp@(-68),%d0
	andiw	#-32768,%d0
	beqs	.L10005888
	moveal	%fp@(12),%a0
	moveb	#1,%a0@

.L10005888:
	movew	%d3,%d0
	movew	%d0,%fp@(20)

.L1000588e:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(12),%sp
	jmp	%a0@

sub_1000589c:
	linkw	%fp,#-332
	moveml	%d3-%d7/%a2,%sp@-
	moveal	%fp@(12),%a2
	subqw	#2,%sp
	movel	%a2,%sp@-
	clrw	%sp@-
	pea	%fp@(-268)
	moveq	#7,%d0
	_AliasDispatch
	movew	%sp@+,%d6
	bnew	.L1000597e
	subqw	#2,%sp
	movel	%a2,%sp@-
	moveq	#1,%d7
	movel	%d7,%d0
	movew	%d0,%sp@-
	pea	%fp@(-332)
	moveq	#7,%d0
	_AliasDispatch
	movew	%sp@+,%d6
	braw	.L10005962

.L100058d4:
	tstw	%d6
	bnew	.L1000597e
	moveb	%fp@(-332),%d0
	addqb	#1,%d0
	moveb	%d0,%fp@(-11)
	moveb	%fp@(-268),%d1
	addb	%fp@(-11),%d1
	moveb	%d1,%fp@(-12)
	cmpib	#0xff,%d1
	bhiw	.L100059a0
	moveb	%fp@(-268),%d3
	moveq	#0,%d2
	moveb	%d3,%d2
	movel	%d2,%sp@-
	pea	%fp@(-267)
	moveb	%d0,%d5
	moveq	#0,%d4
	moveb	%d5,%d4
	moveq	#0,%d3
	movew	%d4,%d3
	lea	%fp@(-267),%a0
	movel	%d3,%fp@(-4)
	addl	%a0,%d3
	movel	%d3,%sp@-
	jsr	%pc@(sub_1000a220)
	lea	%sp@(12),%sp
	moveq	#0,%d0
	movew	%d4,%d0
	movel	%d0,%sp@-
	pea	%fp@(-332)
	pea	%fp@(-268)
	jsr	%pc@(local_memcpy)
	lea	%sp@(12),%sp
	movel	%fp@(-4),%d0
	lea	%fp@(-268),%a0
	moveb	#58,%a0@(%d0:w)
	moveb	%fp@(-12),%fp@(-268)
	subqw	#2,%sp
	movel	%a2,%sp@-
	addql	#1,%d7
	movel	%d7,%d0
	movew	%d0,%sp@-
	pea	%fp@(-332)
	moveq	#7,%d0
	_AliasDispatch
	movew	%sp@+,%d6

.L10005962:
	moveb	%fp@(-332),%d0
	bnew	.L100058d4
	subqw	#2,%sp
	movel	%a2,%sp@-
	moveq	#-1,%d0
	movew	%d0,%sp@-
	pea	%fp@(-332)
	moveq	#7,%d0
	_AliasDispatch
	movew	%sp@+,%d6
	beqs	.L10005984

.L1000597e:
	movew	%d6,%d0
	jmp	%pc@(.L10005a0e)

.L10005984:
	moveb	%fp@(-332),%d0
	addqb	#1,%d0
	moveb	%d0,%fp@(-11)
	moveb	%fp@(-268),%d1
	addb	%fp@(-11),%d1
	moveb	%d1,%fp@(-12)
	cmpib	#0xff,%d1
	blss	.L100059a4

.L100059a0:
	moveq	#-9,%d0
	bras	.L10005a0e

.L100059a4:
	moveb	%fp@(-268),%d3
	moveq	#0,%d2
	moveb	%d3,%d2
	movel	%d2,%sp@-
	pea	%fp@(-267)
	moveb	%d0,%d5
	moveq	#0,%d4
	moveb	%d5,%d4
	moveq	#0,%d3
	movew	%d4,%d3
	lea	%fp@(-267),%a0
	movel	%d3,%fp@(-8)
	addl	%a0,%d3
	movel	%d3,%sp@-
	jsr	%pc@(sub_1000a220)
	lea	%sp@(12),%sp
	moveq	#0,%d0
	movew	%d4,%d0
	movel	%d0,%sp@-
	pea	%fp@(-332)
	pea	%fp@(-268)
	jsr	%pc@(local_memcpy)
	lea	%sp@(12),%sp
	movel	%fp@(-8),%d0
	lea	%fp@(-268),%a0
	moveb	#58,%a0@(%d0:w)
	moveb	%fp@(-12),%fp@(-268)
	subqw	#2,%sp
	clrw	%sp@-
	clrl	%sp@-
	pea	%fp@(-268)
	movel	%fp@(8),%sp@-
	moveq	#1,%d0
	_HighLevelFSDispatch
	movew	%sp@+,%d0

.L10005a0e:
	moveml	%sp@+,%d3-%d7/%a2
	unlk	%fp
	rts

sub_10005a16:
	linkw	%fp,#-76
	moveml	%d3-%d5/%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	moveal	%fp@(14),%a4
	movel	%a2,%d0
	beqs	.L10005a34
	movel	%a4,%d0
	beqs	.L10005a34
	movel	%fp@(18),%d0
	bnes	.L10005a3a

.L10005a34:
	moveq	#-50,%d0
	jmp	%pc@(.L10005ba6)

.L10005a3a:
	moveal	%a2,%a0
	lea	%fp@(-76),%a1
	moveq	#16,%d0

.L10005a42:
	movel	%a0@+,%a1@+
	dbf	%d0,.L10005a42
	movew	%a0@,%a1@
	moveq	#10,%d3
	movew	%d0,%d5
	clrb	%d0
	moveb	%d0,%fp@(-3)
	moveb	%d0,%fp@(-5)
	moveb	%d0,%a4@

.L10005a5a:
	subqw	#1,%d3
	subqw	#2,%sp
	movel	%a2,%sp@-
	movel	%fp@(18),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10005802)
	movew	%sp@+,%d4
	bnew	.L10005b6e
	moveal	%fp@(18),%a0
	tstb	%a0@
	beqw	.L10005b6e
	subqw	#2,%sp
	movel	%a2,%sp@-
	clrb	%sp@-
	moveq	#13,%d0
	_HighLevelFSDispatch
	movew	%sp@+,%d5
	subqw	#2,%sp
	.short	0xa9af
	movew	%sp@+,%d4
	moveq	#-1,%d0
	cmpw	%d0,%d5
	beqw	.L10005b6e
	subqw	#4,%sp
	movel	#1634494835,%sp@-
	moveq	#1,%d0
	movew	%d0,%sp@-
	.short	0xa80e
	moveal	%sp@+,%a3
	subqw	#2,%sp
	.short	0xa9af
	movew	%sp@+,%d4
	movel	%a3,%d0
	beqw	.L10005b6e
	movel	%a3,%sp@-
	.short	0xa9a2
	subqw	#2,%sp
	.short	0xa9af
	movew	%sp@+,%d4
	bnew	.L10005b6e
	subqw	#2,%sp
	movel	%a2,%sp@-
	movel	%a3,%sp@-
	moveb	%fp@(22),%sp@-
	movel	%a2,%sp@-
	pea	%fp@(-6)
	moveq	#15,%d0
	_AliasDispatch
	movew	%sp@+,%d4
	moveq	#-43,%d0
	cmpw	%d0,%d4
	bnes	.L10005b10
	movew	%a2@,%d0
	cmpw	%fp@(-76),%d0
	bnes	.L10005b10
	movel	%a2@(2),%d0
	cmpl	%fp@(-74),%d0
	bnes	.L10005b10
	subqw	#2,%sp
	moveal	%a2,%a0
	addqw	#6,%a0
	movel	%a0,%sp@-
	pea	%fp@(-70)
	jsr	%pc@(sub_1000a31e)
	movew	%sp@+,%d0
	bnes	.L10005b10
	movel	%a3,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_1000589c)
	addqw	#8,%sp
	movew	%d0,%d4
	clrb	%fp@(-6)

.L10005b10:
	tstw	%d4
	bnes	.L10005b56
	moveb	%fp@(-6),%d0
	beqs	.L10005b22
	movel	%a3,%sp@-
	.short	0xa9aa
	movel	%a3,%sp@-
	.short	0xa9b0

.L10005b22:
	moveb	#1,%fp@(-3)
	subqw	#2,%sp
	movel	%a2,%sp@-
	pea	%fp@(-4)
	movel	%a4,%sp@-
	jsr	%pc@(sub_10005802)
	movew	%sp@+,%d4
	bnes	.L10005b56
	moveb	%fp@(-4),%d0
	beqs	.L10005b46
	moveb	%fp@(12),%d0
	bnes	.L10005b4a

.L10005b46:
	moveq	#0,%d0
	bras	.L10005b4c

.L10005b4a:
	moveq	#1,%d0

.L10005b4c:
	negl	%d0
	subxl	%d0,%d0
	addql	#1,%d0
	moveb	%d0,%fp@(-5)

.L10005b56:
	movew	%d5,%sp@-
	.short	0xa99a
	moveq	#-1,%d5
	tstw	%d4
	bnes	.L10005b6e
	cmpiw	#0,%d3
	bles	.L10005b6e
	moveb	%fp@(-5),%d0
	beqw	.L10005a5a

.L10005b6e:
	tstw	%d3
	bnes	.L10005b7a
	moveb	%fp@(-5),%d0
	bnes	.L10005b7a
	moveq	#-43,%d4

.L10005b7a:
	moveq	#-1,%d0
	cmpw	%d0,%d5
	beqs	.L10005b84
	movew	%d5,%sp@-
	.short	0xa99a

.L10005b84:
	tstw	%d4
	beqs	.L10005ba4
	moveb	%fp@(-3),%d0
	beqs	.L10005ba4
	cmpiw	#-43,%d4
	beqs	.L10005ba4
	lea	%fp@(-76),%a0
	moveal	%a2,%a1
	moveq	#16,%d0

.L10005b9c:
	movel	%a0@+,%a1@+
	dbf	%d0,.L10005b9c
	movew	%a0@,%a1@

.L10005ba4:
	movew	%d4,%d0

.L10005ba6:
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10005bae:
	linkw	%fp,#0
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	cmpil	#176,%fp@(12)
	bccs	.L10005bc8
	moveq	#-50,%d0
	bras	.L10005c2a

.L10005bc8:
	movel	%a4,%d3
	moveq	#55,%d0
	addl	%d0,%d3
	moveq	#-8,%d0
	andl	%d0,%d3
	movel	%d3,%a4@(40)
	movel	%fp@(12),%d4
	movel	%a4@(40),%d0
	subl	%a4,%d0
	subl	%d0,%d4
	moveq	#-16,%d0
	andl	%d0,%d4
	moveal	%a4,%a3
	moveal	%a4,%a2
	moveq	#40,%d0
	addal	%d0,%a2
	bras	.L10005bf6

.L10005bf0:
	moveq	#0,%d0
	movel	%d0,%a3@
	addqw	#4,%a3

.L10005bf6:
	cmpal	%a3,%a2
	bhis	.L10005bf0
	movel	%a4@(40),%d0
	movel	%d0,%a4@
	moveq	#0,%d1
	moveal	%d0,%a0
	movel	%d1,%a0@
	movel	%d4,%d0
	moveq	#-16,%d1
	addl	%d1,%d0
	moveal	%a4@,%a0
	movel	%d0,%a0@(4)
	moveal	%a4@(40),%a3
	addal	%d4,%a3
	moveq	#-16,%d0
	addal	%d0,%a3
	movel	%a4,%a3@
	moveq	#0,%d0
	movel	%d0,%a3@(4)
	movel	%a3,%a4@(44)
	clrw	%d0

.L10005c2a:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10005c32:
	linkw	%fp,#0
	moveml	%a2-%a3,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a3
	movel	%fp@(8),%d0
	_NewPtrSys
	moveal	%a0,%a2
	movel	%a2,%d0
	bnes	.L10005c50
	moveq	#-108,%d0
	bras	.L10005c60

.L10005c50:
	movel	%a2,%a3@(84)
	movel	%fp@(8),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10005bae)
	addqw	#8,%sp

.L10005c60:
	moveml	%sp@+,%a2-%a3
	unlk	%fp
	rts

sub_10005c68:
	linkw	%fp,#-4
	moveml	%d4/%a2-%a4,%sp@-
	movel	%fp@(8),%d4
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a3
	moveq	#0,%d0
	moveal	%d0,%a2
	moveal	%a3@(84),%a0
	moveal	%a0@,%a4
	bras	.L10005c8a

.L10005c86:
	moveal	%a4,%a2
	moveal	%a4@,%a4

.L10005c8a:
	movel	%a4,%d0
	beqs	.L10005c96
	movel	%a4@(4),%d0
	cmpl	%d4,%d0
	bcss	.L10005c86

.L10005c96:
	movel	%a4,%d0
	beqs	.L10005cf0
	movel	%a4@(4),%d0
	cmpl	%d4,%d0
	bnes	.L10005cbc
	movel	%a2,%d0
	beqs	.L10005cac
	movel	%a4@,%d0
	movel	%d0,%a2@
	bras	.L10005cb4

.L10005cac:
	movel	%a4@,%d0
	moveal	%a3@(84),%a0
	movel	%d0,%a0@

.L10005cb4:
	movel	%a3@(84),%d0
	movel	%d0,%a4@
	bras	.L10005cec

.L10005cbc:
	moveal	%a4,%a0
	addal	%d4,%a0
	movel	%a0,%fp@(-4)
	movel	%a2,%d0
	beqs	.L10005ccc
	movel	%a0,%a2@
	bras	.L10005cd4

.L10005ccc:
	moveal	%a3@(84),%a0
	movel	%fp@(-4),%a0@

.L10005cd4:
	movel	%a4@,%d0
	moveal	%fp@(-4),%a2
	movel	%d0,%a2@
	movel	%a4@(4),%d0
	subl	%d4,%d0
	movel	%d0,%a2@(4)
	movel	%a3@(84),%d0
	movel	%d0,%a4@

.L10005cec:
	movel	%d4,%a4@(4)

.L10005cf0:
	movel	%a4,%d0
	moveml	%sp@+,%d4/%a2-%a4
	unlk	%fp
	rts

sub_10005cfa:
	linkw	%fp,#-12
	moveml	%d3/%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-12)
	moveal	%d0,%a0
	moveal	%a0@(84),%a2
	moveal	%a2@(40),%a4
	moveq	#0,%d1
	movel	%d1,%a2@
	moveal	%a0,%a3
	moveq	#84,%d0
	addal	%d0,%a3
	moveq	#0,%d3
	bras	.L10005d2c

.L10005d22:
	moveq	#0,%d0
	moveal	%a3@,%a0
	addal	%d3,%a0
	movel	%d0,%a0@
	addql	#4,%d3

.L10005d2c:
	moveal	%fp@(-12),%a2
	moveq	#84,%d0
	addal	%d0,%a2
	cmpil	#40,%d3
	bcss	.L10005d22
	movel	%a2,%fp@(-4)
	movel	%a2,%fp@(-8)

.L10005d44:
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a0
	moveal	%a0@(44),%a0
	cmpal	%a4,%a0
	beqs	.L10005d68
	moveal	%a4@,%a0
	moveal	%fp@(-12),%a1
	moveal	%a1@(84),%a1
	cmpal	%a1,%a0
	bnes	.L10005d68
	movel	%a4@(4),%d0
	addal	%d0,%a4
	bras	.L10005d44

.L10005d68:
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a0
	moveal	%a0@(44),%a0
	cmpal	%a4,%a0
	beqs	.L10005db2
	movel	%a4@(4),%d0
	addl	%a4,%d0
	moveal	%d0,%a3
	moveal	%a4,%a2
	addqw	#4,%a2
	bras	.L10005d90

.L10005d84:
	movel	%a3@(4),%d0
	addl	%d0,%a2@
	movel	%a3@(4),%d0
	addal	%d0,%a3

.L10005d90:
	moveal	%a3@,%a0
	moveal	%fp@(-8),%a1
	moveal	%a1@,%a1
	cmpal	%a1,%a0
	bnes	.L10005d84
	moveal	%fp@(-4),%a2
	moveal	%a2@,%a0
	movel	%a0@,%d0
	movel	%d0,%a4@
	moveal	%a2@,%a0
	movel	%a4,%a0@
	movel	%a4@(4),%d0
	addal	%d0,%a4
	bras	.L10005d44

.L10005db2:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10005dba:
	linkw	%fp,#-4
	moveml	%d3-%d6/%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	movel	%fp@(8),%d5
	moveq	#47,%d0
	addl	%d0,%d5
	moveq	#-16,%d0
	andl	%d0,%d5
	movel	#8192,%d3
	cmpl	%d3,%d5
	bccs	.L10005de0
	movel	%d3,%d5

.L10005de0:
	movel	%d5,%d0
	_NewPtrSys
	movel	%a0,%d4
	movel	%d4,%d6
	addl	%d5,%d6
	tstl	%d4
	bnes	.L10005df2
	clrb	%d0
	bras	.L10005e3a

.L10005df2:
	movel	%d5,%d0
	moveq	#-16,%d3
	addl	%d3,%d0
	moveal	%d4,%a2
	movel	%d0,%a2@(4)
	moveal	%a4,%a3
	moveq	#84,%d0
	addal	%d0,%a3
	moveal	%a3@,%a0
	movel	%a0@,%d0
	movel	%d0,%a2@
	moveal	%a3@,%a0
	movel	%d4,%a0@
	movel	%d6,%d0
	addl	%d3,%d0
	movel	%d0,%fp@(-4)
	moveq	#0,%d1
	moveal	%d0,%a0
	movel	%d1,%a0@(4)
	movel	%a3@,%d1
	movel	%d1,%a0@
	movel	%d4,%d1
	moveal	%a3@,%a2
	moveq	#44,%d3
	addal	%d3,%a2
	subl	%a2@,%d1
	moveal	%a2@,%a1
	movel	%d1,%a1@(4)
	moveal	%a3@,%a1
	movel	%a0,%a1@(44)
	moveq	#1,%d0

.L10005e3a:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_10005e42:
	linkw	%fp,#-16
	moveml	%d3-%d5/%a2-%a4,%sp@-
	movel	%fp@(8),%d3
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-16)
	clrb	%fp@(-12)
	movel	%d3,%d1
	moveq	#15,%d2
	addl	%d2,%d1
	moveq	#-8,%d2
	andl	%d2,%d1
	movel	%d1,%d3
	movel	%d1,%d5
	lsrl	#3,%d5
	movel	%d5,%d4
	lsll	#2,%d4
	moveal	%d0,%a0
	moveq	#84,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)

.L10005e78:
	cmpil	#64,%d3
	bhis	.L10005eac
	movel	%d5,%d0
	lsll	#2,%d0
	moveal	%fp@(-16),%a0
	addl	%a0@(84),%d0
	moveal	%d0,%a0
	tstl	%a0@
	beqs	.L10005eac
	moveal	%fp@(-8),%a2
	moveal	%a2@,%a3
	addal	%d4,%a3
	moveal	%a3@,%a4
	movel	%a4@,%d0
	movel	%d0,%a3@
	movel	%a2@,%d0
	movel	%d0,%a4@
	moveb	#2,%fp@(-12)
	bras	.L10005ef8

.L10005eac:
	movel	%d3,%sp@-
	jsr	%pc@(sub_10005c68)
	addqw	#4,%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	beqs	.L10005ec2
	moveb	#2,%fp@(-12)
	bras	.L10005ef8

.L10005ec2:
	moveb	%fp@(-12),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	tstl	%d0
	beqs	.L10005ed6
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10005ee2
	bras	.L10005ef8

.L10005ed6:
	jsr	%pc@(sub_10005cfa)
	moveb	#1,%fp@(-12)
	bras	.L10005ef8

.L10005ee2:
	movel	%d3,%sp@-
	jsr	%pc@(sub_10005dba)
	addqw	#4,%sp
	tstb	%d0
	beqs	.L10005ef4
	clrb	%fp@(-12)
	bras	.L10005ef8

.L10005ef4:
	moveq	#0,%d0
	bras	.L10005f2c

.L10005ef8:
	cmpib	#2,%fp@(-12)
	bnew	.L10005e78
	moveal	%a4,%a2
	addqw	#8,%a2
	moveb	%fp@(12),%d0
	beqs	.L10005f26
	moveal	%a2,%a3
	addal	%d3,%a2
	subqw	#8,%a2
	movel	%a2,%fp@(-4)
	bras	.L10005f1e

.L10005f18:
	moveq	#0,%d0
	movel	%d0,%a3@
	addqw	#4,%a3

.L10005f1e:
	moveal	%fp@(-4),%a0
	cmpal	%a3,%a0
	bhis	.L10005f18

.L10005f26:
	moveal	%a4,%a0
	addqw	#8,%a0
	movel	%a0,%d0

.L10005f2c:
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10005f34:
	linkw	%fp,#0
	moveq	#1,%d0
	moveb	%d0,%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10005e42)
	unlk	%fp
	rts

sub_10005f48:
	linkw	%fp,#-8
	moveml	%d3-%d4/%a3-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a3
	moveal	%fp@(8),%a4
	subqw	#8,%a4
	moveal	%a4@,%a0
	moveal	%a3@(84),%a1
	cmpal	%a1,%a0
	beqs	.L10005f6a
	moveq	#-50,%d0
	bras	.L10005fae

.L10005f6a:
	movel	%a4@(4),%d4
	movel	%d4,%fp@(-8)
	asrl	#3,%d4
	movel	%fp@(-8),%d0
	moveq	#64,%d1
	cmpl	%d1,%d0
	bles	.L10005f8e
	moveal	%a3@(84),%a0
	movel	%a0@,%d0
	movel	%d0,%a4@
	moveal	%a3@(84),%a0
	movel	%a4,%a0@
	bras	.L10005fac

.L10005f8e:
	movel	%d4,%d3
	lsll	#2,%d3
	movel	%d3,%fp@(-4)
	addl	%a3@(84),%d3
	moveal	%d3,%a0
	movel	%a0@,%d0
	movel	%d0,%a4@
	movel	%fp@(-4),%d0
	addl	%a3@(84),%d0
	moveal	%d0,%a0
	movel	%a4,%a0@

.L10005fac:
	clrw	%d0

.L10005fae:
	moveml	%sp@+,%d3-%d4/%a3-%a4
	unlk	%fp
	rts

sub_10005fb6:
	linkw	%fp,#0
	moveml	%d3/%d6-%d7,%sp@-
	movel	%fp@(8),%d6
	movel	%fp@(16),%d7
	cmpl	%d7,%d6
	beqs	.L10005ffa
	moveq	#-1,%d3
	cmpl	%d3,%d6
	beqs	.L10005ffa
	cmpl	%d3,%d7
	beqs	.L10005ffa
	cmpl	%d6,%d7
	blss	.L10005fec
	movel	%fp@(20),%d3
	cmpl	%d6,%d3
	blss	.L10005ffa
	moveq	#-1,%d0
	cmpl	%d0,%d3
	beqs	.L10005ffa
	movew	#-2814,%d0
	bras	.L10006002

.L10005fec:
	movel	%fp@(12),%d3
	cmpl	%d7,%d3
	blss	.L10005ffa
	moveq	#-1,%d0
	cmpl	%d0,%d3
	bnes	.L10005ffe

.L10005ffa:
	clrw	%d0
	bras	.L10006002

.L10005ffe:
	movew	#-2813,%d0

.L10006002:
	moveml	%sp@+,%d3/%d6-%d7
	unlk	%fp
	rts

sub_1000600a:
	linkw	%fp,#-24
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(28),%a0
	moveb	%a0@,%d0
	moveq	#0,%d4
	moveb	%d0,%d4
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a3
	moveal	%fp@(24),%a2
	movel	%a2@,%d3
	cmpil	#1832269931,%d3
	beqs	.L1000603a
	cmpil	#1061109567,%d3
	bnew	.L1000617e

.L1000603a:
	movel	%a2@(12),%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L1000604c
	moveal	%fp@(8),%a0
	tstl	%a0@
	bnes	.L10006052

.L1000604c:
	moveal	%a3@(20),%a4
	bras	.L1000605a

.L10006052:
	moveal	%fp@(8),%a0
	moveal	%a0@,%a4
	moveal	%a4@,%a4

.L1000605a:
	moveal	%fp@(12),%a2
	clrb	%a2@(24)
	moveal	%fp@(24),%a3
	moveq	#12,%d0
	addal	%d0,%a3
	movel	%a3,%fp@(-24)
	moveal	%fp@(28),%a0
	addqw	#1,%a0
	movel	%a0,%fp@(-20)
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-16)
	moveal	%fp@(12),%a0
	moveq	#20,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-12)
	moveal	%fp@(24),%a0
	addqw	#8,%a0
	movel	%a0,%fp@(-8)
	moveal	%fp@(24),%a0
	addqw	#4,%a0
	movel	%a0,%fp@(-4)
	braw	.L10006178

.L100060a4:
	movew	%a4@(24),%d0
	extl	%d0
	cmpl	%d4,%d0
	bnew	.L10006176
	movel	%a4@(8),%d0
	moveal	%fp@(-24),%a0
	movel	%a0@,%d1
	cmpl	%d1,%d0
	bnew	.L10006176
	movel	%d4,%sp@-
	moveal	%a4,%a0
	moveq	#27,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	movel	%fp@(-20),%sp@-
	jsr	%pc@(sub_100057aa)
	lea	%sp@(12),%sp
	tstl	%d0
	beqw	.L10006176
	moveal	%a4@(16),%a2
	movel	%a2@,%d0
	cmpil	#1248819489,%d0
	bnes	.L10006116
	movel	%a2@(4),%d0
	cmpil	#1885693542,%d0
	bnes	.L10006116
	movel	%a2@(12),%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnes	.L10006116
	movel	%a2@(28),%d0
	moveal	%fp@(-16),%a0
	movel	%d0,%a0@
	movel	%a2@(20),%d0
	moveal	%fp@(-12),%a0
	movel	%d0,%a0@
	bras	.L10006124

.L10006116:
	moveq	#-1,%d3
	moveal	%fp@(-16),%a0
	movel	%d3,%a0@
	moveal	%fp@(-12),%a0
	movel	%d3,%a0@

.L10006124:
	moveal	%fp@(-12),%a0
	movel	%a0@,%sp@-
	moveal	%fp@(-16),%a0
	movel	%a0@,%sp@-
	moveal	%fp@(-8),%a0
	movel	%a0@,%sp@-
	moveal	%fp@(-4),%a0
	movel	%a0@,%sp@-
	jsr	%pc@(sub_10005fb6)
	lea	%sp@(16),%sp
	movew	%d0,%d3
	bnes	.L10006176
	moveq	#0,%d0
	moveal	%fp@(12),%a2
	movel	%d0,%a2@
	movel	%a4@(16),%d0
	movel	%d0,%a2@(4)
	moveb	%a4@(26),%d0
	moveb	%d0,%a2@(12)
	movel	%a4@(20),%d0
	movel	%d0,%a2@(8)
	moveal	%fp@(8),%a0
	movel	%a4,%a0@
	clrw	%d0
	movew	%d0,%fp@(32)
	bras	.L10006186

.L10006176:
	moveal	%a4@,%a4

.L10006178:
	movel	%a4,%d0
	bnew	.L100060a4

.L1000617e:
	movew	#-2804,%d0
	movew	%d0,%fp@(32)

.L10006186:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(24),%sp
	jmp	%a0@

sub_10006194:
	movel	%a2,%sp@-
	subqw	#4,%sp
	movel	0xa50,%sp@
	moveal	%sp@+,%a2
	movel	%a2,%d0
	beqs	.L100061aa
	moveal	%a2@,%a0
	movew	%a0@(20),%d0
	bras	.L100061ac

.L100061aa:
	moveq	#-1,%d0

.L100061ac:
	moveal	%sp@+,%a2
	rts

sub_100061b0:
	linkw	%fp,#-4
	moveml	%d3-%d6/%a2-%a3,%sp@-
	moveal	%fp@(8),%a3
	subqw	#2,%sp
	.short	0xa994
	movew	%sp@+,%d4
	jsr	%pc@(sub_10006194)
	movew	%d0,%d5
	subqw	#2,%sp
	moveb	0xa5e,%sp@
	moveb	%sp@+,%d0
	moveb	%d0,%fp@(-4)
	clrb	%sp@-
	_SetResLoad
	subqw	#2,%sp
	movew	%a3@(22),%sp@-
	movel	%a3@(48),%sp@-
	movel	%a3@(18),%sp@-
	clrb	%sp@-
	_HOpenResFile
	movew	%sp@+,%d3
	moveq	#-1,%d0
	cmpw	%d0,%d3
	bnes	.L10006208
	subqw	#2,%sp
	movew	%a3@(22),%sp@-
	movel	%a3@(48),%sp@-
	movel	%a3@(18),%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	_HOpenResFile
	movew	%sp@+,%d3

.L10006208:
	cmpiw	#-1,%d3
	bnes	.L10006224
	subqw	#2,%sp
	movew	%a3@(22),%sp@-
	movel	%a3@(48),%sp@-
	movel	%a3@(18),%sp@-
	moveq	#4,%d0
	moveb	%d0,%sp@-
	_HOpenResFile
	movew	%sp@+,%d3

.L10006224:
	moveb	%fp@(-4),%sp@-
	_SetResLoad
	cmpiw	#-1,%d3
	bnes	.L10006234
	moveq	#0,%d0
	bras	.L10006274

.L10006234:
	movew	%d3,%sp@-
	.short	0xa998
	subqw	#4,%sp
	movel	%fp@(12),%sp@-
	movew	%fp@(18),%sp@-
	.short	0xa81f
	moveal	%sp@+,%a2
	movel	%a2,%d0
	beqs	.L10006260
	movel	%a2,%sp@-
	.short	0xa9a2
	tstl	%a2@
	beqs	.L10006258
	movel	%a2,%sp@-
	.short	0xa992
	bras	.L10006260

.L10006258:
	movel	%a2,%sp@-
	.short	0xa9a3
	moveq	#0,%d0
	moveal	%d0,%a2

.L10006260:
	jsr	%pc@(sub_10006194)
	movew	%d0,%d6
	cmpw	%d5,%d6
	beqs	.L1000626e
	movew	%d3,%sp@-
	.short	0xa99a

.L1000626e:
	movew	%d4,%sp@-
	.short	0xa998
	movel	%a2,%d0

.L10006274:
	moveml	%sp@+,%d3-%d6/%a2-%a3
	unlk	%fp
	rts

sub_1000627c:
	linkw	%fp,#0
	moveml	%d3/%a2-%a3,%sp@-
	moveq	#0,%d0
	moveal	%d0,%a3
	movel	%fp@(16),%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_100061b0)
	lea	%sp@(12),%sp
	moveal	%d0,%a2
	movel	%a2,%d0
	beqs	.L100062da
	moveal	%a2,%a0
	.short	0xa029
	subqw	#4,%sp
	movel	%a2,%sp@-
	jsr	%pc@(sub_1000a36a)
	movel	%sp@+,%d3
	moveal	%fp@(24),%a0
	movel	%d3,%a0@
	movel	%d3,%d0
	addl	%fp@(20),%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L100062d2
	moveal	%a2@,%a0
	moveal	%a3,%a1
	movel	%d3,%d0
	_BlockMoveData

.L100062d2:
	moveal	%a2,%a0
	_HUnlock
	moveal	%a2,%a0
	_DisposeHandle

.L100062da:
	movel	%a3,%d0
	moveml	%sp@+,%d3/%a2-%a3
	unlk	%fp
	rts

sub_100062e4:
	linkw	%fp,#-76
	moveml	%d3-%d5/%a3,%sp@-
	moveal	%fp@(8),%a3
	subqw	#2,%sp
	movew	%a3@(22),%sp@-
	movel	%a3@(100),%sp@-
	movel	%a3@(18),%sp@-
	pea	%fp@(-72)
	moveq	#1,%d0
	_HighLevelFSDispatch
	movew	%sp@+,%d4
	bnes	.L1000637a
	movel	%fp@(12),%d0
	bnes	.L1000632e
	clrb	%sp@-
	pea	%fp@(-75)
	pea	%fp@(-76)
	moveq	#1,%d0
	moveb	%d0,%sp@-
	pea	%fp@(-72)
	jsr	%pc@(sub_10005a16)
	lea	%sp@(16),%sp
	movew	%d0,%d4
	bras	.L10006344

.L1000632e:
	subqw	#2,%sp
	clrl	%sp@-
	movel	%fp@(12),%sp@-
	pea	%fp@(-72)
	pea	%fp@(-74)
	moveq	#3,%d0
	_AliasDispatch
	movew	%sp@+,%d4

.L10006344:
	tstw	%d4
	bnes	.L1000637a
	moveb	%fp@(-66),%d0
	moveq	#0,%d5
	moveb	%d0,%d5
	addql	#1,%d5
	lea	%fp@(-66),%a0
	moveal	%a3@(18),%a1
	movel	%d5,%d0
	_BlockMoveData
	movew	%fp@(-72),%a3@(22)
	movel	%fp@(-70),%a3@(48)
	clrw	%d3
	movew	%d3,%a3@(28)
	moveal	%a3,%a0
	_PBGetCatInfoSync
	movew	%d0,%d4
	beqs	.L1000637e

.L1000637a:
	movew	%d4,%d0
	bras	.L10006380

.L1000637e:
	movew	%d3,%d0

.L10006380:
	moveml	%sp@+,%d3-%d5/%a3
	unlk	%fp
	rts

sub_10006388:
	linkw	%fp,#-168
	moveml	%d3-%d7/%a2-%a4,%sp@-
	movew	%fp@(12),%d5
	movel	%fp@(18),%d6
	movel	%fp@(26),%d4
	movew	%fp@(34),%d7
	moveal	%fp@(22),%a2
	movew	%d5,%a2@(22)
	movel	%d6,%a2@(48)
	moveq	#-1,%d0
	movew	%d0,%a2@(28)
	moveal	%a2,%a0
	_PBGetCatInfoSync
	movew	%d0,%d3
	bnew	.L100064fa
	moveq	#32,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L100063d6
	movew	#-2809,%d0
	jmp	%pc@(.L10006628)

.L100063d6:
	moveq	#-1,%d0
	movel	%d0,%a4@(8)
	movew	%d5,%a4@(24)
	movel	%d6,%a4@(12)
	moveal	%fp@(22),%a2
	movel	%a2@(76),%d0
	movel	%d0,%a4@(20)
	movel	%fp@(14),%a4@(28)
	movel	%fp@(8),%sp@-
	clrb	%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_100031b0)
	lea	%sp@(10),%sp
	moveq	#1,%d0
	movel	%d0,%fp@(-168)
	movel	%fp@(30),%d0
	beqw	.L1000659e
	moveq	#0,%d0
	movel	%d0,%fp@(-168)
	movel	%fp@(30),%a2@(18)
	braw	.L1000659e

.L10006424:
	movew	%d5,%a3@
	movel	%d6,%a2@
	moveal	%fp@(-36),%a0
	movew	%fp@(-166),%a0@
	moveal	%fp@(22),%a0
	_PBGetCatInfoSync
	movew	%d0,%d3
	moveq	#-43,%d0
	cmpw	%d0,%d3
	beqw	.L10006626
	tstw	%d3
	bnew	.L100064fa
	moveq	#0,%d3
	moveal	%fp@(-32),%a0
	movew	%a0@,%d0
	andiw	#-32768,%d0
	beqs	.L100064a2
	moveal	%fp@(-28),%a0
	movel	%a0@,%d0
	cmpil	#1936223330,%d0
	beqs	.L1000647c
	tstl	%d4
	beqw	.L10006598
	moveal	%fp@(22),%a0
	movel	%a0@(36),%d0
	cmpil	#1296122707,%d0
	bnew	.L10006598

.L1000647c:
	movel	%fp@(8),%sp@-
	clrl	%sp@-
	movel	%fp@(22),%sp@-
	jsr	%pc@(sub_100062e4)
	lea	%sp@(12),%sp
	tstw	%d0
	bnew	.L10006598
	moveal	%fp@(-24),%a0
	moveal	%a0@,%a0
	moveb	%a0@,%d0
	moveq	#0,%d3
	moveb	%d0,%d3
	addql	#1,%d3

.L100064a2:
	moveal	%fp@(-20),%a0
	moveb	%a0@,%d0
	moveq	#16,%d1
	andb	%d1,%d0
	beqs	.L10006500
	tstl	%d4
	beqw	.L10006598
	moveq	#122,%d0
	movel	%d0,%sp@-
	pea	%fp@(-160)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movew	%a3@,%d0
	movew	%d0,%fp@(-138)
	lea	%fp@(-160),%a0
	_PBHGetVInfoSync
	movew	%d0,%d3
	bnes	.L100064f4
	movew	%d7,%sp@-
	clrl	%sp@-
	movel	%fp@(-16),%sp@-
	movel	%fp@(22),%sp@-
	movel	%a2@,%sp@-
	movel	%fp@(-130),%sp@-
	movew	%a3@,%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10006388)
	lea	%sp@(28),%sp
	movew	%d0,%d3

.L100064f4:
	tstw	%d3
	beqw	.L10006598

.L100064fa:
	movew	%d3,%d0
	jmp	%pc@(.L10006628)

.L10006500:
	moveal	%fp@(-28),%a0
	movel	%a0@,%d0
	cmpil	#1936223330,%d0
	beqs	.L10006516
	movel	%fp@(30),%d0
	beqw	.L10006598

.L10006516:
	moveal	%fp@(-12),%a0
	movel	%a0@,%d0
	movel	%d0,%a2@
	pea	%fp@(-164)
	movel	%d3,%sp@-
	movel	%fp@(-8),%sp@-
	movel	#1667658343,%sp@-
	movel	%fp@(22),%sp@-
	jsr	%pc@(sub_1000627c)
	lea	%sp@(20),%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	beqs	.L10006598
	tstl	%d3
	beqs	.L1000655c
	movew	%fp@(-162),%a4@(26)
	moveal	%fp@(-24),%a0
	moveal	%a0@,%a0
	moveal	%a4,%a1
	addal	%fp@(-164),%a1
	movel	%d3,%d0
	_BlockMoveData
	bras	.L10006562

.L1000655c:
	clrw	%d0
	movew	%d0,%a4@(26)

.L10006562:
	moveal	%fp@(-36),%a0
	movew	%a0@,%d0
	extl	%d0
	movel	%d0,%a4@(16)
	movew	%a3@,%d0
	movew	%d0,%a4@(24)
	moveal	%fp@(-12),%a0
	movel	%a0@,%d0
	movel	%d0,%a4@(12)
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	movel	%d0,%a4@(20)
	movel	%fp@(8),%sp@-
	clrb	%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_100031b0)
	lea	%sp@(10),%sp

.L10006598:
	addql	#1,%fp@(-168)
	bras	.L10006612

.L1000659e:
	moveal	%fp@(22),%a3
	moveq	#22,%d0
	addal	%d0,%a3
	moveal	%fp@(22),%a2
	moveq	#48,%d0
	addal	%d0,%a2
	moveal	%fp@(22),%a0
	moveq	#28,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-36)
	moveal	%fp@(22),%a0
	moveq	#40,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-32)
	moveal	%fp@(22),%a0
	moveq	#32,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-28)
	moveal	%fp@(22),%a0
	moveq	#18,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-24)
	moveal	%fp@(22),%a0
	moveq	#30,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-20)
	movel	%d4,%d0
	subql	#1,%d0
	movel	%d0,%fp@(-16)
	moveal	%fp@(22),%a0
	moveq	#100,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-12)
	movew	%d7,%d0
	extl	%d0
	movel	%d0,%fp@(-8)
	moveal	%fp@(22),%a0
	moveq	#76,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)

.L10006612:
	movel	%fp@(30),%d0
	beqw	.L10006424
	cmpil	#0,%fp@(-168)
	blew	.L10006424

.L10006626:
	clrw	%d0

.L10006628:
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	rts

sub_10006630:
	linkw	%fp,#-296
	moveml	%d3-%d4,%sp@-
	moveq	#122,%d0
	movel	%d0,%sp@-
	pea	%fp@(-232)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movew	%fp@(12),%fp@(-210)
	lea	%fp@(-232),%a0
	_PBHGetVInfoSync
	movew	%d0,%d3
	beqs	.L1000665c
	moveq	#-1,%d0
	movel	%d0,%fp@(-202)

.L1000665c:
	movel	%fp@(-202),%d4
	moveq	#108,%d0
	movel	%d0,%sp@-
	pea	%fp@(-108)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	lea	%fp@(-296),%a0
	movel	%a0,%fp@(-90)
	movew	%fp@(26),%sp@-
	movel	%fp@(22),%sp@-
	movel	%fp@(18),%sp@-
	pea	%fp@(-108)
	movel	%fp@(14),%sp@-
	movel	%d4,%sp@-
	movew	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10006388)
	lea	%sp@(28),%sp
	movew	%d0,%d3
	beqs	.L100066aa
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_100066b4)
	addqw	#4,%sp

.L100066aa:
	movew	%d3,%d0
	moveml	%sp@+,%d3-%d4
	unlk	%fp
	rts

sub_100066b4:
	linkw	%fp,#0
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	moveal	%a2@,%a3
	bras	.L100066da

.L100066c4:
	moveal	%a3@,%a4
	movel	%a2,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10003200)
	addqw	#8,%sp
	movel	%a3,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	moveal	%a4,%a3

.L100066da:
	movel	%a3,%d0
	bnes	.L100066c4
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	rts

sub_100066e6:
	linkw	%fp,#-12
	moveml	%d3-%d6/%a2-%a4,%sp@-
	movew	%fp@(8),%d5
	movel	%fp@(10),%d6
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-12)
	moveq	#0,%d1
	moveal	%d1,%a4
	moveal	%d0,%a2
	moveq	#88,%d0
	addal	%d0,%a2
	moveal	%a2,%a3
	moveal	%a2,%a0
	lea	%a0@(280),%a0
	movel	%a0,%fp@(-4)
	bras	.L10006730

.L10006716:
	movew	%a3@,%d0
	cmpw	%d5,%d0
	bnes	.L10006728
	movel	%a3@(4),%d0
	cmpl	%d6,%d0
	bnes	.L10006728
	moveal	%a3,%a4
	bras	.L1000672c

.L10006728:
	addql	#1,%a3@(8)

.L1000672c:
	moveq	#28,%d0
	addal	%d0,%a3

.L10006730:
	moveal	%fp@(-4),%a0
	cmpal	%a3,%a0
	bhis	.L10006716
	movel	%a4,%d0
	beqs	.L10006746
	moveal	%a4,%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%d0
	bras	.L1000679e

.L10006746:
	moveq	#0,%d0
	moveal	%d0,%a4
	moveq	#0,%d4
	moveal	%fp@(-12),%a2
	moveq	#88,%d0
	addal	%d0,%a2
	moveal	%a2,%a3
	moveal	%a2,%a0
	lea	%a0@(280),%a0
	movel	%a0,%fp@(-8)
	bras	.L1000677a

.L10006762:
	tstw	%a3@
	bnes	.L1000676a
	moveal	%a3,%a4
	bras	.L10006782

.L1000676a:
	movel	%a3@(8),%d3
	cmpl	%d4,%d3
	blss	.L10006776
	moveal	%a3,%a4
	movel	%d3,%d4

.L10006776:
	moveq	#28,%d0
	addal	%d0,%a3

.L1000677a:
	moveal	%fp@(-8),%a0
	cmpal	%a3,%a0
	bhis	.L10006762

.L10006782:
	moveal	%a4,%a2
	moveq	#12,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	jsr	%pc@(sub_100066b4)
	addqw	#4,%sp
	movew	%d5,%a4@
	movel	%d6,%a4@(4)
	moveq	#0,%d0
	movel	%d0,%a4@(8)
	movel	%a2,%d0

.L1000679e:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_100067a6:
	linkw	%fp,#-8
	moveml	%d3-%d6/%a2-%a4,%sp@-
	moveal	%fp@(16),%a2
	movel	%a2@(28),%d6
	moveq	#32,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-8)
	moveal	%fp@(16),%a0
	moveq	#20,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)
	braw	.L100068e0

.L100067ce:
	moveal	%fp@(-8),%a2
	moveb	%a2@(22),%d3
	moveq	#1,%d0
	cmpb	%d0,%d3
	beqs	.L100067e2
	tstb	%d3
	bnew	.L100068d2

.L100067e2:
	moveb	%a2@(42),%d3
	moveq	#63,%d0
	cmpb	%d0,%d3
	bhiw	.L100068d2
	moveal	%fp@(8),%a3
	moveb	%a3@,%d4
	cmpb	%d4,%d3
	bnew	.L100068d2
	moveal	%fp@(12),%a4
	movel	%a4@,%d3
	cmpil	#1061109567,%d3
	beqs	.L10006810
	movel	%a2@,%d0
	cmpl	%d3,%d0
	bnew	.L100068d2

.L10006810:
	movel	%a2@(4),%d0
	movel	%a4@(12),%d1
	cmpl	%d1,%d0
	bnew	.L100068d2
	moveq	#0,%d0
	moveb	%d4,%d0
	movel	%d0,%sp@-
	addqw	#1,%a3
	movel	%a3,%sp@-
	moveq	#43,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	jsr	%pc@(sub_100057aa)
	lea	%sp@(12),%sp
	tstl	%d0
	beqw	.L100068d2
	moveal	%fp@(-8),%a0
	movel	%a0@(12),%sp@-
	movel	%a0@(8),%sp@-
	movel	%a4@(8),%sp@-
	movel	%a4@(4),%sp@-
	jsr	%pc@(sub_10005fb6)
	lea	%sp@(16),%sp
	tstw	%d0
	bnes	.L100068d2
	moveal	%fp@(20),%a2
	tstl	%a2@
	bnes	.L10006872
	movel	%fp@(16),%a2@
	moveal	%fp@(24),%a0
	movel	%fp@(-8),%a0@
	bras	.L100068d2

.L10006872:
	moveal	%fp@(-8),%a2
	movel	%a2@(8),%d3
	moveq	#-1,%d4
	cmpl	%d4,%d3
	beqs	.L10006892
	moveal	%fp@(24),%a0
	moveal	%a0@,%a0
	movel	%a0@(8),%d5
	cmpl	%d4,%d5
	beqs	.L10006892
	cmpl	%d5,%d3
	bnes	.L100068b2

.L10006892:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	moveal	%fp@(20),%a3
	moveal	%a3@,%a0
	movel	%a0@(20),%d1
	cmpl	%d1,%d0
	blss	.L100068d2
	movel	%fp@(16),%a3@
	moveal	%fp@(24),%a0
	movel	%a2,%a0@
	bras	.L100068d2

.L100068b2:
	moveal	%fp@(-8),%a2
	movel	%a2@(8),%d0
	moveal	%fp@(24),%a3
	moveal	%a3@,%a0
	movel	%a0@(8),%d1
	cmpl	%d1,%d0
	blss	.L100068d2
	moveal	%fp@(20),%a0
	movel	%fp@(16),%a0@
	movel	%a2,%a3@

.L100068d2:
	moveal	%fp@(-8),%a0
	movew	%a0@(40),%d0
	extl	%d0
	addl	%d0,%fp@(-8)

.L100068e0:
	subql	#1,%d6
	cmpil	#0,%d6
	bplw	.L100067ce
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_100068f4:
	linkw	%fp,#-108
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(12),%a3
	moveal	%fp@(20),%a4
	movel	%a3@(8),%d0
	movel	%d0,%a4@(16)
	movel	%a3@(12),%d0
	movel	%d0,%a4@(20)
	moveb	%a3@(23),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	movel	%d0,%a4@
	tstl	%d0
	beqs	.L10006930
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10006958
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10006958
	bras	.L1000699e

.L10006930:
	movel	%a3@(24),%d0
	movel	%d0,%a4@(4)
	movel	%a3@(28),%d0
	andil	#2147483647,%d0
	movel	%d0,%a4@(8)
	movel	%a3@(28),%d0
	moveq	#1,%d1
	andb	%d1,%d0
	moveb	%d0,%a4@(12)
	clrw	%d0
	jmp	%pc@(.L10006a1e)

.L10006958:
	moveal	%fp@(8),%a2
	movew	%a2@(24),%d0
	moveal	%a4@(4),%a0
	movew	%d0,%a0@
	movel	%a2@(12),%d0
	moveal	%a4@(4),%a0
	movel	%d0,%a0@(2)
	movel	%a4@,%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnes	.L1000698c
	movel	%a3@(24),%d0
	movel	%d0,%a4@(8)
	movel	%a3@(28),%d0
	movel	%d0,%a4@(12)
	bras	.L100069a4

.L1000698c:
	movel	%a3@(24),%d0
	movel	%d0,%a4@(8)
	movel	%a3@(28),%d0
	movew	%d0,%a4@(12)
	bras	.L100069a4

.L1000699e:
	movew	#-2819,%d0
	bras	.L10006a1e

.L100069a4:
	moveal	%fp@(8),%a2
	movew	%a2@(24),%d0
	movew	%d0,%fp@(-86)
	movel	%a2@(12),%d0
	movel	%d0,%fp@(-60)
	movel	%a2@(16),%d0
	movew	%d0,%fp@(-80)
	moveal	%a4@(4),%a0
	addqw	#6,%a0
	movel	%a0,%fp@(-90)
	movel	%fp@(16),%d0
	beqs	.L100069ec
	clrw	%d0
	movew	%d0,%fp@(-80)
	moveal	%fp@(16),%a0
	moveal	%a4@(4),%a1
	addqw	#6,%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData
	bras	.L10006a16

.L100069ec:
	moveal	%fp@(8),%a2
	movew	%a2@(26),%d3
	beqs	.L10006a16
	movew	%d3,%d0
	extl	%d0
	addl	%a2,%d0
	moveal	%d0,%a3
	clrw	%d0
	movew	%d0,%fp@(-80)
	moveal	%a3,%a0
	moveal	%a4@(4),%a1
	addqw	#6,%a1
	moveb	%a3@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData

.L10006a16:
	lea	%fp@(-108),%a0
	_PBGetCatInfoSync

.L10006a1e:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10006a26:
	linkw	%fp,#-172
	moveml	%d3/%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a3
	moveal	%fp@(8),%a0
	tstl	%a0@
	beqs	.L10006a48
	movew	#-2804,%d0
	movew	%d0,%fp@(32)
	jmp	%pc@(.L10006c6c)

.L10006a48:
	moveq	#1,%d0
	moveal	%fp@(8),%a0
	movel	%d0,%a0@
	pea	%fp@(-172)
	movel	%fp@(16),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	movel	%d0,%fp@(-168)
	tstl	%d0
	beqw	.L10006c64
	moveq	#0,%d3
	movel	%d3,%fp@(-44)
	movel	%d3,%fp@(-164)
	movel	%d3,%fp@(-160)
	jsr	%pc@(sub_10002536)
	moveal	%a3@(28),%a4
	moveal	%fp@(-168),%a2
	addqw	#8,%a2
	movel	%a2,%fp@(-36)
	movel	%a2,%fp@(-8)
	moveal	%fp@(-168),%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)
	braw	.L10006c0c

.L10006a9c:
	tstb	%a4@(8)
	bnes	.L10006aae
	tstw	%a4@(10)
	bnew	.L10006c0a
	braw	.L10006c12

.L10006aae:
	moveal	%a4@(52),%a3
	moveal	%a4,%a0
	moveq	#60,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-40)
	moveal	%a4,%a2
	moveq	#52,%d0
	addal	%d0,%a2
	moveal	%a4,%a0
	addqw	#8,%a0
	movel	%a0,%fp@(-32)
	moveal	%a4,%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-28)
	moveal	%a4,%a0
	moveq	#44,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-24)
	moveal	%a4,%a0
	moveq	#48,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-20)
	moveal	%a4,%a0
	moveq	#9,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-16)
	moveal	%a4,%a0
	moveq	#10,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-12)
	braw	.L10006bf0

.L10006b00:
	movel	%a3@(8),%d3
	moveq	#-1,%d0
	cmpl	%d0,%d3
	beqs	.L10006b3e
	moveq	#1,%d0
	cmpl	%d0,%d3
	bnew	.L10006bee
	pea	%fp@(-160)
	pea	%fp@(-164)
	movel	%a3,%sp@-
	movel	%fp@(24),%sp@-
	movel	%fp@(28),%sp@-
	jsr	%pc@(sub_100067a6)
	lea	%sp@(20),%sp
	moveal	%fp@(-164),%a0
	cmpal	%a3,%a0
	bnew	.L10006bee
	movel	%a4,%fp@(-44)
	braw	.L10006bee

.L10006b3e:
	moveal	%fp@(-40),%a0
	moveal	%a0@,%a0
	moveal	%fp@(-36),%a1
	moveal	%a1@,%a1
	cmpal	%a1,%a0
	bnes	.L10006b60
	moveal	%a4@(64),%a0
	moveal	%fp@(-168),%a1
	moveal	%a1@(12),%a1
	cmpal	%a1,%a0
	beqw	.L10006bee

.L10006b60:
	moveq	#0,%d0
	movel	%d0,%fp@(-138)
	movew	%a3@(24),%d0
	movew	%d0,%fp@(-134)
	movel	%a3@(12),%d0
	movel	%d0,%fp@(-108)
	moveq	#-1,%d0
	movew	%d0,%fp@(-128)
	lea	%fp@(-156),%a0
	_PBGetCatInfoSync
	movew	%d0,%fp@(-172)
	tstw	%d0
	bnes	.L10006b96
	movel	%a3@(20),%d0
	cmpl	%fp@(-80),%d0
	beqs	.L10006bee

.L10006b96:
	movel	%a2,%sp@-
	jsr	%pc@(sub_100066b4)
	addqw	#4,%sp
	moveal	%fp@(-32),%a0
	moveb	%a0@,%d0
	moveq	#2,%d1
	cmpb	%d1,%d0
	bnes	.L10006bb8
	movel	%fp@(-28),%fp@(-48)
	moveal	%fp@(-24),%a0
	movel	%a0@,%d3
	bras	.L10006bc4

.L10006bb8:
	moveq	#0,%d0
	movel	%d0,%fp@(-48)
	moveal	%fp@(-20),%a0
	movel	%a0@,%d3

.L10006bc4:
	moveal	%fp@(-16),%a0
	moveb	%a0@,%d0
	extw	%d0
	movew	%d0,%sp@-
	movel	%fp@(-48),%sp@-
	clrl	%sp@-
	movel	%d3,%sp@-
	moveal	%fp@(-12),%a0
	movew	%a0@,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10006630)
	lea	%sp@(20),%sp
	movew	%d0,%fp@(-172)
	moveal	%a2@,%a3
	bras	.L10006bf0

.L10006bee:
	moveal	%a3@,%a3

.L10006bf0:
	movel	%a3,%d0
	bnew	.L10006b00
	moveal	%fp@(-8),%a0
	movel	%a0@,%d0
	movel	%d0,%a4@(60)
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	movel	%d0,%a4@(64)

.L10006c0a:
	moveal	%a4@,%a4

.L10006c0c:
	movel	%a4,%d0
	bnew	.L10006a9c

.L10006c12:
	movel	%fp@(-160),%d0
	bnes	.L10006c20
	movew	#-2804,%fp@(-172)
	bras	.L10006c64

.L10006c20:
	moveal	%fp@(-44),%a2
	moveb	%a2@(8),%d0
	moveq	#2,%d1
	cmpb	%d1,%d0
	bnes	.L10006c38
	moveq	#12,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-48)
	bras	.L10006c3e

.L10006c38:
	moveq	#0,%d0
	movel	%d0,%fp@(-48)

.L10006c3e:
	movel	%fp@(12),%sp@-
	movel	%fp@(-48),%sp@-
	movel	%fp@(-160),%sp@-
	movel	%fp@(-164),%sp@-
	jsr	%pc@(sub_100068f4)
	lea	%sp@(16),%sp
	movew	%d0,%fp@(-172)
	tstw	%d0
	beqs	.L10006c64
	movew	#-2804,%fp@(-172)

.L10006c64:
	movew	%fp@(-172),%d0
	movew	%d0,%fp@(32)

.L10006c6c:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(24),%sp
	jmp	%a0@

sub_10006c7a:
	linkw	%fp,#-276
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	tstb	%a4@(65)
	bnew	.L10006d90
	moveb	#1,%a4@(65)
	moveal	%a4@(48),%a2
	movel	%a2,%d0
	beqw	.L10006d90
	tstl	%a2@
	beqw	.L10006d90
	movel	%a4@(92),%d3
	moveal	%d3,%a0
	lea	%fp@(-270),%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData
	movel	%a4@(32),%d0
	movel	%d0,%fp@(-274)
	movew	%a4@(26),%d0
	movew	%d0,%fp@(-276)
	subqw	#2,%sp
	moveal	%a4@(48),%a0
	movel	%a0@,%sp@-
	pea	%fp@(-276)
	pea	%fp@(-132)
	pea	%fp@(-116)
	jsr	%pc@(FragGetAppLocator)
	movew	%sp@+,%d0
	bnew	.L10006d90
	moveal	%fp@(-116),%a0
	tstw	%a0@(20)
	beqw	.L10006d90
	moveq	#108,%d3
	movel	%d3,%sp@-
	pea	%fp@(-112)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movel	%a4@(92),%d0
	movel	%d0,%fp@(-94)
	movew	%a4@(26),%d0
	movew	%d0,%fp@(-90)
	movel	%a4@(32),%d0
	movel	%d0,%fp@(-64)
	moveal	%fp@(-116),%a0
	movew	%a0@(20),%d0
	extl	%d0
	movel	%d0,%sp@-
	movel	#1634494835,%sp@-
	pea	%fp@(-112)
	jsr	%pc@(sub_100061b0)
	lea	%sp@(12),%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L10006d90
	subqw	#2,%sp
	pea	%fp@(-276)
	movel	%a3,%sp@-
	pea	%fp@(-204)
	pea	%fp@(-4)
	moveq	#3,%d0
	_AliasDispatch
	movew	%sp@+,%d4
	moveal	%a3,%a0
	_DisposeHandle
	tstw	%d4
	bnes	.L10006d90
	movel	%d3,%sp@-
	pea	%fp@(-112)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	lea	%fp@(-198),%a0
	movel	%a0,%fp@(-94)
	movew	%fp@(-204),%fp@(-90)
	movel	%fp@(-202),%fp@(-64)
	lea	%fp@(-112),%a0
	_PBGetCatInfoSync
	tstw	%d0
	bnes	.L10006d90
	moveb	%fp@(-82),%d0
	moveq	#16,%d1
	andb	%d1,%d0
	bnes	.L10006d92

.L10006d90:
	bras	.L10006d9e

.L10006d92:
	movew	%fp@(-204),%a4@(66)
	movel	%fp@(-64),%a4@(68)

.L10006d9e:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10006da6:
	linkw	%fp,#-344
	moveml	%d3-%d7/%a2-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	pea	%fp@(-344)
	movel	%fp@(16),%sp@-
	jsr	%pc@(sub_10002fc8)
	addqw	#8,%sp
	movel	%d0,%fp@(-84)
	tstl	%d0
	beqw	.L10007074
	moveal	%fp@(12),%a0
	moveq	#24,%d1
	addal	%d1,%a0
	movel	%a0,%fp@(-44)
	moveal	%fp@(20),%a2
	addqw	#4,%a2
	movel	%a2,%fp@(-40)
	moveal	%d0,%a0
	moveq	#92,%d1
	addal	%d1,%a0
	movel	%a0,%fp@(-36)
	moveal	%fp@(20),%a0
	addqw	#2,%a0
	movel	%a0,%fp@(-32)
	moveal	%fp@(20),%a0
	addqw	#8,%a0
	movel	%a0,%fp@(-28)
	moveal	%d0,%a0
	moveq	#48,%d1
	addal	%d1,%a0
	movel	%a0,%fp@(-24)
	moveal	%d0,%a0
	moveq	#66,%d1
	addal	%d1,%a0
	movel	%a0,%fp@(-20)
	moveal	%d0,%a0
	moveq	#68,%d3
	addal	%d3,%a0
	movel	%a0,%fp@(-16)
	moveal	%a4,%a0
	addal	%d3,%a0
	movel	%a0,%fp@(-12)
	moveal	%d0,%a2
	addqw	#8,%a2
	movel	%a2,%fp@(-64)
	moveal	%d0,%a3
	moveq	#12,%d0
	addal	%d0,%a3
	movel	%a3,%fp@(-56)
	movel	%a2,%fp@(-8)
	movel	%a3,%fp@(-4)

.L10006e40:
	clrb	%d3
	moveb	%d3,%fp@(-88)
	moveal	%fp@(8),%a0
	addql	#1,%a0@
	movel	%a0@,%d0
	subql	#1,%d0
	tstl	%d0
	beqs	.L10006e76
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10006eb8
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqw	.L10006f42
	moveq	#3,%d1
	cmpl	%d1,%d0
	beqw	.L10006f8e
	moveq	#4,%d1
	cmpl	%d1,%d0
	beqw	.L10006fce
	braw	.L10007012

.L10006e76:
	moveal	%fp@(20),%a2
	tstw	%a2@
	beqs	.L10006eb2
	moveal	%fp@(-44),%a0
	moveb	#1,%a0@
	moveb	%d3,%fp@(-87)
	movew	%a2@,%d0
	movew	%d0,%fp@(-96)
	moveal	%fp@(-40),%a0
	movel	%a0@,%d1
	movel	%d1,%fp@(-92)
	moveq	#0,%d2
	movel	%d2,%fp@(-72)
	movel	%d1,%sp@-
	movew	%d0,%sp@-
	jsr	%pc@(sub_100066e6)
	addqw	#6,%sp
	movel	%d0,%fp@(-340)
	braw	.L1000701e

.L10006eb2:
	moveal	%fp@(8),%a0
	addql	#1,%a0@

.L10006eb8:
	moveal	%fp@(-36),%a2
	tstl	%a2@
	bnes	.L10006f04
	cmpil	#1,%fp@(16)
	beqs	.L10006f04
	movel	#1869815840,%d0
	lea	%fp@(-68),%a1
	_Gestalt
	movel	%a0,%a1@
	movew	%d0,%fp@(-344)
	tstw	%d0
	bnes	.L10006ee6
	movel	#2320,%a2@

.L10006ee6:
	moveal	%fp@(-36),%a2
	tstl	%a2@
	beqs	.L10006f04
	moveal	%fp@(-84),%a0
	moveal	%a0@(92),%a0
	moveb	%a0@,%d3
	beqs	.L10006f00
	moveq	#31,%d0
	cmpb	%d0,%d3
	blss	.L10006f04

.L10006f00:
	moveq	#0,%d0
	movel	%d0,%a2@

.L10006f04:
	moveal	%fp@(-36),%a2
	tstl	%a2@
	beqs	.L10006f3c
	moveal	%fp@(-44),%a0
	moveb	#1,%a0@
	clrb	%fp@(-87)
	moveal	%fp@(-32),%a0
	movew	%a0@,%d0
	movew	%d0,%fp@(-96)
	moveal	%fp@(-28),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-92)
	movel	%a2@,%d0
	movel	%d0,%fp@(-72)
	movel	%fp@(-24),%fp@(-340)
	braw	.L1000701e

.L10006f3c:
	moveal	%fp@(8),%a0
	addql	#1,%a0@

.L10006f42:
	movel	%fp@(-84),%sp@-
	jsr	%pc@(sub_10006c7a)
	addqw	#4,%sp
	moveal	%fp@(-20),%a2
	tstw	%a2@
	beqs	.L10006f88
	moveal	%fp@(-44),%a0
	moveb	#1,%a0@
	clrb	%fp@(-87)
	movew	%a2@,%d0
	movew	%d0,%fp@(-96)
	moveal	%fp@(-16),%a0
	movel	%a0@,%d1
	movel	%d1,%fp@(-92)
	moveq	#0,%d2
	movel	%d2,%fp@(-72)
	movel	%d1,%sp@-
	movew	%d0,%sp@-
	jsr	%pc@(sub_100066e6)
	addqw	#6,%sp
	movel	%d0,%fp@(-340)
	braw	.L1000701e

.L10006f88:
	moveal	%fp@(8),%a0
	addql	#1,%a0@

.L10006f8e:
	moveal	%fp@(-32),%a2
	tstw	%a2@
	beqs	.L10006fc8
	moveal	%fp@(-44),%a0
	moveb	#1,%a0@
	clrb	%fp@(-87)
	movew	%a2@,%d0
	movew	%d0,%fp@(-96)
	moveal	%fp@(-28),%a0
	movel	%a0@,%d1
	movel	%d1,%fp@(-92)
	moveq	#0,%d2
	movel	%d2,%fp@(-72)
	movel	%d1,%sp@-
	movew	%d0,%sp@-
	jsr	%pc@(sub_100066e6)
	addqw	#6,%sp
	movel	%d0,%fp@(-340)
	bras	.L1000701e

.L10006fc8:
	moveal	%fp@(8),%a0
	addql	#1,%a0@

.L10006fce:
	subqw	#2,%sp
	movew	#-32768,%sp@-
	movel	#1702392942,%sp@-
	clrb	%sp@-
	pea	%fp@(-96)
	pea	%fp@(-92)
	moveq	#0,%d0
	_AliasDispatch
	movew	%sp@+,%d0
	movew	%d0,%fp@(-344)
	tstw	%d0
	bnes	.L1000700c
	movel	%fp@(-12),%fp@(-340)
	moveq	#0,%d0
	movel	%d0,%fp@(-72)
	moveal	%fp@(-44),%a0
	clrb	%a0@
	moveb	#1,%fp@(-87)
	bras	.L1000701e

.L1000700c:
	moveal	%fp@(8),%a0
	addql	#1,%a0@

.L10007012:
	movew	#-2804,%d0
	movew	%d0,%fp@(32)
	jmp	%pc@(.L1000743a)

.L1000701e:
	moveq	#108,%d0
	movel	%d0,%sp@-
	pea	%fp@(-204)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveb	%fp@(-87),%d0
	moveq	#0,%d7
	moveb	%d0,%d7
	moveal	%fp@(-340),%a2
	addqw	#8,%a2
	movel	%a2,%fp@(-60)
	moveal	%fp@(-340),%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-52)

.L1000704a:
	moveal	%fp@(-340),%a2
	tstl	%a2@
	bnes	.L100070a0
	clrw	%sp@-
	movel	%fp@(-72),%sp@-
	movel	%d7,%sp@-
	movel	%fp@(-92),%sp@-
	movew	%fp@(-96),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10006630)
	lea	%sp@(20),%sp
	movew	%d0,%fp@(-344)
	tstw	%d0
	beqs	.L10007080

.L10007074:
	movew	%fp@(-344),%d0
	movew	%d0,%fp@(32)
	jmp	%pc@(.L1000743a)

.L10007080:
	moveal	%fp@(-64),%a0
	movel	%a0@,%d0
	moveal	%fp@(-60),%a0
	movel	%d0,%a0@
	moveal	%fp@(-56),%a0
	movel	%a0@,%d0
	moveal	%fp@(-52),%a0
	movel	%d0,%a0@
	moveb	#1,%fp@(-88)
	bras	.L100070ca

.L100070a0:
	moveal	%fp@(-60),%a0
	moveal	%a0@,%a0
	moveal	%fp@(-64),%a1
	moveal	%a1@,%a1
	cmpal	%a1,%a0
	bnes	.L100070ca
	moveal	%fp@(-340),%a0
	moveal	%a0@(12),%a0
	moveal	%fp@(-84),%a1
	moveal	%a1@(12),%a1
	cmpal	%a1,%a0
	bnes	.L100070ca
	moveb	#1,%fp@(-88)

.L100070ca:
	moveq	#0,%d3
	movel	%d3,%fp@(-80)
	movel	%d3,%fp@(-76)
	moveal	%fp@(-340),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-336)
	braw	.L100072c0

.L100070e2:
	moveal	%fp@(-336),%a2
	movel	%a2@(8),%d0
	moveq	#-1,%d1
	cmpl	%d1,%d0
	bnew	.L10007174
	moveb	%fp@(-88),%d0
	bnew	.L100072b6
	moveq	#122,%d0
	movel	%d0,%sp@-
	pea	%fp@(-328)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movew	%a2@(24),%d0
	movew	%d0,%fp@(-306)
	lea	%fp@(-328),%a0
	_PBHGetVInfoSync
	movew	%d0,%fp@(-344)
	tstw	%d0
	bnes	.L10007146
	moveq	#0,%d0
	movel	%d0,%fp@(-186)
	movew	%a2@(24),%d0
	movew	%d0,%fp@(-182)
	movel	%a2@(12),%d0
	movel	%d0,%fp@(-156)
	moveq	#-1,%d0
	movew	%d0,%fp@(-176)
	lea	%fp@(-204),%a0
	_PBGetCatInfoSync
	movew	%d0,%fp@(-344)

.L10007146:
	movew	%fp@(-344),%d0
	bnes	.L10007166
	moveal	%fp@(-336),%a2
	movel	%a2@(28),%d0
	cmpl	%fp@(-298),%d0
	bnes	.L10007166
	movel	%a2@(20),%d0
	cmpl	%fp@(-128),%d0
	beqw	.L100072b6

.L10007166:
	movel	%fp@(-340),%sp@-
	jsr	%pc@(sub_100066b4)
	addqw	#4,%sp
	braw	.L1000704a

.L10007174:
	moveal	%fp@(-336),%a2
	movel	%a2@(8),%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnew	.L100072b6
	movel	%a2@(28),%d6
	moveq	#32,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-332)
	moveal	%fp@(-336),%a0
	moveq	#20,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-48)
	braw	.L100072aa

.L100071a0:
	moveal	%fp@(-332),%a2
	moveb	%a2@(22),%d3
	moveq	#1,%d0
	cmpb	%d0,%d3
	beqs	.L100071b4
	tstb	%d3
	bnew	.L1000729c

.L100071b4:
	moveb	%a2@(42),%d3
	moveq	#63,%d0
	cmpb	%d0,%d3
	bhiw	.L1000729c
	moveal	%fp@(28),%a3
	moveb	%a3@,%d4
	cmpb	%d4,%d3
	bnew	.L1000729c
	moveal	%fp@(24),%a4
	movel	%a4@,%d3
	cmpil	#1061109567,%d3
	beqs	.L100071e2
	movel	%a2@,%d0
	cmpl	%d3,%d0
	bnew	.L1000729c

.L100071e2:
	movel	%a2@(4),%d0
	movel	%a4@(12),%d1
	cmpl	%d1,%d0
	bnew	.L1000729c
	moveq	#0,%d0
	moveb	%d4,%d0
	movel	%d0,%sp@-
	addqw	#1,%a3
	movel	%a3,%sp@-
	moveq	#43,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	jsr	%pc@(sub_100057aa)
	lea	%sp@(12),%sp
	tstl	%d0
	beqw	.L1000729c
	moveal	%fp@(-332),%a0
	movel	%a0@(12),%sp@-
	movel	%a0@(8),%sp@-
	movel	%a4@(8),%sp@-
	movel	%a4@(4),%sp@-
	jsr	%pc@(sub_10005fb6)
	lea	%sp@(16),%sp
	tstw	%d0
	bnes	.L1000729c
	movel	%fp@(-80),%d0
	bnes	.L10007242
	movel	%fp@(-336),%fp@(-80)
	movel	%fp@(-332),%fp@(-76)
	bras	.L1000729c

.L10007242:
	moveal	%fp@(-332),%a2
	movel	%a2@(8),%d3
	moveq	#-1,%d4
	cmpl	%d4,%d3
	beqs	.L10007260
	moveal	%fp@(-76),%a0
	movel	%a0@(8),%d5
	cmpl	%d4,%d5
	beqs	.L10007260
	cmpl	%d5,%d3
	bnes	.L1000727e

.L10007260:
	moveal	%fp@(-48),%a0
	movel	%a0@,%d0
	moveal	%fp@(-80),%a0
	movel	%a0@(20),%d1
	cmpl	%d1,%d0
	blss	.L1000729c
	movel	%fp@(-336),%fp@(-80)
	movel	%a2,%fp@(-76)
	bras	.L1000729c

.L1000727e:
	moveal	%fp@(-332),%a2
	movel	%a2@(8),%d0
	moveal	%fp@(-76),%a0
	movel	%a0@(8),%d1
	cmpl	%d1,%d0
	blss	.L1000729c
	movel	%fp@(-336),%fp@(-80)
	movel	%a2,%fp@(-76)

.L1000729c:
	moveal	%fp@(-332),%a0
	movew	%a0@(40),%d0
	extl	%d0
	addl	%d0,%fp@(-332)

.L100072aa:
	subql	#1,%d6
	cmpil	#0,%d6
	bplw	.L100071a0

.L100072b6:
	moveal	%fp@(-336),%a0
	movel	%a0@,%d0
	movel	%d0,%fp@(-336)

.L100072c0:
	movel	%fp@(-336),%d0
	bnew	.L100070e2
	moveb	%fp@(-88),%d0
	bnes	.L100072e6
	moveal	%fp@(-8),%a0
	movel	%a0@,%d0
	moveal	%fp@(-340),%a2
	movel	%d0,%a2@(8)
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	movel	%d0,%a2@(12)

.L100072e6:
	movel	%fp@(-80),%d0
	beqw	.L10006e40
	moveal	%fp@(-76),%a2
	movel	%a2@(8),%d0
	moveal	%fp@(12),%a3
	movel	%d0,%a3@(16)
	movel	%a2@(12),%d0
	movel	%d0,%a3@(20)
	moveb	%a2@(23),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	movel	%d0,%a3@
	tstl	%d0
	beqs	.L10007324
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10007358
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10007358
	braw	.L100073ae

.L10007324:
	moveal	%fp@(-76),%a2
	movel	%a2@(24),%d0
	moveal	%fp@(12),%a3
	movel	%d0,%a3@(4)
	movel	%a2@(28),%d0
	andil	#2147483647,%d0
	movel	%d0,%a3@(8)
	movel	%a2@(28),%d0
	moveq	#1,%d1
	andb	%d1,%d0
	moveb	%d0,%a3@(12)
	clrw	%d0
	movew	%d0,%fp@(32)
	jmp	%pc@(.L1000743a)

.L10007358:
	moveal	%fp@(-80),%a2
	movew	%a2@(24),%d0
	moveal	%fp@(12),%a3
	moveal	%a3@(4),%a0
	movew	%d0,%a0@
	movel	%a2@(12),%d0
	moveal	%a3@(4),%a0
	movel	%d0,%a0@(2)
	movel	%a3@,%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnes	.L10007394
	moveal	%fp@(-76),%a2
	movel	%a2@(24),%d0
	movel	%d0,%a3@(8)
	movel	%a2@(28),%d0
	movel	%d0,%a3@(12)
	bras	.L100073ba

.L10007394:
	moveal	%fp@(-76),%a2
	movel	%a2@(24),%d0
	moveal	%fp@(12),%a3
	movel	%d0,%a3@(8)
	movel	%a2@(28),%d0
	movew	%d0,%a3@(12)
	bras	.L100073ba

.L100073ae:
	movew	#-2819,%d0
	movew	%d0,%fp@(32)
	jmp	%pc@(.L1000743a)

.L100073ba:
	moveal	%fp@(-80),%a2
	movew	%a2@(24),%d0
	movew	%d0,%fp@(-182)
	movel	%a2@(12),%d0
	movel	%d0,%fp@(-156)
	movel	%a2@(16),%d0
	movew	%d0,%fp@(-176)
	moveal	%fp@(12),%a2
	moveal	%a2@(4),%a0
	addqw	#6,%a0
	movel	%a0,%fp@(-186)
	movel	%fp@(-72),%d0
	beqs	.L10007406
	movel	%fp@(-72),%fp@(-186)
	moveal	%fp@(-72),%a0
	moveal	%a2@(4),%a1
	addqw	#6,%a1
	moveb	%a0@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData
	bras	.L1000742e

.L10007406:
	moveal	%fp@(-80),%a2
	movew	%a2@(26),%d3
	beqs	.L1000742e
	movew	%d3,%d0
	extl	%d0
	addl	%a2,%d0
	moveal	%d0,%a3
	moveal	%a3,%a0
	moveal	%fp@(12),%a1
	moveal	%a1@(4),%a1
	addqw	#6,%a1
	moveb	%a3@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addql	#1,%d0
	_BlockMoveData

.L1000742e:
	lea	%fp@(-204),%a0
	_PBGetCatInfoSync
	movew	%d0,%fp@(32)

.L1000743a:
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(24),%sp
	jmp	%a0@

sub_10007448:
	braw	sub_10008e6e

sub_1000744c:
	braw	sub_10008dfc

local_SearchProc:
	linkw	%fp,#-328
	moveml	%d3-%d5/%a2-%a4,%sp@-
	moveal	%fp@(12),%a4
	moveal	%a4,%a2
	addqw	#4,%a2
	movel	%a2@,%d0
	movel	%d0,%fp@(-328)
	moveal	%fp@(8),%a3
	movel	%a3@,%d1
	moveq	#5,%d3
	cmpl	%d3,%d1
	bgew	.L1000774c
	subqw	#2,%sp
	movel	%fp@(28),%sp@-
	movel	%fp@(24),%sp@-
	movel	%fp@(20),%sp@-
	movel	%fp@(16),%sp@-
	movel	%a4,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_10006da6)
	movew	%sp@+,%d4
	movel	%a3@,%d0
	cmpl	%d3,%d0
	bltw	.L10007744
	movew	%d4,%d0
	seq	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveb	%d0,%fp@(-226)
	lea	%fp@(-296),%a0
	movel	%a0,%fp@(-320)
	moveq	#0,%d1
	movel	%d1,%fp@(-224)
	subqw	#2,%sp
	movel	%fp@(28),%sp@-
	movel	%fp@(24),%sp@-
	movel	%fp@(20),%sp@-
	movel	%fp@(16),%sp@-
	pea	%fp@(-324)
	pea	%fp@(-224)
	jsr	%pc@(sub_10006a26)
	movew	%sp@+,%d0
	bnew	.L10007600
	movel	%fp@(-324),%d0
	beqw	.L10007752
	moveb	%fp@(-226),%d0
	bnes	.L10007514
	moveb	#1,%fp@(-226)
	lea	%fp@(-324),%a0
	moveal	%a4,%a1
	moveq	#6,%d0

.L100074f4:
	movel	%a0@+,%a1@+
	dbf	%d0,.L100074f4
	lea	%fp@(-296),%a0
	moveal	%fp@(-328),%a1
	moveq	#16,%d0

.L10007504:
	movel	%a0@+,%a1@+
	dbf	%d0,.L10007504
	movew	%a0@,%a1@
	movel	%fp@(-328),%a2@
	braw	.L10007600

.L10007514:
	movel	%a4@(16),%d3
	movel	%fp@(-308),%d4
	cmpl	%d4,%d3
	beqs	.L1000755a
	moveq	#-1,%d5
	cmpl	%d5,%d3
	beqs	.L1000755a
	cmpl	%d5,%d4
	beqs	.L1000755a
	cmpl	%d4,%d3
	bccw	.L10007600
	lea	%fp@(-324),%a0
	moveal	%a4,%a1
	moveq	#6,%d0

.L10007538:
	movel	%a0@+,%a1@+
	dbf	%d0,.L10007538
	lea	%fp@(-296),%a0
	moveal	%fp@(-328),%a2
	moveq	#16,%d0

.L10007548:
	movel	%a0@+,%a2@+
	dbf	%d0,.L10007548
	movew	%a0@,%a2@
	movel	%fp@(-328),%a4@(4)
	braw	.L10007600

.L1000755a:
	moveq	#108,%d0
	movel	%d0,%sp@-
	pea	%fp@(-220)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveal	%a4,%a2
	addqw	#4,%a2
	moveal	%a2@,%a0
	movew	%a0@,%d0
	movew	%d0,%fp@(-198)
	moveal	%a2@,%a0
	movel	%a0@(2),%d0
	movel	%d0,%fp@(-172)
	moveal	%a2@,%a0
	addqw	#6,%a0
	movel	%a0,%fp@(-202)
	lea	%fp@(-220),%a0
	_PBGetCatInfoSync
	movew	%d0,%d4
	beqs	.L10007598
	moveq	#0,%d0
	movel	%d0,%fp@(-144)

.L10007598:
	movel	%fp@(-144),%d3
	moveq	#108,%d0
	movel	%d0,%sp@-
	pea	%fp@(-220)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveal	%fp@(-320),%a2
	movew	%a2@,%d0
	movew	%d0,%fp@(-198)
	movel	%a2@(2),%d0
	movel	%d0,%fp@(-172)
	addqw	#6,%a2
	movel	%a2,%fp@(-202)
	lea	%fp@(-220),%a0
	_PBGetCatInfoSync
	movew	%d0,%d4
	beqs	.L100075d4
	moveq	#0,%d0
	movel	%d0,%fp@(-144)

.L100075d4:
	cmpl	%fp@(-144),%d3
	bccs	.L10007600
	lea	%fp@(-324),%a0
	moveal	%a4,%a2
	moveq	#6,%d0

.L100075e2:
	movel	%a0@+,%a2@+
	dbf	%d0,.L100075e2
	lea	%fp@(-296),%a0
	moveal	%fp@(-328),%a2
	moveq	#16,%d0

.L100075f2:
	movel	%a0@+,%a2@+
	dbf	%d0,.L100075f2
	movew	%a0@,%a2@
	movel	%fp@(-328),%a4@(4)

.L10007600:
	moveq	#0,%d0
	movel	%d0,%fp@(-224)
	moveal	%a4,%a2
	moveq	#16,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-4)
	moveal	%a4,%a3
	addqw	#4,%a3
	braw	.L10007710

.L10007618:
	movel	%fp@(-324),%d0
	bnew	.L10007710
	moveb	%fp@(-226),%d0
	bnes	.L1000763e
	moveb	#1,%fp@(-226)
	lea	%fp@(-324),%a0
	moveal	%a4,%a1
	moveq	#6,%d0

.L10007634:
	movel	%a0@+,%a1@+
	dbf	%d0,.L10007634
	braw	.L10007710

.L1000763e:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d3
	movel	%fp@(-308),%d4
	cmpl	%d4,%d3
	beqs	.L10007672
	movel	%a4@(16),%d0
	moveq	#-1,%d5
	cmpl	%d5,%d0
	beqs	.L10007672
	cmpl	%d5,%d4
	beqs	.L10007672
	cmpl	%d4,%d3
	bccw	.L10007710
	lea	%fp@(-324),%a0
	moveal	%a4,%a1
	moveq	#6,%d0

.L10007668:
	movel	%a0@+,%a1@+
	dbf	%d0,.L10007668
	braw	.L10007710

.L10007672:
	moveq	#0,%d4
	moveq	#0,%d5
	tstl	%a4@
	beqs	.L100076b0
	moveq	#108,%d0
	movel	%d0,%sp@-
	pea	%fp@(-112)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveal	%a3@,%a0
	movew	%a0@,%d0
	movew	%d0,%fp@(-90)
	moveal	%a3@,%a0
	movel	%a0@(2),%d0
	movel	%d0,%fp@(-64)
	moveal	%a3@,%a0
	addqw	#6,%a0
	movel	%a0,%fp@(-94)
	lea	%fp@(-112),%a0
	_PBGetCatInfoSync
	movel	%fp@(-36),%d4
	bras	.L100076d6

.L100076b0:
	moveal	%a3@,%a2
	movel	%a2@,%d0
	cmpil	#1248819489,%d0
	bnes	.L100076d6
	movel	%a2@(4),%d0
	cmpil	#1885693542,%d0
	bnes	.L100076d6
	movel	%a2@(12),%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnes	.L100076d6
	movel	%a2@(16),%d4

.L100076d6:
	moveal	%fp@(-320),%a2
	movel	%a2@,%d0
	cmpil	#1248819489,%d0
	bnes	.L100076fe
	movel	%a2@(4),%d0
	cmpil	#1885693542,%d0
	bnes	.L100076fe
	movel	%a2@(12),%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnes	.L100076fe
	movel	%a2@(16),%d5

.L100076fe:
	cmpl	%d5,%d4
	bccs	.L10007710
	lea	%fp@(-324),%a0
	moveal	%a4,%a1
	moveq	#6,%d0

.L1000770a:
	movel	%a0@+,%a1@+
	dbf	%d0,.L1000770a

.L10007710:
	lea	%fp@(-296),%a0
	movel	%a0,%fp@(-320)
	subqw	#2,%sp
	movel	%fp@(28),%sp@-
	movel	%fp@(24),%sp@-
	movel	%fp@(20),%sp@-
	movel	%fp@(16),%sp@-
	pea	%fp@(-324)
	pea	%fp@(-224)
	jsr	%pc@(sub_1000600a)
	movew	%sp@+,%d4
	beqw	.L10007618
	moveb	%fp@(-226),%d0
	beqs	.L1000774c

.L10007742:
	clrw	%d4

.L10007744:
	movew	%d4,%d0
	movew	%d0,%fp@(32)
	bras	.L1000775e

.L1000774c:
	movew	#-2804,%d4
	bras	.L10007744

.L10007752:
	moveb	%fp@(-226),%d0
	bnes	.L10007742
	movew	#-2804,%d4
	bras	.L10007744

.L1000775e:
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(24),%sp
	jmp	%a0@

j_local_numtostring:
	braw	local_numtostring

sub_10007770:
	linkw	%fp,#-188
	moveml	%d3-%d6/%a2-%a4,%sp@-
	movel	%fp@(20),%d6
	moveq	#0,%d0
	moveal	%d0,%a4
	moveq	#24,%d3
	movel	%d3,%sp@-
	pea	%fp@(-76)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveal	%fp@(12),%a2
	movel	%a2@(24),%d0
	movel	%d0,%fp@(-76)
	movel	%a2@(28),%d0
	movel	%d0,%fp@(-64)
	movel	%a2@(36),%d0
	movel	%d0,%fp@(-72)
	movel	%a2@(40),%d0
	movel	%d0,%fp@(-68)
	moveal	%fp@(8),%a3
	movew	%a3@(24),%d0
	movew	%d0,%fp@(-88)
	movel	%a3@(28),%d0
	movel	%d0,%fp@(-84)
	movew	%a3@(26),%d0
	movew	%d0,%fp@(-86)
	movel	%a3@(32),%d0
	movel	%d0,%fp@(-80)
	moveq	#0,%d0
	movel	%d0,%fp@(-188)
	movel	%a2@,%d0
	movel	%d0,%fp@(-96)
	movel	%a2@(4),%d0
	movel	%d0,%fp@(-92)
	addqw	#4,%a2
	movel	%a2,%fp@(-24)
	addqw	#8,%a3
	movel	%a3,%fp@(-20)
	moveal	%fp@(12),%a0
	addqw	#8,%a0
	movel	%a0,%fp@(-16)
	moveal	%fp@(12),%a0
	moveq	#32,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-12)
	moveal	%fp@(12),%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveal	%fp@(12),%a0
	moveq	#28,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)

.L10007824:
	lea	%fp@(-184),%a0
	movel	%a0,%fp@(-48)
	subqw	#2,%sp
	moveal	%fp@(-24),%a0
	movel	%a0@,%sp@-
	pea	%fp@(-76)
	pea	%fp@(-88)
	moveal	%fp@(-20),%a0
	movel	%a0@,%sp@-
	pea	%fp@(-52)
	pea	%fp@(-188)
	moveal	%fp@(24),%a0
	jsr	%a0@
	movew	%sp@+,%d3
	beqs	.L1000785e
	moveal	%fp@(28),%a0
	movew	%d3,%a0@
	braw	.L10007962

.L1000785e:
	lea	%fp@(-52),%a0
	moveal	%fp@(-16),%a2
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	moveal	%fp@(-12),%a0
	moveb	%fp@(-28),%a0@
	moveal	%fp@(-16),%a0
	movel	%a0@,%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L1000788e
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L1000788e
	tstl	%d0
	beqs	.L100078b0
	bras	.L100078d8

.L1000788e:
	lea	%fp@(-178),%a0
	moveal	%fp@(12),%a1
	movel	%a0,%a1@
	moveb	%fp@(-178),%d3
	moveq	#63,%d0
	cmpb	%d0,%d3
	bccs	.L100078de
	moveq	#0,%d0
	moveb	%d3,%d0
	lea	%fp@(-177),%a0
	clrb	%a0@(%d0:w)
	bras	.L100078de

.L100078b0:
	moveb	#9,%fp@(-112)
	moveb	#94,%fp@(-111)
	pea	%fp@(-110)
	moveal	%fp@(-8),%a0
	movel	%a0@,%sp@-
	jsr	%pc@(sub_1000338e)
	addqw	#8,%sp
	lea	%fp@(-112),%a0
	moveal	%fp@(12),%a1
	movel	%a0,%a1@
	bras	.L100078de

.L100078d8:
	moveq	#0,%d0
	jmp	%pc@(.L10007972)

.L100078de:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	bles	.L100078f2
	moveal	%fp@(12),%a0
	movel	%a0@,%d0
	moveal	%fp@(-24),%a0
	movel	%d0,%a0@

.L100078f2:
	movel	%fp@(28),%sp@-
	movel	%d6,%sp@-
	movel	%fp@(16),%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10007e08)
	lea	%sp@(20),%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	beqs	.L1000795c
	movel	%fp@(-36),%d3
	moveq	#-1,%d4
	cmpl	%d4,%d3
	beqs	.L10007928
	movel	%a4@(56),%d5
	cmpl	%d4,%d5
	beqs	.L10007928
	cmpl	%d3,%d5
	bnes	.L1000793c

.L10007928:
	movel	%fp@(-32),%d3
	cmpl	%d4,%d3
	beqs	.L1000795c
	movel	%a4@(60),%d5
	cmpl	%d4,%d5
	beqs	.L1000795c
	cmpl	%d3,%d5
	beqs	.L1000795c

.L1000793c:
	movel	%a4@(100),%d0
	bgts	.L10007958
	movel	%fp@(16),%sp@-
	jsr	%pc@(sub_10007d5e)
	addqw	#4,%sp
	movel	%a4,%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10008612)
	addqw	#8,%sp

.L10007958:
	moveq	#0,%d0
	moveal	%d0,%a4

.L1000795c:
	movel	%a4,%d0
	beqw	.L10007824

.L10007962:
	moveal	%fp@(12),%a2
	movel	%fp@(-96),%a2@
	movel	%fp@(-92),%a2@(4)
	movel	%a4,%d0

.L10007972:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_1000797a:
	braw	sub_1000a38c

sub_1000797e:
	braw	sub_1000a444

sub_10007982:
	linkw	%fp,#-8
	moveml	%d3-%d4/%a2-%a4,%sp@-
	movel	%fp@(20),%d4
	moveal	%fp@(24),%a3
	clrw	%d3
	movew	%d3,%fp@(-8)
	moveq	#0,%d0
	moveal	%d0,%a4
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-4)
	movew	%d3,%a3@
	moveal	%fp@(12),%a0
	moveb	%a0@(34),%d2
	moveq	#0,%d1
	moveb	%d2,%d1
	moveq	#1,%d2
	cmpl	%d2,%d1
	beqs	.L100079c4
	tstl	%d1
	beqs	.L100079e0
	movew	#-2804,%a3@
	moveq	#0,%d0
	bras	.L10007a2e

.L100079c4:
	movel	%a3,%sp@-
	movel	%d4,%sp@-
	movel	%fp@(16),%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10007e08)
	lea	%sp@(20),%sp
	moveal	%d0,%a4
	bras	.L10007a20

.L100079e0:
	moveal	%d0,%a0
	moveal	%a0@(52),%a2
	bras	.L10007a1c

.L100079e8:
	pea	%fp@(-8)
	movel	%a2@(8),%sp@-
	movel	%d4,%sp@-
	movel	%fp@(16),%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10007770)
	lea	%sp@(24),%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L10007a20
	movew	%fp@(-8),%d0
	beqs	.L10007a1a
	tstw	%a3@
	bnes	.L10007a1a
	movew	%fp@(-8),%a3@

.L10007a1a:
	moveal	%a2@,%a2

.L10007a1c:
	movel	%a2,%d0
	bnes	.L100079e8

.L10007a20:
	movel	%a4,%d0
	bnes	.L10007a2c
	tstw	%a3@
	bnes	.L10007a2c
	movew	#-2804,%a3@

.L10007a2c:
	movel	%a4,%d0

.L10007a2e:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10007a36:
	braw	sub_1000a378

sub_10007a3a:
	linkw	%fp,#-108
	moveml	%a2-%a3,%sp@-
	moveal	%fp@(8),%a3
	moveq	#108,%d0
	movel	%d0,%sp@-
	pea	%fp@(-108)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveal	%a3,%a2
	moveq	#24,%d0
	addal	%d0,%a2
	moveal	%a2@,%a0
	addqw	#6,%a0
	movel	%a0,%fp@(-90)
	moveal	%a2@,%a0
	movew	%a0@,%d0
	movew	%d0,%fp@(-86)
	moveal	%a2@,%a0
	movel	%a0@(2),%d0
	movel	%d0,%fp@(-60)
	clrw	%d0
	movew	%d0,%fp@(-80)
	lea	%fp@(-108),%a0
	_PBGetCatInfoSync
	tstw	%d0
	beqs	.L10007a8a
	clrb	%d0
	bras	.L10007aac

.L10007a8a:
	moveb	%fp@(12),%d0
	bnes	.L10007aa4
	movel	%a3@(48),%d0
	cmpl	%fp@(-32),%d0
	beqs	.L10007a9e
	moveq	#0,%d0
	bras	.L10007aa0

.L10007a9e:
	moveq	#1,%d0

.L10007aa0:
	movel	%d0,%d0
	bras	.L10007aac

.L10007aa4:
	movel	%fp@(-32),%a3@(48)
	moveq	#1,%d0

.L10007aac:
	moveml	%sp@+,%a2-%a3
	unlk	%fp
	rts

sub_10007ab4:
	linkw	%fp,#-32
	moveml	%d3-%d6/%a2-%a4,%sp@-
	clrb	%fp@(-7)
	moveal	%fp@(12),%a2
	moveq	#20,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-32)
	moveal	%fp@(12),%a0
	tstb	%a0@(79)
	beqs	.L10007aea
	movel	%a0@(80),%d0
	movel	%d0,%fp@(-28)
	moveal	%fp@(20),%a0
	movel	%d0,%a0@(8)
	braw	.L10007ce6

.L10007aea:
	moveal	%fp@(-32),%a2
	movel	%a2@,%d0
	beqs	.L10007b04
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10007b2e
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqw	.L10007bd2
	braw	.L10007ce0

.L10007b04:
	moveal	%fp@(-32),%a2
	movel	%a2@(4),%d0
	moveal	%fp@(20),%a3
	movel	%d0,%a3@(8)
	movel	%d0,%fp@(-28)
	moveb	%a2@(12),%d0
	moveb	%d0,%a3@(5)
	moveal	%fp@(12),%a0
	movel	%fp@(-28),%a0@(80)
	braw	.L10007ce6

.L10007b2e:
	moveal	%fp@(8),%a2
	moveal	%a2@(40),%a4
	movew	%fp@(18),%d0
	moveq	#64,%d1
	andw	%d1,%d0
	seq	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveb	%d0,%fp@(-8)
	pea	%fp@(-4)
	pea	%fp@(-28)
	pea	%fp@(-24)
	pea	%fp@(-8)
	movel	%a4,%sp@-
	clrl	%sp@-
	clrb	%sp@-
	moveal	%fp@(-32),%a3
	movel	%a3@(12),%d3
	beqs	.L10007b6e
	movel	%d3,%d0
	bras	.L10007b70

.L10007b6e:
	moveq	#-1,%d0

.L10007b70:
	movel	%d0,%sp@-
	movel	%a3@(8),%sp@-
	clrl	%sp@-
	movel	%a3@(4),%sp@-
	movel	%fp@(16),%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10008974)
	lea	%sp@(50),%sp
	movew	%d0,%d4
	bnew	.L10007c8c
	moveal	%fp@(12),%a2
	tstl	%a2@(32)
	bnes	.L10007ba0
	movel	%fp@(-4),%a2@(32)

.L10007ba0:
	moveal	%fp@(20),%a0
	movel	%fp@(-28),%a0@(8)
	moveq	#1,%d3
	moveal	%fp@(12),%a2
	moveb	%d3,%a2@(79)
	movel	%fp@(-28),%a2@(80)
	lea	%fp@(-24),%a0
	moveq	#84,%d0
	addal	%d0,%a2
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	moveb	%d3,%fp@(-7)
	braw	.L10007ce6

.L10007bd2:
	_GetZone
	moveal	%a0,%a3
	subqw	#2,%sp
	moveb	0xa5e,%sp@
	moveb	%sp@+,%d0
	moveq	#0,%d6
	moveb	%d0,%d6
	clrb	%sp@-
	_SetResLoad
	moveal	%fp@(8),%a0
	moveal	%a0@(40),%a0
	_SetZone
	subqw	#4,%sp
	movel	%a2@(8),%sp@-
	movew	%a2@(12),%sp@-
	_GetResource
	moveal	%sp@+,%a4
	movel	%a4,%d0
	beqs	.L10007c06
	tstl	%a4@
	bnes	.L10007c40

.L10007c06:
	moveq	#1,%d0
	moveb	%d0,%sp@-
	_SetResLoad
	subqw	#4,%sp
	movel	%a2@(8),%sp@-
	movew	%a2@(12),%sp@-
	_GetResource
	moveal	%sp@+,%a4
	movel	%a4,%d0
	beqs	.L10007c22
	tstl	%a4@
	bnes	.L10007c30

.L10007c22:
	subqw	#2,%sp
	.short	0xa9af
	movew	%sp@+,%d4
	bnes	.L10007c72
	movew	#-192,%d4
	bras	.L10007c72

.L10007c30:
	subqw	#4,%sp
	movel	%a4,%sp@-
	jsr	%pc@(sub_1000a36a)
	movel	%sp@+,%d5
	movel	%a4,%sp@-
	.short	0xa992
	bras	.L10007c72

.L10007c40:
	moveal	%a4,%a2
	subqw	#4,%sp
	movel	%a4,%sp@-
	jsr	%pc@(sub_1000a36a)
	movel	%sp@+,%d5
	movel	%d5,%d0
	.short	0xa122
	moveal	%a0,%a4
	movel	%a4,%d0
	beqs	.L10007c5a
	tstl	%a4@
	bnes	.L10007c6a

.L10007c5a:
	subqw	#2,%sp
	movew	0x220,%sp@
	movew	%sp@+,%d4
	bnes	.L10007c72
	movew	#-2810,%d4
	bras	.L10007c72

.L10007c6a:
	moveal	%a2@,%a0
	moveal	%a4@,%a1
	movel	%d5,%d0
	_BlockMoveData

.L10007c72:
	moveal	%a3,%a0
	_SetZone
	movew	%d6,%d0
	sne	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveb	%d0,%sp@-
	_SetResLoad
	movel	%a4,%d0
	beqs	.L10007c8c
	tstl	%a4@
	bnes	.L10007c92

.L10007c8c:
	movew	%d4,%d0
	jmp	%pc@(.L10007d56)

.L10007c92:
	moveal	%a4,%a0
	.short	0xa029
	moveal	%fp@(12),%a2
	movel	%d5,%a2@(128)
	moveb	#3,%fp@(-24)
	moveal	%a4,%a0
	.short	0xa126
	movel	%a0,%fp@(-16)
	movel	%a4,%fp@(-12)
	movel	%a4@,%d0
	movel	%d0,%fp@(-28)
	moveal	%fp@(20),%a0
	movel	%d0,%a0@(8)
	moveq	#1,%d3
	moveb	%d3,%a2@(79)
	movel	%fp@(-28),%a2@(80)
	lea	%fp@(-24),%a0
	moveq	#84,%d0
	addal	%d0,%a2
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	movel	%a0@+,%a2@+
	moveb	%d3,%fp@(-7)
	bras	.L10007ce6

.L10007ce0:
	movew	#-2819,%d0
	bras	.L10007d56

.L10007ce6:
	pea	%pc@(sub_100086be)
	pea	%pc@(sub_100086ae)
	moveal	%fp@(20),%a2
	moveb	%a2@(5),%sp@-
	moveal	%fp@(12),%a3
	movel	%a3@(16),%d3
	beqs	.L10007d04
	movel	%d3,%d0
	bras	.L10007d08

.L10007d04:
	movel	%a3@(12),%d0

.L10007d08:
	movel	%d0,%sp@-
	movel	%fp@(-28),%sp@-
	moveal	%fp@(8),%a0
	movel	%a0@(8),%sp@-
	movel	%a2,%sp@-
	moveq	#12,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	jsr	%pc@(sub_10008dfc)
	lea	%sp@(30),%sp
	movew	%d0,%d4
	bnes	.L10007d38
	moveal	%fp@(20),%a0
	moveb	#1,%a0@(4)
	clrw	%d0
	bras	.L10007d56

.L10007d38:
	moveb	%fp@(-7),%d0
	beqs	.L10007d4c
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10007d90)
	addqw	#8,%sp

.L10007d4c:
	moveq	#0,%d0
	moveal	%fp@(20),%a0
	movel	%d0,%a0@
	movew	%d4,%d0

.L10007d56:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_10007d5e:
	linkw	%fp,#0
	movel	%a3,%sp@-
	moveal	%fp@(8),%a3
	tstl	%a3@
	bnes	.L10007d6e
	bras	.L10007d8a

.L10007d6e:
	moveb	%a3@(4),%sp@-
	pea	%pc@(sub_100086be)
	movel	%a3,%sp@-
	moveal	%a3@(12),%a0
	moveal	%a0@(12),%a0
	jsr	%a0@
	lea	%sp@(10),%sp
	moveq	#0,%d0
	movel	%d0,%a3@

.L10007d8a:
	moveal	%sp@+,%a3
	unlk	%fp
	rts

sub_10007d90:
	linkw	%fp,#0
	moveml	%a2-%a3,%sp@-
	moveal	%fp@(12),%a3
	tstb	%a3@(79)
	bnes	.L10007da4
	bras	.L10007dc6

.L10007da4:
	moveal	%a3,%a2
	moveq	#84,%d0
	addal	%d0,%a2
	lea	%a2@(16),%a2
	movel	%a2@-,%sp@-
	movel	%a2@-,%sp@-
	movel	%a2@-,%sp@-
	movel	%a2@-,%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10008d1e)
	lea	%sp@(20),%sp
	clrb	%a3@(79)

.L10007dc6:
	moveml	%sp@+,%a2-%a3
	unlk	%fp
	rts

sub_10007dce:
	linkw	%fp,#0
	moveml	%a2-%a3,%sp@-
	moveal	%fp@(8),%a3
	tstb	%a3@(53)
	beqs	.L10007de4
	clrw	%d0
	bras	.L10007e00

.L10007de4:
	movel	%a3@(60),%sp@-
	movel	%a3@(56),%sp@-
	moveal	%fp@(12),%a2
	movel	%a2@(40),%sp@-
	movel	%a2@(36),%sp@-
	jsr	%pc@(sub_10005fb6)
	lea	%sp@(16),%sp

.L10007e00:
	moveml	%sp@+,%a2-%a3
	unlk	%fp
	rts

sub_10007e08:
	linkw	%fp,#-28
	moveml	%d3-%d6/%a2-%a4,%sp@-
	clrb	%fp@(-28)
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-24)
	clrw	%d1
	moveal	%fp@(24),%a0
	movew	%d1,%a0@
	moveq	#20,%d1
	movel	%d1,%sp@-
	movel	%fp@(16),%sp@-
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveal	%fp@(12),%a2
	moveal	%a2@,%a3
	moveb	%a3@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	movel	%d0,%sp@-
	addqw	#1,%a3
	movel	%a3,%sp@-
	jsr	%pc@(sub_100086ce)
	addqw	#8,%sp
	movel	%d0,%d4
	movel	%d4,%d5
	asrl	#6,%d5
	eorl	%d4,%d5
	moveq	#63,%d0
	andl	%d0,%d5
	movel	%d5,%d0
	asll	#2,%d0
	addl	%fp@(-24),%d0
	moveal	%d0,%a0
	moveal	%a0@(368),%a4
	addqw	#8,%a2
	movel	%a2,%fp@(-20)
	moveal	%fp@(12),%a0
	moveq	#28,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-16)
	moveal	%fp@(12),%a0
	moveq	#24,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-12)
	moveal	%fp@(12),%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveal	%fp@(12),%a0
	moveq	#16,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)
	braw	.L10007ff6

.L10007e9e:
	movel	%a4@(8),%d0
	cmpl	%d4,%d0
	bnew	.L10007ff4
	movel	%a4@(20),%d0
	moveal	%fp@(-20),%a2
	movel	%a2@,%d1
	cmpl	%d1,%d0
	bnew	.L10007ff4
	movel	%a4@(40),%d0
	moveal	%fp@(-16),%a0
	movel	%a0@,%d1
	cmpl	%d1,%d0
	bnew	.L10007ff4
	moveal	%fp@(-12),%a0
	movel	%a0@,%d0
	cmpil	#1061109567,%d0
	beqs	.L10007ee8
	movel	%a4@(36),%d0
	moveal	%fp@(12),%a0
	movel	%a0@(24),%d1
	cmpl	%d1,%d0
	bnew	.L10007ff4

.L10007ee8:
	moveal	%fp@(12),%a0
	moveal	%a0@,%a3
	moveb	%a3@,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	movel	%d0,%sp@-
	addqw	#1,%a3
	movel	%a3,%sp@-
	moveal	%a4@(12),%a0
	addqw	#1,%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_100057aa)
	lea	%sp@(12),%sp
	tstl	%d0
	beqw	.L10007ff4
	tstb	%a4@(79)
	beqs	.L10007f48
	moveb	%a4@(84),%d3
	moveq	#2,%d0
	cmpb	%d0,%d3
	beqs	.L10007f26
	moveq	#3,%d0
	cmpb	%d0,%d3
	bnes	.L10007f48

.L10007f26:
	moveal	%a4@(92),%a0
	moveal	%fp@(8),%a1
	moveal	%a1@(40),%a1
	cmpal	%a1,%a0
	beqs	.L10007f48
	subqw	#4,%sp
	movel	0x2a6,%sp@
	moveal	%sp@+,%a0
	moveal	%a4@(92),%a1
	cmpal	%a1,%a0
	bnew	.L10007ff4

.L10007f48:
	movel	%a2@,%d0
	beqs	.L10007f5c
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10007f78
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10007f78
	braw	.L10007fee

.L10007f5c:
	moveal	%fp@(-8),%a0
	moveal	%a0@,%a0
	moveal	%a4@(24),%a1
	cmpal	%a1,%a0
	beqs	.L10007f6e
	moveq	#0,%d0
	bras	.L10007f70

.L10007f6e:
	moveq	#1,%d0

.L10007f70:
	movel	%d0,%d0
	moveb	%d0,%fp@(-28)
	bras	.L10007fee

.L10007f78:
	moveal	%fp@(-8),%a0
	moveal	%a0@,%a0
	movew	%a0@,%d0
	moveal	%a4@(24),%a2
	movew	%a2@,%d1
	cmpw	%d1,%d0
	bnes	.L10007fee
	moveal	%fp@(12),%a0
	moveal	%a0@(12),%a0
	movel	%a0@(2),%d0
	movel	%a2@(2),%d1
	cmpl	%d1,%d0
	bnes	.L10007fee
	moveal	%fp@(-20),%a0
	movel	%a0@,%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnes	.L10007fc6
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	movel	%a4@(28),%d1
	cmpl	%d1,%d0
	beqs	.L10007fbc
	moveq	#0,%d0
	bras	.L10007fbe

.L10007fbc:
	moveq	#1,%d0

.L10007fbe:
	movel	%d0,%d0
	moveb	%d0,%fp@(-28)
	bras	.L10007fee

.L10007fc6:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	movel	%a4@(28),%d1
	cmpl	%d1,%d0
	bnes	.L10007fe4
	moveal	%fp@(12),%a0
	movew	%a0@(20),%d0
	movew	%a4@(32),%d1
	cmpw	%d1,%d0
	beqs	.L10007fe8

.L10007fe4:
	moveq	#0,%d0
	bras	.L10007fea

.L10007fe8:
	moveq	#1,%d0

.L10007fea:
	moveb	%d0,%fp@(-28)

.L10007fee:
	moveb	%fp@(-28),%d0
	bnes	.L10007ffc

.L10007ff4:
	moveal	%a4@,%a4

.L10007ff6:
	movel	%a4,%d0
	bnew	.L10007e9e

.L10007ffc:
	movel	%a4,%d0
	beqs	.L1000802c
	moveal	%fp@(12),%a0
	movel	%a0@(8),%d3
	moveq	#1,%d0
	cmpl	%d0,%d3
	beqs	.L10008014
	moveq	#2,%d0
	cmpl	%d0,%d3
	bnes	.L1000802c

.L10008014:
	tstb	%a4@(79)
	bnes	.L1000802c
	clrb	%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10007a3a)
	addqw	#6,%sp
	tstb	%d0
	bnes	.L1000802c
	moveq	#0,%d0
	moveal	%d0,%a4

.L1000802c:
	movel	%a4,%d0
	beqs	.L10008052
	moveal	%fp@(12),%a0
	tstb	%a0@(33)
	beqs	.L10008052
	movel	%fp@(12),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10007dce)
	addqw	#8,%sp
	moveal	%fp@(24),%a0
	movew	%d0,%a0@
	tstw	%d0
	bnew	.L100080ee

.L10008052:
	movel	%a4,%d0
	beqs	.L100080ae
	moveal	%fp@(12),%a0
	tstb	%a0@(34)
	bnes	.L100080ae
	tstb	%a4@(54)
	bnes	.L100080ae
	moveal	%fp@(12),%a0
	moveal	%a0@(4),%a0
	moveb	%a0@,%d0
	moveq	#0,%d6
	moveb	%d0,%d6
	addql	#2,%d6
	movel	%d6,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	bnes	.L10008092
	moveal	%fp@(24),%a0
	movew	#-2809,%a0@
	moveq	#0,%d0
	jmp	%pc@(.L10008162)

.L10008092:
	moveal	%fp@(12),%a0
	moveal	%a0@(4),%a0
	moveal	%a3,%a1
	movel	%d6,%d0
	_BlockMoveData
	movel	%a3,%a4@(16)
	moveq	#1,%d3
	moveb	%d3,%a4@(55)
	moveb	%d3,%a4@(54)

.L100080ae:
	movel	%a4,%d0
	bnew	.L10008140
	movel	%fp@(20),%d0
	moveq	#1,%d1
	andl	%d1,%d0
	bnes	.L100080cc
	moveal	%fp@(24),%a0
	movew	#-2817,%a0@
	moveq	#0,%d0
	jmp	%pc@(.L10008162)

.L100080cc:
	movel	%fp@(24),%sp@-
	movel	%fp@(20),%sp@-
	movel	%fp@(16),%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_1000816a)
	lea	%sp@(20),%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L100080f2

.L100080ee:
	moveq	#0,%d0
	bras	.L10008162

.L100080f2:
	movel	%d4,%a4@(8)
	movel	%d5,%d0
	asll	#2,%d0
	addl	%fp@(-24),%d0
	moveal	%d0,%a0
	moveal	%a0@(368),%a2
	movel	%a2,%d0
	beqs	.L1000810c
	movel	%a4,%a2@(4)

.L1000810c:
	movel	%d5,%d0
	asll	#2,%d0
	addl	%fp@(-24),%d0
	moveal	%d0,%a2
	lea	%a2@(368),%a2
	movel	%a2@,%d0
	movel	%d0,%a4@
	movel	%a4,%a2@
	movel	%fp@(16),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10008436)
	addqw	#8,%sp
	movew	%d0,%d3
	bnes	.L10008144
	movel	%fp@(16),%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(sub_10008494)
	addqw	#8,%sp
	movew	%d0,%d3
	bnes	.L10008144

.L10008140:
	movel	%a4,%d0
	bras	.L10008162

.L10008144:
	movel	%fp@(16),%sp@-
	jsr	%pc@(sub_10007d5e)
	addqw	#4,%sp
	movel	%a4,%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10008612)
	addqw	#8,%sp
	moveal	%fp@(24),%a0
	movew	%d3,%a0@
	moveq	#0,%d0

.L10008162:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_1000816a:
	linkw	%fp,#-232
	moveml	%d3-%d6/%a2-%a4,%sp@-
	movel	#200,%sp@-
	pea	%fp@(-232)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveal	%fp@(12),%a2
	movel	%a2@,%d0
	movel	%d0,%fp@(-220)
	movel	%a2@(4),%d0
	movel	%d0,%fp@(-216)
	addqw	#8,%a2
	lea	%fp@(-212),%a0
	movel	%a2@+,%a0@+
	movel	%a2@+,%a0@+
	movel	%a2@+,%a0@+
	movel	%a2@+,%a0@+
	moveal	%fp@(12),%a0
	movel	%a0@(24),%d0
	movel	%d0,%fp@(-196)
	movel	%a0@(28),%d0
	movel	%d0,%fp@(-192)
	moveb	%a0@(32),%d0
	moveb	%d0,%fp@(-188)
	moveb	%a0@(33),%d0
	moveb	%d0,%fp@(-187)
	movel	%fp@(16),%sp@-
	movel	%fp@(20),%sp@-
	pea	%fp@(-232)
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10007ab4)
	lea	%sp@(16),%sp
	movew	%d0,%d3
	bnew	.L10008426
	pea	%fp@(-172)
	pea	%fp@(-8)
	pea	%fp@(-176)
	pea	%fp@(-16)
	pea	%fp@(-20)
	moveal	%fp@(16),%a0
	movel	%a0@,%sp@-
	moveal	%a0@(12),%a0
	moveal	%a0@(16),%a0
	jsr	%a0@
	lea	%sp@(24),%sp
	movew	%d0,%d3
	moveal	%fp@(12),%a0
	movel	%a0@(24),%d0
	cmpil	#1061109567,%d0
	bnes	.L10008226
	movel	%fp@(-16),%fp@(-196)
	bras	.L1000823c

.L10008226:
	moveal	%fp@(12),%a0
	movel	%a0@(24),%d0
	cmpl	%fp@(-16),%d0
	beqs	.L1000823c
	movew	#-2806,%d3
	braw	.L1000840e

.L1000823c:
	movew	%d3,%d0
	sne	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveb	%d0,%fp@(-179)
	moveal	%fp@(12),%a2
	tstb	%a2@(33)
	beqs	.L10008266
	movel	%a2,%sp@-
	pea	%fp@(-232)
	jsr	%pc@(sub_10007dce)
	addqw	#8,%sp
	movew	%d0,%d3
	bnew	.L1000840e

.L10008266:
	pea	%fp@(-24)
	pea	%fp@(-28)
	moveal	%fp@(16),%a2
	movel	%a2@,%sp@-
	moveal	%a2@(12),%a0
	moveal	%a0@(48),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movel	%a2@,%sp@-
	moveal	%a2@(12),%a0
	moveal	%a0@(20),%a0
	jsr	%a0@
	addqw	#4,%sp
	movel	%d0,%d6
	moveal	%fp@(12),%a2
	moveal	%a2@,%a0
	moveb	%a0@,%d0
	moveq	#0,%d4
	moveb	%d0,%d4
	addql	#2,%d4
	moveal	%a2@(4),%a2
	movel	%a2,%d0
	beqs	.L100082b2
	moveb	%a2@,%d0
	moveq	#0,%d5
	moveb	%d0,%d5
	addql	#2,%d5
	bras	.L100082b4

.L100082b2:
	moveq	#0,%d5

.L100082b4:
	movel	%d6,%d0
	lsll	#5,%d0
	addil	#142,%d0
	addl	%d4,%d0
	addl	%d5,%d0
	addl	%fp@(-28),%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	movel	%d0,%fp@(-32)
	tstl	%d0
	bnes	.L100082de
	movew	#-2809,%d3
	braw	.L1000840e

.L100082de:
	lea	%fp@(-232),%a0
	moveal	%fp@(-32),%a1
	movel	#136,%d0
	_BlockMoveData
	moveal	%fp@(16),%a2
	movel	%a2@,%sp@-
	moveal	%a2@(12),%a0
	moveal	%a0@(32),%a0
	jsr	%a0@
	addqw	#4,%sp
	moveal	%fp@(-32),%a0
	movel	%d0,%a0@(116)
	movel	%fp@(-28),%a0@(120)
	movel	%d6,%a0@(104)
	movel	%fp@(-24),%a0@(112)
	movel	%d6,%d0
	asll	#5,%d0
	addl	%a0,%d0
	moveal	%d0,%a1
	lea	%a1@(136),%a1
	movel	%a1,%fp@(-12)
	addqw	#6,%a1
	addal	%d4,%a1
	movel	%a1,%a0@(108)
	movel	%a0@(20),%d3
	moveq	#1,%d0
	cmpl	%d0,%d3
	beqs	.L10008340
	moveq	#2,%d0
	cmpl	%d0,%d3
	bnes	.L10008360

.L10008340:
	moveal	%fp@(12),%a2
	moveal	%a2@(12),%a1
	movew	%a1@,%d0
	moveal	%fp@(-12),%a1
	movew	%d0,%a1@
	moveal	%a2@(12),%a2
	movel	%a2@(2),%d0
	movel	%d0,%a1@(2)
	movel	%a1,%a0@(24)

.L10008360:
	subql	#1,%d4
	moveal	%fp@(12),%a2
	moveal	%a2@,%a0
	moveal	%fp@(-12),%a3
	addqw	#6,%a3
	moveal	%a3,%a1
	movel	%d4,%d0
	_BlockMoveData
	moveal	%fp@(-32),%a4
	movel	%a3,%a4@(12)
	clrb	%d3
	addal	%d4,%a3
	moveb	%d3,%a3@
	moveal	%a2@(4),%a2
	movel	%a2,%d0
	beqs	.L100083b2
	moveal	%a4@(108),%a0
	addal	%fp@(-28),%a0
	movel	%a0,%fp@(-4)
	subql	#1,%d5
	moveal	%a2,%a0
	moveal	%fp@(-4),%a1
	movel	%d5,%d0
	_BlockMoveData
	movel	%fp@(-4),%d0
	movel	%d0,%a4@(16)
	moveal	%d0,%a0
	addal	%d5,%a0
	moveb	%d3,%a0@
	bras	.L100083be

.L100083b2:
	moveal	%fp@(-32),%a2
	movel	%a2@(12),%d0
	movel	%d0,%a2@(16)

.L100083be:
	moveal	%fp@(12),%a0
	moveb	%a0@(34),%d0
	seq	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveal	%fp@(-32),%a2
	moveb	%d0,%a2@(54)
	moveal	%fp@(16),%a3
	clrb	%a3@(4)
	movel	%a3@(12),%d0
	movel	%d0,%a2@(68)
	movel	%a3@,%d0
	movel	%d0,%a2@(72)
	movel	%a2@(20),%d3
	moveq	#1,%d0
	cmpl	%d0,%d3
	beqs	.L100083fc
	moveq	#2,%d0
	cmpl	%d0,%d3
	bnes	.L10008408

.L100083fc:
	moveq	#1,%d0
	moveb	%d0,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_10007a3a)
	addqw	#6,%sp

.L10008408:
	movel	%fp@(-32),%d0
	bras	.L1000842e

.L1000840e:
	movel	%fp@(16),%sp@-
	jsr	%pc@(sub_10007d5e)
	addqw	#4,%sp
	pea	%fp@(-232)
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10007d90)
	addqw	#8,%sp

.L10008426:
	moveal	%fp@(24),%a0
	movew	%d3,%a0@
	moveq	#0,%d0

.L1000842e:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_10008436:
	linkw	%fp,#-24
	moveml	%d3-%d5/%a2-%a4,%sp@-
	moveal	%fp@(12),%a3
	moveal	%fp@(8),%a2
	movel	%a2@(120),%d4
	moveq	#0,%d3
	moveal	%a3,%a4
	moveq	#12,%d0
	addal	%d0,%a4
	moveq	#108,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-4)
	bras	.L10008482

.L1000845c:
	pea	%fp@(-24)
	movel	%d3,%sp@-
	movel	%a3@,%sp@-
	moveal	%a4@,%a0
	moveal	%a0@(52),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d5
	bnes	.L1000848a
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a0
	addal	%d3,%a0
	moveb	%fp@(-8),%a0@
	addql	#1,%d3

.L10008482:
	cmpl	%d4,%d3
	blts	.L1000845c
	clrw	%d0
	bras	.L1000848c

.L1000848a:
	movew	%d5,%d0

.L1000848c:
	moveml	%sp@+,%d3-%d5/%a2-%a4
	unlk	%fp
	rts

sub_10008494:
	linkw	%fp,#-64
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveq	#0,%d4
	moveal	%fp@(8),%a2
	moveq	#104,%d0
	addal	%d0,%a2
	movel	%a2,%fp@(-44)
	moveal	%fp@(12),%a0
	moveq	#12,%d3
	addal	%d3,%a0
	movel	%a0,%fp@(-40)
	moveal	%fp@(8),%a0
	lea	%a0@(136),%a0
	movel	%a0,%fp@(-36)
	moveal	%fp@(8),%a1
	moveq	#77,%d0
	addal	%d0,%a1
	movel	%a1,%fp@(-32)
	moveal	%fp@(8),%a1
	moveq	#78,%d0
	addal	%d0,%a1
	movel	%a1,%fp@(-28)
	moveal	%a0,%a3
	moveq	#22,%d0
	addal	%d0,%a3
	moveal	%a0,%a4
	moveq	#20,%d0
	addal	%d0,%a4
	moveq	#24,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-24)
	moveal	%fp@(-36),%a0
	moveq	#21,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-20)
	moveal	%fp@(-36),%a0
	moveq	#16,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-16)
	moveal	%fp@(-36),%a0
	addal	%d3,%a0
	movel	%a0,%fp@(-12)
	moveal	%fp@(-36),%a0
	addqw	#8,%a0
	movel	%a0,%fp@(-8)
	moveal	%fp@(-36),%a0
	moveq	#23,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)
	braw	.L100085fc

.L1000852a:
	pea	%fp@(-64)
	movel	%d4,%sp@-
	moveal	%fp@(12),%a0
	movel	%a0@,%sp@-
	moveal	%fp@(-40),%a0
	moveal	%a0@,%a0
	moveal	%a0@(24),%a0
	jsr	%a0@
	lea	%sp@(12),%sp
	movew	%d0,%d3
	beqs	.L10008550
	movew	%d3,%d0
	jmp	%pc@(.L1000860a)

.L10008550:
	cmpib	#127,%fp@(-64)
	bnes	.L10008562
	moveal	%fp@(-4),%a0
	moveb	#1,%a0@
	bras	.L100085dc

.L10008562:
	moveal	%fp@(-8),%a0
	movel	%fp@(-58),%a0@
	moveal	%fp@(-12),%a0
	movel	%fp@(-62),%a0@
	moveal	%fp@(-16),%a0
	movel	%fp@(-54),%a0@
	moveb	%fp@(-64),%d0
	moveq	#1,%d3
	andb	%d3,%d0
	sne	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveal	%fp@(-20),%a0
	moveb	%d0,%a0@
	moveb	%fp@(-64),%d0
	moveq	#8,%d1
	andb	%d1,%d0
	seq	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveal	%fp@(-24),%a0
	moveb	%d0,%a0@
	moveb	%fp@(-64),%d0
	moveq	#6,%d1
	andb	%d1,%d0
	sne	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveb	%d0,%a4@
	moveb	%fp@(-63),%d0
	moveb	%d0,%a3@
	tstb	%a4@
	beqs	.L100085cc
	cmpb	%d3,%d0
	blss	.L100085cc
	moveal	%fp@(-32),%a0
	moveb	%d3,%a0@

.L100085cc:
	tstb	%a4@
	beqs	.L100085dc
	tstb	%a3@
	bnes	.L100085dc
	moveal	%fp@(-28),%a0
	moveb	#1,%a0@

.L100085dc:
	moveq	#32,%d3
	addal	%d3,%a3
	addal	%d3,%a4
	addl	%d3,%fp@(-24)
	addl	%d3,%fp@(-20)
	addl	%d3,%fp@(-16)
	addl	%d3,%fp@(-12)
	addl	%d3,%fp@(-8)
	addl	%d3,%fp@(-4)
	addql	#1,%d4

.L100085fc:
	moveal	%fp@(-44),%a0
	movel	%a0@,%d0
	cmpl	%d4,%d0
	bgtw	.L1000852a
	clrw	%d0

.L1000860a:
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_10008612:
	linkw	%fp,#-12
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(12),%a4
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a3
	moveal	%a4@,%a2
	movel	%a2,%d0
	beqs	.L10008632
	movel	%a4@(4),%d0
	movel	%d0,%a2@(4)

.L10008632:
	moveal	%a4@(4),%a2
	movel	%a2,%d0
	beqs	.L10008640
	movel	%a4@,%d0
	movel	%d0,%a2@
	bras	.L10008664

.L10008640:
	movel	%a4@,%d0
	movel	%a4@(8),%d3
	movel	%d3,%fp@(-4)
	asrl	#6,%d3
	movel	%fp@(-4),%d1
	eorl	%d1,%d3
	moveq	#63,%d1
	andl	%d1,%d3
	asll	#2,%d3
	moveal	%a3,%a0
	lea	%a0@(368),%a0
	addl	%a0,%d3
	moveal	%d3,%a0
	movel	%d0,%a0@

.L10008664:
	moveq	#1,%d0
	moveb	%d0,%sp@-
	pea	%pc@(sub_100086be)
	moveal	%a4,%a2
	moveq	#72,%d0
	addal	%d0,%a2
	movel	%a2,%sp@-
	moveal	%a4@(68),%a0
	moveal	%a0@(12),%a0
	jsr	%a0@
	lea	%sp@(10),%sp
	movel	%a4,%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10007d90)
	addqw	#8,%sp
	tstb	%a4@(55)
	beqs	.L1000869e
	movel	%a4@(16),%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp

.L1000869e:
	movel	%a4,%sp@-
	jsr	%pc@(sub_10005f48)
	addqw	#4,%sp
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_100086ae:
	linkw	%fp,#0
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10005f34)
	unlk	%fp
	rts

sub_100086be:
	linkw	%fp,#0
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10005f48)
	unlk	%fp
	rts

sub_100086ce:
	linkw	%fp,#-4
	moveml	%d3-%d6/%a2,%sp@-
	moveal	%fp@(8),%a2
	movel	%fp@(12),%d6
	moveq	#0,%d3
	movel	%d3,%fp@(-4)
	movel	%d3,%d5

.L100086e6:
	tstb	%a2@
	beqs	.L10008710
	movel	%fp@(-4),%d3
	moveq	#1,%d4
	asll	%d4,%d3
	movel	%fp@(-4),%d0
	moveq	#16,%d1
	asrl	%d1,%d0
	subl	%d0,%d3
	movel	%d3,%fp@(-4)
	moveb	%a2@+,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	eorl	%d0,%fp@(-4)
	addql	#1,%d5
	subql	#1,%d6
	bnes	.L100086e6

.L10008710:
	movel	%d5,%d0
	moveq	#16,%d3
	asll	%d3,%d0
	movel	%fp@(-4),%d2
	asrl	%d3,%d2
	movew	%fp@(-2),%d3
	eorw	%d3,%d2
	moveq	#0,%d1
	movew	%d2,%d1
	addl	%d1,%d0
	moveml	%sp@+,%d3-%d6/%a2
	unlk	%fp
	rts

sub_10008730:
	linkw	%fp,#0
	movel	%d3,%sp@-
	movel	%fp@(8),%d0
	movel	%fp@(12),%d3
	lsrl	%d3,%d0
	movel	%fp@(8),%d1
	eorl	%d1,%d0
	moveq	#1,%d1
	asll	%d3,%d1
	subql	#1,%d1
	andl	%d1,%d0
	movel	%sp@+,%d3
	unlk	%fp
	rts

local_read:
	linkw	%fp,#-80
	moveml	%d3/%a2,%sp@-
	movew	%fp@(8),%fp@(-56)
	movel	%fp@(14),%fp@(-48)
	moveal	%fp@(10),%a2
	movel	%a2@,%d0
	movel	%d0,%fp@(-44)
	moveq	#32,%d0
	movew	%d0,%fp@(-36)
	moveq	#0,%d0
	movel	%d0,%fp@(-34)
	lea	%fp@(-80),%a0
	_Read
	movew	%d0,%d3
	movel	%fp@(-40),%a2@
	movew	%d3,%d0
	moveml	%sp@+,%d3/%a2
	unlk	%fp
	rts

sub_10008794:
	linkw	%fp,#0
	moveml	%d3/%a2,%sp@-
	subqw	#2,%sp
	.short	0xa994
	movew	%sp@+,%d3
	subqw	#2,%sp
	movew	0x900,%sp@
	movew	%sp@+,%d0
	movew	%d0,%sp@-
	.short	0xa998
	subqw	#4,%sp
	movel	%fp@(8),%sp@-
	movew	%fp@(12),%sp@-
	.short	0xa81f
	moveal	%sp@+,%a2
	movew	%d3,%sp@-
	.short	0xa998
	movel	%a2,%d0
	moveml	%sp@+,%d3/%a2
	unlk	%fp
	rts

sub_100087ca:
	linkw	%fp,#-64
	moveml	%d3-%d6/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	clrb	%fp@(-4)
	moveal	%a3@(108),%a4
	oril	#8388608,%a4@
	moveal	%a3@(8),%a0
	moveq	#1,%d0
	cmpal	%d0,%a0
	beqw	.L100088d8
	moveq	#60,%d0
	movel	%d0,%fp@(-64)
	moveq	#0,%d3
	movel	%d3,%fp@(-60)
	movel	%d3,%fp@(-8)
	subqw	#2,%sp
	moveal	%a3,%a0
	moveq	#96,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	pea	%fp@(-64)
	_GetProcessInformation
	movew	%sp@+,%d6
	bnew	.L100088d8
	clrw	%sp@-
	movel	#1397316165,%sp@-
	jsr	%pc@(sub_10008794)
	addqw	#6,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L1000884a
	movel	%a3,%sp@-
	.short	0xa9a2
	moveal	%a3@,%a2
	movel	%a2,%d0
	beqs	.L10008846
	moveb	#1,%fp@(-4)
	movel	%a2@(2),%d5
	movel	%a2@(6),%d4

.L10008846:
	movel	%a3,%sp@-
	.short	0xa9a3

.L1000884a:
	moveq	#1,%d0
	movew	%d0,%sp@-
	movel	#1397316165,%sp@-
	jsr	%pc@(sub_10008794)
	addqw	#6,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L1000888c
	movel	%a3,%sp@-
	.short	0xa9a2
	moveal	%a3@,%a2
	movel	%a2,%d0
	beqs	.L10008888
	moveb	%fp@(-4),%d0
	beqs	.L1000887c
	movel	%a2@(6),%d4
	cmpl	%d5,%d4
	blss	.L10008888
	movel	%d5,%d4
	bras	.L10008888

.L1000887c:
	moveb	#1,%fp@(-4)
	moveal	%a3@,%a0
	movel	%a0@(6),%d4

.L10008888:
	movel	%a3,%sp@-
	.short	0xa9a3

.L1000888c:
	moveb	%fp@(-4),%d0
	bnes	.L100088c0
	moveq	#-1,%d0
	movew	%d0,%sp@-
	movel	#1397316165,%sp@-
	jsr	%pc@(sub_10008794)
	addqw	#6,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L100088c0
	movel	%a3,%sp@-
	.short	0xa9a2
	moveal	%a3@,%a2
	movel	%a2,%d0
	beqs	.L100088bc
	moveb	#1,%fp@(-4)
	movel	%a2@(6),%d4

.L100088bc:
	movel	%a3,%sp@-
	.short	0xa9a3

.L100088c0:
	moveb	%fp@(-4),%d0
	beqs	.L100088d8
	movel	%fp@(-32),%d0
	cmpl	%d4,%d0
	blss	.L100088d8
	movel	%fp@(-32),%d0
	subl	%d4,%d0
	movel	%d0,%a4@(8)

.L100088d8:
	moveml	%sp@+,%d3-%d6/%a2-%a4
	unlk	%fp
	rts

sub_100088e0:
	linkw	%fp,#-68
	moveml	%d3-%d4/%a3-%a4,%sp@-
	moveal	%fp@(8),%a3
	moveal	%a3@(108),%a4
	movel	%a4,%fp@(-4)
	moveal	%a3@(8),%a0
	moveq	#1,%d0
	cmpal	%d0,%a0
	beqs	.L10008966
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	moveq	#23,%d1
	lsrl	%d1,%d0
	moveq	#1,%d1
	andl	%d1,%d0
	bnes	.L10008916
	movel	%a3,%sp@-
	jsr	%pc@(sub_100087ca)
	addqw	#4,%sp

.L10008916:
	movel	%a4@(4),%d0
	addl	%fp@(12),%d0
	movel	%a4@(8),%d1
	cmpl	%d1,%d0
	bles	.L1000895a
	moveq	#60,%d0
	movel	%d0,%fp@(-68)
	moveq	#0,%d3
	movel	%d3,%fp@(-64)
	movel	%d3,%fp@(-12)
	subqw	#2,%sp
	moveal	%a3,%a0
	moveq	#96,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	pea	%fp@(-68)
	_GetProcessInformation
	movew	%sp@+,%d4
	bnes	.L10008966
	movel	%fp@(-32),%d0
	lsrl	#2,%d0
	cmpl	%fp@(12),%d0
	bcss	.L10008966

.L1000895a:
	moveb	#1,%fp@(-8)

.L10008960:
	moveb	%fp@(-8),%d0
	bras	.L1000896c

.L10008966:
	clrb	%fp@(-8)
	bras	.L10008960

.L1000896c:
	moveml	%sp@+,%d3-%d4/%a3-%a4
	unlk	%fp
	rts

sub_10008974:
	linkw	%fp,#-60
	moveml	%d3-%d4/%a2-%a3,%sp@-
	clrw	%d0
	movew	%d0,%fp@(-60)
	movew	%fp@(14),%d0
	moveq	#16,%d1
	andw	%d1,%d0
	sne	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveb	%d0,%fp@(-4)
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a2
	moveq	#38,%d0
	movel	%d0,%sp@-
	pea	%fp@(-48)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveq	#16,%d0
	movel	%d0,%sp@-
	movel	%fp@(46),%sp@-
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movel	%fp@(16),%fp@(-48)
	movel	%fp@(20),%fp@(-44)
	moveb	%fp@(32),%d3
	moveb	%d3,%fp@(-32)
	movel	%fp@(34),%fp@(-30)
	movel	%fp@(38),%fp@(-26)
	tstb	%d3
	beqs	.L100089ea
	movel	%fp@(24),%fp@(-40)
	movel	%fp@(28),%fp@(-36)
	bras	.L100089f6

.L100089ea:
	moveq	#0,%d0
	movel	%d0,%fp@(-40)
	moveq	#-1,%d0
	movel	%d0,%fp@(-36)

.L100089f6:
	clrb	%fp@(-52)
	movel	#1986863136,%d0
	lea	%fp@(-8),%a1
	_Gestalt
	movel	%a0,%a1@
	movew	%d0,%fp@(-60)
	tstw	%d0
	bnes	.L10008a46
	movel	%fp@(-8),%d0
	moveq	#1,%d1
	andl	%d1,%d0
	bnes	.L10008a22
	moveq	#-1,%d0
	movew	%d0,%fp@(-60)
	bras	.L10008a46

.L10008a22:
	moveb	#1,%fp@(-52)
	movel	%a2@(632),%d0
	moveq	#31,%d1
	lsrl	%d1,%d0
	beqs	.L10008a40
	lea	%fp@(-48),%a0
	moveq	#8,%d0
	_MemoryDispatch
	movew	%d0,%fp@(-60)
	bras	.L10008a46

.L10008a40:
	moveq	#-1,%d0
	movew	%d0,%fp@(-60)

.L10008a46:
	movew	%fp@(-60),%d0
	bnes	.L10008a9e
	moveq	#1,%d3
	moveal	%fp@(42),%a0
	moveb	%d3,%a0@
	moveal	%fp@(46),%a0
	moveb	%d3,%a0@
	moveal	%fp@(46),%a0
	movel	%fp@(-22),%a0@(4)
	moveb	%fp@(32),%d0
	beqs	.L10008a7c
	moveal	%fp@(50),%a0
	movel	%fp@(-18),%a0@
	moveal	%fp@(54),%a0
	movel	%fp@(-14),%a0@
	bras	.L10008a98

.L10008a7c:
	moveal	%fp@(-18),%a0
	addal	%fp@(24),%a0
	moveal	%fp@(50),%a1
	movel	%a0,%a1@
	movel	%fp@(-14),%d0
	subl	%fp@(24),%d0
	moveal	%fp@(54),%a0
	movel	%d0,%a0@

.L10008a98:
	clrw	%d0
	jmp	%pc@(.L10008d16)

.L10008a9e:
	moveq	#0,%d0
	moveal	%d0,%a3
	subqw	#2,%sp
	moveal	%fp@(16),%a2
	movew	%a2@,%sp@-
	movel	%a2@(2),%sp@-
	addqw	#6,%a2
	movel	%a2,%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	pea	%fp@(-58)
	jsr	%pc@(sub_1000a49a)
	movew	%sp@+,%d0
	movew	%d0,%fp@(-60)
	tstw	%d0
	beqs	.L10008acc
	jmp	%pc@(.L10008d16)

.L10008acc:
	cmpil	#0,%fp@(28)
	bgts	.L10008af8
	subqw	#2,%sp
	movew	%fp@(-58),%sp@-
	pea	%fp@(28)
	jsr	%pc@(local_geteof)
	movew	%sp@+,%d0
	movew	%d0,%fp@(-60)
	tstw	%d0
	bnew	.L10008d06
	movel	%fp@(24),%d0
	subl	%d0,%fp@(28)

.L10008af8:
	movel	%fp@(28),%d4
	addql	#3,%d4
	moveq	#-4,%d0
	andl	%d0,%d4
	moveq	#12,%d0
	addl	%d0,%d4
	movel	#1869815840,%d0
	lea	%fp@(-8),%a1
	_Gestalt
	movel	%a0,%a1@
	tstw	%d0
	seq	%d0
	negb	%d0
	extw	%d0
	extl	%d0
	moveb	%d0,%fp@(-51)
	moveb	%fp@(-52),%d0
	bnes	.L10008b6a
	moveal	%fp@(42),%a0
	tstb	%a0@
	bnes	.L10008b6a
	movel	%fp@(38),%sp@-
	movel	%d4,%sp@-
	jsr	%pc@(sub_10005716)
	addqw	#8,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqw	.L10008ca6
	moveal	%fp@(42),%a0
	moveb	#1,%a0@
	moveal	%fp@(46),%a0
	movel	%a3,%a0@(12)
	moveal	%fp@(46),%a0
	movel	%fp@(38),%a0@(8)
	moveal	%fp@(46),%a0
	moveb	#2,%a0@
	braw	.L10008ca6

.L10008b6a:
	moveb	%fp@(-51),%d0
	beqs	.L10008bec
	moveb	%fp@(-4),%d0
	bnes	.L10008bec
	clrw	%d0
	movew	%d0,%fp@(-60)
	subqw	#2,%sp
	movew	#64,%sp@-
	_OSDispatch
	subqw	#2,%sp
	movel	%d4,%sp@-
	pea	%fp@(-60)
	_TempNewHandle
	moveal	%sp@+,%a2
	subqw	#2,%sp
	movew	#65,%sp@-
	_OSDispatch
	addqw	#2,%sp
	movew	%fp@(-60),%d0
	beqs	.L10008ba8
	moveq	#0,%d0
	moveal	%d0,%a2

.L10008ba8:
	movel	%a2,%d0
	beqs	.L10008bb8
	movel	%a2,%sp@-
	pea	%fp@(-60)
	movew	#30,%sp@-
	_OSDispatch

.L10008bb8:
	movew	%fp@(-60),%d0
	beqs	.L10008bce
	movel	%a2,%sp@-
	pea	%fp@(-60)
	movew	#32,%sp@-
	_OSDispatch
	moveq	#0,%d0
	moveal	%d0,%a2

.L10008bce:
	movel	%a2,%d0
	beqs	.L10008bec
	moveal	%fp@(42),%a0
	moveb	#1,%a0@
	moveal	%fp@(46),%a0
	movel	%a2,%a0@(12)
	moveal	%fp@(46),%a0
	moveb	#4,%a0@
	moveal	%a2@,%a3

.L10008bec:
	movel	%a3,%d0
	bnes	.L10008c40
	moveb	%fp@(-52),%d0
	beqs	.L10008bfc
	moveb	%fp@(-51),%d0
	bnes	.L10008c40

.L10008bfc:
	moveb	%fp@(-4),%d0
	bnes	.L10008c40
	subqw	#4,%sp
	movel	0x2a6,%sp@
	movel	%sp@+,%d0
	movel	%d0,%fp@(38)
	movel	%d0,%sp@-
	movel	%d4,%sp@-
	jsr	%pc@(sub_10005716)
	addqw	#8,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L10008c40
	moveal	%fp@(42),%a0
	moveb	#1,%a0@
	moveal	%fp@(46),%a0
	movel	%a3,%a0@(12)
	moveal	%fp@(46),%a0
	movel	%fp@(38),%a0@(8)
	moveal	%fp@(46),%a0
	moveb	#2,%a0@

.L10008c40:
	movel	%a3,%d0
	bnes	.L10008ca6
	movel	%d4,%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_100088e0)
	addqw	#8,%sp
	tstb	%d0
	beqs	.L10008ca6
	moveal	%fp@(8),%a0
	movel	%a0@(40),%d0
	movel	%d0,%fp@(38)
	movel	%d0,%sp@-
	movel	%d4,%sp@-
	jsr	%pc@(sub_10005716)
	addqw	#8,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	beqs	.L10008ca6
	moveq	#1,%d3
	moveal	%fp@(42),%a0
	moveb	%d3,%a0@
	moveal	%fp@(46),%a0
	movel	%a3,%a0@(12)
	moveal	%fp@(46),%a0
	movel	%fp@(38),%a0@(8)
	moveal	%fp@(46),%a0
	moveb	#2,%a0@
	moveal	%fp@(46),%a0
	moveb	%d3,%a0@(1)
	moveal	%fp@(8),%a0
	moveal	%a0@(108),%a0
	addl	%d4,%a0@(4)

.L10008ca6:
	movel	%a3,%d0
	bnes	.L10008cb2
	moveq	#-108,%d0
	movew	%d0,%fp@(-60)
	bras	.L10008d06

.L10008cb2:
	movel	%a3,%d0
	moveq	#15,%d1
	addl	%d1,%d0
	moveq	#-16,%d1
	andl	%d1,%d0
	moveal	%d0,%a3
	movel	%fp@(28),%fp@(-56)
	movel	%fp@(24),%d0
	beqs	.L10008ce2
	subqw	#2,%sp
	movew	%fp@(-58),%sp@-
	moveq	#1,%d0
	movew	%d0,%sp@-
	movel	%fp@(24),%sp@-
	jsr	%pc@(local_setfpos)
	movew	%sp@+,%d0
	movew	%d0,%fp@(-60)

.L10008ce2:
	movel	%a3,%sp@-
	pea	%fp@(-56)
	movew	%fp@(-58),%sp@-
	jsr	%pc@(local_read)
	lea	%sp@(10),%sp
	movew	%d0,%fp@(-60)
	moveal	%fp@(50),%a0
	movel	%a3,%a0@
	moveal	%fp@(54),%a0
	movel	%fp@(-56),%a0@

.L10008d06:
	subqw	#2,%sp
	movew	%fp@(-58),%sp@-
	jsr	%pc@(sub_1000a3a0)
	addqw	#2,%sp
	movew	%fp@(-60),%d0

.L10008d16:
	moveml	%sp@+,%d3-%d4/%a2-%a3
	unlk	%fp
	rts

sub_10008d1e:
	linkw	%fp,#-4
	movel	%a2,%sp@-
	moveb	%fp@(12),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	tstl	%d0
	beqs	.L10008daa
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10008d4a
	moveq	#3,%d1
	cmpl	%d1,%d0
	beqs	.L10008d54
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10008d64
	moveq	#4,%d1
	cmpl	%d1,%d0
	beqs	.L10008d96
	bras	.L10008da6

.L10008d4a:
	moveal	%fp@(16),%a0
	moveq	#9,%d0
	_MemoryDispatch
	bras	.L10008daa

.L10008d54:
	movel	%fp@(20),%sp@-
	movel	%fp@(24),%sp@-
	jsr	%pc@(sub_10005776)
	addqw	#8,%sp
	bras	.L10008daa

.L10008d64:
	moveb	%fp@(13),%d0
	beqs	.L10008d86
	moveal	%fp@(8),%a0
	moveal	%a0@(108),%a0
	moveal	%a0,%a2
	subqw	#4,%sp
	movel	%fp@(24),%sp@-
	jsr	%pc@(local_getptrsize)
	movel	%sp@+,%d0
	moveal	%a2,%a0
	subl	%d0,%a0@(4)

.L10008d86:
	movel	%fp@(20),%sp@-
	movel	%fp@(24),%sp@-
	jsr	%pc@(zone_disposeptr)
	addqw	#8,%sp
	bras	.L10008daa

.L10008d96:
	movel	%fp@(24),%sp@-
	pea	%fp@(-4)
	movew	#32,%sp@-
	_OSDispatch
	bras	.L10008daa

.L10008da6:
	moveq	#-50,%d0
	bras	.L10008dac

.L10008daa:
	clrw	%d0

.L10008dac:
	moveal	%sp@+,%a2
	unlk	%fp
	rts

sub_10008db2:
	linkw	%fp,#0
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(12),%sp
	jmp	%a0@

sub_10008dc0:
	linkw	%fp,#0
	movel	%a2,%sp@-
	subqw	#4,%sp
	movew	#0xa89f,%sp@-
	moveq	#1,%d0
	moveb	%d0,%sp@-
	jsr	%pc@(sub_1000a378)
	moveal	%sp@+,%a0
	moveal	%a0,%a2
	subqw	#4,%sp
	movew	#0xa198,%sp@-
	clrb	%sp@-
	jsr	%pc@(sub_1000a378)
	moveal	%sp@+,%a1
	moveal	%a2,%a0
	cmpal	%a1,%a0
	bnes	.L10008dee
	bras	.L10008df2

.L10008dee:
	_FlushInstructionCache

.L10008df2:
	moveal	%sp@+,%a2
	unlk	%fp
	moveal	%sp@+,%a0
	addqw	#4,%sp
	jmp	%a0@

sub_10008dfc:
	linkw	%fp,#-4
	moveml	%d3/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	moveal	%fp@(12),%a4
	movel	%fp@(16),%d3
	jsr	%pc@(sub_100033dc)
	movel	%d0,%fp@(-4)
	tstl	%d0
	bnes	.L10008e22
	movew	#-2818,%d0
	bras	.L10008e66

.L10008e22:
	moveal	%fp@(-4),%a0
	moveal	%a0@(60),%a2
	bras	.L10008e5e

.L10008e2c:
	movel	%fp@(34),%sp@-
	movel	%fp@(30),%sp@-
	moveb	%fp@(28),%sp@-
	movel	%fp@(24),%sp@-
	movel	%fp@(20),%sp@-
	movel	%d3,%sp@-
	movel	%a4,%sp@-
	movel	%a3,%sp@-
	moveal	%a2@(8),%a0
	moveal	%a0@(8),%a0
	jsr	%a0@
	lea	%sp@(30),%sp
	tstw	%d0
	bnes	.L10008e5c
	clrw	%d0
	bras	.L10008e66

.L10008e5c:
	moveal	%a2@,%a2

.L10008e5e:
	movel	%a2,%d0
	bnes	.L10008e2c
	movew	#-2806,%d0

.L10008e66:
	moveml	%sp@+,%d3/%a2-%a4
	unlk	%fp
	rts

sub_10008e6e:
	linkw	%fp,#0
	moveml	%a3-%a4,%sp@-
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L10008e86
	movew	#-2818,%d0
	bras	.L10008eba

.L10008e86:
	moveq	#12,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	moveal	%d0,%a3
	movel	%a3,%d0
	bnes	.L10008e9c
	movew	#-2809,%d0
	bras	.L10008eba

.L10008e9c:
	movel	%fp@(8),%a3@(8)
	moveal	%a4,%a0
	moveq	#60,%d0
	addal	%d0,%a0
	movel	%a0,%sp@-
	moveb	%fp@(12),%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(sub_100031b0)
	lea	%sp@(10),%sp
	clrw	%d0

.L10008eba:
	moveml	%sp@+,%a3-%a4
	unlk	%fp
	rts

sub_10008ec2:
	linkw	%fp,#0
	moveq	#1,%d0
	moveb	%d0,%sp@-
	movel	%fp@(12),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_100090e0)
	lea	%sp@(10),%sp
	movew	%fp@(16),%d0
	unlk	%fp
	rts

sub_10008ee2:
	linkw	%fp,#-8
	moveml	%d3-%d7/%a2-%a4,%sp@-
	moveq	#78,%d0
	movel	%d0,%sp@-
	moveal	%fp@(18),%a0
	jsr	%a0@
	addqw	#4,%sp
	moveal	%d0,%a4
	movel	%a4,%d0
	bnes	.L10008f02
	moveq	#-108,%d0
	jmp	%pc@(.L100090d8)

.L10008f02:
	moveal	%fp@(8),%a0
	movel	%a4,%a0@
	moveq	#78,%d0
	movel	%d0,%sp@-
	movel	%a4,%sp@-
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	movel	%fp@(12),%d3
	movel	%d3,%a4@
	moveal	%d3,%a0
	movew	%a0@(34),%d0
	extl	%d0
	movel	%d0,%a4@(4)
	moveq	#40,%d0
	addal	%d0,%a0
	movel	%a0,%a4@(8)
	moveb	%fp@(16),%a4@(76)
	moveq	#-1,%d0
	movel	%d0,%a4@(12)
	moveq	#0,%d6
	moveal	%d3,%a2
	moveq	#32,%d0
	addal	%d0,%a2
	moveal	%a4,%a3
	addqw	#8,%a3
	moveal	%a4,%a0
	moveq	#12,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-8)
	moveq	#0,%d7
	bras	.L10008f70

.L10008f54:
	moveal	%a3@,%a0
	addal	%d7,%a0
	moveb	%a0@(24),%d0
	moveq	#4,%d1
	cmpb	%d1,%d0
	bnes	.L10008f68
	moveal	%fp@(-8),%a0
	movel	%d6,%a0@

.L10008f68:
	addil	#28,%d7
	addql	#1,%d6

.L10008f70:
	movew	%a2@,%d0
	extl	%d0
	cmpl	%d6,%d0
	bgts	.L10008f54
	movel	%a4@(12),%d0
	moveq	#-1,%d1
	cmpl	%d1,%d0
	bnes	.L10008f9a
	movew	#-2820,%sp@-
	movel	%fp@(22),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10008ec2)
	lea	%sp@(10),%sp
	jmp	%pc@(.L100090d8)

.L10008f9a:
	movel	%a4@(4),%d0
	moveq	#4,%d1
	cmpl	%d1,%d0
	bgts	.L10008fb0
	moveal	%a4,%a0
	moveq	#60,%d0
	addal	%d0,%a0
	movel	%a0,%a4@(52)
	bras	.L10008fca

.L10008fb0:
	movel	%a4@(4),%d0
	lsll	#2,%d0
	movel	%d0,%sp@-
	moveal	%fp@(18),%a0
	jsr	%a0@
	addqw	#4,%sp
	movel	%d0,%a4@(52)
	tstl	%d0
	beqw	.L10009054

.L10008fca:
	moveal	%a4,%a3
	addqw	#4,%a3
	moveal	%a4,%a2
	addqw	#8,%a2
	moveal	%a4,%a0
	moveq	#52,%d0
	addal	%d0,%a0
	movel	%a0,%fp@(-4)
	moveq	#0,%d5
	moveq	#0,%d4
	bras	.L10008ffe

.L10008fe2:
	moveal	%a2@,%a0
	addal	%d5,%a0
	movel	%a0@(4),%d0
	negl	%d0
	moveal	%fp@(-4),%a0
	moveal	%a0@,%a0
	addal	%d4,%a0
	movel	%d0,%a0@
	addil	#28,%d5
	addql	#4,%d4

.L10008ffe:
	movel	%a3@,%d0
	moveq	#2,%d3
	asll	%d3,%d0
	cmpl	%d4,%d0
	bgts	.L10008fe2
	movel	%a4@(12),%d0
	mulul	#28,%d0
	addl	%a4@(8),%d0
	moveal	%d0,%a0
	movel	%a0@(20),%d0
	addl	%fp@(12),%d0
	movel	%d0,%a4@(16)
	moveal	%d0,%a0
	moveal	%a0,%a1
	addal	%a1@(40),%a0
	movel	%a0,%a4@(20)
	moveal	%a4@(16),%a2
	moveq	#28,%d0
	addal	%d0,%a2
	tstl	%a2@
	beqs	.L1000906a
	movel	%a2@,%d0
	lsll	%d3,%d0
	movel	%d0,%sp@-
	moveal	%fp@(18),%a0
	jsr	%a0@
	addqw	#4,%sp
	movel	%d0,%a4@(56)
	tstl	%d0
	bnes	.L1000906a

.L10009054:
	moveq	#-108,%d0
	movew	%d0,%sp@-
	movel	%fp@(22),%sp@-
	movel	%fp@(8),%sp@-
	jsr	%pc@(sub_10008ec2)
	lea	%sp@(10),%sp
	bras	.L100090d8

.L1000906a:
	moveal	%a4,%a2
	moveq	#16,%d0
	addal	%d0,%a2
	moveal	%a2@,%a0
	moveq	#56,%d0
	addal	%d0,%a0
	movel	%a0,%a4@(28)
	moveal	%a2@,%a1
	movel	%a1@(24),%d0
	mulul	#24,%d0
	addl	%a0,%d0
	movel	%d0,%a4@(32)
	moveal	%a2@,%a0
	movel	%a0@(28),%d1
	moveq	#2,%d3
	asll	%d3,%d1
	addl	%d0,%d1
	movel	%d1,%a4@(24)
	moveal	%a2@,%a3
	moveal	%a3,%a0
	addal	%a0@(36),%a3
	movel	%a3,%a4@(48)
	moveal	%a2@,%a3
	moveal	%a3,%a0
	addal	%a0@(44),%a3
	movel	%a3,%a4@(36)
	moveq	#1,%d0
	moveal	%a2@,%a0
	movel	%a0@(48),%d1
	asll	%d1,%d0
	asll	%d3,%d0
	addl	%a3,%d0
	movel	%d0,%a4@(40)
	moveal	%a2@,%a0
	movel	%a0@(52),%d1
	asll	%d3,%d1
	addl	%d0,%d1
	movel	%d1,%a4@(44)
	clrw	%d0

.L100090d8:
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	rts

sub_100090e0:
	linkw	%fp,#0
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	moveal	%a3@,%a2
	movel	%a2,%d0
	beqs	.L10009146
	moveal	%a2,%a4
	moveal	%a4@(52),%a2
	movel	%a2,%d0
	beqs	.L10009116
	movel	%a4@(4),%d0
	moveq	#4,%d1
	cmpl	%d1,%d0
	bles	.L10009116
	movel	%a2,%sp@-
	moveal	%fp@(12),%a0
	jsr	%a0@
	addqw	#4,%sp
	moveq	#0,%d0
	movel	%d0,%a4@(52)

.L10009116:
	moveal	%a4@(56),%a2
	movel	%a2,%d0
	beqs	.L1000912e
	movel	%a2,%sp@-
	moveal	%fp@(12),%a0
	jsr	%a0@
	addqw	#4,%sp
	moveq	#0,%d0
	movel	%d0,%a4@(56)

.L1000912e:
	clrb	%a4@(77)
	moveb	%fp@(16),%d0
	beqs	.L10009146
	movel	%a4,%sp@-
	moveal	%fp@(12),%a0
	jsr	%a0@
	addqw	#4,%sp
	moveq	#0,%d0
	movel	%d0,%a3@

.L10009146:
	clrw	%d0
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	rts

sub_10009150:
	linkw	%fp,#0
	movel	%a2,%sp@-
	moveal	%fp@(8),%a0
	moveal	%a0@,%a2
	movel	%a2@(16),%d0
	moveal	%fp@(12),%a0
	movel	%d0,%a0@
	movel	%a2@(8),%d0
	moveal	%fp@(16),%a0
	movel	%d0,%a0@
	movel	%a2@(28),%d0
	moveal	%fp@(20),%a0
	movel	%d0,%a0@
	movel	%a2@(24),%d0
	moveal	%fp@(24),%a0
	movel	%d0,%a0@
	movel	%a2@(20),%d0
	moveal	%fp@(28),%a0
	movel	%d0,%a0@
	clrw	%d0
	moveal	%sp@+,%a2
	unlk	%fp
	rts

sub_10009196:
	linkw	%fp,#0
	movel	%fp@(8),%d0
	bnes	.L100091a4
	moveq	#-50,%d0
	bras	.L100091ac

.L100091a4:
	moveal	%fp@(8),%a0
	movel	%a0@(4),%d0

.L100091ac:
	unlk	%fp
	rts

sub_100091b0:
	linkw	%fp,#-4
	moveml	%d3-%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a3
	movel	%fp@(12),%d4
	moveal	%fp@(16),%a4
	movel	%d4,%d1
	.short	0x4c3c,0x1001,0x0000,0x001c	/* mulul	#28,%d1 */
	addl	%a3@(8),%d1
	moveal	%d1,%a0
	moveb	%a0@(24),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	tstl	%d0
	beqs	.L100091fc
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10009202
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10009208
	moveq	#3,%d1
	cmpl	%d1,%d0
	beqs	.L1000920e
	moveq	#6,%d1
	cmpl	%d1,%d0
	beqs	.L10009212
	clrb	%a4@
	bras	.L10009216

.L100091fc:
	moveb	#1,%a4@
	bras	.L10009216

.L10009202:
	moveb	#2,%a4@
	bras	.L10009216

.L10009208:
	moveb	#10,%a4@
	bras	.L10009216

.L1000920e:
	clrb	%a4@
	bras	.L10009216

.L10009212:
	moveb	#3,%a4@

.L10009216:
	movel	%d4,%d3
	.short	0x4c3c,0x3003,0x0000,0x001c	/* mulul	#28,%d3 */
	moveal	%a3,%a2
	addqw	#8,%a2
	movel	%d3,%fp@(-4)
	addl	%a2@,%d3
	moveal	%d3,%a0
	moveb	%a0@(25),%d0
	moveb	%d0,%a4@(1)
	movel	%fp@(-4),%d0
	addl	%a2@,%d0
	moveal	%d0,%a0
	movel	%a0@(20),%d0
	movel	%d0,%a4@(2)
	movel	%fp@(-4),%d0
	addl	%a2@,%d0
	moveal	%d0,%a0
	movel	%a0@(8),%d0
	movel	%d0,%a4@(6)
	movel	%fp@(-4),%d0
	addl	%a2@,%d0
	moveal	%d0,%a0
	movel	%a0@(12),%d0
	movel	%d0,%a4@(10)
	movel	%fp@(-4),%d0
	addl	%a2@,%d0
	moveal	%d0,%a0
	movel	%a0@(4),%d0
	movel	%d0,%a4@(14)
	clrw	%d0
	moveml	%sp@+,%d3-%d4/%a2-%a4
	unlk	%fp
	rts

sub_1000927e:
	linkw	%fp,#0
	moveml	%d4/%a2,%sp@-
	moveal	%fp@(8),%a2
	movel	%fp@(12),%d4
	movel	%a2,%d0
	beqs	.L1000929e
	tstl	%d4
	bmis	.L1000929e
	movel	%a2@(4),%d0
	cmpl	%d4,%d0
	bgts	.L100092a2

.L1000929e:
	moveq	#-50,%d0
	bras	.L100092b2

.L100092a2:
	movel	%fp@(16),%sp@-
	movel	%d4,%sp@-
	movel	%a2,%sp@-
	jsr	%pc@(sub_100091b0)
	lea	%sp@(12),%sp

.L100092b2:
	moveml	%sp@+,%d4/%a2
	unlk	%fp
	rts

sub_100092ba:
	linkw	%fp,#-8
	moveml	%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	movel	%a2@,%d0
	movel	%d0,%fp@(-4)
	movel	%a2,%d0
	beqs	.L10009346
	moveb	%fp@(12),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	tstl	%d0
	beqs	.L100092ea
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L100092f2
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L100092fa
	bras	.L10009346

.L100092ea:
	moveb	#5,%fp@(-8)
	bras	.L10009300

.L100092f2:
	moveb	#7,%fp@(-8)
	bras	.L10009300

.L100092fa:
	moveb	#8,%fp@(-8)

.L10009300:
	moveal	%fp@(-4),%a2
	movew	%a2@(34),%d4
	moveal	%a2,%a3
	moveq	#32,%d0
	addal	%d0,%a3
	moveal	%fp@(8),%a4
	addqw	#8,%a4
	bras	.L10009334

.L10009316:
	movew	%d4,%d0
	movew	%d0,%d1
	extl	%d1
	.short	0x4c3c,0x1001,0x0000,0x001c	/* mulul	#28,%d1 */
	addl	%a4@,%d1
	moveal	%d1,%a0
	moveb	%a0@(24),%d0
	cmpb	%fp@(-8),%d0
	beqs	.L1000933a
	addqw	#1,%d4

.L10009334:
	movew	%a3@,%d0
	cmpw	%d4,%d0
	bgts	.L10009316

.L1000933a:
	moveal	%fp@(-4),%a0
	movew	%a0@(32),%d0
	cmpw	%d4,%d0
	bnes	.L1000934a

.L10009346:
	moveq	#-50,%d0
	bras	.L10009390

.L1000934a:
	movew	%d4,%d0
	movew	%d0,%d1
	extl	%d1
	.short	0x4c3c,0x1001,0x0000,0x001c	/* mulul	#28,%d1 */
	moveal	%fp@(8),%a2
	addl	%a2@(8),%d1
	moveal	%d1,%a4
	moveal	%fp@(14),%a3
	clrb	%a3@
	moveb	%a4@(25),%d0
	moveb	%d0,%a3@(1)
	movel	%a4@(20),%d0
	movel	%d0,%a3@(2)
	movel	%a4@(16),%d0
	movel	%d0,%a3@(6)
	movel	%d0,%a3@(10)
	moveal	%a2@,%a0
	addal	%a3@(2),%a0
	movel	%a0,%a3@(14)
	clrw	%d0

.L10009390:
	moveml	%sp@+,%d4/%a2-%a4
	unlk	%fp
	rts

sub_10009398:
	linkw	%fp,#0
	moveml	%d4/%a2,%sp@-
	moveal	%fp@(8),%a2
	movel	%fp@(12),%d4
	movel	%a2,%d0
	beqs	.L100093b8
	tstl	%d4
	bmis	.L100093b8
	movel	%a2@(4),%d0
	cmpl	%d4,%d0
	bgts	.L100093bc

.L100093b8:
	moveq	#-50,%d0
	bras	.L100093ea

.L100093bc:
	movel	%d4,%d0
	asll	#2,%d0
	addl	%a2@(52),%d0
	moveal	%d0,%a0
	movel	%fp@(16),%d0
	addl	%d0,%a0@
	tstb	%a2@(76)
	beqs	.L100093e8
	movel	%d4,%d0
	mulul	#28,%d0
	addl	%a2@(8),%d0
	moveal	%d0,%a0
	movel	%fp@(16),%a0@(4)

.L100093e8:
	clrw	%d0

.L100093ea:
	moveml	%sp@+,%d4/%a2
	unlk	%fp
	rts

sub_100093f2:
	linkw	%fp,#0
	movel	%fp@(8),%d0
	bnes	.L10009400
	moveq	#-50,%d0
	bras	.L1000940c

.L10009400:
	moveal	%fp@(8),%a0
	moveal	%a0@(16),%a0
	movel	%a0@(52),%d0

.L1000940c:
	unlk	%fp
	rts

sub_10009410:
	linkw	%fp,#-20
	moveml	%d3-%d7/%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	moveal	%a2@(16),%a0
	movel	%a0@(48),%sp@-
	movel	%fp@(16),%sp@-
	jsr	%pc@(sub_10008730)
	addqw	#8,%sp
	movel	%d0,%d7
	movel	%d7,%d0
	moveq	#2,%d3
	asll	%d3,%d0
	addl	%a2@(36),%d0
	moveal	%d0,%a0
	movel	%a0@,%d4
	movel	%d4,%fp@(-4)
	andil	#262143,%d4
	lsll	%d3,%d4
	addl	%a2@(40),%d4
	moveal	%d4,%a4
	movel	%fp@(-4),%d5
	moveq	#18,%d0
	lsrl	%d0,%d5
	movel	%fp@(-4),%d0
	andil	#262143,%d0
	movel	%d0,%d7
	moveq	#44,%d1
	addal	%d1,%a2
	movel	%a2,%fp@(-16)
	movel	%fp@(16),%d1
	moveq	#16,%d2
	lsrl	%d2,%d1
	movel	%d1,%fp@(-12)
	moveal	%fp@(8),%a0
	moveq	#20,%d1
	addal	%d1,%a0
	movel	%a0,%fp@(-8)
	movel	%d0,%d6
	.short	0x4c3c,0x6806,0x0000,0x000a	/* mulsl	#10,%d6 */
	bras	.L100094d6

.L10009490:
	movel	%a4@+,%d0
	cmpl	%fp@(16),%d0
	bnes	.L100094ce
	moveal	%fp@(-16),%a0
	moveal	%a0@,%a0
	addal	%d6,%a0
	movel	%a0,%fp@(-20)
	movel	%fp@(-12),%d3
	moveal	%fp@(12),%a2
	movel	%a0@,%d0
	andil	#16777215,%d0
	moveal	%fp@(-8),%a0
	addl	%a0@,%d0
	moveal	%d0,%a3

.L100094bc:
	subql	#1,%d3
	cmpil	#0,%d3
	bmis	.L100094e6
	moveb	%a2@+,%d0
	moveb	%a3@+,%d1
	cmpb	%d1,%d0
	beqs	.L100094bc

.L100094ce:
	addil	#10,%d6
	addql	#1,%d7

.L100094d6:
	subql	#1,%d5
	cmpil	#0,%d5
	bpls	.L10009490
	movew	#-2802,%d0
	bras	.L10009550

.L100094e6:
	moveal	%fp@(20),%a2
	movel	%fp@(16),%a2@(8)
	moveal	%fp@(-20),%a3
	movel	%a3@,%d0
	moveq	#24,%d1
	lsrl	%d1,%d0
	moveb	%d0,%a2@(16)
	movel	%a3@,%d0
	andil	#16777215,%d0
	moveal	%fp@(8),%a4
	addl	%a4@(20),%d0
	movel	%d0,%a2@(12)
	movel	%d7,%a2@(20)
	movew	%a3@(8),%d0
	extl	%d0
	movel	%d0,%a2@
	movel	%a3@(4),%d0
	movel	%d0,%a2@(4)
	tstb	%a4@(77)
	beqs	.L1000954e
	movel	%a2@,%d1
	moveq	#-3,%d2
	cmpl	%d2,%d1
	bnes	.L1000954e
	tstl	%d0
	beqs	.L1000954e
	moveq	#-2,%d0
	movel	%d0,%a2@
	movel	%a3@(4),%d0
	asll	#2,%d0
	addl	%a4@(56),%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	movel	%d0,%a2@(4)

.L1000954e:
	clrw	%d0

.L10009550:
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	rts

sub_10009558:
	linkw	%fp,#0
	moveml	%d3/%d5/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	movel	%fp@(12),%d5
	moveal	%fp@(16),%a3
	movel	%a4,%d0
	beqs	.L10009580
	tstl	%d5
	bmis	.L10009580
	moveal	%a4@(16),%a0
	movel	%a0@(52),%d0
	cmpl	%d5,%d0
	bgts	.L10009584

.L10009580:
	moveq	#-50,%d0
	bras	.L100095fa

.L10009584:
	movel	%d5,%d0
	mulul	#10,%d0
	addl	%a4@(44),%d0
	moveal	%d0,%a2
	movel	%d5,%d0
	moveq	#2,%d3
	asll	%d3,%d0
	addl	%a4@(40),%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	movel	%d0,%a3@(8)
	movel	%a2@,%d0
	moveq	#24,%d1
	lsrl	%d1,%d0
	moveb	%d0,%a3@(16)
	movel	%a2@,%d0
	andil	#16777215,%d0
	addl	%a4@(20),%d0
	movel	%d0,%a3@(12)
	movel	%d5,%a3@(20)
	movew	%a2@(8),%d0
	extl	%d0
	movel	%d0,%a3@
	moveq	#-3,%d1
	cmpl	%d1,%d0
	bnes	.L100095f0
	tstb	%a4@(77)
	beqs	.L100095f0
	moveq	#-2,%d0
	movel	%d0,%a3@
	movel	%a2@(4),%d0
	asll	%d3,%d0
	addl	%a4@(56),%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	movel	%d0,%a3@(4)
	bras	.L100095f8

.L100095f0:
	movel	%a2@(4),%d0
	movel	%d0,%a3@(4)

.L100095f8:
	clrw	%d0

.L100095fa:
	moveml	%sp@+,%d3/%d5/%a2-%a4
	unlk	%fp
	rts

sub_10009602:
	linkw	%fp,#0
	moveml	%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	movel	%a4,%d0
	bnes	.L10009616
	moveq	#-50,%d0
	bras	.L1000965e

.L10009616:
	moveal	%a4,%a2
	moveq	#16,%d0
	addal	%d0,%a2
	moveal	%a2@,%a0
	movel	%a0@,%d0
	moveal	%fp@(12),%a3
	movel	%d0,%a3@
	moveal	%a2@,%a0
	movel	%a0@(4),%d0
	movel	%d0,%a3@(4)
	moveal	%a2@,%a0
	movel	%a0@(8),%d0
	moveal	%fp@(16),%a3
	movel	%d0,%a3@
	moveal	%a2@,%a0
	movel	%a0@(12),%d0
	movel	%d0,%a3@(4)
	moveal	%a2@,%a0
	movel	%a0@(16),%d0
	moveal	%fp@(20),%a3
	movel	%d0,%a3@
	moveal	%a2@,%a0
	movel	%a0@(20),%d0
	movel	%d0,%a3@(4)
	clrw	%d0

.L1000965e:
	moveml	%sp@+,%a2-%a4
	unlk	%fp
	rts

sub_10009666:
	linkw	%fp,#0
	moveml	%d3/%a3,%sp@-
	moveal	%fp@(8),%a3
	moveq	#0,%d3
	moveal	%fp@(12),%a0
	movel	%d3,%a0@
	moveal	%fp@(16),%a0
	movel	%d3,%a0@
	movel	%a3,%d0
	bnes	.L10009688
	moveq	#-50,%d0
	bras	.L100096a6

.L10009688:
	moveal	%a3@(16),%a0
	movel	%a0@(24),%d0
	moveal	%fp@(12),%a0
	movel	%d0,%a0@
	moveal	%a3@(16),%a0
	movel	%a0@(28),%d0
	moveal	%fp@(16),%a0
	movel	%d0,%a0@
	clrw	%d0

.L100096a6:
	moveml	%sp@+,%d3/%a3
	unlk	%fp
	rts

sub_100096ae:
	linkw	%fp,#0
	moveml	%a2-%a3,%sp@-
	moveal	%fp@(8),%a2
	moveal	%a2,%a3

.L100096bc:
	tstb	%a2@+
	bnes	.L100096bc
	moveal	%a2,%a0
	subqw	#1,%a0
	movel	%a0,%d0
	subl	%a3,%d0
	moveml	%sp@+,%a2-%a3
	unlk	%fp
	rts

sub_100096d0:
	linkw	%fp,#0
	moveml	%d4/%a2-%a4,%sp@-
	moveal	%fp@(8),%a2
	movel	%fp@(12),%d4
	moveal	%fp@(16),%a3
	movel	%a2,%d0
	beqs	.L100096f8
	tstl	%d4
	bmis	.L100096f8
	moveal	%a2@(16),%a0
	movel	%a0@(24),%d0
	cmpl	%d4,%d0
	bgts	.L100096fc

.L100096f8:
	moveq	#-50,%d0
	bras	.L1000973a

.L100096fc:
	movel	%d4,%d0
	mulul	#24,%d0
	addl	%a2@(28),%d0
	moveal	%d0,%a4
	moveal	%a2@(20),%a0
	addal	%a4@,%a0
	movel	%a0,%a3@(12)
	movel	%a0,%sp@-
	jsr	%pc@(sub_100096ae)
	addqw	#4,%sp
	movel	%d0,%a3@(8)
	movel	%a4@(8),%d0
	movel	%d0,%a3@
	movel	%a4@(4),%d0
	movel	%d0,%a3@(4)
	moveb	%a4@(20),%d0
	moveb	%d0,%a3@(16)
	clrw	%d0

.L1000973a:
	moveml	%sp@+,%d4/%a2-%a4
	unlk	%fp
	rts

sub_10009742:
	linkw	%fp,#-16
	moveml	%d3-%d4/%d6-%d7/%a2-%a4,%sp@-
	movel	%fp@(12),%d6
	movel	%fp@(8),%d0
	beqs	.L10009770
	moveal	%fp@(8),%a0
	movel	%a0@(16),%d0
	movel	%d0,%fp@(-12)
	moveq	#0,%d3
	cmpl	%d3,%d6
	bmis	.L10009770
	moveal	%d0,%a1
	movel	%a1@(28),%d1
	cmpl	%d6,%d1
	bgts	.L10009776

.L10009770:
	moveq	#-50,%d0
	jmp	%pc@(.L100097fc)

.L10009776:
	movel	%d6,%d1
	asll	#2,%d1
	addl	%a0@(32),%d1
	movel	%d1,%fp@(-16)
	moveal	%d1,%a1
	movel	%a1@,%d2
	moveq	#24,%d4
	lsrl	%d4,%d2
	moveal	%fp@(16),%a2
	moveb	%d2,%a2@(12)
	movel	%a1@,%d1
	andil	#16777215,%d1
	addl	%a0@(20),%d1
	movel	%d1,%a2@(8)
	movel	%d1,%sp@-
	jsr	%pc@(sub_100096ae)
	addqw	#4,%sp
	movel	%d0,%a2@(4)
	moveal	%fp@(8),%a0
	movel	%a0@(28),%d0
	movel	%d0,%fp@(-8)
	movel	%d3,%d7
	moveal	%fp@(-12),%a0
	addal	%d4,%a0
	movel	%a0,%fp@(-4)
	moveal	%d0,%a4
	moveq	#12,%d1
	addal	%d1,%a4
	moveal	%d0,%a3
	moveq	#16,%d0
	addal	%d0,%a3
	bras	.L100097f0

.L100097d4:
	movel	%a3@,%d3
	cmpl	%d6,%d3
	bgts	.L100097e8
	addl	%a4@,%d3
	cmpl	%d6,%d3
	bles	.L100097e8
	moveal	%fp@(16),%a0
	movel	%d7,%a0@
	bras	.L100097fa

.L100097e8:
	moveq	#24,%d3
	addal	%d3,%a4
	addal	%d3,%a3
	addql	#1,%d7

.L100097f0:
	moveal	%fp@(-4),%a0
	movel	%a0@,%d0
	cmpl	%d7,%d0
	bgts	.L100097d4

.L100097fa:
	clrw	%d0

.L100097fc:
	moveml	%sp@+,%d3-%d4/%d6-%d7/%a2-%a4
	unlk	%fp
	rts

sub_10009804:
	linkw	%fp,#0
	moveml	%d4/%a2,%sp@-
	moveal	%fp@(8),%a2
	movel	%fp@(12),%d4
	movel	%a2,%d0
	beqs	.L10009828
	tstl	%d4
	bmis	.L10009828
	moveal	%a2@(16),%a0
	movel	%a0@(28),%d0
	cmpl	%d4,%d0
	bgts	.L1000982c

.L10009828:
	moveq	#-50,%d0
	bras	.L1000983c

.L1000982c:
	movel	%d4,%d0
	asll	#2,%d0
	addl	%a2@(56),%d0
	moveal	%d0,%a0
	movel	%fp@(16),%a0@
	clrw	%d0

.L1000983c:
	moveml	%sp@+,%d4/%a2
	unlk	%fp
	rts

sub_10009844:
	linkw	%fp,#-164
	moveml	%d3-%d7/%a2-%a4,%sp@-
	movel	%fp@(12),%d5
	moveq	#0,%d3
	movel	%d3,%fp@(-140)
	lea	%pc@(byte_1000a14a),%a2
	moveal	%a2,%a0
	lea	%fp@(-136),%a1
	movel	#128,%d0
	_BlockMoveData
	movel	%fp@(8),%d0
	beqs	.L1000989c
	cmpl	%d3,%d5
	bmis	.L1000989c
	moveal	%fp@(8),%a0
	movel	%a0@(4),%d0
	cmpl	%d5,%d0
	bles	.L1000989c
	movel	%d5,%d0
	mulul	#28,%d0
	moveal	%fp@(8),%a0
	addl	%a0@(8),%d0
	moveal	%d0,%a3
	moveb	%a3@(24),%d3
	moveq	#4,%d0
	cmpb	%d0,%d3
	bnes	.L100098a2

.L1000989c:
	moveq	#-50,%d0
	jmp	%pc@(.L10009cfa)

.L100098a2:
	moveq	#2,%d0
	cmpb	%d0,%d3
	bnes	.L100098e0
	movel	%a3@(12),%d0
	addl	%fp@(16),%d0
	movel	%d0,%sp@-
	movel	%fp@(16),%sp@-
	moveal	%a0@,%a2
	addal	%a3@(20),%a2
	movel	%a2,%fp@(-4)
	addal	%a3@(16),%a2
	movel	%a2,%sp@-
	moveal	%fp@(-4),%a0
	movel	%a0,%sp@-
	jsr	%pc@(sub_10009ee6)
	lea	%sp@(16),%sp
	extl	%d0
	movel	%d0,%fp@(-140)
	tstl	%d0
	bnew	.L10009cf6

.L100098e0:
	moveal	%fp@(8),%a2
	moveb	#1,%a2@(77)
	moveal	%a2,%a3
	addqw	#4,%a3
	moveal	%a2,%a4
	moveq	#24,%d0
	addal	%d0,%a4
	moveq	#0,%d3
	bras	.L10009914

.L100098f8:
	clrw	%d0
	jmp	%pc@(.L10009cfa)

.L100098fe:
	moveal	%a4@,%a0
	addal	%d3,%a0
	movel	%a0,%fp@(-164)
	movew	%a0@,%d0
	extl	%d0
	cmpl	%d5,%d0
	beqs	.L10009924
	addil	#12,%d3

.L10009914:
	movel	%a3@,%d0
	mulsl	#12,%d0
	cmpl	%d3,%d0
	bgts	.L100098fe
	bras	.L100098f8

.L10009924:
	moveal	%fp@(8),%a2
	movel	%a2@(52),%d0
	movel	%d0,%fp@(-144)
	movel	%a2@(56),%d1
	movel	%d1,%fp@(-148)
	moveal	%a2@(48),%a4
	moveal	%fp@(-164),%a2
	addal	%a2@(8),%a4
	movel	%a2@(4),%d1
	addl	%d1,%d1
	addl	%a4,%d1
	movel	%d1,%fp@(-160)
	moveal	%fp@(16),%a3
	moveq	#0,%d7
	moveal	%d0,%a0
	movel	%a0@,%d6
	movel	%a0@(4),%d5
	moveq	#0,%d0
	movel	%d0,%fp@(-152)
	braw	.L10009cee

.L10009968:
	movel	%a4@,%d0
	movel	%d0,%fp@(-156)
	addqw	#2,%a4
	movel	%fp@(-156),%d3
	moveq	#25,%d1
	lsrl	%d1,%d3
	lea	%fp@(-136),%a0
	moveb	%a0@(%d3:w),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	tstl	%d0
	beqw	.L10009a0e
	moveq	#32,%d1
	cmpl	%d1,%d0
	beqw	.L10009a3e
	moveq	#33,%d1
	cmpl	%d1,%d0
	beqw	.L10009a60
	moveq	#34,%d1
	cmpl	%d1,%d0
	beqw	.L10009a82
	moveq	#35,%d1
	cmpl	%d1,%d0
	beqw	.L10009aa8
	moveq	#36,%d1
	cmpl	%d1,%d0
	beqw	.L10009acc
	moveq	#37,%d1
	cmpl	%d1,%d0
	beqw	.L10009af0
	moveq	#48,%d1
	cmpl	%d1,%d0
	beqw	.L10009b20
	moveq	#49,%d1
	cmpl	%d1,%d0
	beqw	.L10009b42
	moveq	#50,%d1
	cmpl	%d1,%d0
	beqw	.L10009b5e
	moveq	#51,%d1
	cmpl	%d1,%d0
	beqw	.L10009b7a
	moveq	#64,%d1
	cmpl	%d1,%d0
	beqw	.L10009b98
	moveq	#72,%d1
	cmpl	%d1,%d0
	beqw	.L10009bb2
	moveq	#80,%d1
	cmpl	%d1,%d0
	beqw	.L10009bf0
	moveq	#82,%d1
	cmpl	%d1,%d0
	beqw	.L10009c14
	moveq	#88,%d1
	cmpl	%d1,%d0
	beqw	.L10009c42
	moveq	#90,%d1
	cmpl	%d1,%d0
	beqw	.L10009c88
	braw	.L10009ce8

.L10009a0e:
	movel	%fp@(-156),%d3
	moveq	#22,%d0
	lsrl	%d0,%d3
	andil	#255,%d3
	lsll	#2,%d3
	addal	%d3,%a3
	movel	%fp@(-156),%d4
	moveq	#16,%d0
	lsrl	%d0,%d4
	moveq	#63,%d0
	andl	%d0,%d4
	bras	.L10009a30

.L10009a2e:
	addl	%d5,%a3@+

.L10009a30:
	subql	#1,%d4
	cmpil	#0,%d4
	bmiw	.L10009cee
	bras	.L10009a2e

.L10009a3e:
	movel	%fp@(-156),%d4
	moveq	#16,%d0
	lsrl	%d0,%d4
	andil	#511,%d4
	addql	#1,%d4
	bras	.L10009a52

.L10009a50:
	addl	%d6,%a3@+

.L10009a52:
	subql	#1,%d4
	cmpil	#0,%d4
	bmiw	.L10009cee
	bras	.L10009a50

.L10009a60:
	movel	%fp@(-156),%d4
	moveq	#16,%d0
	lsrl	%d0,%d4
	andil	#511,%d4
	addql	#1,%d4
	bras	.L10009a74

.L10009a72:
	addl	%d5,%a3@+

.L10009a74:
	subql	#1,%d4
	cmpil	#0,%d4
	bmiw	.L10009cee
	bras	.L10009a72

.L10009a82:
	movel	%fp@(-156),%d4
	moveq	#16,%d0
	lsrl	%d0,%d4
	andil	#511,%d4
	addql	#1,%d4
	bras	.L10009a9a

.L10009a94:
	addl	%d6,%a3@+
	addl	%d5,%a3@+
	addqw	#4,%a3

.L10009a9a:
	subql	#1,%d4
	cmpil	#0,%d4
	bmiw	.L10009cee
	bras	.L10009a94

.L10009aa8:
	movel	%fp@(-156),%d4
	moveq	#16,%d0
	lsrl	%d0,%d4
	andil	#511,%d4
	addql	#1,%d4
	bras	.L10009abe

.L10009aba:
	addl	%d6,%a3@+
	addl	%d5,%a3@+

.L10009abe:
	subql	#1,%d4
	cmpil	#0,%d4
	bmiw	.L10009cee
	bras	.L10009aba

.L10009acc:
	movel	%fp@(-156),%d4
	moveq	#16,%d0
	lsrl	%d0,%d4
	andil	#511,%d4
	addql	#1,%d4
	bras	.L10009ae2

.L10009ade:
	addl	%d5,%a3@+
	addqw	#4,%a3

.L10009ae2:
	subql	#1,%d4
	cmpil	#0,%d4
	bmiw	.L10009cee
	bras	.L10009ade

.L10009af0:
	movel	%fp@(-156),%d4
	moveq	#16,%d0
	lsrl	%d0,%d4
	andil	#511,%d4
	addql	#1,%d4
	bras	.L10009b12

.L10009b02:
	movel	%d7,%d0
	addql	#1,%d7
	asll	#2,%d0
	addl	%fp@(-148),%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	addl	%d0,%a3@+

.L10009b12:
	subql	#1,%d4
	cmpil	#0,%d4
	bmiw	.L10009cee
	bras	.L10009b02

.L10009b20:
	movel	%fp@(-156),%d7
	moveq	#16,%d0
	lsrl	%d0,%d7
	andil	#511,%d7
	movel	%d7,%d0
	addql	#1,%d7
	asll	#2,%d0
	addl	%fp@(-148),%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	addl	%d0,%a3@+
	braw	.L10009cee

.L10009b42:
	movel	%fp@(-156),%d0
	moveq	#16,%d1
	lsrl	%d1,%d0
	andil	#511,%d0
	lsll	#2,%d0
	addl	%fp@(-144),%d0
	moveal	%d0,%a0
	movel	%a0@,%d6
	braw	.L10009cee

.L10009b5e:
	movel	%fp@(-156),%d0
	moveq	#16,%d1
	lsrl	%d1,%d0
	andil	#511,%d0
	lsll	#2,%d0
	addl	%fp@(-144),%d0
	moveal	%d0,%a0
	movel	%a0@,%d5
	braw	.L10009cee

.L10009b7a:
	movel	%fp@(-156),%d0
	moveq	#16,%d1
	lsrl	%d1,%d0
	andil	#511,%d0
	lsll	#2,%d0
	addl	%fp@(-144),%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	addl	%d0,%a3@+
	braw	.L10009cee

.L10009b98:
	movel	%fp@(-156),%d0
	moveq	#16,%d1
	lsrl	%d1,%d0
	andil	#4095,%d0
	addl	%a3,%d0
	moveal	%d0,%a0
	addqw	#1,%a0
	moveal	%a0,%a3
	braw	.L10009cee

.L10009bb2:
	subql	#1,%fp@(-152)
	beqw	.L10009cee
	cmpil	#0,%fp@(-152)
	bpls	.L10009bd8
	movel	%fp@(-156),%d0
	moveq	#16,%d1
	lsrl	%d1,%d0
	andil	#255,%d0
	addql	#1,%d0
	movel	%d0,%fp@(-152)

.L10009bd8:
	movel	%fp@(-156),%d4
	moveq	#24,%d0
	lsrl	%d0,%d4
	moveq	#15,%d0
	andl	%d0,%d4
	addql	#2,%d4
	movel	%d4,%d0
	addl	%d0,%d0
	subal	%d0,%a4
	braw	.L10009cee

.L10009bf0:
	movel	%fp@(-156),%d0
	moveq	#16,%d3
	lsrl	%d3,%d0
	andil	#1023,%d0
	lsll	%d3,%d0
	movew	%a4@,%d2
	moveq	#0,%d1
	movew	%d2,%d1
	addl	%d1,%d0
	addl	%fp@(16),%d0
	moveal	%d0,%a3
	addqw	#2,%a4
	braw	.L10009cee

.L10009c14:
	movel	%fp@(-156),%d7
	moveq	#16,%d3
	lsrl	%d3,%d7
	andil	#1023,%d7
	lsll	%d3,%d7
	movew	%a4@,%d1
	moveq	#0,%d0
	movew	%d1,%d0
	addl	%d0,%d7
	addqw	#2,%a4
	movel	%d7,%d0
	addql	#1,%d7
	asll	#2,%d0
	addl	%fp@(-148),%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	addl	%d0,%a3@+
	braw	.L10009cee

.L10009c42:
	subql	#1,%fp@(-152)
	bnes	.L10009c4e
	addqw	#2,%a4
	braw	.L10009cee

.L10009c4e:
	cmpil	#0,%fp@(-152)
	bpls	.L10009c72
	movel	%fp@(-156),%d0
	moveq	#16,%d3
	lsrl	%d3,%d0
	moveq	#63,%d1
	andl	%d1,%d0
	lsll	%d3,%d0
	movew	%a4@,%d2
	moveq	#0,%d1
	movew	%d2,%d1
	addl	%d1,%d0
	movel	%d0,%fp@(-152)

.L10009c72:
	movel	%fp@(-156),%d4
	moveq	#22,%d0
	lsrl	%d0,%d4
	moveq	#15,%d0
	andl	%d0,%d4
	addql	#2,%d4
	movel	%d4,%d0
	addl	%d0,%d0
	subal	%d0,%a4
	bras	.L10009cee

.L10009c88:
	movel	%fp@(-156),%d4
	moveq	#16,%d3
	lsrl	%d3,%d4
	moveq	#63,%d0
	andl	%d0,%d4
	lsll	%d3,%d4
	movew	%a4@,%d1
	moveq	#0,%d0
	movew	%d1,%d0
	addl	%d0,%d4
	movel	%fp@(-156),%d0
	moveq	#22,%d1
	lsrl	%d1,%d0
	moveq	#15,%d1
	andl	%d1,%d0
	beqs	.L10009cba
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10009cca
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10009cd8
	bras	.L10009ce4

.L10009cba:
	movel	%d4,%d0
	asll	#2,%d0
	addl	%fp@(-144),%d0
	moveal	%d0,%a0
	movel	%a0@,%d0
	addl	%d0,%a3@+
	bras	.L10009ce4

.L10009cca:
	movel	%d4,%d0
	asll	#2,%d0
	addl	%fp@(-144),%d0
	moveal	%d0,%a0
	movel	%a0@,%d6
	bras	.L10009ce4

.L10009cd8:
	movel	%d4,%d0
	asll	#2,%d0
	addl	%fp@(-144),%d0
	moveal	%d0,%a0
	movel	%a0@,%d5

.L10009ce4:
	addqw	#2,%a4
	bras	.L10009cee

.L10009ce8:
	moveq	#-4,%d0
	movel	%d0,%fp@(-140)

.L10009cee:
	cmpal	%fp@(-160),%a4
	bcsw	.L10009968

.L10009cf6:
	movew	%fp@(-138),%d0

.L10009cfa:
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	rts

sub_10009d02:
	linkw	%fp,#-80
	moveml	%d3-%d4/%a2-%a3,%sp@-
	moveal	%fp@(20),%a2
	moveq	#80,%d0
	movel	%d0,%sp@-
	pea	%fp@(-80)
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	moveq	#18,%d0
	movel	%d0,%fp@(-80)
	movel	#1885693542,%d3
	movel	%d3,%fp@(-76)
	lea	%pc@(sub_10009d02),%a0
	movel	%a0,%fp@(-72)
	lea	%pc@(sub_100090e0),%a0
	movel	%a0,%fp@(-68)
	lea	%pc@(sub_10009150),%a0
	movel	%a0,%fp@(-64)
	lea	%pc@(sub_10009196),%a0
	movel	%a0,%fp@(-60)
	lea	%pc@(sub_1000927e),%a0
	movel	%a0,%fp@(-56)
	lea	%pc@(sub_10009398),%a0
	movel	%a0,%fp@(-52)
	lea	%pc@(sub_100093f2),%a0
	movel	%a0,%fp@(-48)
	lea	%pc@(sub_10009558),%a0
	movel	%a0,%fp@(-44)
	lea	%pc@(sub_10009410),%a0
	movel	%a0,%fp@(-40)
	lea	%pc@(sub_10009602),%a0
	movel	%a0,%fp@(-36)
	lea	%pc@(sub_10009666),%a0
	movel	%a0,%fp@(-32)
	lea	%pc@(sub_100096d0),%a0
	movel	%a0,%fp@(-28)
	lea	%pc@(sub_10009742),%a0
	movel	%a0,%fp@(-24)
	lea	%pc@(sub_10009804),%a0
	movel	%a0,%fp@(-20)
	lea	%pc@(sub_10009844),%a0
	movel	%a0,%fp@(-16)
	lea	%pc@(sub_100092ba),%a0
	movel	%a0,%fp@(-12)
	moveq	#0,%d4
	movel	%d4,%fp@(-8)
	movel	%d4,%fp@(-4)
	movel	%a2,%d0
	beqs	.L10009dea
	movew	%a2@,%d0
	cmpiw	#19055,%d0
	bnes	.L10009de4
	movew	%a2@(2),%d0
	cmpiw	#31009,%d0
	bnes	.L10009de4
	movel	%a2@(4),%d0
	cmpl	%d3,%d0
	bnes	.L10009de4
	movel	%a2@(12),%d0
	moveq	#1,%d1
	cmpl	%d1,%d0
	bnes	.L10009de4
	movew	%a2@(32),%d0
	bpls	.L10009dea

.L10009de4:
	movew	#-2806,%d0
	bras	.L10009e3c

.L10009dea:
	jsr	%pc@(sub_100033dc)
	moveal	%d0,%a3
	tstl	%a3@
	bnes	.L10009e12
	moveq	#80,%d0
	movel	%d0,%sp@-
	jsr	%pc@(sub_10005f34)
	addqw	#4,%sp
	movel	%d0,%a3@
	tstl	%d0
	bnes	.L10009e08
	moveq	#-108,%d0
	bras	.L10009e3c

.L10009e08:
	lea	%fp@(-80),%a0
	moveal	%a3@,%a1
	moveq	#80,%d0
	_BlockMoveData

.L10009e12:
	movel	%a3@,%d0
	moveal	%fp@(8),%a0
	movel	%d0,%a0@
	movel	%a2,%d0
	bnes	.L10009e22
	clrw	%d0
	bras	.L10009e3c

.L10009e22:
	movel	%fp@(34),%sp@-
	movel	%fp@(30),%sp@-
	moveb	%fp@(28),%sp@-
	movel	%a2,%sp@-
	movel	%fp@(12),%sp@-
	jsr	%pc@(sub_10008ee2)
	lea	%sp@(18),%sp

.L10009e3c:
	moveml	%sp@+,%d3-%d4/%a2-%a3
	unlk	%fp
	rts

sub_10009e44:
	linkw	%fp,#-4
	moveml	%d3-%d5/%a2,%sp@-
	moveal	%fp@(8),%a2
	moveb	%a2@+,%d0
	moveq	#0,%d5
	moveb	%d0,%d5
	movel	%d5,%d0
	andil	#128,%d0
	beqs	.L10009ed6
	moveb	%a2@+,%d0
	moveb	%d0,%fp@(-4)
	movel	%d5,%d1
	moveq	#127,%d2
	andl	%d2,%d1
	moveq	#7,%d3
	asll	%d3,%d1
	movel	%d1,%d5
	andib	#0x80,%d0
	beqs	.L10009ecc
	moveb	%fp@(-4),%d1
	moveb	%d2,%d4
	andb	%d4,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addl	%d0,%d5
	moveb	%a2@+,%d0
	moveb	%d0,%fp@(-4)
	movel	%d5,%d1
	asll	#7,%d1
	movel	%d1,%d5
	andib	#0x80,%d0
	beqs	.L10009ecc
	moveb	%fp@(-4),%d1
	andb	%d4,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addl	%d0,%d5
	moveb	%a2@+,%d0
	moveb	%d0,%fp@(-4)
	movel	%d5,%d1
	asll	#7,%d1
	movel	%d1,%d5
	andib	#0x80,%d0
	beqs	.L10009ecc
	moveb	%fp@(-4),%d1
	andb	%d4,%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addl	%d0,%d5
	moveb	%a2@+,%fp@(-4)
	movel	%d5,%d0
	asll	#7,%d0
	movel	%d0,%d5

.L10009ecc:
	moveb	%fp@(-4),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	addl	%d0,%d5

.L10009ed6:
	moveal	%fp@(12),%a0
	movel	%a2,%a0@
	movel	%d5,%d0
	moveml	%sp@+,%d3-%d5/%a2
	unlk	%fp
	rts

sub_10009ee6:
	linkw	%fp,#-8
	moveml	%d3-%d7/%a2-%a4,%sp@-
	moveal	%fp@(8),%a4
	moveal	%fp@(16),%a3
	braw	.L10009fc0

.L10009efa:
	moveb	%a4@+,%d0
	moveb	%d0,%fp@(-8)
	moveb	%d0,%d4
	moveq	#0,%d3
	moveb	%d4,%d3
	moveq	#0,%d1
	movew	%d3,%d1
	moveq	#31,%d2
	andb	%d2,%d0
	moveq	#0,%d1
	moveb	%d0,%d1
	beqs	.L10009f18
	movel	%d1,%d5
	bras	.L10009f78

.L10009f18:
	pea	%fp@(-4)
	movel	%a4,%sp@-
	jsr	%pc@(sub_10009e44)
	addqw	#8,%sp
	movel	%d0,%d5
	moveal	%fp@(-4),%a4
	moveb	%fp@(-8),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	asrl	#5,%d0
	tstl	%d0
	beqs	.L10009f40
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10009f58
	bras	.L10009f78

.L10009f40:
	moveal	%a3,%a2
	addal	%d5,%a2
	cmpal	%fp@(20),%a2
	bhis	.L10009f62
	movel	%d5,%sp@-
	movel	%a3,%sp@-
	jsr	%pc@(local_bzero)
	addqw	#8,%sp
	addal	%d5,%a3
	bras	.L10009fc0

.L10009f58:
	moveal	%a3,%a2
	addal	%d5,%a2
	cmpal	%fp@(20),%a2
	blss	.L10009f68

.L10009f62:
	moveq	#-1,%d0
	jmp	%pc@(.L1000a142)

.L10009f68:
	moveal	%fp@(-4),%a0
	moveal	%a3,%a1
	movel	%d5,%d0
	_BlockMoveData
	addal	%d5,%a4
	addal	%d5,%a3
	bras	.L10009fc0

.L10009f78:
	moveb	%fp@(-8),%d1
	moveq	#0,%d0
	moveb	%d1,%d0
	asrl	#5,%d0
	tstl	%d0
	beqs	.L10009fa6
	moveq	#1,%d1
	cmpl	%d1,%d0
	beqs	.L10009fcc
	moveq	#2,%d1
	cmpl	%d1,%d0
	beqs	.L10009fe8
	moveq	#4,%d1
	cmpl	%d1,%d0
	beqw	.L1000a058
	moveq	#3,%d1
	cmpl	%d1,%d0
	beqw	.L1000a0cc
	braw	.L1000a140

.L10009fa6:
	moveal	%a3,%a0
	addal	%d5,%a0
	cmpal	%fp@(20),%a0
	bhiw	.L1000a140
	bras	.L10009fb6

.L10009fb4:
	clrb	%a3@+

.L10009fb6:
	subql	#1,%d5
	cmpil	#0,%d5
	bpls	.L10009fb4

.L10009fc0:
	cmpal	%fp@(12),%a4
	bccw	.L1000a13c
	braw	.L10009efa

.L10009fcc:
	moveal	%a3,%a0
	addal	%d5,%a0
	cmpal	%fp@(20),%a0
	bhiw	.L1000a140
	bras	.L10009fdc

.L10009fda:
	moveb	%a4@+,%a3@+

.L10009fdc:
	subql	#1,%d5
	cmpil	#0,%d5
	bmis	.L10009fc0
	bras	.L10009fda

.L10009fe8:
	pea	%fp@(-4)
	movel	%a4,%sp@-
	jsr	%pc@(sub_10009e44)
	addqw	#8,%sp
	movel	%d0,%d6
	addql	#1,%d6
	moveal	%fp@(-4),%a4
	cmpil	#1,%d5
	bnes	.L1000a046
	moveb	%a4@+,%fp@(-8)
	moveal	%a3,%a0
	addal	%d6,%a0
	cmpal	%fp@(20),%a0
	bhiw	.L1000a140
	bras	.L1000a01a

.L1000a016:
	moveb	%fp@(-8),%a3@+

.L1000a01a:
	subql	#1,%d6
	cmpil	#0,%d6
	bmis	.L10009fc0
	bras	.L1000a016

.L1000a026:
	moveal	%fp@(-4),%a4
	movel	%d5,%d4
	cmpal	%fp@(20),%a2
	bhiw	.L1000a140
	bras	.L1000a03a

.L1000a036:
	addqw	#1,%a2
	moveb	%a4@+,%a3@+

.L1000a03a:
	subql	#1,%d4
	cmpil	#0,%d4
	bpls	.L1000a036
	bras	.L1000a04a

.L1000a046:
	moveal	%a3,%a2
	addal	%d5,%a2

.L1000a04a:
	subql	#1,%d6
	cmpil	#0,%d6
	bmiw	.L10009fc0
	bras	.L1000a026

.L1000a058:
	pea	%fp@(-4)
	movel	%a4,%sp@-
	jsr	%pc@(sub_10009e44)
	addqw	#8,%sp
	movel	%d0,%d7
	pea	%fp@(-4)
	movel	%fp@(-4),%sp@-
	jsr	%pc@(sub_10009e44)
	addqw	#8,%sp
	movel	%d0,%d6
	moveq	#0,%d3
	bras	.L1000a0a4

.L1000a07a:
	subql	#1,%d6
	cmpil	#0,%d6
	bmis	.L1000a0c6
	addal	%d3,%a4
	movel	%d7,%d4
	moveal	%a3,%a0
	addal	%d7,%a0
	cmpal	%fp@(20),%a0
	bhiw	.L1000a140
	bras	.L1000a098

.L1000a096:
	moveb	%a4@+,%a3@+

.L1000a098:
	subql	#1,%d4
	cmpil	#0,%d4
	bpls	.L1000a096
	addl	%d7,%d3

.L1000a0a4:
	moveal	%fp@(-4),%a4
	movel	%d5,%d4
	moveal	%a3,%a0
	addal	%d5,%a0
	cmpal	%fp@(20),%a0
	bhiw	.L1000a140
	bras	.L1000a0ba

.L1000a0b8:
	clrb	%a3@+

.L1000a0ba:
	subql	#1,%d4
	cmpil	#0,%d4
	bmis	.L1000a07a
	bras	.L1000a0b8

.L1000a0c6:
	addal	%d3,%a4
	braw	.L10009fc0

.L1000a0cc:
	pea	%fp@(-4)
	movel	%a4,%sp@-
	jsr	%pc@(sub_10009e44)
	addqw	#8,%sp
	movel	%d0,%d7
	pea	%fp@(-4)
	movel	%fp@(-4),%sp@-
	jsr	%pc@(sub_10009e44)
	addqw	#8,%sp
	movel	%d0,%d6
	moveq	#0,%d3
	bras	.L1000a116

.L1000a0ee:
	subql	#1,%d6
	cmpil	#0,%d6
	bmis	.L1000a136
	addal	%d3,%a4
	movel	%d7,%d4
	moveal	%a3,%a0
	addal	%d7,%a0
	cmpal	%fp@(20),%a0
	bhis	.L1000a140
	bras	.L1000a10a

.L1000a108:
	moveb	%a4@+,%a3@+

.L1000a10a:
	subql	#1,%d4
	cmpil	#0,%d4
	bpls	.L1000a108
	addl	%d7,%d3

.L1000a116:
	moveal	%fp@(-4),%a4
	movel	%d5,%d4
	moveal	%a3,%a0
	addal	%d5,%a0
	cmpal	%fp@(20),%a0
	bhis	.L1000a140
	bras	.L1000a12a

.L1000a128:
	moveb	%a4@+,%a3@+

.L1000a12a:
	subql	#1,%d4
	cmpil	#0,%d4
	bmis	.L1000a0ee
	bras	.L1000a128

.L1000a136:
	addal	%d3,%a4
	braw	.L10009fc0

.L1000a13c:
	clrw	%d0
	bras	.L1000a142

.L1000a140:
	moveq	#-18,%d0

.L1000a142:
	moveml	%sp@+,%d3-%d7/%a2-%a4
	unlk	%fp
	rts

byte_1000a14a:
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte	0x20,0x21,0x22,0x23,0x24,0x25,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff
	.byte	0x30,0x31,0x32,0x33,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff
	.byte	0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x48,0x48,0x48,0x48,0x48,0x48,0x48,0x48
	.byte	0x50,0x50,0x52,0x52,0xff,0xff,0xff,0xff,0x58,0x58,0x5a,0x5a,0xff,0xff,0xff,0xff
	.byte	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff
	.byte	0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff

local_memcpy:
	moveml	%sp@(4),%a0-%a1
	movel	%a0,%d0
	movel	%d2,%sp@-
	movel	%sp@(16),%d1
	cmpil	#17,%d1
	blts	.L1000a20e
	movel	%a1,%d2
	eorb	%d0,%d2
	lsrb	#1,%d2
	bcss	.L1000a20e
	btst	#0,%d0
	beqs	.L1000a1f2
	moveb	%a1@+,%a0@+
	subql	#1,%d1

.L1000a1f2:
	movel	%d1,%d2
	lsrl	#4,%d2
	subql	#1,%d2

.L1000a1f8:
	movel	%a1@+,%a0@+
	movel	%a1@+,%a0@+
	movel	%a1@+,%a0@+
	movel	%a1@+,%a0@+
	subql	#1,%d2
	bccs	.L1000a1f8
	andil	#15,%d1
	bras	.L1000a20e

.L1000a20c:
	moveb	%a1@+,%a0@+

.L1000a20e:
	subql	#1,%d1
	bccs	.L1000a20c
	movel	%sp@+,%d2
	rts

	.byte	0x86
	.ascii	"memcpy"

	.align	16

sub_1000a220:
	moveml	%sp@(4),%a0-%a1
	movel	%sp@(12),%d2
	movel	%a0,%d0
	cmpal	%a1,%a0
	bnes	.L1000a232
	rts

.L1000a232:
	bhis	.L1000a2a2
	cmpil	#17,%d2
	bcss	.L1000a276
	movel	%a1,%d1
	eorb	%d0,%d1
	lsrb	#1,%d1
	bcss	.L1000a276
	btst	#0,%d0
	beqs	.L1000a24e
	moveb	%a1@+,%a0@+
	subql	#1,%d2

.L1000a24e:
	movel	%d2,%d1
	lsrl	#4,%d1
	subql	#1,%d1

.L1000a254:
	movel	%a1@+,%a0@+
	movel	%a1@+,%a0@+
	movel	%a1@+,%a0@+
	movel	%a1@+,%a0@+
	dbf	%d1,.L1000a254
	swap	%d1
	tstw	%d1
	beqs	.L1000a26c
	subqw	#1,%d1
	swap	%d1
	bras	.L1000a254

.L1000a26c:
	andil	#15,%d2
	bras	.L1000a276

.L1000a274:
	moveb	%a1@+,%a0@+

.L1000a276:
	dbf	%d2,.L1000a274
	swap	%d2
	tstw	%d2
	beqs	.L1000a2a0
	swap	%d2
	clrw	%d2
	lsrl	#2,%d2
	bras	.L1000a290

.L1000a288:
	moveb	%a1@+,%a0@+
	moveb	%a1@+,%a0@+
	moveb	%a1@+,%a0@+
	moveb	%a1@+,%a0@+

.L1000a290:
	dbf	%d2,.L1000a288
	swap	%d2
	tstw	%d2
	beqs	.L1000a2a0
	subqw	#1,%d2
	swap	%d2
	bras	.L1000a288

.L1000a2a0:
	rts

.L1000a2a2:
	addal	%d2,%a0
	addal	%d2,%a1
	cmpil	#17,%d2
	bcss	.L1000a2e8
	movel	%a1,%d1
	addw	%a0,%d1
	lsrb	#1,%d1
	bcss	.L1000a2e8
	movel	%a0,%d1
	lsrb	#1,%d1
	bccs	.L1000a2c0
	moveb	%a1@-,%a0@-
	subql	#1,%d2

.L1000a2c0:
	movel	%d2,%d1
	lsrl	#4,%d1
	subql	#1,%d1

.L1000a2c6:
	movel	%a1@-,%a0@-
	movel	%a1@-,%a0@-
	movel	%a1@-,%a0@-
	movel	%a1@-,%a0@-
	dbf	%d1,.L1000a2c6
	swap	%d1
	tstw	%d1
	beqs	.L1000a2de
	subqw	#1,%d1
	swap	%d1
	bras	.L1000a2c6

.L1000a2de:
	andil	#15,%d2
	bras	.L1000a2e8

.L1000a2e6:
	moveb	%a1@-,%a0@-

.L1000a2e8:
	dbf	%d2,.L1000a2e6
	swap	%d2
	tstw	%d2
	beqs	.L1000a312
	swap	%d2
	clrw	%d2
	lsrl	#2,%d2
	bras	.L1000a302

.L1000a2fa:
	moveb	%a1@-,%a0@-
	moveb	%a1@-,%a0@-
	moveb	%a1@-,%a0@-
	moveb	%a1@-,%a0@-

.L1000a302:
	dbf	%d2,.L1000a2fa
	swap	%d2
	tstw	%d2
	beqs	.L1000a312
	subqw	#1,%d2
	swap	%d2
	bras	.L1000a2fa

.L1000a312:
	rts

	.byte	0x87
	.ascii	"memmove"

	.byte	0x00,0x00

sub_1000a31e:
	movel	%sp@+,%d0
	moveal	%sp@+,%a1
	moveal	%sp@+,%a0
	movel	%d0,%sp@-
	moveq	#0,%d0
	moveq	#0,%d1
	moveb	%a0@+,%d0
	moveb	%a1@+,%d1
	subw	%d1,%d0
	bges	.L1000a334
	addw	%d0,%d1

.L1000a334:
	cmpb	%d0,%d0
	bras	.L1000a33a

.L1000a338:
	cmpmb	%a1@+,%a0@+

.L1000a33a:
	dbne	%d1,.L1000a338
	beqs	.L1000a34a
	blts	.L1000a346
	moveq	#1,%d0
	bras	.L1000a34a

.L1000a346:
	moveq	#1,%d0
	negw	%d0

.L1000a34a:
	movew	%d0,%sp@(4)
	rts

	.byte	0x88
	.ascii	"PLStrCmp"
	.byte	0x00,0x00,0x00

local_getptrsize:
	moveal	%sp@+,%a1
	moveal	%sp@+,%a0
	_GetPtrSize
	movel	%d0,%sp@
	bpls	.L1000a368
	clrl	%sp@

.L1000a368:
	jmp	%a1@

sub_1000a36a:
	moveal	%sp@+,%a1
	moveal	%sp@+,%a0
	.short	0xa025
	movel	%d0,%sp@
	bpls	.L1000a376
	clrl	%sp@

.L1000a376:
	jmp	%a1@

sub_1000a378:
	moveal	%sp@+,%a1
	moveb	%sp@+,%d1
	movew	%sp@+,%d0
	tstb	%d1
	beqs	.L1000a386
	.short	0xa746
	bras	.L1000a388

.L1000a386:
	.short	0xa346

.L1000a388:
	movel	%a0,%sp@
	jmp	%a1@

sub_1000a38c:
	moveal	%sp@+,%a1
	moveb	%sp@+,%d1
	movew	%sp@+,%d0
	moveal	%sp@+,%a0
	tstb	%d1
	beqs	.L1000a39c
	.short	0xa647
	bras	.L1000a39e

.L1000a39c:
	.short	0xa247

.L1000a39e:
	jmp	%a1@

sub_1000a3a0:
	linkw	%fp,#-50
	moveal	%sp,%a0
	movew	%fp@(8),%a0@(24)
	.short	0xa001
	movew	%d0,%fp@(10)
	unlk	%fp
	moveal	%sp@+,%a0
	addql	#2,%sp
	jmp	%a0@

sub_1000a3ba:
	linkw	%fp,#-122
	moveal	%sp,%a0
	movel	%fp@(16),%a0@(18)
	movew	%fp@(20),%a0@(22)
	clrw	%a0@(28)
	_PBHGetVInfoSync
	movew	%d0,%fp@(22)
	moveal	%fp@(12),%a1
	movew	%a0@(22),%a1@
	movel	%a0@(48),%d0
	moveq	#9,%d1
	asrl	%d1,%d0
	muluw	%a0@(62),%d0
	asll	%d1,%d0
	moveal	%fp@(8),%a1
	movel	%d0,%a1@
	unlk	%fp
	moveal	%sp@+,%a1
	lea	%sp@(14),%sp
	jmp	%a1@

local_geteof:
	linkw	%fp,#-50
	moveal	%sp,%a0
	movew	%fp@(12),%a0@(24)
	_GetEOF
	movew	%d0,%fp@(14)
	moveal	%fp@(8),%a1
	movel	%a0@(28),%a1@
	unlk	%fp
	moveal	%sp@+,%a1
	addql	#6,%sp
	jmp	%a1@

local_setfpos:
	linkw	%fp,#-50
	moveal	%sp,%a0
	movew	%fp@(14),%a0@(24)
	movew	%fp@(12),%a0@(44)
	movel	%fp@(8),%a0@(46)
	_SetFPos
	movew	%d0,%fp@(16)
	unlk	%fp
	moveal	%sp@+,%a1
	addql	#8,%sp
	jmp	%a1@

sub_1000a444:
	moveal	%sp@+,%a1
	moveq	#0,%d1
	movew	%sp@(4),%d1
	moveal	0x34e,%a0
	movew	0x3f6,%d0
	bmis	.L1000a45a
	divuw	%d0,%d1
	bras	.L1000a45e

.L1000a45a:
	divuw	#94,%d1

.L1000a45e:
	swap	%d1
	subqw	#2,%d1
	bnes	.L1000a478
	movew	%sp@(4),%d0
	cmpw	%a0@,%d0
	bccs	.L1000a478
	moveal	%a0@(0x14,%d0:w),%a0
	movew	%a0@(78),%d0
	moveq	#0,%d1
	bras	.L1000a47e

.L1000a478:
	moveq	#0,%d0
	movew	#-51,%d1

.L1000a47e:
	moveal	%sp@,%a0
	movew	%d0,%a0@
	addqw	#6,%sp
	movew	%d1,%sp@
	jmp	%a1@

local_numtostring:
	moveal	%sp@(4),%a0
	movel	%sp@(8),%d0
	_NumToString
	moveal	%sp@+,%a0
	addqw	#8,%sp
	jmp	%a0@

sub_1000a49a:
	linkw	%fp,#-124
	movel	%d3,%sp@-
	movew	%fp@(22),%fp@(-102)
	movel	%fp@(18),%fp@(-76)
	movel	%fp@(14),%fp@(-106)
	clrb	%fp@(-98)
	moveb	%fp@(12),%fp@(-97)
	moveq	#0,%d0
	movel	%d0,%fp@(-96)
	lea	%fp@(-124),%a0
	_PBHOpenDFSync
	movew	%d0,%d3
	moveal	%fp@(8),%a0
	movew	%fp@(-100),%a0@
	movew	%d3,%d0
	movew	%d0,%fp@(24)
	movel	%sp@+,%d3
	unlk	%fp
	moveal	%sp@+,%a0
	lea	%sp@(16),%sp
	jmp	%a0@

