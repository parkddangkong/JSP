package diary;

import java.sql.Date;

//	IDX       NOT NULL NUMBER         
//	PIC       NOT NULL VARCHAR2(255)  
//	CONTENT   NOT NULL VARCHAR2(2000) 
//	WRITEDATE          DATE           
//	IPADDR    NOT NULL VARCHAR2(50)  

public class DiaryDTO {
	private int idx;
	private String pic;
	private String content;
	private Date writeDate;
	private String ipaddr;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	
	
}
