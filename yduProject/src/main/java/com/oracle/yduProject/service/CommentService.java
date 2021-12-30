package com.oracle.yduProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oracle.yduProject.model.B_Comment;

public interface CommentService {

	List<B_Comment> commList(B_Comment comment);

	String commWrite(B_Comment comment);

	String commDelete(HttpServletRequest request);

	String commUpdate(B_Comment comment);

	List<B_Comment> classCommentList(B_Comment comment);

	String classCommWrite(B_Comment comment);

	String classCommDelete(HttpServletRequest request);

	String classCommUpdate(B_Comment comment);

}
