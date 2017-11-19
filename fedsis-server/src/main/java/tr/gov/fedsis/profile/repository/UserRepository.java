package tr.gov.fedsis.profile.repository;

import com.tr.core.repository.repository.jpa.EntityJpaRepository;
import org.springframework.stereotype.Repository;
import tr.gov.fedsis.profile.entity.User;

/**
 * @author bocal
 */
@Repository
public interface UserRepository extends EntityJpaRepository<User> {

}