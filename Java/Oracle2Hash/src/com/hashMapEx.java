package com;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
//import java.sql.SQLException;
import java.sql.Statement;
//import java.util.ArrayList;
import java.util.HashMap;
//import java.util.List;
import java.util.Map;

public class hashMapEx {
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
			String query = "select supp_number, supp_name from test_supplier";
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			//ResultSetMetaData rsmd = rs.getMetaData();
			
			/*
			List<String> columns = new ArrayList<String>(rsmd.getColumnCount());
			for(int i = 1; i <= rsmd.getColumnCount(); i++){
				columns.add(rsmd.getColumnName(i));
			}
			*/
			
			int seq = 1;
			Map<Integer,Supplier> hmap=new HashMap<Integer,Supplier>(); 
			while(rs.next()){ 
				Supplier supp = new Supplier(Integer.parseInt(rs.getString("supp_number")), rs.getString("supp_name"));
				hmap.put(seq, supp);
				seq++;
			
			}
			
			//System.out.println(data);
			rs.close();
			stmt.close();
			connection.close();
			
			for(Map.Entry<Integer,Supplier> entry:hmap.entrySet()){    
				int keycol=entry.getKey(); 
				Supplier subObj=entry.getValue();
				System.out.println(" Details: "+keycol+" Supplier Number: "+ subObj.supp_number+" Supplier Name: "+subObj.supp_name);  
			}
        	
        } catch (Exception e) {
            System.out.println("Issue in mapping to HashMap");
            e.printStackTrace();
            return;
        	
        }
        
    }
}
