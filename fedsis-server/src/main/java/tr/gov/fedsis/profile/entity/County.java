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
@Table(name = "county")
public class County extends BaseEntity {

  @Column(name = "name")
  private String name;

  @Column(name = "short_name")
  private String shortName;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_city_id")
  private City city;

  public County() {
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

  public City getCity() {
    return city;
  }

  public void setCity(City city) {
    this.city = city;
  }
}