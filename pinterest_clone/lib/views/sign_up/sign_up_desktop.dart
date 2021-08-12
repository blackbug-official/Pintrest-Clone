part of sign_up_view;

class _SignUpDesktop extends StatelessWidget {
  final SignUpViewModel viewModel;

  _SignUpDesktop(this.viewModel);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                        elevation: 0,
                        onPress: () {
                          if (passwordController.text ==
                              confirmPasswordController.text)
                            viewModel.navigateToNextScreen(context,
                                emailController.text, passwordController.text);
                        },
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
