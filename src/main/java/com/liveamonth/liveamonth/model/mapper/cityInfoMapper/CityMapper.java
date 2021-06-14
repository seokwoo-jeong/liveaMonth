package com.liveamonth.liveamonth.model.mapper.cityInfoMapper;

import com.liveamonth.liveamonth.entity.vo.CityInfoVO;
import com.liveamonth.liveamonth.entity.vo.CityTransportVO;
import com.liveamonth.liveamonth.entity.vo.CityWeatherVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CityMapper {
    List<CityInfoVO> getCityInfoList(String cityName, String cityInfoCategory) throws Exception;
    List<CityInfoVO> getCityInfoListByCategory(String cityInfoCategory) throws Exception;
    List<String> getCityInfoNameList() throws Exception;
    List<CityWeatherVO> getCityWeatherList(String cityName);
    List<CityTransportVO> getCityTransportList(String cityName);
    List<CityWeatherVO> getAVGTempList(int month);
}
