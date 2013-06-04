package com.ht.scada.data.service.testimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.ht.scada.oildata.entity.ChouYouGanShouLi;
import com.ht.scada.oildata.entity.WellDGTData;
import com.ht.scada.oildata.entity.WellData;
import com.ht.scada.oildata.service.WellService;
import org.springframework.stereotype.Service;

/**
 * @author 赵磊
 *
 */
@Service
public class WellDataServiceImpl implements WellService {

	@Override
	public List<WellData> getWellDataByWellNumAndDatetime(String wellNum,
		Date startTime, Date endTime) throws Exception {
		List<WellData> list = new ArrayList<>();
		list.add(getWellData());
		list.add(getWellData());
		list.add(getWellData());
		list.add(getWellData());
		list.add(getWellData());
		list.add(getWellData());
		list.add(getWellData());
		list.add(getWellData());
		return list;
	}

	@Override
	public WellData getWellDataByWellNumAndDatetime(String wellNum, Date time) {
		
		return getWellData();
	}

	@Override
	public WellData getLatestWellDataByWellNum(String wellNum) throws Exception {
		
		return getWellData();
	}

	@Override
	public List<ChouYouGanShouLi> getLatestCYGShouLi(String wellNum) {
		List<ChouYouGanShouLi> cygslList = new ArrayList<>();
		ChouYouGanShouLi cyg1 = new ChouYouGanShouLi();
		cyg1.setIndex("一级杆");
		cyg1.setMaxZaiHe("89.1");
		cyg1.setMinZaihe("12.1");
		
		ChouYouGanShouLi cyg2 = new ChouYouGanShouLi();
		cyg2.setIndex("儿级杆");
		cyg2.setMaxZaiHe("83.1");
		cyg2.setMinZaihe("22.1");
		
		cygslList.add(cyg1);
		cygslList.add(cyg2);
		
		return cygslList;
	}

	@Override
	public WellDGTData getLatestWellDGTDataByWellNum(String wellNum)
			throws Exception {
		WellDGTData dgt = new WellDGTData();
		dgt.setCode(wellNum);
		dgt.setWeiyi(getArray());
		dgt.setIb(getArray());
		dgt.setPower(getArray());
		dgt.setPower_factor(getArray());
		dgt.setTime(new Date());
		return dgt;
	}
	
	private WellData getWellData() {
		WellData wellData = new WellData();
		wellData.setCode("wellNum");
		
		wellData.setBengXiao(0.9f);
		wellData.setChanYeLiang(70.9f);
		wellData.setFalutDiagnoseInfo("产液量不足");
		wellData.setPingHengDu(0.98f);
		wellData.setChongCheng(4.5f);
		wellData.setChongChengTime(54.3f);
		wellData.setShangChongChengTime(24.3f);
		wellData.setXiaChongChengTime(30f);
		wellData.setChongCi(1.2f);
		wellData.setRiHaoDian(3.4f);
		wellData.setDianBiaoNum(456.3f);
		wellData.setMaxZaihe(55.4f);
		wellData.setMinZaihe(12.4f);
		wellData.setNenghaoXia(12.3f);
		wellData.setNenghaoShang(13.2f);
		
		wellData.setWeiyi(getArray());
		wellData.setZaihe(getArray());
		wellData.setTime(new Date());
		
		return wellData;
	}
	
	private float[] getArray() {
		float[] f = new  float[10];
		f[0] = 1;
		f[9] = 1;
		Random r = new Random();
		f[1] = Math.abs(r.nextInt())%10;
		f[2] = Math.abs(r.nextInt())%10;
		f[3] = Math.abs(r.nextInt())%10;
		f[4] = Math.abs(r.nextInt())%10;
		f[5] = Math.abs(r.nextInt())%10;
		f[6] = Math.abs(r.nextInt())%10;
		f[7] = Math.abs(r.nextInt())%10;
		f[8] = Math.abs(r.nextInt())%10;
		
		return f;
	}
	
}
