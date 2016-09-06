# Delorean

[![Hex.pm](https://img.shields.io/hexpm/v/delorean.svg)](https://hex.pm/packages/delorean)
[![Hex.pm](https://img.shields.io/hexpm/l/delorean.svg)](http://choosealicense.com/licenses/mit/)
[![Hex.pm](https://img.shields.io/hexpm/dt/delorean.svg)](https://hex.pm/packages/delorean)
[![Inline docs](http://inch-ci.org/github/Willamin/delorean.svg)](http://inch-ci.org/github/Willamin/delorean)


See tests for examples on how to use Delorean for time traveling.

## Installation

  1. Add `delorean` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:delorean, "~> 1.3.0"}]
    end
    ```

  2. Ensure `delorean` is started before your application:

    ```elixir
    def application do
      [applications: [:delorean]]
    end
    ```

## TODO

- Add support for time
- Add support for datetime
- Add tests for the non-bang `Delorean.travel/2`
- Add real-life examples
- Provide a more robust readme
