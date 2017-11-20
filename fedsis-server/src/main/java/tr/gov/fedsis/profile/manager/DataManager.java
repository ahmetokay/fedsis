package tr.gov.fedsis.profile.manager;

import java.util.List;
import tr.gov.fedsis.profile.entity.City;
import tr.gov.fedsis.profile.entity.Country;
import tr.gov.fedsis.profile.entity.County;

/**
 * @author aokay
 */
public interface DataManager {

  List<County> listCounty(Long pkid);

  List<City> listCity(Long pkid);

  List<Country> listCountry();
}