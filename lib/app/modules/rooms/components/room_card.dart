import 'package:careve/app/modules/chat/bindings/chat_binding.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:get/get.dart';

class RoomCard extends StatelessWidget {
  final String image;
  final String username;
  final String lastMessage;
  final DateTime dateTime;
  final bool unRead;
  final int id;
  final int receiverId;

  const RoomCard({
    this.image,
    this.username = 'Careve user',
    this.lastMessage = '',
    this.dateTime,
    this.id,
    this.receiverId,
    this.unRead = false,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider = const AssetImage(
      PathUtil.userImage,
    );
    if (image != null) {
      imageProvider = NetworkImage(
        image,
      );
    }

    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(
                Routes.CHAT,
                arguments: ChatRouteInputs(
                  roomId: id,
                  receiverID: receiverId,
                  roomName: username,
                ),
              ),
              child: Card(
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
                            image: imageProvider,
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
                                fontSize: 38.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtil.mediumGrey,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (unRead)
              Positioned(
                top: 0.0,
                right: AppUtil.isLtr ? 15.0 : null,
                left: AppUtil.isLtr ? null : 15.0,
                child: const Card(
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
        if (!unRead)
          const Divider(
            color: ColorUtil.mediumGrey,
            indent: 50.0,
            height: 2.5,
          )
        else
          const SizedBox(
            height: 2.5,
          ),
      ],
    );
  }
}
