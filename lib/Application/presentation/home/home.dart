// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix_my_nest_user/Application/presentation/authentication/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/color_and_font/color_and_font.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    num myHeight = MediaQuery.of(context).size.height;
    num mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Welcome to ', style: ColorAndFont.Normal_TEXT),
                  Text('FixMyNest', style: ColorAndFont.TITTLE_TEXT2),
                ],
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const UserLoginScreen()));
                  },
                  icon: const Icon(Icons.logout)),
            ]),
        body: SafeArea(
          top: true,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              TopProfileWidget(myHeight: myHeight, mywidth: mywidth),
              DiscoundWidget(mywidth: mywidth, myHeight: myHeight),
              SubTittleWidget(tittle: 'Categories'),
              const CategoriesWidget(),
              SubTittleWidget(tittle: 'Best Performers'),
              SizedBox(
                height: myHeight * .31,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return BestPerformerCardWidget(
                          mywidth: mywidth, myHeight: myHeight);
                    }),
              ),
              SubTittleWidget(tittle: 'Best Services'),
              SizedBox(
                height: myHeight * .22,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return BestServiceCardWidget(
                          mywidth: mywidth, myHeight: myHeight);
                    }),
              ),
            ],
          ),
        ));
  }
}

class BestServiceCardWidget extends StatelessWidget {
  const BestServiceCardWidget({
    super.key,
    required this.mywidth,
    required this.myHeight,
  });

  final num mywidth;
  final num myHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: Container(
            width: mywidth * .45,
            height: myHeight * .18,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/seed/868/600',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -1),
              ),
            ),
          ),
        ),
        Text('Vaccum Cleaning',
            textAlign: TextAlign.center,
            style: ColorAndFont.Normal_TEXT_Black_BOLD),
      ],
    );
  }
}

class BestPerformerCardWidget extends StatelessWidget {
  const BestPerformerCardWidget({
    super.key,
    required this.mywidth,
    required this.myHeight,
  });

  final num mywidth;
  final num myHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Container(
        width: mywidth * .45,
        height: myHeight * .3,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            const BoxShadow(
              blurRadius: 1,
              offset: Offset(2, 2),
              color: Color.fromARGB(255, 138, 137, 135),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 3,
            left: 5,
            right: 5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: mywidth * .18,
                    height: mywidth * .18,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/330/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Text('Priya Reji',
                    style: ColorAndFont.Normal_TEXT_Black_BOLD),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                    child: Icon(
                      Icons.location_on,
                      color: Color(0xFF4DB964),
                      size: 15,
                    ),
                  ),
                  Text('Kadavandhra',
                      style: ColorAndFont.Normal_TEXT_Black_BOLD),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Text('2 year experience',
                    style: ColorAndFont.Normal_TEXT_Black_BOLD),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Cleaner', style: ColorAndFont.Normal_TEXT_Black_BOLD),
                ],
              ),
              const Opacity(
                opacity: 0.5,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('₹ 400/hr',
                        style: ColorAndFont.Normal_TEXT_Black_BOLD),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidStar,
                          color: Color(0xFFFFC804),
                          size: 12,
                        ),
                        Text('4.5', style: ColorAndFont.Normal_TEXT_Black_BOLD),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubTittleWidget extends StatelessWidget {
  SubTittleWidget({
    super.key,
    required this.tittle,
  });
  String tittle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
      child: Text(tittle, style: ColorAndFont.Tittle_TEXT_Black_BOLD),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/653/600',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('Plumbing', style: ColorAndFont.Normal_TEXT_Black_BOLD),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85,
              height: 75,
              decoration: BoxDecoration(
                color: ColorAndFont.GREEN,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/653/600',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('Plumbing', style: ColorAndFont.Normal_TEXT_Black_BOLD),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85,
              height: 75,
              decoration: BoxDecoration(
                color: ColorAndFont.GREEN,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/653/600',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('Plumbing', style: ColorAndFont.Normal_TEXT_Black_BOLD),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85,
              height: 75,
              decoration: BoxDecoration(
                color: ColorAndFont.GREEN,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/653/600',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Plumbing',
              style: ColorAndFont.Normal_TEXT_Black_BOLD,
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/653/600',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text('Plumbing',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 85,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.grey,
                //color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/653/600',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text('Plumbing',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ],
    );
  }
}

class DiscoundWidget extends StatelessWidget {
  const DiscoundWidget({
    super.key,
    required this.mywidth,
    required this.myHeight,
  });

  final num mywidth;
  final num myHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(-1, 1),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25, 25, 0, 0),
            child: Container(
              width: mywidth * .75,
              height: myHeight * .185,
              decoration: BoxDecoration(
                color: const Color(0xFF4DB964),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '30% OFF',
                      style: ColorAndFont.BUTTON_TEXT2,
                    ),
                    Text(
                      'On first booking',
                      style: ColorAndFont.BUTTON_TEXT,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Book Now'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1, 1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://picsum.photos/seed/715/600',
              width: 149,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class TopProfileWidget extends StatelessWidget {
  const TopProfileWidget({
    super.key,
    required this.myHeight,
    required this.mywidth,
  });

  final num myHeight;
  final num mywidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: myHeight * .08,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Container(
                  width: mywidth * .1,
                  height: myHeight * .1,
                  decoration: const BoxDecoration(
                    //  color: FlutterFlowTheme.of(context).secondaryText,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://picsum.photos/seed/722/600',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fathima Nooriya',
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorAndFont.GREEN,
                          size: 24,
                        ),
                        Text(
                          'Kadavandhra',
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Align(
            alignment: AlignmentDirectional(1, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: FaIcon(
                FontAwesomeIcons.search,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
