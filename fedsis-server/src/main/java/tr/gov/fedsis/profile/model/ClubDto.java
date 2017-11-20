package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;
import java.sql.Blob;
import java.util.Date;

/**
 * Created by ahmet on 19.11.2017.
 */
public class ClubDto extends BaseDto {

  private String name;

  private String shortName;

  private String formColor;

  private Blob clubImage;

  private Date startDate;

  private DepartmentDto departmentDto;

  public ClubDto() {
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

  public String getFormColor() {
    return formColor;
  }

  public void setFormColor(String formColor) {
    this.formColor = formColor;
  }

  public Blob getClubImage() {
    return clubImage;
  }

  public void setClubImage(Blob clubImage) {
    this.clubImage = clubImage;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public DepartmentDto getDepartmentDto() {
    return departmentDto;
  }

  public void setDepartmentDto(DepartmentDto departmentDto) {
    this.departmentDto = departmentDto;
  }
}