package com.transys.dao;

import com.transys.domain.OutPut;

public interface OutPutDao {

	OutPut getOutPutDeviceStatus(OutPut paramOutPut);

	void setOutPutSend(OutPut outPut);

	void outputCancel();

}
