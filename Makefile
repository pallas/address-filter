default: all

PROGS:= address-filter

.PHONY: all
all: $(PROGS)

test: $(PROGS)
	cat test.in | ./address-filter | diff - test.out

$(PROGS) : LDFLAGS+= -g
$(PROGS) : CXXFLAGS+=

.PHONY: clean
clean:
	rm -rf $(PROGS)

#