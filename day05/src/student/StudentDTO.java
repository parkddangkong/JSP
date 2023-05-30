package student;

// Data Transfer Object
// DB의 데이터를 자바 객체형태로 나타낸다
// 데이터를 DB에서 서버로 가져오거나, (DB -> WAS)
// 사용자 입력값을 자바객체로 변환하여 객체를 DB에 전달할 때 사용한다 (WAS -> DB)
// 데이터를 담는 그릇 역할의 클래스(테이블 레코드가 많다면 여러 객체가 존재할 수 있다)


public class StudentDTO {	// 자바 빈즈 규약에 맞게 작성
//	 name    varchar2(100),
//	 age     number,
//	 gender  varchar(50)
	
	private String name;
	private int age;
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
	private String gender;
}
