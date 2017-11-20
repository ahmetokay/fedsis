package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.City;
import tr.gov.fedsis.profile.entity.Country;
import tr.gov.fedsis.profile.model.CityDto;
import tr.gov.fedsis.profile.model.CountryDto;

/**
 * @author bocal
 */
@Component
public class CityConverter extends AbstractBaseConverter<CityDto, City> {

  private CountryConverter countryConverter;

  @Autowired
  public CityConverter(CountryConverter countryConverter) {
    this.countryConverter = countryConverter;
  }

  @Override
  protected void doConvertToDto(CityDto dto, City entity) {
    dto.setName(entity.getName());
    dto.setShortName(entity.getShortName());

    Country country = entity.getCountry();
    if (country != null) {
      dto.setCountryDto(countryConverter.convertToDto(country));
    }
  }

  @Override
  protected void doConvertToEntity(City entity, CityDto dto) {
    entity.setName(dto.getName());
    entity.setShortName(dto.getShortName());

    CountryDto countryDto = dto.getCountryDto();
    if (countryDto != null) {
      entity.setCountry(countryConverter.convertToEntity(countryDto));
    }
  }
}