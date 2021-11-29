package com.util;

import java.sql.*;

public class DBConn
{
	private static Connection dbconn;
	
	public static Connection getConnection()
	{
		
		if (dbconn == null)
		{
			try
			{
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String userName = "scott";
				String userPwd = "tiger";
				String driverName = "oracle.jdbc.driver.OracleDriver";
				
				Class.forName(driverName);
				
				dbconn = DriverManager.getConnection(url, userName, userPwd);
			}
			catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return dbconn;
	}
	
	public static Connection getConnection(String url, String userName, String userPwd)
	{
		
		if (dbconn == null)
		{
			try
			{
				String driverName = "oracle.jdbc.driver.OracleDriver";
				Class.forName(driverName);
				dbconn = DriverManager.getConnection(url, userName, userPwd);
			}
			catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return dbconn;
	}
	
	public static void close()
	{
		if (dbconn != null)
		{
			try
			{
				if (dbconn.isClosed())
					dbconn.close();
			}
			catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		dbconn = null;
	}
	
}