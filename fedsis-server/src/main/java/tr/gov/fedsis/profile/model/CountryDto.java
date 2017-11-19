package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;

import java.sql.Blob;

/**
 * Created by ahmet on 19.11.2017.
 */
public class CountryDto extends BaseDto {

    private String name;

    private String shortName;

    private Blob flagImage;

    public CountryDto() {
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