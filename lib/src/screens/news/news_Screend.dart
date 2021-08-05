import 'package:amonyatest/src/common/models/news_Model.dart';

import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:amonyatest/src/common/utils/app_image.dart';
import 'package:amonyatest/src/common/utils/app_textSyle.dart';
import 'package:amonyatest/src/common/widgets/textfield/txt_TextField.dart';
import 'package:amonyatest/src/screens/news/bloc/news_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    context.read<NewsBloc>().add(InitialNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return CupertinoActivityIndicator();
        }
        if (state is NewsLoaded) {
          return CupertinoPageScaffold(
            backgroundColor: AppColor.scaffoldColor,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      child: TextfieldWidget(
                        prefix: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(CupertinoIcons.search,
                              color: Color.fromRGBO(146, 146, 146, 2)),
                        ),
                        placeholder: "Поиск",
                        border:
                            Border.all(color: Color.fromRGBO(224, 230, 237, 2)),
                      ),
                    ),
                    ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListComponentWidgets(
                          rest: state.restaurants.restaurants[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 20),
                      itemCount: state.restaurants.restaurants.length,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is NewsFailed) {
          Text('Ошибка - данные не загрузились');
        }
        return Container();
      },
    );
  }
}

class ListComponentWidgets extends StatelessWidget {
  final InfoListModel rest;
  final Coords? coords;

  ListComponentWidgets({
    Key? key,
    required this.rest,
    this.coords,
  }) : super(key: key);

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
          ContainerDataWidgets(
            rest: rest,
            coords: coords,
          ),
        ],
      ),
    );
  }
}

class ContainerDataWidgets extends StatelessWidget {
  final InfoListModel rest;
  final Coords? coords;

  ContainerDataWidgets({
    Key? key,
    required this.rest,
    this.coords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rest.title,
              style: listName,
            ),
            SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    rest.description,
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
              coords?.addressName ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColor.colorGrey),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
