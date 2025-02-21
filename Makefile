# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarrid <migarrid@student.42barcelona.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/28 19:51:37 by migarrid          #+#    #+#              #
#    Updated: 2025/02/08 23:08:10 by migarrid         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Nombre de la biblioteca
NAME = libft.a

# Compilador y opciones
CC = cc
CFLAGS = -Wall -Wextra -Werror

# Archivos fuente obligatorios
SRCS =	principal/ft_isalpha.c \
		principal/ft_isdigit.c \
		principal/ft_isalnum.c \
		principal/ft_isascii.c \
		principal/ft_isprint.c \
		principal/ft_strlen.c \
		principal/ft_memset.c \
		principal/ft_bzero.c \
		principal/ft_memcpy.c \
		principal/ft_memmove.c \
		principal/ft_strlcpy.c \
		principal/ft_strlcat.c \
		principal/ft_toupper.c \
		principal/ft_tolower.c \
		principal/ft_strchr.c \
		principal/ft_strrchr.c \
		principal/ft_strncmp.c \
		principal/ft_memchr.c \
		principal/ft_memcmp.c \
		principal/ft_strnstr.c \
		principal/ft_atoi.c \
		principal/ft_calloc.c \
		principal/ft_strdup.c \
		principal/ft_substr.c \
		principal/ft_strjoin.c \
		principal/ft_strtrim.c \
		principal/ft_split.c \
		principal/ft_itoa.c \
		principal/ft_strmapi.c \
		principal/ft_striteri.c \
		principal/ft_putchar_fd.c \
		principal/ft_putstr_fd.c \
		principal/ft_putendl_fd.c \
		principal/ft_putnbr_fd.c


# Archivos fuente bonus
BONUS_SRCS =	bonus/ft_lstnew_bonus.c \
				bonus/ft_lstadd_front_bonus.c \
				bonus/ft_lstsize_bonus.c \
				bonus/ft_lstlast_bonus.c \
				bonus/ft_lstadd_back_bonus.c \
				bonus/ft_lstdelone_bonus.c \
				bonus/ft_lstclear_bonus.c \
				bonus/ft_lstiter_bonus.c \
				bonus/ft_lstmap_bonus.c

# Objetos obligatorios
OBJS = $(SRCS:.c=.o)

# Objetos bonus
BONUS_OBJS = $(BONUS_SRCS:.c=.o)

# Regla principal: compilar la biblioteca
all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

# Regla para compilar obligatorios + bonus
bonus: .bonus

# Regla para compilar obligatorios + bonus
.bonus: $(NAME) $(BONUS_OBJS)
	ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)
	touch .bonus

# Cómo compilar cada archivo .c a .o (tanto obligatorio como bonus)
%.o: %.c libft.h Makefile
	$(CC) $(CFLAGS) -I. -c -o $@ $<

# Limpiar objetos
clean:
	rm -f $(OBJS) $(BONUS_OBJS) .bonus

# Limpiar todo (objetos + biblioteca)
fclean: clean
	rm -f $(NAME)

# Recompilar todo desde cero sin bonus
re: fclean all

# Recompilar todo desde cero
rebonus: fclean all bonus

# Asegurar que las reglas se ejecuten como comandos del make
.PHONY: all clean fclean re bonus rebonus
