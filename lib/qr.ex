defmodule QR do
  @moduledoc """
  Documentation for QR.
  """

  @spec to_binary(binary()) :: {:ok, binary()} | {:error, binary()}
  def to_binary(binary_data) do
    QR.NIF.generate_qr_code(binary_data)
  end

  @spec to_png(binary(), String.t) :: {:ok, String.t} | {:error, String.t}
  def to_png(binary_data, path) do
    with \
      {:ok, png_data} <- QR.NIF.generate_qr_code(binary_data),
      :ok <- File.write(path, png_data)
    do
      {:ok, path}
    else
      error -> error
    end
  end
end
