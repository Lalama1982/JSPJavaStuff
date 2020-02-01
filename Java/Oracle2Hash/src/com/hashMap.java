package com;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
//import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class hashMap {
    public static void main(String[] argv) {

        System.out.println("-------- Oracle JDBC Connection Testing ------");

        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");

        } catch (ClassNotFoundException e) {

            System.out.println("Where is your Oracle JDBC Driver?");
            e.printStackTrace();
            return;

        }

        System.out.println("Oracle JDBC Driver Registered!");

        Connection connection = null;

        try {
            connection = DriverManager.getConnection("jdbc:oracle:thin:@Lalama-Acer:1521:xe", "test_user", "test_user");

        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
            return;

        }

        if (connection != null) {
            System.out.println("You made it, take control your database now!");
        } else {
            System.out.println("Failed to make connection!");
        }
        
        try {
			String query = "select supp_name from test_supplier";
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			
			List<String> columns = new ArrayList<String>(rsmd.getColumnCount());
			for(int i = 1; i <= rsmd.getColumnCount(); i++){
				columns.add(rsmd.getColumnName(i));
			}
			
			Map<String,String> hmap=new HashMap<String,String>(); 
			while(rs.next()){ 
				for(String col : columns) {
					hmap.put(col, rs.getString(col));
				}				
			}
			
			//System.out.println(data);
			rs.close();
			stmt.close();
			connection.close();
			
			for(Map.Entry<String,String> entry:hmap.entrySet()){    
				String keycol=entry.getKey();  
				String valcol=entry.getValue();  
				System.out.println(" Details: "+keycol+" Column Value: "+valcol);  
			}
        	
        } catch (Exception e) {
            System.out.println("Issue in mapping to HashMap");
            e.printStackTrace();
            return;
        	
        }
        
    }
}
