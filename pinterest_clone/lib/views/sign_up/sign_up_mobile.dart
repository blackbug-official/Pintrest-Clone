part of sign_up_view;

class _SignUpMobile extends StatelessWidget {
  final SignUpViewModel viewModel;

  _SignUpMobile(this.viewModel);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/backdrop.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.4,
                    0.5,
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  if (!isKeyboard)
                    Column(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 90,
                        ),
                        // Lottie.network(
                        //   'https://assets1.lottiefiles.com/private_files/lf30_qtluilfk.json',
                        //   reverse: true,
                        //   width: 150,
                        // ),
                        Text(
                          'Welcome to Pinterest',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  Spacer(),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFFEEEEEF),
                          ),
                          width: _size.width * .8,
                          child: TextField(
                            // autofocus: true,
                            controller: emailController,
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email address',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              contentPadding: EdgeInsets.only(left: 20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFFEEEEEF),
                          ),
                          width: _size.width * .8,
                          child: TextField(
                            // autofocus: true,
                            obscureText: true,
                            controller: passwordController,
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              contentPadding: EdgeInsets.only(left: 20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFFEEEEEF),
                          ),
                          width: _size.width * .8,
                          child: TextField(
                            // autofocus: true,
                            obscureText: true,
                            controller: confirmPasswordController,
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              contentPadding: EdgeInsets.only(left: 20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        LoginButton(
                          title: 'Continue',
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          onPress: () {
                            if (passwordController.text ==
                                confirmPasswordController.text)
                              viewModel.navigateToNextScreen(
                                  context,
                                  emailController.text,
                                  passwordController.text);
                          },
                          elevation: 0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        buildTermsAndCondition(_size),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
