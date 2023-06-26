package youtube;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;


public class CookieUtil {

	private static CookieUtil instance = new CookieUtil();
	
	public static CookieUtil getInstance() {
		return instance;
	}
	
	private CookieUtil() {}
	
	public static String add(String text, String idx) {	// ("5, 4, 3, 2, 1", "3")
		text = text.replaceAll(" ", "");	// 쿠키값 문자열에서 공백문자는 모두 제거한다
		String[] arr = text.split(",");		// 콤마로 구분하여 배열로 구성한다
		
		ArrayList<String> list = null;		// 리스트로 값을 관리한다
		if(text.equals("")) {				// 만약 쿠키값이 없으면
			list = new ArrayList<String>();	// 새로운 리스트를 생성
		}
		else {								// 쿠키에 값이 있으면
			list = new ArrayList<String>(Arrays.asList(arr));	// 배열 기반 리스트를 생성
			Collections.reverse(list);							// 리스트를 뒤집는다		[1,2,3,4,5]
		}
		
		list.remove(idx);	// 클릭한 idx를 리스트에서 제거(없으면 지나감)	[1,2,4,5]
		list.add(idx);		// 클릭한 idx를 리스트 마지막에 추가			[1,2,4,5,3]
		Collections.reverse(list);	// 다시 리스트를 뒤집는다 (마지막에 추가한 idx가 맨 앞으로 이동)	[3,5,4,2,1]
		
		String answer = "";		// 반환할 문자열
		if(list.size() > 5) {	// 추가한 이후 5개보다 값이 많다면
			answer = list.subList(0, 5).toString().substring(1);	// 0부터 5이전까지의 값만 문자열로 변환
		}															// 리스트를 문자열로 바꿀때 [ 제거
		else {
			answer = list.toString().substring(1);					// 크기가 초과하지 않으면 그냥 변환
		}
		answer = answer.substring(0, answer.indexOf("]"));	// 마지막 ] 제거
		return answer;		// 값이 추가된 새로운 문자열 반환	"3,5,4,2,1"
	}
}







