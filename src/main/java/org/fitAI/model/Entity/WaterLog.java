package org.fitAI.model.Entity;



import java.time.LocalDateTime;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "water_logs")
public class WaterLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double weight;
    private String gender;
    private String activity;
    private String climate;
    private int recommendedMl;
    private LocalDateTime timestamp;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getActivity() {
		return activity;
	}
	public void setActivity(String activity) {
		this.activity = activity;
	}
	public String getClimate() {
		return climate;
	}
	public void setClimate(String climate) {
		this.climate = climate;
	}
	public int getRecommendedMl() {
		return recommendedMl;
	}
	public void setRecommendedMl(int recommendedMl) {
		this.recommendedMl = recommendedMl;
	}
	public LocalDateTime getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(LocalDateTime localDateTime) {
		this.timestamp = localDateTime;
	}

   
}
