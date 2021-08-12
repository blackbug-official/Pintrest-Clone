part of add_pin_view;

class _AddPinTablet extends StatelessWidget {
  final AddPinViewModel viewModel;
  final UserCredential _userCredential;
  final AuthType authType;

  _AddPinTablet(this.viewModel, this._userCredential, this.authType);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          buildTabletNavbar(_size, context, _userCredential, authType),
          Container(
            alignment: Alignment.center,
            height: _size.height * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: _size.width * .9,
                  height: _size.height * .5,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          height: double.infinity,
                          child: viewModel.isImage
                              ? Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Image.network(viewModel.getImage.path),
                                )
                              : DetailViewButton(
                                  color: kSecondaryColor,
                                  text: 'Upload your Image',
                                  textColor: Colors.black,
                                  // TODO: Upload Image
                                  onTap: () => viewModel.pickAnImage(),
                                ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 50, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextField(
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  hintText: 'Add your title',
                                  hintStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Clark'),
                                ],
                              ),
                              TextField(
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  hintText:
                                      'Tell everyone what your Pin is about',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                              DetailViewButton(
                                  color: kPrimaryColor,
                                  text: 'Add',
                                  textColor: Colors.white,
                                  // TODO: Add to Firebase
                                  onTap: () {}),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
