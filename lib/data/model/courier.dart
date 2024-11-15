class Courier {
  String code;
  String description;
  String imageAsset;

  Courier({
    required this.code,
    required this.description,
    required this.imageAsset,
  });

  static List<Courier> list = [
    Courier(
      code: 'jne',
      description: 'JNE',
      imageAsset: 'assets/images/jne.png',
    ),
    Courier(
      code: 'pos',
      description: 'POS Indonesia',
      imageAsset: 'assets/images/pos.png',
    ),
    Courier(
      code: 'tiki',
      description: 'TIKI',
      imageAsset: 'assets/images/tiki.png',
    ),
    Courier(
      code: 'sicepat',
      description: 'SiCepat',
      imageAsset: 'assets/images/sicepat.png',
    ),
    Courier(
      code: 'anteraja',
      description: 'AnterAja',
      imageAsset: 'assets/images/anteraja.png',
    ),
    Courier(
      code: 'lex',
      description: 'Lazada Express',
      imageAsset: 'assets/images/lex.png',
    ),
    Courier(
      code: 'ninja',
      description: 'Ninja Express',
      imageAsset: 'assets/images/ninja.png',
    ),
    Courier(
      code: 'wahana',
      description: 'Wahana',
      imageAsset: 'assets/images/wahana.png',
    ),
    Courier(
      code: 'jnt',
      description: 'J&T Express',
      imageAsset: 'assets/images/jnt.png',
    ),
    Courier(
      code: 'jnt_cargo',
      description: 'J&T Cargo',
      imageAsset: 'assets/images/jnt_cargo.png',
    ),
    Courier(
      code: 'spx',
      description: 'Shopee Express',
      imageAsset: 'assets/images/spx.png',
    ),
    Courier(
      code: 'kurir_tokopedia',
      description: 'Kurir Rekomendasi Tokopedia',
      imageAsset: 'assets/images/kurir_tokopedia.png',
    ),
  ];
}
