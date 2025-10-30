defmodule Client do
  @moduledoc """
  Cliente TCP simple que se conecta al servidor, envía un mensaje y muestra la respuesta.
  """

  require Logger

  def start(host \\ ~c"localhost", port \\ 4040) do
    # Intentamos conectarnos al servidor
    case :gen_tcp.connect(host, port, [:binary, packet: :line, active: false]) do
      {:ok, socket} ->
        Logger.info("Conectado al servidor #{host}:#{port}")

        # Enviamos un mensaje
        :gen_tcp.send(socket, "Hola servidor!\n")

        # Esperamos respuesta
        case :gen_tcp.recv(socket, 0) do
          {:ok, data} ->
            Logger.info("Respuesta del servidor: #{String.trim(data)}")

          {:error, reason} ->
            Logger.info("Error recibiendo datos: #{inspect(reason)}")
        end

        # Cerramos conexión
        :gen_tcp.close(socket)
        Logger.info("Conexión cerrada.")

      {:error, reason} ->
        Logger.info("Error al conectar: #{inspect(reason)}")
    end
  end
end

Client.start()
