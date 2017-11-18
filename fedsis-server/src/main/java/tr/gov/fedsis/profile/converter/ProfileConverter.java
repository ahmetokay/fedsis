package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Profile;
import tr.gov.fedsis.profile.model.ProfileDto;

/**
 * @author bocal
 */

@Component
public class ProfileConverter extends AbstractBaseConverter<ProfileDto, Profile> {

    @Override
    protected void doConvertToDto(ProfileDto dto, Profile entity) {
        dto.setName(entity.getName());
        dto.setMiddleName(entity.getMiddleName());
        dto.setSurname(entity.getSurname());
        dto.setFatherName(entity.getFatherName());
        dto.setMotherName(entity.getMotherName());
        dto.setGender(entity.getGender());
        dto.setBloodType(entity.getBloodType());
        dto.setCity(entity.getCity());
        dto.setCountry(entity.getCountry());
        dto.setPassportNo(entity.getPassportNo());
        dto.setPassword(entity.getPassword());
        dto.setUser(entity.getUser());
        dto.setNationalityId(entity.getNationalityId());
    }

    @Override
    protected void doConvertToEntity(Profile entity, ProfileDto dto) {
        entity.setName(dto.getName());
        entity.setMiddleName(dto.getMiddleName());
        entity.setSurname(dto.getSurname());
        entity.setFatherName(dto.getFatherName());
        entity.setMotherName(dto.getMotherName());
        entity.setGender(dto.getGender());
        entity.setBloodType(dto.getBloodType());
        entity.setCity(dto.getCity());
        entity.setCountry(dto.getCountry());
        entity.setPassword(dto.getPassportNo());
        entity.setPassword(dto.getPassword());
        entity.setUser(dto.isUser());
        entity.setNationalityId(dto.getNationalityId());
    }

}
