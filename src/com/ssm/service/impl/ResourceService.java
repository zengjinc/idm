package com.ssm.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssm.mapper.ResourceMapper;
import com.ssm.mapper.ResourceTypeMapper;
import com.ssm.pojo.Account;
import com.ssm.pojo.Itrole;
import com.ssm.pojo.Resource;
import com.ssm.pojo.ResourceExample;
import com.ssm.service.IAccountAttributeService;
import com.ssm.service.IAccountService;
import com.ssm.service.IEntitlementService;
import com.ssm.service.IItroleAttributeService;
import com.ssm.service.IItroleService;
import com.ssm.service.IPolicyService;
import com.ssm.service.IPrivilegeService;
import com.ssm.service.IResourceService;
import com.ssm.service.ISchedulejobService;
import com.ssm.service.IUserService;

@Service("resourceService")
public class ResourceService implements IResourceService{

	private static Logger logger = LoggerFactory.getLogger(ResourceService.class);
	
	@Autowired
	private ResourceMapper resourceMapper;
	
	@Autowired
	private ResourceTypeMapper resourceTypeMapper;
	
	@Autowired
	private IPolicyService policyService;
	
	@Autowired
	private ISchedulejobService schedulejobService;
	
	@Autowired
	private IEntitlementService entitlementService;
	
	@Autowired
	private IAccountService accountService;
	
	@Autowired
	private IAccountAttributeService acctAttrService;
	
	@Autowired
	private IItroleService itroleService;
	
	@Autowired
	private IItroleAttributeService itroleAttrService;
	
	@Autowired
	private IPrivilegeService privilegeService;
	
	@Autowired
	private IUserService userService;
	
	@Override
	public void cascadeDeleteResource(String resUuid) throws Exception{
		/*
		 * policy
		 */
		policyService.deletePolicyByResource(resUuid);
		/*
		 * schedulejob
		 */
		schedulejobService.deleSchedulejobByResource(resUuid);
		/*
		 * entitlement		account_attribute	account
		 */
		
		List<Account> accountList = accountService.getAccountByResUuid2(resUuid);
		
		for(Account account : accountList){
			String acctUuid = account.getAcctUuid();
			
			entitlementService.deleEntitlementByAccountTgtUuid(account.getAcctTgtUuid());
			
			acctAttrService.deleteByAccountUuid(acctUuid);
			
			accountService.deleteByPrimaryKey(acctUuid);
		}
		
		/*
		 * privilege	itrole_attribute	itrole
		 */
		List<Itrole> itroleList = itroleService.getItroleByResUuid(resUuid);
		
		for(Itrole itrole : itroleList){
			String itroleUuid = itrole.getItroleUuid();
			
			privilegeService.deleteByItrole(itrole.getItroleUuid());
			
			itroleAttrService.deleteByItroleUuid(itroleUuid);
			
			itroleService.deleteByPrimaryKey(itroleUuid);
		}
		/*
		 * user
		 */
		userService.deleteUserByResource(resUuid);
		
		/*
		 * resource
		 */
		resourceMapper.deleteByPrimaryKey(resUuid);
	}
	
	@Override
	public List<Resource> getAllResourceNonTrust(){
		ResourceExample example = new ResourceExample();
		example.createCriteria().andResTrustEqualTo(0);
		List<Resource> ResourceList = resourceMapper.selectByExampleWithBLOBs(example);
		return ResourceList;
	}
	
	@Override
	public List<String> getAcctAttrByResUuid(String resUuid) throws Exception{
		Resource resource = resourceMapper.selectByPrimaryKey(resUuid);
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(resource.getResJsonAttr());
		JsonNode acctJson = rootNode.get("acctJson");
		JsonNode acctAttrJson = acctJson.get("acct_attr_def");
		String acctUuid = acctJson.get("account_uuid").asText();
		String acctId = acctJson.get("account_id").asText();
		String acctStatus = acctJson.get("account_status").asText();
		
		Iterator<JsonNode> it = acctAttrJson.elements();
		List<String> targetNameList = new ArrayList<>();
		while(it.hasNext()){
			JsonNode node = it.next();
			String showName = node.get("show_name").asText();
			if(!showName.equals(acctUuid) && !showName.equals(acctId) && !showName.equals(acctStatus)){
				String targetName = node.get("target_name").asText();
				targetNameList.add(targetName);
			}
			
		}
		
		return targetNameList;
	}

	@Override
	public Resource getResourceByPrimarKey(String resUuid) throws Exception {
		return resourceMapper.selectByPrimaryKey(resUuid);
	}
	
	@Override
	public Resource getResourceByResId(String resId) throws Exception{
		ResourceExample example = new ResourceExample();
		example.createCriteria().andResIdEqualTo(resId);
		List<Resource> list = resourceMapper.selectByExampleWithBLOBs(example);
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public List<Resource> getResourceByExample(ResourceExample example) throws Exception{
		return resourceMapper.selectByExample(example);
	}
}
