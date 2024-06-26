/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/default_profile_image_big_size.png
  AssetGenImage get defaultProfileImageBigSize =>
      const AssetGenImage('assets/images/default_profile_image_big_size.png');

  /// File path: assets/images/ic_arrow_left.png
  AssetGenImage get icArrowLeft =>
      const AssetGenImage('assets/images/ic_arrow_left.png');

  /// File path: assets/images/ic_arrow_right.png
  AssetGenImage get icArrowRight =>
      const AssetGenImage('assets/images/ic_arrow_right.png');

  /// File path: assets/images/ic_bookmark_list.png
  AssetGenImage get icBookmarkList =>
      const AssetGenImage('assets/images/ic_bookmark_list.png');

  /// File path: assets/images/ic_bookmarked.png
  AssetGenImage get icBookmarked =>
      const AssetGenImage('assets/images/ic_bookmarked.png');

  /// File path: assets/images/ic_close.png
  AssetGenImage get icClose =>
      const AssetGenImage('assets/images/ic_close.png');

  /// File path: assets/images/ic_dotted_line.png
  AssetGenImage get icDottedLine =>
      const AssetGenImage('assets/images/ic_dotted_line.png');

  /// File path: assets/images/ic_error.png
  AssetGenImage get icError =>
      const AssetGenImage('assets/images/ic_error.png');

  /// File path: assets/images/ic_marker.png
  AssetGenImage get icMarker =>
      const AssetGenImage('assets/images/ic_marker.png');

  /// File path: assets/images/ic_no_users.png
  AssetGenImage get icNoUsers =>
      const AssetGenImage('assets/images/ic_no_users.png');

  /// File path: assets/images/ic_unbookmarked.png
  AssetGenImage get icUnbookmarked =>
      const AssetGenImage('assets/images/ic_unbookmarked.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        defaultProfileImageBigSize,
        icArrowLeft,
        icArrowRight,
        icBookmarkList,
        icBookmarked,
        icClose,
        icDottedLine,
        icError,
        icMarker,
        icNoUsers,
        icUnbookmarked
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
