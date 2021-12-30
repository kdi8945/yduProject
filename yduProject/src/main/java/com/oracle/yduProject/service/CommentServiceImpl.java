package com.oracle.yduProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.yduProject.dao.CommentDao;
import com.oracle.yduProject.model.B_Comment;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDao cd;

	@Override
	public List<B_Comment> commList(B_Comment comment) {
		System.out.println("///CommentServiceImpl [commList] START///");

		return cd.commList(comment);
	}

	@Override
	public String commWrite(B_Comment comment) {
		System.out.println("///CommentServiceImpl [commWrite] START///");

		String str;
		int result = cd.commWrite(comment);
		if (result > 0) {
			str = "writeok";
		} else {
			str = "writeerror";
		}
		return str;

	}

	@Override
	public String commDelete(HttpServletRequest request) {
		System.out.println("///CommentServiceImpl [commDelete] START///");

		String result = null;
		int c_num = Integer.parseInt(request.getParameter("c_num"));

		int commDelete = cd.commDelete(c_num);
		if (commDelete > 0) {
			result = "deleteok";
		} else {
			result = "deleteerror";
		}
		return result;
	}

	@Override
	public String commUpdate(B_Comment comment) {
		System.out.println("///CommentServiceImpl [commUpdate] START///");
		String result;
		int commUpdate = cd.commUpdate(comment);
		if (commUpdate > 0) {
			result = "updateok";
		} else {
			result = "updateerror";
		}

		return result;
	}

	@Override
	public List<B_Comment> classCommentList(B_Comment comment) {
		System.out.println("CommentServiceImpl classCommentList Start!");
		
		return cd.classCommentList(comment);
	}

	@Override
	public String classCommWrite(B_Comment comment) {
		System.out.println("CommServiceImpl classCommWrite Start");
		
		String result;
		int classCommWrite = cd. classCommWrite(comment);
		if(classCommWrite > 0) {
			result = "classCommWriteOK";
		}else {
			result = "classCommWriteError";
		}
		return result;
	}
	@Override
	public String classCommDelete(HttpServletRequest request) {
		System.out.println("CommServiceImpl classCommDelete Start");
		String result = null;
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		
		int classCommDelete = cd.classCommDelete(c_num);
		
		if(classCommDelete > 0) {
			result = "classCommDeleteOK";
		}else {
			result = "classCommDeleteError";
		}
		return result;
	}

	@Override
	public String classCommUpdate(B_Comment comment) {
		System.out.println("CommServiceImpl classCommUpdate Start ");
		String result = null;
		int classCommUpdate = cd.classCommUpdate(comment);
		
		if(classCommUpdate > 0) {
			result = "classCommUpdateOK";
		}else {
			result = "classCommUpdateError";
		}
		return result;
	}

}
