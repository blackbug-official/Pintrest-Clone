part of start_up_view;

class _StartUpMobile extends StatelessWidget {
  final StartUpViewModel viewModel;

  _StartUpMobile(this.viewModel);

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
                        SizedBox(height: 10),
                        LoginButton(
                          title: 'Sign In',
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          onPress: () {
                            viewModel.navigateToSignIn(context);
                          },
                          elevation: 0,
                        ),
                        SizedBox(height: 10),
                        LoginButton(
                          title: 'Sign Up',
                          color: kPrimaryColor,
                          textColor: Colors.white,
                          onPress: () {
                            viewModel.navigateToSignUp(context);
                          },
                          elevation: 0,
                        ),
                        SizedBox(height: 10),
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
