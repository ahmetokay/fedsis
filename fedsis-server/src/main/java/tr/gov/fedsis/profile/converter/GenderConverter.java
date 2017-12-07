package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Gender;
import tr.gov.fedsis.profile.model.GenderDto;

/**
 * @author bocal
 */
@Component
public class GenderConverter extends AbstractBaseConverter<GenderDto, Gender> {

  private CountryConverter countryConverter;

  @Autowired
  public GenderConverter(CountryConverter countryConverter) {
    this.countryConverter = countryConverter;
  }

  @Override
  protected void doConvertToDto(GenderDto dto, Gender entity) {
    dto.setName(entity.getName());
    dto.setDescription(entity.getDescription());
  }

  @Override
  protected void doConvertToEntity(Gender entity, GenderDto dto) {
    entity.setName(dto.getName());
    entity.setDescription(dto.getDescription());
  }
}