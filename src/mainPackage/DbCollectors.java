package mainPackage;

import java.sql.ResultSet;
import java.util.ArrayList;

public class DbCollectors {
  public static ArrayList<ArrayList<String>> orderList(ResultSet dataRes) {
    ArrayList<ArrayList<String>> result = new ArrayList<>();
    try{
      while(dataRes.next()) {
        ArrayList<String> row = new ArrayList<String>();
        String personName = dataRes.getString("firstname");
        String itemName = dataRes.getString("name");
        String orderDay = dataRes.getString("day");
        String orderId = dataRes.getString("id");
        
        row.add(personName);
        row.add(itemName);
        row.add(orderDay);
        row.add(orderId);
        
        result.add(row);
      }
    } catch (Exception e) {e.printStackTrace();}
    
    return result;
  }
  public static ArrayList<ArrayList<String>> itemList(ResultSet dataRes) {
    ArrayList<ArrayList<String>> result = new ArrayList<>();
    try {
      while(dataRes.next()) {
        ArrayList<String> row = new ArrayList<String>();
        String itemId = dataRes.getString("id");
        String itemName = dataRes.getString("name");
        
        row.add(itemId);
        row.add(itemName);
        
        result.add(row);
      }
    } catch (Exception e) {e.printStackTrace();}
    
    return result;
  }
  public static ArrayList<ArrayList<String>> dateList(ResultSet dataRes) {
    ArrayList<ArrayList<String>> result = new ArrayList<>();
    try {
      while(dataRes.next()) {
        ArrayList<String> row = new ArrayList<String>();
        String dateId = dataRes.getString("id");
        String dateName = dataRes.getString("day");
        
        row.add(dateId);
        row.add(dateName);
        
        result.add(row);
      }
    } catch (Exception e) {e.printStackTrace();}
    
    return result;
  }
  public static ArrayList<ArrayList<String>> userList(ResultSet dataRes) {
    ArrayList<ArrayList<String>> result = new ArrayList<>();
    try {
      while(dataRes.next()) {
        ArrayList<String> row = new ArrayList<String>();
        String personId = dataRes.getString("id");
        String personEmail = dataRes.getString("email");
        
        row.add(personId);
        row.add(personEmail);
        
        result.add(row);
      }
    } catch (Exception e) {e.printStackTrace();}
    
    return result;
  }
}
