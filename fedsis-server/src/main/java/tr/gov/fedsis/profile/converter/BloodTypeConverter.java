package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.BloodType;
import tr.gov.fedsis.profile.model.BloodTypeDto;

/**
 * @author bocal
 */
@Component
public class BloodTypeConverter extends AbstractBaseConverter<BloodTypeDto, BloodType> {

  private CountryConverter countryConverter;

  @Autowired
  public BloodTypeConverter(CountryConverter countryConverter) {
    this.countryConverter = countryConverter;
  }

  @Override
  protected void doConvertToDto(BloodTypeDto dto, BloodType entity) {
    dto.setName(entity.getName());
    dto.setDescription(entity.getDescription());
  }

  @Override
  protected void doConvertToEntity(BloodType entity, BloodTypeDto dto) {
    entity.setName(dto.getName());
    entity.setDescription(dto.getDescription());
  }
}