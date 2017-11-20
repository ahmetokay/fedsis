package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Nationality;
import tr.gov.fedsis.profile.model.NationalityDto;

/**
 * @author bocal
 */
@Component
public class NationalityConverter extends AbstractBaseConverter<NationalityDto, Nationality> {

  @Override
  protected void doConvertToDto(NationalityDto dto, Nationality entity) {
    dto.setName(entity.getName());
    dto.setShortName(entity.getShortName());
    dto.setFlagImage(entity.getFlagImage());
  }

  @Override
  protected void doConvertToEntity(Nationality entity, NationalityDto dto) {
    entity.setName(dto.getName());
    entity.setShortName(dto.getShortName());
    entity.setFlagImage(dto.getFlagImage());
  }
}