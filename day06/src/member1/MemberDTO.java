package member1;

//	create table member1 (
//	    idx         number          default member1_seq.nextval primary key,
//	    userid      varchar2(100)   unique not null,
//	    userpw      varchar2(100)   not null,
//	    username    varchar2(100)   not null,
//	    email       varchar2(100)   not null,
//	    birth       varchar2(100)   default sysdate,
//	    gender      varchar2(20)    check(gender in ('남성', '여성')),
//	    age         number          check(age between 0 and 100)
//	);

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
