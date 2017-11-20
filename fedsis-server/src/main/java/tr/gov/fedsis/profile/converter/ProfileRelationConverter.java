package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.ClubTeam;
import tr.gov.fedsis.profile.entity.Department;
import tr.gov.fedsis.profile.entity.Profile;
import tr.gov.fedsis.profile.entity.ProfileRelation;
import tr.gov.fedsis.profile.entity.ProfileType;
import tr.gov.fedsis.profile.model.ClubTeamDto;
import tr.gov.fedsis.profile.model.DepartmentDto;
import tr.gov.fedsis.profile.model.ProfileDto;
import tr.gov.fedsis.profile.model.ProfileRelationDto;
import tr.gov.fedsis.profile.model.ProfileTypeDto;

/**
 * @author bocal
 */
@Component
public class ProfileRelationConverter extends
    AbstractBaseConverter<ProfileRelationDto, ProfileRelation> {

  private DepartmentConverter departmentConverter;

  private ProfileTypeConverter profileTypeConverter;

  private ProfileConverter profileConverter;

  private ClubTeamConverter clubTeamConverter;

  @Autowired
  public ProfileRelationConverter(DepartmentConverter departmentConverter,
      ProfileTypeConverter profileTypeConverter, ProfileConverter profileConverter,
      ClubTeamConverter clubTeamConverter) {
    this.departmentConverter = departmentConverter;
    this.profileTypeConverter = profileTypeConverter;
    this.profileConverter = profileConverter;
    this.clubTeamConverter = clubTeamConverter;
  }

  @Override
  protected void doConvertToDto(ProfileRelationDto dto, ProfileRelation entity) {
    dto.setStartDate(entity.getStartDate());
    dto.setEndDate(entity.getEndDate());

    Department department = entity.getDepartment();
    if (department != null) {
      dto.setDepartmentDto(departmentConverter.convertToDto(department));
    }

    ProfileType profileType = entity.getProfileType();
    if (profileType != null) {
      dto.setProfileTypeDto(profileTypeConverter.convertToDto(profileType));
    }

    Profile profile = entity.getProfile();
    if (profile != null) {
      dto.setProfileDto(profileConverter.convertToDto(profile));
    }

    ClubTeam clubTeam = entity.getClubTeam();
    if (clubTeam != null) {
      dto.setClubTeamDto(clubTeamConverter.convertToDto(clubTeam));
    }
  }

  @Override
  protected void doConvertToEntity(ProfileRelation entity, ProfileRelationDto dto) {
    entity.setStartDate(dto.getStartDate());
    entity.setEndDate(dto.getEndDate());

    DepartmentDto departmentDto = dto.getDepartmentDto();
    if (departmentDto != null) {
      entity.setDepartment(departmentConverter.convertToEntity(departmentDto));
    }

    ProfileTypeDto profileTypeDto = dto.getProfileTypeDto();
    if (profileTypeDto != null) {
      entity.setProfileType(profileTypeConverter.convertToEntity(profileTypeDto));
    }

    ProfileDto profileDto = dto.getProfileDto();
    if (profileDto != null) {
      entity.setProfile(profileConverter.convertToEntity(profileDto));
    }

    ClubTeamDto clubTeamDto = dto.getClubTeamDto();
    if (clubTeamDto != null) {
      entity.setClubTeam(clubTeamConverter.convertToEntity(clubTeamDto));
    }
  }
}