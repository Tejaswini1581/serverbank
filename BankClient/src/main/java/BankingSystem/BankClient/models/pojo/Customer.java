package BankingSystem.BankClient.models.pojo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class Customer {
	private String userId;
	@Size(min=4,max=25,message="Should have characters 4-25")
	private String firstName;
	@Size(min=4,max=25,message="Should have characters 4-25")
	private String lastName;
	@Pattern(regexp="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",message="Invalid email")
	private String mailId;
	@Pattern(regexp="^[1-9][0-9]{9}$",message="Invalid number")
	private String phoneNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dateOfBirth;
	private String gender;
	private Account accountNo;
	@Pattern(regexp = "^(?=.*\\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,20}$",message="Password must atleast be of length 8 chars and contain atleast a symbol, upper and lower case letters and a number")
	private String password;
	private String address;
	private String status;

	public Customer() {
		super();
	}

	public Customer(String userId, String firstName, String lastName, String mailId, String phoneNo,
			LocalDate dateOfBirth, String gender, Account accountNo, String password, String address, String status) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.mailId = mailId;
		this.phoneNo = phoneNo;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.accountNo = accountNo;
		this.password = password;
		this.address = address;
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Account getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Account accountNo) {
		this.accountNo = accountNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
