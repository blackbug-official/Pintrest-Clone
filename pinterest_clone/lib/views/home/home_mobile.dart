part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  final UserCredential _userCredential;
  final AuthType authType;

  _HomeMobile(this.viewModel, this._userCredential, this.authType);

  Future _refreshImages() async {
    viewModel.getPinsFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    viewModel.getController.addListener(
      () {
        if (viewModel.getController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          viewModel.setYOffsetOnScrollUp();
        }
        if (viewModel.getController.position.userScrollDirection ==
            ScrollDirection.forward) {
          viewModel.setYOffsetOnScrollDown();
        }
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            color: kPrimaryColor,
            onRefresh: _refreshImages,
            child: viewModel.pinList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    controller: viewModel.getController,
                    itemCount: viewModel.pinList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => DetailView(
                            imageData: viewModel.pinList[index],
                          ),
                        ),
                      ),
                      child: Hero(
                        transitionOnUserGestures: true,
                        tag: viewModel.pinList[index].id,
                        child: ImageCard(
                          imageData: viewModel.pinList[index],
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  ),
          ),
          Positioned(
            bottom: _size.height * .1,
            child: AnimatedContainer(
              width: _size.width,
              height: 50,
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(0, viewModel.getYOffset, 0),
              child: Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 4,
                    child: bottomNavbar(context),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(
          CupertinoIcons.chevron_back,
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  Container bottomNavbar(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: kPrimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home_filled, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message_rounded, color: Colors.white),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ProfileView(
                  userCredential: _userCredential,
                  authType: authType,
                ),
              ),
            ),
            child: authType == AuthType.EMAIL_AUTH
                ? CircleAvatar(
                    maxRadius: 13,
                  )
                : CircleAvatar(
                    maxRadius: 13,
                    backgroundImage: NetworkImage(
                      _userCredential.additionalUserInfo.profile['picture'],
                      scale: 1.5,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
