.PHONY: all clean subscribeCert

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

subscribeCert: .make.geninter
	./src/subscribe_cert.sh $(website_link)

clean:
	-rm -rf ./ca
	-rm .make.*
