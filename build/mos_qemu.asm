
mos_qemu.elf：     文件格式 elf64-littleaarch64


Disassembly of section .start:

ffffff8040080000 <_start>:
ffffff8040080000:	58000481 	ldr	x1, ffffff8040080090 <_el1_start+0x7c>
ffffff8040080004:	9100003f 	mov	sp, x1
ffffff8040080008:	10007fc0 	adr	x0, ffffff8040081000 <kernel_page_directory>
ffffff804008000c:	940000e2 	bl	ffffff8040080394 <vm_init>
ffffff8040080010:	aa0003f3 	mov	x19, x0

ffffff8040080014 <_el1_start>:
ffffff8040080014:	d53800a0 	mrs	x0, mpidr_el1
ffffff8040080018:	92780001 	and	x1, x0, #0x100
ffffff804008001c:	b5000341 	cbnz	x1, ffffff8040080084 <_el1_start+0x70>
ffffff8040080020:	92401c00 	and	x0, x0, #0xff
ffffff8040080024:	580003a1 	ldr	x1, ffffff8040080098 <_el1_start+0x84>
ffffff8040080028:	d2a00042 	mov	x2, #0x20000               	// #131072
ffffff804008002c:	9b027c03 	mul	x3, x0, x2
ffffff8040080030:	cb030021 	sub	x1, x1, x3
ffffff8040080034:	9100003f 	mov	sp, x1
ffffff8040080038:	58000340 	ldr	x0, ffffff80400800a0 <_el1_start+0x8c>
ffffff804008003c:	d518c000 	msr	vbar_el1, x0
ffffff8040080040:	58000340 	ldr	x0, ffffff80400800a8 <_el1_start+0x94>
ffffff8040080044:	d518a200 	msr	mair_el1, x0
ffffff8040080048:	58000340 	ldr	x0, ffffff80400800b0 <_el1_start+0x9c>
ffffff804008004c:	d5182040 	msr	tcr_el1, x0
ffffff8040080050:	d5033fdf 	isb
ffffff8040080054:	10007d60 	adr	x0, ffffff8040081000 <kernel_page_directory>
ffffff8040080058:	d5182000 	msr	ttbr0_el1, x0
ffffff804008005c:	d5182020 	msr	ttbr1_el1, x0
ffffff8040080060:	d5033b9f 	dsb	ish
ffffff8040080064:	d5033fdf 	isb
ffffff8040080068:	d5381000 	mrs	x0, sctlr_el1
ffffff804008006c:	58000260 	ldr	x0, ffffff80400800b8 <_el1_start+0xa4>
ffffff8040080070:	d5181000 	msr	sctlr_el1, x0
ffffff8040080074:	d5033fdf 	isb
ffffff8040080078:	aa1303e0 	mov	x0, x19
ffffff804008007c:	58000221 	ldr	x1, ffffff80400800c0 <_el1_start+0xac>
ffffff8040080080:	d63f0020 	blr	x1
ffffff8040080084:	d503205f 	wfe
ffffff8040080088:	17ffffff 	b	ffffff8040080084 <_el1_start+0x70>
ffffff804008008c:	00000000 	.inst	0x00000000 ; undefined
ffffff8040080090:	40080000 	.word	0x40080000
ffffff8040080094:	00000000 	.word	0x00000000
ffffff8040080098:	40080000 	.word	0x40080000
ffffff804008009c:	ffffff80 	.word	0xffffff80
ffffff80400800a0:	40083000 	.word	0x40083000
ffffff80400800a4:	ffffff80 	.word	0xffffff80
ffffff80400800a8:	004400ff 	.word	0x004400ff
ffffff80400800ac:	00000000 	.word	0x00000000
ffffff80400800b0:	b5593519 	.word	0xb5593519
ffffff80400800b4:	00000034 	.word	0x00000034
ffffff80400800b8:	30d51825 	.word	0x30d51825
ffffff80400800bc:	00000000 	.word	0x00000000
ffffff80400800c0:	400828a0 	.word	0x400828a0
ffffff80400800c4:	ffffff80 	.word	0xffffff80

ffffff80400800c8 <boot_bzero>:
ffffff80400800c8:	d10083ff 	sub	sp, sp, #0x20
ffffff80400800cc:	f90007e0 	str	x0, [sp, #8]
ffffff80400800d0:	f90003e1 	str	x1, [sp]
ffffff80400800d4:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400800d8:	f94003e1 	ldr	x1, [sp]
ffffff80400800dc:	8b000020 	add	x0, x1, x0
ffffff80400800e0:	f9000fe0 	str	x0, [sp, #24]
ffffff80400800e4:	14000006 	b	ffffff80400800fc <boot_bzero+0x34>
ffffff80400800e8:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400800ec:	f900001f 	str	xzr, [x0]
ffffff80400800f0:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400800f4:	91002000 	add	x0, x0, #0x8
ffffff80400800f8:	f90007e0 	str	x0, [sp, #8]
ffffff80400800fc:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040080100:	91001c00 	add	x0, x0, #0x7
ffffff8040080104:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040080108:	eb00003f 	cmp	x1, x0
ffffff804008010c:	54fffee8 	b.hi	ffffff80400800e8 <boot_bzero+0x20>  // b.pmore
ffffff8040080110:	14000005 	b	ffffff8040080124 <boot_bzero+0x5c>
ffffff8040080114:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040080118:	91000401 	add	x1, x0, #0x1
ffffff804008011c:	f90007e1 	str	x1, [sp, #8]
ffffff8040080120:	3900001f 	strb	wzr, [x0]
ffffff8040080124:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040080128:	f9400fe1 	ldr	x1, [sp, #24]
ffffff804008012c:	eb00003f 	cmp	x1, x0
ffffff8040080130:	54ffff28 	b.hi	ffffff8040080114 <boot_bzero+0x4c>  // b.pmore
ffffff8040080134:	d503201f 	nop
ffffff8040080138:	910083ff 	add	sp, sp, #0x20
ffffff804008013c:	d65f03c0 	ret

ffffff8040080140 <boot_alloc>:
ffffff8040080140:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040080144:	910003fd 	mov	x29, sp
ffffff8040080148:	b9001fa0 	str	w0, [x29, #28]
ffffff804008014c:	b9001ba1 	str	w1, [x29, #24]
ffffff8040080150:	b90017a2 	str	w2, [x29, #20]
ffffff8040080154:	b9401ba1 	ldr	w1, [x29, #24]
ffffff8040080158:	d0000000 	adrp	x0, ffffff8040082000 <freemem>
ffffff804008015c:	91000000 	add	x0, x0, #0x0
ffffff8040080160:	f9400000 	ldr	x0, [x0]
ffffff8040080164:	8b000020 	add	x0, x1, x0
ffffff8040080168:	d1000401 	sub	x1, x0, #0x1
ffffff804008016c:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040080170:	4b0003e0 	neg	w0, w0
ffffff8040080174:	2a0003e0 	mov	w0, w0
ffffff8040080178:	8a000021 	and	x1, x1, x0
ffffff804008017c:	d0000000 	adrp	x0, ffffff8040082000 <freemem>
ffffff8040080180:	91000000 	add	x0, x0, #0x0
ffffff8040080184:	f9000001 	str	x1, [x0]
ffffff8040080188:	d0000000 	adrp	x0, ffffff8040082000 <freemem>
ffffff804008018c:	91000000 	add	x0, x0, #0x0
ffffff8040080190:	f9400000 	ldr	x0, [x0]
ffffff8040080194:	f90017a0 	str	x0, [x29, #40]
ffffff8040080198:	b9401fa1 	ldr	w1, [x29, #28]
ffffff804008019c:	d0000000 	adrp	x0, ffffff8040082000 <freemem>
ffffff80400801a0:	91000000 	add	x0, x0, #0x0
ffffff80400801a4:	f9400000 	ldr	x0, [x0]
ffffff80400801a8:	8b000021 	add	x1, x1, x0
ffffff80400801ac:	d0000000 	adrp	x0, ffffff8040082000 <freemem>
ffffff80400801b0:	91000000 	add	x0, x0, #0x0
ffffff80400801b4:	f9000001 	str	x1, [x0]
ffffff80400801b8:	b94017a0 	ldr	w0, [x29, #20]
ffffff80400801bc:	7100001f 	cmp	w0, #0x0
ffffff80400801c0:	54000080 	b.eq	ffffff80400801d0 <boot_alloc+0x90>  // b.none
ffffff80400801c4:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400801c8:	b9401fa1 	ldr	w1, [x29, #28]
ffffff80400801cc:	97ffffbf 	bl	ffffff80400800c8 <boot_bzero>
ffffff80400801d0:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400801d4:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400801d8:	d65f03c0 	ret

ffffff80400801dc <boot_pgdir_walk>:
ffffff80400801dc:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff80400801e0:	910003fd 	mov	x29, sp
ffffff80400801e4:	f9000fa0 	str	x0, [x29, #24]
ffffff80400801e8:	f9000ba1 	str	x1, [x29, #16]
ffffff80400801ec:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400801f0:	d35efc00 	lsr	x0, x0, #30
ffffff80400801f4:	92402000 	and	x0, x0, #0x1ff
ffffff80400801f8:	d37df000 	lsl	x0, x0, #3
ffffff80400801fc:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040080200:	8b000020 	add	x0, x1, x0
ffffff8040080204:	f90017a0 	str	x0, [x29, #40]
ffffff8040080208:	f9400ba0 	ldr	x0, [x29, #16]
ffffff804008020c:	d355fc00 	lsr	x0, x0, #21
ffffff8040080210:	92402000 	and	x0, x0, #0x1ff
ffffff8040080214:	d37df001 	lsl	x1, x0, #3
ffffff8040080218:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008021c:	f9400000 	ldr	x0, [x0]
ffffff8040080220:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040080224:	8b000020 	add	x0, x1, x0
ffffff8040080228:	f9001fa0 	str	x0, [x29, #56]
ffffff804008022c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040080230:	f9400000 	ldr	x0, [x0]
ffffff8040080234:	92400400 	and	x0, x0, #0x3
ffffff8040080238:	f100001f 	cmp	x0, #0x0
ffffff804008023c:	54000221 	b.ne	ffffff8040080280 <boot_pgdir_walk+0xa4>  // b.any
ffffff8040080240:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040080244:	52820001 	mov	w1, #0x1000                	// #4096
ffffff8040080248:	52820000 	mov	w0, #0x1000                	// #4096
ffffff804008024c:	97ffffbd 	bl	ffffff8040080140 <boot_alloc>
ffffff8040080250:	f9001fa0 	str	x0, [x29, #56]
ffffff8040080254:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040080258:	b2400401 	orr	x1, x0, #0x3
ffffff804008025c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040080260:	f9000001 	str	x1, [x0]
ffffff8040080264:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040080268:	d355fc00 	lsr	x0, x0, #21
ffffff804008026c:	92402000 	and	x0, x0, #0x1ff
ffffff8040080270:	d37df000 	lsl	x0, x0, #3
ffffff8040080274:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040080278:	8b000020 	add	x0, x1, x0
ffffff804008027c:	f9001fa0 	str	x0, [x29, #56]
ffffff8040080280:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040080284:	d34cfc00 	lsr	x0, x0, #12
ffffff8040080288:	92402000 	and	x0, x0, #0x1ff
ffffff804008028c:	d37df001 	lsl	x1, x0, #3
ffffff8040080290:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040080294:	f9400000 	ldr	x0, [x0]
ffffff8040080298:	92744c00 	and	x0, x0, #0xfffff000
ffffff804008029c:	8b000020 	add	x0, x1, x0
ffffff80400802a0:	f9001ba0 	str	x0, [x29, #48]
ffffff80400802a4:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400802a8:	f9400000 	ldr	x0, [x0]
ffffff80400802ac:	92400400 	and	x0, x0, #0x3
ffffff80400802b0:	f100001f 	cmp	x0, #0x0
ffffff80400802b4:	54000221 	b.ne	ffffff80400802f8 <boot_pgdir_walk+0x11c>  // b.any
ffffff80400802b8:	52800022 	mov	w2, #0x1                   	// #1
ffffff80400802bc:	52820001 	mov	w1, #0x1000                	// #4096
ffffff80400802c0:	52820000 	mov	w0, #0x1000                	// #4096
ffffff80400802c4:	97ffff9f 	bl	ffffff8040080140 <boot_alloc>
ffffff80400802c8:	f9001ba0 	str	x0, [x29, #48]
ffffff80400802cc:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400802d0:	b2400401 	orr	x1, x0, #0x3
ffffff80400802d4:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400802d8:	f9000001 	str	x1, [x0]
ffffff80400802dc:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400802e0:	d34cfc00 	lsr	x0, x0, #12
ffffff80400802e4:	92402000 	and	x0, x0, #0x1ff
ffffff80400802e8:	d37df000 	lsl	x0, x0, #3
ffffff80400802ec:	f9401ba1 	ldr	x1, [x29, #48]
ffffff80400802f0:	8b000020 	add	x0, x1, x0
ffffff80400802f4:	f9001ba0 	str	x0, [x29, #48]
ffffff80400802f8:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400802fc:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040080300:	d65f03c0 	ret

ffffff8040080304 <boot_map_segment>:
ffffff8040080304:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff8040080308:	910003fd 	mov	x29, sp
ffffff804008030c:	f9001fa0 	str	x0, [x29, #56]
ffffff8040080310:	f9001ba1 	str	x1, [x29, #48]
ffffff8040080314:	f90017a2 	str	x2, [x29, #40]
ffffff8040080318:	f90013a3 	str	x3, [x29, #32]
ffffff804008031c:	f9000fa4 	str	x4, [x29, #24]
ffffff8040080320:	f90027bf 	str	xzr, [x29, #72]
ffffff8040080324:	14000015 	b	ffffff8040080378 <boot_map_segment+0x74>
ffffff8040080328:	f9401ba1 	ldr	x1, [x29, #48]
ffffff804008032c:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040080330:	8b000020 	add	x0, x1, x0
ffffff8040080334:	aa0003e1 	mov	x1, x0
ffffff8040080338:	f9401fa0 	ldr	x0, [x29, #56]
ffffff804008033c:	97ffffa8 	bl	ffffff80400801dc <boot_pgdir_walk>
ffffff8040080340:	f90023a0 	str	x0, [x29, #64]
ffffff8040080344:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040080348:	f94027a0 	ldr	x0, [x29, #72]
ffffff804008034c:	8b000020 	add	x0, x1, x0
ffffff8040080350:	92744c01 	and	x1, x0, #0xfffff000
ffffff8040080354:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040080358:	aa000021 	orr	x1, x1, x0
ffffff804008035c:	d2808060 	mov	x0, #0x403                 	// #1027
ffffff8040080360:	aa000021 	orr	x1, x1, x0
ffffff8040080364:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040080368:	f9000001 	str	x1, [x0]
ffffff804008036c:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040080370:	91400400 	add	x0, x0, #0x1, lsl #12
ffffff8040080374:	f90027a0 	str	x0, [x29, #72]
ffffff8040080378:	f94027a1 	ldr	x1, [x29, #72]
ffffff804008037c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040080380:	eb00003f 	cmp	x1, x0
ffffff8040080384:	54fffd23 	b.cc	ffffff8040080328 <boot_map_segment+0x24>  // b.lo, b.ul, b.last
ffffff8040080388:	d503201f 	nop
ffffff804008038c:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff8040080390:	d65f03c0 	ret

ffffff8040080394 <vm_init>:
ffffff8040080394:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040080398:	910003fd 	mov	x29, sp
ffffff804008039c:	f9000fa0 	str	x0, [x29, #24]
ffffff80400803a0:	d2820001 	mov	x1, #0x1000                	// #4096
ffffff80400803a4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400803a8:	97ffff48 	bl	ffffff80400800c8 <boot_bzero>
ffffff80400803ac:	d004fd20 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff80400803b0:	9106a000 	add	x0, x0, #0x1a8
ffffff80400803b4:	2a0003e0 	mov	w0, w0
ffffff80400803b8:	913ffc00 	add	x0, x0, #0xfff
ffffff80400803bc:	92744c01 	and	x1, x0, #0xfffff000
ffffff80400803c0:	d0000000 	adrp	x0, ffffff8040082000 <freemem>
ffffff80400803c4:	91000000 	add	x0, x0, #0x0
ffffff80400803c8:	f9000001 	str	x1, [x0]
ffffff80400803cc:	d2806004 	mov	x4, #0x300                 	// #768
ffffff80400803d0:	d2a80003 	mov	x3, #0x40000000            	// #1073741824
ffffff80400803d4:	d2a40002 	mov	x2, #0x20000000            	// #536870912
ffffff80400803d8:	d2a80001 	mov	x1, #0x40000000            	// #1073741824
ffffff80400803dc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400803e0:	97ffffc9 	bl	ffffff8040080304 <boot_map_segment>
ffffff80400803e4:	d2804084 	mov	x4, #0x204                 	// #516
ffffff80400803e8:	d2a10003 	mov	x3, #0x8000000             	// #134217728
ffffff80400803ec:	d2820002 	mov	x2, #0x1000                	// #4096
ffffff80400803f0:	d2a10001 	mov	x1, #0x8000000             	// #134217728
ffffff80400803f4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400803f8:	97ffffc3 	bl	ffffff8040080304 <boot_map_segment>
ffffff80400803fc:	d2804084 	mov	x4, #0x204                 	// #516
ffffff8040080400:	d2a10023 	mov	x3, #0x8010000             	// #134283264
ffffff8040080404:	d2840002 	mov	x2, #0x2000                	// #8192
ffffff8040080408:	d2a10021 	mov	x1, #0x8010000             	// #134283264
ffffff804008040c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040080410:	97ffffbd 	bl	ffffff8040080304 <boot_map_segment>
ffffff8040080414:	d2804084 	mov	x4, #0x204                 	// #516
ffffff8040080418:	d2a12003 	mov	x3, #0x9000000             	// #150994944
ffffff804008041c:	d2820002 	mov	x2, #0x1000                	// #4096
ffffff8040080420:	d2a12001 	mov	x1, #0x9000000             	// #150994944
ffffff8040080424:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040080428:	97ffffb7 	bl	ffffff8040080304 <boot_map_segment>
ffffff804008042c:	d0000000 	adrp	x0, ffffff8040082000 <freemem>
ffffff8040080430:	91000000 	add	x0, x0, #0x0
ffffff8040080434:	f9400000 	ldr	x0, [x0]
ffffff8040080438:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff804008043c:	d65f03c0 	ret
	...

ffffff8040081000 <kernel_page_directory>:
	...

ffffff8040082000 <freemem>:
	...

Disassembly of section .text:

ffffff8040082800 <writel>:
ffffff8040082800:	d10043ff 	sub	sp, sp, #0x10
ffffff8040082804:	b9000fe0 	str	w0, [sp, #12]
ffffff8040082808:	f90003e1 	str	x1, [sp]
ffffff804008280c:	f94003e0 	ldr	x0, [sp]
ffffff8040082810:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040082814:	b9000001 	str	w1, [x0]
ffffff8040082818:	d503201f 	nop
ffffff804008281c:	910043ff 	add	sp, sp, #0x10
ffffff8040082820:	d65f03c0 	ret

ffffff8040082824 <uart_send>:
ffffff8040082824:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040082828:	910003fd 	mov	x29, sp
ffffff804008282c:	39007fa0 	strb	w0, [x29, #31]
ffffff8040082830:	39407fa0 	ldrb	w0, [x29, #31]
ffffff8040082834:	b25963e1 	mov	x1, #0xffffff8000000000    	// #-549755813888
ffffff8040082838:	f2a12001 	movk	x1, #0x900, lsl #16
ffffff804008283c:	97fffff1 	bl	ffffff8040082800 <writel>
ffffff8040082840:	d503201f 	nop
ffffff8040082844:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040082848:	d65f03c0 	ret

ffffff804008284c <memset>:
ffffff804008284c:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040082850:	f9000fe0 	str	x0, [sp, #24]
ffffff8040082854:	39005fe1 	strb	w1, [sp, #23]
ffffff8040082858:	f90007e2 	str	x2, [sp, #8]
ffffff804008285c:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040082860:	f90017e0 	str	x0, [sp, #40]
ffffff8040082864:	14000007 	b	ffffff8040082880 <memset+0x34>
ffffff8040082868:	f94017e0 	ldr	x0, [sp, #40]
ffffff804008286c:	39405fe1 	ldrb	w1, [sp, #23]
ffffff8040082870:	39000001 	strb	w1, [x0]
ffffff8040082874:	f94017e0 	ldr	x0, [sp, #40]
ffffff8040082878:	91000400 	add	x0, x0, #0x1
ffffff804008287c:	f90017e0 	str	x0, [sp, #40]
ffffff8040082880:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040082884:	d1000401 	sub	x1, x0, #0x1
ffffff8040082888:	f90007e1 	str	x1, [sp, #8]
ffffff804008288c:	f100001f 	cmp	x0, #0x0
ffffff8040082890:	54fffec1 	b.ne	ffffff8040082868 <memset+0x1c>  // b.any
ffffff8040082894:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040082898:	9100c3ff 	add	sp, sp, #0x30
ffffff804008289c:	d65f03c0 	ret

ffffff80400828a0 <main>:
ffffff80400828a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff80400828a4:	910003fd 	mov	x29, sp
ffffff80400828a8:	f9000fa0 	str	x0, [x29, #24]
ffffff80400828ac:	94000561 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400828b0:	3900bfa0 	strb	w0, [x29, #47]
ffffff80400828b4:	3940bfa0 	ldrb	w0, [x29, #47]
ffffff80400828b8:	7100001f 	cmp	w0, #0x0
ffffff80400828bc:	540006c1 	b.ne	ffffff8040082994 <main+0xf4>  // b.any
ffffff80400828c0:	9004fd20 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff80400828c4:	9106a001 	add	x1, x0, #0x1a8
ffffff80400828c8:	f00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400828cc:	910a6000 	add	x0, x0, #0x298
ffffff80400828d0:	cb000020 	sub	x0, x1, x0
ffffff80400828d4:	aa0003e1 	mov	x1, x0
ffffff80400828d8:	f00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400828dc:	910a6000 	add	x0, x0, #0x298
ffffff80400828e0:	aa0103e2 	mov	x2, x1
ffffff80400828e4:	52800001 	mov	w1, #0x0                   	// #0
ffffff80400828e8:	97ffffd9 	bl	ffffff804008284c <memset>
ffffff80400828ec:	3940bfa1 	ldrb	w1, [x29, #47]
ffffff80400828f0:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400828f4:	912a4000 	add	x0, x0, #0xa90
ffffff80400828f8:	94001203 	bl	ffffff8040087104 <printf>
ffffff80400828fc:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040082900:	912a8000 	add	x0, x0, #0xaa0
ffffff8040082904:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040082908:	940011ff 	bl	ffffff8040087104 <printf>
ffffff804008290c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040082910:	94000b0b 	bl	ffffff804008553c <page_init>
ffffff8040082914:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040082918:	912ac000 	add	x0, x0, #0xab0
ffffff804008291c:	940011fa 	bl	ffffff8040087104 <printf>
ffffff8040082920:	940005e3 	bl	ffffff80400840ac <env_init>
ffffff8040082924:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040082928:	912b0000 	add	x0, x0, #0xac0
ffffff804008292c:	940011f6 	bl	ffffff8040087104 <printf>
ffffff8040082930:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040082934:	912b4000 	add	x0, x0, #0xad0
ffffff8040082938:	940011f3 	bl	ffffff8040087104 <printf>
ffffff804008293c:	9400053a 	bl	ffffff8040083e24 <cpu_disable_irq>
ffffff8040082940:	9400094f 	bl	ffffff8040084e7c <gicd_init>
ffffff8040082944:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040082948:	912b8000 	add	x0, x0, #0xae0
ffffff804008294c:	940011ee 	bl	ffffff8040087104 <printf>
ffffff8040082950:	f00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040082954:	910a6001 	add	x1, x0, #0x298
ffffff8040082958:	b0000260 	adrp	x0, ffffff80400cf000 <_binary_idle_elf_start+0x8d80>
ffffff804008295c:	912a2000 	add	x0, x0, #0xa88
ffffff8040082960:	cb000020 	sub	x0, x1, x0
ffffff8040082964:	2a0003e1 	mov	w1, w0
ffffff8040082968:	b0000260 	adrp	x0, ffffff80400cf000 <_binary_idle_elf_start+0x8d80>
ffffff804008296c:	912a2000 	add	x0, x0, #0xa88
ffffff8040082970:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040082974:	94000782 	bl	ffffff804008477c <env_create_priority>
ffffff8040082978:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff804008297c:	912bc000 	add	x0, x0, #0xaf0
ffffff8040082980:	940011e1 	bl	ffffff8040087104 <printf>
ffffff8040082984:	94000511 	bl	ffffff8040083dc8 <cpu_boot_secondary>
ffffff8040082988:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff804008298c:	912c0000 	add	x0, x0, #0xb00
ffffff8040082990:	940011dd 	bl	ffffff8040087104 <printf>
ffffff8040082994:	9400099b 	bl	ffffff8040085000 <gicc_init>
ffffff8040082998:	3940bfa1 	ldrb	w1, [x29, #47]
ffffff804008299c:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400829a0:	912c6000 	add	x0, x0, #0xb18
ffffff80400829a4:	940011d8 	bl	ffffff8040087104 <printf>
ffffff80400829a8:	3940bfa0 	ldrb	w0, [x29, #47]
ffffff80400829ac:	940009e3 	bl	ffffff8040085138 <timer_gic_init>
ffffff80400829b0:	3940bfa1 	ldrb	w1, [x29, #47]
ffffff80400829b4:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400829b8:	912cc000 	add	x0, x0, #0xb30
ffffff80400829bc:	940011d2 	bl	ffffff8040087104 <printf>
ffffff80400829c0:	94000a38 	bl	ffffff80400852a0 <kclock_init>
ffffff80400829c4:	3940bfa1 	ldrb	w1, [x29, #47]
ffffff80400829c8:	d0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400829cc:	912d4000 	add	x0, x0, #0xb50
ffffff80400829d0:	940011cd 	bl	ffffff8040087104 <printf>
ffffff80400829d4:	94000511 	bl	ffffff8040083e18 <cpu_enable_irq>
ffffff80400829d8:	d503207f 	wfi
ffffff80400829dc:	17ffffff 	b	ffffff80400829d8 <main+0x138>
	...

ffffff8040083000 <vectors>:
ffffff8040083000:	d503205f 	wfe
ffffff8040083004:	17ffffff 	b	ffffff8040083000 <vectors>
	...
ffffff8040083080:	d503205f 	wfe
ffffff8040083084:	17ffffff 	b	ffffff8040083080 <vectors+0x80>
	...
ffffff8040083100:	d503205f 	wfe
ffffff8040083104:	17ffffff 	b	ffffff8040083100 <vectors+0x100>
	...
ffffff8040083180:	d503205f 	wfe
ffffff8040083184:	17ffffff 	b	ffffff8040083180 <vectors+0x180>
	...
ffffff8040083200:	d10443ff 	sub	sp, sp, #0x110
ffffff8040083204:	a90007e0 	stp	x0, x1, [sp]
ffffff8040083208:	a9010fe2 	stp	x2, x3, [sp, #16]
ffffff804008320c:	a90217e4 	stp	x4, x5, [sp, #32]
ffffff8040083210:	a9031fe6 	stp	x6, x7, [sp, #48]
ffffff8040083214:	a90427e8 	stp	x8, x9, [sp, #64]
ffffff8040083218:	a9052fea 	stp	x10, x11, [sp, #80]
ffffff804008321c:	a90637ec 	stp	x12, x13, [sp, #96]
ffffff8040083220:	a9073fee 	stp	x14, x15, [sp, #112]
ffffff8040083224:	a90847f0 	stp	x16, x17, [sp, #128]
ffffff8040083228:	a9094ff2 	stp	x18, x19, [sp, #144]
ffffff804008322c:	a90a57f4 	stp	x20, x21, [sp, #160]
ffffff8040083230:	a90b5ff6 	stp	x22, x23, [sp, #176]
ffffff8040083234:	a90c67f8 	stp	x24, x25, [sp, #192]
ffffff8040083238:	a90d6ffa 	stp	x26, x27, [sp, #208]
ffffff804008323c:	a90e77fc 	stp	x28, x29, [sp, #224]
ffffff8040083240:	d5384001 	mrs	x1, spsr_el1
ffffff8040083244:	a90f07fe 	stp	x30, x1, [sp, #240]
ffffff8040083248:	d5384020 	mrs	x0, elr_el1
ffffff804008324c:	d5384101 	mrs	x1, sp_el0
ffffff8040083250:	a91007e0 	stp	x0, x1, [sp, #256]
ffffff8040083254:	910003f3 	mov	x19, sp
ffffff8040083258:	940002f6 	bl	ffffff8040083e30 <cpu_current_id>
ffffff804008325c:	58002fa1 	ldr	x1, ffffff8040083850 <el1_sync+0x8>
ffffff8040083260:	d37df000 	lsl	x0, x0, #3
ffffff8040083264:	8b000021 	add	x1, x1, x0
ffffff8040083268:	f9000033 	str	x19, [x1]
ffffff804008326c:	94000177 	bl	ffffff8040083848 <el1_sync>
ffffff8040083270:	14000146 	b	ffffff8040083788 <pop_context>
	...
ffffff8040083280:	d10443ff 	sub	sp, sp, #0x110
ffffff8040083284:	a90007e0 	stp	x0, x1, [sp]
ffffff8040083288:	a9010fe2 	stp	x2, x3, [sp, #16]
ffffff804008328c:	a90217e4 	stp	x4, x5, [sp, #32]
ffffff8040083290:	a9031fe6 	stp	x6, x7, [sp, #48]
ffffff8040083294:	a90427e8 	stp	x8, x9, [sp, #64]
ffffff8040083298:	a9052fea 	stp	x10, x11, [sp, #80]
ffffff804008329c:	a90637ec 	stp	x12, x13, [sp, #96]
ffffff80400832a0:	a9073fee 	stp	x14, x15, [sp, #112]
ffffff80400832a4:	a90847f0 	stp	x16, x17, [sp, #128]
ffffff80400832a8:	a9094ff2 	stp	x18, x19, [sp, #144]
ffffff80400832ac:	a90a57f4 	stp	x20, x21, [sp, #160]
ffffff80400832b0:	a90b5ff6 	stp	x22, x23, [sp, #176]
ffffff80400832b4:	a90c67f8 	stp	x24, x25, [sp, #192]
ffffff80400832b8:	a90d6ffa 	stp	x26, x27, [sp, #208]
ffffff80400832bc:	a90e77fc 	stp	x28, x29, [sp, #224]
ffffff80400832c0:	d5384001 	mrs	x1, spsr_el1
ffffff80400832c4:	a90f07fe 	stp	x30, x1, [sp, #240]
ffffff80400832c8:	d5384020 	mrs	x0, elr_el1
ffffff80400832cc:	d5384101 	mrs	x1, sp_el0
ffffff80400832d0:	a91007e0 	stp	x0, x1, [sp, #256]
ffffff80400832d4:	910003f3 	mov	x19, sp
ffffff80400832d8:	940002d6 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400832dc:	58002ba1 	ldr	x1, ffffff8040083850 <el1_sync+0x8>
ffffff80400832e0:	d37df000 	lsl	x0, x0, #3
ffffff80400832e4:	8b000021 	add	x1, x1, x0
ffffff80400832e8:	f9000033 	str	x19, [x1]
ffffff80400832ec:	9400014f 	bl	ffffff8040083828 <el0_irq>
ffffff80400832f0:	14000126 	b	ffffff8040083788 <pop_context>
	...
ffffff8040083300:	d10443ff 	sub	sp, sp, #0x110
ffffff8040083304:	a90007e0 	stp	x0, x1, [sp]
ffffff8040083308:	a9010fe2 	stp	x2, x3, [sp, #16]
ffffff804008330c:	a90217e4 	stp	x4, x5, [sp, #32]
ffffff8040083310:	a9031fe6 	stp	x6, x7, [sp, #48]
ffffff8040083314:	a90427e8 	stp	x8, x9, [sp, #64]
ffffff8040083318:	a9052fea 	stp	x10, x11, [sp, #80]
ffffff804008331c:	a90637ec 	stp	x12, x13, [sp, #96]
ffffff8040083320:	a9073fee 	stp	x14, x15, [sp, #112]
ffffff8040083324:	a90847f0 	stp	x16, x17, [sp, #128]
ffffff8040083328:	a9094ff2 	stp	x18, x19, [sp, #144]
ffffff804008332c:	a90a57f4 	stp	x20, x21, [sp, #160]
ffffff8040083330:	a90b5ff6 	stp	x22, x23, [sp, #176]
ffffff8040083334:	a90c67f8 	stp	x24, x25, [sp, #192]
ffffff8040083338:	a90d6ffa 	stp	x26, x27, [sp, #208]
ffffff804008333c:	a90e77fc 	stp	x28, x29, [sp, #224]
ffffff8040083340:	d5384001 	mrs	x1, spsr_el1
ffffff8040083344:	a90f07fe 	stp	x30, x1, [sp, #240]
ffffff8040083348:	d5384020 	mrs	x0, elr_el1
ffffff804008334c:	d5384101 	mrs	x1, sp_el0
ffffff8040083350:	a91007e0 	stp	x0, x1, [sp, #256]
ffffff8040083354:	910003f3 	mov	x19, sp
ffffff8040083358:	940002b6 	bl	ffffff8040083e30 <cpu_current_id>
ffffff804008335c:	580027a1 	ldr	x1, ffffff8040083850 <el1_sync+0x8>
ffffff8040083360:	d37df000 	lsl	x0, x0, #3
ffffff8040083364:	8b000021 	add	x1, x1, x0
ffffff8040083368:	f9000033 	str	x19, [x1]
ffffff804008336c:	94000133 	bl	ffffff8040083838 <el0_fiq>
ffffff8040083370:	14000106 	b	ffffff8040083788 <pop_context>
	...
ffffff8040083380:	d10443ff 	sub	sp, sp, #0x110
ffffff8040083384:	a90007e0 	stp	x0, x1, [sp]
ffffff8040083388:	a9010fe2 	stp	x2, x3, [sp, #16]
ffffff804008338c:	a90217e4 	stp	x4, x5, [sp, #32]
ffffff8040083390:	a9031fe6 	stp	x6, x7, [sp, #48]
ffffff8040083394:	a90427e8 	stp	x8, x9, [sp, #64]
ffffff8040083398:	a9052fea 	stp	x10, x11, [sp, #80]
ffffff804008339c:	a90637ec 	stp	x12, x13, [sp, #96]
ffffff80400833a0:	a9073fee 	stp	x14, x15, [sp, #112]
ffffff80400833a4:	a90847f0 	stp	x16, x17, [sp, #128]
ffffff80400833a8:	a9094ff2 	stp	x18, x19, [sp, #144]
ffffff80400833ac:	a90a57f4 	stp	x20, x21, [sp, #160]
ffffff80400833b0:	a90b5ff6 	stp	x22, x23, [sp, #176]
ffffff80400833b4:	a90c67f8 	stp	x24, x25, [sp, #192]
ffffff80400833b8:	a90d6ffa 	stp	x26, x27, [sp, #208]
ffffff80400833bc:	a90e77fc 	stp	x28, x29, [sp, #224]
ffffff80400833c0:	d5384001 	mrs	x1, spsr_el1
ffffff80400833c4:	a90f07fe 	stp	x30, x1, [sp, #240]
ffffff80400833c8:	d5384020 	mrs	x0, elr_el1
ffffff80400833cc:	d5384101 	mrs	x1, sp_el0
ffffff80400833d0:	a91007e0 	stp	x0, x1, [sp, #256]
ffffff80400833d4:	910003f3 	mov	x19, sp
ffffff80400833d8:	94000296 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400833dc:	580023a1 	ldr	x1, ffffff8040083850 <el1_sync+0x8>
ffffff80400833e0:	d37df000 	lsl	x0, x0, #3
ffffff80400833e4:	8b000021 	add	x1, x1, x0
ffffff80400833e8:	f9000033 	str	x19, [x1]
ffffff80400833ec:	94000115 	bl	ffffff8040083840 <el0_err>
ffffff80400833f0:	140000e6 	b	ffffff8040083788 <pop_context>
	...
ffffff8040083400:	d10443ff 	sub	sp, sp, #0x110
ffffff8040083404:	a90007e0 	stp	x0, x1, [sp]
ffffff8040083408:	a9010fe2 	stp	x2, x3, [sp, #16]
ffffff804008340c:	a90217e4 	stp	x4, x5, [sp, #32]
ffffff8040083410:	a9031fe6 	stp	x6, x7, [sp, #48]
ffffff8040083414:	a90427e8 	stp	x8, x9, [sp, #64]
ffffff8040083418:	a9052fea 	stp	x10, x11, [sp, #80]
ffffff804008341c:	a90637ec 	stp	x12, x13, [sp, #96]
ffffff8040083420:	a9073fee 	stp	x14, x15, [sp, #112]
ffffff8040083424:	a90847f0 	stp	x16, x17, [sp, #128]
ffffff8040083428:	a9094ff2 	stp	x18, x19, [sp, #144]
ffffff804008342c:	a90a57f4 	stp	x20, x21, [sp, #160]
ffffff8040083430:	a90b5ff6 	stp	x22, x23, [sp, #176]
ffffff8040083434:	a90c67f8 	stp	x24, x25, [sp, #192]
ffffff8040083438:	a90d6ffa 	stp	x26, x27, [sp, #208]
ffffff804008343c:	a90e77fc 	stp	x28, x29, [sp, #224]
ffffff8040083440:	d5384001 	mrs	x1, spsr_el1
ffffff8040083444:	a90f07fe 	stp	x30, x1, [sp, #240]
ffffff8040083448:	d5384020 	mrs	x0, elr_el1
ffffff804008344c:	d5384101 	mrs	x1, sp_el0
ffffff8040083450:	a91007e0 	stp	x0, x1, [sp, #256]
ffffff8040083454:	910003f3 	mov	x19, sp
ffffff8040083458:	94000276 	bl	ffffff8040083e30 <cpu_current_id>
ffffff804008345c:	58001fa1 	ldr	x1, ffffff8040083850 <el1_sync+0x8>
ffffff8040083460:	d37df000 	lsl	x0, x0, #3
ffffff8040083464:	8b000021 	add	x1, x1, x0
ffffff8040083468:	f9000033 	str	x19, [x1]
ffffff804008346c:	940000df 	bl	ffffff80400837e8 <el0_sync>
ffffff8040083470:	140000c6 	b	ffffff8040083788 <pop_context>
	...
ffffff8040083480:	d10443ff 	sub	sp, sp, #0x110
ffffff8040083484:	a90007e0 	stp	x0, x1, [sp]
ffffff8040083488:	a9010fe2 	stp	x2, x3, [sp, #16]
ffffff804008348c:	a90217e4 	stp	x4, x5, [sp, #32]
ffffff8040083490:	a9031fe6 	stp	x6, x7, [sp, #48]
ffffff8040083494:	a90427e8 	stp	x8, x9, [sp, #64]
ffffff8040083498:	a9052fea 	stp	x10, x11, [sp, #80]
ffffff804008349c:	a90637ec 	stp	x12, x13, [sp, #96]
ffffff80400834a0:	a9073fee 	stp	x14, x15, [sp, #112]
ffffff80400834a4:	a90847f0 	stp	x16, x17, [sp, #128]
ffffff80400834a8:	a9094ff2 	stp	x18, x19, [sp, #144]
ffffff80400834ac:	a90a57f4 	stp	x20, x21, [sp, #160]
ffffff80400834b0:	a90b5ff6 	stp	x22, x23, [sp, #176]
ffffff80400834b4:	a90c67f8 	stp	x24, x25, [sp, #192]
ffffff80400834b8:	a90d6ffa 	stp	x26, x27, [sp, #208]
ffffff80400834bc:	a90e77fc 	stp	x28, x29, [sp, #224]
ffffff80400834c0:	d5384001 	mrs	x1, spsr_el1
ffffff80400834c4:	a90f07fe 	stp	x30, x1, [sp, #240]
ffffff80400834c8:	d5384020 	mrs	x0, elr_el1
ffffff80400834cc:	d5384101 	mrs	x1, sp_el0
ffffff80400834d0:	a91007e0 	stp	x0, x1, [sp, #256]
ffffff80400834d4:	910003f3 	mov	x19, sp
ffffff80400834d8:	94000256 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400834dc:	58001ba1 	ldr	x1, ffffff8040083850 <el1_sync+0x8>
ffffff80400834e0:	d37df000 	lsl	x0, x0, #3
ffffff80400834e4:	8b000021 	add	x1, x1, x0
ffffff80400834e8:	f9000033 	str	x19, [x1]
ffffff80400834ec:	940000cf 	bl	ffffff8040083828 <el0_irq>
ffffff80400834f0:	140000a6 	b	ffffff8040083788 <pop_context>
	...
ffffff8040083500:	d10443ff 	sub	sp, sp, #0x110
ffffff8040083504:	a90007e0 	stp	x0, x1, [sp]
ffffff8040083508:	a9010fe2 	stp	x2, x3, [sp, #16]
ffffff804008350c:	a90217e4 	stp	x4, x5, [sp, #32]
ffffff8040083510:	a9031fe6 	stp	x6, x7, [sp, #48]
ffffff8040083514:	a90427e8 	stp	x8, x9, [sp, #64]
ffffff8040083518:	a9052fea 	stp	x10, x11, [sp, #80]
ffffff804008351c:	a90637ec 	stp	x12, x13, [sp, #96]
ffffff8040083520:	a9073fee 	stp	x14, x15, [sp, #112]
ffffff8040083524:	a90847f0 	stp	x16, x17, [sp, #128]
ffffff8040083528:	a9094ff2 	stp	x18, x19, [sp, #144]
ffffff804008352c:	a90a57f4 	stp	x20, x21, [sp, #160]
ffffff8040083530:	a90b5ff6 	stp	x22, x23, [sp, #176]
ffffff8040083534:	a90c67f8 	stp	x24, x25, [sp, #192]
ffffff8040083538:	a90d6ffa 	stp	x26, x27, [sp, #208]
ffffff804008353c:	a90e77fc 	stp	x28, x29, [sp, #224]
ffffff8040083540:	d5384001 	mrs	x1, spsr_el1
ffffff8040083544:	a90f07fe 	stp	x30, x1, [sp, #240]
ffffff8040083548:	d5384020 	mrs	x0, elr_el1
ffffff804008354c:	d5384101 	mrs	x1, sp_el0
ffffff8040083550:	a91007e0 	stp	x0, x1, [sp, #256]
ffffff8040083554:	910003f3 	mov	x19, sp
ffffff8040083558:	94000236 	bl	ffffff8040083e30 <cpu_current_id>
ffffff804008355c:	580017a1 	ldr	x1, ffffff8040083850 <el1_sync+0x8>
ffffff8040083560:	d37df000 	lsl	x0, x0, #3
ffffff8040083564:	8b000021 	add	x1, x1, x0
ffffff8040083568:	f9000033 	str	x19, [x1]
ffffff804008356c:	940000b3 	bl	ffffff8040083838 <el0_fiq>
ffffff8040083570:	14000086 	b	ffffff8040083788 <pop_context>
	...
ffffff8040083580:	d10443ff 	sub	sp, sp, #0x110
ffffff8040083584:	a90007e0 	stp	x0, x1, [sp]
ffffff8040083588:	a9010fe2 	stp	x2, x3, [sp, #16]
ffffff804008358c:	a90217e4 	stp	x4, x5, [sp, #32]
ffffff8040083590:	a9031fe6 	stp	x6, x7, [sp, #48]
ffffff8040083594:	a90427e8 	stp	x8, x9, [sp, #64]
ffffff8040083598:	a9052fea 	stp	x10, x11, [sp, #80]
ffffff804008359c:	a90637ec 	stp	x12, x13, [sp, #96]
ffffff80400835a0:	a9073fee 	stp	x14, x15, [sp, #112]
ffffff80400835a4:	a90847f0 	stp	x16, x17, [sp, #128]
ffffff80400835a8:	a9094ff2 	stp	x18, x19, [sp, #144]
ffffff80400835ac:	a90a57f4 	stp	x20, x21, [sp, #160]
ffffff80400835b0:	a90b5ff6 	stp	x22, x23, [sp, #176]
ffffff80400835b4:	a90c67f8 	stp	x24, x25, [sp, #192]
ffffff80400835b8:	a90d6ffa 	stp	x26, x27, [sp, #208]
ffffff80400835bc:	a90e77fc 	stp	x28, x29, [sp, #224]
ffffff80400835c0:	d5384001 	mrs	x1, spsr_el1
ffffff80400835c4:	a90f07fe 	stp	x30, x1, [sp, #240]
ffffff80400835c8:	d5384020 	mrs	x0, elr_el1
ffffff80400835cc:	d5384101 	mrs	x1, sp_el0
ffffff80400835d0:	a91007e0 	stp	x0, x1, [sp, #256]
ffffff80400835d4:	910003f3 	mov	x19, sp
ffffff80400835d8:	94000216 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400835dc:	580013a1 	ldr	x1, ffffff8040083850 <el1_sync+0x8>
ffffff80400835e0:	d37df000 	lsl	x0, x0, #3
ffffff80400835e4:	8b000021 	add	x1, x1, x0
ffffff80400835e8:	f9000033 	str	x19, [x1]
ffffff80400835ec:	94000095 	bl	ffffff8040083840 <el0_err>
ffffff80400835f0:	14000066 	b	ffffff8040083788 <pop_context>
	...
ffffff8040083600:	d503205f 	wfe
ffffff8040083604:	17ffffff 	b	ffffff8040083600 <vectors+0x600>
	...
ffffff8040083680:	d503205f 	wfe
ffffff8040083684:	17ffffff 	b	ffffff8040083680 <vectors+0x680>
	...
ffffff8040083700:	d503205f 	wfe
ffffff8040083704:	17ffffff 	b	ffffff8040083700 <vectors+0x700>
	...
ffffff8040083780:	d503205f 	wfe
ffffff8040083784:	17ffffff 	b	ffffff8040083780 <vectors+0x780>

ffffff8040083788 <pop_context>:
ffffff8040083788:	f9407fe0 	ldr	x0, [sp, #248]
ffffff804008378c:	f94083e1 	ldr	x1, [sp, #256]
ffffff8040083790:	f94087e2 	ldr	x2, [sp, #264]
ffffff8040083794:	d5184000 	msr	spsr_el1, x0
ffffff8040083798:	d5184021 	msr	elr_el1, x1
ffffff804008379c:	d5184102 	msr	sp_el0, x2
ffffff80400837a0:	a94007e0 	ldp	x0, x1, [sp]
ffffff80400837a4:	a9410fe2 	ldp	x2, x3, [sp, #16]
ffffff80400837a8:	a94217e4 	ldp	x4, x5, [sp, #32]
ffffff80400837ac:	a9431fe6 	ldp	x6, x7, [sp, #48]
ffffff80400837b0:	a94427e8 	ldp	x8, x9, [sp, #64]
ffffff80400837b4:	a9452fea 	ldp	x10, x11, [sp, #80]
ffffff80400837b8:	a94637ec 	ldp	x12, x13, [sp, #96]
ffffff80400837bc:	a9473fee 	ldp	x14, x15, [sp, #112]
ffffff80400837c0:	a94847f0 	ldp	x16, x17, [sp, #128]
ffffff80400837c4:	a9494ff2 	ldp	x18, x19, [sp, #144]
ffffff80400837c8:	a94a57f4 	ldp	x20, x21, [sp, #160]
ffffff80400837cc:	a94b5ff6 	ldp	x22, x23, [sp, #176]
ffffff80400837d0:	a94c67f8 	ldp	x24, x25, [sp, #192]
ffffff80400837d4:	a94d6ffa 	ldp	x26, x27, [sp, #208]
ffffff80400837d8:	a94e77fc 	ldp	x28, x29, [sp, #224]
ffffff80400837dc:	f9407bfe 	ldr	x30, [sp, #240]
ffffff80400837e0:	910443ff 	add	sp, sp, #0x110
ffffff80400837e4:	d69f03e0 	eret

ffffff80400837e8 <el0_sync>:
ffffff80400837e8:	9400100f 	bl	ffffff8040087824 <lock_kernel>
ffffff80400837ec:	d5385213 	mrs	x19, esr_el1
ffffff80400837f0:	d35afe73 	lsr	x19, x19, #26
ffffff80400837f4:	f100827f 	cmp	x19, #0x20
ffffff80400837f8:	54000100 	b.eq	ffffff8040083818 <el0_sync_pgfault>  // b.none
ffffff80400837fc:	f100927f 	cmp	x19, #0x24
ffffff8040083800:	540000c0 	b.eq	ffffff8040083818 <el0_sync_pgfault>  // b.none
ffffff8040083804:	f100567f 	cmp	x19, #0x15
ffffff8040083808:	540000c0 	b.eq	ffffff8040083820 <el0_sync_syscall>  // b.none
ffffff804008380c:	94001428 	bl	ffffff80400888ac <handle_el0_sync>

ffffff8040083810 <el0_sync_end>:
ffffff8040083810:	9400100d 	bl	ffffff8040087844 <unlock_kernel>
ffffff8040083814:	17ffffdd 	b	ffffff8040083788 <pop_context>

ffffff8040083818 <el0_sync_pgfault>:
ffffff8040083818:	940013b0 	bl	ffffff80400886d8 <handle_el0_pgfault>
ffffff804008381c:	17fffffd 	b	ffffff8040083810 <el0_sync_end>

ffffff8040083820 <el0_sync_syscall>:
ffffff8040083820:	940012d8 	bl	ffffff8040088380 <handle_el0_syscall>
ffffff8040083824:	17fffffb 	b	ffffff8040083810 <el0_sync_end>

ffffff8040083828 <el0_irq>:
ffffff8040083828:	94000fff 	bl	ffffff8040087824 <lock_kernel>
ffffff804008382c:	94000659 	bl	ffffff8040085190 <gic_handler>
ffffff8040083830:	94001005 	bl	ffffff8040087844 <unlock_kernel>
ffffff8040083834:	17ffffd5 	b	ffffff8040083788 <pop_context>

ffffff8040083838 <el0_fiq>:
ffffff8040083838:	94001459 	bl	ffffff804008899c <handle_fiq>
ffffff804008383c:	17ffffff 	b	ffffff8040083838 <el0_fiq>

ffffff8040083840 <el0_err>:
ffffff8040083840:	94001475 	bl	ffffff8040088a14 <handle_err>
ffffff8040083844:	17ffffff 	b	ffffff8040083840 <el0_err>

ffffff8040083848 <el1_sync>:
ffffff8040083848:	94001437 	bl	ffffff8040088924 <handle_el1_sync>
ffffff804008384c:	17ffffff 	b	ffffff8040083848 <el1_sync>
ffffff8040083850:	4a026188 	.word	0x4a026188
ffffff8040083854:	ffffff80 	.word	0xffffff80

ffffff8040083858 <page2ppn>:
ffffff8040083858:	d10043ff 	sub	sp, sp, #0x10
ffffff804008385c:	f90007e0 	str	x0, [sp, #8]
ffffff8040083860:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040083864:	f004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040083868:	91062000 	add	x0, x0, #0x188
ffffff804008386c:	cb000020 	sub	x0, x1, x0
ffffff8040083870:	9343fc01 	asr	x1, x0, #3
ffffff8040083874:	b201f3e0 	mov	x0, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
ffffff8040083878:	f2955560 	movk	x0, #0xaaab
ffffff804008387c:	9b007c20 	mul	x0, x1, x0
ffffff8040083880:	910043ff 	add	sp, sp, #0x10
ffffff8040083884:	d65f03c0 	ret

ffffff8040083888 <cap_init>:
ffffff8040083888:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff804008388c:	910003fd 	mov	x29, sp
ffffff8040083890:	b9001fbf 	str	wzr, [x29, #28]
ffffff8040083894:	1400003e 	b	ffffff804008398c <cap_init+0x104>
ffffff8040083898:	b9001bbf 	str	wzr, [x29, #24]
ffffff804008389c:	14000008 	b	ffffff80400838bc <cap_init+0x34>
ffffff80400838a0:	b9401fa0 	ldr	w0, [x29, #28]
ffffff80400838a4:	b9401ba1 	ldr	w1, [x29, #24]
ffffff80400838a8:	52800002 	mov	w2, #0x0                   	// #0
ffffff80400838ac:	9400004b 	bl	ffffff80400839d8 <_cap_env_id_switch>
ffffff80400838b0:	b9401ba0 	ldr	w0, [x29, #24]
ffffff80400838b4:	11000400 	add	w0, w0, #0x1
ffffff80400838b8:	b9001ba0 	str	w0, [x29, #24]
ffffff80400838bc:	b9401ba0 	ldr	w0, [x29, #24]
ffffff80400838c0:	710ffc1f 	cmp	w0, #0x3ff
ffffff80400838c4:	54fffee9 	b.ls	ffffff80400838a0 <cap_init+0x18>  // b.plast
ffffff80400838c8:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400838cc:	910b2002 	add	x2, x0, #0x2c8
ffffff80400838d0:	b9801fa1 	ldrsw	x1, [x29, #28]
ffffff80400838d4:	aa0103e0 	mov	x0, x1
ffffff80400838d8:	d37be800 	lsl	x0, x0, #5
ffffff80400838dc:	8b010000 	add	x0, x0, x1
ffffff80400838e0:	d37ef400 	lsl	x0, x0, #2
ffffff80400838e4:	cb010000 	sub	x0, x0, x1
ffffff80400838e8:	d37df000 	lsl	x0, x0, #3
ffffff80400838ec:	8b000040 	add	x0, x2, x0
ffffff80400838f0:	f902001f 	str	xzr, [x0, #1024]
ffffff80400838f4:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400838f8:	910b2002 	add	x2, x0, #0x2c8
ffffff80400838fc:	b9801fa1 	ldrsw	x1, [x29, #28]
ffffff8040083900:	aa0103e0 	mov	x0, x1
ffffff8040083904:	d37be800 	lsl	x0, x0, #5
ffffff8040083908:	8b010000 	add	x0, x0, x1
ffffff804008390c:	d37ef400 	lsl	x0, x0, #2
ffffff8040083910:	cb010000 	sub	x0, x0, x1
ffffff8040083914:	d37df000 	lsl	x0, x0, #3
ffffff8040083918:	8b000040 	add	x0, x2, x0
ffffff804008391c:	b904081f 	str	wzr, [x0, #1032]
ffffff8040083920:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083924:	910b2002 	add	x2, x0, #0x2c8
ffffff8040083928:	b9801fa1 	ldrsw	x1, [x29, #28]
ffffff804008392c:	aa0103e0 	mov	x0, x1
ffffff8040083930:	d37be800 	lsl	x0, x0, #5
ffffff8040083934:	8b010000 	add	x0, x0, x1
ffffff8040083938:	d37ef400 	lsl	x0, x0, #2
ffffff804008393c:	cb010000 	sub	x0, x0, x1
ffffff8040083940:	d37df000 	lsl	x0, x0, #3
ffffff8040083944:	8b000040 	add	x0, x2, x0
ffffff8040083948:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008394c:	b9040c01 	str	w1, [x0, #1036]
ffffff8040083950:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083954:	910b2002 	add	x2, x0, #0x2c8
ffffff8040083958:	b9801fa1 	ldrsw	x1, [x29, #28]
ffffff804008395c:	aa0103e0 	mov	x0, x1
ffffff8040083960:	d37be800 	lsl	x0, x0, #5
ffffff8040083964:	8b010000 	add	x0, x0, x1
ffffff8040083968:	d37ef400 	lsl	x0, x0, #2
ffffff804008396c:	cb010000 	sub	x0, x0, x1
ffffff8040083970:	d37df000 	lsl	x0, x0, #3
ffffff8040083974:	8b000040 	add	x0, x2, x0
ffffff8040083978:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008397c:	b9041001 	str	w1, [x0, #1040]
ffffff8040083980:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083984:	11000400 	add	w0, w0, #0x1
ffffff8040083988:	b9001fa0 	str	w0, [x29, #28]
ffffff804008398c:	b9401fa1 	ldr	w1, [x29, #28]
ffffff8040083990:	52893de0 	mov	w0, #0x49ef                	// #18927
ffffff8040083994:	72a00040 	movk	w0, #0x2, lsl #16
ffffff8040083998:	6b00003f 	cmp	w1, w0
ffffff804008399c:	54fff7ed 	b.le	ffffff8040083898 <cap_init+0x10>
ffffff80400839a0:	f004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400839a4:	91060000 	add	x0, x0, #0x180
ffffff80400839a8:	b9400000 	ldr	w0, [x0]
ffffff80400839ac:	530c7c01 	lsr	w1, w0, #12
ffffff80400839b0:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400839b4:	910b0000 	add	x0, x0, #0x2c0
ffffff80400839b8:	b9000001 	str	w1, [x0]
ffffff80400839bc:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400839c0:	910b1000 	add	x0, x0, #0x2c4
ffffff80400839c4:	52a000c1 	mov	w1, #0x60000               	// #393216
ffffff80400839c8:	b9000001 	str	w1, [x0]
ffffff80400839cc:	d503201f 	nop
ffffff80400839d0:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff80400839d4:	d65f03c0 	ret

ffffff80400839d8 <_cap_env_id_switch>:
ffffff80400839d8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff80400839dc:	910003fd 	mov	x29, sp
ffffff80400839e0:	b9001fa0 	str	w0, [x29, #28]
ffffff80400839e4:	b9001ba1 	str	w1, [x29, #24]
ffffff80400839e8:	39005fa2 	strb	w2, [x29, #23]
ffffff80400839ec:	b9401fa1 	ldr	w1, [x29, #28]
ffffff80400839f0:	52893de0 	mov	w0, #0x49ef                	// #18927
ffffff80400839f4:	72a00040 	movk	w0, #0x2, lsl #16
ffffff80400839f8:	6b00003f 	cmp	w1, w0
ffffff80400839fc:	54000169 	b.ls	ffffff8040083a28 <_cap_env_id_switch+0x50>  // b.plast
ffffff8040083a00:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083a04:	912dc002 	add	x2, x0, #0xb70
ffffff8040083a08:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083a0c:	912e0001 	add	x1, x0, #0xb80
ffffff8040083a10:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083a14:	912e6000 	add	x0, x0, #0xb98
ffffff8040083a18:	aa0203e3 	mov	x3, x2
ffffff8040083a1c:	aa0103e2 	mov	x2, x1
ffffff8040083a20:	52800481 	mov	w1, #0x24                  	// #36
ffffff8040083a24:	94000de1 	bl	ffffff80400871a8 <_panic>
ffffff8040083a28:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040083a2c:	710ffc1f 	cmp	w0, #0x3ff
ffffff8040083a30:	54000169 	b.ls	ffffff8040083a5c <_cap_env_id_switch+0x84>  // b.plast
ffffff8040083a34:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083a38:	912ee002 	add	x2, x0, #0xbb8
ffffff8040083a3c:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083a40:	912e0001 	add	x1, x0, #0xb80
ffffff8040083a44:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083a48:	912e6000 	add	x0, x0, #0xb98
ffffff8040083a4c:	aa0203e3 	mov	x3, x2
ffffff8040083a50:	aa0103e2 	mov	x2, x1
ffffff8040083a54:	528004a1 	mov	w1, #0x25                  	// #37
ffffff8040083a58:	94000dd4 	bl	ffffff80400871a8 <_panic>
ffffff8040083a5c:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083a60:	910b2003 	add	x3, x0, #0x2c8
ffffff8040083a64:	b9401ba2 	ldr	w2, [x29, #24]
ffffff8040083a68:	b9401fa1 	ldr	w1, [x29, #28]
ffffff8040083a6c:	aa0103e0 	mov	x0, x1
ffffff8040083a70:	d37be800 	lsl	x0, x0, #5
ffffff8040083a74:	8b010000 	add	x0, x0, x1
ffffff8040083a78:	d37ef400 	lsl	x0, x0, #2
ffffff8040083a7c:	cb010000 	sub	x0, x0, x1
ffffff8040083a80:	d37df000 	lsl	x0, x0, #3
ffffff8040083a84:	8b000060 	add	x0, x3, x0
ffffff8040083a88:	8b020000 	add	x0, x0, x2
ffffff8040083a8c:	39405fa1 	ldrb	w1, [x29, #23]
ffffff8040083a90:	39000001 	strb	w1, [x0]
ffffff8040083a94:	d503201f 	nop
ffffff8040083a98:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040083a9c:	d65f03c0 	ret

ffffff8040083aa0 <cap_map_free_page>:
ffffff8040083aa0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040083aa4:	910003fd 	mov	x29, sp
ffffff8040083aa8:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083aac:	f9000ba1 	str	x1, [x29, #16]
ffffff8040083ab0:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040083ab4:	97ffff69 	bl	ffffff8040083858 <page2ppn>
ffffff8040083ab8:	f9001fa0 	str	x0, [x29, #56]
ffffff8040083abc:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083ac0:	910b0000 	add	x0, x0, #0x2c0
ffffff8040083ac4:	b9400000 	ldr	w0, [x0]
ffffff8040083ac8:	2a0003e0 	mov	w0, w0
ffffff8040083acc:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083ad0:	eb00003f 	cmp	x1, x0
ffffff8040083ad4:	54000162 	b.cs	ffffff8040083b00 <cap_map_free_page+0x60>  // b.hs, b.nlast
ffffff8040083ad8:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083adc:	912f2002 	add	x2, x0, #0xbc8
ffffff8040083ae0:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083ae4:	912e0001 	add	x1, x0, #0xb80
ffffff8040083ae8:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083aec:	912e6000 	add	x0, x0, #0xb98
ffffff8040083af0:	aa0203e3 	mov	x3, x2
ffffff8040083af4:	aa0103e2 	mov	x2, x1
ffffff8040083af8:	52800721 	mov	w1, #0x39                  	// #57
ffffff8040083afc:	94000dab 	bl	ffffff80400871a8 <_panic>
ffffff8040083b00:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083b04:	910b1000 	add	x0, x0, #0x2c4
ffffff8040083b08:	b9400000 	ldr	w0, [x0]
ffffff8040083b0c:	2a0003e0 	mov	w0, w0
ffffff8040083b10:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083b14:	eb00003f 	cmp	x1, x0
ffffff8040083b18:	54000163 	b.cc	ffffff8040083b44 <cap_map_free_page+0xa4>  // b.lo, b.ul, b.last
ffffff8040083b1c:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083b20:	912fa002 	add	x2, x0, #0xbe8
ffffff8040083b24:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083b28:	912e0001 	add	x1, x0, #0xb80
ffffff8040083b2c:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083b30:	912e6000 	add	x0, x0, #0xb98
ffffff8040083b34:	aa0203e3 	mov	x3, x2
ffffff8040083b38:	aa0103e2 	mov	x2, x1
ffffff8040083b3c:	52800741 	mov	w1, #0x3a                  	// #58
ffffff8040083b40:	94000d9a 	bl	ffffff80400871a8 <_panic>
ffffff8040083b44:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083b48:	910b0000 	add	x0, x0, #0x2c0
ffffff8040083b4c:	b9400000 	ldr	w0, [x0]
ffffff8040083b50:	2a0003e0 	mov	w0, w0
ffffff8040083b54:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083b58:	cb000021 	sub	x1, x1, x0
ffffff8040083b5c:	d2893de0 	mov	x0, #0x49ef                	// #18927
ffffff8040083b60:	f2a00040 	movk	x0, #0x2, lsl #16
ffffff8040083b64:	eb00003f 	cmp	x1, x0
ffffff8040083b68:	54000169 	b.ls	ffffff8040083b94 <cap_map_free_page+0xf4>  // b.plast
ffffff8040083b6c:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083b70:	91302002 	add	x2, x0, #0xc08
ffffff8040083b74:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083b78:	912e0001 	add	x1, x0, #0xb80
ffffff8040083b7c:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083b80:	912e6000 	add	x0, x0, #0xb98
ffffff8040083b84:	aa0203e3 	mov	x3, x2
ffffff8040083b88:	aa0103e2 	mov	x2, x1
ffffff8040083b8c:	52800761 	mov	w1, #0x3b                  	// #59
ffffff8040083b90:	94000d86 	bl	ffffff80400871a8 <_panic>
ffffff8040083b94:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083b98:	910b0000 	add	x0, x0, #0x2c0
ffffff8040083b9c:	b9400000 	ldr	w0, [x0]
ffffff8040083ba0:	2a0003e0 	mov	w0, w0
ffffff8040083ba4:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083ba8:	cb000021 	sub	x1, x1, x0
ffffff8040083bac:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083bb0:	910b0000 	add	x0, x0, #0x2c0
ffffff8040083bb4:	b9400002 	ldr	w2, [x0]
ffffff8040083bb8:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083bbc:	910b1000 	add	x0, x0, #0x2c4
ffffff8040083bc0:	b9400003 	ldr	w3, [x0]
ffffff8040083bc4:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083bc8:	9130c000 	add	x0, x0, #0xc30
ffffff8040083bcc:	2a0303e5 	mov	w5, w3
ffffff8040083bd0:	2a0203e4 	mov	w4, w2
ffffff8040083bd4:	aa0103e3 	mov	x3, x1
ffffff8040083bd8:	f9401fa2 	ldr	x2, [x29, #56]
ffffff8040083bdc:	b9401fa1 	ldr	w1, [x29, #28]
ffffff8040083be0:	94000d49 	bl	ffffff8040087104 <printf>
ffffff8040083be4:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040083be8:	2a0003e1 	mov	w1, w0
ffffff8040083bec:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083bf0:	910b0000 	add	x0, x0, #0x2c0
ffffff8040083bf4:	b9400000 	ldr	w0, [x0]
ffffff8040083bf8:	4b000020 	sub	w0, w1, w0
ffffff8040083bfc:	b90037a0 	str	w0, [x29, #52]
ffffff8040083c00:	b94037a1 	ldr	w1, [x29, #52]
ffffff8040083c04:	aa0103e0 	mov	x0, x1
ffffff8040083c08:	d37be800 	lsl	x0, x0, #5
ffffff8040083c0c:	8b010000 	add	x0, x0, x1
ffffff8040083c10:	d37ef400 	lsl	x0, x0, #2
ffffff8040083c14:	cb010000 	sub	x0, x0, x1
ffffff8040083c18:	d37df000 	lsl	x0, x0, #3
ffffff8040083c1c:	d00002a1 	adrp	x1, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083c20:	910b2021 	add	x1, x1, #0x2c8
ffffff8040083c24:	8b010000 	add	x0, x0, x1
ffffff8040083c28:	f90017a0 	str	x0, [x29, #40]
ffffff8040083c2c:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040083c30:	b9401fa1 	ldr	w1, [x29, #28]
ffffff8040083c34:	b94037a0 	ldr	w0, [x29, #52]
ffffff8040083c38:	97ffff68 	bl	ffffff80400839d8 <_cap_env_id_switch>
ffffff8040083c3c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040083c40:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040083c44:	b9040801 	str	w1, [x0, #1032]
ffffff8040083c48:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040083c4c:	f9400ba1 	ldr	x1, [x29, #16]
ffffff8040083c50:	f9020001 	str	x1, [x0, #1024]
ffffff8040083c54:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040083c58:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040083c5c:	d65f03c0 	ret

ffffff8040083c60 <cap_unmap_free_page>:
ffffff8040083c60:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040083c64:	910003fd 	mov	x29, sp
ffffff8040083c68:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083c6c:	f9000ba1 	str	x1, [x29, #16]
ffffff8040083c70:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040083c74:	97fffef9 	bl	ffffff8040083858 <page2ppn>
ffffff8040083c78:	f9001fa0 	str	x0, [x29, #56]
ffffff8040083c7c:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083c80:	910b0000 	add	x0, x0, #0x2c0
ffffff8040083c84:	b9400000 	ldr	w0, [x0]
ffffff8040083c88:	2a0003e0 	mov	w0, w0
ffffff8040083c8c:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083c90:	eb00003f 	cmp	x1, x0
ffffff8040083c94:	54000162 	b.cs	ffffff8040083cc0 <cap_unmap_free_page+0x60>  // b.hs, b.nlast
ffffff8040083c98:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083c9c:	912f2002 	add	x2, x0, #0xbc8
ffffff8040083ca0:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083ca4:	912e0001 	add	x1, x0, #0xb80
ffffff8040083ca8:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083cac:	912e6000 	add	x0, x0, #0xb98
ffffff8040083cb0:	aa0203e3 	mov	x3, x2
ffffff8040083cb4:	aa0103e2 	mov	x2, x1
ffffff8040083cb8:	52800941 	mov	w1, #0x4a                  	// #74
ffffff8040083cbc:	94000d3b 	bl	ffffff80400871a8 <_panic>
ffffff8040083cc0:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083cc4:	910b1000 	add	x0, x0, #0x2c4
ffffff8040083cc8:	b9400000 	ldr	w0, [x0]
ffffff8040083ccc:	2a0003e0 	mov	w0, w0
ffffff8040083cd0:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083cd4:	eb00003f 	cmp	x1, x0
ffffff8040083cd8:	54000163 	b.cc	ffffff8040083d04 <cap_unmap_free_page+0xa4>  // b.lo, b.ul, b.last
ffffff8040083cdc:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083ce0:	912fa002 	add	x2, x0, #0xbe8
ffffff8040083ce4:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083ce8:	912e0001 	add	x1, x0, #0xb80
ffffff8040083cec:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083cf0:	912e6000 	add	x0, x0, #0xb98
ffffff8040083cf4:	aa0203e3 	mov	x3, x2
ffffff8040083cf8:	aa0103e2 	mov	x2, x1
ffffff8040083cfc:	52800961 	mov	w1, #0x4b                  	// #75
ffffff8040083d00:	94000d2a 	bl	ffffff80400871a8 <_panic>
ffffff8040083d04:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083d08:	910b0000 	add	x0, x0, #0x2c0
ffffff8040083d0c:	b9400000 	ldr	w0, [x0]
ffffff8040083d10:	2a0003e0 	mov	w0, w0
ffffff8040083d14:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083d18:	cb000021 	sub	x1, x1, x0
ffffff8040083d1c:	d2893de0 	mov	x0, #0x49ef                	// #18927
ffffff8040083d20:	f2a00040 	movk	x0, #0x2, lsl #16
ffffff8040083d24:	eb00003f 	cmp	x1, x0
ffffff8040083d28:	54000169 	b.ls	ffffff8040083d54 <cap_unmap_free_page+0xf4>  // b.plast
ffffff8040083d2c:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083d30:	91302002 	add	x2, x0, #0xc08
ffffff8040083d34:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083d38:	912e0001 	add	x1, x0, #0xb80
ffffff8040083d3c:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083d40:	912e6000 	add	x0, x0, #0xb98
ffffff8040083d44:	aa0203e3 	mov	x3, x2
ffffff8040083d48:	aa0103e2 	mov	x2, x1
ffffff8040083d4c:	52800981 	mov	w1, #0x4c                  	// #76
ffffff8040083d50:	94000d16 	bl	ffffff80400871a8 <_panic>
ffffff8040083d54:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040083d58:	2a0003e1 	mov	w1, w0
ffffff8040083d5c:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083d60:	910b0000 	add	x0, x0, #0x2c0
ffffff8040083d64:	b9400000 	ldr	w0, [x0]
ffffff8040083d68:	4b000020 	sub	w0, w1, w0
ffffff8040083d6c:	b90037a0 	str	w0, [x29, #52]
ffffff8040083d70:	b94037a1 	ldr	w1, [x29, #52]
ffffff8040083d74:	aa0103e0 	mov	x0, x1
ffffff8040083d78:	d37be800 	lsl	x0, x0, #5
ffffff8040083d7c:	8b010000 	add	x0, x0, x1
ffffff8040083d80:	d37ef400 	lsl	x0, x0, #2
ffffff8040083d84:	cb010000 	sub	x0, x0, x1
ffffff8040083d88:	d37df000 	lsl	x0, x0, #3
ffffff8040083d8c:	d00002a1 	adrp	x1, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083d90:	910b2021 	add	x1, x1, #0x2c8
ffffff8040083d94:	8b010000 	add	x0, x0, x1
ffffff8040083d98:	f90017a0 	str	x0, [x29, #40]
ffffff8040083d9c:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040083da0:	b9401fa1 	ldr	w1, [x29, #28]
ffffff8040083da4:	b94037a0 	ldr	w0, [x29, #52]
ffffff8040083da8:	97ffff0c 	bl	ffffff80400839d8 <_cap_env_id_switch>
ffffff8040083dac:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040083db0:	b904081f 	str	wzr, [x0, #1032]
ffffff8040083db4:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040083db8:	f902001f 	str	xzr, [x0, #1024]
ffffff8040083dbc:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040083dc0:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040083dc4:	d65f03c0 	ret

ffffff8040083dc8 <cpu_boot_secondary>:
ffffff8040083dc8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040083dcc:	910003fd 	mov	x29, sp
ffffff8040083dd0:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040083dd4:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083dd8:	1400000a 	b	ffffff8040083e00 <cpu_boot_secondary+0x38>
ffffff8040083ddc:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040083de0:	b0ffffe0 	adrp	x0, ffffff8040080000 <_start>
ffffff8040083de4:	91005000 	add	x0, x0, #0x14
ffffff8040083de8:	2a0003e1 	mov	w1, w0
ffffff8040083dec:	2a0203e0 	mov	w0, w2
ffffff8040083df0:	94000d32 	bl	ffffff80400872b8 <psci_cpu_on>
ffffff8040083df4:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083df8:	11000400 	add	w0, w0, #0x1
ffffff8040083dfc:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083e00:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083e04:	71000c1f 	cmp	w0, #0x3
ffffff8040083e08:	54fffead 	b.le	ffffff8040083ddc <cpu_boot_secondary+0x14>
ffffff8040083e0c:	d503201f 	nop
ffffff8040083e10:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040083e14:	d65f03c0 	ret

ffffff8040083e18 <cpu_enable_irq>:
ffffff8040083e18:	d50342ff 	msr	daifclr, #0x2
ffffff8040083e1c:	d503201f 	nop
ffffff8040083e20:	d65f03c0 	ret

ffffff8040083e24 <cpu_disable_irq>:
ffffff8040083e24:	d50342df 	msr	daifset, #0x2
ffffff8040083e28:	d503201f 	nop
ffffff8040083e2c:	d65f03c0 	ret

ffffff8040083e30 <cpu_current_id>:
ffffff8040083e30:	d10043ff 	sub	sp, sp, #0x10
ffffff8040083e34:	d53800a0 	mrs	x0, mpidr_el1
ffffff8040083e38:	f90007e0 	str	x0, [sp, #8]
ffffff8040083e3c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040083e40:	12001c00 	and	w0, w0, #0xff
ffffff8040083e44:	910043ff 	add	sp, sp, #0x10
ffffff8040083e48:	d65f03c0 	ret

ffffff8040083e4c <page2ppn>:
ffffff8040083e4c:	d10043ff 	sub	sp, sp, #0x10
ffffff8040083e50:	f90007e0 	str	x0, [sp, #8]
ffffff8040083e54:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040083e58:	f004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040083e5c:	91062000 	add	x0, x0, #0x188
ffffff8040083e60:	cb000020 	sub	x0, x1, x0
ffffff8040083e64:	9343fc01 	asr	x1, x0, #3
ffffff8040083e68:	b201f3e0 	mov	x0, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
ffffff8040083e6c:	f2955560 	movk	x0, #0xaaab
ffffff8040083e70:	9b007c20 	mul	x0, x1, x0
ffffff8040083e74:	910043ff 	add	sp, sp, #0x10
ffffff8040083e78:	d65f03c0 	ret

ffffff8040083e7c <page2kva>:
ffffff8040083e7c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040083e80:	910003fd 	mov	x29, sp
ffffff8040083e84:	f9000fa0 	str	x0, [x29, #24]
ffffff8040083e88:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040083e8c:	97fffff0 	bl	ffffff8040083e4c <page2ppn>
ffffff8040083e90:	d374cc00 	lsl	x0, x0, #12
ffffff8040083e94:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040083e98:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040083e9c:	d65f03c0 	ret

ffffff8040083ea0 <pa2page>:
ffffff8040083ea0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040083ea4:	910003fd 	mov	x29, sp
ffffff8040083ea8:	f9000fa0 	str	x0, [x29, #24]
ffffff8040083eac:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040083eb0:	d34cfc00 	lsr	x0, x0, #12
ffffff8040083eb4:	92406801 	and	x1, x0, #0x7ffffff
ffffff8040083eb8:	12bfff40 	mov	w0, #0x5ffff               	// #393215
ffffff8040083ebc:	eb00003f 	cmp	x1, x0
ffffff8040083ec0:	54000129 	b.ls	ffffff8040083ee4 <pa2page+0x44>  // b.plast
ffffff8040083ec4:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083ec8:	9131c001 	add	x1, x0, #0xc70
ffffff8040083ecc:	b0000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040083ed0:	91326000 	add	x0, x0, #0xc98
ffffff8040083ed4:	f9400fa3 	ldr	x3, [x29, #24]
ffffff8040083ed8:	aa0103e2 	mov	x2, x1
ffffff8040083edc:	528003e1 	mov	w1, #0x1f                  	// #31
ffffff8040083ee0:	94000cb2 	bl	ffffff80400871a8 <_panic>
ffffff8040083ee4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040083ee8:	d34cfc00 	lsr	x0, x0, #12
ffffff8040083eec:	92406801 	and	x1, x0, #0x7ffffff
ffffff8040083ef0:	aa0103e0 	mov	x0, x1
ffffff8040083ef4:	d37ff800 	lsl	x0, x0, #1
ffffff8040083ef8:	8b010000 	add	x0, x0, x1
ffffff8040083efc:	d37df000 	lsl	x0, x0, #3
ffffff8040083f00:	f004b501 	adrp	x1, ffffff8049726000 <envs+0x61eb8>
ffffff8040083f04:	91062021 	add	x1, x1, #0x188
ffffff8040083f08:	8b010000 	add	x0, x0, x1
ffffff8040083f0c:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040083f10:	d65f03c0 	ret

ffffff8040083f14 <mkenvid>:
ffffff8040083f14:	d10083ff 	sub	sp, sp, #0x20
ffffff8040083f18:	f90007e0 	str	x0, [sp, #8]
ffffff8040083f1c:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040083f20:	b004b200 	adrp	x0, ffffff80496c4000 <caps+0x95ead38>
ffffff8040083f24:	91052000 	add	x0, x0, #0x148
ffffff8040083f28:	cb000020 	sub	x0, x1, x0
ffffff8040083f2c:	9343fc01 	asr	x1, x0, #3
ffffff8040083f30:	d28b1a20 	mov	x0, #0x58d1                	// #22737
ffffff8040083f34:	f2a343e0 	movk	x0, #0x1a1f, lsl #16
ffffff8040083f38:	f2c87d60 	movk	x0, #0x43eb, lsl #32
ffffff8040083f3c:	f2efac60 	movk	x0, #0x7d63, lsl #48
ffffff8040083f40:	9b007c20 	mul	x0, x1, x0
ffffff8040083f44:	b9001fe0 	str	w0, [sp, #28]
ffffff8040083f48:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083f4c:	910a8000 	add	x0, x0, #0x2a0
ffffff8040083f50:	f9400000 	ldr	x0, [x0]
ffffff8040083f54:	91000401 	add	x1, x0, #0x1
ffffff8040083f58:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083f5c:	910a8000 	add	x0, x0, #0x2a0
ffffff8040083f60:	f9000001 	str	x1, [x0]
ffffff8040083f64:	d00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040083f68:	910a8000 	add	x0, x0, #0x2a0
ffffff8040083f6c:	f9400000 	ldr	x0, [x0]
ffffff8040083f70:	53155001 	lsl	w1, w0, #11
ffffff8040083f74:	b9401fe0 	ldr	w0, [sp, #28]
ffffff8040083f78:	2a000020 	orr	w0, w1, w0
ffffff8040083f7c:	910083ff 	add	sp, sp, #0x20
ffffff8040083f80:	d65f03c0 	ret

ffffff8040083f84 <envid2env>:
ffffff8040083f84:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040083f88:	910003fd 	mov	x29, sp
ffffff8040083f8c:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083f90:	f9000ba1 	str	x1, [x29, #16]
ffffff8040083f94:	b9001ba2 	str	w2, [x29, #24]
ffffff8040083f98:	97ffffa6 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040083f9c:	12001c00 	and	w0, w0, #0xff
ffffff8040083fa0:	b9002fa0 	str	w0, [x29, #44]
ffffff8040083fa4:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083fa8:	7100001f 	cmp	w0, #0x0
ffffff8040083fac:	54000121 	b.ne	ffffff8040083fd0 <envid2env+0x4c>  // b.any
ffffff8040083fb0:	f004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040083fb4:	91058000 	add	x0, x0, #0x160
ffffff8040083fb8:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040083fbc:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040083fc0:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040083fc4:	f9000001 	str	x1, [x0]
ffffff8040083fc8:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040083fcc:	14000036 	b	ffffff80400840a4 <envid2env+0x120>
ffffff8040083fd0:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083fd4:	12002400 	and	w0, w0, #0x3ff
ffffff8040083fd8:	2a0003e1 	mov	w1, w0
ffffff8040083fdc:	aa0103e0 	mov	x0, x1
ffffff8040083fe0:	d37ff800 	lsl	x0, x0, #1
ffffff8040083fe4:	8b010000 	add	x0, x0, x1
ffffff8040083fe8:	d37cec00 	lsl	x0, x0, #4
ffffff8040083fec:	8b010000 	add	x0, x0, x1
ffffff8040083ff0:	d37df000 	lsl	x0, x0, #3
ffffff8040083ff4:	b004b201 	adrp	x1, ffffff80496c4000 <caps+0x95ead38>
ffffff8040083ff8:	91052021 	add	x1, x1, #0x148
ffffff8040083ffc:	8b010000 	add	x0, x0, x1
ffffff8040084000:	f90013a0 	str	x0, [x29, #32]
ffffff8040084004:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084008:	b9412800 	ldr	w0, [x0, #296]
ffffff804008400c:	7100001f 	cmp	w0, #0x0
ffffff8040084010:	540000c0 	b.eq	ffffff8040084028 <envid2env+0xa4>  // b.none
ffffff8040084014:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084018:	b9412000 	ldr	w0, [x0, #288]
ffffff804008401c:	b9401fa1 	ldr	w1, [x29, #28]
ffffff8040084020:	6b00003f 	cmp	w1, w0
ffffff8040084024:	540000a0 	b.eq	ffffff8040084038 <envid2env+0xb4>  // b.none
ffffff8040084028:	f9400ba0 	ldr	x0, [x29, #16]
ffffff804008402c:	f900001f 	str	xzr, [x0]
ffffff8040084030:	12800020 	mov	w0, #0xfffffffe            	// #-2
ffffff8040084034:	1400001c 	b	ffffff80400840a4 <envid2env+0x120>
ffffff8040084038:	b9401ba0 	ldr	w0, [x29, #24]
ffffff804008403c:	7100001f 	cmp	w0, #0x0
ffffff8040084040:	540002a0 	b.eq	ffffff8040084094 <envid2env+0x110>  // b.none
ffffff8040084044:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084048:	91058000 	add	x0, x0, #0x160
ffffff804008404c:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084050:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084054:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040084058:	eb00003f 	cmp	x1, x0
ffffff804008405c:	540001c0 	b.eq	ffffff8040084094 <envid2env+0x110>  // b.none
ffffff8040084060:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084064:	b9412401 	ldr	w1, [x0, #292]
ffffff8040084068:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff804008406c:	91058000 	add	x0, x0, #0x160
ffffff8040084070:	b9802fa2 	ldrsw	x2, [x29, #44]
ffffff8040084074:	f8627800 	ldr	x0, [x0, x2, lsl #3]
ffffff8040084078:	b9412000 	ldr	w0, [x0, #288]
ffffff804008407c:	6b00003f 	cmp	w1, w0
ffffff8040084080:	540000a0 	b.eq	ffffff8040084094 <envid2env+0x110>  // b.none
ffffff8040084084:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040084088:	f900001f 	str	xzr, [x0]
ffffff804008408c:	12800020 	mov	w0, #0xfffffffe            	// #-2
ffffff8040084090:	14000005 	b	ffffff80400840a4 <envid2env+0x120>
ffffff8040084094:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040084098:	f94013a1 	ldr	x1, [x29, #32]
ffffff804008409c:	f9000001 	str	x1, [x0]
ffffff80400840a0:	52800000 	mov	w0, #0x0                   	// #0
ffffff80400840a4:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400840a8:	d65f03c0 	ret

ffffff80400840ac <env_init>:
ffffff80400840ac:	d10043ff 	sub	sp, sp, #0x10
ffffff80400840b0:	b00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400840b4:	910a6000 	add	x0, x0, #0x298
ffffff80400840b8:	f900001f 	str	xzr, [x0]
ffffff80400840bc:	b9000fff 	str	wzr, [sp, #12]
ffffff80400840c0:	14000008 	b	ffffff80400840e0 <env_init+0x34>
ffffff80400840c4:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400840c8:	91052000 	add	x0, x0, #0x148
ffffff80400840cc:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff80400840d0:	f821781f 	str	xzr, [x0, x1, lsl #3]
ffffff80400840d4:	b9400fe0 	ldr	w0, [sp, #12]
ffffff80400840d8:	11000400 	add	w0, w0, #0x1
ffffff80400840dc:	b9000fe0 	str	w0, [sp, #12]
ffffff80400840e0:	b9400fe0 	ldr	w0, [sp, #12]
ffffff80400840e4:	7100081f 	cmp	w0, #0x2
ffffff80400840e8:	54fffeed 	b.le	ffffff80400840c4 <env_init+0x18>
ffffff80400840ec:	52807fe0 	mov	w0, #0x3ff                 	// #1023
ffffff80400840f0:	b9000fe0 	str	w0, [sp, #12]
ffffff80400840f4:	1400005f 	b	ffffff8040084270 <env_init+0x1c4>
ffffff80400840f8:	b9400fe2 	ldr	w2, [sp, #12]
ffffff80400840fc:	9004b200 	adrp	x0, ffffff80496c4000 <caps+0x95ead38>
ffffff8040084100:	91052003 	add	x3, x0, #0x148
ffffff8040084104:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040084108:	aa0103e0 	mov	x0, x1
ffffff804008410c:	d37ff800 	lsl	x0, x0, #1
ffffff8040084110:	8b010000 	add	x0, x0, x1
ffffff8040084114:	d37cec00 	lsl	x0, x0, #4
ffffff8040084118:	8b010000 	add	x0, x0, x1
ffffff804008411c:	d37df000 	lsl	x0, x0, #3
ffffff8040084120:	8b000060 	add	x0, x3, x0
ffffff8040084124:	b9012002 	str	w2, [x0, #288]
ffffff8040084128:	9004b200 	adrp	x0, ffffff80496c4000 <caps+0x95ead38>
ffffff804008412c:	91052002 	add	x2, x0, #0x148
ffffff8040084130:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040084134:	aa0103e0 	mov	x0, x1
ffffff8040084138:	d37ff800 	lsl	x0, x0, #1
ffffff804008413c:	8b010000 	add	x0, x0, x1
ffffff8040084140:	d37cec00 	lsl	x0, x0, #4
ffffff8040084144:	8b010000 	add	x0, x0, x1
ffffff8040084148:	d37df000 	lsl	x0, x0, #3
ffffff804008414c:	8b000040 	add	x0, x2, x0
ffffff8040084150:	b901281f 	str	wzr, [x0, #296]
ffffff8040084154:	b00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040084158:	910a6000 	add	x0, x0, #0x298
ffffff804008415c:	f9400002 	ldr	x2, [x0]
ffffff8040084160:	9004b200 	adrp	x0, ffffff80496c4000 <caps+0x95ead38>
ffffff8040084164:	91052003 	add	x3, x0, #0x148
ffffff8040084168:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff804008416c:	aa0103e0 	mov	x0, x1
ffffff8040084170:	d37ff800 	lsl	x0, x0, #1
ffffff8040084174:	8b010000 	add	x0, x0, x1
ffffff8040084178:	d37cec00 	lsl	x0, x0, #4
ffffff804008417c:	8b010000 	add	x0, x0, x1
ffffff8040084180:	d37df000 	lsl	x0, x0, #3
ffffff8040084184:	8b000060 	add	x0, x3, x0
ffffff8040084188:	f9008802 	str	x2, [x0, #272]
ffffff804008418c:	9004b200 	adrp	x0, ffffff80496c4000 <caps+0x95ead38>
ffffff8040084190:	91052002 	add	x2, x0, #0x148
ffffff8040084194:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040084198:	aa0103e0 	mov	x0, x1
ffffff804008419c:	d37ff800 	lsl	x0, x0, #1
ffffff80400841a0:	8b010000 	add	x0, x0, x1
ffffff80400841a4:	d37cec00 	lsl	x0, x0, #4
ffffff80400841a8:	8b010000 	add	x0, x0, x1
ffffff80400841ac:	d37df000 	lsl	x0, x0, #3
ffffff80400841b0:	8b000040 	add	x0, x2, x0
ffffff80400841b4:	f9408800 	ldr	x0, [x0, #272]
ffffff80400841b8:	f100001f 	cmp	x0, #0x0
ffffff80400841bc:	54000200 	b.eq	ffffff80400841fc <env_init+0x150>  // b.none
ffffff80400841c0:	b00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400841c4:	910a6000 	add	x0, x0, #0x298
ffffff80400841c8:	f9400002 	ldr	x2, [x0]
ffffff80400841cc:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff80400841d0:	aa0103e0 	mov	x0, x1
ffffff80400841d4:	d37ff800 	lsl	x0, x0, #1
ffffff80400841d8:	8b010000 	add	x0, x0, x1
ffffff80400841dc:	d37cec00 	lsl	x0, x0, #4
ffffff80400841e0:	8b010000 	add	x0, x0, x1
ffffff80400841e4:	d37df000 	lsl	x0, x0, #3
ffffff80400841e8:	91044001 	add	x1, x0, #0x110
ffffff80400841ec:	9004b200 	adrp	x0, ffffff80496c4000 <caps+0x95ead38>
ffffff80400841f0:	91052000 	add	x0, x0, #0x148
ffffff80400841f4:	8b000020 	add	x0, x1, x0
ffffff80400841f8:	f9008c40 	str	x0, [x2, #280]
ffffff80400841fc:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040084200:	aa0103e0 	mov	x0, x1
ffffff8040084204:	d37ff800 	lsl	x0, x0, #1
ffffff8040084208:	8b010000 	add	x0, x0, x1
ffffff804008420c:	d37cec00 	lsl	x0, x0, #4
ffffff8040084210:	8b010000 	add	x0, x0, x1
ffffff8040084214:	d37df000 	lsl	x0, x0, #3
ffffff8040084218:	9004b201 	adrp	x1, ffffff80496c4000 <caps+0x95ead38>
ffffff804008421c:	91052021 	add	x1, x1, #0x148
ffffff8040084220:	8b010001 	add	x1, x0, x1
ffffff8040084224:	b00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040084228:	910a6000 	add	x0, x0, #0x298
ffffff804008422c:	f9000001 	str	x1, [x0]
ffffff8040084230:	9004b200 	adrp	x0, ffffff80496c4000 <caps+0x95ead38>
ffffff8040084234:	91052002 	add	x2, x0, #0x148
ffffff8040084238:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff804008423c:	aa0103e0 	mov	x0, x1
ffffff8040084240:	d37ff800 	lsl	x0, x0, #1
ffffff8040084244:	8b010000 	add	x0, x0, x1
ffffff8040084248:	d37cec00 	lsl	x0, x0, #4
ffffff804008424c:	8b010000 	add	x0, x0, x1
ffffff8040084250:	d37df000 	lsl	x0, x0, #3
ffffff8040084254:	8b000040 	add	x0, x2, x0
ffffff8040084258:	b00002a1 	adrp	x1, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff804008425c:	910a6021 	add	x1, x1, #0x298
ffffff8040084260:	f9008c01 	str	x1, [x0, #280]
ffffff8040084264:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040084268:	51000400 	sub	w0, w0, #0x1
ffffff804008426c:	b9000fe0 	str	w0, [sp, #12]
ffffff8040084270:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040084274:	7100001f 	cmp	w0, #0x0
ffffff8040084278:	54fff40a 	b.ge	ffffff80400840f8 <env_init+0x4c>  // b.tcont
ffffff804008427c:	b9000fff 	str	wzr, [sp, #12]
ffffff8040084280:	14000008 	b	ffffff80400842a0 <env_init+0x1f4>
ffffff8040084284:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084288:	91058000 	add	x0, x0, #0x160
ffffff804008428c:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040084290:	f821781f 	str	xzr, [x0, x1, lsl #3]
ffffff8040084294:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040084298:	11000400 	add	w0, w0, #0x1
ffffff804008429c:	b9000fe0 	str	w0, [sp, #12]
ffffff80400842a0:	b9400fe0 	ldr	w0, [sp, #12]
ffffff80400842a4:	71000c1f 	cmp	w0, #0x3
ffffff80400842a8:	54fffeed 	b.le	ffffff8040084284 <env_init+0x1d8>
ffffff80400842ac:	d503201f 	nop
ffffff80400842b0:	910043ff 	add	sp, sp, #0x10
ffffff80400842b4:	d65f03c0 	ret

ffffff80400842b8 <env_alloc>:
ffffff80400842b8:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff80400842bc:	910003fd 	mov	x29, sp
ffffff80400842c0:	f9000bf3 	str	x19, [sp, #16]
ffffff80400842c4:	f90017a0 	str	x0, [x29, #40]
ffffff80400842c8:	b90027a1 	str	w1, [x29, #36]
ffffff80400842cc:	f9001fbf 	str	xzr, [x29, #56]
ffffff80400842d0:	b00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400842d4:	910a6000 	add	x0, x0, #0x298
ffffff80400842d8:	f9400000 	ldr	x0, [x0]
ffffff80400842dc:	f90027a0 	str	x0, [x29, #72]
ffffff80400842e0:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400842e4:	f100001f 	cmp	x0, #0x0
ffffff80400842e8:	54000161 	b.ne	ffffff8040084314 <env_alloc+0x5c>  // b.any
ffffff80400842ec:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400842f0:	9132e002 	add	x2, x0, #0xcb8
ffffff80400842f4:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400842f8:	91332001 	add	x1, x0, #0xcc8
ffffff80400842fc:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040084300:	91338000 	add	x0, x0, #0xce0
ffffff8040084304:	aa0203e3 	mov	x3, x2
ffffff8040084308:	aa0103e2 	mov	x2, x1
ffffff804008430c:	52800821 	mov	w1, #0x41                  	// #65
ffffff8040084310:	94000ba6 	bl	ffffff80400871a8 <_panic>
ffffff8040084314:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040084318:	97fffeff 	bl	ffffff8040083f14 <mkenvid>
ffffff804008431c:	2a0003e1 	mov	w1, w0
ffffff8040084320:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040084324:	b9012001 	str	w1, [x0, #288]
ffffff8040084328:	9100e3a0 	add	x0, x29, #0x38
ffffff804008432c:	9400053a 	bl	ffffff8040085814 <page_alloc>
ffffff8040084330:	b90047a0 	str	w0, [x29, #68]
ffffff8040084334:	b94047a0 	ldr	w0, [x29, #68]
ffffff8040084338:	7100001f 	cmp	w0, #0x0
ffffff804008433c:	5400016a 	b.ge	ffffff8040084368 <env_alloc+0xb0>  // b.tcont
ffffff8040084340:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040084344:	91340002 	add	x2, x0, #0xd00
ffffff8040084348:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff804008434c:	91332001 	add	x1, x0, #0xcc8
ffffff8040084350:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040084354:	91338000 	add	x0, x0, #0xce0
ffffff8040084358:	aa0203e3 	mov	x3, x2
ffffff804008435c:	aa0103e2 	mov	x2, x1
ffffff8040084360:	528008a1 	mov	w1, #0x45                  	// #69
ffffff8040084364:	94000b91 	bl	ffffff80400871a8 <_panic>
ffffff8040084368:	f9401fa0 	ldr	x0, [x29, #56]
ffffff804008436c:	79402001 	ldrh	w1, [x0, #16]
ffffff8040084370:	11000421 	add	w1, w1, #0x1
ffffff8040084374:	12003c21 	and	w1, w1, #0xffff
ffffff8040084378:	79002001 	strh	w1, [x0, #16]
ffffff804008437c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040084380:	97fffebf 	bl	ffffff8040083e7c <page2kva>
ffffff8040084384:	aa0003e1 	mov	x1, x0
ffffff8040084388:	f94027a0 	ldr	x0, [x29, #72]
ffffff804008438c:	f9009801 	str	x1, [x0, #304]
ffffff8040084390:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040084394:	f9409813 	ldr	x19, [x0, #304]
ffffff8040084398:	f94027a0 	ldr	x0, [x29, #72]
ffffff804008439c:	f9409800 	ldr	x0, [x0, #304]
ffffff80400843a0:	92407c00 	and	x0, x0, #0xffffffff
ffffff80400843a4:	97fffebf 	bl	ffffff8040083ea0 <pa2page>
ffffff80400843a8:	aa0003e1 	mov	x1, x0
ffffff80400843ac:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400843b0:	b9412000 	ldr	w0, [x0, #288]
ffffff80400843b4:	12002400 	and	w0, w0, #0x3ff
ffffff80400843b8:	2a0003e4 	mov	w4, w0
ffffff80400843bc:	d2801803 	mov	x3, #0xc0                  	// #192
ffffff80400843c0:	d2a80402 	mov	x2, #0x40200000            	// #1075838976
ffffff80400843c4:	f2c00e02 	movk	x2, #0x70, lsl #32
ffffff80400843c8:	aa1303e0 	mov	x0, x19
ffffff80400843cc:	940005d4 	bl	ffffff8040085b1c <page_insert>
ffffff80400843d0:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400843d4:	b94027a1 	ldr	w1, [x29, #36]
ffffff80400843d8:	b9012401 	str	w1, [x0, #292]
ffffff80400843dc:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400843e0:	52800021 	mov	w1, #0x1                   	// #1
ffffff80400843e4:	b9012801 	str	w1, [x0, #296]
ffffff80400843e8:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400843ec:	f9007c1f 	str	xzr, [x0, #248]
ffffff80400843f0:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400843f4:	d2a02001 	mov	x1, #0x1000000             	// #16777216
ffffff80400843f8:	f9008401 	str	x1, [x0, #264]
ffffff80400843fc:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040084400:	f9408800 	ldr	x0, [x0, #272]
ffffff8040084404:	f100001f 	cmp	x0, #0x0
ffffff8040084408:	540000c0 	b.eq	ffffff8040084420 <env_alloc+0x168>  // b.none
ffffff804008440c:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040084410:	f9408800 	ldr	x0, [x0, #272]
ffffff8040084414:	f94027a1 	ldr	x1, [x29, #72]
ffffff8040084418:	f9408c21 	ldr	x1, [x1, #280]
ffffff804008441c:	f9008c01 	str	x1, [x0, #280]
ffffff8040084420:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040084424:	f9408c00 	ldr	x0, [x0, #280]
ffffff8040084428:	f94027a1 	ldr	x1, [x29, #72]
ffffff804008442c:	f9408821 	ldr	x1, [x1, #272]
ffffff8040084430:	f9000001 	str	x1, [x0]
ffffff8040084434:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040084438:	f94027a1 	ldr	x1, [x29, #72]
ffffff804008443c:	f9000001 	str	x1, [x0]
ffffff8040084440:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040084444:	f9400bf3 	ldr	x19, [sp, #16]
ffffff8040084448:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff804008444c:	d65f03c0 	ret

ffffff8040084450 <load_icode_mapper>:
ffffff8040084450:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
ffffff8040084454:	910003fd 	mov	x29, sp
ffffff8040084458:	f9000bf3 	str	x19, [sp, #16]
ffffff804008445c:	f9001fa0 	str	x0, [x29, #56]
ffffff8040084460:	b90037a1 	str	w1, [x29, #52]
ffffff8040084464:	f90017a2 	str	x2, [x29, #40]
ffffff8040084468:	b90033a3 	str	w3, [x29, #48]
ffffff804008446c:	f90013a4 	str	x4, [x29, #32]
ffffff8040084470:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084474:	f9003ba0 	str	x0, [x29, #112]
ffffff8040084478:	f9403ba0 	ldr	x0, [x29, #112]
ffffff804008447c:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084480:	12002400 	and	w0, w0, #0x3ff
ffffff8040084484:	b9006fa0 	str	w0, [x29, #108]
ffffff8040084488:	f90027bf 	str	xzr, [x29, #72]
ffffff804008448c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040084490:	9260ac00 	and	x0, x0, #0xffffffff00000fff
ffffff8040084494:	f90033a0 	str	x0, [x29, #96]
ffffff8040084498:	f9003fbf 	str	xzr, [x29, #120]
ffffff804008449c:	1400004e 	b	ffffff80400845d4 <load_icode_mapper+0x184>
ffffff80400844a0:	910123a0 	add	x0, x29, #0x48
ffffff80400844a4:	940004dc 	bl	ffffff8040085814 <page_alloc>
ffffff80400844a8:	b9005fa0 	str	w0, [x29, #92]
ffffff80400844ac:	b9405fa0 	ldr	w0, [x29, #92]
ffffff80400844b0:	7100001f 	cmp	w0, #0x0
ffffff80400844b4:	5400016a 	b.ge	ffffff80400844e0 <load_icode_mapper+0x90>  // b.tcont
ffffff80400844b8:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400844bc:	91340002 	add	x2, x0, #0xd00
ffffff80400844c0:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400844c4:	91332001 	add	x1, x0, #0xcc8
ffffff80400844c8:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400844cc:	91338000 	add	x0, x0, #0xce0
ffffff80400844d0:	aa0203e3 	mov	x3, x2
ffffff80400844d4:	aa0103e2 	mov	x2, x1
ffffff80400844d8:	52800bc1 	mov	w1, #0x5e                  	// #94
ffffff80400844dc:	94000b33 	bl	ffffff80400871a8 <_panic>
ffffff80400844e0:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400844e4:	79402001 	ldrh	w1, [x0, #16]
ffffff80400844e8:	11000421 	add	w1, w1, #0x1
ffffff80400844ec:	12003c21 	and	w1, w1, #0xffff
ffffff80400844f0:	79002001 	strh	w1, [x0, #16]
ffffff80400844f4:	f9403ba0 	ldr	x0, [x29, #112]
ffffff80400844f8:	f9409805 	ldr	x5, [x0, #304]
ffffff80400844fc:	f94027a6 	ldr	x6, [x29, #72]
ffffff8040084500:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040084504:	f94033a0 	ldr	x0, [x29, #96]
ffffff8040084508:	cb000021 	sub	x1, x1, x0
ffffff804008450c:	f9403fa0 	ldr	x0, [x29, #120]
ffffff8040084510:	8b000020 	add	x0, x1, x0
ffffff8040084514:	b9406fa1 	ldr	w1, [x29, #108]
ffffff8040084518:	2a0103e4 	mov	w4, w1
ffffff804008451c:	d2800803 	mov	x3, #0x40                  	// #64
ffffff8040084520:	aa0003e2 	mov	x2, x0
ffffff8040084524:	aa0603e1 	mov	x1, x6
ffffff8040084528:	aa0503e0 	mov	x0, x5
ffffff804008452c:	9400057c 	bl	ffffff8040085b1c <page_insert>
ffffff8040084530:	b9005fa0 	str	w0, [x29, #92]
ffffff8040084534:	b9405fa0 	ldr	w0, [x29, #92]
ffffff8040084538:	7100001f 	cmp	w0, #0x0
ffffff804008453c:	5400016a 	b.ge	ffffff8040084568 <load_icode_mapper+0x118>  // b.tcont
ffffff8040084540:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040084544:	91340002 	add	x2, x0, #0xd00
ffffff8040084548:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff804008454c:	91332001 	add	x1, x0, #0xcc8
ffffff8040084550:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040084554:	91338000 	add	x0, x0, #0xce0
ffffff8040084558:	aa0203e3 	mov	x3, x2
ffffff804008455c:	aa0103e2 	mov	x2, x1
ffffff8040084560:	52800c61 	mov	w1, #0x63                  	// #99
ffffff8040084564:	94000b11 	bl	ffffff80400871a8 <_panic>
ffffff8040084568:	f94017a1 	ldr	x1, [x29, #40]
ffffff804008456c:	f9403fa0 	ldr	x0, [x29, #120]
ffffff8040084570:	8b000033 	add	x19, x1, x0
ffffff8040084574:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040084578:	97fffe41 	bl	ffffff8040083e7c <page2kva>
ffffff804008457c:	aa0003e1 	mov	x1, x0
ffffff8040084580:	f94033a0 	ldr	x0, [x29, #96]
ffffff8040084584:	8b000020 	add	x0, x1, x0
ffffff8040084588:	aa0003e3 	mov	x3, x0
ffffff804008458c:	52820000 	mov	w0, #0x1000                	// #4096
ffffff8040084590:	b9005ba0 	str	w0, [x29, #88]
ffffff8040084594:	b94033a1 	ldr	w1, [x29, #48]
ffffff8040084598:	f9403fa0 	ldr	x0, [x29, #120]
ffffff804008459c:	cb000020 	sub	x0, x1, x0
ffffff80400845a0:	f9002ba0 	str	x0, [x29, #80]
ffffff80400845a4:	b9405ba0 	ldr	w0, [x29, #88]
ffffff80400845a8:	f9402ba2 	ldr	x2, [x29, #80]
ffffff80400845ac:	f9402ba1 	ldr	x1, [x29, #80]
ffffff80400845b0:	eb00005f 	cmp	x2, x0
ffffff80400845b4:	9a809020 	csel	x0, x1, x0, ls  // ls = plast
ffffff80400845b8:	aa0003e2 	mov	x2, x0
ffffff80400845bc:	aa0303e1 	mov	x1, x3
ffffff80400845c0:	aa1303e0 	mov	x0, x19
ffffff80400845c4:	9400046a 	bl	ffffff804008576c <bcopy>
ffffff80400845c8:	f9403fa0 	ldr	x0, [x29, #120]
ffffff80400845cc:	91400400 	add	x0, x0, #0x1, lsl #12
ffffff80400845d0:	f9003fa0 	str	x0, [x29, #120]
ffffff80400845d4:	b94033a0 	ldr	w0, [x29, #48]
ffffff80400845d8:	f9403fa1 	ldr	x1, [x29, #120]
ffffff80400845dc:	eb00003f 	cmp	x1, x0
ffffff80400845e0:	54fff603 	b.cc	ffffff80400844a0 <load_icode_mapper+0x50>  // b.lo, b.ul, b.last
ffffff80400845e4:	14000036 	b	ffffff80400846bc <load_icode_mapper+0x26c>
ffffff80400845e8:	910123a0 	add	x0, x29, #0x48
ffffff80400845ec:	9400048a 	bl	ffffff8040085814 <page_alloc>
ffffff80400845f0:	b9005fa0 	str	w0, [x29, #92]
ffffff80400845f4:	b9405fa0 	ldr	w0, [x29, #92]
ffffff80400845f8:	7100001f 	cmp	w0, #0x0
ffffff80400845fc:	5400016a 	b.ge	ffffff8040084628 <load_icode_mapper+0x1d8>  // b.tcont
ffffff8040084600:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040084604:	91340002 	add	x2, x0, #0xd00
ffffff8040084608:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff804008460c:	91332001 	add	x1, x0, #0xcc8
ffffff8040084610:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040084614:	91338000 	add	x0, x0, #0xce0
ffffff8040084618:	aa0203e3 	mov	x3, x2
ffffff804008461c:	aa0103e2 	mov	x2, x1
ffffff8040084620:	52800d21 	mov	w1, #0x69                  	// #105
ffffff8040084624:	94000ae1 	bl	ffffff80400871a8 <_panic>
ffffff8040084628:	f94027a0 	ldr	x0, [x29, #72]
ffffff804008462c:	79402001 	ldrh	w1, [x0, #16]
ffffff8040084630:	11000421 	add	w1, w1, #0x1
ffffff8040084634:	12003c21 	and	w1, w1, #0xffff
ffffff8040084638:	79002001 	strh	w1, [x0, #16]
ffffff804008463c:	f9403ba0 	ldr	x0, [x29, #112]
ffffff8040084640:	f9409805 	ldr	x5, [x0, #304]
ffffff8040084644:	f94027a6 	ldr	x6, [x29, #72]
ffffff8040084648:	f9401fa1 	ldr	x1, [x29, #56]
ffffff804008464c:	f94033a0 	ldr	x0, [x29, #96]
ffffff8040084650:	cb000021 	sub	x1, x1, x0
ffffff8040084654:	f9403fa0 	ldr	x0, [x29, #120]
ffffff8040084658:	8b000020 	add	x0, x1, x0
ffffff804008465c:	b9406fa1 	ldr	w1, [x29, #108]
ffffff8040084660:	2a0103e4 	mov	w4, w1
ffffff8040084664:	d2800803 	mov	x3, #0x40                  	// #64
ffffff8040084668:	aa0003e2 	mov	x2, x0
ffffff804008466c:	aa0603e1 	mov	x1, x6
ffffff8040084670:	aa0503e0 	mov	x0, x5
ffffff8040084674:	9400052a 	bl	ffffff8040085b1c <page_insert>
ffffff8040084678:	b9005fa0 	str	w0, [x29, #92]
ffffff804008467c:	b9405fa0 	ldr	w0, [x29, #92]
ffffff8040084680:	7100001f 	cmp	w0, #0x0
ffffff8040084684:	5400016a 	b.ge	ffffff80400846b0 <load_icode_mapper+0x260>  // b.tcont
ffffff8040084688:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff804008468c:	91340002 	add	x2, x0, #0xd00
ffffff8040084690:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040084694:	91332001 	add	x1, x0, #0xcc8
ffffff8040084698:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff804008469c:	91338000 	add	x0, x0, #0xce0
ffffff80400846a0:	aa0203e3 	mov	x3, x2
ffffff80400846a4:	aa0103e2 	mov	x2, x1
ffffff80400846a8:	52800da1 	mov	w1, #0x6d                  	// #109
ffffff80400846ac:	94000abf 	bl	ffffff80400871a8 <_panic>
ffffff80400846b0:	f9403fa0 	ldr	x0, [x29, #120]
ffffff80400846b4:	91400400 	add	x0, x0, #0x1, lsl #12
ffffff80400846b8:	f9003fa0 	str	x0, [x29, #120]
ffffff80400846bc:	b94037a0 	ldr	w0, [x29, #52]
ffffff80400846c0:	f9403fa1 	ldr	x1, [x29, #120]
ffffff80400846c4:	eb00003f 	cmp	x1, x0
ffffff80400846c8:	54fff903 	b.cc	ffffff80400845e8 <load_icode_mapper+0x198>  // b.lo, b.ul, b.last
ffffff80400846cc:	52800000 	mov	w0, #0x0                   	// #0
ffffff80400846d0:	f9400bf3 	ldr	x19, [sp, #16]
ffffff80400846d4:	a8c87bfd 	ldp	x29, x30, [sp], #128
ffffff80400846d8:	d65f03c0 	ret

ffffff80400846dc <load_icode>:
ffffff80400846dc:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff80400846e0:	910003fd 	mov	x29, sp
ffffff80400846e4:	f90017a0 	str	x0, [x29, #40]
ffffff80400846e8:	f90013a1 	str	x1, [x29, #32]
ffffff80400846ec:	b9001fa2 	str	w2, [x29, #28]
ffffff80400846f0:	f90023bf 	str	xzr, [x29, #64]
ffffff80400846f4:	910103a0 	add	x0, x29, #0x40
ffffff80400846f8:	94000447 	bl	ffffff8040085814 <page_alloc>
ffffff80400846fc:	93407c00 	sxtw	x0, w0
ffffff8040084700:	f90027a0 	str	x0, [x29, #72]
ffffff8040084704:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040084708:	f9409805 	ldr	x5, [x0, #304]
ffffff804008470c:	f94023a1 	ldr	x1, [x29, #64]
ffffff8040084710:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040084714:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084718:	12002400 	and	w0, w0, #0x3ff
ffffff804008471c:	2a0003e4 	mov	w4, w0
ffffff8040084720:	d2800803 	mov	x3, #0x40                  	// #64
ffffff8040084724:	b2742fe2 	mov	x2, #0xfff000              	// #16773120
ffffff8040084728:	aa0503e0 	mov	x0, x5
ffffff804008472c:	940004fc 	bl	ffffff8040085b1c <page_insert>
ffffff8040084730:	93407c00 	sxtw	x0, w0
ffffff8040084734:	f90027a0 	str	x0, [x29, #72]
ffffff8040084738:	b9401fa1 	ldr	w1, [x29, #28]
ffffff804008473c:	90000000 	adrp	x0, ffffff8040084000 <envid2env+0x7c>
ffffff8040084740:	91114002 	add	x2, x0, #0x450
ffffff8040084744:	9100e3a0 	add	x0, x29, #0x38
ffffff8040084748:	aa0203e4 	mov	x4, x2
ffffff804008474c:	f94017a3 	ldr	x3, [x29, #40]
ffffff8040084750:	aa0003e2 	mov	x2, x0
ffffff8040084754:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084758:	940002f1 	bl	ffffff804008531c <load_elf>
ffffff804008475c:	93407c00 	sxtw	x0, w0
ffffff8040084760:	f90027a0 	str	x0, [x29, #72]
ffffff8040084764:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040084768:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008476c:	f9008001 	str	x1, [x0, #256]
ffffff8040084770:	d503201f 	nop
ffffff8040084774:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff8040084778:	d65f03c0 	ret

ffffff804008477c <env_create_priority>:
ffffff804008477c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040084780:	910003fd 	mov	x29, sp
ffffff8040084784:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084788:	b90017a1 	str	w1, [x29, #20]
ffffff804008478c:	b90013a2 	str	w2, [x29, #16]
ffffff8040084790:	9100a3a0 	add	x0, x29, #0x28
ffffff8040084794:	52800001 	mov	w1, #0x0                   	// #0
ffffff8040084798:	97fffec8 	bl	ffffff80400842b8 <env_alloc>
ffffff804008479c:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400847a0:	b94013a1 	ldr	w1, [x29, #16]
ffffff80400847a4:	b9014801 	str	w1, [x0, #328]
ffffff80400847a8:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400847ac:	b94017a2 	ldr	w2, [x29, #20]
ffffff80400847b0:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400847b4:	97ffffca 	bl	ffffff80400846dc <load_icode>
ffffff80400847b8:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400847bc:	d004b501 	adrp	x1, ffffff8049726000 <envs+0x61eb8>
ffffff80400847c0:	91052021 	add	x1, x1, #0x148
ffffff80400847c4:	b98013a2 	ldrsw	x2, [x29, #16]
ffffff80400847c8:	f8627821 	ldr	x1, [x1, x2, lsl #3]
ffffff80400847cc:	f9009c01 	str	x1, [x0, #312]
ffffff80400847d0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400847d4:	f100001f 	cmp	x0, #0x0
ffffff80400847d8:	54000100 	b.eq	ffffff80400847f8 <env_create_priority+0x7c>  // b.none
ffffff80400847dc:	f94017a1 	ldr	x1, [x29, #40]
ffffff80400847e0:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400847e4:	91052000 	add	x0, x0, #0x148
ffffff80400847e8:	b98013a2 	ldrsw	x2, [x29, #16]
ffffff80400847ec:	f8627800 	ldr	x0, [x0, x2, lsl #3]
ffffff80400847f0:	9104e021 	add	x1, x1, #0x138
ffffff80400847f4:	f900a001 	str	x1, [x0, #320]
ffffff80400847f8:	f94017a2 	ldr	x2, [x29, #40]
ffffff80400847fc:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084800:	91052000 	add	x0, x0, #0x148
ffffff8040084804:	b98013a1 	ldrsw	x1, [x29, #16]
ffffff8040084808:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff804008480c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040084810:	b98013a1 	ldrsw	x1, [x29, #16]
ffffff8040084814:	d37df022 	lsl	x2, x1, #3
ffffff8040084818:	d004b501 	adrp	x1, ffffff8049726000 <envs+0x61eb8>
ffffff804008481c:	91052021 	add	x1, x1, #0x148
ffffff8040084820:	8b010041 	add	x1, x2, x1
ffffff8040084824:	f900a001 	str	x1, [x0, #320]
ffffff8040084828:	d503201f 	nop
ffffff804008482c:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040084830:	d65f03c0 	ret

ffffff8040084834 <env_create>:
ffffff8040084834:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040084838:	910003fd 	mov	x29, sp
ffffff804008483c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084840:	b90017a1 	str	w1, [x29, #20]
ffffff8040084844:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040084848:	b94017a1 	ldr	w1, [x29, #20]
ffffff804008484c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084850:	97ffffcb 	bl	ffffff804008477c <env_create_priority>
ffffff8040084854:	d503201f 	nop
ffffff8040084858:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff804008485c:	d65f03c0 	ret

ffffff8040084860 <env_free>:
ffffff8040084860:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040084864:	910003fd 	mov	x29, sp
ffffff8040084868:	f9000fa0 	str	x0, [x29, #24]
ffffff804008486c:	97fffd71 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040084870:	12001c00 	and	w0, w0, #0xff
ffffff8040084874:	b90037a0 	str	w0, [x29, #52]
ffffff8040084878:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff804008487c:	91058000 	add	x0, x0, #0x160
ffffff8040084880:	b98037a1 	ldrsw	x1, [x29, #52]
ffffff8040084884:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084888:	f100001f 	cmp	x0, #0x0
ffffff804008488c:	540000e0 	b.eq	ffffff80400848a8 <env_free+0x48>  // b.none
ffffff8040084890:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084894:	91058000 	add	x0, x0, #0x160
ffffff8040084898:	b98037a1 	ldrsw	x1, [x29, #52]
ffffff804008489c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400848a0:	b9412001 	ldr	w1, [x0, #288]
ffffff80400848a4:	14000002 	b	ffffff80400848ac <env_free+0x4c>
ffffff80400848a8:	52800001 	mov	w1, #0x0                   	// #0
ffffff80400848ac:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400848b0:	b9412002 	ldr	w2, [x0, #288]
ffffff80400848b4:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400848b8:	91342000 	add	x0, x0, #0xd08
ffffff80400848bc:	2a0203e3 	mov	w3, w2
ffffff80400848c0:	2a0103e2 	mov	w2, w1
ffffff80400848c4:	b94037a1 	ldr	w1, [x29, #52]
ffffff80400848c8:	94000a0f 	bl	ffffff8040087104 <printf>
ffffff80400848cc:	f9001fbf 	str	xzr, [x29, #56]
ffffff80400848d0:	1400002b 	b	ffffff804008497c <env_free+0x11c>
ffffff80400848d4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400848d8:	f9409801 	ldr	x1, [x0, #304]
ffffff80400848dc:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400848e0:	d37df000 	lsl	x0, x0, #3
ffffff80400848e4:	8b000020 	add	x0, x1, x0
ffffff80400848e8:	f9400000 	ldr	x0, [x0]
ffffff80400848ec:	92400400 	and	x0, x0, #0x3
ffffff80400848f0:	f100001f 	cmp	x0, #0x0
ffffff80400848f4:	540003c0 	b.eq	ffffff804008496c <env_free+0x10c>  // b.none
ffffff80400848f8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400848fc:	f9409800 	ldr	x0, [x0, #304]
ffffff8040084900:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040084904:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040084908:	f90017a0 	str	x0, [x29, #40]
ffffff804008490c:	f90013bf 	str	xzr, [x29, #32]
ffffff8040084910:	d503201f 	nop
ffffff8040084914:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084918:	f9409801 	ldr	x1, [x0, #304]
ffffff804008491c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040084920:	d37df000 	lsl	x0, x0, #3
ffffff8040084924:	8b000020 	add	x0, x1, x0
ffffff8040084928:	f9400000 	ldr	x0, [x0]
ffffff804008492c:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040084930:	97fffd5c 	bl	ffffff8040083ea0 <pa2page>
ffffff8040084934:	aa0003e2 	mov	x2, x0
ffffff8040084938:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008493c:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084940:	12002400 	and	w0, w0, #0x3ff
ffffff8040084944:	2a0003e1 	mov	w1, w0
ffffff8040084948:	aa0203e0 	mov	x0, x2
ffffff804008494c:	940004e9 	bl	ffffff8040085cf0 <page_decref>
ffffff8040084950:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084954:	f9409801 	ldr	x1, [x0, #304]
ffffff8040084958:	f9401fa0 	ldr	x0, [x29, #56]
ffffff804008495c:	d37df000 	lsl	x0, x0, #3
ffffff8040084960:	8b000020 	add	x0, x1, x0
ffffff8040084964:	f900001f 	str	xzr, [x0]
ffffff8040084968:	14000002 	b	ffffff8040084970 <env_free+0x110>
ffffff804008496c:	d503201f 	nop
ffffff8040084970:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040084974:	91000400 	add	x0, x0, #0x1
ffffff8040084978:	f9001fa0 	str	x0, [x29, #56]
ffffff804008497c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040084980:	f100041f 	cmp	x0, #0x1
ffffff8040084984:	54fffa89 	b.ls	ffffff80400848d4 <env_free+0x74>  // b.plast
ffffff8040084988:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008498c:	f9409800 	ldr	x0, [x0, #304]
ffffff8040084990:	97fffd44 	bl	ffffff8040083ea0 <pa2page>
ffffff8040084994:	aa0003e2 	mov	x2, x0
ffffff8040084998:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008499c:	b9412000 	ldr	w0, [x0, #288]
ffffff80400849a0:	12002400 	and	w0, w0, #0x3ff
ffffff80400849a4:	2a0003e1 	mov	w1, w0
ffffff80400849a8:	aa0203e0 	mov	x0, x2
ffffff80400849ac:	940004d1 	bl	ffffff8040085cf0 <page_decref>
ffffff80400849b0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400849b4:	b901281f 	str	wzr, [x0, #296]
ffffff80400849b8:	b00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400849bc:	910a6000 	add	x0, x0, #0x298
ffffff80400849c0:	f9400001 	ldr	x1, [x0]
ffffff80400849c4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400849c8:	f9008801 	str	x1, [x0, #272]
ffffff80400849cc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400849d0:	f9408800 	ldr	x0, [x0, #272]
ffffff80400849d4:	f100001f 	cmp	x0, #0x0
ffffff80400849d8:	540000e0 	b.eq	ffffff80400849f4 <env_free+0x194>  // b.none
ffffff80400849dc:	b00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400849e0:	910a6000 	add	x0, x0, #0x298
ffffff80400849e4:	f9400000 	ldr	x0, [x0]
ffffff80400849e8:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400849ec:	91044021 	add	x1, x1, #0x110
ffffff80400849f0:	f9008c01 	str	x1, [x0, #280]
ffffff80400849f4:	b00002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400849f8:	910a6000 	add	x0, x0, #0x298
ffffff80400849fc:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040084a00:	f9000001 	str	x1, [x0]
ffffff8040084a04:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a08:	b00002a1 	adrp	x1, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040084a0c:	910a6021 	add	x1, x1, #0x298
ffffff8040084a10:	f9008c01 	str	x1, [x0, #280]
ffffff8040084a14:	d503201f 	nop
ffffff8040084a18:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040084a1c:	d65f03c0 	ret

ffffff8040084a20 <env_destroy>:
ffffff8040084a20:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040084a24:	910003fd 	mov	x29, sp
ffffff8040084a28:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084a2c:	90000020 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040084a30:	9134a000 	add	x0, x0, #0xd28
ffffff8040084a34:	940009b4 	bl	ffffff8040087104 <printf>
ffffff8040084a38:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a3c:	b9414c00 	ldr	w0, [x0, #332]
ffffff8040084a40:	b9002fa0 	str	w0, [x29, #44]
ffffff8040084a44:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a48:	97ffff86 	bl	ffffff8040084860 <env_free>
ffffff8040084a4c:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084a50:	91058000 	add	x0, x0, #0x160
ffffff8040084a54:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084a58:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084a5c:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040084a60:	eb00003f 	cmp	x1, x0
ffffff8040084a64:	540000c1 	b.ne	ffffff8040084a7c <env_destroy+0x5c>  // b.any
ffffff8040084a68:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084a6c:	91058000 	add	x0, x0, #0x160
ffffff8040084a70:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084a74:	f821781f 	str	xzr, [x0, x1, lsl #3]
ffffff8040084a78:	94000a26 	bl	ffffff8040087310 <sched_yield>
ffffff8040084a7c:	d503201f 	nop
ffffff8040084a80:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040084a84:	d65f03c0 	ret

ffffff8040084a88 <set_ttbr0>:
ffffff8040084a88:	d10043ff 	sub	sp, sp, #0x10
ffffff8040084a8c:	f90007e0 	str	x0, [sp, #8]
ffffff8040084a90:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084a94:	d5182000 	msr	ttbr0_el1, x0
ffffff8040084a98:	d503201f 	nop
ffffff8040084a9c:	910043ff 	add	sp, sp, #0x10
ffffff8040084aa0:	d65f03c0 	ret

ffffff8040084aa4 <tlb_invalidate>:
ffffff8040084aa4:	d5033a9f 	dsb	ishst
ffffff8040084aa8:	d508831f 	tlbi	vmalle1is
ffffff8040084aac:	d5033b9f 	dsb	ish
ffffff8040084ab0:	d5033fdf 	isb
ffffff8040084ab4:	d503201f 	nop
ffffff8040084ab8:	d65f03c0 	ret

ffffff8040084abc <env_run>:
ffffff8040084abc:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040084ac0:	910003fd 	mov	x29, sp
ffffff8040084ac4:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084ac8:	97fffcda 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040084acc:	12001c00 	and	w0, w0, #0xff
ffffff8040084ad0:	b9002fa0 	str	w0, [x29, #44]
ffffff8040084ad4:	d004fd00 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff8040084ad8:	91062000 	add	x0, x0, #0x188
ffffff8040084adc:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084ae0:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084ae4:	f90013a0 	str	x0, [x29, #32]
ffffff8040084ae8:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084aec:	91058000 	add	x0, x0, #0x160
ffffff8040084af0:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084af4:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084af8:	f100001f 	cmp	x0, #0x0
ffffff8040084afc:	54000120 	b.eq	ffffff8040084b20 <env_run+0x64>  // b.none
ffffff8040084b00:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084b04:	91058000 	add	x0, x0, #0x160
ffffff8040084b08:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084b0c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084b10:	d2802202 	mov	x2, #0x110                 	// #272
ffffff8040084b14:	aa0003e1 	mov	x1, x0
ffffff8040084b18:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084b1c:	94000314 	bl	ffffff804008576c <bcopy>
ffffff8040084b20:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084b24:	91058000 	add	x0, x0, #0x160
ffffff8040084b28:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084b2c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084b30:	f100001f 	cmp	x0, #0x0
ffffff8040084b34:	540000e0 	b.eq	ffffff8040084b50 <env_run+0x94>  // b.none
ffffff8040084b38:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084b3c:	91058000 	add	x0, x0, #0x160
ffffff8040084b40:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084b44:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084b48:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040084b4c:	b9012801 	str	w1, [x0, #296]
ffffff8040084b50:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084b54:	91058000 	add	x0, x0, #0x160
ffffff8040084b58:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084b5c:	f9400fa2 	ldr	x2, [x29, #24]
ffffff8040084b60:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff8040084b64:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084b68:	91058000 	add	x0, x0, #0x160
ffffff8040084b6c:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084b70:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084b74:	b9402fa1 	ldr	w1, [x29, #44]
ffffff8040084b78:	b9014c01 	str	w1, [x0, #332]
ffffff8040084b7c:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084b80:	91058000 	add	x0, x0, #0x160
ffffff8040084b84:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084b88:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084b8c:	52800061 	mov	w1, #0x3                   	// #3
ffffff8040084b90:	b9012801 	str	w1, [x0, #296]
ffffff8040084b94:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084b98:	91058000 	add	x0, x0, #0x160
ffffff8040084b9c:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084ba0:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084ba4:	d2802202 	mov	x2, #0x110                 	// #272
ffffff8040084ba8:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040084bac:	940002f0 	bl	ffffff804008576c <bcopy>
ffffff8040084bb0:	d004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040084bb4:	91058000 	add	x0, x0, #0x160
ffffff8040084bb8:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084bbc:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084bc0:	f9409800 	ldr	x0, [x0, #304]
ffffff8040084bc4:	92407c00 	and	x0, x0, #0xffffffff
ffffff8040084bc8:	97ffffb0 	bl	ffffff8040084a88 <set_ttbr0>
ffffff8040084bcc:	97ffffb6 	bl	ffffff8040084aa4 <tlb_invalidate>
ffffff8040084bd0:	d503201f 	nop
ffffff8040084bd4:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040084bd8:	d65f03c0 	ret

ffffff8040084bdc <bit_extract>:
ffffff8040084bdc:	d10083ff 	sub	sp, sp, #0x20
ffffff8040084be0:	f9000fe0 	str	x0, [sp, #24]
ffffff8040084be4:	f9000be1 	str	x1, [sp, #16]
ffffff8040084be8:	f90007e2 	str	x2, [sp, #8]
ffffff8040084bec:	f9400be0 	ldr	x0, [sp, #16]
ffffff8040084bf0:	2a0003e1 	mov	w1, w0
ffffff8040084bf4:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040084bf8:	9ac12401 	lsr	x1, x0, x1
ffffff8040084bfc:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084c00:	2a0003e2 	mov	w2, w0
ffffff8040084c04:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
ffffff8040084c08:	9ac22000 	lsl	x0, x0, x2
ffffff8040084c0c:	aa2003e0 	mvn	x0, x0
ffffff8040084c10:	8a000020 	and	x0, x1, x0
ffffff8040084c14:	910083ff 	add	sp, sp, #0x20
ffffff8040084c18:	d65f03c0 	ret

ffffff8040084c1c <interrupts_arch_enable>:
ffffff8040084c1c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040084c20:	910003fd 	mov	x29, sp
ffffff8040084c24:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084c28:	b90017a1 	str	w1, [x29, #20]
ffffff8040084c2c:	b90013a2 	str	w2, [x29, #16]
ffffff8040084c30:	b94017a1 	ldr	w1, [x29, #20]
ffffff8040084c34:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084c38:	9400003e 	bl	ffffff8040084d30 <gicd_set_enable>
ffffff8040084c3c:	52800fe1 	mov	w1, #0x7f                  	// #127
ffffff8040084c40:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084c44:	9400005e 	bl	ffffff8040084dbc <gicd_set_prio>
ffffff8040084c48:	b94013a0 	ldr	w0, [x29, #16]
ffffff8040084c4c:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040084c50:	1ac02020 	lsl	w0, w1, w0
ffffff8040084c54:	12001c00 	and	w0, w0, #0xff
ffffff8040084c58:	2a0003e1 	mov	w1, w0
ffffff8040084c5c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084c60:	94000004 	bl	ffffff8040084c70 <gicd_set_trgt>
ffffff8040084c64:	d503201f 	nop
ffffff8040084c68:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040084c6c:	d65f03c0 	ret

ffffff8040084c70 <gicd_set_trgt>:
ffffff8040084c70:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040084c74:	f90007e0 	str	x0, [sp, #8]
ffffff8040084c78:	39001fe1 	strb	w1, [sp, #7]
ffffff8040084c7c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084c80:	d37df000 	lsl	x0, x0, #3
ffffff8040084c84:	d345fc00 	lsr	x0, x0, #5
ffffff8040084c88:	f90017e0 	str	x0, [sp, #40]
ffffff8040084c8c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084c90:	d37df000 	lsl	x0, x0, #3
ffffff8040084c94:	927d0400 	and	x0, x0, #0x18
ffffff8040084c98:	f90013e0 	str	x0, [sp, #32]
ffffff8040084c9c:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040084ca0:	2a0003e1 	mov	w1, w0
ffffff8040084ca4:	d2800020 	mov	x0, #0x1                   	// #1
ffffff8040084ca8:	9ac12000 	lsl	x0, x0, x1
ffffff8040084cac:	4b0003e1 	neg	w1, w0
ffffff8040084cb0:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040084cb4:	11002000 	add	w0, w0, #0x8
ffffff8040084cb8:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
ffffff8040084cbc:	9ac02040 	lsl	x0, x2, x0
ffffff8040084cc0:	2a2003e0 	mvn	w0, w0
ffffff8040084cc4:	0a000020 	and	w0, w1, w0
ffffff8040084cc8:	b9001fe0 	str	w0, [sp, #28]
ffffff8040084ccc:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084cd0:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084cd4:	f9400000 	ldr	x0, [x0]
ffffff8040084cd8:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040084cdc:	91080021 	add	x1, x1, #0x200
ffffff8040084ce0:	b8617801 	ldr	w1, [x0, x1, lsl #2]
ffffff8040084ce4:	b9401fe0 	ldr	w0, [sp, #28]
ffffff8040084ce8:	2a2003e0 	mvn	w0, w0
ffffff8040084cec:	0a000022 	and	w2, w1, w0
ffffff8040084cf0:	39401fe0 	ldrb	w0, [sp, #7]
ffffff8040084cf4:	f94013e1 	ldr	x1, [sp, #32]
ffffff8040084cf8:	1ac12000 	lsl	w0, w0, w1
ffffff8040084cfc:	2a0003e1 	mov	w1, w0
ffffff8040084d00:	b9401fe0 	ldr	w0, [sp, #28]
ffffff8040084d04:	0a000021 	and	w1, w1, w0
ffffff8040084d08:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084d0c:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084d10:	f9400000 	ldr	x0, [x0]
ffffff8040084d14:	2a010042 	orr	w2, w2, w1
ffffff8040084d18:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040084d1c:	91080021 	add	x1, x1, #0x200
ffffff8040084d20:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084d24:	d503201f 	nop
ffffff8040084d28:	9100c3ff 	add	sp, sp, #0x30
ffffff8040084d2c:	d65f03c0 	ret

ffffff8040084d30 <gicd_set_enable>:
ffffff8040084d30:	d10083ff 	sub	sp, sp, #0x20
ffffff8040084d34:	f90007e0 	str	x0, [sp, #8]
ffffff8040084d38:	b90007e1 	str	w1, [sp, #4]
ffffff8040084d3c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084d40:	d345fc00 	lsr	x0, x0, #5
ffffff8040084d44:	f9000fe0 	str	x0, [sp, #24]
ffffff8040084d48:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084d4c:	12001000 	and	w0, w0, #0x1f
ffffff8040084d50:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040084d54:	1ac02020 	lsl	w0, w1, w0
ffffff8040084d58:	2a0003e0 	mov	w0, w0
ffffff8040084d5c:	f9000be0 	str	x0, [sp, #16]
ffffff8040084d60:	b94007e0 	ldr	w0, [sp, #4]
ffffff8040084d64:	7100001f 	cmp	w0, #0x0
ffffff8040084d68:	54000140 	b.eq	ffffff8040084d90 <gicd_set_enable+0x60>  // b.none
ffffff8040084d6c:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084d70:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084d74:	f9400000 	ldr	x0, [x0]
ffffff8040084d78:	f9400be1 	ldr	x1, [sp, #16]
ffffff8040084d7c:	2a0103e2 	mov	w2, w1
ffffff8040084d80:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040084d84:	91010021 	add	x1, x1, #0x40
ffffff8040084d88:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084d8c:	14000009 	b	ffffff8040084db0 <gicd_set_enable+0x80>
ffffff8040084d90:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084d94:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084d98:	f9400000 	ldr	x0, [x0]
ffffff8040084d9c:	f9400be1 	ldr	x1, [sp, #16]
ffffff8040084da0:	2a0103e2 	mov	w2, w1
ffffff8040084da4:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040084da8:	91018021 	add	x1, x1, #0x60
ffffff8040084dac:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084db0:	d503201f 	nop
ffffff8040084db4:	910083ff 	add	sp, sp, #0x20
ffffff8040084db8:	d65f03c0 	ret

ffffff8040084dbc <gicd_set_prio>:
ffffff8040084dbc:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040084dc0:	f90007e0 	str	x0, [sp, #8]
ffffff8040084dc4:	39001fe1 	strb	w1, [sp, #7]
ffffff8040084dc8:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084dcc:	d37df000 	lsl	x0, x0, #3
ffffff8040084dd0:	d345fc00 	lsr	x0, x0, #5
ffffff8040084dd4:	f90017e0 	str	x0, [sp, #40]
ffffff8040084dd8:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084ddc:	d37df000 	lsl	x0, x0, #3
ffffff8040084de0:	927d0400 	and	x0, x0, #0x18
ffffff8040084de4:	f90013e0 	str	x0, [sp, #32]
ffffff8040084de8:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040084dec:	2a0003e1 	mov	w1, w0
ffffff8040084df0:	d2800020 	mov	x0, #0x1                   	// #1
ffffff8040084df4:	9ac12000 	lsl	x0, x0, x1
ffffff8040084df8:	cb0003e1 	neg	x1, x0
ffffff8040084dfc:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040084e00:	11002000 	add	w0, w0, #0x8
ffffff8040084e04:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
ffffff8040084e08:	9ac02040 	lsl	x0, x2, x0
ffffff8040084e0c:	aa2003e0 	mvn	x0, x0
ffffff8040084e10:	8a000020 	and	x0, x1, x0
ffffff8040084e14:	f9000fe0 	str	x0, [sp, #24]
ffffff8040084e18:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084e1c:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084e20:	f9400000 	ldr	x0, [x0]
ffffff8040084e24:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040084e28:	91040021 	add	x1, x1, #0x100
ffffff8040084e2c:	b8617801 	ldr	w1, [x0, x1, lsl #2]
ffffff8040084e30:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040084e34:	2a2003e0 	mvn	w0, w0
ffffff8040084e38:	0a000022 	and	w2, w1, w0
ffffff8040084e3c:	39401fe0 	ldrb	w0, [sp, #7]
ffffff8040084e40:	f94013e1 	ldr	x1, [sp, #32]
ffffff8040084e44:	1ac12000 	lsl	w0, w0, w1
ffffff8040084e48:	2a0003e1 	mov	w1, w0
ffffff8040084e4c:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040084e50:	0a000021 	and	w1, w1, w0
ffffff8040084e54:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084e58:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084e5c:	f9400000 	ldr	x0, [x0]
ffffff8040084e60:	2a010042 	orr	w2, w2, w1
ffffff8040084e64:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040084e68:	91040021 	add	x1, x1, #0x100
ffffff8040084e6c:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084e70:	d503201f 	nop
ffffff8040084e74:	9100c3ff 	add	sp, sp, #0x30
ffffff8040084e78:	d65f03c0 	ret

ffffff8040084e7c <gicd_init>:
ffffff8040084e7c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040084e80:	910003fd 	mov	x29, sp
ffffff8040084e84:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084e88:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084e8c:	f9400000 	ldr	x0, [x0]
ffffff8040084e90:	b9400400 	ldr	w0, [x0, #4]
ffffff8040084e94:	2a0003e0 	mov	w0, w0
ffffff8040084e98:	d28000a2 	mov	x2, #0x5                   	// #5
ffffff8040084e9c:	d2800001 	mov	x1, #0x0                   	// #0
ffffff8040084ea0:	97ffff4f 	bl	ffffff8040084bdc <bit_extract>
ffffff8040084ea4:	b90023a0 	str	w0, [x29, #32]
ffffff8040084ea8:	b94023a0 	ldr	w0, [x29, #32]
ffffff8040084eac:	531b6800 	lsl	w0, w0, #5
ffffff8040084eb0:	11000400 	add	w0, w0, #0x1
ffffff8040084eb4:	2a0003e0 	mov	w0, w0
ffffff8040084eb8:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084ebc:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040084ec0:	b9002fa0 	str	w0, [x29, #44]
ffffff8040084ec4:	14000019 	b	ffffff8040084f28 <gicd_init+0xac>
ffffff8040084ec8:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084ecc:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084ed0:	f9400000 	ldr	x0, [x0]
ffffff8040084ed4:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084ed8:	91018021 	add	x1, x1, #0x60
ffffff8040084edc:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040084ee0:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084ee4:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084ee8:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084eec:	f9400000 	ldr	x0, [x0]
ffffff8040084ef0:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084ef4:	91028021 	add	x1, x1, #0xa0
ffffff8040084ef8:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040084efc:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084f00:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084f04:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084f08:	f9400000 	ldr	x0, [x0]
ffffff8040084f0c:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084f10:	91038021 	add	x1, x1, #0xe0
ffffff8040084f14:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040084f18:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084f1c:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040084f20:	11000400 	add	w0, w0, #0x1
ffffff8040084f24:	b9002fa0 	str	w0, [x29, #44]
ffffff8040084f28:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084f2c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084f30:	d345fc00 	lsr	x0, x0, #5
ffffff8040084f34:	eb00003f 	cmp	x1, x0
ffffff8040084f38:	54fffc83 	b.cc	ffffff8040084ec8 <gicd_init+0x4c>  // b.lo, b.ul, b.last
ffffff8040084f3c:	52800400 	mov	w0, #0x20                  	// #32
ffffff8040084f40:	b9002ba0 	str	w0, [x29, #40]
ffffff8040084f44:	1400000b 	b	ffffff8040084f70 <gicd_init+0xf4>
ffffff8040084f48:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084f4c:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084f50:	f9400000 	ldr	x0, [x0]
ffffff8040084f54:	b9802ba1 	ldrsw	x1, [x29, #40]
ffffff8040084f58:	91040021 	add	x1, x1, #0x100
ffffff8040084f5c:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040084f60:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084f64:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040084f68:	11000400 	add	w0, w0, #0x1
ffffff8040084f6c:	b9002ba0 	str	w0, [x29, #40]
ffffff8040084f70:	b9802ba1 	ldrsw	x1, [x29, #40]
ffffff8040084f74:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084f78:	d37df000 	lsl	x0, x0, #3
ffffff8040084f7c:	d345fc00 	lsr	x0, x0, #5
ffffff8040084f80:	eb00003f 	cmp	x1, x0
ffffff8040084f84:	54fffe23 	b.cc	ffffff8040084f48 <gicd_init+0xcc>  // b.lo, b.ul, b.last
ffffff8040084f88:	52800400 	mov	w0, #0x20                  	// #32
ffffff8040084f8c:	b90027a0 	str	w0, [x29, #36]
ffffff8040084f90:	1400000a 	b	ffffff8040084fb8 <gicd_init+0x13c>
ffffff8040084f94:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084f98:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084f9c:	f9400000 	ldr	x0, [x0]
ffffff8040084fa0:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040084fa4:	91080021 	add	x1, x1, #0x200
ffffff8040084fa8:	b821781f 	str	wzr, [x0, x1, lsl #2]
ffffff8040084fac:	b94027a0 	ldr	w0, [x29, #36]
ffffff8040084fb0:	11000400 	add	w0, w0, #0x1
ffffff8040084fb4:	b90027a0 	str	w0, [x29, #36]
ffffff8040084fb8:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040084fbc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084fc0:	d37df000 	lsl	x0, x0, #3
ffffff8040084fc4:	d345fc00 	lsr	x0, x0, #5
ffffff8040084fc8:	eb00003f 	cmp	x1, x0
ffffff8040084fcc:	54fffe43 	b.cc	ffffff8040084f94 <gicd_init+0x118>  // b.lo, b.ul, b.last
ffffff8040084fd0:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084fd4:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084fd8:	f9400000 	ldr	x0, [x0]
ffffff8040084fdc:	b9400001 	ldr	w1, [x0]
ffffff8040084fe0:	b0000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040084fe4:	9106a000 	add	x0, x0, #0x1a8
ffffff8040084fe8:	f9400000 	ldr	x0, [x0]
ffffff8040084fec:	32000021 	orr	w1, w1, #0x1
ffffff8040084ff0:	b9000001 	str	w1, [x0]
ffffff8040084ff4:	d503201f 	nop
ffffff8040084ff8:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040084ffc:	d65f03c0 	ret

ffffff8040085000 <gicc_init>:
ffffff8040085000:	d10043ff 	sub	sp, sp, #0x10
ffffff8040085004:	b9000fff 	str	wzr, [sp, #12]
ffffff8040085008:	14000019 	b	ffffff804008506c <gicc_init+0x6c>
ffffff804008500c:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040085010:	9106a000 	add	x0, x0, #0x1a8
ffffff8040085014:	f9400000 	ldr	x0, [x0]
ffffff8040085018:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff804008501c:	91018021 	add	x1, x1, #0x60
ffffff8040085020:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040085024:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040085028:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff804008502c:	9106a000 	add	x0, x0, #0x1a8
ffffff8040085030:	f9400000 	ldr	x0, [x0]
ffffff8040085034:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040085038:	91028021 	add	x1, x1, #0xa0
ffffff804008503c:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040085040:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040085044:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040085048:	9106a000 	add	x0, x0, #0x1a8
ffffff804008504c:	f9400000 	ldr	x0, [x0]
ffffff8040085050:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040085054:	91038021 	add	x1, x1, #0xe0
ffffff8040085058:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff804008505c:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040085060:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040085064:	11000400 	add	w0, w0, #0x1
ffffff8040085068:	b9000fe0 	str	w0, [sp, #12]
ffffff804008506c:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040085070:	7100001f 	cmp	w0, #0x0
ffffff8040085074:	54fffcc0 	b.eq	ffffff804008500c <gicc_init+0xc>  // b.none
ffffff8040085078:	b9000bff 	str	wzr, [sp, #8]
ffffff804008507c:	1400000b 	b	ffffff80400850a8 <gicc_init+0xa8>
ffffff8040085080:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040085084:	9106a000 	add	x0, x0, #0x1a8
ffffff8040085088:	f9400000 	ldr	x0, [x0]
ffffff804008508c:	b9800be1 	ldrsw	x1, [sp, #8]
ffffff8040085090:	910f1021 	add	x1, x1, #0x3c4
ffffff8040085094:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040085098:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff804008509c:	b9400be0 	ldr	w0, [sp, #8]
ffffff80400850a0:	11000400 	add	w0, w0, #0x1
ffffff80400850a4:	b9000be0 	str	w0, [sp, #8]
ffffff80400850a8:	b9400be0 	ldr	w0, [sp, #8]
ffffff80400850ac:	71000c1f 	cmp	w0, #0x3
ffffff80400850b0:	54fffe89 	b.ls	ffffff8040085080 <gicc_init+0x80>  // b.plast
ffffff80400850b4:	b90007ff 	str	wzr, [sp, #4]
ffffff80400850b8:	1400000b 	b	ffffff80400850e4 <gicc_init+0xe4>
ffffff80400850bc:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400850c0:	9106a000 	add	x0, x0, #0x1a8
ffffff80400850c4:	f9400000 	ldr	x0, [x0]
ffffff80400850c8:	b98007e1 	ldrsw	x1, [sp, #4]
ffffff80400850cc:	91040021 	add	x1, x1, #0x100
ffffff80400850d0:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff80400850d4:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff80400850d8:	b94007e0 	ldr	w0, [sp, #4]
ffffff80400850dc:	11000400 	add	w0, w0, #0x1
ffffff80400850e0:	b90007e0 	str	w0, [sp, #4]
ffffff80400850e4:	b94007e0 	ldr	w0, [sp, #4]
ffffff80400850e8:	71001c1f 	cmp	w0, #0x7
ffffff80400850ec:	54fffe89 	b.ls	ffffff80400850bc <gicc_init+0xbc>  // b.plast
ffffff80400850f0:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400850f4:	9106c000 	add	x0, x0, #0x1b0
ffffff80400850f8:	f9400000 	ldr	x0, [x0]
ffffff80400850fc:	12800001 	mov	w1, #0xffffffff            	// #-1
ffffff8040085100:	b9000401 	str	w1, [x0, #4]
ffffff8040085104:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040085108:	9106c000 	add	x0, x0, #0x1b0
ffffff804008510c:	f9400000 	ldr	x0, [x0]
ffffff8040085110:	b9400002 	ldr	w2, [x0]
ffffff8040085114:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040085118:	9106c000 	add	x0, x0, #0x1b0
ffffff804008511c:	f9400000 	ldr	x0, [x0]
ffffff8040085120:	52804021 	mov	w1, #0x201                 	// #513
ffffff8040085124:	2a010041 	orr	w1, w2, w1
ffffff8040085128:	b9000001 	str	w1, [x0]
ffffff804008512c:	d503201f 	nop
ffffff8040085130:	910043ff 	add	sp, sp, #0x10
ffffff8040085134:	d65f03c0 	ret

ffffff8040085138 <timer_gic_init>:
ffffff8040085138:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff804008513c:	910003fd 	mov	x29, sp
ffffff8040085140:	b9001fa0 	str	w0, [x29, #28]
ffffff8040085144:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085148:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008514c:	d2800340 	mov	x0, #0x1a                  	// #26
ffffff8040085150:	97fffeb3 	bl	ffffff8040084c1c <interrupts_arch_enable>
ffffff8040085154:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085158:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008515c:	d2800360 	mov	x0, #0x1b                  	// #27
ffffff8040085160:	97fffeaf 	bl	ffffff8040084c1c <interrupts_arch_enable>
ffffff8040085164:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085168:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008516c:	d28003c0 	mov	x0, #0x1e                  	// #30
ffffff8040085170:	97fffeab 	bl	ffffff8040084c1c <interrupts_arch_enable>
ffffff8040085174:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085178:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008517c:	d2800380 	mov	x0, #0x1c                  	// #28
ffffff8040085180:	97fffea7 	bl	ffffff8040084c1c <interrupts_arch_enable>
ffffff8040085184:	d503201f 	nop
ffffff8040085188:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff804008518c:	d65f03c0 	ret

ffffff8040085190 <gic_handler>:
ffffff8040085190:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040085194:	910003fd 	mov	x29, sp
ffffff8040085198:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff804008519c:	9106c000 	add	x0, x0, #0x1b0
ffffff80400851a0:	f9400000 	ldr	x0, [x0]
ffffff80400851a4:	b9400c00 	ldr	w0, [x0, #12]
ffffff80400851a8:	2a0003e0 	mov	w0, w0
ffffff80400851ac:	f9000fa0 	str	x0, [x29, #24]
ffffff80400851b0:	d2800142 	mov	x2, #0xa                   	// #10
ffffff80400851b4:	d2800001 	mov	x1, #0x0                   	// #0
ffffff80400851b8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400851bc:	97fffe88 	bl	ffffff8040084bdc <bit_extract>
ffffff80400851c0:	f9000ba0 	str	x0, [x29, #16]
ffffff80400851c4:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400851c8:	f10ff41f 	cmp	x0, #0x3fd
ffffff80400851cc:	54000408 	b.hi	ffffff804008524c <gic_handler+0xbc>  // b.pmore
ffffff80400851d0:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400851d4:	f100781f 	cmp	x0, #0x1e
ffffff80400851d8:	54000140 	b.eq	ffffff8040085200 <gic_handler+0x70>  // b.none
ffffff80400851dc:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400851e0:	f100681f 	cmp	x0, #0x1a
ffffff80400851e4:	540000e0 	b.eq	ffffff8040085200 <gic_handler+0x70>  // b.none
ffffff80400851e8:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400851ec:	f1006c1f 	cmp	x0, #0x1b
ffffff80400851f0:	54000080 	b.eq	ffffff8040085200 <gic_handler+0x70>  // b.none
ffffff80400851f4:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400851f8:	f100701f 	cmp	x0, #0x1c
ffffff80400851fc:	540001c1 	b.ne	ffffff8040085234 <gic_handler+0xa4>  // b.any
ffffff8040085200:	94000844 	bl	ffffff8040087310 <sched_yield>
ffffff8040085204:	94000015 	bl	ffffff8040085258 <kclock_next>
ffffff8040085208:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff804008520c:	9106c000 	add	x0, x0, #0x1b0
ffffff8040085210:	f9400000 	ldr	x0, [x0]
ffffff8040085214:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040085218:	b9001001 	str	w1, [x0, #16]
ffffff804008521c:	90000020 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040085220:	9106c000 	add	x0, x0, #0x1b0
ffffff8040085224:	f9400000 	ldr	x0, [x0]
ffffff8040085228:	f9400fa1 	ldr	x1, [x29, #24]
ffffff804008522c:	b9100001 	str	w1, [x0, #4096]
ffffff8040085230:	14000008 	b	ffffff8040085250 <gic_handler+0xc0>
ffffff8040085234:	f0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040085238:	91350000 	add	x0, x0, #0xd40
ffffff804008523c:	f9400ba1 	ldr	x1, [x29, #16]
ffffff8040085240:	940007b1 	bl	ffffff8040087104 <printf>
ffffff8040085244:	d503201f 	nop
ffffff8040085248:	17ffffff 	b	ffffff8040085244 <gic_handler+0xb4>
ffffff804008524c:	d503201f 	nop
ffffff8040085250:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040085254:	d65f03c0 	ret

ffffff8040085258 <kclock_next>:
ffffff8040085258:	d10043ff 	sub	sp, sp, #0x10
ffffff804008525c:	d2a02000 	mov	x0, #0x1000000             	// #16777216
ffffff8040085260:	f90007e0 	str	x0, [sp, #8]
ffffff8040085264:	d53be220 	mrs	x0, cntp_ctl_el0
ffffff8040085268:	f90003e0 	str	x0, [sp]
ffffff804008526c:	f94003e0 	ldr	x0, [sp]
ffffff8040085270:	b2400000 	orr	x0, x0, #0x1
ffffff8040085274:	f90003e0 	str	x0, [sp]
ffffff8040085278:	f94003e0 	ldr	x0, [sp]
ffffff804008527c:	927ef800 	and	x0, x0, #0xfffffffffffffffd
ffffff8040085280:	f90003e0 	str	x0, [sp]
ffffff8040085284:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085288:	d51be200 	msr	cntp_tval_el0, x0
ffffff804008528c:	f94003e0 	ldr	x0, [sp]
ffffff8040085290:	d51be220 	msr	cntp_ctl_el0, x0
ffffff8040085294:	d503201f 	nop
ffffff8040085298:	910043ff 	add	sp, sp, #0x10
ffffff804008529c:	d65f03c0 	ret

ffffff80400852a0 <kclock_init>:
ffffff80400852a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff80400852a4:	910003fd 	mov	x29, sp
ffffff80400852a8:	97ffffec 	bl	ffffff8040085258 <kclock_next>
ffffff80400852ac:	d503201f 	nop
ffffff80400852b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
ffffff80400852b4:	d65f03c0 	ret

ffffff80400852b8 <is_elf_format>:
ffffff80400852b8:	d10083ff 	sub	sp, sp, #0x20
ffffff80400852bc:	f90007e0 	str	x0, [sp, #8]
ffffff80400852c0:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400852c4:	f9000fe0 	str	x0, [sp, #24]
ffffff80400852c8:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400852cc:	39400000 	ldrb	w0, [x0]
ffffff80400852d0:	7101fc1f 	cmp	w0, #0x7f
ffffff80400852d4:	540001e1 	b.ne	ffffff8040085310 <is_elf_format+0x58>  // b.any
ffffff80400852d8:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400852dc:	39400400 	ldrb	w0, [x0, #1]
ffffff80400852e0:	7101141f 	cmp	w0, #0x45
ffffff80400852e4:	54000161 	b.ne	ffffff8040085310 <is_elf_format+0x58>  // b.any
ffffff80400852e8:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400852ec:	39400800 	ldrb	w0, [x0, #2]
ffffff80400852f0:	7101301f 	cmp	w0, #0x4c
ffffff80400852f4:	540000e1 	b.ne	ffffff8040085310 <is_elf_format+0x58>  // b.any
ffffff80400852f8:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400852fc:	39400c00 	ldrb	w0, [x0, #3]
ffffff8040085300:	7101181f 	cmp	w0, #0x46
ffffff8040085304:	54000061 	b.ne	ffffff8040085310 <is_elf_format+0x58>  // b.any
ffffff8040085308:	52800020 	mov	w0, #0x1                   	// #1
ffffff804008530c:	14000002 	b	ffffff8040085314 <is_elf_format+0x5c>
ffffff8040085310:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085314:	910083ff 	add	sp, sp, #0x20
ffffff8040085318:	d65f03c0 	ret

ffffff804008531c <load_elf>:
ffffff804008531c:	a9b97bfd 	stp	x29, x30, [sp, #-112]!
ffffff8040085320:	910003fd 	mov	x29, sp
ffffff8040085324:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085328:	b90037a1 	str	w1, [x29, #52]
ffffff804008532c:	f90017a2 	str	x2, [x29, #40]
ffffff8040085330:	f90013a3 	str	x3, [x29, #32]
ffffff8040085334:	f9000fa4 	str	x4, [x29, #24]
ffffff8040085338:	f9401fa0 	ldr	x0, [x29, #56]
ffffff804008533c:	f9002fa0 	str	x0, [x29, #88]
ffffff8040085340:	f9002bbf 	str	xzr, [x29, #80]
ffffff8040085344:	f90037bf 	str	xzr, [x29, #104]
ffffff8040085348:	b94037a0 	ldr	w0, [x29, #52]
ffffff804008534c:	71000c1f 	cmp	w0, #0x3
ffffff8040085350:	540000ad 	b.le	ffffff8040085364 <load_elf+0x48>
ffffff8040085354:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085358:	97ffffd8 	bl	ffffff80400852b8 <is_elf_format>
ffffff804008535c:	7100001f 	cmp	w0, #0x0
ffffff8040085360:	54000061 	b.ne	ffffff804008536c <load_elf+0x50>  // b.any
ffffff8040085364:	12800000 	mov	w0, #0xffffffff            	// #-1
ffffff8040085368:	14000039 	b	ffffff804008544c <load_elf+0x130>
ffffff804008536c:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040085370:	f9401000 	ldr	x0, [x0, #32]
ffffff8040085374:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040085378:	8b000020 	add	x0, x1, x0
ffffff804008537c:	f90037a0 	str	x0, [x29, #104]
ffffff8040085380:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040085384:	79407000 	ldrh	w0, [x0, #56]
ffffff8040085388:	7900cfa0 	strh	w0, [x29, #102]
ffffff804008538c:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040085390:	79406c00 	ldrh	w0, [x0, #54]
ffffff8040085394:	79009fa0 	strh	w0, [x29, #78]
ffffff8040085398:	14000023 	b	ffffff8040085424 <load_elf+0x108>
ffffff804008539c:	f94037a0 	ldr	x0, [x29, #104]
ffffff80400853a0:	f9002ba0 	str	x0, [x29, #80]
ffffff80400853a4:	f9402ba0 	ldr	x0, [x29, #80]
ffffff80400853a8:	b9400000 	ldr	w0, [x0]
ffffff80400853ac:	7100041f 	cmp	w0, #0x1
ffffff80400853b0:	54000321 	b.ne	ffffff8040085414 <load_elf+0xf8>  // b.any
ffffff80400853b4:	f9402ba0 	ldr	x0, [x29, #80]
ffffff80400853b8:	f9400806 	ldr	x6, [x0, #16]
ffffff80400853bc:	f9402ba0 	ldr	x0, [x29, #80]
ffffff80400853c0:	f9401400 	ldr	x0, [x0, #40]
ffffff80400853c4:	2a0003e7 	mov	w7, w0
ffffff80400853c8:	f9402ba0 	ldr	x0, [x29, #80]
ffffff80400853cc:	f9400400 	ldr	x0, [x0, #8]
ffffff80400853d0:	f9401fa1 	ldr	x1, [x29, #56]
ffffff80400853d4:	8b000021 	add	x1, x1, x0
ffffff80400853d8:	f9402ba0 	ldr	x0, [x29, #80]
ffffff80400853dc:	f9401000 	ldr	x0, [x0, #32]
ffffff80400853e0:	f9400fa5 	ldr	x5, [x29, #24]
ffffff80400853e4:	f94013a4 	ldr	x4, [x29, #32]
ffffff80400853e8:	2a0003e3 	mov	w3, w0
ffffff80400853ec:	aa0103e2 	mov	x2, x1
ffffff80400853f0:	2a0703e1 	mov	w1, w7
ffffff80400853f4:	aa0603e0 	mov	x0, x6
ffffff80400853f8:	d63f00a0 	blr	x5
ffffff80400853fc:	b9004ba0 	str	w0, [x29, #72]
ffffff8040085400:	b9404ba0 	ldr	w0, [x29, #72]
ffffff8040085404:	7100001f 	cmp	w0, #0x0
ffffff8040085408:	5400006a 	b.ge	ffffff8040085414 <load_elf+0xf8>  // b.tcont
ffffff804008540c:	b9404ba0 	ldr	w0, [x29, #72]
ffffff8040085410:	1400000f 	b	ffffff804008544c <load_elf+0x130>
ffffff8040085414:	79409fa0 	ldrh	w0, [x29, #78]
ffffff8040085418:	f94037a1 	ldr	x1, [x29, #104]
ffffff804008541c:	8b000020 	add	x0, x1, x0
ffffff8040085420:	f90037a0 	str	x0, [x29, #104]
ffffff8040085424:	7940cfa0 	ldrh	w0, [x29, #102]
ffffff8040085428:	51000401 	sub	w1, w0, #0x1
ffffff804008542c:	7900cfa1 	strh	w1, [x29, #102]
ffffff8040085430:	7100001f 	cmp	w0, #0x0
ffffff8040085434:	54fffb41 	b.ne	ffffff804008539c <load_elf+0x80>  // b.any
ffffff8040085438:	f9402fa0 	ldr	x0, [x29, #88]
ffffff804008543c:	f9400c01 	ldr	x1, [x0, #24]
ffffff8040085440:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085444:	f9000001 	str	x1, [x0]
ffffff8040085448:	52800000 	mov	w0, #0x0                   	// #0
ffffff804008544c:	a8c77bfd 	ldp	x29, x30, [sp], #112
ffffff8040085450:	d65f03c0 	ret

ffffff8040085454 <page2ppn>:
ffffff8040085454:	d10043ff 	sub	sp, sp, #0x10
ffffff8040085458:	f90007e0 	str	x0, [sp, #8]
ffffff804008545c:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040085460:	b004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040085464:	91062000 	add	x0, x0, #0x188
ffffff8040085468:	cb000020 	sub	x0, x1, x0
ffffff804008546c:	9343fc01 	asr	x1, x0, #3
ffffff8040085470:	b201f3e0 	mov	x0, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
ffffff8040085474:	f2955560 	movk	x0, #0xaaab
ffffff8040085478:	9b007c20 	mul	x0, x1, x0
ffffff804008547c:	910043ff 	add	sp, sp, #0x10
ffffff8040085480:	d65f03c0 	ret

ffffff8040085484 <page2pa>:
ffffff8040085484:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040085488:	910003fd 	mov	x29, sp
ffffff804008548c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040085490:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085494:	97fffff0 	bl	ffffff8040085454 <page2ppn>
ffffff8040085498:	d374cc00 	lsl	x0, x0, #12
ffffff804008549c:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff80400854a0:	d65f03c0 	ret

ffffff80400854a4 <page2kva>:
ffffff80400854a4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff80400854a8:	910003fd 	mov	x29, sp
ffffff80400854ac:	f9000fa0 	str	x0, [x29, #24]
ffffff80400854b0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400854b4:	97ffffe8 	bl	ffffff8040085454 <page2ppn>
ffffff80400854b8:	d374cc00 	lsl	x0, x0, #12
ffffff80400854bc:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff80400854c0:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff80400854c4:	d65f03c0 	ret

ffffff80400854c8 <pa2page>:
ffffff80400854c8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff80400854cc:	910003fd 	mov	x29, sp
ffffff80400854d0:	f9000fa0 	str	x0, [x29, #24]
ffffff80400854d4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400854d8:	d34cfc00 	lsr	x0, x0, #12
ffffff80400854dc:	92406801 	and	x1, x0, #0x7ffffff
ffffff80400854e0:	12bfff40 	mov	w0, #0x5ffff               	// #393215
ffffff80400854e4:	eb00003f 	cmp	x1, x0
ffffff80400854e8:	54000129 	b.ls	ffffff804008550c <pa2page+0x44>  // b.plast
ffffff80400854ec:	f0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400854f0:	9135c001 	add	x1, x0, #0xd70
ffffff80400854f4:	f0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400854f8:	91366000 	add	x0, x0, #0xd98
ffffff80400854fc:	f9400fa3 	ldr	x3, [x29, #24]
ffffff8040085500:	aa0103e2 	mov	x2, x1
ffffff8040085504:	528003e1 	mov	w1, #0x1f                  	// #31
ffffff8040085508:	94000728 	bl	ffffff80400871a8 <_panic>
ffffff804008550c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085510:	d34cfc00 	lsr	x0, x0, #12
ffffff8040085514:	92406801 	and	x1, x0, #0x7ffffff
ffffff8040085518:	aa0103e0 	mov	x0, x1
ffffff804008551c:	d37ff800 	lsl	x0, x0, #1
ffffff8040085520:	8b010000 	add	x0, x0, x1
ffffff8040085524:	d37df000 	lsl	x0, x0, #3
ffffff8040085528:	b004b501 	adrp	x1, ffffff8049726000 <envs+0x61eb8>
ffffff804008552c:	91062021 	add	x1, x1, #0x188
ffffff8040085530:	8b010000 	add	x0, x0, x1
ffffff8040085534:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040085538:	d65f03c0 	ret

ffffff804008553c <page_init>:
ffffff804008553c:	d10083ff 	sub	sp, sp, #0x20
ffffff8040085540:	f90007e0 	str	x0, [sp, #8]
ffffff8040085544:	b004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040085548:	91060000 	add	x0, x0, #0x180
ffffff804008554c:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040085550:	f9000001 	str	x1, [x0]
ffffff8040085554:	900002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040085558:	910aa000 	add	x0, x0, #0x2a8
ffffff804008555c:	f900001f 	str	xzr, [x0]
ffffff8040085560:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085564:	d34cfc00 	lsr	x0, x0, #12
ffffff8040085568:	f9000be0 	str	x0, [sp, #16]
ffffff804008556c:	f9000fff 	str	xzr, [sp, #24]
ffffff8040085570:	1400000e 	b	ffffff80400855a8 <page_init+0x6c>
ffffff8040085574:	b004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040085578:	91062002 	add	x2, x0, #0x188
ffffff804008557c:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085580:	aa0103e0 	mov	x0, x1
ffffff8040085584:	d37ff800 	lsl	x0, x0, #1
ffffff8040085588:	8b010000 	add	x0, x0, x1
ffffff804008558c:	d37df000 	lsl	x0, x0, #3
ffffff8040085590:	8b000040 	add	x0, x2, x0
ffffff8040085594:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040085598:	79002001 	strh	w1, [x0, #16]
ffffff804008559c:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400855a0:	91000400 	add	x0, x0, #0x1
ffffff80400855a4:	f9000fe0 	str	x0, [sp, #24]
ffffff80400855a8:	f9400fe1 	ldr	x1, [sp, #24]
ffffff80400855ac:	f9400be0 	ldr	x0, [sp, #16]
ffffff80400855b0:	eb00003f 	cmp	x1, x0
ffffff80400855b4:	54fffe03 	b.cc	ffffff8040085574 <page_init+0x38>  // b.lo, b.ul, b.last
ffffff80400855b8:	f9400be0 	ldr	x0, [sp, #16]
ffffff80400855bc:	f9000fe0 	str	x0, [sp, #24]
ffffff80400855c0:	14000046 	b	ffffff80400856d8 <page_init+0x19c>
ffffff80400855c4:	b004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400855c8:	91062002 	add	x2, x0, #0x188
ffffff80400855cc:	f9400fe1 	ldr	x1, [sp, #24]
ffffff80400855d0:	aa0103e0 	mov	x0, x1
ffffff80400855d4:	d37ff800 	lsl	x0, x0, #1
ffffff80400855d8:	8b010000 	add	x0, x0, x1
ffffff80400855dc:	d37df000 	lsl	x0, x0, #3
ffffff80400855e0:	8b000040 	add	x0, x2, x0
ffffff80400855e4:	7900201f 	strh	wzr, [x0, #16]
ffffff80400855e8:	900002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400855ec:	910aa000 	add	x0, x0, #0x2a8
ffffff80400855f0:	f9400002 	ldr	x2, [x0]
ffffff80400855f4:	b004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400855f8:	91062003 	add	x3, x0, #0x188
ffffff80400855fc:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085600:	aa0103e0 	mov	x0, x1
ffffff8040085604:	d37ff800 	lsl	x0, x0, #1
ffffff8040085608:	8b010000 	add	x0, x0, x1
ffffff804008560c:	d37df000 	lsl	x0, x0, #3
ffffff8040085610:	8b000060 	add	x0, x3, x0
ffffff8040085614:	f9000002 	str	x2, [x0]
ffffff8040085618:	b004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff804008561c:	91062002 	add	x2, x0, #0x188
ffffff8040085620:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085624:	aa0103e0 	mov	x0, x1
ffffff8040085628:	d37ff800 	lsl	x0, x0, #1
ffffff804008562c:	8b010000 	add	x0, x0, x1
ffffff8040085630:	d37df000 	lsl	x0, x0, #3
ffffff8040085634:	8b000040 	add	x0, x2, x0
ffffff8040085638:	f9400000 	ldr	x0, [x0]
ffffff804008563c:	f100001f 	cmp	x0, #0x0
ffffff8040085640:	540001a0 	b.eq	ffffff8040085674 <page_init+0x138>  // b.none
ffffff8040085644:	900002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040085648:	910aa000 	add	x0, x0, #0x2a8
ffffff804008564c:	f9400002 	ldr	x2, [x0]
ffffff8040085650:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085654:	aa0103e0 	mov	x0, x1
ffffff8040085658:	d37ff800 	lsl	x0, x0, #1
ffffff804008565c:	8b010000 	add	x0, x0, x1
ffffff8040085660:	d37df000 	lsl	x0, x0, #3
ffffff8040085664:	b004b501 	adrp	x1, ffffff8049726000 <envs+0x61eb8>
ffffff8040085668:	91062021 	add	x1, x1, #0x188
ffffff804008566c:	8b010000 	add	x0, x0, x1
ffffff8040085670:	f9000440 	str	x0, [x2, #8]
ffffff8040085674:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085678:	aa0103e0 	mov	x0, x1
ffffff804008567c:	d37ff800 	lsl	x0, x0, #1
ffffff8040085680:	8b010000 	add	x0, x0, x1
ffffff8040085684:	d37df000 	lsl	x0, x0, #3
ffffff8040085688:	b004b501 	adrp	x1, ffffff8049726000 <envs+0x61eb8>
ffffff804008568c:	91062021 	add	x1, x1, #0x188
ffffff8040085690:	8b010001 	add	x1, x0, x1
ffffff8040085694:	900002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040085698:	910aa000 	add	x0, x0, #0x2a8
ffffff804008569c:	f9000001 	str	x1, [x0]
ffffff80400856a0:	b004b500 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400856a4:	91062002 	add	x2, x0, #0x188
ffffff80400856a8:	f9400fe1 	ldr	x1, [sp, #24]
ffffff80400856ac:	aa0103e0 	mov	x0, x1
ffffff80400856b0:	d37ff800 	lsl	x0, x0, #1
ffffff80400856b4:	8b010000 	add	x0, x0, x1
ffffff80400856b8:	d37df000 	lsl	x0, x0, #3
ffffff80400856bc:	8b000040 	add	x0, x2, x0
ffffff80400856c0:	900002a1 	adrp	x1, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400856c4:	910aa021 	add	x1, x1, #0x2a8
ffffff80400856c8:	f9000401 	str	x1, [x0, #8]
ffffff80400856cc:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400856d0:	91000400 	add	x0, x0, #0x1
ffffff80400856d4:	f9000fe0 	str	x0, [sp, #24]
ffffff80400856d8:	f9400fe1 	ldr	x1, [sp, #24]
ffffff80400856dc:	12bfff40 	mov	w0, #0x5ffff               	// #393215
ffffff80400856e0:	eb00003f 	cmp	x1, x0
ffffff80400856e4:	54fff709 	b.ls	ffffff80400855c4 <page_init+0x88>  // b.plast
ffffff80400856e8:	d503201f 	nop
ffffff80400856ec:	910083ff 	add	sp, sp, #0x20
ffffff80400856f0:	d65f03c0 	ret

ffffff80400856f4 <bzero>:
ffffff80400856f4:	d10083ff 	sub	sp, sp, #0x20
ffffff80400856f8:	f90007e0 	str	x0, [sp, #8]
ffffff80400856fc:	f90003e1 	str	x1, [sp]
ffffff8040085700:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085704:	f94003e1 	ldr	x1, [sp]
ffffff8040085708:	8b000020 	add	x0, x1, x0
ffffff804008570c:	f9000fe0 	str	x0, [sp, #24]
ffffff8040085710:	14000006 	b	ffffff8040085728 <bzero+0x34>
ffffff8040085714:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085718:	f900001f 	str	xzr, [x0]
ffffff804008571c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085720:	91002000 	add	x0, x0, #0x8
ffffff8040085724:	f90007e0 	str	x0, [sp, #8]
ffffff8040085728:	f94007e0 	ldr	x0, [sp, #8]
ffffff804008572c:	91001c00 	add	x0, x0, #0x7
ffffff8040085730:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085734:	eb00003f 	cmp	x1, x0
ffffff8040085738:	54fffee8 	b.hi	ffffff8040085714 <bzero+0x20>  // b.pmore
ffffff804008573c:	14000005 	b	ffffff8040085750 <bzero+0x5c>
ffffff8040085740:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085744:	91000401 	add	x1, x0, #0x1
ffffff8040085748:	f90007e1 	str	x1, [sp, #8]
ffffff804008574c:	3900001f 	strb	wzr, [x0]
ffffff8040085750:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085754:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085758:	eb00003f 	cmp	x1, x0
ffffff804008575c:	54ffff28 	b.hi	ffffff8040085740 <bzero+0x4c>  // b.pmore
ffffff8040085760:	d503201f 	nop
ffffff8040085764:	910083ff 	add	sp, sp, #0x20
ffffff8040085768:	d65f03c0 	ret

ffffff804008576c <bcopy>:
ffffff804008576c:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040085770:	f9000fe0 	str	x0, [sp, #24]
ffffff8040085774:	f9000be1 	str	x1, [sp, #16]
ffffff8040085778:	f90007e2 	str	x2, [sp, #8]
ffffff804008577c:	f9400be0 	ldr	x0, [sp, #16]
ffffff8040085780:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040085784:	8b000020 	add	x0, x1, x0
ffffff8040085788:	f90017e0 	str	x0, [sp, #40]
ffffff804008578c:	1400000b 	b	ffffff80400857b8 <bcopy+0x4c>
ffffff8040085790:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040085794:	f9400001 	ldr	x1, [x0]
ffffff8040085798:	f9400be0 	ldr	x0, [sp, #16]
ffffff804008579c:	f9000001 	str	x1, [x0]
ffffff80400857a0:	f9400be0 	ldr	x0, [sp, #16]
ffffff80400857a4:	91002000 	add	x0, x0, #0x8
ffffff80400857a8:	f9000be0 	str	x0, [sp, #16]
ffffff80400857ac:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400857b0:	91002000 	add	x0, x0, #0x8
ffffff80400857b4:	f9000fe0 	str	x0, [sp, #24]
ffffff80400857b8:	f9400be0 	ldr	x0, [sp, #16]
ffffff80400857bc:	91001c00 	add	x0, x0, #0x7
ffffff80400857c0:	f94017e1 	ldr	x1, [sp, #40]
ffffff80400857c4:	eb00003f 	cmp	x1, x0
ffffff80400857c8:	54fffe48 	b.hi	ffffff8040085790 <bcopy+0x24>  // b.pmore
ffffff80400857cc:	1400000b 	b	ffffff80400857f8 <bcopy+0x8c>
ffffff80400857d0:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400857d4:	39400001 	ldrb	w1, [x0]
ffffff80400857d8:	f9400be0 	ldr	x0, [sp, #16]
ffffff80400857dc:	39000001 	strb	w1, [x0]
ffffff80400857e0:	f9400be0 	ldr	x0, [sp, #16]
ffffff80400857e4:	91000400 	add	x0, x0, #0x1
ffffff80400857e8:	f9000be0 	str	x0, [sp, #16]
ffffff80400857ec:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400857f0:	91000400 	add	x0, x0, #0x1
ffffff80400857f4:	f9000fe0 	str	x0, [sp, #24]
ffffff80400857f8:	f9400be0 	ldr	x0, [sp, #16]
ffffff80400857fc:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040085800:	eb00003f 	cmp	x1, x0
ffffff8040085804:	54fffe68 	b.hi	ffffff80400857d0 <bcopy+0x64>  // b.pmore
ffffff8040085808:	d503201f 	nop
ffffff804008580c:	9100c3ff 	add	sp, sp, #0x30
ffffff8040085810:	d65f03c0 	ret

ffffff8040085814 <page_alloc>:
ffffff8040085814:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040085818:	910003fd 	mov	x29, sp
ffffff804008581c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040085820:	900002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040085824:	910aa000 	add	x0, x0, #0x2a8
ffffff8040085828:	f9400000 	ldr	x0, [x0]
ffffff804008582c:	f90017a0 	str	x0, [x29, #40]
ffffff8040085830:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085834:	f100001f 	cmp	x0, #0x0
ffffff8040085838:	54000101 	b.ne	ffffff8040085858 <page_alloc+0x44>  // b.any
ffffff804008583c:	f0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040085840:	9136e001 	add	x1, x0, #0xdb8
ffffff8040085844:	f0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040085848:	91374000 	add	x0, x0, #0xdd0
ffffff804008584c:	aa0103e2 	mov	x2, x1
ffffff8040085850:	528006a1 	mov	w1, #0x35                  	// #53
ffffff8040085854:	94000655 	bl	ffffff80400871a8 <_panic>
ffffff8040085858:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008585c:	f9400000 	ldr	x0, [x0]
ffffff8040085860:	f100001f 	cmp	x0, #0x0
ffffff8040085864:	540000c0 	b.eq	ffffff804008587c <page_alloc+0x68>  // b.none
ffffff8040085868:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008586c:	f9400000 	ldr	x0, [x0]
ffffff8040085870:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085874:	f9400421 	ldr	x1, [x1, #8]
ffffff8040085878:	f9000401 	str	x1, [x0, #8]
ffffff804008587c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085880:	f9400400 	ldr	x0, [x0, #8]
ffffff8040085884:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085888:	f9400021 	ldr	x1, [x1]
ffffff804008588c:	f9000001 	str	x1, [x0]
ffffff8040085890:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085894:	97ffff04 	bl	ffffff80400854a4 <page2kva>
ffffff8040085898:	d2820001 	mov	x1, #0x1000                	// #4096
ffffff804008589c:	97ffff96 	bl	ffffff80400856f4 <bzero>
ffffff80400858a0:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400858a4:	7900201f 	strh	wzr, [x0, #16]
ffffff80400858a8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400858ac:	f94017a1 	ldr	x1, [x29, #40]
ffffff80400858b0:	f9000001 	str	x1, [x0]
ffffff80400858b4:	52800000 	mov	w0, #0x0                   	// #0
ffffff80400858b8:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400858bc:	d65f03c0 	ret

ffffff80400858c0 <page_free>:
ffffff80400858c0:	d10043ff 	sub	sp, sp, #0x10
ffffff80400858c4:	f90007e0 	str	x0, [sp, #8]
ffffff80400858c8:	b90007e1 	str	w1, [sp, #4]
ffffff80400858cc:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400858d0:	79402000 	ldrh	w0, [x0, #16]
ffffff80400858d4:	7100001f 	cmp	w0, #0x0
ffffff80400858d8:	54000321 	b.ne	ffffff804008593c <page_free+0x7c>  // b.any
ffffff80400858dc:	900002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff80400858e0:	910aa000 	add	x0, x0, #0x2a8
ffffff80400858e4:	f9400001 	ldr	x1, [x0]
ffffff80400858e8:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400858ec:	f9000001 	str	x1, [x0]
ffffff80400858f0:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400858f4:	f9400000 	ldr	x0, [x0]
ffffff80400858f8:	f100001f 	cmp	x0, #0x0
ffffff80400858fc:	540000c0 	b.eq	ffffff8040085914 <page_free+0x54>  // b.none
ffffff8040085900:	900002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040085904:	910aa000 	add	x0, x0, #0x2a8
ffffff8040085908:	f9400000 	ldr	x0, [x0]
ffffff804008590c:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040085910:	f9000401 	str	x1, [x0, #8]
ffffff8040085914:	900002a0 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040085918:	910aa000 	add	x0, x0, #0x2a8
ffffff804008591c:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040085920:	f9000001 	str	x1, [x0]
ffffff8040085924:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085928:	900002a1 	adrp	x1, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff804008592c:	910aa021 	add	x1, x1, #0x2a8
ffffff8040085930:	f9000401 	str	x1, [x0, #8]
ffffff8040085934:	d503201f 	nop
ffffff8040085938:	14000002 	b	ffffff8040085940 <page_free+0x80>
ffffff804008593c:	d503201f 	nop
ffffff8040085940:	910043ff 	add	sp, sp, #0x10
ffffff8040085944:	d65f03c0 	ret

ffffff8040085948 <pgdir_walk>:
ffffff8040085948:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff804008594c:	910003fd 	mov	x29, sp
ffffff8040085950:	f90017a0 	str	x0, [x29, #40]
ffffff8040085954:	f90013a1 	str	x1, [x29, #32]
ffffff8040085958:	b9001fa2 	str	w2, [x29, #28]
ffffff804008595c:	f9000ba3 	str	x3, [x29, #16]
ffffff8040085960:	b9001ba4 	str	w4, [x29, #24]
ffffff8040085964:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085968:	d35efc00 	lsr	x0, x0, #30
ffffff804008596c:	92402000 	and	x0, x0, #0x1ff
ffffff8040085970:	d37df000 	lsl	x0, x0, #3
ffffff8040085974:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085978:	8b000020 	add	x0, x1, x0
ffffff804008597c:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040085980:	f90027a0 	str	x0, [x29, #72]
ffffff8040085984:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085988:	f9400000 	ldr	x0, [x0]
ffffff804008598c:	92400400 	and	x0, x0, #0x3
ffffff8040085990:	f100001f 	cmp	x0, #0x0
ffffff8040085994:	54000401 	b.ne	ffffff8040085a14 <pgdir_walk+0xcc>  // b.any
ffffff8040085998:	b9401fa0 	ldr	w0, [x29, #28]
ffffff804008599c:	7100001f 	cmp	w0, #0x0
ffffff80400859a0:	540000a1 	b.ne	ffffff80400859b4 <pgdir_walk+0x6c>  // b.any
ffffff80400859a4:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400859a8:	f900001f 	str	xzr, [x0]
ffffff80400859ac:	52800000 	mov	w0, #0x0                   	// #0
ffffff80400859b0:	14000059 	b	ffffff8040085b14 <pgdir_walk+0x1cc>
ffffff80400859b4:	9100c3a0 	add	x0, x29, #0x30
ffffff80400859b8:	97ffff97 	bl	ffffff8040085814 <page_alloc>
ffffff80400859bc:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400859c0:	97fffeb1 	bl	ffffff8040085484 <page2pa>
ffffff80400859c4:	b2400401 	orr	x1, x0, #0x3
ffffff80400859c8:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400859cc:	f9000001 	str	x1, [x0]
ffffff80400859d0:	f9401ba5 	ldr	x5, [x29, #48]
ffffff80400859d4:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400859d8:	d35efc00 	lsr	x0, x0, #30
ffffff80400859dc:	d374cc00 	lsl	x0, x0, #12
ffffff80400859e0:	92742001 	and	x1, x0, #0x1ff000
ffffff80400859e4:	d2a80000 	mov	x0, #0x40000000            	// #1073741824
ffffff80400859e8:	f2c00e00 	movk	x0, #0x70, lsl #32
ffffff80400859ec:	8b000020 	add	x0, x1, x0
ffffff80400859f0:	b9401ba4 	ldr	w4, [x29, #24]
ffffff80400859f4:	d2801803 	mov	x3, #0xc0                  	// #192
ffffff80400859f8:	aa0003e2 	mov	x2, x0
ffffff80400859fc:	aa0503e1 	mov	x1, x5
ffffff8040085a00:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085a04:	94000046 	bl	ffffff8040085b1c <page_insert>
ffffff8040085a08:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085a0c:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040085a10:	79002001 	strh	w1, [x0, #16]
ffffff8040085a14:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085a18:	d355fc00 	lsr	x0, x0, #21
ffffff8040085a1c:	92402000 	and	x0, x0, #0x1ff
ffffff8040085a20:	d37df001 	lsl	x1, x0, #3
ffffff8040085a24:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085a28:	f9400000 	ldr	x0, [x0]
ffffff8040085a2c:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040085a30:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040085a34:	8b000020 	add	x0, x1, x0
ffffff8040085a38:	f90023a0 	str	x0, [x29, #64]
ffffff8040085a3c:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040085a40:	f9400000 	ldr	x0, [x0]
ffffff8040085a44:	92400400 	and	x0, x0, #0x3
ffffff8040085a48:	f100001f 	cmp	x0, #0x0
ffffff8040085a4c:	54000481 	b.ne	ffffff8040085adc <pgdir_walk+0x194>  // b.any
ffffff8040085a50:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040085a54:	7100001f 	cmp	w0, #0x0
ffffff8040085a58:	540000a1 	b.ne	ffffff8040085a6c <pgdir_walk+0x124>  // b.any
ffffff8040085a5c:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040085a60:	f900001f 	str	xzr, [x0]
ffffff8040085a64:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085a68:	1400002b 	b	ffffff8040085b14 <pgdir_walk+0x1cc>
ffffff8040085a6c:	9100c3a0 	add	x0, x29, #0x30
ffffff8040085a70:	97ffff69 	bl	ffffff8040085814 <page_alloc>
ffffff8040085a74:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085a78:	97fffe83 	bl	ffffff8040085484 <page2pa>
ffffff8040085a7c:	b2400401 	orr	x1, x0, #0x3
ffffff8040085a80:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040085a84:	f9000001 	str	x1, [x0]
ffffff8040085a88:	f9401ba5 	ldr	x5, [x29, #48]
ffffff8040085a8c:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085a90:	d35efc00 	lsr	x0, x0, #30
ffffff8040085a94:	d36ba800 	lsl	x0, x0, #21
ffffff8040085a98:	926b2001 	and	x1, x0, #0x3fe00000
ffffff8040085a9c:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085aa0:	d355fc00 	lsr	x0, x0, #21
ffffff8040085aa4:	d374cc00 	lsl	x0, x0, #12
ffffff8040085aa8:	92742000 	and	x0, x0, #0x1ff000
ffffff8040085aac:	aa000021 	orr	x1, x1, x0
ffffff8040085ab0:	d2c00e00 	mov	x0, #0x7000000000          	// #481036337152
ffffff8040085ab4:	8b000020 	add	x0, x1, x0
ffffff8040085ab8:	b9401ba4 	ldr	w4, [x29, #24]
ffffff8040085abc:	d2801803 	mov	x3, #0xc0                  	// #192
ffffff8040085ac0:	aa0003e2 	mov	x2, x0
ffffff8040085ac4:	aa0503e1 	mov	x1, x5
ffffff8040085ac8:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085acc:	94000014 	bl	ffffff8040085b1c <page_insert>
ffffff8040085ad0:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085ad4:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040085ad8:	79002001 	strh	w1, [x0, #16]
ffffff8040085adc:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085ae0:	d34cfc00 	lsr	x0, x0, #12
ffffff8040085ae4:	92402000 	and	x0, x0, #0x1ff
ffffff8040085ae8:	d37df001 	lsl	x1, x0, #3
ffffff8040085aec:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040085af0:	f9400000 	ldr	x0, [x0]
ffffff8040085af4:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040085af8:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040085afc:	8b000020 	add	x0, x1, x0
ffffff8040085b00:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085b04:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040085b08:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040085b0c:	f9000001 	str	x1, [x0]
ffffff8040085b10:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085b14:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff8040085b18:	d65f03c0 	ret

ffffff8040085b1c <page_insert>:
ffffff8040085b1c:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
ffffff8040085b20:	910003fd 	mov	x29, sp
ffffff8040085b24:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085b28:	f9001ba1 	str	x1, [x29, #48]
ffffff8040085b2c:	f90017a2 	str	x2, [x29, #40]
ffffff8040085b30:	f90013a3 	str	x3, [x29, #32]
ffffff8040085b34:	b9001fa4 	str	w4, [x29, #28]
ffffff8040085b38:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040085b3c:	d280e060 	mov	x0, #0x703                 	// #1795
ffffff8040085b40:	aa000020 	orr	x0, x1, x0
ffffff8040085b44:	f9002fa0 	str	x0, [x29, #88]
ffffff8040085b48:	910123a0 	add	x0, x29, #0x48
ffffff8040085b4c:	b9401fa4 	ldr	w4, [x29, #28]
ffffff8040085b50:	aa0003e3 	mov	x3, x0
ffffff8040085b54:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040085b58:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085b5c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085b60:	97ffff7a 	bl	ffffff8040085948 <pgdir_walk>
ffffff8040085b64:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085b68:	f9400000 	ldr	x0, [x0]
ffffff8040085b6c:	92400400 	and	x0, x0, #0x3
ffffff8040085b70:	f100001f 	cmp	x0, #0x0
ffffff8040085b74:	540002e0 	b.eq	ffffff8040085bd0 <page_insert+0xb4>  // b.none
ffffff8040085b78:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085b7c:	f9400000 	ldr	x0, [x0]
ffffff8040085b80:	97fffe52 	bl	ffffff80400854c8 <pa2page>
ffffff8040085b84:	aa0003e1 	mov	x1, x0
ffffff8040085b88:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085b8c:	eb01001f 	cmp	x0, x1
ffffff8040085b90:	540000c0 	b.eq	ffffff8040085ba8 <page_insert+0x8c>  // b.none
ffffff8040085b94:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085b98:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085b9c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085ba0:	9400006a 	bl	ffffff8040085d48 <page_remove>
ffffff8040085ba4:	1400000b 	b	ffffff8040085bd0 <page_insert+0xb4>
ffffff8040085ba8:	97fffbbf 	bl	ffffff8040084aa4 <tlb_invalidate>
ffffff8040085bac:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085bb0:	97fffe35 	bl	ffffff8040085484 <page2pa>
ffffff8040085bb4:	aa0003e2 	mov	x2, x0
ffffff8040085bb8:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085bbc:	f9402fa1 	ldr	x1, [x29, #88]
ffffff8040085bc0:	aa010041 	orr	x1, x2, x1
ffffff8040085bc4:	f9000001 	str	x1, [x0]
ffffff8040085bc8:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085bcc:	14000022 	b	ffffff8040085c54 <page_insert+0x138>
ffffff8040085bd0:	97fffbb5 	bl	ffffff8040084aa4 <tlb_invalidate>
ffffff8040085bd4:	910123a0 	add	x0, x29, #0x48
ffffff8040085bd8:	b9401fa4 	ldr	w4, [x29, #28]
ffffff8040085bdc:	aa0003e3 	mov	x3, x0
ffffff8040085be0:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040085be4:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085be8:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085bec:	97ffff57 	bl	ffffff8040085948 <pgdir_walk>
ffffff8040085bf0:	b90057a0 	str	w0, [x29, #84]
ffffff8040085bf4:	b94057a0 	ldr	w0, [x29, #84]
ffffff8040085bf8:	7100001f 	cmp	w0, #0x0
ffffff8040085bfc:	54000100 	b.eq	ffffff8040085c1c <page_insert+0x100>  // b.none
ffffff8040085c00:	f0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040085c04:	9137c001 	add	x1, x0, #0xdf0
ffffff8040085c08:	f0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040085c0c:	91374000 	add	x0, x0, #0xdd0
ffffff8040085c10:	aa0103e2 	mov	x2, x1
ffffff8040085c14:	52801181 	mov	w1, #0x8c                  	// #140
ffffff8040085c18:	94000564 	bl	ffffff80400871a8 <_panic>
ffffff8040085c1c:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085c20:	97fffe19 	bl	ffffff8040085484 <page2pa>
ffffff8040085c24:	aa0003e2 	mov	x2, x0
ffffff8040085c28:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085c2c:	f9402fa1 	ldr	x1, [x29, #88]
ffffff8040085c30:	aa010041 	orr	x1, x2, x1
ffffff8040085c34:	f9000001 	str	x1, [x0]
ffffff8040085c38:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085c3c:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085c40:	11000400 	add	w0, w0, #0x1
ffffff8040085c44:	12003c01 	and	w1, w0, #0xffff
ffffff8040085c48:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085c4c:	79002001 	strh	w1, [x0, #16]
ffffff8040085c50:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085c54:	a8c67bfd 	ldp	x29, x30, [sp], #96
ffffff8040085c58:	d65f03c0 	ret

ffffff8040085c5c <page_lookup>:
ffffff8040085c5c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040085c60:	910003fd 	mov	x29, sp
ffffff8040085c64:	f90017a0 	str	x0, [x29, #40]
ffffff8040085c68:	f90013a1 	str	x1, [x29, #32]
ffffff8040085c6c:	f9000fa2 	str	x2, [x29, #24]
ffffff8040085c70:	b90017a3 	str	w3, [x29, #20]
ffffff8040085c74:	9100c3a0 	add	x0, x29, #0x30
ffffff8040085c78:	b94017a4 	ldr	w4, [x29, #20]
ffffff8040085c7c:	aa0003e3 	mov	x3, x0
ffffff8040085c80:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040085c84:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040085c88:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085c8c:	97ffff2f 	bl	ffffff8040085948 <pgdir_walk>
ffffff8040085c90:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085c94:	f100001f 	cmp	x0, #0x0
ffffff8040085c98:	540000c0 	b.eq	ffffff8040085cb0 <page_lookup+0x54>  // b.none
ffffff8040085c9c:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085ca0:	f9400000 	ldr	x0, [x0]
ffffff8040085ca4:	92400400 	and	x0, x0, #0x3
ffffff8040085ca8:	f100001f 	cmp	x0, #0x0
ffffff8040085cac:	54000061 	b.ne	ffffff8040085cb8 <page_lookup+0x5c>  // b.any
ffffff8040085cb0:	d2800000 	mov	x0, #0x0                   	// #0
ffffff8040085cb4:	1400000d 	b	ffffff8040085ce8 <page_lookup+0x8c>
ffffff8040085cb8:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085cbc:	f9400000 	ldr	x0, [x0]
ffffff8040085cc0:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040085cc4:	97fffe01 	bl	ffffff80400854c8 <pa2page>
ffffff8040085cc8:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085ccc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085cd0:	f100001f 	cmp	x0, #0x0
ffffff8040085cd4:	54000080 	b.eq	ffffff8040085ce4 <page_lookup+0x88>  // b.none
ffffff8040085cd8:	f9401ba1 	ldr	x1, [x29, #48]
ffffff8040085cdc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085ce0:	f9000001 	str	x1, [x0]
ffffff8040085ce4:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085ce8:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040085cec:	d65f03c0 	ret

ffffff8040085cf0 <page_decref>:
ffffff8040085cf0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040085cf4:	910003fd 	mov	x29, sp
ffffff8040085cf8:	f9000fa0 	str	x0, [x29, #24]
ffffff8040085cfc:	b90017a1 	str	w1, [x29, #20]
ffffff8040085d00:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085d04:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085d08:	51000400 	sub	w0, w0, #0x1
ffffff8040085d0c:	12003c01 	and	w1, w0, #0xffff
ffffff8040085d10:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085d14:	79002001 	strh	w1, [x0, #16]
ffffff8040085d18:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085d1c:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085d20:	7100001f 	cmp	w0, #0x0
ffffff8040085d24:	540000c1 	b.ne	ffffff8040085d3c <page_decref+0x4c>  // b.any
ffffff8040085d28:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040085d2c:	12002400 	and	w0, w0, #0x3ff
ffffff8040085d30:	2a0003e1 	mov	w1, w0
ffffff8040085d34:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085d38:	97fffee2 	bl	ffffff80400858c0 <page_free>
ffffff8040085d3c:	d503201f 	nop
ffffff8040085d40:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040085d44:	d65f03c0 	ret

ffffff8040085d48 <page_remove>:
ffffff8040085d48:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040085d4c:	910003fd 	mov	x29, sp
ffffff8040085d50:	f90017a0 	str	x0, [x29, #40]
ffffff8040085d54:	f90013a1 	str	x1, [x29, #32]
ffffff8040085d58:	b9001fa2 	str	w2, [x29, #28]
ffffff8040085d5c:	9100c3a0 	add	x0, x29, #0x30
ffffff8040085d60:	b9401fa3 	ldr	w3, [x29, #28]
ffffff8040085d64:	aa0003e2 	mov	x2, x0
ffffff8040085d68:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040085d6c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085d70:	97ffffbb 	bl	ffffff8040085c5c <page_lookup>
ffffff8040085d74:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085d78:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085d7c:	f100001f 	cmp	x0, #0x0
ffffff8040085d80:	54000280 	b.eq	ffffff8040085dd0 <page_remove+0x88>  // b.none
ffffff8040085d84:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085d88:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085d8c:	51000400 	sub	w0, w0, #0x1
ffffff8040085d90:	12003c01 	and	w1, w0, #0xffff
ffffff8040085d94:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085d98:	79002001 	strh	w1, [x0, #16]
ffffff8040085d9c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085da0:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085da4:	7100001f 	cmp	w0, #0x0
ffffff8040085da8:	540000c1 	b.ne	ffffff8040085dc0 <page_remove+0x78>  // b.any
ffffff8040085dac:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040085db0:	12002400 	and	w0, w0, #0x3ff
ffffff8040085db4:	2a0003e1 	mov	w1, w0
ffffff8040085db8:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085dbc:	97fffec1 	bl	ffffff80400858c0 <page_free>
ffffff8040085dc0:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085dc4:	f900001f 	str	xzr, [x0]
ffffff8040085dc8:	97fffb37 	bl	ffffff8040084aa4 <tlb_invalidate>
ffffff8040085dcc:	14000002 	b	ffffff8040085dd4 <page_remove+0x8c>
ffffff8040085dd0:	d503201f 	nop
ffffff8040085dd4:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040085dd8:	d65f03c0 	ret

ffffff8040085ddc <lp_Print>:
ffffff8040085ddc:	d111c3ff 	sub	sp, sp, #0x470
ffffff8040085de0:	a9007bfd 	stp	x29, x30, [sp]
ffffff8040085de4:	910003fd 	mov	x29, sp
ffffff8040085de8:	f9000bf3 	str	x19, [sp, #16]
ffffff8040085dec:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085df0:	f9001ba1 	str	x1, [x29, #48]
ffffff8040085df4:	f90017a2 	str	x2, [x29, #40]
ffffff8040085df8:	aa0303f3 	mov	x19, x3
ffffff8040085dfc:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085e00:	f90227a0 	str	x0, [x29, #1096]
ffffff8040085e04:	14000004 	b	ffffff8040085e14 <lp_Print+0x38>
ffffff8040085e08:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085e0c:	91000400 	add	x0, x0, #0x1
ffffff8040085e10:	f90017a0 	str	x0, [x29, #40]
ffffff8040085e14:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085e18:	39400000 	ldrb	w0, [x0]
ffffff8040085e1c:	7100001f 	cmp	w0, #0x0
ffffff8040085e20:	540000a0 	b.eq	ffffff8040085e34 <lp_Print+0x58>  // b.none
ffffff8040085e24:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085e28:	39400000 	ldrb	w0, [x0]
ffffff8040085e2c:	7100941f 	cmp	w0, #0x25
ffffff8040085e30:	54fffec1 	b.ne	ffffff8040085e08 <lp_Print+0x2c>  // b.any
ffffff8040085e34:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085e38:	f94227a0 	ldr	x0, [x29, #1096]
ffffff8040085e3c:	cb000020 	sub	x0, x1, x0
ffffff8040085e40:	f100001f 	cmp	x0, #0x0
ffffff8040085e44:	540000cb 	b.lt	ffffff8040085e5c <lp_Print+0x80>  // b.tstop
ffffff8040085e48:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085e4c:	f94227a0 	ldr	x0, [x29, #1096]
ffffff8040085e50:	cb000020 	sub	x0, x1, x0
ffffff8040085e54:	f10fa01f 	cmp	x0, #0x3e8
ffffff8040085e58:	5400012d 	b.le	ffffff8040085e7c <lp_Print+0xa0>
ffffff8040085e5c:	f0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040085e60:	91384000 	add	x0, x0, #0xe10
ffffff8040085e64:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040085e68:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040085e6c:	aa0003e1 	mov	x1, x0
ffffff8040085e70:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085e74:	d63f0060 	blr	x3
ffffff8040085e78:	14000000 	b	ffffff8040085e78 <lp_Print+0x9c>
ffffff8040085e7c:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085e80:	f94227a0 	ldr	x0, [x29, #1096]
ffffff8040085e84:	cb000020 	sub	x0, x1, x0
ffffff8040085e88:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040085e8c:	2a0003e2 	mov	w2, w0
ffffff8040085e90:	f94227a1 	ldr	x1, [x29, #1096]
ffffff8040085e94:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085e98:	d63f0060 	blr	x3
ffffff8040085e9c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085ea0:	39400000 	ldrb	w0, [x0]
ffffff8040085ea4:	7100001f 	cmp	w0, #0x0
ffffff8040085ea8:	54006420 	b.eq	ffffff8040086b2c <lp_Print+0xd50>  // b.none
ffffff8040085eac:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085eb0:	91000400 	add	x0, x0, #0x1
ffffff8040085eb4:	f90017a0 	str	x0, [x29, #40]
ffffff8040085eb8:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085ebc:	39400000 	ldrb	w0, [x0]
ffffff8040085ec0:	7101b01f 	cmp	w0, #0x6c
ffffff8040085ec4:	540000e1 	b.ne	ffffff8040085ee0 <lp_Print+0x104>  // b.any
ffffff8040085ec8:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040085ecc:	b90467a0 	str	w0, [x29, #1124]
ffffff8040085ed0:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085ed4:	91000400 	add	x0, x0, #0x1
ffffff8040085ed8:	f90017a0 	str	x0, [x29, #40]
ffffff8040085edc:	14000002 	b	ffffff8040085ee4 <lp_Print+0x108>
ffffff8040085ee0:	b90467bf 	str	wzr, [x29, #1124]
ffffff8040085ee4:	b9045fbf 	str	wzr, [x29, #1116]
ffffff8040085ee8:	12800000 	mov	w0, #0xffffffff            	// #-1
ffffff8040085eec:	b9045ba0 	str	w0, [x29, #1112]
ffffff8040085ef0:	b90457bf 	str	wzr, [x29, #1108]
ffffff8040085ef4:	52800400 	mov	w0, #0x20                  	// #32
ffffff8040085ef8:	39114fa0 	strb	w0, [x29, #1107]
ffffff8040085efc:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f00:	39400000 	ldrb	w0, [x0]
ffffff8040085f04:	7100b41f 	cmp	w0, #0x2d
ffffff8040085f08:	540000c1 	b.ne	ffffff8040085f20 <lp_Print+0x144>  // b.any
ffffff8040085f0c:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040085f10:	b90457a0 	str	w0, [x29, #1108]
ffffff8040085f14:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f18:	91000400 	add	x0, x0, #0x1
ffffff8040085f1c:	f90017a0 	str	x0, [x29, #40]
ffffff8040085f20:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f24:	39400000 	ldrb	w0, [x0]
ffffff8040085f28:	7100c01f 	cmp	w0, #0x30
ffffff8040085f2c:	540000c1 	b.ne	ffffff8040085f44 <lp_Print+0x168>  // b.any
ffffff8040085f30:	52800600 	mov	w0, #0x30                  	// #48
ffffff8040085f34:	39114fa0 	strb	w0, [x29, #1107]
ffffff8040085f38:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f3c:	91000400 	add	x0, x0, #0x1
ffffff8040085f40:	f90017a0 	str	x0, [x29, #40]
ffffff8040085f44:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f48:	39400000 	ldrb	w0, [x0]
ffffff8040085f4c:	7100bc1f 	cmp	w0, #0x2f
ffffff8040085f50:	54000369 	b.ls	ffffff8040085fbc <lp_Print+0x1e0>  // b.plast
ffffff8040085f54:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f58:	39400000 	ldrb	w0, [x0]
ffffff8040085f5c:	7100e41f 	cmp	w0, #0x39
ffffff8040085f60:	540002e8 	b.hi	ffffff8040085fbc <lp_Print+0x1e0>  // b.pmore
ffffff8040085f64:	1400000e 	b	ffffff8040085f9c <lp_Print+0x1c0>
ffffff8040085f68:	b9445fa1 	ldr	w1, [x29, #1116]
ffffff8040085f6c:	2a0103e0 	mov	w0, w1
ffffff8040085f70:	531e7400 	lsl	w0, w0, #2
ffffff8040085f74:	0b010000 	add	w0, w0, w1
ffffff8040085f78:	531f7800 	lsl	w0, w0, #1
ffffff8040085f7c:	2a0003e2 	mov	w2, w0
ffffff8040085f80:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f84:	91000401 	add	x1, x0, #0x1
ffffff8040085f88:	f90017a1 	str	x1, [x29, #40]
ffffff8040085f8c:	39400000 	ldrb	w0, [x0]
ffffff8040085f90:	5100c000 	sub	w0, w0, #0x30
ffffff8040085f94:	0b000040 	add	w0, w2, w0
ffffff8040085f98:	b9045fa0 	str	w0, [x29, #1116]
ffffff8040085f9c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085fa0:	39400000 	ldrb	w0, [x0]
ffffff8040085fa4:	7100bc1f 	cmp	w0, #0x2f
ffffff8040085fa8:	540000a9 	b.ls	ffffff8040085fbc <lp_Print+0x1e0>  // b.plast
ffffff8040085fac:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085fb0:	39400000 	ldrb	w0, [x0]
ffffff8040085fb4:	7100e41f 	cmp	w0, #0x39
ffffff8040085fb8:	54fffd89 	b.ls	ffffff8040085f68 <lp_Print+0x18c>  // b.plast
ffffff8040085fbc:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085fc0:	39400000 	ldrb	w0, [x0]
ffffff8040085fc4:	7100b81f 	cmp	w0, #0x2e
ffffff8040085fc8:	54000461 	b.ne	ffffff8040086054 <lp_Print+0x278>  // b.any
ffffff8040085fcc:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085fd0:	91000400 	add	x0, x0, #0x1
ffffff8040085fd4:	f90017a0 	str	x0, [x29, #40]
ffffff8040085fd8:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085fdc:	39400000 	ldrb	w0, [x0]
ffffff8040085fe0:	7100bc1f 	cmp	w0, #0x2f
ffffff8040085fe4:	54000389 	b.ls	ffffff8040086054 <lp_Print+0x278>  // b.plast
ffffff8040085fe8:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085fec:	39400000 	ldrb	w0, [x0]
ffffff8040085ff0:	7100e41f 	cmp	w0, #0x39
ffffff8040085ff4:	54000308 	b.hi	ffffff8040086054 <lp_Print+0x278>  // b.pmore
ffffff8040085ff8:	b9045bbf 	str	wzr, [x29, #1112]
ffffff8040085ffc:	1400000e 	b	ffffff8040086034 <lp_Print+0x258>
ffffff8040086000:	b9445ba1 	ldr	w1, [x29, #1112]
ffffff8040086004:	2a0103e0 	mov	w0, w1
ffffff8040086008:	531e7400 	lsl	w0, w0, #2
ffffff804008600c:	0b010000 	add	w0, w0, w1
ffffff8040086010:	531f7800 	lsl	w0, w0, #1
ffffff8040086014:	2a0003e2 	mov	w2, w0
ffffff8040086018:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008601c:	91000401 	add	x1, x0, #0x1
ffffff8040086020:	f90017a1 	str	x1, [x29, #40]
ffffff8040086024:	39400000 	ldrb	w0, [x0]
ffffff8040086028:	5100c000 	sub	w0, w0, #0x30
ffffff804008602c:	0b000040 	add	w0, w2, w0
ffffff8040086030:	b9045ba0 	str	w0, [x29, #1112]
ffffff8040086034:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086038:	39400000 	ldrb	w0, [x0]
ffffff804008603c:	7100bc1f 	cmp	w0, #0x2f
ffffff8040086040:	540000a9 	b.ls	ffffff8040086054 <lp_Print+0x278>  // b.plast
ffffff8040086044:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086048:	39400000 	ldrb	w0, [x0]
ffffff804008604c:	7100e41f 	cmp	w0, #0x39
ffffff8040086050:	54fffd89 	b.ls	ffffff8040086000 <lp_Print+0x224>  // b.plast
ffffff8040086054:	b90463bf 	str	wzr, [x29, #1120]
ffffff8040086058:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008605c:	39400000 	ldrb	w0, [x0]
ffffff8040086060:	71018c1f 	cmp	w0, #0x63
ffffff8040086064:	54004760 	b.eq	ffffff8040086950 <lp_Print+0xb74>  // b.none
ffffff8040086068:	71018c1f 	cmp	w0, #0x63
ffffff804008606c:	5400022c 	b.gt	ffffff80400860b0 <lp_Print+0x2d4>
ffffff8040086070:	71013c1f 	cmp	w0, #0x4f
ffffff8040086074:	54001ae0 	b.eq	ffffff80400863d0 <lp_Print+0x5f4>  // b.none
ffffff8040086078:	71013c1f 	cmp	w0, #0x4f
ffffff804008607c:	540000cc 	b.gt	ffffff8040086094 <lp_Print+0x2b8>
ffffff8040086080:	7100001f 	cmp	w0, #0x0
ffffff8040086084:	540053a0 	b.eq	ffffff8040086af8 <lp_Print+0xd1c>  // b.none
ffffff8040086088:	7101101f 	cmp	w0, #0x44
ffffff804008608c:	54000e20 	b.eq	ffffff8040086250 <lp_Print+0x474>  // b.none
ffffff8040086090:	1400029e 	b	ffffff8040086b08 <lp_Print+0xd2c>
ffffff8040086094:	7101601f 	cmp	w0, #0x58
ffffff8040086098:	54003ac0 	b.eq	ffffff80400867f0 <lp_Print+0xa14>  // b.none
ffffff804008609c:	7101881f 	cmp	w0, #0x62
ffffff80400860a0:	54000280 	b.eq	ffffff80400860f0 <lp_Print+0x314>  // b.none
ffffff80400860a4:	7101541f 	cmp	w0, #0x55
ffffff80400860a8:	54002440 	b.eq	ffffff8040086530 <lp_Print+0x754>  // b.none
ffffff80400860ac:	14000297 	b	ffffff8040086b08 <lp_Print+0xd2c>
ffffff80400860b0:	7101bc1f 	cmp	w0, #0x6f
ffffff80400860b4:	540018e0 	b.eq	ffffff80400863d0 <lp_Print+0x5f4>  // b.none
ffffff80400860b8:	7101bc1f 	cmp	w0, #0x6f
ffffff80400860bc:	540000cc 	b.gt	ffffff80400860d4 <lp_Print+0x2f8>
ffffff80400860c0:	7101901f 	cmp	w0, #0x64
ffffff80400860c4:	54000c60 	b.eq	ffffff8040086250 <lp_Print+0x474>  // b.none
ffffff80400860c8:	7101a41f 	cmp	w0, #0x69
ffffff80400860cc:	54000c20 	b.eq	ffffff8040086250 <lp_Print+0x474>  // b.none
ffffff80400860d0:	1400028e 	b	ffffff8040086b08 <lp_Print+0xd2c>
ffffff80400860d4:	7101d41f 	cmp	w0, #0x75
ffffff80400860d8:	540022c0 	b.eq	ffffff8040086530 <lp_Print+0x754>  // b.none
ffffff80400860dc:	7101e01f 	cmp	w0, #0x78
ffffff80400860e0:	54002d80 	b.eq	ffffff8040086690 <lp_Print+0x8b4>  // b.none
ffffff80400860e4:	7101cc1f 	cmp	w0, #0x73
ffffff80400860e8:	540049e0 	b.eq	ffffff8040086a24 <lp_Print+0xc48>  // b.none
ffffff80400860ec:	14000287 	b	ffffff8040086b08 <lp_Print+0xd2c>
ffffff80400860f0:	b94467a0 	ldr	w0, [x29, #1124]
ffffff80400860f4:	7100001f 	cmp	w0, #0x0
ffffff80400860f8:	54000380 	b.eq	ffffff8040086168 <lp_Print+0x38c>  // b.none
ffffff80400860fc:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086100:	f9400261 	ldr	x1, [x19]
ffffff8040086104:	7100001f 	cmp	w0, #0x0
ffffff8040086108:	540000eb 	b.lt	ffffff8040086124 <lp_Print+0x348>  // b.tstop
ffffff804008610c:	aa0103e0 	mov	x0, x1
ffffff8040086110:	91003c00 	add	x0, x0, #0xf
ffffff8040086114:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086118:	f9000260 	str	x0, [x19]
ffffff804008611c:	aa0103e0 	mov	x0, x1
ffffff8040086120:	1400000f 	b	ffffff804008615c <lp_Print+0x380>
ffffff8040086124:	11002002 	add	w2, w0, #0x8
ffffff8040086128:	b9001a62 	str	w2, [x19, #24]
ffffff804008612c:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086130:	7100005f 	cmp	w2, #0x0
ffffff8040086134:	540000ed 	b.le	ffffff8040086150 <lp_Print+0x374>
ffffff8040086138:	aa0103e0 	mov	x0, x1
ffffff804008613c:	91003c00 	add	x0, x0, #0xf
ffffff8040086140:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086144:	f9000260 	str	x0, [x19]
ffffff8040086148:	aa0103e0 	mov	x0, x1
ffffff804008614c:	14000004 	b	ffffff804008615c <lp_Print+0x380>
ffffff8040086150:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086154:	93407c00 	sxtw	x0, w0
ffffff8040086158:	8b000020 	add	x0, x1, x0
ffffff804008615c:	f9400000 	ldr	x0, [x0]
ffffff8040086160:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086164:	1400001c 	b	ffffff80400861d4 <lp_Print+0x3f8>
ffffff8040086168:	b9401a60 	ldr	w0, [x19, #24]
ffffff804008616c:	f9400261 	ldr	x1, [x19]
ffffff8040086170:	7100001f 	cmp	w0, #0x0
ffffff8040086174:	540000eb 	b.lt	ffffff8040086190 <lp_Print+0x3b4>  // b.tstop
ffffff8040086178:	aa0103e0 	mov	x0, x1
ffffff804008617c:	91002c00 	add	x0, x0, #0xb
ffffff8040086180:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086184:	f9000260 	str	x0, [x19]
ffffff8040086188:	aa0103e0 	mov	x0, x1
ffffff804008618c:	1400000f 	b	ffffff80400861c8 <lp_Print+0x3ec>
ffffff8040086190:	11002002 	add	w2, w0, #0x8
ffffff8040086194:	b9001a62 	str	w2, [x19, #24]
ffffff8040086198:	b9401a62 	ldr	w2, [x19, #24]
ffffff804008619c:	7100005f 	cmp	w2, #0x0
ffffff80400861a0:	540000ed 	b.le	ffffff80400861bc <lp_Print+0x3e0>
ffffff80400861a4:	aa0103e0 	mov	x0, x1
ffffff80400861a8:	91002c00 	add	x0, x0, #0xb
ffffff80400861ac:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400861b0:	f9000260 	str	x0, [x19]
ffffff80400861b4:	aa0103e0 	mov	x0, x1
ffffff80400861b8:	14000004 	b	ffffff80400861c8 <lp_Print+0x3ec>
ffffff80400861bc:	f9400661 	ldr	x1, [x19, #8]
ffffff80400861c0:	93407c00 	sxtw	x0, w0
ffffff80400861c4:	8b000020 	add	x0, x1, x0
ffffff80400861c8:	b9400000 	ldr	w0, [x0]
ffffff80400861cc:	93407c00 	sxtw	x0, w0
ffffff80400861d0:	f90237a0 	str	x0, [x29, #1128]
ffffff80400861d4:	f94237a1 	ldr	x1, [x29, #1128]
ffffff80400861d8:	910123a0 	add	x0, x29, #0x48
ffffff80400861dc:	52800007 	mov	w7, #0x0                   	// #0
ffffff80400861e0:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff80400861e4:	b94457a5 	ldr	w5, [x29, #1108]
ffffff80400861e8:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff80400861ec:	52800003 	mov	w3, #0x0                   	// #0
ffffff80400861f0:	52800042 	mov	w2, #0x2                   	// #2
ffffff80400861f4:	940002fb 	bl	ffffff8040086de0 <PrintNum>
ffffff80400861f8:	b90447a0 	str	w0, [x29, #1092]
ffffff80400861fc:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086200:	7100001f 	cmp	w0, #0x0
ffffff8040086204:	5400008b 	b.lt	ffffff8040086214 <lp_Print+0x438>  // b.tstop
ffffff8040086208:	b94447a0 	ldr	w0, [x29, #1092]
ffffff804008620c:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086210:	5400012d 	b.le	ffffff8040086234 <lp_Print+0x458>
ffffff8040086214:	d0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040086218:	91384000 	add	x0, x0, #0xe10
ffffff804008621c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086220:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086224:	aa0003e1 	mov	x1, x0
ffffff8040086228:	f9401ba0 	ldr	x0, [x29, #48]
ffffff804008622c:	d63f0060 	blr	x3
ffffff8040086230:	14000000 	b	ffffff8040086230 <lp_Print+0x454>
ffffff8040086234:	910123a0 	add	x0, x29, #0x48
ffffff8040086238:	f9401fa3 	ldr	x3, [x29, #56]
ffffff804008623c:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086240:	aa0003e1 	mov	x1, x0
ffffff8040086244:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086248:	d63f0060 	blr	x3
ffffff804008624c:	14000234 	b	ffffff8040086b1c <lp_Print+0xd40>
ffffff8040086250:	b94467a0 	ldr	w0, [x29, #1124]
ffffff8040086254:	7100001f 	cmp	w0, #0x0
ffffff8040086258:	54000380 	b.eq	ffffff80400862c8 <lp_Print+0x4ec>  // b.none
ffffff804008625c:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086260:	f9400261 	ldr	x1, [x19]
ffffff8040086264:	7100001f 	cmp	w0, #0x0
ffffff8040086268:	540000eb 	b.lt	ffffff8040086284 <lp_Print+0x4a8>  // b.tstop
ffffff804008626c:	aa0103e0 	mov	x0, x1
ffffff8040086270:	91003c00 	add	x0, x0, #0xf
ffffff8040086274:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086278:	f9000260 	str	x0, [x19]
ffffff804008627c:	aa0103e0 	mov	x0, x1
ffffff8040086280:	1400000f 	b	ffffff80400862bc <lp_Print+0x4e0>
ffffff8040086284:	11002002 	add	w2, w0, #0x8
ffffff8040086288:	b9001a62 	str	w2, [x19, #24]
ffffff804008628c:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086290:	7100005f 	cmp	w2, #0x0
ffffff8040086294:	540000ed 	b.le	ffffff80400862b0 <lp_Print+0x4d4>
ffffff8040086298:	aa0103e0 	mov	x0, x1
ffffff804008629c:	91003c00 	add	x0, x0, #0xf
ffffff80400862a0:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400862a4:	f9000260 	str	x0, [x19]
ffffff80400862a8:	aa0103e0 	mov	x0, x1
ffffff80400862ac:	14000004 	b	ffffff80400862bc <lp_Print+0x4e0>
ffffff80400862b0:	f9400661 	ldr	x1, [x19, #8]
ffffff80400862b4:	93407c00 	sxtw	x0, w0
ffffff80400862b8:	8b000020 	add	x0, x1, x0
ffffff80400862bc:	f9400000 	ldr	x0, [x0]
ffffff80400862c0:	f90237a0 	str	x0, [x29, #1128]
ffffff80400862c4:	1400001c 	b	ffffff8040086334 <lp_Print+0x558>
ffffff80400862c8:	b9401a60 	ldr	w0, [x19, #24]
ffffff80400862cc:	f9400261 	ldr	x1, [x19]
ffffff80400862d0:	7100001f 	cmp	w0, #0x0
ffffff80400862d4:	540000eb 	b.lt	ffffff80400862f0 <lp_Print+0x514>  // b.tstop
ffffff80400862d8:	aa0103e0 	mov	x0, x1
ffffff80400862dc:	91002c00 	add	x0, x0, #0xb
ffffff80400862e0:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400862e4:	f9000260 	str	x0, [x19]
ffffff80400862e8:	aa0103e0 	mov	x0, x1
ffffff80400862ec:	1400000f 	b	ffffff8040086328 <lp_Print+0x54c>
ffffff80400862f0:	11002002 	add	w2, w0, #0x8
ffffff80400862f4:	b9001a62 	str	w2, [x19, #24]
ffffff80400862f8:	b9401a62 	ldr	w2, [x19, #24]
ffffff80400862fc:	7100005f 	cmp	w2, #0x0
ffffff8040086300:	540000ed 	b.le	ffffff804008631c <lp_Print+0x540>
ffffff8040086304:	aa0103e0 	mov	x0, x1
ffffff8040086308:	91002c00 	add	x0, x0, #0xb
ffffff804008630c:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086310:	f9000260 	str	x0, [x19]
ffffff8040086314:	aa0103e0 	mov	x0, x1
ffffff8040086318:	14000004 	b	ffffff8040086328 <lp_Print+0x54c>
ffffff804008631c:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086320:	93407c00 	sxtw	x0, w0
ffffff8040086324:	8b000020 	add	x0, x1, x0
ffffff8040086328:	b9400000 	ldr	w0, [x0]
ffffff804008632c:	93407c00 	sxtw	x0, w0
ffffff8040086330:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086334:	f94237a0 	ldr	x0, [x29, #1128]
ffffff8040086338:	f100001f 	cmp	x0, #0x0
ffffff804008633c:	540000ca 	b.ge	ffffff8040086354 <lp_Print+0x578>  // b.tcont
ffffff8040086340:	f94237a0 	ldr	x0, [x29, #1128]
ffffff8040086344:	cb0003e0 	neg	x0, x0
ffffff8040086348:	f90237a0 	str	x0, [x29, #1128]
ffffff804008634c:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040086350:	b90463a0 	str	w0, [x29, #1120]
ffffff8040086354:	f94237a1 	ldr	x1, [x29, #1128]
ffffff8040086358:	910123a0 	add	x0, x29, #0x48
ffffff804008635c:	52800007 	mov	w7, #0x0                   	// #0
ffffff8040086360:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff8040086364:	b94457a5 	ldr	w5, [x29, #1108]
ffffff8040086368:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff804008636c:	b94463a3 	ldr	w3, [x29, #1120]
ffffff8040086370:	52800142 	mov	w2, #0xa                   	// #10
ffffff8040086374:	9400029b 	bl	ffffff8040086de0 <PrintNum>
ffffff8040086378:	b90447a0 	str	w0, [x29, #1092]
ffffff804008637c:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086380:	7100001f 	cmp	w0, #0x0
ffffff8040086384:	5400008b 	b.lt	ffffff8040086394 <lp_Print+0x5b8>  // b.tstop
ffffff8040086388:	b94447a0 	ldr	w0, [x29, #1092]
ffffff804008638c:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086390:	5400012d 	b.le	ffffff80400863b4 <lp_Print+0x5d8>
ffffff8040086394:	d0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040086398:	91384000 	add	x0, x0, #0xe10
ffffff804008639c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff80400863a0:	52800302 	mov	w2, #0x18                  	// #24
ffffff80400863a4:	aa0003e1 	mov	x1, x0
ffffff80400863a8:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400863ac:	d63f0060 	blr	x3
ffffff80400863b0:	14000000 	b	ffffff80400863b0 <lp_Print+0x5d4>
ffffff80400863b4:	910123a0 	add	x0, x29, #0x48
ffffff80400863b8:	f9401fa3 	ldr	x3, [x29, #56]
ffffff80400863bc:	b94447a2 	ldr	w2, [x29, #1092]
ffffff80400863c0:	aa0003e1 	mov	x1, x0
ffffff80400863c4:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400863c8:	d63f0060 	blr	x3
ffffff80400863cc:	140001d4 	b	ffffff8040086b1c <lp_Print+0xd40>
ffffff80400863d0:	b94467a0 	ldr	w0, [x29, #1124]
ffffff80400863d4:	7100001f 	cmp	w0, #0x0
ffffff80400863d8:	54000380 	b.eq	ffffff8040086448 <lp_Print+0x66c>  // b.none
ffffff80400863dc:	b9401a60 	ldr	w0, [x19, #24]
ffffff80400863e0:	f9400261 	ldr	x1, [x19]
ffffff80400863e4:	7100001f 	cmp	w0, #0x0
ffffff80400863e8:	540000eb 	b.lt	ffffff8040086404 <lp_Print+0x628>  // b.tstop
ffffff80400863ec:	aa0103e0 	mov	x0, x1
ffffff80400863f0:	91003c00 	add	x0, x0, #0xf
ffffff80400863f4:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400863f8:	f9000260 	str	x0, [x19]
ffffff80400863fc:	aa0103e0 	mov	x0, x1
ffffff8040086400:	1400000f 	b	ffffff804008643c <lp_Print+0x660>
ffffff8040086404:	11002002 	add	w2, w0, #0x8
ffffff8040086408:	b9001a62 	str	w2, [x19, #24]
ffffff804008640c:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086410:	7100005f 	cmp	w2, #0x0
ffffff8040086414:	540000ed 	b.le	ffffff8040086430 <lp_Print+0x654>
ffffff8040086418:	aa0103e0 	mov	x0, x1
ffffff804008641c:	91003c00 	add	x0, x0, #0xf
ffffff8040086420:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086424:	f9000260 	str	x0, [x19]
ffffff8040086428:	aa0103e0 	mov	x0, x1
ffffff804008642c:	14000004 	b	ffffff804008643c <lp_Print+0x660>
ffffff8040086430:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086434:	93407c00 	sxtw	x0, w0
ffffff8040086438:	8b000020 	add	x0, x1, x0
ffffff804008643c:	f9400000 	ldr	x0, [x0]
ffffff8040086440:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086444:	1400001c 	b	ffffff80400864b4 <lp_Print+0x6d8>
ffffff8040086448:	b9401a60 	ldr	w0, [x19, #24]
ffffff804008644c:	f9400261 	ldr	x1, [x19]
ffffff8040086450:	7100001f 	cmp	w0, #0x0
ffffff8040086454:	540000eb 	b.lt	ffffff8040086470 <lp_Print+0x694>  // b.tstop
ffffff8040086458:	aa0103e0 	mov	x0, x1
ffffff804008645c:	91002c00 	add	x0, x0, #0xb
ffffff8040086460:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086464:	f9000260 	str	x0, [x19]
ffffff8040086468:	aa0103e0 	mov	x0, x1
ffffff804008646c:	1400000f 	b	ffffff80400864a8 <lp_Print+0x6cc>
ffffff8040086470:	11002002 	add	w2, w0, #0x8
ffffff8040086474:	b9001a62 	str	w2, [x19, #24]
ffffff8040086478:	b9401a62 	ldr	w2, [x19, #24]
ffffff804008647c:	7100005f 	cmp	w2, #0x0
ffffff8040086480:	540000ed 	b.le	ffffff804008649c <lp_Print+0x6c0>
ffffff8040086484:	aa0103e0 	mov	x0, x1
ffffff8040086488:	91002c00 	add	x0, x0, #0xb
ffffff804008648c:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086490:	f9000260 	str	x0, [x19]
ffffff8040086494:	aa0103e0 	mov	x0, x1
ffffff8040086498:	14000004 	b	ffffff80400864a8 <lp_Print+0x6cc>
ffffff804008649c:	f9400661 	ldr	x1, [x19, #8]
ffffff80400864a0:	93407c00 	sxtw	x0, w0
ffffff80400864a4:	8b000020 	add	x0, x1, x0
ffffff80400864a8:	b9400000 	ldr	w0, [x0]
ffffff80400864ac:	93407c00 	sxtw	x0, w0
ffffff80400864b0:	f90237a0 	str	x0, [x29, #1128]
ffffff80400864b4:	f94237a1 	ldr	x1, [x29, #1128]
ffffff80400864b8:	910123a0 	add	x0, x29, #0x48
ffffff80400864bc:	52800007 	mov	w7, #0x0                   	// #0
ffffff80400864c0:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff80400864c4:	b94457a5 	ldr	w5, [x29, #1108]
ffffff80400864c8:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff80400864cc:	52800003 	mov	w3, #0x0                   	// #0
ffffff80400864d0:	52800102 	mov	w2, #0x8                   	// #8
ffffff80400864d4:	94000243 	bl	ffffff8040086de0 <PrintNum>
ffffff80400864d8:	b90447a0 	str	w0, [x29, #1092]
ffffff80400864dc:	b94447a0 	ldr	w0, [x29, #1092]
ffffff80400864e0:	7100001f 	cmp	w0, #0x0
ffffff80400864e4:	5400008b 	b.lt	ffffff80400864f4 <lp_Print+0x718>  // b.tstop
ffffff80400864e8:	b94447a0 	ldr	w0, [x29, #1092]
ffffff80400864ec:	710fa01f 	cmp	w0, #0x3e8
ffffff80400864f0:	5400012d 	b.le	ffffff8040086514 <lp_Print+0x738>
ffffff80400864f4:	d0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400864f8:	91384000 	add	x0, x0, #0xe10
ffffff80400864fc:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086500:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086504:	aa0003e1 	mov	x1, x0
ffffff8040086508:	f9401ba0 	ldr	x0, [x29, #48]
ffffff804008650c:	d63f0060 	blr	x3
ffffff8040086510:	14000000 	b	ffffff8040086510 <lp_Print+0x734>
ffffff8040086514:	910123a0 	add	x0, x29, #0x48
ffffff8040086518:	f9401fa3 	ldr	x3, [x29, #56]
ffffff804008651c:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086520:	aa0003e1 	mov	x1, x0
ffffff8040086524:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086528:	d63f0060 	blr	x3
ffffff804008652c:	1400017c 	b	ffffff8040086b1c <lp_Print+0xd40>
ffffff8040086530:	b94467a0 	ldr	w0, [x29, #1124]
ffffff8040086534:	7100001f 	cmp	w0, #0x0
ffffff8040086538:	54000380 	b.eq	ffffff80400865a8 <lp_Print+0x7cc>  // b.none
ffffff804008653c:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086540:	f9400261 	ldr	x1, [x19]
ffffff8040086544:	7100001f 	cmp	w0, #0x0
ffffff8040086548:	540000eb 	b.lt	ffffff8040086564 <lp_Print+0x788>  // b.tstop
ffffff804008654c:	aa0103e0 	mov	x0, x1
ffffff8040086550:	91003c00 	add	x0, x0, #0xf
ffffff8040086554:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086558:	f9000260 	str	x0, [x19]
ffffff804008655c:	aa0103e0 	mov	x0, x1
ffffff8040086560:	1400000f 	b	ffffff804008659c <lp_Print+0x7c0>
ffffff8040086564:	11002002 	add	w2, w0, #0x8
ffffff8040086568:	b9001a62 	str	w2, [x19, #24]
ffffff804008656c:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086570:	7100005f 	cmp	w2, #0x0
ffffff8040086574:	540000ed 	b.le	ffffff8040086590 <lp_Print+0x7b4>
ffffff8040086578:	aa0103e0 	mov	x0, x1
ffffff804008657c:	91003c00 	add	x0, x0, #0xf
ffffff8040086580:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086584:	f9000260 	str	x0, [x19]
ffffff8040086588:	aa0103e0 	mov	x0, x1
ffffff804008658c:	14000004 	b	ffffff804008659c <lp_Print+0x7c0>
ffffff8040086590:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086594:	93407c00 	sxtw	x0, w0
ffffff8040086598:	8b000020 	add	x0, x1, x0
ffffff804008659c:	f9400000 	ldr	x0, [x0]
ffffff80400865a0:	f90237a0 	str	x0, [x29, #1128]
ffffff80400865a4:	1400001c 	b	ffffff8040086614 <lp_Print+0x838>
ffffff80400865a8:	b9401a60 	ldr	w0, [x19, #24]
ffffff80400865ac:	f9400261 	ldr	x1, [x19]
ffffff80400865b0:	7100001f 	cmp	w0, #0x0
ffffff80400865b4:	540000eb 	b.lt	ffffff80400865d0 <lp_Print+0x7f4>  // b.tstop
ffffff80400865b8:	aa0103e0 	mov	x0, x1
ffffff80400865bc:	91002c00 	add	x0, x0, #0xb
ffffff80400865c0:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400865c4:	f9000260 	str	x0, [x19]
ffffff80400865c8:	aa0103e0 	mov	x0, x1
ffffff80400865cc:	1400000f 	b	ffffff8040086608 <lp_Print+0x82c>
ffffff80400865d0:	11002002 	add	w2, w0, #0x8
ffffff80400865d4:	b9001a62 	str	w2, [x19, #24]
ffffff80400865d8:	b9401a62 	ldr	w2, [x19, #24]
ffffff80400865dc:	7100005f 	cmp	w2, #0x0
ffffff80400865e0:	540000ed 	b.le	ffffff80400865fc <lp_Print+0x820>
ffffff80400865e4:	aa0103e0 	mov	x0, x1
ffffff80400865e8:	91002c00 	add	x0, x0, #0xb
ffffff80400865ec:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400865f0:	f9000260 	str	x0, [x19]
ffffff80400865f4:	aa0103e0 	mov	x0, x1
ffffff80400865f8:	14000004 	b	ffffff8040086608 <lp_Print+0x82c>
ffffff80400865fc:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086600:	93407c00 	sxtw	x0, w0
ffffff8040086604:	8b000020 	add	x0, x1, x0
ffffff8040086608:	b9400000 	ldr	w0, [x0]
ffffff804008660c:	93407c00 	sxtw	x0, w0
ffffff8040086610:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086614:	f94237a1 	ldr	x1, [x29, #1128]
ffffff8040086618:	910123a0 	add	x0, x29, #0x48
ffffff804008661c:	52800007 	mov	w7, #0x0                   	// #0
ffffff8040086620:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff8040086624:	b94457a5 	ldr	w5, [x29, #1108]
ffffff8040086628:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff804008662c:	52800003 	mov	w3, #0x0                   	// #0
ffffff8040086630:	52800142 	mov	w2, #0xa                   	// #10
ffffff8040086634:	940001eb 	bl	ffffff8040086de0 <PrintNum>
ffffff8040086638:	b90447a0 	str	w0, [x29, #1092]
ffffff804008663c:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086640:	7100001f 	cmp	w0, #0x0
ffffff8040086644:	5400008b 	b.lt	ffffff8040086654 <lp_Print+0x878>  // b.tstop
ffffff8040086648:	b94447a0 	ldr	w0, [x29, #1092]
ffffff804008664c:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086650:	5400012d 	b.le	ffffff8040086674 <lp_Print+0x898>
ffffff8040086654:	d0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040086658:	91384000 	add	x0, x0, #0xe10
ffffff804008665c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086660:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086664:	aa0003e1 	mov	x1, x0
ffffff8040086668:	f9401ba0 	ldr	x0, [x29, #48]
ffffff804008666c:	d63f0060 	blr	x3
ffffff8040086670:	14000000 	b	ffffff8040086670 <lp_Print+0x894>
ffffff8040086674:	910123a0 	add	x0, x29, #0x48
ffffff8040086678:	f9401fa3 	ldr	x3, [x29, #56]
ffffff804008667c:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086680:	aa0003e1 	mov	x1, x0
ffffff8040086684:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086688:	d63f0060 	blr	x3
ffffff804008668c:	14000124 	b	ffffff8040086b1c <lp_Print+0xd40>
ffffff8040086690:	b94467a0 	ldr	w0, [x29, #1124]
ffffff8040086694:	7100001f 	cmp	w0, #0x0
ffffff8040086698:	54000380 	b.eq	ffffff8040086708 <lp_Print+0x92c>  // b.none
ffffff804008669c:	b9401a60 	ldr	w0, [x19, #24]
ffffff80400866a0:	f9400261 	ldr	x1, [x19]
ffffff80400866a4:	7100001f 	cmp	w0, #0x0
ffffff80400866a8:	540000eb 	b.lt	ffffff80400866c4 <lp_Print+0x8e8>  // b.tstop
ffffff80400866ac:	aa0103e0 	mov	x0, x1
ffffff80400866b0:	91003c00 	add	x0, x0, #0xf
ffffff80400866b4:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400866b8:	f9000260 	str	x0, [x19]
ffffff80400866bc:	aa0103e0 	mov	x0, x1
ffffff80400866c0:	1400000f 	b	ffffff80400866fc <lp_Print+0x920>
ffffff80400866c4:	11002002 	add	w2, w0, #0x8
ffffff80400866c8:	b9001a62 	str	w2, [x19, #24]
ffffff80400866cc:	b9401a62 	ldr	w2, [x19, #24]
ffffff80400866d0:	7100005f 	cmp	w2, #0x0
ffffff80400866d4:	540000ed 	b.le	ffffff80400866f0 <lp_Print+0x914>
ffffff80400866d8:	aa0103e0 	mov	x0, x1
ffffff80400866dc:	91003c00 	add	x0, x0, #0xf
ffffff80400866e0:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400866e4:	f9000260 	str	x0, [x19]
ffffff80400866e8:	aa0103e0 	mov	x0, x1
ffffff80400866ec:	14000004 	b	ffffff80400866fc <lp_Print+0x920>
ffffff80400866f0:	f9400661 	ldr	x1, [x19, #8]
ffffff80400866f4:	93407c00 	sxtw	x0, w0
ffffff80400866f8:	8b000020 	add	x0, x1, x0
ffffff80400866fc:	f9400000 	ldr	x0, [x0]
ffffff8040086700:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086704:	1400001c 	b	ffffff8040086774 <lp_Print+0x998>
ffffff8040086708:	b9401a60 	ldr	w0, [x19, #24]
ffffff804008670c:	f9400261 	ldr	x1, [x19]
ffffff8040086710:	7100001f 	cmp	w0, #0x0
ffffff8040086714:	540000eb 	b.lt	ffffff8040086730 <lp_Print+0x954>  // b.tstop
ffffff8040086718:	aa0103e0 	mov	x0, x1
ffffff804008671c:	91002c00 	add	x0, x0, #0xb
ffffff8040086720:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086724:	f9000260 	str	x0, [x19]
ffffff8040086728:	aa0103e0 	mov	x0, x1
ffffff804008672c:	1400000f 	b	ffffff8040086768 <lp_Print+0x98c>
ffffff8040086730:	11002002 	add	w2, w0, #0x8
ffffff8040086734:	b9001a62 	str	w2, [x19, #24]
ffffff8040086738:	b9401a62 	ldr	w2, [x19, #24]
ffffff804008673c:	7100005f 	cmp	w2, #0x0
ffffff8040086740:	540000ed 	b.le	ffffff804008675c <lp_Print+0x980>
ffffff8040086744:	aa0103e0 	mov	x0, x1
ffffff8040086748:	91002c00 	add	x0, x0, #0xb
ffffff804008674c:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086750:	f9000260 	str	x0, [x19]
ffffff8040086754:	aa0103e0 	mov	x0, x1
ffffff8040086758:	14000004 	b	ffffff8040086768 <lp_Print+0x98c>
ffffff804008675c:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086760:	93407c00 	sxtw	x0, w0
ffffff8040086764:	8b000020 	add	x0, x1, x0
ffffff8040086768:	b9400000 	ldr	w0, [x0]
ffffff804008676c:	93407c00 	sxtw	x0, w0
ffffff8040086770:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086774:	f94237a1 	ldr	x1, [x29, #1128]
ffffff8040086778:	910123a0 	add	x0, x29, #0x48
ffffff804008677c:	52800007 	mov	w7, #0x0                   	// #0
ffffff8040086780:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff8040086784:	b94457a5 	ldr	w5, [x29, #1108]
ffffff8040086788:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff804008678c:	52800003 	mov	w3, #0x0                   	// #0
ffffff8040086790:	52800202 	mov	w2, #0x10                  	// #16
ffffff8040086794:	94000193 	bl	ffffff8040086de0 <PrintNum>
ffffff8040086798:	b90447a0 	str	w0, [x29, #1092]
ffffff804008679c:	b94447a0 	ldr	w0, [x29, #1092]
ffffff80400867a0:	7100001f 	cmp	w0, #0x0
ffffff80400867a4:	5400008b 	b.lt	ffffff80400867b4 <lp_Print+0x9d8>  // b.tstop
ffffff80400867a8:	b94447a0 	ldr	w0, [x29, #1092]
ffffff80400867ac:	710fa01f 	cmp	w0, #0x3e8
ffffff80400867b0:	5400012d 	b.le	ffffff80400867d4 <lp_Print+0x9f8>
ffffff80400867b4:	d0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400867b8:	91384000 	add	x0, x0, #0xe10
ffffff80400867bc:	f9401fa3 	ldr	x3, [x29, #56]
ffffff80400867c0:	52800302 	mov	w2, #0x18                  	// #24
ffffff80400867c4:	aa0003e1 	mov	x1, x0
ffffff80400867c8:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400867cc:	d63f0060 	blr	x3
ffffff80400867d0:	14000000 	b	ffffff80400867d0 <lp_Print+0x9f4>
ffffff80400867d4:	910123a0 	add	x0, x29, #0x48
ffffff80400867d8:	f9401fa3 	ldr	x3, [x29, #56]
ffffff80400867dc:	b94447a2 	ldr	w2, [x29, #1092]
ffffff80400867e0:	aa0003e1 	mov	x1, x0
ffffff80400867e4:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400867e8:	d63f0060 	blr	x3
ffffff80400867ec:	140000cc 	b	ffffff8040086b1c <lp_Print+0xd40>
ffffff80400867f0:	b94467a0 	ldr	w0, [x29, #1124]
ffffff80400867f4:	7100001f 	cmp	w0, #0x0
ffffff80400867f8:	54000380 	b.eq	ffffff8040086868 <lp_Print+0xa8c>  // b.none
ffffff80400867fc:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086800:	f9400261 	ldr	x1, [x19]
ffffff8040086804:	7100001f 	cmp	w0, #0x0
ffffff8040086808:	540000eb 	b.lt	ffffff8040086824 <lp_Print+0xa48>  // b.tstop
ffffff804008680c:	aa0103e0 	mov	x0, x1
ffffff8040086810:	91003c00 	add	x0, x0, #0xf
ffffff8040086814:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086818:	f9000260 	str	x0, [x19]
ffffff804008681c:	aa0103e0 	mov	x0, x1
ffffff8040086820:	1400000f 	b	ffffff804008685c <lp_Print+0xa80>
ffffff8040086824:	11002002 	add	w2, w0, #0x8
ffffff8040086828:	b9001a62 	str	w2, [x19, #24]
ffffff804008682c:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086830:	7100005f 	cmp	w2, #0x0
ffffff8040086834:	540000ed 	b.le	ffffff8040086850 <lp_Print+0xa74>
ffffff8040086838:	aa0103e0 	mov	x0, x1
ffffff804008683c:	91003c00 	add	x0, x0, #0xf
ffffff8040086840:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086844:	f9000260 	str	x0, [x19]
ffffff8040086848:	aa0103e0 	mov	x0, x1
ffffff804008684c:	14000004 	b	ffffff804008685c <lp_Print+0xa80>
ffffff8040086850:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086854:	93407c00 	sxtw	x0, w0
ffffff8040086858:	8b000020 	add	x0, x1, x0
ffffff804008685c:	f9400000 	ldr	x0, [x0]
ffffff8040086860:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086864:	1400001c 	b	ffffff80400868d4 <lp_Print+0xaf8>
ffffff8040086868:	b9401a60 	ldr	w0, [x19, #24]
ffffff804008686c:	f9400261 	ldr	x1, [x19]
ffffff8040086870:	7100001f 	cmp	w0, #0x0
ffffff8040086874:	540000eb 	b.lt	ffffff8040086890 <lp_Print+0xab4>  // b.tstop
ffffff8040086878:	aa0103e0 	mov	x0, x1
ffffff804008687c:	91002c00 	add	x0, x0, #0xb
ffffff8040086880:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086884:	f9000260 	str	x0, [x19]
ffffff8040086888:	aa0103e0 	mov	x0, x1
ffffff804008688c:	1400000f 	b	ffffff80400868c8 <lp_Print+0xaec>
ffffff8040086890:	11002002 	add	w2, w0, #0x8
ffffff8040086894:	b9001a62 	str	w2, [x19, #24]
ffffff8040086898:	b9401a62 	ldr	w2, [x19, #24]
ffffff804008689c:	7100005f 	cmp	w2, #0x0
ffffff80400868a0:	540000ed 	b.le	ffffff80400868bc <lp_Print+0xae0>
ffffff80400868a4:	aa0103e0 	mov	x0, x1
ffffff80400868a8:	91002c00 	add	x0, x0, #0xb
ffffff80400868ac:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400868b0:	f9000260 	str	x0, [x19]
ffffff80400868b4:	aa0103e0 	mov	x0, x1
ffffff80400868b8:	14000004 	b	ffffff80400868c8 <lp_Print+0xaec>
ffffff80400868bc:	f9400661 	ldr	x1, [x19, #8]
ffffff80400868c0:	93407c00 	sxtw	x0, w0
ffffff80400868c4:	8b000020 	add	x0, x1, x0
ffffff80400868c8:	b9400000 	ldr	w0, [x0]
ffffff80400868cc:	93407c00 	sxtw	x0, w0
ffffff80400868d0:	f90237a0 	str	x0, [x29, #1128]
ffffff80400868d4:	f94237a1 	ldr	x1, [x29, #1128]
ffffff80400868d8:	910123a0 	add	x0, x29, #0x48
ffffff80400868dc:	52800027 	mov	w7, #0x1                   	// #1
ffffff80400868e0:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff80400868e4:	b94457a5 	ldr	w5, [x29, #1108]
ffffff80400868e8:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff80400868ec:	52800003 	mov	w3, #0x0                   	// #0
ffffff80400868f0:	52800202 	mov	w2, #0x10                  	// #16
ffffff80400868f4:	9400013b 	bl	ffffff8040086de0 <PrintNum>
ffffff80400868f8:	b90447a0 	str	w0, [x29, #1092]
ffffff80400868fc:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086900:	7100001f 	cmp	w0, #0x0
ffffff8040086904:	5400008b 	b.lt	ffffff8040086914 <lp_Print+0xb38>  // b.tstop
ffffff8040086908:	b94447a0 	ldr	w0, [x29, #1092]
ffffff804008690c:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086910:	5400012d 	b.le	ffffff8040086934 <lp_Print+0xb58>
ffffff8040086914:	d0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040086918:	91384000 	add	x0, x0, #0xe10
ffffff804008691c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086920:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086924:	aa0003e1 	mov	x1, x0
ffffff8040086928:	f9401ba0 	ldr	x0, [x29, #48]
ffffff804008692c:	d63f0060 	blr	x3
ffffff8040086930:	14000000 	b	ffffff8040086930 <lp_Print+0xb54>
ffffff8040086934:	910123a0 	add	x0, x29, #0x48
ffffff8040086938:	f9401fa3 	ldr	x3, [x29, #56]
ffffff804008693c:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086940:	aa0003e1 	mov	x1, x0
ffffff8040086944:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086948:	d63f0060 	blr	x3
ffffff804008694c:	14000074 	b	ffffff8040086b1c <lp_Print+0xd40>
ffffff8040086950:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086954:	f9400261 	ldr	x1, [x19]
ffffff8040086958:	7100001f 	cmp	w0, #0x0
ffffff804008695c:	540000eb 	b.lt	ffffff8040086978 <lp_Print+0xb9c>  // b.tstop
ffffff8040086960:	aa0103e0 	mov	x0, x1
ffffff8040086964:	91002c00 	add	x0, x0, #0xb
ffffff8040086968:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff804008696c:	f9000260 	str	x0, [x19]
ffffff8040086970:	aa0103e0 	mov	x0, x1
ffffff8040086974:	1400000f 	b	ffffff80400869b0 <lp_Print+0xbd4>
ffffff8040086978:	11002002 	add	w2, w0, #0x8
ffffff804008697c:	b9001a62 	str	w2, [x19, #24]
ffffff8040086980:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086984:	7100005f 	cmp	w2, #0x0
ffffff8040086988:	540000ed 	b.le	ffffff80400869a4 <lp_Print+0xbc8>
ffffff804008698c:	aa0103e0 	mov	x0, x1
ffffff8040086990:	91002c00 	add	x0, x0, #0xb
ffffff8040086994:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086998:	f9000260 	str	x0, [x19]
ffffff804008699c:	aa0103e0 	mov	x0, x1
ffffff80400869a0:	14000004 	b	ffffff80400869b0 <lp_Print+0xbd4>
ffffff80400869a4:	f9400661 	ldr	x1, [x19, #8]
ffffff80400869a8:	93407c00 	sxtw	x0, w0
ffffff80400869ac:	8b000020 	add	x0, x1, x0
ffffff80400869b0:	b9400000 	ldr	w0, [x0]
ffffff80400869b4:	3910dfa0 	strb	w0, [x29, #1079]
ffffff80400869b8:	910123a0 	add	x0, x29, #0x48
ffffff80400869bc:	b94457a3 	ldr	w3, [x29, #1108]
ffffff80400869c0:	b9445fa2 	ldr	w2, [x29, #1116]
ffffff80400869c4:	3950dfa1 	ldrb	w1, [x29, #1079]
ffffff80400869c8:	94000066 	bl	ffffff8040086b60 <PrintChar>
ffffff80400869cc:	b90447a0 	str	w0, [x29, #1092]
ffffff80400869d0:	b94447a0 	ldr	w0, [x29, #1092]
ffffff80400869d4:	7100001f 	cmp	w0, #0x0
ffffff80400869d8:	5400008b 	b.lt	ffffff80400869e8 <lp_Print+0xc0c>  // b.tstop
ffffff80400869dc:	b94447a0 	ldr	w0, [x29, #1092]
ffffff80400869e0:	710fa01f 	cmp	w0, #0x3e8
ffffff80400869e4:	5400012d 	b.le	ffffff8040086a08 <lp_Print+0xc2c>
ffffff80400869e8:	d0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400869ec:	91384000 	add	x0, x0, #0xe10
ffffff80400869f0:	f9401fa3 	ldr	x3, [x29, #56]
ffffff80400869f4:	52800302 	mov	w2, #0x18                  	// #24
ffffff80400869f8:	aa0003e1 	mov	x1, x0
ffffff80400869fc:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086a00:	d63f0060 	blr	x3
ffffff8040086a04:	14000000 	b	ffffff8040086a04 <lp_Print+0xc28>
ffffff8040086a08:	910123a0 	add	x0, x29, #0x48
ffffff8040086a0c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086a10:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086a14:	aa0003e1 	mov	x1, x0
ffffff8040086a18:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086a1c:	d63f0060 	blr	x3
ffffff8040086a20:	1400003f 	b	ffffff8040086b1c <lp_Print+0xd40>
ffffff8040086a24:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086a28:	f9400261 	ldr	x1, [x19]
ffffff8040086a2c:	7100001f 	cmp	w0, #0x0
ffffff8040086a30:	540000eb 	b.lt	ffffff8040086a4c <lp_Print+0xc70>  // b.tstop
ffffff8040086a34:	aa0103e0 	mov	x0, x1
ffffff8040086a38:	91003c00 	add	x0, x0, #0xf
ffffff8040086a3c:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086a40:	f9000260 	str	x0, [x19]
ffffff8040086a44:	aa0103e0 	mov	x0, x1
ffffff8040086a48:	1400000f 	b	ffffff8040086a84 <lp_Print+0xca8>
ffffff8040086a4c:	11002002 	add	w2, w0, #0x8
ffffff8040086a50:	b9001a62 	str	w2, [x19, #24]
ffffff8040086a54:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086a58:	7100005f 	cmp	w2, #0x0
ffffff8040086a5c:	540000ed 	b.le	ffffff8040086a78 <lp_Print+0xc9c>
ffffff8040086a60:	aa0103e0 	mov	x0, x1
ffffff8040086a64:	91003c00 	add	x0, x0, #0xf
ffffff8040086a68:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086a6c:	f9000260 	str	x0, [x19]
ffffff8040086a70:	aa0103e0 	mov	x0, x1
ffffff8040086a74:	14000004 	b	ffffff8040086a84 <lp_Print+0xca8>
ffffff8040086a78:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086a7c:	93407c00 	sxtw	x0, w0
ffffff8040086a80:	8b000020 	add	x0, x1, x0
ffffff8040086a84:	f9400000 	ldr	x0, [x0]
ffffff8040086a88:	f9021fa0 	str	x0, [x29, #1080]
ffffff8040086a8c:	910123a0 	add	x0, x29, #0x48
ffffff8040086a90:	b94457a3 	ldr	w3, [x29, #1108]
ffffff8040086a94:	b9445fa2 	ldr	w2, [x29, #1116]
ffffff8040086a98:	f9421fa1 	ldr	x1, [x29, #1080]
ffffff8040086a9c:	94000069 	bl	ffffff8040086c40 <PrintString>
ffffff8040086aa0:	b90447a0 	str	w0, [x29, #1092]
ffffff8040086aa4:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086aa8:	7100001f 	cmp	w0, #0x0
ffffff8040086aac:	5400008b 	b.lt	ffffff8040086abc <lp_Print+0xce0>  // b.tstop
ffffff8040086ab0:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086ab4:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086ab8:	5400012d 	b.le	ffffff8040086adc <lp_Print+0xd00>
ffffff8040086abc:	d0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040086ac0:	91384000 	add	x0, x0, #0xe10
ffffff8040086ac4:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086ac8:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086acc:	aa0003e1 	mov	x1, x0
ffffff8040086ad0:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086ad4:	d63f0060 	blr	x3
ffffff8040086ad8:	14000000 	b	ffffff8040086ad8 <lp_Print+0xcfc>
ffffff8040086adc:	910123a0 	add	x0, x29, #0x48
ffffff8040086ae0:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086ae4:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086ae8:	aa0003e1 	mov	x1, x0
ffffff8040086aec:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086af0:	d63f0060 	blr	x3
ffffff8040086af4:	1400000a 	b	ffffff8040086b1c <lp_Print+0xd40>
ffffff8040086af8:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086afc:	d1000400 	sub	x0, x0, #0x1
ffffff8040086b00:	f90017a0 	str	x0, [x29, #40]
ffffff8040086b04:	14000006 	b	ffffff8040086b1c <lp_Print+0xd40>
ffffff8040086b08:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086b0c:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040086b10:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040086b14:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086b18:	d63f0060 	blr	x3
ffffff8040086b1c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086b20:	91000400 	add	x0, x0, #0x1
ffffff8040086b24:	f90017a0 	str	x0, [x29, #40]
ffffff8040086b28:	17fffcb5 	b	ffffff8040085dfc <lp_Print+0x20>
ffffff8040086b2c:	d503201f 	nop
ffffff8040086b30:	d0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040086b34:	9138c000 	add	x0, x0, #0xe30
ffffff8040086b38:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086b3c:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040086b40:	aa0003e1 	mov	x1, x0
ffffff8040086b44:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086b48:	d63f0060 	blr	x3
ffffff8040086b4c:	d503201f 	nop
ffffff8040086b50:	f9400bf3 	ldr	x19, [sp, #16]
ffffff8040086b54:	a9407bfd 	ldp	x29, x30, [sp]
ffffff8040086b58:	9111c3ff 	add	sp, sp, #0x470
ffffff8040086b5c:	d65f03c0 	ret

ffffff8040086b60 <PrintChar>:
ffffff8040086b60:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040086b64:	f9000fe0 	str	x0, [sp, #24]
ffffff8040086b68:	39005fe1 	strb	w1, [sp, #23]
ffffff8040086b6c:	b90013e2 	str	w2, [sp, #16]
ffffff8040086b70:	b9000fe3 	str	w3, [sp, #12]
ffffff8040086b74:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086b78:	7100001f 	cmp	w0, #0x0
ffffff8040086b7c:	5400006c 	b.gt	ffffff8040086b88 <PrintChar+0x28>
ffffff8040086b80:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040086b84:	b90013e0 	str	w0, [sp, #16]
ffffff8040086b88:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086b8c:	7100001f 	cmp	w0, #0x0
ffffff8040086b90:	54000280 	b.eq	ffffff8040086be0 <PrintChar+0x80>  // b.none
ffffff8040086b94:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040086b98:	39405fe1 	ldrb	w1, [sp, #23]
ffffff8040086b9c:	39000001 	strb	w1, [x0]
ffffff8040086ba0:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040086ba4:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086ba8:	14000009 	b	ffffff8040086bcc <PrintChar+0x6c>
ffffff8040086bac:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086bb0:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086bb4:	8b000020 	add	x0, x1, x0
ffffff8040086bb8:	52800401 	mov	w1, #0x20                  	// #32
ffffff8040086bbc:	39000001 	strb	w1, [x0]
ffffff8040086bc0:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086bc4:	11000400 	add	w0, w0, #0x1
ffffff8040086bc8:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086bcc:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086bd0:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086bd4:	6b00003f 	cmp	w1, w0
ffffff8040086bd8:	54fffeab 	b.lt	ffffff8040086bac <PrintChar+0x4c>  // b.tstop
ffffff8040086bdc:	14000016 	b	ffffff8040086c34 <PrintChar+0xd4>
ffffff8040086be0:	b9002fff 	str	wzr, [sp, #44]
ffffff8040086be4:	14000009 	b	ffffff8040086c08 <PrintChar+0xa8>
ffffff8040086be8:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086bec:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086bf0:	8b000020 	add	x0, x1, x0
ffffff8040086bf4:	52800401 	mov	w1, #0x20                  	// #32
ffffff8040086bf8:	39000001 	strb	w1, [x0]
ffffff8040086bfc:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086c00:	11000400 	add	w0, w0, #0x1
ffffff8040086c04:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086c08:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086c0c:	51000400 	sub	w0, w0, #0x1
ffffff8040086c10:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086c14:	6b00003f 	cmp	w1, w0
ffffff8040086c18:	54fffe8b 	b.lt	ffffff8040086be8 <PrintChar+0x88>  // b.tstop
ffffff8040086c1c:	b98013e0 	ldrsw	x0, [sp, #16]
ffffff8040086c20:	d1000400 	sub	x0, x0, #0x1
ffffff8040086c24:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086c28:	8b000020 	add	x0, x1, x0
ffffff8040086c2c:	39405fe1 	ldrb	w1, [sp, #23]
ffffff8040086c30:	39000001 	strb	w1, [x0]
ffffff8040086c34:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086c38:	9100c3ff 	add	sp, sp, #0x30
ffffff8040086c3c:	d65f03c0 	ret

ffffff8040086c40 <PrintString>:
ffffff8040086c40:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040086c44:	f9000fe0 	str	x0, [sp, #24]
ffffff8040086c48:	f9000be1 	str	x1, [sp, #16]
ffffff8040086c4c:	b9000fe2 	str	w2, [sp, #12]
ffffff8040086c50:	b9000be3 	str	w3, [sp, #8]
ffffff8040086c54:	b9002bff 	str	wzr, [sp, #40]
ffffff8040086c58:	f9400be0 	ldr	x0, [sp, #16]
ffffff8040086c5c:	f90013e0 	str	x0, [sp, #32]
ffffff8040086c60:	14000004 	b	ffffff8040086c70 <PrintString+0x30>
ffffff8040086c64:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086c68:	11000400 	add	w0, w0, #0x1
ffffff8040086c6c:	b9002be0 	str	w0, [sp, #40]
ffffff8040086c70:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040086c74:	91000401 	add	x1, x0, #0x1
ffffff8040086c78:	f90013e1 	str	x1, [sp, #32]
ffffff8040086c7c:	39400000 	ldrb	w0, [x0]
ffffff8040086c80:	7100001f 	cmp	w0, #0x0
ffffff8040086c84:	54ffff01 	b.ne	ffffff8040086c64 <PrintString+0x24>  // b.any
ffffff8040086c88:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040086c8c:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086c90:	6b00003f 	cmp	w1, w0
ffffff8040086c94:	5400006a 	b.ge	ffffff8040086ca0 <PrintString+0x60>  // b.tcont
ffffff8040086c98:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086c9c:	b9000fe0 	str	w0, [sp, #12]
ffffff8040086ca0:	b9400be0 	ldr	w0, [sp, #8]
ffffff8040086ca4:	7100001f 	cmp	w0, #0x0
ffffff8040086ca8:	54000440 	b.eq	ffffff8040086d30 <PrintString+0xf0>  // b.none
ffffff8040086cac:	b9002fff 	str	wzr, [sp, #44]
ffffff8040086cb0:	1400000c 	b	ffffff8040086ce0 <PrintString+0xa0>
ffffff8040086cb4:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086cb8:	f9400be1 	ldr	x1, [sp, #16]
ffffff8040086cbc:	8b000021 	add	x1, x1, x0
ffffff8040086cc0:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086cc4:	f9400fe2 	ldr	x2, [sp, #24]
ffffff8040086cc8:	8b000040 	add	x0, x2, x0
ffffff8040086ccc:	39400021 	ldrb	w1, [x1]
ffffff8040086cd0:	39000001 	strb	w1, [x0]
ffffff8040086cd4:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086cd8:	11000400 	add	w0, w0, #0x1
ffffff8040086cdc:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086ce0:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086ce4:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086ce8:	6b00003f 	cmp	w1, w0
ffffff8040086cec:	54fffe4b 	b.lt	ffffff8040086cb4 <PrintString+0x74>  // b.tstop
ffffff8040086cf0:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086cf4:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086cf8:	14000009 	b	ffffff8040086d1c <PrintString+0xdc>
ffffff8040086cfc:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086d00:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086d04:	8b000020 	add	x0, x1, x0
ffffff8040086d08:	52800401 	mov	w1, #0x20                  	// #32
ffffff8040086d0c:	39000001 	strb	w1, [x0]
ffffff8040086d10:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086d14:	11000400 	add	w0, w0, #0x1
ffffff8040086d18:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086d1c:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086d20:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086d24:	6b00003f 	cmp	w1, w0
ffffff8040086d28:	54fffeab 	b.lt	ffffff8040086cfc <PrintString+0xbc>  // b.tstop
ffffff8040086d2c:	1400002a 	b	ffffff8040086dd4 <PrintString+0x194>
ffffff8040086d30:	b9002fff 	str	wzr, [sp, #44]
ffffff8040086d34:	14000009 	b	ffffff8040086d58 <PrintString+0x118>
ffffff8040086d38:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086d3c:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086d40:	8b000020 	add	x0, x1, x0
ffffff8040086d44:	52800401 	mov	w1, #0x20                  	// #32
ffffff8040086d48:	39000001 	strb	w1, [x0]
ffffff8040086d4c:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086d50:	11000400 	add	w0, w0, #0x1
ffffff8040086d54:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086d58:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040086d5c:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086d60:	4b000020 	sub	w0, w1, w0
ffffff8040086d64:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086d68:	6b00003f 	cmp	w1, w0
ffffff8040086d6c:	54fffe6b 	b.lt	ffffff8040086d38 <PrintString+0xf8>  // b.tstop
ffffff8040086d70:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040086d74:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086d78:	4b000020 	sub	w0, w1, w0
ffffff8040086d7c:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086d80:	14000011 	b	ffffff8040086dc4 <PrintString+0x184>
ffffff8040086d84:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086d88:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086d8c:	4b000021 	sub	w1, w1, w0
ffffff8040086d90:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086d94:	0b000020 	add	w0, w1, w0
ffffff8040086d98:	93407c00 	sxtw	x0, w0
ffffff8040086d9c:	f9400be1 	ldr	x1, [sp, #16]
ffffff8040086da0:	8b000021 	add	x1, x1, x0
ffffff8040086da4:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086da8:	f9400fe2 	ldr	x2, [sp, #24]
ffffff8040086dac:	8b000040 	add	x0, x2, x0
ffffff8040086db0:	39400021 	ldrb	w1, [x1]
ffffff8040086db4:	39000001 	strb	w1, [x0]
ffffff8040086db8:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086dbc:	11000400 	add	w0, w0, #0x1
ffffff8040086dc0:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086dc4:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086dc8:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086dcc:	6b00003f 	cmp	w1, w0
ffffff8040086dd0:	54fffdab 	b.lt	ffffff8040086d84 <PrintString+0x144>  // b.tstop
ffffff8040086dd4:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086dd8:	9100c3ff 	add	sp, sp, #0x30
ffffff8040086ddc:	d65f03c0 	ret

ffffff8040086de0 <PrintNum>:
ffffff8040086de0:	d10143ff 	sub	sp, sp, #0x50
ffffff8040086de4:	f90017e0 	str	x0, [sp, #40]
ffffff8040086de8:	f90013e1 	str	x1, [sp, #32]
ffffff8040086dec:	b9001fe2 	str	w2, [sp, #28]
ffffff8040086df0:	b9001be3 	str	w3, [sp, #24]
ffffff8040086df4:	b90017e4 	str	w4, [sp, #20]
ffffff8040086df8:	b90013e5 	str	w5, [sp, #16]
ffffff8040086dfc:	39003fe6 	strb	w6, [sp, #15]
ffffff8040086e00:	b9000be7 	str	w7, [sp, #8]
ffffff8040086e04:	b9003bff 	str	wzr, [sp, #56]
ffffff8040086e08:	f94017e0 	ldr	x0, [sp, #40]
ffffff8040086e0c:	f90027e0 	str	x0, [sp, #72]
ffffff8040086e10:	b9801fe1 	ldrsw	x1, [sp, #28]
ffffff8040086e14:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040086e18:	9ac10802 	udiv	x2, x0, x1
ffffff8040086e1c:	9b017c41 	mul	x1, x2, x1
ffffff8040086e20:	cb010000 	sub	x0, x0, x1
ffffff8040086e24:	b90037e0 	str	w0, [sp, #52]
ffffff8040086e28:	b94037e0 	ldr	w0, [sp, #52]
ffffff8040086e2c:	7100241f 	cmp	w0, #0x9
ffffff8040086e30:	5400014c 	b.gt	ffffff8040086e58 <PrintNum+0x78>
ffffff8040086e34:	b94037e0 	ldr	w0, [sp, #52]
ffffff8040086e38:	12001c01 	and	w1, w0, #0xff
ffffff8040086e3c:	f94027e0 	ldr	x0, [sp, #72]
ffffff8040086e40:	91000402 	add	x2, x0, #0x1
ffffff8040086e44:	f90027e2 	str	x2, [sp, #72]
ffffff8040086e48:	1100c021 	add	w1, w1, #0x30
ffffff8040086e4c:	12001c21 	and	w1, w1, #0xff
ffffff8040086e50:	39000001 	strb	w1, [x0]
ffffff8040086e54:	14000015 	b	ffffff8040086ea8 <PrintNum+0xc8>
ffffff8040086e58:	b9400be0 	ldr	w0, [sp, #8]
ffffff8040086e5c:	7100001f 	cmp	w0, #0x0
ffffff8040086e60:	54000140 	b.eq	ffffff8040086e88 <PrintNum+0xa8>  // b.none
ffffff8040086e64:	b94037e0 	ldr	w0, [sp, #52]
ffffff8040086e68:	12001c01 	and	w1, w0, #0xff
ffffff8040086e6c:	f94027e0 	ldr	x0, [sp, #72]
ffffff8040086e70:	91000402 	add	x2, x0, #0x1
ffffff8040086e74:	f90027e2 	str	x2, [sp, #72]
ffffff8040086e78:	1100dc21 	add	w1, w1, #0x37
ffffff8040086e7c:	12001c21 	and	w1, w1, #0xff
ffffff8040086e80:	39000001 	strb	w1, [x0]
ffffff8040086e84:	14000009 	b	ffffff8040086ea8 <PrintNum+0xc8>
ffffff8040086e88:	b94037e0 	ldr	w0, [sp, #52]
ffffff8040086e8c:	12001c01 	and	w1, w0, #0xff
ffffff8040086e90:	f94027e0 	ldr	x0, [sp, #72]
ffffff8040086e94:	91000402 	add	x2, x0, #0x1
ffffff8040086e98:	f90027e2 	str	x2, [sp, #72]
ffffff8040086e9c:	11015c21 	add	w1, w1, #0x57
ffffff8040086ea0:	12001c21 	and	w1, w1, #0xff
ffffff8040086ea4:	39000001 	strb	w1, [x0]
ffffff8040086ea8:	b9801fe0 	ldrsw	x0, [sp, #28]
ffffff8040086eac:	f94013e1 	ldr	x1, [sp, #32]
ffffff8040086eb0:	9ac00820 	udiv	x0, x1, x0
ffffff8040086eb4:	f90013e0 	str	x0, [sp, #32]
ffffff8040086eb8:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040086ebc:	f100001f 	cmp	x0, #0x0
ffffff8040086ec0:	54fffa81 	b.ne	ffffff8040086e10 <PrintNum+0x30>  // b.any
ffffff8040086ec4:	b9401be0 	ldr	w0, [sp, #24]
ffffff8040086ec8:	7100001f 	cmp	w0, #0x0
ffffff8040086ecc:	540000c0 	b.eq	ffffff8040086ee4 <PrintNum+0x104>  // b.none
ffffff8040086ed0:	f94027e0 	ldr	x0, [sp, #72]
ffffff8040086ed4:	91000401 	add	x1, x0, #0x1
ffffff8040086ed8:	f90027e1 	str	x1, [sp, #72]
ffffff8040086edc:	528005a1 	mov	w1, #0x2d                  	// #45
ffffff8040086ee0:	39000001 	strb	w1, [x0]
ffffff8040086ee4:	f94027e1 	ldr	x1, [sp, #72]
ffffff8040086ee8:	f94017e0 	ldr	x0, [sp, #40]
ffffff8040086eec:	cb000020 	sub	x0, x1, x0
ffffff8040086ef0:	b9003be0 	str	w0, [sp, #56]
ffffff8040086ef4:	b94017e1 	ldr	w1, [sp, #20]
ffffff8040086ef8:	b9403be0 	ldr	w0, [sp, #56]
ffffff8040086efc:	6b00003f 	cmp	w1, w0
ffffff8040086f00:	5400006a 	b.ge	ffffff8040086f0c <PrintNum+0x12c>  // b.tcont
ffffff8040086f04:	b9403be0 	ldr	w0, [sp, #56]
ffffff8040086f08:	b90017e0 	str	w0, [sp, #20]
ffffff8040086f0c:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086f10:	7100001f 	cmp	w0, #0x0
ffffff8040086f14:	54000060 	b.eq	ffffff8040086f20 <PrintNum+0x140>  // b.none
ffffff8040086f18:	52800400 	mov	w0, #0x20                  	// #32
ffffff8040086f1c:	39003fe0 	strb	w0, [sp, #15]
ffffff8040086f20:	b9401be0 	ldr	w0, [sp, #24]
ffffff8040086f24:	7100001f 	cmp	w0, #0x0
ffffff8040086f28:	540003e0 	b.eq	ffffff8040086fa4 <PrintNum+0x1c4>  // b.none
ffffff8040086f2c:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086f30:	7100001f 	cmp	w0, #0x0
ffffff8040086f34:	54000381 	b.ne	ffffff8040086fa4 <PrintNum+0x1c4>  // b.any
ffffff8040086f38:	39403fe0 	ldrb	w0, [sp, #15]
ffffff8040086f3c:	7100c01f 	cmp	w0, #0x30
ffffff8040086f40:	54000321 	b.ne	ffffff8040086fa4 <PrintNum+0x1c4>  // b.any
ffffff8040086f44:	b9403be0 	ldr	w0, [sp, #56]
ffffff8040086f48:	51000400 	sub	w0, w0, #0x1
ffffff8040086f4c:	b90047e0 	str	w0, [sp, #68]
ffffff8040086f50:	14000009 	b	ffffff8040086f74 <PrintNum+0x194>
ffffff8040086f54:	b98047e0 	ldrsw	x0, [sp, #68]
ffffff8040086f58:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040086f5c:	8b000020 	add	x0, x1, x0
ffffff8040086f60:	39403fe1 	ldrb	w1, [sp, #15]
ffffff8040086f64:	39000001 	strb	w1, [x0]
ffffff8040086f68:	b94047e0 	ldr	w0, [sp, #68]
ffffff8040086f6c:	11000400 	add	w0, w0, #0x1
ffffff8040086f70:	b90047e0 	str	w0, [sp, #68]
ffffff8040086f74:	b94017e0 	ldr	w0, [sp, #20]
ffffff8040086f78:	51000400 	sub	w0, w0, #0x1
ffffff8040086f7c:	b94047e1 	ldr	w1, [sp, #68]
ffffff8040086f80:	6b00003f 	cmp	w1, w0
ffffff8040086f84:	54fffe8b 	b.lt	ffffff8040086f54 <PrintNum+0x174>  // b.tstop
ffffff8040086f88:	b98017e0 	ldrsw	x0, [sp, #20]
ffffff8040086f8c:	d1000400 	sub	x0, x0, #0x1
ffffff8040086f90:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040086f94:	8b000020 	add	x0, x1, x0
ffffff8040086f98:	528005a1 	mov	w1, #0x2d                  	// #45
ffffff8040086f9c:	39000001 	strb	w1, [x0]
ffffff8040086fa0:	14000010 	b	ffffff8040086fe0 <PrintNum+0x200>
ffffff8040086fa4:	b9403be0 	ldr	w0, [sp, #56]
ffffff8040086fa8:	b90047e0 	str	w0, [sp, #68]
ffffff8040086fac:	14000009 	b	ffffff8040086fd0 <PrintNum+0x1f0>
ffffff8040086fb0:	b98047e0 	ldrsw	x0, [sp, #68]
ffffff8040086fb4:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040086fb8:	8b000020 	add	x0, x1, x0
ffffff8040086fbc:	39403fe1 	ldrb	w1, [sp, #15]
ffffff8040086fc0:	39000001 	strb	w1, [x0]
ffffff8040086fc4:	b94047e0 	ldr	w0, [sp, #68]
ffffff8040086fc8:	11000400 	add	w0, w0, #0x1
ffffff8040086fcc:	b90047e0 	str	w0, [sp, #68]
ffffff8040086fd0:	b94047e1 	ldr	w1, [sp, #68]
ffffff8040086fd4:	b94017e0 	ldr	w0, [sp, #20]
ffffff8040086fd8:	6b00003f 	cmp	w1, w0
ffffff8040086fdc:	54fffeab 	b.lt	ffffff8040086fb0 <PrintNum+0x1d0>  // b.tstop
ffffff8040086fe0:	b90043ff 	str	wzr, [sp, #64]
ffffff8040086fe4:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086fe8:	7100001f 	cmp	w0, #0x0
ffffff8040086fec:	540000a0 	b.eq	ffffff8040087000 <PrintNum+0x220>  // b.none
ffffff8040086ff0:	b9403be0 	ldr	w0, [sp, #56]
ffffff8040086ff4:	51000400 	sub	w0, w0, #0x1
ffffff8040086ff8:	b9003fe0 	str	w0, [sp, #60]
ffffff8040086ffc:	1400001d 	b	ffffff8040087070 <PrintNum+0x290>
ffffff8040087000:	b94017e0 	ldr	w0, [sp, #20]
ffffff8040087004:	51000400 	sub	w0, w0, #0x1
ffffff8040087008:	b9003fe0 	str	w0, [sp, #60]
ffffff804008700c:	14000019 	b	ffffff8040087070 <PrintNum+0x290>
ffffff8040087010:	b98043e0 	ldrsw	x0, [sp, #64]
ffffff8040087014:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040087018:	8b000020 	add	x0, x1, x0
ffffff804008701c:	39400000 	ldrb	w0, [x0]
ffffff8040087020:	3900cfe0 	strb	w0, [sp, #51]
ffffff8040087024:	b9803fe0 	ldrsw	x0, [sp, #60]
ffffff8040087028:	f94017e1 	ldr	x1, [sp, #40]
ffffff804008702c:	8b000021 	add	x1, x1, x0
ffffff8040087030:	b98043e0 	ldrsw	x0, [sp, #64]
ffffff8040087034:	f94017e2 	ldr	x2, [sp, #40]
ffffff8040087038:	8b000040 	add	x0, x2, x0
ffffff804008703c:	39400021 	ldrb	w1, [x1]
ffffff8040087040:	39000001 	strb	w1, [x0]
ffffff8040087044:	b9803fe0 	ldrsw	x0, [sp, #60]
ffffff8040087048:	f94017e1 	ldr	x1, [sp, #40]
ffffff804008704c:	8b000020 	add	x0, x1, x0
ffffff8040087050:	3940cfe1 	ldrb	w1, [sp, #51]
ffffff8040087054:	39000001 	strb	w1, [x0]
ffffff8040087058:	b94043e0 	ldr	w0, [sp, #64]
ffffff804008705c:	11000400 	add	w0, w0, #0x1
ffffff8040087060:	b90043e0 	str	w0, [sp, #64]
ffffff8040087064:	b9403fe0 	ldr	w0, [sp, #60]
ffffff8040087068:	51000400 	sub	w0, w0, #0x1
ffffff804008706c:	b9003fe0 	str	w0, [sp, #60]
ffffff8040087070:	b9403fe1 	ldr	w1, [sp, #60]
ffffff8040087074:	b94043e0 	ldr	w0, [sp, #64]
ffffff8040087078:	6b00003f 	cmp	w1, w0
ffffff804008707c:	54fffcac 	b.gt	ffffff8040087010 <PrintNum+0x230>
ffffff8040087080:	b94017e0 	ldr	w0, [sp, #20]
ffffff8040087084:	910143ff 	add	sp, sp, #0x50
ffffff8040087088:	d65f03c0 	ret

ffffff804008708c <myoutput>:
ffffff804008708c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040087090:	910003fd 	mov	x29, sp
ffffff8040087094:	f90017a0 	str	x0, [x29, #40]
ffffff8040087098:	f90013a1 	str	x1, [x29, #32]
ffffff804008709c:	b9001fa2 	str	w2, [x29, #28]
ffffff80400870a0:	b9401fa0 	ldr	w0, [x29, #28]
ffffff80400870a4:	7100041f 	cmp	w0, #0x1
ffffff80400870a8:	540000a1 	b.ne	ffffff80400870bc <myoutput+0x30>  // b.any
ffffff80400870ac:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400870b0:	39400000 	ldrb	w0, [x0]
ffffff80400870b4:	7100001f 	cmp	w0, #0x0
ffffff80400870b8:	54000200 	b.eq	ffffff80400870f8 <myoutput+0x6c>  // b.none
ffffff80400870bc:	b9003fbf 	str	wzr, [x29, #60]
ffffff80400870c0:	14000009 	b	ffffff80400870e4 <myoutput+0x58>
ffffff80400870c4:	b9803fa0 	ldrsw	x0, [x29, #60]
ffffff80400870c8:	f94013a1 	ldr	x1, [x29, #32]
ffffff80400870cc:	8b000020 	add	x0, x1, x0
ffffff80400870d0:	39400000 	ldrb	w0, [x0]
ffffff80400870d4:	97ffedd4 	bl	ffffff8040082824 <uart_send>
ffffff80400870d8:	b9403fa0 	ldr	w0, [x29, #60]
ffffff80400870dc:	11000400 	add	w0, w0, #0x1
ffffff80400870e0:	b9003fa0 	str	w0, [x29, #60]
ffffff80400870e4:	b9403fa1 	ldr	w1, [x29, #60]
ffffff80400870e8:	b9401fa0 	ldr	w0, [x29, #28]
ffffff80400870ec:	6b00003f 	cmp	w1, w0
ffffff80400870f0:	54fffeab 	b.lt	ffffff80400870c4 <myoutput+0x38>  // b.tstop
ffffff80400870f4:	14000002 	b	ffffff80400870fc <myoutput+0x70>
ffffff80400870f8:	d503201f 	nop
ffffff80400870fc:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040087100:	d65f03c0 	ret

ffffff8040087104 <printf>:
ffffff8040087104:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
ffffff8040087108:	910003fd 	mov	x29, sp
ffffff804008710c:	f9001fa0 	str	x0, [x29, #56]
ffffff8040087110:	f90037a1 	str	x1, [x29, #104]
ffffff8040087114:	f9003ba2 	str	x2, [x29, #112]
ffffff8040087118:	f9003fa3 	str	x3, [x29, #120]
ffffff804008711c:	f90043a4 	str	x4, [x29, #128]
ffffff8040087120:	f90047a5 	str	x5, [x29, #136]
ffffff8040087124:	f9004ba6 	str	x6, [x29, #144]
ffffff8040087128:	f9004fa7 	str	x7, [x29, #152]
ffffff804008712c:	d0000280 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040087130:	910ac000 	add	x0, x0, #0x2b0
ffffff8040087134:	940001cc 	bl	ffffff8040087864 <spin_lock>
ffffff8040087138:	910283a0 	add	x0, x29, #0xa0
ffffff804008713c:	f90023a0 	str	x0, [x29, #64]
ffffff8040087140:	910283a0 	add	x0, x29, #0xa0
ffffff8040087144:	f90027a0 	str	x0, [x29, #72]
ffffff8040087148:	910183a0 	add	x0, x29, #0x60
ffffff804008714c:	f9002ba0 	str	x0, [x29, #80]
ffffff8040087150:	128006e0 	mov	w0, #0xffffffc8            	// #-56
ffffff8040087154:	b9005ba0 	str	w0, [x29, #88]
ffffff8040087158:	b9005fbf 	str	wzr, [x29, #92]
ffffff804008715c:	910043a2 	add	x2, x29, #0x10
ffffff8040087160:	910103a3 	add	x3, x29, #0x40
ffffff8040087164:	a9400460 	ldp	x0, x1, [x3]
ffffff8040087168:	a9000440 	stp	x0, x1, [x2]
ffffff804008716c:	a9410460 	ldp	x0, x1, [x3, #16]
ffffff8040087170:	a9010440 	stp	x0, x1, [x2, #16]
ffffff8040087174:	910043a1 	add	x1, x29, #0x10
ffffff8040087178:	90000000 	adrp	x0, ffffff8040087000 <PrintNum+0x220>
ffffff804008717c:	91023000 	add	x0, x0, #0x8c
ffffff8040087180:	aa0103e3 	mov	x3, x1
ffffff8040087184:	f9401fa2 	ldr	x2, [x29, #56]
ffffff8040087188:	d2800001 	mov	x1, #0x0                   	// #0
ffffff804008718c:	97fffb14 	bl	ffffff8040085ddc <lp_Print>
ffffff8040087190:	d0000280 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040087194:	910ac000 	add	x0, x0, #0x2b0
ffffff8040087198:	940001c3 	bl	ffffff80400878a4 <spin_unlock>
ffffff804008719c:	d503201f 	nop
ffffff80400871a0:	a8ca7bfd 	ldp	x29, x30, [sp], #160
ffffff80400871a4:	d65f03c0 	ret

ffffff80400871a8 <_panic>:
ffffff80400871a8:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
ffffff80400871ac:	910003fd 	mov	x29, sp
ffffff80400871b0:	f90027a0 	str	x0, [x29, #72]
ffffff80400871b4:	b90047a1 	str	w1, [x29, #68]
ffffff80400871b8:	f9001fa2 	str	x2, [x29, #56]
ffffff80400871bc:	f9003fa3 	str	x3, [x29, #120]
ffffff80400871c0:	f90043a4 	str	x4, [x29, #128]
ffffff80400871c4:	f90047a5 	str	x5, [x29, #136]
ffffff80400871c8:	f9004ba6 	str	x6, [x29, #144]
ffffff80400871cc:	f9004fa7 	str	x7, [x29, #152]
ffffff80400871d0:	910283a0 	add	x0, x29, #0xa0
ffffff80400871d4:	f9002ba0 	str	x0, [x29, #80]
ffffff80400871d8:	910283a0 	add	x0, x29, #0xa0
ffffff80400871dc:	f9002fa0 	str	x0, [x29, #88]
ffffff80400871e0:	9101c3a0 	add	x0, x29, #0x70
ffffff80400871e4:	f90033a0 	str	x0, [x29, #96]
ffffff80400871e8:	128004e0 	mov	w0, #0xffffffd8            	// #-40
ffffff80400871ec:	b9006ba0 	str	w0, [x29, #104]
ffffff80400871f0:	b9006fbf 	str	wzr, [x29, #108]
ffffff80400871f4:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff80400871f8:	9138e000 	add	x0, x0, #0xe38
ffffff80400871fc:	b94047a2 	ldr	w2, [x29, #68]
ffffff8040087200:	f94027a1 	ldr	x1, [x29, #72]
ffffff8040087204:	97ffffc0 	bl	ffffff8040087104 <printf>
ffffff8040087208:	910043a2 	add	x2, x29, #0x10
ffffff804008720c:	910143a3 	add	x3, x29, #0x50
ffffff8040087210:	a9400460 	ldp	x0, x1, [x3]
ffffff8040087214:	a9000440 	stp	x0, x1, [x2]
ffffff8040087218:	a9410460 	ldp	x0, x1, [x3, #16]
ffffff804008721c:	a9010440 	stp	x0, x1, [x2, #16]
ffffff8040087220:	910043a1 	add	x1, x29, #0x10
ffffff8040087224:	90000000 	adrp	x0, ffffff8040087000 <PrintNum+0x220>
ffffff8040087228:	91023000 	add	x0, x0, #0x8c
ffffff804008722c:	aa0103e3 	mov	x3, x1
ffffff8040087230:	f9401fa2 	ldr	x2, [x29, #56]
ffffff8040087234:	d2800001 	mov	x1, #0x0                   	// #0
ffffff8040087238:	97fffae9 	bl	ffffff8040085ddc <lp_Print>
ffffff804008723c:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087240:	91394000 	add	x0, x0, #0xe50
ffffff8040087244:	97ffffb0 	bl	ffffff8040087104 <printf>
ffffff8040087248:	14000000 	b	ffffff8040087248 <_panic+0xa0>

ffffff804008724c <smc_call>:
ffffff804008724c:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040087250:	f90017e0 	str	x0, [sp, #40]
ffffff8040087254:	f90013e1 	str	x1, [sp, #32]
ffffff8040087258:	f9000fe2 	str	x2, [sp, #24]
ffffff804008725c:	f9000be3 	str	x3, [sp, #16]
ffffff8040087260:	f90007e4 	str	x4, [sp, #8]
ffffff8040087264:	f94017e0 	ldr	x0, [sp, #40]
ffffff8040087268:	f94013e1 	ldr	x1, [sp, #32]
ffffff804008726c:	f9400fe2 	ldr	x2, [sp, #24]
ffffff8040087270:	f9400be3 	ldr	x3, [sp, #16]
ffffff8040087274:	d4000002 	hvc	#0x0
ffffff8040087278:	f94007e4 	ldr	x4, [sp, #8]
ffffff804008727c:	f100009f 	cmp	x4, #0x0
ffffff8040087280:	54000180 	b.eq	ffffff80400872b0 <smc_call+0x64>  // b.none
ffffff8040087284:	aa0003e5 	mov	x5, x0
ffffff8040087288:	f94007e4 	ldr	x4, [sp, #8]
ffffff804008728c:	f9000085 	str	x5, [x4]
ffffff8040087290:	aa0103e4 	mov	x4, x1
ffffff8040087294:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040087298:	f9000424 	str	x4, [x1, #8]
ffffff804008729c:	f94007e1 	ldr	x1, [sp, #8]
ffffff80400872a0:	f9000822 	str	x2, [x1, #16]
ffffff80400872a4:	aa0303e2 	mov	x2, x3
ffffff80400872a8:	f94007e1 	ldr	x1, [sp, #8]
ffffff80400872ac:	f9000c22 	str	x2, [x1, #24]
ffffff80400872b0:	9100c3ff 	add	sp, sp, #0x30
ffffff80400872b4:	d65f03c0 	ret

ffffff80400872b8 <psci_cpu_on>:
ffffff80400872b8:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff80400872bc:	910003fd 	mov	x29, sp
ffffff80400872c0:	b9001fa0 	str	w0, [x29, #28]
ffffff80400872c4:	b9001ba1 	str	w1, [x29, #24]
ffffff80400872c8:	b9401fa0 	ldr	w0, [x29, #28]
ffffff80400872cc:	b9401ba1 	ldr	w1, [x29, #24]
ffffff80400872d0:	d2800004 	mov	x4, #0x0                   	// #0
ffffff80400872d4:	d2800003 	mov	x3, #0x0                   	// #0
ffffff80400872d8:	aa0103e2 	mov	x2, x1
ffffff80400872dc:	aa0003e1 	mov	x1, x0
ffffff80400872e0:	d2800060 	mov	x0, #0x3                   	// #3
ffffff80400872e4:	f2b88000 	movk	x0, #0xc400, lsl #16
ffffff80400872e8:	97ffffd9 	bl	ffffff804008724c <smc_call>
ffffff80400872ec:	b9002fa0 	str	w0, [x29, #44]
ffffff80400872f0:	b9402fa0 	ldr	w0, [x29, #44]
ffffff80400872f4:	7100001f 	cmp	w0, #0x0
ffffff80400872f8:	54000061 	b.ne	ffffff8040087304 <psci_cpu_on+0x4c>  // b.any
ffffff80400872fc:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040087300:	14000002 	b	ffffff8040087308 <psci_cpu_on+0x50>
ffffff8040087304:	12800040 	mov	w0, #0xfffffffd            	// #-3
ffffff8040087308:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff804008730c:	d65f03c0 	ret

ffffff8040087310 <sched_yield>:
ffffff8040087310:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040087314:	910003fd 	mov	x29, sp
ffffff8040087318:	b9002fbf 	str	wzr, [x29, #44]
ffffff804008731c:	97fff2c5 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040087320:	12001c00 	and	w0, w0, #0xff
ffffff8040087324:	b90023a0 	str	w0, [x29, #32]
ffffff8040087328:	52800040 	mov	w0, #0x2                   	// #2
ffffff804008732c:	b90027a0 	str	w0, [x29, #36]
ffffff8040087330:	14000137 	b	ffffff804008780c <sched_yield+0x4fc>
ffffff8040087334:	b9002fbf 	str	wzr, [x29, #44]
ffffff8040087338:	b9002bbf 	str	wzr, [x29, #40]
ffffff804008733c:	14000129 	b	ffffff80400877e0 <sched_yield+0x4d0>
ffffff8040087340:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087344:	91052000 	add	x0, x0, #0x148
ffffff8040087348:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008734c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087350:	f9000fa0 	str	x0, [x29, #24]
ffffff8040087354:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087358:	b9412800 	ldr	w0, [x0, #296]
ffffff804008735c:	7100001f 	cmp	w0, #0x0
ffffff8040087360:	54000201 	b.ne	ffffff80400873a0 <sched_yield+0x90>  // b.any
ffffff8040087364:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087368:	f9409c00 	ldr	x0, [x0, #312]
ffffff804008736c:	f100001f 	cmp	x0, #0x0
ffffff8040087370:	540000c0 	b.eq	ffffff8040087388 <sched_yield+0x78>  // b.none
ffffff8040087374:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087378:	f9409c00 	ldr	x0, [x0, #312]
ffffff804008737c:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087380:	f940a021 	ldr	x1, [x1, #320]
ffffff8040087384:	f900a001 	str	x1, [x0, #320]
ffffff8040087388:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008738c:	f940a000 	ldr	x0, [x0, #320]
ffffff8040087390:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087394:	f9409c21 	ldr	x1, [x1, #312]
ffffff8040087398:	f9000001 	str	x1, [x0]
ffffff804008739c:	14000111 	b	ffffff80400877e0 <sched_yield+0x4d0>
ffffff80400873a0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400873a4:	b9412800 	ldr	w0, [x0, #296]
ffffff80400873a8:	71000c1f 	cmp	w0, #0x3
ffffff80400873ac:	54000ae1 	b.ne	ffffff8040087508 <sched_yield+0x1f8>  // b.any
ffffff80400873b0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400873b4:	b9414c01 	ldr	w1, [x0, #332]
ffffff80400873b8:	b94023a0 	ldr	w0, [x29, #32]
ffffff80400873bc:	6b00003f 	cmp	w1, w0
ffffff80400873c0:	54000a41 	b.ne	ffffff8040087508 <sched_yield+0x1f8>  // b.any
ffffff80400873c4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400873c8:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400873cc:	f100001f 	cmp	x0, #0x0
ffffff80400873d0:	540000c0 	b.eq	ffffff80400873e8 <sched_yield+0xd8>  // b.none
ffffff80400873d4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400873d8:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400873dc:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400873e0:	f940a021 	ldr	x1, [x1, #320]
ffffff80400873e4:	f900a001 	str	x1, [x0, #320]
ffffff80400873e8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400873ec:	f940a000 	ldr	x0, [x0, #320]
ffffff80400873f0:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400873f4:	f9409c21 	ldr	x1, [x1, #312]
ffffff80400873f8:	f9000001 	str	x1, [x0]
ffffff80400873fc:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087400:	91052000 	add	x0, x0, #0x148
ffffff8040087404:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087408:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff804008740c:	f100001f 	cmp	x0, #0x0
ffffff8040087410:	540003c0 	b.eq	ffffff8040087488 <sched_yield+0x178>  // b.none
ffffff8040087414:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087418:	91052000 	add	x0, x0, #0x148
ffffff804008741c:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087420:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040087424:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087428:	f9009c01 	str	x1, [x0, #312]
ffffff804008742c:	14000006 	b	ffffff8040087444 <sched_yield+0x134>
ffffff8040087430:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087434:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087438:	f9409c01 	ldr	x1, [x0, #312]
ffffff804008743c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087440:	f9009c01 	str	x1, [x0, #312]
ffffff8040087444:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087448:	f9409c00 	ldr	x0, [x0, #312]
ffffff804008744c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087450:	f100001f 	cmp	x0, #0x0
ffffff8040087454:	54fffee1 	b.ne	ffffff8040087430 <sched_yield+0x120>  // b.any
ffffff8040087458:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008745c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087460:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087464:	f9009c01 	str	x1, [x0, #312]
ffffff8040087468:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008746c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087470:	9104e001 	add	x1, x0, #0x138
ffffff8040087474:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087478:	f900a001 	str	x1, [x0, #320]
ffffff804008747c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087480:	f9009c1f 	str	xzr, [x0, #312]
ffffff8040087484:	1400001e 	b	ffffff80400874fc <sched_yield+0x1ec>
ffffff8040087488:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff804008748c:	91052000 	add	x0, x0, #0x148
ffffff8040087490:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087494:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040087498:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008749c:	f9009c01 	str	x1, [x0, #312]
ffffff80400874a0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400874a4:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400874a8:	f100001f 	cmp	x0, #0x0
ffffff80400874ac:	54000100 	b.eq	ffffff80400874cc <sched_yield+0x1bc>  // b.none
ffffff80400874b0:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400874b4:	91052000 	add	x0, x0, #0x148
ffffff80400874b8:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400874bc:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400874c0:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400874c4:	9104e021 	add	x1, x1, #0x138
ffffff80400874c8:	f900a001 	str	x1, [x0, #320]
ffffff80400874cc:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400874d0:	91052000 	add	x0, x0, #0x148
ffffff80400874d4:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400874d8:	f9400fa2 	ldr	x2, [x29, #24]
ffffff80400874dc:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff80400874e0:	b98027a0 	ldrsw	x0, [x29, #36]
ffffff80400874e4:	d37df001 	lsl	x1, x0, #3
ffffff80400874e8:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400874ec:	91052000 	add	x0, x0, #0x148
ffffff80400874f0:	8b000021 	add	x1, x1, x0
ffffff80400874f4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400874f8:	f900a001 	str	x1, [x0, #320]
ffffff80400874fc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087500:	97fff56f 	bl	ffffff8040084abc <env_run>
ffffff8040087504:	140000c6 	b	ffffff804008781c <sched_yield+0x50c>
ffffff8040087508:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008750c:	b9412800 	ldr	w0, [x0, #296]
ffffff8040087510:	7100081f 	cmp	w0, #0x2
ffffff8040087514:	540000a0 	b.eq	ffffff8040087528 <sched_yield+0x218>  // b.none
ffffff8040087518:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008751c:	b9412800 	ldr	w0, [x0, #296]
ffffff8040087520:	71000c1f 	cmp	w0, #0x3
ffffff8040087524:	54000bc1 	b.ne	ffffff804008769c <sched_yield+0x38c>  // b.any
ffffff8040087528:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008752c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087530:	f100001f 	cmp	x0, #0x0
ffffff8040087534:	540000c0 	b.eq	ffffff804008754c <sched_yield+0x23c>  // b.none
ffffff8040087538:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008753c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087540:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087544:	f940a021 	ldr	x1, [x1, #320]
ffffff8040087548:	f900a001 	str	x1, [x0, #320]
ffffff804008754c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087550:	f940a000 	ldr	x0, [x0, #320]
ffffff8040087554:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087558:	f9409c21 	ldr	x1, [x1, #312]
ffffff804008755c:	f9000001 	str	x1, [x0]
ffffff8040087560:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087564:	91052000 	add	x0, x0, #0x148
ffffff8040087568:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008756c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087570:	f100001f 	cmp	x0, #0x0
ffffff8040087574:	540003c0 	b.eq	ffffff80400875ec <sched_yield+0x2dc>  // b.none
ffffff8040087578:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff804008757c:	91052000 	add	x0, x0, #0x148
ffffff8040087580:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087584:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040087588:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008758c:	f9009c01 	str	x1, [x0, #312]
ffffff8040087590:	14000006 	b	ffffff80400875a8 <sched_yield+0x298>
ffffff8040087594:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087598:	f9409c00 	ldr	x0, [x0, #312]
ffffff804008759c:	f9409c01 	ldr	x1, [x0, #312]
ffffff80400875a0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875a4:	f9009c01 	str	x1, [x0, #312]
ffffff80400875a8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875ac:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400875b0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400875b4:	f100001f 	cmp	x0, #0x0
ffffff80400875b8:	54fffee1 	b.ne	ffffff8040087594 <sched_yield+0x284>  // b.any
ffffff80400875bc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875c0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400875c4:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400875c8:	f9009c01 	str	x1, [x0, #312]
ffffff80400875cc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875d0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400875d4:	9104e001 	add	x1, x0, #0x138
ffffff80400875d8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875dc:	f900a001 	str	x1, [x0, #320]
ffffff80400875e0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875e4:	f9009c1f 	str	xzr, [x0, #312]
ffffff80400875e8:	1400001e 	b	ffffff8040087660 <sched_yield+0x350>
ffffff80400875ec:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400875f0:	91052000 	add	x0, x0, #0x148
ffffff80400875f4:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400875f8:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff80400875fc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087600:	f9009c01 	str	x1, [x0, #312]
ffffff8040087604:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087608:	f9409c00 	ldr	x0, [x0, #312]
ffffff804008760c:	f100001f 	cmp	x0, #0x0
ffffff8040087610:	54000100 	b.eq	ffffff8040087630 <sched_yield+0x320>  // b.none
ffffff8040087614:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087618:	91052000 	add	x0, x0, #0x148
ffffff804008761c:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087620:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087624:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087628:	9104e021 	add	x1, x1, #0x138
ffffff804008762c:	f900a001 	str	x1, [x0, #320]
ffffff8040087630:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087634:	91052000 	add	x0, x0, #0x148
ffffff8040087638:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008763c:	f9400fa2 	ldr	x2, [x29, #24]
ffffff8040087640:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff8040087644:	b98027a0 	ldrsw	x0, [x29, #36]
ffffff8040087648:	d37df001 	lsl	x1, x0, #3
ffffff804008764c:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087650:	91052000 	add	x0, x0, #0x148
ffffff8040087654:	8b000021 	add	x1, x1, x0
ffffff8040087658:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008765c:	f900a001 	str	x1, [x0, #320]
ffffff8040087660:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087664:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087668:	b9402fa1 	ldr	w1, [x29, #44]
ffffff804008766c:	6b00003f 	cmp	w1, w0
ffffff8040087670:	54000c60 	b.eq	ffffff80400877fc <sched_yield+0x4ec>  // b.none
ffffff8040087674:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040087678:	7100001f 	cmp	w0, #0x0
ffffff804008767c:	54000b21 	b.ne	ffffff80400877e0 <sched_yield+0x4d0>  // b.any
ffffff8040087680:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040087684:	11000400 	add	w0, w0, #0x1
ffffff8040087688:	b9002ba0 	str	w0, [x29, #40]
ffffff804008768c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087690:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087694:	b9002fa0 	str	w0, [x29, #44]
ffffff8040087698:	14000052 	b	ffffff80400877e0 <sched_yield+0x4d0>
ffffff804008769c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400876a0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400876a4:	f100001f 	cmp	x0, #0x0
ffffff80400876a8:	540000c0 	b.eq	ffffff80400876c0 <sched_yield+0x3b0>  // b.none
ffffff80400876ac:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400876b0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400876b4:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400876b8:	f940a021 	ldr	x1, [x1, #320]
ffffff80400876bc:	f900a001 	str	x1, [x0, #320]
ffffff80400876c0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400876c4:	f940a000 	ldr	x0, [x0, #320]
ffffff80400876c8:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400876cc:	f9409c21 	ldr	x1, [x1, #312]
ffffff80400876d0:	f9000001 	str	x1, [x0]
ffffff80400876d4:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400876d8:	91052000 	add	x0, x0, #0x148
ffffff80400876dc:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400876e0:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400876e4:	f100001f 	cmp	x0, #0x0
ffffff80400876e8:	540003c0 	b.eq	ffffff8040087760 <sched_yield+0x450>  // b.none
ffffff80400876ec:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400876f0:	91052000 	add	x0, x0, #0x148
ffffff80400876f4:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400876f8:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff80400876fc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087700:	f9009c01 	str	x1, [x0, #312]
ffffff8040087704:	14000006 	b	ffffff804008771c <sched_yield+0x40c>
ffffff8040087708:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008770c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087710:	f9409c01 	ldr	x1, [x0, #312]
ffffff8040087714:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087718:	f9009c01 	str	x1, [x0, #312]
ffffff804008771c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087720:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087724:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087728:	f100001f 	cmp	x0, #0x0
ffffff804008772c:	54fffee1 	b.ne	ffffff8040087708 <sched_yield+0x3f8>  // b.any
ffffff8040087730:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087734:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087738:	f9400fa1 	ldr	x1, [x29, #24]
ffffff804008773c:	f9009c01 	str	x1, [x0, #312]
ffffff8040087740:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087744:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087748:	9104e001 	add	x1, x0, #0x138
ffffff804008774c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087750:	f900a001 	str	x1, [x0, #320]
ffffff8040087754:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087758:	f9009c1f 	str	xzr, [x0, #312]
ffffff804008775c:	1400001e 	b	ffffff80400877d4 <sched_yield+0x4c4>
ffffff8040087760:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087764:	91052000 	add	x0, x0, #0x148
ffffff8040087768:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008776c:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040087770:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087774:	f9009c01 	str	x1, [x0, #312]
ffffff8040087778:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008777c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087780:	f100001f 	cmp	x0, #0x0
ffffff8040087784:	54000100 	b.eq	ffffff80400877a4 <sched_yield+0x494>  // b.none
ffffff8040087788:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff804008778c:	91052000 	add	x0, x0, #0x148
ffffff8040087790:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087794:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087798:	f9400fa1 	ldr	x1, [x29, #24]
ffffff804008779c:	9104e021 	add	x1, x1, #0x138
ffffff80400877a0:	f900a001 	str	x1, [x0, #320]
ffffff80400877a4:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400877a8:	91052000 	add	x0, x0, #0x148
ffffff80400877ac:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400877b0:	f9400fa2 	ldr	x2, [x29, #24]
ffffff80400877b4:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff80400877b8:	b98027a0 	ldrsw	x0, [x29, #36]
ffffff80400877bc:	d37df001 	lsl	x1, x0, #3
ffffff80400877c0:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400877c4:	91052000 	add	x0, x0, #0x148
ffffff80400877c8:	8b000021 	add	x1, x1, x0
ffffff80400877cc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400877d0:	f900a001 	str	x1, [x0, #320]
ffffff80400877d4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400877d8:	97fff4b9 	bl	ffffff8040084abc <env_run>
ffffff80400877dc:	14000010 	b	ffffff804008781c <sched_yield+0x50c>
ffffff80400877e0:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400877e4:	91052000 	add	x0, x0, #0x148
ffffff80400877e8:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400877ec:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400877f0:	f100001f 	cmp	x0, #0x0
ffffff80400877f4:	54ffda61 	b.ne	ffffff8040087340 <sched_yield+0x30>  // b.any
ffffff80400877f8:	14000002 	b	ffffff8040087800 <sched_yield+0x4f0>
ffffff80400877fc:	d503201f 	nop
ffffff8040087800:	b94027a0 	ldr	w0, [x29, #36]
ffffff8040087804:	51000400 	sub	w0, w0, #0x1
ffffff8040087808:	b90027a0 	str	w0, [x29, #36]
ffffff804008780c:	b94027a0 	ldr	w0, [x29, #36]
ffffff8040087810:	7100001f 	cmp	w0, #0x0
ffffff8040087814:	54ffd90a 	b.ge	ffffff8040087334 <sched_yield+0x24>  // b.tcont
ffffff8040087818:	17fffec4 	b	ffffff8040087328 <sched_yield+0x18>
ffffff804008781c:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040087820:	d65f03c0 	ret

ffffff8040087824 <lock_kernel>:
ffffff8040087824:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff8040087828:	910003fd 	mov	x29, sp
ffffff804008782c:	d0000280 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040087830:	910ad000 	add	x0, x0, #0x2b4
ffffff8040087834:	9400000c 	bl	ffffff8040087864 <spin_lock>
ffffff8040087838:	d503201f 	nop
ffffff804008783c:	a8c17bfd 	ldp	x29, x30, [sp], #16
ffffff8040087840:	d65f03c0 	ret

ffffff8040087844 <unlock_kernel>:
ffffff8040087844:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff8040087848:	910003fd 	mov	x29, sp
ffffff804008784c:	d0000280 	adrp	x0, ffffff80400d9000 <_binary_fktest_elf_start+0x9578>
ffffff8040087850:	910ad000 	add	x0, x0, #0x2b4
ffffff8040087854:	94000014 	bl	ffffff80400878a4 <spin_unlock>
ffffff8040087858:	d503201f 	nop
ffffff804008785c:	a8c17bfd 	ldp	x29, x30, [sp], #16
ffffff8040087860:	d65f03c0 	ret

ffffff8040087864 <spin_lock>:
ffffff8040087864:	d10083ff 	sub	sp, sp, #0x20
ffffff8040087868:	f90007e0 	str	x0, [sp, #8]
ffffff804008786c:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040087870:	b9001fe0 	str	w0, [sp, #28]
ffffff8040087874:	f94007e2 	ldr	x2, [sp, #8]
ffffff8040087878:	b9401fe1 	ldr	w1, [sp, #28]
ffffff804008787c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040087880:	885ffc43 	ldaxr	w3, [x2]
ffffff8040087884:	35ffffe3 	cbnz	w3, ffffff8040087880 <spin_lock+0x1c>
ffffff8040087888:	88037c41 	stxr	w3, w1, [x2]
ffffff804008788c:	35ffffa3 	cbnz	w3, ffffff8040087880 <spin_lock+0x1c>
ffffff8040087890:	2a0303e0 	mov	w0, w3
ffffff8040087894:	b9001be0 	str	w0, [sp, #24]
ffffff8040087898:	d503201f 	nop
ffffff804008789c:	910083ff 	add	sp, sp, #0x20
ffffff80400878a0:	d65f03c0 	ret

ffffff80400878a4 <spin_unlock>:
ffffff80400878a4:	d10043ff 	sub	sp, sp, #0x10
ffffff80400878a8:	f90007e0 	str	x0, [sp, #8]
ffffff80400878ac:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400878b0:	889ffc1f 	stlr	wzr, [x0]
ffffff80400878b4:	d503201f 	nop
ffffff80400878b8:	910043ff 	add	sp, sp, #0x10
ffffff80400878bc:	d65f03c0 	ret

ffffff80400878c0 <page2ppn>:
ffffff80400878c0:	d10043ff 	sub	sp, sp, #0x10
ffffff80400878c4:	f90007e0 	str	x0, [sp, #8]
ffffff80400878c8:	f94007e1 	ldr	x1, [sp, #8]
ffffff80400878cc:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400878d0:	91062000 	add	x0, x0, #0x188
ffffff80400878d4:	cb000020 	sub	x0, x1, x0
ffffff80400878d8:	9343fc01 	asr	x1, x0, #3
ffffff80400878dc:	b201f3e0 	mov	x0, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
ffffff80400878e0:	f2955560 	movk	x0, #0xaaab
ffffff80400878e4:	9b007c20 	mul	x0, x1, x0
ffffff80400878e8:	910043ff 	add	sp, sp, #0x10
ffffff80400878ec:	d65f03c0 	ret

ffffff80400878f0 <page2kva>:
ffffff80400878f0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff80400878f4:	910003fd 	mov	x29, sp
ffffff80400878f8:	f9000fa0 	str	x0, [x29, #24]
ffffff80400878fc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087900:	97fffff0 	bl	ffffff80400878c0 <page2ppn>
ffffff8040087904:	d374cc00 	lsl	x0, x0, #12
ffffff8040087908:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff804008790c:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040087910:	d65f03c0 	ret

ffffff8040087914 <pa2page>:
ffffff8040087914:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040087918:	910003fd 	mov	x29, sp
ffffff804008791c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040087920:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087924:	d34cfc00 	lsr	x0, x0, #12
ffffff8040087928:	92406801 	and	x1, x0, #0x7ffffff
ffffff804008792c:	12bfff40 	mov	w0, #0x5ffff               	// #393215
ffffff8040087930:	eb00003f 	cmp	x1, x0
ffffff8040087934:	54000129 	b.ls	ffffff8040087958 <pa2page+0x44>  // b.plast
ffffff8040087938:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff804008793c:	91396001 	add	x1, x0, #0xe58
ffffff8040087940:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087944:	913a0000 	add	x0, x0, #0xe80
ffffff8040087948:	f9400fa3 	ldr	x3, [x29, #24]
ffffff804008794c:	aa0103e2 	mov	x2, x1
ffffff8040087950:	528003e1 	mov	w1, #0x1f                  	// #31
ffffff8040087954:	97fffe15 	bl	ffffff80400871a8 <_panic>
ffffff8040087958:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008795c:	d34cfc00 	lsr	x0, x0, #12
ffffff8040087960:	92406801 	and	x1, x0, #0x7ffffff
ffffff8040087964:	aa0103e0 	mov	x0, x1
ffffff8040087968:	d37ff800 	lsl	x0, x0, #1
ffffff804008796c:	8b010000 	add	x0, x0, x1
ffffff8040087970:	d37df000 	lsl	x0, x0, #3
ffffff8040087974:	f004b4e1 	adrp	x1, ffffff8049726000 <envs+0x61eb8>
ffffff8040087978:	91062021 	add	x1, x1, #0x188
ffffff804008797c:	8b010000 	add	x0, x0, x1
ffffff8040087980:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040087984:	d65f03c0 	ret

ffffff8040087988 <sys_set_return>:
ffffff8040087988:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff804008798c:	910003fd 	mov	x29, sp
ffffff8040087990:	f9000fa0 	str	x0, [x29, #24]
ffffff8040087994:	97fff127 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040087998:	12001c00 	and	w0, w0, #0xff
ffffff804008799c:	b9002fa0 	str	w0, [x29, #44]
ffffff80400879a0:	f004fce0 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff80400879a4:	91062000 	add	x0, x0, #0x188
ffffff80400879a8:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff80400879ac:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400879b0:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400879b4:	f9000001 	str	x1, [x0]
ffffff80400879b8:	d503201f 	nop
ffffff80400879bc:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400879c0:	d65f03c0 	ret

ffffff80400879c4 <sys_putchar>:
ffffff80400879c4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff80400879c8:	910003fd 	mov	x29, sp
ffffff80400879cc:	b9001fa0 	str	w0, [x29, #28]
ffffff80400879d0:	39006fa1 	strb	w1, [x29, #27]
ffffff80400879d4:	39406fa0 	ldrb	w0, [x29, #27]
ffffff80400879d8:	97ffeb93 	bl	ffffff8040082824 <uart_send>
ffffff80400879dc:	d503201f 	nop
ffffff80400879e0:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff80400879e4:	d65f03c0 	ret

ffffff80400879e8 <sys_cgetc>:
ffffff80400879e8:	52800000 	mov	w0, #0x0                   	// #0
ffffff80400879ec:	d65f03c0 	ret

ffffff80400879f0 <sys_panic>:
ffffff80400879f0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff80400879f4:	910003fd 	mov	x29, sp
ffffff80400879f8:	b9001fa0 	str	w0, [x29, #28]
ffffff80400879fc:	f9000ba1 	str	x1, [x29, #16]
ffffff8040087a00:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087a04:	913a8001 	add	x1, x0, #0xea0
ffffff8040087a08:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087a0c:	913aa000 	add	x0, x0, #0xea8
ffffff8040087a10:	f9400ba3 	ldr	x3, [x29, #16]
ffffff8040087a14:	aa0103e2 	mov	x2, x1
ffffff8040087a18:	52800341 	mov	w1, #0x1a                  	// #26
ffffff8040087a1c:	97fffde3 	bl	ffffff80400871a8 <_panic>

ffffff8040087a20 <sys_mem_alloc>:
ffffff8040087a20:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff8040087a24:	910003fd 	mov	x29, sp
ffffff8040087a28:	b9002fa0 	str	w0, [x29, #44]
ffffff8040087a2c:	b9002ba1 	str	w1, [x29, #40]
ffffff8040087a30:	f90013a2 	str	x2, [x29, #32]
ffffff8040087a34:	f9000fa3 	str	x3, [x29, #24]
ffffff8040087a38:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040087a3c:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
ffffff8040087a40:	eb00003f 	cmp	x1, x0
ffffff8040087a44:	540000c9 	b.ls	ffffff8040087a5c <sys_mem_alloc+0x3c>  // b.plast
ffffff8040087a48:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087a4c:	913b4000 	add	x0, x0, #0xed0
ffffff8040087a50:	97fffdad 	bl	ffffff8040087104 <printf>
ffffff8040087a54:	12800000 	mov	w0, #0xffffffff            	// #-1
ffffff8040087a58:	14000035 	b	ffffff8040087b2c <sys_mem_alloc+0x10c>
ffffff8040087a5c:	910103a0 	add	x0, x29, #0x40
ffffff8040087a60:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040087a64:	aa0003e1 	mov	x1, x0
ffffff8040087a68:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040087a6c:	97fff146 	bl	ffffff8040083f84 <envid2env>
ffffff8040087a70:	b9004fa0 	str	w0, [x29, #76]
ffffff8040087a74:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087a78:	7100001f 	cmp	w0, #0x0
ffffff8040087a7c:	540000ca 	b.ge	ffffff8040087a94 <sys_mem_alloc+0x74>  // b.tcont
ffffff8040087a80:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087a84:	913ba000 	add	x0, x0, #0xee8
ffffff8040087a88:	97fffd9f 	bl	ffffff8040087104 <printf>
ffffff8040087a8c:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087a90:	14000027 	b	ffffff8040087b2c <sys_mem_alloc+0x10c>
ffffff8040087a94:	9100e3a0 	add	x0, x29, #0x38
ffffff8040087a98:	97fff75f 	bl	ffffff8040085814 <page_alloc>
ffffff8040087a9c:	b9004fa0 	str	w0, [x29, #76]
ffffff8040087aa0:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087aa4:	7100001f 	cmp	w0, #0x0
ffffff8040087aa8:	540000ca 	b.ge	ffffff8040087ac0 <sys_mem_alloc+0xa0>  // b.tcont
ffffff8040087aac:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087ab0:	913c2000 	add	x0, x0, #0xf08
ffffff8040087ab4:	97fffd94 	bl	ffffff8040087104 <printf>
ffffff8040087ab8:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087abc:	1400001c 	b	ffffff8040087b2c <sys_mem_alloc+0x10c>
ffffff8040087ac0:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040087ac4:	97ffff8b 	bl	ffffff80400878f0 <page2kva>
ffffff8040087ac8:	d2820001 	mov	x1, #0x1000                	// #4096
ffffff8040087acc:	97fff70a 	bl	ffffff80400856f4 <bzero>
ffffff8040087ad0:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040087ad4:	f9409805 	ldr	x5, [x0, #304]
ffffff8040087ad8:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040087adc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087ae0:	b27a0002 	orr	x2, x0, #0x40
ffffff8040087ae4:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040087ae8:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087aec:	12002400 	and	w0, w0, #0x3ff
ffffff8040087af0:	2a0003e4 	mov	w4, w0
ffffff8040087af4:	aa0203e3 	mov	x3, x2
ffffff8040087af8:	f94013a2 	ldr	x2, [x29, #32]
ffffff8040087afc:	aa0503e0 	mov	x0, x5
ffffff8040087b00:	97fff807 	bl	ffffff8040085b1c <page_insert>
ffffff8040087b04:	b9004fa0 	str	w0, [x29, #76]
ffffff8040087b08:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087b0c:	7100001f 	cmp	w0, #0x0
ffffff8040087b10:	540000ca 	b.ge	ffffff8040087b28 <sys_mem_alloc+0x108>  // b.tcont
ffffff8040087b14:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087b18:	913ca000 	add	x0, x0, #0xf28
ffffff8040087b1c:	97fffd7a 	bl	ffffff8040087104 <printf>
ffffff8040087b20:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087b24:	14000002 	b	ffffff8040087b2c <sys_mem_alloc+0x10c>
ffffff8040087b28:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040087b2c:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff8040087b30:	d65f03c0 	ret

ffffff8040087b34 <sys_mem_map>:
ffffff8040087b34:	a9b97bfd 	stp	x29, x30, [sp, #-112]!
ffffff8040087b38:	910003fd 	mov	x29, sp
ffffff8040087b3c:	b9003fa0 	str	w0, [x29, #60]
ffffff8040087b40:	b9003ba1 	str	w1, [x29, #56]
ffffff8040087b44:	f9001ba2 	str	x2, [x29, #48]
ffffff8040087b48:	b9002fa3 	str	w3, [x29, #44]
ffffff8040087b4c:	f90013a4 	str	x4, [x29, #32]
ffffff8040087b50:	f9000fa5 	str	x5, [x29, #24]
ffffff8040087b54:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040087b58:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040087b5c:	f9001ba0 	str	x0, [x29, #48]
ffffff8040087b60:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087b64:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040087b68:	f90013a0 	str	x0, [x29, #32]
ffffff8040087b6c:	910163a0 	add	x0, x29, #0x58
ffffff8040087b70:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040087b74:	aa0003e1 	mov	x1, x0
ffffff8040087b78:	b9403ba0 	ldr	w0, [x29, #56]
ffffff8040087b7c:	97fff102 	bl	ffffff8040083f84 <envid2env>
ffffff8040087b80:	b9006fa0 	str	w0, [x29, #108]
ffffff8040087b84:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087b88:	7100001f 	cmp	w0, #0x0
ffffff8040087b8c:	540000ca 	b.ge	ffffff8040087ba4 <sys_mem_map+0x70>  // b.tcont
ffffff8040087b90:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087b94:	913d4000 	add	x0, x0, #0xf50
ffffff8040087b98:	97fffd5b 	bl	ffffff8040087104 <printf>
ffffff8040087b9c:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087ba0:	1400003d 	b	ffffff8040087c94 <sys_mem_map+0x160>
ffffff8040087ba4:	910143a0 	add	x0, x29, #0x50
ffffff8040087ba8:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040087bac:	aa0003e1 	mov	x1, x0
ffffff8040087bb0:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040087bb4:	97fff0f4 	bl	ffffff8040083f84 <envid2env>
ffffff8040087bb8:	b9006fa0 	str	w0, [x29, #108]
ffffff8040087bbc:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087bc0:	7100001f 	cmp	w0, #0x0
ffffff8040087bc4:	540000ca 	b.ge	ffffff8040087bdc <sys_mem_map+0xa8>  // b.tcont
ffffff8040087bc8:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087bcc:	913d4000 	add	x0, x0, #0xf50
ffffff8040087bd0:	97fffd4d 	bl	ffffff8040087104 <printf>
ffffff8040087bd4:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087bd8:	1400002f 	b	ffffff8040087c94 <sys_mem_map+0x160>
ffffff8040087bdc:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040087be0:	f9409804 	ldr	x4, [x0, #304]
ffffff8040087be4:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040087be8:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087bec:	12002401 	and	w1, w0, #0x3ff
ffffff8040087bf0:	910123a0 	add	x0, x29, #0x48
ffffff8040087bf4:	2a0103e3 	mov	w3, w1
ffffff8040087bf8:	aa0003e2 	mov	x2, x0
ffffff8040087bfc:	f9401ba1 	ldr	x1, [x29, #48]
ffffff8040087c00:	aa0403e0 	mov	x0, x4
ffffff8040087c04:	97fff816 	bl	ffffff8040085c5c <page_lookup>
ffffff8040087c08:	f90033a0 	str	x0, [x29, #96]
ffffff8040087c0c:	f94033a0 	ldr	x0, [x29, #96]
ffffff8040087c10:	f100001f 	cmp	x0, #0x0
ffffff8040087c14:	54000161 	b.ne	ffffff8040087c40 <sys_mem_map+0x10c>  // b.any
ffffff8040087c18:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040087c1c:	f9409801 	ldr	x1, [x0, #304]
ffffff8040087c20:	910123a2 	add	x2, x29, #0x48
ffffff8040087c24:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087c28:	913dc000 	add	x0, x0, #0xf70
ffffff8040087c2c:	aa0203e3 	mov	x3, x2
ffffff8040087c30:	f9401ba2 	ldr	x2, [x29, #48]
ffffff8040087c34:	97fffd34 	bl	ffffff8040087104 <printf>
ffffff8040087c38:	12800000 	mov	w0, #0xffffffff            	// #-1
ffffff8040087c3c:	14000016 	b	ffffff8040087c94 <sys_mem_map+0x160>
ffffff8040087c40:	f9402ba0 	ldr	x0, [x29, #80]
ffffff8040087c44:	f9409805 	ldr	x5, [x0, #304]
ffffff8040087c48:	f9402ba0 	ldr	x0, [x29, #80]
ffffff8040087c4c:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087c50:	12002400 	and	w0, w0, #0x3ff
ffffff8040087c54:	2a0003e4 	mov	w4, w0
ffffff8040087c58:	f9400fa3 	ldr	x3, [x29, #24]
ffffff8040087c5c:	f94013a2 	ldr	x2, [x29, #32]
ffffff8040087c60:	f94033a1 	ldr	x1, [x29, #96]
ffffff8040087c64:	aa0503e0 	mov	x0, x5
ffffff8040087c68:	97fff7ad 	bl	ffffff8040085b1c <page_insert>
ffffff8040087c6c:	b9006fa0 	str	w0, [x29, #108]
ffffff8040087c70:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087c74:	7100001f 	cmp	w0, #0x0
ffffff8040087c78:	540000ca 	b.ge	ffffff8040087c90 <sys_mem_map+0x15c>  // b.tcont
ffffff8040087c7c:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087c80:	913ee000 	add	x0, x0, #0xfb8
ffffff8040087c84:	97fffd20 	bl	ffffff8040087104 <printf>
ffffff8040087c88:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087c8c:	14000002 	b	ffffff8040087c94 <sys_mem_map+0x160>
ffffff8040087c90:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040087c94:	a8c77bfd 	ldp	x29, x30, [sp], #112
ffffff8040087c98:	d65f03c0 	ret

ffffff8040087c9c <sys_mem_unmap>:
ffffff8040087c9c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040087ca0:	910003fd 	mov	x29, sp
ffffff8040087ca4:	b9001fa0 	str	w0, [x29, #28]
ffffff8040087ca8:	b9001ba1 	str	w1, [x29, #24]
ffffff8040087cac:	f9000ba2 	str	x2, [x29, #16]
ffffff8040087cb0:	910083a0 	add	x0, x29, #0x20
ffffff8040087cb4:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040087cb8:	aa0003e1 	mov	x1, x0
ffffff8040087cbc:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040087cc0:	97fff0b1 	bl	ffffff8040083f84 <envid2env>
ffffff8040087cc4:	b9002fa0 	str	w0, [x29, #44]
ffffff8040087cc8:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040087ccc:	7100001f 	cmp	w0, #0x0
ffffff8040087cd0:	540000ca 	b.ge	ffffff8040087ce8 <sys_mem_unmap+0x4c>  // b.tcont
ffffff8040087cd4:	b0000000 	adrp	x0, ffffff8040088000 <sys_set_env_status+0x16c>
ffffff8040087cd8:	913f6000 	add	x0, x0, #0xfd8
ffffff8040087cdc:	97fffd0a 	bl	ffffff8040087104 <printf>
ffffff8040087ce0:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040087ce4:	1400000a 	b	ffffff8040087d0c <sys_mem_unmap+0x70>
ffffff8040087ce8:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087cec:	f9409803 	ldr	x3, [x0, #304]
ffffff8040087cf0:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087cf4:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087cf8:	2a0003e2 	mov	w2, w0
ffffff8040087cfc:	f9400ba1 	ldr	x1, [x29, #16]
ffffff8040087d00:	aa0303e0 	mov	x0, x3
ffffff8040087d04:	97fff811 	bl	ffffff8040085d48 <page_remove>
ffffff8040087d08:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040087d0c:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040087d10:	d65f03c0 	ret

ffffff8040087d14 <sys_env_alloc>:
ffffff8040087d14:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff8040087d18:	910003fd 	mov	x29, sp
ffffff8040087d1c:	f9000bf3 	str	x19, [sp, #16]
ffffff8040087d20:	97fff044 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040087d24:	12001c00 	and	w0, w0, #0xff
ffffff8040087d28:	b9004fa0 	str	w0, [x29, #76]
ffffff8040087d2c:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087d30:	91058000 	add	x0, x0, #0x160
ffffff8040087d34:	b9804fa1 	ldrsw	x1, [x29, #76]
ffffff8040087d38:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087d3c:	b9412001 	ldr	w1, [x0, #288]
ffffff8040087d40:	9100e3a0 	add	x0, x29, #0x38
ffffff8040087d44:	97fff15d 	bl	ffffff80400842b8 <env_alloc>
ffffff8040087d48:	b9004ba0 	str	w0, [x29, #72]
ffffff8040087d4c:	b9404ba0 	ldr	w0, [x29, #72]
ffffff8040087d50:	7100001f 	cmp	w0, #0x0
ffffff8040087d54:	540000ca 	b.ge	ffffff8040087d6c <sys_env_alloc+0x58>  // b.tcont
ffffff8040087d58:	d0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040087d5c:	91000000 	add	x0, x0, #0x0
ffffff8040087d60:	97fffce9 	bl	ffffff8040087104 <printf>
ffffff8040087d64:	b9404ba0 	ldr	w0, [x29, #72]
ffffff8040087d68:	14000048 	b	ffffff8040087e88 <sys_env_alloc+0x174>
ffffff8040087d6c:	f004fce0 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff8040087d70:	91062000 	add	x0, x0, #0x188
ffffff8040087d74:	b9804fa1 	ldrsw	x1, [x29, #76]
ffffff8040087d78:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087d7c:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040087d80:	d2802202 	mov	x2, #0x110                 	// #272
ffffff8040087d84:	97fff67a 	bl	ffffff804008576c <bcopy>
ffffff8040087d88:	f9001bbf 	str	xzr, [x29, #48]
ffffff8040087d8c:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087d90:	91058000 	add	x0, x0, #0x160
ffffff8040087d94:	b9804fa1 	ldrsw	x1, [x29, #76]
ffffff8040087d98:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087d9c:	f9409805 	ldr	x5, [x0, #304]
ffffff8040087da0:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087da4:	91058000 	add	x0, x0, #0x160
ffffff8040087da8:	b9804fa1 	ldrsw	x1, [x29, #76]
ffffff8040087dac:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087db0:	b9412001 	ldr	w1, [x0, #288]
ffffff8040087db4:	9100c3a0 	add	x0, x29, #0x30
ffffff8040087db8:	2a0103e4 	mov	w4, w1
ffffff8040087dbc:	aa0003e3 	mov	x3, x0
ffffff8040087dc0:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040087dc4:	b2742fe1 	mov	x1, #0xfff000              	// #16773120
ffffff8040087dc8:	aa0503e0 	mov	x0, x5
ffffff8040087dcc:	97fff6df 	bl	ffffff8040085948 <pgdir_walk>
ffffff8040087dd0:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040087dd4:	f100001f 	cmp	x0, #0x0
ffffff8040087dd8:	54000380 	b.eq	ffffff8040087e48 <sys_env_alloc+0x134>  // b.none
ffffff8040087ddc:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040087de0:	f9400000 	ldr	x0, [x0]
ffffff8040087de4:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040087de8:	97fffecb 	bl	ffffff8040087914 <pa2page>
ffffff8040087dec:	f90023a0 	str	x0, [x29, #64]
ffffff8040087df0:	9100a3a0 	add	x0, x29, #0x28
ffffff8040087df4:	97fff688 	bl	ffffff8040085814 <page_alloc>
ffffff8040087df8:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040087dfc:	97fffebd 	bl	ffffff80400878f0 <page2kva>
ffffff8040087e00:	aa0003f3 	mov	x19, x0
ffffff8040087e04:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040087e08:	97fffeba 	bl	ffffff80400878f0 <page2kva>
ffffff8040087e0c:	d2820002 	mov	x2, #0x1000                	// #4096
ffffff8040087e10:	aa0003e1 	mov	x1, x0
ffffff8040087e14:	aa1303e0 	mov	x0, x19
ffffff8040087e18:	97fff655 	bl	ffffff804008576c <bcopy>
ffffff8040087e1c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040087e20:	f9409805 	ldr	x5, [x0, #304]
ffffff8040087e24:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040087e28:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040087e2c:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087e30:	12002400 	and	w0, w0, #0x3ff
ffffff8040087e34:	2a0003e4 	mov	w4, w0
ffffff8040087e38:	d2800803 	mov	x3, #0x40                  	// #64
ffffff8040087e3c:	b2742fe2 	mov	x2, #0xfff000              	// #16773120
ffffff8040087e40:	aa0503e0 	mov	x0, x5
ffffff8040087e44:	97fff736 	bl	ffffff8040085b1c <page_insert>
ffffff8040087e48:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040087e4c:	52800041 	mov	w1, #0x2                   	// #2
ffffff8040087e50:	b9012801 	str	w1, [x0, #296]
ffffff8040087e54:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040087e58:	f900001f 	str	xzr, [x0]
ffffff8040087e5c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040087e60:	b9015c1f 	str	wzr, [x0, #348]
ffffff8040087e64:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087e68:	91058000 	add	x0, x0, #0x160
ffffff8040087e6c:	b9804fa1 	ldrsw	x1, [x29, #76]
ffffff8040087e70:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040087e74:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040087e78:	b9414821 	ldr	w1, [x1, #328]
ffffff8040087e7c:	b9014801 	str	w1, [x0, #328]
ffffff8040087e80:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040087e84:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087e88:	f9400bf3 	ldr	x19, [sp, #16]
ffffff8040087e8c:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff8040087e90:	d65f03c0 	ret

ffffff8040087e94 <sys_set_env_status>:
ffffff8040087e94:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040087e98:	910003fd 	mov	x29, sp
ffffff8040087e9c:	b9001fa0 	str	w0, [x29, #28]
ffffff8040087ea0:	b9001ba1 	str	w1, [x29, #24]
ffffff8040087ea4:	b90017a2 	str	w2, [x29, #20]
ffffff8040087ea8:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040087eac:	7100041f 	cmp	w0, #0x1
ffffff8040087eb0:	54000180 	b.eq	ffffff8040087ee0 <sys_set_env_status+0x4c>  // b.none
ffffff8040087eb4:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040087eb8:	7100081f 	cmp	w0, #0x2
ffffff8040087ebc:	54000120 	b.eq	ffffff8040087ee0 <sys_set_env_status+0x4c>  // b.none
ffffff8040087ec0:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040087ec4:	7100001f 	cmp	w0, #0x0
ffffff8040087ec8:	540000c0 	b.eq	ffffff8040087ee0 <sys_set_env_status+0x4c>  // b.none
ffffff8040087ecc:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040087ed0:	71000c1f 	cmp	w0, #0x3
ffffff8040087ed4:	54000060 	b.eq	ffffff8040087ee0 <sys_set_env_status+0x4c>  // b.none
ffffff8040087ed8:	12800040 	mov	w0, #0xfffffffd            	// #-3
ffffff8040087edc:	14000051 	b	ffffff8040088020 <sys_set_env_status+0x18c>
ffffff8040087ee0:	910083a0 	add	x0, x29, #0x20
ffffff8040087ee4:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040087ee8:	aa0003e1 	mov	x1, x0
ffffff8040087eec:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040087ef0:	97fff025 	bl	ffffff8040083f84 <envid2env>
ffffff8040087ef4:	b9002fa0 	str	w0, [x29, #44]
ffffff8040087ef8:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040087efc:	7100001f 	cmp	w0, #0x0
ffffff8040087f00:	5400006a 	b.ge	ffffff8040087f0c <sys_set_env_status+0x78>  // b.tcont
ffffff8040087f04:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040087f08:	14000046 	b	ffffff8040088020 <sys_set_env_status+0x18c>
ffffff8040087f0c:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040087f10:	7100041f 	cmp	w0, #0x1
ffffff8040087f14:	54000541 	b.ne	ffffff8040087fbc <sys_set_env_status+0x128>  // b.any
ffffff8040087f18:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087f1c:	b9412800 	ldr	w0, [x0, #296]
ffffff8040087f20:	7100041f 	cmp	w0, #0x1
ffffff8040087f24:	540004c0 	b.eq	ffffff8040087fbc <sys_set_env_status+0x128>  // b.none
ffffff8040087f28:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087f2c:	b9414802 	ldr	w2, [x0, #328]
ffffff8040087f30:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087f34:	f004b4e1 	adrp	x1, ffffff8049726000 <envs+0x61eb8>
ffffff8040087f38:	91052021 	add	x1, x1, #0x148
ffffff8040087f3c:	2a0203e2 	mov	w2, w2
ffffff8040087f40:	f8627821 	ldr	x1, [x1, x2, lsl #3]
ffffff8040087f44:	f9009c01 	str	x1, [x0, #312]
ffffff8040087f48:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087f4c:	f100001f 	cmp	x0, #0x0
ffffff8040087f50:	54000140 	b.eq	ffffff8040087f78 <sys_set_env_status+0xe4>  // b.none
ffffff8040087f54:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040087f58:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087f5c:	b9414802 	ldr	w2, [x0, #328]
ffffff8040087f60:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087f64:	91052000 	add	x0, x0, #0x148
ffffff8040087f68:	2a0203e2 	mov	w2, w2
ffffff8040087f6c:	f8627800 	ldr	x0, [x0, x2, lsl #3]
ffffff8040087f70:	9104e021 	add	x1, x1, #0x138
ffffff8040087f74:	f900a001 	str	x1, [x0, #320]
ffffff8040087f78:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087f7c:	b9414801 	ldr	w1, [x0, #328]
ffffff8040087f80:	f94013a2 	ldr	x2, [x29, #32]
ffffff8040087f84:	f004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040087f88:	91052000 	add	x0, x0, #0x148
ffffff8040087f8c:	2a0103e1 	mov	w1, w1
ffffff8040087f90:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff8040087f94:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087f98:	b9414801 	ldr	w1, [x0, #328]
ffffff8040087f9c:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087fa0:	2a0103e1 	mov	w1, w1
ffffff8040087fa4:	d37df022 	lsl	x2, x1, #3
ffffff8040087fa8:	f004b4e1 	adrp	x1, ffffff8049726000 <envs+0x61eb8>
ffffff8040087fac:	91052021 	add	x1, x1, #0x148
ffffff8040087fb0:	8b010041 	add	x1, x2, x1
ffffff8040087fb4:	f900a001 	str	x1, [x0, #320]
ffffff8040087fb8:	14000016 	b	ffffff8040088010 <sys_set_env_status+0x17c>
ffffff8040087fbc:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040087fc0:	7100041f 	cmp	w0, #0x1
ffffff8040087fc4:	54000260 	b.eq	ffffff8040088010 <sys_set_env_status+0x17c>  // b.none
ffffff8040087fc8:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087fcc:	b9412800 	ldr	w0, [x0, #296]
ffffff8040087fd0:	7100041f 	cmp	w0, #0x1
ffffff8040087fd4:	540001e1 	b.ne	ffffff8040088010 <sys_set_env_status+0x17c>  // b.any
ffffff8040087fd8:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087fdc:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087fe0:	f100001f 	cmp	x0, #0x0
ffffff8040087fe4:	540000c0 	b.eq	ffffff8040087ffc <sys_set_env_status+0x168>  // b.none
ffffff8040087fe8:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040087fec:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087ff0:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087ff4:	f940a021 	ldr	x1, [x1, #320]
ffffff8040087ff8:	f900a001 	str	x1, [x0, #320]
ffffff8040087ffc:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040088000:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088004:	f940a000 	ldr	x0, [x0, #320]
ffffff8040088008:	f9409c21 	ldr	x1, [x1, #312]
ffffff804008800c:	f9000001 	str	x1, [x0]
ffffff8040088010:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088014:	b94017a1 	ldr	w1, [x29, #20]
ffffff8040088018:	b9012801 	str	w1, [x0, #296]
ffffff804008801c:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040088020:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040088024:	d65f03c0 	ret

ffffff8040088028 <sys_getenvid>:
ffffff8040088028:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff804008802c:	910003fd 	mov	x29, sp
ffffff8040088030:	97ffef80 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040088034:	12001c00 	and	w0, w0, #0xff
ffffff8040088038:	b9001fa0 	str	w0, [x29, #28]
ffffff804008803c:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040088040:	91058000 	add	x0, x0, #0x160
ffffff8040088044:	b9801fa1 	ldrsw	x1, [x29, #28]
ffffff8040088048:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff804008804c:	b9412000 	ldr	w0, [x0, #288]
ffffff8040088050:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040088054:	d65f03c0 	ret

ffffff8040088058 <sys_yield>:
ffffff8040088058:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff804008805c:	910003fd 	mov	x29, sp
ffffff8040088060:	97fffcac 	bl	ffffff8040087310 <sched_yield>
ffffff8040088064:	d503201f 	nop
ffffff8040088068:	a8c17bfd 	ldp	x29, x30, [sp], #16
ffffff804008806c:	d65f03c0 	ret

ffffff8040088070 <sys_env_destroy>:
ffffff8040088070:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040088074:	910003fd 	mov	x29, sp
ffffff8040088078:	b9001fa0 	str	w0, [x29, #28]
ffffff804008807c:	b9001ba1 	str	w1, [x29, #24]
ffffff8040088080:	910083a0 	add	x0, x29, #0x20
ffffff8040088084:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040088088:	aa0003e1 	mov	x1, x0
ffffff804008808c:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040088090:	97ffefbd 	bl	ffffff8040083f84 <envid2env>
ffffff8040088094:	b9002fa0 	str	w0, [x29, #44]
ffffff8040088098:	b9402fa0 	ldr	w0, [x29, #44]
ffffff804008809c:	7100001f 	cmp	w0, #0x0
ffffff80400880a0:	5400006a 	b.ge	ffffff80400880ac <sys_env_destroy+0x3c>  // b.tcont
ffffff80400880a4:	b9402fa0 	ldr	w0, [x29, #44]
ffffff80400880a8:	14000004 	b	ffffff80400880b8 <sys_env_destroy+0x48>
ffffff80400880ac:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400880b0:	97fff25c 	bl	ffffff8040084a20 <env_destroy>
ffffff80400880b4:	52800000 	mov	w0, #0x0                   	// #0
ffffff80400880b8:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400880bc:	d65f03c0 	ret

ffffff80400880c0 <sys_set_pgfault_handler>:
ffffff80400880c0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff80400880c4:	910003fd 	mov	x29, sp
ffffff80400880c8:	b9002fa0 	str	w0, [x29, #44]
ffffff80400880cc:	b9002ba1 	str	w1, [x29, #40]
ffffff80400880d0:	f90013a2 	str	x2, [x29, #32]
ffffff80400880d4:	f9000fa3 	str	x3, [x29, #24]
ffffff80400880d8:	9100c3a0 	add	x0, x29, #0x30
ffffff80400880dc:	52800002 	mov	w2, #0x0                   	// #0
ffffff80400880e0:	aa0003e1 	mov	x1, x0
ffffff80400880e4:	b9402ba0 	ldr	w0, [x29, #40]
ffffff80400880e8:	97ffefa7 	bl	ffffff8040083f84 <envid2env>
ffffff80400880ec:	b9003fa0 	str	w0, [x29, #60]
ffffff80400880f0:	b9403fa0 	ldr	w0, [x29, #60]
ffffff80400880f4:	7100001f 	cmp	w0, #0x0
ffffff80400880f8:	5400006a 	b.ge	ffffff8040088104 <sys_set_pgfault_handler+0x44>  // b.tcont
ffffff80400880fc:	b9403fa0 	ldr	w0, [x29, #60]
ffffff8040088100:	14000008 	b	ffffff8040088120 <sys_set_pgfault_handler+0x60>
ffffff8040088104:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040088108:	f94013a1 	ldr	x1, [x29, #32]
ffffff804008810c:	f900b801 	str	x1, [x0, #368]
ffffff8040088110:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040088114:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040088118:	f900bc01 	str	x1, [x0, #376]
ffffff804008811c:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040088120:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040088124:	d65f03c0 	ret

ffffff8040088128 <sys_set_trapframe>:
ffffff8040088128:	d10043ff 	sub	sp, sp, #0x10
ffffff804008812c:	b9000fe0 	str	w0, [sp, #12]
ffffff8040088130:	b9000be1 	str	w1, [sp, #8]
ffffff8040088134:	f90003e2 	str	x2, [sp]
ffffff8040088138:	d503201f 	nop
ffffff804008813c:	910043ff 	add	sp, sp, #0x10
ffffff8040088140:	d65f03c0 	ret

ffffff8040088144 <sys_ipc_recv>:
ffffff8040088144:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040088148:	910003fd 	mov	x29, sp
ffffff804008814c:	b9001fa0 	str	w0, [x29, #28]
ffffff8040088150:	f9000ba1 	str	x1, [x29, #16]
ffffff8040088154:	97ffef37 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040088158:	12001c00 	and	w0, w0, #0xff
ffffff804008815c:	b9002fa0 	str	w0, [x29, #44]
ffffff8040088160:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040088164:	91058000 	add	x0, x0, #0x160
ffffff8040088168:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff804008816c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088170:	f9400ba1 	ldr	x1, [x29, #16]
ffffff8040088174:	f900b001 	str	x1, [x0, #352]
ffffff8040088178:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff804008817c:	91058000 	add	x0, x0, #0x160
ffffff8040088180:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040088184:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088188:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008818c:	b9015c01 	str	w1, [x0, #348]
ffffff8040088190:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040088194:	91058000 	add	x0, x0, #0x160
ffffff8040088198:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff804008819c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400881a0:	52800041 	mov	w1, #0x2                   	// #2
ffffff80400881a4:	b9012801 	str	w1, [x0, #296]
ffffff80400881a8:	97ffffac 	bl	ffffff8040088058 <sys_yield>
ffffff80400881ac:	d503201f 	nop
ffffff80400881b0:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400881b4:	d65f03c0 	ret

ffffff80400881b8 <sys_ipc_can_send>:
ffffff80400881b8:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff80400881bc:	910003fd 	mov	x29, sp
ffffff80400881c0:	b9002fa0 	str	w0, [x29, #44]
ffffff80400881c4:	b9002ba1 	str	w1, [x29, #40]
ffffff80400881c8:	f90013a2 	str	x2, [x29, #32]
ffffff80400881cc:	f9000fa3 	str	x3, [x29, #24]
ffffff80400881d0:	f9000ba4 	str	x4, [x29, #16]
ffffff80400881d4:	9100e3a0 	add	x0, x29, #0x38
ffffff80400881d8:	52800002 	mov	w2, #0x0                   	// #0
ffffff80400881dc:	aa0003e1 	mov	x1, x0
ffffff80400881e0:	b9402ba0 	ldr	w0, [x29, #40]
ffffff80400881e4:	97ffef68 	bl	ffffff8040083f84 <envid2env>
ffffff80400881e8:	b9004fa0 	str	w0, [x29, #76]
ffffff80400881ec:	b9404fa0 	ldr	w0, [x29, #76]
ffffff80400881f0:	7100001f 	cmp	w0, #0x0
ffffff80400881f4:	540000ca 	b.ge	ffffff804008820c <sys_ipc_can_send+0x54>  // b.tcont
ffffff80400881f8:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400881fc:	9100a000 	add	x0, x0, #0x28
ffffff8040088200:	97fffbc1 	bl	ffffff8040087104 <printf>
ffffff8040088204:	12800020 	mov	w0, #0xfffffffe            	// #-2
ffffff8040088208:	14000044 	b	ffffff8040088318 <sys_ipc_can_send+0x160>
ffffff804008820c:	97ffef09 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040088210:	12001c00 	and	w0, w0, #0xff
ffffff8040088214:	b9004ba0 	str	w0, [x29, #72]
ffffff8040088218:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008821c:	f100001f 	cmp	x0, #0x0
ffffff8040088220:	54000500 	b.eq	ffffff80400882c0 <sys_ipc_can_send+0x108>  // b.none
ffffff8040088224:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088228:	f940b000 	ldr	x0, [x0, #352]
ffffff804008822c:	f100001f 	cmp	x0, #0x0
ffffff8040088230:	54000480 	b.eq	ffffff80400882c0 <sys_ipc_can_send+0x108>  // b.none
ffffff8040088234:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040088238:	91058000 	add	x0, x0, #0x160
ffffff804008823c:	b9804ba1 	ldrsw	x1, [x29, #72]
ffffff8040088240:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088244:	f9409804 	ldr	x4, [x0, #304]
ffffff8040088248:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff804008824c:	91058000 	add	x0, x0, #0x160
ffffff8040088250:	b9804ba1 	ldrsw	x1, [x29, #72]
ffffff8040088254:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088258:	b9412001 	ldr	w1, [x0, #288]
ffffff804008825c:	9100c3a0 	add	x0, x29, #0x30
ffffff8040088260:	2a0103e3 	mov	w3, w1
ffffff8040088264:	aa0003e2 	mov	x2, x0
ffffff8040088268:	f9400fa1 	ldr	x1, [x29, #24]
ffffff804008826c:	aa0403e0 	mov	x0, x4
ffffff8040088270:	97fff67b 	bl	ffffff8040085c5c <page_lookup>
ffffff8040088274:	f90023a0 	str	x0, [x29, #64]
ffffff8040088278:	f9401fa0 	ldr	x0, [x29, #56]
ffffff804008827c:	f9409805 	ldr	x5, [x0, #304]
ffffff8040088280:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088284:	f940b002 	ldr	x2, [x0, #352]
ffffff8040088288:	f9400ba1 	ldr	x1, [x29, #16]
ffffff804008828c:	d2800860 	mov	x0, #0x43                  	// #67
ffffff8040088290:	aa000021 	orr	x1, x1, x0
ffffff8040088294:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088298:	b9412000 	ldr	w0, [x0, #288]
ffffff804008829c:	12002400 	and	w0, w0, #0x3ff
ffffff80400882a0:	2a0003e4 	mov	w4, w0
ffffff80400882a4:	aa0103e3 	mov	x3, x1
ffffff80400882a8:	f94023a1 	ldr	x1, [x29, #64]
ffffff80400882ac:	aa0503e0 	mov	x0, x5
ffffff80400882b0:	97fff61b 	bl	ffffff8040085b1c <page_insert>
ffffff80400882b4:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400882b8:	f9400ba1 	ldr	x1, [x29, #16]
ffffff80400882bc:	f900b401 	str	x1, [x0, #360]
ffffff80400882c0:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400882c4:	b9415c00 	ldr	w0, [x0, #348]
ffffff80400882c8:	7100001f 	cmp	w0, #0x0
ffffff80400882cc:	54000061 	b.ne	ffffff80400882d8 <sys_ipc_can_send+0x120>  // b.any
ffffff80400882d0:	128000a0 	mov	w0, #0xfffffffa            	// #-6
ffffff80400882d4:	14000011 	b	ffffff8040088318 <sys_ipc_can_send+0x160>
ffffff80400882d8:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400882dc:	b9015c1f 	str	wzr, [x0, #348]
ffffff80400882e0:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff80400882e4:	91058000 	add	x0, x0, #0x160
ffffff80400882e8:	b9804ba1 	ldrsw	x1, [x29, #72]
ffffff80400882ec:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff80400882f0:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400882f4:	b9412021 	ldr	w1, [x1, #288]
ffffff80400882f8:	b9015801 	str	w1, [x0, #344]
ffffff80400882fc:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088300:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040088304:	f900a801 	str	x1, [x0, #336]
ffffff8040088308:	f9401fa0 	ldr	x0, [x29, #56]
ffffff804008830c:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040088310:	b9012801 	str	w1, [x0, #296]
ffffff8040088314:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040088318:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff804008831c:	d65f03c0 	ret

ffffff8040088320 <get_el>:
ffffff8040088320:	d10043ff 	sub	sp, sp, #0x10
ffffff8040088324:	d5384240 	mrs	x0, currentel
ffffff8040088328:	f90007e0 	str	x0, [sp, #8]
ffffff804008832c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040088330:	910043ff 	add	sp, sp, #0x10
ffffff8040088334:	d65f03c0 	ret

ffffff8040088338 <get_elr>:
ffffff8040088338:	d10043ff 	sub	sp, sp, #0x10
ffffff804008833c:	d5384020 	mrs	x0, elr_el1
ffffff8040088340:	f90007e0 	str	x0, [sp, #8]
ffffff8040088344:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040088348:	910043ff 	add	sp, sp, #0x10
ffffff804008834c:	d65f03c0 	ret

ffffff8040088350 <get_esr>:
ffffff8040088350:	d10043ff 	sub	sp, sp, #0x10
ffffff8040088354:	d5385200 	mrs	x0, esr_el1
ffffff8040088358:	f90007e0 	str	x0, [sp, #8]
ffffff804008835c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040088360:	910043ff 	add	sp, sp, #0x10
ffffff8040088364:	d65f03c0 	ret

ffffff8040088368 <get_far>:
ffffff8040088368:	d10043ff 	sub	sp, sp, #0x10
ffffff804008836c:	d5386000 	mrs	x0, far_el1
ffffff8040088370:	f90007e0 	str	x0, [sp, #8]
ffffff8040088374:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040088378:	910043ff 	add	sp, sp, #0x10
ffffff804008837c:	d65f03c0 	ret

ffffff8040088380 <handle_el0_syscall>:
ffffff8040088380:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff8040088384:	910003fd 	mov	x29, sp
ffffff8040088388:	97ffeeaa 	bl	ffffff8040083e30 <cpu_current_id>
ffffff804008838c:	12001c00 	and	w0, w0, #0xff
ffffff8040088390:	2a0003e1 	mov	w1, w0
ffffff8040088394:	d004fce0 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff8040088398:	91062000 	add	x0, x0, #0x188
ffffff804008839c:	93407c21 	sxtw	x1, w1
ffffff80400883a0:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400883a4:	f9400000 	ldr	x0, [x0]
ffffff80400883a8:	b9004fa0 	str	w0, [x29, #76]
ffffff80400883ac:	97ffeea1 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400883b0:	12001c00 	and	w0, w0, #0xff
ffffff80400883b4:	2a0003e1 	mov	w1, w0
ffffff80400883b8:	d004fce0 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff80400883bc:	91062000 	add	x0, x0, #0x188
ffffff80400883c0:	93407c21 	sxtw	x1, w1
ffffff80400883c4:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400883c8:	f9400400 	ldr	x0, [x0, #8]
ffffff80400883cc:	f90023a0 	str	x0, [x29, #64]
ffffff80400883d0:	97ffee98 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400883d4:	12001c00 	and	w0, w0, #0xff
ffffff80400883d8:	2a0003e1 	mov	w1, w0
ffffff80400883dc:	d004fce0 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff80400883e0:	91062000 	add	x0, x0, #0x188
ffffff80400883e4:	93407c21 	sxtw	x1, w1
ffffff80400883e8:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400883ec:	f9400800 	ldr	x0, [x0, #16]
ffffff80400883f0:	f9001fa0 	str	x0, [x29, #56]
ffffff80400883f4:	97ffee8f 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400883f8:	12001c00 	and	w0, w0, #0xff
ffffff80400883fc:	2a0003e1 	mov	w1, w0
ffffff8040088400:	d004fce0 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff8040088404:	91062000 	add	x0, x0, #0x188
ffffff8040088408:	93407c21 	sxtw	x1, w1
ffffff804008840c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088410:	f9400c00 	ldr	x0, [x0, #24]
ffffff8040088414:	f9001ba0 	str	x0, [x29, #48]
ffffff8040088418:	97ffee86 	bl	ffffff8040083e30 <cpu_current_id>
ffffff804008841c:	12001c00 	and	w0, w0, #0xff
ffffff8040088420:	2a0003e1 	mov	w1, w0
ffffff8040088424:	d004fce0 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff8040088428:	91062000 	add	x0, x0, #0x188
ffffff804008842c:	93407c21 	sxtw	x1, w1
ffffff8040088430:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088434:	f9401000 	ldr	x0, [x0, #32]
ffffff8040088438:	f90017a0 	str	x0, [x29, #40]
ffffff804008843c:	97ffee7d 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040088440:	12001c00 	and	w0, w0, #0xff
ffffff8040088444:	2a0003e1 	mov	w1, w0
ffffff8040088448:	d004fce0 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff804008844c:	91062000 	add	x0, x0, #0x188
ffffff8040088450:	93407c21 	sxtw	x1, w1
ffffff8040088454:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088458:	f9401400 	ldr	x0, [x0, #40]
ffffff804008845c:	f90013a0 	str	x0, [x29, #32]
ffffff8040088460:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088464:	71001c1f 	cmp	w0, #0x7
ffffff8040088468:	54000b60 	b.eq	ffffff80400885d4 <handle_el0_syscall+0x254>  // b.none
ffffff804008846c:	71001c1f 	cmp	w0, #0x7
ffffff8040088470:	540001ec 	b.gt	ffffff80400884ac <handle_el0_syscall+0x12c>
ffffff8040088474:	71000c1f 	cmp	w0, #0x3
ffffff8040088478:	54000540 	b.eq	ffffff8040088520 <handle_el0_syscall+0x1a0>  // b.none
ffffff804008847c:	71000c1f 	cmp	w0, #0x3
ffffff8040088480:	540000cc 	b.gt	ffffff8040088498 <handle_el0_syscall+0x118>
ffffff8040088484:	7100041f 	cmp	w0, #0x1
ffffff8040088488:	540003c0 	b.eq	ffffff8040088500 <handle_el0_syscall+0x180>  // b.none
ffffff804008848c:	7100081f 	cmp	w0, #0x2
ffffff8040088490:	54000440 	b.eq	ffffff8040088518 <handle_el0_syscall+0x198>  // b.none
ffffff8040088494:	14000015 	b	ffffff80400884e8 <handle_el0_syscall+0x168>
ffffff8040088498:	7100141f 	cmp	w0, #0x5
ffffff804008849c:	540006a0 	b.eq	ffffff8040088570 <handle_el0_syscall+0x1f0>  // b.none
ffffff80400884a0:	7100141f 	cmp	w0, #0x5
ffffff80400884a4:	540007cc 	b.gt	ffffff804008859c <handle_el0_syscall+0x21c>
ffffff80400884a8:	14000027 	b	ffffff8040088544 <handle_el0_syscall+0x1c4>
ffffff80400884ac:	71002c1f 	cmp	w0, #0xb
ffffff80400884b0:	54000d60 	b.eq	ffffff804008865c <handle_el0_syscall+0x2dc>  // b.none
ffffff80400884b4:	71002c1f 	cmp	w0, #0xb
ffffff80400884b8:	540000cc 	b.gt	ffffff80400884d0 <handle_el0_syscall+0x150>
ffffff80400884bc:	7100241f 	cmp	w0, #0x9
ffffff80400884c0:	54000aa0 	b.eq	ffffff8040088614 <handle_el0_syscall+0x294>  // b.none
ffffff80400884c4:	7100241f 	cmp	w0, #0x9
ffffff80400884c8:	54000bcc 	b.gt	ffffff8040088640 <handle_el0_syscall+0x2c0>
ffffff80400884cc:	1400004c 	b	ffffff80400885fc <handle_el0_syscall+0x27c>
ffffff80400884d0:	7100341f 	cmp	w0, #0xd
ffffff80400884d4:	54000e60 	b.eq	ffffff80400886a0 <handle_el0_syscall+0x320>  // b.none
ffffff80400884d8:	7100341f 	cmp	w0, #0xd
ffffff80400884dc:	54000cab 	b.lt	ffffff8040088670 <handle_el0_syscall+0x2f0>  // b.tstop
ffffff80400884e0:	7100381f 	cmp	w0, #0xe
ffffff80400884e4:	54000e60 	b.eq	ffffff80400886b0 <handle_el0_syscall+0x330>  // b.none
ffffff80400884e8:	f94023a0 	ldr	x0, [x29, #64]
ffffff80400884ec:	12001c00 	and	w0, w0, #0xff
ffffff80400884f0:	2a0003e1 	mov	w1, w0
ffffff80400884f4:	b9404fa0 	ldr	w0, [x29, #76]
ffffff80400884f8:	97fffd33 	bl	ffffff80400879c4 <sys_putchar>
ffffff80400884fc:	14000074 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff8040088500:	97fffeca 	bl	ffffff8040088028 <sys_getenvid>
ffffff8040088504:	2a0003e0 	mov	w0, w0
ffffff8040088508:	f9000fa0 	str	x0, [x29, #24]
ffffff804008850c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088510:	97fffd1e 	bl	ffffff8040087988 <sys_set_return>
ffffff8040088514:	1400006e 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff8040088518:	97fffed0 	bl	ffffff8040088058 <sys_yield>
ffffff804008851c:	1400006c 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff8040088520:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088524:	2a0003e1 	mov	w1, w0
ffffff8040088528:	b9404fa0 	ldr	w0, [x29, #76]
ffffff804008852c:	97fffed1 	bl	ffffff8040088070 <sys_env_destroy>
ffffff8040088530:	93407c00 	sxtw	x0, w0
ffffff8040088534:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088538:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008853c:	97fffd13 	bl	ffffff8040087988 <sys_set_return>
ffffff8040088540:	14000063 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff8040088544:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088548:	f9401ba3 	ldr	x3, [x29, #48]
ffffff804008854c:	f9401fa2 	ldr	x2, [x29, #56]
ffffff8040088550:	2a0003e1 	mov	w1, w0
ffffff8040088554:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088558:	97fffeda 	bl	ffffff80400880c0 <sys_set_pgfault_handler>
ffffff804008855c:	93407c00 	sxtw	x0, w0
ffffff8040088560:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088564:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088568:	97fffd08 	bl	ffffff8040087988 <sys_set_return>
ffffff804008856c:	14000058 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff8040088570:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088574:	f9401ba3 	ldr	x3, [x29, #48]
ffffff8040088578:	f9401fa2 	ldr	x2, [x29, #56]
ffffff804008857c:	2a0003e1 	mov	w1, w0
ffffff8040088580:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088584:	97fffd27 	bl	ffffff8040087a20 <sys_mem_alloc>
ffffff8040088588:	93407c00 	sxtw	x0, w0
ffffff804008858c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088590:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088594:	97fffcfd 	bl	ffffff8040087988 <sys_set_return>
ffffff8040088598:	1400004d 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff804008859c:	f94023a0 	ldr	x0, [x29, #64]
ffffff80400885a0:	2a0003e1 	mov	w1, w0
ffffff80400885a4:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400885a8:	f94013a5 	ldr	x5, [x29, #32]
ffffff80400885ac:	f94017a4 	ldr	x4, [x29, #40]
ffffff80400885b0:	2a0003e3 	mov	w3, w0
ffffff80400885b4:	f9401fa2 	ldr	x2, [x29, #56]
ffffff80400885b8:	b9404fa0 	ldr	w0, [x29, #76]
ffffff80400885bc:	97fffd5e 	bl	ffffff8040087b34 <sys_mem_map>
ffffff80400885c0:	93407c00 	sxtw	x0, w0
ffffff80400885c4:	f9000fa0 	str	x0, [x29, #24]
ffffff80400885c8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400885cc:	97fffcef 	bl	ffffff8040087988 <sys_set_return>
ffffff80400885d0:	1400003f 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff80400885d4:	f94023a0 	ldr	x0, [x29, #64]
ffffff80400885d8:	f9401fa2 	ldr	x2, [x29, #56]
ffffff80400885dc:	2a0003e1 	mov	w1, w0
ffffff80400885e0:	b9404fa0 	ldr	w0, [x29, #76]
ffffff80400885e4:	97fffdae 	bl	ffffff8040087c9c <sys_mem_unmap>
ffffff80400885e8:	93407c00 	sxtw	x0, w0
ffffff80400885ec:	f9000fa0 	str	x0, [x29, #24]
ffffff80400885f0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400885f4:	97fffce5 	bl	ffffff8040087988 <sys_set_return>
ffffff80400885f8:	14000035 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff80400885fc:	97fffdc6 	bl	ffffff8040087d14 <sys_env_alloc>
ffffff8040088600:	2a0003e0 	mov	w0, w0
ffffff8040088604:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088608:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008860c:	97fffcdf 	bl	ffffff8040087988 <sys_set_return>
ffffff8040088610:	1400002f 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff8040088614:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088618:	2a0003e1 	mov	w1, w0
ffffff804008861c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088620:	2a0003e2 	mov	w2, w0
ffffff8040088624:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088628:	97fffe1b 	bl	ffffff8040087e94 <sys_set_env_status>
ffffff804008862c:	93407c00 	sxtw	x0, w0
ffffff8040088630:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088634:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088638:	97fffcd4 	bl	ffffff8040087988 <sys_set_return>
ffffff804008863c:	14000024 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff8040088640:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088644:	2a0003e1 	mov	w1, w0
ffffff8040088648:	f9401fa0 	ldr	x0, [x29, #56]
ffffff804008864c:	aa0003e2 	mov	x2, x0
ffffff8040088650:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088654:	97fffeb5 	bl	ffffff8040088128 <sys_set_trapframe>
ffffff8040088658:	1400001d 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff804008865c:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088660:	aa0003e1 	mov	x1, x0
ffffff8040088664:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088668:	97fffce2 	bl	ffffff80400879f0 <sys_panic>
ffffff804008866c:	14000018 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff8040088670:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088674:	f94017a4 	ldr	x4, [x29, #40]
ffffff8040088678:	f9401ba3 	ldr	x3, [x29, #48]
ffffff804008867c:	f9401fa2 	ldr	x2, [x29, #56]
ffffff8040088680:	2a0003e1 	mov	w1, w0
ffffff8040088684:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088688:	97fffecc 	bl	ffffff80400881b8 <sys_ipc_can_send>
ffffff804008868c:	93407c00 	sxtw	x0, w0
ffffff8040088690:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088694:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088698:	97fffcbc 	bl	ffffff8040087988 <sys_set_return>
ffffff804008869c:	1400000c 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff80400886a0:	f94023a1 	ldr	x1, [x29, #64]
ffffff80400886a4:	b9404fa0 	ldr	w0, [x29, #76]
ffffff80400886a8:	97fffea7 	bl	ffffff8040088144 <sys_ipc_recv>
ffffff80400886ac:	14000008 	b	ffffff80400886cc <handle_el0_syscall+0x34c>
ffffff80400886b0:	97fffcce 	bl	ffffff80400879e8 <sys_cgetc>
ffffff80400886b4:	12001c00 	and	w0, w0, #0xff
ffffff80400886b8:	92401c00 	and	x0, x0, #0xff
ffffff80400886bc:	f9000fa0 	str	x0, [x29, #24]
ffffff80400886c0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400886c4:	97fffcb1 	bl	ffffff8040087988 <sys_set_return>
ffffff80400886c8:	d503201f 	nop
ffffff80400886cc:	d503201f 	nop
ffffff80400886d0:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff80400886d4:	d65f03c0 	ret

ffffff80400886d8 <handle_el0_pgfault>:
ffffff80400886d8:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff80400886dc:	910003fd 	mov	x29, sp
ffffff80400886e0:	97ffff22 	bl	ffffff8040088368 <get_far>
ffffff80400886e4:	f90017a0 	str	x0, [x29, #40]
ffffff80400886e8:	97ffedd2 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400886ec:	12001c00 	and	w0, w0, #0xff
ffffff80400886f0:	b90027a0 	str	w0, [x29, #36]
ffffff80400886f4:	97ffff11 	bl	ffffff8040088338 <get_elr>
ffffff80400886f8:	aa0003e1 	mov	x1, x0
ffffff80400886fc:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088700:	91014000 	add	x0, x0, #0x50
ffffff8040088704:	aa0103e2 	mov	x2, x1
ffffff8040088708:	b94027a1 	ldr	w1, [x29, #36]
ffffff804008870c:	97fffa7e 	bl	ffffff8040087104 <printf>
ffffff8040088710:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040088714:	91058000 	add	x0, x0, #0x160
ffffff8040088718:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008871c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088720:	f940b800 	ldr	x0, [x0, #368]
ffffff8040088724:	f100001f 	cmp	x0, #0x0
ffffff8040088728:	540002c1 	b.ne	ffffff8040088780 <handle_el0_pgfault+0xa8>  // b.any
ffffff804008872c:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088730:	9101e000 	add	x0, x0, #0x78
ffffff8040088734:	b94027a1 	ldr	w1, [x29, #36]
ffffff8040088738:	97fffa73 	bl	ffffff8040087104 <printf>
ffffff804008873c:	97ffff05 	bl	ffffff8040088350 <get_esr>
ffffff8040088740:	aa0003e1 	mov	x1, x0
ffffff8040088744:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088748:	91024000 	add	x0, x0, #0x90
ffffff804008874c:	97fffa6e 	bl	ffffff8040087104 <printf>
ffffff8040088750:	97ffff06 	bl	ffffff8040088368 <get_far>
ffffff8040088754:	aa0003e1 	mov	x1, x0
ffffff8040088758:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff804008875c:	91028000 	add	x0, x0, #0xa0
ffffff8040088760:	97fffa69 	bl	ffffff8040087104 <printf>
ffffff8040088764:	97fffef5 	bl	ffffff8040088338 <get_elr>
ffffff8040088768:	aa0003e1 	mov	x1, x0
ffffff804008876c:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088770:	9102c000 	add	x0, x0, #0xb0
ffffff8040088774:	97fffa64 	bl	ffffff8040087104 <printf>
ffffff8040088778:	d503207f 	wfi
ffffff804008877c:	17ffffff 	b	ffffff8040088778 <handle_el0_pgfault+0xa0>
ffffff8040088780:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040088784:	91058000 	add	x0, x0, #0x160
ffffff8040088788:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008878c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088790:	f9409805 	ldr	x5, [x0, #304]
ffffff8040088794:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040088798:	91058000 	add	x0, x0, #0x160
ffffff804008879c:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400887a0:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400887a4:	b9412001 	ldr	w1, [x0, #288]
ffffff80400887a8:	910043a0 	add	x0, x29, #0x10
ffffff80400887ac:	2a0103e4 	mov	w4, w1
ffffff80400887b0:	aa0003e3 	mov	x3, x0
ffffff80400887b4:	52800002 	mov	w2, #0x0                   	// #0
ffffff80400887b8:	f94017a1 	ldr	x1, [x29, #40]
ffffff80400887bc:	aa0503e0 	mov	x0, x5
ffffff80400887c0:	97fff462 	bl	ffffff8040085948 <pgdir_walk>
ffffff80400887c4:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400887c8:	f9400000 	ldr	x0, [x0]
ffffff80400887cc:	92490000 	and	x0, x0, #0x80000000000000
ffffff80400887d0:	f100001f 	cmp	x0, #0x0
ffffff80400887d4:	540002c1 	b.ne	ffffff804008882c <handle_el0_pgfault+0x154>  // b.any
ffffff80400887d8:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400887dc:	9101e000 	add	x0, x0, #0x78
ffffff80400887e0:	b94027a1 	ldr	w1, [x29, #36]
ffffff80400887e4:	97fffa48 	bl	ffffff8040087104 <printf>
ffffff80400887e8:	97fffeda 	bl	ffffff8040088350 <get_esr>
ffffff80400887ec:	aa0003e1 	mov	x1, x0
ffffff80400887f0:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400887f4:	91024000 	add	x0, x0, #0x90
ffffff80400887f8:	97fffa43 	bl	ffffff8040087104 <printf>
ffffff80400887fc:	97fffedb 	bl	ffffff8040088368 <get_far>
ffffff8040088800:	aa0003e1 	mov	x1, x0
ffffff8040088804:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088808:	91028000 	add	x0, x0, #0xa0
ffffff804008880c:	97fffa3e 	bl	ffffff8040087104 <printf>
ffffff8040088810:	97fffeca 	bl	ffffff8040088338 <get_elr>
ffffff8040088814:	aa0003e1 	mov	x1, x0
ffffff8040088818:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff804008881c:	9102c000 	add	x0, x0, #0xb0
ffffff8040088820:	97fffa39 	bl	ffffff8040087104 <printf>
ffffff8040088824:	d503207f 	wfi
ffffff8040088828:	17ffffff 	b	ffffff8040088824 <handle_el0_pgfault+0x14c>
ffffff804008882c:	d004fce0 	adrp	x0, ffffff804a026000 <pages+0x8ffe78>
ffffff8040088830:	91062000 	add	x0, x0, #0x188
ffffff8040088834:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040088838:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff804008883c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088840:	d2802202 	mov	x2, #0x110                 	// #272
ffffff8040088844:	d29fde01 	mov	x1, #0xfef0                	// #65264
ffffff8040088848:	f2afffe1 	movk	x1, #0x7fff, lsl #16
ffffff804008884c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088850:	97fff3c7 	bl	ffffff804008576c <bcopy>
ffffff8040088854:	d004b4e0 	adrp	x0, ffffff8049726000 <envs+0x61eb8>
ffffff8040088858:	91058000 	add	x0, x0, #0x160
ffffff804008885c:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040088860:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088864:	f940b801 	ldr	x1, [x0, #368]
ffffff8040088868:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008886c:	f9008001 	str	x1, [x0, #256]
ffffff8040088870:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088874:	d29fde01 	mov	x1, #0xfef0                	// #65264
ffffff8040088878:	f2afffe1 	movk	x1, #0x7fff, lsl #16
ffffff804008887c:	f9008401 	str	x1, [x0, #264]
ffffff8040088880:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088884:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040088888:	f9000001 	str	x1, [x0]
ffffff804008888c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088890:	f9408001 	ldr	x1, [x0, #256]
ffffff8040088894:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088898:	91032000 	add	x0, x0, #0xc8
ffffff804008889c:	97fffa1a 	bl	ffffff8040087104 <printf>
ffffff80400888a0:	d503201f 	nop
ffffff80400888a4:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400888a8:	d65f03c0 	ret

ffffff80400888ac <handle_el0_sync>:
ffffff80400888ac:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff80400888b0:	910003fd 	mov	x29, sp
ffffff80400888b4:	97ffed5f 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400888b8:	12001c00 	and	w0, w0, #0xff
ffffff80400888bc:	2a0003e1 	mov	w1, w0
ffffff80400888c0:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400888c4:	91038000 	add	x0, x0, #0xe0
ffffff80400888c8:	97fffa0f 	bl	ffffff8040087104 <printf>
ffffff80400888cc:	97fffea1 	bl	ffffff8040088350 <get_esr>
ffffff80400888d0:	aa0003e1 	mov	x1, x0
ffffff80400888d4:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400888d8:	91024000 	add	x0, x0, #0x90
ffffff80400888dc:	97fffa0a 	bl	ffffff8040087104 <printf>
ffffff80400888e0:	97fffe9c 	bl	ffffff8040088350 <get_esr>
ffffff80400888e4:	d35afc01 	lsr	x1, x0, #26
ffffff80400888e8:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400888ec:	91040000 	add	x0, x0, #0x100
ffffff80400888f0:	97fffa05 	bl	ffffff8040087104 <printf>
ffffff80400888f4:	97fffe9d 	bl	ffffff8040088368 <get_far>
ffffff80400888f8:	aa0003e1 	mov	x1, x0
ffffff80400888fc:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088900:	91044000 	add	x0, x0, #0x110
ffffff8040088904:	97fffa00 	bl	ffffff8040087104 <printf>
ffffff8040088908:	97fffe8c 	bl	ffffff8040088338 <get_elr>
ffffff804008890c:	aa0003e1 	mov	x1, x0
ffffff8040088910:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088914:	91048000 	add	x0, x0, #0x120
ffffff8040088918:	97fff9fb 	bl	ffffff8040087104 <printf>
ffffff804008891c:	d503207f 	wfi
ffffff8040088920:	17ffffff 	b	ffffff804008891c <handle_el0_sync+0x70>

ffffff8040088924 <handle_el1_sync>:
ffffff8040088924:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff8040088928:	910003fd 	mov	x29, sp
ffffff804008892c:	97ffed41 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040088930:	12001c00 	and	w0, w0, #0xff
ffffff8040088934:	2a0003e1 	mov	w1, w0
ffffff8040088938:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff804008893c:	9104c000 	add	x0, x0, #0x130
ffffff8040088940:	97fff9f1 	bl	ffffff8040087104 <printf>
ffffff8040088944:	97fffe83 	bl	ffffff8040088350 <get_esr>
ffffff8040088948:	aa0003e1 	mov	x1, x0
ffffff804008894c:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088950:	91024000 	add	x0, x0, #0x90
ffffff8040088954:	97fff9ec 	bl	ffffff8040087104 <printf>
ffffff8040088958:	97fffe7e 	bl	ffffff8040088350 <get_esr>
ffffff804008895c:	d35afc01 	lsr	x1, x0, #26
ffffff8040088960:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088964:	91040000 	add	x0, x0, #0x100
ffffff8040088968:	97fff9e7 	bl	ffffff8040087104 <printf>
ffffff804008896c:	97fffe7f 	bl	ffffff8040088368 <get_far>
ffffff8040088970:	aa0003e1 	mov	x1, x0
ffffff8040088974:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088978:	91044000 	add	x0, x0, #0x110
ffffff804008897c:	97fff9e2 	bl	ffffff8040087104 <printf>
ffffff8040088980:	97fffe6e 	bl	ffffff8040088338 <get_elr>
ffffff8040088984:	aa0003e1 	mov	x1, x0
ffffff8040088988:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff804008898c:	91048000 	add	x0, x0, #0x120
ffffff8040088990:	97fff9dd 	bl	ffffff8040087104 <printf>
ffffff8040088994:	d503207f 	wfi
ffffff8040088998:	17ffffff 	b	ffffff8040088994 <handle_el1_sync+0x70>

ffffff804008899c <handle_fiq>:
ffffff804008899c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff80400889a0:	910003fd 	mov	x29, sp
ffffff80400889a4:	97ffed23 	bl	ffffff8040083e30 <cpu_current_id>
ffffff80400889a8:	12001c00 	and	w0, w0, #0xff
ffffff80400889ac:	2a0003e1 	mov	w1, w0
ffffff80400889b0:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400889b4:	91054000 	add	x0, x0, #0x150
ffffff80400889b8:	97fff9d3 	bl	ffffff8040087104 <printf>
ffffff80400889bc:	97fffe59 	bl	ffffff8040088320 <get_el>
ffffff80400889c0:	aa0003e1 	mov	x1, x0
ffffff80400889c4:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400889c8:	9105c000 	add	x0, x0, #0x170
ffffff80400889cc:	97fff9ce 	bl	ffffff8040087104 <printf>
ffffff80400889d0:	97fffe60 	bl	ffffff8040088350 <get_esr>
ffffff80400889d4:	aa0003e1 	mov	x1, x0
ffffff80400889d8:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400889dc:	91024000 	add	x0, x0, #0x90
ffffff80400889e0:	97fff9c9 	bl	ffffff8040087104 <printf>
ffffff80400889e4:	97fffe61 	bl	ffffff8040088368 <get_far>
ffffff80400889e8:	aa0003e1 	mov	x1, x0
ffffff80400889ec:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff80400889f0:	91044000 	add	x0, x0, #0x110
ffffff80400889f4:	97fff9c4 	bl	ffffff8040087104 <printf>
ffffff80400889f8:	97fffe50 	bl	ffffff8040088338 <get_elr>
ffffff80400889fc:	aa0003e1 	mov	x1, x0
ffffff8040088a00:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088a04:	91048000 	add	x0, x0, #0x120
ffffff8040088a08:	97fff9bf 	bl	ffffff8040087104 <printf>
ffffff8040088a0c:	d503207f 	wfi
ffffff8040088a10:	17ffffff 	b	ffffff8040088a0c <handle_fiq+0x70>

ffffff8040088a14 <handle_err>:
ffffff8040088a14:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff8040088a18:	910003fd 	mov	x29, sp
ffffff8040088a1c:	97ffed05 	bl	ffffff8040083e30 <cpu_current_id>
ffffff8040088a20:	12001c00 	and	w0, w0, #0xff
ffffff8040088a24:	2a0003e1 	mov	w1, w0
ffffff8040088a28:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088a2c:	91062000 	add	x0, x0, #0x188
ffffff8040088a30:	97fff9b5 	bl	ffffff8040087104 <printf>
ffffff8040088a34:	97fffe3b 	bl	ffffff8040088320 <get_el>
ffffff8040088a38:	aa0003e1 	mov	x1, x0
ffffff8040088a3c:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088a40:	9105c000 	add	x0, x0, #0x170
ffffff8040088a44:	97fff9b0 	bl	ffffff8040087104 <printf>
ffffff8040088a48:	97fffe42 	bl	ffffff8040088350 <get_esr>
ffffff8040088a4c:	aa0003e1 	mov	x1, x0
ffffff8040088a50:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088a54:	91024000 	add	x0, x0, #0x90
ffffff8040088a58:	97fff9ab 	bl	ffffff8040087104 <printf>
ffffff8040088a5c:	97fffe43 	bl	ffffff8040088368 <get_far>
ffffff8040088a60:	aa0003e1 	mov	x1, x0
ffffff8040088a64:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088a68:	91044000 	add	x0, x0, #0x110
ffffff8040088a6c:	97fff9a6 	bl	ffffff8040087104 <printf>
ffffff8040088a70:	97fffe32 	bl	ffffff8040088338 <get_elr>
ffffff8040088a74:	aa0003e1 	mov	x1, x0
ffffff8040088a78:	b0000000 	adrp	x0, ffffff8040089000 <theFatalMsg+0x1f0>
ffffff8040088a7c:	9102c000 	add	x0, x0, #0xb0
ffffff8040088a80:	97fff9a1 	bl	ffffff8040087104 <printf>
ffffff8040088a84:	d503207f 	wfi
ffffff8040088a88:	17ffffff 	b	ffffff8040088a84 <handle_err+0x70>
