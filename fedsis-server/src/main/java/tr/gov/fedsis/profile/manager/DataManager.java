package tr.gov.fedsis.profile.manager;

import java.util.List;
import tr.gov.fedsis.profile.entity.BloodType;
import tr.gov.fedsis.profile.entity.City;
import tr.gov.fedsis.profile.entity.Country;
import tr.gov.fedsis.profile.entity.County;
import tr.gov.fedsis.profile.entity.Gender;

/**
 * @author aokay
 */
public interface DataManager {

  List<County> listCounty(Long pkid);

  List<City> listCity(Long pkid);

  List<Country> listCountry();

  List<Gender> listGender();

  List<BloodType> listBloodType();
}