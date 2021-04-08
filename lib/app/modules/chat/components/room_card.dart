import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/components/extensions.dart';

class RoomCard extends StatelessWidget {
  final String image;
  final String username;
  final String lastMessage;
  final DateTime dateTime;
  final bool unRead;

  const RoomCard({
    this.image,
    this.username = 'Careve user',
    this.lastMessage = '',
    this.dateTime,
    this.unRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Card(
              elevation: unRead ? 5.0 : 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: AppUtil.borderRadius,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: !unRead ? 10.0 : 20.0,
              ),
              child: Padding(
                padding: EdgeInsets.all(unRead ? 10.0 : 5.0),
                child: Row(
                  children: [
                    Container(
                      height: unRead ? 35.0 : 50.0,
                      width: unRead ? 35.0 : 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: image == null || image?.length == 0
                              ? AssetImage(
                                  PathUtil.userImage,
                                )
                              : NetworkImage(
                                  image,
                                ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: TextStyle(
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorUtil.blackColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            lastMessage,
                            style: TextStyle(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorUtil.mediumGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (dateTime != null)
                      Column(
                        children: [
                          Text(
                            dateTime.compareTo(DateTime.now()) > 30
                                ? dateTime?.toShortUserString()
                                : dateTime?.toTimeOnly(),
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorUtil.mediumGrey.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            if (unRead)
              Positioned(
                top: 0.0,
                right: AppUtil.isLtr ? 15.0 : null,
                left: AppUtil.isLtr ? null : 15.0,
                child: Card(
                  color: ColorUtil.primaryColor,
                  shape: CircleBorder(),
                  margin: EdgeInsets.zero,
                  elevation: 5.0,
                  child: SizedBox(
                    height: 20.0,
                    width: 20.0,
                  ),
                ),
              ),
          ],
        ),
        !unRead
            ? Divider(
                color: ColorUtil.mediumGrey,
                indent: 50.0,
                height: 2.5,
              )
            : SizedBox(
                height: 2.5,
              ),
      ],
    );
  }
}
