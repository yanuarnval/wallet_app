import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_challange/shared/colors_value.dart';

class Giftpage extends StatefulWidget {
  const Giftpage({Key? key}) : super(key: key);

  @override
  _GiftpageState createState() => _GiftpageState();
}

class _GiftpageState extends State<Giftpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        titleSpacing: 25,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 25),
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
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                'assets/images/default_profile.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Good day,Zesan',
              style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff000C14)),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffF2F3F3),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Container(
                  width: 69,
                  height: 5,
                  decoration: BoxDecoration(
                      color: const Color(0xff666D72),
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'Send money',
                  style: GoogleFonts.manrope(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Select card',
                style: GoogleFonts.manrope(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              _buildCartList(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Choose recipient',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: ColorsValue.black100),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type name/card/phone number/email',
                      hintStyle: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Color(0xff999EA1),
                      ),
                      suffixIcon:
                          SvgPicture.asset('assets/icons/security_safe.svg'),
                      suffixIconConstraints: const BoxConstraints()),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: List.generate(
                    4,
                    (index) => Row(
                          children: [
                            Image.asset('assets/images/people${++index}.png'),
                            const SizedBox(
                              width: 16,
                            )
                          ],
                        )).reversed.toList(),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Amount',
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 156,
                padding: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '\$75.00',
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600, fontSize: 36),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/images/slider_amount.png',
                        height: 57,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 61,
              ),
              SvgPicture.asset('assets/icons/agree_text.svg'),
              const SizedBox(height: 12,),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: ColorsValue.blue100,
                      minimumSize: Size(double.infinity, 65)),
                  child: Text(
                    'Send money',
                    style: GoogleFonts.manrope(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  )),
              const SizedBox(height: 29,),
            ],
          ),
        ),
      )),
    );
  }

  SingleChildScrollView _buildCartList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorsValue.blue100),
            child: Row(
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
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffE5E7E7)),
            child: Row(
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
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffE5E7E7)),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/amex.svg',
                  color: ColorsValue.black60,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Ebl debit card',
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: ColorsValue.black60),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
