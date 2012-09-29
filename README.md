# wenlin_db_scanner

Extracts the data from the Wenlin dictionary program.

The Wenlin Dictionary contains two great databases, the
[ABC English<->Chinese Dictionary](http://www.wenlin.com/abc.htm) and the
[Character Description Language](http://www.wenlin.com/cdl/) (CDL).

Unfortunately, this great data is wrapped by a less-than-great UI. This code is
intended to be useful to Chinese language students who wish to interact with
the data on their own terms.


## Installation

This ships as a Ruby gem, and the standard installation applies.

```bash
gem install wenlin_db_server
```

## Command-Line Usage

The following commands assume that the current directory of your `Terminal` /
`Command Prompt` is the Wenlin application's main directory. If your current
directory contains a `W4DB` directory, you're probably in the right place.

### wenlin_dbdump

`dbdump` extracts the raw text entries in a .db file.

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
