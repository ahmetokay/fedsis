package tr.gov.fedsis.profile.entity;

import com.core.tr.entity.BaseEntity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Created by ahmet on 19.11.2017.
 */
@Entity
@Table(name = "body_size")
public class BodySize extends BaseEntity {

  @Column(name = "length")
  private String length;

  @Column(name = "shoes_number")
  private String shoesNumber;

  @Column(name = "sport_shoes_number")
  private String sportShoesNumber;

  @Column(name = "weight")
  private String weight;

  @Column(name = "dress_size")
  private String dressSize;

  @Column(name = "pant_size")
  private String pantSize;

  @Column(name = "top_size")
  private String topSize;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_profile_relation_id")
  private ProfileRelation profileRelation;

  public BodySize() {
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

  public ProfileRelation getProfileRelation() {
    return profileRelation;
  }

  public void setProfileRelation(ProfileRelation profileRelation) {
    this.profileRelation = profileRelation;
  }
}