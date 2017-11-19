package tr.gov.fedsis.profile.entity;

import com.core.tr.entity.BaseEntity;

import javax.persistence.*;
import java.sql.Blob;
import java.util.Date;

/**
 * Created by ahmet on 19.11.2017.
 */
@Entity
@Table(name = "club_team")
public class Club extends BaseEntity {

    @Column(name = "name")
    private String name;

    @Column(name = "short_name")
    private String shortName;

    @Column(name = "form_color")
    private String formColor;

    @Column(name = "club_image")
    private Blob clubImage;

    @Column(name = "start_date")
    private Date startDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fk_department_id")
    private Department department;

    public Club() {
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

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}