package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;

/**
 * Created by ahmet on 19.11.2017.
 */
public class DepartmentDto extends BaseDto {

    private String name;

    private String description;

    private DepartmentDto parentDepartmentDto;

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

    public DepartmentDto getParentDepartmentDto() {
        return parentDepartmentDto;
    }

    public void setParentDepartmentDto(DepartmentDto parentDepartmentDto) {
        this.parentDepartmentDto = parentDepartmentDto;
    }
}