package day07;

public class ScheduleDTO {
//	create table schedule (
//			idx		    number		    default schedule_seq.nextval primary key,
//			title		varchar2(100)	not null,
//			memo		varchar2(1000)	not null,
//			sdate		date		    not null
//		);
	private int idx;
	private String title;
	private String memo;
	private String sdate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	

}
