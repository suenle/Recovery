package com.huifu.service;

import java.util.List;
import java.util.Map;

import com.huifu.entity.District;

public interface IDistrictService {
	public int deleteByPrimaryKey(Integer id);

	public int insert(District record);

	public int insertSelective(District record);

	public District selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(District record);

	public int updateByPrimaryKey(District record);

	public List<District> getAllDistrict();
	
	public District DistrictIsExist(District record);

	public List<District> queryDistrict(Map<String, Object> data);

	public int getDistrictNum(Map<String, Object> data);
}