"""
Setup lektor_custom_jinja2_filters.

Setup lektor_custom_jinja2_filters, a collection of custom Jinja2 filters for
Lektor.
"""

# Standard library
# Standard library imports
import ast
import re
from pathlib import Path

# Third party imports
# Third-party
from setuptools import find_packages, setup

with Path("README.md").open("rt", encoding="utf8") as f:
    readme = f.read()

_description_re = re.compile(r"description\s+=\s+(?P<description>.*)")
with Path("lektor_custom_jinja2_filters.py").open("rb") as f:
    description = str(
        ast.literal_eval(
            _description_re.search(f.read().decode("utf-8")).group(1)
        )
    )

setup(
    author="Timid Robot Zehta",
    description=description,
    install_requires=["python-dateutil"],
    keywords="Lektor plugin",
    license="CC0-1.0",
    long_description=readme,
    long_description_content_type="text/markdown",
    name="lektor-custom-jinja2-filters",
    packages=find_packages(),
    py_modules=["lektor_custom_jinja2_filters"],
    url="https://github.com/TimidRobot/zehta.me/tree/main/source/packages"
    "/custom-jinja2-filters",
    version="0.3",
    classifiers=[
        "Environment :: Plugins",
        "Framework :: Lektor",
        "License :: CC0 1.0 Universal (CC0 1.0) Public Domain Dedication",
        "Programming Language :: Python :: 3",
    ],
    entry_points={
        "lektor.plugins": [
            "custom-jinja2-filters ="
            " lektor_custom_jinja2_filters:CustomJinja2FiltersPlugin"
        ]
    },
)
