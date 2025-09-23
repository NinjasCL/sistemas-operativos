defmodule Mix.Tasks.Output do
  @moduledoc "Creates the output file using input.txt"
  use Mix.Task
  alias Concurrency

  def run(_args) do
    Concurrency.create_output_file()
  end
end
