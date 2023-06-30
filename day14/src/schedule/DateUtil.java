package schedule;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class DateUtil {
	private static DateUtil instance = new DateUtil();
	
	public static DateUtil getInstance() {
		return instance;
	}
	
	public static Date toSqlDate(String param) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date1 = sdf.parse(param);
		long time = date1.getTime();
		java.sql.Date date2 = new java.sql.Date(time);
		return date2;
	}
	
	public static int getDaysDiff(ScheduleDTO dto) {
		int answer = 0;
		long eTime = dto.getEdate().getTime();
		long sTime = dto.getSdate().getTime();
		answer = (int)((eTime - sTime) / (1000 * 60 * 60 * 24));
		answer += 1;
		return answer;
	}
	
	
}
