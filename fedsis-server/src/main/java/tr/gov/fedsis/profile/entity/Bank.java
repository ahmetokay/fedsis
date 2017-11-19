package tr.gov.fedsis.profile.entity;

import com.core.tr.entity.BaseEntity;

import javax.persistence.*;

/**
 * Created by ahmet on 19.11.2017.
 */
@Entity
@Table(name = "bank")
public class Bank extends BaseEntity {

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "owner")
    private String owner;

    @Column(name = "iban")
    private String iban;

    @Column(name = "account_no")
    private String accountNo;

    @Column(name = "branch_code")
    private String branchCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fk_currency_id")
    private Currency currency;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fk_profile_relation_id")
    private ProfileRelation profileRelation;

    public Bank() {
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

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getIban() {
        return iban;
    }

    public void setIban(String iban) {
        this.iban = iban;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getBranchCode() {
        return branchCode;
    }

    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }

    public Currency getCurrency() {
        return currency;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }

    public ProfileRelation getProfileRelation() {
        return profileRelation;
    }

    public void setProfileRelation(ProfileRelation profileRelation) {
        this.profileRelation = profileRelation;
    }
}