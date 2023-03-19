import 'package:flutter/material.dart';

class Modals {
  static void showRemoveModal(var e, context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "정말로 삭제 하시겠습니까?",
            style: TextStyle(color: Colors.red),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [Text('삭제하시기를 원하시면 확인 버튼을 눌러주세요.')],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                e();
              },
              child: const Text(
                "확인",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("취소"),
            ),
          ],
        );
      },
    );
  }

  static void showAddCategoryModal(var e, context) {
    TextEditingController cateCtrl = TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Category"),
          content: SingleChildScrollView(
              child: ListBody(
            children: [
              TextField(
                controller: cateCtrl,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: "카테고리",
                  hintText: "카테고리를 입력해 주십시오.",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 1, color: Colors.cyan),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              )
            ],
          )),
          actions: [
            TextButton(
              child: const Text("확인"),
              onPressed: () {
                if (cateCtrl.text != "") {
                  Navigator.of(context).pop();
                  e(cateCtrl.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(
                        child: Text("카테고리를 입력해 주십시오"),
                      ),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
            ),
            TextButton(
              child: const Text("취소"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
