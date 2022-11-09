import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/user_controllers/user_controller.dart';
import 'package:pos/screens/users_screens/user_detail_screen.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/avatar_widget.dart';
import 'package:pos/widgets/button_pagintaion_widget.dart';
import 'package:pos/widgets/dropdown_button_form_field_widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_table/responsive_table.dart';

class UserTablePageWidget extends StatelessWidget {
  const UserTablePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController _controller = Get.find();
    return Obx(
      () => Card(
        borderOnForeground: true,
        elevation: 0,
        child: Column(
          children: [
            Expanded(
              child: ResponsiveDatatable(
                reponseScreenSizes: const [ScreenSize.xs],
                headers: [
                  DatatableHeader(
                    text: "",
                    value: "profile",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return CachedNetworkImage(
                        imageUrl:
                            "${AppService.baseUrl}uploads/${row["profile"]}",
                        imageBuilder: (context, imageProvider) => AvatarWidget(
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppService.baseUrl}uploads/${row["profile"]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        placeholder: (context, url) => const AvatarWidget(
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.white,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        errorWidget: (context, url, error) => AvatarWidget(
                          child: Image.asset(
                            "assets/images/noimage.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "fullname".tr,
                    value: "fullname",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: row["fullname"],
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "username".tr,
                    value: "username",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: row["username"],
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "role".tr,
                    value: "role",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: infoColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextWidget(
                            text: value["name"],
                            fontFamily: "Siemreap",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "created_by".tr,
                    value: "created_by",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: row["created_by"] ?? "",
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "action".tr,
                    value: "id",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      if (AppService.currentUser?.id == row["id"]) {
                        return Container();
                      }
                      return row["is_deleted"]
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  splashRadius: 30,
                                  onPressed: () {
                                    _controller.onUserRestorePressed(value);
                                  },
                                  icon: Icon(
                                    Icons.replay_rounded,
                                    color: successColor,
                                  ),
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  splashRadius: 30,
                                  onPressed: () {
                                    _controller.onUserDeletePressed(
                                      id: value,
                                      name: row["fullname"],
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: errorColor,
                                  ),
                                )
                              ],
                            );
                    },
                  ),
                ],
                footers: [
                  if (_controller.dataSource.isEmpty)
                    Expanded(
                      child: Container(
                        color: HexColor("#ededed"),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: TextWidget(
                          text: "no_data_available_in_table".tr,
                          color: textColor,
                        ),
                      ),
                    ),
                ],
                source: _controller.dataSource,
                selecteds: _controller.dataSource,
                autoHeight: false,
                onSort: (value) {},
                isExpandRows: false,
                onTabRow: (_) {
                  Get.toNamed(UserDetailScreen.routeName, arguments: _);
                },
                expanded: [
                  ..._controller.dataSource.map((e) => false),
                ],
                sortAscending: false,
                sortColumn: "",
                isLoading: false,
                headerDecoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                selectedDecoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                  color: Colors.green,
                ),
                headerTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                rowTextStyle: const TextStyle(color: Colors.black),
                selectedTextStyle: const TextStyle(color: Colors.white),
              ),
            ),
            if (_controller.dataSource.isNotEmpty) const SizedBox(height: 10),
            if (_controller.dataSource.isNotEmpty)
              Row(
                children: [
                  const SizedBox(
                    width: 2.5,
                  ),
                  ButtonPaginationWidget(
                    onPressed: _controller.currentPage.value == 1
                        ? null
                        : () => _controller
                            .onPagePressed(_controller.currentPage.value - 1),
                    backgroundColor: HexColor("#eaeaea"),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: _controller.currentPage.value == 1
                          ? HexColor("#AAAAAA")
                          : null,
                    ),
                  ),
                  for (var i = 1; i <= _controller.totalPage.value; i++)
                    ButtonPaginationWidget(
                      onPressed: () => _controller.onPagePressed(i),
                      backgroundColor: _controller.currentPage.value == i
                          ? infoColor
                          : HexColor("#eaeaea"),
                      child: TextWidget(
                        text: "$i",
                        color: _controller.currentPage.value == i
                            ? Colors.white
                            : textColor,
                      ),
                    ),
                  ButtonPaginationWidget(
                    onPressed: _controller.currentPage.value ==
                            _controller.totalPage.value
                        ? null
                        : () => _controller
                            .onPagePressed(_controller.currentPage.value + 1),
                    backgroundColor: HexColor("#eaeaea"),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: _controller.currentPage.value ==
                              _controller.totalPage.value
                          ? HexColor("#AAAAAA")
                          : null,
                    ),
                  ),
                  const SizedBox(
                    width: 2.5,
                  ),
                  const Spacer(),
                  TextWidget(
                    text: _controller.getResultPageInfo,
                    color: textColor,
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: 65,
                    child: DropdownButtonFormFieldWidget<int>(
                      items: [
                        ..._controller.pagerList.map(
                          (p) => DropdownMenuItem<int>(
                            child: TextWidget(
                              text: "$p",
                              color: textColor,
                            ),
                            value: p,
                          ),
                        ),
                      ],
                      value: _controller.pager.value,
                      onChanged: (_) => _controller.onPagerChanged(_),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
