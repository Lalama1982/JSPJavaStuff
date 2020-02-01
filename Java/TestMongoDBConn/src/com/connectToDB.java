package com;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;

import com.mongodb.ServerAddress;

import java.util.Date;
import java.util.Arrays;

public class connectToDB {
	   public static void main( String args[] ) {
			
		      try{
				
		         // To connect to mongodb server
		         MongoClient mongoClient = new MongoClient( "Nadeera" , 27017 );
					
		         // Now connect to your databases
		         DB db = mongoClient.getDB( "lmy_test" );
		         System.out.println("Connect to database successfully");
		         
		         //MongoDB in secure mode, authentication is required.
//		         boolean auth = db.authenticate(myUserName, myPassword);
//		         System.out.println("Authentication: "+auth);

		         // if collection doesn't exists, MongoDB will create it for you	
		         DBCollection mycol2 = db.getCollection("mycol2");
		         System.out.println("Collection mycol2 selected successfully");

		         // insert	
		         BasicDBObject document = new BasicDBObject();
		         document.put("name", "mkyong");
		         document.put("age", 30);
		         document.put("createdDate", new Date());
		         mycol2.insert(document);
		         System.out.println("Document added to Collection mycol2 successfully");
		         
		         // update
		         BasicDBObject query = new BasicDBObject();
		         query.put("name", "mkyong");

		         BasicDBObject newDocument = new BasicDBObject();
		         newDocument.put("name", "mkyong-updated");

		         BasicDBObject updateObj = new BasicDBObject();
		         updateObj.put("$set", newDocument);

		         mycol2.update(query, updateObj);
		         System.out.println("Document updated to Collection mycol2 successfully");
		         
		         // find - search
		         BasicDBObject searchQuery1 = new BasicDBObject();
		         searchQuery1.put("name", "mkyong");

		         DBCursor cursor = mycol2.find(searchQuery1);
		         System.out.println("Selection from Collection mycol2 done successfully");
		         while (cursor.hasNext()) {
		         	System.out.println(cursor.next());
		         }

		         // delete
		         BasicDBObject searchQuery2 = new BasicDBObject();
		         searchQuery2.put("name", "mkyong");

		         mycol2.remove(searchQuery2);
		         System.out.println("Document deleted from Collection mycol2 successfully");
		         
		      }catch(Exception e){
		         System.err.println( e.getClass().getName() + ": " + e.getMessage() );
		      }
		   }
}
