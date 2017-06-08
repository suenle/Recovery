package com.huifu.service;

import java.util.List;
import java.util.Map;

import com.huifu.entity.LifeScore;

public interface ILifeScoreService {
	public int deleteByPrimaryKey(Integer id);

	public int insert(LifeScore record);

	public int insertSelective(LifeScore record);

	public LifeScore selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(LifeScore record);

	public int updateByPrimaryKey(LifeScore record);
	
	public List<LifeScore> listWeekScoreByTimeAndType(Map<String, Object> data);
	
	public List<LifeScore> listLifeScoreByTime(Map<String, Object> data);
	
	public int LifeScoreByTimeNum(Map<String, Object> data);
	
	 public List<LifeScore> listLifeScoreByTimePrint(Map<String, Object> data);
		
		public int LifeScoreByTimeNumPrint(Map<String, Object> data);
		   public List<LifeScore> ListFourWeekIndex();
}