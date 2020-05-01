NAME				=		a.out

MAIN_SRC			=		main.cpp
MAIN_OBJ			=		$(MAIN_SRC:%.cpp=%.o)

CC					=		g++
LDLIBS				=		-lsfml-audio -lsfml-graphics -lsfml-network -lsfml-system -lsfml-window

$(NAME):			$(MAIN_OBJ) $(PROJ_OBJ)
					$(CC) $(MAIN_OBJ) $(PROJ_OBJ) -o $(NAME) $(LDFLAGS) $(LDLIBS)

all:				$(NAME)
