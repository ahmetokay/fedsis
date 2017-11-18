package tr.gov.fedsis.profile.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tr.gov.fedsis.profile.converter.ProfileConverter;
import tr.gov.fedsis.profile.entity.Profile;
import tr.gov.fedsis.profile.manager.ProfileManager;
import tr.gov.fedsis.profile.model.ProfileDto;
import tr.gov.fedsis.profile.service.ProfileService;

/**
 * @author bocal
 */

@Service
public class ProfileServiceImpl implements ProfileService {

  private ProfileConverter profileConverter;

  private ProfileManager profileManager;

  @Autowired
  public ProfileServiceImpl(ProfileConverter profileConverter,
      ProfileManager profileManager) {
    this.profileConverter = profileConverter;
    this.profileManager = profileManager;
  }

  @Override
  public ProfileDto create(ProfileDto profileDto) {
    Profile profile = profileConverter.convertToEntity(profileDto);
    return profileConverter.convertToDto(profileManager.create(profile));
  }

  @Override
  public ProfileDto update(ProfileDto profileDto) {
    Profile profile = profileConverter.convertToEntity(profileDto);
    return profileConverter.convertToDto(profileManager.update(profile));
  }

  @Override
  public void delete(Long pkid) {
    profileManager.delete(pkid);
  }

  @Override
  public ProfileDto findById(Long pkid) {
    return profileConverter.convertToDto(profileManager.findById(pkid));
  }
}
