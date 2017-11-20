package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.ProfileType;
import tr.gov.fedsis.profile.model.ProfileTypeDto;

/**
 * @author bocal
 */
@Component
public class ProfileTypeConverter extends AbstractBaseConverter<ProfileTypeDto, ProfileType> {

  @Override
  protected void doConvertToDto(ProfileTypeDto dto, ProfileType entity) {
    dto.setName(entity.getName());
    dto.setDescription(entity.getDescription());
  }

  @Override
  protected void doConvertToEntity(ProfileType entity, ProfileTypeDto dto) {
    entity.setName(dto.getName());
    entity.setDescription(dto.getDescription());
  }
}