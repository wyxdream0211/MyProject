package com.dao;

import java.util.List;

import com.beans.User;

public interface UserDao {

	//1������������ѯ
	public User queryByUserId(String id) throws Exception;
	//2����ѯ�����û���Ϣ
	public List<User> queryAll() throws Exception;
	//3�������û���Ϣ
	public boolean addUser(User user);
	//4�������û���Ϣ
	public boolean updateUser(User user);
	//5��ɾ���û���Ϣ
	public int deleteByUserId();
	//6�������û�����ѯ
	public User queryByUserName(String username) throws Exception;
	//7������û����Ƿ���ע��
	public boolean isExistByUserName(String username) throws Exception;
}
