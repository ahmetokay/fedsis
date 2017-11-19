package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Department;
import tr.gov.fedsis.profile.model.DepartmentDto;

/**
 * @author bocal
 */
@Component
public class DepartmentConverter extends AbstractBaseConverter<DepartmentDto, Department> {

    @Override
    protected void doConvertToDto(DepartmentDto dto, Department entity) {
        dto.setName(entity.getName());
        dto.setDescription(entity.getDescription());

        Department parentDepartment = entity.getParentDepartment();
        if (parentDepartment != null) {
            dto.setParentDepartmentDto(convertToDto(parentDepartment));
        }
    }

    @Override
    protected void doConvertToEntity(Department entity, DepartmentDto dto) {
        entity.setName(dto.getName());
        entity.setDescription(dto.getDescription());

        DepartmentDto parentDepartmentDto = dto.getParentDepartmentDto();
        if (parentDepartmentDto != null) {
            entity.setParentDepartment(convertToEntity(parentDepartmentDto));
        }
    }
}