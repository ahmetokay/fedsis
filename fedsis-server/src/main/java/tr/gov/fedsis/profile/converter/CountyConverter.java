package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.City;
import tr.gov.fedsis.profile.entity.County;
import tr.gov.fedsis.profile.model.CityDto;
import tr.gov.fedsis.profile.model.CountyDto;

/**
 * @author bocal
 */
@Component
public class CountyConverter extends AbstractBaseConverter<CountyDto, County> {

  private CityConverter cityConverter;

  @Autowired
  public CountyConverter(CityConverter cityConverter) {
    this.cityConverter = cityConverter;
  }

  @Override
  protected void doConvertToDto(CountyDto dto, County entity) {
    dto.setName(entity.getName());
    dto.setShortName(entity.getShortName());

    City city = entity.getCity();
    if (city != null) {
      dto.setCityDto(cityConverter.convertToDto(city));
    }
  }

  @Override
  protected void doConvertToEntity(County entity, CountyDto dto) {
    entity.setName(dto.getName());
    entity.setShortName(dto.getShortName());

    CityDto cityDto = dto.getCityDto();
    if (cityDto != null) {
      entity.setCity(cityConverter.convertToEntity(cityDto));
    }
  }
}