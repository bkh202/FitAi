package org.fitAI.repository;

import java.util.List;

import org.fitAI.model.Entity.BMIRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BMIRecordRepository extends JpaRepository<BMIRecord, Integer> {
    List<BMIRecord> findByUserIdOrderByDateDesc(int userId);
    List<BMIRecord> findByUserId(int userId);
}
