package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.*;
import tr.gov.fedsis.profile.model.*;

/**
 * @author bocal
 */
@Component
public class ProfileConverter extends AbstractBaseConverter<ProfileDto, Profile> {

    private NationalityConverter nationalityConverter;

    private CountyConverter countyConverter;

    private CityConverter cityConverter;

    private CountryConverter countryConverter;

    @Autowired
    public ProfileConverter(NationalityConverter nationalityConverter, CountyConverter countyConverter, CityConverter cityConverter, CountryConverter countryConverter) {
        this.nationalityConverter = nationalityConverter;
        this.countyConverter = countyConverter;
        this.cityConverter = cityConverter;
        this.countryConverter = countryConverter;
    }

    @Override
    protected void doConvertToDto(ProfileDto dto, Profile entity) {
        dto.setName(entity.getName());
        dto.setMiddleName(entity.getMiddleName());
        dto.setSurname(entity.getSurname());
        dto.setFatherName(entity.getFatherName());
        dto.setMotherName(entity.getMotherName());
        dto.setGender(entity.getGender());
        dto.setBloodType(entity.getBloodType());
        dto.setPassportNo(entity.getPassportNo());
        dto.setSocialNumber(entity.getSocialNumber());
        dto.setAddress(entity.getAddress());
        dto.setPostalCode(entity.getPostalCode());
        dto.setEmail(entity.getEmail());
        dto.setMobileNumber(entity.getMobileNumber());
        dto.setFaxNumber(entity.getFaxNumber());
        dto.setTel1(entity.getTel1());
        dto.setTel2(entity.getTel2());
        dto.setWebsite(entity.getWebsite());

        Nationality nationality = entity.getNationality();
        if (nationality != null) {
            dto.setNationalityDto(nationalityConverter.convertToDto(nationality));
        }

        County county = entity.getCounty();
        if (county != null) {
            dto.setCountyDto(countyConverter.convertToDto(county));
        }

        City city = entity.getCity();
        if (city != null) {
            dto.setCityDto(cityConverter.convertToDto(city));
        }

        Country country = entity.getCountry();
        if (country != null) {
            dto.setCountryDto(countryConverter.convertToDto(country));
        }
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
        entity.setPassportNo(dto.getPassportNo());
        entity.setSocialNumber(dto.getSocialNumber());
        entity.setAddress(dto.getAddress());
        entity.setPostalCode(dto.getPostalCode());
        entity.setEmail(dto.getEmail());
        entity.setMobileNumber(dto.getMobileNumber());
        entity.setFaxNumber(dto.getFaxNumber());
        entity.setTel1(dto.getTel1());
        entity.setTel2(dto.getTel2());
        entity.setWebsite(dto.getWebsite());

        NationalityDto nationalityDto = dto.getNationalityDto();
        if (nationalityDto != null) {
            entity.setNationality(nationalityConverter.convertToEntity(nationalityDto));
        }

        CountyDto countyDto = dto.getCountyDto();
        if (countyDto != null) {
            entity.setCounty(countyConverter.convertToEntity(countyDto));
        }

        CityDto cityDto = dto.getCityDto();
        if (cityDto != null) {
            entity.setCity(cityConverter.convertToEntity(cityDto));
        }

        CountryDto countryDto = dto.getCountryDto();
        if (countryDto != null) {
            entity.setCountry(countryConverter.convertToEntity(countryDto));
        }
    }
}