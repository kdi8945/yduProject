package com.oracle.yduProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oracle.yduProject.model.Board;

public interface BoardService {

   List<Board> boardList(Board board);

   String notiWrite(Board board);

   int notiUpdate(Board board);

   String notiDelete(Board board);

   List<Board> classBoardList(Board board);

   Board boardContent(Board board);

   int total(int b_type);

   String classNotiWrite(Board board);

   Board classNotiContent(Board board);

   String classNotiDelete(Board board);

   Board notiBoardInfo(Board board);

   int classNotiUpdate(Board board);

   List<Board> bambooList(Board board);

   Board bambooWrite(Board board);

   Board bambooDelete(Board board);

   Board bambooUpdate(Board board);

   Board bambooUpdateCancel(Board board);

   List<Board> viewMyBamboo(Board board);

   Board viewMyBambooDelete(Board board);


}