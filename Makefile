CC = armm-none-eabi-g++

CFLAGS = -mcpu=cortex-m0 -std=c++11 -DSTM32 -DSTM32F0 -DSTM32F030F4Px -c -Os -ffunction-sections -Wall -fstack-usage -MMD -MP --specs=nano.specs -mfloat-abi=soft -mthumb
SRC_DIR = src
OBJ_DIR = build/obj

OBJS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) $^ -o $@ 

main.elf: $(OBJS)
	$(CC) $(OBJS) -o main.elf

all: main.elf