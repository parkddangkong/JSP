package sales;

public class SalesDTO {
//	create table sales (
//		    idx	    varchar2(100)   default to_char(sysdate, 'yyyy-MM-dd') || '_' || to_char(sales_seq.nextval, 'fm0000') primary key,
//		    name    varchar2(100)   not null,
//		    price   number          check(price >= 1000),
//		    cnt     number          check(cnt >= 1),
//		    status  number(1)       default 1 check(status in (1, 0)) 
//		);
	private String idx;
	private String name;
	private int price;
	private int cnt;
	private int status;

	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
