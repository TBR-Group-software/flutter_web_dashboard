part of '../page.dart';

class _InformationRow extends StatelessWidget {
  const _InformationRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 22,
      runSpacing: 22,
      children: <Widget>[
        _InformationBox(
          icon: ProjectAssets.icons.rocketOrange.svg(),
          backgroundColor: Palette.orange.withOpacity(0.1),
          number: 21343,
          haveIncreased: true,
          percent: 3.9,
          text: 'Total Installation',
        ),
        _InformationBox(
          icon: ProjectAssets.icons.chartPurple.svg(),
          backgroundColor: Palette.lightPurple.withOpacity(0.8),
          number: 22424,
          haveIncreased: true,
          percent: 3.9,
          text: 'Total Active Users',
        ),
        _InformationBox(
          icon: ProjectAssets.icons.newUserBlue.svg(),
          backgroundColor: Palette.lightBlue.withOpacity(0.1),
          number: 353,
          haveIncreased: true,
          percent: 3.9,
          text: 'New Users',
        ),
        _InformationBox(
          icon: ProjectAssets.icons.speedometerYellow.svg(),
          backgroundColor: Palette.yellow.withOpacity(0.2),
          number: 34,
          showPercent: true,
          haveIncreased: true,
          percent: 3.9,
          text: 'Retention Rate',
        ),
      ],
    );
  }
}
