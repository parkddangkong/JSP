package phonebook;

//	create table phonebook (
//		idx			number			default phonebook_seq.nextval primary key,
//		name		varchar2(50)	not null,
//		pnum		varchar2(20)	not null,
//		bookmark	number(1)		default -1 check(bookmark between 1 and -1)
//	);


public class PhoneBookDTO {

	private int idx;
	private String name;
	private String pnum;
	private int bookmark;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public int getBookmark() {
		return bookmark;
	}
	public void setBookmark(int bookmark) {
		this.bookmark = bookmark;
	}
	
}
