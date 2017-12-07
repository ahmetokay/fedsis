package tr.gov.fedsis.profile.manager.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.BloodType;
import tr.gov.fedsis.profile.entity.City;
import tr.gov.fedsis.profile.entity.Country;
import tr.gov.fedsis.profile.entity.County;
import tr.gov.fedsis.profile.entity.Gender;
import tr.gov.fedsis.profile.manager.DataManager;
import tr.gov.fedsis.profile.repository.BloodTypeRepository;
import tr.gov.fedsis.profile.repository.CityRepository;
import tr.gov.fedsis.profile.repository.CountryRepository;
import tr.gov.fedsis.profile.repository.CountyRepository;
import tr.gov.fedsis.profile.repository.GenderRepository;

/**
 * @author aokay
 */
@Component
public class DataManagerImpl implements DataManager {

  private CountyRepository countyRepository;

  private CityRepository cityRepository;

  private CountryRepository countryRepository;

  private GenderRepository genderRepository;

  private BloodTypeRepository bloodTypeRepository;

  @Autowired
  public DataManagerImpl(CountyRepository countyRepository, CityRepository cityRepository,
      CountryRepository countryRepository, GenderRepository genderRepository,
      BloodTypeRepository bloodTypeRepository) {
    this.countyRepository = countyRepository;
    this.cityRepository = cityRepository;
    this.countryRepository = countryRepository;
    this.genderRepository = genderRepository;
    this.bloodTypeRepository = bloodTypeRepository;
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

  @Override
  public List<Gender> listGender() {
    return genderRepository.findAll();
  }

  @Override
  public List<BloodType> listBloodType() {
    return bloodTypeRepository.findAll();
  }
}