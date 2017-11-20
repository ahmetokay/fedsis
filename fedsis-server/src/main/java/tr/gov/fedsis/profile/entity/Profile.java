package tr.gov.fedsis.profile.entity;

import com.core.tr.entity.BaseEntity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Profil islemleri icin kullanilacak olan siniftir.
 *
 * @author bocal
 */
@Entity
@Table(name = "profile")
public class Profile extends BaseEntity {

  @Column(name = "name")
  private String name;

  @Column(name = "middle_name")
  private String middleName;

  @Column(name = "surname")
  private String surname;

  @Column(name = "father_name")
  private String fatherName;

  @Column(name = "mother_name")
  private String motherName;

  @Column(name = "gender")
//  @Enumerated(value = EnumType.STRING)
  private String gender;

  @Column(name = "blood_type")
//  @Enumerated(value = EnumType.STRING)
  private String bloodType;

  @Column(name = "passport_no")
  private String passportNo;

  @Column(name = "social_number")
  private String socialNumber;

  @Column(name = "address")
  private String address;

  @Column(name = "postal_code")
  private String postalCode;

  @Column(name = "email")
  private String email;

  @Column(name = "mobile_number")
  private String mobileNumber;

  @Column(name = "fax_number")
  private String faxNumber;

  @Column(name = "tel_1")
  private String tel1;

  @Column(name = "tel_2")
  private String tel2;

  @Column(name = "web_site")
  private String website;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_nationality_id")
  private Nationality nationality;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_county_id")
  private County county;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_city_id")
  private City city;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_country_id")
  private Country country;

  public Profile() {
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

  public Nationality getNationality() {
    return nationality;
  }

  public void setNationality(Nationality nationality) {
    this.nationality = nationality;
  }

  public County getCounty() {
    return county;
  }

  public void setCounty(County county) {
    this.county = county;
  }

  public City getCity() {
    return city;
  }

  public void setCity(City city) {
    this.city = city;
  }

  public Country getCountry() {
    return country;
  }

  public void setCountry(Country country) {
    this.country = country;
  }
}