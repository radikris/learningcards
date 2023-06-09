/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class Assets {
  Assets._();

  static const SvgGenImage bookmark = SvgGenImage('assets/Bookmark.svg');
  static const SvgGenImage comments = SvgGenImage('assets/Comments.svg');
  static const SvgGenImage flip = SvgGenImage('assets/Flip.svg');
  static const SvgGenImage like = SvgGenImage('assets/Like.svg');
  static const SvgGenImage share = SvgGenImage('assets/Share.svg');
  static const SvgGenImage activity = SvgGenImage('assets/activity.svg');
  static const SvgGenImage bookmarks = SvgGenImage('assets/bookmarks.svg');
  static const SvgGenImage discover = SvgGenImage('assets/discover.svg');
  static const SvgGenImage home = SvgGenImage('assets/home.svg');
  static const SvgGenImage mcqFailure = SvgGenImage('assets/mcqFailure.svg');
  static const SvgGenImage mcqSuccess = SvgGenImage('assets/mcqSuccess.svg');
  static const SvgGenImage playlist = SvgGenImage('assets/playlist.svg');
  static const SvgGenImage plus = SvgGenImage('assets/plus.svg');
  static const SvgGenImage profile = SvgGenImage('assets/profile.svg');
  static const SvgGenImage rightArrow = SvgGenImage('assets/right_arrow.svg');
  static const SvgGenImage search = SvgGenImage('assets/search.svg');
  static const SvgGenImage timer = SvgGenImage('assets/timer.svg');
  static const SvgGenImage userPlaceholder =
      SvgGenImage('assets/user_placeholder.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        bookmark,
        comments,
        flip,
        like,
        share,
        activity,
        bookmarks,
        discover,
        home,
        mcqFailure,
        mcqSuccess,
        playlist,
        plus,
        profile,
        rightArrow,
        search,
        timer,
        userPlaceholder
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
