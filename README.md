# datediff

Program written in Nim to find difference between `DATE1` and `DATE2`.

Check releases with `musl`.

## `datediff --help`

```
    datediff - Show dates difference in specific format

    + optionaly select a timezone with TZ environment variable
      Use tzselect(8) to find your TZ zone

    USAGE:
      datediff [options] [--] <DATE1> <DATE2>
      datediff --help

    OPTIONS:
      -f --format=FORMAT    Format for date [default: yyyy-MM-dd]
      -v --verbose          Show what is going on
      --help                Show this help
      -s --seconds          Output in: Seconds
      -m --minutes          Output in: Minutes
      -h --hours            Output in: Hours
      -d --days             Output in: Days (This is default)
      -w --weeks            Output in: Weeks

    FORMATTING:
      FORMAT is parsing DATE inputs as follows:

      d       Numeric value representing the day of the month, it will be either one or two digits long.
        1/04/2012 -> 1
        21/04/2012 -> 21
      dd      Same as above, but is always two digits.
        1/04/2012 -> 01
        21/04/2012 -> 21
      h       The hours in one digit if possible. Ranging from 1-12.
        5pm -> 5
        2am -> 2
      hh      The hours in two digits always. If the hour is one digit, 0 is prepended.
        5pm -> 05
        11am -> 11
      H       The hours in one digit if possible, ranging from 0-23.
        5pm -> 17
        2am -> 2
      HH      The hours in two digits always. 0 is prepended if the hour is one digit.
        5pm -> 17
        2am -> 02
      m       The minutes in one digit if possible.
        5:30 -> 30
        2:01 -> 1
      mm      Same as above but always two digits, 0 is prepended if the minute is one digit.
        5:30 -> 30
        2:01 -> 01
      M       The month in one digit if possible.
        September -> 9
        December -> 12
      MM      The month in two digits always. 0 is prepended if the month value is one digit.
        September -> 09
        December -> 12
      s       Seconds as one digit if possible.
        00:00:06 -> 6
      ss      Same as above but always two digits. 0 is prepended if the second is one digit.
        00:00:06 -> 06
      yy      The last two digits of the year. When parsing, the current century is assumed.
        2012 AD -> 12
      yyyy    The year, padded to at least four digits. Is always positive, even when the year is BC. When the year is more than four digits, '+' is prepended.
        2012 AD -> 2012
        24 AD -> 0024
        24 BC -> 00024
        12345 AD -> +12345
      YYYY     The year without any padding. Is always positive, even when the year is BC.
        2012 AD -> 2012
        24 AD -> 24
        24 BC -> 24
        12345 AD -> 12345

      More patterns can be found here: 
        https://nim-lang.org/docs/times.html#parsing-and-formatting-dates

    EXAMPLES:
      datediff 2000-01-01 2001-01-01
      # 366
      datediff -s -f "yyyy" 2022 2025
      # 94694400
      TZ='America/Anchorage' datediff -h -f "yyyy-MM-dd-HH" 2022-03-13-01 2022-03-13-04
      # 2 # Because of DST change
```

### Build

Use `just` as modern alternative to `make`: https://github.com/casey/just or manually run commands in `Justfile`

```
just build
```

### Alternative

There are greater tools available:
https://github.com/hroptatyr/dateutils
