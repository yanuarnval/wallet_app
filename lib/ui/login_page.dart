import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_challange/bloc/event/login_page_event.dart';
import 'package:technical_challange/bloc/login_bloc.dart';
import 'package:technical_challange/bloc/state/login_page_state.dart';
import 'package:technical_challange/ui/main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isRemember = false;
  int _indexClick = 0;
  bool _isLoading = false;

  final _loginEmail = TextEditingController();
  final _loginPassword = TextEditingController();
  final _registerEmail = TextEditingController();
  final _registerPassword = TextEditingController();
  final _registername = TextEditingController();

  bool _loginHidepass = true;

  final _pageviewController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    _loginEmail.dispose();
    _loginPassword.dispose();
    _registerEmail.dispose();
    _registername.dispose();
    _registerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: BlocProvider<LoginBloc>(
              create: (_) => LoginBloc(),
              child: BlocListener<LoginBloc, LoginPageState>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      _isLoading = true;
                    }
                    if (state is FailureState) {
                      _isLoading = false;
                      _showMyDialog(state.msg);
                    }
                    if (state is SuccesLoginState) {
                      _isLoading = false;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext c) => const MainScreen()));
                    }
                    if (state is SuccesRegisterState) {
                      _isLoading = false;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext c) => const MainScreen()));
                    }
                  },
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            (_indexClick == 0) ? 'Login' : 'Register',
                            style: GoogleFonts.manrope(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'By signing in you are agreeing our ',
                                style: GoogleFonts.manrope(
                                    color: const Color(0xff6B5E5E),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20),
                                children: [
                                  TextSpan(
                                    text: 'Term and privacy policy',
                                    style: GoogleFonts.manrope(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff0386D0)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          _buildLoginOrRegister(),
                          _buildPageView(context)
                        ],
                      ),
                      (_isLoading)
                          ? Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.grey.withOpacity(0.3),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildPageView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageviewController,
        onPageChanged: (int i) {
          setState(() {
            _indexClick = i;
          });
        },
        itemBuilder: (BuildContext c, int i) {
          if (i == 0) {
            return _buildLoginForm();
          } else {
            return _buildRegisterForm();
          }
        },
        itemCount: 2,
      ),
    );
  }

  Row _buildLoginOrRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (_indexClick != 0) {
              _pageviewController.animateToPage(0,
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 400));
            }
          },
          child: Column(
            children: [
              Text(
                'Login',
                style: GoogleFonts.manrope(
                    fontSize: 18,
                    color: (_indexClick == 0)
                        ? const Color(0xff036BB9)
                        : const Color(0xffA6A6A6)),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(top: 4),
                color: Colors.black,
                height: 1,
                width: (_indexClick == 0) ? 50 : 0,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 29,
        ),
        InkWell(
          onTap: () {
            if (_indexClick != 1) {
              _pageviewController.animateToPage(1,
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 400));
            }
          },
          child: Column(
            children: [
              Text(
                'Register',
                style: GoogleFonts.manrope(
                    fontSize: 18,
                    color: (_indexClick == 1)
                        ? const Color(0xff036BB9)
                        : const Color(0xffA6A6A6)),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(top: 4),
                color: Colors.black,
                height: 1,
                width: (_indexClick == 1) ? 62 : 0,
              )
            ],
          ),
        )
      ],
    );
  }

  Column _buildLoginForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 52, left: 45, top: 51),
          child: TextFormField(
            style: GoogleFonts.manrope(fontSize: 15.9),
            controller: _loginEmail,
            decoration: InputDecoration(
                hintText: 'Email Address',
                hintStyle: GoogleFonts.manrope(
                    fontSize: 15.9, color: const Color(0xffA6A6A6)),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 7.0, bottom: 3),
                  child: SvgPicture.asset(
                    'assets/icons/mail.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 52, left: 45, top: 54),
          child: TextFormField(
            style: GoogleFonts.manrope(fontSize: 17.19),
            controller: _loginPassword,
            obscureText: _loginHidepass,
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: GoogleFonts.manrope(
                    fontSize: 17.19, color: const Color(0xffA6A6A6)),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _loginHidepass = !_loginHidepass;
                    });
                  },
                  child: (_loginHidepass)
                      ? SvgPicture.asset(
                          'assets/icons/hint_eye.svg',
                          color: Colors.black,
                        )
                      : SvgPicture.asset(
                          'assets/icons/hide_eye2.svg',
                          color: Colors.black,
                        ),
                ),
                suffixIconConstraints: const BoxConstraints(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 7.0, bottom: 3),
                  child: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints()),
          ),
        ),
        const SizedBox(
          height: 44,
        ),
        Row(
          children: [
            Container(
              width: 21,
              height: 21,
              margin: const EdgeInsets.only(right: 9, left: 45),
              decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  border: (_isRemember)
                      ? Border.all(width: 0, color: Colors.white)
                      : Border.all(color: const Color(0xffD4C5C5), width: 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.circular(2)),
              child: Checkbox(
                activeColor: const Color(0xff0386D0),
                side: BorderSide.none,
                value: _isRemember,
                onChanged: (value) {
                  setState(() {
                    _isRemember = !_isRemember;
                  });
                },
              ),
            ),
            Text(
              'Remember password',
              style: GoogleFonts.manrope(
                  fontSize: 15.51, color: const Color(0xff6B5E5E)),
            ),
            const Spacer(),
            Text(
              'Forget password',
              style: GoogleFonts.manrope(color: const Color(0xff0386D0)),
            ),
            const SizedBox(
              width: 52,
            )
          ],
        ),
        const SizedBox(
          height: 44,
        ),
        BlocBuilder<LoginBloc, LoginPageState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46.0),
            child: ElevatedButton(
              onPressed: () {
                if (_loginEmail.text.isNotEmpty &&
                    _loginPassword.text.isNotEmpty) {
                  context
                      .read<LoginBloc>()
                      .add(Login(_loginEmail.text, _loginPassword.text));
                }
              },
              child: Text(
                'Login',
                style: GoogleFonts.manrope(fontSize: 19.15),
              ),
            ),
          );
        }),
        const SizedBox(
          height: 21,
        ),
        Text(
          'or connect with',
          style: GoogleFonts.manrope(color: Color(0xff747070), fontSize: 16.18),
        ),
        const SizedBox(
          height: 17,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/facebook.png',
              width: 39,
              height: 39,
            ),
            const SizedBox(
              width: 18,
            ),
            Image.asset(
              'assets/images/instagram.png',
              width: 39,
              height: 39,
            ),
            const SizedBox(
              width: 18,
            ),
            Image.asset(
              'assets/images/pinterest.png',
              width: 39,
              height: 39,
            ),
            const SizedBox(
              width: 18,
            ),
            Image.asset(
              'assets/images/linkedin.png',
              width: 39,
              height: 39,
            ),
          ],
        ),
        Stack(
          children: [
            SizedBox(
              height: 268.4,
              child: Image.asset(
                'assets/images/footer_login.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/finger.png',
                    height: 72,
                    width: 69,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Login with touch ID',
                    style: GoogleFonts.manrope(
                        fontSize: 16.18, color: Colors.white),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Column _buildRegisterForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 52, left: 45, top: 51),
          child: TextFormField(
            style: GoogleFonts.manrope(fontSize: 15.9),
            controller: _registername,
            decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: GoogleFonts.manrope(
                    fontSize: 15.9, color: const Color(0xffA6A6A6)),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 7.0, bottom: 3),
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 24,
                    )),
                prefixIconConstraints: const BoxConstraints()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 52, left: 45, top: 54),
          child: TextFormField(
            style: GoogleFonts.manrope(fontSize: 15.9),
            controller: _registerEmail,
            decoration: InputDecoration(
                hintText: 'Email Address',
                hintStyle: GoogleFonts.manrope(
                    fontSize: 15.9, color: const Color(0xffA6A6A6)),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 7.0, bottom: 3),
                  child: SvgPicture.asset(
                    'assets/icons/mail.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 52, left: 45, top: 54),
          child: TextFormField(
            style: GoogleFonts.manrope(fontSize: 17.19),
            controller: _registerPassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: GoogleFonts.manrope(
                    fontSize: 17.19, color: const Color(0xffA6A6A6)),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 7.0, bottom: 3),
                  child: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints()),
          ),
        ),
        const SizedBox(
          height: 44,
        ),
        Row(
          children: [
            Container(
              width: 21,
              height: 21,
              margin: const EdgeInsets.only(right: 9, left: 45),
              decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  border: (_isRemember)
                      ? Border.all(width: 0, color: Colors.white)
                      : Border.all(color: const Color(0xffD4C5C5), width: 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.circular(2)),
              child: Checkbox(
                activeColor: Color(0xff0386D0),
                side: BorderSide.none,
                value: _isRemember,
                onChanged: (value) {
                  setState(() {
                    _isRemember = !_isRemember;
                  });
                },
              ),
            ),
            Text(
              'Remember password',
              style: GoogleFonts.manrope(
                  fontSize: 15.51, color: Color(0xff6B5E5E)),
            ),
          ],
        ),
        const SizedBox(
          height: 44,
        ),
        BlocBuilder<LoginBloc, LoginPageState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46.0),
            child: ElevatedButton(
              onPressed: () {
                if (_registername.text.isNotEmpty &&
                    _registerEmail.text.isNotEmpty &&
                    _registerPassword.text.isNotEmpty) {
                  context.read<LoginBloc>().add(Register(_registername.text,
                      _registerEmail.text, _registerPassword.text));
                }
              },
              child: Text(
                'Register',
                style: GoogleFonts.manrope(fontSize: 19.15),
              ),
            ),
          );
        }),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            height: 280.4,
            child: Image.asset(
              'assets/images/footer_login.png',
              fit: BoxFit.fill,
            ))
      ],
    );
  }

  Future<void> _showMyDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: Text(msg),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
