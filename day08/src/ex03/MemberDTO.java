package ex03;

//IDX      NOT NULL NUMBER        
//USERID   NOT NULL VARCHAR2(100) 
//USERPW   NOT NULL VARCHAR2(100) 
//USERNAME NOT NULL VARCHAR2(100) 
//EMAIL    NOT NULL VARCHAR2(100) 
//BIRTH             VARCHAR2(100) 
//GENDER            VARCHAR2(20)  
//AGE               NUMBER        


public class MemberDTO {
	
	private int idx;
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String birth;
	private String gender;
	private int age;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	

}
