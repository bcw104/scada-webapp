package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.service.MajorTagService;
import com.ht.scada.common.tag.util.EndTagTypeEnum;
import com.ht.scada.oildata.entity.OilWellDailyDataRecord;
import com.ht.scada.oildata.entity.OilWellHourlyDataRecord;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.OilWellService;
import com.ht.scada.web.service.UserExtInfoService;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/performance")
public class PerformanceController {
    
    @Autowired
	private UserService userService;
    @Autowired
    private MajorTagService majorTagService;
    @Autowired
	private UserExtInfoService userExtInfoService;
    @Autowired
    private EndTagService endTagService;
    @Autowired
    private OilWellService oilWellService;
    
    /**
     * 获得旬数、天数
     * @return mapDate（旬数、天数)
     */
    @RequestMapping(value="getDateData")
    @ResponseBody
    public Map getDateData(){
        
        // 今日时间
        Calendar calToday = Calendar.getInstance();
        // 今日所在月的日期
        int intDay = calToday.get(Calendar.DAY_OF_MONTH);        
           
        // 当前旬第一天        
        Date dateNowXun = getTenDaysStart(calToday.getTime());
        // 下一旬第一天   
        Date dateNextXun = getTenDaysEnd(calToday.getTime());
        
        // 当前旬天数
        long xun_days = (dateNextXun.getTime() - dateNowXun.getTime())/(24*60*60*1000);
        
        HashMap mapDate = new HashMap();
        mapDate.put("days", intDay);
        mapDate.put("xun_days", xun_days);
        
        return mapDate;
    }
    
    /**
     * 获得生产动态数据
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getMajorDataList")
    @ResponseBody
    public List<Map> getMajorDataList(){
        
        String[] aryData;
        
        // 今日时间
        Calendar calToday = Calendar.getInstance();
        // 明日时间
        Calendar calTomorrow= Calendar.getInstance();        
        calTomorrow.add(Calendar.DATE, 1);
        // 昨日时间
        Calendar calYesterday = Calendar.getInstance();        
        calYesterday.add(Calendar.DATE, -1);
        // 前日时间
        Calendar calBeforeDay = Calendar.getInstance();        
        calBeforeDay.add(Calendar.DATE, -2);        
        
        // 上月今日时间
        Calendar calBeforeToday = Calendar.getInstance();
        calBeforeToday.add(Calendar.MONTH, -1);
        // 上月时间
        Calendar calBeforeDate = Calendar.getInstance();
        calBeforeDate.add(Calendar.MONTH, -1);
        calBeforeDate.set(Calendar.DAY_OF_MONTH, 1); 
        // 本月时间
        Calendar calNowDate = Calendar.getInstance();
        calNowDate.set(Calendar.DAY_OF_MONTH, 1); 
        // 下月时间
        Calendar calNextDate = Calendar.getInstance();        
        calNextDate.add(Calendar.MONTH, 1);
        calNextDate.set(Calendar.DAY_OF_MONTH, 1); 
        
        // 去年本月时间
        Calendar calBeforeNowDate = Calendar.getInstance();
        calBeforeNowDate.add(Calendar.YEAR, -1);
        calBeforeNowDate.set(Calendar.DAY_OF_MONTH, 1); 
        // 去年下月时间
        Calendar calBeforeNextDate = Calendar.getInstance();   
        calBeforeNextDate.add(Calendar.YEAR, -1);
        calBeforeNextDate.add(Calendar.MONTH, 1);
        calBeforeNextDate.set(Calendar.DAY_OF_MONTH, 1); 
           
        // 当前旬第一天        
        Date dateNowXun = getTenDaysStart(calToday.getTime());
        // 下一旬第一天   
        Date dateNextXun = getTenDaysEnd(calToday.getTime());
        // 上个月当前旬第一天        
        Date dateBeforeNowXun = getTenDaysStart(calBeforeToday.getTime());
        // 上个月下一旬第一天   
        Date dateBeforeNextXun = getTenDaysEnd(calBeforeToday.getTime());
        // 上个旬第一天        
        Date dateBeforeXun = getTenDaysStart(getLastTenDaysStart(dateNowXun));

        // 生产动态数据
        List<Map> lstMajorData = new ArrayList<>();
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        // 当前用户拥有组织机构
        Set<Integer> lstMajorTag = userExtInfo.getMajorTagID();
        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
                
        // 本日累计
        HashMap hmTodayCount = oilWellService.getSumData(calToday.getTime(), calTomorrow.getTime());
        // 昨日累计
        HashMap hmYesterdayCount = oilWellService.getSumMonData(calYesterday.getTime(), calToday.getTime());
        // 前日累计
        HashMap hmBeforeYesterdayCount = oilWellService.getSumMonData(calBeforeDay.getTime(), calYesterday.getTime());
        
        // 今年本月平均
        HashMap hmMonAvg = oilWellService.getAvgData(calNowDate.getTime(), calNextDate.getTime());
        // 今年本月累计
        HashMap hmMonCount = oilWellService.getSumMonData(calNowDate.getTime(), calNextDate.getTime());
        // 去年本月累计
        HashMap hmLastYearMonCount = oilWellService.getSumMonData(calBeforeNowDate.getTime(), calBeforeNextDate.getTime());
        // 今年上月累计
        HashMap hmBeforeMonCount = oilWellService.getSumMonData(calBeforeDate.getTime(), calBeforeNowDate.getTime());
        
        // 当前旬平均
        HashMap hmXunAvg = oilWellService.getAvgData(dateNowXun, dateNextXun);
        // 当前旬累计
        HashMap hmXunCount = oilWellService.getSumMonData(dateNowXun, dateNextXun);
        // 上月旬累计
        HashMap hmLastMonXunCount = oilWellService.getSumMonData(dateBeforeNowXun, dateBeforeNextXun);
        // 上一旬累计
        HashMap hmBeforeXunCount = oilWellService.getSumMonData(dateBeforeXun, dateNowXun);
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                
                HashMap map = new HashMap();
                map.put("id", endTag.getId());
                map.put("code", endTag.getCode());
                map.put("name", endTag.getName());
                map.put("type", endTag.getType());
                map.put("subtype", endTag.getSubType());
                map.put("major_tag_id",endTag.getMajorTag().getId());
                // 当日累计
                if(hmTodayCount.size() > 0 && hmTodayCount.get(endTag.getCode()) != null){
                    aryData = hmTodayCount.get(endTag.getCode()).toString().split("\\|");
                    map.put("day_count", aryData[0]);
                    map.put("day_count_liquid", aryData[1]);
                    map.put("run_status_day", aryData[2]);
                    map.put("day_count_ele", aryData[3]);
                }else{
                    map.put("day_count", 0);
                    map.put("day_count_liquid", 0);
                    map.put("run_status_day", 0);
                    map.put("day_count_ele", 0);
                }
                // 比前
                // 昨日累计
                double doubleYesterdayCount = 0;
                double doubleYesterdayCount_liquid = 0;
                double doubleRun_status_yesterday = 0;
                double doubleYesterdayCount_ele = 0;
                if(hmYesterdayCount.size() > 0 && hmYesterdayCount.get(endTag.getCode()) != null){
                    aryData = hmYesterdayCount.get(endTag.getCode()).toString().split("\\|");
                    doubleYesterdayCount = Double.parseDouble(aryData[0]);
                    doubleYesterdayCount_liquid = Double.parseDouble(aryData[1]);
                    doubleRun_status_yesterday = Double.parseDouble(aryData[2]);
                    doubleYesterdayCount_ele = Double.parseDouble(aryData[3]);
                }
                map.put("yesterday_count", doubleYesterdayCount);
                map.put("yesterday_count_liquid", doubleYesterdayCount_liquid);
                map.put("run_status_yesterday", doubleRun_status_yesterday);
                map.put("yesterday_count_ele", doubleYesterdayCount_ele);
                // 前日累计
                double doubleBeforeYesterdayCount = 0;
                double doubleBeforeYesterdayCount_liquid = 0;
                double doubleRun_status_before = 0;
                double doubleBeforeYesterdayCount_ele = 0;
                if(hmBeforeYesterdayCount.size() > 0 && hmBeforeYesterdayCount.get(endTag.getCode()) != null){
                    aryData = hmBeforeYesterdayCount.get(endTag.getCode()).toString().split("\\|");
                    doubleBeforeYesterdayCount = Double.parseDouble(aryData[0]);
                    doubleBeforeYesterdayCount_liquid = Double.parseDouble(aryData[1]);
                    doubleRun_status_before = Double.parseDouble(aryData[2]);
                    doubleBeforeYesterdayCount_ele = Double.parseDouble(aryData[3]);
                }
                map.put("before_yesterday_count", doubleBeforeYesterdayCount);
                map.put("before_yesterday_count_liquid", doubleBeforeYesterdayCount_liquid);
                map.put("run_status_before", doubleRun_status_before);
                map.put("before_yesterday_count_ele", doubleBeforeYesterdayCount_ele);
                
                map.put("before_count", doubleYesterdayCount - doubleBeforeYesterdayCount);
                map.put("before_count_liquid", doubleYesterdayCount_liquid - doubleBeforeYesterdayCount_liquid);
                map.put("before_count_ele", doubleYesterdayCount_ele - doubleBeforeYesterdayCount_ele);
                
                // 月平均
                if(hmMonAvg.size() > 0 && hmMonAvg.get(endTag.getCode()) != null){
                    aryData = hmMonAvg.get(endTag.getCode()).toString().split("\\|");
                    map.put("mon_avg", aryData[0]);
                    map.put("mon_avg_liquid", aryData[1]);
                    map.put("mon_avg_ele", aryData[3]);
                }else{
                    map.put("mon_avg", 0);
                    map.put("mon_avg_liquid", 0);
                    map.put("mon_avg_ele", 0);
                }
                
                // 月同比
                // 当月累计
                double doubleMonCount = 0;
                double doubleMonCount_liquid = 0;
                double doubleMonCount_ele = 0;
                if(hmMonCount.size() > 0 && hmMonCount.get(endTag.getCode()) != null){
                    aryData = hmMonCount.get(endTag.getCode()).toString().split("\\|");
                    doubleMonCount = Double.parseDouble(aryData[0]);
                    doubleMonCount_liquid = Double.parseDouble(aryData[1]);
                    doubleMonCount_ele = Double.parseDouble(aryData[3]);
                }
                map.put("mon_count", doubleMonCount);
                map.put("mon_count_liquid", doubleMonCount_liquid);
                map.put("mon_count_ele", doubleMonCount_ele);
                // 去年同期累计
                double doubleYearMonCount = 0;
                double doubleYearMonCount_liquid = 0;
                double doubleYearMonCount_ele = 0;
                if(hmLastYearMonCount.size() > 0 && hmLastYearMonCount.get(endTag.getCode()) != null){
                    aryData = hmLastYearMonCount.get(endTag.getCode()).toString().split("\\|");
                    doubleYearMonCount = Double.parseDouble(aryData[0]);
                    doubleYearMonCount_liquid = Double.parseDouble(aryData[1]);
                    doubleYearMonCount_ele = Double.parseDouble(aryData[3]);
                }
                map.put("lastyear_mon_count", doubleYearMonCount);
                map.put("lastyear_mon_count_liquid", doubleYearMonCount_liquid);
                map.put("lastyear_mon_count_ele", doubleYearMonCount_ele);
                if(doubleYearMonCount == 0){
                    map.put("mon_tongbi", 0);
                }else{
                    map.put("mon_tongbi", Math.round(((doubleMonCount - doubleYearMonCount) / doubleYearMonCount) * 100) / 100);
                }
                if(doubleYearMonCount_liquid == 0){
                    map.put("mon_tongbi_liquid", 0);
                }else{
                    map.put("mon_tongbi_liquid", Math.round(((doubleMonCount_liquid - doubleYearMonCount_liquid) / doubleYearMonCount_liquid) * 100) / 100);
                }
                if(doubleYearMonCount_ele == 0){
                    map.put("mon_tongbi_ele", 0);
                }else{
                    map.put("mon_tongbi_ele", Math.round(((doubleMonCount_ele - doubleYearMonCount_ele) / doubleYearMonCount_ele) * 100) / 100);
                }
                
                // 月环比
                // 上月累计
                double doubleBeforeMonCount = 0;
                double doubleBeforeMonCount_liquid = 0;
                double doubleBeforeMonCount_ele = 0;
                if(hmBeforeMonCount.size() > 0 && hmBeforeMonCount.get(endTag.getCode()) != null){
                    aryData = hmBeforeMonCount.get(endTag.getCode()).toString().split("\\|");
                    doubleBeforeMonCount = Double.parseDouble(aryData[0]);
                    doubleBeforeMonCount_liquid = Double.parseDouble(aryData[1]);
                    doubleBeforeMonCount_ele = Double.parseDouble(aryData[3]);
                }
                map.put("before_mon_count", doubleBeforeMonCount);
                map.put("before_mon_count_liquid", doubleBeforeMonCount_liquid);
                map.put("before_mon_count_ele", doubleBeforeMonCount_ele);
                if(doubleBeforeMonCount == 0){
                    map.put("mon_huanbi", 0);
                }else{
                    map.put("mon_huanbi", Math.round(((doubleMonCount - doubleBeforeMonCount) / doubleBeforeMonCount) * 100) / 100);
                }
                if(doubleBeforeMonCount_liquid == 0){
                    map.put("mon_huanbi_liquid", 0);
                }else{
                    map.put("mon_huanbi_liquid", Math.round(((doubleMonCount_liquid - doubleBeforeMonCount_liquid) / doubleBeforeMonCount_liquid) * 100) / 100);
                }
                if(doubleBeforeMonCount_ele == 0){
                    map.put("mon_huanbi_ele", 0);
                }else{
                    map.put("mon_huanbi_ele", Math.round(((doubleMonCount_ele - doubleBeforeMonCount_ele) / doubleBeforeMonCount_ele) * 100) / 100);
                }
                
                // 旬平均
                if(hmXunAvg.size() > 0 && hmXunAvg.get(endTag.getCode()) != null){
                    aryData = hmXunAvg.get(endTag.getCode()).toString().split("\\|");
                    map.put("xun_avg", aryData[0]);
                    map.put("xun_avg_liquid", aryData[1]);
                    map.put("xun_avg_ele", aryData[3]);
                }else{
                    map.put("xun_avg", 0);
                    map.put("xun_avg_liquid", 0);
                    map.put("xun_avg_ele", 0);
                }
                
                // 旬同比
                // 当旬累计
                double doubleXunCount = 0;
                double doubleXunCount_liquid = 0;
                double doubleXunCount_ele = 0;
                if(hmXunCount.size() > 0 && hmXunCount.get(endTag.getCode()) != null){
                    aryData = hmXunCount.get(endTag.getCode()).toString().split("\\|");
                    doubleXunCount = Double.parseDouble(aryData[0]);
                    doubleXunCount_liquid = Double.parseDouble(aryData[1]);
                    doubleXunCount_ele = Double.parseDouble(aryData[3]);
                }
                map.put("xun_count", doubleXunCount);
                map.put("xun_count_liquid", doubleXunCount_liquid);
                map.put("xun_count_ele", doubleXunCount_ele);
                // 上月同期累计
                double doubleLastMonXunCount = 0;
                double doubleLastMonXunCount_liquid = 0;
                double doubleLastMonXunCount_ele = 0;
                if(hmLastMonXunCount.size() > 0 && hmLastMonXunCount.get(endTag.getCode()) != null){
                    aryData = hmLastMonXunCount.get(endTag.getCode()).toString().split("\\|");
                    doubleLastMonXunCount = Double.parseDouble(aryData[0]);
                    doubleLastMonXunCount_liquid = Double.parseDouble(aryData[1]);
                    doubleLastMonXunCount_ele = Double.parseDouble(aryData[3]);
                }
                map.put("lastmon_xun_count", doubleLastMonXunCount);
                map.put("lastmon_xun_count_liquid", doubleLastMonXunCount_liquid);
                map.put("lastmon_xun_count_ele", doubleLastMonXunCount_ele);
                if(doubleLastMonXunCount == 0){
                    map.put("xun_tongbi", 0);
                }else{
                    map.put("xun_tongbi", Math.round(((doubleXunCount - doubleLastMonXunCount) / doubleLastMonXunCount) * 100) / 100);
                }
                if(doubleLastMonXunCount_liquid == 0){
                    map.put("xun_tongbi_liquid", 0);
                }else{
                    map.put("xun_tongbi_liquid", Math.round(((doubleXunCount_liquid - doubleLastMonXunCount_liquid) / doubleLastMonXunCount_liquid) * 100) / 100);
                }
                if(doubleLastMonXunCount_ele == 0){
                    map.put("xun_tongbi_ele", 0);
                }else{
                    map.put("xun_tongbi_ele", Math.round(((doubleXunCount_ele - doubleLastMonXunCount_ele) / doubleLastMonXunCount_ele) * 100) / 100);
                }
                
                // 旬环比
                // 上一旬累计
                double doubleBeforeXunCount = 0;
                double doubleBeforeXunCount_liquid = 0;
                double doubleBeforeXunCount_ele = 0;
                if(hmBeforeXunCount.size() > 0 && hmBeforeXunCount.get(endTag.getCode()) != null){
                    aryData = hmBeforeXunCount.get(endTag.getCode()).toString().split("\\|");
                    doubleBeforeXunCount = Double.parseDouble(aryData[0]);
                    doubleBeforeXunCount_liquid = Double.parseDouble(aryData[1]);
                    doubleBeforeXunCount_ele = Double.parseDouble(aryData[3]);
                }
                map.put("before_xun_count", doubleBeforeXunCount);
                map.put("before_xun_count_liquid", doubleBeforeXunCount_liquid);
                map.put("before_xun_count_ele", doubleBeforeXunCount_ele);
                if(doubleBeforeXunCount == 0){
                    map.put("xun_huanbi", 0);
                }else{
                    map.put("xun_huanbi", Math.round(((doubleXunCount - doubleBeforeXunCount) / doubleBeforeXunCount) * 100) / 100);
                }
                if(doubleBeforeXunCount_liquid == 0){
                    map.put("xun_huanbi_liquid", 0);
                }else{
                    map.put("xun_huanbi_liquid", Math.round(((doubleXunCount_liquid - doubleBeforeXunCount_liquid) / doubleBeforeXunCount_liquid) * 100) / 100);
                } 
                if(doubleBeforeXunCount_ele == 0){
                    map.put("xun_huanbi_ele", 0);
                }else{
                    map.put("xun_huanbi_ele", Math.round(((doubleXunCount_ele - doubleBeforeXunCount_ele) / doubleBeforeXunCount_ele) * 100) / 100);
                }                      
                
                lstMajorData.add(map);
            }            
        }
        
        return lstMajorData;
    }
    
    /**
	 * 指定日期所在旬的第一天
	 * 
	 * @param date
	 * @return
	 */
	private Date getTenDaysStart(Date p_date) {
        
		Calendar cdate = Calendar.getInstance();
		cdate.setTime(p_date);
		int day = cdate.get(Calendar.DAY_OF_MONTH) / 10 * 10 + 1;
		if (cdate.get(Calendar.DAY_OF_MONTH) % 10 == 0 || day == 31)
			day = day - 10;
		cdate.set(Calendar.DAY_OF_MONTH, day);
		return cdate.getTime();
	}

     /**
	 * 指定日期上一旬旬的第一天
	 * 
	 * @param date
	 * @return
	 */
	private Date getLastTenDaysStart(Date p_date) {
        
		Calendar cdate = Calendar.getInstance();
		cdate.setTime(p_date);
		int day = cdate.get(Calendar.DAY_OF_MONTH) / 10 * 10 + 1;
		if (cdate.get(Calendar.DAY_OF_MONTH) % 10 == 0 || day == 31)
			day = day - 10;
		cdate.set(Calendar.DAY_OF_MONTH, day);
        cdate.add(Calendar.DATE, -1);
		return cdate.getTime();
	}
    
	/**
	 * 指定日期所在旬的最后一天
	 * 
	 * @param date
	 * @return
	 */
	private Date getTenDaysEnd(Date p_date) {
        
        Date dateReturn;
		Calendar cdate = Calendar.getInstance();
		cdate.setTime(p_date);
		if (cdate.get(Calendar.DAY_OF_MONTH) / 10 == 2
				&& cdate.get(Calendar.DAY_OF_MONTH) != 20){
            
            cdate.add(Calendar.MONTH, 1);
            cdate.set(Calendar.DAY_OF_MONTH, 1);
            
            dateReturn = cdate.getTime();
        }else{
            
           cdate.add(Calendar.DATE, 10); 
           dateReturn = getTenDaysStart(cdate.getTime());
        }
        
        return dateReturn;
	}
}
