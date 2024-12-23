package com.transys.dao;

import com.transys.domain.PlcWrite;

public interface PlcWriteDao {

	//PLC_WRITE(창고 -> 각 설비[연속로])
	PlcWrite getPlcWriteWorkData();

	void setPlcWriteDataUpdate(PlcWrite plcWrite);

	void setPlcWriteProc(PlcWrite plcWrite);

	void setPlcWriteDataDelete(PlcWrite plcWrite);

}
