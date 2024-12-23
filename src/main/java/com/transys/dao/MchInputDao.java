package com.transys.dao;

import com.transys.domain.MchInput;

public interface MchInputDao {
	
	//MCH_INPUT(각 설비[공통로] -> 창고)
	MchInput getMchInputDataSelectWorkInline(MchInput mchInput);

	void setMchDataInsertInputTab(MchInput mchInput);

	void setMchDataUpdateWaitList(MchInput mchInput);

	void setMchDataUpdateSiljuk(MchInput mchInput);

	void setMchDataDeleteWorkInline(MchInput mchInput);

	void setMchDataInsertInputTabFail(MchInput mchInput);

	void setMchDataUpdateSiljukFail(MchInput mchInput);

	void setMchDataDeleteWorkInlineFail(MchInput mchInput);

}
