#include <cstdlib>
#include <string>
#include <iostream>
#include <arpa/inet.h>

int main(int argc, char *argv[]) {
    std::string s;

    union {
        struct in_addr ia4;
        struct in6_addr ia6;
    } ia;

    while (std::cin >> s) {
        if (1 == inet_pton(AF_INET, s.c_str(), &ia)) {
            char buf[INET_ADDRSTRLEN];
            if (inet_ntop(AF_INET, &ia, buf, sizeof buf))
                std::cout << buf << std::endl;
        } else if (1 == inet_pton(AF_INET6, s.c_str(), &ia)) {
            char buf[INET6_ADDRSTRLEN];
            if (inet_ntop(AF_INET6, &ia, buf, sizeof buf))
                std::cout << buf << std::endl;
        }
    }

    return EXIT_SUCCESS;
};

//
