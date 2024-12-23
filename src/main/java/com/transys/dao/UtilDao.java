package com.transys.dao;

import com.transys.domain.Util;
import java.util.List;

public interface UtilDao {
    List<Util> utilYearList(Util util);
    List<Util> utilMonthList(Util util);
        
    List<Util> utilElectricYearList(Util util);
    List<Util> utilElectricMonthList(Util util);
}
