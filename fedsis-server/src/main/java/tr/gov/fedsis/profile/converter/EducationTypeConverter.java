package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.EducationType;
import tr.gov.fedsis.profile.model.EducationTypeDto;

/**
 * @author bocal
 */
@Component
public class EducationTypeConverter extends AbstractBaseConverter<EducationTypeDto, EducationType> {

  @Override
  protected void doConvertToDto(EducationTypeDto dto, EducationType entity) {
    dto.setName(entity.getName());
    dto.setDescription(entity.getDescription());
  }

  @Override
  protected void doConvertToEntity(EducationType entity, EducationTypeDto dto) {
    entity.setName(dto.getName());
    entity.setDescription(dto.getDescription());
  }
}