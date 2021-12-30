package com.oracle.yduProject.dao;

import java.util.List;

import com.oracle.yduProject.model.B_Comment;
import com.oracle.yduProject.service.CommentService;

public interface CommentDao {

	List<B_Comment> commList(B_Comment comment);

	int commWrite(B_Comment comment);

	int commDelete(int c_num);

	int commUpdate(B_Comment comment);

	List<B_Comment> classCommentList(B_Comment comment);

	int classCommWrite(B_Comment comment);

	int classCommDelete(int c_num);

	int classCommUpdate(B_Comment comment);



}
