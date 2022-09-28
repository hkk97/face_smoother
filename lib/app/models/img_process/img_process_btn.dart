import 'package:flutter_web_smoother_plguin_example/app/const/app_enum.dart';

class ImgProcessBtn {
  final String name;
  final SelectedMode mode;

  ImgProcessBtn._({
    required this.name,
    required this.mode,
  });

  static final _origin = ImgProcessBtn._(
    name: 'Origin',
    mode: SelectedMode.before,
  );

  static final _after = ImgProcessBtn._(
    name: 'After',
    mode: SelectedMode.after,
  );

  static final _fileInfo = ImgProcessBtn._(
    name: 'FileInfo',
    mode: SelectedMode.fileInfo,
  );

  static List<ImgProcessBtn> values = [
    _origin,
    _after,
    _fileInfo,
  ];
}
