# -*- coding: utf-8 -*-
# Standard library
import re

# Third-party
from dateutil import parser
from lektor.pluginsystem import Plugin

RE_DATE_PREFIX = re.compile(r"^(\d{8}-)(.*)$")


class CustomJinja2FiltersPlugin(Plugin):
    name = "custom-jinja2-filters"
    description = "Custom Jinja2 filters"

    def on_setup_env(self, **extra):
        def parsedatetime_filter(value):
            """
            Convert string into a datetime.datetime object using
            dateutil.parser
            """
            datetime_obj = parser.parse(value)
            return datetime_obj

        self.env.jinja_env.filters["parsedatetime"] = parsedatetime_filter

        def stripdateprefix_filter(value):
            """
            Strip date prefix using a regular expression
            """
            matches = RE_DATE_PREFIX.match(value)
            if matches:
                return matches[2]
            else:
                return value

        self.env.jinja_env.filters["stripdateprefix"] = stripdateprefix_filter
