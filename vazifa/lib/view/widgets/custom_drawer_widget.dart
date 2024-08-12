import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 30, color: Colors.blue),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text('|',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                )),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text('My Orders'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('English'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('User Agreement'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Partnership'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
