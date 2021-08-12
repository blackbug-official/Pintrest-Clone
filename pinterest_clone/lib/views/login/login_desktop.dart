part of login_view;

class _LoginDesktop extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginDesktop(this.viewModel);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFEEEEEF),
                        ),
                        width: _size.width * .8,
                        child: TextField(
                          // autofocus: true,
                          cursorColor: kPrimaryColor,
                          controller: emailController,
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
                          cursorColor: kPrimaryColor,
                          controller: passwordController,
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
                      LoginButton(
                        title: 'Continue',
                        color: kPrimaryColor,
                        textColor: Colors.white,
                        elevation: 0,
                        onPress: () {
                          viewModel.navigateToNextScreenUsingAuth(context,
                              emailController.text, passwordController.text);
                        },
                      ),
                      SizedBox(height: 10),
                      LoginButton(
                        title: 'Continue with Google',
                        color: Color(0xFFEEEEEF),
                        textColor: Colors.black,
                        onPress: () {
                          viewModel.navigateToNextScreenUsingGoogle(context);
                        },
                        elevation: 0,
                        icon: 'google.png',
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
