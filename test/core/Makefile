NAME				=		a.out

MAIN_SRC			=		criterion.c
MAIN_OBJ			=		$(MAIN_SRC:%.cpp=%.o)

CC					=		gcc
CFLAGS				=		-fprofile-arcs -ftest-coverage
LDLIBS				=		-lgcov -lcriterion

$(NAME):			$(MAIN_OBJ) $(PROJ_OBJ)
					$(CC) $(MAIN_OBJ) $(PROJ_OBJ) -o $(NAME) $(LDFLAGS) $(LDLIBS)

all:				$(NAME)
