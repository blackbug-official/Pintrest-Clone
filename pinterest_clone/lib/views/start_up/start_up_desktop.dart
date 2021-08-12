part of start_up_view;

class _StartUpDesktop extends StatelessWidget {
  final StartUpViewModel viewModel;

  _StartUpDesktop(this.viewModel);

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
              width: _size.width * .3,
              height: _size.height * .7,
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
