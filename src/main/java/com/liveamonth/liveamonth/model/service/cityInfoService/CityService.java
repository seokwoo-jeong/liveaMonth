package com.liveamonth.liveamonth.model.service.cityInfoService;

import com.liveamonth.liveamonth.entity.vo.CityInfoVO;
import com.liveamonth.liveamonth.entity.vo.CityTransportVO;
import com.liveamonth.liveamonth.entity.vo.CityWeatherVO;

import java.util.HashMap;
import java.util.List;

public interface CityService {
    List<CityInfoVO> getCityInfoList(String cityName,String cityInfoCategory) throws Exception;
    List<CityInfoVO> getCityInfoListByCategory(String cityInfoCategory) throws Exception;
    List<String> getCityInfoNameList() throws Exception;
    List<CityWeatherVO> getCityWeatherList(String cityName) throws Exception;
    List<CityTransportVO> getCityTransportList(String cityName) throws Exception;
    List<CityWeatherVO> getAVGTempList();

    // use getCityInfoList(), getCityWeatherList(), getCityTransportList()
    HashMap<String, Object> getSelectedCityList(String cityName) throws Exception;
    // use getCityInfoListByCategory()
    List<CityInfoVO> getRandomCityInfoListByCategory(String cityInfoCategory) throws Exception;
    // use getCityInfoNameList(), getCityTransportList()
    HashMap<String, String> getCityTransportGradeList() throws Exception;
}
