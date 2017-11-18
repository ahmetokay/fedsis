package tr.gov.fedsis.profile.service;

import tr.gov.fedsis.profile.entity.Profile;
import tr.gov.fedsis.profile.model.ProfileDto;

/**
 * @author bocal
 */
public interface ProfileService {

  ProfileDto create(ProfileDto profileDto);

  ProfileDto update(ProfileDto profileDto);

  void delete(Long pkid);

  ProfileDto findById(Long pkid);

}
