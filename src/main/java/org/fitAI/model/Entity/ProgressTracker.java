package org.fitAI.model.Entity;

import java.sql.Date;

import jakarta.persistence.*;


@Entity
@Table(name = "progress_tracker")
public class ProgressTracker {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int userId;
	private Date date;
	private float weight;
	private String imagePath;
	private String notes;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	
}
