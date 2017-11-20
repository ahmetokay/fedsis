package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Country;
import tr.gov.fedsis.profile.model.CountryDto;

/**
 * @author bocal
 */
@Component
public class CountryConverter extends AbstractBaseConverter<CountryDto, Country> {

  @Override
  protected void doConvertToDto(CountryDto dto, Country entity) {
    dto.setName(entity.getName());
    dto.setShortName(entity.getShortName());
    dto.setFlagImage(entity.getFlagImage());
  }

  @Override
  protected void doConvertToEntity(Country entity, CountryDto dto) {
    entity.setName(dto.getName());
    entity.setShortName(dto.getShortName());
    entity.setFlagImage(dto.getFlagImage());
  }
}