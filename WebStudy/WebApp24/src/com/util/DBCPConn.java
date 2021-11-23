package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	private static Connection conn = null;

	public static Connection getConnection()
	{
		if (conn == null)
		{
			try
			{
				// ○ 이름과 객체를 바인딩
				// -- 컨텍스트(Context)를 얻어내는 가장 쉬운 방법은 이니셜 context
				// 『javax.naming.InitialContext』 클래스의
				// 인스턴스를 생성하는 것이다.
				// → 『new InitialContext();』
				Context ctx = new InitialContext();

				// ※ javax.naming.InitialContext 메소드
				// - bind(String str, Object obj)
				// : 서비스할 객체를 특정 이름으로 등록한다.
				// - rebind(String str, Objetc obj)
				// : 서비스할 객체를 특정 이름으로 다시 등록한다.
				// - list(String str)
				// : 특정 이름으로 서비스하는 개체 정보를 반환한다.
				// - unbinding(String str)
				// : 등록된 객체를 메모리에서 해제한다.
				// - Object lookup(String str)
				// : 서비스중인 객체 정보를 얻어온다.

				// 『web.xml』(뭐가 어디에 배치되어있는지 기술해뒀음..누가 와서 뭘 요청하면 이걸 주면 돼~이런게 기술되어있음)로
				// 부터 환경 설정을 찾아오겠다는 코딩
				// -- 다른 형태로 변경 불가
				Context evt = (Context) ctx.lookup("java:/comp/env");

				DataSource ds = (DataSource) evt.lookup("jdbc/myOracle");

				conn = ds.getConnection();

			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return conn;
	}// end getConnection()

	public static void close()
	{
		if (conn != null)
		{
			try
			{
				if (!conn.isClosed())
					conn.close();

			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		} // end if

		conn = null;

	}//end close();
}