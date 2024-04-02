part of '../page.dart';

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Row(
        children: <Widget>[
          Spacer(),
          _BellIcon(hasNotifications: true),
          SizedBox(width: 34),
          CircleAvatar(backgroundColor: Colors.green, radius: 23),
          SizedBox(width: 40),
        ],
      ),
    );
  }
}

class _BellIcon extends StatelessWidget {
  const _BellIcon({required this.hasNotifications});

  final bool hasNotifications;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        ProjectAssets.icons.bell.svg(
          width: 24,
          height: 27.79,
          colorFilter: Palette.black.toColorFilter,
        ),
        if (hasNotifications)
          Container(
            margin: const EdgeInsets.all(1),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Palette.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Palette.dirtyWhite),
            ),
          ),
      ],
    );
  }
}
