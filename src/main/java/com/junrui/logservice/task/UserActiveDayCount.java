package com.junrui.logservice.task;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.junrui.logreport.util.DateUtil;
import com.junrui.logservice.dao.BaseDao;
import com.junrui.logservice.util.SpringBeanFactory;

@Component
public class UserActiveDayCount extends BaseDao {
	
	/** 
	* @Title: count 
	* @Description: 查询统计结果
	* @return
	* @return List<Map<String,Object>>    返回类型 
	* @throws 
	*/ 
	public List<Map<String, Object>> count()
	{
		Calendar cal=Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String dayTime=DateUtil.getCurrentDayStr(cal);
		StringBuffer sql=new StringBuffer(" select count(user_id) active_count,client_os,client_type,channel_id,day_time from "); 
		sql.append(" (select user_id,client_os,client_type,channel_id,day_time from t_action_log "); 
		sql.append(" where user_id is not null and client_os is not null and client_type is not null and channel_id is not NULL and day_time='"+dayTime+"'");
		sql.append(" group by client_os,client_type,channel_id,user_id) ");
		sql.append(" log ");
		sql.append(" group by  client_os,client_type,channel_id ");
		return this.getDbHandle().queryForList(sql.toString());
	}
	

	/** 
	* @Title: saveResult 
	* @Description: 保存统计结果
	* @param data
	* @return void    返回类型 
	* @throws 
	*/ 
	public void saveResult(List<Map<String, Object>> data)
	{
		if(data!=null && data.size()>0)
		{
			String sql="insert into t_activeuser_daycount  (client_os,client_type,channel_id,active_count,day_time) values(?,?,?,?,?)";
			List<Object[]> batchArgs=new ArrayList<Object[]>();
			Object[] param;
			for (Map<String, Object> map : data)
			{
				param=new Object[5];
				param[0]=map.get("client_os").toString();
				param[1]=map.get("client_type").toString();
				param[2]=map.get("channel_id").toString();
				param[3]=map.get("active_count").toString();
				param[4]=map.get("day_time").toString();
				batchArgs.add(param);
			}
			this.getDbHandle().batchUpdate(sql, batchArgs);
		}
	}
	
	public static void main(String[] args)
	{
		SpringBeanFactory.init("E:\\workspace\\eclipse\\logservice\\src\\main\\resource\\applicationContext.xml");
		UserActiveDayCount uad=(UserActiveDayCount)SpringBeanFactory.getBusinessOjbect(UserActiveDayCount.class);
		System.out.println(uad.count());
	}

}
