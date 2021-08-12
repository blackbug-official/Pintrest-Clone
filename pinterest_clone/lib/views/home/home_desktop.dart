part of home_view;

class _HomeDesktop extends StatelessWidget {
  final HomeViewModel viewModel;
  final UserCredential userCredential;
  final AuthType authType;

  _HomeDesktop(this.viewModel, this.userCredential, this.authType);
  Future _refreshImages() async {
    viewModel.getPinsFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    print('@@@ $authType}');
    return Scaffold(
      body: Column(
        children: [
          buildDesktopNavbar(_size, context, authType, userCredential),
          Container(
            width: double.infinity,
            height: _size.height * .9,
            child: RefreshIndicator(
              color: kPrimaryColor,
              onRefresh: _refreshImages,
              child: viewModel.pinList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : StaggeredGridView.countBuilder(
                      crossAxisCount: 6,
                      itemCount: viewModel.pinList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.pushReplacement(
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(
            CupertinoIcons.add,
          ),
          onPressed: () {
            viewModel.navigateToAddPin(context, userCredential, authType);
          }),
    );
  }
}
