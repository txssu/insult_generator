defmodule InsultGenerator.Internal.Sigils do
  @moduledoc false
  @spec sigil_p(String.t(), [char()]) :: [binary()]
  def sigil_p(string, _options) do
    String.split(string, ",")
  end
end

defmodule InsultGenerator do
  @moduledoc """
  Генератор жестоких обзывательств, может вызывать приступы ржаки.
  """

  import __MODULE__.Internal.Sigils

  @insults ~p"бык,коронавирус,клоун,кукан,танк,вертолёт,велосипед,батя,братик,процессор,мешок,пакет,коврик,коврижка,чебурек,питон,кал,пёс,инцел,виртуалбокс,долбаёб,долбоёб,далбоёб,планктон,мефедрон,снюс,камаз,туалет,толкан,томат,огурец,банан,ебанан,баклан,ваз-2101,линукс,спрей,поносик,ворон,мусор,понос,помой,карась,хуй,таракан,урод,шпорк,баклажан,овощ,фрукт,сахарок,барсик,пупс,неосарт,линуксоид,виндузятник,маковод,туалет,толкан,толчок,пепел,краб,макинтош,дельфин,трюфель,бсдшник,цыган,чмо,пидор,задрот,кисель,ботан,гандонео,пушок,зефир,негативчик,быдлан,третьеклассник,газ,еблан,уёбок,пидорас,гандон,педик,презик,волос,негр,убунтовод,арчегомосек,шоколад,козёл,бычара,козлище,козён,обама,навальнёнок,говноед,трамп,гей,гомосек,свин,кобель,хохол,сатана"
  @adjectives ~p"ебаный,обоссаный,поднадусёровый,слабонервный,жирный,вонючий,кастрированный,ебучий,невменяемый,блядский,черномазый,оттраханный,обдроченный"
  @first_insult_word ~p"блядо,члено,говно,хуе,желто,черно,много,верто,мало,швайно,глино,гнидо,писько,сопле,криво,пидо,пердо,срало,срано,порно,без"
  @second_insult_word ~p"рылый,жопый,ротый,ебливый,ссущий,срущий,ухий,клювый,зубый,хвостый,бля"
  @insult_endings ~p"лёт,ед,блюй,рот,член,мес,пидор,поезд,танк,дроч,скотч,крейсер,дрочер,дорас"
  @abusives ~p"блять,сука,ебать,пиздец,нахуй"
  @dick_adjectives ~p"трахо,ебо,сексо,порно,конче,негро"
  @dicks ~p"член,штырь,штепсель,кол,баклажан,трон,дик,ствол,крючок,питон,пайтон,шланг,кол"
  @demonstrative_verbs ~p"иди,пиздуй,шуруй,вали,ебись"
  @verbs ~p"утопил,отравил говном,переехал,на суп спустил,похоронил,из репозиториев установил,в деб пакет засунул,в рпм опакетил,скомпилировал,ебал,зарезал,продал за 3 рубля,отпиздил,с балкона выбросил,стирал,высушил,отравил газом,насиловал,трахал,пиздил,ножом резал,на хую вертел,на хуе до 12000 об/с разгонял,ссал на,срал на,продал,купил,проиграл в казино,выиграл в казино,выебал,обосрал,оплодотворял,продавал на металлолом,сдавал на чермет,продавал в секс-рабство,вчера в гроб ложил"
  @relatives_impad ~p"мать,бабушку,сестру,бабку,мамку,тёщу,родню,пизду,ротовую полость,родину,деревню,сноху,дочь,дочку,одноклассницу,классную руководительницу,однокурсницу"
  @places ~p"нахуй,с обрыва,под землю,маме отсасывать,сестре отлизывать,бабушке отлизывать,маме помогать,в пизду,отсюда,к хуям,по помойкам шарить,у бати сосать,маме отлизывать,маме жаловаться,сглатывать,фистить себе жопу,глотать сперму,сосать"
  @whose ~p"мамкин,папкин,сосалкин,шалавкин,плюшкин"
  @relatives ~p"мать,мамка,бабка,бабушка,дочка,тёща,сноха,жена"
  @fem_insults ~p"шалава,лоханка,макака,обезьяна,шлюха,шаболда,сосалка,дура,молекула,хуйня,грязь,проститутка,пизда,махнатка,дырка,дыра,вонючка,конча,пылинка,хохлинка,корова,бабка,уродина,фиона,пепеляшка,акула,курица"
  @fem_adjectives ~p"ебаная,обосраная,мёртвая,вообще жива?,обоссаная,поднадусёровая,слабонервная,жирная,вонючая,кастрированная,ебучая,невменяемая,блядская,черномазая,оттраханая,обдроченная,конченая"
  @item_adjectives_fem ~p"широкая,огромная,мелкая,выебанная,гигантская,обдолбанная"
  @emoji ~p"😆,🤣,😡,🤬,😈,👿,👺,👹,🤡,🖕,🤘,😏,🧠"

  @laugh_parts ~p"Ах,АХ,ах,аХ,Аъ,пх,Пх,ПХ,пХ,аЪ,пз,"
  @grin_parts ~p"),0,-,_"

  @doc ~S"""
  Генерирует смех.

  ## Examples

      iex> InsultGenerator.generate_laugh()
      "ахАъпхпзпзпХПХАХпХпХ"
  """
  @spec generate_laugh() :: String.t()
  def generate_laugh do
    generate_string_by_parts(@laugh_parts)
  end

  @doc ~S"""
  Генерирует улыбку.

  ## Examples

      iex> InsultGenerator.generate_grin()
      "0)_))))"
  """
  @spec generate_grin() :: String.t()
  def generate_grin do
    generate_string_by_parts(@grin_parts)
  end

  @doc ~S"""
  Генерирует оскорбление
  """
  @spec generate_insult() :: String.t()
  def generate_insult do
    1..21
    |> Enum.random()
    |> do_generate()
    |> maybe_append_emoji()
    |> maybe_add_second_insult()
    |> String.upcase()
  end

  defp maybe_append_emoji(insult, max_emoji \\ 5) do
    emoji = Enum.random(@emoji)
    count = Enum.random(0..max_emoji)

    insult <> String.duplicate(emoji, count)
  end

  defp maybe_add_second_insult(insult) do
    if Enum.random([true, false]) do
      second_insult =
        maybe_append_emoji(" #{Enum.random(@demonstrative_verbs)} #{Enum.random(@places)}", 6)

      maybe_add_third_insult(insult <> second_insult)
    else
      insult
    end
  end

  defp maybe_add_third_insult(insult) do
    if Enum.random([true, false]) do
      third_insult = " #{Enum.random(@insults)} #{Enum.random(@adjectives)} #{generate_laugh()}"

      insult <> third_insult
    else
      insult
    end
  end

  defp do_generate(1) do
    "#{Enum.random(@demonstrative_verbs)} #{Enum.random(@places)}, #{Enum.random(@insults)} #{Enum.random(@adjectives)}"
  end

  defp do_generate(2) do
    "#{generate_laugh()} #{Enum.random(@abusives)} ты #{Enum.random(@insults)} #{Enum.random(@whose)}#{generate_grin()}"
  end

  defp do_generate(3) do
    "пососи мой #{Enum.random(@dick_adjectives)}#{Enum.random(@dicks)}, #{Enum.random(@adjectives)} #{Enum.random(@whose)}"
  end

  defp do_generate(4) do
    "#{Enum.random(@abusives)} ты #{Enum.random(@first_insult_word)}#{Enum.random(@second_insult_word)}"
  end

  defp do_generate(5) do
    "#{Enum.random(@abusives)} ты #{Enum.random(@first_insult_word)}#{Enum.random(@insult_endings)}"
  end

  defp do_generate(6) do
    "#{Enum.random(@demonstrative_verbs)} #{Enum.random(@places)}, #{Enum.random(@fem_insults)} #{Enum.random(@fem_adjectives)}"
  end

  defp do_generate(7) do
    "#{generate_laugh()} #{Enum.random(@abusives)} ты #{Enum.random(@fem_insults)} #{Enum.random(@whose)}#{generate_grin()}"
  end

  defp do_generate(8) do
    "#{generate_laugh()} #{Enum.random(@abusives)} у тебя #{Enum.random(@fem_insults)} #{Enum.random(@item_adjectives_fem)}"
  end

  defp do_generate(9) do
    "#{Enum.random(@abusives)} ты #{Enum.random(@first_insult_word)}#{Enum.random(@second_insult_word)}"
  end

  defp do_generate(10) do
    "#{Enum.random(@abusives)} ты #{Enum.random(@first_insult_word)}#{Enum.random(@insult_endings)}"
  end

  defp do_generate(11) do
    "да я твою #{Enum.random(@relatives_impad)} #{Enum.random(@verbs)}#{generate_grin()} понимаешь???#{generate_grin()}"
  end

  defp do_generate(12) do
    "я тебе щас #{Enum.random(@insults)} в рот засуну, #{Enum.random(@insults)} ты #{Enum.random(@adjectives)}#{generate_laugh()}"
  end

  defp do_generate(13) do
    "да, твоя #{Enum.random(@relatives)} #{Enum.random(@fem_adjectives)}, а вот ты #{Enum.random(@adjectives)} #{Enum.random(@insults)}"
  end

  defp do_generate(14) do
    "слышь ты #{Enum.random(@adjectives)} #{Enum.random(@insults)} я твою #{Enum.random(@relatives_impad)} #{Enum.random(@verbs)}"
  end

  defp do_generate(15) do
    "судо апт уебать твоя-мама --причина=ты_#{Enum.random(@abusives)}_#{Enum.random(@adjectives)}_#{Enum.random(@insults)}"
  end

  defp do_generate(16) do
    "пинг твоя-#{Enum.random(@relatives)}... а чё не пингуется? а потому что я её #{Enum.random(@verbs)}"
  end

  defp do_generate(17) do
    "ssh твоя#{Enum.random(@relatives)}@#{Enum.random(@insults)}... о #{Enum.random(@abusives)} работает... ахаххахахаха тут пароль я-#{Enum.random(@insults)}"
  end

  defp do_generate(18) do
    "приветик #{Enum.random(@insults)} #{Enum.random(@adjectives)} , давно не виделись, как помнишь ты #{Enum.random(@verbs)} свою #{Enum.random(@relatives_impad)}. так вот пока ты это делал я твою #{Enum.random(@relatives_impad)} #{Enum.random(@verbs)}"
  end

  defp do_generate(19) do
    "плавают #{Enum.random(@insults)} и #{Enum.random(@insults)}. и тут всплыла твоя #{Enum.random(@relatives)}. один другого спрашивает: ты #{Enum.random(@insults)}? а тот ему и отвечает: я твою #{Enum.random(@relatives_impad)} #{Enum.random(@verbs)}"
  end

  defp do_generate(20) do
    "шёл #{Enum.random(@insults)} по лесу. видит - #{Enum.random(@insults)} горит. ну он сел на него и выебал твою #{Enum.random(@relatives_impad)}"
  end

  defp do_generate(21) do
    "ути ути ты мой #{Enum.random(@insults)} маленький)) а ты знал что я твою ебаную #{Enum.random(@relatives_impad)} вчера #{Enum.random(@verbs)}?))"
  end

  defp generate_string_by_parts(parts, max_count \\ 20) do
    count = Enum.random(1..max_count)

    1..count
    |> Enum.reduce("", fn _count, acc ->
      [acc | Enum.random(parts)]
    end)
    |> :erlang.iolist_to_binary()
  end
end
