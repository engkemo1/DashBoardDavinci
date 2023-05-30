import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../data/data.dart';
import '../../models/analytic_info_model.dart';
import 'discussion_info_detail.dart';

class Discussions extends StatelessWidget {
  const Discussions({Key? key, required this.info, required this.infoindex}) : super(key: key);
  final AnalyticInfo info;
  final int infoindex ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      padding: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                info.title.toString(),
                style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: textColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: appPadding,
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: discussionData.length,
              itemBuilder: (context, index) => DiscussionInfoDetail(info: discussionData[index],index: infoindex,),
            ),
          )
        ],
      ),
    );
  }
}
