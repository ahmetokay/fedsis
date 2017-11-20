package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.BodySize;
import tr.gov.fedsis.profile.entity.ProfileRelation;
import tr.gov.fedsis.profile.model.BodySizeDto;
import tr.gov.fedsis.profile.model.ProfileRelationDto;

/**
 * @author bocal
 */
@Component
public class BodySizeConverter extends AbstractBaseConverter<BodySizeDto, BodySize> {

  private ProfileRelationConverter profileRelationConverter;

  @Autowired
  public BodySizeConverter(ProfileRelationConverter profileRelationConverter) {
    this.profileRelationConverter = profileRelationConverter;
  }

  @Override
  protected void doConvertToDto(BodySizeDto dto, BodySize entity) {
    dto.setLength(entity.getLength());
    dto.setShoesNumber(entity.getShoesNumber());
    dto.setSportShoesNumber(entity.getSportShoesNumber());
    dto.setWeight(entity.getWeight());
    dto.setDressSize(entity.getDressSize());
    dto.setPantSize(entity.getPantSize());
    dto.setTopSize(entity.getTopSize());

    ProfileRelation profileRelation = entity.getProfileRelation();
    if (profileRelation != null) {
      dto.setProfileRelationDto(profileRelationConverter.convertToDto(profileRelation));
    }
  }

  @Override
  protected void doConvertToEntity(BodySize entity, BodySizeDto dto) {
    entity.setLength(dto.getLength());
    entity.setShoesNumber(dto.getShoesNumber());
    entity.setSportShoesNumber(dto.getSportShoesNumber());
    entity.setWeight(dto.getWeight());
    entity.setDressSize(dto.getDressSize());
    entity.setPantSize(dto.getPantSize());
    entity.setTopSize(dto.getTopSize());

    ProfileRelationDto profileRelationDto = dto.getProfileRelationDto();
    if (profileRelationDto != null) {
      entity.setProfileRelation(profileRelationConverter.convertToEntity(profileRelationDto));
    }
  }
}