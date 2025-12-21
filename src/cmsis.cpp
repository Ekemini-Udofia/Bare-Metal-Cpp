#include <cstdint>

typedef struct {
  volatile uint32_t MODER;    // 0x00
  volatile uint32_t OTYPER;   // 0x04
  volatile uint32_t OSPEEDR;  // 0x08
  volatile uint32_t PUDPR;    // 0x0C
  volatile uint32_t IDR;      // 0x10
  volatile uint32_t ODR;      // 0x14
  volatile uint32_t BSRR;     // 0x18
  volatile uint32_t LCKR;     // 0x1C
  volatile uint32_t AFRL;     // 0x20
  volatile uint32_t AFR;      // 0x24
  volatile uint32_t BRR;      // 0x28
} GPIO_TypeDef;

typedef struct {
  volatile uint32_t Dummy_space[12];
  volatile uint32_t AHB1ENR;
} RCC_TypeDef;

#define RCC_BASE 0x40021000UL
#define GPIOA_BASE 0x48000000ul

#define RCC ((RCC_TypeDef *)RCC_BASE)
#define GPIOA ((GPIO_TypeDef *)GPIOA_BASE)

#define GPIOAEN (1U << 0)

#define PIN5 (1U << 5);

#define LED_PIN PIN5

int main(void) {
  RCC->AHB1ENR |= GPIOAEN;

  GPIOA->MODER |= (1U << 10);   // Set bit 10 to 1
  GPIOA->MODER |= ~(1U << 11);  // Set bit 11 to 0

  while (1) {
    GPIOA->ODR ^= LED_PIN;

    // Simple Delay
    for (int i = 0; i < 1000000; ++i) {
    }
  }
}