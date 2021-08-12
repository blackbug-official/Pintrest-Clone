part of add_pin_view;

class _AddPinMobile extends StatelessWidget {
  final AddPinViewModel viewModel;
  final UserCredential userCredential;
  final AuthType authType;

  _AddPinMobile(this.viewModel, this.userCredential, this.authType);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create pin',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: _size.width * .6,
                child: viewModel.isImage
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          viewModel.getImageForMobile,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        "assets/placeholder.png",
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              buildHomeViewButtons(
                color: kPrimaryColor,
                onPress: () => viewModel.pickImageFromMobile(),
                text: 'Upload',
                textColor: Colors.white,
              ),
              Container(
                width: _size.width * .9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      cursorColor: kPrimaryColor,
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Give your pin a title',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: kPrimaryColor,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Say more about your pin',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DetailViewButton(
                color: kPrimaryColor,
                onTap: () {
                  viewModel.uploadImage(
                    context,
                    userCredential,
                    titleController.text,
                    descriptionController.text,
                    authType,
                  );
                },
                text: 'Add',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
