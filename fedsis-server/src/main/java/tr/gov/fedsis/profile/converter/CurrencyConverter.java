package tr.gov.fedsis.profile.converter;

import com.core.tr.converter.AbstractBaseConverter;
import org.springframework.stereotype.Component;
import tr.gov.fedsis.profile.entity.Currency;
import tr.gov.fedsis.profile.model.CurrencyDto;

/**
 * @author bocal
 */
@Component
public class CurrencyConverter extends AbstractBaseConverter<CurrencyDto, Currency> {

    @Override
    protected void doConvertToDto(CurrencyDto dto, Currency entity) {
        dto.setName(entity.getName());
        dto.setDescription(entity.getDescription());
    }

    @Override
    protected void doConvertToEntity(Currency entity, CurrencyDto dto) {
        entity.setName(dto.getName());
        entity.setDescription(dto.getDescription());
    }
}