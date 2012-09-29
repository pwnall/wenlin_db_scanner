__text:0002B95E ; =============== S U B R O U T I N E =======================================
__text:0002B95E
__text:0002B95E ; Attributes: bp-based frame
__text:0002B95E
__text:0002B95E _FunnyMask      proc near               ; CODE XREF: _DecompressDBRec+49p
__text:0002B95E                                         ; _CompressDBRec+43p
__text:0002B95E
__text:0002B95E returnValue     = dword ptr -14h
__text:0002B95E recordTagCopy   = byte ptr -10h
__text:0002B95E recordLengthCopy= word ptr -0Ch
__text:0002B95E recordLength    = dword ptr  8
__text:0002B95E recordTag       = dword ptr  0Ch
__text:0002B95E
__text:0002B95E                 push    ebp
__text:0002B95F                 mov     ebp, esp
__text:0002B961                 sub     esp, 18h
__text:0002B964                 mov     eax, [ebp+recordLength]
__text:0002B967                 mov     edx, [ebp+recordTag]
__text:0002B96A                 mov     [ebp+recordLengthCopy], ax
__text:0002B96E                 mov     [ebp+recordTagCopy], dl
__text:0002B971                 movzx   eax, ds:_versionOneDB
__text:0002B978                 test    al, al
__text:0002B97A                 jz      short loc_2B990
__text:0002B97C                 movzx   eax, [ebp+recordLengthCopy]
__text:0002B980                 and     eax, 7
__text:0002B983                 shl     eax, 3
__text:0002B986                 add     eax, offset _versionOneFunnyMasks
__text:0002B98B                 mov     [ebp+returnValue], eax
__text:0002B98E                 jmp     short loc_2B9CB
__text:0002B990 ; ---------------------------------------------------------------------------
__text:0002B990
__text:0002B990 loc_2B990:                              ; CODE XREF: _FunnyMask+1Cj
__text:0002B990                 movzx   eax, ds:_archiveDifferent
__text:0002B997                 test    al, al
__text:0002B999                 jz      short loc_2B9B9
__text:0002B99B                 movzx   edx, [ebp+recordLengthCopy]
__text:0002B99F                 movzx   eax, [ebp+recordTagCopy]
__text:0002B9A3                 and     eax, 1
__text:0002B9A6                 lea     eax, [edx+eax]
__text:0002B9A9                 and     eax, 7
__text:0002B9AC                 shl     eax, 3
__text:0002B9AF                 add     eax, offset _versionTwoFunnyMasks
__text:0002B9B4                 mov     [ebp+returnValue], eax
__text:0002B9B7                 jmp     short loc_2B9CB
__text:0002B9B9 ; ---------------------------------------------------------------------------
__text:0002B9B9
__text:0002B9B9 loc_2B9B9:                              ; CODE XREF: _FunnyMask+3Bj
__text:0002B9B9                 movzx   eax, [ebp+recordLengthCopy]
__text:0002B9BD                 and     eax, 7
__text:0002B9C0                 shl     eax, 3
__text:0002B9C3                 add     eax, offset _versionTwoFunnyMasks
__text:0002B9C8                 mov     [ebp+returnValue], eax
__text:0002B9CB
__text:0002B9CB loc_2B9CB:                              ; CODE XREF: _FunnyMask+30j
__text:0002B9CB                                         ; _FunnyMask+59j
__text:0002B9CB                 mov     eax, [ebp+returnValue]
__text:0002B9CE                 leave
__text:0002B9CF                 retn
__text:0002B9CF _FunnyMask      endp

__text:0002B901 ; =============== S U B R O U T I N E =======================================
__text:0002B901
__text:0002B901 ; Attributes: bp-based frame
__text:0002B901
__text:0002B901 _CrypOfs        proc near               ; CODE XREF: _DecompressDBRec+62p
__text:0002B901                                         ; _CompressDBRec+5Cp
__text:0002B901
__text:0002B901 returnValue     = dword ptr -14h
__text:0002B901 recordTagCopy   = byte ptr -10h
__text:0002B901 recordLengthCopy= word ptr -0Ch
__text:0002B901 recordLength    = dword ptr  8
__text:0002B901 recordTag       = dword ptr  0Ch
__text:0002B901
__text:0002B901                 push    ebp
__text:0002B902                 mov     ebp, esp
__text:0002B904                 sub     esp, 18h
__text:0002B907                 mov     eax, [ebp+recordLength]
__text:0002B90A                 mov     edx, [ebp+recordTag]
__text:0002B90D                 mov     [ebp+recordLengthCopy], ax
__text:0002B911                 mov     [ebp+recordTagCopy], dl
__text:0002B914                 movzx   eax, ds:_archiveDifferent
__text:0002B91B                 test    al, al
__text:0002B91D                 jz      short loc_2B94A
__text:0002B91F                 movzx   eax, ds:_versionOneDB
__text:0002B926                 test    al, al
__text:0002B928                 jnz     short loc_2B94A
__text:0002B92A                 movzx   eax, [ebp+recordLengthCopy]
__text:0002B92E                 mov     edx, eax
__text:0002B930                 movzx   eax, [ebp+recordTagCopy]
__text:0002B934                 and     eax, 1
__text:0002B937                 shl     eax, 3
__text:0002B93A                 lea     eax, [edx+eax]
__text:0002B93D                 movzx   eax, al
__text:0002B940                 mov     edx, eax
__text:0002B942                 and     edx, 3Fh
__text:0002B945                 mov     [ebp+returnValue], edx
__text:0002B948                 jmp     short loc_2B959
__text:0002B94A ; ---------------------------------------------------------------------------
__text:0002B94A
__text:0002B94A loc_2B94A:                              ; CODE XREF: _CrypOfs+1Cj
__text:0002B94A                                         ; _CrypOfs+27j
__text:0002B94A                 movzx   eax, [ebp+recordLengthCopy]
__text:0002B94E                 movzx   eax, al
__text:0002B951                 mov     edx, eax
__text:0002B953                 and     edx, 3Fh
__text:0002B956                 mov     [ebp+returnValue], edx
__text:0002B959
__text:0002B959 loc_2B959:                              ; CODE XREF: _CrypOfs+47j
__text:0002B959                 mov     eax, [ebp+returnValue]
__text:0002B95C                 leave
__text:0002B95D                 retn
__text:0002B95D _CrypOfs        endp
__text:0002B95D
__text:0002B95E

__text:0002B8DB ; =============== S U B R O U T I N E =======================================
__text:0002B8DB
__text:0002B8DB ; Attributes: bp-based frame
__text:0002B8DB
__text:0002B8DB _CrypMask       proc near               ; CODE XREF: _DecompressDBRec+6Ap
__text:0002B8DB                                         ; _CompressDBRec+64p
__text:0002B8DB
__text:0002B8DB cryptOffset     = dword ptr -0Ch
__text:0002B8DB
__text:0002B8DB                 push    ebp
__text:0002B8DC                 mov     ebp, esp
__text:0002B8DE                 sub     esp, 18h
__text:0002B8E1                 movzx   eax, ds:_versionOneDB
__text:0002B8E8                 test    al, al
__text:0002B8EA                 jz      short loc_2B8F5
__text:0002B8EC                 mov     [ebp+cryptOffset], offset _versionOneCrypMask
__text:0002B8F3                 jmp     short loc_2B8FC
__text:0002B8F5 ; ---------------------------------------------------------------------------
__text:0002B8F5
__text:0002B8F5 loc_2B8F5:                              ; CODE XREF: _CrypMask+Fj
__text:0002B8F5                 mov     [ebp+cryptOffset], offset _versionTwoCrypMask
__text:0002B8FC
__text:0002B8FC loc_2B8FC:                              ; CODE XREF: _CrypMask+18j
__text:0002B8FC                 mov     eax, [ebp+cryptOffset]
__text:0002B8FF                 leave
__text:0002B900                 retn
__text:0002B900 _CrypMask       endp

__text:0002AB8C ; =============== S U B R O U T I N E =======================================
__text:0002AB8C
__text:0002AB8C ; Attributes: bp-based frame
__text:0002AB8C
__text:0002AB8C _DecompressDBRec proc near              ; CODE XREF: _DBRecordReadIntoTextBuf+B3p
__text:0002AB8C
__text:0002AB8C returnValue     = dword ptr -60h
__text:0002AB8C recordTagCopy   = byte ptr -5Ch
__text:0002AB8C ziNumberLenBuffer= dword ptr -4Ch
__text:0002AB8C decompressedChar= byte ptr -45h
__text:0002AB8C fpCopy          = dword ptr -40h
__text:0002AB8C recordLengthInBits2= dword ptr -38h
__text:0002AB8C recordLengthInBits= dword ptr -34h
__text:0002AB8C lineOffset      = byte ptr -27h
__text:0002AB8C funnyMaskValue  = dword ptr -24h
__text:0002AB8C cryptOffset     = byte ptr -20h
__text:0002AB8C cryptMask       = dword ptr -1Ch
__text:0002AB8C decompressedByte= word ptr -18h
__text:0002AB8C easyBufferAppendStat= word ptr -16h
__text:0002AB8C charOffset      = dword ptr -14h
__text:0002AB8C mbCharLen       = dword ptr -10h
__text:0002AB8C bufferAppendStat= word ptr -0Ah
__text:0002AB8C buffer          = dword ptr  8
__text:0002AB8C fp              = dword ptr  0Ch
__text:0002AB8C recordLength    = dword ptr  10h
__text:0002AB8C recordTag       = dword ptr  14h
__text:0002AB8C
__text:0002AB8C                 push    ebp
__text:0002AB8D                 mov     ebp, esp
__text:0002AB8F                 push    edi
__text:0002AB90                 sub     esp, 74h
__text:0002AB93                 mov     eax, [ebp+recordTag]
__text:0002AB96                 mov     [ebp+recordTagCopy], al
__text:0002AB99                 lea     eax, [ebp+fpCopy]
__text:0002AB9C                 mov     edi, eax
__text:0002AB9E                 cld
__text:0002AB9F                 mov     edx, 0
__text:0002ABA4                 mov     eax, 0Ah
__text:0002ABA9                 mov     ecx, eax
__text:0002ABAB                 mov     eax, edx
__text:0002ABAD                 rep stosd
__text:0002ABAF                 mov     eax, [ebp+fp]
__text:0002ABB2                 mov     [ebp+fpCopy], eax
__text:0002ABB5                 mov     eax, [ebp+recordLength]
__text:0002ABB8                 shl     eax, 3
__text:0002ABBB                 mov     [ebp+recordLengthInBits], eax
__text:0002ABBE                 mov     eax, [ebp+recordLengthInBits]
__text:0002ABC1                 mov     [ebp+recordLengthInBits2], eax
__text:0002ABC4                 movzx   edx, [ebp+recordTagCopy]
__text:0002ABC8                 mov     eax, [ebp+recordLength]
__text:0002ABCB                 movzx   eax, ax
__text:0002ABCE                 mov     [esp+4], edx
__text:0002ABD2                 mov     [esp], eax
__text:0002ABD5                 call    _FunnyMask
__text:0002ABDA                 mov     [ebp+funnyMaskValue], eax
__text:0002ABDD                 movzx   edx, [ebp+recordTagCopy]
__text:0002ABE1                 mov     eax, [ebp+recordLength]
__text:0002ABE4                 movzx   eax, ax
__text:0002ABE7                 mov     [esp+4], edx
__text:0002ABEB                 mov     [esp], eax
__text:0002ABEE                 call    _CrypOfs
__text:0002ABF3                 mov     [ebp+cryptOffset], al
__text:0002ABF6                 call    _CrypMask
__text:0002ABFB                 mov     [ebp+cryptMask], eax
__text:0002ABFE                 cmp     [ebp+recordLength], 8
__text:0002AC02                 jbe     short loc_2AC0F
__text:0002AC04                 movzx   eax, ds:_versionOneDB
__text:0002AC0B                 test    al, al
__text:0002AC0D                 jz      short loc_2AC17
__text:0002AC0F
__text:0002AC0F loc_2AC0F:                              ; CODE XREF: _DecompressDBRec+76j
__text:0002AC0F                 mov     [ebp+lineOffset], 9
__text:0002AC13                 jmp     short loc_2AC17
__text:0002AC15 ; ---------------------------------------------------------------------------
__text:0002AC15
__text:0002AC15 loc_2AC15:                              ; CODE XREF: _DecompressDBRec+F0j
__text:0002AC15                                         ; _DecompressDBRec+1D0j
__text:0002AC15                 jmp     short $+2
__text:0002AC17 ; ---------------------------------------------------------------------------
__text:0002AC17
__text:0002AC17 loc_2AC17:                              ; CODE XREF: _DecompressDBRec+81j
__text:0002AC17                                         ; _DecompressDBRec+87j ...
__text:0002AC17                 lea     eax, [ebp+fpCopy]
__text:0002AC1A                 mov     [esp], eax
__text:0002AC1D                 call    _DecompressByte
__text:0002AC22                 mov     [ebp+decompressedByte], ax
__text:0002AC26                 cmp     [ebp+decompressedByte], 0
__text:0002AC2B                 jg      short loc_2AC4C
__text:0002AC2D                 cmp     [ebp+decompressedByte], 0FFFFh
__text:0002AC32                 jnz     short loc_2AC40
__text:0002AC34                 mov     [ebp+returnValue], 0FFFFFFEDh
__text:0002AC3B                 jmp     loc_2AD61
__text:0002AC40 ; ---------------------------------------------------------------------------
__text:0002AC40
__text:0002AC40 loc_2AC40:                              ; CODE XREF: _DecompressDBRec+A6j
__text:0002AC40                 mov     [ebp+returnValue], 0
__text:0002AC47                 jmp     loc_2AD61
__text:0002AC4C ; ---------------------------------------------------------------------------
__text:0002AC4C
__text:0002AC4C loc_2AC4C:                              ; CODE XREF: _DecompressDBRec+9Fj
__text:0002AC4C                 movsx   eax, [ebp+decompressedByte]
__text:0002AC50                 shr     eax, 7
__text:0002AC53                 xor     eax, 1
__text:0002AC56                 and     eax, 1
__text:0002AC59                 test    al, al
__text:0002AC5B                 jz      short loc_2AC8A
__text:0002AC5D                 movzx   eax, [ebp+decompressedByte]
__text:0002AC61                 movsx   eax, al
__text:0002AC64                 mov     [esp+4], eax
__text:0002AC68                 mov     eax, [ebp+buffer]
__text:0002AC6B                 mov     [esp], eax
__text:0002AC6E                 call    _TBPutC
__text:0002AC73                 mov     [ebp+easyBufferAppendStat], ax
__text:0002AC77                 cmp     [ebp+easyBufferAppendStat], 0
__text:0002AC7C                 jz      short loc_2AC15
__text:0002AC7E                 movsx   eax, [ebp+easyBufferAppendStat]
__text:0002AC82                 mov     [ebp+returnValue], eax
__text:0002AC85                 jmp     loc_2AD61
__text:0002AC8A ; ---------------------------------------------------------------------------
__text:0002AC8A
__text:0002AC8A loc_2AC8A:                              ; CODE XREF: _DecompressDBRec+CFj
__text:0002AC8A                 movzx   eax, [ebp+decompressedByte]
__text:0002AC8E                 mov     [ebp+decompressedChar], al
__text:0002AC91                 movzx   eax, [ebp+decompressedByte]
__text:0002AC95                 movsx   eax, al
__text:0002AC98                 mov     [esp], eax
__text:0002AC9B                 call    _MBCLenFromFirstByte
__text:0002ACA0                 mov     [ebp+mbCharLen], eax
__text:0002ACA3                 mov     [ebp+charOffset], 1
__text:0002ACAA                 jmp     short loc_2ACDE
__text:0002ACAC ; ---------------------------------------------------------------------------
__text:0002ACAC
__text:0002ACAC loc_2ACAC:                              ; CODE XREF: _DecompressDBRec+158j
__text:0002ACAC                 lea     eax, [ebp+fpCopy]
__text:0002ACAF                 mov     [esp], eax
__text:0002ACB2                 call    _DecompressSixBits
__text:0002ACB7                 mov     [ebp+decompressedByte], ax
__text:0002ACBB                 cmp     [ebp+decompressedByte], 0
__text:0002ACC0                 jg      short loc_2ACCE
__text:0002ACC2                 mov     [ebp+returnValue], 0FFFFDFFFh
__text:0002ACC9                 jmp     loc_2AD61
__text:0002ACCE ; ---------------------------------------------------------------------------
__text:0002ACCE
__text:0002ACCE loc_2ACCE:                              ; CODE XREF: _DecompressDBRec+134j
__text:0002ACCE                 mov     edx, [ebp+charOffset]
__text:0002ACD1                 movzx   eax, [ebp+decompressedByte]
__text:0002ACD5                 mov     [ebp+edx+decompressedChar], al
__text:0002ACD9                 lea     eax, [ebp+charOffset]
__text:0002ACDC                 inc     dword ptr [eax]
__text:0002ACDE
__text:0002ACDE loc_2ACDE:                              ; CODE XREF: _DecompressDBRec+11Ej
__text:0002ACDE                 mov     eax, [ebp+charOffset]
__text:0002ACE1                 cmp     eax, [ebp+mbCharLen]
__text:0002ACE4                 jb      short loc_2ACAC
__text:0002ACE6                 mov     eax, [ebp+mbCharLen]
__text:0002ACE9                 mov     [ebp+eax+decompressedChar], 0
__text:0002ACEE                 lea     eax, [ebp+ziNumberLenBuffer]
__text:0002ACF1                 mov     [esp+4], eax
__text:0002ACF5                 lea     eax, [ebp+decompressedChar]
__text:0002ACF8                 mov     [esp], eax
__text:0002ACFB                 call    _ZiNumberLen
__text:0002AD00                 cmp     eax, 0FFFEh
__text:0002AD05                 jz      short loc_2AD0F
__text:0002AD07                 mov     eax, [ebp+ziNumberLenBuffer]
__text:0002AD0A                 cmp     eax, [ebp+mbCharLen]
__text:0002AD0D                 jz      short loc_2AD18
__text:0002AD0F
__text:0002AD0F loc_2AD0F:                              ; CODE XREF: _DecompressDBRec+179j
__text:0002AD0F                 mov     [ebp+returnValue], 0FFFFDFFFh
__text:0002AD16                 jmp     short loc_2AD61
__text:0002AD18 ; ---------------------------------------------------------------------------
__text:0002AD18
__text:0002AD18 loc_2AD18:                              ; CODE XREF: _DecompressDBRec+181j
__text:0002AD18                 mov     [ebp+charOffset], 0
__text:0002AD1F                 jmp     short loc_2AD54
__text:0002AD21 ; ---------------------------------------------------------------------------
__text:0002AD21
__text:0002AD21 loc_2AD21:                              ; CODE XREF: _DecompressDBRec+1CEj
__text:0002AD21                 mov     eax, [ebp+charOffset]
__text:0002AD24                 movzx   eax, [ebp+eax+decompressedChar]
__text:0002AD29                 movsx   eax, al
__text:0002AD2C                 mov     [esp+4], eax
__text:0002AD30                 mov     eax, [ebp+buffer]
__text:0002AD33                 mov     [esp], eax
__text:0002AD36                 call    _TBPutC
__text:0002AD3B                 mov     [ebp+bufferAppendStat], ax
__text:0002AD3F                 cmp     [ebp+bufferAppendStat], 0
__text:0002AD44                 jz      short loc_2AD4F
__text:0002AD46                 movsx   eax, [ebp+bufferAppendStat]
__text:0002AD4A
__text:0002AD4A loc_2AD4A:                              ; DATA XREF: _KXRadicalFromZin+F7o
__text:0002AD4A                 mov     [ebp+returnValue], eax
__text:0002AD4D                 jmp     short loc_2AD61
__text:0002AD4F ; ---------------------------------------------------------------------------
__text:0002AD4F
__text:0002AD4F loc_2AD4F:                              ; CODE XREF: _DecompressDBRec+1B8j
__text:0002AD4F                 lea     eax, [ebp+charOffset]
__text:0002AD52                 inc     dword ptr [eax]
__text:0002AD54
__text:0002AD54 loc_2AD54:                              ; CODE XREF: _DecompressDBRec+193j
__text:0002AD54                 mov     eax, [ebp+charOffset]
__text:0002AD57                 cmp     eax, [ebp+mbCharLen]
__text:0002AD5A                 jb      short loc_2AD21
__text:0002AD5C                 jmp     loc_2AC15
__text:0002AD61 ; ---------------------------------------------------------------------------
__text:0002AD61
__text:0002AD61 loc_2AD61:                              ; CODE XREF: _DecompressDBRec+AFj
__text:0002AD61                                         ; _DecompressDBRec+BBj ...
__text:0002AD61                 mov     eax, [ebp+returnValue]
__text:0002AD64                 add     esp, 74h
__text:0002AD67                 pop     edi
__text:0002AD68                 leave
__text:0002AD69                 retn
__text:0002AD69 _DecompressDBRec endp

__text:0002AD6A ; =============== S U B R O U T I N E =======================================
__text:0002AD6A
__text:0002AD6A ; Attributes: bp-based frame
__text:0002AD6A
__text:0002AD6A _DecompressByte proc near               ; CODE XREF: _DecompressDBRec+91p
__text:0002AD6A
__text:0002AD6A currentBit      = word ptr -1Eh
__text:0002AD6A returnValue     = dword ptr -1Ch
__text:0002AD6A node            = word ptr -0Ch
__text:0002AD6A currentBitCopy  = word ptr -0Ah
__text:0002AD6A pStruct         = dword ptr  8
__text:0002AD6A
__text:0002AD6A                 push    ebp
__text:0002AD6B                 mov     ebp, esp
__text:0002AD6D                 push    ebx
__text:0002AD6E                 sub     esp, 34h
__text:0002AD71                 mov     [ebp+node], 0FEh
__text:0002AD77
__text:0002AD77 loc_2AD77:                              ; CODE XREF: _DecompressByte+AAj
__text:0002AD77                 mov     eax, [ebp+pStruct]
__text:0002AD7A                 mov     eax, [eax+4]
__text:0002AD7D                 and     eax, 7
__text:0002AD80                 test    eax, eax
__text:0002AD82                 jnz     short loc_2AD95
__text:0002AD84                 mov     eax, [ebp+pStruct]
__text:0002AD87                 mov     [esp], eax
__text:0002AD8A                 call    _GetBitX
__text:0002AD8F                 mov     [ebp+currentBit], ax
__text:0002AD93                 jmp     short loc_2ADCD
__text:0002AD95 ; ---------------------------------------------------------------------------
__text:0002AD95
__text:0002AD95 loc_2AD95:                              ; CODE XREF: _DecompressByte+18j
__text:0002AD95                 mov     eax, [ebp+pStruct]
__text:0002AD98                 movzx   ebx, byte ptr [eax+1Ah]
__text:0002AD9C                 mov     eax, [ebp+pStruct]
__text:0002AD9F                 mov     edx, [eax+1Ch]
__text:0002ADA2                 mov     eax, [ebp+pStruct]
__text:0002ADA5                 mov     ecx, [eax+4]
__text:0002ADA8                 mov     eax, ecx
__text:0002ADAA                 movzx   eax, ax
__text:0002ADAD                 and     eax, 7
__text:0002ADB0                 lea     eax, [edx+eax]
__text:0002ADB3                 movzx   eax, byte ptr [eax]
__text:0002ADB6                 and     eax, ebx
__text:0002ADB8                 test    al, al
__text:0002ADBA                 setnz   al
__text:0002ADBD                 movzx   eax, al
__text:0002ADC0                 mov     [ebp+currentBit], ax
__text:0002ADC4                 lea     edx, [ecx+1]
__text:0002ADC7                 mov     eax, [ebp+pStruct]
__text:0002ADCA                 mov     [eax+4], edx
__text:0002ADCD
__text:0002ADCD loc_2ADCD:                              ; CODE XREF: _DecompressByte+29j
__text:0002ADCD                 movzx   eax, [ebp+currentBit]
__text:0002ADD1                 mov     [ebp+currentBitCopy], ax
__text:0002ADD5                 cmp     [ebp+currentBitCopy], 0
__text:0002ADDA                 jz      short loc_2ADFE
__text:0002ADDC                 cmp     [ebp+currentBitCopy], 0
__text:0002ADE1                 jns     short loc_2ADEC
__text:0002ADE3                 movsx   eax, [ebp+currentBitCopy]
__text:0002ADE7                 mov     [ebp+returnValue], eax
__text:0002ADEA                 jmp     short loc_2AE26
__text:0002ADEC ; ---------------------------------------------------------------------------
__text:0002ADEC
__text:0002ADEC loc_2ADEC:                              ; CODE XREF: _DecompressByte+77j
__text:0002ADEC                 movsx   eax, [ebp+node]
__text:0002ADF0                 movzx   eax, ds:_rightNode[eax+eax]
__text:0002ADF8                 mov     [ebp+node], ax
__text:0002ADFC                 jmp     short loc_2AE0E
__text:0002ADFE ; ---------------------------------------------------------------------------
__text:0002ADFE
__text:0002ADFE loc_2ADFE:                              ; CODE XREF: _DecompressByte+70j
__text:0002ADFE                 movsx   eax, [ebp+node]
__text:0002AE02                 movzx   eax, ds:_leftNode[eax+eax]
__text:0002AE0A                 mov     [ebp+node], ax
__text:0002AE0E
__text:0002AE0E loc_2AE0E:                              ; CODE XREF: _DecompressByte+92j
__text:0002AE0E                 cmp     [ebp+node], 0FFh
__text:0002AE14                 jle     loc_2AD77
__text:0002AE1A                 movzx   eax, [ebp+node]
__text:0002AE1E                 sub     ax, 100h
__text:0002AE22                 cwde
__text:0002AE23                 mov     [ebp+returnValue], eax
__text:0002AE26
__text:0002AE26 loc_2AE26:                              ; CODE XREF: _DecompressByte+80j
__text:0002AE26                 mov     eax, [ebp+returnValue]
__text:0002AE29                 add     esp, 34h
__text:0002AE2C                 pop     ebx
__text:0002AE2D                 leave
__text:0002AE2E                 retn
__text:0002AE2E _DecompressByte end

__text:0002AE2F _DecompressSixBits proc near            ; CODE XREF: _DecompressDBRec+126p
__text:0002AE2F
__text:0002AE2F firstBit        = word ptr -2Ch
__text:0002AE2F secondBit       = word ptr -2Ah
__text:0002AE2F thirdBit        = word ptr -28h
__text:0002AE2F fourthBit       = word ptr -26h
__text:0002AE2F fifthBit        = word ptr -24h
__text:0002AE2F sixthBit        = word ptr -22h
__text:0002AE2F returnValue     = dword ptr -20h
__text:0002AE2F currentBit      = word ptr -1Ah
__text:0002AE2F decompressedByte= byte ptr -9
__text:0002AE2F pStruct         = dword ptr  8
__text:0002AE2F
__text:0002AE2F                 push    ebp
__text:0002AE30                 mov     ebp, esp
__text:0002AE32                 push    ebx
__text:0002AE33                 sub     esp, 44h
__text:0002AE36                 mov     [ebp+decompressedByte], 80h
__text:0002AE3A                 mov     eax, [ebp+pStruct]
__text:0002AE3D                 mov     eax, [eax+4]
__text:0002AE40                 and     eax, 7
__text:0002AE43                 test    eax, eax
__text:0002AE45                 jnz     short loc_2AE58
__text:0002AE47                 mov     eax, [ebp+pStruct]
__text:0002AE4A                 mov     [esp], eax
__text:0002AE4D                 call    _GetBitX
__text:0002AE52                 mov     [ebp+firstBit], ax
__text:0002AE56                 jmp     short loc_2AE90
__text:0002AE58 ; ---------------------------------------------------------------------------
__text:0002AE58
__text:0002AE58 loc_2AE58:                              ; CODE XREF: _DecompressSixBits+16j
__text:0002AE58                 mov     eax, [ebp+pStruct]
__text:0002AE5B                 movzx   ebx, byte ptr [eax+1Ah]
__text:0002AE5F                 mov     eax, [ebp+pStruct]
__text:0002AE62                 mov     edx, [eax+1Ch]
__text:0002AE65                 mov     eax, [ebp+pStruct]
__text:0002AE68                 mov     ecx, [eax+4]
__text:0002AE6B                 mov     eax, ecx
__text:0002AE6D                 movzx   eax, ax
__text:0002AE70                 and     eax, 7
__text:0002AE73                 lea     eax, [edx+eax]
__text:0002AE76                 movzx   eax, byte ptr [eax]
__text:0002AE79                 and     eax, ebx
__text:0002AE7B                 test    al, al
__text:0002AE7D                 setnz   al
__text:0002AE80                 movzx   eax, al
__text:0002AE83                 mov     [ebp+firstBit], ax
__text:0002AE87                 lea     edx, [ecx+1]
__text:0002AE8A                 mov     eax, [ebp+pStruct]
__text:0002AE8D                 mov     [eax+4], edx
__text:0002AE90
__text:0002AE90 loc_2AE90:                              ; CODE XREF: _DecompressSixBits+27j
__text:0002AE90                 movzx   eax, [ebp+firstBit]
__text:0002AE94                 mov     [ebp+currentBit], ax
__text:0002AE98                 cmp     [ebp+currentBit], 0
__text:0002AE9D                 jz      short loc_2AEB0
__text:0002AE9F                 cmp     [ebp+currentBit], 0
__text:0002AEA4                 js      loc_2B103
__text:0002AEAA                 lea     eax, [ebp+decompressedByte]
__text:0002AEAD                 or      byte ptr [eax], 20h
__text:0002AEB0
__text:0002AEB0 loc_2AEB0:                              ; CODE XREF: _DecompressSixBits+6Ej
__text:0002AEB0                 mov     eax, [ebp+pStruct]
__text:0002AEB3                 mov     eax, [eax+4]
__text:0002AEB6                 and     eax, 7
__text:0002AEB9                 test    eax, eax
__text:0002AEBB                 jnz     short loc_2AECE
__text:0002AEBD                 mov     eax, [ebp+pStruct]
__text:0002AEC0                 mov     [esp], eax
__text:0002AEC3                 call    _GetBitX
__text:0002AEC8                 mov     [ebp+secondBit], ax
__text:0002AECC                 jmp     short loc_2AF06
__text:0002AECE ; ---------------------------------------------------------------------------
__text:0002AECE
__text:0002AECE loc_2AECE:                              ; CODE XREF: _DecompressSixBits+8Cj
__text:0002AECE                 mov     eax, [ebp+pStruct]
__text:0002AED1                 movzx   ebx, byte ptr [eax+1Ah]
__text:0002AED5                 mov     eax, [ebp+pStruct]
__text:0002AED8                 mov     edx, [eax+1Ch]
__text:0002AEDB                 mov     eax, [ebp+pStruct]
__text:0002AEDE                 mov     ecx, [eax+4]
__text:0002AEE1                 mov     eax, ecx
__text:0002AEE3                 movzx   eax, ax
__text:0002AEE6                 and     eax, 7
__text:0002AEE9                 lea     eax, [edx+eax]
__text:0002AEEC                 movzx   eax, byte ptr [eax]
__text:0002AEEF                 and     eax, ebx
__text:0002AEF1                 test    al, al
__text:0002AEF3                 setnz   al
__text:0002AEF6                 movzx   eax, al
__text:0002AEF9                 mov     [ebp+secondBit], ax
__text:0002AEFD                 lea     edx, [ecx+1]
__text:0002AF00                 mov     eax, [ebp+pStruct]
__text:0002AF03                 mov     [eax+4], edx
__text:0002AF06
__text:0002AF06 loc_2AF06:                              ; CODE XREF: _DecompressSixBits+9Dj
__text:0002AF06                 movzx   eax, [ebp+secondBit]
__text:0002AF0A                 mov     [ebp+currentBit], ax
__text:0002AF0E                 cmp     [ebp+currentBit], 0
__text:0002AF13                 jz      short loc_2AF26
__text:0002AF15                 cmp     [ebp+currentBit], 0
__text:0002AF1A                 js      loc_2B103
__text:0002AF20                 lea     eax, [ebp+decompressedByte]
__text:0002AF23                 or      byte ptr [eax], 10h
__text:0002AF26
__text:0002AF26 loc_2AF26:                              ; CODE XREF: _DecompressSixBits+E4j
__text:0002AF26                 mov     eax, [ebp+pStruct]
__text:0002AF29                 mov     eax, [eax+4]
__text:0002AF2C                 and     eax, 7
__text:0002AF2F                 test    eax, eax
__text:0002AF31                 jnz     short loc_2AF44
__text:0002AF33                 mov     eax, [ebp+pStruct]
__text:0002AF36                 mov     [esp], eax
__text:0002AF39                 call    _GetBitX
__text:0002AF3E                 mov     [ebp+thirdBit], ax
__text:0002AF42                 jmp     short loc_2AF7C
__text:0002AF44 ; ---------------------------------------------------------------------------
__text:0002AF44
__text:0002AF44 loc_2AF44:                              ; CODE XREF: _DecompressSixBits+102j
__text:0002AF44                 mov     eax, [ebp+pStruct]
__text:0002AF47                 movzx   ebx, byte ptr [eax+1Ah]
__text:0002AF4B                 mov     eax, [ebp+pStruct]
__text:0002AF4E                 mov     edx, [eax+1Ch]
__text:0002AF51                 mov     eax, [ebp+pStruct]
__text:0002AF54                 mov     ecx, [eax+4]
__text:0002AF57                 mov     eax, ecx
__text:0002AF59                 movzx   eax, ax
__text:0002AF5C                 and     eax, 7
__text:0002AF5F                 lea     eax, [edx+eax]
__text:0002AF62                 movzx   eax, byte ptr [eax]
__text:0002AF65                 and     eax, ebx
__text:0002AF67                 test    al, al
__text:0002AF69                 setnz   al
__text:0002AF6C                 movzx   eax, al
__text:0002AF6F                 mov     [ebp+thirdBit], ax
__text:0002AF73                 lea     edx, [ecx+1]
__text:0002AF76                 mov     eax, [ebp+pStruct]
__text:0002AF79                 mov     [eax+4], edx
__text:0002AF7C
__text:0002AF7C loc_2AF7C:                              ; CODE XREF: _DecompressSixBits+113j
__text:0002AF7C                 movzx   eax, [ebp+thirdBit]
__text:0002AF80                 mov     [ebp+currentBit], ax
__text:0002AF84                 cmp     [ebp+currentBit], 0
__text:0002AF89                 jz      short loc_2AF9C
__text:0002AF8B                 cmp     [ebp+currentBit], 0
__text:0002AF90                 js      loc_2B103
__text:0002AF96                 lea     eax, [ebp+decompressedByte]
__text:0002AF99                 or      byte ptr [eax], 8
__text:0002AF9C
__text:0002AF9C loc_2AF9C:                              ; CODE XREF: _DecompressSixBits+15Aj
__text:0002AF9C                 mov     eax, [ebp+pStruct]
__text:0002AF9F                 mov     eax, [eax+4]
__text:0002AFA2                 and     eax, 7
__text:0002AFA5                 test    eax, eax
__text:0002AFA7                 jnz     short loc_2AFBA
__text:0002AFA9                 mov     eax, [ebp+pStruct]
__text:0002AFAC                 mov     [esp], eax
__text:0002AFAF                 call    _GetBitX
__text:0002AFB4                 mov     [ebp+fourthBit], ax
__text:0002AFB8                 jmp     short loc_2AFF2
__text:0002AFBA ; ---------------------------------------------------------------------------
__text:0002AFBA
__text:0002AFBA loc_2AFBA:                              ; CODE XREF: _DecompressSixBits+178j
__text:0002AFBA                 mov     eax, [ebp+pStruct]
__text:0002AFBD                 movzx   ebx, byte ptr [eax+1Ah]
__text:0002AFC1                 mov     eax, [ebp+pStruct]
__text:0002AFC4                 mov     edx, [eax+1Ch]
__text:0002AFC7                 mov     eax, [ebp+pStruct]
__text:0002AFCA                 mov     ecx, [eax+4]
__text:0002AFCD                 mov     eax, ecx
__text:0002AFCF                 movzx   eax, ax
__text:0002AFD2                 and     eax, 7
__text:0002AFD5                 lea     eax, [edx+eax]
__text:0002AFD8                 movzx   eax, byte ptr [eax]
__text:0002AFDB                 and     eax, ebx
__text:0002AFDD                 test    al, al
__text:0002AFDF
__text:0002AFDF loc_2AFDF:                              ; DATA XREF: _FT_MulDiv+77o
__text:0002AFDF                 setnz   al
__text:0002AFE2                 movzx   eax, al
__text:0002AFE5                 mov     [ebp+fourthBit], ax
__text:0002AFE9                 lea     edx, [ecx+1]
__text:0002AFEC                 mov     eax, [ebp+pStruct]
__text:0002AFEF                 mov     [eax+4], edx
__text:0002AFF2
__text:0002AFF2 loc_2AFF2:                              ; CODE XREF: _DecompressSixBits+189j
__text:0002AFF2                 movzx   eax, [ebp+fourthBit]
__text:0002AFF6                 mov     [ebp+currentBit], ax
__text:0002AFFA                 cmp     [ebp+currentBit], 0
__text:0002AFFF                 jz      short loc_2B012
__text:0002B001                 cmp     [ebp+currentBit], 0
__text:0002B006                 js      loc_2B103
__text:0002B00C                 lea     eax, [ebp+decompressedByte]
__text:0002B00F                 or      byte ptr [eax], 4
__text:0002B012
__text:0002B012 loc_2B012:                              ; CODE XREF: _DecompressSixBits+1D0j
__text:0002B012                 mov     eax, [ebp+pStruct]
__text:0002B015                 mov     eax, [eax+4]
__text:0002B018                 and     eax, 7
__text:0002B01B                 test    eax, eax
__text:0002B01D                 jnz     short loc_2B030
__text:0002B01F                 mov     eax, [ebp+pStruct]
__text:0002B022                 mov     [esp], eax
__text:0002B025                 call    _GetBitX
__text:0002B02A                 mov     [ebp+fifthBit], ax
__text:0002B02E                 jmp     short loc_2B068
__text:0002B030 ; ---------------------------------------------------------------------------
__text:0002B030
__text:0002B030 loc_2B030:                              ; CODE XREF: _DecompressSixBits+1EEj
__text:0002B030                 mov     eax, [ebp+pStruct]
__text:0002B033                 movzx   ebx, byte ptr [eax+1Ah]
__text:0002B037                 mov     eax, [ebp+pStruct]
__text:0002B03A                 mov     edx, [eax+1Ch]
__text:0002B03D                 mov     eax, [ebp+pStruct]
__text:0002B040                 mov     ecx, [eax+4]
__text:0002B043                 mov     eax, ecx
__text:0002B045                 movzx   eax, ax
__text:0002B048                 and     eax, 7
__text:0002B04B                 lea     eax, [edx+eax]
__text:0002B04E                 movzx   eax, byte ptr [eax]
__text:0002B051                 and     eax, ebx
__text:0002B053                 test    al, al
__text:0002B055                 setnz   al
__text:0002B058                 movzx   eax, al
__text:0002B05B                 mov     [ebp+fifthBit], ax
__text:0002B05F                 lea     edx, [ecx+1]
__text:0002B062                 mov     eax, [ebp+pStruct]
__text:0002B065                 mov     [eax+4], edx
__text:0002B068
__text:0002B068 loc_2B068:                              ; CODE XREF: _DecompressSixBits+1FFj
__text:0002B068                 movzx   eax, [ebp+fifthBit]
__text:0002B06C                 mov     [ebp+currentBit], ax
__text:0002B070                 cmp     [ebp+currentBit], 0
__text:0002B075                 jz      short loc_2B088
__text:0002B077                 cmp     [ebp+currentBit], 0
__text:0002B07C                 js      loc_2B103
__text:0002B082                 lea     eax, [ebp+decompressedByte]
__text:0002B085                 or      byte ptr [eax], 2
__text:0002B088
__text:0002B088 loc_2B088:                              ; CODE XREF: _DecompressSixBits+246j
__text:0002B088                 mov     eax, [ebp+pStruct]
__text:0002B08B                 mov     eax, [eax+4]
__text:0002B08E                 and     eax, 7
__text:0002B091                 test    eax, eax
__text:0002B093                 jnz     short loc_2B0A6
__text:0002B095                 mov     eax, [ebp+pStruct]
__text:0002B098                 mov     [esp], eax
__text:0002B09B                 call    _GetBitX
__text:0002B0A0                 mov     [ebp+sixthBit], ax
__text:0002B0A4                 jmp     short loc_2B0DE
__text:0002B0A6 ; ---------------------------------------------------------------------------
__text:0002B0A6
__text:0002B0A6 loc_2B0A6:                              ; CODE XREF: _DecompressSixBits+264j
__text:0002B0A6                 mov     eax, [ebp+pStruct]
__text:0002B0A9                 movzx   ebx, byte ptr [eax+1Ah]
__text:0002B0AD                 mov     eax, [ebp+pStruct]
__text:0002B0B0                 mov     edx, [eax+1Ch]
__text:0002B0B3                 mov     eax, [ebp+pStruct]
__text:0002B0B6                 mov     ecx, [eax+4]
__text:0002B0B9                 mov     eax, ecx
__text:0002B0BB                 movzx   eax, ax
__text:0002B0BE                 and     eax, 7
__text:0002B0C1                 lea     eax, [edx+eax]
__text:0002B0C4                 movzx   eax, byte ptr [eax]
__text:0002B0C7                 and     eax, ebx
__text:0002B0C9                 test    al, al
__text:0002B0CB                 setnz   al
__text:0002B0CE                 movzx   eax, al
__text:0002B0D1                 mov     [ebp+sixthBit], ax
__text:0002B0D5                 lea     edx, [ecx+1]
__text:0002B0D8                 mov     eax, [ebp+pStruct]
__text:0002B0DB                 mov     [eax+4], edx
__text:0002B0DE
__text:0002B0DE loc_2B0DE:                              ; CODE XREF: _DecompressSixBits+275j
__text:0002B0DE                 movzx   eax, [ebp+sixthBit]
__text:0002B0E2                 mov     [ebp+currentBit], ax
__text:0002B0E6                 cmp     [ebp+currentBit], 0
__text:0002B0EB                 jz      short loc_2B0FA
__text:0002B0ED                 cmp     [ebp+currentBit], 0
__text:0002B0F2                 js      short loc_2B103
__text:0002B0F4                 lea     eax, [ebp+decompressedByte]
__text:0002B0F7                 or      byte ptr [eax], 1
__text:0002B0FA
__text:0002B0FA loc_2B0FA:                              ; CODE XREF: _DecompressSixBits+2BCj
__text:0002B0FA                 movzx   eax, [ebp+decompressedByte]
__text:0002B0FE                 mov     [ebp+returnValue], eax
__text:0002B101                 jmp     short loc_2B10A
__text:0002B103 ; ---------------------------------------------------------------------------
__text:0002B103
__text:0002B103 loc_2B103:                              ; CODE XREF: _DecompressSixBits+75j
__text:0002B103                                         ; _DecompressSixBits+EBj ...
__text:0002B103                 movsx   eax, [ebp+currentBit]
__text:0002B107                 mov     [ebp+returnValue], eax
__text:0002B10A
__text:0002B10A loc_2B10A:                              ; CODE XREF: _DecompressSixBits+2D2j
__text:0002B10A                 mov     eax, [ebp+returnValue]
__text:0002B10D                 add     esp, 44h
__text:0002B110                 pop     ebx
__text:0002B111                 leave
__text:0002B112                 retn
__text:0002B112 _DecompressSixBits endp
__text:0002B112
__text:0002B113
__text:0002B113 ; =============== S U B R O U T I N E =======================================
__text:0002B113
__text:0002B113 ; Attributes: bp-based frame
__text:0002B113
__text:0002B113 _CompressDBRec  proc near               ; CODE XREF: _DBRecordWrite+BEp
__text:0002B113
__text:0002B113 var_60          = dword ptr -60h
__text:0002B113 var_5C          = byte ptr -5Ch
__text:0002B113 var_50          = dword ptr -50h
__text:0002B113 var_49          = byte ptr -49h
__text:0002B113 var_44          = dword ptr -44h
__text:0002B113 var_38          = dword ptr -38h
__text:0002B113 var_2B          = byte ptr -2Bh
__text:0002B113 var_28          = dword ptr -28h
__text:0002B113 var_24          = byte ptr -24h
__text:0002B113 var_20          = dword ptr -20h
__text:0002B113 var_1C          = dword ptr -1Ch
__text:0002B113 var_16          = word ptr -16h
__text:0002B113 var_14          = dword ptr -14h
__text:0002B113 var_10          = dword ptr -10h
__text:0002B113 var_C           = word ptr -0Ch
__text:0002B113 var_A           = word ptr -0Ah
__text:0002B113 arg_0           = dword ptr  8
__text:0002B113 arg_4           = dword ptr  0Ch
__text:0002B113 arg_8           = dword ptr  10h
__text:0002B113 arg_C           = dword ptr  14h
__text:0002B113
__text:0002B113                 push    ebp
__text:0002B114                 mov     ebp, esp
__text:0002B116                 push    edi
__text:0002B117                 sub     esp, 74h
__text:0002B11A                 mov     eax, [ebp+arg_C]
__text:0002B11D                 mov     [ebp+var_5C], al
__text:0002B120                 lea     eax, [ebp+var_44]
__text:0002B123                 mov     edi, eax
__text:0002B125                 cld
__text:0002B126                 mov     edx, 0
__text:0002B12B                 mov     eax, 0Ah
__text:0002B130                 mov     ecx, eax
__text:0002B132                 mov     eax, edx
__text:0002B134                 rep stosd
__text:0002B136                 mov     eax, [ebp+arg_4]
__text:0002B139                 mov     [ebp+var_44], eax
__text:0002B13C                 mov     eax, [ebp+arg_8]
__text:0002B13F                 shl     eax, 3
__text:0002B142                 mov     [ebp+var_38], eax
__text:0002B145                 movzx   edx, [ebp+var_5C]
__text:0002B149                 mov     eax, [ebp+arg_8]
__text:0002B14C                 movzx   eax, ax
__text:0002B14F                 mov     [esp+4], edx
__text:0002B153                 mov     [esp], eax
__text:0002B156                 call    _FunnyMask
__text:0002B15B                 mov     [ebp+var_28], eax
__text:0002B15E                 movzx   edx, [ebp+var_5C]
__text:0002B162                 mov     eax, [ebp+arg_8]
__text:0002B165                 movzx   eax, ax
__text:0002B168                 mov     [esp+4], edx
__text:0002B16C                 mov     [esp], eax
__text:0002B16F                 call    _CrypOfs
__text:0002B174                 mov     [ebp+var_24], al
__text:0002B177                 call    _CrypMask
__text:0002B17C                 mov     [ebp+var_20], eax
__text:0002B17F                 cmp     [ebp+arg_8], 8
__text:0002B183                 ja      loc_2B301
__text:0002B189                 mov     [ebp+var_2B], 9
__text:0002B18D                 jmp     loc_2B301
__text:0002B192 ; ---------------------------------------------------------------------------
__text:0002B192
__text:0002B192 loc_2B192:                              ; CODE XREF: _CompressDBRec+200j
__text:0002B192                 mov     eax, [ebp+var_1C]
__text:0002B195                 shr     eax, 7
__text:0002B198                 xor     eax, 1
__text:0002B19B                 and     eax, 1
__text:0002B19E                 test    al, al
__text:0002B1A0                 jz      short loc_2B1D2
__text:0002B1A2                 mov     eax, [ebp+var_1C]
__text:0002B1A5                 movzx   eax, al
__text:0002B1A8                 mov     [esp+4], eax
__text:0002B1AC                 lea     eax, [ebp+var_44]
__text:0002B1AF                 mov     [esp], eax
__text:0002B1B2                 call    _CompressByte
__text:0002B1B7                 mov     [ebp+var_16], ax
__text:0002B1BB                 cmp     [ebp+var_16], 0
__text:0002B1C0                 jz      loc_2B2FF
__text:0002B1C6                 movsx   eax, [ebp+var_16]
__text:0002B1CA                 mov     [ebp+var_60], eax
__text:0002B1CD                 jmp     loc_2B328
__text:0002B1D2 ; ---------------------------------------------------------------------------
__text:0002B1D2
__text:0002B1D2 loc_2B1D2:                              ; CODE XREF: _CompressDBRec+8Dj
__text:0002B1D2                 mov     eax, [ebp+var_1C]
__text:0002B1D5                 mov     [ebp+var_49], al
__text:0002B1D8                 mov     eax, [ebp+var_1C]
__text:0002B1DB                 movsx   eax, al
__text:0002B1DE                 mov     [esp], eax
__text:0002B1E1                 call    _MBCLenFromFirstByte
__text:0002B1E6                 mov     [ebp+var_10], eax
__text:0002B1E9                 mov     [ebp+var_14], 1
__text:0002B1F0                 jmp     short loc_2B230
__text:0002B1F2 ; ---------------------------------------------------------------------------
__text:0002B1F2
__text:0002B1F2 loc_2B1F2:                              ; CODE XREF: _CompressDBRec+123j
__text:0002B1F2                 mov     eax, [ebp+arg_0]
__text:0002B1F5                 mov     [esp], eax
__text:0002B1F8                 call    _TwxtGetByte
__text:0002B1FD                 mov     [ebp+var_1C], eax
__text:0002B200                 cmp     [ebp+var_1C], 0FFFFFFFFh
__text:0002B204                 jz      short loc_2B215
__text:0002B206                 mov     eax, [ebp+var_1C]
__text:0002B209                 and     eax, 0C0h
__text:0002B20E                 cmp     eax, 80h
__text:0002B213                 jz      short loc_2B221
__text:0002B215
__text:0002B215 loc_2B215:                              ; CODE XREF: _CompressDBRec+F1j
__text:0002B215                 mov     [ebp+var_60], 0FFFFDFFFh
__text:0002B21C                 jmp     loc_2B328
__text:0002B221 ; ---------------------------------------------------------------------------
__text:0002B221
__text:0002B221 loc_2B221:                              ; CODE XREF: _CompressDBRec+100j
__text:0002B221                 mov     edx, [ebp+var_14]
__text:0002B224                 mov     eax, [ebp+var_1C]
__text:0002B227                 mov     [ebp+edx+var_49], al
__text:0002B22B                 lea     eax, [ebp+var_14]
__text:0002B22E                 inc     dword ptr [eax]
__text:0002B230
__text:0002B230 loc_2B230:                              ; CODE XREF: _CompressDBRec+DDj
__text:0002B230                 mov     eax, [ebp+var_14]
__text:0002B233                 cmp     eax, [ebp+var_10]
__text:0002B236                 jb      short loc_2B1F2
__text:0002B238                 mov     eax, [ebp+var_10]
__text:0002B23B                 mov     [ebp+eax+var_49], 0
__text:0002B240                 lea     eax, [ebp+var_50]
__text:0002B243                 mov     [esp+4], eax
__text:0002B247                 lea     eax, [ebp+var_49]
__text:0002B24A                 mov     [esp], eax
__text:0002B24D                 call    _ZiNumberLen
__text:0002B252                 cmp     eax, 0FFFEh
__text:0002B257                 jz      short loc_2B261
__text:0002B259                 mov     eax, [ebp+var_50]
__text:0002B25C                 cmp     eax, [ebp+var_10]
__text:0002B25F                 jz      short loc_2B26D
__text:0002B261
__text:0002B261 loc_2B261:                              ; CODE XREF: _CompressDBRec+144j
__text:0002B261                 mov     [ebp+var_60], 0FFFFDFFFh
__text:0002B268                 jmp     loc_2B328
__text:0002B26D ; ---------------------------------------------------------------------------
__text:0002B26D
__text:0002B26D loc_2B26D:                              ; CODE XREF: _CompressDBRec+14Cj
__text:0002B26D                 movzx   eax, [ebp+var_49]
__text:0002B271                 movzx   eax, al
__text:0002B274                 mov     [esp+4], eax
__text:0002B278                 lea     eax, [ebp+var_44]
__text:0002B27B                 mov     [esp], eax
__text:0002B27E                 call    _CompressByte
__text:0002B283                 mov     [ebp+var_C], ax
__text:0002B287                 cmp     [ebp+var_C], 0
__text:0002B28C                 jz      short loc_2B29A
__text:0002B28E                 movsx   eax, [ebp+var_C]
__text:0002B292                 mov     [ebp+var_60], eax
__text:0002B295                 jmp     loc_2B328
__text:0002B29A ; ---------------------------------------------------------------------------
__text:0002B29A
__text:0002B29A loc_2B29A:                              ; CODE XREF: _CompressDBRec+179j
__text:0002B29A                 mov     [ebp+var_14], 1
__text:0002B2A1                 jmp     short loc_2B2F7
__text:0002B2A3 ; ---------------------------------------------------------------------------
__text:0002B2A3
__text:0002B2A3 loc_2B2A3:                              ; CODE XREF: _CompressDBRec+1EAj
__text:0002B2A3                 mov     [ebp+var_A], 20h
__text:0002B2A9
__text:0002B2A9 loc_2B2A9:                              ; CODE XREF: _CompressDBRec+1DDj
__text:0002B2A9                 mov     eax, [ebp+var_14]
__text:0002B2AC                 movzx   eax, [ebp+eax+var_49]
__text:0002B2B1                 movsx   edx, al
__text:0002B2B4                 movsx   eax, [ebp+var_A]
__text:0002B2B8                 and     eax, edx
__text:0002B2BA                 test    eax, eax
__text:0002B2BC                 setnz   al
__text:0002B2BF                 movzx   eax, al
__text:0002B2C2                 mov     [esp+4], eax
__text:0002B2C6                 lea     eax, [ebp+var_44]
__text:0002B2C9                 mov     [esp], eax
__text:0002B2CC                 call    _PutBit
__text:0002B2D1                 mov     [ebp+var_C], ax
__text:0002B2D5                 cmp     [ebp+var_C], 0
__text:0002B2DA                 jz      short loc_2B2E5
__text:0002B2DC                 movsx   eax, [ebp+var_C]
__text:0002B2E0                 mov     [ebp+var_60], eax
__text:0002B2E3                 jmp     short loc_2B328
__text:0002B2E5 ; ---------------------------------------------------------------------------
__text:0002B2E5
__text:0002B2E5 loc_2B2E5:                              ; CODE XREF: _CompressDBRec+1C7j
__text:0002B2E5                 lea     eax, [ebp+var_A]
__text:0002B2E8                 sar     word ptr [eax], 1
__text:0002B2EB                 cmp     [ebp+var_A], 0
__text:0002B2F0                 jnz     short loc_2B2A9
__text:0002B2F2                 lea     eax, [ebp+var_14]
__text:0002B2F5                 inc     dword ptr [eax]
__text:0002B2F7
__text:0002B2F7 loc_2B2F7:                              ; CODE XREF: _CompressDBRec+18Ej
__text:0002B2F7                 mov     eax, [ebp+var_14]
__text:0002B2FA                 cmp     eax, [ebp+var_10]
__text:0002B2FD                 jb      short loc_2B2A3
__text:0002B2FF
__text:0002B2FF loc_2B2FF:                              ; CODE XREF: _CompressDBRec+ADj
__text:0002B2FF                 jmp     short $+2
__text:0002B301 ; ---------------------------------------------------------------------------
__text:0002B301
__text:0002B301 loc_2B301:                              ; CODE XREF: _CompressDBRec+70j
__text:0002B301                                         ; _CompressDBRec+7Aj ...
__text:0002B301                 mov     eax, [ebp+arg_0]
__text:0002B304                 mov     [esp], eax
__text:0002B307                 call    _TwxtGetByte
__text:0002B30C                 mov     [ebp+var_1C], eax
__text:0002B30F                 cmp     [ebp+var_1C], 0FFFFFFFFh
__text:0002B313                 jnz     loc_2B192
__text:0002B319                 lea     eax, [ebp+var_44]
__text:0002B31C                 mov     [esp], eax
__text:0002B31F                 call    _FlushBitStream
__text:0002B324                 cwde
__text:0002B325                 mov     [ebp+var_60], eax
__text:0002B328
__text:0002B328 loc_2B328:                              ; CODE XREF: _CompressDBRec+BAj
__text:0002B328                                         ; _CompressDBRec+109j ...
__text:0002B328                 mov     eax, [ebp+var_60]
__text:0002B32B                 add     esp, 74h
__text:0002B32E                 pop     edi
__text:0002B32F                 leave
__text:0002B330                 retn
__text:0002B330 _CompressDBRec  endp

__text:0002B4A6 ; =============== S U B R O U T I N E =======================================
__text:0002B4A6
__text:0002B4A6 ; Attributes: bp-based frame
__text:0002B4A6
__text:0002B4A6 _GetBitX        proc near               ; CODE XREF: _DecompressByte+20p
__text:0002B4A6                                         ; _DecompressSixBits+1Ep ...
__text:0002B4A6
__text:0002B4A6 returnValue     = dword ptr -1Ch
__text:0002B4A6 fChar           = dword ptr -0Ch
__text:0002B4A6 pStruct         = dword ptr  8
__text:0002B4A6
__text:0002B4A6                 push    ebp
__text:0002B4A7                 mov     ebp, esp
__text:0002B4A9                 push    ebx
__text:0002B4AA                 sub     esp, 34h
__text:0002B4AD                 mov     eax, [ebp+pStruct]
__text:0002B4B0                 mov     edx, [eax+4]
__text:0002B4B3                 mov     eax, [ebp+pStruct]
__text:0002B4B6                 mov     eax, [eax+0Ch]
__text:0002B4B9                 cmp     edx, eax
__text:0002B4BB                 jl      short loc_2B4C9
__text:0002B4BD                 mov     [ebp+returnValue], 0FFFFFFFEh
__text:0002B4C4                 jmp     loc_2B54E
__text:0002B4C9 ; ---------------------------------------------------------------------------
__text:0002B4C9
__text:0002B4C9 loc_2B4C9:                              ; CODE XREF: _GetBitX+15j
__text:0002B4C9                 mov     eax, [ebp+pStruct]
__text:0002B4CC                 mov     [esp], eax
__text:0002B4CF                 call    _MatrixFGetC
__text:0002B4D4                 mov     [ebp+fChar], eax
__text:0002B4D7                 cmp     [ebp+fChar], 0FFFFFFFFh
__text:0002B4DB                 jnz     short loc_2B4E6
__text:0002B4DD                 mov     [ebp+returnValue], 0FFFFFFFFh
__text:0002B4E4                 jmp     short loc_2B54E
__text:0002B4E6 ; ---------------------------------------------------------------------------
__text:0002B4E6
__text:0002B4E6 loc_2B4E6:                              ; CODE XREF: _GetBitX+35j
__text:0002B4E6                 mov     eax, [ebp+pStruct]
__text:0002B4E9                 mov     edx, [eax+24h]
__text:0002B4EC                 mov     eax, [ebp+pStruct]
__text:0002B4EF                 movzx   ecx, byte ptr [eax+20h]
__text:0002B4F3                 movzx   eax, cl
__text:0002B4F6                 and     eax, 3Fh
__text:0002B4F9                 lea     eax, [edx+eax]
__text:0002B4FC                 movzx   eax, byte ptr [eax]
__text:0002B4FF                 mov     edx, eax
__text:0002B501                 mov     eax, [ebp+fChar]
__text:0002B504                 xor     eax, edx
__text:0002B506                 mov     edx, eax
__text:0002B508                 mov     eax, [ebp+pStruct]
__text:0002B50B                 mov     [eax+1Ah], dl
__text:0002B50E                 lea     edx, [ecx-1]
__text:0002B511                 mov     eax, [ebp+pStruct]
__text:0002B514                 mov     [eax+20h], dl
__text:0002B517                 mov     eax, [ebp+pStruct]
__text:0002B51A                 movzx   ebx, byte ptr [eax+1Ah]
__text:0002B51E                 mov     eax, [ebp+pStruct]
__text:0002B521                 mov     edx, [eax+1Ch]
__text:0002B524                 mov     eax, [ebp+pStruct]
__text:0002B527                 mov     ecx, [eax+4]
__text:0002B52A                 mov     eax, ecx
__text:0002B52C                 movzx   eax, ax
__text:0002B52F                 and     eax, 7
__text:0002B532                 lea     eax, [edx+eax]
__text:0002B535                 movzx   eax, byte ptr [eax]
__text:0002B538                 and     eax, ebx
__text:0002B53A                 test    al, al
__text:0002B53C                 setnz   al
__text:0002B53F                 movzx   eax, al
__text:0002B542                 mov     [ebp+returnValue], eax
__text:0002B545                 lea     edx, [ecx+1]
__text:0002B548                 mov     eax, [ebp+pStruct]
__text:0002B54B                 mov     [eax+4], edx
__text:0002B54E
__text:0002B54E loc_2B54E:                              ; CODE XREF: _GetBitX+1Ej
__text:0002B54E                                         ; _GetBitX+3Ej
__text:0002B54E                 mov     eax, [ebp+returnValue]
__text:0002B551                 add     esp, 34h
__text:0002B554                 pop     ebx
__text:0002B555                 leave
__text:0002B556                 retn
__text:0002B556 _GetBitX        endp

__text:0002B72E ; =============== S U B R O U T I N E =======================================
__text:0002B72E
__text:0002B72E ; Attributes: bp-based frame
__text:0002B72E
__text:0002B72E _MatrixFGetC    proc near               ; CODE XREF: _GetBitX+29p
__text:0002B72E
__text:0002B72E returnValue     = dword ptr -1Ch
__text:0002B72E buffer          = byte ptr -11h
__text:0002B72E arg_0           = dword ptr  8
__text:0002B72E
__text:0002B72E                 push    ebp
__text:0002B72F                 mov     ebp, esp
__text:0002B731                 sub     esp, 38h
__text:0002B734
__text:0002B734 loc_2B734:                              ; DATA XREF: _FiveIndex+1F8o
__text:0002B734                                         ; _KXRadicalFromZin+EEo ...
__text:0002B734                 mov     eax, [ebp+arg_0]
__text:0002B737                 movzx   eax, byte ptr [eax+19h]
__text:0002B73B                 cmp     al, 9
__text:0002B73D                 jnz     short loc_2B751
__text:0002B73F
__text:0002B73F loc_2B73F:                              ; DATA XREF: _KXRadicalFromZin:loc_9EE60o
__text:0002B73F                                         ; _AppendUnihanBlockVersion:loc_A2097o ...
__text:0002B73F                 mov     eax, [ebp+arg_0]
__text:0002B742                 mov     eax, [eax]
__text:0002B744                 mov     [esp], eax      ; FILE *
__text:0002B747                 call    _getc
__text:0002B74C                 mov     [ebp+returnValue], eax
__text:0002B74F                 jmp     short loc_2B7CD
__text:0002B751 ; ---------------------------------------------------------------------------
__text:0002B751
__text:0002B751 loc_2B751:                              ; CODE XREF: _MatrixFGetC+Fj
__text:0002B751                 mov     eax, [ebp+arg_0]
__text:0002B754                 movzx   eax, byte ptr [eax+19h]
__text:0002B758                 test    al, al
__text:0002B75A                 jnz     short loc_2B7AC
__text:0002B75C                 mov     eax, [ebp+arg_0]
__text:0002B75F                 mov     eax, [eax]
__text:0002B761                 mov     [esp+0Ch], eax  ; FILE *
__text:0002B765                 mov     dword ptr [esp+8], 9 ; size_t
__text:0002B76D                 mov     dword ptr [esp+4], 1 ; size_t
__text:0002B775                 lea     eax, [ebp+buffer]
__text:0002B778                 mov     [esp], eax      ; void *
__text:0002B77B                 call    _fread
__text:0002B780                 cmp     eax, 9
__text:0002B783                 jz      short loc_2B78E
__text:0002B785                 mov     [ebp+returnValue], 0FFFFFFFFh
__text:0002B78C                 jmp     short loc_2B7CD
__text:0002B78E ; ---------------------------------------------------------------------------
__text:0002B78E
__text:0002B78E loc_2B78E:                              ; CODE XREF: _MatrixFGetC+55j
__text:0002B78E                 mov     eax, [ebp+arg_0]
__text:0002B791                 add     eax, 10h
__text:0002B794                 lea     edx, [ebp+buffer]
__text:0002B797                 mov     [esp+8], edx
__text:0002B79B                 mov     edx, offset _inverseMatrix
__text:0002B7A0                 mov     [esp+4], edx
__text:0002B7A4                 mov     [esp], eax
__text:0002B7A7                 call    _MatrixMultiply
__text:0002B7AC
__text:0002B7AC loc_2B7AC:                              ; CODE XREF: _MatrixFGetC+2Cj
__text:0002B7AC                 mov     eax, [ebp+arg_0]
__text:0002B7AF                 movzx   ecx, byte ptr [eax+19h]
__text:0002B7B3                 movzx   edx, cl
__text:0002B7B6                 mov     eax, [ebp+arg_0]
__text:0002B7B9                 movzx   eax, byte ptr [edx+eax+10h]
__text:0002B7BE                 movzx   eax, al
__text:0002B7C1                 mov     [ebp+returnValue], eax
__text:0002B7C4                 lea     edx, [ecx+1]
__text:0002B7C7                 mov     eax, [ebp+arg_0]
__text:0002B7CA                 mov     [eax+19h], dl
__text:0002B7CD
__text:0002B7CD loc_2B7CD:                              ; CODE XREF: _MatrixFGetC+21j
__text:0002B7CD                                         ; _MatrixFGetC+5Ej
__text:0002B7CD                 mov     eax, [ebp+returnValue]
__text:0002B7D0                 leave
__text:0002B7D1                 retn
__text:0002B7D1 _MatrixFGetC    endp

__text:0002B7D2 ; =============== S U B R O U T I N E =======================================
__text:0002B7D2
__text:0002B7D2 ; Attributes: bp-based frame
__text:0002B7D2
__text:0002B7D2 _MatrixMultiply proc near               ; CODE XREF: _MatrixFPutC+92p
__text:0002B7D2                                         ; _MatrixFGetC+79p
__text:0002B7D2
__text:0002B7D2 i               = dword ptr -0Ch
__text:0002B7D2 result          = dword ptr  8
__text:0002B7D2 matrix          = dword ptr  0Ch
__text:0002B7D2 vector          = dword ptr  10h
__text:0002B7D2
__text:0002B7D2                 push    ebp
__text:0002B7D3                 mov     ebp, esp
__text:0002B7D5                 push    ebx
__text:0002B7D6                 sub     esp, 14h
__text:0002B7D9                 mov     [ebp+i], 9
__text:0002B7E0                 jmp     loc_2B8C6
__text:0002B7E5 ; ---------------------------------------------------------------------------
__text:0002B7E5
__text:0002B7E5 loc_2B7E5:                              ; CODE XREF: _MatrixMultiply+FDj
__text:0002B7E5                 mov     eax, [ebp+matrix]
__text:0002B7E8                 movzx   edx, byte ptr [eax]
__text:0002B7EB                 mov     eax, [ebp+vector]
__text:0002B7EE                 movzx   eax, byte ptr [eax]
__text:0002B7F1                 imul    eax, edx
__text:0002B7F4                 mov     ecx, eax
__text:0002B7F6                 mov     eax, [ebp+matrix]
__text:0002B7F9                 inc     eax
__text:0002B7FA                 movzx   edx, byte ptr [eax]
__text:0002B7FD                 mov     eax, [ebp+vector]
__text:0002B800                 inc     eax
__text:0002B801                 movzx   eax, byte ptr [eax]
__text:0002B804                 imul    eax, edx
__text:0002B807                 lea     ebx, [ecx+eax]
__text:0002B80A                 mov     eax, [ebp+matrix]
__text:0002B80D                 add     eax, 3
__text:0002B810                 movzx   edx, byte ptr [eax]
__text:0002B813                 mov     eax, [ebp+vector]
__text:0002B816                 add     eax, 3
__text:0002B819                 movzx   eax, byte ptr [eax]
__text:0002B81C                 imul    eax, edx        ; DATA XREF: _FiveIndex+205o
__text:0002B81F                 mov     ecx, eax
__text:0002B821                 mov     eax, [ebp+matrix]
__text:0002B824                 add     eax, 2
__text:0002B827                 movzx   edx, byte ptr [eax]
__text:0002B82A                 mov     eax, [ebp+vector]
__text:0002B82D                 add     eax, 2
__text:0002B830                 movzx   eax, byte ptr [eax]
__text:0002B833                 imul    eax, edx
__text:0002B836                 lea     eax, [ecx+eax]
__text:0002B839                 add     ebx, eax
__text:0002B83B                 mov     eax, [ebp+matrix]
__text:0002B83E                 add     eax, 5
__text:0002B841                 movzx   edx, byte ptr [eax]
__text:0002B844                 mov     eax, [ebp+vector]
__text:0002B847                 add     eax, 5
__text:0002B84A                 movzx   eax, byte ptr [eax]
__text:0002B84D                 imul    eax, edx
__text:0002B850                 mov     ecx, eax
__text:0002B852                 mov     eax, [ebp+matrix]
__text:0002B855                 add     eax, 4
__text:0002B858                 movzx   edx, byte ptr [eax]
__text:0002B85B                 mov     eax, [ebp+vector]
__text:0002B85E                 add     eax, 4
__text:0002B861                 movzx   eax, byte ptr [eax]
__text:0002B864                 imul    eax, edx
__text:0002B867                 lea     eax, [ecx+eax]
__text:0002B86A                 add     ebx, eax
__text:0002B86C                 mov     eax, [ebp+matrix]
__text:0002B86F                 add     eax, 7
__text:0002B872                 movzx   edx, byte ptr [eax]
__text:0002B875                 mov     eax, [ebp+vector]
__text:0002B878                 add     eax, 7
__text:0002B87B                 movzx   eax, byte ptr [eax]
__text:0002B87E                 imul    eax, edx
__text:0002B881                 mov     ecx, eax
__text:0002B883                 mov     eax, [ebp+matrix]
__text:0002B886                 add     eax, 6
__text:0002B889                 movzx   edx, byte ptr [eax]
__text:0002B88C                 mov     eax, [ebp+vector]
__text:0002B88F                 add     eax, 6
__text:0002B892                 movzx   eax, byte ptr [eax]
__text:0002B895                 imul    eax, edx
__text:0002B898                 lea     eax, [ecx+eax]
__text:0002B89B                 lea     ecx, [ebx+eax]
__text:0002B89E                 mov     eax, [ebp+matrix]
__text:0002B8A1                 add     eax, 8
__text:0002B8A4                 movzx   edx, byte ptr [eax]
__text:0002B8A7                 mov     eax, [ebp+vector]
__text:0002B8AA                 add     eax, 8
__text:0002B8AD                 movzx   eax, byte ptr [eax]
__text:0002B8B0                 imul    eax, edx
__text:0002B8B3                 lea     eax, [ecx+eax]
__text:0002B8B6                 mov     edx, eax
__text:0002B8B8                 mov     eax, [ebp+result]
__text:0002B8BB                 mov     [eax], dl
__text:0002B8BD                 inc     [ebp+result]
__text:0002B8C0                 lea     eax, [ebp+matrix]
__text:0002B8C3                 add     dword ptr [eax], 9
__text:0002B8C6
__text:0002B8C6 loc_2B8C6:                              ; CODE XREF: _MatrixMultiply+Ej
__text:0002B8C6                 lea     eax, [ebp+i]
__text:0002B8C9                 dec     dword ptr [eax]
__text:0002B8CB                 cmp     [ebp+i], 0FFFFFFFFh
__text:0002B8CF                 jnz     loc_2B7E5
__text:0002B8D5                 add     esp, 14h
__text:0002B8D8                 pop     ebx
__text:0002B8D9                 leave
__text:0002B8DA                 retn
__text:0002B8DA _MatrixMultiply endp

__text:000A218D ; =============== S U B R O U T I N E =======================================
__text:000A218D
__text:000A218D ; Attributes: bp-based frame
__text:000A218D
__text:000A218D _ZiNumberLen    proc near               ; CODE XREF: _ConstructPinyinFromChars+2Dp
__text:000A218D                                         ; _ConvertHanziToOtherHomophone+62p ...
__text:000A218D
__text:000A218D returnValue     = dword ptr -0Ch
__text:000A218D decompressedChar= dword ptr  8
__text:000A218D lenBuffer       = dword ptr  0Ch
__text:000A218D
__text:000A218D                 push    ebp
__text:000A218E                 mov     ebp, esp
__text:000A2190                 sub     esp, 18h
__text:000A2193                 mov     eax, [ebp+decompressedChar]
__text:000A2196                 movzx   eax, byte ptr [eax]
__text:000A2199                 test    al, al
__text:000A219B                 js      short loc_A21B7
__text:000A219D                 mov     eax, [ebp+lenBuffer]
__text:000A21A0                 mov     dword ptr [eax], 1
__text:000A21A6                 mov     eax, [ebp+decompressedChar]
__text:000A21A9                 movzx   eax, byte ptr [eax]
__text:000A21AC                 movzx   eax, al
__text:000A21AF                 mov     [ebp+returnValue], eax
__text:000A21B2                 jmp     loc_A23CB
__text:000A21B7 ; ---------------------------------------------------------------------------
__text:000A21B7
__text:000A21B7 loc_A21B7:                              ; CODE XREF: _ZiNumberLen+Ej
__text:000A21B7                 mov     eax, [ebp+decompressedChar]
__text:000A21BA                 movzx   eax, byte ptr [eax]
__text:000A21BD                 cmp     al, 0DFh
__text:000A21BF                 ja      short loc_A221C
__text:000A21C1                 mov     eax, [ebp+decompressedChar]
__text:000A21C4                 movzx   eax, byte ptr [eax]
__text:000A21C7                 cmp     al, 0C1h
__text:000A21C9                 jbe     loc_A23BB
__text:000A21CF                 mov     eax, [ebp+decompressedChar]
__text:000A21D2                 inc     eax
__text:000A21D3                 movzx   eax, byte ptr [eax]
__text:000A21D6                 movzx   eax, al
__text:000A21D9                 and     eax, 0C0h
__text:000A21DE                 cmp     eax, 80h
__text:000A21E3                 jnz     loc_A23BB
__text:000A21E9                 mov     eax, [ebp+lenBuffer]
__text:000A21EC                 mov     dword ptr [eax], 2
__text:000A21F2                 mov     eax, [ebp+decompressedChar]
__text:000A21F5                 movzx   eax, byte ptr [eax]
__text:000A21F8                 movzx   eax, al
__text:000A21FB                 and     eax, 1Fh
__text:000A21FE                 mov     edx, eax
__text:000A2200                 shl     edx, 6
__text:000A2203                 mov     eax, [ebp+decompressedChar]
__text:000A2206                 inc     eax
__text:000A2207                 movzx   eax, byte ptr [eax]
__text:000A220A                 movzx   eax, al
__text:000A220D                 and     eax, 3Fh
__text:000A2210                 mov     ecx, edx
__text:000A2212                 or      ecx, eax
__text:000A2214                 mov     [ebp+returnValue], ecx
__text:000A2217                 jmp     loc_A23CB
__text:000A221C ; ---------------------------------------------------------------------------
__text:000A221C
__text:000A221C loc_A221C:                              ; CODE XREF: _ZiNumberLen+32j
__text:000A221C                 mov     eax, [ebp+decompressedChar]
__text:000A221F                 movzx   eax, byte ptr [eax]
__text:000A2222                 cmp     al, 0EFh
__text:000A2224                 ja      loc_A22D9
__text:000A222A                 mov     eax, [ebp+decompressedChar]
__text:000A222D                 movzx   eax, byte ptr [eax]
__text:000A2230                 cmp     al, 0E0h
__text:000A2232                 jnz     short loc_A2243
__text:000A2234                 mov     eax, [ebp+decompressedChar]
__text:000A2237                 inc     eax
__text:000A2238                 movzx   eax, byte ptr [eax]
__text:000A223B                 cmp     al, 9Fh
__text:000A223D                 jbe     loc_A23BB
__text:000A2243
__text:000A2243 loc_A2243:                              ; CODE XREF: _ZiNumberLen+A5j
__text:000A2243                 mov     eax, [ebp+decompressedChar]
__text:000A2246                 movzx   eax, byte ptr [eax]
__text:000A2249                 cmp     al, 0EDh
__text:000A224B                 jnz     short loc_A225C
__text:000A224D                 mov     eax, [ebp+decompressedChar]
__text:000A2250                 inc     eax
__text:000A2251                 movzx   eax, byte ptr [eax]
__text:000A2254                 cmp     al, 9Fh
__text:000A2256                 ja      loc_A23BB
__text:000A225C
__text:000A225C loc_A225C:                              ; CODE XREF: _ZiNumberLen+BEj
__text:000A225C                 mov     eax, [ebp+decompressedChar]
__text:000A225F                 inc     eax
__text:000A2260                 movzx   eax, byte ptr [eax]
__text:000A2263                 movzx   eax, al
__text:000A2266                 and     eax, 0C0h
__text:000A226B                 cmp     eax, 80h
__text:000A2270                 jnz     loc_A23BB
__text:000A2276                 mov     eax, [ebp+decompressedChar]
__text:000A2279                 add     eax, 2
__text:000A227C                 movzx   eax, byte ptr [eax]
__text:000A227F                 movzx   eax, al
__text:000A2282                 and     eax, 0C0h
__text:000A2287                 cmp     eax, 80h
__text:000A228C                 jnz     loc_A23BB
__text:000A2292                 mov     eax, [ebp+lenBuffer]
__text:000A2295                 mov     dword ptr [eax], 3
__text:000A229B                 mov     eax, [ebp+decompressedChar]
__text:000A229E                 movzx   eax, byte ptr [eax]
__text:000A22A1                 movzx   eax, al
__text:000A22A4                 and     eax, 0Fh
__text:000A22A7                 mov     edx, eax
__text:000A22A9                 shl     edx, 0Ch
__text:000A22AC                 mov     eax, [ebp+decompressedChar]
__text:000A22AF                 inc     eax
__text:000A22B0                 movzx   eax, byte ptr [eax]
__text:000A22B3                 movzx   eax, al
__text:000A22B6                 and     eax, 3Fh
__text:000A22B9                 shl     eax, 6
__text:000A22BC                 or      edx, eax
__text:000A22BE                 mov     eax, [ebp+decompressedChar]
__text:000A22C1                 add     eax, 2
__text:000A22C4                 movzx   eax, byte ptr [eax]
__text:000A22C7                 movzx   eax, al
__text:000A22CA                 and     eax, 3Fh
__text:000A22CD                 mov     ecx, edx
__text:000A22CF                 or      ecx, eax
__text:000A22D1                 mov     [ebp+returnValue], ecx
__text:000A22D4                 jmp     loc_A23CB
__text:000A22D9 ; ---------------------------------------------------------------------------
__text:000A22D9
__text:000A22D9 loc_A22D9:                              ; CODE XREF: _ZiNumberLen+97j
__text:000A22D9                 mov     eax, [ebp+decompressedChar]
__text:000A22DC                 movzx   eax, byte ptr [eax]
__text:000A22DF                 cmp     al, 0F4h
__text:000A22E1                 ja      loc_A23BB
__text:000A22E7                 mov     eax, [ebp+decompressedChar]
__text:000A22EA                 movzx   eax, byte ptr [eax]
__text:000A22ED                 cmp     al, 0F0h
__text:000A22EF                 jnz     short loc_A2300
__text:000A22F1                 mov     eax, [ebp+decompressedChar]
__text:000A22F4                 inc     eax
__text:000A22F5                 movzx   eax, byte ptr [eax]
__text:000A22F8                 cmp     al, 8Fh
__text:000A22FA                 jbe     loc_A23BB
__text:000A2300
__text:000A2300 loc_A2300:                              ; CODE XREF: _ZiNumberLen+162j
__text:000A2300                 mov     eax, [ebp+decompressedChar]
__text:000A2303                 movzx   eax, byte ptr [eax]
__text:000A2306                 cmp     al, 0F4h
__text:000A2308                 jnz     short loc_A2319
__text:000A230A                 mov     eax, [ebp+decompressedChar]
__text:000A230D                 inc     eax
__text:000A230E                 movzx   eax, byte ptr [eax]
__text:000A2311                 cmp     al, 8Fh
__text:000A2313                 ja      loc_A23BB
__text:000A2319
__text:000A2319 loc_A2319:                              ; CODE XREF: _ZiNumberLen+17Bj
__text:000A2319                 mov     eax, [ebp+decompressedChar]
__text:000A231C                 inc     eax
__text:000A231D                 movzx   eax, byte ptr [eax]
__text:000A2320                 movzx   eax, al
__text:000A2323                 and     eax, 0C0h
__text:000A2328                 cmp     eax, 80h
__text:000A232D                 jnz     loc_A23BB
__text:000A2333                 mov     eax, [ebp+decompressedChar]
__text:000A2336                 add     eax, 2
__text:000A2339                 movzx   eax, byte ptr [eax]
__text:000A233C                 movzx   eax, al
__text:000A233F                 and     eax, 0C0h
__text:000A2344                 cmp     eax, 80h
__text:000A2349                 jnz     short loc_A23BB
__text:000A234B                 mov     eax, [ebp+decompressedChar]
__text:000A234E                 add     eax, 3
__text:000A2351                 movzx   eax, byte ptr [eax]
__text:000A2354                 movzx   eax, al
__text:000A2357                 and     eax, 0C0h
__text:000A235C                 cmp     eax, 80h
__text:000A2361                 jnz     short loc_A23BB
__text:000A2363                 mov     eax, [ebp+lenBuffer]
__text:000A2366                 mov     dword ptr [eax], 4
__text:000A236C                 mov     eax, [ebp+decompressedChar]
__text:000A236F                 movzx   eax, byte ptr [eax]
__text:000A2372                 movzx   eax, al
__text:000A2375                 and     eax, 7
__text:000A2378                 mov     edx, eax
__text:000A237A                 shl     edx, 12h
__text:000A237D                 mov     eax, [ebp+decompressedChar]
__text:000A2380                 inc     eax
__text:000A2381                 movzx   eax, byte ptr [eax]
__text:000A2384                 movzx   eax, al
__text:000A2387                 and     eax, 3Fh
__text:000A238A                 shl     eax, 0Ch
__text:000A238D                 or      edx, eax
__text:000A238F                 mov     eax, [ebp+decompressedChar]
__text:000A2392                 add     eax, 2
__text:000A2395                 movzx   eax, byte ptr [eax]
__text:000A2398                 movzx   eax, al
__text:000A239B                 and     eax, 3Fh
__text:000A239E                 shl     eax, 6
__text:000A23A1                 or      edx, eax
__text:000A23A3                 mov     eax, [ebp+decompressedChar]
__text:000A23A6                 add     eax, 3
__text:000A23A9                 movzx   eax, byte ptr [eax]
__text:000A23AC                 movzx   eax, al
__text:000A23AF                 and     eax, 3Fh
__text:000A23B2                 mov     ecx, edx
__text:000A23B4                 or      ecx, eax
__text:000A23B6                 mov     [ebp+returnValue], ecx
__text:000A23B9                 jmp     short loc_A23CB
__text:000A23BB ; ---------------------------------------------------------------------------
__text:000A23BB
__text:000A23BB loc_A23BB:                              ; CODE XREF: _ZiNumberLen+3Cj
__text:000A23BB                                         ; _ZiNumberLen+56j ...
__text:000A23BB                 mov     eax, [ebp+lenBuffer]
__text:000A23BE                 mov     dword ptr [eax], 1
__text:000A23C4                 mov     [ebp+returnValue], 0FFFEh
__text:000A23CB
__text:000A23CB loc_A23CB:                              ; CODE XREF: _ZiNumberLen+25j
__text:000A23CB                                         ; _ZiNumberLen+8Aj ...
__text:000A23CB                 mov     eax, [ebp+returnValue]
__text:000A23CE                 leave
__text:000A23CF                 retn
__text:000A23CF _ZiNumberLen    endp

__text:0002A8C4 ; =============== S U B R O U T I N E =======================================
__text:0002A8C4
__text:0002A8C4 ; Attributes: bp-based frame
__text:0002A8C4
__text:0002A8C4 ; int __cdecl DBRecordReadIntoTextBuf(int buffer, FILE *fp, __int32 offset)
__text:0002A8C4 _DBRecordReadIntoTextBuf proc near      ; CODE XREF: _DBRecordRead+3Ep
__text:0002A8C4                                         ; _DBRecordReadOneLine+4Ap
__text:0002A8C4
__text:0002A8C4 returnValue     = dword ptr -1Ch
__text:0002A8C4 recordLength    = word ptr -16h
__text:0002A8C4 recordTag       = dword ptr -14h
__text:0002A8C4 rawRecordByte   = dword ptr -10h
__text:0002A8C4 appendBufferStat= word ptr -0Ah
__text:0002A8C4 buffer          = dword ptr  8
__text:0002A8C4 fp              = dword ptr  0Ch
__text:0002A8C4 offset          = dword ptr  10h
__text:0002A8C4
__text:0002A8C4                 push    ebp
__text:0002A8C5                 mov     ebp, esp
__text:0002A8C7                 sub     esp, 38h
__text:0002A8CA                 mov     dword ptr [esp+8], 0 ; int
__text:0002A8D2                 mov     eax, [ebp+offset]
__text:0002A8D5                 mov     [esp+4], eax    ; __int32
__text:0002A8D9                 mov     eax, [ebp+fp]
__text:0002A8DC                 mov     [esp], eax      ; FILE *
__text:0002A8DF                 call    _fseek
__text:0002A8E4                 test    eax, eax
__text:0002A8E6                 jz      short loc_2A8F4
__text:0002A8E8                 mov     [ebp+returnValue], 0FFFFFFB0h
__text:0002A8EF                 jmp     loc_2A9F0
__text:0002A8F4 ; ---------------------------------------------------------------------------
__text:0002A8F4
__text:0002A8F4 loc_2A8F4:                              ; CODE XREF: _DBRecordReadIntoTextBuf+22j
__text:0002A8F4                 lea     eax, [ebp+recordLength]
__text:0002A8F7                 mov     [esp+4], eax    ; void *
__text:0002A8FB                 mov     eax, [ebp+fp]
__text:0002A8FE                 mov     [esp], eax      ; FILE *
__text:0002A901                 call    _ReadBigEndianShort
__text:0002A906                 test    eax, eax
__text:0002A908                 jz      short loc_2A914
__text:0002A90A                 movzx   eax, [ebp+recordLength]
__text:0002A90E                 cmp     ax, 7530h
__text:0002A912                 jbe     short loc_2A920
__text:0002A914
__text:0002A914 loc_2A914:                              ; CODE XREF: _DBRecordReadIntoTextBuf+44j
__text:0002A914                 mov     [ebp+returnValue], 0FFFFFFEDh
__text:0002A91B                 jmp     loc_2A9F0
__text:0002A920 ; ---------------------------------------------------------------------------
__text:0002A920
__text:0002A920 loc_2A920:                              ; CODE XREF: _DBRecordReadIntoTextBuf+4Ej
__text:0002A920                 mov     eax, [ebp+fp]
__text:0002A923                 mov     [esp], eax      ; FILE *
__text:0002A926                 call    _getc
__text:0002A92B                 mov     [ebp+recordTag], eax
__text:0002A92E                 cmp     [ebp+recordTag], 0FFFFFFFFh
__text:0002A932                 jnz     short loc_2A940
__text:0002A934                 mov     [ebp+returnValue], 0FFFFFFEDh
__text:0002A93B                 jmp     loc_2A9F0
__text:0002A940 ; ---------------------------------------------------------------------------
__text:0002A940
__text:0002A940 loc_2A940:                              ; CODE XREF: _DBRecordReadIntoTextBuf+6Ej
__text:0002A940                 movzx   eax, [ebp+recordLength]
__text:0002A944                 dec     eax
__text:0002A945                 mov     [ebp+recordLength], ax
__text:0002A949                 mov     eax, [ebp+recordTag]
__text:0002A94C                 shr     eax, 1
__text:0002A94E                 and     eax, 1
__text:0002A951                 test    al, al
__text:0002A953                 jz      short loc_2A982
__text:0002A955                 mov     eax, [ebp+recordTag]
__text:0002A958                 movzx   edx, al
__text:0002A95B                 movzx   eax, [ebp+recordLength]
__text:0002A95F                 movzx   eax, ax
__text:0002A962                 mov     [esp+0Ch], edx
__text:0002A966                 mov     [esp+8], eax
__text:0002A96A                 mov     eax, [ebp+fp]
__text:0002A96D                 mov     [esp+4], eax
__text:0002A971                 mov     eax, [ebp+buffer]
__text:0002A974                 mov     [esp], eax
__text:0002A977                 call    _DecompressDBRec
__text:0002A97C                 cwde
__text:0002A97D                 mov     [ebp+returnValue], eax
__text:0002A980                 jmp     short loc_2A9F0
__text:0002A982 ; ---------------------------------------------------------------------------
__text:0002A982
__text:0002A982 loc_2A982:                              ; CODE XREF: _DBRecordReadIntoTextBuf+8Fj
__text:0002A982                                         ; _DBRecordReadIntoTextBuf+123j
__text:0002A982                 mov     eax, [ebp+fp]
__text:0002A985                 mov     [esp], eax      ; FILE *
__text:0002A988                 call    _getc
__text:0002A98D                 mov     [ebp+rawRecordByte], eax
__text:0002A990                 cmp     [ebp+rawRecordByte], 0FFFFFFFFh
__text:0002A994                 jnz     short loc_2A99F
__text:0002A996                 mov     [ebp+returnValue], 0FFFFFFEDh
__text:0002A99D                 jmp     short loc_2A9F0
__text:0002A99F ; ---------------------------------------------------------------------------
__text:0002A99F
__text:0002A99F loc_2A99F:                              ; CODE XREF: _DBRecordReadIntoTextBuf+D0j
__text:0002A99F                 cmp     [ebp+rawRecordByte], 0
__text:0002A9A3                 jnz     short loc_2A9AE
__text:0002A9A5                 mov     [ebp+returnValue], 0
__text:0002A9AC                 jmp     short loc_2A9F0
__text:0002A9AE ; ---------------------------------------------------------------------------
__text:0002A9AE
__text:0002A9AE loc_2A9AE:                              ; CODE XREF: _DBRecordReadIntoTextBuf+DFj
__text:0002A9AE                 mov     eax, [ebp+rawRecordByte]
__text:0002A9B1                 movsx   eax, al
__text:0002A9B4                 mov     [esp+4], eax
__text:0002A9B8                 mov     eax, [ebp+buffer]
__text:0002A9BB                 mov     [esp], eax
__text:0002A9BE                 call    _TBPutC
__text:0002A9C3                 mov     [ebp+appendBufferStat], ax
__text:0002A9C7                 cmp     [ebp+appendBufferStat], 0
__text:0002A9CC                 jz      short loc_2A9D7
__text:0002A9CE                 movsx   eax, [ebp+appendBufferStat]
__text:0002A9D2                 mov     [ebp+returnValue], eax
__text:0002A9D5                 jmp     short loc_2A9F0
__text:0002A9D7 ; ---------------------------------------------------------------------------
__text:0002A9D7
__text:0002A9D7 loc_2A9D7:                              ; CODE XREF: _DBRecordReadIntoTextBuf+108j
__text:0002A9D7                 movzx   eax, [ebp+recordLength]
__text:0002A9DB                 dec     eax
__text:0002A9DC                 mov     [ebp+recordLength], ax
__text:0002A9E0                 movzx   eax, [ebp+recordLength]
__text:0002A9E4                 test    ax, ax
__text:0002A9E7                 jnz     short loc_2A982
__text:0002A9E9                 mov     [ebp+returnValue], 0
__text:0002A9F0
__text:0002A9F0 loc_2A9F0:                              ; CODE XREF: _DBRecordReadIntoTextBuf+2Bj
__text:0002A9F0                                         ; _DBRecordReadIntoTextBuf+57j ...
__text:0002A9F0                 mov     eax, [ebp+returnValue]
__text:0002A9F3                 leave
__text:0002A9F4                 retn
__text:0002A9F4 _DBRecordReadIntoTextBuf endp

