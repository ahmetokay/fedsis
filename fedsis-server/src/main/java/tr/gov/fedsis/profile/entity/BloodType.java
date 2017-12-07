package tr.gov.fedsis.profile.entity;

import com.core.tr.entity.BaseEntity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by ahmet on 19.11.2017.
 */
@Entity
@Table(name = "blood_type")
public class BloodType extends BaseEntity {

  @Column(name = "name")
  private String name;

  @Column(name = "description")
  private String description;

  public BloodType() {
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }
}