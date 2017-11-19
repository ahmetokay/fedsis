package tr.gov.fedsis.profile.repository;

import com.tr.core.repository.repository.jpa.EntityJpaRepository;
import org.springframework.stereotype.Repository;
import tr.gov.fedsis.profile.entity.County;

/**
 * @author bocal
 */
@Repository
public interface CountyRepository extends EntityJpaRepository<County> {

}