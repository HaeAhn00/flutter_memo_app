import 'package:flutter/material.dart';
import 'package:flutter_memo_app/data_utils.dart';
import 'package:flutter_memo_app/memo_write_controller.dart';
import 'package:get/get.dart';

class MemoWritePage extends StatelessWidget {
  const MemoWritePage({super.key});
  void _showDeleteConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('메모 삭제'),
          content: Text('메모를 삭제하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                Get.find<MemoWriteController>().delete();
              },
              child: Text(
                '삭제',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Get.back,
          child: Image.asset('assets/images/back.png'),
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          '메모',
          style: TextStyle(fontSize: 17, color: Color(0xffE3AC34)),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.find<MemoWriteController>().save();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                '완료',
                style: TextStyle(fontSize: 17, color: Color(0xffE3AC34)),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: Get.find<MemoWriteController>().titleTextController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '제목을 입력해주세요.',
              ),
              style: TextStyle(
                fontSize: 27,
                height: 1.5,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
              maxLines: null,
              onChanged: (value) {
                Get.find<MemoWriteController>().setTitle(value);
              }, // 여러 줄 입력 가능
            ),
            Text(
              MemoDataUtils.formatDate(
                  'yyyy-MM-dd', Get.find<MemoWriteController>().memoDate!),
              style: TextStyle(fontSize: 13, color: Color(0xffE3AC34)),
            ),
            Expanded(
              child: TextField(
                controller: Get.find<MemoWriteController>().memoTextController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '내용을 입력해주세요.',
                ),
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Color(0xff848484),
                  letterSpacing: -1,
                ),
                maxLines: null, // 여러 줄 입력 가능
                onChanged: (value) {
                  Get.find<MemoWriteController>().setMemo(value);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: GestureDetector(
          onTap: () {
            _showDeleteConfirmDialog(context);
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF81717),
            ),
            child: Center(
              child: Text(
                '삭제',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
