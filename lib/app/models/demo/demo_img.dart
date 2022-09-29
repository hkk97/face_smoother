class DemoImg {
  final String beforeImgSrc;
  final String afterImgSrc;
  DemoImg._({
    required this.beforeImgSrc,
    required this.afterImgSrc,
  });

  static DemoImg interact() => DemoImg._(
        beforeImgSrc: 'demo/demo_6_before.webp',
        afterImgSrc: 'demo/demo_6_after.webp',
      );

  static List<DemoImg> demos() => List.generate(
        5,
        (index) => DemoImg._(
          beforeImgSrc: 'demo/demo_${index + 1}_before.webp',
          afterImgSrc: 'demo/demo_${index + 1}_after.webp',
        ),
      );
}
