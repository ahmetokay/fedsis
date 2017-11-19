package tr.gov.fedsis.profile.model;

import com.core.tr.model.BaseDto;

/**
 * Created by ahmet on 19.11.2017.
 */
public class BankDto extends BaseDto {

    private String name;

    private String description;

    private String owner;

    private String iban;

    private String accountNo;

    private String branchCode;

    private CurrencyDto currencyDto;

    private ProfileRelationDto profileRelationDto;

    public BankDto() {
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

    public CurrencyDto getCurrencyDto() {
        return currencyDto;
    }

    public void setCurrencyDto(CurrencyDto currencyDto) {
        this.currencyDto = currencyDto;
    }

    public ProfileRelationDto getProfileRelationDto() {
        return profileRelationDto;
    }

    public void setProfileRelationDto(ProfileRelationDto profileRelationDto) {
        this.profileRelationDto = profileRelationDto;
    }
}