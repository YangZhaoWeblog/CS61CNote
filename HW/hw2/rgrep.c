/**
 * Restricted version of grep, as defined in the CS61C Spring 2014
 * course website for homework #2.
 *
 * You must not change this file.
 */

#include <stdio.h>
#include "matcher.h"

int main(int argc, char **argv) {
        //第　０　个参数是程序的全名
    if (argc != 2) {//意味着后面只能跟随一个 string(pattern)
        fprintf(stderr, "Usage: %s <PATTERN>\n", argv[0]);
        return 2;
    }

    /* we're not going to worry about long lines */
    char buf[4096];

    while (!feof(stdin) && !ferror(stdin)) {//遇到　eof停止
        if (!fgets(buf, sizeof(buf), stdin)) {//输入将要进行正则筛选的数据
            break;
        }
        if (rgrep_matches(buf, argv[1])) {//传入 数据 和　pattern串
            fputs(buf, stdout);
            fflush(stdout);
        }
    }

    if (ferror(stdin)) {
        perror(argv[0]);
        return 1;
    }

    return 0;
}

