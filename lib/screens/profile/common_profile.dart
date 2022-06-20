import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tudoom/constants/constants.dart';

class CommonProfilescreen extends StatefulWidget {
  const CommonProfilescreen({Key? key}) : super(key: key);

  @override
  State<CommonProfilescreen> createState() => _CommonProfilescreenState();
}

class _CommonProfilescreenState extends State<CommonProfilescreen> {
  final double coverHeight = 230;
  final double profileHeight = 114;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildUsername(),
          buildBio(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 1.5;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: greyColor,
        child: Image.asset(
          'assets/images/bg_image.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage() => Container(
        // radius: profileHeight / 1.85,
        padding: EdgeInsets.all(4.5),
        decoration: BoxDecoration(
          color: purple,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: AssetImage(
            'assets/images/profile_image.jpg',
          ),
        ),
      );

  Widget buildUsername() => Column(
        children: [
          Text(
            'Samantha Williams',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '@samanthaw',
            style: GoogleFonts.workSans(
              fontSize: 15,
              color: borderColor,
            ),
          ),
        ],
      );

  Widget buildBio() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Column(
          children: [
            Text(
              'Vel consequat leo at aliquam vitae nulla lacus. Sagittis, commodo urna mi facilisi dictum ac. Integer quam enim sit cras amet, lectus.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: biocolor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildProfileLabels(
                  text: '120',
                  label: 'Posts',
                ),
                buildProfileLabels(
                  text: '9.0 M',
                  label: 'Followers',
                ),
                buildProfileLabels(
                  text: '220',
                  label: 'Following',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      fixedSize: const Size(100, 50),
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      child: Text(
                        "Edit Profile",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: biocolor,
                      ),
                      primary: biocolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      fixedSize: const Size(100, 50),
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      child: Text(
                        "Tudoom profile",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class buildProfileLabels extends StatelessWidget {
  String text;
  String label;
  buildProfileLabels({
    Key? key,
    required this.text,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: purple,
            fontSize: 18,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.workSans(
            fontSize: 16,
            color: biocolor,
          ),
        ),
      ],
    );
  }
}
