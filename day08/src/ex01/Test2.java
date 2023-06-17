package ex01;

public class Test2 {
	
	// 하나의 클래스는 어디서나 하나의 객체만 참조할 수 있도록 구성하기
	
	// 생성자를 호출할 수 있도록 허용하면, 여러 객체가 만들어진다
	// 생성자를 외부에서 호출할 수 없도록 처리한다
	// 외부에서는 호출할 수 없으나, 내부에서는 자유롭게 호출할 수 있다
	// 객체를 생성할 수 없도록 막았기 때문에, 생성에 관련된 메서드는 객체 없이도 작동해야 한다
	// 따라서, static필드와 메서드를 활용한다
	
	private static Test2 instance;	// 클래스의 객체를 저장할 필드
	
	public static Test2 getInstance() {	// 만들어진 단일 객체를 반환하는 static 메서드
		if(instance == null) {
			instance = new Test2();	// 내부에서는 자유롭게 생성자 호출 가능
		}
		return instance;	// 만약 객체가 만들어져있다면, 기존 객체를 반환하고
							// 객체가 없다면 한번만 새로 생성하여 객체를 반환한다
	}

	private Test2() {
		// 외부에서는 기본생성자를 호출할 수 없다
		// <jsp:useBean> 으로 객체를 생성할 수 없다
	}
	
	public String toString() {
		return super.toString() + "(싱글톤 객체)";
	}
}
