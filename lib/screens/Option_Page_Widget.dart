import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Option_Page_Widget extends StatefulWidget {
  const Option_Page_Widget({super.key});

  @override
  State<Option_Page_Widget> createState() => _Option_Page_WidgetState();
}

class _Option_Page_WidgetState extends State<Option_Page_Widget> {
  CollectionReference product =
      FirebaseFirestore.instance.collection('Options');
  CollectionReference product1 =
      FirebaseFirestore.instance.collection('AlarmTime');
  final TextEditingController OptionController = TextEditingController();
  final TextEditingController StartTimeController = TextEditingController();
  final TextEditingController EndTimeController = TextEditingController();

  Future<void> _update() async {
    final String Option = OptionController.text;
    product.add({"option": Option});
    OptionController.text = "";
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("등록이 완료되었습니다")));
  }

  Future<void> _delete(String productId) async {
    await product.doc(productId).delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("삭제가 완료되었습니다")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("옵션"),
      ),
      body: StreamBuilder(
        stream: product.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return Column(
              children: [
                Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        child: Padding(
                          padding: EdgeInsets.only(left: 13, top: 0.2),
                          child: TextField(
                            controller: OptionController,
                            decoration: InputDecoration(
                                hintText: "키워드를 입력 해 주세요.",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 48,
                      ),
                      IconButton(
                        onPressed: () => _update(),
                        icon: Icon(
                          CupertinoIcons.plus,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: GridView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                          childAspectRatio: 3 / 1, //item 의 가로 2, 세로 1 의 비율
                          mainAxisSpacing: 10, //수평 Padding
                          crossAxisSpacing: 10, //수직 Padding
                        ),
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          return Container(
                            width: 50,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 2),
                            ),
                            child: InkWell(
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text("삭제하시겠습니까?"),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () async {
                                                await _delete(
                                                    documentSnapshot.id);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("삭제"),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("취소"),
                                            ),
                                          ],
                                        ));
                              },
                              child: Center(
                                  child: Text(
                                documentSnapshot['option'],
                                style: TextStyle(
                                    fontSize: 12, fontFamily: 'JalnanGothic'),
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Container(
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'JalnanGothic'
                          ),
                            controller: StartTimeController,
                            decoration: InputDecoration(hintText: "시작 시간"),
                          ),
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(fontSize: 80),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Container(
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'JalnanGothic'
                            ),
                            controller: EndTimeController,
                            decoration: InputDecoration(hintText: "종료 시간",),
                          ),
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String StartTime = StartTimeController.text;
                      final String EndTime = EndTimeController.text;
                      await product1.add({
                        "StartTime": StartTime,
                        "EndTime": EndTime,
                      });
                    },
                    child: Text("저장하기"))
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
