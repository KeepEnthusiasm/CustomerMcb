package cn.mcb.controller;

import cn.mcb.pojo.Customer;
import cn.mcb.pojo.Notice;
import cn.mcb.service.serviceImpl.CustomerServiceImpl;
import cn.mcb.service.serviceImpl.NoticeServiceImpl;
import cn.mcb.utils.PageCustomer;
import cn.mcb.utils.PageNotice;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class NoticeController {
    @Autowired
    private NoticeServiceImpl noticeService;
    @RequestMapping("/selectNoticeList")
    @ResponseBody
    public PageNotice selectNoticeList(@RequestParam(value = "pn",defaultValue = "1") Integer pn, int limit, String cname){
        PageHelper.startPage(pn,limit);
        List<Notice> noticeList = noticeService.findAll();
        String msg="1";
        PageInfo<Notice> pageInfo = new PageInfo<Notice>(noticeList,5);
        int counts = (int)pageInfo.getTotal();
        PageNotice pageNotice = new PageNotice(msg,counts,noticeList);
        return pageNotice;
    }
    @RequestMapping(value = "selectNoticeById",method = RequestMethod.GET)
    @ResponseBody
    public Notice selectNoticeById(Integer id){
        Notice notice = noticeService.findById(id);
        return notice;
    }
    @RequestMapping("updateNotice")
    @ResponseBody
    public String updateNotice(Notice notice){
        String msg = "1";
        try {
            noticeService.update(notice);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping(value = "deletNotice")
    @ResponseBody
    public String deletNotice(Integer id){
        String msg = "1";
        try {
            noticeService.delete(id);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping("addNotice")
    @ResponseBody
    public String addNotice(Notice notice){
        String msg = "1";
        try {
            noticeService.add(notice);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping(value = "deletSelectNotice")
    @ResponseBody
    public String deletSelectNotice(String[] ids){
        Integer[] dIds = (Integer[]) ConvertUtils.convert(ids, Integer.class);
        String msg = "1";
            try {
                noticeService.deleteSelect(dIds);
                msg = "0";
            } catch (Exception e) {
                e.printStackTrace();
            }
        System.out.println();
        return msg;
    }
    @RequestMapping("/selectByNtitle")
    @ResponseBody
    public PageNotice selectByNtitle(@RequestParam(value = "pn",defaultValue = "1") Integer pn, int limit,String ntitle){
        PageHelper.startPage(pn,limit);
        List<Notice> noticeList = noticeService.findByName(ntitle);
        String msg="1";
        PageInfo<Notice> pageInfo = new PageInfo<Notice>(noticeList,5);
        int counts = (int)pageInfo.getTotal();
        PageNotice pageNotice = new PageNotice(msg,counts,noticeList);
        return pageNotice;
    }
}
