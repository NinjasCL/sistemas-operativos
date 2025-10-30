defmodule Server do
  @moduledoc """
  Servidor TCP simple que acepta conexiones y responde un saludo.
  """

  require Logger

  def start(port \\ 4040) do
    # Abrimos un socket TCP en modo :binary, activo falso (modo manual)
    {:ok, listen_socket} =
      :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])

    Logger.info("Servidor escuchando en el puerto #{port}...")

    # Aceptamos conexiones de manera recursiva
    accept_loop(listen_socket)
  end

  defp accept_loop(listen_socket) do
    # Esperamos una conexión entrante
    {:ok, socket} = :gen_tcp.accept(listen_socket)
    Logger.info("Cliente conectado.")

    # Iniciamos un proceso separado para manejar al cliente
    spawn(fn -> handle_client(socket) end)

    # Volvemos a esperar más conexiones
    accept_loop(listen_socket)
  end

  defp handle_client(socket) do
    case :gen_tcp.recv(socket, 0) do
      {:ok, data} ->
        Logger.info("Mensaje recibido: #{String.trim(data)}")

        # Enviar respuesta al cliente
        :gen_tcp.send(socket, "Hola desde el servidor TCP!\r\n")

        # Volver a esperar datos
        handle_client(socket)

      {:error, :closed} ->
        Logger.info("Cliente desconectado.")
        :ok
    end
  end
end

Server.start()
