import 'package:virt_shelf/database/database_helper.dart';
import 'package:virt_shelf/database/db_books.dart';

class DbBooksdao {
  Future<List<DbBooks>> showAllBooks() async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Books");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return DbBooks(satir["book_id"], satir["isim"], satir["yazar"]);
    });
  }
}
