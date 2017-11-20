package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;
import java.util.Date;

/**
 * Created by ahmet on 19.11.2017.
 */
public class ClubTeamDto extends BaseDto {

  private String name;

  private String description;

  private Date startDate;

  private Date endDate;

  private ClubDto clubDto;

  public ClubTeamDto() {
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }

  public ClubDto getClubDto() {
    return clubDto;
  }

  public void setClubDto(ClubDto clubDto) {
    this.clubDto = clubDto;
  }
}