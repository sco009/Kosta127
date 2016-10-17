package wc.compile;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

public class WC_CompileService {
	private static WC_CompileService wc_service = new WC_CompileService();

	public static WC_CompileService wc_getInstance() {
		return wc_service;
	}

	// 기존에 있는 파일 삭제 
	// 기존에 class파일 존재하면, 에러 값 가져올 수 없음
	public static void wc_fileDelete(String wc_deleteFileName) {
		File wc_file = new File(wc_deleteFileName);

		if (wc_file.exists()) {
			wc_file.delete();
		}
	}

	// 컴파일 
	public String wc_getResultCompile(String wc_code) throws IOException,
			InterruptedException {
		
		Runtime wc_runtime = Runtime.getRuntime();
		String wc_javaName = wc_code.substring(13, wc_code.indexOf("{"));
		String wc_result = "";
		String wc_errResult = "";
		
		
		// class파일 삭제
		String wc_className = wc_javaName + ".class";
		wc_fileDelete(wc_className);
		// java파일 생성
		File wc_java = new File(wc_javaName + ".java");
		wc_java.createNewFile();
		System.out.println(wc_java.getAbsolutePath());

		FileWriter wc_writer = new FileWriter(wc_java);
		wc_writer.write(wc_code);
		wc_writer.close();

		Process javac_p = wc_runtime.exec("javac -encoding UTF-8 " + wc_java); // class파일 생성

		String wc_errStr = "";
		String wc_resultStr = "";

		// error출력
		BufferedReader wc_errorBF = new BufferedReader(new InputStreamReader(
				javac_p.getErrorStream()));
		while ((wc_errStr = wc_errorBF.readLine()) != null) {
			wc_errResult += wc_errStr + "\n";
		}

		if (wc_errResult != "")
			return wc_errResult;

		Process java_p = wc_runtime.exec("java  -Dfile.encoding=UTF-8 "+wc_javaName);

		// 성공 결과값 출력
		BufferedReader wc_inputBF = new BufferedReader(new InputStreamReader(
				java_p.getInputStream()));
		while ((wc_resultStr = wc_inputBF.readLine()) != null) {
			wc_result += wc_resultStr + "\n";
		}

		return wc_result;

	}

}
