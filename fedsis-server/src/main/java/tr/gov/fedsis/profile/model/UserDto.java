package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;

/**
 * Created by ahmet on 19.11.2017.
 */
public class UserDto extends BaseDto {

  private String username;

  private String password;

  private ProfileDto profileDto;

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public ProfileDto getProfileDto() {
    return profileDto;
  }

  public void setProfileDto(ProfileDto profileDto) {
    this.profileDto = profileDto;
  }
}