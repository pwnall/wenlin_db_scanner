# wenlin_db_scanner

Extracts the data from the Wenlin dictionary program.

The Wenlin Dictionary contains two great databases, the
[ABC English<->Chinese Dictionary](http://www.wenlin.com/abc.htm) and the
[Character Description Language](http://www.wenlin.com/cdl/) (CDL).

Unfortunately, this great data is wrapped by a less-than-great UI. This code is
intended to be useful to Chinese language students who wish to interact with
the data on their own terms.


## Installation

The tool ships as a Ruby gem, and the standard installation process applies.
The code relies on Ruby 1.9 syntax and String encoding. It was tested to work
with MRI 1.9.3.

```bash
gem install wenlin_db_server
```


## Command-Line Usage

The following commands assume that the current directory of your `Terminal` /
`Command Prompt` is the Wenlin application's main directory. If your current
directory contains a `W4DB` directory, you're probably in the right place.

### wenlin_dict

Parses a dictionary database into a file containing one JSON line per entry.

```bash
wenlin_dict W4DB/ en-zh > en_zh.json
wenlin_dict W4DB/ zh-en > zh_en.json
wenlin_dict W4DB/ hz-en > hz_en.json
```

### wenlin_hanzi

Parses the database that breaks down hanzi (Chinese characters) into
components.

```bash
wenlin_hanzi W4DB > hanzi.json
```

### wenlin_parts

Parses a parts-of-speech database into a file containing one JSON line per part
of speech.

The parts of speech are referenced by the word defintion databases, which use
their abbreviations.

```bash
wenlin_parts W4DB/ en > en_parts.json
wenlin_parts W4DB/ zh > zh_parts.json
```

### wenlin_dbdump

Extracts the raw text entries in a .db file. Useful for debugging and
understanding the record format.

```bash
wenlin_dbdumb W4DB/abc_ce.db
```


## API Usage

The scripts in the `bin` directory are thin wrappers over the API. Read them if
you want to use the Ruby API directly.

It is very likely that you'll get your job done faster by using the output of
the CLI tools.


## Testing

I test this code by runing the tools inside `bin` against the Wenlin databases,
and by spot-checking the output.


## Contributing

This tool works fairly well on the Wenlin 4 data files. Bugfixes and support
for new .db file formats are welcome,  other features are most likely outside
the project's scope.

Note that this tool is designed to help moving the data into another program,
so it only supports full table scans. Support for random access using the
B-tree indexes is outside the scope of this project.


## Copyright

This code is licensed under the
[CC0 Public Domain](http://creativecommons.org/publicdomain/zero/1.0/) license.
