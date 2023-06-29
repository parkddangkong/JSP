package ex03;

public class Ex03DAO {

	// 싱글톤
	private static Ex03DAO instance = new Ex03DAO();
	
	public static Ex03DAO getInstance() {
		return instance;
	}
	private Ex03DAO() {}
	
	// 데이터
	private String[][] arr = {
			{"test", 	"admin", 	"itbank"},	
			{"1234", 	"1", 		"it"},	
			{"테스트", 	"관리자", 	"아이티뱅크"},	
	};
	
	// 메서드
	public Ex03DTO login(Ex03DTO user) {
		Ex03DTO dto = null;
		for(int i = 0; i < 3; i++) {
			if(arr[0][i].equals(user.getUserid())) {
				if(arr[1][i].equals(user.getUserpw())) {
					dto = new Ex03DTO();
					dto.setUserid(arr[0][i]);
					dto.setUserpw(arr[1][i]);
					dto.setUsername(arr[2][i]);
					break;
				}
			}
		}
		return dto;
	}
}
