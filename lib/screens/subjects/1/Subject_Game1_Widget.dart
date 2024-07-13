import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Subject_Game1_Widget extends StatefulWidget {
  const Subject_Game1_Widget({super.key});

  @override
  State<Subject_Game1_Widget> createState() => _Subject_Game1_WidgetState();
}

class _Subject_Game1_WidgetState extends State<Subject_Game1_Widget> {
  @override
  CollectionReference product = FirebaseFirestore.instance.collection('Game1');
  final TextEditingController titleController = TextEditingController();
  final TextEditingController modeController = TextEditingController();
  final TextEditingController MaxUserController = TextEditingController();
  final TextEditingController LineController = TextEditingController();
  final TextEditingController RankController = TextEditingController();
  final TextEditingController MyIDController = TextEditingController();
  final TextEditingController CurrentUserController = TextEditingController();
  final TextEditingController SuJungController = TextEditingController();
  final TextEditingController PassWordController = TextEditingController();
  final TextEditingController SearchController = TextEditingController();
  final TextEditingController JiOneController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool isAlarmed = false;
  List<QueryDocumentSnapshot> temp = [];

  Future<void> _update(DocumentSnapshot documentSnapshot) async {
    titleController.text = documentSnapshot['title'];
    modeController.text = documentSnapshot['type'];
    MaxUserController.text = documentSnapshot['MaxUser'];
    LineController.text = documentSnapshot['Line'];
    RankController.text = documentSnapshot['Rank'];
    MyIDController.text = documentSnapshot['MyID'];
    CurrentUserController.text = documentSnapshot['CurrentUser'];

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: '제목을 입력 해 주세요.'),
                ),
                TextField(
                  controller: modeController,
                  decoration: InputDecoration(labelText: '플레이 할 모드를 입력 해 주세요'),
                ),
                TextField(
                  controller: MaxUserController,
                  decoration: InputDecoration(labelText: '모집 할 인원을 입력 해 주세요'),
                ),
                TextField(
                  controller: CurrentUserController,
                  decoration: InputDecoration(labelText: '현재 인원을 입력 해 주세요'),
                ),
                TextField(
                  controller: MyIDController,
                  decoration: InputDecoration(labelText: '게임 아이디를 입력 해 주세요'),
                ),
                TextField(
                  controller: LineController,
                  decoration: InputDecoration(labelText: '설명을 입력 해 주세요'),
                ),
                TextField(
                  controller: RankController,
                  decoration: InputDecoration(labelText: '랭크를 입력 해 주세요'),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final String title = titleController.text;
                      final String mode = modeController.text;
                      final String Line = LineController.text;
                      final String Rank = RankController.text;
                      final String MyID = MyIDController.text;
                      final String MaxUser = MaxUserController.text;
                      final String CurrentUser = CurrentUserController.text;
                      await product.doc(documentSnapshot.id).update({
                        "title": title,
                        "type": mode,
                        "Line": Line,
                        "Rank": Rank,
                        "MyID": MyID,
                        "MaxUser": MaxUser,
                        "CurrentUser": CurrentUser,
                      });
                      titleController.text = "";
                      modeController.text = "";
                      LineController.text = "";
                      RankController.text = "";
                      MyIDController.text = "";
                      MaxUserController.text = "";
                      CurrentUserController.text = "";
                      Navigator.of(context).pop();
                    },
                    child: Text('Update'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _show(DocumentSnapshot documentSnapshot) async {
    titleController.text = documentSnapshot['title'];
    modeController.text = documentSnapshot['type'];
    MaxUserController.text = documentSnapshot['MaxUser'];
    LineController.text = documentSnapshot['Line'];
    RankController.text = documentSnapshot['Rank'];
    MyIDController.text = documentSnapshot['MyID'];
    CurrentUserController.text = documentSnapshot['CurrentUser'];

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        _SuJungAlert(context, documentSnapshot);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        _DeleteAlert(context, documentSnapshot);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                Text(
                  "제목 : " + documentSnapshot["title"],
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "모드 : " + documentSnapshot["type"],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "인원 : " +
                      documentSnapshot["CurrentUser"] +
                      "/" +
                      documentSnapshot["MaxUser"],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "방장 아이디 : " + documentSnapshot["MyID"],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "방장 티어 : " + documentSnapshot["Rank"],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "설명 : " + documentSnapshot["Line"],
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        await _JiOneAlert(context);
                        Navigator.of(context).pop();
                      },
                      child: Text("지원하기")),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _create() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: '제목을 입력 해 주세요.'),
                ),
                TextField(
                  controller: modeController,
                  decoration: InputDecoration(labelText: '플레이 할 모드를 입력 해 주세요'),
                ),
                TextField(
                  controller: MaxUserController,
                  decoration: InputDecoration(labelText: '모집 할 인원을 입력 해 주세요'),
                ),
                TextField(
                  controller: CurrentUserController,
                  decoration: InputDecoration(labelText: '현재 인원을 입력 해 주세요'),
                ),
                TextField(
                  controller: MyIDController,
                  decoration: InputDecoration(labelText: '게임 아이디를 입력 해 주세요'),
                ),
                TextField(
                  controller: LineController,
                  decoration: InputDecoration(labelText: '설명을 입력 해 주세요'),
                ),
                TextField(
                  controller: RankController,
                  decoration: InputDecoration(labelText: '랭크를 입력 해 주세요'),
                ),
                TextField(
                  controller: PassWordController,
                  decoration:
                      InputDecoration(labelText: '수정시 사용할 암호를 입력 해 주세요'),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final String title = titleController.text;
                      final String mode = modeController.text;
                      final String Line = LineController.text;
                      final String Rank = RankController.text;
                      final String MyID = MyIDController.text;
                      final String MaxUser = MaxUserController.text;
                      final String CurrentUser = CurrentUserController.text;
                      final String Password = PassWordController.text;
                      final String TimeStamp =
                          DateFormat('yyyy/MM/dd-hh:mm').format(DateTime.now());
                      await product.add({
                        "title": title,
                        "type": mode,
                        "Line": Line,
                        "Rank": Rank,
                        "MyID": MyID,
                        "MaxUser": MaxUser,
                        "CurrentUser": CurrentUser,
                        "PassWord": Password,
                        "TimeStamp": TimeStamp
                      });
                      titleController.text = "";
                      modeController.text = "";
                      LineController.text = "";
                      RankController.text = "";
                      MyIDController.text = "";
                      MaxUserController.text = "";
                      CurrentUserController.text = "";
                      PassWordController.text = "";
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("등록이 완료되었습니다")));
                    },
                    child: Text('Create'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _delete(String productId) async {
    await product.doc(productId).delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("삭제가 완료되었습니다")));
  }

  Future<void> _JiOneAlert(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              title: Text("지원하시겠습니까?"),
              content: TextField(
                controller: JiOneController,
                decoration: InputDecoration(hintText: "연락처를 입력 해 주세요"),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("지원이 완료되었습니다")));
                    },
                    child: Text("지원하기"))
              ],
            ));
  }

  Future<void> _SuJungAlert(
      BuildContext context, DocumentSnapshot documentSnapshot) async {
    PassWordController.text = documentSnapshot["PassWord"];
    SuJungController.text = "";
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              title: Text("수정 하시겠습니까?"),
              content: Text("암호를 입력 해 주세요."),
              actions: [
                TextField(
                  controller: SuJungController,
                  decoration: InputDecoration(labelText: "암호를 입력 해주세요"),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          if (SuJungController.text ==
                              PassWordController.text) {
                            await _update(documentSnapshot);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("수정이 완료되었습니다")));
                          } else {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text("암호가 맞지 않습니다."),
                                      content: Text("암호를 확인 해주세요."),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text("확인"))
                                      ],
                                    ));
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("수정")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("취소")),
                  ],
                ),
              ],
            ));
  }

  Future<void> _DeleteAlert(
      BuildContext context, DocumentSnapshot documentSnapshot) async {
    PassWordController.text = documentSnapshot["PassWord"];
    SuJungController.text = "";
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              title: Text("삭제 하시겠습니까?"),
              content: Text("암호를 입력 해 주세요."),
              actions: [
                TextField(
                  controller: SuJungController,
                  decoration: InputDecoration(labelText: "암호를 입력 해주세요"),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          if (SuJungController.text ==
                              PassWordController.text) {
                            await _delete(documentSnapshot.id);
                            Navigator.of(context).pop();
                          } else {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text("암호가 맞지 않습니다."),
                                      content: Text("암호를 확인 해주세요."),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text("확인"))
                                      ],
                                    ));
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("삭제")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("취소")),
                  ],
                ),
              ],
            ));
  }

  Future<void> _SearchAlert(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("검색어를 입력 해주세요."),
              content: TextField(
                controller: SearchController,
                decoration: InputDecoration(hintText: "검색어를 입력 해주세요."),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("검색")),
                ElevatedButton(
                    onPressed: () {
                      SearchController.text = "";
                      Navigator.of(context).pop();
                    },
                    child: Text("취소"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("게임"), actions: [
        IconButton(
          onPressed: () async {
            setState(() {
              isAlarmed = !isAlarmed;
            });
          },
          icon: Icon(
            isAlarmed ? Icons.alarm : Icons.alarm_off,
            size: 40,
            color: isAlarmed ? Colors.red : Colors.black,
          ),
        ),
        IconButton(
            onPressed: () async {
              _SearchAlert(context);
            },
            icon: Icon(
              Icons.search,
              size: 40,
              color: Colors.black,
            ))
      ]),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
                .collection('Game1')
                .orderBy('TimeStamp', descending: true)
                .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          debugPrint('${streamSnapshot.hasData}');
          if (streamSnapshot.hasData) {
            temp = streamSnapshot.data!.docs;
            debugPrint('has data');
          }
          if (temp.isNotEmpty) {
            return Column(
              children: [
                SizedBox(
                  height: 750,
                  child: ListView.builder(
                    itemCount: temp.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot = temp[index];
                      return Container(
                        width: double.infinity,
                        height: 100,
                        child: Card(
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(width: 1)),
                          elevation: 4.0,
                          margin: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 8,
                            bottom: 8,
                          ),
                          child: ListTile(
                            onTap: () {
                              _show(documentSnapshot);
                            },
                            title: Text(
                              documentSnapshot['title'],
                              style: TextStyle(fontFamily: 'JalnanGothic'),
                            ),
                            subtitle: Text(
                              documentSnapshot['CurrentUser'] +
                                  '/' +
                                  documentSnapshot['MaxUser'],
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: SizedBox(
                                width: 110,
                                child: Row(
                                  children: [
                                    Text(documentSnapshot['TimeStamp'])
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // TextFormField(
                //decoration: ,
                // ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          titleController.text = "";
          modeController.text = "";
          LineController.text = "";
          RankController.text = "";
          MyIDController.text = "";
          MaxUserController.text = "";
          CurrentUserController.text = "";
          PassWordController.text = "";
          _create();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
