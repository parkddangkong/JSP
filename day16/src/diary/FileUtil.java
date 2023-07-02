package diary;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

// request를 전달받아서, 파일 업로드를 수행하고, DTO로 구성하여 반환하기
// 파일 업로드를 수행하기 위해서는 MultipartRequest가 필요하다
// MultipartRequest의 생성자에는 5개의 매개변수를 전달한다
// request, saveDirectory, maxPostSize, encoding, policy

public class FileUtil {

	private final String saveDirectory;
	private final int maxPostSize = 20 * 1024 * 1024;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	private static FileUtil instance;
	
	public static FileUtil getInstance(HttpServletRequest request) {
		if(instance == null) {
			instance = new FileUtil(request);
		}
		return instance;
	}
	
	private FileUtil(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		saveDirectory = application.getRealPath("image");
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
		
		System.out.println(saveDirectory);
	}
	
	public DiaryDTO getDTO(HttpServletRequest request) throws IOException {
		DiaryDTO dto = new DiaryDTO();
		
		// 파일 업로드 완료
		MultipartRequest req = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		
		// content, pic, ipaddr
		String content = req.getParameter("content");
		String pic = req.getFile("pic").getName();
		String ipaddr = request.getRemoteAddr();
		
		if("0:0:0:0:0:0:0:1".equals(ipaddr)) {
			ipaddr = "127.0.0.1";
		}
		dto.setContent(content);
		dto.setIpaddr(ipaddr);
		dto.setPic(pic);
		
		return dto;
	}
}







