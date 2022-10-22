CC=clang
FLEX=flex
BISON=bison
CFLAGS=-lfl
TARGET=scalc
scalc: calc.l calc.y
	$(BISON) -d calc.y
	$(FLEX) calc.l
	$(CC) -o $@ calc.tab.c lex.yy.c $(CFLAGS)
.PHONY:
clean:
	$(RM) -rfv *.tab.* *.yy.c $(TARGET) 
