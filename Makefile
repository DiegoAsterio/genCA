.PHONY: all clean

all: .make.geninter

.make.cnfinter: .make.cnf
	./src/configgeninter.sh
	touch .make.cnfinter

.make.cnf:
	./src/configgenca.sh
	touch .make.cnf

.make.geninter: .make.genca .make.cnfinter
	./src/genInter.sh
	touch .make.geninter

.make.genca: .make.cnf 
	./src/genCA.sh
	touch .make.genca

clean:
	-rm -rf ./ca
	-rm .make.*
