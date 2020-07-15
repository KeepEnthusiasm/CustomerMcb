package cn.mcb.service.serviceImpl;

import cn.mcb.dao.ICustomerDao;
import cn.mcb.pojo.Customer;
import cn.mcb.service.ICustomerService;
import cn.mcb.utils.CustomerPlus;
import cn.mcb.utils.ImportExcelUtils;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

@Service("customerServiceImpl")
public class CustomerServiceImpl implements ICustomerService {
    @Autowired
    private ICustomerDao customerDao;
    @Autowired
    ImportExcelUtils importExcelUtils;
    @Override
    public List<Customer> findAll() {
        return customerDao.findAll();
    }

    @Override
    public void add(Customer customer) {
        customerDao.add(customer);
    }

    @Override
    public void update(Customer customer) {
        customerDao.update(customer);
    }

    @Override
    public void delete(int id) {
        customerDao.delete(id);
    }

    @Override
    public Customer findById(int id) {
        return customerDao.findById(id);
    }

    @Override
    public void deleteSelect(Integer[] ids) {
        customerDao.deleteSelect(ids);
    }

    @Override
    public List<Customer> findByName(String cname) {
       return customerDao.findByName(cname);
    }

    @Override
    public List<Customer> findByCondition(String text, String selectCondition) {
        switch(selectCondition){
            case "姓名" :
                return this.findByName(text);
            case "ID" :
                int Id = Integer.parseInt(text);
                Customer customer = this.findById(Id);
                List<Customer> listById= new ArrayList<Customer>();
                listById.add(customer);
                return listById;
            case "年龄" :
                int age = Integer.parseInt(text);
                return customerDao.findByAge(age);
            case "级别" :
                return customerDao.findByLevel(text);
            case "地址" :
                return customerDao.findByAddress(text);
            case "手机号" :
                return customerDao.findByphone(text);
            case "创建日期" :
                return customerDao.findBycreattime(text);
            case "" :
                return new ArrayList<Customer>();
        }
        return null;
    }

    @Override
    public String importExcel(MultipartFile file) {

        String msg="0";
        try {
            List<Customer> listByExcel = importExcelUtils.getListByExcel(file);
            customerDao.addCusList(listByExcel);
            msg="1";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }

    @Override
    public List<Customer> findByConditionForNew(HttpServletRequest httpServletRequest) {
        String cname = httpServletRequest.getParameter("cname");
        String cageRequest="0";
        if (httpServletRequest.getParameter("cage") !=""){
            cageRequest = httpServletRequest.getParameter("cage");
        }
        int cage=0;
        if (cageRequest!="" ){
            cage=Integer.parseInt(cageRequest);
        }
        String cgender = httpServletRequest.getParameter("cgender");
        String clevel = httpServletRequest.getParameter("clevel");
        String caddress = httpServletRequest.getParameter("caddress");
        String cphone = httpServletRequest.getParameter("cphone");
        String ccreattimeBegin = httpServletRequest.getParameter("ccreattimeBegin");
        String ccreattimeEnd = httpServletRequest.getParameter("ccreattimeEnd");
        String cemail = httpServletRequest.getParameter("cemail");
        HashMap<String,Object> map = new HashMap<>();
        map.put("cname",cname);
        map.put("cage",cage);
        map.put("cgender",cgender);
        map.put("clevel",clevel);
        map.put("caddress",caddress);
        map.put("cphone",cphone);
        map.put("ccreattimeBegin",ccreattimeBegin);
        map.put("ccreattimeEnd",ccreattimeEnd);
        map.put("cemail",cemail);
        return  customerDao.findByConditionForNew(map);
    }

    @Override
    public Map selectDataCounts() {
        HashMap<Object, Object> map = new HashMap<>();
        int userCounts = customerDao.selectUserCounts();
        int customerCounts = customerDao.selectCustomerCounts();
        int noticeCounts = customerDao.selectNoticeCounts();
        int cusDayConuts =  customerDao.selectcusDayConuts();
        int cusWeekConuts = customerDao.selectcusWeekConuts();
        int cusMonthConuts = customerDao.selectcusMonthConuts();
        int cusYearConuts =  customerDao.selectcusYearConuts();
        map.put("customerCounts",customerCounts);
        map.put("userCounts",userCounts);
        map.put("noticeCounts",noticeCounts);
        map.put("cusDayConuts",cusDayConuts);
        map.put("cusWeekConuts",cusWeekConuts);
        map.put("cusMonthConuts",cusMonthConuts);
        map.put("cusYearConuts",cusYearConuts);
        return map;
    }
    public Map selectCgenderAllCounts(){
        Map<String, Object> map = new HashMap<>();
        String manNum="0";
        String womanNum="0";
        List<Map> resultList = customerDao.selectCgenderAllCounts();
        for (Map resultMap:resultList){
            if ("男".equals(resultMap.get("cgender").toString())){
                manNum=resultMap.get("cgendercounts").toString();
                map.put("man",manNum);
            }else {
                womanNum=resultMap.get("cgendercounts").toString();
                map.put("woman",womanNum);
            }
        }
        return map;
    }

    @Override
    public Map selectClevelAllCounts() {
        Map<String, Object> map = new HashMap<>();
        String clevelName="";
        String clevelNum="";
        List<Map> resultList = customerDao.selectClevelAllCounts();
        for (Map resultMap:resultList){
            clevelName= resultMap.get("clevel").toString();
            clevelNum=resultMap.get("clevelcounts").toString();
            map.put(clevelName,clevelNum);
        }
        return map;
    }

    @Override
    public Map selectWeekEveryDayCounts() {
        Map<String, Object> map = new HashMap<>();
        List<Map> normalList = customerDao.selectWeekEveryDayCountsForNormal();
        int i=1;
        for (Map resultMap:normalList){
            map.put("normalDay"+i,resultMap.get("cuscounts").toString());
            i++;
        }
        List<Map> goldList = customerDao.selectWeekEveryDayCountsForGold();
        int j=1;
        for (Map resultMap:goldList){
            map.put("goldDay"+j,resultMap.get("cuscounts").toString());
            j++;
        }
        List<Map> diamondList = customerDao.selectWeekEveryDayCountsForDiamond();
        int k=1;
        for (Map resultMap:diamondList){
            map.put("diamondDay"+k,resultMap.get("cuscounts").toString());
            k++;
        }
        List<Map> topList = customerDao.selectWeekEveryDayCountsForTop();
        int n=1;
        for (Map resultMap:topList){
            map.put("topDay"+n,resultMap.get("cuscounts").toString());
            n++;
        }
        return map;

    }
}
