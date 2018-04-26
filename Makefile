DIR_BIN = ./bin
DIR_SRC = ./src
DIR_RES = ./res

BIN_TGT = $(patsubst ${DIR_SRC}/%.java, ${DIR_BIN}/%.class, $(wildcard ${DIR_SRC}/*))
PKG_TGT = Earthquake.jar

JAVAOPT = -classpath lib/*:${DIR_SRC}:${DIR_BIN}

all: ${BIN_TGT}
	@ln -sf ../lib bin
	@ln -sf ../res bin

clean:
	-rm -rf $(DIR_BIN)/*

run: all
	@cd $(DIR_BIN) && java -cp .:lib/*: Main

pkg: ${PKG_TGT}

${DIR_BIN}/%.class: ${DIR_SRC}/%.java
	javac -d ${DIR_BIN} ${JAVAOPT} $<

${PKG_TGT}: all
	@cd bin && jar -cfm ../Earthquake.jar ../manifest.txt * #lib/*

.PHONY: run clean pkg
