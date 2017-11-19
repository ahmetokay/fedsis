package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;

/**
 * Created by ahmet on 19.11.2017.
 */
public class CountyDto extends BaseDto {

    private String name;

    private String shortName;

    private CityDto cityDto;

    public CountyDto() {
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

    public CityDto getCityDto() {
        return cityDto;
    }

    public void setCityDto(CityDto cityDto) {
        this.cityDto = cityDto;
    }
}