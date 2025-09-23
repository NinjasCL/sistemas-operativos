defmodule Mix.Tasks.Input do
  @moduledoc "Creates the input file using random data"
  use Mix.Task
  alias Concurrency

  def run(_args) do
    Concurrency.create_input_file()
  end

end
