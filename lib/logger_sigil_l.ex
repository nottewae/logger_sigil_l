defmodule LoggerSigilL do

  defmacro __using__(_) do
    first = quote do
      require Logger
      require LoggerSigilL
      import LoggerSigilL

      defp find_key(_list, nil, _default), do: nil
      defp find_key(list, key, default) when is_binary(key), do: find_key(list, String.to_atom(key), default)
      defp find_key(list, key, default), do: (if is_nil(Enum.find(list, fn {k,_} -> key == k end)), do: list[default], else: list[key])
      def log_(message, nil, nil) do
        Logger.debug(message)
      end
    end
    funs = ~w(debug info warn error)
    outs = Enum.map(funs, fn(fun) ->
      quote do
        require Logger
        import Logger
        def unquote(:"log_#{fun}")(message, nil, nil) do
          unquote(:"#{fun}")(message)
        end
        def unquote(:"log_#{fun}")(message, text, nil) do
          unquote(:"#{fun}")(message, ansi_color: [text])
        end
        def unquote(:"log_#{fun}")(message, text, back) do
          unquote(:"#{fun}")(message, ansi_color: [text, back])

        end

      end

    end)
    sig = quote do

      def sigil_l(m, opts) do
        table_fun = [
          d: :debug,
          i: :info,
          w: :warn,
          e: :error
        ]
        text_colors = [
          b: :blue,
          c: :cyan,
          w: :white,
          r: :red,
          g: :green,
          y: :yellow,
          d: :black,
          m: :magenta
        ]
        background_colors = [
          b: :blue_background,
          c: :cyan_background,
          w: :white_background,
          r: :red_background,
          g: :green_background,
          y: :yellow_background,
          d: :black_background,
          m: :magenta_background

        ]

        options = opts
        |> Enum.map( &to_string([&1]))

        {fun, text_color, background_color} = if length(options) > 0 do
          fun = find_key(table_fun, Enum.at(options, 0), :d)
          text_color = find_key(text_colors, Enum.at(options, 1), :c)
          background_color = find_key(background_colors, Enum.at(options, 2), :d)
          {fun, text_color, background_color}
        else
          {table_fun[:d], nil, nil}
        end


        apply(__MODULE__, :"log_#{fun}", [m, text_color, background_color])
      end
    end
    [first] ++ outs ++ [sig]
  end



end
