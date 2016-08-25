# Delorean

See tests for examples on how to use Delorean for time traveling.

## Installation

  1. Add `delorean` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:delorean, "~> 1.0.0"}]
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
