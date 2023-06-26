package youtube;

//	create table youtube_list (
//	    idx		nubmer		default youtube_list_seq.nextval primary key,
//	    title	varchar2(500)	not null,
//	    channel	varchar2(100)	not null,
//	    thumbnail	varchar2(500)	not null,    
//	    iframe	varchar2(500) 	not null
//	);

public class YoutubeDTO {
	private int idx;
	private String title;
	private String channel;
	private String thumbnail;
	private String iframe;
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
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getIframe() {
		return iframe;
	}
	public void setIframe(String iframe) {
		this.iframe = iframe;
	}
}
