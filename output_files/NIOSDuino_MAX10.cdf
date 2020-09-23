JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Cfg)
 		Device PartName(10M08SAU169C8G) Path("C:\Users\LeonB\Documents\VHDPlus\Projects\NIOSDuino_MAX10\output_files\") File("NIOSDuino_MAX10.sof") MfrSpec(OpMask(1) Child_OpMask(2 1 1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;