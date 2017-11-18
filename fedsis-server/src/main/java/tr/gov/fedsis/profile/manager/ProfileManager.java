package tr.gov.fedsis.profile.manager;

import tr.gov.fedsis.profile.entity.Profile;

/**
 * @author bocal
 */
public interface ProfileManager {

  Profile create(Profile profile);

  Profile update(Profile profile);

  void delete(Long pkid);

  Profile findById(Long pkid);

}
