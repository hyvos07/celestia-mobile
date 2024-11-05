part of '_constants.dart';

class Assets {
  static final svg = _SvgAssets();
  static final image = _ImageAssets();
}

class _SvgAssets {
  final String _basePath = 'assets/svgs';

  String get logo => '$_basePath/logo.svg';
}

class _ImageAssets {
  final String _basePath = 'assets/images';

  String get logoHorizontal => '$_basePath/logo_horizontal.png';
  String get furinaSad => '$_basePath/furina_sad.png';
}
