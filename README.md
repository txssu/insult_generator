![Блять](https://sun9-6.userapi.com/impf/xOjx5AbpNr3SpkEU0D5-n4ZsDVQpZU7i8pTpgg/pzx6qBenlYI.jpg?size=1920x501&quality=96&proxy=1&sign=1fd118f408e032e1600420d1294848cf&type=album)

# InsultGenerator

Генератор жестоких обзывательств, может вызывать приступы ржаки.
Порт всем известной библиотеки на Elixir.

# Использование в качестве библиотеки

Добавьте библиотеку в `mix.exs`:

```elixir
defp deps do
  [
    {:insult_generator, github: "txssu/insult_generator"}
  ]
end
```


```elixir
iex> InsultGenerator.generate_insult()
'Я ТЕБЕ ЩАС ПРОЦЕССОР В РОТ ЗАСУНУ, САТАНА ТЫ ПОДНАДУСЁРОВЫЙПХАХПЗПХПХАХАХАХАХПЗ👿👿'
```
