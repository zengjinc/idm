package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.ssm.mapper.UserMapper;
import com.ssm.pojo.User;
import com.ssm.pojo.UserExample;
import com.ssm.pojo.UserQueryExample;
import com.ssm.pojo.to.UserQueryTo;
import com.ssm.service.IPolicyService;
import com.ssm.service.IUserService;

@Service("userService")
public class UserService implements IUserService{
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private IPolicyService policyService;
	
	@Override
	public void deleteUser(String userUuid) throws Exception{
		userMapper.deleteByPrimaryKey(userUuid);
	}
	
	@Override
	public User getUserByPrimaryKey(String userUuid) throws Exception{
		User user = userMapper.selectByPrimaryKey(userUuid);
		return user;
	}
	
	@Override
	public List<User> getUserByExample(UserExample example) throws Exception{
		List<User> userList = userMapper.selectByExample(example);
		return userList;
	}
	
	@Override
	public List<User> getUserByExample(UserExample example, PageBounds pageBounds) throws Exception {
		List<User> selectByExample = userMapper.selectByExample(example, pageBounds);
		return selectByExample;
	}
	
	@Override
	public int addUser(User record) throws Exception{
		//插入用户
		int insert = userMapper.insert(record);

		return insert;
	}
	
	@Override
	public int addUserSelective(User record) throws Exception{
		int insertSelective = userMapper.insertSelective(record);
		return insertSelective;
	}
	
	@Override
	public int removeUserByExample(UserExample example) throws Exception{
		int deleteByExample = userMapper.deleteByExample(example);
		return deleteByExample;
	}
	
	@Override
	public int removeUserByPrimaryKey(String userUuid) throws Exception{
		int deleteByPrimaryKey = userMapper.deleteByPrimaryKey(userUuid);
		return deleteByPrimaryKey;
	}
	
	@Override
	public int updateUserByExample(User record,UserExample example) throws Exception{
		int updateByExample = userMapper.updateByExample(record, example);
		return updateByExample;
	}
	
	@Override
	public int updateUserByExampleSelective(User record,UserExample example) throws Exception{
		int updateByExampleSelective = userMapper.updateByExampleSelective(record, example);
		return updateByExampleSelective;
	}
	
	@Override
	public int updateUserByPrimaryKey(User record) throws Exception{
		int updateByPrimaryKey = userMapper.updateByPrimaryKey(record);
		return updateByPrimaryKey;
	}

	@Override
	public int updateUserByPrimaryKeySelective(User record) throws Exception{
		int updateByPrimaryKeySelective = userMapper.updateByPrimaryKeySelective(record);
		return updateByPrimaryKeySelective;
	}
	
	@Override
	public int countUserByExample(UserExample example) throws Exception{
		int countByExample = userMapper.countByExample(example);
		return countByExample;
	}
	
	@Override
	public List<User> queryUser(UserQueryTo userQueryTo) throws Exception{
		 List<User> queryUser = userMapper.queryUser(userQueryTo);
		return queryUser;
	}

	@Override
	public List<User> queryUser(UserQueryExample example,PageBounds pageBounds) throws Exception {
		List<User> userList = userMapper.queryUser2(example,pageBounds);
		return userList;
	}
	
	@Override
	public User doLogin(String userName,String pwd) throws Exception {
		UserExample example = new UserExample();
		example.createCriteria().andUserNameEqualTo(userName).andUserPwdEqualTo(pwd);
		List<User> userList = userMapper.selectByExample(example);
		
		if(userList.size() > 0){
			return userList.get(0);
		}
		return null;
	}

	@Override
	public boolean deleteUserByResource(String resUuid) throws Exception {
		UserExample example = new UserExample();
		
		example.createCriteria().andUserResUuidEqualTo(resUuid);
		
		if(userMapper.deleteByExample(example) > 0){
			return true;
		}
		
		return false;
	}
	

	
}
