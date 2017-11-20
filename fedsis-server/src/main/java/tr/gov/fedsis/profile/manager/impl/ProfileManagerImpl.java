package tr.gov.fedsis.profile.manager.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import tr.gov.fedsis.profile.entity.Profile;
import tr.gov.fedsis.profile.manager.ProfileManager;
import tr.gov.fedsis.profile.repository.ProfileRepository;

/**
 * @author bocal
 */
@Component
public class ProfileManagerImpl implements ProfileManager {

  private ProfileRepository profileRepository;

  @Autowired
  public ProfileManagerImpl(ProfileRepository profileRepository) {
    this.profileRepository = profileRepository;
  }

  @Override
  @Transactional
  public Profile create(Profile profile) {
    return profileRepository.save(profile);
  }

  @Override
  @Transactional
  public Profile update(Profile profile) {
    return profileRepository.save(profile);
  }

  @Override
  @Transactional
  public void delete(Long pkid) {
    profileRepository.delete(pkid);
  }

  @Override
  @Transactional(readOnly = true)
  public Profile findById(Long pkid) {
    return profileRepository.findById(pkid);
  }

  @Override
  public List<Profile> list() {
    return profileRepository.findAll();
  }
}