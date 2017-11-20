package tr.gov.fedsis.profile.entity;

import com.core.tr.entity.BaseEntity;
import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by ahmet on 19.11.2017.
 */
@Entity
@Table(name = "nationality")
public class Nationality extends BaseEntity {

  @Column(name = "name")
  private String name;

  @Column(name = "short_name")
  private String shortName;

  @Column(name = "flag_image")
  private Blob flagImage;

  public Nationality() {
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getShortName() {
    return shortName;
  }

  public void setShortName(String shortName) {
    this.shortName = shortName;
  }

  public Blob getFlagImage() {
    return flagImage;
  }

  public void setFlagImage(Blob flagImage) {
    this.flagImage = flagImage;
  }
}