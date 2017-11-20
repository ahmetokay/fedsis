package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Education;
import tr.gov.fedsis.profile.entity.EducationType;
import tr.gov.fedsis.profile.entity.Profile;
import tr.gov.fedsis.profile.model.EducationDto;
import tr.gov.fedsis.profile.model.EducationTypeDto;
import tr.gov.fedsis.profile.model.ProfileDto;

/**
 * @author bocal
 */
@Component
public class EducationConverter extends AbstractBaseConverter<EducationDto, Education> {

  private EducationTypeConverter educationTypeConverter;

  private ProfileConverter profileConverter;

  @Autowired
  public EducationConverter(EducationTypeConverter educationTypeConverter,
      ProfileConverter profileConverter) {
    this.educationTypeConverter = educationTypeConverter;
    this.profileConverter = profileConverter;
  }

  @Override
  protected void doConvertToDto(EducationDto dto, Education entity) {
    dto.setName(entity.getName());
    dto.setDescription(entity.getDescription());
    dto.setStartDate(entity.getStartDate());
    dto.setEndDate(entity.getEndDate());

    EducationType educationType = entity.getEducationType();
    if (educationType != null) {
      dto.setEducationTypeDto(educationTypeConverter.convertToDto(educationType));
    }

    Profile profile = entity.getProfile();
    if (profile != null) {
      dto.setProfileDto(profileConverter.convertToDto(profile));
    }
  }

  @Override
  protected void doConvertToEntity(Education entity, EducationDto dto) {
    entity.setName(dto.getName());
    entity.setDescription(dto.getDescription());
    entity.setStartDate(dto.getStartDate());
    entity.setEndDate(dto.getEndDate());

    EducationTypeDto educationTypeDto = dto.getEducationTypeDto();
    if (educationTypeDto != null) {
      entity.setEducationType(educationTypeConverter.convertToEntity(educationTypeDto));
    }

    ProfileDto profileDto = dto.getProfileDto();
    if (profileDto != null) {
      entity.setProfile(profileConverter.convertToEntity(profileDto));
    }
  }
}