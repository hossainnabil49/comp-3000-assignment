/* 3000textui.c */
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#ifdef __linux__
#include <unistd.h>
#include <ncurses.h>
#elif defined(_WIN32)
#include <windows.h>
#include "curses.h"
#endif

#define ENTER 10
#define KEY_ESCAPE 27

extern void ping(char *addr);
extern int execvpe(const char *file, char *const argv[], char *const envp[]);
extern char **environ;

char *options[] = {
        "Ping ",
        "Run htop",
        "Clear screen",
        "Exit"
};

char *program;

int main()
{
	char *ip = getenv("IP");
	if(ip == NULL){
		ip = "8.8.8.8";
		printf("No IP, using default");
	
	}
	char *new_ping = malloc(strlen(options[0]) + strlen(ip) + 1);
	strcpy(new_ping,options[0]);
	
	strcat(new_ping,ip);
	options[0]=new_ping;
        printf("Press any key to continue...\n");
        getchar();

/* You don't have to fully understand the lines in this block -- start */
        initscr();          /* Start curses mode */
        curs_set(0);
        noecho();

        start_color();
        init_pair(1, COLOR_WHITE, COLOR_BLUE);
        init_pair(2, COLOR_BLUE, COLOR_WHITE);

        int i, key, selected = 0;
        WINDOW **items;
        items = (WINDOW **)malloc(5 * sizeof(WINDOW *));

        items[0] = newwin(8, 19, 1, 1);
        wbkgd(items[0], COLOR_PAIR(1));
        box(items[0], ACS_VLINE, ACS_HLINE);
        items[1] = subwin(items[0], 1, 14, 2, 3);
        items[2] = subwin(items[0], 1, 14, 3, 3);
        items[3] = subwin(items[0], 1, 14, 4, 3);
        items[4] = subwin(items[0], 1, 14, 5, 3);
        for (i = 1; i<5; i++)
                wprintw(items[i], "%s", options[i - 1]);
        wbkgd(items[1], COLOR_PAIR(2));
        wrefresh(items[1]);
        keypad(items[0], TRUE);

        while(1) {
                key = wgetch(items[0]);
                wbkgd(items[selected + 1], COLOR_PAIR(1));
                wrefresh(items[selected + 1]);

                if (key == KEY_DOWN)
                        selected = selected==3?0:selected+1;
                else if (key == KEY_UP)
                        selected = selected==0?3:selected-1;
                else if (key == KEY_ESCAPE) {
                        selected = -1;
                        break;
                }
                else if (key == ENTER)
                        break;

                wbkgd(items[selected + 1], COLOR_PAIR(2));
                wrefresh(items[selected + 1]);
        }
/* You don't have to fully understand the lines in this block -- end */

        if (key == ENTER) {
                if (2 == selected)
#ifdef __linux__
                        program = "clear";
#elif defined(_WIN32)
                        program = "cls";
#endif
                else if (1 == selected)
                        program = "htop";

        }
        endwin();           /* End curses mode   */

       if (0 == selected) {
#ifdef __linux__
               ping(ip);
#else
               printf("Ping not supported for now.\n");
#endif
               exit(0);
       }
       if (3 == selected) exit(0);
#ifdef __linux__
       if (execvpe(program, &program, environ) == -1)
                printf("Error: %s\n", strerror(errno));
#elif defined(_WIN32)
           if (system(program) != 0)
                printf("Error!\n");
#endif

}

