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
		cyg2.setIndex("二级杆");
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
		dgt.setWeiyi(getWeiYi());
		dgt.setIb(getIb());
		dgt.setPower(getPower());
		dgt.setPower_factor(getPower());
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
		
		wellData.setWeiyi(getWeiYi());
		wellData.setZaihe(getZaiHe());
		wellData.setTime(new Date());
		
		return wellData;
	}
	
//	private float[] getArray() {
//		float[] f = new  float[10];
//		f[0] = 1;
//		f[9] = 1;
//		Random r = new Random();
//		f[1] = Math.abs(r.nextInt())%10;
//		f[2] = Math.abs(r.nextInt())%10;
//		f[3] = Math.abs(r.nextInt())%10;
//		f[4] = Math.abs(r.nextInt())%10;
//		f[5] = Math.abs(r.nextInt())%10;
//		f[6] = Math.abs(r.nextInt())%10;
//		f[7] = Math.abs(r.nextInt())%10;
//		f[8] = Math.abs(r.nextInt())%10;
//		
//		return f;
//	}

    @Override
    public WellDGTData geWellDGTDataByWellNumAndDatetime(String wellNum, Date time) {
        		WellDGTData dgt = new WellDGTData();
		dgt.setCode(wellNum);
		dgt.setWeiyi(getWeiYi());
		dgt.setIb(getIb());
		dgt.setPower(getPower());
		dgt.setPower_factor(getPower());
		dgt.setTime(new Date());
		return dgt;
    }
    
    private float[] getWeiYi() {
    	float[] weiyi = {0.035F,0.016F,0.000F,0.000F,0.013F,0.032F,0.067F,0.115F,0.169F,0.232F,0.296F,0.356F,0.416F,0.477F,0.547F,0.616F,0.680F,0.740F,0.801F,0.861F,0.924F,0.991F,1.058F,1.118F,1.175F,1.239F,1.306F,1.375F,1.439F,1.506F,1.563F,1.620F,1.683F,1.756F,1.820F,1.880F,1.941F,1.998F,2.058F,2.128F,2.198F,2.258F,2.325F,2.385F,2.446F,2.512F,2.576F,2.639F,2.706F,2.763F,2.823F,2.887F,2.951F,3.024F,3.087F,3.141F,3.201F,3.268F,3.335F,3.401F,3.474F,3.532F,3.589F,3.649F,3.713F,3.779F,3.846F,3.906F,3.967F,4.030F,4.091F,4.160F,4.230F,4.287F,4.348F,4.411F,4.472F,4.538F,4.608F,4.672F,4.729F,4.786F,4.850F,4.916F,4.983F,5.050F,5.110F,5.167F,5.231F,5.297F,5.367F,5.434F,5.497F,5.551F,5.612F,5.678F,5.745F,5.805F,5.863F,5.913F,5.958F,5.990F,6.015F,6.028F,6.034F,6.034F,6.018F,5.990F,5.958F,5.920F,5.866F,5.812F,5.755F,5.685F,5.631F,5.567F,5.516F,5.453F,5.386F,5.320F,5.256F,5.196F,5.132F,5.075F,5.011F,4.945F,4.881F,4.818F,4.757F,4.707F,4.634F,4.576F,4.503F,4.446F,4.389F,4.332F,4.268F,4.205F,4.135F,4.072F,4.018F,3.957F,3.894F,3.830F,3.770F,3.700F,3.640F,3.582F,3.522F,3.462F,3.398F,3.328F,3.265F,3.205F,3.144F,3.084F,3.020F,2.957F,2.890F,2.827F,2.773F,2.706F,2.642F,2.585F,2.515F,2.458F,2.398F,2.341F,2.274F,2.211F,2.138F,2.077F,2.020F,1.960F,1.903F,1.839F,1.776F,1.706F,1.645F,1.591F,1.531F,1.471F,1.401F,1.334F,1.271F,1.213F,1.153F,1.090F,1.026F,0.963F,0.899F,0.839F,0.778F,0.718F,0.655F,0.594F,0.528F,0.467F,0.407F,0.350F};
    	return weiyi;
    }
    
    private float[] getZaiHe() {
    	float[] zaihe = {26.38F,26.53F,26.60F,26.94F,28.04F,29.99F,32.46F,33.31F,33.79F,33.10F,33.41F,33.28F,33.24F,33.38F,33.17F,33.38F,33.24F,33.27F,33.20F,33.13F,33.17F,33.13F,33.13F,33.14F,33.21F,33.25F,33.28F,33.21F,33.14F,33.14F,33.17F,33.26F,33.17F,33.17F,33.21F,33.28F,33.31F,33.34F,33.34F,33.39F,33.29F,33.39F,33.44F,33.51F,33.56F,33.52F,33.53F,33.46F,33.46F,33.48F,33.51F,33.48F,33.44F,33.31F,33.38F,33.35F,33.37F,33.31F,33.34F,33.38F,33.38F,33.31F,33.31F,33.25F,33.28F,33.29F,33.36F,33.42F,33.41F,33.38F,33.47F,33.54F,33.65F,33.62F,33.61F,33.58F,33.53F,33.58F,33.54F,33.47F,33.48F,33.48F,33.57F,33.57F,33.52F,33.56F,33.53F,33.51F,33.45F,33.39F,33.52F,33.52F,33.51F,33.41F,33.42F,33.40F,33.50F,33.44F,33.44F,33.28F,33.18F,33.18F,33.17F,33.34F,32.68F,32.03F,30.60F,28.98F,26.76F,25.86F,25.49F,26.00F,25.84F,25.84F,25.94F,25.77F,26.04F,25.83F,26.00F,26.02F,26.07F,26.12F,25.96F,26.04F,25.96F,26.01F,25.95F,25.98F,26.04F,26.04F,26.04F,26.01F,26.08F,26.11F,25.99F,25.96F,25.87F,26.01F,26.01F,25.98F,26.04F,25.93F,26.02F,25.95F,25.93F,25.91F,25.83F,25.97F,25.89F,26.10F,26.05F,26.11F,25.94F,25.97F,25.95F,25.97F,25.97F,25.97F,26.00F,25.94F,25.96F,26.00F,25.97F,26.01F,25.96F,26.11F,26.05F,26.04F,25.99F,25.99F,26.02F,26.00F,26.00F,25.97F,25.91F,25.86F,25.82F,25.84F,25.93F,25.91F,25.86F,25.83F,25.86F,26.02F,26.05F,26.14F,26.00F,25.97F,26.02F,26.07F,26.14F,26.08F,26.14F,26.17F,26.15F,26.18F,26.10F,26.14F,26.08F,26.24F};
    	return zaihe;
    }
    
    private float[] getIb() {
    	float[] ib = {11.4F,9.2F,8.0F,4.7F,0.2F,0.2F,0.2F,0.0F,0.0F,0.0F,0.0F,0.1F,0.2F,0.1F,0.2F,0.1F,0.0F,0.1F,0.2F,0.1F,0.0F,0.1F,0.1F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.1F,0.0F,0.1F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.2F,0.0F,0.0F,0.1F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.2F,0.0F,0.1F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.2F,0.2F,0.2F,0.2F,0.0F,0.2F,0.2F,0.2F,0.1F,0.2F,0.0F,0.0F,0.2F,0.2F,0.2F,0.2F,0.0F,0.2F,0.0F,0.0F,0.2F,0.2F,0.2F,0.1F,0.2F,0.1F,0.2F,0.2F,0.2F,0.2F,0.1F,0.1F,0.2F,0.1F,0.2F,0.0F,0.0F,0.2F,6.9F,9.3F,10.1F,14.4F,15.4F,16.9F,17.5F,18.5F,17.9F,19.2F,18.8F,18.6F,18.2F,20.1F,19.1F,17.7F,18.7F,19.1F,19.1F,18.3F,17.9F,18.8F,19.2F,18.6F,17.6F,17.9F,19.1F,18.4F,17.9F,18.1F,19.3F,18.0F,17.3F,18.4F,18.9F,20.0F,19.4F,18.5F,18.1F,18.6F,19.0F,17.6F,18.5F,18.9F,18.0F,18.7F,17.1F,17.8F,18.8F,17.5F,17.8F,18.0F,18.3F,18.6F,17.0F,16.9F,17.9F,18.4F,17.2F,17.4F,17.4F,18.6F,17.4F,16.7F,18.0F,19.1F,17.8F,17.4F,16.2F,17.2F,18.3F,17.8F,16.9F,17.8F,18.7F,18.6F,16.6F,18.0F,18.7F,18.0F,17.1F,18.0F,17.9F,18.0F,16.4F,18.1F,18.3F,17.3F,16.6F,17.2F,18.2F,17.9F,16.6F,17.1F,13.9F};
    	return ib;
    }
    
    private float[] getPower() {
    	float[] power = {4.9F,3.8F,2.9F,1.4F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,0.0F,2.8F,3.9F,4.7F,6.8F,8.4F,8.8F,9.5F,9.9F,9.5F,10.0F,10.2F,9.9F,9.5F,10.4F,10.3F,9.5F,10.0F,10.0F,10.7F,10.1F,9.4F,10.2F,10.3F,9.9F,9.3F,9.6F,10.4F,9.8F,9.5F,10.1F,10.3F,9.9F,9.2F,9.6F,10.0F,10.1F,10.0F,9.8F,9.7F,9.7F,10.3F,9.2F,9.5F,9.9F,10.0F,9.9F,9.4F,9.5F,10.0F,9.3F,9.5F,9.5F,9.9F,10.2F,9.5F,9.2F,9.5F,10.0F,9.5F,9.2F,9.5F,10.0F,9.2F,9.4F,9.6F,10.3F,9.7F,9.6F,9.1F,9.4F,9.9F,9.7F,9.0F,9.8F,9.8F,9.5F,9.0F,9.5F,10.1F,9.6F,9.0F,9.5F,9.8F,9.8F,8.7F,9.6F,9.8F,9.5F,8.9F,9.2F,10.0F,9.7F,9.0F,9.4F,6.6F};
    	return power;
    }
	
}
