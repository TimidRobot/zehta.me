# zehta.me

Source for [zehta.me][zehta-me].

[zehta-me]: https://zehta.me/


## Overview

The source is located in [`source/`](source/).

The built content is located in [`docs/`](docs/).


## Development


### Docker NGINX and Lektor build

This option serves content more reliably, but rebuilds all content instead of
only content that has changed.

1. Install [uv][uv]
    ```shell
    brew install uv
    ```
2. Install [Lektor][lektor] and other Python 3 dependencies via uv
    ```shell
    uv sync --locked
    ```
3. Install Docker ([Install Docker Engine | Docker
   Documentation][installdocker])
4. Run Docker NGINX and Lektor build
   - Run NGINX webserver via Docker
        ```shell
        docker compose up; docker compose down
        ```
     - access development site at [`127.0.0.1:8080`](http://127.0.0.1:8080/)
   - Rebuild output, as necessary
        ```shell
        ./build.sh
        ```

[uv]: https://docs.astral.sh/uv/
[lektor]: https://www.getlektor.com/docs/
[installdocker]: https://docs.docker.com/engine/install/


#### `build.sh` Usage

```
Usage:  build.sh [OPTIONS]

Options:
    -h  Show this help message and exit
    -p  Pretify HTML and skip minify
    -x  Clear Lektor plugins

Description:
    Build website in docs/ dirctory.
```


### Lektor Server

This option process changes faster (only rebuilding changed content), but also
injects Lektor admin UX and is slower than NGINX (bad for performance testing).

1. Install [uv][uv]
    ```shell
    brew install pipenv
    ```
2. Install [Lektor][lektor] and other Python 3 dependencies via Pipenv
    ```shell
    uv sync --locked 
    ```
3. Run Lektor development server
    ```shell
    ./server.sh
    ```
   - access development site at [`127.0.0.1:5000`](http://127.0.0.1:5000/)

[uv]: https://docs.astral.sh/uv/
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
    - [lektor/lektor][lektorgh]: The lektor static file content management
      system (GitHub)
    - [Plugins][plugins]:
      - [nixjdm/lektor-atom][atom]: Lektor Atom plugin.
      - [chaos-bodensee/lektor-html-pretify][pretify]: Lektor plugin to pretify
        HTML
      - [lektor/lektor-markdown-header-anchors][md-header]: Adds support for
        anchors and table of contents to Markdown.
      - [lektor/lektor-markdown-highlighter][highlighter]: Adds support for
        syntax highlighting through Pygments to Lektor's markdown support
      - [pietroalbini/lektor-minify][minify]: Minify build artifacts in a
        Lektor project
      - [Andrew-Shay/lektor-read-full-post][read-full]: Allows blog listing
        posts to be shortened with a link to the full post.
  - Python Tooling
    - [ruff][ruff]: An extremely fast Python linter and code formatter, written
      in Rust.
    - [uv][uv]: An extremely fast Python package and project manager, written
      in Rust.
  - CSS / Layout
    - [csstools/normalize.css][normalize]: A cross-browser CSS foundation
    - [Skeleton][skeleton]: Responsive CSS Boilerplate
  - [Free and Brand Icons | Font Awesome][icons]
- Guides
  - [Building a static blog with Lektor | Animesh Bulusu][building]
- Web Development
  - [Closest Named Web Colors][closecolors]
  - [CSS Selectors Reference][selectors]
- Link rot
  - [Wayback Machine][wayback] by the [Internet Archive][archive]

[lektor]: https://www.getlektor.com/docs/
[lektorgh]: https://github.com/lektor/lektor
[plugins]: https://www.getlektor.com/docs/plugins/
[atom]: https://github.com/nixjdm/lektor-atom
[pretify]: https://github.com/chaos-bodensee/lektor-html-pretify
[md-header]: https://github.com/lektor/lektor-markdown-header-anchors
[highlighter]: https://github.com/lektor/lektor-markdown-highlighter
[minify]: https://github.com/pietroalbini/lektor-minify
[read-full]: https://github.com/Andrew-Shay/lektor-read-full-post
[ruff]: https://docs.astral.sh/ruff/
[uv]: https://docs.astral.sh/uv/
[normalize]: https://github.com/csstools/normalize.css
[skeleton]: http://getskeleton.com/
[icons]: https://fontawesome.com/icons?d=gallery&s=brands&m=free
[building]: https://animesh.blog/building-a-static-blog-with-lektor/
[closecolors]: https://wismuth.com/webcolors.html
[selectors]: https://www.w3schools.com/cssref/css_selectors.asp
[wayback]: https://web.archive.org/
[archive]: https://archive.org/


## Licenses


### Code

[![CC0 dedication button][cc-zero-png]][cc-zero]
**Unless otherwise specified,** the code within this repository is dedicated,
with all copyright and related and neighboring rights, to the public domain
worldwide. It is distributed without any warranty. ([CC0 1.0 Universal (CC0
1.0) Public Domain Dedication][cc-zero])

(It is my opinion that much of the code used in this respository is standard
boilerplate or otherwise *should* be too simple and obvious to copyright.)

[cc-zero-png]: https://licensebuttons.net/l/zero/1.0/88x31.png#floatleft "CC0 1.0 dedication button"
[cc-zero]: https://creativecommons.org/publicdomain/zero/1.0/ "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication"


### Content

[![CC BY-SA 4.0 license button][cc-by-sa-png]][cc-by-sa]
**Unless otherwise specified,** the content within this repository is licensed
under a [Creative Commons Attribution-ShareAlike 4.0 International
License][cc-by-sa].

[cc-by-sa-png]: https://licensebuttons.net/l/by-sa/4.0/88x31.png#floatleft "CC BY-SA 4.0 license button"
[cc-by-sa]: https://creativecommons.org/licenses/by-sa/4.0/ "Creative Commons Attribution-ShareAlike 4.0 International License"

### Font Awesome

[Free License | Font Awesome](https://fontawesome.com/license/free) (retreived
`2022-03-04`):
> **Icons — [CC BY 4.0 License](https://creativecommons.org/licenses/by/4.0/)**
>
> In the Font Awesome Free download, the CC BY 4.0 license applies to all icons
> packaged as `.svg` and `.js` files types.

> **Fonts — [SIL OFL 1.1 License](https://scripts.sil.org/OFL)**
>
> In the Font Awesome Free download, the SIL OFL license applies to all icons
> packaged as web and desktop font files.

> **Code — [MIT License](https://opensource.org/licenses/MIT)**
>
> In the Font Awesome Free download, the MIT license applies to all non-font
> and non-icon files.

> **Brand Icons**
>
> All [brand icons](https://fontawesome.com/search?p=1&s=brands) are trademarks
> of their respective owners. The use of these trademarks does not indicate
> endorsement of the trademark holder by Font Awesome, nor vice versa. **Please
> do not use brand logos for any purpose except to represent the company,
> product, or service to which they refer.**


### normalize.css

@csstools/normalize.css is dedicated, with all copyright and related and
neighboring rights, to the public domain worldwide. It is distributed without
any warranty. ([CC0 1.0 Universal (CC0 1.0) Public Domain Dedication][cc-zero])

[cc-zero]: https://creativecommons.org/publicdomain/zero/1.0/ "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication"


### Skeleton

Skeleton is [licensed][skeletonlicensed] under the Expat/[MIT][mit]
License.

[skeletonlicensed]: https://github.com/dhg/Skeleton/blob/master/LICENSE.md
[mit]: http://www.opensource.org/licenses/MIT "The MIT License | Open Source Initiative"
