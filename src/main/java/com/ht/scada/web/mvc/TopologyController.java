package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.entity.MajorTag;
import com.ht.scada.common.tag.service.AcquisitionChannelService;
import com.ht.scada.common.tag.service.AcquisitionDeviceService;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.service.MajorTagService;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import com.ht.scada.web.entity.UserExtInfo;
import com.ht.scada.web.service.UserExtInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: 陈志强
 * Date: 13-9-30
 * Time: 下午3:02
 */
@Controller
@RequestMapping(value = "/topology")
public class TopologyController {
    @Autowired
    private MajorTagService majorTagService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserExtInfoService userExtInfoService;
    @Autowired
    private EndTagService endTagService;

    @RequestMapping(value = "realDataList")
    @ResponseBody
    public List<Map> realDataList(){
        User user = userService.getCurrentUser();
        UserExtInfo userExtInfo = userExtInfoService.findUserExtInfoByUserID(user.getId());
        Set<Integer> set = userExtInfo.getMajorTagID();
        List<Map> list = new ArrayList<>();
        for(int id : set){
            MajorTag majorTag = majorTagService.getById(id);
            HashMap map = new HashMap();
            map.put("id", majorTag.getId());
            map.put("name", majorTag.getName());
            map.put("type", majorTag.getType());

            List<EndTag> endTagList = endTagService.getEndTagByMajorTagId(majorTag.getId());
            map.put("endTagList", endTagList);
//            System.out.println(endTagList);

            MajorTag ptag = majorTag.getParent();
            if(ptag == null){
                map.put("pid", 0);
            }else{
                map.put("pid",ptag.getId());
            }

            list.add(map);
        }
        return list;
    }

    @RequestMapping(value = "dataList")
    @ResponseBody
    public Map list(Model model) {

        //  Node 数据
        List<Map> nodeList = new ArrayList<Map>();
        //
        Map listMap = new HashMap();
        for (int i = 1; i <= 19; i++) {
            Map map = new HashMap();
            /**
             * id、name、nodeColor是节点基本属性
             */
            map.put("id", i);
            map.put("name", "A" + i);
            map.put("nodeColor", "0x0099FF");
            /*拓展属性*/
            map.put("desc", "节点描述信息：第" + i + "个节点");
            map.put("nodeSize", "32");
            map.put("nodeClass", "earth");
            nodeList.add(map);
        }

        listMap.put("Node", nodeList);

        // Edge 数据
        List<Map> edgeList = new ArrayList<Map>();

        Map map1 = new HashMap();
       /* fromID、toID、color*/
        map1.put("fromID", 1);  // 起始节点
        map1.put("toID", 2); // 结束节点
        map1.put("color", "0x00BFFF"); // 连接线颜色
        map1.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map1);

        Map map2 = new HashMap();
       /* fromID、toID、color*/
        map2.put("fromID", 1);  // 起始节点
        map2.put("toID", 3); // 结束节点
        map2.put("color", "0x00BFFF"); // 连接线颜色
        map2.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map2);

        Map map3 = new HashMap();
       /* fromID、toID、color*/
        map3.put("fromID", 1);  // 起始节点
        map3.put("toID", 4); // 结束节点
        map3.put("color", "0x00BFFF"); // 连接线颜色
        map3.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map3);

        Map map4 = new HashMap();
       /* fromID、toID、color*/
        map4.put("fromID", 2);  // 起始节点
        map4.put("toID", 5); // 结束节点
        map4.put("color", "0x00BFFF"); // 连接线颜色
        map4.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map4);

        Map map5 = new HashMap();
       /* fromID、toID、color*/
        map5.put("fromID", 2);  // 起始节点
        map5.put("toID", 6); // 结束节点
        map5.put("color", "0x00BFFF"); // 连接线颜色
        map5.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map5);

        Map map6 = new HashMap();
       /* fromID、toID、color*/
        map6.put("fromID", 2);  // 起始节点
        map6.put("toID", 7); // 结束节点
        map6.put("color", "0x00BFFF"); // 连接线颜色
        map6.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map6);

        Map map7 = new HashMap();
       /* fromID、toID、color*/
        map7.put("fromID", 5);  // 起始节点
        map7.put("toID", 8); // 结束节点
        map7.put("color", "0x00BFFF"); // 连接线颜色
        map7.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map7);

        Map map8 = new HashMap();
       /* fromID、toID、color*/
        map8.put("fromID", 8);  // 起始节点
        map8.put("toID", 9); // 结束节点
        map8.put("color", "0x00BFFF"); // 连接线颜色
        map8.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map8);

        Map map9 = new HashMap();
       /* fromID、toID、color*/
        map9.put("fromID", 3);  // 起始节点
        map9.put("toID", 10); // 结束节点
        map9.put("color", "0x00BFFF"); // 连接线颜色
        map9.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map9);

        Map map10 = new HashMap();
       /* fromID、toID、color*/
        map10.put("fromID", 3);  // 起始节点
        map10.put("toID", 11); // 结束节点
        map10.put("color", "0x00BFFF"); // 连接线颜色
        map10.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map10);

        Map map11 = new HashMap();
       /* fromID、toID、color*/
        map11.put("fromID", 11);  // 起始节点
        map11.put("toID", 12); // 结束节点
        map11.put("color", "0xFF0000"); // 连接线颜色
        map11.put("edgeLabel", "Bad"); // 连接线描述信息
        edgeList.add(map11);

        Map map12 = new HashMap();
       /* fromID、toID、color*/
        map12.put("fromID", 12);  // 起始节点
        map12.put("toID", 13); // 结束节点
        map12.put("color", "0x00BFFF"); // 连接线颜色
        map12.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map12);

        Map map13 = new HashMap();
       /* fromID、toID、color*/
        map13.put("fromID", 12);  // 起始节点
        map13.put("toID", 14); // 结束节点
        map13.put("color", "0x00BFFF"); // 连接线颜色
        map13.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map13);

        Map map14 = new HashMap();
       /* fromID、toID、color*/
        map14.put("fromID", 12);  // 起始节点
        map14.put("toID", 15); // 结束节点
        map14.put("color", "0x00BFFF"); // 连接线颜色
        map14.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map14);

        Map map15 = new HashMap();
       /* fromID、toID、color*/
        map15.put("fromID", 4);  // 起始节点
        map15.put("toID", 16); // 结束节点
        map15.put("color", "0x00BFFF"); // 连接线颜色
        map15.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map15);

        Map map16 = new HashMap();
       /* fromID、toID、color*/
        map16.put("fromID", 16);  // 起始节点
        map16.put("toID", 17); // 结束节点
        map16.put("color", "0x00BFFF"); // 连接线颜色
        map16.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map16);

        Map map17 = new HashMap();
       /* fromID、toID、color*/
        map17.put("fromID", 16);  // 起始节点
        map17.put("toID", 18); // 结束节点
        map17.put("color", "0x00BFFF"); // 连接线颜色
        map17.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map17);

        Map map18 = new HashMap();
       /* fromID、toID、color*/
        map18.put("fromID", 18);  // 起始节点
        map18.put("toID", 19); // 结束节点
        map18.put("color", "0x00BFFF"); // 连接线颜色
        map18.put("edgeLabel", "Good"); // 连接线描述信息
        edgeList.add(map18);

        listMap.put("Edge", edgeList);

        Map returnMap = new HashMap();
        returnMap.put("Graph", listMap);

        return returnMap;
    }
}
