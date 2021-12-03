package mainPackage;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class DbCall {
  private static Connection connectDb() {
    String url = "jdbc:postgresql://hattie.db.elephantsql.com:5432/";
    String username = "kqdqklhq";
    String password = "LSMa-JQZD5UwMyR4v1qtLkbRo4HY1IMa";
    String driver = "org.postgresql.Driver";
    
    try {
      Class.forName(driver);
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    
    Connection con = null;
    try {
      con = DriverManager.getConnection(url + username, username, password);
    } catch (Exception e) {e.printStackTrace();}
    
    return con;
  }
  
  public static ArrayList<ArrayList<String>> dbRes(String queryString, Integer queryType) {
    
    ArrayList<ArrayList<String>> result = new ArrayList<>();
    
    Connection dbCon = connectDb();
    ResultSet dbResult = null;
    
    Statement s = null; 
    try {
      s = dbCon.createStatement();
      dbResult = s.executeQuery(queryString);
      
      if (queryType.equals(1)) {result = DbCollectors.orderList(dbResult);}
      if (queryType.equals(2)) {result = DbCollectors.itemList(dbResult);}
      if (queryType.equals(3)) {result = DbCollectors.dateList(dbResult);}
      if (queryType.equals(4)) {result = DbCollectors.userList(dbResult);}
      
      s.close();
      dbCon.close();

    } catch (Exception e) {e.printStackTrace();}
    
    return result;
  }
  public static Integer dbOrderInsert(String userEmail, String userItem, String userDate) {
    Integer result = 0;
    
    Connection dbCon = connectDb();
    
    Statement s = null;
    try {
      s = dbCon.createStatement();
      result = s.executeUpdate(
        String.format(
          "INSERT INTO orders (personId, itemId, dateId) VALUES ('%1$s', '%2$s', '%3$s')",
          userEmail,
          userItem,
          userDate
        )
      );
      
      s.close();
      dbCon.close();
    } catch (Exception e) {e.printStackTrace();}
    
    return result;
  }
  public static Integer dbOrderDelete(String orderId) {
    Integer result = 0;
    
    Connection dbCon = connectDb();
    Statement s = null;
    try {
      s = dbCon.createStatement();
      result = s.executeUpdate(
        String.format("DELETE FROM orders WHERE id=%s", orderId)
      );
      
      s.close();
      dbCon.close();
    } catch (Exception e) {e.printStackTrace();}
    
    return result;
  }
  public static Integer dbItemInsert(String itemName) {
    Integer result = 0;
    Connection dbCon = connectDb();
    Statement s = null;
    try {
      s = dbCon.createStatement();
      result = s.executeUpdate(
        String.format("INSERT INTO item (name) VALUES ('%s')", itemName)
      );
      s.close();
      dbCon.close();
    } catch (Exception e) {e.printStackTrace();}
    
    return result;
  }
  public static Integer dbItemDelete(String itemId) {
    Integer result = 0;
    Connection dbCon = connectDb();
    Statement s = null;
    // Delete orders that have item
    try {
      s = dbCon.createStatement();
      result = s.executeUpdate(
        String.format("DELETE FROM orders WHERE itemId = %s", itemId)
      );
    } catch (Exception e) {e.printStackTrace();}
    // Delete item
    try {
      s = dbCon.createStatement();
      result = s.executeUpdate(
        String.format("DELETE FROM item WHERE id=%s", itemId)
      );
      s.close();
      dbCon.close();
    } catch (Exception e) {e.printStackTrace();}
    
    return result;
  }
}
