#include "matcher.h"
#include <stdio.h>
/**
 * Implementation of your matcher function, which
 * will be called by the main program.
 *
 * You may assume that both line and pattern point
 * to reasonably short, null-terminated strings.
 */
int rgrep_matches(char *line, char *pattern)
{

    //
    // TODO put your code here.
    char temp_pattern[4096];
    int k = 0;
    while( k != '\0' )
    {
        temp_pattern[k] = pattern[k];
        ++k;
    }
    temp_pattern[k] = '\0';

    if( pattern[0] != '\'' || pattern[k] != '\'')
    {
        fprintf(stderr, "Please let pattern string into ' ' \n");
        return 0;
    }

    for(int i = 1; i < k; ++i)
    {
        if(temp_pattern[i] == '.')
        {

        }
        else if(temp_pattern[i] == '{')
        {

        }
        else if(temp_pattern[i] == '\\')
        {

        }
        else
        {

        }

    }


    return 0;
}

