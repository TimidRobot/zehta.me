# custom-jinja2-filters

Custom [Jinja2](https://palletsprojects.com/p/jinja/) filters


## parsedatetime

Convert string into a `datetime.datetime` object using `dateutil.parser`.

- [datetime Objects - datetime - Basic date and time types - Python 3
  documentation][datetime]
- [parser — dateutil documentation][parser]

[datetime]: https://docs.python.org/3/library/datetime.html#datetime-objects
[parser]: https://dateutil.readthedocs.io/en/stable/parser.html


## stripdateprefix

Strip date prefix using a regular expression (`re`).

- [re - Regular expression operations - Python 3 documentation][re]

[re]: https://docs.python.org/3/library/re.html


## License

[![CC0 dedication button][cc-zero-png]][cc-zero]
**Unless otherwise specified,** the code within this repository is dedicated,
with all copyright and related and neighboring rights, to the public domain
worldwide. It is distributed without any warranty. ([CC0 1.0 Universal (CC0
1.0) Public Domain Dedication][cc-zero])

[cc-zero-png]: https://licensebuttons.net/l/zero/1.0/88x31.png#floatleft "CC0 1.0 dedication button"
[cc-zero]: https://creativecommons.org/publicdomain/zero/1.0/ "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication"
