part of detail_view;

class _DetailMobile extends StatelessWidget {
  final DetailViewModel viewModel;
  final ImageData imageData;

  _DetailMobile(this.viewModel, this.imageData);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height * .85,
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Hero(
                      tag: imageData.id,
                      child: Image.network(
                        imageData.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            CupertinoIcons.chevron_back,
                            size: 30,
                            color: kPrimaryColor,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            size: 30,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: _size.height * .1,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.chat_bubble_fill,
                      color: kPrimaryColor,
                    ),
                  ),
                  Spacer(),
                  DetailViewButton(
                    text: 'Like',
                    color: Color(0xFFEEEEEE),
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DetailViewButton(
                    text: 'Save',
                    color: kPrimaryColor,
                    textColor: Colors.white,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
