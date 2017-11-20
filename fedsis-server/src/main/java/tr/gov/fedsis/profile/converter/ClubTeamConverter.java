package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Club;
import tr.gov.fedsis.profile.entity.ClubTeam;
import tr.gov.fedsis.profile.model.ClubDto;
import tr.gov.fedsis.profile.model.ClubTeamDto;

/**
 * @author bocal
 */
@Component
public class ClubTeamConverter extends AbstractBaseConverter<ClubTeamDto, ClubTeam> {

  private ClubConverter clubConverter;

  @Autowired
  public ClubTeamConverter(ClubConverter clubConverter) {
    this.clubConverter = clubConverter;
  }

  @Override
  protected void doConvertToDto(ClubTeamDto dto, ClubTeam entity) {
    dto.setName(entity.getName());
    dto.setDescription(entity.getDescription());
    dto.setStartDate(entity.getStartDate());
    dto.setEndDate(entity.getEndDate());

    Club club = entity.getClub();
    if (club != null) {
      dto.setClubDto(clubConverter.convertToDto(club));
    }
  }

  @Override
  protected void doConvertToEntity(ClubTeam entity, ClubTeamDto dto) {
    entity.setName(dto.getName());
    entity.setDescription(dto.getDescription());
    entity.setStartDate(dto.getStartDate());
    entity.setEndDate(dto.getEndDate());

    ClubDto clubDto = dto.getClubDto();
    if (clubDto != null) {
      entity.setClub(clubConverter.convertToEntity(clubDto));
    }
  }
}