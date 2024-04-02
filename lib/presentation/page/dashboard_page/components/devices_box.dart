part of '../page.dart';

class _DevicesBox extends StatelessWidget {
  const _DevicesBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 559, minHeight: 340),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _DevicesBoxElement(
            text: 'Devices',
            buttonText: 'View All',
            colors: <Color>[Palette.purple, Palette.orange, Palette.lightBlue],
            percents: <double>[35 / 100, 20 / 100, 13 / 100],
            markersName: <String>['Iphone XR', 'Iphone', 'Chrome'],
          ),
          Divider(color: Palette.lightBlue10),
          _DevicesBoxElement(
            text: 'OS Version',
            colors: <Color>[Palette.purple, Palette.orange, Palette.lightBlue],
            percents: <double>[30 / 100, 20 / 100, 13 / 100],
            markersName: <String>['Android', 'iOS 14.3', 'iOS 14.4'],
          ),
        ],
      ),
    );
  }
}

class _DevicesBoxElement extends StatelessWidget {
  const _DevicesBoxElement({
    required this.text,
    required this.colors,
    required this.percents,
    required this.markersName,
    this.buttonText,
  });

  final String text;

  final String? buttonText;

  final List<Color> colors;

  final List<double> percents;

  final List<String> markersName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text, style: TextStyles.myriadProSemiBold22DarkBlue),
            if (buttonText != null)
              InkWell(
                onTap: () {},
                child: Text(
                  buttonText!,
                  style: TextStyles.myriadProSemiBold16LightBlue,
                ),
              ),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 12,
          width: double.infinity,
          child: CustomPaint(
            painter: _BarPainter(
              backgroundColor: Palette.mediumBlue,
              valuesColor: colors,
              values: percents,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 36,
          runSpacing: 10,
          children: <Widget>[
            ...List<Widget>.generate(colors.length + 1, (int index) {
              if (index == colors.length) {
                return const NameAndColorRow(
                  color: Palette.mediumBlue,
                  text: 'Others',
                );
              }
              return NameAndColorRow(
                color: colors[index],
                text: markersName[index],
              );
            }),
          ],
        ),
      ],
    );
  }
}

class _BarPainter extends CustomPainter {
  const _BarPainter({
    required this.backgroundColor,
    required this.valuesColor,
    required this.values,
  });

  final Color backgroundColor;
  final List<Color> valuesColor;

  ///Length of [values] list always should be equal length of [valuesColor] list.
  ///Sum of values should be <= 1
  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(4)),
      paint,
    );

    void drawBar(double x, double width) {
      if (width <= 0.0) return;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Offset(x, 0.0) & Size(width, size.height),
          const Radius.circular(4),
        ),
        paint,
      );
    }

    double currentOffset = 0;
    for (int i = 0; i < values.length; i++) {
      paint.color = valuesColor[i];
      drawBar(currentOffset, values[i].clamp(0.0, 1.0) * size.width);

      currentOffset += values[i].clamp(0.0, 1.0) * size.width + 6;
    }
  }

  @override
  bool shouldRepaint(_BarPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valuesColor != valuesColor ||
        oldPainter.values != values;
  }
}
