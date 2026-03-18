"""
Custom Jinja2 filters for Lektor.
"""

# Standard library imports
import re

# Third party imports
from dateutil import parser
from lektor.pluginsystem import Plugin

RE_DATE_PREFIX = re.compile(r"^(\d{8}-)(.*)$")


class CustomJinja2FiltersPlugin(Plugin):
    """
    Custom Jinja2 filters for Lektor.
    """

    name = "custom-jinja2-filters"
    description = "Custom Jinja2 filters"

    def on_setup_env(self, **extras):  # noqa: ARG002 Unused method argument
        """
        Hook into the `setup-env` Lektor event.
        """

        def parsedatetime_filter(value):
            """
            Convert string into a datetime.datetime object.

            Uses dateutil.parser.
            """
            return parser.parse(value)

        self.env.jinja_env.filters["parsedatetime"] = parsedatetime_filter

        def stripdateprefix_filter(value):
            """
            Strip date prefix using a regular expression.
            """
            matches = RE_DATE_PREFIX.match(value)
            if matches:
                return matches[2]
            return value

        self.env.jinja_env.filters["stripdateprefix"] = stripdateprefix_filter
