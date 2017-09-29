lgtinit
-------

`lgtinit` is a script that initializes basic logtalk project scaffolding from some template files.

To install `lgtinit` please run:
```
$ ./configure --prefix=PREFIX_PATH
$ make install
```

Run `make install` with the appropriate permissions for your specified path. Template files will
be installed in the `share` directory of `PREFIX_PATH`, and the executable will be installed to
the `bin` directory of `PREFIX_PATH`.

usage
-----
```
$ lgtinit.sh name_of_your_project

# the --git flag option initializes defaults for .gitignore and initializes a git project
$ lgtinit.sh --git name_of_your_project
```
