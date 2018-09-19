use qrcode::QrCode;
use image::{self, DynamicImage, Luma, ImageOutputFormat};
use bytes::{BufMut, Writer};

pub fn generate_qr_code(data: &[u8]) -> Writer<Vec<u8>> {
    let mut bytes = vec![].writer();

    let code = QrCode::new(data).unwrap();

    let image: DynamicImage = image::ImageLuma8(
        code.render::<Luma<u8>>()
        .module_dimensions(2, 2)
        .build()
    );

    image.write_to(&mut bytes, ImageOutputFormat::PNG);

    bytes
}
