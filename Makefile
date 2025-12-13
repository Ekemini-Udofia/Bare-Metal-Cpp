CC = arm-none-eabi-g++

CFLAGS = -mcpu=cortex-m0 -std=c++11 -DSTM32 -DSTM32F0 -DSTM32F030F4Px -c -Os -ffunction-sections -Wall -fstack-usage -MMD -MP --specs=nano.specs -mfloat-abi=soft -mthumb
SRC_DIR = src
OBJ_DIR = build/obj

OBJS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))

all: main.elf 

$(OBJ_DIR)/main.o : $(SRC_DIR)/main.cpp
	$(CC) $(CFLAGS) $^ -o $@

$(OBJ_DIR)/startup_stm32f030f4px.o : startup/startup_stm32f030f4px.s
	$(CC) $(CFLAGS) $^ -o $@

# Prototype
# $(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
# 	$(CC) $(CFLAGS) $^ -o $@ 

main.elf : $(OBJ_DIR)/*.o 
	$(CC) $(CFLAGS) $^ -o main.elf

