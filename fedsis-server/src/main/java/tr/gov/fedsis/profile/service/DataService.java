package tr.gov.fedsis.profile.service;

import java.util.List;
import tr.gov.fedsis.profile.model.CityDto;
import tr.gov.fedsis.profile.model.CountryDto;
import tr.gov.fedsis.profile.model.CountyDto;

/**
 * @author aokay
 */
public interface DataService {

  List<CountyDto> listCounty(Long pkid);

  List<CityDto> listCity(Long pkid);

  List<CountryDto> listCountry();
}