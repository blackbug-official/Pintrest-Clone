part of profile_view;

class _ProfileMobile extends StatelessWidget {
  final ProfileViewModel viewModel;
  final UserCredential _userCredential;
  final AuthType _authType;

  _ProfileMobile(this.viewModel, this._userCredential, this._authType);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _authType == AuthType.EMAIL_AUTH
                          ? CircleAvatar(
                              maxRadius: 18,
                            )
                          : CircleAvatar(
                              maxRadius: 18,
                              backgroundImage: NetworkImage(
                                _userCredential
                                    .additionalUserInfo.profile['picture'],
                              ),
                            ),
                      Text(_authType == AuthType.EMAIL_AUTH
                          ? _userCredential.user.email
                          : _userCredential.additionalUserInfo.profile['name']),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.more_horiz_rounded,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFEEEEEF),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.search_outlined),
                              Text('Search your Pins'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.sort_rounded),
                            ),
                            IconButton(
                              onPressed: () {
                                viewModel.navigateToAddPin(
                                    context, _userCredential, _authType);
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Text('Pins Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
