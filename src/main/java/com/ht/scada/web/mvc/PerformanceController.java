package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.service.MajorTagService;
import com.ht.scada.common.tag.util.EndTagTypeEnum;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.WellDataService;
import com.ht.scada.web.service.UserExtInfoService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/performance")
public class PerformanceController {
    
    private static final Logger log = LoggerFactory.getLogger(PerformanceController.class);
    
    @Autowired
	private UserService userService;
    @Autowired
    private MajorTagService majorTagService;
    @Autowired
	private UserExtInfoService userExtInfoService;
    @Autowired
    private EndTagService endTagService;
    @Autowired
    private WellDataService wellService;
    
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
           
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        // 当前旬第一天        
        Date dateNowXun = getTenDaysStart(calToday.getTime());
        // 下一旬第一天   
        Date dateNextXun = getTenDaysEnd(calToday.getTime());
        
        // 当前旬天数
        long xun_days = (dateNextXun.getTime() - dateNowXun.getTime())/(24*60*60*1000);
        
        HashMap mapDate = new HashMap();
        mapDate.put("days", intDay);
        mapDate.put("xun_days", xun_days);
        mapDate.put("today", formatDate.format(calToday.getTime()));
        
        return mapDate;
    }
    
    /**
     * 获得前天用显示日期
     * @return mapDate
     */
    @RequestMapping(value="getFindDateData")
    @ResponseBody
    public Map getFindDateData(String type){
        
        HashMap mapDate = new HashMap();
        
        // 今日时间
        Calendar calToday = Calendar.getInstance();
        
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        switch(type){
            // 当日
            case "1":
                mapDate.put("startDate", formatDate.format(calToday.getTime()));
                mapDate.put("endDate", formatDate.format(calToday.getTime()));
                break;
            // 当旬
            case "2":
                // 当前旬第一天        
                Date dateNowXun = getTenDaysStart(calToday.getTime());
                // 下一旬第一天   
                Date dateNextXun = getTenDaysEnd(calToday.getTime());
                calToday.setTime(dateNextXun);
                calToday.add(Calendar.DATE, -1);
                
                mapDate.put("startDate", formatDate.format(dateNowXun));
                mapDate.put("endDate", formatDate.format(calToday.getTime()));
                break;
            // 当月
            case "3":
                
                // 本月时间
                Calendar calNowMonDate = Calendar.getInstance();
                calNowMonDate.set(Calendar.DAY_OF_MONTH, 1); 
                // 下月时间
                Calendar calNextMonDate = Calendar.getInstance();        
                calNextMonDate.add(Calendar.MONTH, 1);
                calNextMonDate.set(Calendar.DAY_OF_MONTH, 1); 
                calNextMonDate.add(Calendar.DATE, -1);
                
                mapDate.put("startDate", formatDate.format(calNowMonDate.getTime()));
                mapDate.put("endDate", formatDate.format(calNextMonDate.getTime()));
                break;
            // 当年
            case "4":
                
                // 本年时间
                Calendar calNowYearDate = Calendar.getInstance();
                calNowYearDate.set(Calendar.DAY_OF_YEAR, 1); 
                // 下年时间
                Calendar calNextYearDate = Calendar.getInstance();        
                calNextYearDate.add(Calendar.YEAR, 1);
                calNextYearDate.set(Calendar.DAY_OF_YEAR, 1); 
                calNextYearDate.add(Calendar.DATE, -1);
                
                mapDate.put("startDate", formatDate.format(calNowYearDate.getTime()));
                mapDate.put("endDate", formatDate.format(calNextYearDate.getTime()));
                break;
        }        
        
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
        HashMap hmTodayCount = wellService.getSumData(calToday.getTime(), calTomorrow.getTime());
        // 昨日累计
        HashMap hmYesterdayCount = wellService.getSumMonData(calYesterday.getTime(), calToday.getTime());
        // 前日累计
        HashMap hmBeforeYesterdayCount = wellService.getSumMonData(calBeforeDay.getTime(), calYesterday.getTime());
        
        // 今年本月平均
        HashMap hmMonAvg = wellService.getAvgData(calNowDate.getTime(), calNextDate.getTime());
        // 今年本月累计
        HashMap hmMonCount = wellService.getSumMonData(calNowDate.getTime(), calNextDate.getTime());
        // 去年本月累计
        HashMap hmLastYearMonCount = wellService.getSumMonData(calBeforeNowDate.getTime(), calBeforeNextDate.getTime());
        // 今年上月累计
        HashMap hmBeforeMonCount = wellService.getSumMonData(calBeforeDate.getTime(), calBeforeNowDate.getTime());
        
        // 当前旬平均
        HashMap hmXunAvg = wellService.getAvgData(dateNowXun, dateNextXun);
        // 当前旬累计
        HashMap hmXunCount = wellService.getSumMonData(dateNowXun, dateNextXun);
        // 上月旬累计
        HashMap hmLastMonXunCount = wellService.getSumMonData(dateBeforeNowXun, dateBeforeNextXun);
        // 上一旬累计
        HashMap hmBeforeXunCount = wellService.getSumMonData(dateBeforeXun, dateNowXun);
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString()) || endTag.getType().equals(EndTagTypeEnum.SHUI_YUAN_JING.toString()) 
                || endTag.getType().equals(EndTagTypeEnum.ZHU_SHUI_ZHAN.toString()) || endTag.getType().equals(EndTagTypeEnum.ZHU_QI_ZHAN.toString())){
                
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
                    map.put("day_count_zhuqi", aryData[4]);
                    map.put("day_count_zhushui", aryData[5]);
                    map.put("run_status_day_water", aryData[6]);
                    map.put("day_count_hanshui", aryData[7]);
                }else{
                    map.put("day_count", 0);
                    map.put("day_count_liquid", 0);
                    map.put("run_status_day", 0);
                    map.put("day_count_ele", 0);
                    map.put("day_count_zhuqi", 0);
                    map.put("day_count_zhushui", 0);
                    map.put("run_status_day_water", 0);
                    map.put("day_count_hanshui", 0);
                }
                // 比前
                // 昨日累计
                double doubleYesterdayCount = 0;
                double doubleYesterdayCount_liquid = 0;
                double doubleRun_status_yesterday = 0;
                double doubleYesterdayCount_ele = 0;
                double doubleYesterdayCount_zhuqi = 0;
                double doubleYesterdayCount_zhushui = 0;
                double doubleRun_status_yesterday_water = 0;
                double doubleYesterdayCount_hanshui = 0;
                if(hmYesterdayCount.size() > 0 && hmYesterdayCount.get(endTag.getCode()) != null){
                    aryData = hmYesterdayCount.get(endTag.getCode()).toString().split("\\|");
                    doubleYesterdayCount = Double.parseDouble(aryData[0]);
                    doubleYesterdayCount_liquid = Double.parseDouble(aryData[1]);
                    doubleRun_status_yesterday = Double.parseDouble(aryData[2]);
                    doubleYesterdayCount_ele = Double.parseDouble(aryData[3]);
                    doubleYesterdayCount_zhuqi = Double.parseDouble(aryData[4]);
                    doubleYesterdayCount_zhushui = Double.parseDouble(aryData[5]);
                    doubleRun_status_yesterday_water = Double.parseDouble(aryData[6]);
                    doubleYesterdayCount_hanshui = Double.parseDouble(aryData[7]);
                }
                map.put("yesterday_count", doubleYesterdayCount);
                map.put("yesterday_count_liquid", doubleYesterdayCount_liquid);
                map.put("run_status_yesterday", doubleRun_status_yesterday);
                map.put("yesterday_count_ele", doubleYesterdayCount_ele);
                map.put("yesterday_count_zhuqi", doubleYesterdayCount_zhuqi);
                map.put("yesterday_count_zhushui", doubleYesterdayCount_zhushui);
                map.put("run_status_yesterday_water", doubleRun_status_yesterday_water);
                map.put("yesterday_count_hanshui", doubleYesterdayCount_hanshui);
                // 前日累计
                double doubleBeforeYesterdayCount = 0;
                double doubleBeforeYesterdayCount_liquid = 0;
                double doubleRun_status_before = 0;
                double doubleBeforeYesterdayCount_ele = 0;
                double doubleBeforeYesterdayCount_zhuqi = 0;
                double doubleBeforeYesterdayCount_zhushui = 0;
                double doubleRun_status_before_water = 0;
                double doubleBeforeYesterdayCount_hanshui = 0;
                if(hmBeforeYesterdayCount.size() > 0 && hmBeforeYesterdayCount.get(endTag.getCode()) != null){
                    aryData = hmBeforeYesterdayCount.get(endTag.getCode()).toString().split("\\|");
                    doubleBeforeYesterdayCount = Double.parseDouble(aryData[0]);
                    doubleBeforeYesterdayCount_liquid = Double.parseDouble(aryData[1]);
                    doubleRun_status_before = Double.parseDouble(aryData[2]);
                    doubleBeforeYesterdayCount_ele = Double.parseDouble(aryData[3]);
                    doubleBeforeYesterdayCount_zhuqi = Double.parseDouble(aryData[4]);
                    doubleBeforeYesterdayCount_zhushui = Double.parseDouble(aryData[5]);
                    doubleRun_status_before_water = Double.parseDouble(aryData[6]);
                    doubleBeforeYesterdayCount_hanshui = Double.parseDouble(aryData[7]);
                }
                map.put("before_yesterday_count", doubleBeforeYesterdayCount);
                map.put("before_yesterday_count_liquid", doubleBeforeYesterdayCount_liquid);
                map.put("run_status_before", doubleRun_status_before);
                map.put("before_yesterday_count_ele", doubleBeforeYesterdayCount_ele);
                map.put("before_yesterday_count_zhuqi", doubleBeforeYesterdayCount_zhuqi);
                map.put("before_yesterday_count_zhushui", doubleBeforeYesterdayCount_zhushui);
                map.put("run_status_before_water", doubleRun_status_before_water);
                map.put("before_yesterday_count_hanshui", doubleBeforeYesterdayCount_hanshui);
                
                map.put("before_count", doubleYesterdayCount - doubleBeforeYesterdayCount);
                map.put("before_count_liquid", doubleYesterdayCount_liquid - doubleBeforeYesterdayCount_liquid);
                map.put("before_count_ele", doubleYesterdayCount_ele - doubleBeforeYesterdayCount_ele);
                map.put("before_count_zhuqi", doubleYesterdayCount_zhuqi - doubleBeforeYesterdayCount_zhuqi);
                map.put("before_count_zhushui", doubleYesterdayCount_zhushui - doubleBeforeYesterdayCount_zhushui);
                map.put("before_count_hanshui", doubleYesterdayCount_hanshui - doubleBeforeYesterdayCount_hanshui);
                
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
                double doubleMonCount_zhuqi = 0;
                double doubleMonCount_zhushui = 0;
                double doubleMonCount_hanshui = 0;
                if(hmMonCount.size() > 0 && hmMonCount.get(endTag.getCode()) != null){
                    aryData = hmMonCount.get(endTag.getCode()).toString().split("\\|");
                    doubleMonCount = Double.parseDouble(aryData[0]);
                    doubleMonCount_liquid = Double.parseDouble(aryData[1]);
                    doubleMonCount_ele = Double.parseDouble(aryData[3]);
                    doubleMonCount_zhuqi = Double.parseDouble(aryData[4]);
                    doubleMonCount_zhushui = Double.parseDouble(aryData[5]);
                    doubleMonCount_hanshui = Double.parseDouble(aryData[7]);
                }
                map.put("mon_count", doubleMonCount);
                map.put("mon_count_liquid", doubleMonCount_liquid);
                map.put("mon_count_ele", doubleMonCount_ele);
                map.put("mon_count_zhuqi", doubleMonCount_zhuqi);
                map.put("mon_count_zhushui", doubleMonCount_zhushui);
                map.put("mon_count_hanshui", doubleMonCount_hanshui);
                // 去年同期累计
                double doubleYearMonCount = 0;
                double doubleYearMonCount_liquid = 0;
                double doubleYearMonCount_ele = 0;
                double doubleYearMonCount_zhuqi = 0;
                double doubleYearMonCount_zhushui = 0;
                double doubleYearMonCount_hanshui = 0;
                if(hmLastYearMonCount.size() > 0 && hmLastYearMonCount.get(endTag.getCode()) != null){
                    aryData = hmLastYearMonCount.get(endTag.getCode()).toString().split("\\|");
                    doubleYearMonCount = Double.parseDouble(aryData[0]);
                    doubleYearMonCount_liquid = Double.parseDouble(aryData[1]);
                    doubleYearMonCount_ele = Double.parseDouble(aryData[3]);
                    doubleYearMonCount_zhuqi = Double.parseDouble(aryData[4]);
                    doubleYearMonCount_zhushui = Double.parseDouble(aryData[5]);
                    doubleYearMonCount_hanshui = Double.parseDouble(aryData[7]);
                }
                map.put("lastyear_mon_count", doubleYearMonCount);
                map.put("lastyear_mon_count_liquid", doubleYearMonCount_liquid);
                map.put("lastyear_mon_count_ele", doubleYearMonCount_ele);
                map.put("lastyear_mon_count_zhuqi", doubleYearMonCount_zhuqi);
                map.put("lastyear_mon_count_zhushui", doubleYearMonCount_zhushui);
                map.put("lastyear_mon_count_hanshui", doubleYearMonCount_hanshui);
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
                double doubleBeforeMonCount_zhuqi = 0;
                double doubleBeforeMonCount_zhushui = 0;
                double doubleBeforeMonCount_hanshui = 0;
                if(hmBeforeMonCount.size() > 0 && hmBeforeMonCount.get(endTag.getCode()) != null){
                    aryData = hmBeforeMonCount.get(endTag.getCode()).toString().split("\\|");
                    doubleBeforeMonCount = Double.parseDouble(aryData[0]);
                    doubleBeforeMonCount_liquid = Double.parseDouble(aryData[1]);
                    doubleBeforeMonCount_ele = Double.parseDouble(aryData[3]);
                    doubleBeforeMonCount_zhuqi = Double.parseDouble(aryData[4]);
                    doubleBeforeMonCount_zhushui = Double.parseDouble(aryData[5]);
                    doubleBeforeMonCount_hanshui = Double.parseDouble(aryData[7]);
                }
                map.put("before_mon_count", doubleBeforeMonCount);
                map.put("before_mon_count_liquid", doubleBeforeMonCount_liquid);
                map.put("before_mon_count_ele", doubleBeforeMonCount_ele);
                map.put("before_mon_count_zhuqi", doubleBeforeMonCount_zhuqi);
                map.put("before_mon_count_zhushui", doubleBeforeMonCount_zhushui);
                map.put("before_mon_count_hanshui", doubleBeforeMonCount_hanshui);
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
                double doubleXunCount_zhuqi = 0;
                double doubleXunCount_zhushui = 0;
                double doubleXunCount_hanshui = 0;
                if(hmXunCount.size() > 0 && hmXunCount.get(endTag.getCode()) != null){
                    aryData = hmXunCount.get(endTag.getCode()).toString().split("\\|");
                    doubleXunCount = Double.parseDouble(aryData[0]);
                    doubleXunCount_liquid = Double.parseDouble(aryData[1]);
                    doubleXunCount_ele = Double.parseDouble(aryData[3]);
                    doubleXunCount_zhuqi = Double.parseDouble(aryData[4]);
                    doubleXunCount_zhushui = Double.parseDouble(aryData[5]);
                    doubleXunCount_hanshui = Double.parseDouble(aryData[7]);
                }
                map.put("xun_count", doubleXunCount);
                map.put("xun_count_liquid", doubleXunCount_liquid);
                map.put("xun_count_ele", doubleXunCount_ele);
                map.put("xun_count_zhuqi", doubleXunCount_zhuqi);
                map.put("xun_count_zhushui", doubleXunCount_zhushui);
                map.put("xun_count_hanshui", doubleXunCount_hanshui);
                // 上月同期累计
                double doubleLastMonXunCount = 0;
                double doubleLastMonXunCount_liquid = 0;
                double doubleLastMonXunCount_ele = 0;
                double doubleLastMonXunCount_zhuqi = 0;
                double doubleLastMonXunCount_zhushui = 0;
                double doubleLastMonXunCount_hanshui = 0;
                if(hmLastMonXunCount.size() > 0 && hmLastMonXunCount.get(endTag.getCode()) != null){
                    aryData = hmLastMonXunCount.get(endTag.getCode()).toString().split("\\|");
                    doubleLastMonXunCount = Double.parseDouble(aryData[0]);
                    doubleLastMonXunCount_liquid = Double.parseDouble(aryData[1]);
                    doubleLastMonXunCount_ele = Double.parseDouble(aryData[3]);
                    doubleLastMonXunCount_zhuqi = Double.parseDouble(aryData[4]);
                    doubleLastMonXunCount_zhushui = Double.parseDouble(aryData[5]);
                    doubleLastMonXunCount_hanshui = Double.parseDouble(aryData[7]);
                }
                map.put("lastmon_xun_count", doubleLastMonXunCount);
                map.put("lastmon_xun_count_liquid", doubleLastMonXunCount_liquid);
                map.put("lastmon_xun_count_ele", doubleLastMonXunCount_ele);
                map.put("lastmon_xun_count_zhuqi", doubleLastMonXunCount_zhuqi);
                map.put("lastmon_xun_count_zhushui", doubleLastMonXunCount_zhushui);
                map.put("lastmon_xun_count_hanshui", doubleLastMonXunCount_hanshui);
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
                double doubleBeforeXunCount_zhuqi = 0;
                double doubleBeforeXunCount_zhushui = 0;
                double doubleBeforeXunCount_hanshui = 0;
                if(hmBeforeXunCount.size() > 0 && hmBeforeXunCount.get(endTag.getCode()) != null){
                    aryData = hmBeforeXunCount.get(endTag.getCode()).toString().split("\\|");
                    doubleBeforeXunCount = Double.parseDouble(aryData[0]);
                    doubleBeforeXunCount_liquid = Double.parseDouble(aryData[1]);
                    doubleBeforeXunCount_ele = Double.parseDouble(aryData[3]);
                    doubleBeforeXunCount_zhuqi = Double.parseDouble(aryData[4]);
                    doubleBeforeXunCount_zhushui = Double.parseDouble(aryData[5]);
                    doubleBeforeXunCount_hanshui = Double.parseDouble(aryData[7]);
                }
                map.put("before_xun_count", doubleBeforeXunCount);
                map.put("before_xun_count_liquid", doubleBeforeXunCount_liquid);
                map.put("before_xun_count_ele", doubleBeforeXunCount_ele);
                map.put("before_xun_count_zhuqi", doubleBeforeXunCount_zhuqi);
                map.put("before_xun_count_zhushui", doubleBeforeXunCount_zhushui);
                map.put("before_xun_count_hanshui", doubleBeforeXunCount_hanshui);
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
     * 获得生产动态数据(产油量)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList")
    @ResponseBody
    public List<Map> getOilProductDataList(String code, String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;
        
        String[] aryData;
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", dataTmp[2]);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
    }
    
    /**
     * 获得生产动态数据(产液量)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList_liquid")
    @ResponseBody
    public List<Map> getOilProductDataList_liquid(String code, String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData_liquid(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData_liquid(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", dataTmp[2]);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
    }
    
    /**
     * 获得生产动态数据(油井开井数)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList_kjs")
    @ResponseBody
    public List<Map> getOilProductDataList_kjs(String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData_kjs(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData_kjs(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", Integer.valueOf(dataTmp[2].toString())>0 ? 1 : 0);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
    }

    /**
     * 获得生产动态数据(油井用电量)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList_ydl")
    @ResponseBody
    public List<Map> getOilProductDataList_ydl(String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData_ydl(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData_ydl(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", dataTmp[2]);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
    }
    
    /**
     * 获得生产动态数据(油井注气量)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList_zql")
    @ResponseBody
    public List<Map> getOilProductDataList_zql(String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData_zql(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData_zql(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", dataTmp[2]);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
    }
    
    /**
     * 获得生产动态数据(注水站注水量)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList_zsl")
    @ResponseBody
    public List<Map> getOilProductDataList_zsl(String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData_zsl(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData_zsl(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.ZHU_SHUI_ZHAN.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", dataTmp[2]);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
    }
    
    /**
     * 获得生产动态数据(水井开井数)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList_sjkjs")
    @ResponseBody
    public List<Map> getOilProductDataList_sjkjs(String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData_sjkjs(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData_sjkjs(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.SHUI_YUAN_JING.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", Integer.valueOf(dataTmp[2].toString())>0 ? 1 : 0);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
    }

    /**
     * 获得生产动态数据(总用电量)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList_zydl")
    @ResponseBody
    public List<Map> getOilProductDataList_zydl(String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData_zydl(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData_zydl(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString()) || endTag.getType().equals(EndTagTypeEnum.SHUI_YUAN_JING.toString()) 
                || endTag.getType().equals(EndTagTypeEnum.ZHU_SHUI_ZHAN.toString()) || endTag.getType().equals(EndTagTypeEnum.ZHU_QI_ZHAN.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", dataTmp[2]);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
    }

    /**
     * 获得生产动态数据(油井含水量)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList_hsl")
    @ResponseBody
    public List<Map> getOilProductDataList_hsl(String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData_hsl(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData_hsl(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", dataTmp[2]);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
    }

     /**
     * 获得生产动态数据(油井总井数)
     * @return lstMajorData（生产动态数据)
     */
    @RequestMapping(value="getOilProductDataList_zjs")
    @ResponseBody
    public List<Map> getOilProductDataList_zjs(String startDate, String endDate){
        
        // 搜索开始时间
        Date dateStart;
        // 搜索截至时间
        Date dateEnd;

        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");
        
        Calendar calEnd= Calendar.getInstance(); 
        
        // 生产动态数据
        List<Map> lstOilProductData = new ArrayList<>();
        
        try {
            dateStart = formatDate.parse(startDate);
            dateEnd = formatDate.parse(endDate);
            
            calEnd.setTime(dateEnd);
            calEnd.add(Calendar.DATE, 1);
        } catch (ParseException ex) {
            log.debug(ex.getMessage());
            return lstOilProductData;
        }
        
        // 当前用户基本信息
        User user = userService.getCurrentUser();
        // 当前用户扩展信息
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());

        // 当前用户拥有井
        Set<Integer> lstEndTag = userExtInfo.getEndTagID();
        
        // 累计数据
        List lstDataCount = null; 
        if(startDate.equals(endDate)){
            formatDate = null;
            lstDataCount = wellService.getHourLineData_zjs(dateStart, calEnd.getTime());
        }else{
            lstDataCount = wellService.getLineData_zjs(dateStart, calEnd.getTime());
        }
                
        // 遍历井数据
        for(int intLoop : lstEndTag){
                    
            EndTag endTag = endTagService.getById(intLoop);
            if(endTag.getType().equals(EndTagTypeEnum.YOU_JING.toString())){
                
                for(Object loopItem : lstDataCount){
                    
                    Object[] dataTmp = (Object[])loopItem;
                    if(endTag.getCode().equals(dataTmp[0])){
                        
                        HashMap map = new HashMap();
                        map.put("id", endTag.getId());
                        map.put("code", endTag.getCode());
                        map.put("name", endTag.getName());
                        map.put("type", endTag.getType());
                        map.put("subtype", endTag.getSubType());
                        map.put("major_tag_id",endTag.getMajorTag().getId());

                        map.put("date", formatDate == null ? dataTmp[1] : formatDate.format(dataTmp[1]));
                        map.put("day_count", Integer.valueOf(dataTmp[2].toString())>0 ? 1 : 0);
                        
                        lstOilProductData.add(map);
                    }                    
                } 
            }            
        }
        
        return lstOilProductData;
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
