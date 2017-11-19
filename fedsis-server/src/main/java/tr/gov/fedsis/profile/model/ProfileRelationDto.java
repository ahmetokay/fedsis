package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;

import java.util.Date;

/**
 * Created by ahmet on 19.11.2017.
 */
public class ProfileRelationDto extends BaseDto {

    private Date startDate;

    private Date endDate;

    private DepartmentDto departmentDto;

    private ProfileTypeDto profileTypeDto;

    private ProfileDto profileDto;

    private ClubTeamDto clubTeamDto;

    public ProfileRelationDto() {
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

    public DepartmentDto getDepartmentDto() {
        return departmentDto;
    }

    public void setDepartmentDto(DepartmentDto departmentDto) {
        this.departmentDto = departmentDto;
    }

    public ProfileTypeDto getProfileTypeDto() {
        return profileTypeDto;
    }

    public void setProfileTypeDto(ProfileTypeDto profileTypeDto) {
        this.profileTypeDto = profileTypeDto;
    }

    public ProfileDto getProfileDto() {
        return profileDto;
    }

    public void setProfileDto(ProfileDto profileDto) {
        this.profileDto = profileDto;
    }

    public ClubTeamDto getClubTeamDto() {
        return clubTeamDto;
    }

    public void setClubTeamDto(ClubTeamDto clubTeamDto) {
        this.clubTeamDto = clubTeamDto;
    }
}