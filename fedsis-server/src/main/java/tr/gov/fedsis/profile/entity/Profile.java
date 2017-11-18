package tr.gov.fedsis.profile.entity;

import com.core.tr.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
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

    @Column(name = "middleName")
    private String middleName;

    @Column(name = "surname")
    private String surname;

    @Column(name = "fatherName")
    private String fatherName;

    @Column(name = "motherName")
    private String motherName;

    @Column(name = "gender")
//  @Enumerated(value = EnumType.STRING)
    private String gender;

    @Column(name = "bloodType")
//  @Enumerated(value = EnumType.STRING)
    private String bloodType;

    @Column(name = "city")
    private String city;

    @Column(name = "country")
    private String country;

    @Column(name = "passportNo")
    private String passportNo;

    @Column(name = "password")
    private String password;

    @Column(name = "isUser")
    private Boolean isUser;

    @Column(name = "nationalityId")
    private String nationalityId;


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

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPassportNo() {
        return passportNo;
    }

    public void setPassportNo(String passportNo) {
        this.passportNo = passportNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getUser() {
        return isUser;
    }

    public void setUser(Boolean user) {
        isUser = user;
    }

    public String getNationalityId() {
        return nationalityId;
    }

    public void setNationalityId(String nationalityId) {
        this.nationalityId = nationalityId;
    }
}
