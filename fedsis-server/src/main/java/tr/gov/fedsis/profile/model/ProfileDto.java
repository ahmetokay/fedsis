package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;

/**
 * Profil islemleri icin kullanilacak olan siniftir.
 *
 * @author bocal
 */
public class ProfileDto extends BaseDto {

  private String name;

  private String middleName;

  private String surname;

  private String fatherName;

  private String motherName;

  private String gender;

  private String bloodType;

  private String passportNo;

  private String socialNumber;

  private String address;

  private String postalCode;

  private String email;

  private String mobileNumber;

  private String faxNumber;

  private String tel1;

  private String tel2;

  private String website;

  private NationalityDto nationalityDto;

  private CountyDto countyDto;

  private CityDto cityDto;

  private CountryDto countryDto;

  public ProfileDto() {
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getMiddleName() {
    return middleName;
  }

  public void setMiddleName(String middleName) {
    this.middleName = middleName;
  }

  public String getSurname() {
    return surname;
  }

  public void setSurname(String surname) {
    this.surname = surname;
  }

  public String getFatherName() {
    return fatherName;
  }

  public void setFatherName(String fatherName) {
    this.fatherName = fatherName;
  }

  public String getMotherName() {
    return motherName;
  }

  public void setMotherName(String motherName) {
    this.motherName = motherName;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getBloodType() {
    return bloodType;
  }

  public void setBloodType(String bloodType) {
    this.bloodType = bloodType;
  }

  public String getPassportNo() {
    return passportNo;
  }

  public void setPassportNo(String passportNo) {
    this.passportNo = passportNo;
  }

  public String getSocialNumber() {
    return socialNumber;
  }

  public void setSocialNumber(String socialNumber) {
    this.socialNumber = socialNumber;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getPostalCode() {
    return postalCode;
  }

  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getMobileNumber() {
    return mobileNumber;
  }

  public void setMobileNumber(String mobileNumber) {
    this.mobileNumber = mobileNumber;
  }

  public String getFaxNumber() {
    return faxNumber;
  }

  public void setFaxNumber(String faxNumber) {
    this.faxNumber = faxNumber;
  }

  public String getTel1() {
    return tel1;
  }

  public void setTel1(String tel1) {
    this.tel1 = tel1;
  }

  public String getTel2() {
    return tel2;
  }

  public void setTel2(String tel2) {
    this.tel2 = tel2;
  }

  public String getWebsite() {
    return website;
  }

  public void setWebsite(String website) {
    this.website = website;
  }

  public NationalityDto getNationalityDto() {
    return nationalityDto;
  }

  public void setNationalityDto(NationalityDto nationalityDto) {
    this.nationalityDto = nationalityDto;
  }

  public CountyDto getCountyDto() {
    return countyDto;
  }

  public void setCountyDto(CountyDto countyDto) {
    this.countyDto = countyDto;
  }

  public CityDto getCityDto() {
    return cityDto;
  }

  public void setCityDto(CityDto cityDto) {
    this.cityDto = cityDto;
  }

  public CountryDto getCountryDto() {
    return countryDto;
  }

  public void setCountryDto(CountryDto countryDto) {
    this.countryDto = countryDto;
  }
}