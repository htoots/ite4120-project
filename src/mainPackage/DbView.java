package mainPackage;

import java.util.ArrayList;

public class DbView {
  public static ArrayList<ArrayList<String>> orderContentView() {
    return DbCall.dbRes(
      "select person.firstname, item.name, date.day, orders.id from person inner join orders on orders.personId = person.id"+
      " inner join item on orders.itemId = item.id inner join date on orders.dateId = date.id order by orders.id asc;", 1
    );
  }
  public static ArrayList<ArrayList<String>> dropdownItemList() {
    return DbCall.dbRes("select * from item;", 2);
  }
  public static ArrayList<ArrayList<String>> dropdownDateList() {
    return DbCall.dbRes("select * from date", 3);
  }
  public static ArrayList<ArrayList<String>> userList() {
    return DbCall.dbRes("select * from person", 4);
  }
  public static ArrayList<ArrayList<String>> userOrderList(String userId) {
    return DbCall.dbRes(
      String.format("select person.firstname, item.name, date.day, orders.id from person inner join orders on orders.personId = person.id"+
      " inner join item on orders.itemId = item.id inner join date on orders.dateId = date.id where person.id = %s order by orders.id asc;", userId), 1);
  }
}
