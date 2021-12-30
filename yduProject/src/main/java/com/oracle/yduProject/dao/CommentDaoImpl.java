package com.oracle.yduProject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.yduProject.model.B_Comment;
import com.oracle.yduProject.model.Board;
import com.oracle.yduProject.service.CommentService;

@Repository
public class CommentDaoImpl implements CommentDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<B_Comment> commList(B_Comment comment) {
		List<B_Comment> commList = null;
		System.out.println("**** CommentDaoImpl [commList] Start! ****");

		try {
			commList = session.selectList("commList", comment);
			System.out.println("commList ::: " + commList);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return commList;
	}

	@Override
	public int commWrite(B_Comment comment) {
		int result = 0;

		try {
			result = session.insert("commWrite", comment);
		} catch (Exception e) {
			e.getStackTrace();
		}

		return result;
	}

	@Override
	public int commDelete(int c_num) {
		int result = 0;

		try {
			result = session.delete("commDelete", c_num);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return result;
	}

	@Override
	public int commUpdate(B_Comment comment) {
		int result = 0;

		try {
			result = session.update("commUpdate", comment);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return result;
	}

	@Override
	public List<B_Comment> classCommentList(B_Comment comment) {
		List<B_Comment> classCommentList = null;
		System.out.println("**** CommentDaoImpl [classCommentList] Start! ****");
		
		try {
			classCommentList = session.selectList("classCommentList", comment);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return classCommentList;
	}

	@Override
	public int classCommWrite(B_Comment comment) {
		int result = 0;
		
		try {
			result = session.insert("classCommWrite",comment);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return result;
	}

	@Override
	public int classCommDelete(int c_num) {
		System.out.println("CommentDaoImpl classCommDelete Start");
		int result = 0;

		try {
			result = session.delete("classCommDelete", c_num);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return result;
	}

	@Override
	public int classCommUpdate(B_Comment comment) {
		System.out.println("CommentDaoImpl clasCommUpdate Start");
		int result = 0;
		
		try {
			result = session.update("classCommUpdate", comment);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return result;
	}

}
