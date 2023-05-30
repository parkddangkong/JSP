package ex03;

//	create table student (
//		    name    varchar2(100),
//		    age     number,
//		    gender  varchar(50)
//		); 

public class StudentDTO {	// Data Transfer Object
							// 데이터를 전달(DB <-> Web Application Server)하는 객체
	private String name;
	private int age;
	private String gender;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	}


