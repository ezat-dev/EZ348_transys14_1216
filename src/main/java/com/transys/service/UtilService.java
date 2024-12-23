package com.transys.service;

import com.transys.domain.Util;
import java.util.List;

public interface UtilService {
    List<Util> utilYearList(Util util);
    List<Util> utilMonthList(Util util);
    
    List<Util> utilElectricYearList(Util util);
    List<Util> utilElectricMonthList(Util util);
}
