part of home_view;

class _HomeTablet extends StatelessWidget {
  final HomeViewModel viewModel;
  final UserCredential _userCredential;
  final AuthType authType;

  _HomeTablet(this.viewModel, this._userCredential, this.authType);
  Future _refreshImages() async {
    viewModel.getPinsFromFirebase();
  }

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
            child: RefreshIndicator(
              color: kPrimaryColor,
              onRefresh: _refreshImages,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () => Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => AddPinView(),
          ),
        ),
        child: Icon(
          CupertinoIcons.add,
        ),
      ),
    );
  }
}
