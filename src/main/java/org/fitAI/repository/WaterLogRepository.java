package org.fitAI.repository;

import java.util.List;

import org.fitAI.model.Entity.WaterLog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WaterLogRepository extends JpaRepository<WaterLog, Long> {
    List<WaterLog> findAllByOrderByTimestampDesc();
}

