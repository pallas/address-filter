default: all

PROGS:= address-filter
PREFIX ?= /usr/local

DEBUG ?= -g -ggdb -DDEBUG
ifeq ($(DEBUG),)
	override DEBUG := -DNDEBUG -O2
endif

.PHONY: all
all: $(PROGS)

test: $(PROGS)
	cat test.in | ./address-filter | tee test.got | diff - test.out

$(PROGS) : LDFLAGS += -lstdc++
$(PROGS) : CXXFLAGS += $(DEBUG) -MD -MP

.PHONY: clean
clean:
	rm -rf $(PROGS)

.PHONY: install
install: all
	install -D -m 0755 -t $(PREFIX)/bin $(PROGS)

#