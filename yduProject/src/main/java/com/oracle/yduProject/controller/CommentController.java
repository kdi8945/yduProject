package com.oracle.yduProject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.yduProject.model.B_Comment;
import com.oracle.yduProject.service.CommentService;

@Controller
public class CommentController {

	@Autowired
	private CommentService comm;

	@RequestMapping("commWrite")
	@ResponseBody
	public String commWrite(B_Comment comment) {
		System.out.println("CommentController [commWrite] Start");
		String result = comm.commWrite(comment);
		return result;
	}
	
	@RequestMapping("commDelete")
	@ResponseBody
	public String commDelete(HttpServletRequest request) {
		System.out.println("CommentController [commDelete] Start");
		String result = comm.commDelete(request);
		
		return result;
	}
	
	@RequestMapping("commUpdate")
	@ResponseBody
	public String commUpdate(B_Comment comment) {
		System.out.println("CommentController [commUpdate] Start");
		String result = comm.commUpdate(comment);
		
		return result;
	}
	
	
	@RequestMapping("classCommWrite")
	@ResponseBody
	public String classCommWrite(B_Comment comment) {
		System.out.println("CommentController [classCommWrite]  Start!");
		String result = comm.classCommWrite(comment);
		
		return result;
	}
	
	@RequestMapping("classCommDelete")
	@ResponseBody
	public String classCommDelete(HttpServletRequest request) {
		System.out.println("CommentController [classCommDelete] Start!");
		String result = comm.classCommDelete(request);
		
		return result;
	}
	
	@RequestMapping("classCommUpdate")
	@ResponseBody
	public String classCommUpdate(B_Comment comment) {
		System.out.println("CommentController [classCommUpdate] Start!");
		String result = comm.classCommUpdate(comment);
		
		return result;
	}
	

}


