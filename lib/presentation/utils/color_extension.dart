import 'dart:ui';

extension ToColorFilter on Color {
  ColorFilter get toColorFilter {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}
