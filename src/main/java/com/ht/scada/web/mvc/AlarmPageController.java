package com.ht.scada.web.mvc;

import com.ht.scada.common.tag.entity.EndTag;
import com.ht.scada.common.tag.service.EndTagService;
import com.ht.scada.common.tag.util.AlarmTypeEnum;
import com.ht.scada.security.entity.User;
import com.ht.scada.security.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 报警处理Controller
 *
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/alarmpage")
public class AlarmPageController {

    private static final Logger log = LoggerFactory.getLogger(RegisterController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private EndTagService endTagService;

    /**
     * 报警信息主页面信息
     *
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String main(Model model) {

        User user = (User) userService.getCurrentUser();
        if (user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")) {
            model.addAttribute("sysmgr", 1);
        } else {
            model.addAttribute("sysmgr", 0);
        }
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        List<String> alarmTypeLists = AlarmTypeEnum.lists();

        model.addAttribute("alarmTypeLists", alarmTypeLists);
        return "alarm/bjxix";
    }

    /**
     * 报警信息显示（抽油井用）
     *
     * @param id
     * @param actionTime
     * @param model
     * @return
     */
    @RequestMapping(value = "cyj")
    public String cyj(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {

        User user = (User) userService.getCurrentUser();
        if (user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")) {
            model.addAttribute("sysmgr", 1);
        } else {
            model.addAttribute("sysmgr", 0);
        }

        EndTag endTag = endTagService.getById(id);
        model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjcmain";
    }

    /**
     * 报警信息显示（电潜泵用）
     *
     * @param id
     * @param actionTime
     * @param model
     * @return
     */
    @RequestMapping(value = "dqb")
    public String dqb(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {

        User user = (User) userService.getCurrentUser();
        if (user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")) {
            model.addAttribute("sysmgr", 1);
        } else {
            model.addAttribute("sysmgr", 0);
        }

        EndTag endTag = endTagService.getById(id);
        model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjcdqb";
    }

    /**
     * 报警信息显示（自喷井用）
     *
     * @param id
     * @param actionTime
     * @param model
     * @return
     */
    @RequestMapping(value = "zp")
    public String zp(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {

        User user = (User) userService.getCurrentUser();
        if (user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")) {
            model.addAttribute("sysmgr", 1);
        } else {
            model.addAttribute("sysmgr", 0);
        }

        EndTag endTag = endTagService.getById(id);
        model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjczp";
    }

    /**
     * 报警信息显示（焖井用）
     *
     * @param id
     * @param actionTime
     * @param model
     * @return
     */
    @RequestMapping(value = "mj")
    public String mj(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {

        User user = (User) userService.getCurrentUser();
        if (user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")) {
            model.addAttribute("sysmgr", 1);
        } else {
            model.addAttribute("sysmgr", 0);
        }

        EndTag endTag = endTagService.getById(id);
        model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjcmj";
    }

    /**
     * 报警信息显示（螺杆泵用）
     *
     * @param id
     * @param actionTime
     * @param model
     * @return
     */
    @RequestMapping(value = "lgb")
    public String lgb(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {

        User user = (User) userService.getCurrentUser();
        if (user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")) {
            model.addAttribute("sysmgr", 1);
        } else {
            model.addAttribute("sysmgr", 0);
        }

        EndTag endTag = endTagService.getById(id);
        model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjclgb";
    }

    /**
     * 报警信息显示（注气井用）
     *
     * @param id
     * @param actionTime
     * @param model
     * @return
     */
    @RequestMapping(value = "zq")
    public String zq(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {

        User user = (User) userService.getCurrentUser();
        if (user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")) {
            model.addAttribute("sysmgr", 1);
        } else {
            model.addAttribute("sysmgr", 0);
        }

        EndTag endTag = endTagService.getById(id);
        model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjczq";
    }

    /**
     * 报警信息显示（孤立井用）
     *
     * @param id
     * @param actionTime
     * @param model
     * @return
     */
    @RequestMapping(value = "glj")
    public String glj(@RequestParam("id") int id, @RequestParam("actionTime") String actionTime, Model model) {

        User user = (User) userService.getCurrentUser();
        if (user.getUserRole().getPermissions().size() > 0 && user.getUserRole().getPermissions().contains("sysmgr")) {
            model.addAttribute("sysmgr", 1);
        } else {
            model.addAttribute("sysmgr", 0);
        }

        EndTag endTag = endTagService.getById(id);
        model.addAttribute("id", id);
        model.addAttribute("info", endTag);
        model.addAttribute("actionTime", actionTime);
        model.addAttribute("name", userService.getCurrentUser().getName());
        model.addAttribute("username", userService.getCurrentUser().getUsername());
        return "alarm/ssjcglj";
    }

    /**
     * 显示功图曲线-示功图(移动端用)
     *
     * @param code
     * @param date
     * @param model
     * @return
     */
    @RequestMapping(value = "mobilesgt")
    public String mobilesgt(String code, String date, Model model) {
        model.addAttribute("code", code);
        model.addAttribute("sdate", date);
        return "gtqx/sgt";
    }

    /**
     * 显示功图曲线-电流曲线(移动端用)
     *
     * @param code
     * @param date
     * @param model
     * @return
     */
    @RequestMapping(value = "mobiledlqx")
    public String mobiledlqx(String code, String date, Model model) {
        model.addAttribute("code", code);
        model.addAttribute("sdate", date);
        return "gtqx/dlqx";
    }

    /**
     * 显示功图曲线-电功图(移动端用)
     *
     * @param code
     * @param date
     * @param model
     * @return
     */
    @RequestMapping(value = "mobiledgt")
    public String mobiledgt(String code, String date, Model model) {
        model.addAttribute("code", code);
        model.addAttribute("sdate", date);
        return "gtqx/dgt";
    }

    /**
     * 显示功图曲线-有功功率曲线(移动端用)
     *
     * @param code
     * @param date
     * @param model
     * @return
     */
    @RequestMapping(value = "mobileygglqx")
    public String mobileygglqx(String code, String date, Model model) {
        model.addAttribute("code", code);
        model.addAttribute("sdate", date);
        return "gtqx/ygglqx";
    }
}