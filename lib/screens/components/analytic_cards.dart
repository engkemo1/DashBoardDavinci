import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../../data/data.dart';
import 'analytic_info_card.dart';
import 'discussions.dart';

class AnalyticCards extends StatefulWidget {
  const AnalyticCards({Key? key}) : super(key: key);

  @override
  State<AnalyticCards> createState() => _AnalyticCardsState();
}

class _AnalyticCardsState extends State<AnalyticCards> {
  int infoIndex=0;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Responsive(
          mobile: AnalyticInfoCardGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 ? 2 : 1.5,
          ),
          tablet: AnalyticInfoCardGridView(),
          desktop: AnalyticInfoCardGridView(
            childAspectRatio: size.width < 1400 ? 1.5 : 2.1,
          ),
        ),
          SizedBox(height: 20,),
          Discussions(info:  analyticData[infoIndex],infoindex: infoIndex,),

      ],
    );
  }
Widget   AnalyticInfoCardGridView
   ({

     int crossAxisCount = 4,
     double childAspectRatio = 1.4,
  }) {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: analyticData.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: appPadding,
      mainAxisSpacing: appPadding,
      childAspectRatio: childAspectRatio,
    ),
    itemBuilder: (context, index) =>

        InkWell(
          hoverColor: Colors.blue.withOpacity(0.3),
          splashColor: Colors.cyan,
          focusColor:Colors.cyan ,
          highlightColor: Colors.amber,
          onTap: () {
            setState(() {
              infoIndex = index;

            });
          },
          child: AnalyticInfoCard(
            color: infoIndex==index?grey.withOpacity(0.5):null,
            info: analyticData[index],
          ),
        ),


  );
}

}

