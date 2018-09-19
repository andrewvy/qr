defmodule QR.NIF do
    use Rustler, otp_app: :qr, crate: "qr_nif"

    # When your NIF is loaded, it will override this function.
    def generate_qr_code(_binary), do: :erlang.nif_error(:nif_not_loaded)
end
