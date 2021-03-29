
mos_vm.elf：     文件格式 elf64-littleaarch64


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
ffffff80400803ac:	900084e0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff80400803b0:	911a6000 	add	x0, x0, #0x698
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
ffffff80400828ac:	9400058e 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff80400828b0:	3900bfa0 	strb	w0, [x29, #47]
ffffff80400828b4:	3940bfa0 	ldrb	w0, [x29, #47]
ffffff80400828b8:	7100001f 	cmp	w0, #0x0
ffffff80400828bc:	54000741 	b.ne	ffffff80400829a4 <main+0x104>  // b.any
ffffff80400828c0:	d00084c0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff80400828c4:	911a6001 	add	x1, x0, #0x698
ffffff80400828c8:	d00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400828cc:	9123e000 	add	x0, x0, #0x8f8
ffffff80400828d0:	cb000020 	sub	x0, x1, x0
ffffff80400828d4:	aa0003e1 	mov	x1, x0
ffffff80400828d8:	d00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400828dc:	9123e000 	add	x0, x0, #0x8f8
ffffff80400828e0:	aa0103e2 	mov	x2, x1
ffffff80400828e4:	52800001 	mov	w1, #0x0                   	// #0
ffffff80400828e8:	97ffffd9 	bl	ffffff804008284c <memset>
ffffff80400828ec:	3940bfa1 	ldrb	w1, [x29, #47]
ffffff80400828f0:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff80400828f4:	913a2000 	add	x0, x0, #0xe88
ffffff80400828f8:	94001264 	bl	ffffff8040087288 <printf>
ffffff80400828fc:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040082900:	913a6000 	add	x0, x0, #0xe98
ffffff8040082904:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040082908:	94001260 	bl	ffffff8040087288 <printf>
ffffff804008290c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040082910:	94000b3b 	bl	ffffff80400855fc <page_init>
ffffff8040082914:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040082918:	913aa000 	add	x0, x0, #0xea8
ffffff804008291c:	9400125b 	bl	ffffff8040087288 <printf>
ffffff8040082920:	94000612 	bl	ffffff8040084168 <env_init>
ffffff8040082924:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040082928:	913ae000 	add	x0, x0, #0xeb8
ffffff804008292c:	94001257 	bl	ffffff8040087288 <printf>
ffffff8040082930:	940003d6 	bl	ffffff8040083888 <cap_init>
ffffff8040082934:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040082938:	913b2000 	add	x0, x0, #0xec8
ffffff804008293c:	94001253 	bl	ffffff8040087288 <printf>
ffffff8040082940:	94000566 	bl	ffffff8040083ed8 <cpu_disable_irq>
ffffff8040082944:	9400097e 	bl	ffffff8040084f3c <gicd_init>
ffffff8040082948:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff804008294c:	913b6000 	add	x0, x0, #0xed8
ffffff8040082950:	9400124e 	bl	ffffff8040087288 <printf>
ffffff8040082954:	d2801fe0 	mov	x0, #0xff                  	// #255
ffffff8040082958:	f90013a0 	str	x0, [x29, #32]
ffffff804008295c:	d00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040082960:	9123e001 	add	x1, x0, #0x8f8
ffffff8040082964:	f0000260 	adrp	x0, ffffff80400d1000 <_binary_idle_elf_start+0x8888>
ffffff8040082968:	913e0000 	add	x0, x0, #0xf80
ffffff804008296c:	cb000020 	sub	x0, x1, x0
ffffff8040082970:	2a0003e1 	mov	w1, w0
ffffff8040082974:	f0000260 	adrp	x0, ffffff80400d1000 <_binary_idle_elf_start+0x8888>
ffffff8040082978:	913e0000 	add	x0, x0, #0xf80
ffffff804008297c:	f94013a3 	ldr	x3, [x29, #32]
ffffff8040082980:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040082984:	940007c2 	bl	ffffff804008488c <env_create_priority>
ffffff8040082988:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff804008298c:	913ba000 	add	x0, x0, #0xee8
ffffff8040082990:	9400123e 	bl	ffffff8040087288 <printf>
ffffff8040082994:	9400053a 	bl	ffffff8040083e7c <cpu_boot_secondary>
ffffff8040082998:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff804008299c:	913be000 	add	x0, x0, #0xef8
ffffff80400829a0:	9400123a 	bl	ffffff8040087288 <printf>
ffffff80400829a4:	940009c7 	bl	ffffff80400850c0 <gicc_init>
ffffff80400829a8:	3940bfa1 	ldrb	w1, [x29, #47]
ffffff80400829ac:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff80400829b0:	913c4000 	add	x0, x0, #0xf10
ffffff80400829b4:	94001235 	bl	ffffff8040087288 <printf>
ffffff80400829b8:	3940bfa0 	ldrb	w0, [x29, #47]
ffffff80400829bc:	94000a0f 	bl	ffffff80400851f8 <timer_gic_init>
ffffff80400829c0:	3940bfa1 	ldrb	w1, [x29, #47]
ffffff80400829c4:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff80400829c8:	913ca000 	add	x0, x0, #0xf28
ffffff80400829cc:	9400122f 	bl	ffffff8040087288 <printf>
ffffff80400829d0:	94000a64 	bl	ffffff8040085360 <kclock_init>
ffffff80400829d4:	3940bfa1 	ldrb	w1, [x29, #47]
ffffff80400829d8:	d0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff80400829dc:	913d2000 	add	x0, x0, #0xf48
ffffff80400829e0:	9400122a 	bl	ffffff8040087288 <printf>
ffffff80400829e4:	9400053a 	bl	ffffff8040083ecc <cpu_enable_irq>
ffffff80400829e8:	d503207f 	wfi
ffffff80400829ec:	17ffffff 	b	ffffff80400829e8 <main+0x148>
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
ffffff8040083258:	94000323 	bl	ffffff8040083ee4 <cpu_current_id>
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
ffffff80400832d8:	94000303 	bl	ffffff8040083ee4 <cpu_current_id>
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
ffffff8040083358:	940002e3 	bl	ffffff8040083ee4 <cpu_current_id>
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
ffffff80400833d8:	940002c3 	bl	ffffff8040083ee4 <cpu_current_id>
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
ffffff8040083458:	940002a3 	bl	ffffff8040083ee4 <cpu_current_id>
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
ffffff80400834d8:	94000283 	bl	ffffff8040083ee4 <cpu_current_id>
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
ffffff8040083558:	94000263 	bl	ffffff8040083ee4 <cpu_current_id>
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
ffffff80400835d8:	94000243 	bl	ffffff8040083ee4 <cpu_current_id>
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
ffffff80400837e8:	94001070 	bl	ffffff80400879a8 <lock_kernel>
ffffff80400837ec:	d5385213 	mrs	x19, esr_el1
ffffff80400837f0:	d35afe73 	lsr	x19, x19, #26
ffffff80400837f4:	f100827f 	cmp	x19, #0x20
ffffff80400837f8:	54000100 	b.eq	ffffff8040083818 <el0_sync_pgfault>  // b.none
ffffff80400837fc:	f100927f 	cmp	x19, #0x24
ffffff8040083800:	540000c0 	b.eq	ffffff8040083818 <el0_sync_pgfault>  // b.none
ffffff8040083804:	f100567f 	cmp	x19, #0x15
ffffff8040083808:	540000c0 	b.eq	ffffff8040083820 <el0_sync_syscall>  // b.none
ffffff804008380c:	94001526 	bl	ffffff8040088ca4 <handle_el0_sync>

ffffff8040083810 <el0_sync_end>:
ffffff8040083810:	9400106e 	bl	ffffff80400879c8 <unlock_kernel>
ffffff8040083814:	17ffffdd 	b	ffffff8040083788 <pop_context>

ffffff8040083818 <el0_sync_pgfault>:
ffffff8040083818:	940014ba 	bl	ffffff8040088b00 <handle_el0_pgfault>
ffffff804008381c:	17fffffd 	b	ffffff8040083810 <el0_sync_end>

ffffff8040083820 <el0_sync_syscall>:
ffffff8040083820:	940013e0 	bl	ffffff80400887a0 <handle_el0_syscall>
ffffff8040083824:	17fffffb 	b	ffffff8040083810 <el0_sync_end>

ffffff8040083828 <el0_irq>:
ffffff8040083828:	94001060 	bl	ffffff80400879a8 <lock_kernel>
ffffff804008382c:	94000689 	bl	ffffff8040085250 <gic_handler>
ffffff8040083830:	94001066 	bl	ffffff80400879c8 <unlock_kernel>
ffffff8040083834:	17ffffd5 	b	ffffff8040083788 <pop_context>

ffffff8040083838 <el0_fiq>:
ffffff8040083838:	94001557 	bl	ffffff8040088d94 <handle_fiq>
ffffff804008383c:	17ffffff 	b	ffffff8040083838 <el0_fiq>

ffffff8040083840 <el0_err>:
ffffff8040083840:	94001573 	bl	ffffff8040088e0c <handle_err>
ffffff8040083844:	17ffffff 	b	ffffff8040083840 <el0_err>

ffffff8040083848 <el1_sync>:
ffffff8040083848:	94001535 	bl	ffffff8040088d1c <handle_el1_sync>
ffffff804008384c:	17ffffff 	b	ffffff8040083848 <el1_sync>
ffffff8040083850:	4111c678 	.word	0x4111c678
ffffff8040083854:	ffffff80 	.word	0xffffff80

ffffff8040083858 <page2ppn>:
ffffff8040083858:	d10043ff 	sub	sp, sp, #0x10
ffffff804008385c:	f90007e0 	str	x0, [sp, #8]
ffffff8040083860:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040083864:	b0003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040083868:	9119e000 	add	x0, x0, #0x678
ffffff804008386c:	cb000020 	sub	x0, x1, x0
ffffff8040083870:	9343fc01 	asr	x1, x0, #3
ffffff8040083874:	b201f3e0 	mov	x0, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
ffffff8040083878:	f2955560 	movk	x0, #0xaaab
ffffff804008387c:	9b007c20 	mul	x0, x1, x0
ffffff8040083880:	910043ff 	add	sp, sp, #0x10
ffffff8040083884:	d65f03c0 	ret

ffffff8040083888 <cap_init>:
ffffff8040083888:	d10043ff 	sub	sp, sp, #0x10
ffffff804008388c:	b0003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040083890:	9119c000 	add	x0, x0, #0x670
ffffff8040083894:	b9400000 	ldr	w0, [x0]
ffffff8040083898:	530c7c01 	lsr	w1, w0, #12
ffffff804008389c:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400838a0:	9124a000 	add	x0, x0, #0x928
ffffff80400838a4:	b9000001 	str	w1, [x0]
ffffff80400838a8:	f00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400838ac:	9118c000 	add	x0, x0, #0x630
ffffff80400838b0:	52a000c1 	mov	w1, #0x60000               	// #393216
ffffff80400838b4:	b9000001 	str	w1, [x0]
ffffff80400838b8:	f00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400838bc:	9118c000 	add	x0, x0, #0x630
ffffff80400838c0:	b9400001 	ldr	w1, [x0]
ffffff80400838c4:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400838c8:	9124a000 	add	x0, x0, #0x928
ffffff80400838cc:	b9400000 	ldr	w0, [x0]
ffffff80400838d0:	4b000021 	sub	w1, w1, w0
ffffff80400838d4:	f00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400838d8:	9118d000 	add	x0, x0, #0x634
ffffff80400838dc:	b9000001 	str	w1, [x0]
ffffff80400838e0:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400838e4:	9123e000 	add	x0, x0, #0x8f8
ffffff80400838e8:	f900001f 	str	xzr, [x0]
ffffff80400838ec:	b9000fff 	str	wzr, [sp, #12]
ffffff80400838f0:	14000092 	b	ffffff8040083b38 <cap_init+0x2b0>
ffffff80400838f4:	b9400fe2 	ldr	w2, [sp, #12]
ffffff80400838f8:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400838fc:	9124c003 	add	x3, x0, #0x930
ffffff8040083900:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083904:	aa0103e0 	mov	x0, x1
ffffff8040083908:	d37ff800 	lsl	x0, x0, #1
ffffff804008390c:	8b010000 	add	x0, x0, x1
ffffff8040083910:	d37cec00 	lsl	x0, x0, #4
ffffff8040083914:	8b000060 	add	x0, x3, x0
ffffff8040083918:	b9000002 	str	w2, [x0]
ffffff804008391c:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040083920:	f00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff8040083924:	9118d000 	add	x0, x0, #0x634
ffffff8040083928:	b9400000 	ldr	w0, [x0]
ffffff804008392c:	6b00003f 	cmp	w1, w0
ffffff8040083930:	54000322 	b.cs	ffffff8040083994 <cap_init+0x10c>  // b.hs, b.nlast
ffffff8040083934:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040083938:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff804008393c:	9124a000 	add	x0, x0, #0x928
ffffff8040083940:	b9400000 	ldr	w0, [x0]
ffffff8040083944:	0b000022 	add	w2, w1, w0
ffffff8040083948:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff804008394c:	9124c003 	add	x3, x0, #0x930
ffffff8040083950:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083954:	aa0103e0 	mov	x0, x1
ffffff8040083958:	d37ff800 	lsl	x0, x0, #1
ffffff804008395c:	8b010000 	add	x0, x0, x1
ffffff8040083960:	d37cec00 	lsl	x0, x0, #4
ffffff8040083964:	8b000060 	add	x0, x3, x0
ffffff8040083968:	b9000802 	str	w2, [x0, #8]
ffffff804008396c:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083970:	9124c002 	add	x2, x0, #0x930
ffffff8040083974:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083978:	aa0103e0 	mov	x0, x1
ffffff804008397c:	d37ff800 	lsl	x0, x0, #1
ffffff8040083980:	8b010000 	add	x0, x0, x1
ffffff8040083984:	d37cec00 	lsl	x0, x0, #4
ffffff8040083988:	8b000040 	add	x0, x2, x0
ffffff804008398c:	f9000c1f 	str	xzr, [x0, #24]
ffffff8040083990:	1400002d 	b	ffffff8040083a44 <cap_init+0x1bc>
ffffff8040083994:	f00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff8040083998:	9118d000 	add	x0, x0, #0x634
ffffff804008399c:	b9400000 	ldr	w0, [x0]
ffffff80400839a0:	11100001 	add	w1, w0, #0x400
ffffff80400839a4:	b9400fe0 	ldr	w0, [sp, #12]
ffffff80400839a8:	6b00003f 	cmp	w1, w0
ffffff80400839ac:	540004c9 	b.ls	ffffff8040083a44 <cap_init+0x1bc>  // b.plast
ffffff80400839b0:	b9400fe0 	ldr	w0, [sp, #12]
ffffff80400839b4:	12003c01 	and	w1, w0, #0xffff
ffffff80400839b8:	f00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400839bc:	9118d000 	add	x0, x0, #0x634
ffffff80400839c0:	b9400000 	ldr	w0, [x0]
ffffff80400839c4:	12003c00 	and	w0, w0, #0xffff
ffffff80400839c8:	4b000020 	sub	w0, w1, w0
ffffff80400839cc:	12003c03 	and	w3, w0, #0xffff
ffffff80400839d0:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400839d4:	9124c002 	add	x2, x0, #0x930
ffffff80400839d8:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff80400839dc:	aa0103e0 	mov	x0, x1
ffffff80400839e0:	d37ff800 	lsl	x0, x0, #1
ffffff80400839e4:	8b010000 	add	x0, x0, x1
ffffff80400839e8:	d37cec00 	lsl	x0, x0, #4
ffffff80400839ec:	8b000040 	add	x0, x2, x0
ffffff80400839f0:	2a0303e1 	mov	w1, w3
ffffff80400839f4:	79000801 	strh	w1, [x0, #4]
ffffff80400839f8:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400839fc:	9124c002 	add	x2, x0, #0x930
ffffff8040083a00:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083a04:	aa0103e0 	mov	x0, x1
ffffff8040083a08:	d37ff800 	lsl	x0, x0, #1
ffffff8040083a0c:	8b010000 	add	x0, x0, x1
ffffff8040083a10:	d37cec00 	lsl	x0, x0, #4
ffffff8040083a14:	8b000040 	add	x0, x2, x0
ffffff8040083a18:	f9400c00 	ldr	x0, [x0, #24]
ffffff8040083a1c:	b2401c02 	orr	x2, x0, #0xff
ffffff8040083a20:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083a24:	9124c003 	add	x3, x0, #0x930
ffffff8040083a28:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083a2c:	aa0103e0 	mov	x0, x1
ffffff8040083a30:	d37ff800 	lsl	x0, x0, #1
ffffff8040083a34:	8b010000 	add	x0, x0, x1
ffffff8040083a38:	d37cec00 	lsl	x0, x0, #4
ffffff8040083a3c:	8b000060 	add	x0, x3, x0
ffffff8040083a40:	f9000c02 	str	x2, [x0, #24]
ffffff8040083a44:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083a48:	9123e000 	add	x0, x0, #0x8f8
ffffff8040083a4c:	f9400002 	ldr	x2, [x0]
ffffff8040083a50:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083a54:	9124c003 	add	x3, x0, #0x930
ffffff8040083a58:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083a5c:	aa0103e0 	mov	x0, x1
ffffff8040083a60:	d37ff800 	lsl	x0, x0, #1
ffffff8040083a64:	8b010000 	add	x0, x0, x1
ffffff8040083a68:	d37cec00 	lsl	x0, x0, #4
ffffff8040083a6c:	8b000060 	add	x0, x3, x0
ffffff8040083a70:	f9001002 	str	x2, [x0, #32]
ffffff8040083a74:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083a78:	9124c002 	add	x2, x0, #0x930
ffffff8040083a7c:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083a80:	aa0103e0 	mov	x0, x1
ffffff8040083a84:	d37ff800 	lsl	x0, x0, #1
ffffff8040083a88:	8b010000 	add	x0, x0, x1
ffffff8040083a8c:	d37cec00 	lsl	x0, x0, #4
ffffff8040083a90:	8b000040 	add	x0, x2, x0
ffffff8040083a94:	f9401000 	ldr	x0, [x0, #32]
ffffff8040083a98:	f100001f 	cmp	x0, #0x0
ffffff8040083a9c:	540001c0 	b.eq	ffffff8040083ad4 <cap_init+0x24c>  // b.none
ffffff8040083aa0:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083aa4:	9123e000 	add	x0, x0, #0x8f8
ffffff8040083aa8:	f9400002 	ldr	x2, [x0]
ffffff8040083aac:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083ab0:	aa0103e0 	mov	x0, x1
ffffff8040083ab4:	d37ff800 	lsl	x0, x0, #1
ffffff8040083ab8:	8b010000 	add	x0, x0, x1
ffffff8040083abc:	d37cec00 	lsl	x0, x0, #4
ffffff8040083ac0:	91008001 	add	x1, x0, #0x20
ffffff8040083ac4:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083ac8:	9124c000 	add	x0, x0, #0x930
ffffff8040083acc:	8b000020 	add	x0, x1, x0
ffffff8040083ad0:	f9001440 	str	x0, [x2, #40]
ffffff8040083ad4:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083ad8:	aa0103e0 	mov	x0, x1
ffffff8040083adc:	d37ff800 	lsl	x0, x0, #1
ffffff8040083ae0:	8b010000 	add	x0, x0, x1
ffffff8040083ae4:	d37cec00 	lsl	x0, x0, #4
ffffff8040083ae8:	b00002c1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083aec:	9124c021 	add	x1, x1, #0x930
ffffff8040083af0:	8b010001 	add	x1, x0, x1
ffffff8040083af4:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083af8:	9123e000 	add	x0, x0, #0x8f8
ffffff8040083afc:	f9000001 	str	x1, [x0]
ffffff8040083b00:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083b04:	9124c002 	add	x2, x0, #0x930
ffffff8040083b08:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040083b0c:	aa0103e0 	mov	x0, x1
ffffff8040083b10:	d37ff800 	lsl	x0, x0, #1
ffffff8040083b14:	8b010000 	add	x0, x0, x1
ffffff8040083b18:	d37cec00 	lsl	x0, x0, #4
ffffff8040083b1c:	8b000040 	add	x0, x2, x0
ffffff8040083b20:	b00002c1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083b24:	9123e021 	add	x1, x1, #0x8f8
ffffff8040083b28:	f9001401 	str	x1, [x0, #40]
ffffff8040083b2c:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040083b30:	11000400 	add	w0, w0, #0x1
ffffff8040083b34:	b9000fe0 	str	w0, [sp, #12]
ffffff8040083b38:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040083b3c:	52893de0 	mov	w0, #0x49ef                	// #18927
ffffff8040083b40:	72a00040 	movk	w0, #0x2, lsl #16
ffffff8040083b44:	6b00003f 	cmp	w1, w0
ffffff8040083b48:	54ffed6d 	b.le	ffffff80400838f4 <cap_init+0x6c>
ffffff8040083b4c:	d503201f 	nop
ffffff8040083b50:	910043ff 	add	sp, sp, #0x10
ffffff8040083b54:	d65f03c0 	ret

ffffff8040083b58 <cap_set_env_rights>:
ffffff8040083b58:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040083b5c:	910003fd 	mov	x29, sp
ffffff8040083b60:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083b64:	f9000ba1 	str	x1, [x29, #16]
ffffff8040083b68:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083b6c:	710ffc1f 	cmp	w0, #0x3ff
ffffff8040083b70:	54000169 	b.ls	ffffff8040083b9c <cap_set_env_rights+0x44>  // b.plast
ffffff8040083b74:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083b78:	913da002 	add	x2, x0, #0xf68
ffffff8040083b7c:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083b80:	913e2001 	add	x1, x0, #0xf88
ffffff8040083b84:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083b88:	913e8000 	add	x0, x0, #0xfa0
ffffff8040083b8c:	aa0203e3 	mov	x3, x2
ffffff8040083b90:	aa0103e2 	mov	x2, x1
ffffff8040083b94:	528005e1 	mov	w1, #0x2f                  	// #47
ffffff8040083b98:	94000de5 	bl	ffffff804008732c <_panic>
ffffff8040083b9c:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083ba0:	9124a000 	add	x0, x0, #0x928
ffffff8040083ba4:	b9400000 	ldr	w0, [x0]
ffffff8040083ba8:	b9401fa1 	ldr	w1, [x29, #28]
ffffff8040083bac:	0b000020 	add	w0, w1, w0
ffffff8040083bb0:	b9002fa0 	str	w0, [x29, #44]
ffffff8040083bb4:	b9402fa1 	ldr	w1, [x29, #44]
ffffff8040083bb8:	aa0103e0 	mov	x0, x1
ffffff8040083bbc:	d37ff800 	lsl	x0, x0, #1
ffffff8040083bc0:	8b010000 	add	x0, x0, x1
ffffff8040083bc4:	d37cec00 	lsl	x0, x0, #4
ffffff8040083bc8:	b00002c1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083bcc:	9124c021 	add	x1, x1, #0x930
ffffff8040083bd0:	8b010000 	add	x0, x0, x1
ffffff8040083bd4:	f90013a0 	str	x0, [x29, #32]
ffffff8040083bd8:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040083bdc:	f9400ba1 	ldr	x1, [x29, #16]
ffffff8040083be0:	f9000c01 	str	x1, [x0, #24]
ffffff8040083be4:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040083be8:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040083bec:	d65f03c0 	ret

ffffff8040083bf0 <cap_map_free_page>:
ffffff8040083bf0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040083bf4:	910003fd 	mov	x29, sp
ffffff8040083bf8:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083bfc:	f9000ba1 	str	x1, [x29, #16]
ffffff8040083c00:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040083c04:	97ffff15 	bl	ffffff8040083858 <page2ppn>
ffffff8040083c08:	f9001fa0 	str	x0, [x29, #56]
ffffff8040083c0c:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083c10:	9124a000 	add	x0, x0, #0x928
ffffff8040083c14:	b9400000 	ldr	w0, [x0]
ffffff8040083c18:	2a0003e0 	mov	w0, w0
ffffff8040083c1c:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083c20:	eb00003f 	cmp	x1, x0
ffffff8040083c24:	54000103 	b.cc	ffffff8040083c44 <cap_map_free_page+0x54>  // b.lo, b.ul, b.last
ffffff8040083c28:	f00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff8040083c2c:	9118c000 	add	x0, x0, #0x630
ffffff8040083c30:	b9400000 	ldr	w0, [x0]
ffffff8040083c34:	2a0003e0 	mov	w0, w0
ffffff8040083c38:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083c3c:	eb00003f 	cmp	x1, x0
ffffff8040083c40:	54000163 	b.cc	ffffff8040083c6c <cap_map_free_page+0x7c>  // b.lo, b.ul, b.last
ffffff8040083c44:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083c48:	913f0002 	add	x2, x0, #0xfc0
ffffff8040083c4c:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083c50:	913e2001 	add	x1, x0, #0xf88
ffffff8040083c54:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083c58:	913e8000 	add	x0, x0, #0xfa0
ffffff8040083c5c:	aa0203e3 	mov	x3, x2
ffffff8040083c60:	aa0103e2 	mov	x2, x1
ffffff8040083c64:	528007c1 	mov	w1, #0x3e                  	// #62
ffffff8040083c68:	94000db1 	bl	ffffff804008732c <_panic>
ffffff8040083c6c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040083c70:	2a0003e1 	mov	w1, w0
ffffff8040083c74:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083c78:	9124a000 	add	x0, x0, #0x928
ffffff8040083c7c:	b9400000 	ldr	w0, [x0]
ffffff8040083c80:	4b000020 	sub	w0, w1, w0
ffffff8040083c84:	b90037a0 	str	w0, [x29, #52]
ffffff8040083c88:	b94037a1 	ldr	w1, [x29, #52]
ffffff8040083c8c:	aa0103e0 	mov	x0, x1
ffffff8040083c90:	d37ff800 	lsl	x0, x0, #1
ffffff8040083c94:	8b010000 	add	x0, x0, x1
ffffff8040083c98:	d37cec00 	lsl	x0, x0, #4
ffffff8040083c9c:	b00002c1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083ca0:	9124c021 	add	x1, x1, #0x930
ffffff8040083ca4:	8b010000 	add	x0, x0, x1
ffffff8040083ca8:	f90017a0 	str	x0, [x29, #40]
ffffff8040083cac:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083cb0:	12003c01 	and	w1, w0, #0xffff
ffffff8040083cb4:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040083cb8:	79000801 	strh	w1, [x0, #4]
ffffff8040083cbc:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040083cc0:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040083cc4:	d65f03c0 	ret

ffffff8040083cc8 <cap_unmap_free_page>:
ffffff8040083cc8:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040083ccc:	910003fd 	mov	x29, sp
ffffff8040083cd0:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083cd4:	f9000ba1 	str	x1, [x29, #16]
ffffff8040083cd8:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040083cdc:	97fffedf 	bl	ffffff8040083858 <page2ppn>
ffffff8040083ce0:	f9001fa0 	str	x0, [x29, #56]
ffffff8040083ce4:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083ce8:	9124a000 	add	x0, x0, #0x928
ffffff8040083cec:	b9400000 	ldr	w0, [x0]
ffffff8040083cf0:	2a0003e0 	mov	w0, w0
ffffff8040083cf4:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083cf8:	eb00003f 	cmp	x1, x0
ffffff8040083cfc:	54000103 	b.cc	ffffff8040083d1c <cap_unmap_free_page+0x54>  // b.lo, b.ul, b.last
ffffff8040083d00:	f00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff8040083d04:	9118c000 	add	x0, x0, #0x630
ffffff8040083d08:	b9400000 	ldr	w0, [x0]
ffffff8040083d0c:	2a0003e0 	mov	w0, w0
ffffff8040083d10:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040083d14:	eb00003f 	cmp	x1, x0
ffffff8040083d18:	54000163 	b.cc	ffffff8040083d44 <cap_unmap_free_page+0x7c>  // b.lo, b.ul, b.last
ffffff8040083d1c:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083d20:	913f0002 	add	x2, x0, #0xfc0
ffffff8040083d24:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083d28:	913e2001 	add	x1, x0, #0xf88
ffffff8040083d2c:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083d30:	913e8000 	add	x0, x0, #0xfa0
ffffff8040083d34:	aa0203e3 	mov	x3, x2
ffffff8040083d38:	aa0103e2 	mov	x2, x1
ffffff8040083d3c:	52800a01 	mov	w1, #0x50                  	// #80
ffffff8040083d40:	94000d7b 	bl	ffffff804008732c <_panic>
ffffff8040083d44:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040083d48:	2a0003e1 	mov	w1, w0
ffffff8040083d4c:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083d50:	9124a000 	add	x0, x0, #0x928
ffffff8040083d54:	b9400000 	ldr	w0, [x0]
ffffff8040083d58:	4b000020 	sub	w0, w1, w0
ffffff8040083d5c:	b90037a0 	str	w0, [x29, #52]
ffffff8040083d60:	b94037a1 	ldr	w1, [x29, #52]
ffffff8040083d64:	aa0103e0 	mov	x0, x1
ffffff8040083d68:	d37ff800 	lsl	x0, x0, #1
ffffff8040083d6c:	8b010000 	add	x0, x0, x1
ffffff8040083d70:	d37cec00 	lsl	x0, x0, #4
ffffff8040083d74:	b00002c1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083d78:	9124c021 	add	x1, x1, #0x930
ffffff8040083d7c:	8b010000 	add	x0, x0, x1
ffffff8040083d80:	f90017a0 	str	x0, [x29, #40]
ffffff8040083d84:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040083d88:	12800001 	mov	w1, #0xffffffff            	// #-1
ffffff8040083d8c:	79000801 	strh	w1, [x0, #4]
ffffff8040083d90:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040083d94:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040083d98:	d65f03c0 	ret

ffffff8040083d9c <check_env_right>:
ffffff8040083d9c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040083da0:	910003fd 	mov	x29, sp
ffffff8040083da4:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083da8:	f9000ba1 	str	x1, [x29, #16]
ffffff8040083dac:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083db0:	710ffc1f 	cmp	w0, #0x3ff
ffffff8040083db4:	54000169 	b.ls	ffffff8040083de0 <check_env_right+0x44>  // b.plast
ffffff8040083db8:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083dbc:	913da002 	add	x2, x0, #0xf68
ffffff8040083dc0:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083dc4:	913e2001 	add	x1, x0, #0xf88
ffffff8040083dc8:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083dcc:	913e8000 	add	x0, x0, #0xfa0
ffffff8040083dd0:	aa0203e3 	mov	x3, x2
ffffff8040083dd4:	aa0103e2 	mov	x2, x1
ffffff8040083dd8:	52800c21 	mov	w1, #0x61                  	// #97
ffffff8040083ddc:	94000d54 	bl	ffffff804008732c <_panic>
ffffff8040083de0:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083de4:	9124a000 	add	x0, x0, #0x928
ffffff8040083de8:	b9400000 	ldr	w0, [x0]
ffffff8040083dec:	b9401fa1 	ldr	w1, [x29, #28]
ffffff8040083df0:	0b000020 	add	w0, w1, w0
ffffff8040083df4:	b9003fa0 	str	w0, [x29, #60]
ffffff8040083df8:	b9403fa1 	ldr	w1, [x29, #60]
ffffff8040083dfc:	aa0103e0 	mov	x0, x1
ffffff8040083e00:	d37ff800 	lsl	x0, x0, #1
ffffff8040083e04:	8b010000 	add	x0, x0, x1
ffffff8040083e08:	d37cec00 	lsl	x0, x0, #4
ffffff8040083e0c:	b00002c1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040083e10:	9124c021 	add	x1, x1, #0x930
ffffff8040083e14:	8b010000 	add	x0, x0, x1
ffffff8040083e18:	f9001ba0 	str	x0, [x29, #48]
ffffff8040083e1c:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040083e20:	f9400c00 	ldr	x0, [x0, #24]
ffffff8040083e24:	f90017a0 	str	x0, [x29, #40]
ffffff8040083e28:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040083e2c:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040083e30:	8a000020 	and	x0, x1, x0
ffffff8040083e34:	f90013a0 	str	x0, [x29, #32]
ffffff8040083e38:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040083e3c:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040083e40:	eb00003f 	cmp	x1, x0
ffffff8040083e44:	54000160 	b.eq	ffffff8040083e70 <check_env_right+0xd4>  // b.none
ffffff8040083e48:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083e4c:	913fe002 	add	x2, x0, #0xff8
ffffff8040083e50:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083e54:	913e2001 	add	x1, x0, #0xf88
ffffff8040083e58:	b0000020 	adrp	x0, ffffff8040088000 <sys_env_alloc+0x98>
ffffff8040083e5c:	913e8000 	add	x0, x0, #0xfa0
ffffff8040083e60:	aa0203e3 	mov	x3, x2
ffffff8040083e64:	aa0103e2 	mov	x2, x1
ffffff8040083e68:	52800d61 	mov	w1, #0x6b                  	// #107
ffffff8040083e6c:	94000d30 	bl	ffffff804008732c <_panic>
ffffff8040083e70:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040083e74:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040083e78:	d65f03c0 	ret

ffffff8040083e7c <cpu_boot_secondary>:
ffffff8040083e7c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040083e80:	910003fd 	mov	x29, sp
ffffff8040083e84:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040083e88:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083e8c:	1400000a 	b	ffffff8040083eb4 <cpu_boot_secondary+0x38>
ffffff8040083e90:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040083e94:	b0ffffe0 	adrp	x0, ffffff8040080000 <_start>
ffffff8040083e98:	91005000 	add	x0, x0, #0x14
ffffff8040083e9c:	2a0003e1 	mov	w1, w0
ffffff8040083ea0:	2a0203e0 	mov	w0, w2
ffffff8040083ea4:	94000d66 	bl	ffffff804008743c <psci_cpu_on>
ffffff8040083ea8:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083eac:	11000400 	add	w0, w0, #0x1
ffffff8040083eb0:	b9001fa0 	str	w0, [x29, #28]
ffffff8040083eb4:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040083eb8:	71000c1f 	cmp	w0, #0x3
ffffff8040083ebc:	54fffead 	b.le	ffffff8040083e90 <cpu_boot_secondary+0x14>
ffffff8040083ec0:	d503201f 	nop
ffffff8040083ec4:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040083ec8:	d65f03c0 	ret

ffffff8040083ecc <cpu_enable_irq>:
ffffff8040083ecc:	d50342ff 	msr	daifclr, #0x2
ffffff8040083ed0:	d503201f 	nop
ffffff8040083ed4:	d65f03c0 	ret

ffffff8040083ed8 <cpu_disable_irq>:
ffffff8040083ed8:	d50342df 	msr	daifset, #0x2
ffffff8040083edc:	d503201f 	nop
ffffff8040083ee0:	d65f03c0 	ret

ffffff8040083ee4 <cpu_current_id>:
ffffff8040083ee4:	d10043ff 	sub	sp, sp, #0x10
ffffff8040083ee8:	d53800a0 	mrs	x0, mpidr_el1
ffffff8040083eec:	f90007e0 	str	x0, [sp, #8]
ffffff8040083ef0:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040083ef4:	12001c00 	and	w0, w0, #0xff
ffffff8040083ef8:	910043ff 	add	sp, sp, #0x10
ffffff8040083efc:	d65f03c0 	ret

ffffff8040083f00 <page2ppn>:
ffffff8040083f00:	d10043ff 	sub	sp, sp, #0x10
ffffff8040083f04:	f90007e0 	str	x0, [sp, #8]
ffffff8040083f08:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040083f0c:	b0003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040083f10:	9119e000 	add	x0, x0, #0x678
ffffff8040083f14:	cb000020 	sub	x0, x1, x0
ffffff8040083f18:	9343fc01 	asr	x1, x0, #3
ffffff8040083f1c:	b201f3e0 	mov	x0, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
ffffff8040083f20:	f2955560 	movk	x0, #0xaaab
ffffff8040083f24:	9b007c20 	mul	x0, x1, x0
ffffff8040083f28:	910043ff 	add	sp, sp, #0x10
ffffff8040083f2c:	d65f03c0 	ret

ffffff8040083f30 <page2kva>:
ffffff8040083f30:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040083f34:	910003fd 	mov	x29, sp
ffffff8040083f38:	f9000fa0 	str	x0, [x29, #24]
ffffff8040083f3c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040083f40:	97fffff0 	bl	ffffff8040083f00 <page2ppn>
ffffff8040083f44:	d374cc00 	lsl	x0, x0, #12
ffffff8040083f48:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040083f4c:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040083f50:	d65f03c0 	ret

ffffff8040083f54 <pa2page>:
ffffff8040083f54:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040083f58:	910003fd 	mov	x29, sp
ffffff8040083f5c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040083f60:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040083f64:	d34cfc00 	lsr	x0, x0, #12
ffffff8040083f68:	92406801 	and	x1, x0, #0x7ffffff
ffffff8040083f6c:	12bfff40 	mov	w0, #0x5ffff               	// #393215
ffffff8040083f70:	eb00003f 	cmp	x1, x0
ffffff8040083f74:	54000129 	b.ls	ffffff8040083f98 <pa2page+0x44>  // b.plast
ffffff8040083f78:	d0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040083f7c:	91002001 	add	x1, x0, #0x8
ffffff8040083f80:	d0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040083f84:	9100c000 	add	x0, x0, #0x30
ffffff8040083f88:	f9400fa3 	ldr	x3, [x29, #24]
ffffff8040083f8c:	aa0103e2 	mov	x2, x1
ffffff8040083f90:	528003e1 	mov	w1, #0x1f                  	// #31
ffffff8040083f94:	94000ce6 	bl	ffffff804008732c <_panic>
ffffff8040083f98:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040083f9c:	d34cfc00 	lsr	x0, x0, #12
ffffff8040083fa0:	92406801 	and	x1, x0, #0x7ffffff
ffffff8040083fa4:	aa0103e0 	mov	x0, x1
ffffff8040083fa8:	d37ff800 	lsl	x0, x0, #1
ffffff8040083fac:	8b010000 	add	x0, x0, x1
ffffff8040083fb0:	d37df000 	lsl	x0, x0, #3
ffffff8040083fb4:	b0003cc1 	adrp	x1, ffffff804081c000 <envs+0x619c8>
ffffff8040083fb8:	9119e021 	add	x1, x1, #0x678
ffffff8040083fbc:	8b010000 	add	x0, x0, x1
ffffff8040083fc0:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040083fc4:	d65f03c0 	ret

ffffff8040083fc8 <mkenvid>:
ffffff8040083fc8:	d10083ff 	sub	sp, sp, #0x20
ffffff8040083fcc:	f90007e0 	str	x0, [sp, #8]
ffffff8040083fd0:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040083fd4:	f00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff8040083fd8:	9118e000 	add	x0, x0, #0x638
ffffff8040083fdc:	cb000020 	sub	x0, x1, x0
ffffff8040083fe0:	9343fc01 	asr	x1, x0, #3
ffffff8040083fe4:	d28b1a20 	mov	x0, #0x58d1                	// #22737
ffffff8040083fe8:	f2a343e0 	movk	x0, #0x1a1f, lsl #16
ffffff8040083fec:	f2c87d60 	movk	x0, #0x43eb, lsl #32
ffffff8040083ff0:	f2efac60 	movk	x0, #0x7d63, lsl #48
ffffff8040083ff4:	9b007c20 	mul	x0, x1, x0
ffffff8040083ff8:	b9001fe0 	str	w0, [sp, #28]
ffffff8040083ffc:	b00002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084000:	91242000 	add	x0, x0, #0x908
ffffff8040084004:	f9400000 	ldr	x0, [x0]
ffffff8040084008:	91000401 	add	x1, x0, #0x1
ffffff804008400c:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084010:	91242000 	add	x0, x0, #0x908
ffffff8040084014:	f9000001 	str	x1, [x0]
ffffff8040084018:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff804008401c:	91242000 	add	x0, x0, #0x908
ffffff8040084020:	f9400000 	ldr	x0, [x0]
ffffff8040084024:	53155001 	lsl	w1, w0, #11
ffffff8040084028:	b9401fe0 	ldr	w0, [sp, #28]
ffffff804008402c:	2a000020 	orr	w0, w1, w0
ffffff8040084030:	910083ff 	add	sp, sp, #0x20
ffffff8040084034:	d65f03c0 	ret

ffffff8040084038 <envid2env>:
ffffff8040084038:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff804008403c:	910003fd 	mov	x29, sp
ffffff8040084040:	b9001fa0 	str	w0, [x29, #28]
ffffff8040084044:	f9000ba1 	str	x1, [x29, #16]
ffffff8040084048:	b9001ba2 	str	w2, [x29, #24]
ffffff804008404c:	97ffffa6 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040084050:	12001c00 	and	w0, w0, #0xff
ffffff8040084054:	b9002fa0 	str	w0, [x29, #44]
ffffff8040084058:	b9401fa0 	ldr	w0, [x29, #28]
ffffff804008405c:	7100001f 	cmp	w0, #0x0
ffffff8040084060:	54000121 	b.ne	ffffff8040084084 <envid2env+0x4c>  // b.any
ffffff8040084064:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084068:	91194000 	add	x0, x0, #0x650
ffffff804008406c:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084070:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040084074:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040084078:	f9000001 	str	x1, [x0]
ffffff804008407c:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040084080:	14000038 	b	ffffff8040084160 <envid2env+0x128>
ffffff8040084084:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040084088:	12002400 	and	w0, w0, #0x3ff
ffffff804008408c:	2a0003e1 	mov	w1, w0
ffffff8040084090:	aa0103e0 	mov	x0, x1
ffffff8040084094:	d37ff800 	lsl	x0, x0, #1
ffffff8040084098:	8b010000 	add	x0, x0, x1
ffffff804008409c:	d37cec00 	lsl	x0, x0, #4
ffffff80400840a0:	8b010000 	add	x0, x0, x1
ffffff80400840a4:	d37df000 	lsl	x0, x0, #3
ffffff80400840a8:	d00039a1 	adrp	x1, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400840ac:	9118e021 	add	x1, x1, #0x638
ffffff80400840b0:	8b010000 	add	x0, x0, x1
ffffff80400840b4:	f90013a0 	str	x0, [x29, #32]
ffffff80400840b8:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400840bc:	b9412800 	ldr	w0, [x0, #296]
ffffff80400840c0:	7100001f 	cmp	w0, #0x0
ffffff80400840c4:	54000100 	b.eq	ffffff80400840e4 <envid2env+0xac>  // b.none
ffffff80400840c8:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400840cc:	b9412001 	ldr	w1, [x0, #288]
ffffff80400840d0:	b9401fa0 	ldr	w0, [x29, #28]
ffffff80400840d4:	4a000020 	eor	w0, w1, w0
ffffff80400840d8:	12002400 	and	w0, w0, #0x3ff
ffffff80400840dc:	7100001f 	cmp	w0, #0x0
ffffff80400840e0:	540000a0 	b.eq	ffffff80400840f4 <envid2env+0xbc>  // b.none
ffffff80400840e4:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400840e8:	f900001f 	str	xzr, [x0]
ffffff80400840ec:	12800020 	mov	w0, #0xfffffffe            	// #-2
ffffff80400840f0:	1400001c 	b	ffffff8040084160 <envid2env+0x128>
ffffff80400840f4:	b9401ba0 	ldr	w0, [x29, #24]
ffffff80400840f8:	7100001f 	cmp	w0, #0x0
ffffff80400840fc:	540002a0 	b.eq	ffffff8040084150 <envid2env+0x118>  // b.none
ffffff8040084100:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084104:	91194000 	add	x0, x0, #0x650
ffffff8040084108:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff804008410c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084110:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040084114:	eb00003f 	cmp	x1, x0
ffffff8040084118:	540001c0 	b.eq	ffffff8040084150 <envid2env+0x118>  // b.none
ffffff804008411c:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084120:	b9412401 	ldr	w1, [x0, #292]
ffffff8040084124:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084128:	91194000 	add	x0, x0, #0x650
ffffff804008412c:	b9802fa2 	ldrsw	x2, [x29, #44]
ffffff8040084130:	f8627800 	ldr	x0, [x0, x2, lsl #3]
ffffff8040084134:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084138:	6b00003f 	cmp	w1, w0
ffffff804008413c:	540000a0 	b.eq	ffffff8040084150 <envid2env+0x118>  // b.none
ffffff8040084140:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040084144:	f900001f 	str	xzr, [x0]
ffffff8040084148:	12800020 	mov	w0, #0xfffffffe            	// #-2
ffffff804008414c:	14000005 	b	ffffff8040084160 <envid2env+0x128>
ffffff8040084150:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040084154:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040084158:	f9000001 	str	x1, [x0]
ffffff804008415c:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040084160:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040084164:	d65f03c0 	ret

ffffff8040084168 <env_init>:
ffffff8040084168:	d10043ff 	sub	sp, sp, #0x10
ffffff804008416c:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084170:	91240000 	add	x0, x0, #0x900
ffffff8040084174:	f900001f 	str	xzr, [x0]
ffffff8040084178:	b9000fff 	str	wzr, [sp, #12]
ffffff804008417c:	14000008 	b	ffffff804008419c <env_init+0x34>
ffffff8040084180:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084184:	9118e000 	add	x0, x0, #0x638
ffffff8040084188:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff804008418c:	f821781f 	str	xzr, [x0, x1, lsl #3]
ffffff8040084190:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040084194:	11000400 	add	w0, w0, #0x1
ffffff8040084198:	b9000fe0 	str	w0, [sp, #12]
ffffff804008419c:	b9400fe0 	ldr	w0, [sp, #12]
ffffff80400841a0:	7100081f 	cmp	w0, #0x2
ffffff80400841a4:	54fffeed 	b.le	ffffff8040084180 <env_init+0x18>
ffffff80400841a8:	52807fe0 	mov	w0, #0x3ff                 	// #1023
ffffff80400841ac:	b9000fe0 	str	w0, [sp, #12]
ffffff80400841b0:	1400005f 	b	ffffff804008432c <env_init+0x1c4>
ffffff80400841b4:	b9400fe2 	ldr	w2, [sp, #12]
ffffff80400841b8:	d00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400841bc:	9118e003 	add	x3, x0, #0x638
ffffff80400841c0:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff80400841c4:	aa0103e0 	mov	x0, x1
ffffff80400841c8:	d37ff800 	lsl	x0, x0, #1
ffffff80400841cc:	8b010000 	add	x0, x0, x1
ffffff80400841d0:	d37cec00 	lsl	x0, x0, #4
ffffff80400841d4:	8b010000 	add	x0, x0, x1
ffffff80400841d8:	d37df000 	lsl	x0, x0, #3
ffffff80400841dc:	8b000060 	add	x0, x3, x0
ffffff80400841e0:	b9012002 	str	w2, [x0, #288]
ffffff80400841e4:	d00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400841e8:	9118e002 	add	x2, x0, #0x638
ffffff80400841ec:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff80400841f0:	aa0103e0 	mov	x0, x1
ffffff80400841f4:	d37ff800 	lsl	x0, x0, #1
ffffff80400841f8:	8b010000 	add	x0, x0, x1
ffffff80400841fc:	d37cec00 	lsl	x0, x0, #4
ffffff8040084200:	8b010000 	add	x0, x0, x1
ffffff8040084204:	d37df000 	lsl	x0, x0, #3
ffffff8040084208:	8b000040 	add	x0, x2, x0
ffffff804008420c:	b901281f 	str	wzr, [x0, #296]
ffffff8040084210:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084214:	91240000 	add	x0, x0, #0x900
ffffff8040084218:	f9400002 	ldr	x2, [x0]
ffffff804008421c:	d00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff8040084220:	9118e003 	add	x3, x0, #0x638
ffffff8040084224:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040084228:	aa0103e0 	mov	x0, x1
ffffff804008422c:	d37ff800 	lsl	x0, x0, #1
ffffff8040084230:	8b010000 	add	x0, x0, x1
ffffff8040084234:	d37cec00 	lsl	x0, x0, #4
ffffff8040084238:	8b010000 	add	x0, x0, x1
ffffff804008423c:	d37df000 	lsl	x0, x0, #3
ffffff8040084240:	8b000060 	add	x0, x3, x0
ffffff8040084244:	f9008802 	str	x2, [x0, #272]
ffffff8040084248:	d00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff804008424c:	9118e002 	add	x2, x0, #0x638
ffffff8040084250:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040084254:	aa0103e0 	mov	x0, x1
ffffff8040084258:	d37ff800 	lsl	x0, x0, #1
ffffff804008425c:	8b010000 	add	x0, x0, x1
ffffff8040084260:	d37cec00 	lsl	x0, x0, #4
ffffff8040084264:	8b010000 	add	x0, x0, x1
ffffff8040084268:	d37df000 	lsl	x0, x0, #3
ffffff804008426c:	8b000040 	add	x0, x2, x0
ffffff8040084270:	f9408800 	ldr	x0, [x0, #272]
ffffff8040084274:	f100001f 	cmp	x0, #0x0
ffffff8040084278:	54000200 	b.eq	ffffff80400842b8 <env_init+0x150>  // b.none
ffffff804008427c:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084280:	91240000 	add	x0, x0, #0x900
ffffff8040084284:	f9400002 	ldr	x2, [x0]
ffffff8040084288:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff804008428c:	aa0103e0 	mov	x0, x1
ffffff8040084290:	d37ff800 	lsl	x0, x0, #1
ffffff8040084294:	8b010000 	add	x0, x0, x1
ffffff8040084298:	d37cec00 	lsl	x0, x0, #4
ffffff804008429c:	8b010000 	add	x0, x0, x1
ffffff80400842a0:	d37df000 	lsl	x0, x0, #3
ffffff80400842a4:	91044001 	add	x1, x0, #0x110
ffffff80400842a8:	d00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400842ac:	9118e000 	add	x0, x0, #0x638
ffffff80400842b0:	8b000020 	add	x0, x1, x0
ffffff80400842b4:	f9008c40 	str	x0, [x2, #280]
ffffff80400842b8:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff80400842bc:	aa0103e0 	mov	x0, x1
ffffff80400842c0:	d37ff800 	lsl	x0, x0, #1
ffffff80400842c4:	8b010000 	add	x0, x0, x1
ffffff80400842c8:	d37cec00 	lsl	x0, x0, #4
ffffff80400842cc:	8b010000 	add	x0, x0, x1
ffffff80400842d0:	d37df000 	lsl	x0, x0, #3
ffffff80400842d4:	d00039a1 	adrp	x1, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400842d8:	9118e021 	add	x1, x1, #0x638
ffffff80400842dc:	8b010001 	add	x1, x0, x1
ffffff80400842e0:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400842e4:	91240000 	add	x0, x0, #0x900
ffffff80400842e8:	f9000001 	str	x1, [x0]
ffffff80400842ec:	d00039a0 	adrp	x0, ffffff80407ba000 <caps_opt+0x6dd6d0>
ffffff80400842f0:	9118e002 	add	x2, x0, #0x638
ffffff80400842f4:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff80400842f8:	aa0103e0 	mov	x0, x1
ffffff80400842fc:	d37ff800 	lsl	x0, x0, #1
ffffff8040084300:	8b010000 	add	x0, x0, x1
ffffff8040084304:	d37cec00 	lsl	x0, x0, #4
ffffff8040084308:	8b010000 	add	x0, x0, x1
ffffff804008430c:	d37df000 	lsl	x0, x0, #3
ffffff8040084310:	8b000040 	add	x0, x2, x0
ffffff8040084314:	900002c1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084318:	91240021 	add	x1, x1, #0x900
ffffff804008431c:	f9008c01 	str	x1, [x0, #280]
ffffff8040084320:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040084324:	51000400 	sub	w0, w0, #0x1
ffffff8040084328:	b9000fe0 	str	w0, [sp, #12]
ffffff804008432c:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040084330:	7100001f 	cmp	w0, #0x0
ffffff8040084334:	54fff40a 	b.ge	ffffff80400841b4 <env_init+0x4c>  // b.tcont
ffffff8040084338:	b9000fff 	str	wzr, [sp, #12]
ffffff804008433c:	14000008 	b	ffffff804008435c <env_init+0x1f4>
ffffff8040084340:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084344:	91194000 	add	x0, x0, #0x650
ffffff8040084348:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff804008434c:	f821781f 	str	xzr, [x0, x1, lsl #3]
ffffff8040084350:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040084354:	11000400 	add	w0, w0, #0x1
ffffff8040084358:	b9000fe0 	str	w0, [sp, #12]
ffffff804008435c:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040084360:	71000c1f 	cmp	w0, #0x3
ffffff8040084364:	54fffeed 	b.le	ffffff8040084340 <env_init+0x1d8>
ffffff8040084368:	d503201f 	nop
ffffff804008436c:	910043ff 	add	sp, sp, #0x10
ffffff8040084370:	d65f03c0 	ret

ffffff8040084374 <env_alloc>:
ffffff8040084374:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
ffffff8040084378:	910003fd 	mov	x29, sp
ffffff804008437c:	f9000bf3 	str	x19, [sp, #16]
ffffff8040084380:	f9001fa0 	str	x0, [x29, #56]
ffffff8040084384:	b90037a1 	str	w1, [x29, #52]
ffffff8040084388:	f90017a2 	str	x2, [x29, #40]
ffffff804008438c:	f90027bf 	str	xzr, [x29, #72]
ffffff8040084390:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084394:	91240000 	add	x0, x0, #0x900
ffffff8040084398:	f9400000 	ldr	x0, [x0]
ffffff804008439c:	f9002fa0 	str	x0, [x29, #88]
ffffff80400843a0:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400843a4:	f100001f 	cmp	x0, #0x0
ffffff80400843a8:	54000161 	b.ne	ffffff80400843d4 <env_alloc+0x60>  // b.any
ffffff80400843ac:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400843b0:	91014002 	add	x2, x0, #0x50
ffffff80400843b4:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400843b8:	91018001 	add	x1, x0, #0x60
ffffff80400843bc:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400843c0:	9101e000 	add	x0, x0, #0x78
ffffff80400843c4:	aa0203e3 	mov	x3, x2
ffffff80400843c8:	aa0103e2 	mov	x2, x1
ffffff80400843cc:	52800821 	mov	w1, #0x41                  	// #65
ffffff80400843d0:	94000bd7 	bl	ffffff804008732c <_panic>
ffffff80400843d4:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400843d8:	97fffefc 	bl	ffffff8040083fc8 <mkenvid>
ffffff80400843dc:	2a0003e1 	mov	w1, w0
ffffff80400843e0:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400843e4:	b9012001 	str	w1, [x0, #288]
ffffff80400843e8:	910123a0 	add	x0, x29, #0x48
ffffff80400843ec:	9400053a 	bl	ffffff80400858d4 <page_alloc>
ffffff80400843f0:	b90057a0 	str	w0, [x29, #84]
ffffff80400843f4:	b94057a0 	ldr	w0, [x29, #84]
ffffff80400843f8:	7100001f 	cmp	w0, #0x0
ffffff80400843fc:	5400016a 	b.ge	ffffff8040084428 <env_alloc+0xb4>  // b.tcont
ffffff8040084400:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084404:	91026002 	add	x2, x0, #0x98
ffffff8040084408:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008440c:	91018001 	add	x1, x0, #0x60
ffffff8040084410:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084414:	9101e000 	add	x0, x0, #0x78
ffffff8040084418:	aa0203e3 	mov	x3, x2
ffffff804008441c:	aa0103e2 	mov	x2, x1
ffffff8040084420:	528008a1 	mov	w1, #0x45                  	// #69
ffffff8040084424:	94000bc2 	bl	ffffff804008732c <_panic>
ffffff8040084428:	f94027a0 	ldr	x0, [x29, #72]
ffffff804008442c:	79402001 	ldrh	w1, [x0, #16]
ffffff8040084430:	11000421 	add	w1, w1, #0x1
ffffff8040084434:	12003c21 	and	w1, w1, #0xffff
ffffff8040084438:	79002001 	strh	w1, [x0, #16]
ffffff804008443c:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040084440:	97fffebc 	bl	ffffff8040083f30 <page2kva>
ffffff8040084444:	aa0003e1 	mov	x1, x0
ffffff8040084448:	f9402fa0 	ldr	x0, [x29, #88]
ffffff804008444c:	f9009801 	str	x1, [x0, #304]
ffffff8040084450:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040084454:	f9409813 	ldr	x19, [x0, #304]
ffffff8040084458:	f9402fa0 	ldr	x0, [x29, #88]
ffffff804008445c:	f9409800 	ldr	x0, [x0, #304]
ffffff8040084460:	92407c00 	and	x0, x0, #0xffffffff
ffffff8040084464:	97fffebc 	bl	ffffff8040083f54 <pa2page>
ffffff8040084468:	aa0003e1 	mov	x1, x0
ffffff804008446c:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040084470:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084474:	12002400 	and	w0, w0, #0x3ff
ffffff8040084478:	2a0003e4 	mov	w4, w0
ffffff804008447c:	d2801803 	mov	x3, #0xc0                  	// #192
ffffff8040084480:	d2a80402 	mov	x2, #0x40200000            	// #1075838976
ffffff8040084484:	f2c00e02 	movk	x2, #0x70, lsl #32
ffffff8040084488:	aa1303e0 	mov	x0, x19
ffffff804008448c:	940005f4 	bl	ffffff8040085c5c <page_insert>
ffffff8040084490:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040084494:	b94037a1 	ldr	w1, [x29, #52]
ffffff8040084498:	b9012401 	str	w1, [x0, #292]
ffffff804008449c:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400844a0:	52800021 	mov	w1, #0x1                   	// #1
ffffff80400844a4:	b9012801 	str	w1, [x0, #296]
ffffff80400844a8:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400844ac:	f9007c1f 	str	xzr, [x0, #248]
ffffff80400844b0:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400844b4:	d2a02001 	mov	x1, #0x1000000             	// #16777216
ffffff80400844b8:	f9008401 	str	x1, [x0, #264]
ffffff80400844bc:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400844c0:	f9408800 	ldr	x0, [x0, #272]
ffffff80400844c4:	f100001f 	cmp	x0, #0x0
ffffff80400844c8:	540000c0 	b.eq	ffffff80400844e0 <env_alloc+0x16c>  // b.none
ffffff80400844cc:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400844d0:	f9408800 	ldr	x0, [x0, #272]
ffffff80400844d4:	f9402fa1 	ldr	x1, [x29, #88]
ffffff80400844d8:	f9408c21 	ldr	x1, [x1, #280]
ffffff80400844dc:	f9008c01 	str	x1, [x0, #280]
ffffff80400844e0:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400844e4:	f9408c00 	ldr	x0, [x0, #280]
ffffff80400844e8:	f9402fa1 	ldr	x1, [x29, #88]
ffffff80400844ec:	f9408821 	ldr	x1, [x1, #272]
ffffff80400844f0:	f9000001 	str	x1, [x0]
ffffff80400844f4:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400844f8:	f9402fa1 	ldr	x1, [x29, #88]
ffffff80400844fc:	f9000001 	str	x1, [x0]
ffffff8040084500:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040084504:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084508:	12002400 	and	w0, w0, #0x3ff
ffffff804008450c:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040084510:	97fffd92 	bl	ffffff8040083b58 <cap_set_env_rights>
ffffff8040084514:	12001c00 	and	w0, w0, #0xff
ffffff8040084518:	b90057a0 	str	w0, [x29, #84]
ffffff804008451c:	b94057a0 	ldr	w0, [x29, #84]
ffffff8040084520:	7100001f 	cmp	w0, #0x0
ffffff8040084524:	54000160 	b.eq	ffffff8040084550 <env_alloc+0x1dc>  // b.none
ffffff8040084528:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008452c:	91028002 	add	x2, x0, #0xa0
ffffff8040084530:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084534:	91018001 	add	x1, x0, #0x60
ffffff8040084538:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008453c:	9101e000 	add	x0, x0, #0x78
ffffff8040084540:	aa0203e3 	mov	x3, x2
ffffff8040084544:	aa0103e2 	mov	x2, x1
ffffff8040084548:	52800a81 	mov	w1, #0x54                  	// #84
ffffff804008454c:	94000b78 	bl	ffffff804008732c <_panic>
ffffff8040084550:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040084554:	f9400bf3 	ldr	x19, [sp, #16]
ffffff8040084558:	a8c67bfd 	ldp	x29, x30, [sp], #96
ffffff804008455c:	d65f03c0 	ret

ffffff8040084560 <load_icode_mapper>:
ffffff8040084560:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
ffffff8040084564:	910003fd 	mov	x29, sp
ffffff8040084568:	f9000bf3 	str	x19, [sp, #16]
ffffff804008456c:	f9001fa0 	str	x0, [x29, #56]
ffffff8040084570:	b90037a1 	str	w1, [x29, #52]
ffffff8040084574:	f90017a2 	str	x2, [x29, #40]
ffffff8040084578:	b90033a3 	str	w3, [x29, #48]
ffffff804008457c:	f90013a4 	str	x4, [x29, #32]
ffffff8040084580:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084584:	f9003ba0 	str	x0, [x29, #112]
ffffff8040084588:	f9403ba0 	ldr	x0, [x29, #112]
ffffff804008458c:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084590:	12002400 	and	w0, w0, #0x3ff
ffffff8040084594:	b9006fa0 	str	w0, [x29, #108]
ffffff8040084598:	f90027bf 	str	xzr, [x29, #72]
ffffff804008459c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400845a0:	9260ac00 	and	x0, x0, #0xffffffff00000fff
ffffff80400845a4:	f90033a0 	str	x0, [x29, #96]
ffffff80400845a8:	f9003fbf 	str	xzr, [x29, #120]
ffffff80400845ac:	1400004e 	b	ffffff80400846e4 <load_icode_mapper+0x184>
ffffff80400845b0:	910123a0 	add	x0, x29, #0x48
ffffff80400845b4:	940004c8 	bl	ffffff80400858d4 <page_alloc>
ffffff80400845b8:	b9005fa0 	str	w0, [x29, #92]
ffffff80400845bc:	b9405fa0 	ldr	w0, [x29, #92]
ffffff80400845c0:	7100001f 	cmp	w0, #0x0
ffffff80400845c4:	5400016a 	b.ge	ffffff80400845f0 <load_icode_mapper+0x90>  // b.tcont
ffffff80400845c8:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400845cc:	91026002 	add	x2, x0, #0x98
ffffff80400845d0:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400845d4:	91018001 	add	x1, x0, #0x60
ffffff80400845d8:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400845dc:	9101e000 	add	x0, x0, #0x78
ffffff80400845e0:	aa0203e3 	mov	x3, x2
ffffff80400845e4:	aa0103e2 	mov	x2, x1
ffffff80400845e8:	52800c21 	mov	w1, #0x61                  	// #97
ffffff80400845ec:	94000b50 	bl	ffffff804008732c <_panic>
ffffff80400845f0:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400845f4:	79402001 	ldrh	w1, [x0, #16]
ffffff80400845f8:	11000421 	add	w1, w1, #0x1
ffffff80400845fc:	12003c21 	and	w1, w1, #0xffff
ffffff8040084600:	79002001 	strh	w1, [x0, #16]
ffffff8040084604:	f9403ba0 	ldr	x0, [x29, #112]
ffffff8040084608:	f9409805 	ldr	x5, [x0, #304]
ffffff804008460c:	f94027a6 	ldr	x6, [x29, #72]
ffffff8040084610:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040084614:	f94033a0 	ldr	x0, [x29, #96]
ffffff8040084618:	cb000021 	sub	x1, x1, x0
ffffff804008461c:	f9403fa0 	ldr	x0, [x29, #120]
ffffff8040084620:	8b000020 	add	x0, x1, x0
ffffff8040084624:	b9406fa1 	ldr	w1, [x29, #108]
ffffff8040084628:	2a0103e4 	mov	w4, w1
ffffff804008462c:	d2800803 	mov	x3, #0x40                  	// #64
ffffff8040084630:	aa0003e2 	mov	x2, x0
ffffff8040084634:	aa0603e1 	mov	x1, x6
ffffff8040084638:	aa0503e0 	mov	x0, x5
ffffff804008463c:	94000588 	bl	ffffff8040085c5c <page_insert>
ffffff8040084640:	b9005fa0 	str	w0, [x29, #92]
ffffff8040084644:	b9405fa0 	ldr	w0, [x29, #92]
ffffff8040084648:	7100001f 	cmp	w0, #0x0
ffffff804008464c:	5400016a 	b.ge	ffffff8040084678 <load_icode_mapper+0x118>  // b.tcont
ffffff8040084650:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084654:	91026002 	add	x2, x0, #0x98
ffffff8040084658:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008465c:	91018001 	add	x1, x0, #0x60
ffffff8040084660:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084664:	9101e000 	add	x0, x0, #0x78
ffffff8040084668:	aa0203e3 	mov	x3, x2
ffffff804008466c:	aa0103e2 	mov	x2, x1
ffffff8040084670:	52800cc1 	mov	w1, #0x66                  	// #102
ffffff8040084674:	94000b2e 	bl	ffffff804008732c <_panic>
ffffff8040084678:	f94017a1 	ldr	x1, [x29, #40]
ffffff804008467c:	f9403fa0 	ldr	x0, [x29, #120]
ffffff8040084680:	8b000033 	add	x19, x1, x0
ffffff8040084684:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040084688:	97fffe2a 	bl	ffffff8040083f30 <page2kva>
ffffff804008468c:	aa0003e1 	mov	x1, x0
ffffff8040084690:	f94033a0 	ldr	x0, [x29, #96]
ffffff8040084694:	8b000020 	add	x0, x1, x0
ffffff8040084698:	aa0003e3 	mov	x3, x0
ffffff804008469c:	52820000 	mov	w0, #0x1000                	// #4096
ffffff80400846a0:	b9005ba0 	str	w0, [x29, #88]
ffffff80400846a4:	b94033a1 	ldr	w1, [x29, #48]
ffffff80400846a8:	f9403fa0 	ldr	x0, [x29, #120]
ffffff80400846ac:	cb000020 	sub	x0, x1, x0
ffffff80400846b0:	f9002ba0 	str	x0, [x29, #80]
ffffff80400846b4:	b9405ba0 	ldr	w0, [x29, #88]
ffffff80400846b8:	f9402ba2 	ldr	x2, [x29, #80]
ffffff80400846bc:	f9402ba1 	ldr	x1, [x29, #80]
ffffff80400846c0:	eb00005f 	cmp	x2, x0
ffffff80400846c4:	9a809020 	csel	x0, x1, x0, ls  // ls = plast
ffffff80400846c8:	aa0003e2 	mov	x2, x0
ffffff80400846cc:	aa0303e1 	mov	x1, x3
ffffff80400846d0:	aa1303e0 	mov	x0, x19
ffffff80400846d4:	94000456 	bl	ffffff804008582c <bcopy>
ffffff80400846d8:	f9403fa0 	ldr	x0, [x29, #120]
ffffff80400846dc:	91400400 	add	x0, x0, #0x1, lsl #12
ffffff80400846e0:	f9003fa0 	str	x0, [x29, #120]
ffffff80400846e4:	b94033a0 	ldr	w0, [x29, #48]
ffffff80400846e8:	f9403fa1 	ldr	x1, [x29, #120]
ffffff80400846ec:	eb00003f 	cmp	x1, x0
ffffff80400846f0:	54fff603 	b.cc	ffffff80400845b0 <load_icode_mapper+0x50>  // b.lo, b.ul, b.last
ffffff80400846f4:	14000036 	b	ffffff80400847cc <load_icode_mapper+0x26c>
ffffff80400846f8:	910123a0 	add	x0, x29, #0x48
ffffff80400846fc:	94000476 	bl	ffffff80400858d4 <page_alloc>
ffffff8040084700:	b9005fa0 	str	w0, [x29, #92]
ffffff8040084704:	b9405fa0 	ldr	w0, [x29, #92]
ffffff8040084708:	7100001f 	cmp	w0, #0x0
ffffff804008470c:	5400016a 	b.ge	ffffff8040084738 <load_icode_mapper+0x1d8>  // b.tcont
ffffff8040084710:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084714:	91026002 	add	x2, x0, #0x98
ffffff8040084718:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008471c:	91018001 	add	x1, x0, #0x60
ffffff8040084720:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084724:	9101e000 	add	x0, x0, #0x78
ffffff8040084728:	aa0203e3 	mov	x3, x2
ffffff804008472c:	aa0103e2 	mov	x2, x1
ffffff8040084730:	52800d81 	mov	w1, #0x6c                  	// #108
ffffff8040084734:	94000afe 	bl	ffffff804008732c <_panic>
ffffff8040084738:	f94027a0 	ldr	x0, [x29, #72]
ffffff804008473c:	79402001 	ldrh	w1, [x0, #16]
ffffff8040084740:	11000421 	add	w1, w1, #0x1
ffffff8040084744:	12003c21 	and	w1, w1, #0xffff
ffffff8040084748:	79002001 	strh	w1, [x0, #16]
ffffff804008474c:	f9403ba0 	ldr	x0, [x29, #112]
ffffff8040084750:	f9409805 	ldr	x5, [x0, #304]
ffffff8040084754:	f94027a6 	ldr	x6, [x29, #72]
ffffff8040084758:	f9401fa1 	ldr	x1, [x29, #56]
ffffff804008475c:	f94033a0 	ldr	x0, [x29, #96]
ffffff8040084760:	cb000021 	sub	x1, x1, x0
ffffff8040084764:	f9403fa0 	ldr	x0, [x29, #120]
ffffff8040084768:	8b000020 	add	x0, x1, x0
ffffff804008476c:	b9406fa1 	ldr	w1, [x29, #108]
ffffff8040084770:	2a0103e4 	mov	w4, w1
ffffff8040084774:	d2800803 	mov	x3, #0x40                  	// #64
ffffff8040084778:	aa0003e2 	mov	x2, x0
ffffff804008477c:	aa0603e1 	mov	x1, x6
ffffff8040084780:	aa0503e0 	mov	x0, x5
ffffff8040084784:	94000536 	bl	ffffff8040085c5c <page_insert>
ffffff8040084788:	b9005fa0 	str	w0, [x29, #92]
ffffff804008478c:	b9405fa0 	ldr	w0, [x29, #92]
ffffff8040084790:	7100001f 	cmp	w0, #0x0
ffffff8040084794:	5400016a 	b.ge	ffffff80400847c0 <load_icode_mapper+0x260>  // b.tcont
ffffff8040084798:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008479c:	91026002 	add	x2, x0, #0x98
ffffff80400847a0:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400847a4:	91018001 	add	x1, x0, #0x60
ffffff80400847a8:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400847ac:	9101e000 	add	x0, x0, #0x78
ffffff80400847b0:	aa0203e3 	mov	x3, x2
ffffff80400847b4:	aa0103e2 	mov	x2, x1
ffffff80400847b8:	52800e01 	mov	w1, #0x70                  	// #112
ffffff80400847bc:	94000adc 	bl	ffffff804008732c <_panic>
ffffff80400847c0:	f9403fa0 	ldr	x0, [x29, #120]
ffffff80400847c4:	91400400 	add	x0, x0, #0x1, lsl #12
ffffff80400847c8:	f9003fa0 	str	x0, [x29, #120]
ffffff80400847cc:	b94037a0 	ldr	w0, [x29, #52]
ffffff80400847d0:	f9403fa1 	ldr	x1, [x29, #120]
ffffff80400847d4:	eb00003f 	cmp	x1, x0
ffffff80400847d8:	54fff903 	b.cc	ffffff80400846f8 <load_icode_mapper+0x198>  // b.lo, b.ul, b.last
ffffff80400847dc:	52800000 	mov	w0, #0x0                   	// #0
ffffff80400847e0:	f9400bf3 	ldr	x19, [sp, #16]
ffffff80400847e4:	a8c87bfd 	ldp	x29, x30, [sp], #128
ffffff80400847e8:	d65f03c0 	ret

ffffff80400847ec <load_icode>:
ffffff80400847ec:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff80400847f0:	910003fd 	mov	x29, sp
ffffff80400847f4:	f90017a0 	str	x0, [x29, #40]
ffffff80400847f8:	f90013a1 	str	x1, [x29, #32]
ffffff80400847fc:	b9001fa2 	str	w2, [x29, #28]
ffffff8040084800:	f90023bf 	str	xzr, [x29, #64]
ffffff8040084804:	910103a0 	add	x0, x29, #0x40
ffffff8040084808:	94000433 	bl	ffffff80400858d4 <page_alloc>
ffffff804008480c:	93407c00 	sxtw	x0, w0
ffffff8040084810:	f90027a0 	str	x0, [x29, #72]
ffffff8040084814:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040084818:	f9409805 	ldr	x5, [x0, #304]
ffffff804008481c:	f94023a1 	ldr	x1, [x29, #64]
ffffff8040084820:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040084824:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084828:	12002400 	and	w0, w0, #0x3ff
ffffff804008482c:	2a0003e4 	mov	w4, w0
ffffff8040084830:	d2800803 	mov	x3, #0x40                  	// #64
ffffff8040084834:	b2742fe2 	mov	x2, #0xfff000              	// #16773120
ffffff8040084838:	aa0503e0 	mov	x0, x5
ffffff804008483c:	94000508 	bl	ffffff8040085c5c <page_insert>
ffffff8040084840:	93407c00 	sxtw	x0, w0
ffffff8040084844:	f90027a0 	str	x0, [x29, #72]
ffffff8040084848:	b9401fa1 	ldr	w1, [x29, #28]
ffffff804008484c:	90000000 	adrp	x0, ffffff8040084000 <mkenvid+0x38>
ffffff8040084850:	91158002 	add	x2, x0, #0x560
ffffff8040084854:	9100e3a0 	add	x0, x29, #0x38
ffffff8040084858:	aa0203e4 	mov	x4, x2
ffffff804008485c:	f94017a3 	ldr	x3, [x29, #40]
ffffff8040084860:	aa0003e2 	mov	x2, x0
ffffff8040084864:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084868:	940002dd 	bl	ffffff80400853dc <load_elf>
ffffff804008486c:	93407c00 	sxtw	x0, w0
ffffff8040084870:	f90027a0 	str	x0, [x29, #72]
ffffff8040084874:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040084878:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008487c:	f9008001 	str	x1, [x0, #256]
ffffff8040084880:	d503201f 	nop
ffffff8040084884:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff8040084888:	d65f03c0 	ret

ffffff804008488c <env_create_priority>:
ffffff804008488c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040084890:	910003fd 	mov	x29, sp
ffffff8040084894:	f90017a0 	str	x0, [x29, #40]
ffffff8040084898:	b90027a1 	str	w1, [x29, #36]
ffffff804008489c:	b90023a2 	str	w2, [x29, #32]
ffffff80400848a0:	f9000fa3 	str	x3, [x29, #24]
ffffff80400848a4:	9100e3a0 	add	x0, x29, #0x38
ffffff80400848a8:	f9400fa2 	ldr	x2, [x29, #24]
ffffff80400848ac:	52800001 	mov	w1, #0x0                   	// #0
ffffff80400848b0:	97fffeb1 	bl	ffffff8040084374 <env_alloc>
ffffff80400848b4:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400848b8:	b94023a1 	ldr	w1, [x29, #32]
ffffff80400848bc:	b9014801 	str	w1, [x0, #328]
ffffff80400848c0:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400848c4:	b94027a2 	ldr	w2, [x29, #36]
ffffff80400848c8:	f94017a1 	ldr	x1, [x29, #40]
ffffff80400848cc:	97ffffc8 	bl	ffffff80400847ec <load_icode>
ffffff80400848d0:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400848d4:	90003cc1 	adrp	x1, ffffff804081c000 <envs+0x619c8>
ffffff80400848d8:	9118e021 	add	x1, x1, #0x638
ffffff80400848dc:	b98023a2 	ldrsw	x2, [x29, #32]
ffffff80400848e0:	f8627821 	ldr	x1, [x1, x2, lsl #3]
ffffff80400848e4:	f9009c01 	str	x1, [x0, #312]
ffffff80400848e8:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400848ec:	f100001f 	cmp	x0, #0x0
ffffff80400848f0:	54000100 	b.eq	ffffff8040084910 <env_create_priority+0x84>  // b.none
ffffff80400848f4:	f9401fa1 	ldr	x1, [x29, #56]
ffffff80400848f8:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff80400848fc:	9118e000 	add	x0, x0, #0x638
ffffff8040084900:	b98023a2 	ldrsw	x2, [x29, #32]
ffffff8040084904:	f8627800 	ldr	x0, [x0, x2, lsl #3]
ffffff8040084908:	9104e021 	add	x1, x1, #0x138
ffffff804008490c:	f900a001 	str	x1, [x0, #320]
ffffff8040084910:	f9401fa2 	ldr	x2, [x29, #56]
ffffff8040084914:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084918:	9118e000 	add	x0, x0, #0x638
ffffff804008491c:	b98023a1 	ldrsw	x1, [x29, #32]
ffffff8040084920:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff8040084924:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040084928:	b98023a1 	ldrsw	x1, [x29, #32]
ffffff804008492c:	d37df022 	lsl	x2, x1, #3
ffffff8040084930:	90003cc1 	adrp	x1, ffffff804081c000 <envs+0x619c8>
ffffff8040084934:	9118e021 	add	x1, x1, #0x638
ffffff8040084938:	8b010041 	add	x1, x2, x1
ffffff804008493c:	f900a001 	str	x1, [x0, #320]
ffffff8040084940:	d503201f 	nop
ffffff8040084944:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040084948:	d65f03c0 	ret

ffffff804008494c <env_create>:
ffffff804008494c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040084950:	910003fd 	mov	x29, sp
ffffff8040084954:	f90017a0 	str	x0, [x29, #40]
ffffff8040084958:	b90027a1 	str	w1, [x29, #36]
ffffff804008495c:	f9000fa2 	str	x2, [x29, #24]
ffffff8040084960:	f9400fa3 	ldr	x3, [x29, #24]
ffffff8040084964:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040084968:	b94027a1 	ldr	w1, [x29, #36]
ffffff804008496c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040084970:	97ffffc7 	bl	ffffff804008488c <env_create_priority>
ffffff8040084974:	d503201f 	nop
ffffff8040084978:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff804008497c:	d65f03c0 	ret

ffffff8040084980 <env_free>:
ffffff8040084980:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040084984:	910003fd 	mov	x29, sp
ffffff8040084988:	f9000fa0 	str	x0, [x29, #24]
ffffff804008498c:	97fffd56 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040084990:	12001c00 	and	w0, w0, #0xff
ffffff8040084994:	b90037a0 	str	w0, [x29, #52]
ffffff8040084998:	f9001fbf 	str	xzr, [x29, #56]
ffffff804008499c:	1400002b 	b	ffffff8040084a48 <env_free+0xc8>
ffffff80400849a0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400849a4:	f9409801 	ldr	x1, [x0, #304]
ffffff80400849a8:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400849ac:	d37df000 	lsl	x0, x0, #3
ffffff80400849b0:	8b000020 	add	x0, x1, x0
ffffff80400849b4:	f9400000 	ldr	x0, [x0]
ffffff80400849b8:	92400400 	and	x0, x0, #0x3
ffffff80400849bc:	f100001f 	cmp	x0, #0x0
ffffff80400849c0:	540003c0 	b.eq	ffffff8040084a38 <env_free+0xb8>  // b.none
ffffff80400849c4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400849c8:	f9409800 	ldr	x0, [x0, #304]
ffffff80400849cc:	92744c00 	and	x0, x0, #0xfffff000
ffffff80400849d0:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff80400849d4:	f90017a0 	str	x0, [x29, #40]
ffffff80400849d8:	f90013bf 	str	xzr, [x29, #32]
ffffff80400849dc:	d503201f 	nop
ffffff80400849e0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400849e4:	f9409801 	ldr	x1, [x0, #304]
ffffff80400849e8:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400849ec:	d37df000 	lsl	x0, x0, #3
ffffff80400849f0:	8b000020 	add	x0, x1, x0
ffffff80400849f4:	f9400000 	ldr	x0, [x0]
ffffff80400849f8:	92744c00 	and	x0, x0, #0xfffff000
ffffff80400849fc:	97fffd56 	bl	ffffff8040083f54 <pa2page>
ffffff8040084a00:	aa0003e2 	mov	x2, x0
ffffff8040084a04:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a08:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084a0c:	12002400 	and	w0, w0, #0x3ff
ffffff8040084a10:	2a0003e1 	mov	w1, w0
ffffff8040084a14:	aa0203e0 	mov	x0, x2
ffffff8040084a18:	94000517 	bl	ffffff8040085e74 <page_decref>
ffffff8040084a1c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a20:	f9409801 	ldr	x1, [x0, #304]
ffffff8040084a24:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040084a28:	d37df000 	lsl	x0, x0, #3
ffffff8040084a2c:	8b000020 	add	x0, x1, x0
ffffff8040084a30:	f900001f 	str	xzr, [x0]
ffffff8040084a34:	14000002 	b	ffffff8040084a3c <env_free+0xbc>
ffffff8040084a38:	d503201f 	nop
ffffff8040084a3c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040084a40:	91000400 	add	x0, x0, #0x1
ffffff8040084a44:	f9001fa0 	str	x0, [x29, #56]
ffffff8040084a48:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040084a4c:	f100041f 	cmp	x0, #0x1
ffffff8040084a50:	54fffa89 	b.ls	ffffff80400849a0 <env_free+0x20>  // b.plast
ffffff8040084a54:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a58:	f9409800 	ldr	x0, [x0, #304]
ffffff8040084a5c:	97fffd3e 	bl	ffffff8040083f54 <pa2page>
ffffff8040084a60:	aa0003e2 	mov	x2, x0
ffffff8040084a64:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a68:	b9412000 	ldr	w0, [x0, #288]
ffffff8040084a6c:	12002400 	and	w0, w0, #0x3ff
ffffff8040084a70:	2a0003e1 	mov	w1, w0
ffffff8040084a74:	aa0203e0 	mov	x0, x2
ffffff8040084a78:	940004ff 	bl	ffffff8040085e74 <page_decref>
ffffff8040084a7c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a80:	b901281f 	str	wzr, [x0, #296]
ffffff8040084a84:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084a88:	91240000 	add	x0, x0, #0x900
ffffff8040084a8c:	f9400001 	ldr	x1, [x0]
ffffff8040084a90:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a94:	f9008801 	str	x1, [x0, #272]
ffffff8040084a98:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084a9c:	f9408800 	ldr	x0, [x0, #272]
ffffff8040084aa0:	f100001f 	cmp	x0, #0x0
ffffff8040084aa4:	540000e0 	b.eq	ffffff8040084ac0 <env_free+0x140>  // b.none
ffffff8040084aa8:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084aac:	91240000 	add	x0, x0, #0x900
ffffff8040084ab0:	f9400000 	ldr	x0, [x0]
ffffff8040084ab4:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040084ab8:	91044021 	add	x1, x1, #0x110
ffffff8040084abc:	f9008c01 	str	x1, [x0, #280]
ffffff8040084ac0:	900002c0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084ac4:	91240000 	add	x0, x0, #0x900
ffffff8040084ac8:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040084acc:	f9000001 	str	x1, [x0]
ffffff8040084ad0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084ad4:	900002c1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040084ad8:	91240021 	add	x1, x1, #0x900
ffffff8040084adc:	f9008c01 	str	x1, [x0, #280]
ffffff8040084ae0:	d503201f 	nop
ffffff8040084ae4:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040084ae8:	d65f03c0 	ret

ffffff8040084aec <env_destroy>:
ffffff8040084aec:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040084af0:	910003fd 	mov	x29, sp
ffffff8040084af4:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084af8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084afc:	b9414c00 	ldr	w0, [x0, #332]
ffffff8040084b00:	b9002fa0 	str	w0, [x29, #44]
ffffff8040084b04:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084b08:	97ffff9e 	bl	ffffff8040084980 <env_free>
ffffff8040084b0c:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084b10:	91194000 	add	x0, x0, #0x650
ffffff8040084b14:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084b18:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084b1c:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040084b20:	eb00003f 	cmp	x1, x0
ffffff8040084b24:	540000c1 	b.ne	ffffff8040084b3c <env_destroy+0x50>  // b.any
ffffff8040084b28:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084b2c:	91194000 	add	x0, x0, #0x650
ffffff8040084b30:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084b34:	f821781f 	str	xzr, [x0, x1, lsl #3]
ffffff8040084b38:	94000a57 	bl	ffffff8040087494 <sched_yield>
ffffff8040084b3c:	d503201f 	nop
ffffff8040084b40:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040084b44:	d65f03c0 	ret

ffffff8040084b48 <set_ttbr0>:
ffffff8040084b48:	d10043ff 	sub	sp, sp, #0x10
ffffff8040084b4c:	f90007e0 	str	x0, [sp, #8]
ffffff8040084b50:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084b54:	d5182000 	msr	ttbr0_el1, x0
ffffff8040084b58:	d503201f 	nop
ffffff8040084b5c:	910043ff 	add	sp, sp, #0x10
ffffff8040084b60:	d65f03c0 	ret

ffffff8040084b64 <tlb_invalidate>:
ffffff8040084b64:	d5033a9f 	dsb	ishst
ffffff8040084b68:	d508831f 	tlbi	vmalle1is
ffffff8040084b6c:	d5033b9f 	dsb	ish
ffffff8040084b70:	d5033fdf 	isb
ffffff8040084b74:	d503201f 	nop
ffffff8040084b78:	d65f03c0 	ret

ffffff8040084b7c <env_run>:
ffffff8040084b7c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040084b80:	910003fd 	mov	x29, sp
ffffff8040084b84:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084b88:	97fffcd7 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040084b8c:	12001c00 	and	w0, w0, #0xff
ffffff8040084b90:	b9002fa0 	str	w0, [x29, #44]
ffffff8040084b94:	900084c0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff8040084b98:	9119e000 	add	x0, x0, #0x678
ffffff8040084b9c:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084ba0:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084ba4:	f90013a0 	str	x0, [x29, #32]
ffffff8040084ba8:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084bac:	91194000 	add	x0, x0, #0x650
ffffff8040084bb0:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084bb4:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084bb8:	f100001f 	cmp	x0, #0x0
ffffff8040084bbc:	54000120 	b.eq	ffffff8040084be0 <env_run+0x64>  // b.none
ffffff8040084bc0:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084bc4:	91194000 	add	x0, x0, #0x650
ffffff8040084bc8:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084bcc:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084bd0:	d2802202 	mov	x2, #0x110                 	// #272
ffffff8040084bd4:	aa0003e1 	mov	x1, x0
ffffff8040084bd8:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040084bdc:	94000314 	bl	ffffff804008582c <bcopy>
ffffff8040084be0:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084be4:	91194000 	add	x0, x0, #0x650
ffffff8040084be8:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084bec:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084bf0:	f100001f 	cmp	x0, #0x0
ffffff8040084bf4:	540000e0 	b.eq	ffffff8040084c10 <env_run+0x94>  // b.none
ffffff8040084bf8:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084bfc:	91194000 	add	x0, x0, #0x650
ffffff8040084c00:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084c04:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084c08:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040084c0c:	b9012801 	str	w1, [x0, #296]
ffffff8040084c10:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084c14:	91194000 	add	x0, x0, #0x650
ffffff8040084c18:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084c1c:	f9400fa2 	ldr	x2, [x29, #24]
ffffff8040084c20:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff8040084c24:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084c28:	91194000 	add	x0, x0, #0x650
ffffff8040084c2c:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084c30:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084c34:	b9402fa1 	ldr	w1, [x29, #44]
ffffff8040084c38:	b9014c01 	str	w1, [x0, #332]
ffffff8040084c3c:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084c40:	91194000 	add	x0, x0, #0x650
ffffff8040084c44:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084c48:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084c4c:	52800061 	mov	w1, #0x3                   	// #3
ffffff8040084c50:	b9012801 	str	w1, [x0, #296]
ffffff8040084c54:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084c58:	91194000 	add	x0, x0, #0x650
ffffff8040084c5c:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084c60:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084c64:	d2802202 	mov	x2, #0x110                 	// #272
ffffff8040084c68:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040084c6c:	940002f0 	bl	ffffff804008582c <bcopy>
ffffff8040084c70:	90003cc0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040084c74:	91194000 	add	x0, x0, #0x650
ffffff8040084c78:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084c7c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040084c80:	f9409800 	ldr	x0, [x0, #304]
ffffff8040084c84:	92407c00 	and	x0, x0, #0xffffffff
ffffff8040084c88:	97ffffb0 	bl	ffffff8040084b48 <set_ttbr0>
ffffff8040084c8c:	97ffffb6 	bl	ffffff8040084b64 <tlb_invalidate>
ffffff8040084c90:	d503201f 	nop
ffffff8040084c94:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040084c98:	d65f03c0 	ret

ffffff8040084c9c <bit_extract>:
ffffff8040084c9c:	d10083ff 	sub	sp, sp, #0x20
ffffff8040084ca0:	f9000fe0 	str	x0, [sp, #24]
ffffff8040084ca4:	f9000be1 	str	x1, [sp, #16]
ffffff8040084ca8:	f90007e2 	str	x2, [sp, #8]
ffffff8040084cac:	f9400be0 	ldr	x0, [sp, #16]
ffffff8040084cb0:	2a0003e1 	mov	w1, w0
ffffff8040084cb4:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040084cb8:	9ac12401 	lsr	x1, x0, x1
ffffff8040084cbc:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084cc0:	2a0003e2 	mov	w2, w0
ffffff8040084cc4:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
ffffff8040084cc8:	9ac22000 	lsl	x0, x0, x2
ffffff8040084ccc:	aa2003e0 	mvn	x0, x0
ffffff8040084cd0:	8a000020 	and	x0, x1, x0
ffffff8040084cd4:	910083ff 	add	sp, sp, #0x20
ffffff8040084cd8:	d65f03c0 	ret

ffffff8040084cdc <interrupts_arch_enable>:
ffffff8040084cdc:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040084ce0:	910003fd 	mov	x29, sp
ffffff8040084ce4:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084ce8:	b90017a1 	str	w1, [x29, #20]
ffffff8040084cec:	b90013a2 	str	w2, [x29, #16]
ffffff8040084cf0:	b94017a1 	ldr	w1, [x29, #20]
ffffff8040084cf4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084cf8:	9400003e 	bl	ffffff8040084df0 <gicd_set_enable>
ffffff8040084cfc:	52800fe1 	mov	w1, #0x7f                  	// #127
ffffff8040084d00:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084d04:	9400005e 	bl	ffffff8040084e7c <gicd_set_prio>
ffffff8040084d08:	b94013a0 	ldr	w0, [x29, #16]
ffffff8040084d0c:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040084d10:	1ac02020 	lsl	w0, w1, w0
ffffff8040084d14:	12001c00 	and	w0, w0, #0xff
ffffff8040084d18:	2a0003e1 	mov	w1, w0
ffffff8040084d1c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084d20:	94000004 	bl	ffffff8040084d30 <gicd_set_trgt>
ffffff8040084d24:	d503201f 	nop
ffffff8040084d28:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040084d2c:	d65f03c0 	ret

ffffff8040084d30 <gicd_set_trgt>:
ffffff8040084d30:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040084d34:	f90007e0 	str	x0, [sp, #8]
ffffff8040084d38:	39001fe1 	strb	w1, [sp, #7]
ffffff8040084d3c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084d40:	d37df000 	lsl	x0, x0, #3
ffffff8040084d44:	d345fc00 	lsr	x0, x0, #5
ffffff8040084d48:	f90017e0 	str	x0, [sp, #40]
ffffff8040084d4c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084d50:	d37df000 	lsl	x0, x0, #3
ffffff8040084d54:	927d0400 	and	x0, x0, #0x18
ffffff8040084d58:	f90013e0 	str	x0, [sp, #32]
ffffff8040084d5c:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040084d60:	2a0003e1 	mov	w1, w0
ffffff8040084d64:	d2800020 	mov	x0, #0x1                   	// #1
ffffff8040084d68:	9ac12000 	lsl	x0, x0, x1
ffffff8040084d6c:	4b0003e1 	neg	w1, w0
ffffff8040084d70:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040084d74:	11002000 	add	w0, w0, #0x8
ffffff8040084d78:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
ffffff8040084d7c:	9ac02040 	lsl	x0, x2, x0
ffffff8040084d80:	2a2003e0 	mvn	w0, w0
ffffff8040084d84:	0a000020 	and	w0, w1, w0
ffffff8040084d88:	b9001fe0 	str	w0, [sp, #28]
ffffff8040084d8c:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084d90:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084d94:	f9400000 	ldr	x0, [x0]
ffffff8040084d98:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040084d9c:	91080021 	add	x1, x1, #0x200
ffffff8040084da0:	b8617801 	ldr	w1, [x0, x1, lsl #2]
ffffff8040084da4:	b9401fe0 	ldr	w0, [sp, #28]
ffffff8040084da8:	2a2003e0 	mvn	w0, w0
ffffff8040084dac:	0a000022 	and	w2, w1, w0
ffffff8040084db0:	39401fe0 	ldrb	w0, [sp, #7]
ffffff8040084db4:	f94013e1 	ldr	x1, [sp, #32]
ffffff8040084db8:	1ac12000 	lsl	w0, w0, w1
ffffff8040084dbc:	2a0003e1 	mov	w1, w0
ffffff8040084dc0:	b9401fe0 	ldr	w0, [sp, #28]
ffffff8040084dc4:	0a000021 	and	w1, w1, w0
ffffff8040084dc8:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084dcc:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084dd0:	f9400000 	ldr	x0, [x0]
ffffff8040084dd4:	2a010042 	orr	w2, w2, w1
ffffff8040084dd8:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040084ddc:	91080021 	add	x1, x1, #0x200
ffffff8040084de0:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084de4:	d503201f 	nop
ffffff8040084de8:	9100c3ff 	add	sp, sp, #0x30
ffffff8040084dec:	d65f03c0 	ret

ffffff8040084df0 <gicd_set_enable>:
ffffff8040084df0:	d10083ff 	sub	sp, sp, #0x20
ffffff8040084df4:	f90007e0 	str	x0, [sp, #8]
ffffff8040084df8:	b90007e1 	str	w1, [sp, #4]
ffffff8040084dfc:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084e00:	d345fc00 	lsr	x0, x0, #5
ffffff8040084e04:	f9000fe0 	str	x0, [sp, #24]
ffffff8040084e08:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084e0c:	12001000 	and	w0, w0, #0x1f
ffffff8040084e10:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040084e14:	1ac02020 	lsl	w0, w1, w0
ffffff8040084e18:	2a0003e0 	mov	w0, w0
ffffff8040084e1c:	f9000be0 	str	x0, [sp, #16]
ffffff8040084e20:	b94007e0 	ldr	w0, [sp, #4]
ffffff8040084e24:	7100001f 	cmp	w0, #0x0
ffffff8040084e28:	54000140 	b.eq	ffffff8040084e50 <gicd_set_enable+0x60>  // b.none
ffffff8040084e2c:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084e30:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084e34:	f9400000 	ldr	x0, [x0]
ffffff8040084e38:	f9400be1 	ldr	x1, [sp, #16]
ffffff8040084e3c:	2a0103e2 	mov	w2, w1
ffffff8040084e40:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040084e44:	91010021 	add	x1, x1, #0x40
ffffff8040084e48:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084e4c:	14000009 	b	ffffff8040084e70 <gicd_set_enable+0x80>
ffffff8040084e50:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084e54:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084e58:	f9400000 	ldr	x0, [x0]
ffffff8040084e5c:	f9400be1 	ldr	x1, [sp, #16]
ffffff8040084e60:	2a0103e2 	mov	w2, w1
ffffff8040084e64:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040084e68:	91018021 	add	x1, x1, #0x60
ffffff8040084e6c:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084e70:	d503201f 	nop
ffffff8040084e74:	910083ff 	add	sp, sp, #0x20
ffffff8040084e78:	d65f03c0 	ret

ffffff8040084e7c <gicd_set_prio>:
ffffff8040084e7c:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040084e80:	f90007e0 	str	x0, [sp, #8]
ffffff8040084e84:	39001fe1 	strb	w1, [sp, #7]
ffffff8040084e88:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084e8c:	d37df000 	lsl	x0, x0, #3
ffffff8040084e90:	d345fc00 	lsr	x0, x0, #5
ffffff8040084e94:	f90017e0 	str	x0, [sp, #40]
ffffff8040084e98:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040084e9c:	d37df000 	lsl	x0, x0, #3
ffffff8040084ea0:	927d0400 	and	x0, x0, #0x18
ffffff8040084ea4:	f90013e0 	str	x0, [sp, #32]
ffffff8040084ea8:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040084eac:	2a0003e1 	mov	w1, w0
ffffff8040084eb0:	d2800020 	mov	x0, #0x1                   	// #1
ffffff8040084eb4:	9ac12000 	lsl	x0, x0, x1
ffffff8040084eb8:	cb0003e1 	neg	x1, x0
ffffff8040084ebc:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040084ec0:	11002000 	add	w0, w0, #0x8
ffffff8040084ec4:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
ffffff8040084ec8:	9ac02040 	lsl	x0, x2, x0
ffffff8040084ecc:	aa2003e0 	mvn	x0, x0
ffffff8040084ed0:	8a000020 	and	x0, x1, x0
ffffff8040084ed4:	f9000fe0 	str	x0, [sp, #24]
ffffff8040084ed8:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084edc:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084ee0:	f9400000 	ldr	x0, [x0]
ffffff8040084ee4:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040084ee8:	91040021 	add	x1, x1, #0x100
ffffff8040084eec:	b8617801 	ldr	w1, [x0, x1, lsl #2]
ffffff8040084ef0:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040084ef4:	2a2003e0 	mvn	w0, w0
ffffff8040084ef8:	0a000022 	and	w2, w1, w0
ffffff8040084efc:	39401fe0 	ldrb	w0, [sp, #7]
ffffff8040084f00:	f94013e1 	ldr	x1, [sp, #32]
ffffff8040084f04:	1ac12000 	lsl	w0, w0, w1
ffffff8040084f08:	2a0003e1 	mov	w1, w0
ffffff8040084f0c:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040084f10:	0a000021 	and	w1, w1, w0
ffffff8040084f14:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084f18:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084f1c:	f9400000 	ldr	x0, [x0]
ffffff8040084f20:	2a010042 	orr	w2, w2, w1
ffffff8040084f24:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040084f28:	91040021 	add	x1, x1, #0x100
ffffff8040084f2c:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084f30:	d503201f 	nop
ffffff8040084f34:	9100c3ff 	add	sp, sp, #0x30
ffffff8040084f38:	d65f03c0 	ret

ffffff8040084f3c <gicd_init>:
ffffff8040084f3c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040084f40:	910003fd 	mov	x29, sp
ffffff8040084f44:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084f48:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084f4c:	f9400000 	ldr	x0, [x0]
ffffff8040084f50:	b9400400 	ldr	w0, [x0, #4]
ffffff8040084f54:	2a0003e0 	mov	w0, w0
ffffff8040084f58:	d28000a2 	mov	x2, #0x5                   	// #5
ffffff8040084f5c:	d2800001 	mov	x1, #0x0                   	// #0
ffffff8040084f60:	97ffff4f 	bl	ffffff8040084c9c <bit_extract>
ffffff8040084f64:	b90023a0 	str	w0, [x29, #32]
ffffff8040084f68:	b94023a0 	ldr	w0, [x29, #32]
ffffff8040084f6c:	531b6800 	lsl	w0, w0, #5
ffffff8040084f70:	11000400 	add	w0, w0, #0x1
ffffff8040084f74:	2a0003e0 	mov	w0, w0
ffffff8040084f78:	f9000fa0 	str	x0, [x29, #24]
ffffff8040084f7c:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040084f80:	b9002fa0 	str	w0, [x29, #44]
ffffff8040084f84:	14000019 	b	ffffff8040084fe8 <gicd_init+0xac>
ffffff8040084f88:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084f8c:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084f90:	f9400000 	ldr	x0, [x0]
ffffff8040084f94:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084f98:	91018021 	add	x1, x1, #0x60
ffffff8040084f9c:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040084fa0:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084fa4:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084fa8:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084fac:	f9400000 	ldr	x0, [x0]
ffffff8040084fb0:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084fb4:	91028021 	add	x1, x1, #0xa0
ffffff8040084fb8:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040084fbc:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084fc0:	b0000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040084fc4:	911a8000 	add	x0, x0, #0x6a0
ffffff8040084fc8:	f9400000 	ldr	x0, [x0]
ffffff8040084fcc:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084fd0:	91038021 	add	x1, x1, #0xe0
ffffff8040084fd4:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040084fd8:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040084fdc:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040084fe0:	11000400 	add	w0, w0, #0x1
ffffff8040084fe4:	b9002fa0 	str	w0, [x29, #44]
ffffff8040084fe8:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040084fec:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040084ff0:	d345fc00 	lsr	x0, x0, #5
ffffff8040084ff4:	eb00003f 	cmp	x1, x0
ffffff8040084ff8:	54fffc83 	b.cc	ffffff8040084f88 <gicd_init+0x4c>  // b.lo, b.ul, b.last
ffffff8040084ffc:	52800400 	mov	w0, #0x20                  	// #32
ffffff8040085000:	b9002ba0 	str	w0, [x29, #40]
ffffff8040085004:	1400000b 	b	ffffff8040085030 <gicd_init+0xf4>
ffffff8040085008:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008500c:	911a8000 	add	x0, x0, #0x6a0
ffffff8040085010:	f9400000 	ldr	x0, [x0]
ffffff8040085014:	b9802ba1 	ldrsw	x1, [x29, #40]
ffffff8040085018:	91040021 	add	x1, x1, #0x100
ffffff804008501c:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040085020:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040085024:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040085028:	11000400 	add	w0, w0, #0x1
ffffff804008502c:	b9002ba0 	str	w0, [x29, #40]
ffffff8040085030:	b9802ba1 	ldrsw	x1, [x29, #40]
ffffff8040085034:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085038:	d37df000 	lsl	x0, x0, #3
ffffff804008503c:	d345fc00 	lsr	x0, x0, #5
ffffff8040085040:	eb00003f 	cmp	x1, x0
ffffff8040085044:	54fffe23 	b.cc	ffffff8040085008 <gicd_init+0xcc>  // b.lo, b.ul, b.last
ffffff8040085048:	52800400 	mov	w0, #0x20                  	// #32
ffffff804008504c:	b90027a0 	str	w0, [x29, #36]
ffffff8040085050:	1400000a 	b	ffffff8040085078 <gicd_init+0x13c>
ffffff8040085054:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085058:	911a8000 	add	x0, x0, #0x6a0
ffffff804008505c:	f9400000 	ldr	x0, [x0]
ffffff8040085060:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040085064:	91080021 	add	x1, x1, #0x200
ffffff8040085068:	b821781f 	str	wzr, [x0, x1, lsl #2]
ffffff804008506c:	b94027a0 	ldr	w0, [x29, #36]
ffffff8040085070:	11000400 	add	w0, w0, #0x1
ffffff8040085074:	b90027a0 	str	w0, [x29, #36]
ffffff8040085078:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008507c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085080:	d37df000 	lsl	x0, x0, #3
ffffff8040085084:	d345fc00 	lsr	x0, x0, #5
ffffff8040085088:	eb00003f 	cmp	x1, x0
ffffff804008508c:	54fffe43 	b.cc	ffffff8040085054 <gicd_init+0x118>  // b.lo, b.ul, b.last
ffffff8040085090:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085094:	911a8000 	add	x0, x0, #0x6a0
ffffff8040085098:	f9400000 	ldr	x0, [x0]
ffffff804008509c:	b9400001 	ldr	w1, [x0]
ffffff80400850a0:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400850a4:	911a8000 	add	x0, x0, #0x6a0
ffffff80400850a8:	f9400000 	ldr	x0, [x0]
ffffff80400850ac:	32000021 	orr	w1, w1, #0x1
ffffff80400850b0:	b9000001 	str	w1, [x0]
ffffff80400850b4:	d503201f 	nop
ffffff80400850b8:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400850bc:	d65f03c0 	ret

ffffff80400850c0 <gicc_init>:
ffffff80400850c0:	d10043ff 	sub	sp, sp, #0x10
ffffff80400850c4:	b9000fff 	str	wzr, [sp, #12]
ffffff80400850c8:	14000019 	b	ffffff804008512c <gicc_init+0x6c>
ffffff80400850cc:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400850d0:	911a8000 	add	x0, x0, #0x6a0
ffffff80400850d4:	f9400000 	ldr	x0, [x0]
ffffff80400850d8:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff80400850dc:	91018021 	add	x1, x1, #0x60
ffffff80400850e0:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff80400850e4:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff80400850e8:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400850ec:	911a8000 	add	x0, x0, #0x6a0
ffffff80400850f0:	f9400000 	ldr	x0, [x0]
ffffff80400850f4:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff80400850f8:	91028021 	add	x1, x1, #0xa0
ffffff80400850fc:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040085100:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040085104:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085108:	911a8000 	add	x0, x0, #0x6a0
ffffff804008510c:	f9400000 	ldr	x0, [x0]
ffffff8040085110:	b9800fe1 	ldrsw	x1, [sp, #12]
ffffff8040085114:	91038021 	add	x1, x1, #0xe0
ffffff8040085118:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff804008511c:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040085120:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040085124:	11000400 	add	w0, w0, #0x1
ffffff8040085128:	b9000fe0 	str	w0, [sp, #12]
ffffff804008512c:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040085130:	7100001f 	cmp	w0, #0x0
ffffff8040085134:	54fffcc0 	b.eq	ffffff80400850cc <gicc_init+0xc>  // b.none
ffffff8040085138:	b9000bff 	str	wzr, [sp, #8]
ffffff804008513c:	1400000b 	b	ffffff8040085168 <gicc_init+0xa8>
ffffff8040085140:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085144:	911a8000 	add	x0, x0, #0x6a0
ffffff8040085148:	f9400000 	ldr	x0, [x0]
ffffff804008514c:	b9800be1 	ldrsw	x1, [sp, #8]
ffffff8040085150:	910f1021 	add	x1, x1, #0x3c4
ffffff8040085154:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040085158:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff804008515c:	b9400be0 	ldr	w0, [sp, #8]
ffffff8040085160:	11000400 	add	w0, w0, #0x1
ffffff8040085164:	b9000be0 	str	w0, [sp, #8]
ffffff8040085168:	b9400be0 	ldr	w0, [sp, #8]
ffffff804008516c:	71000c1f 	cmp	w0, #0x3
ffffff8040085170:	54fffe89 	b.ls	ffffff8040085140 <gicc_init+0x80>  // b.plast
ffffff8040085174:	b90007ff 	str	wzr, [sp, #4]
ffffff8040085178:	1400000b 	b	ffffff80400851a4 <gicc_init+0xe4>
ffffff804008517c:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085180:	911a8000 	add	x0, x0, #0x6a0
ffffff8040085184:	f9400000 	ldr	x0, [x0]
ffffff8040085188:	b98007e1 	ldrsw	x1, [sp, #4]
ffffff804008518c:	91040021 	add	x1, x1, #0x100
ffffff8040085190:	12800002 	mov	w2, #0xffffffff            	// #-1
ffffff8040085194:	b8217802 	str	w2, [x0, x1, lsl #2]
ffffff8040085198:	b94007e0 	ldr	w0, [sp, #4]
ffffff804008519c:	11000400 	add	w0, w0, #0x1
ffffff80400851a0:	b90007e0 	str	w0, [sp, #4]
ffffff80400851a4:	b94007e0 	ldr	w0, [sp, #4]
ffffff80400851a8:	71001c1f 	cmp	w0, #0x7
ffffff80400851ac:	54fffe89 	b.ls	ffffff804008517c <gicc_init+0xbc>  // b.plast
ffffff80400851b0:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400851b4:	911aa000 	add	x0, x0, #0x6a8
ffffff80400851b8:	f9400000 	ldr	x0, [x0]
ffffff80400851bc:	12800001 	mov	w1, #0xffffffff            	// #-1
ffffff80400851c0:	b9000401 	str	w1, [x0, #4]
ffffff80400851c4:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400851c8:	911aa000 	add	x0, x0, #0x6a8
ffffff80400851cc:	f9400000 	ldr	x0, [x0]
ffffff80400851d0:	b9400002 	ldr	w2, [x0]
ffffff80400851d4:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400851d8:	911aa000 	add	x0, x0, #0x6a8
ffffff80400851dc:	f9400000 	ldr	x0, [x0]
ffffff80400851e0:	52804021 	mov	w1, #0x201                 	// #513
ffffff80400851e4:	2a010041 	orr	w1, w2, w1
ffffff80400851e8:	b9000001 	str	w1, [x0]
ffffff80400851ec:	d503201f 	nop
ffffff80400851f0:	910043ff 	add	sp, sp, #0x10
ffffff80400851f4:	d65f03c0 	ret

ffffff80400851f8 <timer_gic_init>:
ffffff80400851f8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff80400851fc:	910003fd 	mov	x29, sp
ffffff8040085200:	b9001fa0 	str	w0, [x29, #28]
ffffff8040085204:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085208:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008520c:	d2800340 	mov	x0, #0x1a                  	// #26
ffffff8040085210:	97fffeb3 	bl	ffffff8040084cdc <interrupts_arch_enable>
ffffff8040085214:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085218:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008521c:	d2800360 	mov	x0, #0x1b                  	// #27
ffffff8040085220:	97fffeaf 	bl	ffffff8040084cdc <interrupts_arch_enable>
ffffff8040085224:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085228:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008522c:	d28003c0 	mov	x0, #0x1e                  	// #30
ffffff8040085230:	97fffeab 	bl	ffffff8040084cdc <interrupts_arch_enable>
ffffff8040085234:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085238:	52800021 	mov	w1, #0x1                   	// #1
ffffff804008523c:	d2800380 	mov	x0, #0x1c                  	// #28
ffffff8040085240:	97fffea7 	bl	ffffff8040084cdc <interrupts_arch_enable>
ffffff8040085244:	d503201f 	nop
ffffff8040085248:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff804008524c:	d65f03c0 	ret

ffffff8040085250 <gic_handler>:
ffffff8040085250:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040085254:	910003fd 	mov	x29, sp
ffffff8040085258:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008525c:	911aa000 	add	x0, x0, #0x6a8
ffffff8040085260:	f9400000 	ldr	x0, [x0]
ffffff8040085264:	b9400c00 	ldr	w0, [x0, #12]
ffffff8040085268:	2a0003e0 	mov	w0, w0
ffffff804008526c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040085270:	d2800142 	mov	x2, #0xa                   	// #10
ffffff8040085274:	d2800001 	mov	x1, #0x0                   	// #0
ffffff8040085278:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008527c:	97fffe88 	bl	ffffff8040084c9c <bit_extract>
ffffff8040085280:	f9000ba0 	str	x0, [x29, #16]
ffffff8040085284:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040085288:	f10ff41f 	cmp	x0, #0x3fd
ffffff804008528c:	54000408 	b.hi	ffffff804008530c <gic_handler+0xbc>  // b.pmore
ffffff8040085290:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040085294:	f100781f 	cmp	x0, #0x1e
ffffff8040085298:	54000140 	b.eq	ffffff80400852c0 <gic_handler+0x70>  // b.none
ffffff804008529c:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400852a0:	f100681f 	cmp	x0, #0x1a
ffffff80400852a4:	540000e0 	b.eq	ffffff80400852c0 <gic_handler+0x70>  // b.none
ffffff80400852a8:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400852ac:	f1006c1f 	cmp	x0, #0x1b
ffffff80400852b0:	54000080 	b.eq	ffffff80400852c0 <gic_handler+0x70>  // b.none
ffffff80400852b4:	f9400ba0 	ldr	x0, [x29, #16]
ffffff80400852b8:	f100701f 	cmp	x0, #0x1c
ffffff80400852bc:	540001c1 	b.ne	ffffff80400852f4 <gic_handler+0xa4>  // b.any
ffffff80400852c0:	94000875 	bl	ffffff8040087494 <sched_yield>
ffffff80400852c4:	94000015 	bl	ffffff8040085318 <kclock_next>
ffffff80400852c8:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400852cc:	911aa000 	add	x0, x0, #0x6a8
ffffff80400852d0:	f9400000 	ldr	x0, [x0]
ffffff80400852d4:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400852d8:	b9001001 	str	w1, [x0, #16]
ffffff80400852dc:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400852e0:	911aa000 	add	x0, x0, #0x6a8
ffffff80400852e4:	f9400000 	ldr	x0, [x0]
ffffff80400852e8:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400852ec:	b9100001 	str	w1, [x0, #4096]
ffffff80400852f0:	14000008 	b	ffffff8040085310 <gic_handler+0xc0>
ffffff80400852f4:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400852f8:	9102a000 	add	x0, x0, #0xa8
ffffff80400852fc:	f9400ba1 	ldr	x1, [x29, #16]
ffffff8040085300:	940007e2 	bl	ffffff8040087288 <printf>
ffffff8040085304:	d503201f 	nop
ffffff8040085308:	17ffffff 	b	ffffff8040085304 <gic_handler+0xb4>
ffffff804008530c:	d503201f 	nop
ffffff8040085310:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040085314:	d65f03c0 	ret

ffffff8040085318 <kclock_next>:
ffffff8040085318:	d10043ff 	sub	sp, sp, #0x10
ffffff804008531c:	d2a02000 	mov	x0, #0x1000000             	// #16777216
ffffff8040085320:	f90007e0 	str	x0, [sp, #8]
ffffff8040085324:	d53be320 	mrs	x0, cntv_ctl_el0
ffffff8040085328:	f90003e0 	str	x0, [sp]
ffffff804008532c:	f94003e0 	ldr	x0, [sp]
ffffff8040085330:	b2400000 	orr	x0, x0, #0x1
ffffff8040085334:	f90003e0 	str	x0, [sp]
ffffff8040085338:	f94003e0 	ldr	x0, [sp]
ffffff804008533c:	927ef800 	and	x0, x0, #0xfffffffffffffffd
ffffff8040085340:	f90003e0 	str	x0, [sp]
ffffff8040085344:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085348:	d51be300 	msr	cntv_tval_el0, x0
ffffff804008534c:	f94003e0 	ldr	x0, [sp]
ffffff8040085350:	d51be320 	msr	cntv_ctl_el0, x0
ffffff8040085354:	d503201f 	nop
ffffff8040085358:	910043ff 	add	sp, sp, #0x10
ffffff804008535c:	d65f03c0 	ret

ffffff8040085360 <kclock_init>:
ffffff8040085360:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff8040085364:	910003fd 	mov	x29, sp
ffffff8040085368:	97ffffec 	bl	ffffff8040085318 <kclock_next>
ffffff804008536c:	d503201f 	nop
ffffff8040085370:	a8c17bfd 	ldp	x29, x30, [sp], #16
ffffff8040085374:	d65f03c0 	ret

ffffff8040085378 <is_elf_format>:
ffffff8040085378:	d10083ff 	sub	sp, sp, #0x20
ffffff804008537c:	f90007e0 	str	x0, [sp, #8]
ffffff8040085380:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085384:	f9000fe0 	str	x0, [sp, #24]
ffffff8040085388:	f9400fe0 	ldr	x0, [sp, #24]
ffffff804008538c:	39400000 	ldrb	w0, [x0]
ffffff8040085390:	7101fc1f 	cmp	w0, #0x7f
ffffff8040085394:	540001e1 	b.ne	ffffff80400853d0 <is_elf_format+0x58>  // b.any
ffffff8040085398:	f9400fe0 	ldr	x0, [sp, #24]
ffffff804008539c:	39400400 	ldrb	w0, [x0, #1]
ffffff80400853a0:	7101141f 	cmp	w0, #0x45
ffffff80400853a4:	54000161 	b.ne	ffffff80400853d0 <is_elf_format+0x58>  // b.any
ffffff80400853a8:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400853ac:	39400800 	ldrb	w0, [x0, #2]
ffffff80400853b0:	7101301f 	cmp	w0, #0x4c
ffffff80400853b4:	540000e1 	b.ne	ffffff80400853d0 <is_elf_format+0x58>  // b.any
ffffff80400853b8:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400853bc:	39400c00 	ldrb	w0, [x0, #3]
ffffff80400853c0:	7101181f 	cmp	w0, #0x46
ffffff80400853c4:	54000061 	b.ne	ffffff80400853d0 <is_elf_format+0x58>  // b.any
ffffff80400853c8:	52800020 	mov	w0, #0x1                   	// #1
ffffff80400853cc:	14000002 	b	ffffff80400853d4 <is_elf_format+0x5c>
ffffff80400853d0:	52800000 	mov	w0, #0x0                   	// #0
ffffff80400853d4:	910083ff 	add	sp, sp, #0x20
ffffff80400853d8:	d65f03c0 	ret

ffffff80400853dc <load_elf>:
ffffff80400853dc:	a9b97bfd 	stp	x29, x30, [sp, #-112]!
ffffff80400853e0:	910003fd 	mov	x29, sp
ffffff80400853e4:	f9001fa0 	str	x0, [x29, #56]
ffffff80400853e8:	b90037a1 	str	w1, [x29, #52]
ffffff80400853ec:	f90017a2 	str	x2, [x29, #40]
ffffff80400853f0:	f90013a3 	str	x3, [x29, #32]
ffffff80400853f4:	f9000fa4 	str	x4, [x29, #24]
ffffff80400853f8:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400853fc:	f9002fa0 	str	x0, [x29, #88]
ffffff8040085400:	f9002bbf 	str	xzr, [x29, #80]
ffffff8040085404:	f90037bf 	str	xzr, [x29, #104]
ffffff8040085408:	b94037a0 	ldr	w0, [x29, #52]
ffffff804008540c:	71000c1f 	cmp	w0, #0x3
ffffff8040085410:	540000ad 	b.le	ffffff8040085424 <load_elf+0x48>
ffffff8040085414:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085418:	97ffffd8 	bl	ffffff8040085378 <is_elf_format>
ffffff804008541c:	7100001f 	cmp	w0, #0x0
ffffff8040085420:	54000061 	b.ne	ffffff804008542c <load_elf+0x50>  // b.any
ffffff8040085424:	12800000 	mov	w0, #0xffffffff            	// #-1
ffffff8040085428:	14000039 	b	ffffff804008550c <load_elf+0x130>
ffffff804008542c:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040085430:	f9401000 	ldr	x0, [x0, #32]
ffffff8040085434:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040085438:	8b000020 	add	x0, x1, x0
ffffff804008543c:	f90037a0 	str	x0, [x29, #104]
ffffff8040085440:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040085444:	79407000 	ldrh	w0, [x0, #56]
ffffff8040085448:	7900cfa0 	strh	w0, [x29, #102]
ffffff804008544c:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040085450:	79406c00 	ldrh	w0, [x0, #54]
ffffff8040085454:	79009fa0 	strh	w0, [x29, #78]
ffffff8040085458:	14000023 	b	ffffff80400854e4 <load_elf+0x108>
ffffff804008545c:	f94037a0 	ldr	x0, [x29, #104]
ffffff8040085460:	f9002ba0 	str	x0, [x29, #80]
ffffff8040085464:	f9402ba0 	ldr	x0, [x29, #80]
ffffff8040085468:	b9400000 	ldr	w0, [x0]
ffffff804008546c:	7100041f 	cmp	w0, #0x1
ffffff8040085470:	54000321 	b.ne	ffffff80400854d4 <load_elf+0xf8>  // b.any
ffffff8040085474:	f9402ba0 	ldr	x0, [x29, #80]
ffffff8040085478:	f9400806 	ldr	x6, [x0, #16]
ffffff804008547c:	f9402ba0 	ldr	x0, [x29, #80]
ffffff8040085480:	f9401400 	ldr	x0, [x0, #40]
ffffff8040085484:	2a0003e7 	mov	w7, w0
ffffff8040085488:	f9402ba0 	ldr	x0, [x29, #80]
ffffff804008548c:	f9400400 	ldr	x0, [x0, #8]
ffffff8040085490:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040085494:	8b000021 	add	x1, x1, x0
ffffff8040085498:	f9402ba0 	ldr	x0, [x29, #80]
ffffff804008549c:	f9401000 	ldr	x0, [x0, #32]
ffffff80400854a0:	f9400fa5 	ldr	x5, [x29, #24]
ffffff80400854a4:	f94013a4 	ldr	x4, [x29, #32]
ffffff80400854a8:	2a0003e3 	mov	w3, w0
ffffff80400854ac:	aa0103e2 	mov	x2, x1
ffffff80400854b0:	2a0703e1 	mov	w1, w7
ffffff80400854b4:	aa0603e0 	mov	x0, x6
ffffff80400854b8:	d63f00a0 	blr	x5
ffffff80400854bc:	b9004ba0 	str	w0, [x29, #72]
ffffff80400854c0:	b9404ba0 	ldr	w0, [x29, #72]
ffffff80400854c4:	7100001f 	cmp	w0, #0x0
ffffff80400854c8:	5400006a 	b.ge	ffffff80400854d4 <load_elf+0xf8>  // b.tcont
ffffff80400854cc:	b9404ba0 	ldr	w0, [x29, #72]
ffffff80400854d0:	1400000f 	b	ffffff804008550c <load_elf+0x130>
ffffff80400854d4:	79409fa0 	ldrh	w0, [x29, #78]
ffffff80400854d8:	f94037a1 	ldr	x1, [x29, #104]
ffffff80400854dc:	8b000020 	add	x0, x1, x0
ffffff80400854e0:	f90037a0 	str	x0, [x29, #104]
ffffff80400854e4:	7940cfa0 	ldrh	w0, [x29, #102]
ffffff80400854e8:	51000401 	sub	w1, w0, #0x1
ffffff80400854ec:	7900cfa1 	strh	w1, [x29, #102]
ffffff80400854f0:	7100001f 	cmp	w0, #0x0
ffffff80400854f4:	54fffb41 	b.ne	ffffff804008545c <load_elf+0x80>  // b.any
ffffff80400854f8:	f9402fa0 	ldr	x0, [x29, #88]
ffffff80400854fc:	f9400c01 	ldr	x1, [x0, #24]
ffffff8040085500:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085504:	f9000001 	str	x1, [x0]
ffffff8040085508:	52800000 	mov	w0, #0x0                   	// #0
ffffff804008550c:	a8c77bfd 	ldp	x29, x30, [sp], #112
ffffff8040085510:	d65f03c0 	ret

ffffff8040085514 <page2ppn>:
ffffff8040085514:	d10043ff 	sub	sp, sp, #0x10
ffffff8040085518:	f90007e0 	str	x0, [sp, #8]
ffffff804008551c:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040085520:	f0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040085524:	9119e000 	add	x0, x0, #0x678
ffffff8040085528:	cb000020 	sub	x0, x1, x0
ffffff804008552c:	9343fc01 	asr	x1, x0, #3
ffffff8040085530:	b201f3e0 	mov	x0, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
ffffff8040085534:	f2955560 	movk	x0, #0xaaab
ffffff8040085538:	9b007c20 	mul	x0, x1, x0
ffffff804008553c:	910043ff 	add	sp, sp, #0x10
ffffff8040085540:	d65f03c0 	ret

ffffff8040085544 <page2pa>:
ffffff8040085544:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040085548:	910003fd 	mov	x29, sp
ffffff804008554c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040085550:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085554:	97fffff0 	bl	ffffff8040085514 <page2ppn>
ffffff8040085558:	d374cc00 	lsl	x0, x0, #12
ffffff804008555c:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040085560:	d65f03c0 	ret

ffffff8040085564 <page2kva>:
ffffff8040085564:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040085568:	910003fd 	mov	x29, sp
ffffff804008556c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040085570:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085574:	97ffffe8 	bl	ffffff8040085514 <page2ppn>
ffffff8040085578:	d374cc00 	lsl	x0, x0, #12
ffffff804008557c:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040085580:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040085584:	d65f03c0 	ret

ffffff8040085588 <pa2page>:
ffffff8040085588:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff804008558c:	910003fd 	mov	x29, sp
ffffff8040085590:	f9000fa0 	str	x0, [x29, #24]
ffffff8040085594:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085598:	d34cfc00 	lsr	x0, x0, #12
ffffff804008559c:	92406801 	and	x1, x0, #0x7ffffff
ffffff80400855a0:	12bfff40 	mov	w0, #0x5ffff               	// #393215
ffffff80400855a4:	eb00003f 	cmp	x1, x0
ffffff80400855a8:	54000129 	b.ls	ffffff80400855cc <pa2page+0x44>  // b.plast
ffffff80400855ac:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400855b0:	91036001 	add	x1, x0, #0xd8
ffffff80400855b4:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400855b8:	91040000 	add	x0, x0, #0x100
ffffff80400855bc:	f9400fa3 	ldr	x3, [x29, #24]
ffffff80400855c0:	aa0103e2 	mov	x2, x1
ffffff80400855c4:	528003e1 	mov	w1, #0x1f                  	// #31
ffffff80400855c8:	94000759 	bl	ffffff804008732c <_panic>
ffffff80400855cc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400855d0:	d34cfc00 	lsr	x0, x0, #12
ffffff80400855d4:	92406801 	and	x1, x0, #0x7ffffff
ffffff80400855d8:	aa0103e0 	mov	x0, x1
ffffff80400855dc:	d37ff800 	lsl	x0, x0, #1
ffffff80400855e0:	8b010000 	add	x0, x0, x1
ffffff80400855e4:	d37df000 	lsl	x0, x0, #3
ffffff80400855e8:	f0003ca1 	adrp	x1, ffffff804081c000 <envs+0x619c8>
ffffff80400855ec:	9119e021 	add	x1, x1, #0x678
ffffff80400855f0:	8b010000 	add	x0, x0, x1
ffffff80400855f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff80400855f8:	d65f03c0 	ret

ffffff80400855fc <page_init>:
ffffff80400855fc:	d10083ff 	sub	sp, sp, #0x20
ffffff8040085600:	f90007e0 	str	x0, [sp, #8]
ffffff8040085604:	f0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040085608:	9119c000 	add	x0, x0, #0x670
ffffff804008560c:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040085610:	f9000001 	str	x1, [x0]
ffffff8040085614:	f00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040085618:	91244000 	add	x0, x0, #0x910
ffffff804008561c:	f900001f 	str	xzr, [x0]
ffffff8040085620:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085624:	d34cfc00 	lsr	x0, x0, #12
ffffff8040085628:	f9000be0 	str	x0, [sp, #16]
ffffff804008562c:	f9000fff 	str	xzr, [sp, #24]
ffffff8040085630:	1400000e 	b	ffffff8040085668 <page_init+0x6c>
ffffff8040085634:	f0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040085638:	9119e002 	add	x2, x0, #0x678
ffffff804008563c:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085640:	aa0103e0 	mov	x0, x1
ffffff8040085644:	d37ff800 	lsl	x0, x0, #1
ffffff8040085648:	8b010000 	add	x0, x0, x1
ffffff804008564c:	d37df000 	lsl	x0, x0, #3
ffffff8040085650:	8b000040 	add	x0, x2, x0
ffffff8040085654:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040085658:	79002001 	strh	w1, [x0, #16]
ffffff804008565c:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040085660:	91000400 	add	x0, x0, #0x1
ffffff8040085664:	f9000fe0 	str	x0, [sp, #24]
ffffff8040085668:	f9400fe1 	ldr	x1, [sp, #24]
ffffff804008566c:	f9400be0 	ldr	x0, [sp, #16]
ffffff8040085670:	eb00003f 	cmp	x1, x0
ffffff8040085674:	54fffe03 	b.cc	ffffff8040085634 <page_init+0x38>  // b.lo, b.ul, b.last
ffffff8040085678:	f9400be0 	ldr	x0, [sp, #16]
ffffff804008567c:	f9000fe0 	str	x0, [sp, #24]
ffffff8040085680:	14000046 	b	ffffff8040085798 <page_init+0x19c>
ffffff8040085684:	f0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040085688:	9119e002 	add	x2, x0, #0x678
ffffff804008568c:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085690:	aa0103e0 	mov	x0, x1
ffffff8040085694:	d37ff800 	lsl	x0, x0, #1
ffffff8040085698:	8b010000 	add	x0, x0, x1
ffffff804008569c:	d37df000 	lsl	x0, x0, #3
ffffff80400856a0:	8b000040 	add	x0, x2, x0
ffffff80400856a4:	7900201f 	strh	wzr, [x0, #16]
ffffff80400856a8:	f00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400856ac:	91244000 	add	x0, x0, #0x910
ffffff80400856b0:	f9400002 	ldr	x2, [x0]
ffffff80400856b4:	f0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff80400856b8:	9119e003 	add	x3, x0, #0x678
ffffff80400856bc:	f9400fe1 	ldr	x1, [sp, #24]
ffffff80400856c0:	aa0103e0 	mov	x0, x1
ffffff80400856c4:	d37ff800 	lsl	x0, x0, #1
ffffff80400856c8:	8b010000 	add	x0, x0, x1
ffffff80400856cc:	d37df000 	lsl	x0, x0, #3
ffffff80400856d0:	8b000060 	add	x0, x3, x0
ffffff80400856d4:	f9000002 	str	x2, [x0]
ffffff80400856d8:	f0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff80400856dc:	9119e002 	add	x2, x0, #0x678
ffffff80400856e0:	f9400fe1 	ldr	x1, [sp, #24]
ffffff80400856e4:	aa0103e0 	mov	x0, x1
ffffff80400856e8:	d37ff800 	lsl	x0, x0, #1
ffffff80400856ec:	8b010000 	add	x0, x0, x1
ffffff80400856f0:	d37df000 	lsl	x0, x0, #3
ffffff80400856f4:	8b000040 	add	x0, x2, x0
ffffff80400856f8:	f9400000 	ldr	x0, [x0]
ffffff80400856fc:	f100001f 	cmp	x0, #0x0
ffffff8040085700:	540001a0 	b.eq	ffffff8040085734 <page_init+0x138>  // b.none
ffffff8040085704:	f00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040085708:	91244000 	add	x0, x0, #0x910
ffffff804008570c:	f9400002 	ldr	x2, [x0]
ffffff8040085710:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085714:	aa0103e0 	mov	x0, x1
ffffff8040085718:	d37ff800 	lsl	x0, x0, #1
ffffff804008571c:	8b010000 	add	x0, x0, x1
ffffff8040085720:	d37df000 	lsl	x0, x0, #3
ffffff8040085724:	f0003ca1 	adrp	x1, ffffff804081c000 <envs+0x619c8>
ffffff8040085728:	9119e021 	add	x1, x1, #0x678
ffffff804008572c:	8b010000 	add	x0, x0, x1
ffffff8040085730:	f9000440 	str	x0, [x2, #8]
ffffff8040085734:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085738:	aa0103e0 	mov	x0, x1
ffffff804008573c:	d37ff800 	lsl	x0, x0, #1
ffffff8040085740:	8b010000 	add	x0, x0, x1
ffffff8040085744:	d37df000 	lsl	x0, x0, #3
ffffff8040085748:	f0003ca1 	adrp	x1, ffffff804081c000 <envs+0x619c8>
ffffff804008574c:	9119e021 	add	x1, x1, #0x678
ffffff8040085750:	8b010001 	add	x1, x0, x1
ffffff8040085754:	f00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040085758:	91244000 	add	x0, x0, #0x910
ffffff804008575c:	f9000001 	str	x1, [x0]
ffffff8040085760:	f0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040085764:	9119e002 	add	x2, x0, #0x678
ffffff8040085768:	f9400fe1 	ldr	x1, [sp, #24]
ffffff804008576c:	aa0103e0 	mov	x0, x1
ffffff8040085770:	d37ff800 	lsl	x0, x0, #1
ffffff8040085774:	8b010000 	add	x0, x0, x1
ffffff8040085778:	d37df000 	lsl	x0, x0, #3
ffffff804008577c:	8b000040 	add	x0, x2, x0
ffffff8040085780:	f00002a1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040085784:	91244021 	add	x1, x1, #0x910
ffffff8040085788:	f9000401 	str	x1, [x0, #8]
ffffff804008578c:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040085790:	91000400 	add	x0, x0, #0x1
ffffff8040085794:	f9000fe0 	str	x0, [sp, #24]
ffffff8040085798:	f9400fe1 	ldr	x1, [sp, #24]
ffffff804008579c:	12bfff40 	mov	w0, #0x5ffff               	// #393215
ffffff80400857a0:	eb00003f 	cmp	x1, x0
ffffff80400857a4:	54fff709 	b.ls	ffffff8040085684 <page_init+0x88>  // b.plast
ffffff80400857a8:	d503201f 	nop
ffffff80400857ac:	910083ff 	add	sp, sp, #0x20
ffffff80400857b0:	d65f03c0 	ret

ffffff80400857b4 <bzero>:
ffffff80400857b4:	d10083ff 	sub	sp, sp, #0x20
ffffff80400857b8:	f90007e0 	str	x0, [sp, #8]
ffffff80400857bc:	f90003e1 	str	x1, [sp]
ffffff80400857c0:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400857c4:	f94003e1 	ldr	x1, [sp]
ffffff80400857c8:	8b000020 	add	x0, x1, x0
ffffff80400857cc:	f9000fe0 	str	x0, [sp, #24]
ffffff80400857d0:	14000006 	b	ffffff80400857e8 <bzero+0x34>
ffffff80400857d4:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400857d8:	f900001f 	str	xzr, [x0]
ffffff80400857dc:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400857e0:	91002000 	add	x0, x0, #0x8
ffffff80400857e4:	f90007e0 	str	x0, [sp, #8]
ffffff80400857e8:	f94007e0 	ldr	x0, [sp, #8]
ffffff80400857ec:	91001c00 	add	x0, x0, #0x7
ffffff80400857f0:	f9400fe1 	ldr	x1, [sp, #24]
ffffff80400857f4:	eb00003f 	cmp	x1, x0
ffffff80400857f8:	54fffee8 	b.hi	ffffff80400857d4 <bzero+0x20>  // b.pmore
ffffff80400857fc:	14000005 	b	ffffff8040085810 <bzero+0x5c>
ffffff8040085800:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085804:	91000401 	add	x1, x0, #0x1
ffffff8040085808:	f90007e1 	str	x1, [sp, #8]
ffffff804008580c:	3900001f 	strb	wzr, [x0]
ffffff8040085810:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040085814:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040085818:	eb00003f 	cmp	x1, x0
ffffff804008581c:	54ffff28 	b.hi	ffffff8040085800 <bzero+0x4c>  // b.pmore
ffffff8040085820:	d503201f 	nop
ffffff8040085824:	910083ff 	add	sp, sp, #0x20
ffffff8040085828:	d65f03c0 	ret

ffffff804008582c <bcopy>:
ffffff804008582c:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040085830:	f9000fe0 	str	x0, [sp, #24]
ffffff8040085834:	f9000be1 	str	x1, [sp, #16]
ffffff8040085838:	f90007e2 	str	x2, [sp, #8]
ffffff804008583c:	f9400be0 	ldr	x0, [sp, #16]
ffffff8040085840:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040085844:	8b000020 	add	x0, x1, x0
ffffff8040085848:	f90017e0 	str	x0, [sp, #40]
ffffff804008584c:	1400000b 	b	ffffff8040085878 <bcopy+0x4c>
ffffff8040085850:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040085854:	f9400001 	ldr	x1, [x0]
ffffff8040085858:	f9400be0 	ldr	x0, [sp, #16]
ffffff804008585c:	f9000001 	str	x1, [x0]
ffffff8040085860:	f9400be0 	ldr	x0, [sp, #16]
ffffff8040085864:	91002000 	add	x0, x0, #0x8
ffffff8040085868:	f9000be0 	str	x0, [sp, #16]
ffffff804008586c:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040085870:	91002000 	add	x0, x0, #0x8
ffffff8040085874:	f9000fe0 	str	x0, [sp, #24]
ffffff8040085878:	f9400be0 	ldr	x0, [sp, #16]
ffffff804008587c:	91001c00 	add	x0, x0, #0x7
ffffff8040085880:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040085884:	eb00003f 	cmp	x1, x0
ffffff8040085888:	54fffe48 	b.hi	ffffff8040085850 <bcopy+0x24>  // b.pmore
ffffff804008588c:	1400000b 	b	ffffff80400858b8 <bcopy+0x8c>
ffffff8040085890:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040085894:	39400001 	ldrb	w1, [x0]
ffffff8040085898:	f9400be0 	ldr	x0, [sp, #16]
ffffff804008589c:	39000001 	strb	w1, [x0]
ffffff80400858a0:	f9400be0 	ldr	x0, [sp, #16]
ffffff80400858a4:	91000400 	add	x0, x0, #0x1
ffffff80400858a8:	f9000be0 	str	x0, [sp, #16]
ffffff80400858ac:	f9400fe0 	ldr	x0, [sp, #24]
ffffff80400858b0:	91000400 	add	x0, x0, #0x1
ffffff80400858b4:	f9000fe0 	str	x0, [sp, #24]
ffffff80400858b8:	f9400be0 	ldr	x0, [sp, #16]
ffffff80400858bc:	f94017e1 	ldr	x1, [sp, #40]
ffffff80400858c0:	eb00003f 	cmp	x1, x0
ffffff80400858c4:	54fffe68 	b.hi	ffffff8040085890 <bcopy+0x64>  // b.pmore
ffffff80400858c8:	d503201f 	nop
ffffff80400858cc:	9100c3ff 	add	sp, sp, #0x30
ffffff80400858d0:	d65f03c0 	ret

ffffff80400858d4 <page_alloc>:
ffffff80400858d4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff80400858d8:	910003fd 	mov	x29, sp
ffffff80400858dc:	f9000fa0 	str	x0, [x29, #24]
ffffff80400858e0:	f00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400858e4:	91244000 	add	x0, x0, #0x910
ffffff80400858e8:	f9400000 	ldr	x0, [x0]
ffffff80400858ec:	f90017a0 	str	x0, [x29, #40]
ffffff80400858f0:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400858f4:	f100001f 	cmp	x0, #0x0
ffffff80400858f8:	54000101 	b.ne	ffffff8040085918 <page_alloc+0x44>  // b.any
ffffff80400858fc:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085900:	91048001 	add	x1, x0, #0x120
ffffff8040085904:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085908:	9104e000 	add	x0, x0, #0x138
ffffff804008590c:	aa0103e2 	mov	x2, x1
ffffff8040085910:	528006a1 	mov	w1, #0x35                  	// #53
ffffff8040085914:	94000686 	bl	ffffff804008732c <_panic>
ffffff8040085918:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008591c:	f9400000 	ldr	x0, [x0]
ffffff8040085920:	f100001f 	cmp	x0, #0x0
ffffff8040085924:	540000c0 	b.eq	ffffff804008593c <page_alloc+0x68>  // b.none
ffffff8040085928:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008592c:	f9400000 	ldr	x0, [x0]
ffffff8040085930:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085934:	f9400421 	ldr	x1, [x1, #8]
ffffff8040085938:	f9000401 	str	x1, [x0, #8]
ffffff804008593c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085940:	f9400400 	ldr	x0, [x0, #8]
ffffff8040085944:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085948:	f9400021 	ldr	x1, [x1]
ffffff804008594c:	f9000001 	str	x1, [x0]
ffffff8040085950:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085954:	97ffff04 	bl	ffffff8040085564 <page2kva>
ffffff8040085958:	d2820001 	mov	x1, #0x1000                	// #4096
ffffff804008595c:	97ffff96 	bl	ffffff80400857b4 <bzero>
ffffff8040085960:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085964:	7900201f 	strh	wzr, [x0, #16]
ffffff8040085968:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008596c:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085970:	f9000001 	str	x1, [x0]
ffffff8040085974:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085978:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff804008597c:	d65f03c0 	ret

ffffff8040085980 <page_free>:
ffffff8040085980:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040085984:	910003fd 	mov	x29, sp
ffffff8040085988:	f9000fa0 	str	x0, [x29, #24]
ffffff804008598c:	b90017a1 	str	w1, [x29, #20]
ffffff8040085990:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085994:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085998:	7100001f 	cmp	w0, #0x0
ffffff804008599c:	54000701 	b.ne	ffffff8040085a7c <page_free+0xfc>  // b.any
ffffff80400859a0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400859a4:	79402000 	ldrh	w0, [x0, #16]
ffffff80400859a8:	7100001f 	cmp	w0, #0x0
ffffff80400859ac:	54000160 	b.eq	ffffff80400859d8 <page_free+0x58>  // b.none
ffffff80400859b0:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400859b4:	91056002 	add	x2, x0, #0x158
ffffff80400859b8:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400859bc:	9105a001 	add	x1, x0, #0x168
ffffff80400859c0:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400859c4:	9104e000 	add	x0, x0, #0x138
ffffff80400859c8:	aa0203e3 	mov	x3, x2
ffffff80400859cc:	aa0103e2 	mov	x2, x1
ffffff80400859d0:	52800861 	mov	w1, #0x43                  	// #67
ffffff80400859d4:	94000656 	bl	ffffff804008732c <_panic>
ffffff80400859d8:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400859dc:	b94017a0 	ldr	w0, [x29, #20]
ffffff80400859e0:	97fff8ba 	bl	ffffff8040083cc8 <cap_unmap_free_page>
ffffff80400859e4:	b9002fa0 	str	w0, [x29, #44]
ffffff80400859e8:	b9402fa0 	ldr	w0, [x29, #44]
ffffff80400859ec:	7100001f 	cmp	w0, #0x0
ffffff80400859f0:	5400016a 	b.ge	ffffff8040085a1c <page_free+0x9c>  // b.tcont
ffffff80400859f4:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400859f8:	91060002 	add	x2, x0, #0x180
ffffff80400859fc:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085a00:	9105a001 	add	x1, x0, #0x168
ffffff8040085a04:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085a08:	9104e000 	add	x0, x0, #0x138
ffffff8040085a0c:	aa0203e3 	mov	x3, x2
ffffff8040085a10:	aa0103e2 	mov	x2, x1
ffffff8040085a14:	528008e1 	mov	w1, #0x47                  	// #71
ffffff8040085a18:	94000645 	bl	ffffff804008732c <_panic>
ffffff8040085a1c:	f00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040085a20:	91244000 	add	x0, x0, #0x910
ffffff8040085a24:	f9400001 	ldr	x1, [x0]
ffffff8040085a28:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085a2c:	f9000001 	str	x1, [x0]
ffffff8040085a30:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085a34:	f9400000 	ldr	x0, [x0]
ffffff8040085a38:	f100001f 	cmp	x0, #0x0
ffffff8040085a3c:	540000c0 	b.eq	ffffff8040085a54 <page_free+0xd4>  // b.none
ffffff8040085a40:	f00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040085a44:	91244000 	add	x0, x0, #0x910
ffffff8040085a48:	f9400000 	ldr	x0, [x0]
ffffff8040085a4c:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040085a50:	f9000401 	str	x1, [x0, #8]
ffffff8040085a54:	f00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040085a58:	91244000 	add	x0, x0, #0x910
ffffff8040085a5c:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040085a60:	f9000001 	str	x1, [x0]
ffffff8040085a64:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085a68:	f00002a1 	adrp	x1, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040085a6c:	91244021 	add	x1, x1, #0x910
ffffff8040085a70:	f9000401 	str	x1, [x0, #8]
ffffff8040085a74:	d503201f 	nop
ffffff8040085a78:	14000002 	b	ffffff8040085a80 <page_free+0x100>
ffffff8040085a7c:	d503201f 	nop
ffffff8040085a80:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040085a84:	d65f03c0 	ret

ffffff8040085a88 <pgdir_walk>:
ffffff8040085a88:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff8040085a8c:	910003fd 	mov	x29, sp
ffffff8040085a90:	f90017a0 	str	x0, [x29, #40]
ffffff8040085a94:	f90013a1 	str	x1, [x29, #32]
ffffff8040085a98:	b9001fa2 	str	w2, [x29, #28]
ffffff8040085a9c:	f9000ba3 	str	x3, [x29, #16]
ffffff8040085aa0:	b9001ba4 	str	w4, [x29, #24]
ffffff8040085aa4:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085aa8:	d35efc00 	lsr	x0, x0, #30
ffffff8040085aac:	92402000 	and	x0, x0, #0x1ff
ffffff8040085ab0:	d37df000 	lsl	x0, x0, #3
ffffff8040085ab4:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085ab8:	8b000020 	add	x0, x1, x0
ffffff8040085abc:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040085ac0:	f90027a0 	str	x0, [x29, #72]
ffffff8040085ac4:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085ac8:	f9400000 	ldr	x0, [x0]
ffffff8040085acc:	92400400 	and	x0, x0, #0x3
ffffff8040085ad0:	f100001f 	cmp	x0, #0x0
ffffff8040085ad4:	54000401 	b.ne	ffffff8040085b54 <pgdir_walk+0xcc>  // b.any
ffffff8040085ad8:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040085adc:	7100001f 	cmp	w0, #0x0
ffffff8040085ae0:	540000a1 	b.ne	ffffff8040085af4 <pgdir_walk+0x6c>  // b.any
ffffff8040085ae4:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040085ae8:	f900001f 	str	xzr, [x0]
ffffff8040085aec:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085af0:	14000059 	b	ffffff8040085c54 <pgdir_walk+0x1cc>
ffffff8040085af4:	9100c3a0 	add	x0, x29, #0x30
ffffff8040085af8:	97ffff77 	bl	ffffff80400858d4 <page_alloc>
ffffff8040085afc:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085b00:	97fffe91 	bl	ffffff8040085544 <page2pa>
ffffff8040085b04:	b2400401 	orr	x1, x0, #0x3
ffffff8040085b08:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085b0c:	f9000001 	str	x1, [x0]
ffffff8040085b10:	f9401ba5 	ldr	x5, [x29, #48]
ffffff8040085b14:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085b18:	d35efc00 	lsr	x0, x0, #30
ffffff8040085b1c:	d374cc00 	lsl	x0, x0, #12
ffffff8040085b20:	92742001 	and	x1, x0, #0x1ff000
ffffff8040085b24:	d2a80000 	mov	x0, #0x40000000            	// #1073741824
ffffff8040085b28:	f2c00e00 	movk	x0, #0x70, lsl #32
ffffff8040085b2c:	8b000020 	add	x0, x1, x0
ffffff8040085b30:	b9401ba4 	ldr	w4, [x29, #24]
ffffff8040085b34:	d2801803 	mov	x3, #0xc0                  	// #192
ffffff8040085b38:	aa0003e2 	mov	x2, x0
ffffff8040085b3c:	aa0503e1 	mov	x1, x5
ffffff8040085b40:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085b44:	94000046 	bl	ffffff8040085c5c <page_insert>
ffffff8040085b48:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085b4c:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040085b50:	79002001 	strh	w1, [x0, #16]
ffffff8040085b54:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085b58:	d355fc00 	lsr	x0, x0, #21
ffffff8040085b5c:	92402000 	and	x0, x0, #0x1ff
ffffff8040085b60:	d37df001 	lsl	x1, x0, #3
ffffff8040085b64:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085b68:	f9400000 	ldr	x0, [x0]
ffffff8040085b6c:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040085b70:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040085b74:	8b000020 	add	x0, x1, x0
ffffff8040085b78:	f90023a0 	str	x0, [x29, #64]
ffffff8040085b7c:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040085b80:	f9400000 	ldr	x0, [x0]
ffffff8040085b84:	92400400 	and	x0, x0, #0x3
ffffff8040085b88:	f100001f 	cmp	x0, #0x0
ffffff8040085b8c:	54000481 	b.ne	ffffff8040085c1c <pgdir_walk+0x194>  // b.any
ffffff8040085b90:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040085b94:	7100001f 	cmp	w0, #0x0
ffffff8040085b98:	540000a1 	b.ne	ffffff8040085bac <pgdir_walk+0x124>  // b.any
ffffff8040085b9c:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040085ba0:	f900001f 	str	xzr, [x0]
ffffff8040085ba4:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085ba8:	1400002b 	b	ffffff8040085c54 <pgdir_walk+0x1cc>
ffffff8040085bac:	9100c3a0 	add	x0, x29, #0x30
ffffff8040085bb0:	97ffff49 	bl	ffffff80400858d4 <page_alloc>
ffffff8040085bb4:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085bb8:	97fffe63 	bl	ffffff8040085544 <page2pa>
ffffff8040085bbc:	b2400401 	orr	x1, x0, #0x3
ffffff8040085bc0:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040085bc4:	f9000001 	str	x1, [x0]
ffffff8040085bc8:	f9401ba5 	ldr	x5, [x29, #48]
ffffff8040085bcc:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085bd0:	d35efc00 	lsr	x0, x0, #30
ffffff8040085bd4:	d36ba800 	lsl	x0, x0, #21
ffffff8040085bd8:	926b2001 	and	x1, x0, #0x3fe00000
ffffff8040085bdc:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085be0:	d355fc00 	lsr	x0, x0, #21
ffffff8040085be4:	d374cc00 	lsl	x0, x0, #12
ffffff8040085be8:	92742000 	and	x0, x0, #0x1ff000
ffffff8040085bec:	aa000021 	orr	x1, x1, x0
ffffff8040085bf0:	d2c00e00 	mov	x0, #0x7000000000          	// #481036337152
ffffff8040085bf4:	8b000020 	add	x0, x1, x0
ffffff8040085bf8:	b9401ba4 	ldr	w4, [x29, #24]
ffffff8040085bfc:	d2801803 	mov	x3, #0xc0                  	// #192
ffffff8040085c00:	aa0003e2 	mov	x2, x0
ffffff8040085c04:	aa0503e1 	mov	x1, x5
ffffff8040085c08:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085c0c:	94000014 	bl	ffffff8040085c5c <page_insert>
ffffff8040085c10:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085c14:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040085c18:	79002001 	strh	w1, [x0, #16]
ffffff8040085c1c:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040085c20:	d34cfc00 	lsr	x0, x0, #12
ffffff8040085c24:	92402000 	and	x0, x0, #0x1ff
ffffff8040085c28:	d37df001 	lsl	x1, x0, #3
ffffff8040085c2c:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040085c30:	f9400000 	ldr	x0, [x0]
ffffff8040085c34:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040085c38:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040085c3c:	8b000020 	add	x0, x1, x0
ffffff8040085c40:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085c44:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040085c48:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040085c4c:	f9000001 	str	x1, [x0]
ffffff8040085c50:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085c54:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff8040085c58:	d65f03c0 	ret

ffffff8040085c5c <page_insert>:
ffffff8040085c5c:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
ffffff8040085c60:	910003fd 	mov	x29, sp
ffffff8040085c64:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085c68:	f9001ba1 	str	x1, [x29, #48]
ffffff8040085c6c:	f90017a2 	str	x2, [x29, #40]
ffffff8040085c70:	f90013a3 	str	x3, [x29, #32]
ffffff8040085c74:	b9001fa4 	str	w4, [x29, #28]
ffffff8040085c78:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040085c7c:	d280e060 	mov	x0, #0x703                 	// #1795
ffffff8040085c80:	aa000020 	orr	x0, x1, x0
ffffff8040085c84:	f9002fa0 	str	x0, [x29, #88]
ffffff8040085c88:	f9401ba1 	ldr	x1, [x29, #48]
ffffff8040085c8c:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040085c90:	97fff7d8 	bl	ffffff8040083bf0 <cap_map_free_page>
ffffff8040085c94:	b90057a0 	str	w0, [x29, #84]
ffffff8040085c98:	b94057a0 	ldr	w0, [x29, #84]
ffffff8040085c9c:	7100001f 	cmp	w0, #0x0
ffffff8040085ca0:	54000160 	b.eq	ffffff8040085ccc <page_insert+0x70>  // b.none
ffffff8040085ca4:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085ca8:	91062002 	add	x2, x0, #0x188
ffffff8040085cac:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085cb0:	9105a001 	add	x1, x0, #0x168
ffffff8040085cb4:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085cb8:	9104e000 	add	x0, x0, #0x138
ffffff8040085cbc:	aa0203e3 	mov	x3, x2
ffffff8040085cc0:	aa0103e2 	mov	x2, x1
ffffff8040085cc4:	52800f61 	mov	w1, #0x7b                  	// #123
ffffff8040085cc8:	94000599 	bl	ffffff804008732c <_panic>
ffffff8040085ccc:	910123a0 	add	x0, x29, #0x48
ffffff8040085cd0:	b9401fa4 	ldr	w4, [x29, #28]
ffffff8040085cd4:	aa0003e3 	mov	x3, x0
ffffff8040085cd8:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040085cdc:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085ce0:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085ce4:	97ffff69 	bl	ffffff8040085a88 <pgdir_walk>
ffffff8040085ce8:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085cec:	f9400000 	ldr	x0, [x0]
ffffff8040085cf0:	92400400 	and	x0, x0, #0x3
ffffff8040085cf4:	f100001f 	cmp	x0, #0x0
ffffff8040085cf8:	540002e0 	b.eq	ffffff8040085d54 <page_insert+0xf8>  // b.none
ffffff8040085cfc:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085d00:	f9400000 	ldr	x0, [x0]
ffffff8040085d04:	97fffe21 	bl	ffffff8040085588 <pa2page>
ffffff8040085d08:	aa0003e1 	mov	x1, x0
ffffff8040085d0c:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085d10:	eb01001f 	cmp	x0, x1
ffffff8040085d14:	540000c0 	b.eq	ffffff8040085d2c <page_insert+0xd0>  // b.none
ffffff8040085d18:	b9401fa2 	ldr	w2, [x29, #28]
ffffff8040085d1c:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085d20:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085d24:	9400006a 	bl	ffffff8040085ecc <page_remove>
ffffff8040085d28:	1400000b 	b	ffffff8040085d54 <page_insert+0xf8>
ffffff8040085d2c:	97fffb8e 	bl	ffffff8040084b64 <tlb_invalidate>
ffffff8040085d30:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085d34:	97fffe04 	bl	ffffff8040085544 <page2pa>
ffffff8040085d38:	aa0003e2 	mov	x2, x0
ffffff8040085d3c:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085d40:	f9402fa1 	ldr	x1, [x29, #88]
ffffff8040085d44:	aa010041 	orr	x1, x2, x1
ffffff8040085d48:	f9000001 	str	x1, [x0]
ffffff8040085d4c:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085d50:	14000022 	b	ffffff8040085dd8 <page_insert+0x17c>
ffffff8040085d54:	97fffb84 	bl	ffffff8040084b64 <tlb_invalidate>
ffffff8040085d58:	910123a0 	add	x0, x29, #0x48
ffffff8040085d5c:	b9401fa4 	ldr	w4, [x29, #28]
ffffff8040085d60:	aa0003e3 	mov	x3, x0
ffffff8040085d64:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040085d68:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085d6c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085d70:	97ffff46 	bl	ffffff8040085a88 <pgdir_walk>
ffffff8040085d74:	b90057a0 	str	w0, [x29, #84]
ffffff8040085d78:	b94057a0 	ldr	w0, [x29, #84]
ffffff8040085d7c:	7100001f 	cmp	w0, #0x0
ffffff8040085d80:	54000100 	b.eq	ffffff8040085da0 <page_insert+0x144>  // b.none
ffffff8040085d84:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085d88:	91064001 	add	x1, x0, #0x190
ffffff8040085d8c:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085d90:	9104e000 	add	x0, x0, #0x138
ffffff8040085d94:	aa0103e2 	mov	x2, x1
ffffff8040085d98:	52801161 	mov	w1, #0x8b                  	// #139
ffffff8040085d9c:	94000564 	bl	ffffff804008732c <_panic>
ffffff8040085da0:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085da4:	97fffde8 	bl	ffffff8040085544 <page2pa>
ffffff8040085da8:	aa0003e2 	mov	x2, x0
ffffff8040085dac:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040085db0:	f9402fa1 	ldr	x1, [x29, #88]
ffffff8040085db4:	aa010041 	orr	x1, x2, x1
ffffff8040085db8:	f9000001 	str	x1, [x0]
ffffff8040085dbc:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085dc0:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085dc4:	11000400 	add	w0, w0, #0x1
ffffff8040085dc8:	12003c01 	and	w1, w0, #0xffff
ffffff8040085dcc:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085dd0:	79002001 	strh	w1, [x0, #16]
ffffff8040085dd4:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040085dd8:	a8c67bfd 	ldp	x29, x30, [sp], #96
ffffff8040085ddc:	d65f03c0 	ret

ffffff8040085de0 <page_lookup>:
ffffff8040085de0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040085de4:	910003fd 	mov	x29, sp
ffffff8040085de8:	f90017a0 	str	x0, [x29, #40]
ffffff8040085dec:	f90013a1 	str	x1, [x29, #32]
ffffff8040085df0:	f9000fa2 	str	x2, [x29, #24]
ffffff8040085df4:	b90017a3 	str	w3, [x29, #20]
ffffff8040085df8:	9100c3a0 	add	x0, x29, #0x30
ffffff8040085dfc:	b94017a4 	ldr	w4, [x29, #20]
ffffff8040085e00:	aa0003e3 	mov	x3, x0
ffffff8040085e04:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040085e08:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040085e0c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085e10:	97ffff1e 	bl	ffffff8040085a88 <pgdir_walk>
ffffff8040085e14:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085e18:	f100001f 	cmp	x0, #0x0
ffffff8040085e1c:	540000c0 	b.eq	ffffff8040085e34 <page_lookup+0x54>  // b.none
ffffff8040085e20:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085e24:	f9400000 	ldr	x0, [x0]
ffffff8040085e28:	92400400 	and	x0, x0, #0x3
ffffff8040085e2c:	f100001f 	cmp	x0, #0x0
ffffff8040085e30:	54000061 	b.ne	ffffff8040085e3c <page_lookup+0x5c>  // b.any
ffffff8040085e34:	d2800000 	mov	x0, #0x0                   	// #0
ffffff8040085e38:	1400000d 	b	ffffff8040085e6c <page_lookup+0x8c>
ffffff8040085e3c:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085e40:	f9400000 	ldr	x0, [x0]
ffffff8040085e44:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040085e48:	97fffdd0 	bl	ffffff8040085588 <pa2page>
ffffff8040085e4c:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085e50:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085e54:	f100001f 	cmp	x0, #0x0
ffffff8040085e58:	54000080 	b.eq	ffffff8040085e68 <page_lookup+0x88>  // b.none
ffffff8040085e5c:	f9401ba1 	ldr	x1, [x29, #48]
ffffff8040085e60:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085e64:	f9000001 	str	x1, [x0]
ffffff8040085e68:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085e6c:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040085e70:	d65f03c0 	ret

ffffff8040085e74 <page_decref>:
ffffff8040085e74:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040085e78:	910003fd 	mov	x29, sp
ffffff8040085e7c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040085e80:	b90017a1 	str	w1, [x29, #20]
ffffff8040085e84:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085e88:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085e8c:	51000400 	sub	w0, w0, #0x1
ffffff8040085e90:	12003c01 	and	w1, w0, #0xffff
ffffff8040085e94:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085e98:	79002001 	strh	w1, [x0, #16]
ffffff8040085e9c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085ea0:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085ea4:	7100001f 	cmp	w0, #0x0
ffffff8040085ea8:	540000c1 	b.ne	ffffff8040085ec0 <page_decref+0x4c>  // b.any
ffffff8040085eac:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040085eb0:	12002400 	and	w0, w0, #0x3ff
ffffff8040085eb4:	2a0003e1 	mov	w1, w0
ffffff8040085eb8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040085ebc:	97fffeb1 	bl	ffffff8040085980 <page_free>
ffffff8040085ec0:	d503201f 	nop
ffffff8040085ec4:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040085ec8:	d65f03c0 	ret

ffffff8040085ecc <page_remove>:
ffffff8040085ecc:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040085ed0:	910003fd 	mov	x29, sp
ffffff8040085ed4:	f90017a0 	str	x0, [x29, #40]
ffffff8040085ed8:	f90013a1 	str	x1, [x29, #32]
ffffff8040085edc:	b9001fa2 	str	w2, [x29, #28]
ffffff8040085ee0:	9100c3a0 	add	x0, x29, #0x30
ffffff8040085ee4:	b9401fa3 	ldr	w3, [x29, #28]
ffffff8040085ee8:	aa0003e2 	mov	x2, x0
ffffff8040085eec:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040085ef0:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085ef4:	97ffffbb 	bl	ffffff8040085de0 <page_lookup>
ffffff8040085ef8:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085efc:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085f00:	f100001f 	cmp	x0, #0x0
ffffff8040085f04:	54000280 	b.eq	ffffff8040085f54 <page_remove+0x88>  // b.none
ffffff8040085f08:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085f0c:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085f10:	51000400 	sub	w0, w0, #0x1
ffffff8040085f14:	12003c01 	and	w1, w0, #0xffff
ffffff8040085f18:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085f1c:	79002001 	strh	w1, [x0, #16]
ffffff8040085f20:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085f24:	79402000 	ldrh	w0, [x0, #16]
ffffff8040085f28:	7100001f 	cmp	w0, #0x0
ffffff8040085f2c:	540000c1 	b.ne	ffffff8040085f44 <page_remove+0x78>  // b.any
ffffff8040085f30:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040085f34:	12002400 	and	w0, w0, #0x3ff
ffffff8040085f38:	2a0003e1 	mov	w1, w0
ffffff8040085f3c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040085f40:	97fffe90 	bl	ffffff8040085980 <page_free>
ffffff8040085f44:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085f48:	f900001f 	str	xzr, [x0]
ffffff8040085f4c:	97fffb06 	bl	ffffff8040084b64 <tlb_invalidate>
ffffff8040085f50:	14000002 	b	ffffff8040085f58 <page_remove+0x8c>
ffffff8040085f54:	d503201f 	nop
ffffff8040085f58:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040085f5c:	d65f03c0 	ret

ffffff8040085f60 <lp_Print>:
ffffff8040085f60:	d111c3ff 	sub	sp, sp, #0x470
ffffff8040085f64:	a9007bfd 	stp	x29, x30, [sp]
ffffff8040085f68:	910003fd 	mov	x29, sp
ffffff8040085f6c:	f9000bf3 	str	x19, [sp, #16]
ffffff8040085f70:	f9001fa0 	str	x0, [x29, #56]
ffffff8040085f74:	f9001ba1 	str	x1, [x29, #48]
ffffff8040085f78:	f90017a2 	str	x2, [x29, #40]
ffffff8040085f7c:	aa0303f3 	mov	x19, x3
ffffff8040085f80:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f84:	f90227a0 	str	x0, [x29, #1096]
ffffff8040085f88:	14000004 	b	ffffff8040085f98 <lp_Print+0x38>
ffffff8040085f8c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f90:	91000400 	add	x0, x0, #0x1
ffffff8040085f94:	f90017a0 	str	x0, [x29, #40]
ffffff8040085f98:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085f9c:	39400000 	ldrb	w0, [x0]
ffffff8040085fa0:	7100001f 	cmp	w0, #0x0
ffffff8040085fa4:	540000a0 	b.eq	ffffff8040085fb8 <lp_Print+0x58>  // b.none
ffffff8040085fa8:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040085fac:	39400000 	ldrb	w0, [x0]
ffffff8040085fb0:	7100941f 	cmp	w0, #0x25
ffffff8040085fb4:	54fffec1 	b.ne	ffffff8040085f8c <lp_Print+0x2c>  // b.any
ffffff8040085fb8:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085fbc:	f94227a0 	ldr	x0, [x29, #1096]
ffffff8040085fc0:	cb000020 	sub	x0, x1, x0
ffffff8040085fc4:	f100001f 	cmp	x0, #0x0
ffffff8040085fc8:	540000cb 	b.lt	ffffff8040085fe0 <lp_Print+0x80>  // b.tstop
ffffff8040085fcc:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040085fd0:	f94227a0 	ldr	x0, [x29, #1096]
ffffff8040085fd4:	cb000020 	sub	x0, x1, x0
ffffff8040085fd8:	f10fa01f 	cmp	x0, #0x3e8
ffffff8040085fdc:	5400012d 	b.le	ffffff8040086000 <lp_Print+0xa0>
ffffff8040085fe0:	90000020 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040085fe4:	9106c000 	add	x0, x0, #0x1b0
ffffff8040085fe8:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040085fec:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040085ff0:	aa0003e1 	mov	x1, x0
ffffff8040085ff4:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040085ff8:	d63f0060 	blr	x3
ffffff8040085ffc:	14000000 	b	ffffff8040085ffc <lp_Print+0x9c>
ffffff8040086000:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040086004:	f94227a0 	ldr	x0, [x29, #1096]
ffffff8040086008:	cb000020 	sub	x0, x1, x0
ffffff804008600c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086010:	2a0003e2 	mov	w2, w0
ffffff8040086014:	f94227a1 	ldr	x1, [x29, #1096]
ffffff8040086018:	f9401ba0 	ldr	x0, [x29, #48]
ffffff804008601c:	d63f0060 	blr	x3
ffffff8040086020:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086024:	39400000 	ldrb	w0, [x0]
ffffff8040086028:	7100001f 	cmp	w0, #0x0
ffffff804008602c:	54006420 	b.eq	ffffff8040086cb0 <lp_Print+0xd50>  // b.none
ffffff8040086030:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086034:	91000400 	add	x0, x0, #0x1
ffffff8040086038:	f90017a0 	str	x0, [x29, #40]
ffffff804008603c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086040:	39400000 	ldrb	w0, [x0]
ffffff8040086044:	7101b01f 	cmp	w0, #0x6c
ffffff8040086048:	540000e1 	b.ne	ffffff8040086064 <lp_Print+0x104>  // b.any
ffffff804008604c:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040086050:	b90467a0 	str	w0, [x29, #1124]
ffffff8040086054:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086058:	91000400 	add	x0, x0, #0x1
ffffff804008605c:	f90017a0 	str	x0, [x29, #40]
ffffff8040086060:	14000002 	b	ffffff8040086068 <lp_Print+0x108>
ffffff8040086064:	b90467bf 	str	wzr, [x29, #1124]
ffffff8040086068:	b9045fbf 	str	wzr, [x29, #1116]
ffffff804008606c:	12800000 	mov	w0, #0xffffffff            	// #-1
ffffff8040086070:	b9045ba0 	str	w0, [x29, #1112]
ffffff8040086074:	b90457bf 	str	wzr, [x29, #1108]
ffffff8040086078:	52800400 	mov	w0, #0x20                  	// #32
ffffff804008607c:	39114fa0 	strb	w0, [x29, #1107]
ffffff8040086080:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086084:	39400000 	ldrb	w0, [x0]
ffffff8040086088:	7100b41f 	cmp	w0, #0x2d
ffffff804008608c:	540000c1 	b.ne	ffffff80400860a4 <lp_Print+0x144>  // b.any
ffffff8040086090:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040086094:	b90457a0 	str	w0, [x29, #1108]
ffffff8040086098:	f94017a0 	ldr	x0, [x29, #40]
ffffff804008609c:	91000400 	add	x0, x0, #0x1
ffffff80400860a0:	f90017a0 	str	x0, [x29, #40]
ffffff80400860a4:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400860a8:	39400000 	ldrb	w0, [x0]
ffffff80400860ac:	7100c01f 	cmp	w0, #0x30
ffffff80400860b0:	540000c1 	b.ne	ffffff80400860c8 <lp_Print+0x168>  // b.any
ffffff80400860b4:	52800600 	mov	w0, #0x30                  	// #48
ffffff80400860b8:	39114fa0 	strb	w0, [x29, #1107]
ffffff80400860bc:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400860c0:	91000400 	add	x0, x0, #0x1
ffffff80400860c4:	f90017a0 	str	x0, [x29, #40]
ffffff80400860c8:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400860cc:	39400000 	ldrb	w0, [x0]
ffffff80400860d0:	7100bc1f 	cmp	w0, #0x2f
ffffff80400860d4:	54000369 	b.ls	ffffff8040086140 <lp_Print+0x1e0>  // b.plast
ffffff80400860d8:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400860dc:	39400000 	ldrb	w0, [x0]
ffffff80400860e0:	7100e41f 	cmp	w0, #0x39
ffffff80400860e4:	540002e8 	b.hi	ffffff8040086140 <lp_Print+0x1e0>  // b.pmore
ffffff80400860e8:	1400000e 	b	ffffff8040086120 <lp_Print+0x1c0>
ffffff80400860ec:	b9445fa1 	ldr	w1, [x29, #1116]
ffffff80400860f0:	2a0103e0 	mov	w0, w1
ffffff80400860f4:	531e7400 	lsl	w0, w0, #2
ffffff80400860f8:	0b010000 	add	w0, w0, w1
ffffff80400860fc:	531f7800 	lsl	w0, w0, #1
ffffff8040086100:	2a0003e2 	mov	w2, w0
ffffff8040086104:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086108:	91000401 	add	x1, x0, #0x1
ffffff804008610c:	f90017a1 	str	x1, [x29, #40]
ffffff8040086110:	39400000 	ldrb	w0, [x0]
ffffff8040086114:	5100c000 	sub	w0, w0, #0x30
ffffff8040086118:	0b000040 	add	w0, w2, w0
ffffff804008611c:	b9045fa0 	str	w0, [x29, #1116]
ffffff8040086120:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086124:	39400000 	ldrb	w0, [x0]
ffffff8040086128:	7100bc1f 	cmp	w0, #0x2f
ffffff804008612c:	540000a9 	b.ls	ffffff8040086140 <lp_Print+0x1e0>  // b.plast
ffffff8040086130:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086134:	39400000 	ldrb	w0, [x0]
ffffff8040086138:	7100e41f 	cmp	w0, #0x39
ffffff804008613c:	54fffd89 	b.ls	ffffff80400860ec <lp_Print+0x18c>  // b.plast
ffffff8040086140:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086144:	39400000 	ldrb	w0, [x0]
ffffff8040086148:	7100b81f 	cmp	w0, #0x2e
ffffff804008614c:	54000461 	b.ne	ffffff80400861d8 <lp_Print+0x278>  // b.any
ffffff8040086150:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086154:	91000400 	add	x0, x0, #0x1
ffffff8040086158:	f90017a0 	str	x0, [x29, #40]
ffffff804008615c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086160:	39400000 	ldrb	w0, [x0]
ffffff8040086164:	7100bc1f 	cmp	w0, #0x2f
ffffff8040086168:	54000389 	b.ls	ffffff80400861d8 <lp_Print+0x278>  // b.plast
ffffff804008616c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086170:	39400000 	ldrb	w0, [x0]
ffffff8040086174:	7100e41f 	cmp	w0, #0x39
ffffff8040086178:	54000308 	b.hi	ffffff80400861d8 <lp_Print+0x278>  // b.pmore
ffffff804008617c:	b9045bbf 	str	wzr, [x29, #1112]
ffffff8040086180:	1400000e 	b	ffffff80400861b8 <lp_Print+0x258>
ffffff8040086184:	b9445ba1 	ldr	w1, [x29, #1112]
ffffff8040086188:	2a0103e0 	mov	w0, w1
ffffff804008618c:	531e7400 	lsl	w0, w0, #2
ffffff8040086190:	0b010000 	add	w0, w0, w1
ffffff8040086194:	531f7800 	lsl	w0, w0, #1
ffffff8040086198:	2a0003e2 	mov	w2, w0
ffffff804008619c:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400861a0:	91000401 	add	x1, x0, #0x1
ffffff80400861a4:	f90017a1 	str	x1, [x29, #40]
ffffff80400861a8:	39400000 	ldrb	w0, [x0]
ffffff80400861ac:	5100c000 	sub	w0, w0, #0x30
ffffff80400861b0:	0b000040 	add	w0, w2, w0
ffffff80400861b4:	b9045ba0 	str	w0, [x29, #1112]
ffffff80400861b8:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400861bc:	39400000 	ldrb	w0, [x0]
ffffff80400861c0:	7100bc1f 	cmp	w0, #0x2f
ffffff80400861c4:	540000a9 	b.ls	ffffff80400861d8 <lp_Print+0x278>  // b.plast
ffffff80400861c8:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400861cc:	39400000 	ldrb	w0, [x0]
ffffff80400861d0:	7100e41f 	cmp	w0, #0x39
ffffff80400861d4:	54fffd89 	b.ls	ffffff8040086184 <lp_Print+0x224>  // b.plast
ffffff80400861d8:	b90463bf 	str	wzr, [x29, #1120]
ffffff80400861dc:	f94017a0 	ldr	x0, [x29, #40]
ffffff80400861e0:	39400000 	ldrb	w0, [x0]
ffffff80400861e4:	71018c1f 	cmp	w0, #0x63
ffffff80400861e8:	54004760 	b.eq	ffffff8040086ad4 <lp_Print+0xb74>  // b.none
ffffff80400861ec:	71018c1f 	cmp	w0, #0x63
ffffff80400861f0:	5400022c 	b.gt	ffffff8040086234 <lp_Print+0x2d4>
ffffff80400861f4:	71013c1f 	cmp	w0, #0x4f
ffffff80400861f8:	54001ae0 	b.eq	ffffff8040086554 <lp_Print+0x5f4>  // b.none
ffffff80400861fc:	71013c1f 	cmp	w0, #0x4f
ffffff8040086200:	540000cc 	b.gt	ffffff8040086218 <lp_Print+0x2b8>
ffffff8040086204:	7100001f 	cmp	w0, #0x0
ffffff8040086208:	540053a0 	b.eq	ffffff8040086c7c <lp_Print+0xd1c>  // b.none
ffffff804008620c:	7101101f 	cmp	w0, #0x44
ffffff8040086210:	54000e20 	b.eq	ffffff80400863d4 <lp_Print+0x474>  // b.none
ffffff8040086214:	1400029e 	b	ffffff8040086c8c <lp_Print+0xd2c>
ffffff8040086218:	7101601f 	cmp	w0, #0x58
ffffff804008621c:	54003ac0 	b.eq	ffffff8040086974 <lp_Print+0xa14>  // b.none
ffffff8040086220:	7101881f 	cmp	w0, #0x62
ffffff8040086224:	54000280 	b.eq	ffffff8040086274 <lp_Print+0x314>  // b.none
ffffff8040086228:	7101541f 	cmp	w0, #0x55
ffffff804008622c:	54002440 	b.eq	ffffff80400866b4 <lp_Print+0x754>  // b.none
ffffff8040086230:	14000297 	b	ffffff8040086c8c <lp_Print+0xd2c>
ffffff8040086234:	7101bc1f 	cmp	w0, #0x6f
ffffff8040086238:	540018e0 	b.eq	ffffff8040086554 <lp_Print+0x5f4>  // b.none
ffffff804008623c:	7101bc1f 	cmp	w0, #0x6f
ffffff8040086240:	540000cc 	b.gt	ffffff8040086258 <lp_Print+0x2f8>
ffffff8040086244:	7101901f 	cmp	w0, #0x64
ffffff8040086248:	54000c60 	b.eq	ffffff80400863d4 <lp_Print+0x474>  // b.none
ffffff804008624c:	7101a41f 	cmp	w0, #0x69
ffffff8040086250:	54000c20 	b.eq	ffffff80400863d4 <lp_Print+0x474>  // b.none
ffffff8040086254:	1400028e 	b	ffffff8040086c8c <lp_Print+0xd2c>
ffffff8040086258:	7101d41f 	cmp	w0, #0x75
ffffff804008625c:	540022c0 	b.eq	ffffff80400866b4 <lp_Print+0x754>  // b.none
ffffff8040086260:	7101e01f 	cmp	w0, #0x78
ffffff8040086264:	54002d80 	b.eq	ffffff8040086814 <lp_Print+0x8b4>  // b.none
ffffff8040086268:	7101cc1f 	cmp	w0, #0x73
ffffff804008626c:	540049e0 	b.eq	ffffff8040086ba8 <lp_Print+0xc48>  // b.none
ffffff8040086270:	14000287 	b	ffffff8040086c8c <lp_Print+0xd2c>
ffffff8040086274:	b94467a0 	ldr	w0, [x29, #1124]
ffffff8040086278:	7100001f 	cmp	w0, #0x0
ffffff804008627c:	54000380 	b.eq	ffffff80400862ec <lp_Print+0x38c>  // b.none
ffffff8040086280:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086284:	f9400261 	ldr	x1, [x19]
ffffff8040086288:	7100001f 	cmp	w0, #0x0
ffffff804008628c:	540000eb 	b.lt	ffffff80400862a8 <lp_Print+0x348>  // b.tstop
ffffff8040086290:	aa0103e0 	mov	x0, x1
ffffff8040086294:	91003c00 	add	x0, x0, #0xf
ffffff8040086298:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff804008629c:	f9000260 	str	x0, [x19]
ffffff80400862a0:	aa0103e0 	mov	x0, x1
ffffff80400862a4:	1400000f 	b	ffffff80400862e0 <lp_Print+0x380>
ffffff80400862a8:	11002002 	add	w2, w0, #0x8
ffffff80400862ac:	b9001a62 	str	w2, [x19, #24]
ffffff80400862b0:	b9401a62 	ldr	w2, [x19, #24]
ffffff80400862b4:	7100005f 	cmp	w2, #0x0
ffffff80400862b8:	540000ed 	b.le	ffffff80400862d4 <lp_Print+0x374>
ffffff80400862bc:	aa0103e0 	mov	x0, x1
ffffff80400862c0:	91003c00 	add	x0, x0, #0xf
ffffff80400862c4:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400862c8:	f9000260 	str	x0, [x19]
ffffff80400862cc:	aa0103e0 	mov	x0, x1
ffffff80400862d0:	14000004 	b	ffffff80400862e0 <lp_Print+0x380>
ffffff80400862d4:	f9400661 	ldr	x1, [x19, #8]
ffffff80400862d8:	93407c00 	sxtw	x0, w0
ffffff80400862dc:	8b000020 	add	x0, x1, x0
ffffff80400862e0:	f9400000 	ldr	x0, [x0]
ffffff80400862e4:	f90237a0 	str	x0, [x29, #1128]
ffffff80400862e8:	1400001c 	b	ffffff8040086358 <lp_Print+0x3f8>
ffffff80400862ec:	b9401a60 	ldr	w0, [x19, #24]
ffffff80400862f0:	f9400261 	ldr	x1, [x19]
ffffff80400862f4:	7100001f 	cmp	w0, #0x0
ffffff80400862f8:	540000eb 	b.lt	ffffff8040086314 <lp_Print+0x3b4>  // b.tstop
ffffff80400862fc:	aa0103e0 	mov	x0, x1
ffffff8040086300:	91002c00 	add	x0, x0, #0xb
ffffff8040086304:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086308:	f9000260 	str	x0, [x19]
ffffff804008630c:	aa0103e0 	mov	x0, x1
ffffff8040086310:	1400000f 	b	ffffff804008634c <lp_Print+0x3ec>
ffffff8040086314:	11002002 	add	w2, w0, #0x8
ffffff8040086318:	b9001a62 	str	w2, [x19, #24]
ffffff804008631c:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086320:	7100005f 	cmp	w2, #0x0
ffffff8040086324:	540000ed 	b.le	ffffff8040086340 <lp_Print+0x3e0>
ffffff8040086328:	aa0103e0 	mov	x0, x1
ffffff804008632c:	91002c00 	add	x0, x0, #0xb
ffffff8040086330:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086334:	f9000260 	str	x0, [x19]
ffffff8040086338:	aa0103e0 	mov	x0, x1
ffffff804008633c:	14000004 	b	ffffff804008634c <lp_Print+0x3ec>
ffffff8040086340:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086344:	93407c00 	sxtw	x0, w0
ffffff8040086348:	8b000020 	add	x0, x1, x0
ffffff804008634c:	b9400000 	ldr	w0, [x0]
ffffff8040086350:	93407c00 	sxtw	x0, w0
ffffff8040086354:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086358:	f94237a1 	ldr	x1, [x29, #1128]
ffffff804008635c:	910123a0 	add	x0, x29, #0x48
ffffff8040086360:	52800007 	mov	w7, #0x0                   	// #0
ffffff8040086364:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff8040086368:	b94457a5 	ldr	w5, [x29, #1108]
ffffff804008636c:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff8040086370:	52800003 	mov	w3, #0x0                   	// #0
ffffff8040086374:	52800042 	mov	w2, #0x2                   	// #2
ffffff8040086378:	940002fb 	bl	ffffff8040086f64 <PrintNum>
ffffff804008637c:	b90447a0 	str	w0, [x29, #1092]
ffffff8040086380:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086384:	7100001f 	cmp	w0, #0x0
ffffff8040086388:	5400008b 	b.lt	ffffff8040086398 <lp_Print+0x438>  // b.tstop
ffffff804008638c:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086390:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086394:	5400012d 	b.le	ffffff80400863b8 <lp_Print+0x458>
ffffff8040086398:	f0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008639c:	9106c000 	add	x0, x0, #0x1b0
ffffff80400863a0:	f9401fa3 	ldr	x3, [x29, #56]
ffffff80400863a4:	52800302 	mov	w2, #0x18                  	// #24
ffffff80400863a8:	aa0003e1 	mov	x1, x0
ffffff80400863ac:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400863b0:	d63f0060 	blr	x3
ffffff80400863b4:	14000000 	b	ffffff80400863b4 <lp_Print+0x454>
ffffff80400863b8:	910123a0 	add	x0, x29, #0x48
ffffff80400863bc:	f9401fa3 	ldr	x3, [x29, #56]
ffffff80400863c0:	b94447a2 	ldr	w2, [x29, #1092]
ffffff80400863c4:	aa0003e1 	mov	x1, x0
ffffff80400863c8:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400863cc:	d63f0060 	blr	x3
ffffff80400863d0:	14000234 	b	ffffff8040086ca0 <lp_Print+0xd40>
ffffff80400863d4:	b94467a0 	ldr	w0, [x29, #1124]
ffffff80400863d8:	7100001f 	cmp	w0, #0x0
ffffff80400863dc:	54000380 	b.eq	ffffff804008644c <lp_Print+0x4ec>  // b.none
ffffff80400863e0:	b9401a60 	ldr	w0, [x19, #24]
ffffff80400863e4:	f9400261 	ldr	x1, [x19]
ffffff80400863e8:	7100001f 	cmp	w0, #0x0
ffffff80400863ec:	540000eb 	b.lt	ffffff8040086408 <lp_Print+0x4a8>  // b.tstop
ffffff80400863f0:	aa0103e0 	mov	x0, x1
ffffff80400863f4:	91003c00 	add	x0, x0, #0xf
ffffff80400863f8:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400863fc:	f9000260 	str	x0, [x19]
ffffff8040086400:	aa0103e0 	mov	x0, x1
ffffff8040086404:	1400000f 	b	ffffff8040086440 <lp_Print+0x4e0>
ffffff8040086408:	11002002 	add	w2, w0, #0x8
ffffff804008640c:	b9001a62 	str	w2, [x19, #24]
ffffff8040086410:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086414:	7100005f 	cmp	w2, #0x0
ffffff8040086418:	540000ed 	b.le	ffffff8040086434 <lp_Print+0x4d4>
ffffff804008641c:	aa0103e0 	mov	x0, x1
ffffff8040086420:	91003c00 	add	x0, x0, #0xf
ffffff8040086424:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086428:	f9000260 	str	x0, [x19]
ffffff804008642c:	aa0103e0 	mov	x0, x1
ffffff8040086430:	14000004 	b	ffffff8040086440 <lp_Print+0x4e0>
ffffff8040086434:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086438:	93407c00 	sxtw	x0, w0
ffffff804008643c:	8b000020 	add	x0, x1, x0
ffffff8040086440:	f9400000 	ldr	x0, [x0]
ffffff8040086444:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086448:	1400001c 	b	ffffff80400864b8 <lp_Print+0x558>
ffffff804008644c:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086450:	f9400261 	ldr	x1, [x19]
ffffff8040086454:	7100001f 	cmp	w0, #0x0
ffffff8040086458:	540000eb 	b.lt	ffffff8040086474 <lp_Print+0x514>  // b.tstop
ffffff804008645c:	aa0103e0 	mov	x0, x1
ffffff8040086460:	91002c00 	add	x0, x0, #0xb
ffffff8040086464:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086468:	f9000260 	str	x0, [x19]
ffffff804008646c:	aa0103e0 	mov	x0, x1
ffffff8040086470:	1400000f 	b	ffffff80400864ac <lp_Print+0x54c>
ffffff8040086474:	11002002 	add	w2, w0, #0x8
ffffff8040086478:	b9001a62 	str	w2, [x19, #24]
ffffff804008647c:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086480:	7100005f 	cmp	w2, #0x0
ffffff8040086484:	540000ed 	b.le	ffffff80400864a0 <lp_Print+0x540>
ffffff8040086488:	aa0103e0 	mov	x0, x1
ffffff804008648c:	91002c00 	add	x0, x0, #0xb
ffffff8040086490:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086494:	f9000260 	str	x0, [x19]
ffffff8040086498:	aa0103e0 	mov	x0, x1
ffffff804008649c:	14000004 	b	ffffff80400864ac <lp_Print+0x54c>
ffffff80400864a0:	f9400661 	ldr	x1, [x19, #8]
ffffff80400864a4:	93407c00 	sxtw	x0, w0
ffffff80400864a8:	8b000020 	add	x0, x1, x0
ffffff80400864ac:	b9400000 	ldr	w0, [x0]
ffffff80400864b0:	93407c00 	sxtw	x0, w0
ffffff80400864b4:	f90237a0 	str	x0, [x29, #1128]
ffffff80400864b8:	f94237a0 	ldr	x0, [x29, #1128]
ffffff80400864bc:	f100001f 	cmp	x0, #0x0
ffffff80400864c0:	540000ca 	b.ge	ffffff80400864d8 <lp_Print+0x578>  // b.tcont
ffffff80400864c4:	f94237a0 	ldr	x0, [x29, #1128]
ffffff80400864c8:	cb0003e0 	neg	x0, x0
ffffff80400864cc:	f90237a0 	str	x0, [x29, #1128]
ffffff80400864d0:	52800020 	mov	w0, #0x1                   	// #1
ffffff80400864d4:	b90463a0 	str	w0, [x29, #1120]
ffffff80400864d8:	f94237a1 	ldr	x1, [x29, #1128]
ffffff80400864dc:	910123a0 	add	x0, x29, #0x48
ffffff80400864e0:	52800007 	mov	w7, #0x0                   	// #0
ffffff80400864e4:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff80400864e8:	b94457a5 	ldr	w5, [x29, #1108]
ffffff80400864ec:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff80400864f0:	b94463a3 	ldr	w3, [x29, #1120]
ffffff80400864f4:	52800142 	mov	w2, #0xa                   	// #10
ffffff80400864f8:	9400029b 	bl	ffffff8040086f64 <PrintNum>
ffffff80400864fc:	b90447a0 	str	w0, [x29, #1092]
ffffff8040086500:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086504:	7100001f 	cmp	w0, #0x0
ffffff8040086508:	5400008b 	b.lt	ffffff8040086518 <lp_Print+0x5b8>  // b.tstop
ffffff804008650c:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086510:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086514:	5400012d 	b.le	ffffff8040086538 <lp_Print+0x5d8>
ffffff8040086518:	f0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008651c:	9106c000 	add	x0, x0, #0x1b0
ffffff8040086520:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086524:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086528:	aa0003e1 	mov	x1, x0
ffffff804008652c:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086530:	d63f0060 	blr	x3
ffffff8040086534:	14000000 	b	ffffff8040086534 <lp_Print+0x5d4>
ffffff8040086538:	910123a0 	add	x0, x29, #0x48
ffffff804008653c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086540:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086544:	aa0003e1 	mov	x1, x0
ffffff8040086548:	f9401ba0 	ldr	x0, [x29, #48]
ffffff804008654c:	d63f0060 	blr	x3
ffffff8040086550:	140001d4 	b	ffffff8040086ca0 <lp_Print+0xd40>
ffffff8040086554:	b94467a0 	ldr	w0, [x29, #1124]
ffffff8040086558:	7100001f 	cmp	w0, #0x0
ffffff804008655c:	54000380 	b.eq	ffffff80400865cc <lp_Print+0x66c>  // b.none
ffffff8040086560:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086564:	f9400261 	ldr	x1, [x19]
ffffff8040086568:	7100001f 	cmp	w0, #0x0
ffffff804008656c:	540000eb 	b.lt	ffffff8040086588 <lp_Print+0x628>  // b.tstop
ffffff8040086570:	aa0103e0 	mov	x0, x1
ffffff8040086574:	91003c00 	add	x0, x0, #0xf
ffffff8040086578:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff804008657c:	f9000260 	str	x0, [x19]
ffffff8040086580:	aa0103e0 	mov	x0, x1
ffffff8040086584:	1400000f 	b	ffffff80400865c0 <lp_Print+0x660>
ffffff8040086588:	11002002 	add	w2, w0, #0x8
ffffff804008658c:	b9001a62 	str	w2, [x19, #24]
ffffff8040086590:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086594:	7100005f 	cmp	w2, #0x0
ffffff8040086598:	540000ed 	b.le	ffffff80400865b4 <lp_Print+0x654>
ffffff804008659c:	aa0103e0 	mov	x0, x1
ffffff80400865a0:	91003c00 	add	x0, x0, #0xf
ffffff80400865a4:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400865a8:	f9000260 	str	x0, [x19]
ffffff80400865ac:	aa0103e0 	mov	x0, x1
ffffff80400865b0:	14000004 	b	ffffff80400865c0 <lp_Print+0x660>
ffffff80400865b4:	f9400661 	ldr	x1, [x19, #8]
ffffff80400865b8:	93407c00 	sxtw	x0, w0
ffffff80400865bc:	8b000020 	add	x0, x1, x0
ffffff80400865c0:	f9400000 	ldr	x0, [x0]
ffffff80400865c4:	f90237a0 	str	x0, [x29, #1128]
ffffff80400865c8:	1400001c 	b	ffffff8040086638 <lp_Print+0x6d8>
ffffff80400865cc:	b9401a60 	ldr	w0, [x19, #24]
ffffff80400865d0:	f9400261 	ldr	x1, [x19]
ffffff80400865d4:	7100001f 	cmp	w0, #0x0
ffffff80400865d8:	540000eb 	b.lt	ffffff80400865f4 <lp_Print+0x694>  // b.tstop
ffffff80400865dc:	aa0103e0 	mov	x0, x1
ffffff80400865e0:	91002c00 	add	x0, x0, #0xb
ffffff80400865e4:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400865e8:	f9000260 	str	x0, [x19]
ffffff80400865ec:	aa0103e0 	mov	x0, x1
ffffff80400865f0:	1400000f 	b	ffffff804008662c <lp_Print+0x6cc>
ffffff80400865f4:	11002002 	add	w2, w0, #0x8
ffffff80400865f8:	b9001a62 	str	w2, [x19, #24]
ffffff80400865fc:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086600:	7100005f 	cmp	w2, #0x0
ffffff8040086604:	540000ed 	b.le	ffffff8040086620 <lp_Print+0x6c0>
ffffff8040086608:	aa0103e0 	mov	x0, x1
ffffff804008660c:	91002c00 	add	x0, x0, #0xb
ffffff8040086610:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086614:	f9000260 	str	x0, [x19]
ffffff8040086618:	aa0103e0 	mov	x0, x1
ffffff804008661c:	14000004 	b	ffffff804008662c <lp_Print+0x6cc>
ffffff8040086620:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086624:	93407c00 	sxtw	x0, w0
ffffff8040086628:	8b000020 	add	x0, x1, x0
ffffff804008662c:	b9400000 	ldr	w0, [x0]
ffffff8040086630:	93407c00 	sxtw	x0, w0
ffffff8040086634:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086638:	f94237a1 	ldr	x1, [x29, #1128]
ffffff804008663c:	910123a0 	add	x0, x29, #0x48
ffffff8040086640:	52800007 	mov	w7, #0x0                   	// #0
ffffff8040086644:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff8040086648:	b94457a5 	ldr	w5, [x29, #1108]
ffffff804008664c:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff8040086650:	52800003 	mov	w3, #0x0                   	// #0
ffffff8040086654:	52800102 	mov	w2, #0x8                   	// #8
ffffff8040086658:	94000243 	bl	ffffff8040086f64 <PrintNum>
ffffff804008665c:	b90447a0 	str	w0, [x29, #1092]
ffffff8040086660:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086664:	7100001f 	cmp	w0, #0x0
ffffff8040086668:	5400008b 	b.lt	ffffff8040086678 <lp_Print+0x718>  // b.tstop
ffffff804008666c:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086670:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086674:	5400012d 	b.le	ffffff8040086698 <lp_Print+0x738>
ffffff8040086678:	f0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008667c:	9106c000 	add	x0, x0, #0x1b0
ffffff8040086680:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086684:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086688:	aa0003e1 	mov	x1, x0
ffffff804008668c:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086690:	d63f0060 	blr	x3
ffffff8040086694:	14000000 	b	ffffff8040086694 <lp_Print+0x734>
ffffff8040086698:	910123a0 	add	x0, x29, #0x48
ffffff804008669c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff80400866a0:	b94447a2 	ldr	w2, [x29, #1092]
ffffff80400866a4:	aa0003e1 	mov	x1, x0
ffffff80400866a8:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400866ac:	d63f0060 	blr	x3
ffffff80400866b0:	1400017c 	b	ffffff8040086ca0 <lp_Print+0xd40>
ffffff80400866b4:	b94467a0 	ldr	w0, [x29, #1124]
ffffff80400866b8:	7100001f 	cmp	w0, #0x0
ffffff80400866bc:	54000380 	b.eq	ffffff804008672c <lp_Print+0x7cc>  // b.none
ffffff80400866c0:	b9401a60 	ldr	w0, [x19, #24]
ffffff80400866c4:	f9400261 	ldr	x1, [x19]
ffffff80400866c8:	7100001f 	cmp	w0, #0x0
ffffff80400866cc:	540000eb 	b.lt	ffffff80400866e8 <lp_Print+0x788>  // b.tstop
ffffff80400866d0:	aa0103e0 	mov	x0, x1
ffffff80400866d4:	91003c00 	add	x0, x0, #0xf
ffffff80400866d8:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400866dc:	f9000260 	str	x0, [x19]
ffffff80400866e0:	aa0103e0 	mov	x0, x1
ffffff80400866e4:	1400000f 	b	ffffff8040086720 <lp_Print+0x7c0>
ffffff80400866e8:	11002002 	add	w2, w0, #0x8
ffffff80400866ec:	b9001a62 	str	w2, [x19, #24]
ffffff80400866f0:	b9401a62 	ldr	w2, [x19, #24]
ffffff80400866f4:	7100005f 	cmp	w2, #0x0
ffffff80400866f8:	540000ed 	b.le	ffffff8040086714 <lp_Print+0x7b4>
ffffff80400866fc:	aa0103e0 	mov	x0, x1
ffffff8040086700:	91003c00 	add	x0, x0, #0xf
ffffff8040086704:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086708:	f9000260 	str	x0, [x19]
ffffff804008670c:	aa0103e0 	mov	x0, x1
ffffff8040086710:	14000004 	b	ffffff8040086720 <lp_Print+0x7c0>
ffffff8040086714:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086718:	93407c00 	sxtw	x0, w0
ffffff804008671c:	8b000020 	add	x0, x1, x0
ffffff8040086720:	f9400000 	ldr	x0, [x0]
ffffff8040086724:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086728:	1400001c 	b	ffffff8040086798 <lp_Print+0x838>
ffffff804008672c:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086730:	f9400261 	ldr	x1, [x19]
ffffff8040086734:	7100001f 	cmp	w0, #0x0
ffffff8040086738:	540000eb 	b.lt	ffffff8040086754 <lp_Print+0x7f4>  // b.tstop
ffffff804008673c:	aa0103e0 	mov	x0, x1
ffffff8040086740:	91002c00 	add	x0, x0, #0xb
ffffff8040086744:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086748:	f9000260 	str	x0, [x19]
ffffff804008674c:	aa0103e0 	mov	x0, x1
ffffff8040086750:	1400000f 	b	ffffff804008678c <lp_Print+0x82c>
ffffff8040086754:	11002002 	add	w2, w0, #0x8
ffffff8040086758:	b9001a62 	str	w2, [x19, #24]
ffffff804008675c:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086760:	7100005f 	cmp	w2, #0x0
ffffff8040086764:	540000ed 	b.le	ffffff8040086780 <lp_Print+0x820>
ffffff8040086768:	aa0103e0 	mov	x0, x1
ffffff804008676c:	91002c00 	add	x0, x0, #0xb
ffffff8040086770:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086774:	f9000260 	str	x0, [x19]
ffffff8040086778:	aa0103e0 	mov	x0, x1
ffffff804008677c:	14000004 	b	ffffff804008678c <lp_Print+0x82c>
ffffff8040086780:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086784:	93407c00 	sxtw	x0, w0
ffffff8040086788:	8b000020 	add	x0, x1, x0
ffffff804008678c:	b9400000 	ldr	w0, [x0]
ffffff8040086790:	93407c00 	sxtw	x0, w0
ffffff8040086794:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086798:	f94237a1 	ldr	x1, [x29, #1128]
ffffff804008679c:	910123a0 	add	x0, x29, #0x48
ffffff80400867a0:	52800007 	mov	w7, #0x0                   	// #0
ffffff80400867a4:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff80400867a8:	b94457a5 	ldr	w5, [x29, #1108]
ffffff80400867ac:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff80400867b0:	52800003 	mov	w3, #0x0                   	// #0
ffffff80400867b4:	52800142 	mov	w2, #0xa                   	// #10
ffffff80400867b8:	940001eb 	bl	ffffff8040086f64 <PrintNum>
ffffff80400867bc:	b90447a0 	str	w0, [x29, #1092]
ffffff80400867c0:	b94447a0 	ldr	w0, [x29, #1092]
ffffff80400867c4:	7100001f 	cmp	w0, #0x0
ffffff80400867c8:	5400008b 	b.lt	ffffff80400867d8 <lp_Print+0x878>  // b.tstop
ffffff80400867cc:	b94447a0 	ldr	w0, [x29, #1092]
ffffff80400867d0:	710fa01f 	cmp	w0, #0x3e8
ffffff80400867d4:	5400012d 	b.le	ffffff80400867f8 <lp_Print+0x898>
ffffff80400867d8:	f0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400867dc:	9106c000 	add	x0, x0, #0x1b0
ffffff80400867e0:	f9401fa3 	ldr	x3, [x29, #56]
ffffff80400867e4:	52800302 	mov	w2, #0x18                  	// #24
ffffff80400867e8:	aa0003e1 	mov	x1, x0
ffffff80400867ec:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400867f0:	d63f0060 	blr	x3
ffffff80400867f4:	14000000 	b	ffffff80400867f4 <lp_Print+0x894>
ffffff80400867f8:	910123a0 	add	x0, x29, #0x48
ffffff80400867fc:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086800:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086804:	aa0003e1 	mov	x1, x0
ffffff8040086808:	f9401ba0 	ldr	x0, [x29, #48]
ffffff804008680c:	d63f0060 	blr	x3
ffffff8040086810:	14000124 	b	ffffff8040086ca0 <lp_Print+0xd40>
ffffff8040086814:	b94467a0 	ldr	w0, [x29, #1124]
ffffff8040086818:	7100001f 	cmp	w0, #0x0
ffffff804008681c:	54000380 	b.eq	ffffff804008688c <lp_Print+0x92c>  // b.none
ffffff8040086820:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086824:	f9400261 	ldr	x1, [x19]
ffffff8040086828:	7100001f 	cmp	w0, #0x0
ffffff804008682c:	540000eb 	b.lt	ffffff8040086848 <lp_Print+0x8e8>  // b.tstop
ffffff8040086830:	aa0103e0 	mov	x0, x1
ffffff8040086834:	91003c00 	add	x0, x0, #0xf
ffffff8040086838:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff804008683c:	f9000260 	str	x0, [x19]
ffffff8040086840:	aa0103e0 	mov	x0, x1
ffffff8040086844:	1400000f 	b	ffffff8040086880 <lp_Print+0x920>
ffffff8040086848:	11002002 	add	w2, w0, #0x8
ffffff804008684c:	b9001a62 	str	w2, [x19, #24]
ffffff8040086850:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086854:	7100005f 	cmp	w2, #0x0
ffffff8040086858:	540000ed 	b.le	ffffff8040086874 <lp_Print+0x914>
ffffff804008685c:	aa0103e0 	mov	x0, x1
ffffff8040086860:	91003c00 	add	x0, x0, #0xf
ffffff8040086864:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086868:	f9000260 	str	x0, [x19]
ffffff804008686c:	aa0103e0 	mov	x0, x1
ffffff8040086870:	14000004 	b	ffffff8040086880 <lp_Print+0x920>
ffffff8040086874:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086878:	93407c00 	sxtw	x0, w0
ffffff804008687c:	8b000020 	add	x0, x1, x0
ffffff8040086880:	f9400000 	ldr	x0, [x0]
ffffff8040086884:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086888:	1400001c 	b	ffffff80400868f8 <lp_Print+0x998>
ffffff804008688c:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086890:	f9400261 	ldr	x1, [x19]
ffffff8040086894:	7100001f 	cmp	w0, #0x0
ffffff8040086898:	540000eb 	b.lt	ffffff80400868b4 <lp_Print+0x954>  // b.tstop
ffffff804008689c:	aa0103e0 	mov	x0, x1
ffffff80400868a0:	91002c00 	add	x0, x0, #0xb
ffffff80400868a4:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400868a8:	f9000260 	str	x0, [x19]
ffffff80400868ac:	aa0103e0 	mov	x0, x1
ffffff80400868b0:	1400000f 	b	ffffff80400868ec <lp_Print+0x98c>
ffffff80400868b4:	11002002 	add	w2, w0, #0x8
ffffff80400868b8:	b9001a62 	str	w2, [x19, #24]
ffffff80400868bc:	b9401a62 	ldr	w2, [x19, #24]
ffffff80400868c0:	7100005f 	cmp	w2, #0x0
ffffff80400868c4:	540000ed 	b.le	ffffff80400868e0 <lp_Print+0x980>
ffffff80400868c8:	aa0103e0 	mov	x0, x1
ffffff80400868cc:	91002c00 	add	x0, x0, #0xb
ffffff80400868d0:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400868d4:	f9000260 	str	x0, [x19]
ffffff80400868d8:	aa0103e0 	mov	x0, x1
ffffff80400868dc:	14000004 	b	ffffff80400868ec <lp_Print+0x98c>
ffffff80400868e0:	f9400661 	ldr	x1, [x19, #8]
ffffff80400868e4:	93407c00 	sxtw	x0, w0
ffffff80400868e8:	8b000020 	add	x0, x1, x0
ffffff80400868ec:	b9400000 	ldr	w0, [x0]
ffffff80400868f0:	93407c00 	sxtw	x0, w0
ffffff80400868f4:	f90237a0 	str	x0, [x29, #1128]
ffffff80400868f8:	f94237a1 	ldr	x1, [x29, #1128]
ffffff80400868fc:	910123a0 	add	x0, x29, #0x48
ffffff8040086900:	52800007 	mov	w7, #0x0                   	// #0
ffffff8040086904:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff8040086908:	b94457a5 	ldr	w5, [x29, #1108]
ffffff804008690c:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff8040086910:	52800003 	mov	w3, #0x0                   	// #0
ffffff8040086914:	52800202 	mov	w2, #0x10                  	// #16
ffffff8040086918:	94000193 	bl	ffffff8040086f64 <PrintNum>
ffffff804008691c:	b90447a0 	str	w0, [x29, #1092]
ffffff8040086920:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086924:	7100001f 	cmp	w0, #0x0
ffffff8040086928:	5400008b 	b.lt	ffffff8040086938 <lp_Print+0x9d8>  // b.tstop
ffffff804008692c:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086930:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086934:	5400012d 	b.le	ffffff8040086958 <lp_Print+0x9f8>
ffffff8040086938:	f0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008693c:	9106c000 	add	x0, x0, #0x1b0
ffffff8040086940:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086944:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086948:	aa0003e1 	mov	x1, x0
ffffff804008694c:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086950:	d63f0060 	blr	x3
ffffff8040086954:	14000000 	b	ffffff8040086954 <lp_Print+0x9f4>
ffffff8040086958:	910123a0 	add	x0, x29, #0x48
ffffff804008695c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086960:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086964:	aa0003e1 	mov	x1, x0
ffffff8040086968:	f9401ba0 	ldr	x0, [x29, #48]
ffffff804008696c:	d63f0060 	blr	x3
ffffff8040086970:	140000cc 	b	ffffff8040086ca0 <lp_Print+0xd40>
ffffff8040086974:	b94467a0 	ldr	w0, [x29, #1124]
ffffff8040086978:	7100001f 	cmp	w0, #0x0
ffffff804008697c:	54000380 	b.eq	ffffff80400869ec <lp_Print+0xa8c>  // b.none
ffffff8040086980:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086984:	f9400261 	ldr	x1, [x19]
ffffff8040086988:	7100001f 	cmp	w0, #0x0
ffffff804008698c:	540000eb 	b.lt	ffffff80400869a8 <lp_Print+0xa48>  // b.tstop
ffffff8040086990:	aa0103e0 	mov	x0, x1
ffffff8040086994:	91003c00 	add	x0, x0, #0xf
ffffff8040086998:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff804008699c:	f9000260 	str	x0, [x19]
ffffff80400869a0:	aa0103e0 	mov	x0, x1
ffffff80400869a4:	1400000f 	b	ffffff80400869e0 <lp_Print+0xa80>
ffffff80400869a8:	11002002 	add	w2, w0, #0x8
ffffff80400869ac:	b9001a62 	str	w2, [x19, #24]
ffffff80400869b0:	b9401a62 	ldr	w2, [x19, #24]
ffffff80400869b4:	7100005f 	cmp	w2, #0x0
ffffff80400869b8:	540000ed 	b.le	ffffff80400869d4 <lp_Print+0xa74>
ffffff80400869bc:	aa0103e0 	mov	x0, x1
ffffff80400869c0:	91003c00 	add	x0, x0, #0xf
ffffff80400869c4:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff80400869c8:	f9000260 	str	x0, [x19]
ffffff80400869cc:	aa0103e0 	mov	x0, x1
ffffff80400869d0:	14000004 	b	ffffff80400869e0 <lp_Print+0xa80>
ffffff80400869d4:	f9400661 	ldr	x1, [x19, #8]
ffffff80400869d8:	93407c00 	sxtw	x0, w0
ffffff80400869dc:	8b000020 	add	x0, x1, x0
ffffff80400869e0:	f9400000 	ldr	x0, [x0]
ffffff80400869e4:	f90237a0 	str	x0, [x29, #1128]
ffffff80400869e8:	1400001c 	b	ffffff8040086a58 <lp_Print+0xaf8>
ffffff80400869ec:	b9401a60 	ldr	w0, [x19, #24]
ffffff80400869f0:	f9400261 	ldr	x1, [x19]
ffffff80400869f4:	7100001f 	cmp	w0, #0x0
ffffff80400869f8:	540000eb 	b.lt	ffffff8040086a14 <lp_Print+0xab4>  // b.tstop
ffffff80400869fc:	aa0103e0 	mov	x0, x1
ffffff8040086a00:	91002c00 	add	x0, x0, #0xb
ffffff8040086a04:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086a08:	f9000260 	str	x0, [x19]
ffffff8040086a0c:	aa0103e0 	mov	x0, x1
ffffff8040086a10:	1400000f 	b	ffffff8040086a4c <lp_Print+0xaec>
ffffff8040086a14:	11002002 	add	w2, w0, #0x8
ffffff8040086a18:	b9001a62 	str	w2, [x19, #24]
ffffff8040086a1c:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086a20:	7100005f 	cmp	w2, #0x0
ffffff8040086a24:	540000ed 	b.le	ffffff8040086a40 <lp_Print+0xae0>
ffffff8040086a28:	aa0103e0 	mov	x0, x1
ffffff8040086a2c:	91002c00 	add	x0, x0, #0xb
ffffff8040086a30:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086a34:	f9000260 	str	x0, [x19]
ffffff8040086a38:	aa0103e0 	mov	x0, x1
ffffff8040086a3c:	14000004 	b	ffffff8040086a4c <lp_Print+0xaec>
ffffff8040086a40:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086a44:	93407c00 	sxtw	x0, w0
ffffff8040086a48:	8b000020 	add	x0, x1, x0
ffffff8040086a4c:	b9400000 	ldr	w0, [x0]
ffffff8040086a50:	93407c00 	sxtw	x0, w0
ffffff8040086a54:	f90237a0 	str	x0, [x29, #1128]
ffffff8040086a58:	f94237a1 	ldr	x1, [x29, #1128]
ffffff8040086a5c:	910123a0 	add	x0, x29, #0x48
ffffff8040086a60:	52800027 	mov	w7, #0x1                   	// #1
ffffff8040086a64:	39514fa6 	ldrb	w6, [x29, #1107]
ffffff8040086a68:	b94457a5 	ldr	w5, [x29, #1108]
ffffff8040086a6c:	b9445fa4 	ldr	w4, [x29, #1116]
ffffff8040086a70:	52800003 	mov	w3, #0x0                   	// #0
ffffff8040086a74:	52800202 	mov	w2, #0x10                  	// #16
ffffff8040086a78:	9400013b 	bl	ffffff8040086f64 <PrintNum>
ffffff8040086a7c:	b90447a0 	str	w0, [x29, #1092]
ffffff8040086a80:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086a84:	7100001f 	cmp	w0, #0x0
ffffff8040086a88:	5400008b 	b.lt	ffffff8040086a98 <lp_Print+0xb38>  // b.tstop
ffffff8040086a8c:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086a90:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086a94:	5400012d 	b.le	ffffff8040086ab8 <lp_Print+0xb58>
ffffff8040086a98:	f0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040086a9c:	9106c000 	add	x0, x0, #0x1b0
ffffff8040086aa0:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086aa4:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086aa8:	aa0003e1 	mov	x1, x0
ffffff8040086aac:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086ab0:	d63f0060 	blr	x3
ffffff8040086ab4:	14000000 	b	ffffff8040086ab4 <lp_Print+0xb54>
ffffff8040086ab8:	910123a0 	add	x0, x29, #0x48
ffffff8040086abc:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086ac0:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086ac4:	aa0003e1 	mov	x1, x0
ffffff8040086ac8:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086acc:	d63f0060 	blr	x3
ffffff8040086ad0:	14000074 	b	ffffff8040086ca0 <lp_Print+0xd40>
ffffff8040086ad4:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086ad8:	f9400261 	ldr	x1, [x19]
ffffff8040086adc:	7100001f 	cmp	w0, #0x0
ffffff8040086ae0:	540000eb 	b.lt	ffffff8040086afc <lp_Print+0xb9c>  // b.tstop
ffffff8040086ae4:	aa0103e0 	mov	x0, x1
ffffff8040086ae8:	91002c00 	add	x0, x0, #0xb
ffffff8040086aec:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086af0:	f9000260 	str	x0, [x19]
ffffff8040086af4:	aa0103e0 	mov	x0, x1
ffffff8040086af8:	1400000f 	b	ffffff8040086b34 <lp_Print+0xbd4>
ffffff8040086afc:	11002002 	add	w2, w0, #0x8
ffffff8040086b00:	b9001a62 	str	w2, [x19, #24]
ffffff8040086b04:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086b08:	7100005f 	cmp	w2, #0x0
ffffff8040086b0c:	540000ed 	b.le	ffffff8040086b28 <lp_Print+0xbc8>
ffffff8040086b10:	aa0103e0 	mov	x0, x1
ffffff8040086b14:	91002c00 	add	x0, x0, #0xb
ffffff8040086b18:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086b1c:	f9000260 	str	x0, [x19]
ffffff8040086b20:	aa0103e0 	mov	x0, x1
ffffff8040086b24:	14000004 	b	ffffff8040086b34 <lp_Print+0xbd4>
ffffff8040086b28:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086b2c:	93407c00 	sxtw	x0, w0
ffffff8040086b30:	8b000020 	add	x0, x1, x0
ffffff8040086b34:	b9400000 	ldr	w0, [x0]
ffffff8040086b38:	3910dfa0 	strb	w0, [x29, #1079]
ffffff8040086b3c:	910123a0 	add	x0, x29, #0x48
ffffff8040086b40:	b94457a3 	ldr	w3, [x29, #1108]
ffffff8040086b44:	b9445fa2 	ldr	w2, [x29, #1116]
ffffff8040086b48:	3950dfa1 	ldrb	w1, [x29, #1079]
ffffff8040086b4c:	94000066 	bl	ffffff8040086ce4 <PrintChar>
ffffff8040086b50:	b90447a0 	str	w0, [x29, #1092]
ffffff8040086b54:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086b58:	7100001f 	cmp	w0, #0x0
ffffff8040086b5c:	5400008b 	b.lt	ffffff8040086b6c <lp_Print+0xc0c>  // b.tstop
ffffff8040086b60:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086b64:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086b68:	5400012d 	b.le	ffffff8040086b8c <lp_Print+0xc2c>
ffffff8040086b6c:	f0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040086b70:	9106c000 	add	x0, x0, #0x1b0
ffffff8040086b74:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086b78:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086b7c:	aa0003e1 	mov	x1, x0
ffffff8040086b80:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086b84:	d63f0060 	blr	x3
ffffff8040086b88:	14000000 	b	ffffff8040086b88 <lp_Print+0xc28>
ffffff8040086b8c:	910123a0 	add	x0, x29, #0x48
ffffff8040086b90:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086b94:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086b98:	aa0003e1 	mov	x1, x0
ffffff8040086b9c:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086ba0:	d63f0060 	blr	x3
ffffff8040086ba4:	1400003f 	b	ffffff8040086ca0 <lp_Print+0xd40>
ffffff8040086ba8:	b9401a60 	ldr	w0, [x19, #24]
ffffff8040086bac:	f9400261 	ldr	x1, [x19]
ffffff8040086bb0:	7100001f 	cmp	w0, #0x0
ffffff8040086bb4:	540000eb 	b.lt	ffffff8040086bd0 <lp_Print+0xc70>  // b.tstop
ffffff8040086bb8:	aa0103e0 	mov	x0, x1
ffffff8040086bbc:	91003c00 	add	x0, x0, #0xf
ffffff8040086bc0:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086bc4:	f9000260 	str	x0, [x19]
ffffff8040086bc8:	aa0103e0 	mov	x0, x1
ffffff8040086bcc:	1400000f 	b	ffffff8040086c08 <lp_Print+0xca8>
ffffff8040086bd0:	11002002 	add	w2, w0, #0x8
ffffff8040086bd4:	b9001a62 	str	w2, [x19, #24]
ffffff8040086bd8:	b9401a62 	ldr	w2, [x19, #24]
ffffff8040086bdc:	7100005f 	cmp	w2, #0x0
ffffff8040086be0:	540000ed 	b.le	ffffff8040086bfc <lp_Print+0xc9c>
ffffff8040086be4:	aa0103e0 	mov	x0, x1
ffffff8040086be8:	91003c00 	add	x0, x0, #0xf
ffffff8040086bec:	927df000 	and	x0, x0, #0xfffffffffffffff8
ffffff8040086bf0:	f9000260 	str	x0, [x19]
ffffff8040086bf4:	aa0103e0 	mov	x0, x1
ffffff8040086bf8:	14000004 	b	ffffff8040086c08 <lp_Print+0xca8>
ffffff8040086bfc:	f9400661 	ldr	x1, [x19, #8]
ffffff8040086c00:	93407c00 	sxtw	x0, w0
ffffff8040086c04:	8b000020 	add	x0, x1, x0
ffffff8040086c08:	f9400000 	ldr	x0, [x0]
ffffff8040086c0c:	f9021fa0 	str	x0, [x29, #1080]
ffffff8040086c10:	910123a0 	add	x0, x29, #0x48
ffffff8040086c14:	b94457a3 	ldr	w3, [x29, #1108]
ffffff8040086c18:	b9445fa2 	ldr	w2, [x29, #1116]
ffffff8040086c1c:	f9421fa1 	ldr	x1, [x29, #1080]
ffffff8040086c20:	94000069 	bl	ffffff8040086dc4 <PrintString>
ffffff8040086c24:	b90447a0 	str	w0, [x29, #1092]
ffffff8040086c28:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086c2c:	7100001f 	cmp	w0, #0x0
ffffff8040086c30:	5400008b 	b.lt	ffffff8040086c40 <lp_Print+0xce0>  // b.tstop
ffffff8040086c34:	b94447a0 	ldr	w0, [x29, #1092]
ffffff8040086c38:	710fa01f 	cmp	w0, #0x3e8
ffffff8040086c3c:	5400012d 	b.le	ffffff8040086c60 <lp_Print+0xd00>
ffffff8040086c40:	f0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040086c44:	9106c000 	add	x0, x0, #0x1b0
ffffff8040086c48:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086c4c:	52800302 	mov	w2, #0x18                  	// #24
ffffff8040086c50:	aa0003e1 	mov	x1, x0
ffffff8040086c54:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086c58:	d63f0060 	blr	x3
ffffff8040086c5c:	14000000 	b	ffffff8040086c5c <lp_Print+0xcfc>
ffffff8040086c60:	910123a0 	add	x0, x29, #0x48
ffffff8040086c64:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086c68:	b94447a2 	ldr	w2, [x29, #1092]
ffffff8040086c6c:	aa0003e1 	mov	x1, x0
ffffff8040086c70:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086c74:	d63f0060 	blr	x3
ffffff8040086c78:	1400000a 	b	ffffff8040086ca0 <lp_Print+0xd40>
ffffff8040086c7c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086c80:	d1000400 	sub	x0, x0, #0x1
ffffff8040086c84:	f90017a0 	str	x0, [x29, #40]
ffffff8040086c88:	14000006 	b	ffffff8040086ca0 <lp_Print+0xd40>
ffffff8040086c8c:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086c90:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040086c94:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040086c98:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086c9c:	d63f0060 	blr	x3
ffffff8040086ca0:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040086ca4:	91000400 	add	x0, x0, #0x1
ffffff8040086ca8:	f90017a0 	str	x0, [x29, #40]
ffffff8040086cac:	17fffcb5 	b	ffffff8040085f80 <lp_Print+0x20>
ffffff8040086cb0:	d503201f 	nop
ffffff8040086cb4:	f0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040086cb8:	91074000 	add	x0, x0, #0x1d0
ffffff8040086cbc:	f9401fa3 	ldr	x3, [x29, #56]
ffffff8040086cc0:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040086cc4:	aa0003e1 	mov	x1, x0
ffffff8040086cc8:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040086ccc:	d63f0060 	blr	x3
ffffff8040086cd0:	d503201f 	nop
ffffff8040086cd4:	f9400bf3 	ldr	x19, [sp, #16]
ffffff8040086cd8:	a9407bfd 	ldp	x29, x30, [sp]
ffffff8040086cdc:	9111c3ff 	add	sp, sp, #0x470
ffffff8040086ce0:	d65f03c0 	ret

ffffff8040086ce4 <PrintChar>:
ffffff8040086ce4:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040086ce8:	f9000fe0 	str	x0, [sp, #24]
ffffff8040086cec:	39005fe1 	strb	w1, [sp, #23]
ffffff8040086cf0:	b90013e2 	str	w2, [sp, #16]
ffffff8040086cf4:	b9000fe3 	str	w3, [sp, #12]
ffffff8040086cf8:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086cfc:	7100001f 	cmp	w0, #0x0
ffffff8040086d00:	5400006c 	b.gt	ffffff8040086d0c <PrintChar+0x28>
ffffff8040086d04:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040086d08:	b90013e0 	str	w0, [sp, #16]
ffffff8040086d0c:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086d10:	7100001f 	cmp	w0, #0x0
ffffff8040086d14:	54000280 	b.eq	ffffff8040086d64 <PrintChar+0x80>  // b.none
ffffff8040086d18:	f9400fe0 	ldr	x0, [sp, #24]
ffffff8040086d1c:	39405fe1 	ldrb	w1, [sp, #23]
ffffff8040086d20:	39000001 	strb	w1, [x0]
ffffff8040086d24:	52800020 	mov	w0, #0x1                   	// #1
ffffff8040086d28:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086d2c:	14000009 	b	ffffff8040086d50 <PrintChar+0x6c>
ffffff8040086d30:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086d34:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086d38:	8b000020 	add	x0, x1, x0
ffffff8040086d3c:	52800401 	mov	w1, #0x20                  	// #32
ffffff8040086d40:	39000001 	strb	w1, [x0]
ffffff8040086d44:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086d48:	11000400 	add	w0, w0, #0x1
ffffff8040086d4c:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086d50:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086d54:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086d58:	6b00003f 	cmp	w1, w0
ffffff8040086d5c:	54fffeab 	b.lt	ffffff8040086d30 <PrintChar+0x4c>  // b.tstop
ffffff8040086d60:	14000016 	b	ffffff8040086db8 <PrintChar+0xd4>
ffffff8040086d64:	b9002fff 	str	wzr, [sp, #44]
ffffff8040086d68:	14000009 	b	ffffff8040086d8c <PrintChar+0xa8>
ffffff8040086d6c:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086d70:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086d74:	8b000020 	add	x0, x1, x0
ffffff8040086d78:	52800401 	mov	w1, #0x20                  	// #32
ffffff8040086d7c:	39000001 	strb	w1, [x0]
ffffff8040086d80:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086d84:	11000400 	add	w0, w0, #0x1
ffffff8040086d88:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086d8c:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086d90:	51000400 	sub	w0, w0, #0x1
ffffff8040086d94:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086d98:	6b00003f 	cmp	w1, w0
ffffff8040086d9c:	54fffe8b 	b.lt	ffffff8040086d6c <PrintChar+0x88>  // b.tstop
ffffff8040086da0:	b98013e0 	ldrsw	x0, [sp, #16]
ffffff8040086da4:	d1000400 	sub	x0, x0, #0x1
ffffff8040086da8:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086dac:	8b000020 	add	x0, x1, x0
ffffff8040086db0:	39405fe1 	ldrb	w1, [sp, #23]
ffffff8040086db4:	39000001 	strb	w1, [x0]
ffffff8040086db8:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040086dbc:	9100c3ff 	add	sp, sp, #0x30
ffffff8040086dc0:	d65f03c0 	ret

ffffff8040086dc4 <PrintString>:
ffffff8040086dc4:	d100c3ff 	sub	sp, sp, #0x30
ffffff8040086dc8:	f9000fe0 	str	x0, [sp, #24]
ffffff8040086dcc:	f9000be1 	str	x1, [sp, #16]
ffffff8040086dd0:	b9000fe2 	str	w2, [sp, #12]
ffffff8040086dd4:	b9000be3 	str	w3, [sp, #8]
ffffff8040086dd8:	b9002bff 	str	wzr, [sp, #40]
ffffff8040086ddc:	f9400be0 	ldr	x0, [sp, #16]
ffffff8040086de0:	f90013e0 	str	x0, [sp, #32]
ffffff8040086de4:	14000004 	b	ffffff8040086df4 <PrintString+0x30>
ffffff8040086de8:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086dec:	11000400 	add	w0, w0, #0x1
ffffff8040086df0:	b9002be0 	str	w0, [sp, #40]
ffffff8040086df4:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040086df8:	91000401 	add	x1, x0, #0x1
ffffff8040086dfc:	f90013e1 	str	x1, [sp, #32]
ffffff8040086e00:	39400000 	ldrb	w0, [x0]
ffffff8040086e04:	7100001f 	cmp	w0, #0x0
ffffff8040086e08:	54ffff01 	b.ne	ffffff8040086de8 <PrintString+0x24>  // b.any
ffffff8040086e0c:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040086e10:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086e14:	6b00003f 	cmp	w1, w0
ffffff8040086e18:	5400006a 	b.ge	ffffff8040086e24 <PrintString+0x60>  // b.tcont
ffffff8040086e1c:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086e20:	b9000fe0 	str	w0, [sp, #12]
ffffff8040086e24:	b9400be0 	ldr	w0, [sp, #8]
ffffff8040086e28:	7100001f 	cmp	w0, #0x0
ffffff8040086e2c:	54000440 	b.eq	ffffff8040086eb4 <PrintString+0xf0>  // b.none
ffffff8040086e30:	b9002fff 	str	wzr, [sp, #44]
ffffff8040086e34:	1400000c 	b	ffffff8040086e64 <PrintString+0xa0>
ffffff8040086e38:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086e3c:	f9400be1 	ldr	x1, [sp, #16]
ffffff8040086e40:	8b000021 	add	x1, x1, x0
ffffff8040086e44:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086e48:	f9400fe2 	ldr	x2, [sp, #24]
ffffff8040086e4c:	8b000040 	add	x0, x2, x0
ffffff8040086e50:	39400021 	ldrb	w1, [x1]
ffffff8040086e54:	39000001 	strb	w1, [x0]
ffffff8040086e58:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086e5c:	11000400 	add	w0, w0, #0x1
ffffff8040086e60:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086e64:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086e68:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086e6c:	6b00003f 	cmp	w1, w0
ffffff8040086e70:	54fffe4b 	b.lt	ffffff8040086e38 <PrintString+0x74>  // b.tstop
ffffff8040086e74:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086e78:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086e7c:	14000009 	b	ffffff8040086ea0 <PrintString+0xdc>
ffffff8040086e80:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086e84:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086e88:	8b000020 	add	x0, x1, x0
ffffff8040086e8c:	52800401 	mov	w1, #0x20                  	// #32
ffffff8040086e90:	39000001 	strb	w1, [x0]
ffffff8040086e94:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086e98:	11000400 	add	w0, w0, #0x1
ffffff8040086e9c:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086ea0:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086ea4:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086ea8:	6b00003f 	cmp	w1, w0
ffffff8040086eac:	54fffeab 	b.lt	ffffff8040086e80 <PrintString+0xbc>  // b.tstop
ffffff8040086eb0:	1400002a 	b	ffffff8040086f58 <PrintString+0x194>
ffffff8040086eb4:	b9002fff 	str	wzr, [sp, #44]
ffffff8040086eb8:	14000009 	b	ffffff8040086edc <PrintString+0x118>
ffffff8040086ebc:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086ec0:	f9400fe1 	ldr	x1, [sp, #24]
ffffff8040086ec4:	8b000020 	add	x0, x1, x0
ffffff8040086ec8:	52800401 	mov	w1, #0x20                  	// #32
ffffff8040086ecc:	39000001 	strb	w1, [x0]
ffffff8040086ed0:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086ed4:	11000400 	add	w0, w0, #0x1
ffffff8040086ed8:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086edc:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040086ee0:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086ee4:	4b000020 	sub	w0, w1, w0
ffffff8040086ee8:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086eec:	6b00003f 	cmp	w1, w0
ffffff8040086ef0:	54fffe6b 	b.lt	ffffff8040086ebc <PrintString+0xf8>  // b.tstop
ffffff8040086ef4:	b9400fe1 	ldr	w1, [sp, #12]
ffffff8040086ef8:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086efc:	4b000020 	sub	w0, w1, w0
ffffff8040086f00:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086f04:	14000011 	b	ffffff8040086f48 <PrintString+0x184>
ffffff8040086f08:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086f0c:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086f10:	4b000021 	sub	w1, w1, w0
ffffff8040086f14:	b9402be0 	ldr	w0, [sp, #40]
ffffff8040086f18:	0b000020 	add	w0, w1, w0
ffffff8040086f1c:	93407c00 	sxtw	x0, w0
ffffff8040086f20:	f9400be1 	ldr	x1, [sp, #16]
ffffff8040086f24:	8b000021 	add	x1, x1, x0
ffffff8040086f28:	b9802fe0 	ldrsw	x0, [sp, #44]
ffffff8040086f2c:	f9400fe2 	ldr	x2, [sp, #24]
ffffff8040086f30:	8b000040 	add	x0, x2, x0
ffffff8040086f34:	39400021 	ldrb	w1, [x1]
ffffff8040086f38:	39000001 	strb	w1, [x0]
ffffff8040086f3c:	b9402fe0 	ldr	w0, [sp, #44]
ffffff8040086f40:	11000400 	add	w0, w0, #0x1
ffffff8040086f44:	b9002fe0 	str	w0, [sp, #44]
ffffff8040086f48:	b9402fe1 	ldr	w1, [sp, #44]
ffffff8040086f4c:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086f50:	6b00003f 	cmp	w1, w0
ffffff8040086f54:	54fffdab 	b.lt	ffffff8040086f08 <PrintString+0x144>  // b.tstop
ffffff8040086f58:	b9400fe0 	ldr	w0, [sp, #12]
ffffff8040086f5c:	9100c3ff 	add	sp, sp, #0x30
ffffff8040086f60:	d65f03c0 	ret

ffffff8040086f64 <PrintNum>:
ffffff8040086f64:	d10143ff 	sub	sp, sp, #0x50
ffffff8040086f68:	f90017e0 	str	x0, [sp, #40]
ffffff8040086f6c:	f90013e1 	str	x1, [sp, #32]
ffffff8040086f70:	b9001fe2 	str	w2, [sp, #28]
ffffff8040086f74:	b9001be3 	str	w3, [sp, #24]
ffffff8040086f78:	b90017e4 	str	w4, [sp, #20]
ffffff8040086f7c:	b90013e5 	str	w5, [sp, #16]
ffffff8040086f80:	39003fe6 	strb	w6, [sp, #15]
ffffff8040086f84:	b9000be7 	str	w7, [sp, #8]
ffffff8040086f88:	b9003bff 	str	wzr, [sp, #56]
ffffff8040086f8c:	f94017e0 	ldr	x0, [sp, #40]
ffffff8040086f90:	f90027e0 	str	x0, [sp, #72]
ffffff8040086f94:	b9801fe1 	ldrsw	x1, [sp, #28]
ffffff8040086f98:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040086f9c:	9ac10802 	udiv	x2, x0, x1
ffffff8040086fa0:	9b017c41 	mul	x1, x2, x1
ffffff8040086fa4:	cb010000 	sub	x0, x0, x1
ffffff8040086fa8:	b90037e0 	str	w0, [sp, #52]
ffffff8040086fac:	b94037e0 	ldr	w0, [sp, #52]
ffffff8040086fb0:	7100241f 	cmp	w0, #0x9
ffffff8040086fb4:	5400014c 	b.gt	ffffff8040086fdc <PrintNum+0x78>
ffffff8040086fb8:	b94037e0 	ldr	w0, [sp, #52]
ffffff8040086fbc:	12001c01 	and	w1, w0, #0xff
ffffff8040086fc0:	f94027e0 	ldr	x0, [sp, #72]
ffffff8040086fc4:	91000402 	add	x2, x0, #0x1
ffffff8040086fc8:	f90027e2 	str	x2, [sp, #72]
ffffff8040086fcc:	1100c021 	add	w1, w1, #0x30
ffffff8040086fd0:	12001c21 	and	w1, w1, #0xff
ffffff8040086fd4:	39000001 	strb	w1, [x0]
ffffff8040086fd8:	14000015 	b	ffffff804008702c <PrintNum+0xc8>
ffffff8040086fdc:	b9400be0 	ldr	w0, [sp, #8]
ffffff8040086fe0:	7100001f 	cmp	w0, #0x0
ffffff8040086fe4:	54000140 	b.eq	ffffff804008700c <PrintNum+0xa8>  // b.none
ffffff8040086fe8:	b94037e0 	ldr	w0, [sp, #52]
ffffff8040086fec:	12001c01 	and	w1, w0, #0xff
ffffff8040086ff0:	f94027e0 	ldr	x0, [sp, #72]
ffffff8040086ff4:	91000402 	add	x2, x0, #0x1
ffffff8040086ff8:	f90027e2 	str	x2, [sp, #72]
ffffff8040086ffc:	1100dc21 	add	w1, w1, #0x37
ffffff8040087000:	12001c21 	and	w1, w1, #0xff
ffffff8040087004:	39000001 	strb	w1, [x0]
ffffff8040087008:	14000009 	b	ffffff804008702c <PrintNum+0xc8>
ffffff804008700c:	b94037e0 	ldr	w0, [sp, #52]
ffffff8040087010:	12001c01 	and	w1, w0, #0xff
ffffff8040087014:	f94027e0 	ldr	x0, [sp, #72]
ffffff8040087018:	91000402 	add	x2, x0, #0x1
ffffff804008701c:	f90027e2 	str	x2, [sp, #72]
ffffff8040087020:	11015c21 	add	w1, w1, #0x57
ffffff8040087024:	12001c21 	and	w1, w1, #0xff
ffffff8040087028:	39000001 	strb	w1, [x0]
ffffff804008702c:	b9801fe0 	ldrsw	x0, [sp, #28]
ffffff8040087030:	f94013e1 	ldr	x1, [sp, #32]
ffffff8040087034:	9ac00820 	udiv	x0, x1, x0
ffffff8040087038:	f90013e0 	str	x0, [sp, #32]
ffffff804008703c:	f94013e0 	ldr	x0, [sp, #32]
ffffff8040087040:	f100001f 	cmp	x0, #0x0
ffffff8040087044:	54fffa81 	b.ne	ffffff8040086f94 <PrintNum+0x30>  // b.any
ffffff8040087048:	b9401be0 	ldr	w0, [sp, #24]
ffffff804008704c:	7100001f 	cmp	w0, #0x0
ffffff8040087050:	540000c0 	b.eq	ffffff8040087068 <PrintNum+0x104>  // b.none
ffffff8040087054:	f94027e0 	ldr	x0, [sp, #72]
ffffff8040087058:	91000401 	add	x1, x0, #0x1
ffffff804008705c:	f90027e1 	str	x1, [sp, #72]
ffffff8040087060:	528005a1 	mov	w1, #0x2d                  	// #45
ffffff8040087064:	39000001 	strb	w1, [x0]
ffffff8040087068:	f94027e1 	ldr	x1, [sp, #72]
ffffff804008706c:	f94017e0 	ldr	x0, [sp, #40]
ffffff8040087070:	cb000020 	sub	x0, x1, x0
ffffff8040087074:	b9003be0 	str	w0, [sp, #56]
ffffff8040087078:	b94017e1 	ldr	w1, [sp, #20]
ffffff804008707c:	b9403be0 	ldr	w0, [sp, #56]
ffffff8040087080:	6b00003f 	cmp	w1, w0
ffffff8040087084:	5400006a 	b.ge	ffffff8040087090 <PrintNum+0x12c>  // b.tcont
ffffff8040087088:	b9403be0 	ldr	w0, [sp, #56]
ffffff804008708c:	b90017e0 	str	w0, [sp, #20]
ffffff8040087090:	b94013e0 	ldr	w0, [sp, #16]
ffffff8040087094:	7100001f 	cmp	w0, #0x0
ffffff8040087098:	54000060 	b.eq	ffffff80400870a4 <PrintNum+0x140>  // b.none
ffffff804008709c:	52800400 	mov	w0, #0x20                  	// #32
ffffff80400870a0:	39003fe0 	strb	w0, [sp, #15]
ffffff80400870a4:	b9401be0 	ldr	w0, [sp, #24]
ffffff80400870a8:	7100001f 	cmp	w0, #0x0
ffffff80400870ac:	540003e0 	b.eq	ffffff8040087128 <PrintNum+0x1c4>  // b.none
ffffff80400870b0:	b94013e0 	ldr	w0, [sp, #16]
ffffff80400870b4:	7100001f 	cmp	w0, #0x0
ffffff80400870b8:	54000381 	b.ne	ffffff8040087128 <PrintNum+0x1c4>  // b.any
ffffff80400870bc:	39403fe0 	ldrb	w0, [sp, #15]
ffffff80400870c0:	7100c01f 	cmp	w0, #0x30
ffffff80400870c4:	54000321 	b.ne	ffffff8040087128 <PrintNum+0x1c4>  // b.any
ffffff80400870c8:	b9403be0 	ldr	w0, [sp, #56]
ffffff80400870cc:	51000400 	sub	w0, w0, #0x1
ffffff80400870d0:	b90047e0 	str	w0, [sp, #68]
ffffff80400870d4:	14000009 	b	ffffff80400870f8 <PrintNum+0x194>
ffffff80400870d8:	b98047e0 	ldrsw	x0, [sp, #68]
ffffff80400870dc:	f94017e1 	ldr	x1, [sp, #40]
ffffff80400870e0:	8b000020 	add	x0, x1, x0
ffffff80400870e4:	39403fe1 	ldrb	w1, [sp, #15]
ffffff80400870e8:	39000001 	strb	w1, [x0]
ffffff80400870ec:	b94047e0 	ldr	w0, [sp, #68]
ffffff80400870f0:	11000400 	add	w0, w0, #0x1
ffffff80400870f4:	b90047e0 	str	w0, [sp, #68]
ffffff80400870f8:	b94017e0 	ldr	w0, [sp, #20]
ffffff80400870fc:	51000400 	sub	w0, w0, #0x1
ffffff8040087100:	b94047e1 	ldr	w1, [sp, #68]
ffffff8040087104:	6b00003f 	cmp	w1, w0
ffffff8040087108:	54fffe8b 	b.lt	ffffff80400870d8 <PrintNum+0x174>  // b.tstop
ffffff804008710c:	b98017e0 	ldrsw	x0, [sp, #20]
ffffff8040087110:	d1000400 	sub	x0, x0, #0x1
ffffff8040087114:	f94017e1 	ldr	x1, [sp, #40]
ffffff8040087118:	8b000020 	add	x0, x1, x0
ffffff804008711c:	528005a1 	mov	w1, #0x2d                  	// #45
ffffff8040087120:	39000001 	strb	w1, [x0]
ffffff8040087124:	14000010 	b	ffffff8040087164 <PrintNum+0x200>
ffffff8040087128:	b9403be0 	ldr	w0, [sp, #56]
ffffff804008712c:	b90047e0 	str	w0, [sp, #68]
ffffff8040087130:	14000009 	b	ffffff8040087154 <PrintNum+0x1f0>
ffffff8040087134:	b98047e0 	ldrsw	x0, [sp, #68]
ffffff8040087138:	f94017e1 	ldr	x1, [sp, #40]
ffffff804008713c:	8b000020 	add	x0, x1, x0
ffffff8040087140:	39403fe1 	ldrb	w1, [sp, #15]
ffffff8040087144:	39000001 	strb	w1, [x0]
ffffff8040087148:	b94047e0 	ldr	w0, [sp, #68]
ffffff804008714c:	11000400 	add	w0, w0, #0x1
ffffff8040087150:	b90047e0 	str	w0, [sp, #68]
ffffff8040087154:	b94047e1 	ldr	w1, [sp, #68]
ffffff8040087158:	b94017e0 	ldr	w0, [sp, #20]
ffffff804008715c:	6b00003f 	cmp	w1, w0
ffffff8040087160:	54fffeab 	b.lt	ffffff8040087134 <PrintNum+0x1d0>  // b.tstop
ffffff8040087164:	b90043ff 	str	wzr, [sp, #64]
ffffff8040087168:	b94013e0 	ldr	w0, [sp, #16]
ffffff804008716c:	7100001f 	cmp	w0, #0x0
ffffff8040087170:	540000a0 	b.eq	ffffff8040087184 <PrintNum+0x220>  // b.none
ffffff8040087174:	b9403be0 	ldr	w0, [sp, #56]
ffffff8040087178:	51000400 	sub	w0, w0, #0x1
ffffff804008717c:	b9003fe0 	str	w0, [sp, #60]
ffffff8040087180:	1400001d 	b	ffffff80400871f4 <PrintNum+0x290>
ffffff8040087184:	b94017e0 	ldr	w0, [sp, #20]
ffffff8040087188:	51000400 	sub	w0, w0, #0x1
ffffff804008718c:	b9003fe0 	str	w0, [sp, #60]
ffffff8040087190:	14000019 	b	ffffff80400871f4 <PrintNum+0x290>
ffffff8040087194:	b98043e0 	ldrsw	x0, [sp, #64]
ffffff8040087198:	f94017e1 	ldr	x1, [sp, #40]
ffffff804008719c:	8b000020 	add	x0, x1, x0
ffffff80400871a0:	39400000 	ldrb	w0, [x0]
ffffff80400871a4:	3900cfe0 	strb	w0, [sp, #51]
ffffff80400871a8:	b9803fe0 	ldrsw	x0, [sp, #60]
ffffff80400871ac:	f94017e1 	ldr	x1, [sp, #40]
ffffff80400871b0:	8b000021 	add	x1, x1, x0
ffffff80400871b4:	b98043e0 	ldrsw	x0, [sp, #64]
ffffff80400871b8:	f94017e2 	ldr	x2, [sp, #40]
ffffff80400871bc:	8b000040 	add	x0, x2, x0
ffffff80400871c0:	39400021 	ldrb	w1, [x1]
ffffff80400871c4:	39000001 	strb	w1, [x0]
ffffff80400871c8:	b9803fe0 	ldrsw	x0, [sp, #60]
ffffff80400871cc:	f94017e1 	ldr	x1, [sp, #40]
ffffff80400871d0:	8b000020 	add	x0, x1, x0
ffffff80400871d4:	3940cfe1 	ldrb	w1, [sp, #51]
ffffff80400871d8:	39000001 	strb	w1, [x0]
ffffff80400871dc:	b94043e0 	ldr	w0, [sp, #64]
ffffff80400871e0:	11000400 	add	w0, w0, #0x1
ffffff80400871e4:	b90043e0 	str	w0, [sp, #64]
ffffff80400871e8:	b9403fe0 	ldr	w0, [sp, #60]
ffffff80400871ec:	51000400 	sub	w0, w0, #0x1
ffffff80400871f0:	b9003fe0 	str	w0, [sp, #60]
ffffff80400871f4:	b9403fe1 	ldr	w1, [sp, #60]
ffffff80400871f8:	b94043e0 	ldr	w0, [sp, #64]
ffffff80400871fc:	6b00003f 	cmp	w1, w0
ffffff8040087200:	54fffcac 	b.gt	ffffff8040087194 <PrintNum+0x230>
ffffff8040087204:	b94017e0 	ldr	w0, [sp, #20]
ffffff8040087208:	910143ff 	add	sp, sp, #0x50
ffffff804008720c:	d65f03c0 	ret

ffffff8040087210 <myoutput>:
ffffff8040087210:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040087214:	910003fd 	mov	x29, sp
ffffff8040087218:	f90017a0 	str	x0, [x29, #40]
ffffff804008721c:	f90013a1 	str	x1, [x29, #32]
ffffff8040087220:	b9001fa2 	str	w2, [x29, #28]
ffffff8040087224:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040087228:	7100041f 	cmp	w0, #0x1
ffffff804008722c:	540000a1 	b.ne	ffffff8040087240 <myoutput+0x30>  // b.any
ffffff8040087230:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087234:	39400000 	ldrb	w0, [x0]
ffffff8040087238:	7100001f 	cmp	w0, #0x0
ffffff804008723c:	54000200 	b.eq	ffffff804008727c <myoutput+0x6c>  // b.none
ffffff8040087240:	b9003fbf 	str	wzr, [x29, #60]
ffffff8040087244:	14000009 	b	ffffff8040087268 <myoutput+0x58>
ffffff8040087248:	b9803fa0 	ldrsw	x0, [x29, #60]
ffffff804008724c:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040087250:	8b000020 	add	x0, x1, x0
ffffff8040087254:	39400000 	ldrb	w0, [x0]
ffffff8040087258:	97ffed73 	bl	ffffff8040082824 <uart_send>
ffffff804008725c:	b9403fa0 	ldr	w0, [x29, #60]
ffffff8040087260:	11000400 	add	w0, w0, #0x1
ffffff8040087264:	b9003fa0 	str	w0, [x29, #60]
ffffff8040087268:	b9403fa1 	ldr	w1, [x29, #60]
ffffff804008726c:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040087270:	6b00003f 	cmp	w1, w0
ffffff8040087274:	54fffeab 	b.lt	ffffff8040087248 <myoutput+0x38>  // b.tstop
ffffff8040087278:	14000002 	b	ffffff8040087280 <myoutput+0x70>
ffffff804008727c:	d503201f 	nop
ffffff8040087280:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040087284:	d65f03c0 	ret

ffffff8040087288 <printf>:
ffffff8040087288:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
ffffff804008728c:	910003fd 	mov	x29, sp
ffffff8040087290:	f9001fa0 	str	x0, [x29, #56]
ffffff8040087294:	f90037a1 	str	x1, [x29, #104]
ffffff8040087298:	f9003ba2 	str	x2, [x29, #112]
ffffff804008729c:	f9003fa3 	str	x3, [x29, #120]
ffffff80400872a0:	f90043a4 	str	x4, [x29, #128]
ffffff80400872a4:	f90047a5 	str	x5, [x29, #136]
ffffff80400872a8:	f9004ba6 	str	x6, [x29, #144]
ffffff80400872ac:	f9004fa7 	str	x7, [x29, #152]
ffffff80400872b0:	b00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400872b4:	91246000 	add	x0, x0, #0x918
ffffff80400872b8:	940001cc 	bl	ffffff80400879e8 <spin_lock>
ffffff80400872bc:	910283a0 	add	x0, x29, #0xa0
ffffff80400872c0:	f90023a0 	str	x0, [x29, #64]
ffffff80400872c4:	910283a0 	add	x0, x29, #0xa0
ffffff80400872c8:	f90027a0 	str	x0, [x29, #72]
ffffff80400872cc:	910183a0 	add	x0, x29, #0x60
ffffff80400872d0:	f9002ba0 	str	x0, [x29, #80]
ffffff80400872d4:	128006e0 	mov	w0, #0xffffffc8            	// #-56
ffffff80400872d8:	b9005ba0 	str	w0, [x29, #88]
ffffff80400872dc:	b9005fbf 	str	wzr, [x29, #92]
ffffff80400872e0:	910043a2 	add	x2, x29, #0x10
ffffff80400872e4:	910103a3 	add	x3, x29, #0x40
ffffff80400872e8:	a9400460 	ldp	x0, x1, [x3]
ffffff80400872ec:	a9000440 	stp	x0, x1, [x2]
ffffff80400872f0:	a9410460 	ldp	x0, x1, [x3, #16]
ffffff80400872f4:	a9010440 	stp	x0, x1, [x2, #16]
ffffff80400872f8:	910043a1 	add	x1, x29, #0x10
ffffff80400872fc:	90000000 	adrp	x0, ffffff8040087000 <PrintNum+0x9c>
ffffff8040087300:	91084000 	add	x0, x0, #0x210
ffffff8040087304:	aa0103e3 	mov	x3, x1
ffffff8040087308:	f9401fa2 	ldr	x2, [x29, #56]
ffffff804008730c:	d2800001 	mov	x1, #0x0                   	// #0
ffffff8040087310:	97fffb14 	bl	ffffff8040085f60 <lp_Print>
ffffff8040087314:	b00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff8040087318:	91246000 	add	x0, x0, #0x918
ffffff804008731c:	940001c3 	bl	ffffff8040087a28 <spin_unlock>
ffffff8040087320:	d503201f 	nop
ffffff8040087324:	a8ca7bfd 	ldp	x29, x30, [sp], #160
ffffff8040087328:	d65f03c0 	ret

ffffff804008732c <_panic>:
ffffff804008732c:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
ffffff8040087330:	910003fd 	mov	x29, sp
ffffff8040087334:	f90027a0 	str	x0, [x29, #72]
ffffff8040087338:	b90047a1 	str	w1, [x29, #68]
ffffff804008733c:	f9001fa2 	str	x2, [x29, #56]
ffffff8040087340:	f9003fa3 	str	x3, [x29, #120]
ffffff8040087344:	f90043a4 	str	x4, [x29, #128]
ffffff8040087348:	f90047a5 	str	x5, [x29, #136]
ffffff804008734c:	f9004ba6 	str	x6, [x29, #144]
ffffff8040087350:	f9004fa7 	str	x7, [x29, #152]
ffffff8040087354:	910283a0 	add	x0, x29, #0xa0
ffffff8040087358:	f9002ba0 	str	x0, [x29, #80]
ffffff804008735c:	910283a0 	add	x0, x29, #0xa0
ffffff8040087360:	f9002fa0 	str	x0, [x29, #88]
ffffff8040087364:	9101c3a0 	add	x0, x29, #0x70
ffffff8040087368:	f90033a0 	str	x0, [x29, #96]
ffffff804008736c:	128004e0 	mov	w0, #0xffffffd8            	// #-40
ffffff8040087370:	b9006ba0 	str	w0, [x29, #104]
ffffff8040087374:	b9006fbf 	str	wzr, [x29, #108]
ffffff8040087378:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008737c:	91076000 	add	x0, x0, #0x1d8
ffffff8040087380:	b94047a2 	ldr	w2, [x29, #68]
ffffff8040087384:	f94027a1 	ldr	x1, [x29, #72]
ffffff8040087388:	97ffffc0 	bl	ffffff8040087288 <printf>
ffffff804008738c:	910043a2 	add	x2, x29, #0x10
ffffff8040087390:	910143a3 	add	x3, x29, #0x50
ffffff8040087394:	a9400460 	ldp	x0, x1, [x3]
ffffff8040087398:	a9000440 	stp	x0, x1, [x2]
ffffff804008739c:	a9410460 	ldp	x0, x1, [x3, #16]
ffffff80400873a0:	a9010440 	stp	x0, x1, [x2, #16]
ffffff80400873a4:	910043a1 	add	x1, x29, #0x10
ffffff80400873a8:	90000000 	adrp	x0, ffffff8040087000 <PrintNum+0x9c>
ffffff80400873ac:	91084000 	add	x0, x0, #0x210
ffffff80400873b0:	aa0103e3 	mov	x3, x1
ffffff80400873b4:	f9401fa2 	ldr	x2, [x29, #56]
ffffff80400873b8:	d2800001 	mov	x1, #0x0                   	// #0
ffffff80400873bc:	97fffae9 	bl	ffffff8040085f60 <lp_Print>
ffffff80400873c0:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400873c4:	9107c000 	add	x0, x0, #0x1f0
ffffff80400873c8:	97ffffb0 	bl	ffffff8040087288 <printf>
ffffff80400873cc:	14000000 	b	ffffff80400873cc <_panic+0xa0>

ffffff80400873d0 <smc_call>:
ffffff80400873d0:	d100c3ff 	sub	sp, sp, #0x30
ffffff80400873d4:	f90017e0 	str	x0, [sp, #40]
ffffff80400873d8:	f90013e1 	str	x1, [sp, #32]
ffffff80400873dc:	f9000fe2 	str	x2, [sp, #24]
ffffff80400873e0:	f9000be3 	str	x3, [sp, #16]
ffffff80400873e4:	f90007e4 	str	x4, [sp, #8]
ffffff80400873e8:	f94017e0 	ldr	x0, [sp, #40]
ffffff80400873ec:	f94013e1 	ldr	x1, [sp, #32]
ffffff80400873f0:	f9400fe2 	ldr	x2, [sp, #24]
ffffff80400873f4:	f9400be3 	ldr	x3, [sp, #16]
ffffff80400873f8:	d4000003 	smc	#0x0
ffffff80400873fc:	f94007e4 	ldr	x4, [sp, #8]
ffffff8040087400:	f100009f 	cmp	x4, #0x0
ffffff8040087404:	54000180 	b.eq	ffffff8040087434 <smc_call+0x64>  // b.none
ffffff8040087408:	aa0003e5 	mov	x5, x0
ffffff804008740c:	f94007e4 	ldr	x4, [sp, #8]
ffffff8040087410:	f9000085 	str	x5, [x4]
ffffff8040087414:	aa0103e4 	mov	x4, x1
ffffff8040087418:	f94007e1 	ldr	x1, [sp, #8]
ffffff804008741c:	f9000424 	str	x4, [x1, #8]
ffffff8040087420:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040087424:	f9000822 	str	x2, [x1, #16]
ffffff8040087428:	aa0303e2 	mov	x2, x3
ffffff804008742c:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040087430:	f9000c22 	str	x2, [x1, #24]
ffffff8040087434:	9100c3ff 	add	sp, sp, #0x30
ffffff8040087438:	d65f03c0 	ret

ffffff804008743c <psci_cpu_on>:
ffffff804008743c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040087440:	910003fd 	mov	x29, sp
ffffff8040087444:	b9001fa0 	str	w0, [x29, #28]
ffffff8040087448:	b9001ba1 	str	w1, [x29, #24]
ffffff804008744c:	b9401fa0 	ldr	w0, [x29, #28]
ffffff8040087450:	b9401ba1 	ldr	w1, [x29, #24]
ffffff8040087454:	d2800004 	mov	x4, #0x0                   	// #0
ffffff8040087458:	d2800003 	mov	x3, #0x0                   	// #0
ffffff804008745c:	aa0103e2 	mov	x2, x1
ffffff8040087460:	aa0003e1 	mov	x1, x0
ffffff8040087464:	d2800060 	mov	x0, #0x3                   	// #3
ffffff8040087468:	f2b88000 	movk	x0, #0xc400, lsl #16
ffffff804008746c:	97ffffd9 	bl	ffffff80400873d0 <smc_call>
ffffff8040087470:	b9002fa0 	str	w0, [x29, #44]
ffffff8040087474:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040087478:	7100001f 	cmp	w0, #0x0
ffffff804008747c:	54000061 	b.ne	ffffff8040087488 <psci_cpu_on+0x4c>  // b.any
ffffff8040087480:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040087484:	14000002 	b	ffffff804008748c <psci_cpu_on+0x50>
ffffff8040087488:	12800040 	mov	w0, #0xfffffffd            	// #-3
ffffff804008748c:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040087490:	d65f03c0 	ret

ffffff8040087494 <sched_yield>:
ffffff8040087494:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040087498:	910003fd 	mov	x29, sp
ffffff804008749c:	b9002fbf 	str	wzr, [x29, #44]
ffffff80400874a0:	97fff291 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff80400874a4:	12001c00 	and	w0, w0, #0xff
ffffff80400874a8:	b90023a0 	str	w0, [x29, #32]
ffffff80400874ac:	52800040 	mov	w0, #0x2                   	// #2
ffffff80400874b0:	b90027a0 	str	w0, [x29, #36]
ffffff80400874b4:	14000137 	b	ffffff8040087990 <sched_yield+0x4fc>
ffffff80400874b8:	b9002fbf 	str	wzr, [x29, #44]
ffffff80400874bc:	b9002bbf 	str	wzr, [x29, #40]
ffffff80400874c0:	14000129 	b	ffffff8040087964 <sched_yield+0x4d0>
ffffff80400874c4:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff80400874c8:	9118e000 	add	x0, x0, #0x638
ffffff80400874cc:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400874d0:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400874d4:	f9000fa0 	str	x0, [x29, #24]
ffffff80400874d8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400874dc:	b9412800 	ldr	w0, [x0, #296]
ffffff80400874e0:	7100001f 	cmp	w0, #0x0
ffffff80400874e4:	54000201 	b.ne	ffffff8040087524 <sched_yield+0x90>  // b.any
ffffff80400874e8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400874ec:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400874f0:	f100001f 	cmp	x0, #0x0
ffffff80400874f4:	540000c0 	b.eq	ffffff804008750c <sched_yield+0x78>  // b.none
ffffff80400874f8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400874fc:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087500:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087504:	f940a021 	ldr	x1, [x1, #320]
ffffff8040087508:	f900a001 	str	x1, [x0, #320]
ffffff804008750c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087510:	f940a000 	ldr	x0, [x0, #320]
ffffff8040087514:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087518:	f9409c21 	ldr	x1, [x1, #312]
ffffff804008751c:	f9000001 	str	x1, [x0]
ffffff8040087520:	14000111 	b	ffffff8040087964 <sched_yield+0x4d0>
ffffff8040087524:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087528:	b9412800 	ldr	w0, [x0, #296]
ffffff804008752c:	71000c1f 	cmp	w0, #0x3
ffffff8040087530:	54000ae1 	b.ne	ffffff804008768c <sched_yield+0x1f8>  // b.any
ffffff8040087534:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087538:	b9414c01 	ldr	w1, [x0, #332]
ffffff804008753c:	b94023a0 	ldr	w0, [x29, #32]
ffffff8040087540:	6b00003f 	cmp	w1, w0
ffffff8040087544:	54000a41 	b.ne	ffffff804008768c <sched_yield+0x1f8>  // b.any
ffffff8040087548:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008754c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087550:	f100001f 	cmp	x0, #0x0
ffffff8040087554:	540000c0 	b.eq	ffffff804008756c <sched_yield+0xd8>  // b.none
ffffff8040087558:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008755c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087560:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087564:	f940a021 	ldr	x1, [x1, #320]
ffffff8040087568:	f900a001 	str	x1, [x0, #320]
ffffff804008756c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087570:	f940a000 	ldr	x0, [x0, #320]
ffffff8040087574:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087578:	f9409c21 	ldr	x1, [x1, #312]
ffffff804008757c:	f9000001 	str	x1, [x0]
ffffff8040087580:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087584:	9118e000 	add	x0, x0, #0x638
ffffff8040087588:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008758c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087590:	f100001f 	cmp	x0, #0x0
ffffff8040087594:	540003c0 	b.eq	ffffff804008760c <sched_yield+0x178>  // b.none
ffffff8040087598:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff804008759c:	9118e000 	add	x0, x0, #0x638
ffffff80400875a0:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400875a4:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff80400875a8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875ac:	f9009c01 	str	x1, [x0, #312]
ffffff80400875b0:	14000006 	b	ffffff80400875c8 <sched_yield+0x134>
ffffff80400875b4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875b8:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400875bc:	f9409c01 	ldr	x1, [x0, #312]
ffffff80400875c0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875c4:	f9009c01 	str	x1, [x0, #312]
ffffff80400875c8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875cc:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400875d0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400875d4:	f100001f 	cmp	x0, #0x0
ffffff80400875d8:	54fffee1 	b.ne	ffffff80400875b4 <sched_yield+0x120>  // b.any
ffffff80400875dc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875e0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400875e4:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400875e8:	f9009c01 	str	x1, [x0, #312]
ffffff80400875ec:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875f0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400875f4:	9104e001 	add	x1, x0, #0x138
ffffff80400875f8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400875fc:	f900a001 	str	x1, [x0, #320]
ffffff8040087600:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087604:	f9009c1f 	str	xzr, [x0, #312]
ffffff8040087608:	1400001e 	b	ffffff8040087680 <sched_yield+0x1ec>
ffffff804008760c:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087610:	9118e000 	add	x0, x0, #0x638
ffffff8040087614:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087618:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff804008761c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087620:	f9009c01 	str	x1, [x0, #312]
ffffff8040087624:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087628:	f9409c00 	ldr	x0, [x0, #312]
ffffff804008762c:	f100001f 	cmp	x0, #0x0
ffffff8040087630:	54000100 	b.eq	ffffff8040087650 <sched_yield+0x1bc>  // b.none
ffffff8040087634:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087638:	9118e000 	add	x0, x0, #0x638
ffffff804008763c:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087640:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087644:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087648:	9104e021 	add	x1, x1, #0x138
ffffff804008764c:	f900a001 	str	x1, [x0, #320]
ffffff8040087650:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087654:	9118e000 	add	x0, x0, #0x638
ffffff8040087658:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008765c:	f9400fa2 	ldr	x2, [x29, #24]
ffffff8040087660:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff8040087664:	b98027a0 	ldrsw	x0, [x29, #36]
ffffff8040087668:	d37df001 	lsl	x1, x0, #3
ffffff804008766c:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087670:	9118e000 	add	x0, x0, #0x638
ffffff8040087674:	8b000021 	add	x1, x1, x0
ffffff8040087678:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008767c:	f900a001 	str	x1, [x0, #320]
ffffff8040087680:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087684:	97fff53e 	bl	ffffff8040084b7c <env_run>
ffffff8040087688:	140000c6 	b	ffffff80400879a0 <sched_yield+0x50c>
ffffff804008768c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087690:	b9412800 	ldr	w0, [x0, #296]
ffffff8040087694:	7100081f 	cmp	w0, #0x2
ffffff8040087698:	540000a0 	b.eq	ffffff80400876ac <sched_yield+0x218>  // b.none
ffffff804008769c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400876a0:	b9412800 	ldr	w0, [x0, #296]
ffffff80400876a4:	71000c1f 	cmp	w0, #0x3
ffffff80400876a8:	54000bc1 	b.ne	ffffff8040087820 <sched_yield+0x38c>  // b.any
ffffff80400876ac:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400876b0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400876b4:	f100001f 	cmp	x0, #0x0
ffffff80400876b8:	540000c0 	b.eq	ffffff80400876d0 <sched_yield+0x23c>  // b.none
ffffff80400876bc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400876c0:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400876c4:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400876c8:	f940a021 	ldr	x1, [x1, #320]
ffffff80400876cc:	f900a001 	str	x1, [x0, #320]
ffffff80400876d0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400876d4:	f940a000 	ldr	x0, [x0, #320]
ffffff80400876d8:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400876dc:	f9409c21 	ldr	x1, [x1, #312]
ffffff80400876e0:	f9000001 	str	x1, [x0]
ffffff80400876e4:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff80400876e8:	9118e000 	add	x0, x0, #0x638
ffffff80400876ec:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400876f0:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400876f4:	f100001f 	cmp	x0, #0x0
ffffff80400876f8:	540003c0 	b.eq	ffffff8040087770 <sched_yield+0x2dc>  // b.none
ffffff80400876fc:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087700:	9118e000 	add	x0, x0, #0x638
ffffff8040087704:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087708:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff804008770c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087710:	f9009c01 	str	x1, [x0, #312]
ffffff8040087714:	14000006 	b	ffffff804008772c <sched_yield+0x298>
ffffff8040087718:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008771c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087720:	f9409c01 	ldr	x1, [x0, #312]
ffffff8040087724:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087728:	f9009c01 	str	x1, [x0, #312]
ffffff804008772c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087730:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087734:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087738:	f100001f 	cmp	x0, #0x0
ffffff804008773c:	54fffee1 	b.ne	ffffff8040087718 <sched_yield+0x284>  // b.any
ffffff8040087740:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087744:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087748:	f9400fa1 	ldr	x1, [x29, #24]
ffffff804008774c:	f9009c01 	str	x1, [x0, #312]
ffffff8040087750:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087754:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087758:	9104e001 	add	x1, x0, #0x138
ffffff804008775c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087760:	f900a001 	str	x1, [x0, #320]
ffffff8040087764:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087768:	f9009c1f 	str	xzr, [x0, #312]
ffffff804008776c:	1400001e 	b	ffffff80400877e4 <sched_yield+0x350>
ffffff8040087770:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087774:	9118e000 	add	x0, x0, #0x638
ffffff8040087778:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008777c:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040087780:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087784:	f9009c01 	str	x1, [x0, #312]
ffffff8040087788:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008778c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087790:	f100001f 	cmp	x0, #0x0
ffffff8040087794:	54000100 	b.eq	ffffff80400877b4 <sched_yield+0x320>  // b.none
ffffff8040087798:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff804008779c:	9118e000 	add	x0, x0, #0x638
ffffff80400877a0:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400877a4:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400877a8:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400877ac:	9104e021 	add	x1, x1, #0x138
ffffff80400877b0:	f900a001 	str	x1, [x0, #320]
ffffff80400877b4:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff80400877b8:	9118e000 	add	x0, x0, #0x638
ffffff80400877bc:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400877c0:	f9400fa2 	ldr	x2, [x29, #24]
ffffff80400877c4:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff80400877c8:	b98027a0 	ldrsw	x0, [x29, #36]
ffffff80400877cc:	d37df001 	lsl	x1, x0, #3
ffffff80400877d0:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff80400877d4:	9118e000 	add	x0, x0, #0x638
ffffff80400877d8:	8b000021 	add	x1, x1, x0
ffffff80400877dc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400877e0:	f900a001 	str	x1, [x0, #320]
ffffff80400877e4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400877e8:	b9412000 	ldr	w0, [x0, #288]
ffffff80400877ec:	b9402fa1 	ldr	w1, [x29, #44]
ffffff80400877f0:	6b00003f 	cmp	w1, w0
ffffff80400877f4:	54000c60 	b.eq	ffffff8040087980 <sched_yield+0x4ec>  // b.none
ffffff80400877f8:	b9402ba0 	ldr	w0, [x29, #40]
ffffff80400877fc:	7100001f 	cmp	w0, #0x0
ffffff8040087800:	54000b21 	b.ne	ffffff8040087964 <sched_yield+0x4d0>  // b.any
ffffff8040087804:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040087808:	11000400 	add	w0, w0, #0x1
ffffff804008780c:	b9002ba0 	str	w0, [x29, #40]
ffffff8040087810:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087814:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087818:	b9002fa0 	str	w0, [x29, #44]
ffffff804008781c:	14000052 	b	ffffff8040087964 <sched_yield+0x4d0>
ffffff8040087820:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087824:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087828:	f100001f 	cmp	x0, #0x0
ffffff804008782c:	540000c0 	b.eq	ffffff8040087844 <sched_yield+0x3b0>  // b.none
ffffff8040087830:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087834:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087838:	f9400fa1 	ldr	x1, [x29, #24]
ffffff804008783c:	f940a021 	ldr	x1, [x1, #320]
ffffff8040087840:	f900a001 	str	x1, [x0, #320]
ffffff8040087844:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087848:	f940a000 	ldr	x0, [x0, #320]
ffffff804008784c:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087850:	f9409c21 	ldr	x1, [x1, #312]
ffffff8040087854:	f9000001 	str	x1, [x0]
ffffff8040087858:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff804008785c:	9118e000 	add	x0, x0, #0x638
ffffff8040087860:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087864:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087868:	f100001f 	cmp	x0, #0x0
ffffff804008786c:	540003c0 	b.eq	ffffff80400878e4 <sched_yield+0x450>  // b.none
ffffff8040087870:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087874:	9118e000 	add	x0, x0, #0x638
ffffff8040087878:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff804008787c:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040087880:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087884:	f9009c01 	str	x1, [x0, #312]
ffffff8040087888:	14000006 	b	ffffff80400878a0 <sched_yield+0x40c>
ffffff804008788c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087890:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087894:	f9409c01 	ldr	x1, [x0, #312]
ffffff8040087898:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008789c:	f9009c01 	str	x1, [x0, #312]
ffffff80400878a0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400878a4:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400878a8:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400878ac:	f100001f 	cmp	x0, #0x0
ffffff80400878b0:	54fffee1 	b.ne	ffffff804008788c <sched_yield+0x3f8>  // b.any
ffffff80400878b4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400878b8:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400878bc:	f9400fa1 	ldr	x1, [x29, #24]
ffffff80400878c0:	f9009c01 	str	x1, [x0, #312]
ffffff80400878c4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400878c8:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400878cc:	9104e001 	add	x1, x0, #0x138
ffffff80400878d0:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400878d4:	f900a001 	str	x1, [x0, #320]
ffffff80400878d8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400878dc:	f9009c1f 	str	xzr, [x0, #312]
ffffff80400878e0:	1400001e 	b	ffffff8040087958 <sched_yield+0x4c4>
ffffff80400878e4:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff80400878e8:	9118e000 	add	x0, x0, #0x638
ffffff80400878ec:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff80400878f0:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff80400878f4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400878f8:	f9009c01 	str	x1, [x0, #312]
ffffff80400878fc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087900:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040087904:	f100001f 	cmp	x0, #0x0
ffffff8040087908:	54000100 	b.eq	ffffff8040087928 <sched_yield+0x494>  // b.none
ffffff804008790c:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087910:	9118e000 	add	x0, x0, #0x638
ffffff8040087914:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087918:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff804008791c:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087920:	9104e021 	add	x1, x1, #0x138
ffffff8040087924:	f900a001 	str	x1, [x0, #320]
ffffff8040087928:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff804008792c:	9118e000 	add	x0, x0, #0x638
ffffff8040087930:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087934:	f9400fa2 	ldr	x2, [x29, #24]
ffffff8040087938:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff804008793c:	b98027a0 	ldrsw	x0, [x29, #36]
ffffff8040087940:	d37df001 	lsl	x1, x0, #3
ffffff8040087944:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087948:	9118e000 	add	x0, x0, #0x638
ffffff804008794c:	8b000021 	add	x1, x1, x0
ffffff8040087950:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087954:	f900a001 	str	x1, [x0, #320]
ffffff8040087958:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008795c:	97fff488 	bl	ffffff8040084b7c <env_run>
ffffff8040087960:	14000010 	b	ffffff80400879a0 <sched_yield+0x50c>
ffffff8040087964:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087968:	9118e000 	add	x0, x0, #0x638
ffffff804008796c:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040087970:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087974:	f100001f 	cmp	x0, #0x0
ffffff8040087978:	54ffda61 	b.ne	ffffff80400874c4 <sched_yield+0x30>  // b.any
ffffff804008797c:	14000002 	b	ffffff8040087984 <sched_yield+0x4f0>
ffffff8040087980:	d503201f 	nop
ffffff8040087984:	b94027a0 	ldr	w0, [x29, #36]
ffffff8040087988:	51000400 	sub	w0, w0, #0x1
ffffff804008798c:	b90027a0 	str	w0, [x29, #36]
ffffff8040087990:	b94027a0 	ldr	w0, [x29, #36]
ffffff8040087994:	7100001f 	cmp	w0, #0x0
ffffff8040087998:	54ffd90a 	b.ge	ffffff80400874b8 <sched_yield+0x24>  // b.tcont
ffffff804008799c:	17fffec4 	b	ffffff80400874ac <sched_yield+0x18>
ffffff80400879a0:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400879a4:	d65f03c0 	ret

ffffff80400879a8 <lock_kernel>:
ffffff80400879a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff80400879ac:	910003fd 	mov	x29, sp
ffffff80400879b0:	b00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400879b4:	91247000 	add	x0, x0, #0x91c
ffffff80400879b8:	9400000c 	bl	ffffff80400879e8 <spin_lock>
ffffff80400879bc:	d503201f 	nop
ffffff80400879c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
ffffff80400879c4:	d65f03c0 	ret

ffffff80400879c8 <unlock_kernel>:
ffffff80400879c8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff80400879cc:	910003fd 	mov	x29, sp
ffffff80400879d0:	b00002a0 	adrp	x0, ffffff80400dc000 <_binary_fktest_elf_start+0xa080>
ffffff80400879d4:	91247000 	add	x0, x0, #0x91c
ffffff80400879d8:	94000014 	bl	ffffff8040087a28 <spin_unlock>
ffffff80400879dc:	d503201f 	nop
ffffff80400879e0:	a8c17bfd 	ldp	x29, x30, [sp], #16
ffffff80400879e4:	d65f03c0 	ret

ffffff80400879e8 <spin_lock>:
ffffff80400879e8:	d10083ff 	sub	sp, sp, #0x20
ffffff80400879ec:	f90007e0 	str	x0, [sp, #8]
ffffff80400879f0:	52800020 	mov	w0, #0x1                   	// #1
ffffff80400879f4:	b9001fe0 	str	w0, [sp, #28]
ffffff80400879f8:	f94007e2 	ldr	x2, [sp, #8]
ffffff80400879fc:	b9401fe1 	ldr	w1, [sp, #28]
ffffff8040087a00:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040087a04:	885ffc43 	ldaxr	w3, [x2]
ffffff8040087a08:	35ffffe3 	cbnz	w3, ffffff8040087a04 <spin_lock+0x1c>
ffffff8040087a0c:	88037c41 	stxr	w3, w1, [x2]
ffffff8040087a10:	35ffffa3 	cbnz	w3, ffffff8040087a04 <spin_lock+0x1c>
ffffff8040087a14:	2a0303e0 	mov	w0, w3
ffffff8040087a18:	b9001be0 	str	w0, [sp, #24]
ffffff8040087a1c:	d503201f 	nop
ffffff8040087a20:	910083ff 	add	sp, sp, #0x20
ffffff8040087a24:	d65f03c0 	ret

ffffff8040087a28 <spin_unlock>:
ffffff8040087a28:	d10043ff 	sub	sp, sp, #0x10
ffffff8040087a2c:	f90007e0 	str	x0, [sp, #8]
ffffff8040087a30:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040087a34:	889ffc1f 	stlr	wzr, [x0]
ffffff8040087a38:	d503201f 	nop
ffffff8040087a3c:	910043ff 	add	sp, sp, #0x10
ffffff8040087a40:	d65f03c0 	ret

ffffff8040087a44 <page2ppn>:
ffffff8040087a44:	d10043ff 	sub	sp, sp, #0x10
ffffff8040087a48:	f90007e0 	str	x0, [sp, #8]
ffffff8040087a4c:	f94007e1 	ldr	x1, [sp, #8]
ffffff8040087a50:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087a54:	9119e000 	add	x0, x0, #0x678
ffffff8040087a58:	cb000020 	sub	x0, x1, x0
ffffff8040087a5c:	9343fc01 	asr	x1, x0, #3
ffffff8040087a60:	b201f3e0 	mov	x0, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
ffffff8040087a64:	f2955560 	movk	x0, #0xaaab
ffffff8040087a68:	9b007c20 	mul	x0, x1, x0
ffffff8040087a6c:	910043ff 	add	sp, sp, #0x10
ffffff8040087a70:	d65f03c0 	ret

ffffff8040087a74 <page2kva>:
ffffff8040087a74:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040087a78:	910003fd 	mov	x29, sp
ffffff8040087a7c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040087a80:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087a84:	97fffff0 	bl	ffffff8040087a44 <page2ppn>
ffffff8040087a88:	d374cc00 	lsl	x0, x0, #12
ffffff8040087a8c:	b2596000 	orr	x0, x0, #0xffffff8000000000
ffffff8040087a90:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040087a94:	d65f03c0 	ret

ffffff8040087a98 <pa2page>:
ffffff8040087a98:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040087a9c:	910003fd 	mov	x29, sp
ffffff8040087aa0:	f9000fa0 	str	x0, [x29, #24]
ffffff8040087aa4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087aa8:	d34cfc00 	lsr	x0, x0, #12
ffffff8040087aac:	92406801 	and	x1, x0, #0x7ffffff
ffffff8040087ab0:	12bfff40 	mov	w0, #0x5ffff               	// #393215
ffffff8040087ab4:	eb00003f 	cmp	x1, x0
ffffff8040087ab8:	54000129 	b.ls	ffffff8040087adc <pa2page+0x44>  // b.plast
ffffff8040087abc:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087ac0:	9107e001 	add	x1, x0, #0x1f8
ffffff8040087ac4:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087ac8:	91088000 	add	x0, x0, #0x220
ffffff8040087acc:	f9400fa3 	ldr	x3, [x29, #24]
ffffff8040087ad0:	aa0103e2 	mov	x2, x1
ffffff8040087ad4:	528003e1 	mov	w1, #0x1f                  	// #31
ffffff8040087ad8:	97fffe15 	bl	ffffff804008732c <_panic>
ffffff8040087adc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087ae0:	d34cfc00 	lsr	x0, x0, #12
ffffff8040087ae4:	92406801 	and	x1, x0, #0x7ffffff
ffffff8040087ae8:	aa0103e0 	mov	x0, x1
ffffff8040087aec:	d37ff800 	lsl	x0, x0, #1
ffffff8040087af0:	8b010000 	add	x0, x0, x1
ffffff8040087af4:	d37df000 	lsl	x0, x0, #3
ffffff8040087af8:	b0003ca1 	adrp	x1, ffffff804081c000 <envs+0x619c8>
ffffff8040087afc:	9119e021 	add	x1, x1, #0x678
ffffff8040087b00:	8b010000 	add	x0, x0, x1
ffffff8040087b04:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040087b08:	d65f03c0 	ret

ffffff8040087b0c <sys_set_return>:
ffffff8040087b0c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040087b10:	910003fd 	mov	x29, sp
ffffff8040087b14:	f9000fa0 	str	x0, [x29, #24]
ffffff8040087b18:	97fff0f3 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040087b1c:	12001c00 	and	w0, w0, #0xff
ffffff8040087b20:	b9002fa0 	str	w0, [x29, #44]
ffffff8040087b24:	b00084a0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff8040087b28:	9119e000 	add	x0, x0, #0x678
ffffff8040087b2c:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff8040087b30:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087b34:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040087b38:	f9000001 	str	x1, [x0]
ffffff8040087b3c:	d503201f 	nop
ffffff8040087b40:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040087b44:	d65f03c0 	ret

ffffff8040087b48 <sys_putchar>:
ffffff8040087b48:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040087b4c:	910003fd 	mov	x29, sp
ffffff8040087b50:	b9001fa0 	str	w0, [x29, #28]
ffffff8040087b54:	39006fa1 	strb	w1, [x29, #27]
ffffff8040087b58:	39406fa0 	ldrb	w0, [x29, #27]
ffffff8040087b5c:	97ffeb32 	bl	ffffff8040082824 <uart_send>
ffffff8040087b60:	d503201f 	nop
ffffff8040087b64:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff8040087b68:	d65f03c0 	ret

ffffff8040087b6c <sys_cgetc>:
ffffff8040087b6c:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040087b70:	d65f03c0 	ret

ffffff8040087b74 <sys_panic>:
ffffff8040087b74:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040087b78:	910003fd 	mov	x29, sp
ffffff8040087b7c:	b9001fa0 	str	w0, [x29, #28]
ffffff8040087b80:	f9000ba1 	str	x1, [x29, #16]
ffffff8040087b84:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087b88:	91090001 	add	x1, x0, #0x240
ffffff8040087b8c:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087b90:	91092000 	add	x0, x0, #0x248
ffffff8040087b94:	f9400ba3 	ldr	x3, [x29, #16]
ffffff8040087b98:	aa0103e2 	mov	x2, x1
ffffff8040087b9c:	52800361 	mov	w1, #0x1b                  	// #27
ffffff8040087ba0:	97fffde3 	bl	ffffff804008732c <_panic>

ffffff8040087ba4 <sys_mem_alloc>:
ffffff8040087ba4:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff8040087ba8:	910003fd 	mov	x29, sp
ffffff8040087bac:	b9002fa0 	str	w0, [x29, #44]
ffffff8040087bb0:	b9002ba1 	str	w1, [x29, #40]
ffffff8040087bb4:	f90013a2 	str	x2, [x29, #32]
ffffff8040087bb8:	f9000fa3 	str	x3, [x29, #24]
ffffff8040087bbc:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040087bc0:	12002400 	and	w0, w0, #0x3ff
ffffff8040087bc4:	d2800801 	mov	x1, #0x40                  	// #64
ffffff8040087bc8:	97fff075 	bl	ffffff8040083d9c <check_env_right>
ffffff8040087bcc:	12001c00 	and	w0, w0, #0xff
ffffff8040087bd0:	b9004fa0 	str	w0, [x29, #76]
ffffff8040087bd4:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087bd8:	7100001f 	cmp	w0, #0x0
ffffff8040087bdc:	540000ca 	b.ge	ffffff8040087bf4 <sys_mem_alloc+0x50>  // b.tcont
ffffff8040087be0:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087be4:	9109c000 	add	x0, x0, #0x270
ffffff8040087be8:	97fffda8 	bl	ffffff8040087288 <printf>
ffffff8040087bec:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087bf0:	1400003e 	b	ffffff8040087ce8 <sys_mem_alloc+0x144>
ffffff8040087bf4:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040087bf8:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
ffffff8040087bfc:	eb00003f 	cmp	x1, x0
ffffff8040087c00:	540000c9 	b.ls	ffffff8040087c18 <sys_mem_alloc+0x74>  // b.plast
ffffff8040087c04:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087c08:	910a8000 	add	x0, x0, #0x2a0
ffffff8040087c0c:	97fffd9f 	bl	ffffff8040087288 <printf>
ffffff8040087c10:	12800000 	mov	w0, #0xffffffff            	// #-1
ffffff8040087c14:	14000035 	b	ffffff8040087ce8 <sys_mem_alloc+0x144>
ffffff8040087c18:	910103a0 	add	x0, x29, #0x40
ffffff8040087c1c:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040087c20:	aa0003e1 	mov	x1, x0
ffffff8040087c24:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040087c28:	97fff104 	bl	ffffff8040084038 <envid2env>
ffffff8040087c2c:	b9004fa0 	str	w0, [x29, #76]
ffffff8040087c30:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087c34:	7100001f 	cmp	w0, #0x0
ffffff8040087c38:	540000ca 	b.ge	ffffff8040087c50 <sys_mem_alloc+0xac>  // b.tcont
ffffff8040087c3c:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087c40:	910ae000 	add	x0, x0, #0x2b8
ffffff8040087c44:	97fffd91 	bl	ffffff8040087288 <printf>
ffffff8040087c48:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087c4c:	14000027 	b	ffffff8040087ce8 <sys_mem_alloc+0x144>
ffffff8040087c50:	9100e3a0 	add	x0, x29, #0x38
ffffff8040087c54:	97fff720 	bl	ffffff80400858d4 <page_alloc>
ffffff8040087c58:	b9004fa0 	str	w0, [x29, #76]
ffffff8040087c5c:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087c60:	7100001f 	cmp	w0, #0x0
ffffff8040087c64:	540000ca 	b.ge	ffffff8040087c7c <sys_mem_alloc+0xd8>  // b.tcont
ffffff8040087c68:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087c6c:	910b6000 	add	x0, x0, #0x2d8
ffffff8040087c70:	97fffd86 	bl	ffffff8040087288 <printf>
ffffff8040087c74:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087c78:	1400001c 	b	ffffff8040087ce8 <sys_mem_alloc+0x144>
ffffff8040087c7c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040087c80:	97ffff7d 	bl	ffffff8040087a74 <page2kva>
ffffff8040087c84:	d2820001 	mov	x1, #0x1000                	// #4096
ffffff8040087c88:	97fff6cb 	bl	ffffff80400857b4 <bzero>
ffffff8040087c8c:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040087c90:	f9409805 	ldr	x5, [x0, #304]
ffffff8040087c94:	f9401fa1 	ldr	x1, [x29, #56]
ffffff8040087c98:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040087c9c:	b27a0002 	orr	x2, x0, #0x40
ffffff8040087ca0:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040087ca4:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087ca8:	12002400 	and	w0, w0, #0x3ff
ffffff8040087cac:	2a0003e4 	mov	w4, w0
ffffff8040087cb0:	aa0203e3 	mov	x3, x2
ffffff8040087cb4:	f94013a2 	ldr	x2, [x29, #32]
ffffff8040087cb8:	aa0503e0 	mov	x0, x5
ffffff8040087cbc:	97fff7e8 	bl	ffffff8040085c5c <page_insert>
ffffff8040087cc0:	b9004fa0 	str	w0, [x29, #76]
ffffff8040087cc4:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087cc8:	7100001f 	cmp	w0, #0x0
ffffff8040087ccc:	540000ca 	b.ge	ffffff8040087ce4 <sys_mem_alloc+0x140>  // b.tcont
ffffff8040087cd0:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087cd4:	910be000 	add	x0, x0, #0x2f8
ffffff8040087cd8:	97fffd6c 	bl	ffffff8040087288 <printf>
ffffff8040087cdc:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040087ce0:	14000002 	b	ffffff8040087ce8 <sys_mem_alloc+0x144>
ffffff8040087ce4:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040087ce8:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff8040087cec:	d65f03c0 	ret

ffffff8040087cf0 <sys_mem_map>:
ffffff8040087cf0:	a9b97bfd 	stp	x29, x30, [sp, #-112]!
ffffff8040087cf4:	910003fd 	mov	x29, sp
ffffff8040087cf8:	b9003fa0 	str	w0, [x29, #60]
ffffff8040087cfc:	b9003ba1 	str	w1, [x29, #56]
ffffff8040087d00:	f9001ba2 	str	x2, [x29, #48]
ffffff8040087d04:	b9002fa3 	str	w3, [x29, #44]
ffffff8040087d08:	f90013a4 	str	x4, [x29, #32]
ffffff8040087d0c:	f9000fa5 	str	x5, [x29, #24]
ffffff8040087d10:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040087d14:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040087d18:	f9001ba0 	str	x0, [x29, #48]
ffffff8040087d1c:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040087d20:	92744c00 	and	x0, x0, #0xfffff000
ffffff8040087d24:	f90013a0 	str	x0, [x29, #32]
ffffff8040087d28:	910163a0 	add	x0, x29, #0x58
ffffff8040087d2c:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040087d30:	aa0003e1 	mov	x1, x0
ffffff8040087d34:	b9403ba0 	ldr	w0, [x29, #56]
ffffff8040087d38:	97fff0c0 	bl	ffffff8040084038 <envid2env>
ffffff8040087d3c:	b9006fa0 	str	w0, [x29, #108]
ffffff8040087d40:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087d44:	7100001f 	cmp	w0, #0x0
ffffff8040087d48:	540000ca 	b.ge	ffffff8040087d60 <sys_mem_map+0x70>  // b.tcont
ffffff8040087d4c:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087d50:	910c8000 	add	x0, x0, #0x320
ffffff8040087d54:	97fffd4d 	bl	ffffff8040087288 <printf>
ffffff8040087d58:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087d5c:	1400003d 	b	ffffff8040087e50 <sys_mem_map+0x160>
ffffff8040087d60:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040087d64:	f9409804 	ldr	x4, [x0, #304]
ffffff8040087d68:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040087d6c:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087d70:	12002401 	and	w1, w0, #0x3ff
ffffff8040087d74:	910123a0 	add	x0, x29, #0x48
ffffff8040087d78:	2a0103e3 	mov	w3, w1
ffffff8040087d7c:	aa0003e2 	mov	x2, x0
ffffff8040087d80:	f9401ba1 	ldr	x1, [x29, #48]
ffffff8040087d84:	aa0403e0 	mov	x0, x4
ffffff8040087d88:	97fff816 	bl	ffffff8040085de0 <page_lookup>
ffffff8040087d8c:	f90033a0 	str	x0, [x29, #96]
ffffff8040087d90:	f94033a0 	ldr	x0, [x29, #96]
ffffff8040087d94:	f100001f 	cmp	x0, #0x0
ffffff8040087d98:	54000161 	b.ne	ffffff8040087dc4 <sys_mem_map+0xd4>  // b.any
ffffff8040087d9c:	f9402fa0 	ldr	x0, [x29, #88]
ffffff8040087da0:	f9409801 	ldr	x1, [x0, #304]
ffffff8040087da4:	910123a2 	add	x2, x29, #0x48
ffffff8040087da8:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087dac:	910d0000 	add	x0, x0, #0x340
ffffff8040087db0:	aa0203e3 	mov	x3, x2
ffffff8040087db4:	f9401ba2 	ldr	x2, [x29, #48]
ffffff8040087db8:	97fffd34 	bl	ffffff8040087288 <printf>
ffffff8040087dbc:	12800000 	mov	w0, #0xffffffff            	// #-1
ffffff8040087dc0:	14000024 	b	ffffff8040087e50 <sys_mem_map+0x160>
ffffff8040087dc4:	910143a0 	add	x0, x29, #0x50
ffffff8040087dc8:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040087dcc:	aa0003e1 	mov	x1, x0
ffffff8040087dd0:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040087dd4:	97fff099 	bl	ffffff8040084038 <envid2env>
ffffff8040087dd8:	b9006fa0 	str	w0, [x29, #108]
ffffff8040087ddc:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087de0:	7100001f 	cmp	w0, #0x0
ffffff8040087de4:	540000ca 	b.ge	ffffff8040087dfc <sys_mem_map+0x10c>  // b.tcont
ffffff8040087de8:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087dec:	910c8000 	add	x0, x0, #0x320
ffffff8040087df0:	97fffd26 	bl	ffffff8040087288 <printf>
ffffff8040087df4:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087df8:	14000016 	b	ffffff8040087e50 <sys_mem_map+0x160>
ffffff8040087dfc:	f9402ba0 	ldr	x0, [x29, #80]
ffffff8040087e00:	f9409805 	ldr	x5, [x0, #304]
ffffff8040087e04:	f9402ba0 	ldr	x0, [x29, #80]
ffffff8040087e08:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087e0c:	12002400 	and	w0, w0, #0x3ff
ffffff8040087e10:	2a0003e4 	mov	w4, w0
ffffff8040087e14:	f9400fa3 	ldr	x3, [x29, #24]
ffffff8040087e18:	f94013a2 	ldr	x2, [x29, #32]
ffffff8040087e1c:	f94033a1 	ldr	x1, [x29, #96]
ffffff8040087e20:	aa0503e0 	mov	x0, x5
ffffff8040087e24:	97fff78e 	bl	ffffff8040085c5c <page_insert>
ffffff8040087e28:	b9006fa0 	str	w0, [x29, #108]
ffffff8040087e2c:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087e30:	7100001f 	cmp	w0, #0x0
ffffff8040087e34:	540000ca 	b.ge	ffffff8040087e4c <sys_mem_map+0x15c>  // b.tcont
ffffff8040087e38:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087e3c:	910e2000 	add	x0, x0, #0x388
ffffff8040087e40:	97fffd12 	bl	ffffff8040087288 <printf>
ffffff8040087e44:	b9406fa0 	ldr	w0, [x29, #108]
ffffff8040087e48:	14000002 	b	ffffff8040087e50 <sys_mem_map+0x160>
ffffff8040087e4c:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040087e50:	a8c77bfd 	ldp	x29, x30, [sp], #112
ffffff8040087e54:	d65f03c0 	ret

ffffff8040087e58 <sys_mem_unmap>:
ffffff8040087e58:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff8040087e5c:	910003fd 	mov	x29, sp
ffffff8040087e60:	b9001fa0 	str	w0, [x29, #28]
ffffff8040087e64:	b9001ba1 	str	w1, [x29, #24]
ffffff8040087e68:	f9000ba2 	str	x2, [x29, #16]
ffffff8040087e6c:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040087e70:	12002400 	and	w0, w0, #0x3ff
ffffff8040087e74:	d2801001 	mov	x1, #0x80                  	// #128
ffffff8040087e78:	97ffefc9 	bl	ffffff8040083d9c <check_env_right>
ffffff8040087e7c:	12001c00 	and	w0, w0, #0xff
ffffff8040087e80:	b9003fa0 	str	w0, [x29, #60]
ffffff8040087e84:	b9403fa0 	ldr	w0, [x29, #60]
ffffff8040087e88:	7100001f 	cmp	w0, #0x0
ffffff8040087e8c:	540000c0 	b.eq	ffffff8040087ea4 <sys_mem_unmap+0x4c>  // b.none
ffffff8040087e90:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087e94:	910ea000 	add	x0, x0, #0x3a8
ffffff8040087e98:	97fffcfc 	bl	ffffff8040087288 <printf>
ffffff8040087e9c:	b9403fa0 	ldr	w0, [x29, #60]
ffffff8040087ea0:	14000030 	b	ffffff8040087f60 <sys_mem_unmap+0x108>
ffffff8040087ea4:	9100a3a0 	add	x0, x29, #0x28
ffffff8040087ea8:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040087eac:	aa0003e1 	mov	x1, x0
ffffff8040087eb0:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040087eb4:	97fff061 	bl	ffffff8040084038 <envid2env>
ffffff8040087eb8:	b9003fa0 	str	w0, [x29, #60]
ffffff8040087ebc:	b9403fa0 	ldr	w0, [x29, #60]
ffffff8040087ec0:	7100001f 	cmp	w0, #0x0
ffffff8040087ec4:	540000ca 	b.ge	ffffff8040087edc <sys_mem_unmap+0x84>  // b.tcont
ffffff8040087ec8:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087ecc:	910f6000 	add	x0, x0, #0x3d8
ffffff8040087ed0:	97fffcee 	bl	ffffff8040087288 <printf>
ffffff8040087ed4:	b9403fa0 	ldr	w0, [x29, #60]
ffffff8040087ed8:	14000022 	b	ffffff8040087f60 <sys_mem_unmap+0x108>
ffffff8040087edc:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040087ee0:	f9409804 	ldr	x4, [x0, #304]
ffffff8040087ee4:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040087ee8:	12002401 	and	w1, w0, #0x3ff
ffffff8040087eec:	910083a0 	add	x0, x29, #0x20
ffffff8040087ef0:	2a0103e3 	mov	w3, w1
ffffff8040087ef4:	aa0003e2 	mov	x2, x0
ffffff8040087ef8:	f9400ba1 	ldr	x1, [x29, #16]
ffffff8040087efc:	aa0403e0 	mov	x0, x4
ffffff8040087f00:	97fff7b8 	bl	ffffff8040085de0 <page_lookup>
ffffff8040087f04:	f9001ba0 	str	x0, [x29, #48]
ffffff8040087f08:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040087f0c:	f100001f 	cmp	x0, #0x0
ffffff8040087f10:	54000161 	b.ne	ffffff8040087f3c <sys_mem_unmap+0xe4>  // b.any
ffffff8040087f14:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040087f18:	f9409801 	ldr	x1, [x0, #304]
ffffff8040087f1c:	910083a2 	add	x2, x29, #0x20
ffffff8040087f20:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087f24:	910fe000 	add	x0, x0, #0x3f8
ffffff8040087f28:	aa0203e3 	mov	x3, x2
ffffff8040087f2c:	f9400ba2 	ldr	x2, [x29, #16]
ffffff8040087f30:	97fffcd6 	bl	ffffff8040087288 <printf>
ffffff8040087f34:	12800000 	mov	w0, #0xffffffff            	// #-1
ffffff8040087f38:	1400000a 	b	ffffff8040087f60 <sys_mem_unmap+0x108>
ffffff8040087f3c:	f94017a0 	ldr	x0, [x29, #40]
ffffff8040087f40:	f9409803 	ldr	x3, [x0, #304]
ffffff8040087f44:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040087f48:	12002400 	and	w0, w0, #0x3ff
ffffff8040087f4c:	2a0003e2 	mov	w2, w0
ffffff8040087f50:	f9400ba1 	ldr	x1, [x29, #16]
ffffff8040087f54:	aa0303e0 	mov	x0, x3
ffffff8040087f58:	97fff7dd 	bl	ffffff8040085ecc <page_remove>
ffffff8040087f5c:	b9403fa0 	ldr	w0, [x29, #60]
ffffff8040087f60:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040087f64:	d65f03c0 	ret

ffffff8040087f68 <sys_env_alloc>:
ffffff8040087f68:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
ffffff8040087f6c:	910003fd 	mov	x29, sp
ffffff8040087f70:	f9000bf3 	str	x19, [sp, #16]
ffffff8040087f74:	f90017a0 	str	x0, [x29, #40]
ffffff8040087f78:	97ffefdb 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040087f7c:	12001c00 	and	w0, w0, #0xff
ffffff8040087f80:	b9005fa0 	str	w0, [x29, #92]
ffffff8040087f84:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087f88:	91194000 	add	x0, x0, #0x650
ffffff8040087f8c:	b9805fa1 	ldrsw	x1, [x29, #92]
ffffff8040087f90:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087f94:	b9412000 	ldr	w0, [x0, #288]
ffffff8040087f98:	12002400 	and	w0, w0, #0x3ff
ffffff8040087f9c:	d2800021 	mov	x1, #0x1                   	// #1
ffffff8040087fa0:	97ffef7f 	bl	ffffff8040083d9c <check_env_right>
ffffff8040087fa4:	12001c00 	and	w0, w0, #0xff
ffffff8040087fa8:	b9005ba0 	str	w0, [x29, #88]
ffffff8040087fac:	b9405ba0 	ldr	w0, [x29, #88]
ffffff8040087fb0:	7100001f 	cmp	w0, #0x0
ffffff8040087fb4:	540000ca 	b.ge	ffffff8040087fcc <sys_env_alloc+0x64>  // b.tcont
ffffff8040087fb8:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040087fbc:	91110000 	add	x0, x0, #0x440
ffffff8040087fc0:	97fffcb2 	bl	ffffff8040087288 <printf>
ffffff8040087fc4:	b9405ba0 	ldr	w0, [x29, #88]
ffffff8040087fc8:	14000059 	b	ffffff804008812c <sys_env_alloc+0x1c4>
ffffff8040087fcc:	b0003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040087fd0:	91194000 	add	x0, x0, #0x650
ffffff8040087fd4:	b9805fa1 	ldrsw	x1, [x29, #92]
ffffff8040087fd8:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040087fdc:	b9412001 	ldr	w1, [x0, #288]
ffffff8040087fe0:	910123a0 	add	x0, x29, #0x48
ffffff8040087fe4:	f94017a2 	ldr	x2, [x29, #40]
ffffff8040087fe8:	97fff0e3 	bl	ffffff8040084374 <env_alloc>
ffffff8040087fec:	b9005ba0 	str	w0, [x29, #88]
ffffff8040087ff0:	b9405ba0 	ldr	w0, [x29, #88]
ffffff8040087ff4:	7100001f 	cmp	w0, #0x0
ffffff8040087ff8:	540000ca 	b.ge	ffffff8040088010 <sys_env_alloc+0xa8>  // b.tcont
ffffff8040087ffc:	d0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088000:	9111c000 	add	x0, x0, #0x470
ffffff8040088004:	97fffca1 	bl	ffffff8040087288 <printf>
ffffff8040088008:	b9405ba0 	ldr	w0, [x29, #88]
ffffff804008800c:	14000048 	b	ffffff804008812c <sys_env_alloc+0x1c4>
ffffff8040088010:	900084a0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff8040088014:	9119e000 	add	x0, x0, #0x678
ffffff8040088018:	b9805fa1 	ldrsw	x1, [x29, #92]
ffffff804008801c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088020:	f94027a1 	ldr	x1, [x29, #72]
ffffff8040088024:	d2802202 	mov	x2, #0x110                 	// #272
ffffff8040088028:	97fff601 	bl	ffffff804008582c <bcopy>
ffffff804008802c:	f90023bf 	str	xzr, [x29, #64]
ffffff8040088030:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088034:	91194000 	add	x0, x0, #0x650
ffffff8040088038:	b9805fa1 	ldrsw	x1, [x29, #92]
ffffff804008803c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088040:	f9409805 	ldr	x5, [x0, #304]
ffffff8040088044:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088048:	91194000 	add	x0, x0, #0x650
ffffff804008804c:	b9805fa1 	ldrsw	x1, [x29, #92]
ffffff8040088050:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088054:	b9412001 	ldr	w1, [x0, #288]
ffffff8040088058:	910103a0 	add	x0, x29, #0x40
ffffff804008805c:	2a0103e4 	mov	w4, w1
ffffff8040088060:	aa0003e3 	mov	x3, x0
ffffff8040088064:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040088068:	b2742fe1 	mov	x1, #0xfff000              	// #16773120
ffffff804008806c:	aa0503e0 	mov	x0, x5
ffffff8040088070:	97fff686 	bl	ffffff8040085a88 <pgdir_walk>
ffffff8040088074:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088078:	f100001f 	cmp	x0, #0x0
ffffff804008807c:	54000380 	b.eq	ffffff80400880ec <sys_env_alloc+0x184>  // b.none
ffffff8040088080:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088084:	f9400000 	ldr	x0, [x0]
ffffff8040088088:	92744c00 	and	x0, x0, #0xfffff000
ffffff804008808c:	97fffe83 	bl	ffffff8040087a98 <pa2page>
ffffff8040088090:	f9002ba0 	str	x0, [x29, #80]
ffffff8040088094:	9100e3a0 	add	x0, x29, #0x38
ffffff8040088098:	97fff60f 	bl	ffffff80400858d4 <page_alloc>
ffffff804008809c:	f9402ba0 	ldr	x0, [x29, #80]
ffffff80400880a0:	97fffe75 	bl	ffffff8040087a74 <page2kva>
ffffff80400880a4:	aa0003f3 	mov	x19, x0
ffffff80400880a8:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400880ac:	97fffe72 	bl	ffffff8040087a74 <page2kva>
ffffff80400880b0:	d2820002 	mov	x2, #0x1000                	// #4096
ffffff80400880b4:	aa0003e1 	mov	x1, x0
ffffff80400880b8:	aa1303e0 	mov	x0, x19
ffffff80400880bc:	97fff5dc 	bl	ffffff804008582c <bcopy>
ffffff80400880c0:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400880c4:	f9409805 	ldr	x5, [x0, #304]
ffffff80400880c8:	f9401fa1 	ldr	x1, [x29, #56]
ffffff80400880cc:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400880d0:	b9412000 	ldr	w0, [x0, #288]
ffffff80400880d4:	12002400 	and	w0, w0, #0x3ff
ffffff80400880d8:	2a0003e4 	mov	w4, w0
ffffff80400880dc:	d2800803 	mov	x3, #0x40                  	// #64
ffffff80400880e0:	b2742fe2 	mov	x2, #0xfff000              	// #16773120
ffffff80400880e4:	aa0503e0 	mov	x0, x5
ffffff80400880e8:	97fff6dd 	bl	ffffff8040085c5c <page_insert>
ffffff80400880ec:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400880f0:	52800041 	mov	w1, #0x2                   	// #2
ffffff80400880f4:	b9012801 	str	w1, [x0, #296]
ffffff80400880f8:	f94027a0 	ldr	x0, [x29, #72]
ffffff80400880fc:	f900001f 	str	xzr, [x0]
ffffff8040088100:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040088104:	b9015c1f 	str	wzr, [x0, #348]
ffffff8040088108:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff804008810c:	91194000 	add	x0, x0, #0x650
ffffff8040088110:	b9805fa1 	ldrsw	x1, [x29, #92]
ffffff8040088114:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040088118:	f94027a0 	ldr	x0, [x29, #72]
ffffff804008811c:	b9414821 	ldr	w1, [x1, #328]
ffffff8040088120:	b9014801 	str	w1, [x0, #328]
ffffff8040088124:	f94027a0 	ldr	x0, [x29, #72]
ffffff8040088128:	b9412000 	ldr	w0, [x0, #288]
ffffff804008812c:	f9400bf3 	ldr	x19, [sp, #16]
ffffff8040088130:	a8c67bfd 	ldp	x29, x30, [sp], #96
ffffff8040088134:	d65f03c0 	ret

ffffff8040088138 <sys_set_env_status>:
ffffff8040088138:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff804008813c:	910003fd 	mov	x29, sp
ffffff8040088140:	b9001fa0 	str	w0, [x29, #28]
ffffff8040088144:	b9001ba1 	str	w1, [x29, #24]
ffffff8040088148:	b90017a2 	str	w2, [x29, #20]
ffffff804008814c:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040088150:	12002400 	and	w0, w0, #0x3ff
ffffff8040088154:	d2800041 	mov	x1, #0x2                   	// #2
ffffff8040088158:	97ffef11 	bl	ffffff8040083d9c <check_env_right>
ffffff804008815c:	12001c00 	and	w0, w0, #0xff
ffffff8040088160:	b9002fa0 	str	w0, [x29, #44]
ffffff8040088164:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040088168:	7100001f 	cmp	w0, #0x0
ffffff804008816c:	540000ca 	b.ge	ffffff8040088184 <sys_set_env_status+0x4c>  // b.tcont
ffffff8040088170:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088174:	91126000 	add	x0, x0, #0x498
ffffff8040088178:	97fffc44 	bl	ffffff8040087288 <printf>
ffffff804008817c:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040088180:	14000079 	b	ffffff8040088364 <sys_set_env_status+0x22c>
ffffff8040088184:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040088188:	7100041f 	cmp	w0, #0x1
ffffff804008818c:	54000180 	b.eq	ffffff80400881bc <sys_set_env_status+0x84>  // b.none
ffffff8040088190:	b94017a0 	ldr	w0, [x29, #20]
ffffff8040088194:	7100081f 	cmp	w0, #0x2
ffffff8040088198:	54000120 	b.eq	ffffff80400881bc <sys_set_env_status+0x84>  // b.none
ffffff804008819c:	b94017a0 	ldr	w0, [x29, #20]
ffffff80400881a0:	7100001f 	cmp	w0, #0x0
ffffff80400881a4:	540000c0 	b.eq	ffffff80400881bc <sys_set_env_status+0x84>  // b.none
ffffff80400881a8:	b94017a0 	ldr	w0, [x29, #20]
ffffff80400881ac:	71000c1f 	cmp	w0, #0x3
ffffff80400881b0:	54000060 	b.eq	ffffff80400881bc <sys_set_env_status+0x84>  // b.none
ffffff80400881b4:	12800040 	mov	w0, #0xfffffffd            	// #-3
ffffff80400881b8:	1400006b 	b	ffffff8040088364 <sys_set_env_status+0x22c>
ffffff80400881bc:	910083a0 	add	x0, x29, #0x20
ffffff80400881c0:	52800002 	mov	w2, #0x0                   	// #0
ffffff80400881c4:	aa0003e1 	mov	x1, x0
ffffff80400881c8:	b9401ba0 	ldr	w0, [x29, #24]
ffffff80400881cc:	97ffef9b 	bl	ffffff8040084038 <envid2env>
ffffff80400881d0:	b9002fa0 	str	w0, [x29, #44]
ffffff80400881d4:	b9402fa0 	ldr	w0, [x29, #44]
ffffff80400881d8:	7100001f 	cmp	w0, #0x0
ffffff80400881dc:	5400006a 	b.ge	ffffff80400881e8 <sys_set_env_status+0xb0>  // b.tcont
ffffff80400881e0:	b9402fa0 	ldr	w0, [x29, #44]
ffffff80400881e4:	14000060 	b	ffffff8040088364 <sys_set_env_status+0x22c>
ffffff80400881e8:	b94017a0 	ldr	w0, [x29, #20]
ffffff80400881ec:	7100041f 	cmp	w0, #0x1
ffffff80400881f0:	54000541 	b.ne	ffffff8040088298 <sys_set_env_status+0x160>  // b.any
ffffff80400881f4:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400881f8:	b9412800 	ldr	w0, [x0, #296]
ffffff80400881fc:	7100041f 	cmp	w0, #0x1
ffffff8040088200:	540004c0 	b.eq	ffffff8040088298 <sys_set_env_status+0x160>  // b.none
ffffff8040088204:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088208:	b9414802 	ldr	w2, [x0, #328]
ffffff804008820c:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088210:	90003ca1 	adrp	x1, ffffff804081c000 <envs+0x619c8>
ffffff8040088214:	9118e021 	add	x1, x1, #0x638
ffffff8040088218:	2a0203e2 	mov	w2, w2
ffffff804008821c:	f8627821 	ldr	x1, [x1, x2, lsl #3]
ffffff8040088220:	f9009c01 	str	x1, [x0, #312]
ffffff8040088224:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040088228:	f100001f 	cmp	x0, #0x0
ffffff804008822c:	54000140 	b.eq	ffffff8040088254 <sys_set_env_status+0x11c>  // b.none
ffffff8040088230:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040088234:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088238:	b9414802 	ldr	w2, [x0, #328]
ffffff804008823c:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088240:	9118e000 	add	x0, x0, #0x638
ffffff8040088244:	2a0203e2 	mov	w2, w2
ffffff8040088248:	f8627800 	ldr	x0, [x0, x2, lsl #3]
ffffff804008824c:	9104e021 	add	x1, x1, #0x138
ffffff8040088250:	f900a001 	str	x1, [x0, #320]
ffffff8040088254:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088258:	b9414801 	ldr	w1, [x0, #328]
ffffff804008825c:	f94013a2 	ldr	x2, [x29, #32]
ffffff8040088260:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088264:	9118e000 	add	x0, x0, #0x638
ffffff8040088268:	2a0103e1 	mov	w1, w1
ffffff804008826c:	f8217802 	str	x2, [x0, x1, lsl #3]
ffffff8040088270:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088274:	b9414801 	ldr	w1, [x0, #328]
ffffff8040088278:	f94013a0 	ldr	x0, [x29, #32]
ffffff804008827c:	2a0103e1 	mov	w1, w1
ffffff8040088280:	d37df022 	lsl	x2, x1, #3
ffffff8040088284:	90003ca1 	adrp	x1, ffffff804081c000 <envs+0x619c8>
ffffff8040088288:	9118e021 	add	x1, x1, #0x638
ffffff804008828c:	8b010041 	add	x1, x2, x1
ffffff8040088290:	f900a001 	str	x1, [x0, #320]
ffffff8040088294:	14000030 	b	ffffff8040088354 <sys_set_env_status+0x21c>
ffffff8040088298:	b94017a0 	ldr	w0, [x29, #20]
ffffff804008829c:	7100041f 	cmp	w0, #0x1
ffffff80400882a0:	54000280 	b.eq	ffffff80400882f0 <sys_set_env_status+0x1b8>  // b.none
ffffff80400882a4:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400882a8:	b9412800 	ldr	w0, [x0, #296]
ffffff80400882ac:	7100041f 	cmp	w0, #0x1
ffffff80400882b0:	54000201 	b.ne	ffffff80400882f0 <sys_set_env_status+0x1b8>  // b.any
ffffff80400882b4:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400882b8:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400882bc:	f100001f 	cmp	x0, #0x0
ffffff80400882c0:	540000c0 	b.eq	ffffff80400882d8 <sys_set_env_status+0x1a0>  // b.none
ffffff80400882c4:	f94013a1 	ldr	x1, [x29, #32]
ffffff80400882c8:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400882cc:	f9409c00 	ldr	x0, [x0, #312]
ffffff80400882d0:	f940a021 	ldr	x1, [x1, #320]
ffffff80400882d4:	f900a001 	str	x1, [x0, #320]
ffffff80400882d8:	f94013a1 	ldr	x1, [x29, #32]
ffffff80400882dc:	f94013a0 	ldr	x0, [x29, #32]
ffffff80400882e0:	f940a000 	ldr	x0, [x0, #320]
ffffff80400882e4:	f9409c21 	ldr	x1, [x1, #312]
ffffff80400882e8:	f9000001 	str	x1, [x0]
ffffff80400882ec:	1400001a 	b	ffffff8040088354 <sys_set_env_status+0x21c>
ffffff80400882f0:	b94017a0 	ldr	w0, [x29, #20]
ffffff80400882f4:	7100001f 	cmp	w0, #0x0
ffffff80400882f8:	540002e1 	b.ne	ffffff8040088354 <sys_set_env_status+0x21c>  // b.any
ffffff80400882fc:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088300:	b9412800 	ldr	w0, [x0, #296]
ffffff8040088304:	71000c1f 	cmp	w0, #0x3
ffffff8040088308:	54000261 	b.ne	ffffff8040088354 <sys_set_env_status+0x21c>  // b.any
ffffff804008830c:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088310:	b94017a1 	ldr	w1, [x29, #20]
ffffff8040088314:	b9012801 	str	w1, [x0, #296]
ffffff8040088318:	f94013a0 	ldr	x0, [x29, #32]
ffffff804008831c:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040088320:	f100001f 	cmp	x0, #0x0
ffffff8040088324:	540000c0 	b.eq	ffffff804008833c <sys_set_env_status+0x204>  // b.none
ffffff8040088328:	f94013a1 	ldr	x1, [x29, #32]
ffffff804008832c:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088330:	f9409c00 	ldr	x0, [x0, #312]
ffffff8040088334:	f940a021 	ldr	x1, [x1, #320]
ffffff8040088338:	f900a001 	str	x1, [x0, #320]
ffffff804008833c:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040088340:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088344:	f940a000 	ldr	x0, [x0, #320]
ffffff8040088348:	f9409c21 	ldr	x1, [x1, #312]
ffffff804008834c:	f9000001 	str	x1, [x0]
ffffff8040088350:	97fffc51 	bl	ffffff8040087494 <sched_yield>
ffffff8040088354:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088358:	b94017a1 	ldr	w1, [x29, #20]
ffffff804008835c:	b9012801 	str	w1, [x0, #296]
ffffff8040088360:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040088364:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040088368:	d65f03c0 	ret

ffffff804008836c <sys_getenvid>:
ffffff804008836c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
ffffff8040088370:	910003fd 	mov	x29, sp
ffffff8040088374:	97ffeedc 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088378:	12001c00 	and	w0, w0, #0xff
ffffff804008837c:	b9001fa0 	str	w0, [x29, #28]
ffffff8040088380:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088384:	91194000 	add	x0, x0, #0x650
ffffff8040088388:	b9801fa1 	ldrsw	x1, [x29, #28]
ffffff804008838c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088390:	b9412000 	ldr	w0, [x0, #288]
ffffff8040088394:	b9001ba0 	str	w0, [x29, #24]
ffffff8040088398:	b9401ba0 	ldr	w0, [x29, #24]
ffffff804008839c:	12002400 	and	w0, w0, #0x3ff
ffffff80400883a0:	d2800081 	mov	x1, #0x4                   	// #4
ffffff80400883a4:	97ffee7e 	bl	ffffff8040083d9c <check_env_right>
ffffff80400883a8:	12001c00 	and	w0, w0, #0xff
ffffff80400883ac:	b90017a0 	str	w0, [x29, #20]
ffffff80400883b0:	b94017a0 	ldr	w0, [x29, #20]
ffffff80400883b4:	7100001f 	cmp	w0, #0x0
ffffff80400883b8:	540000c0 	b.eq	ffffff80400883d0 <sys_getenvid+0x64>  // b.none
ffffff80400883bc:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400883c0:	91134000 	add	x0, x0, #0x4d0
ffffff80400883c4:	97fffbb1 	bl	ffffff8040087288 <printf>
ffffff80400883c8:	b94017a0 	ldr	w0, [x29, #20]
ffffff80400883cc:	14000002 	b	ffffff80400883d4 <sys_getenvid+0x68>
ffffff80400883d0:	b9401ba0 	ldr	w0, [x29, #24]
ffffff80400883d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
ffffff80400883d8:	d65f03c0 	ret

ffffff80400883dc <sys_yield>:
ffffff80400883dc:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff80400883e0:	910003fd 	mov	x29, sp
ffffff80400883e4:	b9001fa0 	str	w0, [x29, #28]
ffffff80400883e8:	d2800101 	mov	x1, #0x8                   	// #8
ffffff80400883ec:	b9401fa0 	ldr	w0, [x29, #28]
ffffff80400883f0:	97ffee6b 	bl	ffffff8040083d9c <check_env_right>
ffffff80400883f4:	12001c00 	and	w0, w0, #0xff
ffffff80400883f8:	b9002fa0 	str	w0, [x29, #44]
ffffff80400883fc:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040088400:	7100001f 	cmp	w0, #0x0
ffffff8040088404:	540000aa 	b.ge	ffffff8040088418 <sys_yield+0x3c>  // b.tcont
ffffff8040088408:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008840c:	91140000 	add	x0, x0, #0x500
ffffff8040088410:	97fffb9e 	bl	ffffff8040087288 <printf>
ffffff8040088414:	14000002 	b	ffffff804008841c <sys_yield+0x40>
ffffff8040088418:	97fffc1f 	bl	ffffff8040087494 <sched_yield>
ffffff804008841c:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040088420:	d65f03c0 	ret

ffffff8040088424 <sys_env_destroy>:
ffffff8040088424:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040088428:	910003fd 	mov	x29, sp
ffffff804008842c:	b9001fa0 	str	w0, [x29, #28]
ffffff8040088430:	b9001ba1 	str	w1, [x29, #24]
ffffff8040088434:	d2800201 	mov	x1, #0x10                  	// #16
ffffff8040088438:	b9401ba0 	ldr	w0, [x29, #24]
ffffff804008843c:	97ffee58 	bl	ffffff8040083d9c <check_env_right>
ffffff8040088440:	12001c00 	and	w0, w0, #0xff
ffffff8040088444:	b9002fa0 	str	w0, [x29, #44]
ffffff8040088448:	b9402fa0 	ldr	w0, [x29, #44]
ffffff804008844c:	7100001f 	cmp	w0, #0x0
ffffff8040088450:	540000ca 	b.ge	ffffff8040088468 <sys_env_destroy+0x44>  // b.tcont
ffffff8040088454:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088458:	9114c000 	add	x0, x0, #0x530
ffffff804008845c:	97fffb8b 	bl	ffffff8040087288 <printf>
ffffff8040088460:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040088464:	1400000f 	b	ffffff80400884a0 <sys_env_destroy+0x7c>
ffffff8040088468:	910083a0 	add	x0, x29, #0x20
ffffff804008846c:	52800022 	mov	w2, #0x1                   	// #1
ffffff8040088470:	aa0003e1 	mov	x1, x0
ffffff8040088474:	b9401ba0 	ldr	w0, [x29, #24]
ffffff8040088478:	97ffeef0 	bl	ffffff8040084038 <envid2env>
ffffff804008847c:	b9002fa0 	str	w0, [x29, #44]
ffffff8040088480:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040088484:	7100001f 	cmp	w0, #0x0
ffffff8040088488:	5400006a 	b.ge	ffffff8040088494 <sys_env_destroy+0x70>  // b.tcont
ffffff804008848c:	b9402fa0 	ldr	w0, [x29, #44]
ffffff8040088490:	14000004 	b	ffffff80400884a0 <sys_env_destroy+0x7c>
ffffff8040088494:	f94013a0 	ldr	x0, [x29, #32]
ffffff8040088498:	97fff195 	bl	ffffff8040084aec <env_destroy>
ffffff804008849c:	52800000 	mov	w0, #0x0                   	// #0
ffffff80400884a0:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400884a4:	d65f03c0 	ret

ffffff80400884a8 <sys_set_pgfault_handler>:
ffffff80400884a8:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
ffffff80400884ac:	910003fd 	mov	x29, sp
ffffff80400884b0:	b9002fa0 	str	w0, [x29, #44]
ffffff80400884b4:	b9002ba1 	str	w1, [x29, #40]
ffffff80400884b8:	f90013a2 	str	x2, [x29, #32]
ffffff80400884bc:	f9000fa3 	str	x3, [x29, #24]
ffffff80400884c0:	b9402ba0 	ldr	w0, [x29, #40]
ffffff80400884c4:	12002400 	and	w0, w0, #0x3ff
ffffff80400884c8:	d2800401 	mov	x1, #0x20                  	// #32
ffffff80400884cc:	97ffee34 	bl	ffffff8040083d9c <check_env_right>
ffffff80400884d0:	12001c00 	and	w0, w0, #0xff
ffffff80400884d4:	b9003fa0 	str	w0, [x29, #60]
ffffff80400884d8:	b9403fa0 	ldr	w0, [x29, #60]
ffffff80400884dc:	7100001f 	cmp	w0, #0x0
ffffff80400884e0:	540000ca 	b.ge	ffffff80400884f8 <sys_set_pgfault_handler+0x50>  // b.tcont
ffffff80400884e4:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff80400884e8:	91126000 	add	x0, x0, #0x498
ffffff80400884ec:	97fffb67 	bl	ffffff8040087288 <printf>
ffffff80400884f0:	b9403fa0 	ldr	w0, [x29, #60]
ffffff80400884f4:	14000013 	b	ffffff8040088540 <sys_set_pgfault_handler+0x98>
ffffff80400884f8:	9100c3a0 	add	x0, x29, #0x30
ffffff80400884fc:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040088500:	aa0003e1 	mov	x1, x0
ffffff8040088504:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040088508:	97ffeecc 	bl	ffffff8040084038 <envid2env>
ffffff804008850c:	b9003fa0 	str	w0, [x29, #60]
ffffff8040088510:	b9403fa0 	ldr	w0, [x29, #60]
ffffff8040088514:	7100001f 	cmp	w0, #0x0
ffffff8040088518:	5400006a 	b.ge	ffffff8040088524 <sys_set_pgfault_handler+0x7c>  // b.tcont
ffffff804008851c:	b9403fa0 	ldr	w0, [x29, #60]
ffffff8040088520:	14000008 	b	ffffff8040088540 <sys_set_pgfault_handler+0x98>
ffffff8040088524:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040088528:	f94013a1 	ldr	x1, [x29, #32]
ffffff804008852c:	f900b801 	str	x1, [x0, #368]
ffffff8040088530:	f9401ba0 	ldr	x0, [x29, #48]
ffffff8040088534:	f9400fa1 	ldr	x1, [x29, #24]
ffffff8040088538:	f900bc01 	str	x1, [x0, #376]
ffffff804008853c:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040088540:	a8c47bfd 	ldp	x29, x30, [sp], #64
ffffff8040088544:	d65f03c0 	ret

ffffff8040088548 <sys_set_trapframe>:
ffffff8040088548:	d10043ff 	sub	sp, sp, #0x10
ffffff804008854c:	b9000fe0 	str	w0, [sp, #12]
ffffff8040088550:	b9000be1 	str	w1, [sp, #8]
ffffff8040088554:	f90003e2 	str	x2, [sp]
ffffff8040088558:	d503201f 	nop
ffffff804008855c:	910043ff 	add	sp, sp, #0x10
ffffff8040088560:	d65f03c0 	ret

ffffff8040088564 <sys_ipc_recv>:
ffffff8040088564:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040088568:	910003fd 	mov	x29, sp
ffffff804008856c:	b9001fa0 	str	w0, [x29, #28]
ffffff8040088570:	f9000ba1 	str	x1, [x29, #16]
ffffff8040088574:	97ffee5c 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088578:	12001c00 	and	w0, w0, #0xff
ffffff804008857c:	b9002fa0 	str	w0, [x29, #44]
ffffff8040088580:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088584:	91194000 	add	x0, x0, #0x650
ffffff8040088588:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff804008858c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088590:	f9400ba1 	ldr	x1, [x29, #16]
ffffff8040088594:	f900b001 	str	x1, [x0, #352]
ffffff8040088598:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff804008859c:	91194000 	add	x0, x0, #0x650
ffffff80400885a0:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff80400885a4:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400885a8:	52800021 	mov	w1, #0x1                   	// #1
ffffff80400885ac:	b9015c01 	str	w1, [x0, #348]
ffffff80400885b0:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff80400885b4:	91194000 	add	x0, x0, #0x650
ffffff80400885b8:	b9802fa1 	ldrsw	x1, [x29, #44]
ffffff80400885bc:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400885c0:	52800041 	mov	w1, #0x2                   	// #2
ffffff80400885c4:	b9012801 	str	w1, [x0, #296]
ffffff80400885c8:	97fffbb3 	bl	ffffff8040087494 <sched_yield>
ffffff80400885cc:	d503201f 	nop
ffffff80400885d0:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff80400885d4:	d65f03c0 	ret

ffffff80400885d8 <sys_ipc_can_send>:
ffffff80400885d8:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff80400885dc:	910003fd 	mov	x29, sp
ffffff80400885e0:	b9002fa0 	str	w0, [x29, #44]
ffffff80400885e4:	b9002ba1 	str	w1, [x29, #40]
ffffff80400885e8:	f90013a2 	str	x2, [x29, #32]
ffffff80400885ec:	f9000fa3 	str	x3, [x29, #24]
ffffff80400885f0:	f9000ba4 	str	x4, [x29, #16]
ffffff80400885f4:	9100e3a0 	add	x0, x29, #0x38
ffffff80400885f8:	52800002 	mov	w2, #0x0                   	// #0
ffffff80400885fc:	aa0003e1 	mov	x1, x0
ffffff8040088600:	b9402ba0 	ldr	w0, [x29, #40]
ffffff8040088604:	97ffee8d 	bl	ffffff8040084038 <envid2env>
ffffff8040088608:	b9004fa0 	str	w0, [x29, #76]
ffffff804008860c:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088610:	7100001f 	cmp	w0, #0x0
ffffff8040088614:	540000ca 	b.ge	ffffff804008862c <sys_ipc_can_send+0x54>  // b.tcont
ffffff8040088618:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff804008861c:	91158000 	add	x0, x0, #0x560
ffffff8040088620:	97fffb1a 	bl	ffffff8040087288 <printf>
ffffff8040088624:	12800020 	mov	w0, #0xfffffffe            	// #-2
ffffff8040088628:	14000044 	b	ffffff8040088738 <sys_ipc_can_send+0x160>
ffffff804008862c:	97ffee2e 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088630:	12001c00 	and	w0, w0, #0xff
ffffff8040088634:	b9004ba0 	str	w0, [x29, #72]
ffffff8040088638:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008863c:	f100001f 	cmp	x0, #0x0
ffffff8040088640:	54000500 	b.eq	ffffff80400886e0 <sys_ipc_can_send+0x108>  // b.none
ffffff8040088644:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088648:	f940b000 	ldr	x0, [x0, #352]
ffffff804008864c:	f100001f 	cmp	x0, #0x0
ffffff8040088650:	54000480 	b.eq	ffffff80400886e0 <sys_ipc_can_send+0x108>  // b.none
ffffff8040088654:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088658:	91194000 	add	x0, x0, #0x650
ffffff804008865c:	b9804ba1 	ldrsw	x1, [x29, #72]
ffffff8040088660:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088664:	f9409804 	ldr	x4, [x0, #304]
ffffff8040088668:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff804008866c:	91194000 	add	x0, x0, #0x650
ffffff8040088670:	b9804ba1 	ldrsw	x1, [x29, #72]
ffffff8040088674:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088678:	b9412001 	ldr	w1, [x0, #288]
ffffff804008867c:	9100c3a0 	add	x0, x29, #0x30
ffffff8040088680:	2a0103e3 	mov	w3, w1
ffffff8040088684:	aa0003e2 	mov	x2, x0
ffffff8040088688:	f9400fa1 	ldr	x1, [x29, #24]
ffffff804008868c:	aa0403e0 	mov	x0, x4
ffffff8040088690:	97fff5d4 	bl	ffffff8040085de0 <page_lookup>
ffffff8040088694:	f90023a0 	str	x0, [x29, #64]
ffffff8040088698:	f9401fa0 	ldr	x0, [x29, #56]
ffffff804008869c:	f9409805 	ldr	x5, [x0, #304]
ffffff80400886a0:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400886a4:	f940b002 	ldr	x2, [x0, #352]
ffffff80400886a8:	f9400ba1 	ldr	x1, [x29, #16]
ffffff80400886ac:	d2800860 	mov	x0, #0x43                  	// #67
ffffff80400886b0:	aa000021 	orr	x1, x1, x0
ffffff80400886b4:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400886b8:	b9412000 	ldr	w0, [x0, #288]
ffffff80400886bc:	12002400 	and	w0, w0, #0x3ff
ffffff80400886c0:	2a0003e4 	mov	w4, w0
ffffff80400886c4:	aa0103e3 	mov	x3, x1
ffffff80400886c8:	f94023a1 	ldr	x1, [x29, #64]
ffffff80400886cc:	aa0503e0 	mov	x0, x5
ffffff80400886d0:	97fff563 	bl	ffffff8040085c5c <page_insert>
ffffff80400886d4:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400886d8:	f9400ba1 	ldr	x1, [x29, #16]
ffffff80400886dc:	f900b401 	str	x1, [x0, #360]
ffffff80400886e0:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400886e4:	b9415c00 	ldr	w0, [x0, #348]
ffffff80400886e8:	7100001f 	cmp	w0, #0x0
ffffff80400886ec:	54000061 	b.ne	ffffff80400886f8 <sys_ipc_can_send+0x120>  // b.any
ffffff80400886f0:	128000a0 	mov	w0, #0xfffffffa            	// #-6
ffffff80400886f4:	14000011 	b	ffffff8040088738 <sys_ipc_can_send+0x160>
ffffff80400886f8:	f9401fa0 	ldr	x0, [x29, #56]
ffffff80400886fc:	b9015c1f 	str	wzr, [x0, #348]
ffffff8040088700:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088704:	91194000 	add	x0, x0, #0x650
ffffff8040088708:	b9804ba1 	ldrsw	x1, [x29, #72]
ffffff804008870c:	f8617801 	ldr	x1, [x0, x1, lsl #3]
ffffff8040088710:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088714:	b9412021 	ldr	w1, [x1, #288]
ffffff8040088718:	b9015801 	str	w1, [x0, #344]
ffffff804008871c:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088720:	f94013a1 	ldr	x1, [x29, #32]
ffffff8040088724:	f900a801 	str	x1, [x0, #336]
ffffff8040088728:	f9401fa0 	ldr	x0, [x29, #56]
ffffff804008872c:	52800021 	mov	w1, #0x1                   	// #1
ffffff8040088730:	b9012801 	str	w1, [x0, #296]
ffffff8040088734:	52800000 	mov	w0, #0x0                   	// #0
ffffff8040088738:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff804008873c:	d65f03c0 	ret

ffffff8040088740 <get_el>:
ffffff8040088740:	d10043ff 	sub	sp, sp, #0x10
ffffff8040088744:	d5384240 	mrs	x0, currentel
ffffff8040088748:	f90007e0 	str	x0, [sp, #8]
ffffff804008874c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040088750:	910043ff 	add	sp, sp, #0x10
ffffff8040088754:	d65f03c0 	ret

ffffff8040088758 <get_elr>:
ffffff8040088758:	d10043ff 	sub	sp, sp, #0x10
ffffff804008875c:	d5384020 	mrs	x0, elr_el1
ffffff8040088760:	f90007e0 	str	x0, [sp, #8]
ffffff8040088764:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040088768:	910043ff 	add	sp, sp, #0x10
ffffff804008876c:	d65f03c0 	ret

ffffff8040088770 <get_esr>:
ffffff8040088770:	d10043ff 	sub	sp, sp, #0x10
ffffff8040088774:	d5385200 	mrs	x0, esr_el1
ffffff8040088778:	f90007e0 	str	x0, [sp, #8]
ffffff804008877c:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040088780:	910043ff 	add	sp, sp, #0x10
ffffff8040088784:	d65f03c0 	ret

ffffff8040088788 <get_far>:
ffffff8040088788:	d10043ff 	sub	sp, sp, #0x10
ffffff804008878c:	d5386000 	mrs	x0, far_el1
ffffff8040088790:	f90007e0 	str	x0, [sp, #8]
ffffff8040088794:	f94007e0 	ldr	x0, [sp, #8]
ffffff8040088798:	910043ff 	add	sp, sp, #0x10
ffffff804008879c:	d65f03c0 	ret

ffffff80400887a0 <handle_el0_syscall>:
ffffff80400887a0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
ffffff80400887a4:	910003fd 	mov	x29, sp
ffffff80400887a8:	97ffedcf 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff80400887ac:	12001c00 	and	w0, w0, #0xff
ffffff80400887b0:	2a0003e1 	mov	w1, w0
ffffff80400887b4:	900084a0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff80400887b8:	9119e000 	add	x0, x0, #0x678
ffffff80400887bc:	93407c21 	sxtw	x1, w1
ffffff80400887c0:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400887c4:	f9400000 	ldr	x0, [x0]
ffffff80400887c8:	b9004fa0 	str	w0, [x29, #76]
ffffff80400887cc:	97ffedc6 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff80400887d0:	12001c00 	and	w0, w0, #0xff
ffffff80400887d4:	2a0003e1 	mov	w1, w0
ffffff80400887d8:	900084a0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff80400887dc:	9119e000 	add	x0, x0, #0x678
ffffff80400887e0:	93407c21 	sxtw	x1, w1
ffffff80400887e4:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff80400887e8:	f9400400 	ldr	x0, [x0, #8]
ffffff80400887ec:	f90023a0 	str	x0, [x29, #64]
ffffff80400887f0:	97ffedbd 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff80400887f4:	12001c00 	and	w0, w0, #0xff
ffffff80400887f8:	2a0003e1 	mov	w1, w0
ffffff80400887fc:	900084a0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff8040088800:	9119e000 	add	x0, x0, #0x678
ffffff8040088804:	93407c21 	sxtw	x1, w1
ffffff8040088808:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff804008880c:	f9400800 	ldr	x0, [x0, #16]
ffffff8040088810:	f9001fa0 	str	x0, [x29, #56]
ffffff8040088814:	97ffedb4 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088818:	12001c00 	and	w0, w0, #0xff
ffffff804008881c:	2a0003e1 	mov	w1, w0
ffffff8040088820:	900084a0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff8040088824:	9119e000 	add	x0, x0, #0x678
ffffff8040088828:	93407c21 	sxtw	x1, w1
ffffff804008882c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088830:	f9400c00 	ldr	x0, [x0, #24]
ffffff8040088834:	f9001ba0 	str	x0, [x29, #48]
ffffff8040088838:	97ffedab 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff804008883c:	12001c00 	and	w0, w0, #0xff
ffffff8040088840:	2a0003e1 	mov	w1, w0
ffffff8040088844:	900084a0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff8040088848:	9119e000 	add	x0, x0, #0x678
ffffff804008884c:	93407c21 	sxtw	x1, w1
ffffff8040088850:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088854:	f9401000 	ldr	x0, [x0, #32]
ffffff8040088858:	f90017a0 	str	x0, [x29, #40]
ffffff804008885c:	97ffeda2 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088860:	12001c00 	and	w0, w0, #0xff
ffffff8040088864:	2a0003e1 	mov	w1, w0
ffffff8040088868:	900084a0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff804008886c:	9119e000 	add	x0, x0, #0x678
ffffff8040088870:	93407c21 	sxtw	x1, w1
ffffff8040088874:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088878:	f9401400 	ldr	x0, [x0, #40]
ffffff804008887c:	f90013a0 	str	x0, [x29, #32]
ffffff8040088880:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088884:	71001c1f 	cmp	w0, #0x7
ffffff8040088888:	54000b80 	b.eq	ffffff80400889f8 <handle_el0_syscall+0x258>  // b.none
ffffff804008888c:	71001c1f 	cmp	w0, #0x7
ffffff8040088890:	540001ec 	b.gt	ffffff80400888cc <handle_el0_syscall+0x12c>
ffffff8040088894:	71000c1f 	cmp	w0, #0x3
ffffff8040088898:	54000560 	b.eq	ffffff8040088944 <handle_el0_syscall+0x1a4>  // b.none
ffffff804008889c:	71000c1f 	cmp	w0, #0x3
ffffff80400888a0:	540000cc 	b.gt	ffffff80400888b8 <handle_el0_syscall+0x118>
ffffff80400888a4:	7100041f 	cmp	w0, #0x1
ffffff80400888a8:	540003c0 	b.eq	ffffff8040088920 <handle_el0_syscall+0x180>  // b.none
ffffff80400888ac:	7100081f 	cmp	w0, #0x2
ffffff80400888b0:	54000440 	b.eq	ffffff8040088938 <handle_el0_syscall+0x198>  // b.none
ffffff80400888b4:	14000015 	b	ffffff8040088908 <handle_el0_syscall+0x168>
ffffff80400888b8:	7100141f 	cmp	w0, #0x5
ffffff80400888bc:	540006c0 	b.eq	ffffff8040088994 <handle_el0_syscall+0x1f4>  // b.none
ffffff80400888c0:	7100141f 	cmp	w0, #0x5
ffffff80400888c4:	540007ec 	b.gt	ffffff80400889c0 <handle_el0_syscall+0x220>
ffffff80400888c8:	14000028 	b	ffffff8040088968 <handle_el0_syscall+0x1c8>
ffffff80400888cc:	71002c1f 	cmp	w0, #0xb
ffffff80400888d0:	54000da0 	b.eq	ffffff8040088a84 <handle_el0_syscall+0x2e4>  // b.none
ffffff80400888d4:	71002c1f 	cmp	w0, #0xb
ffffff80400888d8:	540000cc 	b.gt	ffffff80400888f0 <handle_el0_syscall+0x150>
ffffff80400888dc:	7100241f 	cmp	w0, #0x9
ffffff80400888e0:	54000ae0 	b.eq	ffffff8040088a3c <handle_el0_syscall+0x29c>  // b.none
ffffff80400888e4:	7100241f 	cmp	w0, #0x9
ffffff80400888e8:	54000c0c 	b.gt	ffffff8040088a68 <handle_el0_syscall+0x2c8>
ffffff80400888ec:	1400004d 	b	ffffff8040088a20 <handle_el0_syscall+0x280>
ffffff80400888f0:	7100341f 	cmp	w0, #0xd
ffffff80400888f4:	54000ea0 	b.eq	ffffff8040088ac8 <handle_el0_syscall+0x328>  // b.none
ffffff80400888f8:	7100341f 	cmp	w0, #0xd
ffffff80400888fc:	54000ceb 	b.lt	ffffff8040088a98 <handle_el0_syscall+0x2f8>  // b.tstop
ffffff8040088900:	7100381f 	cmp	w0, #0xe
ffffff8040088904:	54000ea0 	b.eq	ffffff8040088ad8 <handle_el0_syscall+0x338>  // b.none
ffffff8040088908:	f94023a0 	ldr	x0, [x29, #64]
ffffff804008890c:	12001c00 	and	w0, w0, #0xff
ffffff8040088910:	2a0003e1 	mov	w1, w0
ffffff8040088914:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088918:	97fffc8c 	bl	ffffff8040087b48 <sys_putchar>
ffffff804008891c:	14000076 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088920:	97fffe93 	bl	ffffff804008836c <sys_getenvid>
ffffff8040088924:	2a0003e0 	mov	w0, w0
ffffff8040088928:	f9000fa0 	str	x0, [x29, #24]
ffffff804008892c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088930:	97fffc77 	bl	ffffff8040087b0c <sys_set_return>
ffffff8040088934:	14000070 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088938:	f94023a0 	ldr	x0, [x29, #64]
ffffff804008893c:	97fffea8 	bl	ffffff80400883dc <sys_yield>
ffffff8040088940:	1400006d 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088944:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088948:	2a0003e1 	mov	w1, w0
ffffff804008894c:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088950:	97fffeb5 	bl	ffffff8040088424 <sys_env_destroy>
ffffff8040088954:	93407c00 	sxtw	x0, w0
ffffff8040088958:	f9000fa0 	str	x0, [x29, #24]
ffffff804008895c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088960:	97fffc6b 	bl	ffffff8040087b0c <sys_set_return>
ffffff8040088964:	14000064 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088968:	f94023a0 	ldr	x0, [x29, #64]
ffffff804008896c:	f9401ba3 	ldr	x3, [x29, #48]
ffffff8040088970:	f9401fa2 	ldr	x2, [x29, #56]
ffffff8040088974:	2a0003e1 	mov	w1, w0
ffffff8040088978:	b9404fa0 	ldr	w0, [x29, #76]
ffffff804008897c:	97fffecb 	bl	ffffff80400884a8 <sys_set_pgfault_handler>
ffffff8040088980:	93407c00 	sxtw	x0, w0
ffffff8040088984:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088988:	f9400fa0 	ldr	x0, [x29, #24]
ffffff804008898c:	97fffc60 	bl	ffffff8040087b0c <sys_set_return>
ffffff8040088990:	14000059 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088994:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088998:	f9401ba3 	ldr	x3, [x29, #48]
ffffff804008899c:	f9401fa2 	ldr	x2, [x29, #56]
ffffff80400889a0:	2a0003e1 	mov	w1, w0
ffffff80400889a4:	b9404fa0 	ldr	w0, [x29, #76]
ffffff80400889a8:	97fffc7f 	bl	ffffff8040087ba4 <sys_mem_alloc>
ffffff80400889ac:	93407c00 	sxtw	x0, w0
ffffff80400889b0:	f9000fa0 	str	x0, [x29, #24]
ffffff80400889b4:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400889b8:	97fffc55 	bl	ffffff8040087b0c <sys_set_return>
ffffff80400889bc:	1400004e 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff80400889c0:	f94023a0 	ldr	x0, [x29, #64]
ffffff80400889c4:	2a0003e1 	mov	w1, w0
ffffff80400889c8:	f9401ba0 	ldr	x0, [x29, #48]
ffffff80400889cc:	f94013a5 	ldr	x5, [x29, #32]
ffffff80400889d0:	f94017a4 	ldr	x4, [x29, #40]
ffffff80400889d4:	2a0003e3 	mov	w3, w0
ffffff80400889d8:	f9401fa2 	ldr	x2, [x29, #56]
ffffff80400889dc:	b9404fa0 	ldr	w0, [x29, #76]
ffffff80400889e0:	97fffcc4 	bl	ffffff8040087cf0 <sys_mem_map>
ffffff80400889e4:	93407c00 	sxtw	x0, w0
ffffff80400889e8:	f9000fa0 	str	x0, [x29, #24]
ffffff80400889ec:	f9400fa0 	ldr	x0, [x29, #24]
ffffff80400889f0:	97fffc47 	bl	ffffff8040087b0c <sys_set_return>
ffffff80400889f4:	14000040 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff80400889f8:	f94023a0 	ldr	x0, [x29, #64]
ffffff80400889fc:	f9401fa2 	ldr	x2, [x29, #56]
ffffff8040088a00:	2a0003e1 	mov	w1, w0
ffffff8040088a04:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088a08:	97fffd14 	bl	ffffff8040087e58 <sys_mem_unmap>
ffffff8040088a0c:	93407c00 	sxtw	x0, w0
ffffff8040088a10:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088a14:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088a18:	97fffc3d 	bl	ffffff8040087b0c <sys_set_return>
ffffff8040088a1c:	14000036 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088a20:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088a24:	97fffd51 	bl	ffffff8040087f68 <sys_env_alloc>
ffffff8040088a28:	2a0003e0 	mov	w0, w0
ffffff8040088a2c:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088a30:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088a34:	97fffc36 	bl	ffffff8040087b0c <sys_set_return>
ffffff8040088a38:	1400002f 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088a3c:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088a40:	2a0003e1 	mov	w1, w0
ffffff8040088a44:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088a48:	2a0003e2 	mov	w2, w0
ffffff8040088a4c:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088a50:	97fffdba 	bl	ffffff8040088138 <sys_set_env_status>
ffffff8040088a54:	93407c00 	sxtw	x0, w0
ffffff8040088a58:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088a5c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088a60:	97fffc2b 	bl	ffffff8040087b0c <sys_set_return>
ffffff8040088a64:	14000024 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088a68:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088a6c:	2a0003e1 	mov	w1, w0
ffffff8040088a70:	f9401fa0 	ldr	x0, [x29, #56]
ffffff8040088a74:	aa0003e2 	mov	x2, x0
ffffff8040088a78:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088a7c:	97fffeb3 	bl	ffffff8040088548 <sys_set_trapframe>
ffffff8040088a80:	1400001d 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088a84:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088a88:	aa0003e1 	mov	x1, x0
ffffff8040088a8c:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088a90:	97fffc39 	bl	ffffff8040087b74 <sys_panic>
ffffff8040088a94:	14000018 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088a98:	f94023a0 	ldr	x0, [x29, #64]
ffffff8040088a9c:	f94017a4 	ldr	x4, [x29, #40]
ffffff8040088aa0:	f9401ba3 	ldr	x3, [x29, #48]
ffffff8040088aa4:	f9401fa2 	ldr	x2, [x29, #56]
ffffff8040088aa8:	2a0003e1 	mov	w1, w0
ffffff8040088aac:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088ab0:	97fffeca 	bl	ffffff80400885d8 <sys_ipc_can_send>
ffffff8040088ab4:	93407c00 	sxtw	x0, w0
ffffff8040088ab8:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088abc:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088ac0:	97fffc13 	bl	ffffff8040087b0c <sys_set_return>
ffffff8040088ac4:	1400000c 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088ac8:	f94023a1 	ldr	x1, [x29, #64]
ffffff8040088acc:	b9404fa0 	ldr	w0, [x29, #76]
ffffff8040088ad0:	97fffea5 	bl	ffffff8040088564 <sys_ipc_recv>
ffffff8040088ad4:	14000008 	b	ffffff8040088af4 <handle_el0_syscall+0x354>
ffffff8040088ad8:	97fffc25 	bl	ffffff8040087b6c <sys_cgetc>
ffffff8040088adc:	12001c00 	and	w0, w0, #0xff
ffffff8040088ae0:	92401c00 	and	x0, x0, #0xff
ffffff8040088ae4:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088ae8:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088aec:	97fffc08 	bl	ffffff8040087b0c <sys_set_return>
ffffff8040088af0:	d503201f 	nop
ffffff8040088af4:	d503201f 	nop
ffffff8040088af8:	a8c57bfd 	ldp	x29, x30, [sp], #80
ffffff8040088afc:	d65f03c0 	ret

ffffff8040088b00 <handle_el0_pgfault>:
ffffff8040088b00:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
ffffff8040088b04:	910003fd 	mov	x29, sp
ffffff8040088b08:	97ffff20 	bl	ffffff8040088788 <get_far>
ffffff8040088b0c:	f90017a0 	str	x0, [x29, #40]
ffffff8040088b10:	97ffecf5 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088b14:	12001c00 	and	w0, w0, #0xff
ffffff8040088b18:	b90027a0 	str	w0, [x29, #36]
ffffff8040088b1c:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088b20:	91194000 	add	x0, x0, #0x650
ffffff8040088b24:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040088b28:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088b2c:	f940b800 	ldr	x0, [x0, #368]
ffffff8040088b30:	f100001f 	cmp	x0, #0x0
ffffff8040088b34:	540002c1 	b.ne	ffffff8040088b8c <handle_el0_pgfault+0x8c>  // b.any
ffffff8040088b38:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088b3c:	91162000 	add	x0, x0, #0x588
ffffff8040088b40:	b94027a1 	ldr	w1, [x29, #36]
ffffff8040088b44:	97fff9d1 	bl	ffffff8040087288 <printf>
ffffff8040088b48:	97ffff0a 	bl	ffffff8040088770 <get_esr>
ffffff8040088b4c:	aa0003e1 	mov	x1, x0
ffffff8040088b50:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088b54:	91168000 	add	x0, x0, #0x5a0
ffffff8040088b58:	97fff9cc 	bl	ffffff8040087288 <printf>
ffffff8040088b5c:	97ffff0b 	bl	ffffff8040088788 <get_far>
ffffff8040088b60:	aa0003e1 	mov	x1, x0
ffffff8040088b64:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088b68:	9116c000 	add	x0, x0, #0x5b0
ffffff8040088b6c:	97fff9c7 	bl	ffffff8040087288 <printf>
ffffff8040088b70:	97fffefa 	bl	ffffff8040088758 <get_elr>
ffffff8040088b74:	aa0003e1 	mov	x1, x0
ffffff8040088b78:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088b7c:	91170000 	add	x0, x0, #0x5c0
ffffff8040088b80:	97fff9c2 	bl	ffffff8040087288 <printf>
ffffff8040088b84:	d503207f 	wfi
ffffff8040088b88:	17ffffff 	b	ffffff8040088b84 <handle_el0_pgfault+0x84>
ffffff8040088b8c:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088b90:	91194000 	add	x0, x0, #0x650
ffffff8040088b94:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040088b98:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088b9c:	f9409805 	ldr	x5, [x0, #304]
ffffff8040088ba0:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088ba4:	91194000 	add	x0, x0, #0x650
ffffff8040088ba8:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040088bac:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088bb0:	b9412001 	ldr	w1, [x0, #288]
ffffff8040088bb4:	910043a0 	add	x0, x29, #0x10
ffffff8040088bb8:	2a0103e4 	mov	w4, w1
ffffff8040088bbc:	aa0003e3 	mov	x3, x0
ffffff8040088bc0:	52800002 	mov	w2, #0x0                   	// #0
ffffff8040088bc4:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040088bc8:	aa0503e0 	mov	x0, x5
ffffff8040088bcc:	97fff3af 	bl	ffffff8040085a88 <pgdir_walk>
ffffff8040088bd0:	f9400ba0 	ldr	x0, [x29, #16]
ffffff8040088bd4:	f9400000 	ldr	x0, [x0]
ffffff8040088bd8:	92490000 	and	x0, x0, #0x80000000000000
ffffff8040088bdc:	f100001f 	cmp	x0, #0x0
ffffff8040088be0:	540002c1 	b.ne	ffffff8040088c38 <handle_el0_pgfault+0x138>  // b.any
ffffff8040088be4:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088be8:	91162000 	add	x0, x0, #0x588
ffffff8040088bec:	b94027a1 	ldr	w1, [x29, #36]
ffffff8040088bf0:	97fff9a6 	bl	ffffff8040087288 <printf>
ffffff8040088bf4:	97fffedf 	bl	ffffff8040088770 <get_esr>
ffffff8040088bf8:	aa0003e1 	mov	x1, x0
ffffff8040088bfc:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088c00:	91168000 	add	x0, x0, #0x5a0
ffffff8040088c04:	97fff9a1 	bl	ffffff8040087288 <printf>
ffffff8040088c08:	97fffee0 	bl	ffffff8040088788 <get_far>
ffffff8040088c0c:	aa0003e1 	mov	x1, x0
ffffff8040088c10:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088c14:	9116c000 	add	x0, x0, #0x5b0
ffffff8040088c18:	97fff99c 	bl	ffffff8040087288 <printf>
ffffff8040088c1c:	97fffecf 	bl	ffffff8040088758 <get_elr>
ffffff8040088c20:	aa0003e1 	mov	x1, x0
ffffff8040088c24:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088c28:	91170000 	add	x0, x0, #0x5c0
ffffff8040088c2c:	97fff997 	bl	ffffff8040087288 <printf>
ffffff8040088c30:	d503207f 	wfi
ffffff8040088c34:	17ffffff 	b	ffffff8040088c30 <handle_el0_pgfault+0x130>
ffffff8040088c38:	900084a0 	adrp	x0, ffffff804111c000 <pages+0x8ff988>
ffffff8040088c3c:	9119e000 	add	x0, x0, #0x678
ffffff8040088c40:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040088c44:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088c48:	f9000fa0 	str	x0, [x29, #24]
ffffff8040088c4c:	d2802202 	mov	x2, #0x110                 	// #272
ffffff8040088c50:	d29fde01 	mov	x1, #0xfef0                	// #65264
ffffff8040088c54:	f2afffe1 	movk	x1, #0x7fff, lsl #16
ffffff8040088c58:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088c5c:	97fff2f4 	bl	ffffff804008582c <bcopy>
ffffff8040088c60:	90003ca0 	adrp	x0, ffffff804081c000 <envs+0x619c8>
ffffff8040088c64:	91194000 	add	x0, x0, #0x650
ffffff8040088c68:	b98027a1 	ldrsw	x1, [x29, #36]
ffffff8040088c6c:	f8617800 	ldr	x0, [x0, x1, lsl #3]
ffffff8040088c70:	f940b801 	ldr	x1, [x0, #368]
ffffff8040088c74:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088c78:	f9008001 	str	x1, [x0, #256]
ffffff8040088c7c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088c80:	d29fde01 	mov	x1, #0xfef0                	// #65264
ffffff8040088c84:	f2afffe1 	movk	x1, #0x7fff, lsl #16
ffffff8040088c88:	f9008401 	str	x1, [x0, #264]
ffffff8040088c8c:	f9400fa0 	ldr	x0, [x29, #24]
ffffff8040088c90:	f94017a1 	ldr	x1, [x29, #40]
ffffff8040088c94:	f9000001 	str	x1, [x0]
ffffff8040088c98:	d503201f 	nop
ffffff8040088c9c:	a8c37bfd 	ldp	x29, x30, [sp], #48
ffffff8040088ca0:	d65f03c0 	ret

ffffff8040088ca4 <handle_el0_sync>:
ffffff8040088ca4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff8040088ca8:	910003fd 	mov	x29, sp
ffffff8040088cac:	97ffec8e 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088cb0:	12001c00 	and	w0, w0, #0xff
ffffff8040088cb4:	2a0003e1 	mov	w1, w0
ffffff8040088cb8:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088cbc:	91176000 	add	x0, x0, #0x5d8
ffffff8040088cc0:	97fff972 	bl	ffffff8040087288 <printf>
ffffff8040088cc4:	97fffeab 	bl	ffffff8040088770 <get_esr>
ffffff8040088cc8:	aa0003e1 	mov	x1, x0
ffffff8040088ccc:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088cd0:	91168000 	add	x0, x0, #0x5a0
ffffff8040088cd4:	97fff96d 	bl	ffffff8040087288 <printf>
ffffff8040088cd8:	97fffea6 	bl	ffffff8040088770 <get_esr>
ffffff8040088cdc:	d35afc01 	lsr	x1, x0, #26
ffffff8040088ce0:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088ce4:	9117e000 	add	x0, x0, #0x5f8
ffffff8040088ce8:	97fff968 	bl	ffffff8040087288 <printf>
ffffff8040088cec:	97fffea7 	bl	ffffff8040088788 <get_far>
ffffff8040088cf0:	aa0003e1 	mov	x1, x0
ffffff8040088cf4:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088cf8:	91182000 	add	x0, x0, #0x608
ffffff8040088cfc:	97fff963 	bl	ffffff8040087288 <printf>
ffffff8040088d00:	97fffe96 	bl	ffffff8040088758 <get_elr>
ffffff8040088d04:	aa0003e1 	mov	x1, x0
ffffff8040088d08:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088d0c:	91186000 	add	x0, x0, #0x618
ffffff8040088d10:	97fff95e 	bl	ffffff8040087288 <printf>
ffffff8040088d14:	d503207f 	wfi
ffffff8040088d18:	17ffffff 	b	ffffff8040088d14 <handle_el0_sync+0x70>

ffffff8040088d1c <handle_el1_sync>:
ffffff8040088d1c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff8040088d20:	910003fd 	mov	x29, sp
ffffff8040088d24:	97ffec70 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088d28:	12001c00 	and	w0, w0, #0xff
ffffff8040088d2c:	2a0003e1 	mov	w1, w0
ffffff8040088d30:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088d34:	9118a000 	add	x0, x0, #0x628
ffffff8040088d38:	97fff954 	bl	ffffff8040087288 <printf>
ffffff8040088d3c:	97fffe8d 	bl	ffffff8040088770 <get_esr>
ffffff8040088d40:	aa0003e1 	mov	x1, x0
ffffff8040088d44:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088d48:	91168000 	add	x0, x0, #0x5a0
ffffff8040088d4c:	97fff94f 	bl	ffffff8040087288 <printf>
ffffff8040088d50:	97fffe88 	bl	ffffff8040088770 <get_esr>
ffffff8040088d54:	d35afc01 	lsr	x1, x0, #26
ffffff8040088d58:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088d5c:	9117e000 	add	x0, x0, #0x5f8
ffffff8040088d60:	97fff94a 	bl	ffffff8040087288 <printf>
ffffff8040088d64:	97fffe89 	bl	ffffff8040088788 <get_far>
ffffff8040088d68:	aa0003e1 	mov	x1, x0
ffffff8040088d6c:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088d70:	91182000 	add	x0, x0, #0x608
ffffff8040088d74:	97fff945 	bl	ffffff8040087288 <printf>
ffffff8040088d78:	97fffe78 	bl	ffffff8040088758 <get_elr>
ffffff8040088d7c:	aa0003e1 	mov	x1, x0
ffffff8040088d80:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088d84:	91186000 	add	x0, x0, #0x618
ffffff8040088d88:	97fff940 	bl	ffffff8040087288 <printf>
ffffff8040088d8c:	d503207f 	wfi
ffffff8040088d90:	17ffffff 	b	ffffff8040088d8c <handle_el1_sync+0x70>

ffffff8040088d94 <handle_fiq>:
ffffff8040088d94:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff8040088d98:	910003fd 	mov	x29, sp
ffffff8040088d9c:	97ffec52 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088da0:	12001c00 	and	w0, w0, #0xff
ffffff8040088da4:	2a0003e1 	mov	w1, w0
ffffff8040088da8:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088dac:	91192000 	add	x0, x0, #0x648
ffffff8040088db0:	97fff936 	bl	ffffff8040087288 <printf>
ffffff8040088db4:	97fffe63 	bl	ffffff8040088740 <get_el>
ffffff8040088db8:	aa0003e1 	mov	x1, x0
ffffff8040088dbc:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088dc0:	9119a000 	add	x0, x0, #0x668
ffffff8040088dc4:	97fff931 	bl	ffffff8040087288 <printf>
ffffff8040088dc8:	97fffe6a 	bl	ffffff8040088770 <get_esr>
ffffff8040088dcc:	aa0003e1 	mov	x1, x0
ffffff8040088dd0:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088dd4:	91168000 	add	x0, x0, #0x5a0
ffffff8040088dd8:	97fff92c 	bl	ffffff8040087288 <printf>
ffffff8040088ddc:	97fffe6b 	bl	ffffff8040088788 <get_far>
ffffff8040088de0:	aa0003e1 	mov	x1, x0
ffffff8040088de4:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088de8:	91182000 	add	x0, x0, #0x608
ffffff8040088dec:	97fff927 	bl	ffffff8040087288 <printf>
ffffff8040088df0:	97fffe5a 	bl	ffffff8040088758 <get_elr>
ffffff8040088df4:	aa0003e1 	mov	x1, x0
ffffff8040088df8:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088dfc:	91186000 	add	x0, x0, #0x618
ffffff8040088e00:	97fff922 	bl	ffffff8040087288 <printf>
ffffff8040088e04:	d503207f 	wfi
ffffff8040088e08:	17ffffff 	b	ffffff8040088e04 <handle_fiq+0x70>

ffffff8040088e0c <handle_err>:
ffffff8040088e0c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
ffffff8040088e10:	910003fd 	mov	x29, sp
ffffff8040088e14:	97ffec34 	bl	ffffff8040083ee4 <cpu_current_id>
ffffff8040088e18:	12001c00 	and	w0, w0, #0xff
ffffff8040088e1c:	2a0003e1 	mov	w1, w0
ffffff8040088e20:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088e24:	911a0000 	add	x0, x0, #0x680
ffffff8040088e28:	97fff918 	bl	ffffff8040087288 <printf>
ffffff8040088e2c:	97fffe45 	bl	ffffff8040088740 <get_el>
ffffff8040088e30:	aa0003e1 	mov	x1, x0
ffffff8040088e34:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088e38:	9119a000 	add	x0, x0, #0x668
ffffff8040088e3c:	97fff913 	bl	ffffff8040087288 <printf>
ffffff8040088e40:	97fffe4c 	bl	ffffff8040088770 <get_esr>
ffffff8040088e44:	aa0003e1 	mov	x1, x0
ffffff8040088e48:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088e4c:	91168000 	add	x0, x0, #0x5a0
ffffff8040088e50:	97fff90e 	bl	ffffff8040087288 <printf>
ffffff8040088e54:	97fffe4d 	bl	ffffff8040088788 <get_far>
ffffff8040088e58:	aa0003e1 	mov	x1, x0
ffffff8040088e5c:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088e60:	91182000 	add	x0, x0, #0x608
ffffff8040088e64:	97fff909 	bl	ffffff8040087288 <printf>
ffffff8040088e68:	97fffe3c 	bl	ffffff8040088758 <get_elr>
ffffff8040088e6c:	aa0003e1 	mov	x1, x0
ffffff8040088e70:	b0000000 	adrp	x0, ffffff8040089000 <handle_err+0x1f4>
ffffff8040088e74:	91170000 	add	x0, x0, #0x5c0
ffffff8040088e78:	97fff904 	bl	ffffff8040087288 <printf>
ffffff8040088e7c:	d503207f 	wfi
ffffff8040088e80:	17ffffff 	b	ffffff8040088e7c <handle_err+0x70>
