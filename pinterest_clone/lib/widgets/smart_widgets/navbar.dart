import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/enums.dart';
import '../../theme/colors.dart';
import '../../views/home/home_view.dart';
import '../../views/profile/profile_view.dart';
import 'home_view_button.dart';

Container buildDesktopNavbar(Size _size, BuildContext context,
    AuthType authType, UserCredential credential) {
  return Container(
    width: double.infinity,
    height: _size.height * .1,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'logo.png',
                fit: BoxFit.cover,
                width: 50,
              ),
              buildHomeViewButtons(
                color: Colors.black,
                text: 'Home',
                textColor: Colors.white,
                onPress: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HomeView(
                        authType: authType,
                        userCredential: credential,
                      ),
                    ),
                  );
                },
              ),
              buildHomeViewButtons(
                  color: kSecondaryColor,
                  text: 'Today',
                  textColor: Colors.black,
                  onPress: () {}),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kSecondaryColor,
            ),
            child: Theme(
              data: Theme.of(context).copyWith(primaryColor: kPrimaryColor),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_rounded,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ProfileView(
                          authType: authType,
                          userCredential: credential,
                        ),
                      ),
                    );
                  },
                  child: authType == AuthType.EMAIL_AUTH
                      ? CircleAvatar(
                          maxRadius: 13,
                        )
                      : CircleAvatar(
                          maxRadius: 13,
                          backgroundImage: NetworkImage(
                            credential.additionalUserInfo.profile['picture'],
                            scale: 1.5,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Container buildTabletNavbar(Size _size, BuildContext context,
    UserCredential credential, AuthType authType) {
  return Container(
    width: double.infinity,
    height: _size.height * .1,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HomeView(
                        authType: authType,
                        userCredential: credential,
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'logo.png',
                  fit: BoxFit.cover,
                  width: 50,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kSecondaryColor,
            ),
            child: Theme(
              data: Theme.of(context).copyWith(primaryColor: kPrimaryColor),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_rounded,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ProfileView(
                          authType: authType,
                          userCredential: credential,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    maxRadius: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
