NAME				=		a.out

MAIN_SRC			=		main.c
MAIN_OBJ			=		$(MAIN_SRC:%.c=%.o)

CC					=		gcc
LDLIBS				=		-lcsfml-audio -lcsfml-graphics -lcsfml-network -lcsfml-system -lcsfml-window \
							-lncurses \
							-lSDL2 -lSDL2_image -lSDL2_ttf

$(NAME):			$(MAIN_OBJ) $(PROJ_OBJ)
					$(CC) $(MAIN_OBJ) $(PROJ_OBJ) -o $(NAME) $(LDFLAGS) $(LDLIBS)

all:				$(NAME)
