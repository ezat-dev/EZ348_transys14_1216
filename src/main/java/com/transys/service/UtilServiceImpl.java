package com.transys.service;

import com.transys.dao.UtilDao;
import com.transys.domain.Util;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UtilServiceImpl implements UtilService {

    @Autowired
    private UtilDao utilDao;

    @Override
    public List<Util> utilYearList(Util util) {
        return utilDao.utilYearList(util);
    }
    @Override
    public List<Util> utilMonthList(Util util) {
        return utilDao.utilMonthList(util);
    }
    
    @Override
    public List<Util> utilElectricYearList(Util util) {
        return utilDao.utilElectricYearList(util);
    }
    @Override
    public List<Util> utilElectricMonthList(Util util) {
        return utilDao.utilElectricMonthList(util);
    }
}
