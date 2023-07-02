package ex02;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil<FileRenamePolicy> {
	
	private static FileUtil instance;
	
	private FileUtil(HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		saveDirectory = application.getRealPath("image");
	}
	
	public static FileUtil getInstance(HttpServletRequest request) {
		if(instance == null) {
			instance = new FileUtil(request);
		}
		return instance;
	}

	private String saveDirectory;
	private int maxPostSize = 20 * 1024 * 1024;	// 20MB
	private String encoding = "UTF-8";
	private FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	// 내장 객체 request를 전달받아서 파일을 반환하는 메서드
	public File getUploadFile(HttpServletRequest request) throws IOException {
		File uploadFile = null;
		
		ServletContext application = request.getServletContext();
		saveDirectory = application.getRealPath("image");
		
		File dir = new File(saveDirectory);	// 저장할 디렉토리 (폴더)
		if(dir.exists() == false) {			// 만약 디렉토리가 없으면
			dir.mkdirs();					// 디렉토리를 생성한다
		}
		
		MultipartRequest req = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		
		uploadFile = req.getFile("uploadFile");
		
		return uploadFile;
	}

	// saveDirectory에 저장된 파일의 이름을 리스트로 반환하기
	public List<String> getFileList() {
		ArrayList<String> list = new ArrayList<String>();
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			return list;
		}
		String[] arr = dir.list();
		for(String s : arr) {
			list.add(s);
		}
		System.out.println(saveDirectory);
		return list;
	}
}
