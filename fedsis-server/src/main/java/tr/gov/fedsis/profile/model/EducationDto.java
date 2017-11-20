package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;
import java.util.Date;

/**
 * Created by ahmet on 19.11.2017.
 */
public class EducationDto extends BaseDto {

  private String name;

  private String description;

  private Date startDate;

  private Date endDate;

  private EducationTypeDto educationTypeDto;

  private ProfileDto profileDto;

  public EducationDto() {
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

  public EducationTypeDto getEducationTypeDto() {
    return educationTypeDto;
  }

  public void setEducationTypeDto(EducationTypeDto educationTypeDto) {
    this.educationTypeDto = educationTypeDto;
  }

  public ProfileDto getProfileDto() {
    return profileDto;
  }

  public void setProfileDto(ProfileDto profileDto) {
    this.profileDto = profileDto;
  }
}