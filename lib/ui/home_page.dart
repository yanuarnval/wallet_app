import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:technical_challange/shared/colors_value.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _dropDown = 'All';
  final List<String> _itemDropDown = ['All', 'Two', 'Free', 'Four'];
  int _selectedFeatures = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 26,
              ),
              _buildAppBar(),
              _buildAccountCard(),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Features',
                    style: GoogleFonts.manrope(
                        color: ColorsValue.black100,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Text(
                    'See more',
                    style: GoogleFonts.manrope(
                        color: ColorsValue.black100,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  )
                ],
              ),
              _buildFeatures(),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Recent Product',
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const Spacer(),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: ColorsValue.black100,
                          size: 22,
                        ),
                        elevation: 0,
                        value: _dropDown,
                        isDense: true,
                        alignment: Alignment.center,
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            color: ColorsValue.black100,
                            fontSize: 12),
                        onChanged: (String? newValue) {
                          setState(() {
                            _dropDown = newValue!;
                          });
                        },
                        items: _itemDropDown.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList()),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _buildListProducts()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildFeatures() {
    return SizedBox(
      height: 95,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedFeatures = 0;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                        boxShadow: [
                          (_selectedFeatures == 0)
                              ? BoxShadow(
                                  color: ColorsValue.black100.withOpacity(0.35),
                                  spreadRadius: 0.1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 5))
                              : const BoxShadow(color: Colors.white)
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF2F3F3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/money-send.svg'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Send',
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorsValue.black100),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedFeatures = 1;
              });
            },
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                      boxShadow: [
                        (_selectedFeatures == 1)
                            ? BoxShadow(
                                color: ColorsValue.black100.withOpacity(0.35),
                                spreadRadius: 0.1,
                                blurRadius: 3,
                                offset: const Offset(0, 5))
                            : const BoxShadow(color: Colors.white)
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffF2F3F3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/money-recive.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Receive',
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ColorsValue.black100),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedFeatures = 2;
              });
            },
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                      boxShadow: [
                        (_selectedFeatures == 2)
                            ? BoxShadow(
                                color: ColorsValue.black100.withOpacity(0.35),
                                spreadRadius: 0.1,
                                blurRadius: 3,
                                offset: const Offset(0, 5))
                            : const BoxShadow(color: Colors.white)
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffF2F3F3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/Award_icon.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Rewards',
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ColorsValue.black100),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _buildListProducts() {
    return Column(
      children: List.generate(
        5,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                          'assets/images/people4.png',
                          fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'products $index',
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: ColorsValue.black100),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        '2022-07-6',
                        style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff999EA1)),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    NumberFormat.currency(locale: 'en_US', symbol: '\$')
                        .format(1000),
                    style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorsValue.blue100),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildAccountCard() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ColorsValue.blue100, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ebl titanium account',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14),
              ),
              Text(
                'Arian zesan',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            NumberFormat.currency(locale: 'en_US', symbol: '\$').format(6190),
            style: GoogleFonts.manrope(
                fontSize: 36, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Text(
            'Total balance',
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Added card:05',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14),
              ),
              Text(
                'Ac. no. 2234521',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }

  Row _buildAppBar() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          width: 50,
          height: 50,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            'assets/images/default_profile.png',
            fit: BoxFit.fill,
          ),
        ),
        Text(
          'Good day,Zesan',
          style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xff000C14)),
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
            child: SvgPicture.asset('assets/icons/search_icon.svg'),
          ),
        )
      ],
    );
  }
}
