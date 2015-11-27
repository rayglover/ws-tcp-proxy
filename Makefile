OPT_FAST=-Wall -O3 -I./http-parser -I./libuv/include

LFLAGS := -lm -lpthread -lrt
CC?=gcc

ws_proxy: libuv/.libs/libuv.a
	$(CC) $(OPT_FAST) -o ws_proxy ws_proxy.c http.c sha1.c http-parser/http_parser.c wsparser.c libuv/.libs/libuv.a $(LFLAGS)

libuv/.libs/libuv.a:
	$(MAKE) -C libuv

clean:
	rm -f libuv/.libs/libuv.a
	rm -f http-parser/http_parser.o
	rm -f ws_proxy
