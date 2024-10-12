#
# z80float GNU Makefile
#

FLIB=zout/ASUB1.rel zout/ASUB2.rel zout/DABS.rel zout/DATAN.rel zout/DCOS.rel
FLIB+=zout/DEXP.rel zout/DFIX.rel zout/DFLT.rel zout/DLOG.rel zout/DMOD.rel
FLIB+=zout/DSGN.rel zout/DSIN.rel zout/DSQRT.rel zout/DTOJ.rel zout/JTOD.rel
FLIB+=zout/ROUND.rel

CPM=TEST1.hex TEST2.hex TEST3.hex TEST4.hex TEST5.hex TEST6.hex TEST6.hex
CPM+=TEST7.hex TEST8.hex

SBC=TEST1_SBC.hex TEST2_SBC.hex TEST3_SBC.hex TEST4_SBC.hex TEST5_SBC.hex
SBC+=TEST6_SBC.hex TEST6_SBC.hex TEST7_SBC.hex TEST8_SBC.hex

PC8=TEST1_PC8.hex TEST2_PC8.hex TEST3_PC8.hex TEST4_PC8.hex TEST5_PC8.hex
PC8+=TEST6_PC8.hex TEST6_PC8.hex TEST7_PC8.hex TEST8_PC8.hex

all: $(FLIB) $(CPM) $(SBC) $(PC8)

TEST1.hex: zout/TEST1.rel
TEST1_SBC.hex: zout/TEST1.rel
TEST2.hex: zout/TEST2.rel
TEST2_SBC.hex: zout/TEST2.rel
TEST3.hex: zout/TEST2.rel
TEST3_SBC.hex: zout/TEST3.rel
TEST4.hex: zout/TEST4.rel
TEST4_SBC.hex: zout/TEST4.rel
TEST5.hex: zout/TEST5.rel
TEST5_SBC.hex: zout/TEST5.rel
TEST6.hex: zout/TEST6.rel
TEST6_SBC.hex: zout/TEST6.rel
TEST7.hex: zout/TEST7.rel
TEST7_SBC.hex: zout/TEST7.rel
TEST8.hex: zout/TEST8.rel
TEST8_SBC.hex: zout/TEST8.rel
TEST_CPM.hex: zout/TEST_CPM.rel
TEST_SBC.hex: zout/TEST_SBC.rel
TEST_PC8.hex: zout/TEST_PC8.rel

%.hex: zout/%.rel zout/TEST_CPM.rel $(FLIB)
	ld80 -P 100 -D 100 -o $@ $^

%_SBC.hex: zout/%.rel zout/TEST_SBC.rel $(FLIB)
	ld80 -P 8000 -D 8000 -o $@ $^

%_PC8.hex: zout/%.rel zout/TEST_PC8.rel $(FLIB)
	ld80 -P 9000 -D 9000 -o $@ $^

zout/%.rel : %.txt
	zmac --rel $^

clean:
	rm -rf *.hex zout/*
