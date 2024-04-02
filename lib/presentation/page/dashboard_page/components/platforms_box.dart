part of '../page.dart';

class _PlatformsBox extends StatelessWidget {
  const _PlatformsBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268,
      height: 430,
      padding: const EdgeInsets.fromLTRB(32, 22, 32, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Platforms',
            style: TextStyles.myriadProSemiBold22DarkBlue,
          ),
          SizedBox(height: 24),
          _Circles(),
          SizedBox(height: 21),
          _PlatformsList(),
        ],
      ),
    );
  }
}

class _Circles extends StatelessWidget {
  const _Circles();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 170,
      height: 150,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 25,
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Palette.purple,
              child: Text(
                '30',
                style: TextStyles.myriadProSemiBold22White,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 55,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Palette.lightBlue,
              child: Text(
                '10',
                style: TextStyles.myriadProSemiBold22White,
              ),
            ),
          ),
          Positioned(
            left: 60,
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Palette.orange,
              child: Text(
                '60',
                style: TextStyles.myriadProSemiBold24White,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlatformsList extends StatelessWidget {
  const _PlatformsList();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        _PlatformListElement(
          platformName: 'Android',
          percent: 60,
          foregroundColor: Palette.orange,
          backgroundColor: Palette.orange10,
        ),
        SizedBox(height: 20),
        _PlatformListElement(
          platformName: 'iOS',
          percent: 30,
          foregroundColor: Palette.purple,
          backgroundColor: Palette.purple10,
        ),
        SizedBox(height: 20),
        _PlatformListElement(
          platformName: 'Web',
          percent: 10,
          foregroundColor: Palette.lightBlue,
          backgroundColor: Palette.lightBlue10,
        ),
      ],
    );
  }
}

class _PlatformListElement extends StatelessWidget {
  const _PlatformListElement({
    required this.platformName,
    required this.percent,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final String platformName;

  final double percent;

  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(platformName, style: TextStyles.myriadProSemiBold13Dark),
            Text('$percent%', style: TextStyles.myriadProRegular13DarkGrey),
          ],
        ),
        const SizedBox(height: 3),
        SizedBox(
          height: 10,
          width: double.infinity,
          child: CustomPaint(
            painter: _PercentBarPainter(
              backgroundColor: backgroundColor,
              valueColor: foregroundColor,
              value: percent / 100,
            ),
          ),
        ),
      ],
    );
  }
}

class _PercentBarPainter extends CustomPainter {
  const _PercentBarPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
  });

  final Color backgroundColor;
  final Color valueColor;

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(4.5)),
      paint,
    );

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0) return;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Offset(x, 0.0) & Size(width, size.height),
          const Radius.circular(4.5),
        ),
        paint,
      );
    }

    drawBar(0.0, value.clamp(0.0, 1.0) * size.width);
  }

  @override
  bool shouldRepaint(_PercentBarPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.value != value;
  }
}
