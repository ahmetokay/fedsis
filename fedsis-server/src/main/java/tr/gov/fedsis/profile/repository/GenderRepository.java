package tr.gov.fedsis.profile.repository;

import com.tr.core.repository.repository.jpa.EntityJpaRepository;
import org.springframework.stereotype.Repository;
import tr.gov.fedsis.profile.entity.Gender;

/**
 * @author bocal
 */
@Repository
public interface GenderRepository extends EntityJpaRepository<Gender> {

}