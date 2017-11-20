package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Club;
import tr.gov.fedsis.profile.entity.Department;
import tr.gov.fedsis.profile.model.ClubDto;
import tr.gov.fedsis.profile.model.DepartmentDto;

/**
 * @author bocal
 */
@Component
public class ClubConverter extends AbstractBaseConverter<ClubDto, Club> {

  private DepartmentConverter departmentConverter;

  @Autowired
  public ClubConverter(DepartmentConverter departmentConverter) {
    this.departmentConverter = departmentConverter;
  }

  @Override
  protected void doConvertToDto(ClubDto dto, Club entity) {
    dto.setName(entity.getName());
    dto.setShortName(entity.getShortName());
    dto.setFormColor(entity.getFormColor());
    dto.setClubImage(entity.getClubImage());
    dto.setStartDate(entity.getStartDate());

    Department department = entity.getDepartment();
    if (department != null) {
      dto.setDepartmentDto(departmentConverter.convertToDto(department));
    }
  }

  @Override
  protected void doConvertToEntity(Club entity, ClubDto dto) {
    entity.setName(dto.getName());
    entity.setShortName(dto.getShortName());
    entity.setFormColor(dto.getFormColor());
    entity.setClubImage(dto.getClubImage());
    entity.setStartDate(dto.getStartDate());

    DepartmentDto departmentDto = dto.getDepartmentDto();
    if (departmentDto != null) {
      entity.setDepartment(departmentConverter.convertToEntity(departmentDto));
    }
  }
}