# zehta.me

Source for [zehta.me][zehta-me].

[zehta-me]: https://zehta.me/


## Overview

The source is located in [`source/`](source/).

The built content is located in [`docs/`](docs/).


## Development

1. Install [Pipenv][pipenv]
    ```shell
    brew install pipenv
    ```
2. Install [Lektor][lektor] and other Python 3 dependencies via Pipenv
    ```shell
    pipenv install
    ```
3. Run Lektor development server (with custom output path)
    ```shell
    ./server.sh
    ```
   - access development site at http://127.0.0.1:5000/

[pipenv]: https://docs.pipenv.org/en/latest/
[lektor]: https://www.getlektor.com/docs/


## Theme

See [New Website - Timid Robot](https://zehta.me/2019/12/new-website/).


## Custom Lektor Plugins

- [`source/packages/custom-jinja2-filters`][custom-jinja2-filters]

[custom-jinja2-filters]: source/packages/custom-jinja2-filters


## Resources

Thank you to the free and open source software, open content, and non-profits
that contributed to me being able to create and maintain this blog!

- Software and Third-party Content
  - [Lektor Documentation][lektor]: Static Content Management System
    - [Plugins][plugins]:
      - [nixjdm/lektor-atom][atom]: Lektor Atom plugin.
      - [lektor/lektor-markdown-header-anchors][md-header]: Adds support for
        anchors and table of contents to Markdown.
      - [lektor/lektor-markdown-highlighter][highlighter]: Adds support for
        syntax highlighting through Pygments to Lektor's markdown support
      - [pietroalbini/lektor-minify][minify]: Minify build artifacts in a
        Lektor project
      - [Andrew-Shay/lektor-read-full-post][read-full]: Allows blog listing
        posts to be shortened with a link to the full post.
  - Python Tooling
    - [Black][black]: the uncompromising Python code formatter
    - [flake8][flake8]: a python tool that glues together pep8, pyflakes,
      mccabe, and third-party plugins to check the style and quality of some
      python code.
    - [isort][isort]: A Python utility / library to sort imports.
    - [Pipenv Documentation][pipenv]: Python Dev Workflow for Humans
  - [Skeleton][skeleton]: Responsive CSS Boilerplate
  - [Free and Brand Icons | Font Awesome][icons]
- Guides
  - [Building a static blog with Lektor | Animesh Bulusu][building]
- Web Development
  - [Closest Named Web Colors][closecolors]
  - [CSS Selectors Reference][selectors]
- Link rot
  - [Wayback Machine][wayback] by the [Internet Archive][archive]

[icons]: https://fontawesome.com/icons?d=gallery&s=brands&m=free
[plugins]: https://www.getlektor.com/docs/plugins/
[atom]: https://github.com/nixjdm/lektor-atom
[md-header]: https://github.com/lektor/lektor-markdown-header-anchors
[highlighter]: https://github.com/lektor/lektor-markdown-highlighter
[minify]: https://github.com/pietroalbini/lektor-minify
[read-full]: https://github.com/Andrew-Shay/lektor-read-full-post
[black]: https://github.com/psf/black
[flake8]: https://gitlab.com/pycqa/flake8
[isort]: https://pycqa.github.io/isort/
[skeleton]: http://getskeleton.com/
[building]: https://animesh.blog/building-a-static-blog-with-lektor/
[closecolors]: https://wismuth.com/webcolors.html
[selectors]: https://www.w3schools.com/cssref/css_selectors.asp
[wayback]: https://web.archive.org/
[archive]: https://archive.org/


## Licenses


### Code

**Unless otherwise specified,** the code within this repository is licensed
under a [Unlicense][unlicense]. (Much of the code used in this respository is
standard boilerplate or otherwise *should* be too simple and obvious to
copyright.)

[unlicense]:https://unlicense.org/ "Unlicense.org » Unlicense Yourself: Set Your Code Free"


### Content

[![CC BY-SA 4.0 license button][cc-by-sa-png]][cc-by-sa1]
**Unless otherwise specified,** the content within this repository is licensed
under a [Creative Commons Attribution-ShareAlike 4.0 International
License][cc-by-sa2].

[cc-by-sa-png]: https://licensebuttons.net/l/by-sa/4.0/88x31.png#floatleft "CC BY-SA 4.0 license button"
[cc-by-sa1]: https://creativecommons.org/licenses/by-sa/4.0/ "CC BY-SA 4.0"
[cc-by-sa2]: https://creativecommons.org/licenses/by-sa/4.0/ "Creative Commons Attribution-ShareAlike 4.0 International License"


### Font Awesome

> Font Awesome Free is free, open source, and GPL friendly. You can use it for
> commercial projects, open source projects, or really almost whatever you
> want. Full Font Awesome Free license: https://fontawesome.com/license/free.

> **Icons:** CC BY 4.0 License (https://creativecommons.org/licenses/by/4.0/)
> In the Font Awesome Free download, the CC BY 4.0 license applies to all icons
> packaged as SVG and JS file types.

> **Fonts:** SIL OFL 1.1 License (https://scripts.sil.org/OFL)
> In the Font Awesome Free download, the SIL OFL license applies to all icons
> packaged as web and desktop font files.

> **Brand Icons:**
> All brand icons are trademarks of their respective owners. The use of these
> trademarks does not indicate endorsement of the trademark holder by Font
> Awesome, nor vice versa. **Please do not use brand logos for any purpose
> except to represent the company, product, or service to which they refer.**


### Skeleton

> All parts of [Skeleton][skeleton-gh] are free to use and abuse under the
> [open-source MIT license][mit].

[skeleton-gh]: https://github.com/dhg/Skeleton
[mit]: https://github.com/dhg/Skeleton/blob/master/LICENSE.md
