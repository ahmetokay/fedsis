package tr.gov.fedsis.profile.service;

import tr.gov.fedsis.profile.model.ProfileDto;

import java.util.List;

/**
 * @author bocal
 */
public interface ProfileService {

    ProfileDto create(ProfileDto profileDto);

    ProfileDto update(ProfileDto profileDto);

    void delete(Long pkid);

    ProfileDto findById(Long pkid);

    List<ProfileDto> list();

}