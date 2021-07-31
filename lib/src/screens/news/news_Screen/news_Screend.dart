import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:amonyatest/src/common/utils/app_image.dart';
import 'package:amonyatest/src/common/utils/app_textSyle.dart';
import 'package:amonyatest/src/common/widgets/textfield/txt_TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: AppColor.scaffoldColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: TextfieldWidget(
                    prefix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.search,
                          color: Color.fromRGBO(146, 146, 146, 2)),
                    ),
                    placeholder: "Поиск",
                    border: Border.all(color: Color.fromRGBO(224, 230, 237, 2)),
                  ),
                ),
                ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListComponentWidgets();
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 20),
                    itemCount: 30),
              ],
            ),
          ),
        ));
  }
}

class ListComponentWidgets extends StatelessWidget {
  const ListComponentWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AppImage.listImage,
              fit: BoxFit.cover,
              height: 150,
            ),
            SizedBox(height: 11),
            ContainerDataWidgets(),
          ]),
    );
  }
}

class ContainerDataWidgets extends StatelessWidget {
  const ContainerDataWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('Мега', style: listName),
            SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "222222222222fdsjfdsjflksdjfksdj222222222222222222222",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColor.colorGrey),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Icon(
                      CupertinoIcons.heart,
                      color: CupertinoColors.black,
                      size: 27,
                    )),
              ],
            ),
            Text(
              "street Rozybakiev",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColor.colorGrey),
            ),
            SizedBox(height: 12),
          ])),
    );
  }
}
