package cn.mcb.test;

import cn.mcb.pojo.Customer;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContextSpring.xml","classpath:springmvc.xml"})
public class testSpringMVC {
    MockMvc mockMvc;
    @Autowired
    WebApplicationContext context;
    @Before
    public  void init(){
       mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    public void testPage() throws Exception{
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/customer/selectList").param("pn", "1")).andReturn();
        PageInfo pageInfo = (PageInfo) mvcResult.getRequest().getAttribute("pageInfo");
        System.out.println("当前页码"+pageInfo.getPageNum());
        System.out.println("总页码"+pageInfo.getPages());
        System.out.println("总记录数"+pageInfo.getTotal());
        System.out.println("连续显示的页码");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int i:nums
             ) {
            System.out.println(i);
        }
        //获取员工数据；
        List<Customer> list = pageInfo.getList();
        for (Customer customer:list){
            System.out.println(customer);
        }

    }
}
