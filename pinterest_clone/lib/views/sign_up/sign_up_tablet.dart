part of sign_up_view;

class _SignUpTablet extends StatelessWidget {
  final SignUpViewModel viewModel;

  _SignUpTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'backdrop.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          Center(
            child: Container(
              width: _size.width * .6,
              height: _size.height * .6,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 13,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        width: 90,
                      ),
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
                  Column(
                    children: [
                      EmailTextInput(),
                      SizedBox(height: 10),
                      PasswordTextInput(),
                      SizedBox(height: 10),
                      ConfirmPasswordTextInput(),
                      SizedBox(height: 10),
                      LoginButton(
                        title: 'Continue',
                        color: kPrimaryColor,
                        textColor: Colors.white,
                        elevation: 0,
                        onPress: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      buildTermsAndCondition(_size),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
