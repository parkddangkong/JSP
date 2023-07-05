package board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	
	private final String saveDirectory = "D:\\upload";
	private final int maxPostSize = 20 * 1024 * 1024;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	private static FileUtil instance = new FileUtil();
	
	public static FileUtil getInstance() {
		return instance;
	}
	
	private FileUtil() {
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	public BoardDTO getDTO(HttpServletRequest request) throws IOException {
		BoardDTO dto = new BoardDTO();
		
		// 1) 파일이 있는가 없는가 판별하기
		MultipartRequest req = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy);
		
		File upload = req.getFile("upload");	// <input type="file" name="upload">
		boolean isNull = upload == null;
		
		dto.setWriter(Integer.parseInt(req.getParameter("writer")));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setIpaddr(request.getRemoteAddr());
		dto.setUserAgent(request.getHeader("user-agent"));
		dto.setFileName(isNull ? null : upload.getName());
		
		return dto;
	}
	
	

}
