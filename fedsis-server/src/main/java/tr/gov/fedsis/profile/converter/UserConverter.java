package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Profile;
import tr.gov.fedsis.profile.entity.User;
import tr.gov.fedsis.profile.model.ProfileDto;
import tr.gov.fedsis.profile.model.UserDto;

/**
 * @author bocal
 */
@Component
public class UserConverter extends AbstractBaseConverter<UserDto, User> {

    private ProfileConverter profileConverter;

    @Autowired
    public UserConverter(ProfileConverter profileConverter) {
        this.profileConverter = profileConverter;
    }

    @Override
    protected void doConvertToDto(UserDto dto, User entity) {
        dto.setUsername(entity.getUsername());
        dto.setPassword(entity.getPassword());

        Profile profile = entity.getProfile();
        if (profile != null) {
            dto.setProfileDto(profileConverter.convertToDto(profile));
        }
    }

    @Override
    protected void doConvertToEntity(User entity, UserDto dto) {
        entity.setUsername(dto.getUsername());
        entity.setPassword(dto.getPassword());

        ProfileDto profileDto = dto.getProfileDto();
        if (profileDto != null) {
            entity.setProfile(profileConverter.convertToEntity(profileDto));
        }
    }
}