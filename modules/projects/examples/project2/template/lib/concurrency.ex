defmodule Concurrency do
  alias Faker

  # https://hexdocs.pm/faker/readme.html
  import Faker, only: [samplerp: 2]
  require Logger

  @max_items 1_000_000
  @input_name "input.txt"
  @output_name "output.csv"

  # Faker.format(cell_number_format()),
  samplerp(:cell_number_format, [
    "569########"
  ])

  # Faker.format(rut_number_format())
  samplerp(:rut_number_format, [
    "30######-#"
  ])

  # Implement input creation
  # mix input
  def create_input_file() do
    Logger.info("Generating Input File")
    Faker.start()
    # TODO: Implementar
  end

  # Implement output creation
  # mix output
  def create_output_file() do
    Logger.info("Generating output file")
    # TODO: Implementar
  end
end
