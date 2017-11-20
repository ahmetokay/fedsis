package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Bank;
import tr.gov.fedsis.profile.entity.Currency;
import tr.gov.fedsis.profile.entity.ProfileRelation;
import tr.gov.fedsis.profile.model.BankDto;
import tr.gov.fedsis.profile.model.CurrencyDto;
import tr.gov.fedsis.profile.model.ProfileRelationDto;

/**
 * @author bocal
 */
@Component
public class BankConverter extends AbstractBaseConverter<BankDto, Bank> {

  private CurrencyConverter currencyConverter;

  private ProfileRelationConverter profileRelationConverter;

  @Autowired
  public BankConverter(CurrencyConverter currencyConverter,
      ProfileRelationConverter profileRelationConverter) {
    this.currencyConverter = currencyConverter;
    this.profileRelationConverter = profileRelationConverter;
  }

  @Override
  protected void doConvertToDto(BankDto dto, Bank entity) {
    dto.setName(entity.getName());
    dto.setDescription(entity.getDescription());
    dto.setOwner(entity.getOwner());
    dto.setIban(entity.getIban());
    dto.setAccountNo(entity.getAccountNo());
    dto.setBranchCode(entity.getBranchCode());

    Currency currency = entity.getCurrency();
    if (currency != null) {
      dto.setCurrencyDto(currencyConverter.convertToDto(currency));
    }

    ProfileRelation profileRelation = entity.getProfileRelation();
    if (profileRelation != null) {
      dto.setProfileRelationDto(profileRelationConverter.convertToDto(profileRelation));
    }
  }

  @Override
  protected void doConvertToEntity(Bank entity, BankDto dto) {
    entity.setName(dto.getName());
    entity.setDescription(dto.getDescription());
    entity.setOwner(dto.getOwner());
    entity.setIban(dto.getIban());
    entity.setAccountNo(dto.getAccountNo());
    entity.setBranchCode(dto.getBranchCode());

    CurrencyDto currencyDto = dto.getCurrencyDto();
    if (currencyDto != null) {
      entity.setCurrency(currencyConverter.convertToEntity(currencyDto));
    }

    ProfileRelationDto profileRelationDto = dto.getProfileRelationDto();
    if (profileRelationDto != null) {
      entity.setProfileRelation(profileRelationConverter.convertToEntity(profileRelationDto));
    }
  }
}