package com.huifu.service.impl;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.DistrictDao;
import com.huifu.entity.District;
import com.huifu.service.IDistrictService;

/**
 * 货物类型(大类)服务接口类
 */
@Service
public class DistrictService implements IDistrictService {
	private DistrictDao districtDao;


	public DistrictDao getDistrictDao() {
		return districtDao;
	}

	public void setDistrictDao(DistrictDao districtDao) {
		this.districtDao = districtDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getDistrictDao().deleteByPrimaryKey(id);
	}

	public int insert(District record) {
		return getDistrictDao().insert(record);
	}

	public int insertSelective(District record) {
		return getDistrictDao().insertSelective(record);
	}

	public District selectByPrimaryKey(Integer id) {
		return getDistrictDao().selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(District record) {
		return getDistrictDao().updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(District record) {
		return getDistrictDao().updateByPrimaryKey(record);
	}

	public District checkLogin(District record) {

		return getDistrictDao().checkLogin(record);
	}

	public List<District> getAllDistrict() {
		return getDistrictDao().getAllDistrict();
	}

	public District DistrictIsExist(District record) {
		return getDistrictDao().DistrictIsExist(record);
	}

	public List<District> queryDistrict(Map<String, Object> data) {
		return getDistrictDao().queryDistrict(data);
	}

	public int getDistrictNum(Map<String, Object> data) {
		
		return getDistrictDao().getDistrictNum(data);
	}

}
