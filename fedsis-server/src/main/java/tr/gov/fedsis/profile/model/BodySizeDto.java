package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;

/**
 * Created by ahmet on 19.11.2017.
 */
public class BodySizeDto extends BaseDto {

  private String length;

  private String shoesNumber;

  private String sportShoesNumber;

  private String weight;

  private String dressSize;

  private String pantSize;

  private String topSize;

  private ProfileRelationDto profileRelationDto;

  public BodySizeDto() {
  }

  public String getLength() {
    return length;
  }

  public void setLength(String length) {
    this.length = length;
  }

  public String getShoesNumber() {
    return shoesNumber;
  }

  public void setShoesNumber(String shoesNumber) {
    this.shoesNumber = shoesNumber;
  }

  public String getSportShoesNumber() {
    return sportShoesNumber;
  }

  public void setSportShoesNumber(String sportShoesNumber) {
    this.sportShoesNumber = sportShoesNumber;
  }

  public String getWeight() {
    return weight;
  }

  public void setWeight(String weight) {
    this.weight = weight;
  }

  public String getDressSize() {
    return dressSize;
  }

  public void setDressSize(String dressSize) {
    this.dressSize = dressSize;
  }

  public String getPantSize() {
    return pantSize;
  }

  public void setPantSize(String pantSize) {
    this.pantSize = pantSize;
  }

  public String getTopSize() {
    return topSize;
  }

  public void setTopSize(String topSize) {
    this.topSize = topSize;
  }

  public ProfileRelationDto getProfileRelationDto() {
    return profileRelationDto;
  }

  public void setProfileRelationDto(ProfileRelationDto profileRelationDto) {
    this.profileRelationDto = profileRelationDto;
  }
}