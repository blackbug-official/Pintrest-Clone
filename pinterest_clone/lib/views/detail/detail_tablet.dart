part of detail_view;

class _DetailTablet extends StatelessWidget {
  final DetailViewModel viewModel;
  final ImageData imageData;
  final UserCredential _userCredential;
  final AuthType authType;
  _DetailTablet(
      this.viewModel, this.imageData, this._userCredential, this.authType);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          buildTabletNavbar(_size, context, _userCredential, authType),
          Container(
            height: _size.height * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: _size.width * .8,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 13,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          child: Hero(
                            tag: imageData.id,
                            child: Image.network(
                              imageData.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.more_horiz),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.save_rounded),
                                      ),
                                    ],
                                  ),
                                  DetailViewButton(
                                    text: 'Save',
                                    color: kPrimaryColor,
                                    textColor: Colors.white,
                                  )
                                ],
                              ),
                              Spacer(),
                              Text('Image Discription'),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        CircleAvatar(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Name'),
                                            Text('0 followers'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  DetailViewButton(
                                    text: 'Follow',
                                    color: kSecondaryColor,
                                    textColor: Colors.black,
                                  ),
                                ],
                              ),
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
