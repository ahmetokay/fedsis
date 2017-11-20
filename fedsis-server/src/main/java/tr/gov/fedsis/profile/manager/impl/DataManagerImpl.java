package tr.gov.fedsis.profile.manager.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.City;
import tr.gov.fedsis.profile.entity.Country;
import tr.gov.fedsis.profile.entity.County;
import tr.gov.fedsis.profile.manager.DataManager;
import tr.gov.fedsis.profile.repository.CityRepository;
import tr.gov.fedsis.profile.repository.CountryRepository;
import tr.gov.fedsis.profile.repository.CountyRepository;

/**
 * @author aokay
 */
@Component
public class DataManagerImpl implements DataManager {

  private CountyRepository countyRepository;

  private CityRepository cityRepository;

  private CountryRepository countryRepository;

  @Autowired
  public DataManagerImpl(CountyRepository countyRepository, CityRepository cityRepository,
      CountryRepository countryRepository) {
    this.countyRepository = countyRepository;
    this.cityRepository = cityRepository;
    this.countryRepository = countryRepository;
  }

  @Override
  public List<County> listCounty(Long pkid) {
    return countyRepository.findAll(); //TODO değişecek
  }

  @Override
  public List<City> listCity(Long pkid) {
    return cityRepository.findAll(); //TODO değişecek
  }

  @Override
  public List<Country> listCountry() {
    return countryRepository.findAll();
  }
}