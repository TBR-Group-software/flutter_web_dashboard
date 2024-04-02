part of '../../page.dart';

class _StatisticsBox extends StatefulWidget {
  const _StatisticsBox();

  @override
  State<_StatisticsBox> createState() => _StatisticsBoxState();
}

class _StatisticsBoxState extends State<_StatisticsBox> {
  final PageController _controller = PageController(initialPage: 1);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 848,
      height: 430,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32.0, left: 32.0),
            child: Text(
              'Statistics',
              style: TextStyles.myriadProSemiBold22DarkBlue,
            ),
          ),
          const SizedBox(height: 26),
          _StatisticsTabs(pageController: _controller),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: const <Widget>[
                _LocationPage(),
                _DemographicsPage(),
                _InterestsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatisticsTabs extends StatefulWidget {
  const _StatisticsTabs({required this.pageController});

  final PageController pageController;

  @override
  _StatisticsTabsState createState() => _StatisticsTabsState();
}

class _StatisticsTabsState extends State<_StatisticsTabs>
    with TickerProviderStateMixin {
  late final TabController _controller;

  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
      initialIndex: selectedIndex,
    );
    _controller.addListener(() {
      widget.pageController.jumpToPage(_controller.index);
      setState(() {
        selectedIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.only(left: 20),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      controller: _controller,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Palette.lightBlue,
      tabs: [
        _StatisticsTab(
          isSelected: selectedIndex == 0,
          text: 'Location',
        ),
        _StatisticsTab(
          isSelected: selectedIndex == 1,
          text: 'Demographics',
        ),
        _StatisticsTab(
          isSelected: selectedIndex == 2,
          text: 'Interests',
        ),
      ],
    );
  }
}

class _StatisticsTab extends StatelessWidget {
  const _StatisticsTab({required this.text, required this.isSelected});

  final bool isSelected;

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Text(
        text,
        style: isSelected
            ? TextStyles.myriadProSemiBold14LightBlue
            : TextStyles.myriadProSemiBold14DarkBlue.copyWith(
                color: Palette.darkBlue.withOpacity(0.4),
              ),
      ),
    );
  }
}
