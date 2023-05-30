import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../models/discussions_info_model.dart';

class DiscussionInfoDetail extends StatelessWidget {
  const DiscussionInfoDetail({Key? key, required this.info, required this.index, }) : super(key: key);
final int  index ;
  final DiscussionInfoModel info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: appPadding),
      padding: const EdgeInsets.all(appPadding / 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              info.imageSrc!,
              height: 38,
              width: 38,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.name!,
                    style: const TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),

                  Text(
                    info.date!,
                    style: TextStyle(
                        color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          index==1||index==0?
          Row(children: [
            ElevatedButton(onPressed: (){}, child: const Center(
              child: Text('Aprrove'),
            ),),
            SizedBox(width: 20,),
            ElevatedButton(onPressed: (){}, child: const Center(
              child: Text('Remove'),
            ))
          ],):
          Icon(Icons.more_vert_rounded,color: textColor.withOpacity(0.5),size: 18,)
        ],
      ),
    );
  }
}
