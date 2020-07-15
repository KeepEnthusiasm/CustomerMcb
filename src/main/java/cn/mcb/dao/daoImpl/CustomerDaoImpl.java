package cn.mcb.dao.daoImpl;

import cn.mcb.dao.ICustomerDao;
import cn.mcb.pojo.Customer;
import cn.mcb.service.ICustomerService;
import cn.mcb.utils.CustomerPlus;

import java.util.List;
import java.util.Map;

public class CustomerDaoImpl implements ICustomerDao {
    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public List<Customer> findAll() {
        return null;
    }

    @Override
    public void add(Customer customer) {

    }

    @Override
    public void update(Customer customer) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void deleteSelect(Integer[] ids) {

    }

    @Override
    public List<Customer> findByName(String cname) {
        return null;
    }

    @Override
    public void addCusList(List<Customer> customers) {

    }

    @Override
    public List<Customer> findByAge(int cage) {
        return null;
    }

    @Override
    public List<Customer> findByLevel(String clevel) {
        return null;
    }

    @Override
    public List<Customer> findByAddress(String caddress) {
        return null;
    }

    @Override
    public List<Customer> findByphone(String cphone) {
        return null;
    }

    @Override
    public List<Customer> findBycreattime(String ccreattime) {
        return null;
    }

    @Override
    public List<Customer> findByConditionForNew(Map map) {
        return null;
    }

    @Override
    public int selectUserCounts() {
        return 0;
    }

    @Override
    public int selectCustomerCounts() {
        return 0;
    }

    @Override
    public int selectNoticeCounts() {
        return 0;
    }

    @Override
    public int selectcusDayConuts() {
        return 0;
    }

    @Override
    public int selectcusWeekConuts() {
        return 0;
    }

    @Override
    public int selectcusMonthConuts() {
        return 0;
    }

    @Override
    public int selectcusYearConuts() {
        return 0;
    }

    @Override
    public List<Map> selectClevelAllCounts() {
        return null;
    }

    @Override
    public List<Map> selectCgenderAllCounts() {
        return null;
    }

    @Override
    public List<Map> selectWeekEveryDayCountsForNormal() {
        return null;
    }

    @Override
    public List<Map> selectWeekEveryDayCountsForGold() {
        return null;
    }

    @Override
    public List<Map> selectWeekEveryDayCountsForDiamond() {
        return null;
    }

    @Override
    public List<Map> selectWeekEveryDayCountsForTop() {
        return null;
    }
}
