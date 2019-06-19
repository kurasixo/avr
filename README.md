# Тестовый проект для программирования на мк семейства AVR

## Подготовотельные шаги:
### Windows:
- ПУТЬ СИЛЬНЫХ И НЕЗАВИСИМЫХ:
  ##### Установка make:
  - Скачиваем [GNUWin](https://sourceforge.net/projects/gnuwin32/files/make/3.81/make-3.81.exe/download?use_mirror=datapacket&download=) ([Ссылка с оффициального сайта](http://gnuwin32.sourceforge.net/packages/make.htm))
  - Если у вас есть `git for windows`, то `make` уже можно использовать
  - Если нет, [нужно обновить `$PATH` переменную](http://stat545.com/automation02_windows.html)

  ##### Установка avr-gcc:
  - Скачиваем [avr-gcc](http://blog.zakkemble.net/avr-gcc-builds/) для вашей системы (64 или 32) битная

  ##### Установка avrdude:
  - Скачиваем [avrdude](https://sourceforge.net/projects/winavr/)

- ПУТЬ СЛАБЫХ:
  - Скачать Atml Studio
  - Разобраться с докой

### Macos/Linux
  - Скачать make avr-gcc avrdude (Все очень легко гуглится для системы)

## Сборка:
- Заходим через терминал в папку с проектом
- Запускаем `make`. После этого, будет доступен файл main.hex, который можно залить на мк с помощью `avrdude`

## Прошивка МК:
- Подключаем Программатор и МК
- Устанавливаем драйвера для Программатора
- Запускаем `make flash`
