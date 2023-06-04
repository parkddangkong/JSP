package phone_number;

//idx     number      default phone_number_seq.nextval primary key,
//name    VARCHAR2(100)   not null,
//pnumber  VARCHAR2(100)   not null,
//bookmark    number

public class Phone_numberDTO {
	private int idx;
	private String name;
	private String pnumber;
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
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public int getBookmark() {
		return bookmark;
	}
	public void setBookmark(int bookmark) {
		this.bookmark = bookmark;
	}

}
