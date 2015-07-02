# cecho

echo with a dash of colour

## Example

![Example](https://raw.githubusercontent.com/rhardih/cecho/master/example.png)

## Usage

Here's an example of how it can be included for use in a script, where a cached copy is downloaded to /tmp/cecho.sh, so it's only fetched once:

**foo.sh**:

```bash
#!/usr/bin/env bash

if [ ! -f /tmp/cecho.sh ]; then
  curl -s https://raw.githubusercontent.com/rhardih/cecho/master/cecho.sh \
    -o /tmp/cecho.sh
fi

source /tmp/cecho.sh

cecho -h
```

Running it:

```bash
$ ./foo.sh
usage: cecho options

Colour echo

Wrapper for echo with explicit options to set for- and background
colours.

EXTRA OPTIONS:
-h         Show this message
-b <value> Background colour
-f <value> Foreground colour
-a         Show available colour values for f and b

ECHO OPTIONS:
-n         Trailing newline is suppressed
-e         Interpretation of backslash-escaped characters
           is enabled (See bash man page)
           *Always on to enable colours*
-E         Disables the interpretation of escape characters

```

## License

MIT: http://rhardih.mit-license.org
