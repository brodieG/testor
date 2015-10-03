# unitizeR - Easy R Unit Tests
<table style="border:none;">
  <tr>
    <td>Build:<td>[![Travis CI Build Status][t master]][t link], RC: [![Travis CI Build Status][t rc]][t link], Dev: [![Travis CI Build Status][t dev]][t link]
  <tr>
    <td>Coverage:<td>[![Codecov Coverage][c master]][c link m], RC: [![Codecov Coverage][c rc]][c link rc], Dev: [![Codecov Coverage][c dev]][c link dev]
</table>

[t master]: https://travis-ci.org/brodieG/unitizer.png?branch=master
[t rc]: https://travis-ci.org/brodieG/unitizer.png?branch=rc
[t dev]: https://travis-ci.org/brodieG/unitizer.png?branch=development
[t link]: https://travis-ci.org/brodieG/unitizer

[c master]: https://codecov.io/github/brodieG/unitizer/coverage.svg?branch=master
[c rc]: https://codecov.io/github/brodieG/unitizer/coverage.svg?branch=rc
[c dev]: https://codecov.io/github/brodieG/unitizer/coverage.svg?branch=development
[c link m]: https://codecov.io/github/brodieG/unitizer?branch=master
[c link rc]: https://codecov.io/github/brodieG/unitizer?branch=rc
[c link dev]: https://codecov.io/github/brodieG/unitizer?branch=dev

## TL;DR

`unitizer` simplifies creating, reviewing, and debugging unit tests in R.  To install:
```
library(devtools)
install_github("brodieg/unitizer")
```
We will release to CRAN once version 1.0.x is more thoroughly tested.

`unitizer` bakes in a lot of contextual help so you can get started without reading all the documentation.  Try the demo to get an idea:
```
library(unitizer)
demo(unitizer)
```
Or just write up some test expressions in a file, and run:
```
library(unitizer)
unitize("my_file_name.R")
```

## Usage

`unitizer` stores R expressions and the result of evaluating them so that it can detect code regressions.  This is similar to saving test output to a `.Rout.save` file as documented in [Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Package-subdirectories), except that:

* Result objects and signaled conditions are automatically saved
* You can review each test separately before it is stored
* When a test fails, you can immediately review it interactively with all variables set to the same values they had when the test was run
* You can easily add, remove, and modify tests

To use `unitizer`:

* Write test expressions as you would when informally testing code on the command line, and save them to a file (e.g. "my_file_name.R")
* Run `unitize("my_file_name.R")` and follow the prompts
* Continue developing your package
* Re-run `unitize("my_file_name.R")`; if any tests fail you will be able to review and debug them in an interactive prompt

`unitizer` can run in a non-interactive mode for use with `R CMD check`.

## Documentation

In addition to `help(package="unitizer")` (in particular `?unitize`), `demo(package="unitizer")`, there are several vignettes:

  * [Introduction](http://htmlpreview.github.io/?https://raw.githubusercontent.com/brodieG/unitizer/master/inst/doc/unitizer.html) An overview of `unitizer`, including a comparison to existing unit testing frameworks.
  * [Test details](http://htmlpreview.github.io/?https://raw.githubusercontent.com/brodieG/unitizer/master/inst/doc/unitizer_tests.html) how to modify how new tests are compared to reference values, how to organize your tests into sections, and what aspects of expression evaluation can be tested.
  * [Interactive Environment](http://htmlpreview.github.io/?https://raw.githubusercontent.com/brodieG/unitizer/master/inst/doc/unitizer_interactive_env.html) reviews the `unitizer` interactive environments, highlights differences with the standard R prompt, explains the different unitizer commands, discusses the .new/.NEW and .ref/.REF `unitizer` objects, and more.
  * [Reproducible Tests](http://htmlpreview.github.io/?https://raw.githubusercontent.com/brodieG/unitizer/master/inst/doc/unitizer_reproducible_tests.html) reviews how `unitizer` tracks and manages different aspects of session state to insulate tests from variability in user workspace state
  * [Esoteric Topics](http://htmlpreview.github.io/?https://raw.githubusercontent.com/brodieG/unitizer/master/inst/doc/unitizer_miscellaneous.html) more details on test environment structure, how `unitizer`s are stored (and alteranatives), version control issues, troubleshooting tips, and more

## Acknowledgments

Thank you to:

* Hadley Wickham for devoting so much of his life to making the R universe a better place to live in.  `unitizer` borrows several concepts from `testthat`, and uses `testthat` for internal unit tests.
* Jim Hester for developing `covr` and nudging me to use it.  Seeing line by line test coverage is an eye opening experience.
* R Core for developing such a wonderfully flexible language

## About the Author

Brodie Gaslam is a hobbyist programmer based in the US East Coast.
