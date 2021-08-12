part of profile_view;

class _ProfileTablet extends StatelessWidget {
  final ProfileViewModel viewModel;
  final UserCredential _userCredential;
  final AuthType authType;

  _ProfileTablet(this.viewModel, this._userCredential, this.authType);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          buildTabletNavbar(_size, context, _userCredential, authType),
          Container(
            width: double.infinity,
            height: _size.height * .9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: _size.height * .3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              maxRadius: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Name"),
                            Text("0 followers"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text('Saved Pins go here'),
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
