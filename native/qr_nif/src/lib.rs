#[macro_use] extern crate rustler;
#[macro_use] extern crate rustler_codegen;
#[macro_use] extern crate lazy_static;

extern crate qrcode;
extern crate bytes;
extern crate image;

use rustler::{Env, Term, NifResult, Encoder};
use rustler::types::Binary;

mod interface;

mod atoms {
    rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler_export_nifs! {
    "Elixir.QR.NIF",
    [("generate_qr_code", 1, generate_qr_code)],
    None
}

fn generate_qr_code<'a>(env: Env<'a>, args: &[Term<'a>]) -> NifResult<Term<'a>> {
    let binary: Binary = args[0].decode()?;
    let image_data = interface::generate_qr_code(binary.as_slice());

    Ok((atoms::ok(), image_data.into_inner()).encode(env))
}
