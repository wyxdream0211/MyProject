package com.util;

import java.sql.*;
import java.util.List;

public class JdbcUtil {

	private static String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/shopping";
	private String username = "hr";
	private String password = "admin";
	//private static Context context;
	//private static DataSource ds;
	private Connection connection;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	//�������ݿ�����
	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	/*static{
		try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:/comp/env/jdbc/mysqlds");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
	//��ȡ���ݿ����Ӷ���
	public Connection getConnection(){
		try {
			connection=DriverManager.getConnection(url,username,password);
			//connection = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
		
	}
	//�����ݿ�����ɾ���Ĳ���
	public boolean updateByPrearedStatement(String sql,List<Object> params){
		boolean flag=false;
		try {
			pstm=connection.prepareStatement(sql);
			if(params!=null && params.size()>0){
					for(int i=0;i<params.size();i++){
						pstm.setObject(i+1, params.get(i));
					}
			}
			int rownum=pstm.executeUpdate();
			if(rownum > 0){
				flag=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
		
	}
	
	//��ѯ���ݿ�
	public ResultSet queryByPreparedStatement(String sql,List<Object> params){
		try {
			pstm=connection.prepareStatement(sql);
			if(params!=null && params.size()>0){
					for(int i=0;i<params.size();i++){
						pstm.setObject(i+1, params.get(i));
					}
			}
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	//�ر����ݿ���Դ
	public void close(){
		if(connection!=null){
			try {
				if(rs!=null){
					rs.close();
				}
				if(pstm!=null){
					pstm.close();
				}
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
