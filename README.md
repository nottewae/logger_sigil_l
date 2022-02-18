# LoggerSigilL

```LoggerSigilL``` provides a short syntax for logging while debugging an application, like ```~w(a b c)```

## Installation

Add `logger_sigil_l` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:logger_sigil_l, git: "git@github.com/nottewae/logger_sigil_l.git"}
  ]
end
```
## Examples
```elixir
#in our module
use LoggerSigilL
def test_logger do 
   m = "test message"
    ~l"#{m}"
    ~l"#{m}"dr
    ~l"#{m}"er
    ~l"#{m}"ir
    ~l"#{m}"wr
    ~l"#{m}"dg
    ~l"#{m}"eg
    ~l"#{m}"ig
    ~l"#{m}"wg
    ~l"#{m}"dc
    ~l"#{m}"ec
    ~l"#{m}"ic
    ~l"#{m}"wc
    ~l"#{m}"dm
    ~l"#{m}"em
    ~l"#{m}"im
    ~l"#{m}"wm
    ~l"#{m}"dwm
    ~l"#{m}"ewm
    ~l"#{m}"iwm
    ~l"#{m}"wwm
    ~l"#{m}"dry
    ~l"#{m}"ery
    ~l"#{m}"iry
    ~l"#{m}"wry
    ~l"#{m}"dwb
    ~l"#{m}"ewb
    ~l"#{m}"iwb
    ~l"#{m}"wwb
end
```

![out1](priv/runs/imgs/screen1.png?raw=true)
![out2](priv/runs/imgs/screen2.png?raw=true)

