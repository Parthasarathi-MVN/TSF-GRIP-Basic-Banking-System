package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="transfers")
public class Transfer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int transfer_amt;
	private String from_acc;
	private String to_acc;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTransfer_amt() {
		return transfer_amt;
	}
	public void setTransfer_amt(int transfer_amt) {
		this.transfer_amt = transfer_amt;
	}
	public String getFrom_acc() {
		return from_acc;
	}
	public void setFrom_acc(String from_acc) {
		this.from_acc = from_acc;
	}
	public String getTo_acc() {
		return to_acc;
	}
	public void setTo_acc(String to_acc) {
		this.to_acc = to_acc;
	}
	
	
	public Transfer(int id, int transfer_amt, String from_acc, String to_acc) {
		super();
		this.id = id;
		this.transfer_amt = transfer_amt;
		this.from_acc = from_acc;
		this.to_acc = to_acc;
	}
	
	public Transfer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
