package tr.gov.fedsis.profile.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tr.gov.fedsis.profile.converter.CityConverter;
import tr.gov.fedsis.profile.converter.CountryConverter;
import tr.gov.fedsis.profile.converter.CountyConverter;
import tr.gov.fedsis.profile.manager.DataManager;
import tr.gov.fedsis.profile.model.CityDto;
import tr.gov.fedsis.profile.model.CountryDto;
import tr.gov.fedsis.profile.model.CountyDto;
import tr.gov.fedsis.profile.service.DataService;

/**
 * @author aokay
 */
@Service
public class DataServiceImpl implements DataService {

  private CountyConverter countyConverter;

  private CityConverter cityConverter;

  private CountryConverter countryConverter;

  private DataManager dataManager;

  @Autowired
  public DataServiceImpl(CountyConverter countyConverter, CityConverter cityConverter,
      CountryConverter countryConverter, DataManager dataManager) {
    this.countyConverter = countyConverter;
    this.cityConverter = cityConverter;
    this.countryConverter = countryConverter;
    this.dataManager = dataManager;
  }

  @Override
  public List<CountyDto> listCounty(Long pkid) {
    return countyConverter.convertToDtoList(dataManager.listCounty(pkid));
  }

  @Override
  public List<CityDto> listCity(Long pkid) {
    return cityConverter.convertToDtoList(dataManager.listCity(pkid));
  }

  @Override
  public List<CountryDto> listCountry() {
    return countryConverter.convertToDtoList(dataManager.listCountry());
  }
}