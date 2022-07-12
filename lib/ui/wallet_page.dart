import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:technical_challange/shared/colors_value.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    const Color(0xff199eff),
    const Color(0xff199eff).withOpacity(0),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 26,
              ),
              _buildAppbar(),
              const SizedBox(
                height: 24,
              ),
              _buildCardChoise(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Total spending',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorsValue.black100),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16, right: 15, left: 14),
                decoration: BoxDecoration(
                    color: const Color(0xffF2F3F3),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Day',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color(0xff999EA1)),
                    ),
                    Column(
                      children: [
                        Text(
                          'Week',
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: ColorsValue.black100),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 3, bottom: 5),
                          decoration: const BoxDecoration(
                              color: ColorsValue.blue100,
                              shape: BoxShape.circle),
                        )
                      ],
                    ),
                    Text(
                      'Month',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color(0xff999EA1)),
                    ),
                    Text(
                      'Custom range',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: const Color(0xff999EA1)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              _buildChartAndAspectR(),
              const SizedBox(
                height: 8,
              ),
              _buildResult(),
              Container(
                margin: const EdgeInsets.only(bottom: 8, top: 6),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffF2F3F3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Weekly income',
                          style: GoogleFonts.manrope(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '\$2,960.00',
                          style: GoogleFonts.manrope(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffF2F3F3),
                        minimumSize: const Size(79, 36),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'See details',
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: ColorsValue.black100),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildResult() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xffF2F3F3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weekly spend',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: ColorsValue.black100),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '\$1,454.00',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorsValue.black100),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xffF2F3F3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shopping',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: ColorsValue.black100),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '\$890.00',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorsValue.black100),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xffF2F3F3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Others',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: ColorsValue.black100),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '\$564.00',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorsValue.black100),
              )
            ],
          ),
        )
      ],
    );
  }

  AspectRatio _buildChartAndAspectR() {
    return AspectRatio(
      aspectRatio: 1.50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: Colors.white,
          border: Border.all(
            color: const Color(0xffF2F3F3),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: LineChart(
            _buildChart(),
          ),
        ),
      ),
    );
  }

  LineChartData _buildChart() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white,
            strokeWidth: 0,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xffF2F3F3),
            strokeWidth: 1,
            dashArray: [
              5,
            ],
          );
        },
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: ColorsValue.blue100,
          getTooltipItems: (value) {
            return value
                .map(
                  (e) => LineTooltipItem(
                    'on jan 2\n \$${e.y}',
                    GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w600),
                  ),
                )
                .toList();
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 15,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 12,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 7.5),
            FlSpot(1, 8),
            FlSpot(2, 6),
            FlSpot(3, 7),
            FlSpot(4, 7),
            FlSpot(5, 6),
            FlSpot(6, 7),
            FlSpot(7, 9),
            FlSpot(8, 9),
            FlSpot(10, 6.2),
            FlSpot(11, 6.2),
            FlSpot(12, 6.5),
          ],
          isCurved: true,
          color: gradientColors[0],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = GoogleFonts.manrope(
      color: const Color(0xff68737d),
      fontWeight: FontWeight.w600,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        return Padding(
          child: Text(
            'Mon',
            style: style,
          ),
          padding: const EdgeInsets.only(left: 22),
        );
      case 2:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 6:
        text = Text('Thu', style: style);
        break;
      case 8:
        text = Text('Fri', style: style);
        break;
      case 10:
        text = Text('Sat', style: style);
        break;
      case 12:
        return Padding(
          child: Text(
            'Sun',
            style: style,
          ),
          padding: const EdgeInsets.only(
            right: 15,
          ),
        );

      default:
        text = Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(left: 0));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = GoogleFonts.manrope(
      color: const Color(0xff68737d),
      fontWeight: FontWeight.w600,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '\$0';
        break;
      case 2:
        text = '\$50';
        break;
      case 4:
        text = '\$100';
        break;
      case 6:
        text = '\$200';
        break;
      case 8:
        text = '\$500';
        break;
      case 10:
        text = 'limit';
        break;
      default:
        return Container();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 30),
      child: Text(text, style: style, textAlign: TextAlign.left),
    );
  }

  Row _buildAppbar() {
    return Row(
      children: [
        const Spacer(),
        Text(
          'Wallets',
          style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 24),
        ),
        const Spacer(),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffD1ECFF),
          ),
          child: Center(
            child: SvgPicture.asset('assets/icons/add_icon.svg'),
          ),
        )
      ],
    );
  }

  SingleChildScrollView _buildCardChoise() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            width: 176,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            decoration: BoxDecoration(
                color: ColorsValue.blue100,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/physical_icon.svg'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Physical ebl card',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    SvgPicture.asset('assets/icons/more_icon.svg')
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1)),
                        margin: const EdgeInsets.only(top: 16.69),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Number',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                            Text(
                              '**** 2437 **** 2424',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1)),
                        margin: const EdgeInsets.only(top: 16.69),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exp.',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                            Text(
                              '12/29/2022',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Current balance',
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.white),
                ),
                Text(
                  NumberFormat.currency(locale: 'en_US', symbol: '\$')
                      .format(2960),
                  style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            width: 176,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            decoration: BoxDecoration(
                color: const Color(0xffF2F3F3),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/visa-logo.svg',
                      color: ColorsValue.black60,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Virtual ebl card',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: ColorsValue.black60),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    SvgPicture.asset(
                      'assets/icons/more_icon.svg',
                      color: ColorsValue.black60,
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff666D72),
                            width: 1,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 16.69),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Number',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ColorsValue.black60),
                            ),
                            Text(
                              '**** 2437 **** 2424',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ColorsValue.black60),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorsValue.black60,
                            width: 1,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 16.69),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exp.',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ColorsValue.black60),
                            ),
                            Text(
                              '12/29/2022',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ColorsValue.black60),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Current balance',
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: ColorsValue.black60),
                ),
                Text(
                  NumberFormat.currency(locale: 'en_US', symbol: '\$')
                      .format(2960),
                  style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: ColorsValue.black60),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            width: 176,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            decoration: BoxDecoration(
                color: const Color(0xffF2F3F3),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/visa-logo.svg',
                      color: ColorsValue.black60,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Virtual ebl card',
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: ColorsValue.black60),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    SvgPicture.asset(
                      'assets/icons/more_icon.svg',
                      color: ColorsValue.black60,
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff666D72),
                            width: 1,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 16.69),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Number',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ColorsValue.black60),
                            ),
                            Text(
                              '**** 2437 **** 2424',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ColorsValue.black60),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorsValue.black60,
                            width: 1,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 16.69),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exp.',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ColorsValue.black60),
                            ),
                            Text(
                              '12/29/2022',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: ColorsValue.black60),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Current balance',
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: ColorsValue.black60),
                ),
                Text(
                  NumberFormat.currency(locale: 'en_US', symbol: '\$')
                      .format(2960),
                  style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: ColorsValue.black60),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
