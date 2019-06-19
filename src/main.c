// ATMega 8A
// Модель Мк, лучше писать, но по идее компайлер сам подставить модель
#define __AVR_ATmega8A__ true

// Частота процесора для ATMega 8a, 8МГц, может работать от 0 до 16Мгц
#define F_CPU 8000000

#include <avr/io.h>
#include <util/delay.h>

int main() {
  DDRD = 0xFF; // Ставим порт на вывод сигнала
  PORTD = 0b00000000; // Обнуляем все пины в порту D

  unsigned int i = 0;
  unsigned int currentCount = i;

  while(i < 20) {
    currentCount = i % 8;
    PORTD |= 1 << currentCount; // Добавляем 1 к следуещему разряду
    _delay_ms(1000);
    PORTD &= ~PORTD; // Обнуляем пины
    i++;
  }

  return 0;
}
